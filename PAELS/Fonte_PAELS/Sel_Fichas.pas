unit Sel_Fichas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient,Rotinas,
  StdCtrls, Mask, Grids, DBGrids, JvCaptionPanel, DB, IBCustomDataSet,
  IBQuery, jpeg, ComCtrls, TeEngine, Series, TeeProcs, Chart, DbChart,
  DBCtrls, JvLookOut, DateUtils;

type
  TForm_Sel_Fichas = class(TForm)
    Panel_Relacao_Fichas: TPanel;
    Panel_Botoes_CabecalhoProva: TPanel;
    Panel2: TPanel;
    MaskEdit_Exercicio: TMaskEdit;
    MaskEdit_NomeAluno: TMaskEdit;
    DBGrid_SelFicha: TDBGrid;
    DBText1: TDBText;
    Chart_ProvassAlunos: TChart;
    BarSeries_Provas: TBarSeries;
    ComboBox_Setor: TComboBox;
    Panel_Frame_SelCurso: TPanel;
    JvGradient2: TJvGradient;
    Panel_Botoes_Carga: TPanel;
    Image_LogoIcea: TImage;
    Label_Versao: TLabel;
    Label_UltimaAtualizacao: TLabel;
    StatusBar2: TStatusBar;
    JvExpress_EscolhaOpcoes: TJvExpress;
    JvExpressButton_Alterar: TJvExpressButton;
    JvExpressButton_Inserir: TJvExpressButton;
    JvExpressButton_Excluir: TJvExpressButton;
    Panel1: TPanel;
    JvGradient3: TJvGradient;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label_Legenda: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    JvExpressButton1: TJvExpressButton;
    JvGradient4: TJvGradient;
    Panel_Horas: TPanel;
    JvExpressButton_Turma: TJvExpressButton;

    procedure Trata_Grafico;
    procedure SelecaoDaFicha(Sender: TObject);

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_SelFichaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_SelFichaDblClick(Sender: TObject);
    procedure DBGrid_SelFichaCellClick(Column: TColumn);
    procedure JvExpressButton_InserirClick(Sender: TObject);
    procedure JvExpressButton_AlterarClick(Sender: TObject);
    procedure JvExpressButton_ExcluirClick(Sender: TObject);
    procedure JvExpressButton_WindowsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit_ExercicioKeyPress(Sender: TObject; var Key: Char);
    procedure JvExpressButton_TurmaClick(Sender: TObject);
  private
    { Private declarations }
  public                { Public declarations }
     VS_AlunoSel, VS_Opcao: String;
  end;

var
  Form_Sel_Fichas: TForm_Sel_Fichas;

implementation

uses Frame_Sel_Curso, Module, Sel_Avaliacao, FichaAvaliacao, Login,
  Sel_Rel_Fichas;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da funcao principal
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.FormActivate(Sender: TObject);
begin
   Label_Versao.Caption:= 'Versão: '+Versao;
   Label_UltimaAtualizacao.Caption:= 'Última Atualização: '+Ultima_Atualizacao;
   Frame_SelCurso := TFrame_SelCurso.Create(nil);
   Frame_SelCurso.Parent := Form_Sel_Fichas.Panel_Frame_SelCurso;
   Frame_SelCurso.TrataCurso('', '');

   DM.IBQuery_Login_Instrutor.Locate('IdTurma', VarArrayOf([Form_Login.VS_IdTurma]), [loPartialKey]);

   if ((UpperCase(DM.IBQuery_Login_Instrutor.FieldByName('Funcao').AsString) = 'COORDENADOR') or
       (UpperCase(DM.IBQuery_Login_Instrutor.FieldByName('Funcao').AsString) = 'COORDENADOR INSTRUTOR')) then
      JvExpressButton_Excluir.Visible:= True
   else
      JvExpressButton_Excluir.Visible:= False;

   Funcoes.SetLocalAvl;
   ComboBox_Setor.Items.Add('');
   Funcoes.TrataPesquisaSetor(Frame_SelCurso.ComboBox_Turma.Text, ComboBox_Setor);

   DM.IBQuery_MontaTurma.Open;
   DM.IBQuery_AlunoTurma.Open;

   DM.IBTable_Cad_FichaAvl.Open;
   DM.IBQuery_Resultado_FichaAluno.Open;
   SelecaoDaFicha(Sender);
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.JvExpressButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a Ficha de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.SelecaoDaFicha(Sender: TObject);
var
   VS_ComandoGrafico, VS_Comando: String;
