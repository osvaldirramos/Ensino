unit ProcessarClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rotinas, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, TeEngine,
  Series, StdCtrls, TeeProcs, Chart, ExtCtrls, JvComponent, JvCaptionPanel,
  ComCtrls, ToolWin, ComObj, Menus, DBCtrls, Mask, JvShape, Buttons,
  IBTable, JvRichEd, JvDBRichEd, PsyRichEdit;

type
  TForm_ProcessarClassificacao = class(TForm)
    IBQuery_Cad_Avaliados: TIBQuery;
    DSQ_Cad_Avaliados: TDataSource;
    PopupMenu1: TPopupMenu;
    Copiar1: TMenuItem;
    IBQuery_Cad_AvaliadosIDCURSO: TSmallintField;
    IBQuery_Cad_AvaliadosIDTURMA: TIntegerField;
    IBQuery_Cad_AvaliadosID_FICHA: TIntegerField;
    IBQuery_Cad_AvaliadosID_ATCO: TIBStringField;
    IBQuery_Cad_AvaliadosID_AVL: TIBStringField;
    IBQuery_Cad_AvaliadosID_EXERCICIO: TIntegerField;
    IBQuery_Cad_AvaliadosID_INSTRUTOR: TIBStringField;
    IBQuery_Cad_AvaliadosNOMECOMPLETO: TIBStringField;
    IBQuery_Cad_AvaliadosDATA_AVL: TDateTimeField;
    IBQuery_Cad_AvaliadosLOCAL: TIBStringField;
    IBQuery_Cad_AvaliadosMEDIA: TIBBCDField;
    IBQuery_Cad_AvaliadosPARECER: TBlobField;
    IBQuery_Cad_AvaliadosNS: TIBStringField;
    IBQuery_Cad_AvaliadosFICHACOMPLETA: TIBStringField;
    IBQuery_FichaAvaliacao: TIBQuery;
    IBQuery_FichaAvaliacaoAREA_AVALIACAO: TIBStringField;
    IBQuery_FichaAvaliacaoBOM: TIBStringField;
    IBQuery_FichaAvaliacaoDESCRICAO: TIBStringField;
    IBQuery_FichaAvaliacaoID_ATCO: TIBStringField;
    IBQuery_FichaAvaliacaoID_AVL: TIBStringField;
    IBQuery_FichaAvaliacaoID_EXERCICIO: TIntegerField;
    IBQuery_FichaAvaliacaoID_FICHA: TIntegerField;
    IBQuery_FichaAvaliacaoID_ITEM: TIBStringField;
    IBQuery_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FichaAvaliacaoNA: TIBStringField;
    IBQuery_FichaAvaliacaoNS: TIBStringField;
    IBQuery_FichaAvaliacaoOTIMO: TIBStringField;
    IBQuery_FichaAvaliacaoREGULAR: TIBStringField;
    DSQ_Avaliacao: TDataSource;
    IBTable_FichaAvaliacao: TIBTable;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoID_FICHA: TIntegerField;
    IBTable_FichaAvaliacaoID_ATCO: TIBStringField;
    IBTable_FichaAvaliacaoID_AVL: TIBStringField;
    IBTable_FichaAvaliacaoID_EXERCICIO: TIntegerField;
    IBTable_FichaAvaliacaoID_ITEM: TIBStringField;
    IBTable_FichaAvaliacaoOTIMO: TIBStringField;
    IBTable_FichaAvaliacaoBOM: TIBStringField;
    IBTable_FichaAvaliacaoREGULAR: TIBStringField;
    IBTable_FichaAvaliacaoNS: TIBStringField;
    IBTable_FichaAvaliacaoNA: TIBStringField;
    IBTable_FichaAvaliacaoAREA_AVALIACAO: TIBStringField;
    IBTable_FichaAvaliacaoDESCRICAO: TIBStringField;
    DataSource1: TDataSource;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Imprimir: TToolButton;
    ToolButton_Salvar: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Text1: TPsyRichEdit;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    IBQuery_RelacaoAlunosMedia: TIBQuery;
    IBQuery_RelacaoAlunosMediaIDCURSO: TSmallintField;
    IBQuery_RelacaoAlunosMediaIDTURMA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_FICHA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_ATCO: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_AVL: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_EXERCICIO: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_INSTRUTOR: TIBStringField;
    IBQuery_RelacaoAlunosMediaNOMECOMPLETO: TIBStringField;
    IBQuery_RelacaoAlunosMediaDATA_AVL: TDateTimeField;
    IBQuery_RelacaoAlunosMediaLOCAL: TIBStringField;
    IBQuery_RelacaoAlunosMediaMEDIA: TIBBCDField;
    IBQuery_RelacaoAlunosMediaPARECER: TBlobField;
    IBQuery_RelacaoAlunosMediaNS: TIBStringField;
    IBQuery_RelacaoAlunosMediaFICHACOMPLETA: TIBStringField;
    DSQ_RelacaoAlunosMedia: TDataSource;
    IBTable_AlunoTurma: TIBTable;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBTable_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBTable_Instrutor: TIBTable;
    IBTable_InstrutorIDENTIDADE: TIBStringField;
    IBTable_InstrutorNOME: TIBStringField;
    IBTable_InstrutorNOMEGUERRA: TIBStringField;
    IBTable_InstrutorPOSTOGRADUACAO: TIBStringField;
    IBTable_Estagiario: TIBTable;
    IBTable_EstagiarioID_ATCO: TIBStringField;
    IBTable_EstagiarioESTAGIARIO: TIBStringField;
    IBQuery_RelacaoAlunos: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IntegerField3: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField5: TIBStringField;
    IBBCDField1: TIBBCDField;
    BlobField1: TBlobField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    DSQ_RelacaoAlunos: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;

    procedure Finalizar_MediaFinal;
    procedure SetFileName(const FileName: String);
    procedure FileSaveAs(Sender: TObject);

    procedure MontarRelatorio;
    procedure Processar;
    procedure Mostrar_Medias;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_SalvarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private    { Private declarations }
     FFileName: string;
     VI_TotalReg, VI_OTIMO, VI_BOM, VI_REGULAR, VI_NS, VI_NA: Integer;

   VS_Aluno, VS_exercicio, VS_Media, VS_Calc_Media, VS_Id_Atco, VS_Comando: String;
   VR_Media, VR_Cont: Real;
  public
    { Public declarations }
  end;

