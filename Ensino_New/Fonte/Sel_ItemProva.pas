//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_ItemProva.PAS                              //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos Itens da Prova.                            //
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

unit Sel_ItemProva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas,Rotinas_SUE, JvDlg,
  JvGrdCpt, DB, IBCustomDataSet, IBTable, Variants,
  IBQuery, JvClock, DBGrids, JvDBRichEd, Mask, JvGradient, TeEngine,
  Series, TeeProcs, Chart, DbChart, PsyRichEdit, JvEnterTab, JvEdit,
  JvCaptionPanel, JvShape, JvxClock, JvxCtrls, JvLookOut, JvLabel,
  JvBlinkingLabel, JvTransBtn, JvGradientCaption;

type
  TForm_Sel_ItemProva = class(TForm)
    Query_MontaMateria: TIBQuery;
    Query_MontaMateriaIDCURSO: TSmallintField;
    Query_MontaMateriaCODMATERIA: TIBStringField;
    Query_MontaMateriaNOMEMATERIA: TIBStringField;
    DSQ_MontaMateria: TDataSource;
    Query_ItemNUMITEM: TIntegerField;
    Query_ItemIDCURSO: TSmallintField;
    Query_ItemCODMATERIA: TIBStringField;
    Query_ItemDISCIPLINA: TIBStringField;
    Query_ItemUNIDADE: TIBStringField;
    Query_ItemSUBUNIDADE: TIBStringField;
    Query_ItemOBJETIVO: TIBStringField;
    Query_ItemSERIE: TIBStringField;
    DSQ_Item: TDataSource;
    Panel_Area: TPanel;
    Panel_Container: TPanel;
    PopupMenu_Relatorio: TPopupMenu;
    ImprimirItemSelecionado: TMenuItem;
    ImprimiraListadeItens: TMenuItem;
    Query_Item: TIBQuery;
    Panel_Funcoes: TPanel;
    Query_MontaMateriaIDTURMA: TIntegerField;
    Query_ItemIDTURMA: TIntegerField;
    IBTable_Item_Desc: TIBTable;
    DST_ItemDesc: TDataSource;
    Query_MontaMateriaNUMEROAULASTEORICAS: TSmallintField;
    Query_MontaMateriaNUMEROAULASPRATICAS: TSmallintField;
    IBTable_Item_Prova: TIBTable;
    IBTable_Item_ProvaIDCURSO: TSmallintField;
    IBTable_Item_ProvaIDTURMA: TIntegerField;
    IBTable_Item_ProvaNUMITEM: TIntegerField;
    IBTable_Item_ProvaCODMATERIA: TIBStringField;
    IBTable_Item_ProvaDISCIPLINA: TIBStringField;
    IBTable_Item_ProvaUNIDADE: TIBStringField;
    IBTable_Item_ProvaSUBUNIDADE: TIBStringField;
    IBTable_Item_ProvaOBJETIVO: TIBStringField;
    IBTable_Item_ProvaQUARENTENA: TDateTimeField;
    IBTable_Item_ProvaSERIE: TIBStringField;
    JvCaptionPanel_Atencao: TJvCaptionPanel;
    Memo_Msg: TMemo;
    JvShape4: TJvShape;
    JvExpressButton_SomenteSelecionado: TJvExpressButton;
    JvShape3: TJvShape;
    JvShape5: TJvShape;
    JvExpressButton_TodosCursos: TJvExpressButton;
    JvExpressButton_CancelarExclusao: TJvExpressButton;
    ImageList_SituacaoItem: TImageList;
    Query_ItemSTATUS: TIBStringField;
    JvCaptionPanel_PesqItem: TJvCaptionPanel;
    Memo_PesqItem: TMemo;
    Panel1: TPanel;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvGradient_Menu: TJvGradient;
    Label_DescricaoCurso: TLabel;
    IBTable_Item_ProvaSTATUS: TIBStringField;
    Panel_Pesquisa: TPanel;
    DBGrid_Item: TDBGrid;
    ToolBar_Pesquisar: TToolBar;
    JvEdit_Objetivo: TJvEdit;
    JvEdit_Serie: TJvEdit;
    DBNavigator_Sel_Item: TDBNavigator;
    JvCaptionPanel_Ferramentas: TJvCaptionPanel;
    JvTransparentButton_Fechar_Ferramenta: TJvTransparentButton;
    Panel_Trata_Item: TPanel;
    JvCaptionPanel_Relatorios_Imprimir: TJvCaptionPanel;
    JvTransparentButton_FecharRelatorios: TJvTransparentButton;
    Query_Item_Historico: TIBQuery;
    Query_Item_HistoricoDATA: TDateTimeField;
    Query_Item_HistoricoID: TIntegerField;
    Query_Item_HistoricoATIVIDADE: TIBStringField;
    Query_Item_HistoricoUSUARIO: TIBStringField;
    DST_ItemHistorico: TDataSource;
    IBQuery_IndiceItem: TIBQuery;
    IBQuery_IndiceItemNUMITEM: TIntegerField;
    IBQuery_IndiceItemDATAAVALIACAO: TDateTimeField;
    IBQuery_IndiceItemINDICEFACILIDADE: TIBBCDField;
    IBQuery_IndiceItemINDICEDIFERENCIACAO: TIBBCDField;
    IBQuery_IndiceItemINDICEOBJETIVIDADE: TIBBCDField;
    IBQuery_IndiceItemBRANCOS: TIntegerField;
    IBQuery_IndiceItemTOTALALUNOS: TIntegerField;
    DSQ_IndiceItem: TDataSource;
    IBQuery_EstetisticaItens: TIBQuery;
    IBQuery_EstetisticaItensNUMITEM: TIntegerField;
    JvCaptionPanel_Disciplina: TJvCaptionPanel;
    DBNavigator_Disciplina: TDBNavigator;
    ToolBar_Disciplina: TToolBar;
    JvEdit_NomeMateria: TJvEdit;
    DBGrid_Disciplina: TDBGrid;
    JvEdit_Disciplina: TJvEdit;
    JvEdit_NItem: TJvEdit;
    JvEdit_Disc: TJvEdit;
    JvEdit_unid: TJvEdit;
    JvEdit_SubUnid: TJvEdit;
    JvShape1: TJvShape;
    JvTransparentButton_FecharPesquisaItem: TJvTransparentButton;
    JvShape_EncerrarProva: TJvShape;
    JvTransparentButton_RelatoriosImprimir: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape11: TJvShape;
    JvTransparentButton_Ferramentas: TJvTransparentButton;
    Panel_Frame_SelCurso: TPanel;
    Panel_Botoes_Cadastro: TPanel;
    JvGradient_Botoes: TJvGradient;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Novo: TJvTransparentButton;
    JvShape_Revisar_Item: TJvShape;
    JvTransparentButton_Editar: TJvTransparentButton;
    JvShape_Excluir_Item: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    JvShape_Excluir_Todos: TJvShape;
    JvTransparentButton_Excluir_Todos: TJvTransparentButton;
    Panel_ItemProva: TPanel;
    DBRichEdit_Observacao: TDBRichEdit;
    JvDBRichEdit_Text: TJvDBRichEdit;
    JvTransparentButton_Rel_ItemSelecionado: TJvTransparentButton;
    JvTransparentButton_Rel_ListaItens: TJvTransparentButton;
    JvTransparentButton_VizuItem: TJvTransparentButton;
    JvTransparentButton_Pesquisar_Item: TJvTransparentButton;
    Label1: TLabel;
    Label3: TLabel;
    JvTransparentButton_Trocar: TJvTransparentButton;
    JvTransparentButton_CopiaItem: TJvTransparentButton;
    JvTransparentButton_Copiar_Item_Para_Turma_Base: TJvTransparentButton;
    JvTransparentButton_AjustarItemSelecionado: TJvTransparentButton;
    Label5: TLabel;
    JvTransparentButton_PesquisarPeloHistorico: TJvTransparentButton;
    JvTransparentButton_NumeroItensPorDisciplina: TJvTransparentButton;
    JvTransparentButton_EstatisticaItemSelecionado: TJvTransparentButton;
    JvTransparentButton_DisponibilizarItens: TJvTransparentButton;
    JvTransparentButton_DisponibilizarTodosItensDasDisciplinas: TJvTransparentButton;
    MaskEdit_BuscaItem: TMaskEdit;
    MaskEdit_DiscAtual: TMaskEdit;
    MaskEdit_Frase: TMaskEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Panel_Informacoes_Iten: TPanel;
    JvCaptionPanel_HistoricoItem: TJvCaptionPanel;
    DBGrid_Historico: TDBGrid;
    JvCaptionPanel_EstatisticaItem_: TJvCaptionPanel;
    JvGradient_Estatistica: TJvGradient;
    Image_Facill: TImage;
    LabelResultado: TLabel;
    Image_Medio: TImage;
    Image_Dificel: TImage;
    GroupBox_NItens_: TGroupBox;
    Label_QtdItens: TLabel;
    GroupBox_NumeroItensIdeal: TGroupBox;
    Label_NItensIdeal: TLabel;
    GroupBox1: TGroupBox;
    Label_Facil: TLabel;
    Label_Medio: TLabel;
    Label_Dificil: TLabel;
    Chart1: TChart;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Query_Item_Local: TIBQuery;
    DSQ_Item_Local: TDataSource;
    IBTable_Item_Desc_Local: TIBTable;
    IntegerField5: TIntegerField;
    IBStringField15: TIBStringField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    IBStringField16: TIBStringField;
    SmallintField6: TSmallintField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    BlobField1: TBlobField;
    DataSource2: TDataSource;
    IBTable_Item_DescNUMITEM: TIntegerField;
    IBTable_Item_DescRESPOSTACORRETA: TIBStringField;
    IBTable_Item_DescQDEAPLIC: TSmallintField;
    IBTable_Item_DescQDEIRREGULARIDADE: TSmallintField;
    IBTable_Item_DescQDEANULADA: TSmallintField;
    IBTable_Item_DescNLINHAS: TSmallintField;
    IBTable_Item_DescPOSSUI_IMAGEM: TIBStringField;
    IBTable_Item_DescRECURSO: TIBStringField;
    IBTable_Item_DescTEMPORES: TIBStringField;
    IBTable_Item_DescOBSERVACAO: TIBStringField;
    IBTable_Item_DescDESCENALT: TBlobField;
    Query_Item_LocalIDCURSO: TSmallintField;
    Query_Item_LocalIDTURMA: TIntegerField;
    Query_Item_LocalNUMITEM: TIntegerField;
    Query_Item_LocalCODMATERIA: TIBStringField;
    Query_Item_LocalDISCIPLINA: TIBStringField;
    Query_Item_LocalUNIDADE: TIBStringField;
    Query_Item_LocalSUBUNIDADE: TIBStringField;
    Query_Item_LocalOBJETIVO: TIBStringField;
    Query_Item_LocalSERIE: TIBStringField;
    Query_Item_LocalSTATUS: TIBStringField;
    IBTable_VerItem: TIBTable;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    DataSource1: TDataSource;
    IBTable_Item_ProvaNUMITEM_OLD: TSmallintField;
    IBTable_Item_ProvaIDENTIDADE: TIBStringField;
    IBTable_Item_DescRESULTADO_PROVA: TIBStringField;
    IBTable_Item_DescPADRAO_PROVA: TIBStringField;

    Function ItemCompoeProva(VS_NumItem: String): Boolean;

    procedure EstatisticaItens;
    Procedure TratarNumeroKeyPress(Sender: TObject;var Key: Char);
    procedure TratarLetraKeyPress(Sender: TObject;var Key: Char);

    procedure DefinirTurma(Cor : TColor; Status: boolean);

    Function VerificaSerie: String;

    procedure ImprimirItem(VS_Opcao: String);
    procedure Containers(status: Boolean);

    procedure LimparConsulta;
    procedure MontaMateria(Sender: TObject);

    procedure MontaItem(Sender: TObject);
    procedure Consulta;
    procedure Finalizar;

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_ItemTitleClick(Column: TColumn);
    procedure DBGrid_ItemDblClick(Sender: TObject);
    procedure DBGrid_DisciplinaTitleClick(Column: TColumn);
    procedure SpeedButton_AtualizaMateriaClick(Sender: TObject);
    procedure SpeedButton_AtualizaCadItensClick(Sender: TObject);
    procedure MaskEdit_BuscaItemExit(Sender: TObject);
    procedure MaskEdit_BuscaItemKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_DiscAtualChange(Sender: TObject);
    procedure Query_MontaMateriaAfterScroll(DataSet: TDataSet);
    procedure DBGrid_DisciplinaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvExpressButton_SomenteSelecionadoClick(Sender: TObject);
    procedure JvExpressButton_TodosCursosClick(Sender: TObject);
    procedure JvExpressButton_CancelarExclusaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RelatoriosImprimirClick(Sender: TObject);
    procedure JvTransparentButton_FecharRelatoriosClick(Sender: TObject);
    procedure JvTransparentButton_Rel_ItemSelecionadoClick(Sender: TObject);
    procedure JvTransparentButton_Rel_ListaItensClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_NovoClick(Sender: TObject);
    procedure JvTransparentButton_EditarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_Excluir_TodosClick(Sender: TObject);
    procedure JvTransparentButton_VizuItemClick(Sender: TObject);
    procedure JvTransparentButton_Fechar_FerramentaClick(Sender: TObject);
    procedure JvTransparentButton_FerramentasClick(Sender: TObject);
    procedure JvTransparentButton_TrocarClick(Sender: TObject);
    procedure JvTransparentButton_CopiaItemClick(Sender: TObject);
    procedure JvTransparentButton_Copiar_Item_Para_Turma_BaseClick(Sender: TObject);
    procedure JvTransparentButton_AjustarItemSelecionadoClick(Sender: TObject);
    procedure IBQuery_IndiceItemAfterScroll(DataSet: TDataSet);
    procedure JvTransparentButton_NumeroItensPorDisciplinaClick(Sender: TObject);
    procedure JvTransparentButton_EstatisticaItemSelecionadoClick( Sender: TObject);
    procedure JvTransparentButton_DisponibilizarItensClick(Sender: TObject);
    procedure JvTransparentButton_FecharPesquisaItemClick(Sender: TObject);
    procedure JvTransparentButton_DisponibilizarTodosItensDasDisciplinasClick( Sender: TObject);

  private
    VS_OrderByMateria, VS_OrderBy: String;
    VB_TratarMateria: Boolean;
    bmLocal : TBookmark;

  public
    VS_IdCurso, VS_IdTurma: String;
    VS_Opcao_Rel, VS_Opcao, VS_OPCRelItem: string;
  end;

