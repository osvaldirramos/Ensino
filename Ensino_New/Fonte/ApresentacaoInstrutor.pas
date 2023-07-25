unit ApresentacaoInstrutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvToolEdit, JvDBCtrl, ComCtrls, ToolWin, Rotinas,
  DB, IBCustomDataSet, IBTable, DBCtrls, jpeg, ExtCtrls, JvComponent,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_ApresentacaoInstrutor = class(TForm)
    DST_InstrutorTurma: TDataSource;
    IBTable_InstrutorTurma: TIBTable;
    IBTable_InstrutorTurmaIDCURSO: TSmallintField;
    IBTable_InstrutorTurmaIDTURMA: TIntegerField;
    IBTable_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBTable_InstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBTable_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    JvGradient_Tela01: TJvGradient;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_GravaApresentacao: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_CancelaApresentacao: TJvTransparentButton;
    Label4: TLabel;
    Label19: TLabel;
    DBEdit_Codigo: TDBEdit;
    JvDBDateEdit_Apresentacao: TJvDBDateEdit;

    procedure Fechar;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_GravaApresentacaoClick(Sender: TObject);
    procedure JvTransparentButton_CancelaApresentacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ApresentacaoInstrutor: TForm_ApresentacaoInstrutor;

implementation

uses Sel_Turma, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_ApresentacaoInstrutor.FormActivate(Sender: TObject);
begin
   JvGradient_Tela01.StartColor:= Cor_Tela;

   IBTable_InstrutorTurma.Open;
   IBTable_InstrutorTurma.Edit;
   IBTable_InstrutorTurma.FieldByName('Apresentacao').AsDateTime:= Date;
   JvDBDateEdit_Apresentacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_ApresentacaoInstrutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_ApresentacaoInstrutor.JvTransparentButton_GravaApresentacaoClick(Sender: TObject);
begin
   IBTable_InstrutorTurma.Post;
   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_ApresentacaoInstrutor.JvTransparentButton_CancelaApresentacaoClick(Sender: TObject);
begin
   IBTable_InstrutorTurma.Cancel;
   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento da Procedure Fechar
//------------------------------------------------------------------------------

procedure TForm_ApresentacaoInstrutor.Fechar;
var
   Sender: TObject;
begin
   Funcoes.ExecutaTransacao;
   Form_SelTurma.MontaInstrutor(Sender);
   IBTable_InstrutorTurma.Close;
   Close;
end;

end.
