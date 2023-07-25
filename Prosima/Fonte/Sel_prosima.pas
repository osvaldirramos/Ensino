unit Sel_prosima;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, ComCtrls, ToolWin;

type
  TForm_Cad_ATCO = class(TForm)
    ToolBar1: TToolBar;
    Memo1: TMemo;
    ToolButton_Gravar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_Cancelar: TToolButton;
    GroupBox_Procedencia: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ComboBox_Unidade: TDBComboBox;
    ComboBox_SubUnidade: TDBComboBox;
    GroupBox_NomeCargo: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    DBComboBox_PostoGraduacao: TDBComboBox;
    DBEdit_NomeCompleto: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit_CPF: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cad_ATCO: TForm_Cad_ATCO;

implementation

uses ATCO;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procudere Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_ATCO.FormActivate(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

{procedure TForm_Cad_Aluno.NovoAluno;
begin
   //--- Limpa os Campos

   IBTable_PessoaAl.Close;
   VS_OpcaoAluno:= 'Pesquisar';
   DBEdit_CPF.Text:= '';
   DBEdit_CPF.SetFocus;
end;
}
//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_ATCO.ToolButton_GravarClick(Sender: TObject);
begin
{   IBTable_ATCO.Post;
   Funcoes.ExecutaTransacao;

   Tratar_Campos(True);
   ToolButton_AtualizarClick( Sender);
   DBGrid_ATCO.SetFocus;
}
end;

end.
