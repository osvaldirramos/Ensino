unit Sel_Rel_Fichas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient,Rotinas,
  StdCtrls, Mask, Grids, DBGrids, JvCaptionPanel, DB, IBCustomDataSet,
  IBQuery, jpeg, ComCtrls, TeEngine, Series, TeeProcs, Chart, DbChart,
  DBCtrls, JvLookOut, ExportPack, JvGradientCaption, ShellApi, JvClock;

type
  TForm_Sel_Rel_Fichas = class(TForm)
    Panel_Relacao_Fichas: TPanel;
    ExportQR1: TExportQR;
    Panel_Opcoes: TPanel;
    JvGradientCaption_MenuPrincipal: TJvGradientCaption;
    StatusBar: TStatusBar;
    JvExpress_EscolhaOpcoes: TJvExpress;
    JvExpressButton_PDFDaFichaSelecionad: TJvExpressButton;
    JvExpressButton_ImprimirTodasAsFichas: TJvExpressButton;
    JvExpressButton_ImprimirFichaSelecionada: TJvExpressButton;
    JvExpressButton_Windows: TJvExpressButton;
    JvExpressButton_GeraPDFDeTodasAsFichas: TJvExpressButton;
    Panel1: TPanel;
    Panel2: TPanel;
    MaskEdit_NomeAluno: TMaskEdit;
    ComboBox_Setor: TComboBox;
    DBGrid_SelFicha: TDBGrid;
    Image_LogoIcea: TImage;
    JvExpressButton_GravaGrafico: TJvExpressButton;
    Panel_Grafico: TPanel;
    DBText1: TDBText;
    Chart_ProvassAlunos: TChart;
    BarSeries_Provas: TBarSeries;
    Panel3: TPanel;
    DBText2: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    JvClock1: TJvClock;
    JvExpressButton_GraficoParaTodos: TJvExpressButton;
    MaskEdit_Exercicio: TMaskEdit;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvGradient2: TJvGradient;
    Panel_Horas: TPanel;

    procedure Trata_Grafico;
    procedure SelecaoDaFicha(Sender: TObject);

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_SelFichaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_SelFichaCellClick(Column: TColumn);
    procedure JvExpressButton_WindowsClick(Sender: TObject);
    procedure JvExpressButton_ImprimirFichaSelecionadaClick(Sender: TObject);
    procedure JvExpressButton_ImprimirTodasAsFichasClick(Sender: TObject);
    procedure JvExpressButton_PDFDaFichaSelecionadClick(Sender: TObject);
    procedure JvExpressButton_GeraPDFDeTodasAsFichasClick(Sender: TObject);
    procedure JvExpressButton_GravaGraficoClick(Sender: TObject);
    procedure JvExpressButton_GraficoParaTodosClick(Sender: TObject);
  private
    { Private declarations }
  public                { Public declarations }
      VS_AlunoSel, VS_Opcao: String;
  end;

var
  Form_Sel_Rel_Fichas: TForm_Sel_Rel_Fichas;

implementation

