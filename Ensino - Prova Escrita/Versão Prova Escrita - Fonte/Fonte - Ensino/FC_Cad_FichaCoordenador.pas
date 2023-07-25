//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_AvaliacaoCurso.PAS                         //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das dos Itens da Avaliação de Cursos.          //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 15/06/2009                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit FC_Cad_FichaCoordenador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, DBCtrls, Grids, DBGrids, Buttons,
  Mask, JvToolEdit, JvEdit, JvComponent, JvGroupHeader, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, IBTable, Rotinas, Rotinas_SUE, JvCaptionPanel,
  JvGradient, JvTransBtn, JvShape;

type
  TForm_FC_Cad_FichaCoordenador = class(TForm)
    Panel_Treeviw: TPanel;
    JvGroupHeader_Turma: TJvGroupHeader;
    JvGroupHeader_Aluno: TJvGroupHeader;
    JvGroupHeader_Instrutor: TJvGroupHeader;
    DBGrid_Modelo: TDBGrid;
    DBGrid_Topicos: TDBGrid;
    DBGrid_ITens: TDBGrid;
    IBQuery_FCModelo: TIBQuery;
    DSQ_FCModelo: TDataSource;
    IBTable_FCModelo: TIBTable;
    DST_FCModelo: TDataSource;
    IBTable_FCTopicos: TIBTable;
    DST_FCTopicos: TDataSource;
    IBTable_FCItens: TIBTable;
    DST_FCItens: TDataSource;
    IBQuery_FCTopicos: TIBQuery;
    DSQ_FCTopicos: TDataSource;
    IBQuery_FCItens: TIBQuery;
    DSQ_FCItens: TDataSource;
    JvCaptionPanel_Cabecalho: TJvCaptionPanel;
    Label_Codigo_Curso: TLabel;
    JvCaptionPanel_Topico: TJvCaptionPanel;
    Label1: TLabel;
    Label_Topico: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBRichEdit_DescricaoTop: TDBRichEdit;
    DBEdit_IdTopico: TDBEdit;
    JvCaptionPanel_Itens: TJvCaptionPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBRichEdit_DescricaoItem: TDBRichEdit;
    DBEdit_IdItem: TDBEdit;
    IBTable_FCModeloIDMODELO: TSmallintField;
    IBTable_FCModeloDESCRICAO: TIBStringField;
    DBText1: TDBText;
    IBTable_FCTopicosIDMODELO: TSmallintField;
    IBTable_FCTopicosIDTOPICO: TSmallintField;
    IBTable_FCTopicosDESCRICAO: TIBStringField;
    IBQuery_FCModeloIDMODELO: TSmallintField;
    IBQuery_FCModeloDESCRICAO: TIBStringField;
    IBTable_FCItensIDMODELO: TSmallintField;
    IBTable_FCItensIDTOPICO: TSmallintField;
    IBTable_FCItensIDITEM: TSmallintField;
    IBTable_FCItensDESCRICAO: TIBStringField;
    IBQuery_FCTopicosIDMODELO: TSmallintField;
    IBQuery_FCTopicosIDTOPICO: TSmallintField;
    IBQuery_FCTopicosDESCRICAO: TIBStringField;
    DBRichEdit_ModDescricao: TDBRichEdit;
    IBQuery_FCItensIDMODELO: TSmallintField;
    IBQuery_FCItensIDTOPICO: TSmallintField;
    IBQuery_FCItensIDITEM: TSmallintField;
    IBQuery_FCItensDESCRICAO: TIBStringField;
    Panel_Botoes: TPanel;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo3: TMemo;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_GravaMod: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_CancelMod: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_NovoMod: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_AlteraMod: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_ExcluiMod: TJvTransparentButton;
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    JvShape1: TJvShape;
    JvTransparentButton_GravaTop: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_CancelTop: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_NovoTop: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_AlteraTop: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_ExcluiTop: TJvTransparentButton;
    Panel2: TPanel;
    JvGradient2: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_GravaItem: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_CancelItem: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_NovoItem: TJvTransparentButton;
    JvShape11: TJvShape;
    JvTransparentButton_AlteraItem: TJvTransparentButton;
    JvShape12: TJvShape;
    JvTransparentButton_ExcluiItem: TJvTransparentButton;

    procedure Campos_FichaAvaliacao(Status: Boolean);
    procedure Campos_Topicos(Status: Boolean);
    procedure Campos_Itens(Status: Boolean);
    Procedure Containers(Status: Boolean);

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_ModeloEnter(Sender: TObject);
    procedure DBGrid_TopicosEnter(Sender: TObject);
    procedure DBGrid_ITensEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_NovoModClick(Sender: TObject);
    procedure JvTransparentButton_AlteraModClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiModClick(Sender: TObject);
    procedure JvTransparentButton_GravaModClick(Sender: TObject);
    procedure JvTransparentButton_CancelModClick(Sender: TObject);
    procedure JvTransparentButton_NovoTopClick(Sender: TObject);
    procedure JvTransparentButton_AlteraTopClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiTopClick(Sender: TObject);
    procedure JvTransparentButton_GravaTopClick(Sender: TObject);
    procedure JvTransparentButton_CancelTopClick(Sender: TObject);
    procedure JvTransparentButton_NovoItemClick(Sender: TObject);
    procedure JvTransparentButton_AlteraItemClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiItemClick(Sender: TObject);
    procedure JvTransparentButton_GravaItemClick(Sender: TObject);
    procedure JvTransparentButton_CancelItemClick(Sender: TObject);

  private    { Private declarations }
      VS_Opcao: String;
  public
    { Public declarations }
  end;