begin
   VS_ComandoGrafico:= ' Select f.IdCurso, f.IdTurma, f.Id_Ficha, f.Id_ATCO, f.ID_Exercicio, f.Media, f.Setor, f.Horario_Inicio '+
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
      VS_Comando:= VS_Comando+'  and f.NomeAluno Like '+#39+'%'+trim(MaskEdit_NomeAluno.Text)+'%'+#39;
      VS_ComandoGrafico:=  VS_ComandoGrafico+'  and f.NomeAluno Like '+#39+'%'+trim(MaskEdit_NomeAluno.Text)+'%'+#39;
   end;

   if Trim(ComboBox_Setor.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+'  and f.setor = '+#39+ComboBox_Setor.Text+#39;
      VS_ComandoGrafico:= VS_ComandoGrafico+'  and f.setor = '+#39+ComboBox_Setor.Text+#39;
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

procedure TForm_Sel_Fichas.DBGrid_SelFichaDrawColumnCell(
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

   if (Column.Field.FieldName = 'NS') then  // saldo_atual deve ser trocado para o nome do campo que vc deseja alterar no seu dbgrid.
   begin
     if DM.IBQuery_CadFichaAvl.FieldByName('NS').AsString = 'S' then
     begin
        DBGrid_SelFicha.Canvas.Brush.Color:= clAqua;  //"pinta" a celula inteira
        DBGrid_SelFicha.Canvas.Font.Color:= clRed;      //"Pinta" a letra
        DBGrid_SelFicha.Canvas.FillRect(Rect);
        DBGrid_SelFicha.DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
   end;

  if gdSelected in State then
    DBGrid_SelFicha.Canvas.Brush.Color := $00F8E3D1;

  DBGrid_SelFicha.Canvas.FillRect(Rect);
  DBGrid_SelFicha.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
   Trata_Grafico;
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao para cadastrar uma nova Ficha
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.JvExpressButton_InserirClick(Sender: TObject);
begin
   DM.IBQuery_AlunoTurma.Open;
   DM.IBQuery_InstrutorTurma.Open;
   DM.IBTable_Aluno.Open;

   if Trim(DM.IBQuery_AlunoTurma.FieldByName('IdCurso').AsString) = '' then
      ShowMessage('A Turma Selecionada não possuí Aluno Cadastrado...'+#13+'Favor entrar em contato com o Responsável para Cadastrar os Alunos.')
   else
      if Trim(DM.IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString) = '' then
         ShowMessage('A Turma Selecionada não possuí Coordenador nem Instrutor Cadastrado...'+#13+'Favor entrar em contato com o Responsável para Cadastrar os Coordenador / Instrutores.')
      else
      begin
         VS_Opcao:= 'Inserir';
         Form_Sel_Avaliacao.ShowModal;
         SelecaoDaFicha(Sender);
      end;
end;

//------------------------------------------------------------------------------
// Tratamento para alterar a Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.JvExpressButton_AlterarClick(Sender: TObject);
begin
   if DM.IBQuery_CadFichaAvl.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não possui Ficha de exercicio para Corrigir...')
   else
   begin
      VS_Opcao:= 'Alterar';
      Application.CreateForm(TForm_FichaAvaliacao, Form_FichaAvaliacao);
      Form_FichaAvaliacao.ShowModal;
      Trata_Grafico;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Exclui a Ficha de Avaliacao Selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.JvExpressButton_ExcluirClick(Sender: TObject);
var
   VI_Retorno: Integer;
begin
   if DM.IBQuery_CadFichaAvl.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não possui Ficha de exercicio para Excluir...')
   else
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Arquivo selecionada '+#13+#13+'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         Funcoes.ExecSqlProsima( 'Delete From PR_Avaliacao Where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                                         ' ID_FICHA = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                                         ' IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                                         ' ID_ATCO = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                                         ' Id_Instrutor = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('Id_Instrutor').AsString+#39+' and '+
                                                         ' ID_Exercicio = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString
                               );

         Funcoes.ExecSqlProsima( 'Delete From Rel_NS Where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                                         ' ID_FICHA = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                                         ' IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                                         ' ID_ATCO = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                                         ' Id_Instrutor = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('Id_Instrutor').AsString+#39+' and '+
                                                         ' ID_Exercicio = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString
                               );

         DM.IBTable_Cad_FichaAvl.Delete;
         Funcoes.ExecutaTransacao_Prosima;
         Funcoes.AtualizaQuery(DM.IBQuery_CadFichaAvl);
         Trata_Grafico;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Duplo Click na lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.DBGrid_SelFichaDblClick(Sender: TObject);
begin
   JvExpressButton_AlterarClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona a ficha de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.DBGrid_SelFichaCellClick(Column: TColumn);
begin
   Trata_Grafico;
end;

//------------------------------------------------------------------------------
// Tratamento do Grafico
//------------------------------------------------------------------------------

procedure TForm_Sel_Fichas.Trata_Grafico;
var
   n_horas : TTime;
   VS_Setor, VS_Valor: String;
begin
   if VS_AlunoSel <> DM.IBQuery_CadFichaAvl.FieldByName('NomeAluno').AsString then
   begin
      VS_AlunoSel:= DM.IBQuery_CadFichaAvl.FieldByName('NomeAluno').AsString;

      DM.IBQuery_Resultado_FichaAluno.Open;
      BarSeries_Provas.Clear;
      DM.IBQuery_Resultado_FichaAluno.First;

      n_horas:= 0;

      While not DM.IBQuery_Resultado_FichaAluno.Eof do
      begin
          if DM.IBQuery_Resultado_FichaAluno.FieldByName('Media').AsString <> '' then
          begin
             n_horas:= n_horas+StrToTime(DM.IBQuery_Resultado_FichaAluno.FieldByName('horario_inicio').AsString+':00' );

             VS_Setor:= Copy(DM.IBQuery_Resultado_FichaAluno.FieldByName('Setor').AsString,1,1);
             VS_Valor:= Trim(Funcoes.DePara(DM.IBQuery_Resultado_FichaAluno.FieldByName('Media').AsString,'.',','));
             if VS_Setor = 'C' then
                BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), DM.IBQuery_Resultado_FichaAluno.FieldByName('Id_Exercicio').AsString+'-'+VS_Setor, clRed)
             else
                if VS_Setor = 'A' then
                   BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), DM.IBQuery_Resultado_FichaAluno.FieldByName('Id_Exercicio').AsString+'-'+VS_Setor, clGreen)
                else
                  if VS_Setor = 'S' then
                      BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), DM.IBQuery_Resultado_FichaAluno.FieldByName('Id_Exercicio').AsString+'-'+VS_Setor, clYellow)
                  else
                     if VS_Setor = 'I' then
                         BarSeries_Provas.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), DM.IBQuery_Resultado_FichaAluno.FieldByName('Id_Exercicio').AsString+'-'+VS_Setor, clBlue);

         end;
         DM.IBQuery_Resultado_FichaAluno.Next;
      end;
//      n_horas:= n_horas-StrToTime(DM.IBQuery_Resultado_FichaAluno.FieldByName('horario_inicio').AsString+':00' );
      Panel_Horas.Caption:= copy(TimeToStr(n_horas),1,5);
   end;
end;

procedure TForm_Sel_Fichas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.Windows;
end;

procedure TForm_Sel_Fichas.MaskEdit_ExercicioKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['0','1','2','3','4','5','6','7','8','9','-', #8]) then
     key:= #0;
end;

procedure TForm_Sel_Fichas.JvExpressButton_TurmaClick(Sender: TObject);
begin
   VS_Opcao:= 'MenuRel';
   Form_Sel_Rel_Fichas.ShowModal;

end;

end.
