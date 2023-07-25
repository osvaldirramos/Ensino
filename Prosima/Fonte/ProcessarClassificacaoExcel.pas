unit ProcessarClassificacaoExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rotinas, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, TeEngine,
  Series, StdCtrls, TeeProcs, Chart, ExtCtrls, JvComponent, JvCaptionPanel,
  ComCtrls, ToolWin, ComObj, Menus, DBCtrls, Mask, JvShape, Buttons,
  IBTable, JvRichEd, JvDBRichEd, PsyRichEdit, JvGradient;

type
  TForm_ProcessarClassificacaoExcel = class(TForm)
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
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
    IBQuery_AlunoTurma: TIBQuery;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaNUMORDEM: TSmallintField;
    IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_AlunoTurmaNOME: TIBStringField;
    IBQuery_AlunoTurmaQUADROESP: TIBStringField;
    DSQ_AlunoTurma: TDataSource;
    DSQ_Estagiario: TDataSource;
    IBTable_Rel_NS: TIBTable;
    IBTable_Rel_NSIDCURSO: TSmallintField;
    IBTable_Rel_NSIDTURMA: TIntegerField;
    IBTable_Rel_NSID_FICHA: TIntegerField;
    IBTable_Rel_NSID_ATCO: TIBStringField;
    IBTable_Rel_NSID_AVL: TIBStringField;
    IBTable_Rel_NSID_EXERCICIO: TIntegerField;
    IBTable_Rel_NSDESCRICAO: TIBStringField;
    JvGradient2: TJvGradient;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private    { Private declarations }
       VS_Id_Atco, VS_Comando: String;
  public
    { Public declarations }
  end;

var
  Form_ProcessarClassificacaoExcel: TForm_ProcessarClassificacaoExcel;

implementation

uses Module, MenuPrincipal;

{$R *.dfm}

procedure TForm_ProcessarClassificacaoExcel.FormActivate(Sender: TObject);
begin
   //--- Tratamento da Selecao dos Cursos
   ToolButton1Click(Sender);
end;

procedure TForm_ProcessarClassificacaoExcel.ToolButton_RetornarClick(Sender: TObject);
begin
//   IBTable_FichaAvaliacao.Close;
  Close;
end;

procedure TForm_ProcessarClassificacaoExcel.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;


//------------------------------------------------------------------------------
// Tratamento para montar o Relatorio no Formato do Excel
//------------------------------------------------------------------------------

procedure TForm_ProcessarClassificacaoExcel.ToolButton1Click(Sender: TObject);
var
   objExcel,Sheet : Variant;
   cTitulo : string;
   Coluna, Linha : integer;
begin

   IBTable_Rel_NS.Open;
   IBTable_Estagiario.Open;
   IBTable_Instrutor.Open;
   IBQuery_RelacaoAlunosMedia.Open;

   // Cria uma instancia para utilizar o Excel

   cTitulo := 'Grau Final da Turma';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

    //---
   //   Tratamento do Cabecalho do Relatorio

   // Preenchendo as Colunas
   Sheet.Range['C1'] := 'INSTITUTO DE CONTROLE DO ESPAÇO AÉREO';
   Sheet.Range['C2'] := 'DIVISÃO DE ENSINO';
   Sheet.Range['C3'] := 'SUBDIVISÃO DE AVALIAÇÃO';
   Sheet.Range['C5'] := 'RELAÇÃO DE ALUNOS';
   Sheet.Range['C7'] := 'Turma: '+Trim(Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Turma').AsString)+' de '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('Ano').AsString;
   Sheet.Range['C8'] := 'Elaborado em: '+DateToStr(Date);

   Sheet.Range['A10'] := 'Posto/Graduação';
   Sheet.Range['B10'] := 'Nome Completo';
   Sheet.Range['C10'] := 'Instrutor';
   Sheet.Range['D10'] := 'Média';
   Sheet.Range['E10'] := 'Estágiario';
   Sheet.Range['F10'] := 'Possui NS';
   Sheet.Range['G10'] := 'Exercícios';

   Linha:= Linha + 12;

      //----------------- Tratamento do Relatorio  -----------------//

   VS_Comando:= ' Select al.IdCurso, al.IdTurma, al.Identidade, al.NumOrdem, al.IdAntiguidade, al.PostoGraduacao, al.MotivoDesligamento, al.CodigoAluno, al.NotaFinal, al.nome, al.quadroEsp '+
                ' From Aluno_Turmas_View  al '+
                ' Where IdCurso = '+Funcoes.GetIdCurso+
                ' and   IdTurma = '+Form_MenuPrincipal.Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                ' Order by NotaFinal Desc';

   IBQuery_AlunoTurma.Close;
   IBQuery_AlunoTurma.SQL.Clear;
   IBQuery_AlunoTurma.Sql.Add(VS_Comando);
   IBQuery_AlunoTurma.Open;

   VS_Id_Atco:= '';

   While not IBQuery_AlunoTurma.Eof do
   begin
      Sheet.Cells[Linha,1] := IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString;
      Sheet.Cells[Linha,2] := IBQuery_AlunoTurma.FieldByName('Nome').AsString;
      Sheet.Cells[Linha,3] := trim(IBTable_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBTable_Instrutor.FieldByName('Nome').AsString;
      Sheet.Cells[Linha,4] := IBQuery_AlunoTurma.FieldByName('NotaFinal').AsFloat;

      if Trim(IBTable_Estagiario.FieldByName('Estagiario').AsString) = '' then
         Sheet.Cells[Linha,5] := 'Não'
      else
         Sheet.Cells[Linha,5] := 'Sim';

      if Trim(IBTable_Rel_NS.FieldByName('IdCurso').AsString) <> '' then
         Sheet.Cells[Linha,6] := 'Sim'
      else
         Sheet.Cells[Linha,6] := 'Não';

      Coluna:= 7;
      IBQuery_RelacaoAlunosMedia.First;
      While not IBQuery_RelacaoAlunosMedia.Eof do
      begin
         Sheet.Cells[Linha,Coluna] := Trim(Funcoes.InserirPos(IBQuery_RelacaoAlunosMedia.FieldbyName('Id_Exercicio').AsString, 4))+'= '+FormatFloat('#0.00', IBQuery_RelacaoAlunosMedia.FieldByName('Media').AsFloat);
         Coluna:= Coluna+1;

         IBQuery_RelacaoAlunosMedia.Next;
      end;

      Linha:= Linha + 1;
      IBQuery_AlunoTurma.Next;
   end;
   Sheet.Columns.AutoFit;

   Close;
end;

end.