uses Frame_Sel_Curso, Module, Sel_Avaliacao, FichaAvaliacao, Sel_Fichas,
  Relatorio_FichaAvl, Menu_Principal;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da funcao principal
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.FormActivate(Sender: TObject);
begin
   if Form_MenuPrincipal.VS_Opcao  = 'MenuRel' then
   begin
      Form_MenuPrincipal.VS_Opcao:= 'SelRel';

      Funcoes.SetLocalAvl;
      ComboBox_Setor.Items.Add('');

      DM.IBQuery_AlunoTurma.Open;
      DM.IBQuery_InstrutorTurma.Open;

      DM.IBQuery_PR_Avaliacao.Open;
      DM.IBQuery_Ficha_Item_View.Open;

      DM.IBTable_PR_Avaliacao.Open;
      DM.IBTable_Cad_FichaAvl.Open;
      DM.IBQuery_Resultado_FichaAluno.Open;
      SelecaoDaFicha(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a Ficha de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.SelecaoDaFicha(Sender: TObject);
var
   VS_ComandoGrafico, VS_Comando: String;
begin
   VS_ComandoGrafico:= ' Select f.IdCurso, f.IdTurma, f.Id_Ficha, f.Id_ATCO, f.ID_Exercicio, f.Media, f.Setor, f.Horario_inicio '+
                       ' From CAD_FICHA_AVL f '+
                       ' Where f.IdCurso = :IdCurso '+
                       ' and f.IdTurma = :IdTurma '+
                       ' and f.Id_Ficha = :Id_Ficha '+
                       ' and f.Id_ATCO = :Id_ATCO ';

   VS_Comando:= ' Select f.IdCurso, f.IdTurma, f.Id_Ficha, f.Id_ATCO, f.ID_Exercicio,f.Exercicio,  f.Id_Instrutor, f.NomeInstrutor, f.Data_Avl,  f.FichaCompleta, f.Local, f.Media, f.NomeAluno, f.NS, f.Parecer, f.Setor, f.Horario_Inicio ' +
                ' From CAD_FICHA_AVL f '+
                ' Where f.IdCurso = :IdCurso '+
                ' and f.IdTurma = :IdTurma ';

   if Trim(MaskEdit_Exercicio.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' and f.Exercicio Like '+#39+'%'+trim(MaskEdit_Exercicio.Text)+#39;
      VS_ComandoGrafico:= VS_ComandoGrafico+' and f.Exercicio Like '+#39+'%'+trim(MaskEdit_Exercicio.Text)+#39;
   end;

   if Trim(MaskEdit_NomeAluno.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' and f.NomeAluno Like '+#39+'%'+trim(MaskEdit_NomeAluno.Text)+'%'+#39;
      VS_ComandoGrafico:=  VS_ComandoGrafico+'  and f.NomeAluno Like '+#39+'%'+trim(MaskEdit_NomeAluno.Text)+'%'+#39;
   end;

   if Trim(ComboBox_Setor.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' and f.setor = '+#39+ComboBox_Setor.Text+#39;
      VS_ComandoGrafico:= VS_ComandoGrafico+' and f.setor = '+#39+ComboBox_Setor.Text+#39;
   end;

   DM.IBQuery_CadFichaAvl.Close;
   DM.IBQuery_CadFichaAvl.SQL.Clear;
   DM.IBQuery_CadFichaAvl.Sql.Add(VS_Comando+' Order By f.NomeAluno, f.Exercicio, f.setor ');
   DM.IBQuery_CadFichaAvl.Open;

   DM.IBQuery_Resultado_FichaAluno.Close;
   DM.IBQuery_Resultado_FichaAluno.SQL.Clear;
   DM.IBQuery_Resultado_FichaAluno.Sql.Add(VS_ComandoGrafico+' Order By f.NomeAluno, f.Exercicio, f.setor ');
   DM.IBQuery_Resultado_FichaAluno.Open;

   VS_AlunoSel:= '';
   Trata_Grafico;
end;

//------------------------------------------------------------------------------
//--- Tratamento para diferenciar as fichas
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.DBGrid_SelFichaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If Odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      DBGrid_SelFicha.Canvas.Brush.Color:= clWhite
   else
      DBGrid_SelFicha.Canvas.Brush.Color:= $00EFEFEF;

   // Testa se o registro da linha atual está selecionado
   If gdSelected in State Then
   Begin
      // Cor de fundo do registro selecionado
      DBGrid_SelFicha.Canvas.Brush.Color:= clNavy;
      // Cor do texto para o registro selecionado
      DBGrid_SelFicha.Canvas.Font.Color:= clBlack;
   End
   Else   // Cor do texto para registros não selecionados
      DBGrid_SelFicha.Canvas.Font.Color:= clBlack;

   // Tratamento do zebrado

   if DM.IBQuery_CadFichaAvl.FieldByName('FICHACOMPLETA').AsString = 'N' then
     DBGrid_SelFicha.Canvas.Font.Color:= clRed
   else
      DBGrid_SelFicha.Font.Color:= clBlack;

   if (Column.Field.FieldName = 'NS') then               // saldo_atual deve ser trocado para o nome do campo que vc deseja alterar no seu dbgrid.
   begin
     if DM.IBQuery_CadFichaAvl.FieldByName('NS').AsString = 'S' then
     begin
        DBGrid_SelFicha.Canvas.Brush.Color:= clAqua;     //"pinta" a celula inteira
        DBGrid_SelFicha.Canvas.Font.Color:= clRed;      //"Pinta" a letra
        DBGrid_SelFicha.Canvas.FillRect(Rect);
        DBGrid_SelFicha.DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
   end;

  if gdSelected in State then
    DBGrid_SelFicha.Canvas.Brush.Color := $00F8E3D1;

  DBGrid_SelFicha.Canvas.FillRect(Rect);
  DBGrid_SelFicha.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona a ficha de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.DBGrid_SelFichaCellClick(Column: TColumn);
begin
   Trata_Grafico;
end;

//------------------------------------------------------------------------------
// Tratamento do Grafico
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.Trata_Grafico;
var
   n_horas : TTime;
   VS_Numero, VS_Valor: String;
   VI_Tam: Integer;
begin
   if VS_AlunoSel <> DM.IBQuery_CadFichaAvl.FieldByName('NomeAluno').AsString then
   begin
      VS_AlunoSel:= DM.IBQuery_CadFichaAvl.FieldByName('NomeAluno').AsString;

      BarSeries_Provas.Clear;
      DM.IBQuery_Resultado_FichaAluno.First;
      n_horas:= StrToTime(DM.IBQuery_Resultado_FichaAluno.FieldByName('horario_inicio').AsString+':00' );
      While not DM.IBQuery_Resultado_FichaAluno.Eof do
      begin
          if DM.IBQuery_Resultado_FichaAluno.FieldByName('Media').AsString <> '' then
          begin
             n_horas:= n_horas+StrToTime(DM.IBQuery_Resultado_FichaAluno.FieldByName('horario_inicio').AsString+':00' );

             VI_Tam:= length(DM.IBQuery_CadFichaAvl.FieldByName('Setor').AsString);
             VS_Numero:= copy(DM.IBQuery_CadFichaAvl.FieldByName('Setor').AsString, VI_Tam,1);

             if ((VS_Numero <> '1') and (VS_Numero <> '2') and (VS_Numero <> '3') and (VS_Numero <> '4') and (VS_Numero <> '5') and (VS_Numero <> '6') and (VS_Numero <> '7') and (VS_Numero <> '8') and (VS_Numero <> '9')) then
                VS_Numero:= 'A';

             VS_Valor:= Trim(Funcoes.DePara(DM.IBQuery_Resultado_FichaAluno.FieldByName('Media').AsString,'.',','));
             if StrToFloat(VS_Valor) < 2 then
                BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), DM.IBQuery_Resultado_FichaAluno.FieldByName('Id_Exercicio').AsString+Copy(DM.IBQuery_Resultado_FichaAluno.FieldByName('Setor').AsString,1,1)+VS_Numero, clBlue)
             else
                BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), DM.IBQuery_Resultado_FichaAluno.FieldByName('Id_Exercicio').AsString+Copy(DM.IBQuery_Resultado_FichaAluno.FieldByName('Setor').AsString,1,1)+VS_Numero, clRed);
         end;
         DM.IBQuery_Resultado_FichaAluno.Next;
      end;
      n_horas:= n_horas-StrToTime(DM.IBQuery_Resultado_FichaAluno.FieldByName('horario_inicio').AsString+':00' );
      Panel_Horas.Caption:= copy(TimeToStr(n_horas),1,5);
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao para retornar para o Menu Principal
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.JvExpressButton_WindowsClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a Ficha selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.JvExpressButton_ImprimirFichaSelecionadaClick(Sender: TObject);
begin
   Form_Relatorio_FichaAvl.QuickRep1.Preview;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a todas a fichas Ficha selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.JvExpressButton_ImprimirTodasAsFichasClick(Sender: TObject);
