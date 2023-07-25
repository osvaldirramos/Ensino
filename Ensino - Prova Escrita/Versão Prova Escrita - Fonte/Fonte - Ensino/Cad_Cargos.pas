//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_Cargos.PAS                                 //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos cargos.                                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 31/08/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Cargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtCtrls, ToolWin, Menus, ImgList, DBTables, DB, Rotinas_SUE, Rotinas,
  IBCustomDataSet, IBQuery, IBTable, JvComponent, JvEnterTab, JvTransBtn,
  JvShape, JvGradient;

type
  TForm_Tab_Cargos = class(TForm)
    Panel_Entrada_Dados: TPanel;
    Panel_Grid: TPanel;
    DBGrid_Campos: TDBGrid;
    ToolBar1: TToolBar;
    DST_Cadastro: TDataSource;
    DSQ_Consulta: TDataSource;
    DBEdit_Descricao: TDBEdit;
    Edit_Cargo: TEdit;
    Edit_Nome: TEdit;
    SpeedButton_Pessoa: TSpeedButton;
    ComboBox_Posto_Graduacao: TComboBox;
    DBEdit_PostoGraduacao: TDBEdit;
    Table_Cadastro: TIBTable;
    Query_Consulta: TIBQuery;
    Table_CadastroIDCARGO: TSmallintField;
    DBEdit_Sigla: TDBEdit;
    Table_CadastroSIGLA: TIBStringField;
    IBTable_Pessoa: TIBTable;
    DST_Pessoa: TDataSource;
    Table_CadastroIDENTIDADE: TIBStringField;
    IBTable_PessoaIDENTIDADE: TIBStringField;
    DBEdit_Nome: TDBEdit;
    Table_CadastroPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaPOSTOGRADUACAO: TIBStringField;
    Label_Unidade: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Table_CadastroDESCCARGO: TIBStringField;
    Query_ConsultaIDCARGO: TSmallintField;
    Query_ConsultaDESCCARGO: TIBStringField;
    Query_ConsultaPOSTOGRADUACAO: TIBStringField;
    Query_ConsultaNOME: TIBStringField;
    IBTable_PessoaNOME: TIBStringField;
    IBTable_PessoaNOMEGUERRA: TIBStringField;
    JvGradient1: TJvGradient;
    Panel2: TPanel;
    JvGradient2: TJvGradient;
    JvShape1: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Cancel: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_Altera: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    Panel_Botoes: TPanel;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;

    procedure Campos(Status: Boolean);
    procedure ExecutaQuery;
    procedure Pesquisar;
    procedure TrataBotoes(Status: Boolean);

    procedure DBGrid_CamposTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton_PessoaClick(Sender: TObject);
    procedure ComboBox_Posto_GraduacaoChange(Sender: TObject);
    procedure Table_CadastroPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure ToolButton_SelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlteraClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelClick(Sender: TObject);
  private    { Private declarations }
      VS_Comando, VS_OrderBy: String;
  public
    { Public declarations }
  end;

var
  Form_Tab_Cargos: TForm_Tab_Cargos;

implementation

uses Module, Cad_Pessoa;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_Tab_Cargos, ' Cadastro de Cargos');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Resp. pela assinatura dos relatórios');    // Abre o perfil do usuario

   //--- Alimentacao do comboBox de selecao do posto/graduacao

   Funcoes_SUE.AlimentaComboBox(ComboBox_Posto_Graduacao, 'PostoGraduacao', 'Antiguidade', '', 'IdAntiguidade');
   ComboBox_Posto_Graduacao.Text:= '';

   // Tratamento dos Botoes Principais

   // Abertura das tabelas que serao utilizadas

   Query_Consulta.Open;
   Table_Cadastro.Open;
   IBTable_Pessoa.Open;

   VS_OrderBy:= 'ca.PostoGraduacao';
   ComboBox_Posto_Graduacao.Text:= '';
   Edit_Nome.Text:= '';
   Edit_Cargo.Text:= '';
   Pesquisar;

   Campos(False);
   TrataBotoes(True);

   if Query_Consulta.RecordCount = 0 then
      Funcoes.BotoesNovo01( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel)
end;

procedure TForm_Tab_Cargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Consulta.Close;
   Table_Cadastro.Close;
   IBTable_Pessoa.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento da pesquisa pelo Posto/Graduacao
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.ComboBox_Posto_GraduacaoChange(Sender: TObject);
begin
    Pesquisar;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de execusao da consulta
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.Pesquisar;
var
   VB_Where: Boolean;