var
  Form_ProcessarClassificacao: TForm_ProcessarClassificacao;

implementation

uses Module, MenuPrincipal;

resourcestring
  sSaveChanges = 'Salvar arquivo %s?';
  sOverWrite = 'Substituir arquivo %s';
  sUntitled = 'Sem nome';
  sModified = 'Modificado';
  sColRowInfo = 'Linha: %3d   Coluna: %3d';

{$R *.dfm}

procedure TForm_ProcessarClassificacao.FormActivate(Sender: TObject);
begin
   //--- Tratamento da Selecao dos Cursos

   IBQuery_Cad_Avaliados.Open;
   IBQuery_FichaAvaliacao.Open;
   IBTable_FichaAvaliacao.Open;

   IBQuery_Cad_Avaliados.First;
   While not IBQuery_Cad_Avaliados.Eof do
   begin
      if IBQuery_Cad_Avaliados.FieldByName('Media').AsString = '' then
      begin
         Processar;
      end;
      IBQuery_Cad_Avaliados.Next;
   end;
   MontarRelatorio;
end;

//------------------------------------------------------------------------------
//
// Tratamento para Calcular a Media quando esta não foi Calculada
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacao.Processar;
var
   bm_Avl : TBookmark;
begin
   VI_OTIMO:= 0;
   VI_BOM:= 0;
   VI_REGULAR:= 0;
   VI_NS:= 0;
   VI_NA:= 0;
   VI_TotalReg:= 0;

   bm_Avl:= IBQuery_FichaAvaliacao.GetBookMark;
   IBQuery_FichaAvaliacao.First;
   While not IBQuery_FichaAvaliacao.Eof do
   begin
      if IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString = '1' then
      begin
         VI_OTIMO:= VI_OTIMO+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('BOM').AsString = '1' then
      begin
         VI_BOM:= VI_BOM+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString = '1' then
      begin
         VI_REGULAR:= VI_REGULAR+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('NS').AsString = '1' then
      begin
         VI_NS:= VI_NS+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if IBTable_FichaAvaliacao.FieldByName('NA').AsString = '1' then
         VI_NA:= VI_NA+1;

      IBQuery_FichaAvaliacao.Next;
   end;

   IBQuery_FichaAvaliacao.Close;
   IBQuery_FichaAvaliacao.Open;

   IBQuery_FichaAvaliacao.GotoBookmark(bm_Avl);
   IBQuery_FichaAvaliacao.FreeBookMark(bm_Avl);

    Mostrar_Medias;
end;

//------------------------------------------------------------------------------
// Tratamento Tratar as Medias
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacao.Mostrar_Medias;
var
  VR_Media: Real;
  VS_Media, VS_Comando: String;
