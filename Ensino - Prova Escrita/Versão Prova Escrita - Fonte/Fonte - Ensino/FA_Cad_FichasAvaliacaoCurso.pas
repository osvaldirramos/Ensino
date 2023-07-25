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

unit FA_Cad_FichasAvaliacaoCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, DBCtrls, Grids, DBGrids, Buttons,
  Mask, JvToolEdit, JvEdit, JvComponent, JvGroupHeader, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, IBTable, Rotinas, Rotinas_SUE, JvCaptionPanel,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_FA_Cad_FichasAvaliacao = class(TForm)
    Panel_Treeviw: TPanel;
    JvGroupHeader_Turma: TJvGroupHeader;
    JvGroupHeader_Aluno: TJvGroupHeader;
    JvGroupHeader_Instrutor: TJvGroupHeader;
    DBGrid_Modelo: TDBGrid;
    DBGrid_Topicos: TDBGrid;
    DBGrid_ITens: TDBGrid;
    IBQuery_FAModelo: TIBQuery;
    DSQ_FAModelo: TDataSource;
    IBTable_FAModelo: TIBTable;
    DST_FAModelo: TDataSource;
    IBTable_FATopicos: TIBTable;
    DST_CadTopicos: TDataSource;
    IBTable_FAItens: TIBTable;
    DST_CadItens: TDataSource;
    IBQuery_FATopicos: TIBQuery;
    DSQ_FATopicos: TDataSource;
    IBQuery_FATopicosIDTOPICO: TSmallintField;
    IBQuery_FATopicosIDFICHA: TSmallintField;
    IBQuery_FATopicosDESCRICAO: TIBStringField;
    IBQuery_FAItens: TIBQuery;
    DSQ_FAItens: TDataSource;
    IBQuery_FAItensIDTOPICO: TSmallintField;
    IBQuery_FAItensIDFICHA: TSmallintField;
    IBQuery_FAItensIDITEM: TSmallintField;
    IBQuery_FAItensDESCRICAO: TIBStringField;
    IBQuery_FAModeloIDFICHA: TSmallintField;
    IBQuery_FAModeloMODELO: TIBStringField;
    IBQuery_FAModeloCABECALHO: TIBStringField;
    IBQuery_FAModeloINSTRUCAO: TIBStringField;
    IBTable_FAModeloIDFICHA: TSmallintField;
    IBTable_FAModeloMODELO: TIBStringField;
    IBTable_FAModeloCABECALHO: TIBStringField;
    IBTable_FAModeloINSTRUCAO: TIBStringField;
    IBTable_FATopicosIDFICHA: TSmallintField;
    IBTable_FATopicosIDTOPICO: TSmallintField;
    IBTable_FATopicosDESCRICAO: TIBStringField;
    IBTable_FAItensIDFICHA: TSmallintField;
    IBTable_FAItensIDTOPICO: TSmallintField;
    IBTable_FAItensIDITEM: TSmallintField;
    IBTable_FAItensDESCRICAO: TIBStringField;
    JvCaptionPanel_Cabecalho: TJvCaptionPanel;
    DBText1: TDBText;
    DBComboBox_Modelo: TDBComboBox;
    Label_Codigo_Curso: TLabel;
    Label_Total_Exames_Praticos: TLabel;
    DBRichEdit_Cabecalho: TDBRichEdit;
    Label4: TLabel;
    DBRichEdit_Instrucoes: TDBRichEdit;
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
    JvTransparentButton_InserirMod: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_AlterarMod: TJvTransparentButton;
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
    procedure JvTransparentButton_InserirModClick(Sender: TObject);
    procedure JvTransparentButton_AlterarModClick(Sender: TObject);
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
  Form_FA_Cad_FichasAvaliacao: TForm_FA_Cad_FichasAvaliacao;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_FA_Cad_FichasAvaliacao, ' Cadastro de Avaliação');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Fichas - Ficha de Avaliação');    // Abre o perfil do usuario em relacao a agenda

   JvCaptionPanel_Cabecalho.Left:= 393;
   JvCaptionPanel_Cabecalho.Top:= 57;

   JvCaptionPanel_Topico.Left:= 393;
   JvCaptionPanel_Topico.Top:= 57;

   JvCaptionPanel_Itens.Left:= 393;
   JvCaptionPanel_Itens.Top:= 57;

   //--- Abre as tabelas existentes

   IBQuery_FAModelo.Open;
   IBQuery_FATopicos.Open;
   IBQuery_FAItens.Open;
   IBTable_FAModelo.Open;
   IBTable_FATopicos.Open;
   IBTable_FAItens.Open;

   Campos_FichaAvaliacao(False);
   Campos_Topicos(False);
   Campos_Itens(False);

   Funcoes.BotoesBasico( True, JvTransparentButton_InserirMod, JvTransparentButton_AlterarMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);