var
  Form_Sel_ItemProva: TForm_Sel_ItemProva;

implementation

uses Frame_Sel_Curso, Module, MenuPrincipal, Sel_Disciplina,
  Preview_de_Relatorios, CopiaItemParaOutroCurso, Fer_AjustarItem,
  Cad_ItemProva, Conflito_Item, EstatisticaItem, IndiceFacilidadeItem,
  Cad_Item_Prova;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando ativar a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal')) then
   begin
      Form_Sel_ItemProva.Color:= Cor_Tela;
      JvGradient_Menu.StartColor:= Cor_Tela;
      JvGradient_Botoes.StartColor:= Cor_Tela;
      JvGradient_Estatistica.StartColor:= Cor_Tela;

      if ((DM.Query_Usuario.FieldByName('Secao').AsString = 'EAVA') or (DM.Query_Usuario.FieldByName('Secao').AsString = 'ADMINISTRAÇÃO')) then
      begin
         JvTransparentButton_DisponibilizarItens.Visible:= True;
         JvTransparentButton_DisponibilizarTodosItensDasDisciplinas.Visible:= True;
      end
      else
      begin
         JvTransparentButton_DisponibilizarItens.Visible:= False;
         JvTransparentButton_DisponibilizarTodosItensDasDisciplinas.Visible:= False;
      end;

      LabelResultado.Caption:= '';
      JvEdit_Disciplina.Text:= '';
      JvEdit_NomeMateria.Text:= '';
      JvEdit_NItem.Text:= '';
      JvEdit_Disc.Text:= '';
      JvEdit_unid.Text:= '';
      JvEdit_SubUnid.Text:= '';
      JvEdit_Objetivo.Text:= '';
      JvEdit_Serie.Text:= '';

      VB_TratarMateria:= True;
      Funcoes.SetTransfItem('Iniciar');
      Funcoes.CabecalhoForm(Form_Sel_ItemProva, 'Cadastro de Itens de Prova');
      JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
      JvCaptionPanel_Ferramentas.Visible:= False;

      VS_OrderByMateria:= ' Order By CodMateria ';

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Item Prova');
      Panel_ItemProva.Visible:= True;
      JvCaptionPanel_Atencao.Visible:= False;
      JvCaptionPanel_PesqItem.Visible:= False;

      //--- Abre as tabelas existentes

      IBQuery_EstetisticaItens.Open;
      Query_Item_Historico.Open;
      IBQuery_IndiceItem.Open;
      Query_Item.Open;
      IBTable_Item_Desc.Open;

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Sel_ItemProva.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Inserir Itens Prova Base', 'Inserir Itens de Prova da turma Base para Turma selecionada');

      Funcoes.SetCadCurso('CadCurso');
      VS_Opcao:= 'Inicializacao';
      MontaMateria(Sender);
      VS_Opcao:= 'Consulta';
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento das Areas de TrabalhoO botao de atualizcao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.Containers(status: Boolean);
begin
//   DBGrid_Disciplina.Enabled:= status;
   Panel_Container.Enabled:= status;
