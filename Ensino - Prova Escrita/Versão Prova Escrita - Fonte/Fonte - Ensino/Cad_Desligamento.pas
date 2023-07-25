//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_Desligamento.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos motivos de desligamento de curso.          //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 06/09/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Desligamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtCtrls, ToolWin, Menus, ImgList, DBTables, DB, rOTINAS, IBTable,
  IBCustomDataSet, IBQuery, JvComponent, JvEnterTab, JvTransBtn, JvShape,
  JvGradient;

type
  TForm_Tab_Desligamento = class(TForm)
    Panel_Entrada_Dados: TPanel;
    Panel_Grid: TPanel;
    DBGrid_Campos: TDBGrid;
    ToolBar1: TToolBar;
    DST_Cadastro: TDataSource;
    DSQ_Consulta: TDataSource;
    DBEdit_Motivo: TDBEdit;
    DBEdit_Descricao: TDBEdit;
    Edit_Descricao: TEdit;
    Edit_Motivo: TEdit;
    Query_Consulta: TIBQuery;
    Table_Cadastro: TIBTable;
    Label_Descricao: TLabel;
    Label_Motivo: TLabel;
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
    procedure oTable_CadastroPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Edit_MotivoChange(Sender: TObject);
    procedure Edit_DescricaoChange(Sender: TObject);
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
  Form_Tab_Desligamento: TForm_Tab_Desligamento;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.FormActivate(Sender: TObject);
begin
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_Tab_Desligamento.Caption:= 'SAE --> Cadastro de Motivos de Desligamento';

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Tabelas Auxiliares - Desligamento');    // Abre o perfil do usuario em relacao a agenda

   // Abertura das tabelas que serao utlizadas

   Query_Consulta.Open;
   Table_Cadastro.Open;

   VS_OrderBy:= 'MotivoDeslig';
   Pesquisar;

   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(True, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
end;

//------------------------------------------------------------------------------
// Tratamento do botao de selecao por Motivo de Desligamento
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.Edit_MotivoChange(Sender: TObject);
begin
   Pesquisar;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de pesquisa por descricao
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.Edit_DescricaoChange(Sender: TObject);
begin
   Pesquisar;
end;

//------------------------------------------------------------------------------
// Tratamento da funcao Pesquisar
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.Pesquisar;
begin
   VS_Comando:= 'Select MotivoDeslig, Descricao From Desligamento ';
   if trim(Edit_Motivo.Text) <> '' then
      VS_Comando:= VS_Comando+' Where Upper(MotivoDeslig) Like '+#39+trim(UpperCase(Edit_Motivo.Text))+'%'+#39;

   if trim(Edit_Descricao.Text) <> '' then
      if trim(Edit_Motivo.Text) = '' then
         VS_Comando:= VS_Comando+' Where Upper(Descricao) Like '+#39+'%'+trim(UpperCase(Edit_Descricao.Text))+'%'+#39
      else
         VS_Comando:= VS_Comando+' and Upper(Descricao) Like '+#39+'%'+trim(UpperCase(Edit_Descricao.Text))+'%'+#39;

   Query_Consulta.Close;
   Query_Consulta.SQL.Clear;
   Query_Consulta.SQL.Add(VS_Comando+' Order by '+VS_OrderBy);
   Query_Consulta.Open;
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.DBGrid_CamposTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Motivo' then
       VS_OrderBy:= 'MotivoDeslig'
   else
     if trim(column.Title.Caption) = 'Descrição' then
         VS_OrderBy:= 'Descricao';

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

procedure TForm_Tab_Desligamento.Campos(Status: Boolean);
begin
   Panel_Entrada_Dados.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.JvTransparentButton_InserirClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Desligamento', 'Inserir');
   Campos(True);
   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(False, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   Table_Cadastro.Append;
   DBEdit_Motivo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.JvTransparentButton_AlteraClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Desligamento', 'Alterar');
   Campos(True);
   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(False, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);

   Table_Cadastro.Edit;
   DBEdit_Motivo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   Funcoes.BotoesNovo01( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(False, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Grid.Enabled:= False;

   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o desligamento '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Tabelas Auxiliares - Desligamento', 'Exclui');

      Table_Cadastro.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Query_Consulta.Close;
      Query_Consulta.Open;
   end;

   Pesquisar;
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(True, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.JvTransparentButton_GravaClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Desligamento', 'Grava');

   //--- Grava o desligamento fornecido

   Table_Cadastro.Post;
   Funcoes.ExecutaTransacao;

   Pesquisar;
   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Botoes_Inciais(True, JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.JvTransparentButton_CancelClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Desligamento', 'Cancela');

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

procedure TForm_Tab_Desligamento.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao que retorna o IdAntiguidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.ToolButton_SelecaoClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento Quando o posto/graduacao já foi cadastrado
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.oTable_CadastroPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          ShowMessage('O motivo de desligamento já foi cadastrado...');
          Abort;
          DBEdit_Motivo.SetFocus;
       end;
end;


procedure TForm_Tab_Desligamento.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Consulta);
end;

//------------------------------------------------------------------------------
// Tratamento dos botoes de incializacao do sistema
//------------------------------------------------------------------------------

procedure TForm_Tab_Desligamento.Botoes_Inciais(Status: Boolean; JvTransparentButton_Atualizar, JvTransparentButton_Retornar, JvTransparentButton_Windows: TJvTransparentButton);
begin
   JvTransparentButton_Atualizar.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;
end;

end.
