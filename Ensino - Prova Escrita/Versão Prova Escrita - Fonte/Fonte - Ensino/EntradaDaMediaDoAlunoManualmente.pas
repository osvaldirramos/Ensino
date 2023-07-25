unit EntradaDaMediaDoAlunoManualmente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB,
  Dialogs, StdCtrls, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls, DBCtrls, Rotinas,
  ToolWin, IBCustomDataSet, IBTable, JvComponent, JvTransBtn, JvShape,
  JvGradient;

type
  TForm_EntradaDaMediaDoAlunoManualmente = class(TForm)
    Table_AlunoTurma: TIBTable;
    Table_AlunoTurmaIDCURSO: TSmallintField;
    Table_AlunoTurmaIDTURMA: TIntegerField;
    Table_AlunoTurmaIDENTIDADE: TIBStringField;
    Table_AlunoTurmaNOTAFINAL: TIBBCDField;
    StatusBar1: TStatusBar;
    JvGradient1: TJvGradient;
    Label1: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    Label10: TLabel;
    DBText4: TDBText;
    DBText1: TDBText;
    Label9: TLabel;
    DBText2: TDBText;
    JvFloatEdit_NotaManual: TJvFloatEdit2;
    JvShape3: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_NaoPossuiNota: TJvTransparentButton;
    DBNavigator_NotaManual: TDBNavigator;
    Memo2: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure DBNavigator_NotaManualClick(Sender: TObject; Button: TNavigateBtn);
    procedure JvFloatEdit_NotaManualKeyPress(Sender: TObject; var Key: Char);
    procedure Table_AlunoTurmaAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_NaoPossuiNotaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_EntradaDaMediaDoAlunoManualmente: TForm_EntradaDaMediaDoAlunoManualmente;

implementation

uses Module, CorrecaoProva;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_EntradaDaMediaDoAlunoManualmente.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_EntradaDaMediaDoAlunoManualmente, ' Entrada da Média do Aluno - Manualmente');

   Table_AlunoTurma.Open;
   JvFloatEdit_NotaManual.SetFocus;
   JvFloatEdit_NotaManual.SelectAll;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_EntradaDaMediaDoAlunoManualmente.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   Table_AlunoTurma.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Fechar
//------------------------------------------------------------------------------

procedure TForm_EntradaDaMediaDoAlunoManualmente.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.VB_CadastrarNotaManualmente:= False;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento da Gravacao da Entrada da Nota Manual
//------------------------------------------------------------------------------

procedure TForm_EntradaDaMediaDoAlunoManualmente.JvTransparentButton_GravarClick(Sender: TObject);
begin
   Table_AlunoTurma.Edit;
   Table_AlunoTurma.FieldByName('NOTAFINAL').AsFloat:= JvFloatEdit_NotaManual.Value;
   Table_AlunoTurma.Post;
   Funcoes.ExecutaTransacao;
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
   JvFloatEdit_NotaManual.SetFocus;
   JvFloatEdit_NotaManual.SelectAll;
end;

procedure TForm_EntradaDaMediaDoAlunoManualmente.DBNavigator_NotaManualClick(Sender: TObject; Button: TNavigateBtn);
begin
   JvFloatEdit_NotaManual.SetFocus;
   JvFloatEdit_NotaManual.SelectAll;
end;

procedure TForm_EntradaDaMediaDoAlunoManualmente.JvFloatEdit_NotaManualKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
       JvTransparentButton_GravarClick(Sender);
end;

procedure TForm_EntradaDaMediaDoAlunoManualmente.Table_AlunoTurmaAfterScroll(DataSet: TDataSet);
begin
   JvFloatEdit_NotaManual.Value:= Table_AlunoTurma.FieldByName('NOTAFINAL').AsFloat;

end;

//------------------------------------------------------------------------------
// Tratamento para cadastrar nulo na media dos alunos
//------------------------------------------------------------------------------

procedure TForm_EntradaDaMediaDoAlunoManualmente.JvTransparentButton_NaoPossuiNotaClick(Sender: TObject);
begin
   Table_AlunoTurma.Edit;
   Table_AlunoTurma.FieldByName('NOTAFINAL').AsString:= '';
   Table_AlunoTurma.Post;
   Funcoes.ExecutaTransacao;
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
end;

end.