end;

//------------------------------------------------------------------------------
// Tratamento dO botao de atualizcao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_MontaMateria);
   Funcoes.AtualizaQuery(Query_Item);
end;

//------------------------------------------------------------------------------
// Procedure para tratar a selecao da Turma Base
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.DefinirTurma(Cor : TColor; Status: Boolean);
begin
   JvTransparentButton_Novo.Enabled:= Status;
   JvShape_Excluir_Todos.Visible:= Status;
   JvTransparentButton_Excluir_Todos.Visible:= Status;

   if Status = True then
   begin
      Panel_Botoes_Cadastro.Height:= 120;
      Status:= False;
   end
   else
   begin
      Panel_Botoes_Cadastro.Height:= 60;
      Status:= True;
   end;

   DBGrid_Disciplina.Color:= Cor;
   JvEdit_Disciplina.Color:= Cor;
   JvEdit_NomeMateria.Color:= Cor;
end;

//------------------------------------------------------------------------------
//--- Monta query de selecao de Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MontaMateria;
var
   VS_Comando: string;
begin
   if DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString = '' then
      VS_IdTurma:= '0'
   else
      VS_IdTurma:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;

   VS_Comando:= 'Select IdCurso, IdTurma, CodMateria, NomeMateria, NumeroAulasTeoricas, NumeroAulasPraticas '+
                ' from MateriaCurso '+
                ' where IdCurso = :IdCurso '+
                ' and   IdTurma = :IdTurma';

   if trim(JvEdit_Disciplina.Text) <> '' then
      VS_Comando:= VS_Comando+' and CodMateria like '+#39+JvEdit_Disciplina.Text+'%'+#39;

   if trim(JvEdit_NomeMateria.Text) <> '' then
      VS_Comando:= VS_Comando+' and NomeMateria like '+#39+JvEdit_NomeMateria.Text+'%'+#39;

   Funcoes.SetDisciplina(JvEdit_Disciplina.Text);
   Funcoes.ExecutaQuery(Query_MontaMateria, VS_Comando+VS_OrderByMateria);

   if Query_MontaMateria.FieldByName('IdCurso').AsString = '' then
   begin
      if VS_Opcao = 'Inicializacao' then
         ShowMessage('A Turma Selecionada não possuí Disciplina Cadastrada...');
      Query_Item.Close;
      Containers(False);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Ordenacao do Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.DBGrid_DisciplinaTitleClick(Column: TColumn);
var
   Sender: TObject;
begin
   if column.Title.Caption = 'Disciplina' then
       VS_OrderByMateria:= ' order by CodMateria'
   else
     if trim(column.Title.Caption) = 'Descrição' then
         VS_OrderByMateria:= ' order by NomeMateria, CodMateria';
   MontaMateria(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento 
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.Consulta;
var
   Sender: TObject;
begin
   VS_OrderBy:= ' disciplina,unidade,subunidade,objetivo,serie';
   MontaItem(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para realizar o filtro na consulta
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Atualiza o Cadastro de Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.SpeedButton_AtualizaMateriaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_MontaMateria);
end;

//------------------------------------------------------------------------------
// Atualiza O Cadastro dos Itens
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.SpeedButton_AtualizaCadItensClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Item);
end;

//------------------------------------------------------------------------------
// Executa a pesquisa
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MontaItem(Sender: TObject);
var
   VS_Comando: String;
begin
   Query_MontaMateria.Open;
   if Query_MontaMateria.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage('A Turma Selecionada não possuí Disciplina Cadastrada...');
      Query_Item.Close;
      Containers(False);
   end
   else
    begin
       Containers(True);
{
       if trim(MaskEdit_Frase.Text) <> '' then
          VS_Comando:= 'select p.IdCurso, p.IdTurma, p.NumItem, p.CodMateria, p.Disciplina, p.Unidade, p.SubUnidade, p.Objetivo, p.Serie, p.Status '+
                      ' From Item_Prova p, Item_Desc d '+
                      ' where p.idCurso = :IdCurso '+
                      ' and p.IdTurma = :IdTurma '+
                      ' and p.codMateria = :CodMateria '+
                      ' and p.Status <> '+#39+Excluido+#39+
                      ' and p.NumItem = d.NumItem '+
                      ' and UPPER(d.Observacao) Like UPPER('+#39+'%'+trim(UpperCase(MaskEdit_Frase.Text))+'%'+#39+')'
       else
          VS_Comando:= 'select p.IdCurso, p.IdTurma, p.NumItem, p.CodMateria, p.Disciplina, p.Unidade, p.SubUnidade, p.Objetivo, p.Serie, p.Status '+
                      ' From Item_Prova p '+
                      ' where p.idCurso = :IdCurso '+
                      ' and p.IdTurma = :IdTurma '+
                      ' and p.codMateria = :CodMateria '+
                      ' and p.Status <> '+#39+Excluido+#39;      // Os itens com Status E são itens excluidos
}


       if trim(MaskEdit_Frase.Text) <> '' then
          VS_Comando:= 'select p.IdCurso, p.IdTurma, p.NumItem, p.CodMateria, p.Disciplina, p.Unidade, p.SubUnidade, p.Objetivo, p.Serie, p.Status '+
                      ' From Item_Prova p, Item_Desc d '+
                      ' where p.idCurso = '+Query_MontaMateria.FieldByName('IdCurso').AsString+
                      ' and p.IdTurma = '+Query_MontaMateria.FieldByName('IdTurma').AsString+
                      ' and p.codMateria = '+#39+Query_MontaMateria.FieldByName('codMateria').AsString+#39+
