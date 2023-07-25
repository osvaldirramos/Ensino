//------------------------------------------------------------------------------
// Descricao: Este modulo tem a funcao de tratar do cadastro dos usuarios do sistema
//
// Ultima atualiuzacao: 05/12/05
//
//------------------------------------------------------------------------------

unit Cad_Secoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, Mask, ComCtrls, Buttons, ExtCtrls, Rotinas,
  Grids, DBGrids, ImgList, IBTable, IBCustomDataSet, IBQuery, Variants,
  JvGrdCpt, JvComponent, JvDBLookupTreeView, ToolWin, JvEnterTab,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_Cad_Secoes = class(TForm)
    Panel_Secao: TPanel;
    DBGrid_Secao: TDBGrid;
    IBQuery_Secao: TIBQuery;
    DSQ_Usuario: TDataSource;
    IBTable_Secao: TIBTable;
    DST_Usuario: TDataSource;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Label_Senha: TLabel;
    Label_Nome: TLabel;
    Bevel13: TBevel;
    DBText2: TDBText;
    EditSigla: TDBEdit;
    EditDescricao: TDBEdit;
    Panel_BotoesProva: TPanel;
    JvGradient_Botoes: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    IBTable_SecaoIDSECAO: TIntegerField;
    IBTable_SecaoSIGLA: TIBStringField;
    IBTable_SecaoDESCRICAO: TIBStringField;
    IBTable_SecaoSUBDIVISAO: TIBStringField;
    Label1: TLabel;
    DBComboBox_Divisao: TDBComboBox;
    IBTable_SecaoRAMAL: TIBStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;

    Procedure Containers(Status: Boolean);
    procedure Campos(Status: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);

  private    { private declarations }
  public    { public declarations }
     VS_Opcao_Secao, VS_Opcao, VS_CPF, VS_Nome, VS_Senha, VS_Priv: String;
  end;

var
  Form_Cad_Secoes: TForm_Cad_Secoes;

implementation

uses Module;

{$R *.DFM}

//-----------------------------------------------------------------------
// Modulo Principal
//-----------------------------------------------------------------------

procedure TForm_Cad_Secoes.FormActivate(Sender: TObject);
begin
   JvGradient_Botoes.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm( Form_Cad_Secoes, ' Cadastro de Usuários');

   Funcoes.SetAcesso('A');

   Containers(True);

    //--- Abre os arquivos

   IBQuery_Secao.Open;
   IBTable_Secao.Open;

   //--- Seta valores iniciais

   DBGrid_Secao.SetFocus;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento dos Containers
//------------------------------------------------------------------------------

Procedure TForm_Cad_Secoes.Containers(Status: Boolean);
begin
   DBGrid_Secao.Enabled:= Status;
   Panel_Secao.Enabled:= Status;

   //--- Tratamento dos botoes

   JvTransparentButton_Windows.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Atualizar.Enabled:= Status;

   Funcoes.BotoesBasico( Status, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_InserirClick(Sender: TObject);
begin
   VS_Opcao_Secao:= 'Novo';
   Containers(False);

   Panel_Secao.Enabled:= True;

   VS_Opcao:= 'Novo';
   Campos( True );

   IBTable_Secao.Append;
   IBTable_Secao.FieldByName('Sigla').AsString:= '';
   EditSigla.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   VS_Opcao_Secao:= 'Altera';
   Containers(False);
   Panel_Secao.Enabled:= True;

   IBTable_Secao.Edit;

   Campos( True );
   EditSigla.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_ExcluiClick(Sender: TObject);
begin
   Containers(False);
   JvTransparentButton_Grava.Enabled:= False;
   JvTransparentButton_Cancelar.Enabled:= False;

   if MessageDlg('Confirma a exclusão ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Delete from FP_Secao where IdSecao = '+IBQuery_Secao.FieldByName('IdSecao').AsString);

      Funcoes.AtualizaQuery(IBQuery_Secao);
   end;
   Containers(True);
   DBGrid_Secao.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_GravaClick(Sender: TObject);
var
   VS_IdSecao: String;
begin
   if VS_Opcao_Secao = 'Novo' then
   begin
      VS_IdSecao:= IntToStr(Funcoes.MaiorCodigo('IdSecao', 'FP_SECAO'));
      IBTable_Secao.FieldByName('IdSecao').AsString:= VS_IdSecao;
   end;

   IBTable_Secao.Post;
   Funcoes.ExecutaTransacao;

   Containers(True);

   Campos( False );
   Funcoes.AtualizaQuery(IBQuery_Secao);

   //--- Posiciona na captacao que foi cadastrada

   if VS_Opcao_Secao = 'Novo' then
      IBQuery_Secao.Locate('IdSecao', VarArrayOf([VS_IdSecao]), [loPartialKey]);

   DBGrid_Secao.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   Containers(True);

   Campos( False );
   IBTable_Secao.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_Secao);
   DBGrid_Secao.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//-----------------------------------------------------------------------
// Tratamento do botao Windows
//-----------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//-----------------------------------------------------------------------
// Tratamento do botao de atualizacao da Lista de Usuarios
//-----------------------------------------------------------------------

procedure TForm_Cad_Secoes.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Secao);
end;

//-----------------------------------------------------------------------
// Tratamento do botões quando não for utilizado o botão de gravação
//-----------------------------------------------------------------------

procedure TForm_Cad_Secoes.Campos(Status: Boolean);
begin
   EditSigla.Enabled:= Status;
   EditDescricao.Enabled:= Status;
   DBComboBox_Divisao.Enabled:= Status;
End;


procedure TForm_Cad_Secoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Secao.Close;
   IBTable_Secao.Close;
   Action:= caFree;
end;

end.