end;

procedure TForm_FA_Cad_FichasAvaliacao.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   IBQuery_FAModelo.Close;
   IBQuery_FATopicos.Close;
   IBQuery_FAItens.Close;
   IBTable_FAModelo.Close;
   IBTable_FATopicos.Close;
   IBTable_FAItens.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_FA_Cad_FichasAvaliacao.Containers(Status: Boolean);
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

procedure TForm_FA_Cad_FichasAvaliacao.Campos_FichaAvaliacao(Status: Boolean);
begin
   DBComboBox_Modelo.Enabled:= Status;
   DBRichEdit_Cabecalho.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_InserirModClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Inserir Ficha Avaliação');
   Campos_FichaAvaliacao(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_InserirMod, JvTransparentButton_AlterarMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);

   IBTable_FAModelo.Append;
   DBComboBox_Modelo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_AlterarModClick(Sender: TObject);begin
   VS_Opcao:= 'Alterar';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Alterar Ficha Avaliação');
   Campos_FichaAvaliacao(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_InserirMod, JvTransparentButton_AlterarMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);

   IBTable_FAModelo.Edit;
   DBComboBox_Modelo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_ExcluiModClick( Sender: TObject);
var
   VI_Retorno: integer;
   VS_Comando: String;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a Ficha de Avaliação selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      VS_Comando:= 'Delete from FA_ITENS where IdFicha = '+IBTable_FAModelo.FieldByName('IdFicha').AsString;
      Funcoes.ExecusaoQuery(VS_Comando);

      VS_Comando:= 'Delete from FA_TOPICOS where IdFicha = '+IBTable_FAModelo.FieldByName('IdFicha').AsString;
      Funcoes.ExecusaoQuery(VS_Comando);

      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Excluir Ficha Avaliação');
      IBTable_FAModelo.Delete;    // Exclui o arquivo

      IBTable_FAModelo.Close;
      IBTable_FAModelo.Open;

      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(IBQuery_FAModelo);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_GravaModClick(Sender: TObject);
begin
   if  IBTable_FAModelo.FieldByName('Modelo').AsString = '' then
   begin
      Showmessage('O Modelo da Ficha de Avaliação não pode ser branco...');
      DBComboBox_Modelo.SetFocus;
   end
   else
   begin
      if VS_Opcao = 'Inserir' then
         IBTable_FAModelo.FieldByName('IdFicha').AsInteger:= Funcoes.MaiorCodigo('IdFicha', 'FA_Modelo');

      IBTable_FAModelo.Post;
      Funcoes.ExecutaTransacao;
      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Gravar Ficha Avaliação');
      Campos_FichaAvaliacao(False);
      Containers(True);
      Funcoes.BotoesBasico( True, JvTransparentButton_InserirMod, JvTransparentButton_AlterarMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);

      Funcoes.AtualizaQuery(IBQuery_FAModelo);
      DBGrid_Modelo.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancela Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_CancelModClick(Sender: TObject);
begin
   IBTable_FAModelo.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_FAMOdelo);

   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Cancelar Ficha Avaliação');
   Campos_FichaAvaliacao(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_InserirMod, JvTransparentButton_AlterarMod, JvTransparentButton_ExcluiMod, JvTransparentButton_GravaMod, JvTransparentButton_CancelMod);
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

procedure TForm_FA_Cad_FichasAvaliacao.Campos_Topicos(Status: Boolean);
begin
   DBEdit_IdTopico.Enabled:= Status;
   DBRichEdit_DescricaoTop.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_NovoTopClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Inserir Ficha Avaliação');
   Campos_Topicos(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);

   IBTable_FATopicos.Append;
   IBTable_FATopicos.FieldByName('IdTopico').AsInteger:= Funcoes.MaiorCodigoComRestricao('IdTopico', 'IdFicha = '+IBTable_FAModelo.FieldByName('IdFicha').AsString, 'FA_Topicos');

   DBRichEdit_DescricaoTop.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_AlteraTopClick(Sender: TObject);