//                      ' and p.Status <> '+#39+Excluido+#39+
                      ' and p.NumItem = d.NumItem '+
                      ' and UPPER(d.Observacao) Like UPPER('+#39+'%'+trim(UpperCase(MaskEdit_Frase.Text))+'%'+#39+')'
       else
          VS_Comando:= 'select p.IdCurso, p.IdTurma, p.NumItem, p.CodMateria, p.Disciplina, p.Unidade, p.SubUnidade, p.Objetivo, p.Serie, p.Status '+
                      ' From Item_Prova p '+
                      ' where p.idCurso = '+Query_MontaMateria.FieldByName('IdCurso').AsString+
                      ' and p.IdTurma = '+Query_MontaMateria.FieldByName('IdTurma').AsString+
                      ' and p.codMateria = '+#39+Query_MontaMateria.FieldByName('codMateria').AsString+#39;
//   ' and p.Status <> '+#39+Excluido+#39;      // Os itens com Status E são itens excluidos

      if trim(JvEdit_NItem.Text) <> '' then
         VS_Comando:= VS_Comando+' and p.NumItem = '+trim(JvEdit_NItem.Text);

      if trim(JvEdit_Disc.Text) <> '' then
         VS_Comando:= VS_Comando+' and p.Disciplina Like '+#39+trim(JvEdit_Disc.Text)+'%'+#39;

      if trim(JvEdit_unid.Text) <> '' then
         VS_Comando:= VS_Comando+' and p.Unidade Like '+#39+trim(JvEdit_unid.Text)+'%'+#39;

      if trim(JvEdit_Objetivo.Text) <> '' then
         VS_Comando:= VS_Comando+' and p.Objetivo Like '+#39+trim(UpperCase(JvEdit_Objetivo.Text))+'%'+#39;


      if trim(JvEdit_SubUnid.Text) <> '' then
         VS_Comando:= VS_Comando+' and p.SubUnidade Like '+#39+trim(JvEdit_SubUnid.Text)+'%'+#39;

      if trim(JvEdit_Serie.Text) <> '' then
         VS_Comando:= VS_Comando+' and p.Serie Like '+#39+trim(JvEdit_Serie.Text)+'%'+#39;

      Funcoes.ExecutaQuery( Query_Item, VS_Comando+' Order by '+VS_OrderBy);
   end;
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.DBGrid_ItemTitleClick(Column: TColumn);
var
   Sender: TObject;
begin
   if column.Title.Caption = 'Nº Item' then
       VS_OrderBy:= 'p.NumItem'
   else
     if trim(column.Title.Caption) = 'Disciplina' then
         VS_OrderBy:= 'p.Disciplina'
     else
        if trim(column.Title.Caption) = 'Unidade' then
            VS_OrderBy:= 'p.Unidade'
        else
           if trim(column.Title.Caption) = 'SubUnidade' then
              VS_OrderBy:= 'p.SubUnidade'
           else
              if trim(column.Title.Caption) = 'Objetivo' then
                  VS_OrderBy:= 'p.Objetivo'
              else
                 if trim(column.Title.Caption) = 'Série' then
                    VS_OrderBy:= 'p.Serie';
   MontaItem(Sender);
end;


//------------------------------------------------------------------------------
// Tratamento do relatorio de item de prova
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_Rel_ItemSelecionadoClick(Sender: TObject);
begin
   ImprimirItem('Atual');
end;

//------------------------------------------------------------------------------
// Imprime a lista selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_Rel_ListaItensClick(Sender: TObject);
begin
   ImprimirItem('Todos');
end;

//------------------------------------------------------------------------------
// Procedure para tratar a impressao do item selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.ImprimirItem(VS_Opcao: String);
begin
   if Query_Item.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não possuí item cadastrado para esta disciplina...')
   else
   begin
      VS_OPCRelItem:= VS_Opcao;
      Application.CreateForm(TForm_PreviewRel, Form_PreviewRel);
      Form_PreviewRel.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Duplo Clique na grid de selecao do Item
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.DBGrid_ItemDblClick(Sender: TObject);
begin
   JvTransparentButton_Rel_ItemSelecionadoClick(Sender);
end;

//------------------------------------------------------------------------------
// Permite buscar o Item pelo Numero
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MaskEdit_BuscaItemExit(Sender: TObject);
var
   VS_Turma, VS_Exluido: String;
begin
   if Trim(MaskEdit_BuscaItem.Text) = '' then
   begin
      ShowMessage('Não foi fornecido o número do item para consulta...');
      DBGrid_Disciplina.SetFocus;
   end
   else
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select NomeUsuario, Data From Item_Excluido Where NumItem = '+MaskEdit_BuscaItem.Text);

      if DM.IBQuery_Executa.FieldByName('NomeUsuario').AsString <> '' then
         ShowMessage('O Item '+MaskEdit_BuscaItem.Text+' foi Excluido pelo '+DM.IBQuery_Executa.FieldByName('NomeUsuario').AsString+' em '+DM.IBQuery_Executa.FieldByName('Data').AsString)
      else
      begin
         Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select i.IdCurso, i.IdTurma, i.NumItem, i.CodMateria, i.Disciplina, i.Unidade, i.SubUnidade, i.Objetivo, i.Serie, i.Status, '+
                                                     ' c.CodCurso, c.Turma, c.ano '+
                                                     ' From Item_Prova i, TURMAS_TODAS_VIEW c '+
                                                     ' Where i.IdCurso = c.IdCurso '+
                                                     ' and i.IdTurma = c.IdTurma '+
                                                     ' and i.NUMITEM = '+MaskEdit_BuscaItem.Text+
                                                     ' order by c.CodCurso, c.IdTurma '
                             );

         if DM.IBQuery_Executa.FieldByName('NumItem').AsString = '' then
            ShowMessage('O Item '+MaskEdit_BuscaItem.Text+' não encontra-se cadastrado...')
         else
         begin
            JvCaptionPanel_Ferramentas.Visible:= False;
            JvCaptionPanel_PesqItem.Caption:= 'Relação de Curso e Turmas que o Item '+MaskEdit_BuscaItem.Text+' pertence';
            JvCaptionPanel_PesqItem.Left:= 408;
            JvCaptionPanel_PesqItem.Top:= 192;
            JvCaptionPanel_PesqItem.Height:= 561;
            JvCaptionPanel_PesqItem.Width:= 647;
            JvCaptionPanel_PesqItem.Visible:= True;
            Memo_PesqItem.Lines.Clear;
            Memo_PesqItem.Lines.Add('O Item nº - '+DM.IBQuery_Executa.FieldByName('NumItem').AsString+' encontra-se cadastrado nos seguintes Cursos/Turma: ');
            Memo_PesqItem.Lines.Add('');

            DM.IBQuery_Executa.First;
            While not DM.IBQuery_Executa.Eof do
            begin
               if DM.IBQuery_Executa.FieldByName('Status').AsString = 'E' then
                  VS_Exluido:= '(Item Excluido da Turma)'
               else
                  VS_Exluido:= '';

               if DM.IBQuery_Executa.FieldByName('IdTurma').Asinteger = 0 then
                  VS_Turma:= 'Base'
               else
                  VS_Turma:= DM.IBQuery_Executa.FieldByName('Turma').AsString+', Ano - '+DM.IBQuery_Executa.FieldByName('Ano').AsString;

                Memo_PesqItem.Lines.Add('Curso  - '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+
                                        ', Turma - '+VS_Turma+
                                        ', Disciplina - '+DM.IBQuery_Executa.FieldByName('CodMateria').AsString+
                                        ', Objetivo - '+DM.IBQuery_Executa.FieldByName('Objetivo').AsString+
                                        ', Série - '+DM.IBQuery_Executa.FieldByName('Serie').AsString+
                                        ' '+VS_Exluido);
                DM.IBQuery_Executa.Next;
            end;
            Memo_PesqItem.SetFocus;
            Memo_PesqItem.SelStart := Perform(EM_LINEINDEX, 1, 0);
         end;
      end;
   end;
   MaskEdit_BuscaItem.Text:= '';
