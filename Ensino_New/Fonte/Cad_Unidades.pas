//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_Unidades.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             de Unidade e Subunidades.                      //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 15/07/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Unidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, ImgList, IBCustomDataSet, IBTable,
  IBQuery, JvComponent, JvEnterTab, JvTransBtn, JvShape, JvGradient;

type
  TForm_Tab_Unidades = class(TForm)
    DST_Unidades: TDataSource;
    DST_SubUnidade: TDataSource;
    PageControl_Funcoes: TPageControl;
    TabSheet_Unidade: TTabSheet;
    DSQ_Unidade: TDataSource;
    Query_Unidade: TIBQuery;
    Table_Unidades: TIBTable;
    Table_SubUnidade: TIBTable;
    Panel12: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Edit_BuscaSigla: TEdit;
    Panel5: TPanel;
    DBGrid_Unidade: TDBGrid;
    Panel_CampoUnidade: TPanel;
    Edit_Unidade: TDBEdit;
    Edit_NomeUnidade: TDBEdit;
    Table_UnidadesIDUNIDADE: TIBStringField;
    Table_UnidadesDESCRICAO: TIBStringField;
    Table_SubUnidadeIDUNIDADE: TIBStringField;
    Table_SubUnidadeIDSUBUNIDADE: TIBStringField;
    Table_SubUnidadeDESCRICAO: TIBStringField;
    DBEdit1: TDBEdit;
    Table_UnidadesFAX: TIBStringField;
    Table_SubUnidadeFAX: TIBStringField;
    TabSheet_SubUnidade: TTabSheet;
    DBGrid_SubUnidade: TDBGrid;
    Panel_CampoSubUnidade: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit_NomeSubUnidade: TDBEdit;
    DBEdit_SubUnidade: TDBEdit;
    DBEdit2: TDBEdit;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_GravaUnid: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_CancelUnid: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_InserirUnid: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_AlteraUnid: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_ExcluiUnid: TJvTransparentButton;
    Label_Codigo_Quadro: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    JvGradient1: TJvGradient;
    JvShape1: TJvShape;
    JvTransparentButton_GravaSub: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_CancelSub: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_InserirSub: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_AlteraSub: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_ExcluiSub: TJvTransparentButton;

    procedure Campos_Unidade(Status: Boolean);
    procedure Campos_SubUnidade(Status: Boolean);

    Procedure Containers(Status: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Edit_BuscaSiglaChange(Sender: TObject);
    procedure Table_UnidadesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Table_SubUnidadePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirUnidClick(Sender: TObject);
    procedure JvTransparentButton_AlteraUnidClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiUnidClick(Sender: TObject);
    procedure JvTransparentButton_GravaUnidClick(Sender: TObject);
    procedure JvTransparentButton_CancelUnidClick(Sender: TObject);
    procedure JvTransparentButton_InserirSubClick(Sender: TObject);
    procedure JvTransparentButton_AlteraSubClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiSubClick(Sender: TObject);
    procedure JvTransparentButton_GravaSubClick(Sender: TObject);
    procedure JvTransparentButton_CancelSubClick(Sender: TObject);
  private    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Tab_Unidades: TForm_Tab_Unidades;

implementation

uses Module, Cad_Pessoa;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_Tab_Unidades, ' Cadastro de Unidades/SubUnidades');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Tabelas Auxiliares - Unidades');    // Abre o perfil do usuario em relacao a agenda

   PageControl_Funcoes.TabIndex:= 0;
   Containers(True);

   // Abertura das tabelas que serao utlizadas

   Query_Unidade.Open;
   Table_Unidades.Open;
   Table_SubUnidade.Open;

   Campos_Unidade(False);
   Campos_SubUnidade(False);
   if Table_SubUnidade.RecordCount = 0 then
      JvTransparentButton_AlteraSub.Enabled:= False
   else
      JvTransparentButton_AlteraSub.Enabled:= True;
end;

procedure TForm_Tab_Unidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Unidade.Close;
   Table_Unidades.Close;
   Table_SubUnidade.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure desabiliatr os Containers
//------------------------------------------------------------------------------

Procedure TForm_Tab_Unidades.Containers(Status: Boolean);
begin
   JvTransparentButton_Atualizar.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;

   DBGrid_Unidade.Enabled:= Status;
   DBGrid_SubUnidade.Enabled:= Status;

   Funcoes.BotoesBasico( Status, JvTransparentButton_InserirUnid, JvTransparentButton_AlteraUnid, JvTransparentButton_ExcluiUnid, JvTransparentButton_GravaUnid,JvTransparentButton_CancelUnid);
   Funcoes.BotoesBasico( Status, JvTransparentButton_InserirSub, JvTransparentButton_AlteraSub, JvTransparentButton_ExcluiSub, JvTransparentButton_GravaSub,JvTransparentButton_CancelSub);

   if Status = False then
   begin
      JvTransparentButton_GravaUnid.Enabled:= Status;
      JvTransparentButton_CancelUnid.Enabled:= Status;
      JvTransparentButton_GravaSub.Enabled:= Status;
      JvTransparentButton_CancelSub.Enabled:= Status;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento Cadastro Unidade
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.Campos_Unidade(Status: Boolean);
begin
   Edit_Unidade.Enabled:= Status;
   Edit_NomeUnidade.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo Unidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_InserirUnidClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Inserir Unidade');

   Containers(False);
   Campos_Unidade(True);
   Funcoes.BotoesBasico( False, JvTransparentButton_InserirUnid, JvTransparentButton_AlteraUnid, JvTransparentButton_ExcluiUnid, JvTransparentButton_GravaUnid,JvTransparentButton_CancelUnid);

   Table_Unidades.Append;
   Table_Unidades.FieldByName('IdUnidade').AsString:= '';

   Edit_Unidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera unidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_AlteraUnidClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Alterar Unidade');

   Containers(False);
   Campos_Unidade(True);
   Funcoes.BotoesBasico( False, JvTransparentButton_InserirUnid, JvTransparentButton_AlteraUnid, JvTransparentButton_ExcluiUnid, JvTransparentButton_GravaUnid,JvTransparentButton_CancelUnid);

   Table_Unidades.Edit;
   Edit_Unidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui unidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_ExcluiUnidClick(Sender: TObject);
