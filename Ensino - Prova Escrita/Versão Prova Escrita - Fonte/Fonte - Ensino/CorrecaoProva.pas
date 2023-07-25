//----------------------------------------------------------------------------//
// PROGRAMA                  : CadastroNota.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das notas dos alunos                           //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/03/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit CorrecaoProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, Rotinas,Rotinas_SUE,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, IBCustomDataSet, IBQuery, Rotinas_Validar,
  IBTable, Menus, JvGrdCpt, JvEdit, JvGradient,JvToolEdit, JvRichEd,
  JvDBRichEd, JvComponent, JvCaptionPanel, JvDBTreeView, JvItemsPanel,
  JvArrowBtn, TeEngine, Series, TeeProcs, Chart, DbChart, JvTypedEdit,
  JvDBLookupTreeView, JvxCtrls, JvShape, JvGradientCaption, JvTransBtn,
  ExportPack, ShellApi, JvPanel, JvLookOut;

type
  TForm_Cad_CorrecaoProva = class(TForm)
    Panel_Principal: TPanel;
    DSQ_RelacaoAlunos: TDataSource;
    DSQ_MontaTeste: TDataSource;
    Query_RelacaoAlunos: TIBQuery;
    Panel_Selecao: TPanel;
    Table_Avaliacao: TIBTable;
    Table_AvaliacaoIDCURSO: TSmallintField;
    Table_AvaliacaoFASEAPLICACAO: TIBStringField;
    Table_AvaliacaoREFERENCIAAVALIACAO: TIBStringField;
    Table_AvaliacaoCODMATERIA: TIBStringField;
    Table_AvaliacaoMEDIAPARCIAL: TIBStringField;
    Table_AvaliacaoPESOAPLICACAO: TSmallintField;
    Table_AvaliacaoMEDIAMINIMA: TIBBCDField;
    Table_AvaliacaoCODPROVA: TIBStringField;
    Table_Item_Teste: TIBTable;
    DST_ItemTeste: TDataSource;
    IBQuery_ItemTeste: TIBQuery;
    IBQuery_ItemTesteIDCURSO: TSmallintField;
    IBQuery_ItemTesteIDTURMA: TIntegerField;
    IBQuery_ItemTesteNUMITEM: TIntegerField;
    IBQuery_ItemTesteFASEAPLICACAO: TIBStringField;
    IBQuery_ItemTesteREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_ItemTesteCODMATERIA: TIBStringField;
    IBQuery_ItemTesteNUMEROQUESTAO: TSmallintField;
    IBQuery_ItemTesteMATERIA: TIBStringField;
    DSQ_ItemTeste: TDataSource;
    Table_Item_TesteIDCURSO: TSmallintField;
    Table_Item_TesteIDTURMA: TIntegerField;
    Table_Item_TesteNUMITEM: TIntegerField;
    Table_Item_TesteFASEAPLICACAO: TIBStringField;
    Table_Item_TesteREFERENCIAAVALIACAO: TIBStringField;
    Table_Item_TesteCODMATERIA: TIBStringField;
    Table_Item_TesteMATERIA: TIBStringField;
    Table_Item_TesteNUMEROQUESTAO: TSmallintField;
    Table_Item_TesteQUESTAOANULADA: TIBStringField;
    Table_Item_TesteQUESTAOIRREGULAR: TIBStringField;
    Table_Item_TesteALTERNATIVACORRETAA: TIBStringField;
    Table_Item_TesteALTERNATIVACORRETAB: TIBStringField;
    Table_Item_TesteALTERNATIVACORRETAC: TIBStringField;
    Table_Item_TesteALTERNATIVACORRETAD: TIBStringField;
    IBQuery_ItemTesteQUESTAOANULADA: TIBStringField;
    IBQuery_ItemTesteQUESTAOIRREGULAR: TIBStringField;
    IBQuery_ItemTesteALTERNATIVACORRETAA: TIBStringField;
    IBQuery_ItemTesteALTERNATIVACORRETAB: TIBStringField;
    IBQuery_ItemTesteALTERNATIVACORRETAC: TIBStringField;
    IBQuery_ItemTesteALTERNATIVACORRETAD: TIBStringField;
    DST_Avaliacao: TDataSource;
    IBQuery_ItemTesteManual: TIBQuery;
    DSQ_ItemTesteManual: TDataSource;
    IBTable_ItemTesteManual: TIBTable;
    DST_ItemTesteManual: TDataSource;
    Query_RelacaoAlunosIDCURSO: TSmallintField;
    Query_RelacaoAlunosIDTURMA: TIntegerField;
    Query_RelacaoAlunosNUMORDEM: TSmallintField;
    Query_RelacaoAlunosCODIGOALUNO: TIntegerField;
    Query_RelacaoAlunosIDENTIDADE: TIBStringField;
    Query_RelacaoAlunosMOTIVODESLIGAMENTO: TIBStringField;
    Query_RelacaoAlunosNOMEGUERRA: TIBStringField;
    Query_RelacaoAlunosNOTA: TIBStringField;
    IBQuery_MontaTeste: TIBQuery;
    Table_AvaliacaoPESODISCIPLINA: TSmallintField;
    IBQuery_MontaTesteIDCURSO: TSmallintField;
    IBQuery_MontaTesteIDTURMA: TIntegerField;
    IBQuery_MontaTesteFASEAPLICACAO: TIBStringField;
    IBQuery_MontaTesteREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_MontaTesteCODMATERIA: TIBStringField;
    IBQuery_MontaTesteDATAAPLICACAO: TDateTimeField;
    IBQuery_MontaTesteTOTALALUNOS: TSmallintField;
    IBQuery_MontaTesteTOTALITENS: TSmallintField;
    IBQuery_MontaTesteCODPROVA: TIBStringField;
    IBQuery_ItemTesteManualIDCURSO: TSmallintField;
    IBQuery_ItemTesteManualIDTURMA: TIntegerField;
    IBQuery_ItemTesteManualFASEAPLICACAO: TIBStringField;
    IBQuery_ItemTesteManualREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_ItemTesteManualCODMATERIA: TIBStringField;
    IBQuery_ItemTesteManualNUMEROQUESTAO: TSmallintField;
    IBQuery_ItemTesteManualRESPOSTACORRETA: TIBStringField;
    IBQuery_ItemTesteManualQUESTAOANULADA: TIBStringField;
    IBQuery_ItemTesteManualQUESTAOIRREGULAR: TIBStringField;
    IBQuery_ItemTesteManualALTERNATIVACORRETAA: TIBStringField;
    IBQuery_ItemTesteManualALTERNATIVACORRETAB: TIBStringField;
    IBQuery_ItemTesteManualALTERNATIVACORRETAC: TIBStringField;
    IBQuery_ItemTesteManualALTERNATIVACORRETAD: TIBStringField;
    DST_Item_Desc: TDataSource;
    IBTable_Item_Desc: TIBTable;
    IBQuery_MontaTestePESOAPLICACAO: TSmallintField;
    IBTable_Teste: TIBTable;
    DST_Teste: TDataSource;
    IBTable_TesteIDCURSO: TSmallintField;
    IBTable_TesteIDTURMA: TIntegerField;
    IBTable_TesteFASEAPLICACAO: TIBStringField;
    IBTable_TesteREFERENCIAAVALIACAO: TIBStringField;
    IBTable_TesteCODMATERIA: TIBStringField;
    IBTable_TesteTOTALIRREGULARIDADE: TSmallintField;
    IBTable_TesteTOTALANULADAS: TIntegerField;
    IBQuery_Rel_ItemTeste: TIBQuery;
    IBQuery_Rel_ItemTesteNUMEROQUESTAO: TSmallintField;
    IBQuery_Rel_ItemTesteRESPOSTACORRETA: TIBStringField;
    IBQuery_Rel_ItemTesteQUESTAOANULADA: TIBStringField;
    IBQuery_Rel_ItemTesteQUESTAOIRREGULAR: TIBStringField;
    IBQuery_Rel_ItemTesteALTERNATIVACORRETAA: TIBStringField;
    IBQuery_Rel_ItemTesteALTERNATIVACORRETAB: TIBStringField;
    IBQuery_Rel_ItemTesteALTERNATIVACORRETAC: TIBStringField;
    IBQuery_Rel_ItemTesteALTERNATIVACORRETAD: TIBStringField;
    Table_ResultadoExames: TIBTable;
    DST_ResultadoExames: TDataSource;
    Table_ResultadoExamesIDCURSO: TSmallintField;
    Table_ResultadoExamesIDTURMA: TIntegerField;
    Table_ResultadoExamesFASEAPLICACAO: TIBStringField;
    Table_ResultadoExamesREFERENCIAAVALIACAO: TIBStringField;
    Table_ResultadoExamesCODMATERIA: TIBStringField;
    Table_ResultadoExamesIDENTIDADE: TIBStringField;
    Table_ResultadoExamesQDERESPBCO: TSmallintField;
    Table_ResultadoExamesQDERESPCER: TSmallintField;
    Table_ResultadoExamesQDERESPERR: TSmallintField;
    Table_ResultadoExamesNOTA: TIBBCDField;
    Table_ResultadoExamesHORAFIM: TIBStringField;
    IBQuery_ResultadoExame: TIBQuery;
    DSQ_ResultadoExame: TDataSource;
    IBQuery_AlunoTurma: TIBQuery;
    DSQ_AlunoTurma: TDataSource;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_MontaTesteAPRESENTARNOTA: TIBStringField;
    IBTable_TesteDATAAPLICACAO: TDateTimeField;
    IBTable_TesteOBSERVACAO: TIBStringField;
    Table_AvaliacaoMEDIA: TIBStringField;
    IBTable_TesteN_GABARITOS: TIntegerField;
    Table_AvaliacaoIDTURMA: TIntegerField;
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
    Query_RelacaoAlunosNOME: TIBStringField;
    IBQuery_ItemTesteManualGABARITO: TIntegerField;
    Panel_SelecaoCurso: TPanel;
    DBGrid_Teste: TDBGrid;
    Panel1: TPanel;
    JvGradientCaption1: TJvGradientCaption;
    DBNavigator3: TDBNavigator;
    ToolBar_RelacaoAlunos: TToolBar;
    JvEdit_NOrdem: TJvEdit;
    JvEdit_CodAluno: TJvEdit;
    JvEdit_Nome: TJvEdit;
    JvEdit_NomeGuerra: TJvEdit;
    JvEdit_Nota: TJvEdit;
    DBGrid_Alunos: TDBGrid;
    IBTable_SolicitacaoRevisaoItem: TIBTable;
    IBTable_SolicitacaoRevisaoItemIDCURSO: TSmallintField;
    IBTable_SolicitacaoRevisaoItemIDTURMA: TIntegerField;
    IBTable_SolicitacaoRevisaoItemFASEAPLICACAO: TIBStringField;
    IBTable_SolicitacaoRevisaoItemREFERENCIAAVALIACAO: TIBStringField;
    IBTable_SolicitacaoRevisaoItemCODMATERIA: TIBStringField;
    IBTable_SolicitacaoRevisaoItemIDENTIDADE: TIBStringField;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvGradient3: TJvGradient;
    JvCaptionPanel_Relatorios_Imprimir: TJvCaptionPanel;
    JvTransparentButton_FecharImpressao: TJvTransparentButton;
    Panel_Imprimir: TPanel;
    JvTransparentButton_MFC: TJvTransparentButton;
    JvTransparentButton_Imprimir_Rel_GDA: TJvTransparentButton;
    JvTransparentButton_Imprimir_RelacaoAlunosComCodigo: TJvTransparentButton;
    JvCaptionPanel_FerramentaAuxiliar: TJvCaptionPanel;
    JvTransparentButton_FecharFerramentaAuxiliar: TJvTransparentButton;
    Panel_FerramentaAuxiliar: TPanel;
    JvTransparentButton_FerramentaControleGeralGraus: TJvTransparentButton;
    JvTransparentButton_CadastrarMedia: TJvTransparentButton;
    JvCaptionPanel_Relatorios_PDF: TJvCaptionPanel;
    JvTransparentButton_Fechar_RelatorioPDF: TJvTransparentButton;
    Panel_RelatorioPDF: TPanel;
    JvTransparentButton_PDF_MFC: TJvTransparentButton;
    JvTransparentButton_PDF_GDA: TJvTransparentButton;
    JvTransparentButton_RelacaoComCodigo_PDF: TJvTransparentButton;
    Panel_FornecerNomeArquivo: TJvPanel;
    Label2: TLabel;
    JvShape7: TJvShape;
    JvTransparentButton_SolPDF: TJvTransparentButton;
    Edit_NomeDoArquivo: TEdit;
    ExportQR1: TExportQR;
    JvTransparentButton_Imprimir_Rel_GDV: TJvTransparentButton;
    JvTransparentButton_PDF_GDV: TJvTransparentButton;
    JvTransparentButton_Imprimir_Rel_CGG: TJvTransparentButton;
    JvTransparentButton_Imprimir_PDF_CGG: TJvTransparentButton;
    JvTransparentButton_Imprimir_Rel_CGP: TJvTransparentButton;
    JvTransparentButton_Imprimir_PDF_CGP: TJvTransparentButton;
    Panel5: TPanel;
    JvShape8: TJvShape;
    JvTransparentButton_RespostaProva: TJvTransparentButton;
    JvShape_HalbilitaCorrecao: TJvShape;
    JvTransparentButton_HabilitaCorrecaoProva: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_EstatisticaProva: TJvTransparentButton;
    JvShape_DivulgarNota: TJvShape;
    JvExpressButton_DivularNota: TJvExpressButton;
    JvCaptionPanel_CorrecaoProva: TJvCaptionPanel;
    JvTransparentButton_Fechar_CorrecaoProva: TJvTransparentButton;
    JvCaptionPanel_EntradaRespostaProva: TJvCaptionPanel;
    JvTransparentButton_FecharEntradaRespostaProva: TJvTransparentButton;
    Panel_EntradaRespostaProva: TPanel;
    JvTransparentButton_LeitoraOptica: TJvTransparentButton;
    JvTransparentButton_RespostaManual: TJvTransparentButton;
    IBQuery_MontaTesteDURACAO: TIntegerField;
    IBQuery_MontaTesteN_GABARITOS: TIntegerField;
    Panel_SelecaoTeste: TPanel;
    JvGradientCaption6: TJvGradientCaption;
    JvEdit_Prova: TJvEdit;
    JvDateEdit_Aplicacao: TJvDateEdit;
    DBNavigator_Sel_Teste: TDBNavigator;
    IBQuery_MontaTesteSTATUS_APLICACAO: TIBStringField;
    JvTransparentButton_RelacaoAlunoComProvaRecuperacao: TJvTransparentButton;
    Query_RelacaoAlunosNOMES: TIBStringField;
    Query_RelacaoAlunosNOTAREAL: TFloatField;
    JvTransparentButton_RelacaoAprovados_C2: TJvTransparentButton;
    JvTransparentButton_RelacaoAprovadosPDF: TJvTransparentButton;
    Shape1: TShape;
    JvTransparentButton_SolicitaRevisaoItem: TJvTransparentButton;
    JvTransparentButton_IrregularidadeProva: TJvTransparentButton;
    JvTransparentButton_CorrecaoProva: TJvTransparentButton;
    JvTransparentButton_CadastrarNotaManualmente: TJvTransparentButton;
    JvTransparentButton_CadastrarMediaManualmente: TJvTransparentButton;
    Bevel1: TBevel;
    IBQuery_ResultadoExameIDCURSO: TSmallintField;
    IBQuery_ResultadoExameIDTURMA: TIntegerField;
    IBQuery_ResultadoExameFASEAPLICACAO: TIBStringField;
    IBQuery_ResultadoExameREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_ResultadoExameCODMATERIA: TIBStringField;
    IBQuery_ResultadoExameIDENTIDADE: TIBStringField;
    IBQuery_ResultadoExameNOTA: TIBBCDField;
    IBQuery_ResultadoExamePESOAPLICACAO: TSmallintField;
    IBQuery_ResultadoExamePESODISCIPLINA: TSmallintField;
    IBQuery_ResultadoExameCODPROVA: TIBStringField;
    IBQuery_ResultadoExameMEDIAPARCIAL: TIBStringField;
    IBQuery_ResultadoExameMEDIAMINIMA: TIBBCDField;
    IBQuery_ResultadoExameMEDIA: TIBStringField;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_RelatoriosImprimir: TJvTransparentButton;
    JvShape_ControleGeral: TJvShape;
    JvShape_Atualizar: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape_PDF: TJvShape;
    JvTransparentButton_RelatorioPDF: TJvTransparentButton;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape_Ferramentas: TJvShape;
    JvTransparentButton_Ferramentas: TJvTransparentButton;
    JvTransparentButton_ControleGeralGraus: TJvTransparentButton;
    Panel_Frame_SelCurso: TPanel;

    Function TratarErro: Boolean;
    Procedure Containers(Status: Boolean);
    procedure MostraAlunoNota(Sender: TObject);
    procedure FiltroTeste(Sender: TObject);
    procedure TratarPDF(VS_Relatorio: String);
    procedure DesabilitaJanelasDeTrabalho(Cabecalho: String);

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_AlunosTitleClick(Column: TColumn);
    procedure Query_RelacaoAlunosAfterScroll(DataSet: TDataSet);
    procedure IBQuery_MontaTesteAfterScroll(DataSet: TDataSet);
    procedure DBGrid_AlunosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure IBTable_TurmaAfterScroll(DataSet: TDataSet);
    procedure DBGrid_TesteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_MFCClick(Sender: TObject);
    procedure JvTransparentButton_FecharImpressaoClick(Sender: TObject);
    procedure JvTransparentButton_RelatoriosImprimirClick( Sender: TObject);
    procedure JvTransparentButton_CadastrarMediaClick(Sender: TObject);
    procedure JvTransparentButton_ControleGeralGrausClick(Sender: TObject);
    procedure JvTransparentButton_Imprimir_RelacaoAlunosComCodigoClick( Sender: TObject);
    procedure JvTransparentButton_Imprimir_Rel_GDAClick(Sender: TObject);
    procedure JvTransparentButton_FerramentasClick(Sender: TObject);
    procedure JvTransparentButton_FecharFerramentaAuxiliarClick(Sender: TObject);
    procedure JvTransparentButton_RelatorioPDFClick(Sender: TObject);
    procedure JvTransparentButton_Fechar_RelatorioPDFClick(Sender: TObject);
    procedure JvTransparentButton_SolPDFClick(Sender: TObject);
    procedure JvTransparentButton_PDF_MFCClick(Sender: TObject);
    procedure JvTransparentButton_PDF_GDAClick(Sender: TObject);
    procedure JvTransparentButton_RelacaoComCodigo_PDFClick( Sender: TObject);
    procedure JvTransparentButton_Imprimir_Rel_GDVClick(Sender: TObject);
    procedure JvTransparentButton_PDF_GDVClick(Sender: TObject);
    procedure JvTransparentButton_Imprimir_Rel_CGGClick(Sender: TObject);
    procedure JvTransparentButton_Imprimir_PDF_CGGClick(Sender: TObject);
    procedure JvTransparentButton_Imprimir_PDF_CGPClick(Sender: TObject);
    procedure JvTransparentButton_Imprimir_Rel_CGPClick(Sender: TObject);
    procedure JvExpressButton_DivularNotaClick(Sender: TObject);
    procedure JvTransparentButton_EstatisticaProvaClick(Sender: TObject);
    procedure JvTransparentButton_IrregularidadeProvaClick(Sender: TObject);
    procedure JvTransparentButton_CadastrarNotaManualmenteClick(Sender: TObject);
    procedure JvTransparentButton_CadastrarMediaManualmenteClick(Sender: TObject);
    procedure JvTransparentButton_Fechar_CorrecaoProvaClick(Sender: TObject);
    procedure JvTransparentButton_CorrecaoProvaClick(Sender: TObject);
    procedure JvTransparentButton_HabilitaCorrecaoProvaClick(Sender: TObject);
    procedure JvTransparentButton_RespostaProvaClick(Sender: TObject);
    procedure JvTransparentButton_LeitoraOpticaClick(Sender: TObject);
    procedure JvTransparentButton_RespostaManualClick(Sender: TObject);
    procedure JvTransparentButton_FecharEntradaRespostaProvaClick(Sender: TObject);
    procedure JvTransparentButton_SolicitaRevisaoItemClick(Sender: TObject);
    procedure JvTransparentButton_RelacaoAlunoComProvaRecuperacaoClick(Sender: TObject);
    procedure JvTransparentButton_RelacaoAprovados_C2Click(Sender: TObject);
    procedure JvTransparentButton_RelacaoAprovadosPDFClick(Sender: TObject);
  private    { Private declarations }
     VS_ComandoResultadoExame, VS_OrderByResultadoExame, VS_RelatorioPDF: String;
  public    { Public declarations }
     VB_CadastrarNotaManualmente: Boolean;
     NPaginas: integer;
  end;