var
   bmLocal : TBookmark;
begin
   bmLocal:= DM.IBQuery_CadFichaAvl.GetBookMark;

   While not DM.IBQuery_CadFichaAvl.Eof do
   begin
      Form_Relatorio_FichaAvl.QuickRep1.Preview;
      DM.IBQuery_CadFichaAvl.Next;
   end;
   DM.IBQuery_CadFichaAvl.GotoBookMark(bmLocal);
   DM.IBQuery_CadFichaAvl.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento para gerar PDF para ficha selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.JvExpressButton_PDFDaFichaSelecionadClick( Sender: TObject);
var
   VS_NomeDoArquivo, VS_NomePasta: String;
begin
   DM.IBTable_pessoaAluno.Open;
   DM.IBTable_pessoaInstrutor.Open;

   //--- Verificando a existencia do diretorio para Solicitacao em PDF

   if not DirectoryExists('C:\PAELS\ArquivosPDF') then
       ForceDirectories('C:\PAELS\ArquivosPDF');

   VS_NomePasta:= 'C:\PAELS\ArquivosPDF\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
   if not DirectoryExists(VS_NomePasta) then
       ForceDirectories(VS_NomePasta);

   VS_NomeDoArquivo:= VS_NomePasta+'\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString)+'_EX_'+DM.IBQuery_CadFichaAvl.FieldByName('Id_Exercicio').AsString+'_SETOR_'+DM.IBQuery_CadFichaAvl.FieldByName('Setor').AsString+'_AL_'+DM.IBTable_pessoaAluno.FieldByName('NomeGuerra').AsString+'_IN_'+DM.IBTable_pessoaInstrutor.FieldByName('NomeGuerra').AsString;

   Form_Relatorio_FichaAvl.QuickRep1.Prepare;
   ExportQR1.Report := Form_Relatorio_FichaAvl.QuickRep1;
   ExportQR1.ExportQRPDF(VS_NomeDoArquivo, False);
   ShellExecute(Handle, nil, PChar(VS_NomeDoArquivo+'.pdf') , nil, nil, SW_SHOWNORMAL);