var
   VS_Comando: String;
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a Unidade e suas respectivas Sub-Unidades '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Excluir Unidade');

      VS_Comando:= 'Delete from Tab_SubUnidade where IdUnidade = '+#39+Table_Unidades.FieldByName('IdUnidade').AsString+#39;
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);

      Table_Unidades.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Edit_BuscaSiglaChange(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Curso
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_GravaUnidClick( Sender: TObject);
begin
   if trim(Edit_Unidade.Text) = '' then
   begin
      ShowMessage('O nome da Unidade não pode ser branco...');
      Edit_Unidade.SetFocus;
   end
   else
   begin
      Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Gravar Unidade');

      Campos_Unidade(False);
      Containers(True);

      Table_Unidades.Post;
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(Query_Unidade);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Curso
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_CancelUnidClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Cancelar Unidade');

   Campos_Unidade(False);
   Containers(True);

   Table_Unidades.Cancel;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento Quando a Unidade já foi cadastrada
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.Table_UnidadesPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         Showmessage('Esta unidade já foi cadastrada...');
         Abort;
         Edit_Unidade.SetFocus;
      end;
end;


//------------------------------------------------------------------------------
//
// Tratamento Sub-Unidade
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Habilita/Desabilita acesso aos campos SubUnidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.Campos_SubUnidade(Status: Boolean);
begin
   DBEdit_SubUnidade.Enabled:= Status;
   DBEdit_NomeSubUnidade.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de Inserir SubUnidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_InserirSubClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Inserir Sub-Unidade');

   Containers(False);
   Campos_SubUnidade(True);
   Funcoes.BotoesBasico( False, JvTransparentButton_InserirSub, JvTransparentButton_AlteraSub, JvTransparentButton_ExcluiSub, JvTransparentButton_GravaSub,JvTransparentButton_CancelSub);
   Table_SubUnidade.Append;
   Table_SubUnidade.FieldByName('IdUnidade').AsString:= Table_Unidades.FieldByName('IdUnidade').AsString;
   Table_SubUnidade.FieldByName('IdSubUnidade').AsString:= '';
   DBEdit_SubUnidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera SubUnidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_AlteraSubClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Alterar Sub-Unidade');

   Containers(False);
   Campos_SubUnidade(True);
   Funcoes.BotoesBasico( False, JvTransparentButton_InserirSub, JvTransparentButton_AlteraSub, JvTransparentButton_ExcluiSub, JvTransparentButton_GravaSub,JvTransparentButton_CancelSub);

   Table_SubUnidade.Edit;
   DBEdit_SubUnidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui SubUnidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_ExcluiSubClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   Funcoes.BotoesNovo01( False, JvTransparentButton_InserirSub, JvTransparentButton_AlteraSub, JvTransparentButton_ExcluiSub, JvTransparentButton_GravaSub,JvTransparentButton_CancelSub);

   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a Sub-Unidade selecionada '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Excluir Sub-Unidade');

      Table_SubUnidade.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Table_SubUnidade.Close;
      Table_SubUnidade.Open;
   end;
   Funcoes.BotoesBasico( True, JvTransparentButton_InserirSub, JvTransparentButton_AlteraSub, JvTransparentButton_ExcluiSub, JvTransparentButton_GravaSub,JvTransparentButton_CancelSub);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar SubUnidade
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_GravaSubClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Gravar Sub-Unidade');

   Campos_SubUnidade(False);
   Containers(True);
   Table_SubUnidade.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela turma
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.JvTransparentButton_CancelSubClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Unidades', 'Cancelar Sub-Unidade');

   Campos_SubUnidade(False);
   Containers(True);
   Table_SubUnidade.Cancel;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento Quando a Sub-Unidade já foi cadastrada
//------------------------------------------------------------------------------

procedure TForm_Tab_Unidades.Table_SubUnidadePostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          Showmessage('Esta sub-unidade já foi cadastrada...');
          Abort;
          DbEdit_SubUnidade.SetFocus;
       end;
end;

//-----------------------------------------------------------------------------
// Busca a sigla pelo nome da Unidade
//-----------------------------------------------------------------------------

procedure TForm_Tab_Unidades.Edit_BuscaSiglaChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select u.IdUnidade, u.Descricao From Tab_Unidade u ';

   if Trim(Edit_BuscaSigla.Text) <> '' then
      VS_Comando:= VS_Comando+' Where u.IdUnidade like '+#39+Trim(Edit_BuscaSigla.Text)+'%'+#39;

   VS_Comando:= VS_Comando+' Order by u.IdUnidade';
   Funcoes.ExecutaQuery( Query_Unidade, VS_Comando);
end;

procedure TForm_Tab_Unidades.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Unidade);
end;

end.