begin
   VS_Opcao:= 'Alterar';
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Alterar Ficha Avaliação');
   Campos_Topicos(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);

   IBTable_FATopicos.Edit;
   DBRichEdit_DescricaoTop.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui o Topico da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_ExcluiTopClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Comando: String;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Tópico da Ficha de Avaliação selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      VS_Comando:= 'Delete from FA_ITENS where IdFicha = '+IBTable_FATopicos.FieldByName('IdFicha').AsString+' and IdTopico = '+IBTable_FATopicos.FieldByName('IdTopico').AsString;
      Funcoes.ExecusaoQuery(VS_Comando);

      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Excluir Ficha Avaliação');
      IBTable_FATopicos.Delete;    // Exclui o arquivo

      IBQuery_FATopicos.Close;
      IBQuery_FATopicos.Open;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar o Topico Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_GravaTopClick(Sender: TObject);
begin
   if VS_Opcao = 'Inserir' then
      IBTable_FATopicos.FieldByName('IdFicha').AsInteger:= IBTable_FAModelo.FieldByName('IdFicha').AsInteger;

   IBTable_FATopicos.Post;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery(IBQuery_FATopicos);

   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Gravar Ficha Avaliação');
   Campos_Topicos(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoTop, JvTransparentButton_AlteraTop, JvTransparentButton_ExcluiTop, JvTransparentButton_GravaTop, JvTransparentButton_CancelTop);
   DBGrid_Topicos.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancela Topico da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_CancelTopClick(Sender: TObject);
begin
   IBTable_FATopicos.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_FATopicos);

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

procedure TForm_FA_Cad_FichasAvaliacao.Campos_Itens(Status: Boolean);
begin
   DBEdit_IdItem.Enabled:= Status;
   DBRichEdit_DescricaoItem.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Item da Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_NovoItemClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Inserir Ficha Avaliação');
   Campos_Itens(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   IBTable_FAItens.Append;
   IBTable_FAItens.FieldByName('IdItem').AsInteger:= Funcoes.MaiorCodigoComRestricao('IdItem', 'IdFicha = '+IBTable_FATopicos.FieldByName('IdFicha').AsString+' and IdTopico = '+IBTable_FATopicos.FieldByName('IdTopico').AsString, 'FA_Itens');
   DBRichEdit_DescricaoItem.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Item da Ficha de Avaliação
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_AlteraItemClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Alterar Ficha Avaliação');
   Campos_Itens(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   IBTable_FAItens.Edit;
   DBRichEdit_DescricaoItem.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui o Item da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_ExcluiItemClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Item da Ficha de Avaliação selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Excluir Ficha Avaliação');
      IBTable_FAItens.Delete;    // Exclui o arquivo

      IBQuery_FAItens.Close;
      IBQuery_FAItens.Open;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar o Item da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_GravaItemClick(Sender: TObject);
begin
   IBTable_FAItens.FieldByName('IdFicha').AsInteger:= IBTable_FATopicos.FieldByName('IdFicha').AsInteger;
   IBTable_FAItens.FieldByName('IdTopico').AsInteger:= IBTable_FATopicos.FieldByName('IdTopico').AsInteger;
   IBTable_FAItens.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_FAItens);

   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Gravar Ficha Avaliação');
   Campos_Itens(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem, JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   DBGrid_ITens.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancela Itens da Ficha de Avaliacao  ---
//------------------------------------------------------------------------------

procedure TForm_FA_Cad_FichasAvaliacao.JvTransparentButton_CancelItemClick(Sender: TObject);
begin
   IBTable_FAItens.Cancel;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery(IBQuery_FAItens);
   Funcoes.GravaAcesso('Fichas - Ficha de Avaliação', 'Cancelar Ficha Avaliação');
   Campos_Itens(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_NovoItem, JvTransparentButton_AlteraItem,JvTransparentButton_ExcluiItem, JvTransparentButton_GravaItem, JvTransparentButton_CancelItem);

   DBGrid_ITens.SetFocus;
end;

procedure TForm_FA_Cad_FichasAvaliacao.DBGrid_ModeloEnter(Sender: TObject);
begin
   JvCaptionPanel_Cabecalho.Visible:= True;
   JvCaptionPanel_Topico.Visible:= False;
   JvCaptionPanel_Itens.Visible:= False;
end;

procedure TForm_FA_Cad_FichasAvaliacao.DBGrid_TopicosEnter(Sender: TObject);
begin
   JvCaptionPanel_Cabecalho.Visible:= False;
   JvCaptionPanel_Topico.Visible:= True;
   JvCaptionPanel_Itens.Visible:= False;
end;

procedure TForm_FA_Cad_FichasAvaliacao.DBGrid_ITensEnter(Sender: TObject);
begin
   JvCaptionPanel_Cabecalho.Visible:= False;
   JvCaptionPanel_Topico.Visible:= False;
   JvCaptionPanel_Itens.Visible:= True;
end;

end.
