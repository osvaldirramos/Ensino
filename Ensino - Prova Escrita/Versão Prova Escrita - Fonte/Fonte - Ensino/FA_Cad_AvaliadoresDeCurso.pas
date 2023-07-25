//------------------------------------------------------------------------------
// Descricao: Este modulo tem a funcao de tratar do cadastro dos usuarios do sistema
//
// Ultima atualiuzacao: 05/12/05
//
//------------------------------------------------------------------------------

unit FA_Cad_AvaliadoresDeCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, Mask, ComCtrls, Buttons, ExtCtrls, Rotinas,
  Rotinas_SUE, Grids, DBGrids, ImgList, IBTable, IBCustomDataSet, IBQuery, Variants,
  JvGrdCpt, JvComponent, JvDBLookupTreeView, ToolWin, JvEnterTab,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_FA_CadAvaliadoresDeCurso = class(TForm)
    IBQuery_FA_Usuario: TIBQuery;
    DSQ_Usuario: TDataSource;
    IBTable_FA_Usuario: TIBTable;
    DST_FA_Usuario: TDataSource;
    Panel_Entrada_Dados: TPanel;
    SpeedButton_Pessoa: TSpeedButton;
    Label1: TLabel;
    DBEdit_Nome: TDBEdit;
    Panel_Grid: TPanel;
    DBGrid_Campos: TDBGrid;
    ToolBar1: TToolBar;
    ComboBox_Posto_Graduacao: TComboBox;
    Edit_Nome: TEdit;
    Label2: TLabel;
    DBEdit_Senha: TDBEdit;
    IBTable_FA_UsuarioIDENTIDADE: TIBStringField;
    IBTable_FA_UsuarioNOME: TIBStringField;
    IBTable_FA_UsuarioSENHA: TIBStringField;
    IBQuery_FA_UsuarioIDENTIDADE: TIBStringField;
    IBQuery_FA_UsuarioNOME: TIBStringField;
    IBQuery_FA_UsuarioPOSTOGRADUACAO: TIBStringField;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancel: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    Panel_Botoes: TPanel;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo2: TMemo;
    Memo3: TMemo;

    procedure ExecutaQuery;

    Procedure Containers(Status: Boolean);
    procedure Campos(Status: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton_PessoaClick(Sender: TObject);
    procedure ComboBox_Posto_GraduacaoChange(Sender: TObject);
    procedure DBGrid_CamposTitleClick(Column: TColumn);
    procedure IBTable_FA_UsuarioPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);

  private    { private declarations }
      VS_Comando, VS_OrderBy: String;
  public    { public declarations }
     VS_Opcao, VS_Nome, VS_Senha: String;
  end;

var
  Form_FA_CadAvaliadoresDeCurso: TForm_FA_CadAvaliadoresDeCurso;

implementation

uses Module, Cad_Pessoa;

{$R *.DFM}

//-----------------------------------------------------------------------
// Modulo Principal
//-----------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.FormActivate(Sender: TObject);
begin
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
      Form_FA_CadAvaliadoresDeCurso.Caption:= 'SAE(SISTEMA DE ACOMPANHAMENTO EDUCACIONAL) --> Cadastro de Avaliadores';

   Funcoes_SUE.AlimentaComboBox(ComboBox_Posto_Graduacao, 'PostoGraduacao', 'Antiguidade', '', 'IdAntiguidade');
   ComboBox_Posto_Graduacao.Text:= '';

   Funcoes.SetAcesso('A');

   VS_OrderBy:= 'nome';
   Containers(True);
   Campos( False );

    //--- Abre os arquivos

   IBQuery_FA_Usuario.Open;
   IBTable_FA_Usuario.Open;

   //--- Seta valores iniciais

   DBGrid_Campos.SetFocus;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento dos Containers
//------------------------------------------------------------------------------