var
  Form_Cad_CorrecaoProva: TForm_Cad_CorrecaoProva;

implementation

uses MenuPrincipal, Module, Tratar_Leitora_Otica,
  EntradaDasRespostaDoAlunoManualmente, PedidoRevisaoItem,
  CorrecaoDoItemDaProva, CorrecaoDoItemDaProvaManual, Tratar_EstQuestao,
  Rel_RelatorioDoCadastroDeAlunosComCodigo, Rel_MFC, Rel_GDA, Rel_GDV,
  CorrecaoDaProva01, EntradaDaNotaDoAlunoManualmente, NotasDigitas,
  ControleGeralDeGraus_New,
  EntradaDaMediaDoAlunoManualmente, Rel_CGG, Rel_CGP,
  AlunoComProvasDeRecuperacao, Rel_Aprovados, Frame_Sel_Curso,
  ControleGeralDeGraus_New_PesoMP;


{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      DesabilitaJanelasDeTrabalho('Todas');

      VB_CadastrarNotaManualmente:= False;

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Correção da Prova');    // Abre o perfil do usuario em relacao a agenda

      Containers(True);

      if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II') then
      begin
         VS_OrderByResultadoExame:= ' order by 9';
         JvTransparentButton_RelacaoAprovados_C2.Visible:= True;
         JvTransparentButton_RelacaoAprovadosPDF.Visible:= True;
      end
      else
      begin
         VS_OrderByResultadoExame:= ' order by 3';
         JvTransparentButton_RelacaoAprovados_C2.Visible:= False;
         JvTransparentButton_RelacaoAprovadosPDF.Visible:= False;
      end;

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Cad_CorrecaoProva.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', 'Em Andamento');

      Funcoes.SetCadCurso('CadCurso');

      IBQuery_MontaTeste.Open;
      IBQuery_ItemTeste.Open;
      IBQuery_ItemTesteManual.Open;
      IBQuery_ResultadoExame.Open;
      IBTable_SolicitacaoRevisaoItem.Open;

      Table_ResultadoExames.Open;
      Table_Item_Teste.Open;
      Table_Avaliacao.Open;
      IBTable_Teste.Open;

      MostraAlunoNota(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Dabilida as janelas de trabalho
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.DesabilitaJanelasDeTrabalho(Cabecalho: String);
begin
   if Cabecalho <> 'Relatórios - Imprimir' then
      JvCaptionPanel_Relatorios_Imprimir.Visible:= False;

   if Cabecalho <> 'PDF' then
      JvCaptionPanel_Relatorios_PDF.Visible:= False;

   if Cabecalho <> 'Ferramentas' then
   begin
      JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
      Panel_FornecerNomeArquivo.Visible:= False;
   end;

   if Cabecalho <> 'Entrada da Resposta da Prova' then
      JvCaptionPanel_EntradaRespostaProva.Visible:= False;

   if Cabecalho <> 'Correção da Prova' then
      JvCaptionPanel_CorrecaoProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Atualizacao
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery( IBQuery_MontaTeste );
   Funcoes.AtualizaQuery(Query_RelacaoAlunos);
   MostraAlunoNota(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_FecharClick(Sender: TObject);
begin
   IBQuery_ItemTeste.Close;
   IBQuery_ItemTesteManual.Close;
   IBQuery_MontaTeste.Close;
   IBQuery_ResultadoExame.Close;
   Query_RelacaoAlunos.Close;

   IBTable_SolicitacaoRevisaoItem.Close;
   Table_ResultadoExames.Close;
   Table_Item_Teste.Close;
   Table_Avaliacao.Close;
   IBTable_ItemTesteManual.Close;
   IBTable_Teste.Close;

   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_Cad_CorrecaoProva.Containers(Status: Boolean);
begin
   Panel_Selecao.Enabled:= Status;
   Panel_SelecaoCurso.Enabled:= Status;
end;

//------------------------------------------------------------------------------
//
// Teste
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Filtor do Teste
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.FiltroTeste(Sender: TObject);
var
   VS_Comando, VS_Data: String;
begin
   VS_Comando:= 'Select IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, DataAplicacao, TotalAlunos, TotalItens, Duracao, CodProva, PesoAplicacao, ApresentarNota, N_gabaritos, Status_Aplicacao '+
                ' From  Testes_View '+
                ' Where IdCurso = :IdCurso '+
                ' and   IdTurma = :IdTurma ';

   if JvDateEdit_Aplicacao.Text <> '  /  /    ' then
   begin
      if Validar.ValidarData(JvDateEdit_Aplicacao.Text) = True then
      begin
         VS_Data:= Funcoes.DePara(JvDateEdit_Aplicacao.Text, '/', '.');
         VS_Data:= VS_Data+' 00:00';
         VS_Comando:= VS_Comando+'and  DataAplicacao = '+#39+VS_Data+#39;
      end;
   end;

   if Trim(JvEdit_Prova.Text) <> '' then
       VS_Comando:= VS_Comando+'and  CodProva = '+#39+JvEdit_Prova.Text+#39;

   Funcoes.ExecutaQuery( IBQuery_MontaTeste, VS_Comando+' Order By FaseAplicacao, MediaParcial, PesoAplicacao, DataAplicacao');
end;

//------------------------------------------------------------------------------
//
// Aluno Turma
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para mostrar o cadastro dos alunos e suas notas
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.MostraAlunoNota(Sender: TObject);
var
   Conj_01, Conj_02, Conj_03, Conj_04: String;
begin
   if ((DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString = '' ) and
       (DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString = '' )) then
   begin
      VS_ComandoResultadoExame:= ' Select al.IdCurso, al.IdTurma, al.NumOrdem, al.codigoaluno, al.Identidade, al.MotivoDesligamento,al.NomeCompleto as nome, al.nomeguerra, Nome as Nomes , Cast( '+#39+#39+' As Char(7)) as nota, cast(1.00 as Real) as NotaReal '+
                                 ' From Aluno_Turmas_View al '+
                                 ' Where al.IdCurso =  -1'+
                                 ' and al.IdTurma =  -1';
   end
   else
   begin
      if IBQuery_MontaTeste.RecordCount = 0 then
      begin
         VS_ComandoResultadoExame:= ' Select al.IdCurso, al.IdTurma, al.NumOrdem, al.codigoaluno, al.Identidade, al.MotivoDesligamento,al.NomeCompleto as nome, al.nomeguerra, Nome as Nomes , Cast( '+#39+#39+' As Char(7)) as nota, cast(1.00 as Real) as NotaReal '+
                                    ' From Aluno_Turmas_View al '+
                                    ' Where al.IdCurso =  '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                    ' and al.IdTurma =  '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end
      else
      begin
         Conj_01:= 'Select ex.IdCurso, ex.IdTurma, al.NumOrdem, al.codigoaluno, al.Identidade, al.MotivoDesligamento,al.NomeCompleto as nome, al.nomeguerra, Nome as Nomes, cast(ex.Nota AS char(7)) as nota, cast(ex.Nota as Real) as NotaReal '+
                   ' From Aluno_Turmas_View al, resultadoexame ex '+
                   ' Where ex.identidade = al.identidade '+
                   ' and   al.IdCurso =  '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and   al.IdTurma =  '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                   ' and   ex.IdCurso =  '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and   ex.IdTurma =  '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                   ' and   ex.FaseAplicacao =  '+#39+IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                   ' and   ex.ReferenciaAvaliacao =  '+#39+IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                   ' and   ex.CodMateria =  '+#39+IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;

         Conj_02:= ' Union '+
                   ' Select al.IdCurso, al.IdTurma, al.NumOrdem, al.codigoaluno, al.Identidade, al.MotivoDesligamento,al.NomeCompleto as nome, al.nomeguerra, Nome as Nomes , Cast( '+#39+#39+' As Char(7)) as nota, cast(0 as Real) as NotaReal '+
                   ' From Aluno_Turmas_View al '+
                   ' Where al.IdCurso =  '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and   al.IdTurma =  '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString;

         Conj_03:= ' and   al.identidade not in '+
                   '       ( '+
                   '          Select ex.Identidade '+
                   '          From  resultadoexame ex '+
                   '          Where ex.IdCurso =  '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   '          and   ex.IdTurma =  '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                   '          and   ex.FaseAplicacao =  '+#39+IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                   '          and   ex.ReferenciaAvaliacao =  '+#39+IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                   '          and   ex.CodMateria =  '+#39+IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;

         Conj_04:= '       ) '+
                   ' and al.IdCurso =  '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and al.IdTurma =  '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString;

         if trim(JvEdit_NOrdem.Text) <> '' then
         begin
            Conj_01:=  Conj_01 + ' and al.NumOrdem = '+JvEdit_NOrdem.Text;
            Conj_02:=  Conj_02 + ' and al.NumOrdem = '+JvEdit_NOrdem.Text;
            Conj_03:=  Conj_03 + ' and al.NumOrdem = '+JvEdit_NOrdem.Text;
         end;

         if trim(JvEdit_CodAluno.Text) <> '' then
         begin
            Conj_01:=  Conj_01 + ' and al.CodigoAluno = '+JvEdit_CodAluno.Text;
            Conj_02:=  Conj_02 + ' and al.CodigoAluno = '+JvEdit_CodAluno.Text;
            Conj_03:=  Conj_03 + ' and al.CodigoAluno = '+JvEdit_CodAluno.Text;
         end;

         if Trim(JvEdit_Nome.Text) <> '' then
         begin
            Conj_01:=  Conj_01 + ' and al.Nome Like '+#39+JvEdit_Nome.Text+'%'+#39;
            Conj_02:=  Conj_02 + ' and al.Nome like '+#39+JvEdit_Nome.Text+'%'+#39;
            Conj_03:=  Conj_03 + ' and al.Nome like '+#39+JvEdit_Nome.Text+'%'+#39;
         end;

         if Trim(JvEdit_NomeGuerra.Text) <> '' then
         begin
            Conj_01:=  Conj_01 + ' and al.NomeGuerra like '+#39+JvEdit_NomeGuerra.Text+'%'+#39;
            Conj_02:=  Conj_02 + ' and al.NomeGuerra like '+#39+JvEdit_NomeGuerra.Text+'%'+#39;
            Conj_03:=  Conj_03 + ' and al.NomeGuerra like '+#39+JvEdit_NomeGuerra.Text+'%'+#39;
         end;

         if Trim(JvEdit_Nota.Text) <> '' then
         begin
            Conj_01:=  Conj_01 + ' and Nota = '+JvEdit_Nota.Text;
            Conj_02:=  Conj_02 + ' and Nota = '+JvEdit_Nota.Text;
            Conj_03:=  Conj_03 + ' and Nota = '+JvEdit_Nota.Text;
         end;

         VS_ComandoResultadoExame:=  Conj_01+ Conj_02+ Conj_03+ Conj_04;
      end;
   end;
   Funcoes.ExecutaQuery( Query_RelacaoAlunos, VS_ComandoResultadoExame+VS_OrderByResultadoExame);
   Query_RelacaoAlunos.First;
end;

//------------------------------------------------------------------------------
// Ordenação do Resultado Exame
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.DBGrid_AlunosTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Nº Ordem' then
       VS_OrderByResultadoExame:= ' order by 3'   // 3
   else
     if trim(column.Title.Caption) = 'Cód. Aluno' then
         VS_OrderByResultadoExame:= ' order by 4'    // 4
     else
        if trim(column.Title.Caption) = 'Nome' then
            VS_OrderByResultadoExame:= ' order by 9'     // 7
        else
           if trim(column.Title.Caption) = 'Nome Guerra' then
              VS_OrderByResultadoExame:= ' order by 8'       // 9
           else
              if trim(column.Title.Caption) = 'Nota' then
                  VS_OrderByResultadoExame:= ' order by 11 desc'; //10
   Funcoes.ExecutaQuery( Query_RelacaoAlunos, VS_ComandoResultadoExame+VS_OrderByResultadoExame);
end;

//------------------------------------------------------------------------------
//
// Cadastro Manual de Nota
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para mostrar os cadadtro dos alunos e sus nota
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.IBQuery_MontaTesteAfterScroll(DataSet: TDataSet);
var
   Sender: TObject;
begin
   if IBQuery_MontaTeste.FieldByName('APRESENTARNOTA').asString = 'N' then
   begin
      JvExpressButton_DivularNota.Caption:= 'Divulgar Nota';
      JvExpressButton_DivularNota.Hint:= 'Mostra a nota dos alunos na Ficha de Avaliação de Curso.';
   end
   else
   begin
      JvExpressButton_DivularNota.Caption:= 'Não Divulgar Nota';
      JvExpressButton_DivularNota.Hint:= 'Não mostra a nota dos alunos na Ficha de Avaliação de Curso.';
   end;

   Funcoes.AtualizaQuery(IBQuery_ItemTesteManual);
   if IBQuery_ItemTesteManual.RecordCount = 0 then
   begin
      JvTransparentButton_CorrecaoProva.Caption:= 'Correção da Prova Feita pelo Sistema';
      JvTransparentButton_CorrecaoProva.Hint:= 'Correção da prova elaborada pelo sistema.';
   end
   else
   begin
      JvTransparentButton_CorrecaoProva.Caption:= 'Correção da Prova Feita Manualmente';
      JvTransparentButton_CorrecaoProva.Hint:= 'Correção da prova elaborada manualmente.';
   end;
   MostraAlunoNota(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao da leitora
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_LeitoraOpticaClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Menu Principal - Correção da Prova', 'Leitora Otica');
   Application.CreateForm(TForm_LeitoraOtica, Form_LeitoraOtica);
   Form_LeitoraOtica.ShowModal;
   Form_LeitoraOtica.Free;
   JvCaptionPanel_EntradaRespostaProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do botao da Entrada das Resposta do Aluno Manualmente
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RespostaManualClick(Sender: TObject);
begin
   Application.CreateForm(TForm_EntradaDasRespostaDoAlunoManualmente, Form_EntradaDasRespostaDoAlunoManualmente);
   Funcoes.GravaAcesso('Menu Principal - Correção da Prova', 'Entrada das Resposta do Aluno Manualmente');
   Form_EntradaDasRespostaDoAlunoManualmente.ShowModal;
   JvCaptionPanel_EntradaRespostaProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Abre a janela de tratamento da Solicitacao de Revisao do Item
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_SolicitaRevisaoItemClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      IBTable_SolicitacaoRevisaoItem.Open;
      Application.CreateForm(TForm_PedidoRevisaoItem, Form_PedidoRevisaoItem);
      Form_PedidoRevisaoItem.ShowModal;
      Form_PedidoRevisaoItem.Free;
   end;
   JvCaptionPanel_CorrecaoProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Abre a janela de tratamento de irregularidade da prova
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_IrregularidadeProvaClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      if JvTransparentButton_CorrecaoProva.Caption = 'Correção da Prova Feita pelo Sistema' then
      begin
         IBTable_Item_Desc.Open;
         Application.CreateForm(TForm_CorrecaoDoItemDaProvaSistema, Form_CorrecaoDoItemDaProvaSistema);
         Form_CorrecaoDoItemDaProvaSistema.ShowModal;
         Form_CorrecaoDoItemDaProvaSistema.Free;
         IBTable_Item_Desc.Close;
      end
      else
      begin
         IBTable_ItemTesteManual.Open;
         Application.CreateForm(TForm_CorrecaoDoItemDaProvaManual, Form_CorrecaoDoItemDaProvaManual);
         Form_CorrecaoDoItemDaProvaManual.ShowModal;
         Form_CorrecaoDoItemDaProvaManual.Free;
         IBTable_ItemTesteManual.Close;
      end;
   end;
   JvCaptionPanel_CorrecaoProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da Estatistica de Respostas
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_EstatisticaProvaClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      Funcoes.GravaAcesso('Menu Principal - Correção da Prova', 'Estatistica de Respotas');
      Application.CreateForm(TForm_EstQuestao, Form_EstQuestao);
      Form_EstQuestao.ShowModal;
      Form_EstQuestao.Free;
   end;
end;

//------------------------------------------------------------------------------
//
// Relatorios
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Relatorio - Relacao de Aluno com Codigo
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Imprimir_RelacaoAlunosComCodigoClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
      Funcoes.ExecutaQuery( Form_Rel_RelacaoComCodigo.IBQuery_AlunoTurma, 'Select NomeCompleto, NomeGuerra, CodigoAluno as Codigo '+
                                                                          ' From Aluno_Turmas_View Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                                          ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                          );
      Form_Rel_RelacaoComCodigo.QRLabel_Cabec.Caption:= 'Relação de Alunos com Código';

      Form_Rel_RelacaoComCodigo.QuickRep1.Preview
   end;
end;

//------------------------------------------------------------------------------
// Chamada para relatorio de grau Final de Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_MFCClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_Rel_MFC, Form_Rel_MFC);
      Form_Rel_MFC.QuickRep1.Prepare;
      NPaginas:= Form_Rel_MFC.QuickRep1.QRPrinter.PageCount;
      Form_Rel_MFC.QuickRep1.Preview;
      JvCaptionPanel_CorrecaoProva.Visible:= False;
   end;
end;

//------------------------------------------------------------------------------
// Chamada para relatorio FORMULÁRIO GRAU DOS DISCENTES NA AVALIAÇÃO - GDA
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Imprimir_Rel_GDAClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      Funcoes.ExecutaQuery( Query_RelacaoAlunos, VS_ComandoResultadoExame+' order by 11 desc');
      Application.CreateForm(TForm_Rel_GDA, Form_Rel_GDA);
      Form_Rel_GDA.QuickRep1.Prepare;
      NPaginas:= Form_Rel_GDA.QuickRep1.QRPrinter.PageCount;
      Form_Rel_GDA.QuickRep1.Preview;
      Funcoes.ExecutaQuery( Query_RelacaoAlunos, VS_ComandoResultadoExame+VS_OrderByResultadoExame);
   end;
end;

//------------------------------------------------------------------------------
// Chamada para relatorio FORMULÁRIO GRAU DOS DISCENTES NA AVALIAÇÃO - GDV
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Imprimir_Rel_GDVClick( Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_Rel_GDV, Form_Rel_GDV);
      Form_Rel_GDV.QuickRep1.Prepare;
      NPaginas:= Form_Rel_GDV.QuickRep1.QRPrinter.PageCount;
      Form_Rel_GDV.QuickRep1.Preview;
   end;
end;

//------------------------------------------------------------------------------
// Chamada para relatorio FORMULÁRIO CONTROLE GERAL DE GRAUS - CGG
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Imprimir_Rel_CGGClick( Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_Rel_CGG, Form_Rel_CGG);
      Form_Rel_CGG.QuickRep1.Prepare;
      NPaginas:= Form_Rel_CGG.QuickRep1.QRPrinter.PageCount;
      Form_Rel_CGG.QuickRep1.Preview;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do relação dos Aprovados
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RelacaoAprovados_C2Click(Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_Rel_Aprovados, Form_Rel_Aprovados);
      Form_Rel_Aprovados.QuickRep1.Prepare;
      NPaginas:= Form_Rel_Aprovados.QuickRep1.QRPrinter.PageCount;
      Form_Rel_Aprovados.QuickRep1.Preview;
   end;
end;

//------------------------------------------------------------------------------
// Chamada para relatorio FORMULÁRIO CORREÇÃO GABARITO DE PROVA - CGP
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Imprimir_Rel_CGPClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_Rel_CGP, Form_Rel_CGP);
      Form_Rel_CGP.QuickRep1.Prepare;
      NPaginas:= Form_Rel_CGP.QuickRep1.QRPrinter.PageCount;
      Form_Rel_CGP.QuickRep1.Preview;
   end;
end;

//------------------------------------------------------------------------------
// Abre o container de correção da prova Automaticamente
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_CorrecaoProvaClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_CorrecaoDaProva01, Form_CorrecaoDaProva01);
      IBQuery_ItemTeste.Filtered:= False;
      Form_CorrecaoDaProva01.Show;
   end;
   JvCaptionPanel_CorrecaoProva.Visible:= False;
end;

//------------------------------------------------------------------------------
//
// Tratamento da entrada da nota de forma manual
// Data: 31/03/2008
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Mostra a nota do aluno selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.Query_RelacaoAlunosAfterScroll(DataSet: TDataSet);
begin
   if VB_CadastrarNotaManualmente = True then
      Form_EntradaDaNotaDoAlunoManualmente.JvFloatEdit_NotaManual.Text:= Funcoes.DePara(Query_RelacaoAlunos.FieldByName('Nota').AsString,'.',',');
end;

//------------------------------------------------------------------------------
// Abre a janela de entrada da nota menual
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_CadastrarNotaManualmenteClick( Sender: TObject);
begin
   if Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString = '' then
      ShowMessage ('Não foi selecionado a prova para entrada da Nota Manual')
   else
   begin
      Application.CreateForm(TForm_EntradaDaNotaDoAlunoManualmente, Form_EntradaDaNotaDoAlunoManualmente);
      VB_CadastrarNotaManualmente:= True;
      Query_RelacaoAlunos.First;
      Form_EntradaDaNotaDoAlunoManualmente.ShowModal;
      MostraAlunoNota(Sender);
   end;
   JvCaptionPanel_CorrecaoProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para leitura da nota pelo arquivo
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_CadastrarMediaManualmenteClick( Sender: TObject);
begin
   Application.CreateForm(TForm_NotasDigitadas, Form_NotasDigitadas);
   Form_NotasDigitadas.ShowModal;
   Form_NotasDigitadas.Free;
   JvCaptionPanel_CorrecaoProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para destacar os alunos desligados
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.DBGrid_AlunosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if ((Trim(Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) <> 'a') and
       (Trim(Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) <> ' ') and
       (Trim(Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) <> '')) then
   begin
     DBGrid_Alunos.Canvas.Font.Color:= clRed;
   end
   else
   begin
      if trim(Query_RelacaoAlunos.FieldByName('nota').AsString) <> '' then
        if StrToFloat(Funcoes.DePara(Query_RelacaoAlunos.FieldByName('nota').AsString,'.',',')) < Table_Avaliacao.FieldByName('MediaMinima').AsFloat then
           DBGrid_Alunos.Canvas.Font.Color:= clTeal
        else
           DBGrid_Alunos.Canvas.Font.Color:= clBlack
      else
         DBGrid_Alunos.Canvas.Font.Color:= clBlack;
   end;

  if gdSelected in State then
    DBGrid_Alunos.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Alunos.Canvas.FillRect(Rect);
   DBGrid_Alunos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Seta a nota para ser divulgada
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.IBTable_TurmaAfterScroll(DataSet: TDataSet);
begin
   Funcoes.AtualizaQuery(Query_RelacaoAlunos);
end;

//------------------------------------------------------------------------------
// Seta a nota para ser divulgada
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvExpressButton_DivularNotaClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      if JvExpressButton_DivularNota.Caption = 'Divulgar Nota' then
         Funcoes.ExecusaoQuery( 'Update teste set ApresentarNota = '+#39+'S'+#39+
                                ' where idCurso = '+IBQuery_MontaTeste.FieldByName('IDCURSO').AsString+
                                ' and   IdTurma   = '+IBQuery_MontaTeste.FieldByName('IDTURMA').AsString+
                                ' and   FaseAplicacao = '+#39+IBQuery_MontaTeste.FieldByName('FASEAPLICACAO').AsString+#39+
                                ' and   ReferenciaAvaliacao = '+#39+IBQuery_MontaTeste.FieldByName('REFERENCIAAVALIACAO').AsString+#39+
                                ' and   CodMateria = '+#39+IBQuery_MontaTeste.FieldByName('CODMATERIA').AsString+#39
                              )
      else
         Funcoes.ExecusaoQuery( 'Update teste set ApresentarNota = '+#39+'N'+#39+
                                ' where idCurso = '+IBQuery_MontaTeste.FieldByName('IDCURSO').AsString+
                                ' and   IdTurma   = '+IBQuery_MontaTeste.FieldByName('IDTURMA').AsString+
                                ' and   FaseAplicacao = '+#39+IBQuery_MontaTeste.FieldByName('FASEAPLICACAO').AsString+#39+
                                ' and   ReferenciaAvaliacao = '+#39+IBQuery_MontaTeste.FieldByName('REFERENCIAAVALIACAO').AsString+#39+
                                ' and   CodMateria = '+#39+IBQuery_MontaTeste.FieldByName('CODMATERIA').AsString+#39
                               );
      Funcoes.AtualizaQuery(IBQuery_MontaTeste);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do teste
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.DBGrid_TesteDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_Teste, Rect, DataCol, Column, State );
   if IBTable_SolicitacaoRevisaoItem.FieldByName('IdCurso').AsString = '' then
      JvTransparentButton_SolicitaRevisaoItem.Visible:= False
   else
      JvTransparentButton_SolicitaRevisaoItem.Visible:= True;

   JvTransparentButton_IrregularidadeProva.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para fechara  ajanela de impressao
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_FecharImpressaoClick(Sender: TObject);
begin
   JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
end;

//------------------------------------------------------------------------------
//
// Tratamento da Ferramentas do Modulo
//
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RelatoriosImprimirClick(Sender: TObject);
begin
   DesabilitaJanelasDeTrabalho('Relatórios - Imprimir');
   if JvCaptionPanel_Relatorios_Imprimir.Visible = False then
      JvCaptionPanel_Relatorios_Imprimir.Visible:= True
   else
      JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Abrir a Janela Ferramenta
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_FerramentasClick(Sender: TObject);
begin
   DesabilitaJanelasDeTrabalho('Ferramentas');
   if JvCaptionPanel_FerramentaAuxiliar.Visible = False then
      JvCaptionPanel_FerramentaAuxiliar.Visible:= True
   else
      JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Fechar aJanela Ferramenta
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_FecharFerramentaAuxiliarClick( Sender: TObject);
begin
   JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
end;

//------------------------------------------------------------------------------
// Relatorio - Controle Geral de Graus
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_ControleGeralGrausClick(Sender: TObject);
var
   bmLocal : TBookmark;
begin
   if TratarErro = False then
   begin
      bmLocal:= Query_RelacaoAlunos.GetBookMark;
      Funcoes.SetRelDesempenho('Iniciado');

      Funcoes.OpenQuery('Select PesoMP from curso Where idCurso = '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString);

      if DM.IBQuery_Executa.FieldByName('PesoMP').AsString = 'S' then
      begin
         Application.CreateForm(TForm_MontaControleGeraoGraus_PesoMP, Form_MontaControleGeraoGraus_PesoMP);
         Form_MontaControleGeraoGraus_PesoMP.ShowModal;
      end
      else
      begin
         Application.CreateForm(TForm_MontaControleGeraoGraus, Form_MontaControleGeraoGraus);
         Form_MontaControleGeraoGraus.ShowModal;
      end;

      Funcoes.AtualizaQuery(Query_RelacaoAlunos);

      Query_RelacaoAlunos.GotoBookMark(bmLocal);
      Query_RelacaoAlunos.FreeBookMark(bmLocal);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para chamada do modulo para cadastro de media manualmente
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_CadastrarMediaClick( Sender: TObject);
begin
   if TratarErro = False then
   begin
      Application.CreateForm(TForm_EntradaDaMediaDoAlunoManualmente, Form_EntradaDaMediaDoAlunoManualmente);
      Form_EntradaDaMediaDoAlunoManualmente.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para chamada do modulo para consultar os alunos com prova de recuperaçao
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RelacaoAlunoComProvaRecuperacaoClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
       Application.CreateForm(TForm_AlunoComProvasDeRecuperacao, Form_AlunoComProvasDeRecuperacao);
       Form_AlunoComProvasDeRecuperacao.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento da impressao do Relatorio em Formato PDF
//
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RelatorioPDFClick(Sender: TObject);
begin
   JvCaptionPanel_Relatorios_PDF.Height:= 220;
   DesabilitaJanelasDeTrabalho('PDF');

   if JvCaptionPanel_Relatorios_PDF.Visible = False then
      JvCaptionPanel_Relatorios_PDF.Visible:= True
   else
      JvCaptionPanel_Relatorios_PDF.Visible:= False;
end;

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Fechar_RelatorioPDFClick( Sender: TObject);
begin
   JvCaptionPanel_Relatorios_PDF.Visible:= False;
end;


//------------------------------------------------------------------------------
//
// Tratamento do Relatorio PDF solicitado
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para criacao do arquivo PDF
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.TratarPDF(VS_Relatorio: String);
var
   VS_Pasta, VS_NomeArq: String;
begin
   if TratarErro = False then
   begin
      JvCaptionPanel_Relatorios_PDF.Height:= 350;

      Panel_FornecerNomeArquivo.Left:= 1;
      Panel_FornecerNomeArquivo.Top:= 130;
      Panel_FornecerNomeArquivo.Visible:= True;

      VS_RelatorioPDF:= VS_Relatorio;

      //--- Verificando a existencia do diretorio para Solicitacao em PDF

      VS_NomeArq:= Trim(Funcoes.GetCodCurso)+'_'+Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
      VS_NomeArq:= Funcoes.DePara(VS_NomeArq, '/', '_');

      VS_Pasta:= 'C:\Ensino\ArquivosPDF\'+VS_NomeArq;

      VS_NomeArq:= VS_NomeArq+'_'+VS_Relatorio;

      if not DirectoryExists(VS_Pasta) then
          ForceDirectories(VS_Pasta);

      Edit_NomeDoArquivo.Text:= VS_Pasta+'\'+VS_NomeArq;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a solicitacao do arquivo PDF
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_SolPDFClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      if VS_RelatorioPDF = 'MFC' then
      begin
         Application.CreateForm(TForm_Rel_MFC, Form_Rel_MFC);
         Form_Rel_MFC.QuickRep1.Prepare;
         NPaginas:= Form_Rel_MFC.QuickRep1.QRPrinter.PageCount;
         ExportQR1.Report := Form_Rel_MFC.QuickRep1;
         Form_Rel_MFC.Free;
      end
      else
      begin
         if VS_RelatorioPDF = 'GDA' then
         begin
            Application.CreateForm(TForm_Rel_GDA, Form_Rel_GDA);
            Form_Rel_GDA.QuickRep1.Prepare;
            NPaginas:= Form_Rel_GDA.QuickRep1.QRPrinter.PageCount;
            ExportQR1.Report := Form_Rel_GDA.QuickRep1;
            Form_Rel_GDA.Free;
         end
         else
         begin
            if VS_RelatorioPDF = 'GDV' then
            begin
               Application.CreateForm(TForm_Rel_GDV, Form_Rel_GDV);
               Form_Rel_GDV.QuickRep1.Prepare;
               NPaginas:= Form_Rel_GDV.QuickRep1.QRPrinter.PageCount;
               ExportQR1.Report := Form_Rel_GDV.QuickRep1;
               Form_Rel_GDV.Free;
            end
            else
            begin
               if VS_RelatorioPDF = 'CGG' then
               begin
                  Application.CreateForm(TForm_Rel_CGG, Form_Rel_CGG);
                  Form_Rel_CGG.QuickRep1.Prepare;
                  NPaginas:= Form_Rel_CGG.QuickRep1.QRPrinter.PageCount;
                  Form_Rel_CGG.QuickRep1.Preview;
                  ExportQR1.Report := Form_Rel_CGG.QuickRep1;
                  Form_Rel_CGG.Free;
               end
               else
               begin
                  if VS_RelatorioPDF = 'CGP' then
                  begin
                     Application.CreateForm(TForm_Rel_CGP, Form_Rel_CGP);
                     Form_Rel_CGP.QuickRep1.Prepare;
                     NPaginas:= Form_Rel_CGP.QuickRep1.QRPrinter.PageCount;
                     ExportQR1.Report := Form_Rel_CGP.QuickRep1;
                     Form_Rel_CGP.Free;
                  end
                  else
                  begin
                     if VS_RelatorioPDF = 'RelacaoComCodigo' then
                     begin
                        Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
                        Form_Rel_RelacaoComCodigo.QuickRep1.Prepare;
                        ExportQR1.Report := Form_Rel_RelacaoComCodigo.QuickRep1;
                        Form_Rel_RelacaoComCodigo.Free;
                     end
                     else
                     begin
                        if VS_RelatorioPDF = 'RelacaoAprovados' then
                        begin
                           Application.CreateForm(TForm_Rel_Aprovados, Form_Rel_Aprovados);
                           Form_Rel_Aprovados.QuickRep1.Prepare;
                           ExportQR1.Report := Form_Rel_Aprovados.QuickRep1;
                           Form_Rel_Aprovados.Free;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;

   ExportQR1.ExportQRPDF(Edit_NomeDoArquivo.Text, False);
   ShellExecute(Handle, nil, PChar(Edit_NomeDoArquivo.Text+'.pdf') , nil, nil, SW_SHOWNORMAL);
   Panel_FornecerNomeArquivo.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio MFC
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_PDF_MFCClick( Sender: TObject);
begin
   TratarPDF('MFC');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio GDA
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_PDF_GDAClick(Sender: TObject);
begin
   TratarPDF('GDA');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio GDV
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_PDF_GDVClick( Sender: TObject);
begin
   TratarPDF('GDV');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio CGG
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Imprimir_PDF_CGGClick(Sender: TObject);
begin
   TratarPDF('CGG');
end;

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Imprimir_PDF_CGPClick( Sender: TObject);
begin
   TratarPDF('CGP');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio RelacaoComCodigo_PDF
//------------------------------------------------------------------------------

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RelacaoComCodigo_PDFClick(Sender: TObject);
begin
   TratarPDF('RelacaoComCodigo_PDF');
end;

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RelacaoAprovadosPDFClick(Sender: TObject);
begin
   TratarPDF('RelacaoAprovados');
end;

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_Fechar_CorrecaoProvaClick(Sender: TObject);
begin
   JvCaptionPanel_CorrecaoProva.Visible:= False;
end;

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_HabilitaCorrecaoProvaClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      DesabilitaJanelasDeTrabalho('Correção da Prova');

      if JvCaptionPanel_CorrecaoProva.Visible = False then
         JvCaptionPanel_CorrecaoProva.Visible:= True
      else
         JvCaptionPanel_CorrecaoProva.Visible:= False;
   end;
end;

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_RespostaProvaClick(Sender: TObject);
begin
   if TratarErro = False then
   begin
      DesabilitaJanelasDeTrabalho('Entrada da Resposta da Prova');

      if JvCaptionPanel_EntradaRespostaProva.Visible = False then
         JvCaptionPanel_EntradaRespostaProva.Visible:= True
      else
         JvCaptionPanel_EntradaRespostaProva.Visible:= False;
   end;
end;

procedure TForm_Cad_CorrecaoProva.JvTransparentButton_FecharEntradaRespostaProvaClick(Sender: TObject);
begin
   JvCaptionPanel_EntradaRespostaProva.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento de erro ao selecionar opcao na correcao de prova
//------------------------------------------------------------------------------

Function TForm_Cad_CorrecaoProva.TratarErro: Boolean;
var
   VB_Retorno: Boolean;
begin
   VB_Retorno:= False;
   if IBQuery_MontaTeste.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage('Não possui Prova cadastrada para executar a opção selecionada...');
      VB_Retorno:= True;
   end
   else
   begin
      if Query_RelacaoAlunos.FieldByName('Nome').AsString = '' then
      begin
         ShowMessage('Não possui Aluno para executar a opção selecionada...');
         VB_Retorno:= True;
      end;
   end;
   TratarErro:= VB_Retorno;
end;

end.