end;

procedure TForm_Sel_ItemProva.MaskEdit_BuscaItemKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      MaskEdit_BuscaItemExit(Sender);
end;

//------------------------------------------------------------------------------
// Chama a Form que trata da Copia de um Item para Outro
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_CopiaItemClick(Sender: TObject);
begin
   if Query_Item.FieldByName('IdCurso').AsString = '' then
      ShowMessage('A Disciplina não possuí item Cadastrado para ser copiado...')
   else
   begin
      Form_Sel_ItemProva.Width:= 575;
      Application.CreateForm(TForm_CopiaItemParaOutroCurso, Form_CopiaItemParaOutroCurso);
      Form_CopiaItemParaOutroCurso.Show;
      LimparConsulta;
      JvTransparentButton_AtualizaClick(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Limpa a caixa de Filtro
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.LimparConsulta;
begin
   JvEdit_NItem.Text:= '';
   JvEdit_Disc.Text:= '';
   JvEdit_Unid.Text:= '';
   JvEdit_SubUnid.Text:= '';
   JvEdit_Objetivo.Text:= '';
   JvEdit_Serie.Text:= '';
end;

//------------------------------------------------------------------------------
// Tratamento para entrada da Disciplina Atual
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MaskEdit_DiscAtualChange(Sender: TObject);
begin
   if length(MaskEdit_DiscAtual.Text) = 6 then
      JvTransparentButton_Trocar.Enabled:= True
   else
      JvTransparentButton_Trocar.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para trocar a disciplina selecionada par aa informada
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_TrocarClick(Sender: TObject);
var
   VS_Serie: String;
begin
   if trim(MaskEdit_DiscAtual.Text) = '' then
   begin
      ShowMessage('Não foi fornecido a disciplina...');
      MaskEdit_DiscAtual.SetFocus;
   end
   else
   begin
      Query_Item.First;
      While not Query_Item.Eof do
      begin
         VS_Serie:= Funcoes.VerificaSerie(Query_Item.FieldByName('IdCurso').AsString, Query_Item.FieldByName('IdTurma').AsString, MaskEdit_DiscAtual.Text,
         Copy(MaskEdit_DiscAtual.Text,1,2), Copy(MaskEdit_DiscAtual.Text,3,2), Copy(MaskEdit_DiscAtual.Text,5,2), Query_Item.FieldByName('Objetivo').AsString);

         Funcoes.ExecusaoQuery( 'update Item_Prova set codmateria = '+#39+MaskEdit_DiscAtual.Text+#39+' , '+
                                                     ' Disciplina = '+#39+Copy(MaskEdit_DiscAtual.Text,1,2)+#39+' , '+
                                                     ' Unidade = '+#39+Copy(MaskEdit_DiscAtual.Text,3,2)+#39+' , '+
                                                     ' SubUnidade = '+#39+Copy(MaskEdit_DiscAtual.Text,5,2)+#39+' , '+
                                                     ' serie = '+#39+VS_Serie+#39+
                                ' Where IdCurso =  '+Query_Item.FieldByName('IdCurso').AsString+
                                ' and IdTurma = '+#39+Query_Item.FieldByName('IdTurma').AsString+#39+
                                ' and CodMateria = '+#39+Query_Item.FieldByName('CodMateria').AsString+#39+
                                ' and NumItem = '+Query_Item.FieldByName('NumItem').AsString
                               );
         Query_Item.Next;
      end;

      JvTransparentButton_AtualizaClick(Sender);
      LimparConsulta;

      DBGrid_Disciplina.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Ajuste do Item da Prova
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_AjustarItemSelecionadoClick(Sender: TObject);
begin
   if Query_Item.FieldByName('IdCurso').AsString = '' then
      ShowMessage('A Disciplina não possuí item Cadastrado para ser copiado...')
   else
   begin
      if Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName('Possui_Imagem').AsString = 'S' then
         ShowMessage('Este Item possuí imagem, favor corrigir manualmente')
      else
      begin
         Application.CreateForm(TForm_Fer_AjustarItem, Form_Fer_AjustarItem);
         Form_Fer_AjustarItem.ShowModal;
         Form_Fer_AjustarItem.Free;
         Funcoes.AtualizaQuery(Query_Item);
         JvCaptionPanel_Ferramentas.Visible:= False;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_NovoClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserção';
//   Application.CreateForm(TForm_Cad_ItemProva, Form_Cad_ItemProva);
//   Form_Cad_ItemProva.ShowModal;
   Application.CreateForm(TForm_Cad_Item_Prova, Form_Cad_Item_Prova);
   Form_Cad_Item_Prova.ShowModal;
  JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Alterar
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_EditarClick( Sender: TObject);
begin
   VS_Opcao:= 'Alteração';
   Application.CreateForm(TForm_Cad_Item_Prova, Form_Cad_Item_Prova);
   Form_Cad_Item_Prova.ShowModal;
   Funcoes.AtualizaQuery(Query_Item);
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Item
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Msg: String;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão do Item selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.OpenQuery('Select count(1) as Qtd '+
                        ' From ItemTeste'+
                        ' where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+
                        ' and   IdTurma = '+Query_Item.FieldByName('IdTurma').AsString+
                        ' and   NumItem = '+Query_Item.FieldByName('NumItem').AsString
                       );
      if DM.IBQuery_Executa.FieldByName('Qtd').Asinteger = 1 then
      begin
         ShowMessage('O Iten pertence a uma prova aplicada na turma...');
      end
      else
      begin
         bmLocal:= Query_Item.GetBookMark;

          //----
         //-- Tratamento para verificar se o Item pertence a mais de um Curso

         Funcoes.OpenQuery('Select count(1) as Qtd '+
                           ' From Curso c, Item_Prova i'+
                           ' where i.IdCurso = c.IdCurso '+
                           ' and   i.NumItem = '+Query_Item.FieldByName('NumItem').AsString
                          );
         if DM.IBQuery_Executa.FieldByName('Qtd').Asinteger = 1 then
         begin
            Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+Excluido+#39+
                                   ' Where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+
                                   ' and  NumItem  = '+Query_Item.FieldByName('NumItem').AsString
                                 );
            Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+' and IdTurma = 0 and NumItem = '+Query_Item.FieldByName('NumItem').AsString);
         end
         else
         begin    // Tratamento quando o o item pertence  a mais de um curso
            Funcoes.OpenQuery('Select Distinct c.CodCurso,  i.CodMateria '+
                              ' From Curso c, Item_Prova i'+
                              ' where i.IdCurso = c.IdCurso '+
                              ' and   i.NumItem = '+Query_Item.FieldByName('NumItem').AsString
                             );

            if DM.IBQuery_Executa.FieldByName('CodCurso').AsString <> '' then
            begin
               VS_Msg:= ''+#13+#13;
               DM.IBQuery_Executa.First;
               While not DM.IBQuery_Executa.Eof do
               begin
                  VS_Msg:= VS_Msg+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' - '+DM.IBQuery_Executa.FieldByName('CodMateria').AsString+#13;
                  DM.IBQuery_Executa.Next;
               end;

               VS_Msg:= 'O Item pertence aos Cursos na disciplina: '+VS_Msg+#13+#13+' excluir de todos os Cursos ';
               VI_Retorno:= Application.MessageBox(PChar(VS_msg), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
               if VI_Retorno = IDYes then
               begin
                  Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+Excluido+#39+
                                         ' Where NumItem  = '+Query_Item.FieldByName('NumItem').AsString
                                        );
                  Funcoes.ExecusaoQuery('Delete from Item_Prova where IdTurma = 0 and NumItem = '+Query_Item.FieldByName('NumItem').AsString);
               end
               else
               begin
                  Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+Excluido+#39+
                                         ' Where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+
                                         ' and  NumItem  = '+Query_Item.FieldByName('NumItem').AsString
                                        );
                  Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+' and IdTurma = 0 and NumItem = '+Query_Item.FieldByName('NumItem').AsString);
               end;
            end;
         end;

         Funcoes.AtualizaQuery(Query_Item);
         Query_Item.GotoBookMark(bmLocal);
         Query_Item.FreeBookMark(bmLocal);
      end;
      Finalizar;
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento para Verificar se o Item pertence alguma Prova
//------------------------------------------------------------------------------