Procedure TForm_FA_CadAvaliadoresDeCurso.Containers(Status: Boolean);
begin
   DBGrid_Campos.Enabled:= Status;

   //--- Tratamento dos botoes

   JvTransparentButton_Retornar.Enabled:= status;
   JvTransparentButton_Windows.Enabled:= status;
   Funcoes.BotoesBasico( Status, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.JvTransparentButton_InserirClick(Sender: TObject);
begin
   VS_Opcao:= 'Novo';
   Containers(False);
   Campos( True );

   IBTable_FA_Usuario.Append;
   DBEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   VS_Opcao:= 'Altera';
   Containers(False);
   Campos( True );

   IBTable_FA_Usuario.Edit;
   DBEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VS_Comando: STring;
begin
   Containers(False);
   JvTransparentButton_Grava.Enabled:= False;
   JvTransparentButton_Cancel.Enabled:= False;

   if MessageDlg('Confirma a exclusão ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      VS_Comando:= 'Delete from FA_Usuario where Identidade = '+#39+IBQuery_FA_Usuario.FieldByName('Identidade').AsString+#39;
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);
      Funcoes.AtualizaQuery(IBQuery_FA_Usuario);
   end;
   Containers(True);
   DBGrid_Campos.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.JvTransparentButton_GravaClick(Sender: TObject);
var
   VS_Identidade: String;
begin
   VS_Identidade:= IBTable_FA_Usuario.FieldByName('Identidade').AsString;
   IBTable_FA_Usuario.Post;
   Funcoes.ExecutaTransacao;

   Containers(True);

   Campos( False );
   Funcoes.AtualizaQuery(IBQuery_FA_Usuario);

   //--- Posiciona na captacao que foi cadastrada

   if VS_Opcao = 'Novo' then
      IBQuery_FA_Usuario.Locate('Identidade', VarArrayOf([VS_Identidade]), [loPartialKey]);

   DBGrid_Campos.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.JvTransparentButton_CancelClick(Sender: TObject);
begin
   Containers(True);
   Campos( False );

   IBTable_FA_Usuario.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_FA_Usuario);
   DBGrid_Campos.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//-----------------------------------------------------------------------
// Tratamento do botao Windows
//-----------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//-----------------------------------------------------------------------
// Tratamento do botões quando não for utilizado o botão de gravação
//-----------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.Campos(Status: Boolean);
begin
   DBEdit_Nome.Enabled:= Status;
   DBEdit_Senha.Enabled:= Status;
   SpeedButton_Pessoa.Enabled:= Status;
End;

//------------------------------------------------------------------------------
// Tratamento do Botao de selecao do usuario
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.SpeedButton_PessoaClick(Sender: TObject);
begin
   Funcoes.SetRetornaPessoa(True);
   Form_Cad_Pessoa.VS_Busca_Identidade:= IBTable_FA_Usuario.FieldByName('Identidade').AsString;
   Form_Cad_Pessoa.ShowModal;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select Identidade, NomeGuerra from Pessoa where Identidade = '+#39+Funcoes.GetPessoa+#39);
   DBEdit_Nome.Text:= DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString;
   IBTable_FA_Usuario.FieldByName('Identidade').AsString:= Funcoes.GetPessoa;
   DBEdit_Senha.SetFocus;
end;

procedure TForm_FA_CadAvaliadoresDeCurso.ComboBox_Posto_GraduacaoChange(Sender: TObject);
begin
   VS_Comando:= 'Select u.Identidade, p.PostoGraduacao, u.Nome '+
                'From FA_Usuario u, pessoa p '+
                ' where u.identidade = p.identidade ';

   if trim(ComboBox_Posto_Graduacao.Text) <> '' then
      VS_Comando:= VS_Comando+' and p.PostoGraduacao Like '+#39+trim(UpperCase(ComboBox_Posto_Graduacao.Text))+'%'+#39;

   if trim(Edit_Nome.Text) <> '' then
      VS_Comando:= VS_Comando+' and u.nome Like '+#39+'%'+trim(Edit_Nome.Text)+'%'+#39;

   ExecutaQuery;
end;

//------------------------------------------------------------------------------
// Executa a query
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.ExecutaQuery;
begin
   IBQuery_FA_Usuario.Close;
   IBQuery_FA_Usuario.SQL.Clear;
   IBQuery_FA_Usuario.SQL.Add(VS_Comando+' Order by '+VS_OrderBy);
   IBQuery_FA_Usuario.Open;
end;

//------------------------------------------------------------------------------
// Tratamento para ordenar os campos
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.DBGrid_CamposTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Posto/Graduação' then
       VS_OrderBy:= 'p.PostoGraduacao'
   else
     if trim(column.Title.Caption) = 'N o m e' then
         VS_OrderBy:= 'u.nome';

   ExecutaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento de erro de Insercao de Usuario
//------------------------------------------------------------------------------

procedure TForm_FA_CadAvaliadoresDeCurso.IBTable_FA_UsuarioPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
   Sender: TObject;
begin
   if (E is EDBEngineError) then
     if (E as EDBEngineError).Errors[0].Errorcode = 9729 then
     begin
        MessageDlg('  Este Usuário já foi cadastrado...  ',mtError, [mbOk],0);
        JvTransparentButton_CancelClick(Sender);
     end;
end;

procedure TForm_FA_CadAvaliadoresDeCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;





end.