begin
   VR_Media:= (VI_OTIMO*4)+(VI_BOM*2)+(VI_REGULAR);
   if VI_TotalReg > 0 then
      VR_Media:= VR_Media/VI_TotalReg;

   VS_Media:= FormatFloat('#0.00', VR_Media);

   VS_Comando:= 'Update Cad_Ficha_Avl Set Media = '+Funcoes.DePara(VS_Media, ',','.')+
                ' Where IDCURSO = '+IBQuery_Cad_Avaliados.FieldByName('IDCURSO').AsString+' and '+
                ' IDTURMA = '+IBQuery_Cad_Avaliados.FieldByName('IDTURMA').AsString+' and '+
                ' ID_ATCO = '+#39+IBQuery_Cad_Avaliados.FieldByName('ID_ATCO').AsString+#39+' and '+
                ' ID_FICHA = '+IBQuery_Cad_Avaliados.FieldByName('ID_FICHA').AsString+' and '+
                ' ID_AVL = '+#39+IBQuery_Cad_Avaliados.FieldByName('ID_AVL').AsString+#39+' and '+
                ' ID_Exercicio = '+IBQuery_Cad_Avaliados.FieldByName('ID_EXERCICIO').AsString;
   Funcoes.ExecSqlProsima(VS_Comando);
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o Relatorio
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacao.ToolButton_ImprimirClick( Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      Text1.Print('');
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Salvar o Arquivo
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacao.ToolButton_SalvarClick(Sender: TObject);
begin
  if ((FFileName = sUntitled) or (FFileName = '' )) then
    FileSaveAs(Sender)
  else
  begin
    Text1.Lines.SaveToFile(FFileName+'.Doc');
    Text1.Modified := False;
  end;
end;


procedure TForm_ProcessarClassificacao.FileSaveAs(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName+'.Doc') then
      if MessageDlg(Format(sOverWrite, [SaveDialog1.FileName+'.Doc']),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Text1.Lines.SaveToFile(SaveDialog1.FileName+'.Doc');
    SetFileName(SaveDialog1.FileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_ProcessarClassificacao.SetFileName(const FileName: String);
begin
  //Nome do Arquivo Doc
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;
procedure TForm_ProcessarClassificacao.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Cad_Avaliados.Close;
   IBQuery_FichaAvaliacao.Close;
   IBTable_FichaAvaliacao.Close;
  Close;
end;

procedure TForm_ProcessarClassificacao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para montar o Relatorio
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacao.MontarRelatorio;
begin
   IBTable_Estagiario.Open;
   IBTable_AlunoTurma.Open;
   IBTable_Instrutor.Open;

   Text1.Clear;
   Text1.Font.Size:= 12;
   Text1.Font.Name:= 'Courier New';

   Text1.Lines.Add('          *** RELAÇÃO DOS ALUNOS COM SUAS NOTAS / MEDIA ***');
   Text1.Lines.Add('');
   Text1.Lines.Add('Curso: Prosima');
   Text1.Lines.Add('Turma: '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Turma').AsString);
   Text1.Lines.Add('');
   Text1.Lines.Add('');


   VS_Comando:= 'Select * From cad_ficha_avl '+
                ' Where IdCurso = '+Funcoes.GetIdCurso+
                ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                ' Order by IdTurma, Id_Atco, Id_Exercicio';

   IBQuery_RelacaoAlunosMedia.Close;
   IBQuery_RelacaoAlunosMedia.SQL.Clear;
   IBQuery_RelacaoAlunosMedia.Sql.Add(VS_Comando);
   IBQuery_RelacaoAlunosMedia.Open;

   IBQuery_RelacaoAlunosMedia.First;

   VS_Id_Atco:= '';

   While not IBQuery_RelacaoAlunosMedia.Eof do
   begin
      if IBQuery_RelacaoAlunosMedia.FieldbyName('ID_ATCO').AsString <> VS_ID_ATCO then
      begin
         if VS_Id_Atco <> '' then
         begin
           Finalizar_MediaFinal;
         end
         else
         begin
         end;

         VR_Cont:= 1;
         VS_Id_Atco:= IBQuery_RelacaoAlunosMedia.FieldbyName('ID_ATCO').AsString;
         VS_Aluno:= IBQuery_RelacaoAlunosMedia.FieldbyName('NomeCompleto').AsString;
         VR_Media:= IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat;
         VS_Media:= 'Médias | '+FormatFloat('#0.00', IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat);
      end
      else
      begin
         VR_Media:= VR_Media+IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat;
         VS_Media:= VS_Media+' | '+FormatFloat('#0.00', IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat);
         VR_Cont:= VR_Cont+1
      end;
      IBQuery_RelacaoAlunosMedia.Next;
   end;
           Finalizar_MediaFinal;
   Text1.SelStart:= 0;  //5
end;


//------------------------------------------------------------------------------
// Tratamento para Processar e Demonstrar a Media Final
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacao.Finalizar_MediaFinal;
begin
    VS_Comando:= 'Select distinct Id_Exercicio '+
                         ' From cad_ficha_avl '+
                         ' Where IdCurso = '+Funcoes.GetIdCurso+
                         ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                         ' and   Id_Atco = '+VS_ID_ATCO;
            Funcoes.OpenQueryExecuta(VS_Comando);

            VS_exercicio:= 'Exercício |';
            DM.IBQuery_Executa_ensino.First;
            While not DM.IBQuery_Executa_ensino.Eof do
            begin
               VS_exercicio:= VS_exercicio+'  '+Funcoes.InserirPos(DM.IBQuery_Executa_ensino.FieldbyName('Id_Exercicio').AsString, 4)+'|';
               DM.IBQuery_Executa_ensino.Next;
            end;

            if IBTable_Estagiario.FieldByName('Estagiario').AsString = 'S' then
               text1.Lines.Add('Aluno    : '+VS_Aluno+' Estágiario')
            else
               text1.Lines.Add('Aluno    : '+VS_Aluno);

            text1.Lines.Add('Instrutor: '+trim(IBTable_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBTable_Instrutor.FieldByName('Nome').AsString);
               text1.Lines.Add('');
            text1.Lines.Add(VS_exercicio+' MÉDIA |');

            VS_Media:= VS_Media+' | '+FormatFloat('#0.00', VR_Media/VR_Cont);
            VS_Calc_Media:= FormatFloat('#0.00', VR_Media/VR_Cont);

            VS_Comando:= 'Update AlunoTurma Set NotaFinal = '+Funcoes.DePara(VS_Calc_Media,',','.')+
                         ' Where IdCurso = '+Funcoes.GetIdCurso+
                         ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                         ' and   Identidade = '+VS_ID_ATCO;

            Funcoes.ExecSql(VS_Comando);

            text1.Lines.Add('   '+VS_Media+'  |');
            Text1.Lines.Add('--------------------------------------------------------------------------------------------------------------------------');
end;

//------------------------------------------------------------------------------
// Tratamento para montar o Relatorio no Formato do Excel
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacao.ToolButton1Click(Sender: TObject);
var
   objExcel,Sheet : Variant;
   cTitulo : string;
   i : integer;
begin
{
   IBTable_Estagiario.Open;
   IBTable_AlunoTurma.Open;
   IBTable_Instrutor.Open;


      // Cria uma instancia para utilizar o Excel

      cTitulo := '*** RELAÇÃO DOS ALUNOS COM SUAS NOTAS / MEDIA ***';
      objExcel := CreateOleObject('Excel.Application');
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'Curso: Prosima';
      Sheet.Range['A2'] := 'Turma: '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Turma').AsString';

      Linha:= 4;

   VS_Comando:= 'Select * From cad_ficha_avl '+
                ' Where IdCurso = '+Funcoes.GetIdCurso+
                ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                ' Order by IdTurma, Id_Atco, Id_Exercicio';

   IBQuery_RelacaoAlunosMedia.Close;
   IBQuery_RelacaoAlunosMedia.SQL.Clear;
   IBQuery_RelacaoAlunosMedia.Sql.Add(VS_Comando);
   IBQuery_RelacaoAlunosMedia.Open;

   VS_Id_Atco:= '';

   While not IBQuery_RelacaoAlunosMedia.Eof do
   begin
      if IBQuery_RelacaoAlunosMedia.FieldbyName('ID_ATCO').AsString <> VS_ID_ATCO then
      begin
         if VS_Id_Atco <> '' then
         begin

            if IBTable_Estagiario.FieldByName('Estagiario').AsString = 'S' then
            begin
               Sheet.Cells[Linha,1] := 'Aluno    : '+VS_Aluno+' Estágiario';
               Linha:= Linha + 1;
//               text1.Lines.Add('Aluno    : '+VS_Aluno+' Estágiario')
            end
            else
            begin
               Sheet.Cells[Linha,1] := 'Aluno    : '+VS_Aluno;
               Linha:= Linha + 1;
//               text1.Lines.Add('Aluno    : '+VS_Aluno);
            end

            Sheet.Cells[Linha,1] := 'Instrutor: '+trim(IBTable_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBTable_Instrutor.FieldByName('Nome').AsString;
            Linha:= Linha + 1;
            Linha:= Linha + 1;
//            text1.Lines.Add('Instrutor: '+trim(IBTable_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBTable_Instrutor.FieldByName('Nome').AsString);
//               text1.Lines.Add('');

            // Separando em Coluna

            VS_Comando:= 'Select distinct Id_Exercicio '+
                         ' From cad_ficha_avl '+
                         ' Where IdCurso = '+Funcoes.GetIdCurso+
                         ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                         ' and   Id_Atco = '+VS_ID_ATCO;
            Funcoes.OpenQuery(VS_Comando);

            Coluna:= 1;
            Sheet.Cells[Linha,Coluna] := 'Exercício';
            Coluna:= Coluna + 1;

//            VS_exercicio:= 'Exercício |';
            DM.IBQuery_Executa_ensino.First;
            While not DM.IBQuery_Executa_ensino.Eof do
            begin
               Sheet.Cells[Linha,Coluna] := Funcoes.InserirPos(DM.IBQuery_Executa_ensino.FieldbyName('Id_Exercicio').AsString, 4);
               Coluna:= Coluna + 1;
//               VS_exercicio:= VS_exercicio+'  '+Funcoes.InserirPos(DM.IBQuery_Executa_ensino.FieldbyName('Id_Exercicio').AsString, 4)+'|';
               DM.IBQuery_Executa_ensino.Next;
            end;

            Sheet.Cells[Linha,Coluna] := ' MÉDIA';
            Coluna:= Coluna + 1;
//            text1.Lines.Add(VS_exercicio+' MÉDIA |');

            VS_Media:= VS_Media+' | '+FormatFloat('#0.00', VR_Media/VR_Cont);
            VS_Calc_Media:= FormatFloat('#0.00', VR_Media/VR_Cont);

//            VS_Comando:= 'Update AlunoTurma Set NotaFinal = '+Funcoes.DePara(VS_Calc_Media,',','.')+
//                         ' Where IdCurso = '+Funcoes.GetIdCurso+
//                         ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
//                         ' and   Identidade = '+VS_ID_ATCO;

//            Funcoes.ExecSql(VS_Comando);

            text1.Lines.Add('   '+VS_Media+'  |');
            Text1.Lines.Add('----------------------------------------------------------------------------------------------------------------------------');
         end
         else
         begin
         end;

         VR_Cont:= 1;
         VS_Id_Atco:= IBQuery_RelacaoAlunosMedia.FieldbyName('ID_ATCO').AsString;
         VS_Aluno:= IBQuery_RelacaoAlunosMedia.FieldbyName('NomeCompleto').AsString;
         VR_Media:= IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat;
         VS_Media:= 'Médias | '+FormatFloat('#0.00', IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat);
      end
      else
      begin
         VR_Media:= VR_Media+IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat;
         VS_Media:= VS_Media+' | '+FormatFloat('#0.00', IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat);
         VR_Cont:= VR_Cont+1
      end;
      IBQuery_RelacaoAlunosMedia.Next;
   end;
   Text1.SelStart:= 0;  //5


      Sheet.Range['C1'] := 'Nome Guerra';
      Sheet.Range['D1'] := 'ID';
      Sheet.Range['E1'] := 'Nome Completo';
      Sheet.Range['F1'] := 'Status';
      Sheet.Range['G1'] := 'Unidade';
      Sheet.Range['H1'] := 'SubUnidade';
      Sheet.Range['I1'] := 'Sexo';

      // por aqui tu limparias a planilha

      i:= 2;
      IBQuery_AlunoTurma.First;
      while not IBQuery_AlunoTurma.eof do
      begin
         Sheet.Cells[i,1] := IBQuery_AlunoTurma.FieldByName('SARAM').AsString;
         Sheet.Cells[i,2] := IBQuery_AlunoTurma.FieldByName('CPF').AsString;
         Sheet.Cells[i,3] := IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString;
         Sheet.Cells[i,4] := IBQuery_AlunoTurma.FieldByName('Identidade').AsString;
         Sheet.Cells[i,5] := IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString;
         Sheet.Cells[i,6] := IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString;
         Sheet.Cells[i,7] := IBQuery_AlunoTurma.FieldByName('IdUnidade').AsString;
         Sheet.Cells[i,8] := IBQuery_AlunoTurma.FieldByName('IdSubUnidade').AsString;
         Sheet.Cells[i,9] := IBQuery_AlunoTurma.FieldByName('Sexo').AsString;
         i:= i+1;
         IBQuery_AlunoTurma.Next;
      end;
   end;
}

end;

end.