Function TForm_Sel_ItemProva.ItemCompoeProva(VS_NumItem: String): Boolean;
var
   VI_Retorno: integer;
   VS_Msg: String;
   VB_Status: Boolean;
begin
   VB_Status:= False;
   VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from itemTeste where idcurso = '+Query_Item.FieldByName('IdCurso').AsString+' and NumItem = '+VS_NumItem);
   if VI_retorno > 0 then
   begin
      VB_Status:= True;
      Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select Distinct i.IdCurso, i.IdTurma, t.CodCurso, t.Ano,t.Turma, t.DataInicio, t.DataTermino '+
                                                  ' from itemteste i, Turmas_View t '+
                                                  ' where numitem = '+VS_NumItem+
                                                  ' and i.idcurso = t.idcurso and i.IdTurma = t.IdTurma'+
                                                  ' Order By Ano, Turma'
                          );
      VS_Msg:= 'Curso       Turma   Ano   Inicio      Término'+#13;
      While not DM.IBQuery_Executa.eof do
      begin
         VS_Msg:= VS_Msg+'  '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+'     '+
                              DM.IBQuery_Executa.FieldByName('Turma').AsString+'     '+
                              DM.IBQuery_Executa.FieldByName('Ano').AsString+'     '+
                              DM.IBQuery_Executa.FieldByName('DataInicio').AsString+'   '+
                              DM.IBQuery_Executa.FieldByName('DataTermino').AsString+#13;
         DM.IBQuery_Executa.Next;
      end;
      ShowMessage('O Item selecionado faz parte de Prova'+#13+#13+'Para excluir o Item deverá primeiro excluir a(s) prova(s)'+#13+#13+VS_Msg+#13+#13);
   end;
   ItemCompoeProva:= VB_Status;
end;

//------------------------------------------------------------------------------
// Finaliza Inclusão. alteração e exclusao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.Finalizar;
var
   Status: Boolean;
begin
   Status:= False;
   if StrToInt(Label_QtdItens.Caption) > 0 then
      Status:= True;

   JvTransparentButton_Editar.Enabled:= Status;
   JvTransparentButton_Exclui.Enabled:= Status;
   JvTransparentButton_Excluir_Todos.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao da Disciplina
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.Query_MontaMateriaAfterScroll(DataSet: TDataSet);
begin
   if  VB_TratarMateria = True then
   begin
      if Query_Item.FieldByName('IdCurso').AsString = '' then
      begin
         Image_Facill.Visible:= False;
         Image_Medio.Visible:= False;
         Image_Dificel.Visible:= False;
         LabelResultado.Caption:= '';
      End;

//      if ((copy(Query_MontaMateria.FieldByName('CodMateria').AsString,5,2) = '00') and (Query_Item.FieldByName('IdCurso').AsString = '')) then
//      begin
//         Panel_Informacoes_Iten.Visible:= False;
//      end
//      else
//      begin
         Panel_Informacoes_Iten.Visible:= True;

         Funcoes.OpenQuery( 'select count(1) as Qtd ' +
                            ' From Item_Prova '+
                            ' where idCurso = '+Query_MontaMateria.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+Query_MontaMateria.FieldByName('IdTurma').AsString+
                            ' and codMateria = '+#39+Query_MontaMateria.FieldByName('CodMateria').AsString+#39+
                            ' and Status <> '+#39+'E'+#39
                          );
         Label_QtdItens.Caption:= FormatFloat('###0',DM.IBQuery_Executa.FieldByName('Qtd').AsInteger);
         Label_NItensIdeal.Caption:= IntToStr( Funcoes.GetNumItenIdel*(Query_MontaMateria.FieldByName('NumeroAulasTeoricas').AsInteger+Query_MontaMateria.FieldByName('NumeroAulasPraticas').AsInteger));
         if StrToInt(Label_QtdItens.Caption) < StrToInt(Label_NItensIdeal.Caption) then
            Label_QtdItens.Color:= clRed
         else
            Label_QtdItens.Color:= $00FCF3EB;

         series6.Clear;
         series7.Clear;

         series6.Add(StrToInt(Label_QtdItens.Caption), FormatFloat('000', StrToInt(Label_QtdItens.Caption)), clTeeColor);
         series7.Add(StrToInt(Label_NItensIdeal.Caption), FormatFloat('000', StrToInt(Label_NItensIdeal.Caption)), clTeeColor);
//      end;

      if Query_MontaMateria.FieldByName('IdTurma').AsInteger = 0 then
         DefinirTurma($00FEC0B8, True)
      else
         DefinirTurma($00F2F2F2, False);

      EstatisticaItens;
      Finalizar;
      Consulta;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para calcular a quantidade de itens faceis, medios e dificeis
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.EstatisticaItens;
var
   VI_Facil, VI_Medio, VI_Dificiel: Integer;
begin
   VI_Facil:= 0;
   VI_Medio:= 0;
   VI_Dificiel:= 0;

   Funcoes.ExecutaQuery( IBQuery_EstetisticaItens, 'select NumItem ' +
                                                   ' From Item_Prova '+
                                                   ' where idCurso = '+Query_MontaMateria.FieldByName('IdCurso').AsString+
                                                   ' and IdTurma = '+Query_MontaMateria.FieldByName('IdTurma').AsString+
                                                   ' and codMateria = '+#39+Query_MontaMateria.FieldByName('CodMateria').AsString+#39
                       );

   IBQuery_EstetisticaItens.First;
   While not IBQuery_EstetisticaItens.Eof do
   begin
      Funcoes.OpenQuery( 'Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+IBQuery_EstetisticaItens.FieldByName('NumItem').AsString);

      if DM.IBQuery_Executa.FieldByName('Indice').AsString <> '' then
      begin
      if DM.IBQuery_Executa.FieldByName('Indice').AsFloat >= 0.80 then
         VI_Facil:= VI_Facil + 1
      else
         if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.60 then
            VI_Medio:= VI_Medio + 1
         else
            VI_Dificiel:= VI_Dificiel + 1;
      end;
      IBQuery_EstetisticaItens.Next;
   end;
    Label_Facil.Caption:= 'Total de Itens Faceis: '+IntToStr( VI_Facil);
    Label_Medio.Caption:= 'Total de Itens Medios: '+IntToStr( VI_Medio);
    Label_Dificil.Caption:= 'Total de Itens Dificeis: '+IntToStr( VI_Dificiel);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para vizualizacao do Item
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_VizuItemClick(Sender: TObject);
begin
   if Panel_ItemProva.Visible = True then
   begin
      Panel_ItemProva.Visible:= False;
      JvTransparentButton_VizuItem.Width:= 134;
      JvTransparentButton_VizuItem.Caption:= 'Visualizar o Item';
      JvTransparentButton_VizuItem.Hint:= 'Liga a janela de visualização do Item.';
   end
   else
   begin
      Panel_ItemProva.Visible:= True;
      JvTransparentButton_VizuItem.Width:= 166;
      JvTransparentButton_VizuItem.Caption:= 'Não Visualizar o Item';
      JvTransparentButton_VizuItem.Hint:= 'Desliga a janela de visualização do Item.';
   end;
end;

procedure TForm_Sel_ItemProva.DBGrid_DisciplinaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_Disciplina, Rect, DataCol, Column, State );
end;

procedure TForm_Sel_ItemProva.DBGrid_ItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  Icon: TBitmap;
begin
  Icon := TBitmap.Create;
  if (Column.FieldName = 'STATUS') then
  begin
    with DBGrid_Item.Canvas do
    begin
      Brush.Color := clWhite;
      FillRect(Rect);
      if ((Query_Item.FieldByName('Status').AsString = 'D' )) then
         ImageList_SituacaoItem.GetBitmap(0, Icon)
      else
         if trim(Query_Item.FieldByName('Serie').AsString) = '' then
            ImageList_SituacaoItem.GetBitmap(3, Icon)
         else
            ImageList_SituacaoItem.GetBitmap(1, Icon);
      Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
    end;
  end;
end;

//------------------------------------------------------------------------------
//
// Tratamento da Caixa de alerta da exclusão de Itens
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para Excluir somente do Curso selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvExpressButton_TodosCursosClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão do Item selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Curso - Cadastro de Item', 'Excluir Item Curso: '+Frame_SelCurso.ComboBox_Curso.Text+' Nº Item: '+Query_Item.FieldByName('NumItem').AsString);
      Funcoes.Grava_Exclusao_Item(VS_NumItem);

      Funcoes.ExecusaoQuery('Delete from Item_Desc where NumItem = '+VS_NumItem);
      Funcoes.ExecusaoQuery('Delete from Item_Prova where NumItem = '+VS_NumItem);
   end;
   JvExpressButton_CancelarExclusaoClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para Excluir de todos os Cursos
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvExpressButton_SomenteSelecionadoClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão do Item selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+
                            ' and NumItem = '+VS_NumItem+
                            'and Disciplina = '+#39+Query_Item.FieldByName('DISCIPLINA').AsString+#39+
                            'and Unidade = '+#39+Query_Item.FieldByName('UNIDADE').AsString+#39+
                            'and SubUnidade = '+#39+Query_Item.FieldByName('SUBUNIDADE').AsString+#39+
                            'and Objetivo = '+#39+Query_Item.FieldByName('OBJETIVO').AsString+#39
                           );
   end;
   JvExpressButton_CancelarExclusaoClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para Cancelar a Exclusão
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvExpressButton_CancelarExclusaoClick(Sender: TObject);
begin
   JvCaptionPanel_Atencao.Visible:= False;
   Funcoes.AtualizaQuery(Query_Item);
   Finalizar;
