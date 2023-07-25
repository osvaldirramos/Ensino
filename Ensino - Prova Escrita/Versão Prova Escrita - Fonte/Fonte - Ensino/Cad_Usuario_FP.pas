//------------------------------------------------------------------------------
// Descricao: Este modulo tem a funcao de tratar do cadastro dos usuarios do sistema
//
// Ultima atualiuzacao: 05/12/05
//
//------------------------------------------------------------------------------

unit Cad_Usuario_FP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, Mask, ComCtrls, Buttons, ExtCtrls, Rotinas,
  Grids, DBGrids, ImgList, IBTable, IBCustomDataSet, IBQuery, Variants,
  JvGrdCpt, JvComponent, JvDBLookupTreeView, ToolWin, JvEnterTab,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_Cad_Usuario_FP = class(TForm)
    Panel_Usuario: TPanel;
    DBGrid_Nome: TDBGrid;
    IBQuery_Usuario: TIBQuery;
    DSQ_Usuario: TDataSource;
    IBTable_Usuario: TIBTable;
    DST_Usuario: TDataSource;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo1: TMemo;
    Label_Senha: TLabel;
    Label_Nome: TLabel;
    Bevel13: TBevel;
    DBText2: TDBText;
    EditUSERNAME: TDBEdit;
    EditSENHA: TDBEdit;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_GravaUsu: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_CancelarUsu: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_InserirUsu: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_AlterarUsu: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_ExcluiUsu: TJvTransparentButton;
    IBTable_UsuarioIDENTIDADE: TIBStringField;
    IBTable_UsuarioNOME: TIBStringField;
    IBTable_UsuarioSENHA: TIBStringField;
    IBQuery_UsuarioIDENTIDADE: TIBStringField;
    IBQuery_UsuarioNOME: TIBStringField;
    IBQuery_UsuarioSENHA: TIBStringField;

    Procedure Containers(Status: Boolean);
    procedure Campos(Status: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirUsuClick(Sender: TObject);
    procedure JvTransparentButton_AlterarUsuClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiUsuClick(Sender: TObject);
    procedure JvTransparentButton_GravaUsuClick(Sender: TObject);
    procedure JvTransparentButton_CancelarUsuClick(Sender: TObject);

  private    { private declarations }
  public    { public declarations }
     VS_Opcao_Usuario, VS_Opcao, VS_CPF, VS_Nome, VS_Senha, VS_Priv: String;
  end;

var
  Form_Cad_Usuario_FP: TForm_Cad_Usuario_FP;

implementation

uses Module;

{$R *.DFM}

//-----------------------------------------------------------------------
// Modulo Principal
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_Cad_Usuario_FP, ' Cadastro de Usuários');

   Funcoes.SetAcesso('A');

   Containers(True);

    //--- Abre os arquivos

   IBQuery_Usuario.Open;
   IBTable_Usuario.Open;

   //--- Seta valores iniciais

   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento dos Containers
//------------------------------------------------------------------------------

Procedure TForm_Cad_Usuario_FP.Containers(Status: Boolean);
begin
   DBGrid_Nome.Enabled:= Status;
   Panel_Usuario.Enabled:= Status;

   //--- Tratamento dos botoes

   JvTransparentButton_Windows.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Atualizar.Enabled:= Status;

   Funcoes.BotoesBasico( Status, JvTransparentButton_InserirUsu, JvTransparentButton_AlterarUsu, JvTransparentButton_ExcluiUsu, JvTransparentButton_GravaUsu,JvTransparentButton_CancelarUsu);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_InserirUsuClick(Sender: TObject);
begin
   VS_Opcao_Usuario:= 'Novo';
   Containers(False);

   Panel_Usuario.Enabled:= True;

   VS_Opcao:= 'Novo';
   Campos( True );

   IBTable_Usuario.Append;
   EditUSERNAME.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_AlterarUsuClick(Sender: TObject);
begin
   VS_Opcao_Usuario:= 'Altera';
   Containers(False);
   Panel_Usuario.Enabled:= True;

   IBTable_Usuario.Edit;
   IBTable_Usuario.FieldByName('Senha').AsString:= Funcoes.Descriptografar(EditSENHA.Text);

   Campos( True );
   EditUSERNAME.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_ExcluiUsuClick(Sender: TObject);
begin
   Containers(False);
   JvTransparentButton_GravaUsu.Enabled:= False;
   JvTransparentButton_CancelarUsu.Enabled:= False;

   if MessageDlg('Confirma a exclusão ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Delete from FP_Usuario where Identidade = '+#39+IBQuery_Usuario.FieldByName('Identidade').AsString+#39);

      Funcoes.AtualizaQuery(IBQuery_Usuario);
   end;
   Containers(True);
   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_GravaUsuClick(Sender: TObject);
var
   VS_IdCodigo: String;
begin
   if VS_Opcao_Usuario = 'Novo' then
   begin
      VS_IdCodigo:= 'US'+Copy(IBTable_Usuario.FieldByName('Nome').AsString,1,3)+Copy(IBTable_Usuario.FieldByName('Senha').AsString,1,3);
      IBTable_Usuario.FieldByName('Identidade').AsString:= VS_IdCodigo;
   end;

   IBTable_Usuario.Post;
   Funcoes.ExecutaTransacao;

   Containers(True);

   Campos( False );
   Funcoes.AtualizaQuery(IBQuery_Usuario);

   //--- Posiciona na captacao que foi cadastrada

   if VS_Opcao_Usuario = 'Novo' then
      IBQuery_Usuario.Locate('Identidade', VarArrayOf([VS_IdCodigo]), [loPartialKey]);

   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_CancelarUsuClick(Sender: TObject);
begin
   Containers(True);

   Campos( False );
   IBTable_Usuario.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_Usuario);
   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//-----------------------------------------------------------------------
// Tratamento do botao Windows
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//-----------------------------------------------------------------------
// Tratamento do botao de atualizacao da Lista de Usuarios
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Usuario);
end;

//-----------------------------------------------------------------------
// Tratamento do botões quando não for utilizado o botão de gravação
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario_FP.Campos(Status: Boolean);
begin
   EditUSERNAME.Enabled:= Status;
   EditSENHA.Enabled:= Status;
End;


procedure TForm_Cad_Usuario_FP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Usuario.Close;
   IBTable_Usuario.Close;
   Action:= caFree;
end;

end.

