//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_Pais.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos paises que fazem curso no Instituto.       //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/08/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Pais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtCtrls, ToolWin, Menus, ImgList, DBTables, DB, rOTINAS, IBTable,
  IBCustomDataSet, IBQuery, JvComponent, JvEnterTab, JvTransBtn, JvShape,
  JvGradient;

type
  TForm_Tab_Paises = class(TForm)
    Panel_Entrada_Dados: TPanel;
    Panel_Grid: TPanel;
    DBGrid_Campos: TDBGrid;
    ToolBar1: TToolBar;
    DST_Cadastro: TDataSource;
    DSQ_Consulta: TDataSource;
    DBEdit_Nome: TDBEdit;
    DBEdit_Descricao: TDBEdit;
    Edit_Descricao: TEdit;
    Edit_Nome: TEdit;
    Query_Consulta: TIBQuery;
    Table_Cadastro: TIBTable;
    Label_Unidade: TLabel;
    Label_Nome: TLabel;
    Query_ConsultaNOMEPAIS: TIBStringField;
    Query_ConsultaDESCPAIS: TIBStringField;
    JvEnterAsTab1: TJvEnterAsTab;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel2: TPanel;
    JvGradient1: TJvGradient;
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

    procedure Botoes_Inciais(Status: Boolean; JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows: TJvTransparentButton);
    procedure Campos(Status: Boolean);
    procedure Pesquisar;

    procedure DBGrid_CamposTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_SelecaoClick(Sender: TObject);
    procedure Edit_NomeChange(Sender: TObject);
    procedure Edit_DescricaoChange(Sender: TObject);
    procedure Table_CadastroPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
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
  Form_Tab_Paises: TForm_Tab_Paises;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.FormActivate(Sender: TObject);
begin
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_Tab_Paises.Caption:= 'SAE --> Cadastro de Paises';

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Tabelas Auxiliares - Paises');    // Abre o perfil do usuario em relacao a agenda

   // Abertura das tabelas que serao utlizadas

   Table_Cadastro.Open;
   VS_OrderBy:= 'NomePais';
   Edit_Nome.Text:= '';
   Edit_Descricao.Text:= '';
   Pesquisar;

   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(True, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
end;

//------------------------------------------------------------------------------
// Tratamento da consulta por nome do pais
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.Edit_NomeChange(Sender: TObject);
begin
   Pesquisar;
end;

//------------------------------------------------------------------------------
// Tratamento da consulta por descricao do pais
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.Edit_DescricaoChange(Sender: TObject);
begin
   Pesquisar;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de execusao da consulta
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.Pesquisar;
begin
   VS_Comando:= 'Select NomePais, DescPais From Tab_Pais ';

   if trim(Edit_Nome.Text) <> '' then
      VS_Comando:= VS_Comando+' Where Upper(NomePais) Like '+#39+trim(UpperCase(Edit_Nome.Text))+'%'+#39;

   if trim(Edit_Descricao.Text) <> '' then
      if trim(Edit_Nome.Text) = '' then
         VS_Comando:= VS_Comando+' Where Upper(DescPais) Like '+#39+'%'+trim(UpperCase(Edit_Descricao.Text))+'%'+#39
      else
         VS_Comando:= VS_Comando+' and Upper(DescPais) Like '+#39+'%'+trim(UpperCase(Edit_Descricao.Text))+'%'+#39;

   Query_Consulta.Close;
   Query_Consulta.SQL.Clear;
   if Trim(VS_OrderBy) = '' then
      Query_Consulta.SQL.Add(VS_Comando)
   else
      Query_Consulta.SQL.Add(VS_Comando+' Order by '+VS_OrderBy);
   Query_Consulta.Open;
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.DBGrid_CamposTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'País' then
       VS_OrderBy:= 'NomePais'
   else
     if trim(column.Title.Caption) = 'Descrição' then
         VS_OrderBy:= 'DescPais';

   Pesquisar;
end;

//------------------------------------------------------------------------------
//
// Tratamento dos dados
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.Campos(Status: Boolean);
begin
   Panel_Entrada_Dados.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo Cargo
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.JvTransparentButton_InserirClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Paises', 'Inserir');
   Campos(True);
   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(False, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   Table_Cadastro.Append;
   Table_Cadastro.FieldByName('NOMEPAIS').AsString:= '';
   DBEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.JvTransparentButton_AlteraClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Paises', 'Alterar');
   Campos(True);
   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(False, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   Table_Cadastro.Edit;
   DBEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   Funcoes.BotoesNovo01( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(False, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Grid.Enabled:= False;

   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Pais '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Tabelas Auxiliares - Paises', 'Excluir');

      Table_Cadastro.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Pesquisar;
   end;

   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(True, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.JvTransparentButton_GravaClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Paises', 'Gravar');

   Table_Cadastro.Post;
   Funcoes.ExecutaTransacao;
   Query_Consulta.Open;

   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Grava, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(True, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.JvTransparentButton_CancelClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Paises', 'Cancelar');

   Campos(False);
   Table_Cadastro.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(True, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Query_Consulta.Close;
   Close;
end;

procedure TForm_Tab_Paises.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Consulta);
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Fechar a Janela
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.ToolButton_SelecaoClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento Quando o pais já foi cadastrada
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.Table_CadastroPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('Este pais já foi cadastrado...',mtWarning, [mbOK], 0);
          Abort;
          DBEdit_Nome.SetFocus;
       end;
end;

procedure TForm_Tab_Paises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Consulta.Close;
   Table_Cadastro.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo Cargo
//------------------------------------------------------------------------------

procedure TForm_Tab_Paises.Botoes_Inciais(Status: Boolean; JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows: TJvTransparentButton);
begin
   JvTransparentButton_Atualizar.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;
end;

end.