end;

//------------------------------------------------------------------------------
// Permite buscar o Item pelo Numero
//------------------------------------------------------------------------------

Function TForm_Sel_ItemProva.VerificaSerie: String;
var
   VS_Retorno, VS_Comando: String;
begin
   VS_Retorno:= DM.IBQuery_Executa.FieldByName('Serie').AsString;
   if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
   begin
      if ((Query_MontaMateria.FieldByName('CodMateria').AsString <> '') and
          (Copy(Query_MontaMateria.FieldByName('CodMateria').AsString,1,2) <> '') and
          (Copy(Query_MontaMateria.FieldByName('CodMateria').AsString,3,2) <> '') and
          (Copy(Query_MontaMateria.FieldByName('CodMateria').AsString,5,2) <> '') and
          (DM.IBQuery_Executa.FieldByName('Objetivo').AsString <> '')) then
      begin
         VS_Comando:= 'Select max(Serie) + 1 As Serie from Item_Prova  '+
                      ' where IdCurso = '+Form_Sel_ItemProva.VS_IdCurso+
                      ' and IdTurma = '+Form_Sel_ItemProva.VS_IdTurma+
                      ' and CodMateria = '+#39+Query_MontaMateria.FieldByName('CodMateria').AsString+#39+
                      ' and Disciplina = '+#39+Copy(Query_MontaMateria.FieldByName('CodMateria').AsString,1,2)+#39+
                      ' and Unidade = '+#39+Copy(Query_MontaMateria.FieldByName('CodMateria').AsString,3,2)+#39+
                      ' and SubUnidade = '+#39+Copy(Query_MontaMateria.FieldByName('CodMateria').AsString,5,2)+#39+
                      ' and Objetivo = '+#39+DM.IBQuery_Executa.FieldByName('Objetivo').AsString+#39;

        Funcoes.OpenQuery(VS_Comando);
        if DM.IBQuery_Executa.FieldByName('Serie').AsString = '' then
           VS_Retorno:= '01'
        else
           VS_Retorno:= FormatFloat('00', DM.IBQuery_Executa.FieldByName('Serie').AsInteger);
      end;
   end;
   VerificaSerie:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// tratamentio do botao para fechar a lista de item pesquisados
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_FecharPesquisaItemClick(Sender: TObject);
begin
   JvCaptionPanel_PesqItem.Visible:= False;
end;

//------------------------------------------------------------------------------
//--- Copia para Turma Base
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_Copiar_Item_Para_Turma_BaseClick( Sender: TObject);
begin
   if Query_Item.FieldByName('IdCurso').AsString = '' then
      ShowMessage('A Disciplina não possuí item Cadastrado para ser copiado...')
   else
   begin
      DM.IBTable_Item_Prova.Open;
      Query_MontaMateria.First;
      While not Query_MontaMateria.Eof do
      begin
         Query_Item.First;
         While not Query_Item.Eof do
         Begin
            Funcoes.ExecusaoQuery('delete from Item_Prova Where IdCurso = '+Query_Item.FieldByName('IDCURSO').AsString+' and IdTurma = 0 and NumItem = '+Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString);

            Funcoes.Grava_Item_Prova( Query_Item.FieldByName('IDCURSO').AsString,
                                      '0',
                                      Query_Item.FieldByName('NumItem').AsString,
                                      Query_MontaMateria.FieldByName('CODMATERIA').AsString,
                                      Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,1,2),
                                      Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,3,2),
                                      Copy(Query_MontaMateria.FieldByName('CODMATERIA').AsString,5,2),
                                      Query_Item.FieldByName('OBJETIVO').AsString,
                                      '',
                                      Query_Item.FieldByName('Serie').AsString,
                                      'R'
                                    );
            Query_Item.Next;
         end;
         Query_MontaMateria.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Exclui todos Itens da Disciplina selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_Excluir_TodosClick(Sender: TObject);