begin
   VB_Where:= False;
   VS_Comando:= 'Select ca.IdCargo, ca.DescCargo, ca.PostoGraduacao, ca.nome '+
                ' from Cargo_view ca ';

   if trim(ComboBox_Posto_Graduacao.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' where ca.PostoGraduacao Like '+#39+trim(UpperCase(ComboBox_Posto_Graduacao.Text))+'%'+#39;
      VB_where:= True;
   end;

   if trim(Edit_Nome.Text) <> '' then
   begin
      if VB_Where = False then
      begin
         VS_Comando:= VS_Comando+' Where ca.nome Like '+#39+'%'+trim(Edit_Nome.Text)+'%'+#39;
         VB_where:= True;
      end
      else
         VS_Comando:= VS_Comando+' and ca.nome Like '+#39+'%'+trim(Edit_Nome.Text)+'%'+#39;
   end;

   if trim(Edit_Cargo.Text) <> '' then
   begin
      if VB_Where = False then
         VS_Comando:= VS_Comando+' Where ca.desccargo Like '+#39+'%'+trim(Edit_Cargo.Text)+'%'+#39
      else
         VS_Comando:= VS_Comando+' and ca.desccargo Like '+#39+'%'+trim(Edit_Cargo.Text)+'%'+#39;
   end;
   ExecutaQuery;
end;

//------------------------------------------------------------------------------
// Executa a query
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.ExecutaQuery;
begin
   Funcoes.ExecutaQuery( Query_Consulta, VS_Comando+' Order by '+VS_OrderBy);
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.DBGrid_CamposTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Posto/Graduação' then
       VS_OrderBy:= 'ca.PostoGraduacao'
   else
     if trim(column.Title.Caption) = 'N o m e' then
         VS_OrderBy:= 'ca.nome'
     else
        if trim(column.Title.Caption) = 'Cargo' then
            VS_OrderBy:= 'ca.desccargo';

   ExecutaQuery;
end;

//------------------------------------------------------------------------------
//
// Tratamento dos dados
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.Campos(Status: Boolean);
begin
   Panel_Entrada_Dados.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo Cargo
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.JvTransparentButton_InserirClick(Sender: TObject);
begin
//   Funcoes.GravaAcesso('Tabelas Auxiliares - Resp. pela assinatura dos relatórios', 'Inserir');

   Campos(True);
   Panel_Grid.Enabled:= False;
   TrataBotoes(False);

   Table_Cadastro.Append;
   DBEdit_Nome.Text:= '';
   Table_Cadastro.FieldByName('IdCargo').AsInteger:= Funcoes.MaiorCodigo('IdCargo', 'Cargo');
   SpeedButton_PessoaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.JvTransparentButton_AlteraClick( Sender: TObject);
begin
//   Funcoes.GravaAcesso('Tabelas Auxiliares - Resp. pela assinatura dos relatórios', 'Alterar');
   Campos(True);
   Panel_Grid.Enabled:= False;
   TrataBotoes(False);

   Table_Cadastro.Edit;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   TrataBotoes(False);
   Funcoes.BotoesNovo01( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Panel_Grid.Enabled:= False;

   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Cargo '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Tabelas Auxiliares - Resp. pela assinatura dos relatórios', 'Exclui');
      Table_Cadastro.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(Query_Consulta);
   end;

   TrataBotoes(True);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.JvTransparentButton_GravaClick(Sender: TObject);
begin
//   Funcoes.GravaAcesso('Tabelas Auxiliares - Resp. pela assinatura dos relatórios', 'Gravar');
   Table_Cadastro.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(Query_Consulta);
   Funcoes.AtualizaQuery( DM.IBQuery_Cargo);

   Campos(False);
   TrataBotoes(True);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.JvTransparentButton_CancelClick( Sender: TObject);
begin
//   Funcoes.GravaAcesso('Tabelas Auxiliares - Resp. pela assinatura dos relatórios', 'Cancelar');
   Table_Cadastro.Cancel;
   Funcoes.ExecutaTransacao;

   Campos(False);
   TrataBotoes(True);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes basicos
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.TrataBotoes(Status: Boolean);
begin
   Funcoes.BotoesBasico( Status, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel);
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Funcoes.SetCargo('');
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao que retorna o IdCargo
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.ToolButton_SelecionarClick(Sender: TObject);
begin
   if Trim(Query_Consulta.FieldByName('IdCargo').AsString) = '' then
   begin
      ShowMessage(' O Cargo não pode ser branco... ');
      Edit_Nome.SetFocus;
   end
   else
   begin
      Funcoes.SetCargo(Query_Consulta.FieldByName('IdCargo').AsString);
      Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de selecao da pessoa
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.SpeedButton_PessoaClick(Sender: TObject);
begin
   Funcoes.SetRetornaPessoa(True);
   Form_Cad_Pessoa.VS_Busca_Identidade:= Table_Cadastro.FieldByName('Identidade').AsString;
   Form_Cad_Pessoa.ShowModal;
   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Tabelas Auxiliares - Resp. pela assinatura dos relatórios');    // Abre o perfil do usuario em relacao a agenda

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select Identidade, Nome, PostoGraduacao, QuadroEsp from Pessoa where Identidade = '+#39+Funcoes.GetPessoa+#39);
   Table_Cadastro.FieldByName('PostoGraduacao').AsString:= trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+DM.IBQuery_Executa.FieldByName('QuadroEsp').AsString;
   Table_Cadastro.FieldByName('Identidade').AsString:= Funcoes.GetPessoa;

   DBEdit_Nome.Text:= DM.IBQuery_Executa.FieldByName('Nome').AsString;
   DBEdit_PostoGraduacao.Text:= trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+DM.IBQuery_Executa.FieldByName('QuadroEsp').AsString;
   DBEdit_Sigla.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento Quando o cargo já foi cadastrada
//------------------------------------------------------------------------------

procedure TForm_Tab_Cargos.Table_CadastroPostError(DataSet: TDataSet;  E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('Este cargo já foi cadastrado...',mtWarning, [mbOK], 0);
          Abort;
          DBEdit_Sigla.SetFocus;
       end;
end;

end.