var
  Form_FC_Cad_FichaCoordenador: TForm_FC_Cad_FichaCoordenador;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.FormActivate(Sender: TObject);
begin
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
      Form_FC_Cad_FichaCoordenador.Caption:= 'SAE --> Cadastro das Fichas de Avaliação';

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Fichas - Ficha de Avaliação');    // Abre o perfil do usuario em relacao a agenda

   JvCaptionPanel_Cabecalho.Left:= 393;
   JvCaptionPanel_Cabecalho.Top:= 34;

   JvCaptionPanel_Topico.Left:= 393;
   JvCaptionPanel_Topico.Top:= 34;

   JvCaptionPanel_Itens.Left:= 393;
   JvCaptionPanel_Itens.Top:= 34;

   //--- Abre as tabelas existentes

   IBQuery_FCModelo.Open;
   IBQuery_FCTopicos.Open;
   IBQuery_FCItens.Open;
   IBTable_FCModelo.Open;
   IBTable_FCTopicos.Open;
   IBTable_FCItens.Open;

   Campos_FichaAvaliacao(False);
   Campos_Topicos(False);
   Campos_Itens(False);


   Funcoes.BotoesBasico( True, JvTransparentButton_NovoMod, JvTransparentButton_AlteraMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);
   Funcoes.BotoesBasico( True,JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_FC_Cad_FichaCoordenador.Containers(Status: Boolean);
begin
   Panel_Treeviw.Enabled:= Status;
   Panel_Botoes.Enabled:= Status;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro do Modelo de Ficha
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.Campos_FichaAvaliacao(Status: Boolean);
begin
   DBRichEdit_ModDescricao.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_NovoModClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Inserir Ficha Avaliação');
   Campos_FichaAvaliacao(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoMod, JvTransparentButton_AlteraMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);

   IBTable_FCModelo.Append;
   DBRichEdit_ModDescricao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_AlteraModClick(Sender: TObject);
begin
   VS_Opcao:= 'Alterar';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Alterar Ficha Avaliação');
   Campos_FichaAvaliacao(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoMod, JvTransparentButton_AlteraMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);

   IBTable_FCModelo.Edit;
   DBRichEdit_ModDescricao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_ExcluiModClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Comando: String;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a Ficha de Avaliação selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      VS_Comando:= 'Delete from FC_ITENS where IdModelo = '+IBTable_FCModelo.FieldByName('IdModelo').AsString;
      Funcoes.ExecusaoQuery(VS_Comando);

      VS_Comando:= 'Delete from FC_TOPICOS where IdModelo = '+IBTable_FCModelo.FieldByName('IdModelo').AsString;
      Funcoes.ExecusaoQuery(VS_Comando);

      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Excluir Ficha Avaliação');
      IBTable_FCModelo.Delete;    // Exclui o arquivo

      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(IBQuery_FCModelo);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_GravaModClick(Sender: TObject);
begin
      if VS_Opcao = 'Inserir' then
         IBTable_FCModelo.FieldByName('IdModelo').AsInteger:= Funcoes.MaiorCodigo('IdModelo', 'FC_Modelo');

      IBTable_FCModelo.Post;
      Funcoes.ExecutaTransacao;
      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Gravar Ficha Avaliação');
      Campos_FichaAvaliacao(False);
      Containers(True);
      Funcoes.BotoesBasico( True, JvTransparentButton_NovoMod, JvTransparentButton_AlteraMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);

      Funcoes.AtualizaQuery(IBQuery_FCModelo);
      DBGrid_Modelo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancela Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_CancelModClick(Sender: TObject);
begin
   IBTable_FCModelo.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_FCMOdelo);

   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Cancelar Ficha Avaliação');
   Campos_FichaAvaliacao(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoMod, JvTransparentButton_AlteraMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);
   DBGrid_Modelo.SetFocus;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro dos Topicos de Ficha
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.Campos_Topicos(Status: Boolean);
begin
   DBEdit_IdTopico.Enabled:= Status;
   DBRichEdit_DescricaoTop.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_NovoTopClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Inserir Ficha Avaliação');
   Campos_Topicos(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);

   IBTable_FCTopicos.Append;
   IBTable_FCTopicos.FieldByName('IdTopico').AsInteger:= Funcoes.MaiorCodigoComRestricao('IdTopico', 'IdModelo = '+IBTable_FCModelo.FieldByName('IdModelo').AsString, 'FC_Topicos');

   DBRichEdit_DescricaoTop.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_AlteraTopClick(Sender: TObject);