var
   VI_QtdCursos, VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão do Item selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Query_Item.First;
      While not Query_Item.Eof do
      begin
          //---
         //--- Tratamento para Verificar se o Item pertence alguma Prova

         VS_NumItem:= Query_Item.FieldByName('NumItem').AsString;
         if ItemCompoeProva(VS_NumItem) = False then
         begin
            //-- Tratamento para verificar se o Item pertence a mais de um Curso

            VI_QtdCursos:= Funcoes.QtdRegistro('Select count(1) as Qtd From Turma where IdCurso = '+VS_IdCurso+' and Status = '+#39+'A'+#39);

            if VI_QtdCursos = 0 then
            begin
               Funcoes.Grava_Exclusao_Item(VS_NumItem);
               Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+' and NumItem = '+VS_NumItem);
            end
            else
            begin
               VI_Retorno:= Application.MessageBox('O Item pertence a uma turma ativa, Confirma a Exclusão do Item da Turma Ativa ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
               if VI_Retorno = IDYes then
               begin
                  Funcoes.Grava_Exclusao_Item(VS_NumItem);
                  Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+' and NumItem = '+VS_NumItem);
               end
               else
               begin
                  Funcoes.Grava_Exclusao_Item(VS_NumItem);
                  Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Query_Item.FieldByName('IdCurso').AsString+' and IdTurma = 0 and NumItem = '+VS_NumItem);
               end;
            end;
         end;
         Query_Item.Next;
      end;
   end;

   Funcoes.AtualizaQuery(Query_MontaMateria);
   Funcoes.AtualizaQuery(Query_Item);
   Finalizar;
end;

procedure TForm_Sel_ItemProva.Button1Click(Sender: TObject);
begin
   Form_ConflitoItem.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Relatorio Imprimir
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_RelatoriosImprimirClick( Sender: TObject);
begin
   JvCaptionPanel_Ferramentas.Visible:= False;
   if JvCaptionPanel_Relatorios_Imprimir.Visible = False then
      JvCaptionPanel_Relatorios_Imprimir.Visible:= True
   else
      JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do botao  para fechar a janela Relatorio Imprimir
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_FecharRelatoriosClick(Sender: TObject);
begin
   JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Ferramenta Imprimir
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_FerramentasClick( Sender: TObject);
begin
   JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
   if JvCaptionPanel_Ferramentas.Visible = False then
      JvCaptionPanel_Ferramentas.Visible:= True
   else
      JvCaptionPanel_Ferramentas.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do botao  para fechar a janela Ferramentas
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_Fechar_FerramentaClick( Sender: TObject);
begin
   JvCaptionPanel_Ferramentas.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para permitir somente numero
//------------------------------------------------------------------------------

Procedure TForm_Sel_ItemProva.TratarNumeroKeyPress(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento para permitir somente letras
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.TratarLetraKeyPress(Sender: TObject;var Key: Char);
begin
   if not (key in['A'..'Z', 'a'..'z', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento para tratar da estatistica do Item
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.IBQuery_IndiceItemAfterScroll( DataSet: TDataSet);
begin
   Image_Facill.Visible:= False;
   Image_Medio.Visible:= False;
   Image_Dificel.Visible:= False;
   LabelResultado.Caption:= '';
   if Query_Item.FieldByName('IdCurso').AsString <> '' then
   begin
      Funcoes.OpenQuery('Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString);

      if DM.IBQuery_Executa.FieldByName('Indice').AsFloat >= 0.80 then
      begin
         Image_Facill.Visible:= True;
         LabelResultado.Caption:= 'Estatística do Item selecionado: Fácil';
      end
      else
      begin
         if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.60 then
         begin
            Image_Medio.Visible:= True;
            LabelResultado.Caption:= 'Estatística do Item selecionado: Médio ';
         end
         else
         begin
            Image_Dificel.Visible:= True;
            LabelResultado.Caption:= 'Estatística do Item selecionado: Dificel ';
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a janela contendo a quantidade de itens por disciplina
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_NumeroItensPorDisciplinaClick( Sender: TObject);
begin
   Application.CreateForm(TForm_EstatisticaItem, Form_EstatisticaItem);
   Form_EstatisticaItem.ShowModal;
   Form_EstatisticaItem.Free;
   JvCaptionPanel_Ferramentas.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a janela com a estatistica do iten
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_EstatisticaItemSelecionadoClick(Sender: TObject);
begin
   if Query_Item.FieldByName('IdCurso').AsString = '' then
      ShowMessage('A Disciplina não possuí item de prova cadastrado...')
   else
   begin
      Application.CreateForm(TForm_IndiceFacilidadeItem, Form_IndiceFacilidadeItem);
      Form_IndiceFacilidadeItem.ShowModal;
      Form_IndiceFacilidadeItem.Free;
      JvCaptionPanel_Ferramentas.Visible:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da disponibilização dos Itens selecionados
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_DisponibilizarItensClick(Sender: TObject);
begin
   if Query_Item.FieldByName('IdCurso').AsString = '' then
      ShowMessage('A Disciplina não possuí item cadastrado para ser copiado...')
   else
   begin
      IBTable_Item_Prova.Open;
      Query_Item.First;
      While not Query_Item.Eof do
      begin
         IBTable_Item_Prova.Edit;
         IBTable_Item_Prova.FieldByName('Status').AsString:= 'D';
         IBTable_Item_Prova.Post;

         Query_Item.Next;
      end;
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(Query_Item);
   end;
end;

procedure TForm_Sel_ItemProva.JvTransparentButton_DisponibilizarTodosItensDasDisciplinasClick( Sender: TObject);
var
   bmLocal : TBookmark;
begin
   if Query_MontaMateria.FieldByName('IdCurso').AsString = '' then
      ShowMessage('A Disciplina selecionada não possuí item cadastrado para ser copiado...')
   else
   begin
      try
         if Query_MontaMateria.Recordcount > 0 then
         begin
            VB_TratarMateria:= False;
            bmLocal:= Query_MontaMateria.GetBookMark;
            IBTable_Item_Desc.Close;
            Query_Item_Historico.Close;
            IBQuery_EstetisticaItens.Close;
            IBQuery_IndiceItem.Close;

            IBTable_Item_Prova.Open;
            Query_MontaMateria.Open;

            Query_MontaMateria.First;
            While not Query_MontaMateria.eof do
            begin
               Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+'D'+#39+
                                      ' Where IdCurso = '+Query_MontaMateria.FieldByName( 'IDCURSO').AsString+
                                      ' and  IdTurma = '+Query_MontaMateria.FieldByName( 'IdTurma').AsString+
                                      ' and  codMateria  = '+#39+Query_MontaMateria.FieldByName('codMateria').AsString+#39
                                    );

               Query_MontaMateria.Next;
            end;
            Funcoes.TrimAppMemorySize;
            VB_TratarMateria:= True;
            Funcoes.AtualizaQuery(Query_Item);

            Query_MontaMateria.GotoBookMark(bmLocal);
            Query_MontaMateria.FreeBookMark(bmLocal);
            IBTable_Item_Desc.Open;
            Query_Item_Historico.Open;
            IBQuery_EstetisticaItens.Open;
            IBQuery_IndiceItem.Open;
         end;
      except
            VB_TratarMateria:= True;
            Funcoes.AtualizaQuery(Query_Item);

            Query_MontaMateria.GotoBookMark(bmLocal);
            Query_MontaMateria.FreeBookMark(bmLocal);
            IBTable_Item_Desc.Open;
            Query_Item_Historico.Open;
            IBQuery_EstetisticaItens.Open;
            IBQuery_IndiceItem.Open;
      end;
   end;
end;


end.

