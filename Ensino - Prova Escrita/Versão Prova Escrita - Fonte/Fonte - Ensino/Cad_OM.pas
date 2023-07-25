unit Cad_OM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, JvDBCtrl, ExtCtrls, Grids, DBGrids, Rotinas_Pln, Rotinas,
  JvToolEdit, JvEdit, JvComponent, JvCaptionPanel, Mask, Buttons, JvxCtrls,
  JvShape, ComCtrls, ToolWin, DB, IBCustomDataSet, IBQuery, IBTable,
  JvEnterTab;

type
  TForm_Cad_OM = class(TForm)
    IBTable_OM: TIBTable;
    DST_OM: TDataSource;
    IBTable_OMIDORG: TIntegerField;
    IBTable_OMNOME: TIBStringField;
    GroupBox_DadosDiscilina: TGroupBox;
    Label38: TLabel;
    DBEdit_Nome: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton_Gravar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_Cancelar: TToolButton;
    IBTable_usuario: TIBTable;
    DST_Usuario: TDataSource;
    GroupBox_Login: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit_Senha: TDBEdit;
    DBEdit_Login: TDBEdit;
    IBTable_usuarioIDORG: TIntegerField;
    IBTable_usuarioLOGIN: TIBStringField;
    IBTable_usuarioSENHA: TIBStringField;
    JvEnterAsTab1: TJvEnterAsTab;
    JvEnterAsTab2: TJvEnterAsTab;
    Memo1: TMemo;
    Memo2: TMemo;

    procedure Inserir;
    procedure Fechar;
    procedure Alterar;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure DBEdit_NomeExit(Sender: TObject);
    procedure DBEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_Cad_OM: TForm_Cad_OM;

implementation

uses Sel_OM_Convocacao, DM_PLN, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

procedure TForm_Cad_OM.FormActivate(Sender: TObject);
begin
   IBTable_OM.Open;
   IBTable_usuario.Open;

   if Form_Sel_OM.VS_Opcao = 'Inserir' then
      Inserir
   else
      Alterar;
end;

//------------------------------------------------------------------------------
// Cadastro da Turma
//------------------------------------------------------------------------------

procedure TForm_Cad_OM.Inserir;
begin
   IBTable_OM.Append;
   IBTable_OM.FieldByName('IdOrg').AsInteger:= Funcoes_Pln.MaiorCodigo('IdOrg', 'CI_ORGANIZACAO');
   IBTable_OM.FieldByName('Nome').AsString:= '';

   // Tratamento para senha

   IBTable_usuario.Append;
   IBTable_usuario.FieldByName('Senha').AsString:= Funcoes.GerarSenha(10);

   DBEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera turma
//------------------------------------------------------------------------------

procedure TForm_Cad_OM.Alterar;
begin
   IBTable_OM.Edit;
   IBTable_usuario.Edit;
   DBEdit_Nome.SetFocus;
End;


//------------------------------------------------------------------------------
// Tratamento do botao Gravar turma
//------------------------------------------------------------------------------

procedure TForm_Cad_OM.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_usuario.Post;
   IBTable_OM.Post;
   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela turma
//------------------------------------------------------------------------------

procedure TForm_Cad_OM.ToolButton_CancelarClick(Sender: TObject);
begin
   IBTable_usuario.Cancel;
   IBTable_OM.Cancel;
   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento da Opcao Fechar
//------------------------------------------------------------------------------

procedure TForm_Cad_OM.Fechar;
var
   Sender: TObject;
begin
   DMPln.IBTransaction_Pln.CommitRetaining;
   Form_Sel_OM.ToolButton_AtualiazarCursoClick(Sender);
   IBTable_OM.Close;
   IBTable_usuario.Close;
   Close;
end;

procedure TForm_Cad_OM.DBEdit_NomeExit(Sender: TObject);
begin
   IBTable_usuario.FieldByName('Login').AsString:= DBEdit_Nome.Text;
   DBEdit_Login.Text:= DBEdit_Nome.Text;
end;

procedure TForm_Cad_OM.DBEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
     ToolButton_GravarClick(Sender);
end;

procedure TForm_Cad_OM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_OM.Close;
   IBTable_usuario.Close;
   Action:= caFree;
end;

end.