begin
   VS_Opcao:= 'Alterar';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Alterar Ficha Avaliação');
   Campos_Topicos(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);

   IBTable_FCTopicos.Edit;
   DBRichEdit_DescricaoTop.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui o Topico da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_ExcluiTopClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Comando: String;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Tópico da Ficha de Avaliação selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      VS_Comando:= 'Delete from FC_ITENS where IdModelo = '+IBTable_FCTopicos.FieldByName('IdModelo').AsString+' and IdTopico = '+IBTable_FCTopicos.FieldByName('IdTopico').AsString;
      Funcoes.ExecusaoQuery(VS_Comando);

      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Excluir Ficha Avaliação');
      IBTable_FCTopicos.Delete;    // Exclui o arquivo

      IBQuery_FCTopicos.Close;
      IBQuery_FCTopicos.Open;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar o Topico Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_GravaTopClick(Sender: TObject);
begin
   if VS_Opcao = 'Inserir' then
      IBTable_FCTopicos.FieldByName('IdModelo').AsInteger:= IBTable_FCModelo.FieldByName('IdModelo').AsInteger;

   IBTable_FCTopicos.Post;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery(IBQuery_FCTopicos);

   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Gravar Ficha Avaliação');
   Campos_Topicos(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);
   DBGrid_Topicos.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancela Topico da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_CancelTopClick(Sender: TObject);
begin
   IBTable_FCTopicos.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_FCTopicos);

   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Cancelar Ficha Avaliação');
   Campos_Topicos(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);
   DBGrid_Topicos.SetFocus;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro dos Itens dos Topicos de Ficha
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.Campos_Itens(Status: Boolean);
begin
   DBEdit_IdItem.Enabled:= Status;
   DBRichEdit_DescricaoItem.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Item da Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_NovoItemClick(Sender: TObject);begin
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Inserir Ficha Avaliação');
   Campos_Itens(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   IBTable_FCItens.Append;
   IBTable_FCItens.FieldByName('IdItem').AsInteger:= Funcoes.MaiorCodigoComRestricao('IdItem', 'IdModelo = '+IBTable_FCTopicos.FieldByName('IdModelo').AsString+' and IdTopico = '+IBTable_FCTopicos.FieldByName('IdTopico').AsString, 'FC_Itens');
   DBRichEdit_DescricaoItem.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Item da Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_AlteraItemClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Alterar Ficha Avaliação');
   Campos_Itens(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   IBTable_FCItens.Edit;
   DBRichEdit_DescricaoItem.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui o Item da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_ExcluiItemClick( Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Item da Ficha de Avaliação selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Excluir Ficha Avaliação');
      IBTable_FCItens.Delete;    // Exclui o arquivo

      IBQuery_FCItens.Close;
      IBQuery_FCItens.Open;

      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar o Item da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_GravaItemClick(Sender: TObject);
begin
   IBTable_FCItens.FieldByName('IdModelo').AsInteger:= IBTable_FCTopicos.FieldByName('IdModelo').AsInteger;
   IBTable_FCItens.FieldByName('IdTopico').AsInteger:= IBTable_FCTopicos.FieldByName('IdTopico').AsInteger;
   IBTable_FCItens.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_FCItens);

   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Gravar Ficha Avaliação');
   Campos_Itens(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   DBGrid_ITens.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancela Itens da Ficha de Avaliacao  ---
//------------------------------------------------------------------------------

procedure TForm_FC_Cad_FichaCoordenador.JvTransparentButton_CancelItemClick(Sender: TObject);
begin
   IBTable_FCItens.Cancel;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery(IBQuery_FCItens);
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Cancelar Ficha Avaliação');
   Campos_Itens(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   DBGrid_ITens.SetFocus;
end;

procedure TForm_FC_Cad_FichaCoordenador.DBGrid_ModeloEnter(Sender: TObject);
begin
   JvCaptionPanel_Cabecalho.Visible:= True;
   JvCaptionPanel_Topico.Visible:= False;
   JvCaptionPanel_Itens.Visible:= False;
end;

procedure TForm_FC_Cad_FichaCoordenador.DBGrid_TopicosEnter(Sender: TObject);
begin
   JvCaptionPanel_Cabecalho.Visible:= False;
   JvCaptionPanel_Topico.Visible:= True;
   JvCaptionPanel_Itens.Visible:= False;
end;

procedure TForm_FC_Cad_FichaCoordenador.DBGrid_ITensEnter(Sender: TObject);
begin
   JvCaptionPanel_Cabecalho.Visible:= False;
   JvCaptionPanel_Topico.Visible:= False;
   JvCaptionPanel_Itens.Visible:= True;
end;

procedure TForm_FC_Cad_FichaCoordenador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_FCItens.Close;
   IBQuery_FCItens.Close;
   IBTable_FCTopicos.Close;
   IBQuery_FCTopicos.Close;
   IBTable_FCModelo.Close;
   IBQuery_FCModelo.Close;
    Action:= caFree;
end;
end.