end;

//------------------------------------------------------------------------------
// Tratamento para gerar PDF para ficha selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.JvExpressButton_GeraPDFDeTodasAsFichasClick(Sender: TObject);
var
   VS_NomeDoArquivo, VS_NomePasta: String;
   bmLocal : TBookmark;
begin
   DM.IBTable_pessoaAluno.Open;
   DM.IBTable_pessoaInstrutor.Open;
   bmLocal:= DM.IBQuery_CadFichaAvl.GetBookMark;

   //--- Verificando a existencia do diretorio para Solicitacao em PDF

   if not DirectoryExists('C:\PAELS\ArquivosPDF') then
       ForceDirectories('C:\PAELS\ArquivosPDF');

//   DM.IBQuery_CadFichaAvl.First;
   While not DM.IBQuery_CadFichaAvl.Eof do
   begin
      VS_NomePasta:= 'C:\PAELS\ArquivosPDF\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
      if not DirectoryExists(VS_NomePasta) then
          ForceDirectories(VS_NomePasta);

      VS_NomeDoArquivo:= VS_NomePasta+'\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString)+'_EX_'+DM.IBQuery_CadFichaAvl.FieldByName('Id_Exercicio').AsString+'_SETOR_'+DM.IBQuery_CadFichaAvl.FieldByName('Setor').AsString+'_AL_'+DM.IBTable_pessoaAluno.FieldByName('NomeGuerra').AsString+'_IN_'+DM.IBTable_pessoaInstrutor.FieldByName('NomeGuerra').AsString;

      Form_Relatorio_FichaAvl.QuickRep1.Prepare;
      ExportQR1.Report := Form_Relatorio_FichaAvl.QuickRep1;
      ExportQR1.ExportQRPDF(VS_NomeDoArquivo, False);
      DM.IBQuery_CadFichaAvl.Next;
   end;
   DM.IBQuery_CadFichaAvl.GotoBookMark(bmLocal);
   DM.IBQuery_CadFichaAvl.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento para gravar o grafico em formato jpg
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.JvExpressButton_GravaGraficoClick(Sender: TObject);
var
  Result: TBitmap;
   VS_NomeDoArquivo, VS_NomePasta: String;
begin

   if not DirectoryExists('C:\PAELS\ArquivosPDF') then
       ForceDirectories('C:\PAELS\ArquivosPDF');

  Result := TBitmap.Create;
  try
     Panel_Grafico.Height:= 238;
     VS_NomePasta:= 'C:\PAELS\ArquivosPDF\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
     if not DirectoryExists(VS_NomePasta) then
         ForceDirectories(VS_NomePasta);

      VS_NomeDoArquivo:= VS_NomePasta+'\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString)+'_Exe_'+DM.IBQuery_CadFichaAvl.FieldByName('Id_Exercicio').AsString+'_Setor_'+DM.IBQuery_CadFichaAvl.FieldByName('Setor').AsString+'_Alu_'+DM.IBTable_pessoaAluno.FieldByName('NomeGuerra').AsString+'_Inst_'+DM.IBTable_pessoaInstrutor.FieldByName('NomeGuerra').AsString;

     Result.Width := Self.Panel_Grafico.ClientWidth;
     Result.Height := Self.Panel_Grafico.ClientHeight;
     Result.Canvas.Brush := Self.Panel_Grafico.Brush;
     Result.Canvas.FillRect(Self.Panel_Grafico.ClientRect);
     Result.Canvas.Lock;
     Self.Panel_Grafico.PaintTo(Result.Canvas.Handle, 0, 0);
     Result.Canvas.Unlock;

     Result.SaveToFile(VS_NomeDoArquivo);
     Panel_Grafico.Height:= 174;
  finally
    Result.Free;
  end;
end;


//------------------------------------------------------------------------------
// Tratamento para gravar o grafico em formato jpg para todos alunos
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_Fichas.JvExpressButton_GraficoParaTodosClick(Sender: TObject);
var
   Result: TBitmap;
   VS_Aluno, VS_NomeDoArquivo, VS_NomePasta: String;
   bmLocal : TBookmark;
begin
   bmLocal:= DM.IBQuery_CadFichaAvl.GetBookMark;

   //--- Verificando a existencia do diretorio para Solicitacao em PDF

   if not DirectoryExists('C:\PAELS\ArquivosPDF') then
       ForceDirectories('C:\PAELS\ArquivosPDF');

   VS_Aluno:= '';

   While not DM.IBQuery_CadFichaAvl.Eof do
   begin
      if VS_Aluno <> DM.IBQuery_CadFichaAvl.FieldByName('NomeAluno').AsString then
      begin
         VS_Aluno:= DM.IBQuery_CadFichaAvl.FieldByName('NomeAluno').AsString;

         Result := TBitmap.Create;
         try
            Panel_Grafico.Height:= 238;
            VS_NomePasta:= 'C:\PAELS\ArquivosPDF\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
            if not DirectoryExists(VS_NomePasta) then
               ForceDirectories(VS_NomePasta);

            VS_NomeDoArquivo:= VS_NomePasta+'\'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString)+'_Ex'+DM.IBQuery_CadFichaAvl.FieldByName('NomeAluno').AsString+'.bmp';

            Result.Width := Self.Panel_Grafico.ClientWidth;
            Result.Height := Self.Panel_Grafico.ClientHeight;
            Result.Canvas.Brush := Self.Panel_Grafico.Brush;
            Result.Canvas.FillRect(Self.Panel_Grafico.ClientRect);
            Result.Canvas.Lock;
            Self.Panel_Grafico.PaintTo(Result.Canvas.Handle, 0, 0);
            Result.Canvas.Unlock;

            Result.SaveToFile(VS_NomeDoArquivo);
            Panel_Grafico.Height:= 156;
         finally
            Result.Free;
         end;
      end;
      DM.IBQuery_CadFichaAvl.Next;
   end;

end;

end.
