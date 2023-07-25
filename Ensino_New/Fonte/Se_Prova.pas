//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Prova.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da montagem da prova.                          //
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

unit Se_Prova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, ImgList, StdCtrls, Mask,
  Rotinas,Rotinas_SUE, Rotinas_TrataData, Rotinas_Validar,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, IBCustomDataSet, IBTable,
  IBQuery, JvToolEdit, JvDBCtrl, JvRichEd, JvDBRichEd, JvComponent, ShellApi,
  JvCaptionPanel, Menus, JvEdit, JvGradient, JvxCtrls, JvShape, JvEnterTab,
  TeEngine, Series, TeeProcs, Chart, XPMan, JvCheckBox, JvLookOut, JvLabel,
  JvBlinkingLabel, JvTransBtn, JvGradientCaption, JvPanel, ExportPack;

type
  TForm_Cad_Prova = class(TForm)
    Panel_Treeviw: TPanel;
    DST_Teste: TDataSource;
    DSQ_Teste: TDataSource;
    DST_Avaliacao: TDataSource;
    DSQ_Materia: TDataSource;
    DSQ_Abrangencia: TDataSource;
    DSQ_IP_Item: TDataSource;
    DSQ_Item_Teste: TDataSource;
    DST_ItemTeste: TDataSource;
    DST_Editor_Demo_02: TDataSource;
    Query_Teste: TIBQuery;
    Query_Materia: TIBQuery;
    Query_IP_Item: TIBQuery;
    Query_Item_Teste: TIBQuery;
    Table_Avaliacao: TIBTable;
    Table_Teste: TIBTable;
    Table_ItemTeste: TIBTable;
    Table_Editor_Demo_02: TIBTable;
    Query_TesteIDCURSO: TSmallintField;
    Query_TesteIDTURMA: TIntegerField;
    Query_TesteFASEAPLICACAO: TIBStringField;
    Query_TesteREFERENCIAAVALIACAO: TIBStringField;
    Query_TesteCODMATERIA: TIBStringField;
    Query_TesteDATAAPLICACAO: TDateTimeField;
    Query_MateriaIDCURSO: TSmallintField;
    Query_MateriaCODMATERIA: TIBStringField;
    Query_MateriaNOMEMATERIA: TIBStringField;
    Table_AvaliacaoIDCURSO: TSmallintField;
    Table_AvaliacaoFASEAPLICACAO: TIBStringField;
    Table_AvaliacaoREFERENCIAAVALIACAO: TIBStringField;
    Table_AvaliacaoCODMATERIA: TIBStringField;
    Table_AvaliacaoMEDIAPARCIAL: TIBStringField;
    Table_AvaliacaoPESOAPLICACAO: TSmallintField;
    Table_AvaliacaoMEDIAMINIMA: TIBBCDField;
    Table_AvaliacaoCODPROVA: TIBStringField;
    Table_TesteIDCURSO: TSmallintField;
    Table_TesteIDTURMA: TIntegerField;
    Table_TesteFASEAPLICACAO: TIBStringField;
    Table_TesteREFERENCIAAVALIACAO: TIBStringField;
    Table_TesteCODMATERIA: TIBStringField;
    Table_TesteTOTALALUNOS: TSmallintField;
    Table_TesteTOTALITENS: TSmallintField;
    Table_TesteDURACAO: TIntegerField;
    Query_IP_ItemNUMITEM: TIntegerField;
    Query_IP_ItemIDCURSO: TSmallintField;
    Query_IP_ItemCODMATERIA: TIBStringField;
    Query_IP_ItemDISCIPLINA: TIBStringField;
    Query_IP_ItemUNIDADE: TIBStringField;
    Query_IP_ItemSUBUNIDADE: TIBStringField;
    Query_IP_ItemOBJETIVO: TIBStringField;
    Query_IP_ItemSERIE: TIBStringField;
    Query_IP_ItemTEMPORES: TIBStringField;
    Query_IP_ItemRESPOSTACORRETA: TIBStringField;
    Query_Item_TesteIDCURSO: TSmallintField;
    Query_Item_TesteIDTURMA: TIntegerField;
    Query_Item_TesteNUMITEM: TIntegerField;
    Query_Item_TesteFASEAPLICACAO: TIBStringField;
    Query_Item_TesteREFERENCIAAVALIACAO: TIBStringField;
    Query_Item_TesteCODMATERIA: TIBStringField;
    Query_Item_TesteNUMEROQUESTAO: TSmallintField;
    Query_Item_TesteMATERIA: TIBStringField;
    Query_IP_ItemDESCENALT: TBlobField;
    Table_Editor_Demo_02NUMITEM: TIntegerField;
    Table_Editor_Demo_02DESCENALT: TBlobField;
    DSQ_MontaTeste: TDataSource;
    Table_TesteTOTALIRREGULARIDADE: TSmallintField;
    IBTable_ItemTesteManual: TIBTable;
    DST_ItemTesteManual: TDataSource;
    IBTable_ItemTesteManualIDCURSO: TSmallintField;
    IBTable_ItemTesteManualIDTURMA: TIntegerField;
    IBTable_ItemTesteManualFASEAPLICACAO: TIBStringField;
    IBTable_ItemTesteManualREFERENCIAAVALIACAO: TIBStringField;
    IBTable_ItemTesteManualCODMATERIA: TIBStringField;
    IBTable_ItemTesteManualNUMEROQUESTAO: TSmallintField;
    IBTable_ItemTesteManualRESPOSTACORRETA: TIBStringField;
    IBTable_ItemTesteManualQUESTAOANULADA: TIBStringField;
    IBTable_ItemTesteManualQUESTAOIRREGULAR: TIBStringField;
    IBTable_ItemTesteManualALTERNATIVACORRETAA: TIBStringField;
    IBTable_ItemTesteManualALTERNATIVACORRETAB: TIBStringField;
    IBTable_ItemTesteManualALTERNATIVACORRETAC: TIBStringField;
    IBTable_ItemTesteManualALTERNATIVACORRETAD: TIBStringField;
    IBQuery_ItemTesteManual: TIBQuery;
    DSQ_ItemTesteManual: TDataSource;
    IBQuery_ItemTesteManualNUMEROQUESTAO: TSmallintField;
    IBQuery_ItemTesteManualRESPOSTACORRETA: TIBStringField;
    IBQuery_ItemTesteManualIDCURSO: TSmallintField;
    IBQuery_ItemTesteManualIDTURMA: TIntegerField;
    IBQuery_ItemTesteManualFASEAPLICACAO: TIBStringField;
    IBQuery_ItemTesteManualREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_ItemTesteManualCODMATERIA: TIBStringField;
    Query_Item_TesteDISCIPLINA: TIBStringField;
    Query_Item_TesteUNIDADE: TIBStringField;
    Query_Item_TesteSUBUNIDADE: TIBStringField;
    Query_Item_TesteOBJETIVO: TIBStringField;
    Query_Item_TesteSERIE: TIBStringField;
    Panel_TratarProva: TPanel;
    PageControl_MontaProva: TPageControl;
    TabSheet_MontarTeste: TTabSheet;
    GroupBox_Prova: TGroupBox;
    Label_Data_aplicacao_Prova: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    Edit_NGabarito: TDBEdit;
    JvDBDateEdit_DATAAPLIC: TJvDBDateEdit;
    TabSheet_MontarProvaPorSelecaoItem: TTabSheet;
    Panel6: TPanel;
    TabSheet_InserirGabaritoManualmente: TTabSheet;
    DBEdit_TotalItens: TDBEdit;
    Table_TesteTOTALANULADAS: TIntegerField;
    Table_TesteREFORMULADOS: TSmallintField;
    Table_TesteMANTIDO: TSmallintField;
    DBText1: TDBText;
    DSQ_SelTurma: TDataSource;
    IBQuery_SelTurma: TIBQuery;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IntegerField1: TIntegerField;
    SmallintField5: TSmallintField;
    DST_SelTeste: TDataSource;
    JvCaptionPanel_MontaProva_ItemProva: TJvCaptionPanel;
    DBNavigator2: TDBNavigator;
    DBGrid_ItemProva: TDBGrid;
    JvCaptionPanel_MontaProva_Abrangencia: TJvCaptionPanel;
    JvCaptionPanel_MontaProva_Item: TJvCaptionPanel;
    DBNavigator3: TDBNavigator;
    DBGrid_ItemdeProva: TDBGrid;
    DBGrid_IP_Abrangencia: TDBGrid;
    JvCaptionPanel_MostraItem: TJvCaptionPanel;
    DBRichEdit_Editor: TJvDBRichEdit;
    DBRichEdit_Editor_Demo_00: TJvDBRichEdit;
    Query_TesteTURMA: TIBStringField;
    Table_TesteAPRESENTARNOTA: TIBStringField;
    ToolBar1: TToolBar;
    JvEdit_Dis: TJvEdit;
    JvEdit_NItem: TJvEdit;
    JvEdit_Serie: TJvEdit;
    JvEdit_Obj: TJvEdit;
    JvEdit_SubUnid: TJvEdit;
    JvEdit_Unid: TJvEdit;
    Label7: TLabel;
    DBEditObservacao: TDBEdit;
    Table_TesteOBSERVACAO: TIBStringField;
    Query_IP_ItemRECURSO: TIBStringField;
    IBQuery_SelTurmaTURMA: TIBStringField;
    IBQuery_MontaTeste: TIBQuery;
    Panel8: TPanel;
    GroupBox_Numero_Questao: TGroupBox;
    DBEdit_N_Questao: TDBEdit;
    GroupBox_Total_Itens_Selecionado: TGroupBox;
    DBEdit_TotalIten: TDBEdit;
    GroupBox_Duracao: TGroupBox;
    DBEdit_Dur: TDBEdit;
    Table_AvaliacaoIDTURMA: TIntegerField;
    Query_Item_TesteINDICEFACILIDADE: TIBStringField;
    Table_ItemTesteIDCURSO: TSmallintField;
    Table_ItemTesteIDTURMA: TIntegerField;
    Table_ItemTesteNUMITEM: TIntegerField;
    Table_ItemTesteFASEAPLICACAO: TIBStringField;
    Table_ItemTesteREFERENCIAAVALIACAO: TIBStringField;
    Table_ItemTesteCODMATERIA: TIBStringField;
    Table_ItemTesteMATERIA: TIBStringField;
    Table_ItemTesteNUMEROQUESTAO: TSmallintField;
    Table_ItemTesteQUESTAOANULADA: TIBStringField;
    Table_ItemTesteQUESTAOIRREGULAR: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAA: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAB: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAC: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAD: TIBStringField;
    Table_ItemTesteINDICEFACILIDADE: TIBStringField;
    Table_TesteN_GABARITOS: TIntegerField;
    IBQuery_Item: TIBQuery;
    DSTI_Item: TDataSource;
    IBTable_Item_Desc: TIBTable;
    IBTable_Item_DescNUMITEM: TIntegerField;
    IBTable_Item_DescRESPOSTACORRETA: TIBStringField;
    IBTable_Item_DescQDEAPLIC: TSmallintField;
    IBTable_Item_DescQDEIRREGULARIDADE: TSmallintField;
    IBTable_Item_DescQDEANULADA: TSmallintField;
    IBTable_Item_DescPOSSUI_IMAGEM: TIBStringField;
    IBTable_Item_DescRECURSO: TIBStringField;
    IBTable_Item_DescOBSERVACAO: TIBStringField;
    IBTable_Item_DescDESCENALT: TBlobField;
    IBTable_Item_DescNLINHAS: TSmallintField;
    IBTable_Item_DescTEMPORES: TIBStringField;
    DST_ItemDesc: TDataSource;
    IBQuery_Abrangencia: TIBQuery;
    IBQuery_AbrangenciaIDCURSO: TSmallintField;
    IBQuery_AbrangenciaIDTURMA: TIntegerField;
    IBQuery_AbrangenciaFASEAPLICACAO: TIBStringField;
    IBQuery_AbrangenciaREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_AbrangenciaCODMATERIA: TIBStringField;
    IBQuery_AbrangenciaMATERIA: TIBStringField;
    Table_TesteDATAAPLICACAO: TDateTimeField;
    ToolBar_TrataJanelaParaMostrarItem: TToolBar;
    ToolButton_MostraItem: TToolButton;
    ToolButton_NaoMostrarItem: TToolButton;
    IBQuery_MontaTesteIDCURSO: TSmallintField;
    IBQuery_MontaTesteIDTURMA: TIntegerField;
    IBQuery_MontaTesteFASEAPLICACAO: TIBStringField;
    IBQuery_MontaTesteREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_MontaTesteCODMATERIA: TIBStringField;
    IBQuery_MontaTesteDATAAPLICACAO: TDateTimeField;
    IBQuery_MontaTesteTOTALALUNOS: TSmallintField;
    IBQuery_MontaTesteTOTALITENS: TSmallintField;
    IBQuery_MontaTesteDURACAO: TIntegerField;
    IBQuery_MontaTesteCODPROVA: TIBStringField;
    IBQuery_MontaTestePESOAPLICACAO: TSmallintField;
    IBTable_ItemTesteManualGABARITO: TIntegerField;
    DBRichEdit_Editor_Demo_01: TJvDBRichEdit;
    IBQuery_ItemTesteManualGABARITO: TIntegerField;
    IBQuery_InstrutorTurma: TIBQuery;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_InstrutorTurmaIDENTIDADE: TIBStringField;
    DSQ_InstrutorTurma: TDataSource;
    Query_IP_ItemSTATUS: TIBStringField;
    ImageList1: TImageList;
    IBQuery_ItemIDCURSO: TSmallintField;
    IBQuery_ItemIDTURMA: TIntegerField;
    IBQuery_ItemNUMITEM: TIntegerField;
    IBQuery_ItemCODMATERIA: TIBStringField;
    IBQuery_ItemDISCIPLINA: TIBStringField;
    IBQuery_ItemUNIDADE: TIBStringField;
    IBQuery_ItemSUBUNIDADE: TIBStringField;
    IBQuery_ItemOBJETIVO: TIBStringField;
    IBQuery_ItemSERIE: TIBStringField;
    IBQuery_ItemRESPOSTACORRETA: TIBStringField;
    IBQuery_ItemTEMPORES: TIBStringField;
    Table_TesteSTATUS_APLICACAO: TIBStringField;
    Label9: TLabel;
    ComboBox_StatusAplicacao: TDBComboBox;
    GroupBox1: TGroupBox;
    Table_TesteINICIO_APLICACAO: TDateTimeField;
    Table_TesteTERMINO_APLICACAO: TDateTimeField;
    Table_TesteNUMITEM_REVISAO: TSmallintField;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvCaptionPanel_Relatorios_Imprimir: TJvCaptionPanel;
    JvTransparentButton_FecharImpressao: TJvTransparentButton;
    Panel5: TPanel;
    JvTransparentButton_Rel_DIP: TJvTransparentButton;
    JvTransparentButton_Rel_GPA: TJvTransparentButton;
    JvTransparentButton_Rel_RelacaoAlunosComCodigo: TJvTransparentButton;
    JvTransparentButton_Rel_APA: TJvTransparentButton;
    Bevel1: TBevel;
    JvTransparentButton_Rel_CapaDaProva: TJvTransparentButton;
    JvTransparentButton_Rel_RoteiroAplicacaoProva: TJvTransparentButton;
    JvTransparentButton_Rel_DiscussaoDirigidaProva: TJvTransparentButton;
    JvTransparentButton_ItemProva: TJvTransparentButton;
    JvCaptionPanel_FerramentaAuxiliar: TJvCaptionPanel;
    JvTransparentButton_Fecha_FerramentaAuxiliar: TJvTransparentButton;
    Panel11: TPanel;
    JvTransparentButton_FerramentaAplicarProvaEletronica: TJvTransparentButton;
    JvTransparentButton_Ferramenta_MontarProvaManual: TJvTransparentButton;
    Bevel2: TBevel;
    JvTransparentButton_Ferramenta_SenhaAplicacaoProva: TJvTransparentButton;
    JvTransparentButton_Rel_SenhaAplicacaoProva: TJvTransparentButton;
    JvCaptionPanel_Relatorios_PDF: TJvCaptionPanel;
    JvTransparentButton3: TJvTransparentButton;
    Panel10: TPanel;
    JvTransparentButton_PDF_DIP: TJvTransparentButton;
    JvTransparentButton_PDF_GPA: TJvTransparentButton;
    JvTransparentButton_PDF_APA: TJvTransparentButton;
    Bevel3: TBevel;
    Panel_FornecerNomeArquivo: TJvPanel;
    Label10: TLabel;
    JvShape1: TJvShape;
    JvTransparentButton_SolPDF: TJvTransparentButton;
    Edit_NomeDoArquivo: TEdit;
    ExportQR1: TExportQR;
    Panel3: TPanel;
    SpeedButton_AjustarDescItem: TSpeedButton;
    SpeedButton_Cancela_AjustarItem: TSpeedButton;
    SpeedButton_Grava_AjustarItem: TSpeedButton;
    JvTransparentButton_Imprimir_Rel_LGP: TJvTransparentButton;
    JvTransparentButton_PDF_LGP: TJvTransparentButton;
    IBQuery_Instrutor_Materia: TIBQuery;
    DSQ_Instrutor_Materia: TDataSource;
    PageControl_Abrangencia: TPageControl;
    TabSheet_AbrangenciaProva: TTabSheet;
    Splitter1: TSplitter;
    JvCaptionPanel1: TJvCaptionPanel;
    DBGrid_Materia: TDBGrid;
    ToolBar3: TToolBar;
    JvEdit_DisciplinaAbr: TJvEdit;
    JvEdit_DescAbr: TJvEdit;
    Panel7: TPanel;
    SpeedButtonInsereAbrangencia: TSpeedButton;
    SpeedButton_ExcluiAbrangencia: TSpeedButton;
    JvCaptionPanel2: TJvCaptionPanel;
    DBGrid_Abrangencia: TDBGrid;
    TabSheet_InstrutorResponsavel: TTabSheet;
    JvCaptionPanel_RelacaoInstrutores: TJvCaptionPanel;
    DBGrid_RelacaoInstrutoresTurma: TDBGrid;
    Panel4: TPanel;
    SpeedButton_SelDisciplina: TSpeedButton;
    SpeedButton_ExcluiDisciplinaSelecionada: TSpeedButton;
    JvCaptionPanel_InstrutorSelecionado: TJvCaptionPanel;
    DBGrid_instrutorTurma: TDBGrid;
    IBTable_InstrutorMateria: TIBTable;
    IBTable_InstrutorMateriaIDCURSO: TSmallintField;
    IBTable_InstrutorMateriaCODMATERIA: TIBStringField;
    IBTable_InstrutorMateriaIDENTIDADE: TIBStringField;
    IBTable_InstrutorMateriaOBSERVACAO: TIBStringField;
    IBTable_InstrutorMateriaSTATUS: TIBStringField;
    DST_InstrutorMateria: TDataSource;
    IBQuery_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBQuery_Instrutor_MateriaIDCURSO: TSmallintField;
    IBQuery_Instrutor_MateriaIDTURMA: TIntegerField;
    IBQuery_Instrutor_MateriaCODMATERIA: TIBStringField;
    IBQuery_Instrutor_MateriaIDENTIDADE: TIBStringField;
    IBQuery_Instrutor_MateriaNOMEMATERIA: TIBStringField;
    JvCaptionPanel_RelacaoDeItensParaSerSelecionado: TJvCaptionPanel;
    DBGrid_Disciplina_RelacaoTurma: TDBGrid;
    DBNavigator1: TDBNavigator;
    IBQuery_Sel_Materia: TIBQuery;
    Panel12: TPanel;
    JvTransparentButton_SelDisciplinaInstrutor: TJvTransparentButton;
    JvTransparentButton_ProvaAutomatica: TJvTransparentButton;
    Bevel4: TBevel;
    JvGradientCaption6: TJvGradientCaption;
    DBGrid_Teste: TDBGrid;
    DSQ_SelMateria: TDataSource;
    IBQuery_MontaTesteSTATUS_APLICACAO: TIBStringField;
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
    IBQuery_Sel_MateriaIDCURSO: TSmallintField;
    IBQuery_Sel_MateriaIDTURMA: TIntegerField;
    IBQuery_Sel_MateriaCODMATERIA: TIBStringField;
    IBQuery_Sel_MateriaNOMEMATERIA: TIBStringField;
    TabSheet_CopiaProva: TTabSheet;
    DBGrid_ItemTesteManual: TDBGrid;
    Panel13: TPanel;
    GroupBox_AlterarAlternativaCorreta: TGroupBox;
    ToolBar_AlterarAlternativa: TToolBar;
    ToolButton_A_AlternativaCorretaA: TToolButton;
    ToolButton5: TToolButton;
    ToolButton_A_AlternativaCorretaB: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_A_AlternativaCorretaC: TToolButton;
    ToolButton9: TToolButton;
    ToolButton_A_AlternativaCorretaD: TToolButton;
    GroupBox_InserirAlternativaCorreta: TGroupBox;
    ToolBar_InserirAlternativa: TToolBar;
    ToolButton_I_AlternativaCorretaA: TToolButton;
    ToolButton17: TToolButton;
    ToolButton_I_AlternativaCorretaB: TToolButton;
    ToolButton15: TToolButton;
    ToolButton_I_AlternativaCorretaC: TToolButton;
    ToolButton4: TToolButton;
    ToolButton_I_AlternativaCorretaD: TToolButton;
    ToolButton3: TToolButton;
    ToolButton_ExcluirResposta: TToolButton;
    Panel_SelecaoTurma: TPanel;
    DBGrid_SelecionaTurmaPM: TDBGrid;
    Panel_Msg_SelTurmaProva: TPanel;
    Panel_msgSelProva: TPanel;
    DBGrid_SelecionaProva: TDBGrid;
    Panel_Botao_Copiar: TPanel;
    JvShape3: TJvShape;
    JvExpressButton_CopiaProva: TJvExpressButton;
    DBNavigator_Teste: TDBNavigator;
    JvDateEdit_Aplicacao: TJvDateEdit;
    JvEdit_Prova: TJvEdit;
    JvEdit_DescDisciplina: TJvEdit;
    JvEdit_CodMateria: TJvEdit;
    Panel_SelecaoProva: TPanel;
    JvShape9: TJvShape;
    JvTransparentButton1: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton2: TJvTransparentButton;
    JvShape11: TJvShape;
    BitBtn_GravarItem: TJvTransparentButton;
    JvShape12: TJvShape;
    BitBtn_CancelarItem: TJvTransparentButton;
    JvShape13: TJvShape;
    BitBtn_ExcluiItem: TJvTransparentButton;
    JvShape14: TJvShape;
    BitBtn_NovoItem: TJvTransparentButton;
    GroupBox3: TGroupBox;
    JvEdit_NItem_Inserir: TJvEdit;
    Label1: TLabel;
    Label_Facil: TLabel;
    Label12: TLabel;
    Label_Medio: TLabel;
    Label13: TLabel;
    Label_Dificel: TLabel;
    IBQuery_SelTeste: TIBQuery;
    IBQuery_SelTesteIDCURSO: TSmallintField;
    IBQuery_SelTesteIDTURMA: TIntegerField;
    IBQuery_SelTesteFASEAPLICACAO: TIBStringField;
    IBQuery_SelTesteREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_SelTesteCODMATERIA: TIBStringField;
    IBQuery_SelTesteDATAAPLICACAO: TDateTimeField;
    IBQuery_SelTesteCODPROVA: TIBStringField;
    GroupBox_TotalItens: TGroupBox;
    DBText3: TDBText;
    DBNavigator_ItensManual: TDBNavigator;
    GroupBox2: TGroupBox;
    MaskEdit_Gabarito: TMaskEdit;
    Panel_Frame_SelCurso: TPanel;
    Panel_SelecaoAvaliacao: TPanel;
    DBGrid_Avaliacao: TDBGrid;
    JvBlinkingLabel_Msg: TJvBlinkingLabel;
    SpeedButtonInsereTodasAbrangencia: TSpeedButton;
    IB_Query_Item: TIBQuery;
    IB_Query_ItemIDCURSO: TSmallintField;
    IB_Query_ItemIDTURMA: TIntegerField;
    IB_Query_ItemNUMITEM: TIntegerField;
    IB_Query_ItemCODMATERIA: TIBStringField;
    IB_Query_ItemDISCIPLINA: TIBStringField;
    IB_Query_ItemUNIDADE: TIBStringField;
    IB_Query_ItemSUBUNIDADE: TIBStringField;
    IB_Query_ItemOBJETIVO: TIBStringField;
    IB_Query_ItemSERIE: TIBStringField;
    IB_Query_ItemSTATUS: TIBStringField;
    Query_MateriaIDTURMA: TIntegerField;
    DataSource1: TDataSource;
    Panel_Abrangencia: TPanel;
    SpeedButton1: TSpeedButton;
    JvGradient_Menu: TJvGradient;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_RelatoriosImprimir: TJvTransparentButton;
    JvShape_Atualizar: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape_PDF: TJvShape;
    JvTransparentButton_RelatorioPDF: TJvTransparentButton;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Ferramentas: TJvTransparentButton;
    Memo1: TMemo;
    JvShape2: TJvShape;
    DBText_Prova: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    DBText_FaseAplicacao: TDBText;
    Label6: TLabel;
    DBText6: TDBText;
    DBText4: TDBText;
    Label4: TLabel;

    procedure ZerarIndiceFacilidade;

    procedure InsereAbrangencia(VI_Opcao: Integer);
    procedure Trata_Ferramentas;
    procedure TratarNumeroPress(Sender: TObject; var Key: Char);
    procedure TrataSelDisciplina(Sender: TObject);
    procedure VerificacaoErrosNaImpressaoDoRelatorio;
    procedure TratarPDF(VS_Relatorio: String);
    procedure DesabilitaJanelasDeTrabalho;
    Procedure TratarBotoesAjustarItem(Status: Boolean);

    procedure MostraIndiceProva;
    procedure TratarInsercaoItensProva(PS_Cabec: String; PB_PorSelecao: Boolean; PB_Manual: Boolean);
    procedure AtualizaTotalDeItensTesteManual(VI_TotalItens: Integer);
    procedure TrataBotoesProva(Status: Boolean);
    Procedure Containers(Status: Boolean);
    procedure MontaTeste(Sender: TObject);

    procedure SelecionarTeste(VS_IdCurso: String; VS_IdTurma: String; VS_RefAvaliacao: String; VS_CodMateria: String);
    procedure SelecionaAvaliacao(Sender: TObject);

    procedure Resposta(VS_Opcao, Resposta: String);

    Procedure BotoesProva(Status: Boolean);
    procedure Limpar_Prova;
    procedure Campos_Prova(Status: Boolean);

    procedure Limpar_MontaProva;

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_Query_ItemCellClick(Column: TColumn);
    procedure DBGrid_ItemProvaCellClick(Column: TColumn);
    procedure Table_Abrangencia_PostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
    procedure Query_MontaTurmaAfterScroll(DataSet: TDataSet);
    procedure Table_ItemTestePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Table_TestePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure ToolButton_I_AlternativaCorretaAClick(Sender: TObject);
    procedure ToolButton_I_AlternativaCorretaBClick(Sender: TObject);
    procedure ToolButton_I_AlternativaCorretaCClick(Sender: TObject);
    procedure ToolButton_I_AlternativaCorretaDClick(Sender: TObject);
    procedure ToolButton_ExcluirRespostaClick(Sender: TObject);
    procedure ToolButton_A_AlternativaCorretaAClick(Sender: TObject);
    procedure ToolButton_A_AlternativaCorretaBClick(Sender: TObject);
    procedure ToolButton_A_AlternativaCorretaCClick(Sender: TObject);
    procedure ToolButton_A_AlternativaCorretaDClick(Sender: TObject);
    procedure ToolButton_NaoMostrarItemClick(Sender: TObject);
    procedure ToolButton_MostraItemClick(Sender: TObject);
    procedure DBEdit_TotalItenKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_N_QuestaoKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaListaItens(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_TesteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_MateriaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_IP_AbrangenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ItemdeProvaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButtonInsereAbrangenciaClick(Sender: TObject);
    procedure SpeedButton_ExcluiAbrangenciaClick(Sender: TObject);
    procedure DBGrid_ItemProvaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PageControl_MontaProvaEnter(Sender: TObject);
    procedure PageControl_MontaProvaExit(Sender: TObject);
    procedure SpeedButton_GerarProvaClick(Sender: TObject);
    procedure SpeedButton_AjustarDescItemClick(Sender: TObject);
    procedure IBQuery_MontaTesteAfterScroll(DataSet: TDataSet);
    procedure SpeedButton_Grava_AjustarItemClick(Sender: TObject);
    procedure SpeedButton_Cancela_AjustarItemClick(Sender: TObject);
    procedure JvEdit_DisciplinaAbrChange(Sender: TObject);
    procedure MaskEdit_GabaritoChange(Sender: TObject);
    procedure ToolButton_ajustarItemClick(Sender: TObject);
    procedure SpeedButton_SelDisciplinaClick(Sender: TObject);
    procedure SpeedButton_ExcluiDisciplinaSelecionadaClick(Sender: TObject);
    procedure DBGrid_AbrangenciaCellClick(Column: TColumn);
    procedure DBGrid_MateriaCellClick(Column: TColumn);
    procedure DBGrid_TesteDblClick(Sender: TObject);
    procedure DBGrid_TesteCellClick(Column: TColumn);
    procedure DBGrid_ItemdeProvaDblClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_Rel_DIPClick(Sender: TObject);
    procedure JvTransparentButton_Rel_GPAClick(Sender: TObject);
    procedure JvTransparentButton_Rel_APAClick(Sender: TObject);
    procedure JvTransparentButton_Rel_RelacaoAlunosComCodigoClick( Sender: TObject);
    procedure JvTransparentButton_Rel_CapaDaProvaClick(Sender: TObject);
    procedure JvTransparentButton_Rel_RoteiroAplicacaoProvaClick( Sender: TObject);
    procedure JvTransparentButton_Rel_DiscussaoDirigidaProvaClick( Sender: TObject);
    procedure JvTransparentButton_ItemProvaClick(Sender: TObject);
    procedure JvTransparentButton_Ferramenta_SenhaAplicacaoProvaClick( Sender: TObject);
    procedure JvTransparentButton_FerramentaAplicarProvaEletronicaClick( Sender: TObject);
    procedure JvTransparentButton_Ferramenta_MontarProvaManualClick(Sender: TObject);
    procedure JvTransparentButton_PDF_DIPClick(Sender: TObject);
    procedure JvTransparentButton_SolPDFClick(Sender: TObject);
    procedure JvTransparentButton_PDF_GPAClick(Sender: TObject);
    procedure JvTransparentButton_PDF_APAClick(Sender: TObject);
    procedure JvTransparentButton_RelatoriosImprimirClick(Sender: TObject);
    procedure JvTransparentButton_FecharImpressaoClick(Sender: TObject);
    procedure JvTransparentButton_FerramentasClick(Sender: TObject);
    procedure JvTransparentButton_Fecha_FerramentaAuxiliarClick( Sender: TObject);
    procedure JvTransparentButton3Click(Sender: TObject);
    procedure JvTransparentButton_RelatorioPDFClick(Sender: TObject);
    procedure JvTransparentButton_Imprimir_Rel_LGPClick(Sender: TObject);
    procedure JvTransparentButton_PDF_LGPClick(Sender: TObject);
    procedure DBGrid_Disciplina_RelacaoTurmaTitleClick(Column: TColumn);
    procedure JvTransparentButton_SelDisciplinaInstrutorClick( Sender: TObject);
    procedure JvTransparentButton_ProvaAutomaticaClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvExpressButton_CopiaProvaClick(Sender: TObject);
    procedure BitBtn_GravarItemClick(Sender: TObject);
    procedure BitBtn_CancelarItemClick(Sender: TObject);
    procedure BitBtn_ExcluiItemClick(Sender: TObject);
    procedure BitBtn_NovoItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonInsereTodasAbrangenciaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private    { Private declarations }
     OrderByMateria, VS_ComandoMateria, VS_RelatorioPDF: String;
     OrderByTeste, OrderByturma, VS_Opcao, VS_IdTurma: String;
     VS_Gabarito, VS_FaseApli, VS_RefAval, VS_CodMateria, VS_Materia, VS_NumeroItem: String;
     FaseAplicacao_Ant, ReferenciaAvaliacao_Ant, CodMateria_ant: String;

     VI_QtdIten, VI_TotalItens, VI_NumQuestao: Integer;

     AS_Materia: array[1..200] of String;
     AS_NumeroItem: array[1..200] of String;

     bmIP_Item, bmMateriaProva : TBookmark;
  public    { public declarations }
     VS_DescCurso, VS_CodCurso, VS_TipoProva: String;
     NPaginas: integer;
  end;
var
  Form_Cad_Prova: TForm_Cad_Prova;

implementation

uses Module, MenuPrincipal, Sel_QGA, Sel_Disciplina, MontaProva,
    Rel_RelatorioDoCadastroDeAlunosComCodigo, ColetaItens,
    MontaProvaEletronica, Editor_Texto, Rel_AtaDePresenca_Cindacta2,
    Rel_AtaDePresenca, Rel_DIP, MontaGabarito, Rel_GPA_CINDACTAII, Rel_GPA,
    Rel_LGP, MontarProvaAutomatica, Frame_Sel_Curso, ColetaItensSTO,
  Rel_GPA_CIAAN;

{$R *.dfm}

//------------------------------------------------------------------------------
// Configuracao na criacao da Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.FormCreate(Sender: TObject);
begin
   PageControl_MontaProva.TabIndex:= 0;
   JvCaptionPanel_Relatorios_PDF.Height:= 155;
   JvCaptionPanel_Relatorios_PDF.Top:= 114;
   JvCaptionPanel_Relatorios_Imprimir.Top:=114;
   JvCaptionPanel_FerramentaAuxiliar.Top:=114;
   DesabilitaJanelasDeTrabalho;
end;

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      JvGradient_Menu.StartColor:= Cor_Tela;
      JvGradient_Botoes.StartColor:= Cor_Tela;

      Funcoes.CabecalhoForm( Form_Cad_Prova, ' Monta Prova');

      OrderByturma:= 'Ano desc , Turma ';

      OrderByTeste:= ' Order By t.DataAplicacao Desc';
      OrderByMateria:= ' order by CodMateria ';

      JvCaptionPanel_RelacaoDeItensParaSerSelecionado.Visible:= True;
      JvTransparentButton_SelDisciplinaInstrutorClick(Sender);


      if Funcoes.GetAcesso = 'A' then
         JvTransparentButton_ItemProva.Visible:= True
      else
         JvTransparentButton_ItemProva.Visible:= False;

      TratarBotoesAjustarItem(False);
      Campos_Prova(False);

      // Monta o Cabecalho da Grid

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Montar Prova');    // Abre o perfil do usuario em relacao a agenda
      VS_Gabarito:= MaskEdit_Gabarito.Text;

      //--- Tratamento dos containers de trabalho

      ToolButton_MostraItemClick(Sender);
      JvBlinkingLabel_Msg.Visible:= False;
      Panel_SelecaoAvaliacao.Visible:= False;

      Table_Teste.Open;

      IBTable_Item_Desc.Open;
      IBQuery_InstrutorTurma.Open;

      Query_Materia.Open;
      Query_IP_Item.Open;
      Query_Item_Teste.Open;

      Table_Avaliacao.Open;
      Table_Teste.Open;
      IBQuery_Abrangencia.Open;
      Table_ItemTeste.Open;
      Table_Editor_Demo_02.Open;
      IBTable_InstrutorMateria.Open;

      IBQuery_Instrutor_Materia.Open;
      IBQuery_ItemTesteManual.Open;
      IBTable_ItemTesteManual.Open;
      IBQuery_SelTurma.Open;
      IBQuery_SelTeste.Open;

      Query_Materia.Open;
      IB_Query_Item.Open;

      JvCaptionPanel_MostraItem.Caption:= 'Item da Prova';

      Limpar_MontaProva;
      BotoesProva(True);
      Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancelar);

      VS_Opcao:= 'Consulta';

      //--- Tratamento da Selecao dos Cursos

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Cad_Prova.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', 'Em Andamento');
      Funcoes.SetCadCurso('CadCurso');
      MontaTeste(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_RetornarClick(Sender: TObject);
begin
    VS_Opcao:= 'Abertura';
    Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Dabilida as janelas de trabalho
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.DesabilitaJanelasDeTrabalho;
begin
   JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
   JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
   JvCaptionPanel_Relatorios_PDF.Visible:= False;
   Panel_FornecerNomeArquivo.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento quando a Form eh fechada
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ((Table_Teste.State = DSInsert) or (Table_Teste.State = DSEdit )) then
      Table_Teste.Cancel;

   if ((Table_ItemTeste.State = DSInsert) or (Table_ItemTeste.State = DSEdit )) then
      Table_ItemTeste.Cancel;

   if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
      IBTable_Item_Desc.Cancel;

   IBQuery_Instrutor_Materia.Close;
   IBQuery_InstrutorTurma.Close;
   Table_Avaliacao.Close;
   Table_Teste.Close;
   Table_ItemTeste.Close;
   Table_Editor_Demo_02.Close;
   IBTable_ItemTesteManual.Close;
   IBTable_InstrutorMateria.Close;

   IBQuery_SelTeste.Close;
   IBQuery_SelTurma.Close;

   Query_Materia.Close;
   Query_IP_Item.Close;
   Query_Item_Teste.Close;
   IBQuery_Item.Close;

   IBQuery_Abrangencia.Close;
   Query_Materia.Close;
   IB_Query_Item.Close;

   Action:= caFree;
   Form_Cad_Prova:=nil;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de atualizacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_MontaTeste);
end;

//------------------------------------------------------------------------------
// Procedure parar tratar Botoes
//------------------------------------------------------------------------------

Procedure TForm_Cad_Prova.BotoesProva(Status: Boolean);
begin
   if ((Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'APLICAR') or
       (Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'ANDAMENTO')) then
      Status:= False;

   BitBtn_NovoItem.Enabled:= Status;
   BitBtn_ExcluiItem.Enabled:= Status;
   GroupBox_InserirAlternativaCorreta.Enabled:= Status;
   GroupBox_AlterarAlternativaCorreta.Enabled:= Status;

   JvTransparentButton_FerramentaAplicarProvaEletronica.Enabled:= Status;
   DBGrid_ItemProva.Enabled:= Status;
   JvCaptionPanel_MostraItem.Enabled:= Status;
   JvCaptionPanel_MontaProva_Item.Enabled:= Status;
   JvCaptionPanel_MontaProva_Abrangencia.Enabled:= Status;
   TabSheet_MontarTeste.Enabled:= Status;

   GroupBox_InserirAlternativaCorreta.Visible:= Status;
   GroupBox_AlterarAlternativaCorreta.Visible:= Status;

   if ((Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'APLICAR') or
       (Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'ANDAMENTO')) then
      Status:= False
   else
      if Status = True then
         Status:= False
      else
         Status:= true;

   BitBtn_GravarItem.Enabled:= Status;
   BitBtn_CancelarItem.Enabled:= Status;
end;
//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_Cad_Prova.Containers(Status: Boolean);
begin
   Panel_Treeviw.Enabled:= Status;
   JvTransparentButton_Atualiza.Enabled:= Status;
   JvTransparentButton_Ferramentas.Enabled:= Status;
   JvTransparentButton_RelatoriosImprimir.Enabled:= Status;
   JvTransparentButton_RelatorioPDF.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;

   Panel_Abrangencia.Enabled:= Status;
//   PageControl_Abrangencia.Enabled:= Status;
   JvCaptionPanel_MontaProva_Abrangencia.Enabled:= Status;
   JvCaptionPanel_MontaProva_Item.Enabled:= Status;
   JvCaptionPanel_MontaProva_ItemProva.Enabled:= Status;

   ToolBar_InserirAlternativa.Enabled:= Status;
   ToolBar_AlterarAlternativa.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da Turma
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.SelecionarTeste(VS_IdCurso: String; VS_IdTurma: String; VS_RefAvaliacao: String; VS_CodMateria: String);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select Tu.Turma, T.IdCurso, T.IdTurma, T.FaseAplicacao, T.ReferenciaAvaliacao, T.CodMateria, T.DataAplicacao '+
                ' From Teste T, Turma Tu '+
                ' Where T.IdTurma = Tu.IdTurma';

   if VS_IdCurso <> '' then
      VS_Comando:= VS_Comando+' and T.IdCurso = '+VS_IdCurso;

   if VS_IdTurma <> '' then
      VS_Comando:= VS_Comando+' and T.IdTurma = '+VS_IdTurma;

   if VS_RefAvaliacao <> '' then
      VS_Comando:= VS_Comando+' and T.ReferenciaAvaliacao = '+#39+VS_RefAvaliacao+#39;

   if VS_CodMateria <> '' then
      VS_Comando:= VS_Comando+' and T.CodMateria = '+#39+VS_CodMateria+#39;

   Funcoes.ExecutaQuery(Query_Teste, VS_Comando+' order by T.IdCurso, T.IdTurma, T.FaseAplicacao, T.ReferenciaAvaliacao ');

   IBQuery_Abrangencia.Open;
end;

//------------------------------------------------------------------------------
// Tratamanto para mostra teste
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.IBQuery_MontaTesteAfterScroll(DataSet: TDataSet);
var
   VS_RefAvaliacao, VS_CodMateria: String;
begin
   if VS_Opcao <> 'Abertura' then
   begin
      TabSheet_CopiaProva.Caption:= 'Exportar a prova '+IBQuery_MontaTeste.FieldByName('CodProva').AsString+' da turma selecionada para ';
      VS_IdTurma:= IBQuery_MontaTeste.FieldByName('IdTurma').AsString;
      VS_RefAvaliacao:= IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString;
      VS_CodMateria:= IBQuery_MontaTeste.FieldByName('CodMateria').AsString;

      if trim(VS_IdTurma) = '' then
         TrataBotoesProva(False)
      else
         TrataBotoesProva(True);

      SelecionarTeste(DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString, VS_RefAvaliacao, VS_CodMateria);

       //
      // Verifica se não existe gabarito montado

      Query_Item_Teste.Open;
      if ((Query_Item_Teste.FieldByName('IdTurma').AsString = '') and (IBQuery_ItemTesteManual.FieldByName('IdTurma').AsString = '')) then
         TratarInsercaoItensProva('Gabarito da Prova feita Pelo Sistema', True, True)
      else
         if Query_Item_Teste.FieldByName('IdTurma').AsString <> '' then
            TratarInsercaoItensProva('Gabarito da Prova feita Pelo Sistema', True, False)
         else
            TratarInsercaoItensProva('Gabarito da Prova feita Manualmente', False, True);

      Trata_Ferramentas;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Das Abas de montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.TratarInsercaoItensProva(PS_Cabec: String; PB_PorSelecao: Boolean; PB_Manual: Boolean);
begin
   VS_TipoProva:= PS_Cabec;
   TabSheet_MontarProvaPorSelecaoItem.TabVisible:= PB_PorSelecao;
   TabSheet_InserirGabaritoManualmente.TabVisible:= PB_Manual;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.TrataBotoesProva(Status: Boolean);
begin
   PageControl_Abrangencia.Visible:= Status;

   TabSheet_MontarProvaPorSelecaoItem.TabVisible:= Status;
   GroupBox_Prova.Visible:= Status;
   JvTransparentButton_Alterar.Visible:= Status;
   JvShapeModificarProva.Visible:= Status;
   JvTransparentButton_Exclui.Visible:= Status;
   JvShape_ExcluirProva.Visible:= Status;
end;

//------------------------------------------------------------------------------
//
// Tratamento prova - 23/03/2006
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Limpa os campos Montagem do prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Limpar_prova;
begin
   JvDBDateEdit_DATAAPLIC.Text:= '';
   DBEdit_TotalItens.Text:= '';
   Edit_NGabarito.Text:= '';
   DBEditObservacao.Text:= '';
end;

//------------------------------------------------------------------------------
// Tratamento dos Campos prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Campos_prova(Status: Boolean);
begin
   JvBlinkingLabel_Msg.Visible:= Status;
   JvDBDateEdit_DATAAPLIC.Enabled:= Status;
   Edit_NGabarito.Enabled:= Status;
   DBEdit_TotalItens.Enabled:= Status;
   ComboBox_StatusAplicacao.Enabled:= Status;
   DBEditObservacao.Enabled:= Status;
end;                                                          

//------------------------------------------------------------------------------
// Selecao do Teste
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.SelecionaAvaliacao(Sender: TObject);
var
   VS_Comando: String;
begin
   if VS_Opcao <>  'Cancelar' then
   begin
      VS_Comando:= 'Select Count(1) Qtd from teste '+
                   ' where IdCurso = '+ DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                   ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                   ' and referenciaAvaliacao = '+#39+Table_Avaliacao.FieldByName( 'referenciaAvaliacao').AsString+#39+
                   ' and codMateria = '+#39+Table_Avaliacao.FieldByName( 'codMateria').AsString+#39+
                   ' and faseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'faseAplicacao').AsString+#39;

      if Funcoes.QtdRegistro(VS_Comando) > 0 then
      begin
         ShowMessage(' Já existe teste cadastrado com a Avaliação selecionada...');
         DBGrid_Avaliacao.SetFocus;
      end
      else
      begin
         if ((Table_Teste.State = DSInsert) or (Table_Teste.State = DSEdit )) then
         begin
            GroupBox_Prova.Visible:= True;
            JvTransparentButton_Grava.Enabled:= True;

            Table_Teste.FieldByName( 'referenciaAvaliacao').AsString:= Table_Avaliacao.FieldByName( 'referenciaAvaliacao').AsString;
            Table_Teste.FieldByName( 'codMateria').AsString:= Table_Avaliacao.FieldByName( 'codMateria').AsString;
            Table_Teste.FieldByName( 'faseAplicacao').AsString:= Table_Avaliacao.FieldByName( 'faseAplicacao').AsString;
            Panel_SelecaoAvaliacao.Visible:= False;

            JvDBDateEdit_DATAAPLIC.SetFocus;
         end;
      end;
   end
   else
      VS_Opcao:= 'Consultar';
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_InserirClick(Sender: TObject);
begin
   if Table_Avaliacao.RecordCount = 0 then
   begin
      Funcoes.SetCadCurso('MenuPrincipal');
      MessageDlg('Não possui QGA cadastrada para a Turma Selecionada ...',mtWarning, [mbOK], 0);
      Application.CreateForm(TForm_Sel_QGA, Form_Sel_QGA);
      Form_Sel_QGA.ShowModal;
      Form_Sel_QGA.Free;
      Table_Avaliacao.Close;
      Table_Avaliacao.Open;
      Funcoes.SetCadCurso('MenuPrincipal');
   end
   else
   begin
      VS_Opcao:= 'Inserir';
      Limpar_prova;
      Campos_prova(True);
      Containers(False);
      Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);

      //--- Tratamento do Contador de medias

      ZerarIndiceFacilidade;

      Panel_Abrangencia.Visible:= False;
//      PageControl_Abrangencia.Visible:= False;
      Panel_SelecaoAvaliacao.Visible:= True;
      Table_Teste.Insert;
      Table_Teste.FieldByName( 'IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
      Table_Teste.FieldByName( 'IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      Table_Teste.FieldByName( 'TotalAlunos').AsInteger:= Funcoes.QtdRegistro('Select Count(1) Qtd from AlunoTurma where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+' and MotivoDesligamento = '+#39+'a'+#39 );
      Table_Teste.FieldByName( 'DURACAO').AsString:= '0000';
      if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
      
         Table_Teste.FieldByName( 'TotalItens').AsInteger:= 40
      else
         Table_Teste.FieldByName( 'TotalItens').AsInteger:= 30;

      Table_Teste.FieldByName( 'N_Gabaritos').AsInteger:= 1;
      Table_Teste.FieldByName( 'TotalIrregularidade').AsInteger:= 0;
      Table_Teste.FieldByName( 'TotalAnuladas').AsInteger:= 0;
      Table_Teste.FieldByName( 'Reformulados').AsInteger:= 0;
      Table_Teste.FieldByName( 'Mantido').AsInteger:= 0;
      Table_Teste.FieldByName( 'ApresentarNota').AsString:= 'N';
      Table_Teste.FieldByName( 'DataAplicacao').AsString:= DateToStr(Date);
      Table_Teste.FieldByName( 'ApresentarNota').AsString:= 'N';
      Table_Teste.FieldByName( 'Status_Aplicacao').AsString:= 'STANDY BY';
      Table_Teste.FieldByName('Inicio_Aplicacao').AsString:= '00:00:00';
      DBGrid_Avaliacao.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Zerar o indice de dacilidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ZerarIndiceFacilidade;
begin
   Label_Dificel.Caption:= '0';
   Label_Facil.Caption:=  '0';
   Label_Medio.Caption:=  '0';
end;

//------------------------------------------------------------------------------
// Tratamento do botao Altera prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   if Table_Teste.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage('Não possuí prova cadastrada...');
   end
   else
   begin
      VS_Opcao:= 'Alterar';
      Campos_prova(True);
      Containers(False);

       //--- Tratamento do combo de tratamento do Status da prova

       ComboBox_StatusAplicacao.Clear;

       if Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'STANDY BY' then
          ComboBox_StatusAplicacao.Items.Add('APLICAR')
       else
       begin
          ComboBox_StatusAplicacao.Items.Add('ANDAMENTO');
          ComboBox_StatusAplicacao.Items.Add('DISCUSSÃO');
          ComboBox_StatusAplicacao.Items.Add('RECURSO');
          ComboBox_StatusAplicacao.Items.Add('STANDY BY');
       end;

      Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
      Panel_SelecaoAvaliacao.Visible:= True;

      FaseAplicacao_Ant:= Table_Teste.FieldByName( 'FaseAplicacao').AsString;
      ReferenciaAvaliacao_Ant:= Table_Teste.FieldByName( 'ReferenciaAvaliacao').AsString;
      CodMateria_ant:= Table_Teste.FieldByName( 'CodMateria').AsString;

      Table_Avaliacao.Locate('ReferenciaAvaliacao', ReferenciaAvaliacao_Ant,[]);
      Table_Teste.Edit;
      JvDBDateEdit_DATAAPLIC.SetFocus;
   end;
end;

procedure TForm_Cad_Prova.DBGrid_TesteDblClick(Sender: TObject);
begin
   JvTransparentButton_AlterarClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Where: String;
begin
   if IBQuery_MontaTeste.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage('Não possuí prova cadastrada...');
   end
   else
   begin
      VS_Where:= ' where idcurso = '+Table_Teste.FieldByName('IdCurso').AsString+
                 ' and IdTurma = '+Table_Teste.FieldByName('IdTurma').AsString+
                 ' and FaseAplicacao = '+#39+Table_Teste.FieldByName('FaseAplicacao').AsString+#39+
                 ' and ReferenciaAvaliacao = '+#39+Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                 ' and CodMateria = '+#39+Table_Teste.FieldByName('CodMateria').AsString+#39;

      VI_retorno:= Funcoes.QtdRegistro( 'Select count(1) as Qtd from ResultadoExame '+VS_Where );
      if VI_retorno > 0 then
         VI_Retorno:= Application.MessageBox('Os alunos possuem Notas nesta Prova'+#13+#13+'Se confirmar o desejo de excluir a Prova as notas também serão excluídas'+#13+#13+'Deseja realmente excluir a PROVA...', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion)
      else
         VI_Retorno:= Application.MessageBox('Essa exclusão eliminará Prova selecionada '+#13+#13+'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

       if VI_Retorno = IDYes then
       begin
          Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Exclusão da Prova do Curso: '+Funcoes.GetCodCurso+' - Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Prova: '+DBText_Prova.Caption );
          Table_Teste.Delete;    // Exclui o arquivo
          Funcoes.ExecutaTransacao;

          Funcoes.ExecusaoQuery('Delete from ResultadoExame '+VS_Where);
          Funcoes.ExecusaoQuery('Delete from Respostaaluno '+VS_Where);
          Funcoes.ExecusaoQuery('Delete from Testeaplicacao '+VS_Where);
          Funcoes.ExecusaoQuery('Delete From ItemTeste '+VS_Where);
          Funcoes.ExecusaoQuery('Delete From ItemTesteManual '+VS_Where);
          Funcoes.ExecusaoQuery('Delete From TesteAbrangencia '+VS_Where);
          Funcoes.ExecusaoQuery('Delete From TesteAplicacao '+VS_Where);
          Funcoes.ExecusaoQuery('Delete From TestePedidoRevisaoItem '+VS_Where);
          Funcoes.ExecusaoQuery('Delete From GabaritoProva '+VS_Where);

          Limpar_Prova;

          Funcoes.AtualizaQuery(IBQuery_MontaTeste);
       end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de gravacao dos dados inseridos ou alterados Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_GravaClick(Sender: TObject);
var
   VS_Where: String;
begin
      if DateToStr(JvDBDateEdit_DATAAPLIC.Date) = '30/12/1899' then
      begin
         ShowMessage('Não foi fornecido a data da aplicação da prova...');
         JvDBDateEdit_DATAAPLIC.SetFocus;
      end
      else
      begin
         if StrToInt(Edit_NGabarito.Text) <= 0 then
         begin
            ShowMessage('O Gabarito deve ser 1 ou mais...');
            Edit_NGabarito.SetFocus;
         end
         else
         begin
            if Table_Teste.FieldByName( 'FaseAplicacao').AsString = '' then
            begin
               ShowMessage('Não foi selecionado a Prova, Selecione a prova e de um duplo click na opção.');
               DBGrid_Avaliacao.SetFocus;
            end
            else
            begin
               Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Gravar '+VS_Opcao+' da Prova do Curso '+Funcoes.GetCodCurso+' - Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Prova '+Table_Avaliacao.FieldByName('CodProva').AsString);

               Table_Teste.Post;
               Funcoes.ExecutaTransacao;
               Table_Teste.Close;
               Table_Teste.Open;

               //--- Tratamento para cadastrar Abrangencia quando for Insercao

               if VS_Opcao = 'Inserir' then
               begin
                  Funcoes.OpenQuery('Select Materia from abrangencia_Prova '+
                                    ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                    ' and idTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                    ' and FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+
                                    ' and ReferenciaAvaliacao = '+#39+Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString+#39+
                                    ' and CodMateria = '+#39+Table_Avaliacao.FieldByName( 'CodMateria').AsString+#39
                                   );

                  DM.IBQuery_Executa.First;
                  While not DM.IBQuery_Executa.Eof do
                  begin
                     Funcoes.ExecusaoQuery('Insert into TesteAbrangencia (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Materia) '+
                                           ' Values ('+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+', '+
                                                       DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+', '+
                                                       #39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                       #39+Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString+#39+', '+
                                                       #39+Table_Avaliacao.FieldByName( 'CodMateria').AsString+#39+', '+
                                                       #39+DM.IBQuery_Executa.FieldByName( 'Materia').AsString+#39+
                                                     ')'
                                           );
                     DM.IBQuery_Executa.Next;
                  end;
                  Funcoes.ExecutaTransacao;
               end;

               if VS_Opcao = 'Alterar' then
               begin
                  if Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString <> ReferenciaAvaliacao_Ant then
                  begin
                     Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Gravar Alteração da Referencia da Prova do Curso '+Funcoes.GetCodCurso+' - Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Referencia '+ReferenciaAvaliacao_Ant+' para '+Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString);

                     VS_Where:= ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                ' and idTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                ' and FaseAplicacao = '+#39+FaseAplicacao_Ant+#39+
                                ' and ReferenciaAvaliacao = '+#39+ReferenciaAvaliacao_Ant+#39+
                                ' and CodMateria = '+#39+CodMateria_ant+#39;


                     Funcoes.ExecusaoQuery('Update ItemTesteManual set FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                                  'ReferenciaAvaliacao = '+#39+Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString+#39+', '+
                                                                  'CodMateria = '+#39+Table_Avaliacao.FieldByName( 'CodMateria').AsString+#39+
                                            VS_Where
                                          );

                     Funcoes.ExecusaoQuery('Update TesteAbrangencia set FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                                       'ReferenciaAvaliacao = '+#39+Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString+#39+', '+
                                                                       'CodMateria = '+#39+Table_Avaliacao.FieldByName( 'CodMateria').AsString+#39+
                                            VS_Where
                                           );

                     Funcoes.ExecusaoQuery('Update ResultadoExame set FaseAplicacao = '+#39+Table_Avaliacao.FieldByName( 'FaseAplicacao').AsString+#39+', '+
                                                                     'ReferenciaAvaliacao = '+#39+Table_Avaliacao.FieldByName( 'ReferenciaAvaliacao').AsString+#39+', '+
                                                                     'CodMateria = '+#39+Table_Avaliacao.FieldByName( 'CodMateria').AsString+#39+
                                            VS_Where
                                           );
                  end;
               end;

               if VS_Opcao = 'Inserir' then
               begin
                   IBQuery_Sel_Materia.Close;
                   IBQuery_Sel_Materia.Open;
                   if IBQuery_Sel_Materia.FieldByName('IdCurso').AsString = '' then
                   begin
                      Funcoes.SetCadCurso('MenuPrincipal');
                      ShowMessage('A Turma não possui disciplina cadastrada para montar a abrangencia da prova...');
                      Application.CreateForm(TForm_Sel_Disciplina, Form_Sel_Disciplina);
                      Form_Sel_Disciplina.ShowModal;
                      Form_Sel_Disciplina.Free; //libera o form da memória
                      Funcoes.AtualizaQuery(IBQuery_Sel_Materia);
                      Funcoes.SetCadCurso('MenuPrincipal');
                   end;
               end;
               Trata_Ferramentas;
               Campos_Prova(False);
               Containers(True);

               Panel_SelecaoAvaliacao.Visible:= False;
               Panel_Abrangencia.Visible:= True;

               Funcoes.AtualizaQuery(IBQuery_MontaTeste);
               BotoesProva(True);
               Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);

               VS_Opcao:= 'Consulta';

            end;
         end;
      end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Cadastro da Prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   try
       Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Cancelar a '+VS_opcao+' do Curso '+Funcoes.GetCodCurso+' - Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Prova '+Table_Avaliacao.FieldByName('CodProva').AsString);
       if VS_Opcao = 'Inserir' then
          Limpar_Prova;

       VS_Opcao:= 'Cancelar';
       Table_Teste.Cancel;
       Funcoes.ExecutaTransacao;

       Campos_Prova(False);
       Containers(True);
       Panel_SelecaoAvaliacao.Visible:= False;
       Panel_Abrangencia.Visible:= True;

       Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
       Trata_Ferramentas;
   except
      Table_Teste.Cancel;
      Funcoes.ExecutaTransacao;
   end;
end;

//----------------------------------------------------------------------------//
// Cadastratamento do Teste de Abrangencia
//----------------------------------------------------------------------------//

procedure TForm_Cad_Prova.InsereAbrangencia(VI_Opcao: Integer);
var
    VS_Comando: String;
begin
   //--- Verificacao sa a abrangencia ja foi cadastrada

   VS_Comando:= ' Select count(1) Qtd from TesteAbrangencia '+
                ' where IdCurso = '+Table_Teste.FieldByNAme('IdCurso').AsString+
                ' and IdTurma = '+VS_IdTurma+
                ' and faseAplicacao = '+#39+Table_Teste.FieldByNAme('faseAplicacao').AsString+#39+
                ' and ReferenciaAvaliacao = '+#39+Table_Teste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                ' and CodMateria = '+#39+Table_Teste.FieldByName('CodMateria').AsString+#39+
                ' and Materia = '+#39+Query_Materia.FieldByName( 'codMateria').AsString+#39;

   if Funcoes.QtdRegistro(VS_Comando) = 0 then
   begin
      Funcoes.ExecusaoQuery('Insert into TesteAbrangencia (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Materia) '+
                            ' Values ('+Table_Teste.FieldByNAme('IdCurso').AsString+', '+
                                        VS_IdTurma+', '+
                                        #39+Table_Teste.FieldByName('FaseAplicacao').AsString+#39+', '+
                                        #39+Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+', '+
                                        #39+Table_Teste.FieldByName('CodMateria').AsString+#39+', '+
                                        #39+Query_Materia.FieldByName('CodMateria').AsString+#39+
                                      ')'
                                     );
   end
   else
   begin
      if VI_Opcao = 1 then
          MessageDlg('Esta disciplina ja foi cadastrada na abrangencia...',mtWarning, [mbOK], 0);
   end;
   Query_Materia.next;
end;

//----------------------------------------------------------------------------//
// Tratamento do botao de inserir Abrangencia selecionada
//----------------------------------------------------------------------------//

procedure TForm_Cad_Prova.SpeedButtonInsereAbrangenciaClick(Sender: TObject);
begin
   if IB_Query_Item.FieldByName('IdCurso').AsString = '' then
   begin
       ShowMessage('A Disciplina selecionada não possuí item cadastrado, por isto não será inserida...');
   end
   else
   begin
      VS_Opcao:= 'Abertura';
      InsereAbrangencia(1);
      VS_Opcao:= 'Consulta';
      Funcoes.AtualizaQuery(IBQuery_Abrangencia);
   end;
end;

//----------------------------------------------------------------------------//
// Tratamento do botao de inserir todas Abrangencia selecionada
//----------------------------------------------------------------------------//

procedure TForm_Cad_Prova.SpeedButtonInsereTodasAbrangenciaClick(Sender: TObject);
var
   bmMateria: TBookmark;
begin
   VS_Opcao:= 'Abertura';
   bmMateria:= Query_Materia.GetBookMark;
   Query_Materia.First;
   While not Query_Materia.Eof do
   begin
      if IB_Query_Item.FieldByName('IdCurso').AsString <> '' then
         InsereAbrangencia(2)
      else
         Query_Materia.next;
   end;
   Funcoes.AtualizaQuery(Query_Item_Teste);
   Query_Materia.GotoBookmark(bmMateria);
   Query_Materia.FreeBookMark(bmMateria);

   VS_Opcao:= 'Consulta';
   Funcoes.AtualizaQuery(IBQuery_Abrangencia);
end;

//-----------------------------------------------------------------------------
// Tem a Funcao de Excluir a Abrangencia Selecionada
//-----------------------------------------------------------------------------

procedure TForm_Cad_Prova.SpeedButton_ExcluiAbrangenciaClick(Sender: TObject);
var
   VI_Retorno: Integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará abrangencia selecionada '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      VS_Opcao:= 'Abertura';
      bmIP_Item:= IBQuery_Abrangencia.GetBookMark;
      Funcoes.ExecusaoQuery(' Delete From TesteAbrangencia '+
                            ' where IdCurso = '+IBQuery_Abrangencia.FieldByNAme('IdCurso').AsString+
                            ' and   IdTurma = '+IBQuery_Abrangencia.FieldByNAme('IdTurma').AsString+
                            ' and   faseAplicacao = '+#39+IBQuery_Abrangencia.FieldByNAme('faseAplicacao').AsString+#39+
                            ' and   ReferenciaAvaliacao = '+#39+IBQuery_Abrangencia.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                            ' and   CodMateria = '+#39+IBQuery_Abrangencia.FieldByName('CodMateria').AsString+#39+
                            ' and   Materia = '+#39+IBQuery_Abrangencia.FieldByName( 'Materia').AsString+#39
                           );

      IBQuery_Abrangencia.Close;
      IBQuery_Abrangencia.Open;

      IBQuery_Abrangencia.GotoBookmark(bmIP_Item);
      IBQuery_Abrangencia.FreeBookMark(bmIP_Item);
   end;

   VS_Opcao:= 'Consulta';
end;

//------------------------------------------------------------------------------
//
// Montagem da prova - 30/03/2006
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tratamento da Selecao do Item que compoem a prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.AtualizaListaItens(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select NumItem, IdCurso, IdTurma, CodMateria, Disciplina, Unidade, SubUnidade, Objetivo, Serie, TempoRes, RespostaCorreta,  DescEnAlt, Status, Recurso '+
                ' From Item_Prova_View  '+
                ' Where IdCurso   =:IdCurso  '+
                ' and   IdTurma = :IdTurma  '+
                ' and   CodMateria  =:Materia  ';

   if Trim(JvEdit_Dis.Text) <> '' then
      VS_Comando:= VS_Comando+' and Disciplina = '+#39+Trim(JvEdit_Dis.Text)+#39;

   if Trim(JvEdit_Unid.Text) <> '' then
      VS_Comando:= VS_Comando+' and  Unidade = '+#39+Trim(JvEdit_Unid.Text)+#39;

   if Trim(JvEdit_SubUnid.Text) <> '' then
      VS_Comando:= VS_Comando+' and SubUnidade = '+#39+Trim(JvEdit_SubUnid.Text)+#39;

   if Trim(JvEdit_Obj.Text) <> '' then
      VS_Comando:= VS_Comando+' and Objetivo = '+#39+Trim(JvEdit_Obj.Text)+#39;

   if Trim(JvEdit_Serie.Text) <> '' then
      VS_Comando:= VS_Comando+' and serie = '+#39+Trim(JvEdit_Serie.Text)+#39;

   if Trim(JvEdit_NItem.Text) <> '' then
      VS_Comando:= VS_Comando+' and NumItem = '+Trim(JvEdit_NItem.Text);

   Funcoes.ExecutaQuery(Query_IP_Item, VS_Comando+' Order By Disciplina, Unidade, SubUnidade, Objetivo, Serie asc' );
end;

//------------------------------------------------------------------------------
// Tratamento para entrar somente numero
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.TratarNumeroPress(Sender: TObject; var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Limpa os campos Montagem do prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Limpar_MontaProva;
begin
   DBEdit_N_Questao.Text:= '';
end;

procedure TForm_Cad_Prova.DBGrid_ItemdeProvaDblClick(Sender: TObject);
begin
   BitBtn_NovoItemClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo Monta Prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.BitBtn_NovoItemClick(Sender: TObject);
var
   VS_Indice: String;
begin
   if Query_IP_Item.FieldByName('Recurso').AsString = 'S' then
   begin
      Showmessage('O Item seleciona esta com Recurso, não sendo possível utiliza-lo...');
   end
   else
   begin
      bmMateriaProva:= IBQuery_Abrangencia.GetBookMark;
      bmIP_Item:= Query_IP_Item.GetBookMark;
      if ((trim(Query_IP_Item.FieldByName('numItem').AsString) = '') and (JvEdit_NItem_Inserir.Text = '')) then
      begin
         Showmessage('Não foi selecionado nenhum Item...');
      end
      else
      begin
         VS_IdTurma:= Table_Teste.FieldByName('IdTurma').AsString;
         VS_FaseApli:= Table_Teste.FieldByName('faseAplicacao').AsString;
         VS_RefAval:= Table_Teste.FieldByName('ReferenciaAvaliacao').AsString;
         VS_CodMateria:= Table_Teste.FieldByName('CodMateria').AsString;
         VS_Materia:= IBQuery_Abrangencia.FieldByName('Materia').AsString;
         if JvEdit_NItem_Inserir.Text <> '' Then
            VS_NumeroItem:= JvEdit_NItem_Inserir.Text
         else
            VS_NumeroItem:= Query_IP_Item.FieldByName('numItem').AsString;

         VI_TotalItens:= Funcoes.QtdRegistro(' Select count(1) as Qtd '+        //----------------- Verifica se o Item esta cadastrado na banca
                                             ' From Item_Prova '+
                                             ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                             ' and   IdTurma = '+VS_IdTurma+
                                             ' and   NumItem = '+VS_NumeroItem
                                            );
         if VI_TotalItens = 0 then
         begin
            Showmessage('O Item não esta cadastrado na turma...');
         end
         else
         begin
            VI_TotalItens:= Funcoes.QtdRegistro(' Select count(1) as Qtd '+     //----------------- Verifica se o Item ja foi cadastrado
                                                ' From ItemTeste '+
                                                ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                ' and   FaseAplicacao = '+#39+VS_FaseApli+#39+
                                                ' and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+
                                                ' and   CodMateria = '+#39+VS_CodMateria+#39+
                                                ' and   NumItem = '+VS_NumeroItem
                                               );
            if VI_TotalItens > 0 then
            begin
               Showmessage('Este Item já foi cadastrado...');
            end
            else
            begin
            // Pega o Indice de Facilidade da Prova

               Funcoes.OpenQuery('Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+VS_NumeroItem);

               if DM.IBQuery_Executa.FieldByName('Indice').AsFloat < 0.60 then
               begin
                  VS_Indice:= 'D';                         // Dificel
                  Label_Dificel.Caption:= IntToStr(StrToInt(Label_Dificel.Caption)+1);
               end
               else
               begin
                 if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.80 then
                 begin
                     VS_Indice:= 'F';                     // Facil
                     Label_Facil.Caption:= IntToStr(StrToInt(Label_Facil.Caption)+1);
                 end
                 else
                 begin
                     VS_Indice:= 'M';    // Media
                     Label_Medio.Caption:= IntToStr(StrToInt(Label_Medio.Caption)+1);
                 end;
               end;

               // Pega o total de Itens da Prova

               VI_TotalItens:= Funcoes.QtdRegistro('Select count(1) as Qtd '+
                                                   ' From ItemTeste '+
                                                   ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                   ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                   ' and   FaseAplicacao = '+#39+VS_FaseApli+#39+
                                                   ' and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+
                                                   ' and   CodMateria = '+#39+VS_CodMateria+#39
                                                  );

               //---------------- Verifica o numero da ultima questao --------------------//

               JvEdit_NItem_Inserir.Enabled:= False;
               Limpar_MontaProva;
               Containers(False);
               JvCaptionPanel_MontaProva_ItemProva.Enabled:= True;
               BotoesProva(False);
               VS_Opcao:= 'Inserir';

               VI_NumQuestao:= VI_TotalItens +1;      // Tem a função de verificar a quantidade de Itens existem

               Table_ItemTeste.Append;

               Table_ItemTeste.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
               Table_ItemTeste.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
               Table_ItemTeste.FieldByName('faseAplicacao').AsString:= VS_FaseApli;
               Table_ItemTeste.FieldByName('ReferenciaAvaliacao').AsString:= VS_refAval;
               Table_ItemTeste.FieldByName('CodMateria').AsString:= VS_CodMateria;
               Table_ItemTeste.FieldByName('Materia').AsString:= VS_Materia;
               Table_ItemTeste.FieldByName('numItem').AsString:= VS_NumeroItem;
               Table_ItemTeste.FieldByName('NumeroQuestao').AsInteger:= VI_NumQuestao;
               Table_ItemTeste.FieldByName('IndiceFacilidade').AsString:= VS_Indice;

               DBEdit_N_Questao.SetFocus;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de alteracao do Numerdo do Item da prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.DBEdit_N_QuestaoKeyPress(Sender: TObject;var Key: Char);
begin
   if Key = #13 then
   begin
      if Trim(DBEdit_N_Questao.Text) = '' then
          ShowMessage('O número da questão não pode ser branco...')
      else
          if StrToInt(DBEdit_N_Questao.Text) > StrToInt(DBEdit_TotalIten.Text) then
             ShowMessage('O número da questão não pode maior que a quantidade de questões...')
          else
          begin
             bmIP_Item:= Query_IP_Item.GetBookMark;
             Table_ItemTeste.Edit;
             Table_ItemTeste.Post;
             Funcoes.ExecutaTransacao;

             Funcoes.AtualizaQuery(Query_Item_Teste);
             Query_IP_Item.GotoBookmark(bmIP_Item);
             Query_IP_Item.FreeBookMark(bmIP_Item);
          end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de exclusao do item da prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.BitBtn_ExcluiItemClick(Sender: TObject);
var
   VI_Retorno, VI_TempoRes, VI_Questao, VI_QTD_Itens: Integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Item selecionado '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Excluir Item Prova do Curso '+Funcoes.GetCodCurso+' - Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' Item nº '+DBEdit_N_Questao.Text+' da Prova: '+DBText_Prova.Caption);
      try
         //---- Cadastro de numero de questao que ja existe, eh feito ajuste ----//

         bmMateriaProva:= IBQuery_Abrangencia.GetBookMark;
         bmIP_Item:= Query_IP_Item.GetBookMark;
         IBQuery_Item.Open;

         VS_FaseApli:= Table_Teste.FieldByName('faseAplicacao').AsString;
         VS_RefAval:= Table_Teste.FieldByName('ReferenciaAvaliacao').AsString;
         VS_CodMateria:= Table_Teste.FieldByName('CodMateria').AsString;
         if IBQuery_Item.FieldByName('TempoRes').AsString = '' then
            VI_TempoRes:= 0
         else
           VI_TempoRes:= IBQuery_Item.FieldByName('TempoRes').AsInteger;
         IBQuery_Item.close;

         VI_Questao:= StrToInt(DBEdit_N_Questao.Text);
         Table_ItemTeste.Delete;
         Funcoes.ExecutaTransacao;

         VI_TotalItens:= Table_Teste.FieldByName('TotalItens').AsInteger;
         VI_QTD_Itens:= VI_TotalItens-1;

          While VI_Questao <= VI_QTD_Itens  do
          begin
              Funcoes.ExecusaoQuery('Update ItemTeste  '+
                                    ' Set NumeroQuestao =  '+IntToStr(VI_Questao)+
                                    ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                    ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                    ' and   FaseAplicacao = '+#39+VS_FaseApli+#39+
                                    ' and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+
                                    ' and   NumeroQuestao = '+IntToStr(VI_Questao+1)
                                   );
              VI_Questao:= VI_Questao+1;
         end;

         //---- Gravacao dos Dados de Duracao e Total de Itens na Tabela TESTE -----//

         Table_Teste.Edit;
         Table_Teste.FieldByName('Duracao').AsInteger:= Table_Teste.FieldByName('Duracao').AsInteger - VI_TempoRes;
         Table_Teste.FieldByName('TotalItens').AsInteger:= VI_TotalItens-1;
         Table_Teste.Post;
         Funcoes.ExecutaTransacao;
         Funcoes.AtualizaQuery(Query_Item_Teste);
         IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
         IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

         Query_IP_Item.GotoBookmark(bmIP_Item);
         Query_IP_Item.FreeBookMark(bmIP_Item);

         Containers(True);
         BotoesProva(True);
      except
         Table_ItemTeste.Close;
         Table_ItemTeste.Open;

         Table_Teste.Close;
         Table_Teste.Open;

         Funcoes.AtualizaQuery(Query_Item_Teste);
         Funcoes.ExecutaTransacao;

         IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
         IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

         Query_IP_Item.GotoBookmark(bmIP_Item);
         Query_IP_Item.FreeBookMark(bmIP_Item);
         Containers(True);
         BotoesProva(True);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de gravacao do item
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.BitBtn_GravarItemClick(Sender: TObject);
var
   VS_Duracao: String;
   VI_NItens, VI_Questao, VI_QTD_Itens: Integer;
begin
   Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Inserir Item Prova do Curso '+Funcoes.GetCodCurso+' - Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' Item nº '+DBEdit_N_Questao.Text+' Prova: '+DBText_Prova.Caption);
   JvEdit_NItem_Inserir.Enabled:= True;
   try
      //----------------- Gravacao dos Dados na Tabela ITEM_TESTE ---------------//

      if JvEdit_NItem_Inserir.Text = '' then
         VS_Duracao:= Query_IP_Item.FieldByName('TempoRes').AsString
      else
      begin
         Funcoes.OpenQuery('Select TempoRes From Item_Prova_View Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+VS_IdTurma+' and NumItem = '+Trim(JvEdit_NItem_Inserir.Text));
         VS_Duracao:= DM.IBQuery_Executa.FieldByName('TempoRes').AsString;
         JvEdit_NItem_Inserir.Text:= '';
      end;

      If ( StrToInt(DBEdit_N_Questao.Text) = VI_NumQuestao) then
      begin
         try
            Table_ItemTeste.Post;
            Funcoes.ExecutaTransacao;
         except
            Table_ItemTeste.Cancel;
            Funcoes.ExecutaTransacao;
            Table_ItemTeste.Close;
            Table_ItemTeste.Open;
         end;
      end
      else
      begin
         try
            //---- Cadastro de numero de questao que ja existe, eh feito ajuste ----//

            VI_Questao:= StrToInt(DBEdit_N_Questao.Text);
            Table_ItemTeste.Cancel;    // Cancela a Inclusao do Curso
            Funcoes.ExecutaTransacao;

            VI_QTD_Itens:= VI_TotalItens;

            While VI_QTD_Itens >= VI_Questao do
            begin
                Funcoes.ExecusaoQuery('Update ItemTeste  '+
                                      ' Set NumeroQuestao =  '+IntToStr(VI_QTD_Itens+1)+
                                      ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                      ' and   IdTurma = '+VS_IdTurma+
                                      ' and   FaseAplicacao = '+#39+VS_FaseApli+#39+
                                      ' and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+
                                      ' and   NumeroQuestao = '+IntToStr(VI_QTD_Itens)
                                     );
                VI_QTD_Itens:= VI_QTD_Itens-1;
            end;

            //-------------------- Grava o Item Selecionado ------------------------//

            Table_ItemTeste.Append;
            Table_ItemTeste.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
            Table_ItemTeste.FieldByName('IdTurma').AsString:= VS_IdTurma;
            Table_ItemTeste.FieldByName('faseAplicacao').AsString:= VS_FaseApli;
            Table_ItemTeste.FieldByName('ReferenciaAvaliacao').AsString:= VS_refAval;
            Table_ItemTeste.FieldByName('CodMateria').AsString:= VS_CodMateria;
            Table_ItemTeste.FieldByName('Materia').AsString:= VS_Materia;
            Table_ItemTeste.FieldByName('numItem').AsString:= VS_NumeroItem;
            Table_ItemTeste.FieldByName('NumeroQuestao').AsInteger:=  VI_Questao;

            Table_ItemTeste.Post;
            Funcoes.ExecutaTransacao;
         except
            Table_ItemTeste.Cancel;
            Funcoes.ExecutaTransacao;
            Table_ItemTeste.Close;
            Table_ItemTeste.Open;
         end;

      end;

      //---- Gravacao dos Dados de Duracao e Total de Itens na Tabela TESTE -----//
      //---Pega o Numero total de Itens

      VI_NItens:= Funcoes.QtdRegistro('Select count(1) as Qtd From ItemTeste  '+
                                      ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                      ' and   IdTurma = '+VS_IdTurma+
                                      ' and   FaseAplicacao = '+#39+VS_FaseApli+#39+
                                      ' and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39
                                     );

      Table_Teste.Edit;
      Table_Teste.FieldByName('Duracao').AsInteger:= Table_Teste.FieldByName('Duracao').AsInteger + StrToInt(VS_Duracao);
      Table_Teste.FieldByName('TotalItens').AsInteger:=VI_NItens;
      Table_Teste.Post;
      Funcoes.ExecutaTransacao;

      Table_Teste.Close;
      Table_Teste.Open;

      Funcoes.AtualizaQuery(Query_Item_Teste);

      IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
      IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

      Query_IP_Item.GotoBookmark(bmIP_Item);
      Query_IP_Item.FreeBookMark(bmIP_Item);

      Containers(True);
      BotoesProva(True);
   except
      Table_ItemTeste.Close;
      Table_ItemTeste.Open;

      Table_Teste.Close;
      Table_Teste.Open;
      Funcoes.AtualizaQuery(Query_Item_Teste);

      IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
      IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

      Query_IP_Item.GotoBookmark(bmIP_Item);
      Query_IP_Item.FreeBookMark(bmIP_Item);

      Containers(True);
      BotoesProva(True);
   end;
end;

//------------------------------------------------------------------------------
// Cancela a gravacao do Item de prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.BitBtn_CancelarItemClick(Sender: TObject);
begin
   JvEdit_NItem_Inserir.Enabled:= True;
   Containers(True);
   BotoesProva(True);
   Table_ItemTeste.Cancel;
   Funcoes.ExecutaTransacao;
end;

procedure TForm_Cad_Prova.DBGrid_Query_ItemCellClick(Column: TColumn);
begin
   JvCaptionPanel_MostraItem.Caption:= 'Abrangência - Item';
   DBRichEdit_Editor_Demo_01.Visible:= True;
   DBRichEdit_Editor.Visible:= False;
end;

procedure TForm_Cad_Prova.DBGrid_ItemProvaCellClick( Column: TColumn);
begin
   JvCaptionPanel_MostraItem.Caption:= 'Item da Prova';
   DBRichEdit_Editor.Visible:= True;
   DBRichEdit_Editor_Demo_01.Visible:= False;
end;

//------------------------------------------------------------------------------
// Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Ferramenta_MontarProvaManualClick( Sender: TObject);
begin
   if Form_Cad_Prova.Table_Teste.RecordCount = 0 then
   begin
      Showmessage('Não foi possível montar a prova, não possuí teste cadastrado...');
      Close;
   end
   else
   begin
      Application.CreateForm(TForm_MontaProva, Form_MontaProva);
      Funcoes.SetRelDesempenho('Iniciado');
      Form_MontaProva.ShowModal;
      JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do erro na insercao do teste
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Table_TestePostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         MessageDlg('Esta Prova já foi cadastrado...',mtWarning, [mbOK], 0);
         Abort;
      end;
end;

//------------------------------------------------------------------------------
// Tratamento do erro na insercao do teste de abrangencia
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Table_Abrangencia_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         MessageDlg('Esta abrangencia já foi cadastrada...',mtWarning, [mbOK], 0);
         Abort;
      end;
end;

//------------------------------------------------------------------------------
// Tratamento do erro na insercao do item na prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Table_ItemTestePostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('Este Item da prova já foi cadastrado...',mtWarning, [mbOK], 0);
          Abort;
       end;
end;

//------------------------------------------------------------------------------
//
// Relatorios
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Relatorio - Montar capa da prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Rel_CapaDaProvaClick(Sender: TObject);
begin
   if Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString = '' then
   begin
      showMessage('Não foi selecionada a prova ou não possuí prova cadastrada...');
   end
   else
   begin
      Funcoes.TrataMensagem('select doc, Descricao from Documento where Doc = '+#39+'CAPA DA PASTA DA PROVA'+#39);

      Form_Editor.Text1.Clear;
      Form_Editor.Text1.SelStart:= 0;
      Form_Editor.Text1.PasteFromClipboard ;

      Funcoes.Trocar('#NomeCurso', Trim(Funcoes.GetCodCurso)+' - '+Trim(DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString));
      Funcoes.Trocar('#F', Form_Cad_Prova.DBText_FaseAplicacao.Caption);
      Funcoes.Trocar('#PROVA', Copy(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString,1,2)+'-'+Copy(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString,3,2));
      Funcoes.Trocar('#9/99/9999', Funcoes_TrataData.FormatarData( Form_Cad_Prova.Table_Teste.FieldByName('DATAAPLICACAO').AsString, 'yyyy'));
      Funcoes.Trocar('#Dia', Funcoes_TrataData.DiadaSemana(Form_Cad_Prova.Table_Teste.FieldByName('DATAAPLICACAO').AsString));
      Funcoes.Trocar('#Tempo', Form_Cad_Prova.Table_Teste.FieldByName('Duracao').AsString);
      Funcoes.Trocar('#Item', Form_Cad_Prova.Table_Teste.FieldByName('TOTALITENS').AsString);
      Funcoes.Trocar('#Disciplina', '   ');
      Funcoes.Trocar('#N', Form_Cad_Prova.Table_Teste.FieldByName('TotalAlunos').AsString);

      Form_Editor.Show;
   end;
end;

//------------------------------------------------------------------------------
// Relatorio - Montar Roteiro para aplicacao de prova teorica
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Rel_RoteiroAplicacaoProvaClick(Sender: TObject);
begin
   if Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString = '' then
   begin
      showMessage('Não foi selecionada a prova ou não possuí prova cadastrada...');
   end
   else
   begin
      Funcoes.TrataMensagem('select doc, Descricao from Documento where codigo = 19');

      Form_Editor.Text1.Clear;
      Form_Editor.Text1.SelStart:= 0;
      Form_Editor.Text1.PasteFromClipboard ;

      Funcoes.Trocar('#PROVA', Copy(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString,1,2)+'-'+Copy(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString,3,2)+' '+Trim(Funcoes.GetCodCurso));
      Funcoes.Trocar('#DATA', Funcoes_TrataData.FormatarData( Form_Cad_Prova.Table_Teste.FieldByName('DATAAPLICACAO').AsString, 'yyyy'));
      Form_Editor.Show;
   end;
end;

//------------------------------------------------------------------------------
// Relatorio - Montar Controle de Tempo da Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Query_MontaTurmaAfterScroll(DataSet: TDataSet);
var
   Status: Boolean;
begin
    if VS_Opcao = 'Consulta' then
    begin
       if ((Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'APLICAR') or
           (Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'ANDAMENTO')) then
          Status:= False
      else
         if Trim(IBQuery_MontaTeste.FieldByName('IdTurma').AsString) = '' then
            Status:= False
         else
            Status:= True;

      BitBtn_NovoItem.Enabled:= Status;
      BitBtn_ExcluiItem.Enabled:= Status;
      GroupBox_InserirAlternativaCorreta.Visible:= Status;
      GroupBox_AlterarAlternativaCorreta.Visible:= Status;
   end;
end;

//------------------------------------------------------------------------------
//
// Montagem do Gabarito da Prova Manualmente
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento de resposta entrada manualmente pelo aluno
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Resposta(VS_Opcao, Resposta: String);
var
   Vi_NumeroQuestao, VI_TotalItensManual: integer;
begin
   Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Inserir Gabarito Manual do Curso '+Funcoes.GetCodCurso);

   Vi_NumeroQuestao:= IBTable_ItemTesteManual.FieldByName('NumeroQuestao').AsInteger;

   //---------------- Verifica o numero da ultima questao --------------------//

   VI_TotalItensManual:= Funcoes.QtdRegistro('Select count(1) Qtd from ItemTesteManual '+
                                             ' Where IdCurso = '+Table_Teste.FieldByName('IdCurso').AsString+
                                             ' and IdTurma = '+Table_Teste.FieldByName('IdTurma').AsString+
                                             ' and faseAplicacao = '+#39+Table_Teste.FieldByName('faseAplicacao').AsString+#39+
                                             ' and ReferenciaAvaliacao = '+#39+Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                             ' and CodMateria = '+#39+Table_Teste.FieldByName('CodMateria').AsString+#39+
                                             ' and Gabarito = '+MaskEdit_Gabarito.Text
                                            );

   if trim(VS_Opcao) = 'I' then
   begin
      IBTable_ItemTesteManual.Append;
      VI_TotalItensManual:= VI_TotalItensManual +1;
      Vi_NumeroQuestao:= VI_TotalItensManual;
   end
   else
      IBTable_ItemTesteManual.Edit;

   IBTable_ItemTesteManual.FieldByName('IdCurso').AsString:= Table_Teste.FieldByName('IdCurso').AsString;
   IBTable_ItemTesteManual.FieldByName('IdTurma').AsString:= Table_Teste.FieldByName('IdTurma').AsString;
   IBTable_ItemTesteManual.FieldByName('faseAplicacao').AsString:= Table_Teste.FieldByName('faseAplicacao').AsString;
   IBTable_ItemTesteManual.FieldByName('ReferenciaAvaliacao').AsString:= Table_Teste.FieldByName('ReferenciaAvaliacao').AsString;
   IBTable_ItemTesteManual.FieldByName('CodMateria').AsString:= Table_Teste.FieldByName('CodMateria').AsString;
   IBTable_ItemTesteManual.FieldByName('NumeroQuestao').AsInteger:= Vi_NumeroQuestao;
   IBTable_ItemTesteManual.FieldByName('Gabarito').AsString:= Table_Teste.FieldByName('N_Gabaritos').AsString;
   IBTable_ItemTesteManual.FieldByName('RESPOSTACORRETA').AsString:= Resposta;
   IBTable_ItemTesteManual.FieldByName('QUESTAOANULADA').AsString:= ' ';
   IBTable_ItemTesteManual.FieldByName('QUESTAOIRREGULAR').AsString:= ' ';
   IBTable_ItemTesteManual.FieldByName('ALTERNATIVACORRETAB').AsString:= ' ';
   IBTable_ItemTesteManual.FieldByName('ALTERNATIVACORRETAD').AsString:= ' ';
   IBTable_ItemTesteManual.Post;

   AtualizaTotalDeItensTesteManual(VI_TotalItensManual);                        // Atualiza total de Itens
end;

//------------------------------------------------------------------------------
// Atualiza total de Itens
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.AtualizaTotalDeItensTesteManual(VI_TotalItens: Integer);
begin
   Table_Teste.Edit;
   Table_Teste.FieldByName('TotalItens').AsInteger:= VI_TotalItens;
   Table_Teste.Post;
   Funcoes.ExecutaTransacao;

   Table_Teste.Close;
   Table_Teste.Open;

   Funcoes.AtualizaQuery(IBQuery_ItemTesteManual);

   if VI_TotalItens = 1 then
      TabSheet_MontarProvaPorSelecaoItem.TabVisible:= False
   else
      if VI_TotalItens = 0 then
         Funcoes.AtualizaQuery(IBQuery_MontaTeste);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para excluir resposta manual selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_ExcluirRespostaClick(Sender: TObject);
var
   VI_QTD_Itens, VI_Questao, VI_Retorno: integer;
begin
   if Table_Teste.FieldByName('TotalItens').AsInteger > 0 then
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o gabarito selecionado '+#13+
                                          'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
      begin
         Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Excluir Gabarito Manual do Curso '+Funcoes.GetCodCurso);
         VI_Questao:= IBTable_ItemTesteManual.FieldByName('NumeroQuestao').AsInteger;

         IBTable_ItemTesteManual.Delete;    // Exclui o arquivo

         VI_QTD_Itens:= Table_Teste.FieldByName('TotalItens').AsInteger;

         While VI_Questao <= VI_QTD_Itens  do
         begin
            VI_Questao:= VI_Questao+1;

            Funcoes.ExecusaoQuery('Update ItemTesteManual  '+
                                  ' Set NumeroQuestao =  '+IntToStr(VI_Questao-1)+
                                  ' Where IdCurso = '+Table_Teste.FieldByName('IdCurso').AsString+
                                  ' and IdTurma = '+Table_Teste.FieldByName('IdTurma').AsString+
                                  ' and IdTurma = '+Table_Teste.FieldByName('IdTurma').AsString+
                                  ' and faseAplicacao = '+#39+Table_Teste.FieldByName('faseAplicacao').AsString+#39+
                                  ' and ReferenciaAvaliacao = '+#39+Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                  ' and CodMateria = '+#39+Table_Teste.FieldByName('CodMateria').AsString+#39+
                                  ' and NumeroQuestao = '+IntToStr(VI_Questao)
                                 );
         end;

         AtualizaTotalDeItensTesteManual(VI_QTD_Itens-1);                        // Atualiza total de Itens
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Inserir alternativa correta com A
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_I_AlternativaCorretaAClick(Sender: TObject);
begin
  Resposta('I', 'A');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Inserir alternativa correta com B
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_I_AlternativaCorretaBClick(Sender: TObject);
begin
  Resposta('I','B');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Inserir alternativa correta com C
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_I_AlternativaCorretaCClick(Sender: TObject);
begin
  Resposta('I','C');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Inserir alternativa correta com D
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_I_AlternativaCorretaDClick(Sender: TObject);
begin
  Resposta('I','D');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Alterar alternativa correta com A
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_A_AlternativaCorretaAClick(Sender: TObject);
begin
  Resposta('A','A');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Alterar alternativa correta com B
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_A_AlternativaCorretaBClick(Sender: TObject);
begin
  Resposta('A','B');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Alterar alternativa correta com C
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_A_AlternativaCorretaCClick(Sender: TObject);
begin
  Resposta('A','C');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Alterar alternativa correta com D
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_A_AlternativaCorretaDClick(Sender: TObject);
begin
  Resposta('A','D');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Mostrar o Item
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_MostraItemClick(Sender: TObject);
begin
   ToolButton_NaoMostrarItem.Visible:= True;
   ToolButton_MostraItem.Visible:= False;
   JvCaptionPanel_MostraItem.Height:= 255;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para Não Mostrar o Item
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_NaoMostrarItemClick(Sender: TObject);
begin
   ToolButton_NaoMostrarItem.Visible:= False;
   ToolButton_MostraItem.Visible:= True;
   JvCaptionPanel_MostraItem.Height:= 29;
end;

//------------------------------------------------------------------------------
// Relatorio - Relacao de Aluno com Codigo
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Rel_RelacaoAlunosComCodigoClick(Sender: TObject);
begin
   if DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não foi selecionada a Turma')
   else
   begin
      Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);

      Funcoes.ExecutaQuery( Form_Rel_RelacaoComCodigo.IBQuery_AlunoTurma, 'Select NomeCompleto, NomeGuerra, CodigoAluno as Codigo '+
                                                                          ' From Aluno_turmas_view Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                                          ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                          );
      Form_Rel_RelacaoComCodigo.QRLabel_Cabec.Caption:= 'Relação de Alunos com Código';

      Form_Rel_RelacaoComCodigo.QuickRep1.Preview;
      Form_Rel_RelacaoComCodigo.QuickRep1.Free;
   end;
end;

procedure TForm_Cad_Prova.DBEdit_TotalItenKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Table_Teste.Edit;
      Table_Teste.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
//
// Duplica o Gabarito da Prova Manualmente para outra Turma
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento da Duplicacao da prova de uma Turma para outra
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvExpressButton_CopiaProvaClick(Sender: TObject);
var
   VI_Retorno, VI_TotalItensManual: Integer;
   VS_Msg: String;
begin
   if IBQuery_SelTeste.FieldByName('IdCurso').AsString = '' then
   begin
       ShowMessage('Não foi selecionado a prova...');
       DBGrid_SelecionaProva.SetFocus;
   end
   else
   begin
      if ((IBQuery_MontaTeste.FieldByName('IdCurso').AsString = IBQuery_SelTurma.FieldByNAme('IdCurso').AsString) and
          (IBQuery_MontaTeste.FieldByName('IdTurma').AsString = IBQuery_SelTurma.FieldByNAme('IdTurma').AsString) and
          (IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString = IBQuery_SelTeste.FieldByNAme('ReferenciaAvaliacao').AsString)) then
      begin
          ShowMessage('Não pode copiar a prova para ela mesma...');
      end
      else
      begin
         if Query_Item_Teste.FieldByName('IdCurso').AsString <> '' then
         begin
            IBQuery_SelTeste.Open;
            VS_msg:= 'Confirma a Exportação dos Itens da Prova '+IBQuery_MontaTeste.FieldByName('CodProva').AsString +' da Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+#13+
                     'para a Prova '+IBQuery_SelTeste.FieldByName('CodProva').AsString+' da Turma '+IBQuery_SelTurma.FieldByName('Turma').AsString;

            VI_Retorno:= Application.MessageBox(PChar(VS_msg), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

            if VI_Retorno = IDYes then
            begin
               // Tratamento para copiar a abrangencia da prova

               //--- Verifica se possui item cadastraddo se sim apaga

               Funcoes.ExecusaoQuery( 'Delete from TesteAbrangencia where IdCurso = '+IBQuery_SelTurma.FieldByName('IdCurso').AsString+
                                      ' and IdTurma = '+IBQuery_SelTurma.FieldByName('IdTurma').AsString+
                                      ' and faseAplicacao = '+#39+IBQuery_SelTeste.FieldByName('faseAplicacao').AsString+#39+
                                      ' and ReferenciaAvaliacao = '+#39+IBQuery_SelTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                      ' and CodMateria = '+#39+IBQuery_SelTeste.FieldByName('CodMateria').AsString+#39
                                    );

               IBQuery_Abrangencia.First;
               While not IBQuery_Abrangencia.Eof do
               begin
                   Funcoes.ExecusaoQuery( 'Insert into TesteAbrangencia (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Materia )'+
                                          ' values ('+IBQuery_SelTurma.FieldByNAme('IdCurso').AsString+', '+
                                                      IBQuery_SelTurma.FieldByNAme('IdTurma').AsString+', '+
                                                      #39+IBQuery_SelTeste.FieldByNAme('FaseAplicacao').AsString+#39+', '+
                                                      #39+IBQuery_SelTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+', '+
                                                      #39+IBQuery_SelTeste.FieldByNAme('CodMateria').AsString+#39+', '+
                                                      #39+IBQuery_Abrangencia.FieldByNAme('Materia').AsString+#39+')'
                                        );
                  IBQuery_Abrangencia.Next;
               end;

               Funcoes.ExecusaoQuery( 'Delete from ItemTeste where IdCurso = '+IBQuery_SelTurma.FieldByName('IdCurso').AsString+
                                      ' and IdTurma = '+IBQuery_SelTurma.FieldByName('IdTurma').AsString+
                                      ' and faseAplicacao = '+#39+IBQuery_SelTeste.FieldByName('faseAplicacao').AsString+#39+
                                      ' and ReferenciaAvaliacao = '+#39+IBQuery_SelTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                      ' and CodMateria = '+#39+IBQuery_SelTeste.FieldByName('CodMateria').AsString+#39
                                    );
               Query_Item_Teste.First;
               While not Query_Item_Teste.Eof do
               begin
                   Funcoes.ExecusaoQuery( 'Insert into ItemTeste (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Materia, NumItem, NumeroQuestao, IndiceFacilidade )'+
                                          ' values ('+IBQuery_SelTurma.FieldByNAme('IdCurso').AsString+', '+
                                                      IBQuery_SelTurma.FieldByNAme('IdTurma').AsString+', '+
                                                      #39+IBQuery_SelTeste.FieldByNAme('FaseAplicacao').AsString+#39+', '+
                                                      #39+IBQuery_SelTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+', '+
                                                      #39+IBQuery_SelTeste.FieldByNAme('CodMateria').AsString+#39+', '+
                                                      #39+IBQuery_SelTeste.FieldByNAme('CodMateria').AsString+#39+', '+
                                                      Table_ItemTeste.FieldByNAme('numItem').AsString+', '+
                                                      Table_ItemTeste.FieldByNAme('NumeroQuestao').AsString+', '+
                                                      #39+Table_ItemTeste.FieldByNAme('IndiceFacilidade').AsString+#39+')'
                                        );
                  Query_Item_Teste.Next;
               end;
            end;
         end
         else
         begin
            VS_msg:= 'Confirma a Copia dos Itens do Teste Manual da Prova '+IBQuery_MontaTeste.FieldByName('CodProva').AsString +' da Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+#13+
                     'para a Prova '+IBQuery_SelTeste.FieldByName('CodProva').AsString+' da Turma '+IBQuery_SelTurma.FieldByName('Turma').AsString;

            VI_Retorno:= Application.MessageBox(PChar(VS_msg), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

            if VI_Retorno = IDYes then
            begin
               //--- verifica se o Teste é Manual ou automatico

               if IBQuery_ItemTesteManual.FieldByName('Gabarito').AsString <> '' then
               begin

                  //--- Verifica se possui item cadastraddo se sim apaga

                  Funcoes.ExecusaoQuery('Delete from ItemTesteManual where IdCurso = '+IBQuery_SelTurma.FieldByName('IdCurso').AsString+
                                        ' and IdTurma = '+IBQuery_SelTurma.FieldByName('IdTurma').AsString+
                                        ' and faseAplicacao = '+#39+IBQuery_SelTeste.FieldByName('faseAplicacao').AsString+#39+
                                        ' and ReferenciaAvaliacao = '+#39+IBQuery_SelTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                        ' and Gabarito = '+IBQuery_ItemTesteManual.FieldByName('Gabarito').AsString+
                                        ' and CodMateria = '+#39+IBQuery_SelTeste.FieldByName('CodMateria').AsString+#39
                                       );

                  VI_TotalItensManual:= 0;

                  IBQuery_ItemTesteManual.First;
                  While not IBQuery_ItemTesteManual.eof do
                  begin
                     VI_TotalItensManual:= VI_TotalItensManual + 1;
                     IBTable_ItemTesteManual.Append;
                     IBTable_ItemTesteManual.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
                     IBTable_ItemTesteManual.FieldByName('IdTurma').AsString:= IBQuery_SelTurma.FieldByName('IdTurma').AsString;
                     IBTable_ItemTesteManual.FieldByName('faseAplicacao').AsString:= IBQuery_SelTeste.FieldByName('faseAplicacao').AsString;
                     IBTable_ItemTesteManual.FieldByName('ReferenciaAvaliacao').AsString:= IBQuery_SelTeste.FieldByName('ReferenciaAvaliacao').AsString;
                     IBTable_ItemTesteManual.FieldByName('CodMateria').AsString:= IBQuery_SelTeste.FieldByName('CodMateria').AsString;
                     IBTable_ItemTesteManual.FieldByName('Gabarito').AsString:= IBQuery_ItemTesteManual.FieldByName('Gabarito').AsString;
                     IBTable_ItemTesteManual.FieldByName('NumeroQuestao').AsInteger:= IBQuery_ItemTesteManual.FieldByName('NumeroQuestao').AsInteger;
                     IBTable_ItemTesteManual.FieldByName('RESPOSTACORRETA').AsString:= IBQuery_ItemTesteManual.FieldByName('RESPOSTACORRETA').AsString;
                     IBTable_ItemTesteManual.FieldByName('QUESTAOANULADA').AsString:= ' ';
                     IBTable_ItemTesteManual.FieldByName('QUESTAOIRREGULAR').AsString:= ' ';
                     IBTable_ItemTesteManual.FieldByName('ALTERNATIVACORRETAB').AsString:= ' ';
                     IBTable_ItemTesteManual.FieldByName('ALTERNATIVACORRETAD').AsString:= ' ';
                     IBTable_ItemTesteManual.Post;

                     IBQuery_ItemTesteManual.Next;
                  end;
               end
               else       //--- Tratamento para procva automatica
               begin

                  //--- Verifica se possui item cadastraddo se sim apaga

                  Funcoes.ExecusaoQuery('Delete from ItemTesteManual where IdCurso = '+IBQuery_SelTurma.FieldByName('IdCurso').AsString+
                                        ' and IdTurma = '+IBQuery_SelTurma.FieldByName('IdTurma').AsString+
                                        ' and faseAplicacao = '+#39+IBQuery_SelTeste.FieldByName('faseAplicacao').AsString+#39+
                                        ' and ReferenciaAvaliacao = '+#39+IBQuery_SelTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                        ' and Gabarito = '+Edit_NGabarito.Text+
                                        ' and CodMateria = '+#39+Query_Item_Teste.FieldByName('CodMateria').AsString+#39
                                       );
                  VI_TotalItensManual:= 0;

                  Query_Item_Teste.First;
                  While not Query_Item_Teste.eof do
                  begin
                     Funcoes.OpenQuery('Select RespostaCorreta From Item_Desc where NumItem = '+Query_Item_Teste.FieldByName('NumItem').AsString);

                     VI_TotalItensManual:= VI_TotalItensManual + 1;
                     IBTable_ItemTesteManual.Append;
                     IBTable_ItemTesteManual.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
                     IBTable_ItemTesteManual.FieldByName('IdTurma').AsString:= IBQuery_SelTurma.FieldByName('IdTurma').AsString;
                     IBTable_ItemTesteManual.FieldByName('faseAplicacao').AsString:= IBQuery_SelTeste.FieldByName('faseAplicacao').AsString;
                     IBTable_ItemTesteManual.FieldByName('ReferenciaAvaliacao').AsString:= IBQuery_SelTeste.FieldByName('ReferenciaAvaliacao').AsString;
                     IBTable_ItemTesteManual.FieldByName('CodMateria').AsString:= IBQuery_SelTeste.FieldByName('CodMateria').AsString;
                     IBTable_ItemTesteManual.FieldByName('Gabarito').AsString:= Edit_NGabarito.Text;
                     IBTable_ItemTesteManual.FieldByName('NumeroQuestao').AsInteger:= Query_Item_Teste.FieldByName('NumeroQuestao').AsInteger;
                     IBTable_ItemTesteManual.FieldByName('RESPOSTACORRETA').AsString:= DM.IBQuery_Executa.FieldByName('RespostaCorreta').AsString;
                     IBTable_ItemTesteManual.FieldByName('QUESTAOANULADA').AsString:= ' ';
                     IBTable_ItemTesteManual.FieldByName('QUESTAOIRREGULAR').AsString:= ' ';
                     IBTable_ItemTesteManual.FieldByName('ALTERNATIVACORRETAB').AsString:= ' ';
                     IBTable_ItemTesteManual.FieldByName('ALTERNATIVACORRETAD').AsString:= ' ';
                     IBTable_ItemTesteManual.Post;

                     Query_Item_Teste.Next;
                  end;
               end;

               Funcoes.ExecusaoQuery('Update Teste set TotalItens = '+intToStr(VI_TotalItensManual)+
                                     ' where IdCurso = '+IBQuery_SelTurma.FieldByName('IdCurso').AsString+
                                     ' and IdTurma = '+IBQuery_SelTurma.FieldByName('IdTurma').AsString
                                    );

               Funcoes.ExecutaTransacao;
            end;
         end;
      end;
   end;
end;

procedure TForm_Cad_Prova.JvTransparentButton_Rel_DiscussaoDirigidaProvaClick( Sender: TObject);
begin
   if Form_Cad_Prova.Table_Teste.RecordCount = 0 then
   begin
      Showmessage('Não foi montar a discução diregida, não foi selecionado a prova...');
      Close;
   end
   else
   begin
      Funcoes.TrataMensagem('select doc, Descricao from Documento where codigo = 32');

      Form_Editor.Text1.Clear;
      Form_Editor.Text1.SelStart:= 0;

      Form_Editor.Text1.PasteFromClipboard ;

      Funcoes.Trocar('#CodCurso', Funcoes.GetCodCurso);
      Funcoes.Trocar('#Prova', Copy(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString,1,2)+'-'+Copy(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString,3,2));
      Funcoes.Trocar('#DataProva', Funcoes_TrataData.FormatarData( Form_Cad_Prova.Table_Teste.FieldByName('DATAAPLICACAO').AsString, 'yyyy'));
      Form_Editor.Show;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Cor da Selecao da Grid
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.DBGrid_TesteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_Teste, Rect, DataCol, Column, State );
end;

procedure TForm_Cad_Prova.DBGrid_MateriaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_Materia, Rect, DataCol, Column, State );
end;

procedure TForm_Cad_Prova.DBGrid_IP_AbrangenciaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_IP_Abrangencia, Rect, DataCol, Column, State );
end;

procedure TForm_Cad_Prova.DBGrid_ItemdeProvaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  Icon: TBitmap;
begin
  Icon := TBitmap.Create;
  if (Column.FieldName = 'STATUS') then
  begin
    with DBGrid_ItemdeProva.Canvas do
    begin
      Brush.Color := clSilver;
      FillRect(Rect);
      if (Query_IP_Item.FieldByName('Status').AsString = 'D' ) then
        ImageList1.GetBitmap(0, Icon)
      else
        if Query_IP_Item.FieldByName('IdCurso').AsString = '' then
           ImageList1.GetBitmap(3, Icon)
        else
           ImageList1.GetBitmap(1, Icon);
      Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
    end;
  end;
end;

procedure TForm_Cad_Prova.DBGrid_ItemProvaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Query_Item_Teste.FieldByName('IndiceFacilidade').AsString = 'D' then
     DBGrid_ItemProva.Canvas.Font.Color:= clGray
   else
     if Query_Item_Teste.FieldByName('IndiceFacilidade').AsString = 'M' then
        DBGrid_ItemProva.Canvas.Font.Color:= clMaroon
     else
        DBGrid_ItemProva.Canvas.Font.Color:= clTeal;

  if gdSelected in State then
    DBGrid_ItemProva.Canvas.Brush.Color := $006A2602;

   DBGrid_ItemProva.Canvas.FillRect(Rect);
   DBGrid_ItemProva.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Procedure para tratar da Prova Automatica
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.SpeedButton_GerarProvaClick(Sender: TObject);
var
   VI_Retorno,VI_Questao, VI_Item, i: Integer;
   VS_Indice, VS_Comando: string;
   VB_Continuar: Boolean;
begin
   VB_Continuar:= True;
   VS_Comando:= ' Select count(1) as Qtd from GabaritoProva '+
                ' where IdCurso = '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and IdTurma = '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and FaseAplicacao = '+#39+IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                ' and ReferenciaAvaliacao = '+#39+IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                ' and CodMateria = '+#39+IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;
   if Funcoes.QtdRegistro(VS_Comando) > 0 then   // Monta o Gabarito da Prova
   begin
      VI_Retorno:= Application.MessageBox('Existe Gabarito feito para esta Prova, '+#13+
                                    'Confirma a Criação de uma Nova Prova ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDNo then
          VB_Continuar:= False;
   end;

   if VB_Continuar = True then
   begin
       //---
      // Deleta o Gabarito da Prova

      Funcoes.ExecusaoQuery(' Delete from GabaritoProva '+
                            ' where IdCurso = '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                            ' and FaseAplicacao = '+#39+IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                            ' and ReferenciaAvaliacao = '+#39+IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                            ' and CodMateria = '+#39+IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39
                           );

      VI_Questao:= 0;
      ZerarIndiceFacilidade;

      //--- Limpar a matriz

      if VI_QtdIten = 0 then
      begin
         for i := 0 to 200 do
         begin
            AS_Materia[i]:= '';
            AS_NumeroItem[i]:= '';
         end;

         //---- Monta a matriz com relação dos Itens

         VI_QtdIten:= 1;
         IBQuery_Abrangencia.First;
         While not IBQuery_Abrangencia.eof do
         begin
            Query_IP_Item.First;
            While not Query_IP_Item.eof do
            begin
               AS_Materia[VI_QtdIten]:= IBQuery_Abrangencia.FieldByName('Materia').AsString;
               AS_NumeroItem[VI_QtdIten]:= Query_IP_Item.FieldByName('numItem').AsString;
               VI_QtdIten:= VI_QtdIten +1;
               Query_IP_Item.Next;
            end;
            IBQuery_Abrangencia.Next;
         end;
         VI_QtdIten:= VI_QtdIten -1;
      end;

      Funcoes.ExecusaoQuery('Delete from ItemTeste '+
                            ' where IdCurso = '+Table_Teste.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+Table_Teste.FieldByName('IdTurma').AsString+
                            ' and faseAplicacao = '+#39+Table_Teste.FieldByName('faseAplicacao').AsString+#39+
                            ' and ReferenciaAvaliacao = '+#39+Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                            ' and CodMateria = '+#39+Table_Teste.FieldByName('CodMateria').AsString+#39
                           );

      Table_ItemTeste.Close;
      Table_ItemTeste.Open;

      While VI_Questao < StrToInt(DBEdit_TotalIten.Text) do
      begin
         VI_Item:= 0;

         While VI_Item = 0 do
            VI_Item:= Random(VI_QtdIten);

         VS_Comando:= 'Select count(1) as Qtd '+
                      'From ItemTeste '+
                      ' where IdCurso = '+Table_Teste.FieldByName('IdCurso').AsString+
                      ' and IdTurma = '+Table_Teste.FieldByName('IdTurma').AsString+
                      ' and faseAplicacao = '+#39+Table_Teste.FieldByName('faseAplicacao').AsString+#39+
                      ' and ReferenciaAvaliacao = '+#39+Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                      ' and CodMateria = '+#39+Table_Teste.FieldByName('CodMateria').AsString+#39+
                      ' and   NumItem = '+AS_NumeroItem[VI_Item];

         VI_TotalItens:= Funcoes.QtdRegistro(VS_Comando);
         if VI_TotalItens = 0 then
         begin
            // Pega o Indice de Facilidade da Prova

            Funcoes.OpenQuery('Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+AS_NumeroItem[VI_Item]);

            if DM.IBQuery_Executa.FieldByName('Indice').AsFloat >= 0.80 then
            begin
               VS_Indice:= 'F';                     // Facil
               Label_Facil.Caption:= IntToStr(StrToInt(Label_Facil.Caption)+1);
            end
            else
            begin
               if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.60 then
               begin
                  VS_Indice:= 'M';    // Media
                  Label_Medio.Caption:= IntToStr(StrToInt(Label_Medio.Caption)+1);
               end
               else
               begin
                  VS_Indice:= 'D';                         // Dificel
                  Label_Dificel.Caption:= IntToStr(StrToInt(Label_Dificel.Caption)+1);
               end
            end;

            VI_Questao:= VI_Questao +1;      // Tem a função de verificar a quantidade de Itens existem

            Table_ItemTeste.Append;
            Table_ItemTeste.FieldByName('IdCurso').AsString:= Table_Teste.FieldByName('IdCurso').AsString;
            Table_ItemTeste.FieldByName('IdTurma').AsString:= Table_Teste.FieldByName('IdTurma').AsString;
            Table_ItemTeste.FieldByName('faseAplicacao').AsString:= Table_Teste.FieldByName('faseAplicacao').AsString;
            Table_ItemTeste.FieldByName('ReferenciaAvaliacao').AsString:= Table_Teste.FieldByName('ReferenciaAvaliacao').AsString;
            Table_ItemTeste.FieldByName('CodMateria').AsString:= Table_Teste.FieldByName('CodMateria').AsString;
            Table_ItemTeste.FieldByName('Materia').AsString:= AS_Materia[VI_Item];
            Table_ItemTeste.FieldByName('numItem').AsString:= AS_NumeroItem[VI_Item];
            Table_ItemTeste.FieldByName('NumeroQuestao').AsInteger:= VI_Questao;
            Table_ItemTeste.FieldByName('IndiceFacilidade').AsString:= VS_Indice;
            Table_ItemTeste.Post;
            Funcoes.ExecutaTransacao;
         end;
      end;
      Funcoes.AtualizaQuery(IBQuery_MontaTeste);
   end;
end;

procedure TForm_Cad_Prova.MaskEdit_GabaritoChange(Sender: TObject);
begin
   if MaskEdit_Gabarito.Text <> '' then
   begin
      if StrToInt(MaskEdit_Gabarito.Text) > Table_Teste.FieldByName( 'N_Gabaritos').AsInteger then
      begin
         ShowMessage('A prova possuí apenas '+Table_Teste.FieldByName( 'N_Gabaritos').AsString+' Gabarito(s)...');
         MaskEdit_Gabarito.Text:= VS_Gabarito;
         MaskEdit_Gabarito.SetFocus;
      end
      else
      begin
         Funcoes.ExecutaQuery( IBQuery_ItemTesteManual, ' Select  IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria,  NumeroQuestao, RespostaCorreta, Gabarito '+
                                                        ' From ItemTesteManual '+
                                                        ' Where IdCurso = :IdCurso '+
                                                        ' and   IdTurma = :IdTurma '+
                                                        ' and   FaseAplicacao = :FaseAplicacao '+
                                                        ' and   ReferenciaAvaliacao = :ReferenciaAvaliacao '+
                                                        ' and   CodMateria = :CodMateria '+
                                                        ' and   Gabarito = '+MaskEdit_Gabarito.Text+
                                                        ' Order By IdCurso, IdTurma, NumeroQuestao'
                              );
      end;
   end
   else
   begin
      MaskEdit_Gabarito.Text:= VS_Gabarito;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando seleciona a Aba de tratamento da Prova Manual
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.PageControl_MontaProvaEnter(Sender: TObject);
begin
   Funcoes.ExecutaQuery(IBQuery_ItemTesteManual, ' Select  IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria,  NumeroQuestao, RespostaCorreta, Gabarito '+
                                                 ' From ItemTesteManual '+
                                                 ' Where IdCurso = :IdCurso '+
                                                 ' and   IdTurma = :IdTurma '+
                                                 ' and   FaseAplicacao = :FaseAplicacao '+
                                                 ' and   ReferenciaAvaliacao = :ReferenciaAvaliacao '+
                                                 ' and   CodMateria = :CodMateria '+
                                                 ' and   Gabarito = '+MaskEdit_Gabarito.Text+
                                                 ' Order By IdCurso, IdTurma,NumeroQuestao'
                       );

   IBTable_ItemTesteManual.Open;
   Funcoes.AtualizaQuery(IBQuery_SelTurma);
   VI_QtdIten:= 0;
end;

//------------------------------------------------------------------------------
// Tratamento quando Sai da Aba de Tratamento da Prova Manual
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.PageControl_MontaProvaExit(Sender: TObject);
begin
  VI_QtdIten:= 0;
end;

procedure TForm_Cad_Prova.DBGrid_TesteCellClick(Column: TColumn);
begin
   MostraIndiceProva;
end;

procedure TForm_Cad_Prova.MostraIndiceProva;
var
   bmProva: TBookmark;
begin
   if PageControl_MontaProva.TabIndex = 1 then
   begin
      bmProva:= Query_Item_Teste.GetBookMark;
      ZerarIndiceFacilidade;

      Query_Item_Teste.First;
      While not Query_Item_Teste.Eof do
      begin
         if Query_Item_Teste.FieldByName('IndiceFacilidade').AsString = 'D' then
            Label_Dificel.Caption:= IntToStr(StrToInt(Label_Dificel.Caption)+1)
         else
            if Query_Item_Teste.FieldByName('IndiceFacilidade').AsString = 'F' then
               Label_Facil.Caption:= IntToStr(StrToInt(Label_Facil.Caption)+1)
            else
               if Query_Item_Teste.FieldByName('IndiceFacilidade').AsString = 'M' then
                  Label_Medio.Caption:= IntToStr(StrToInt(Label_Medio.Caption)+1);
         Query_Item_Teste.Next;
      End;
      Query_Item_Teste.GotoBookMark(bmProva);
      Query_Item_Teste.FreeBookMark(bmProva);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento dos botoes para ajustar itens
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.TratarBotoesAjustarItem(Status: Boolean);
begin
   SpeedButton_Grava_AjustarItem.Visible:= Status;
   SpeedButton_Cancela_AjustarItem.Visible:= Status;
   if Status = True then
      Status:= False
   else
      Status:= True;

   SpeedButton_AjustarDescItem.Visible:= Status;
end;

procedure TForm_Cad_Prova.SpeedButton_AjustarDescItemClick(Sender: TObject);
begin
   if Query_Item_Teste.FieldByName('IdCurso').AsString <> '' then
   begin
      TratarBotoesAjustarItem(True);
      DBRichEdit_Editor_Demo_01.Visible:= True;

      IBTable_Item_Desc.Edit
   end;
end;

procedure TForm_Cad_Prova.SpeedButton_Grava_AjustarItemClick(Sender: TObject);
begin
   if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
   begin
      IBTable_Item_Desc.Post;
      Funcoes.ExecutaTransacao;
   end;
   TratarBotoesAjustarItem(False);
end;

procedure TForm_Cad_Prova.SpeedButton_Cancela_AjustarItemClick(Sender: TObject);
begin
   if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
   begin
      IBTable_Item_Desc.Cancel;
      Funcoes.ExecutaTransacao;
   end;
   TratarBotoesAjustarItem(False);
end;

procedure TForm_Cad_Prova.JvEdit_DisciplinaAbrChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select IdCurso, IdTurma, CodMateria, NomeMateria '+
                ' From MateriaCurso '+
                ' Where idCurso = :IdCurso '+
                ' and  idTurma = :IdTurma ';

   if JvEdit_DisciplinaAbr.Text <> '' then
      VS_Comando:= VS_Comando+' and CodMateria like '+#39+JvEdit_DisciplinaAbr.Text+'%'+#39;

   if JvEdit_DescAbr.Text <> '' then
      VS_Comando:= VS_Comando+' and NomeMateria like '+#39+JvEdit_DescAbr.Text+'%'+#39;

   VS_Comando:= VS_Comando+' Order By CodMateria';
   Funcoes.ExecutaQuery(Query_Materia, VS_Comando);
end;

//------------------------------------------------------------------------------
// Tratamento do botao de padronizacao da Fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.ToolButton_ajustarItemClick(Sender: TObject);
begin
  DBRichEdit_Editor.SelectAll;
  DBRichEdit_Editor.SelAttributes.Size := 11;
  DBRichEdit_Editor.SelAttributes.Name:= 'Courier New';
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.MontaTeste(Sender: TObject);
var
   VS_Data, VS_Comando: string;
begin
   //--- Monta query de selecao de Materia

   VS_IdTurma:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
   VS_Comando:= 'Select t.IdCurso, t.IdTurma, t.FaseAplicacao, t.ReferenciaAvaliacao, t.CodMateria, t.DataAplicacao, t.TotalAlunos, t.TotalItens, t.Duracao, t.CodProva, t.PesoAplicacao, t.Status_Aplicacao '+
                ' from  Testes_View t '+
                ' where t.IdCurso = :IdCurso '+
                ' and   t.IdTurma = :IdTurma';

   if trim(JvEdit_Prova.Text) <> '' then
      VS_Comando:= VS_Comando+' and t.CodProva like '+#39+JvEdit_Prova.Text+'%'+#39;


   if JvDateEdit_Aplicacao.Text <> '  /  /    ' then
   begin
      if Validar.ValidarData(JvDateEdit_Aplicacao.Text) = True then
      begin
         VS_Data:= Funcoes.DePara(JvDateEdit_Aplicacao.Text, '/', '.');
         VS_Data:= VS_Data+' 00:00';
         VS_Comando:= VS_Comando+' and DataAplicacao = '+#39+VS_Data+#39;
      end;
   end;

   Funcoes.ExecutaQuery(IBQuery_MontaTeste, VS_Comando+OrderByTeste);
   if IBQuery_MontaTeste.FieldByName('IdTurma').AsString <> '' then
      Containers(True);
end;

//------------------------------------------------------------------------------
//
// Tratamento dos Instrutores responsaveis pela elaboração da prova
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao para cadastrar o Instrutor para elaborar Prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.SpeedButton_SelDisciplinaClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if IBQuery_Sel_Materia.FieldByName('CodMateria').AsString = '' then
   begin
      ShowMessage(' Não foi selecionado Disciplina...');
   end
   else
   begin
      VS_Comando:= 'Select count(1) Qtd from InstrutorMateria where IdCurso = '+IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString+
                   ' and Identidade = '+#39+IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39+
                   ' and CodMateria = '+#39+IBQuery_Sel_Materia.FieldByName('CodMateria').AsString+#39;
      if Funcoes.QtdRegistro(VS_Comando) > 0 then
          ShowMessage(' A Disciplina '+Trim(IBQuery_Sel_Materia.FieldByName('CodMateria').AsString)+' - '+Trim(IBQuery_Sel_Materia.FieldByName('NomeMateria').AsString)+#13+#13+' já foi cadastrada...   ')
      else
      begin
         IBTable_InstrutorMateria.Append;
         IBTable_InstrutorMateria.FieldByName('IdCurso').AsString:= IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString;
         IBTable_InstrutorMateria.FieldByName('Identidade').AsString:= IBQuery_InstrutorTurma.FieldByName('Identidade').AsString;
         IBTable_InstrutorMateria.FieldByName('CodMateria').AsString:= IBQuery_Sel_Materia.FieldByName('CodMateria').AsString;
         IBTable_InstrutorMateria.FieldByName('Status').AsString:= 'Ativo';
         IBTable_InstrutorMateria.FieldByName('Observacao').AsString:= '';
         IBTable_InstrutorMateria.Post;
         Funcoes.ExecutaTransacao;
         Funcoes.AtualizaQuery(IBQuery_InstrutorTurma);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para excluir o Instrutor para elaborar Prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.SpeedButton_ExcluiDisciplinaSelecionadaClick(Sender: TObject);
begin
   if IBTable_InstrutorMateria.FieldByName('CodMateria').AsString = '' then
      ShowMessage(' Não foi selecionado Disciplina...')
   else
   begin
      IBTable_InstrutorMateria.Delete;
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(IBQuery_InstrutorTurma);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Abrangencia da prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.DBGrid_AbrangenciaCellClick(Column: TColumn);
begin
   SpeedButton_ExcluiAbrangencia.Visible:= True;
end;

procedure TForm_Cad_Prova.DBGrid_MateriaCellClick(Column: TColumn);
begin
   SpeedButtonInsereAbrangencia.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para montar as relacao de itens de Prova
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_ItemProvaClick( Sender: TObject);
begin


   Application.CreateForm(TForm_ColetaItens, Form_ColetaItens);
   Form_ColetaItens.Show;
   Form_ColetaItens.Free;

//   Application.CreateForm(TForm_ColetaItensSTO, Form_ColetaItensSTO);
//  Form_ColetaItensSTO.ShowMOdal;
//   Form_ColetaItensSTO.Free;
end;

//------------------------------------------------------------------------------
// Chama o modulo para criar prova eletronica
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_FerramentaAplicarProvaEletronicaClick( Sender: TObject);
begin
   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'STANDY BY' then
   begin
      Application.CreateForm(TForm_MontaProvaEletronica, Form_MontaProvaEletronica);
      Form_MontaProvaEletronica.ShowModal;
      Form_MontaProvaEletronica.Free;
      Funcoes.TrimAppMemorySize;

      JvTransparentButton_Ferramenta_SenhaAplicacaoProvaClick( Sender );
   end
   else
      ShowMessage('Para Iniciar a montagem da Prova Eletrônica,'+#13+'o status da Aplicação da Prova necessita estar em "STANDY BY"...');
   JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a relação de alunos com senha para aplicacao da prova eletronica
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Ferramenta_SenhaAplicacaoProvaClick( Sender: TObject);
begin
   JvCaptionPanel_FerramentaAuxiliar.Visible:= False;

   Funcoes.OpenQuery( ' Select a.NomeCompleto, a.NomeGuerra, t.Senha '+
                      ' From  TesteAplicacao t, Aluno_Turmas_View a '+
                      ' where t.IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                      ' and   t.IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                      ' and   t.FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                      ' and   t.ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                      ' and   t.CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                      ' and   t.IdCurso = a.IdCurso '+
                      ' And   t.IdTurma = a.IdTurma '+
                      ' and   t.Identidade = a.Identidade '
                     );

   Form_Editor.Text1.Clear;
   Form_Editor.Text1.Lines.Add('-----------------------------------------------------------------------------');

   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
      Form_Editor.FontSize.Text := '11';
      Form_Editor.Text1.Font.Size:= 11;
      Form_Editor.JvFontComboBox_Font.Text := 'Courier New';
      Form_Editor.Text1.Font.Name:= 'Courier New';

      Form_Editor.Text1.Lines.Add('Nome....: '+DM.IBQuery_Executa.FieldByName('NomeCompleto').AsString);
      Form_Editor.Text1.Lines.Add('Usuário.: '+DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString);
      Form_Editor.Text1.Lines.Add('Senha...: '+DM.IBQuery_Executa.FieldByName('Senha').AsString);
      Form_Editor.Text1.Lines.Add('-----------------------------------------------------------------------------');

      DM.IBQuery_Executa.Next;
   end;
   Form_Editor.ShowModal;
end;

//------------------------------------------------------------------------------
// Verificacao Erros Na Impressao Do Relatorio
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.VerificacaoErrosNaImpressaoDoRelatorio;
begin
   if DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não foi selecionada a Turma...')
   else
      if Form_Cad_Prova.Table_Teste.RecordCount = 0 then
         Showmessage('Não foi possível montar o(s) Relatório(s), não possuí teste cadastrado...');
end;

//------------------------------------------------------------------------------
// Relatorio - Montar Ata de Presença
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Rel_APAClick(Sender: TObject);
begin
   VerificacaoErrosNaImpressaoDoRelatorio;

   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CINDACTA II' then
   begin
      Application.CreateForm(TForm_Rel_AtaDePresenca_Cindacta2, Form_Rel_AtaDePresenca_Cindacta2);
      Form_Rel_AtaDePresenca_Cindacta2.QuickRep1.Preview;
      Form_Rel_AtaDePresenca_Cindacta2.QuickRep1.Free;
   end
   else
   begin                            ;
      Application.CreateForm(TForm_Rel_APA, Form_Rel_APA);
      Form_Rel_APA.QuickRep1.Prepare;
      NPaginas:= Form_Rel_APA.QuickRep1.QRPrinter.PageCount;
      Form_Rel_APA.QuickRep1.Preview;
      Form_Rel_APA.QuickRep1.Free;
   end;
end;


//------------------------------------------------------------------------------
// Relatorio - Montar Formulário de Delineamento de Itens de Prova - DIP
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Rel_DIPClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Rel_DIP, Form_Rel_DIP);
   Form_Rel_DIP.QuickRep1.Prepare;
   NPaginas:= Form_Rel_DIP.QuickRep1.QRPrinter.PageCount;
   Form_Rel_DIP.QuickRep1.Preview
end;

//------------------------------------------------------------------------------
// Relatorio - Gabarito de Prova - Modelo 02
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Rel_GPAClick(Sender: TObject);
begin
   IBQuery_MontaTeste.Open;

   Funcoes.AtualizaQuery(Query_Item_Teste);
   if (VS_TipoProva = 'Gabarito da Prova feita Pelo Sistema')  then
   begin
      if Query_Item_Teste.FieldByName('IdTurma').AsString = '' then
         ShowMessage('Não é possível montar o Gabarito da Prova, Verifique se a prova possuí itens selecionados... ')
      else
      begin
         Funcoes.SetRelDesempenho('Iniciado');
         Application.CreateForm(TForm_MontaGabarito, Form_MontaGabarito);
         Form_MontaGabarito.ShowModal;
      end;
   end
   else
   begin
      if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CINDACTA II' then
      begin
         Application.CreateForm(TForm_Rel_GPA_CINDACTAII, Form_Rel_GPA_CINDACTAII);
         Form_Rel_GPA_CINDACTAII.QuickRep1.Prepare;
         Form_Rel_GPA_CINDACTAII.QuickRep1.Preview
      end
      else
      begin
         if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAN' then
         begin
            Application.CreateForm(TForm_Rel_GPA_CIAAN, Form_Rel_GPA_CIAAN);
            Form_Rel_GPA_CIAAN.QuickRep1.Prepare;
            Form_Rel_GPA_CIAAN.QuickRep1.Preview
         end
         else
         begin
            Application.CreateForm(TForm_Rel_GPA, Form_Rel_GPA);
            Form_Rel_GPA.QuickRep1.Prepare;
            NPaginas:= Form_Rel_GPA.QuickRep1.QRPrinter.PageCount;
            Form_Rel_GPA.QuickRep1.Preview
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Relatorio PDF solicitado
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para criacao do arquivo PDF
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.TratarPDF(VS_Relatorio: String);
var
   VS_Pasta, VS_NomeArq, VS_Turma: String;
begin
   JvCaptionPanel_Relatorios_PDF.Height:= 292;

   Panel_FornecerNomeArquivo.Left:= 1;
   Panel_FornecerNomeArquivo.Top:= 130;
   Panel_FornecerNomeArquivo.Visible:= True;

   VS_RelatorioPDF:= VS_Relatorio;

   //--- Verificando a existencia do diretorio para Solicitacao em PDF

   VS_Turma:= Funcoes.DePara(Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString), '/', '_');
   VS_NomeArq:= Trim(Funcoes.GetCodCurso)+'_'+VS_Turma;
   VS_NomeArq:= Funcoes.DePara(VS_NomeArq, '/', '_');

   VS_Pasta:= 'C:\Ensino\ArquivosPDF\'+VS_NomeArq;

   VS_NomeArq:= VS_NomeArq+'_'+VS_Relatorio;

   if not DirectoryExists(VS_Pasta) then
       ForceDirectories(VS_Pasta);

   Edit_NomeDoArquivo.Text:= VS_Pasta+'\'+VS_NomeArq;

end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a solicitacao do arquivo PDF
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_SolPDFClick(Sender: TObject);
begin
   if Query_Item_Teste.FieldByName('IdTurma').AsString = '' then
      ShowMessage('Não é possível montar o Gabarito da Prova, Verifique se a prova possuí itens selecionados... ')
   else
   begin
      if VS_RelatorioPDF = 'DIP' then
      begin
         Application.CreateForm(TForm_Rel_DIP, Form_Rel_DIP);
         Form_Rel_DIP.QuickRep1.Prepare;
         NPaginas:= Form_Rel_DIP.QuickRep1.QRPrinter.PageCount;
         ExportQR1.Report := Form_Rel_DIP.QuickRep1;
         Form_Rel_DIP.Free;
      end
      else
      begin
         if VS_RelatorioPDF = 'GPA' then
         begin
            if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CINDACTA II' then
            begin
               Application.CreateForm(TForm_Rel_GPA_CINDACTAII, Form_Rel_GPA_CINDACTAII);
               Form_Rel_GPA_CINDACTAII.QuickRep1.Prepare;
               NPaginas:= Form_Rel_GPA_CINDACTAII.QuickRep1.QRPrinter.PageCount;
               ExportQR1.Report := Form_Rel_GPA_CINDACTAII.QuickRep1;
               Form_Rel_GPA_CINDACTAII.Free;
            end
            else
            begin
               if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAN' then
               begin
                  Application.CreateForm(TForm_Rel_GPA_CIAAN, Form_Rel_GPA_CIAAN);
                  Form_Rel_GPA_CIAAN.QuickRep1.Prepare;
                  NPaginas:= Form_Rel_GPA_CIAAN.QuickRep1.QRPrinter.PageCount;
                  ExportQR1.Report := Form_Rel_GPA_CIAAN.QuickRep1;
                  Form_Rel_GPA_CIAAN.Free;
               end
               else
               begin
                  Application.CreateForm(TForm_Rel_GPA, Form_Rel_GPA);
                  Form_Rel_GPA.QuickRep1.Prepare;
                  NPaginas:= Form_Rel_GPA.QuickRep1.QRPrinter.PageCount;
                  ExportQR1.Report := Form_Rel_GPA.QuickRep1;
                  Form_Rel_GPA.Free;
               end;
            end;
         end
         else
         begin
            if VS_RelatorioPDF = 'APA' then
            begin
               Application.CreateForm(TForm_Rel_APA, Form_Rel_APA);
               Form_Rel_APA.QuickRep1.Prepare;
               NPaginas:= Form_Rel_APA.QuickRep1.QRPrinter.PageCount;
               ExportQR1.Report := Form_Rel_APA.QuickRep1;
               Form_Rel_APA.Free;
            end
            else
            begin
               if VS_RelatorioPDF = 'LGP' then
               begin
                  Application.CreateForm(TForm_Rel_LGP, Form_Rel_LGP);
                  Form_Rel_LGP.QuickRep1.Prepare;
                  NPaginas:= Form_Rel_LGP.QuickRep1.QRPrinter.PageCount;
                  ExportQR1.Report := Form_Rel_LGP.QuickRep1;
                  Form_Rel_LGP.Free;
               end;
            end;
         end;
      end;

      ExportQR1.ExportQRPDF(Edit_NomeDoArquivo.Text, False);
      ShellExecute(Handle, nil, PChar(Edit_NomeDoArquivo.Text+'.pdf') , nil, nil, SW_SHOWNORMAL);
      JvCaptionPanel_Relatorios_PDF.Height:= 155;
      Panel_FornecerNomeArquivo.Visible:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio DIP
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_PDF_DIPClick(Sender: TObject);
begin
   TratarPDF('DIP');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio GPA
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_PDF_GPAClick(Sender: TObject);
begin
   TratarPDF('GPA');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio APA
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_PDF_APAClick( Sender: TObject);
begin
   TratarPDF('APA');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para gerar PDF do relatorio GLGP
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_PDF_LGPClick(Sender: TObject);
begin
   TratarPDF('LGP');
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Abrir a Janela Relatorio
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_RelatoriosImprimirClick( Sender: TObject);
begin
   JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
   JvCaptionPanel_Relatorios_PDF.Visible:= False;
   Panel_FornecerNomeArquivo.Visible:= False;

   if JvCaptionPanel_Relatorios_Imprimir.Visible = False then
      JvCaptionPanel_Relatorios_Imprimir.Visible:= True
   else
      JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Fechar a Janela Relatorio
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_FecharImpressaoClick( Sender: TObject);
begin
   JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Abrir a Janela Ferramenta
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_FerramentasClick( Sender: TObject);
begin
   JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
   JvCaptionPanel_Relatorios_PDF.Visible:= False;
   Panel_FornecerNomeArquivo.Visible:= False;

   if JvCaptionPanel_FerramentaAuxiliar.Visible = False then
      JvCaptionPanel_FerramentaAuxiliar.Visible:= True
   else
      JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Fechar a Janela Ferramenta
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Fecha_FerramentaAuxiliarClick( Sender: TObject);
begin
   JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
end;

//------------------------------------------------------------------------------
//
// Tratamento da impressao do Relatorio em Formato PDF
//
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_RelatorioPDFClick( Sender: TObject);
begin
   JvCaptionPanel_Relatorios_PDF.Height:= 155;

   JvCaptionPanel_Relatorios_Imprimir.Visible:= False;
   JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
   Panel_FornecerNomeArquivo.Visible:= False;

   if JvCaptionPanel_Relatorios_PDF.Visible = False then
      JvCaptionPanel_Relatorios_PDF.Visible:= True
   else
      JvCaptionPanel_Relatorios_PDF.Visible:= False;
end;

procedure TForm_Cad_Prova.JvTransparentButton3Click(Sender: TObject);
begin
   JvCaptionPanel_Relatorios_PDF.Visible:= False;
end;

//------------------------------------------------------------------------------
// Chamada para relatorio LGP
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_Imprimir_Rel_LGPClick( Sender: TObject);
begin
   Application.CreateForm(TForm_Rel_LGP, Form_Rel_LGP);
   Form_Rel_LGP.QuickRep1.Prepare;
   NPaginas:= Form_Rel_LGP.QuickRep1.QRPrinter.PageCount;
   Form_Rel_LGP.QuickRep1.Preview;
end;

//------------------------------------------------------------------------------
// Tratamento para Filtrar relacao das Disciplinas da Turma
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.TrataSelDisciplina(Sender: TObject);
begin
   VS_ComandoMateria:= ' Select Distinct IdCurso, IdTurma, CodMateria, NomeMateria '+
                       ' From MateriaCurso '+
                       ' Where IdCurso = '+IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                       ' and IdTurma = '+IBQuery_MontaTeste.FieldByName('IdTurma').AsString;

   if trim(JvEdit_CodMateria.Text) <> '' then
      VS_ComandoMateria:= VS_ComandoMateria+ ' and CodMateria like '+#39+JvEdit_CodMateria.Text+'%'+#39;

   if trim(JvEdit_DescDisciplina.Text) <> '' then
      VS_ComandoMateria:= VS_ComandoMateria+ ' and NomeMateria like '+#39+JvEdit_DescDisciplina.Text+'%'+#39;

   Funcoes.ExecutaQuery(IBQuery_Sel_Materia, VS_ComandoMateria +OrderByMateria);
end;


//------------------------------------------------------------------------------
// Tratamento quando pressiona cabecalho da relação de Disciplina por relação turma
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.DBGrid_Disciplina_RelacaoTurmaTitleClick(Column: TColumn);
begin
   OrderByMateria:= ' order by CodMateria ';

   if trim(column.Title.Caption) = 'Descrição' then
      OrderByMateria:= ' order by NomeMateria';

   Funcoes.ExecutaQuery(IBQuery_Sel_Materia, VS_ComandoMateria +OrderByMateria);
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar o itens para o instrutor selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.JvTransparentButton_SelDisciplinaInstrutorClick(Sender: TObject);
begin
   if JvCaptionPanel_RelacaoDeItensParaSerSelecionado.Visible = True then
   begin
      JvTransparentButton_SelDisciplinaInstrutor.Width:= 194;
      JvTransparentButton_SelDisciplinaInstrutor.Caption:= 'Abre Seleção Disciplina';
      JvTransparentButton_SelDisciplinaInstrutor.Hint:= 'Abre a janela de seleção de Disciplina para o instrutor selecionado.';

      SpeedButton_SelDisciplina.Visible:= False;
      JvCaptionPanel_RelacaoDeItensParaSerSelecionado.Visible:= False;
      IBQuery_Sel_Materia.Close;
      JvCaptionPanel_RelacaoInstrutores.Caption:= 'Relaçao de Instrutor Turma (Seleção)';
   end
   else
   begin
      JvTransparentButton_SelDisciplinaInstrutor.Width:= 209;
      JvTransparentButton_SelDisciplinaInstrutor.Caption:= 'Fechar selecao Disciplina';
      JvTransparentButton_SelDisciplinaInstrutor.Hint:= 'Fecha a janela de seleção de Disciplina para o instrutor selecionado.';

      SpeedButton_SelDisciplina.Visible:= True;
      JvCaptionPanel_RelacaoDeItensParaSerSelecionado.Visible:= True;
      TrataSelDisciplina(Sender);
      JvCaptionPanel_RelacaoInstrutores.Caption:= IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString;
   end;
end;


procedure TForm_Cad_Prova.JvTransparentButton_ProvaAutomaticaClick( Sender: TObject);
begin
   if Table_Teste.RecordCount = 0 then
   begin
      Showmessage('Não foi possível montar a prova, não possuí teste cadastrado...');
      Close;
   end
   else
   begin
      Application.CreateForm(TForm_MontarProvaAutomatica, Form_MontarProvaAutomatica);
      Form_MontarProvaAutomatica.ShowModal;
      Funcoes.TrimAppMemorySize;
      JvCaptionPanel_FerramentaAuxiliar.Visible:= False;
   end;
   JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento das opcoes da Janela Ferramenta
//------------------------------------------------------------------------------

procedure TForm_Cad_Prova.Trata_Ferramentas;
var
   Status: Boolean;
begin
   Status:= False;

   if ((VS_Opcao <> 'Inserir') and (VS_Opcao <> 'Alterar')) then
   begin
      JvTransparentButton_Alterar.Enabled:= True;
      JvTransparentButton_Exclui.Enabled:= True;
   end;

   if Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'STANDY BY' then
   begin
      JvTransparentButton_ProvaAutomatica.Enabled:= True;
      JvTransparentButton_Ferramenta_MontarProvaManual.Enabled:= True;
      JvTransparentButton_FerramentaAplicarProvaEletronica.Enabled:= True;
      JvTransparentButton_Ferramenta_SenhaAplicacaoProva.Enabled:= True;
      Status:= True;
   end
   else
   begin
      if Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'EM PAPEL' then
      begin
         JvTransparentButton_ProvaAutomatica.Enabled:= False;
         JvTransparentButton_Ferramenta_MontarProvaManual.Enabled:= True;
         JvTransparentButton_FerramentaAplicarProvaEletronica.Enabled:= False;
         JvTransparentButton_Ferramenta_SenhaAplicacaoProva.Enabled:= False;
      end
      else
      begin
         if ((Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'APLICAR') or
             (Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'ANDAMENTO') or
             (Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'DISCUSSÃO')) then
         begin
            JvTransparentButton_ProvaAutomatica.Enabled:= False;
            JvTransparentButton_Ferramenta_MontarProvaManual.Enabled:= False;
            JvTransparentButton_FerramentaAplicarProvaEletronica.Enabled:= False;
            JvTransparentButton_Ferramenta_SenhaAplicacaoProva.Enabled:= True;

            if (Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'ANDAMENTO') then
            begin
               if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
               begin
                  JvTransparentButton_Alterar.Enabled:= False;
                  JvTransparentButton_Exclui.Enabled:= False;
               end
               else
               begin
                  JvTransparentButton_Alterar.Enabled:= True;
                  JvTransparentButton_Exclui.Enabled:= True;
               end;
            end;
         end
         else
         begin
            if Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString = 'ENCERRADA' then
            begin
               JvTransparentButton_ProvaAutomatica.Enabled:= False;
               JvTransparentButton_FerramentaAplicarProvaEletronica.Enabled:= False;
               JvTransparentButton_Ferramenta_SenhaAplicacaoProva.Enabled:= False;

              JvTransparentButton_Alterar.Enabled:= True;
              JvTransparentButton_Exclui.Enabled:= False;
            end;
         end;
      end;
   end;

   GroupBox_InserirAlternativaCorreta.Visible:= Status;
   GroupBox_AlterarAlternativaCorreta.Visible:= Status;

   if PageControl_Abrangencia.Visible <> Status then
      PageControl_Abrangencia.Visible:= Status;
end;



procedure TForm_Cad_Prova.SpeedButton1Click(Sender: TObject);
var
   VS_Comando: String;
begin
   if IBQuery_Sel_Materia.FieldByName('CodMateria').AsString = '' then
   begin
      ShowMessage(' Não foi selecionado Disciplina...');
   end
   else
   begin
      IBQuery_Sel_Materia.First;
      While not IBQuery_Sel_Materia.Eof do
      begin
         VS_Comando:= 'Select count(1) Qtd from InstrutorMateria where IdCurso = '+IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString+
                      ' and Identidade = '+#39+IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39+
                      ' and CodMateria = '+#39+IBQuery_Sel_Materia.FieldByName('CodMateria').AsString+#39;
         if Funcoes.QtdRegistro(VS_Comando) > 0 then
             ShowMessage(' A Disciplina '+Trim(IBQuery_Sel_Materia.FieldByName('CodMateria').AsString)+' - '+Trim(IBQuery_Sel_Materia.FieldByName('NomeMateria').AsString)+#13+#13+' já foi cadastrada...   ')
         else
         begin
            IBTable_InstrutorMateria.Append;
            IBTable_InstrutorMateria.FieldByName('IdCurso').AsString:= IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString;
            IBTable_InstrutorMateria.FieldByName('Identidade').AsString:= IBQuery_InstrutorTurma.FieldByName('Identidade').AsString;
            IBTable_InstrutorMateria.FieldByName('CodMateria').AsString:= IBQuery_Sel_Materia.FieldByName('CodMateria').AsString;
            IBTable_InstrutorMateria.FieldByName('Status').AsString:= 'Ativo';
            IBTable_InstrutorMateria.FieldByName('Observacao').AsString:= '';
            IBTable_InstrutorMateria.Post;
            Funcoes.ExecutaTransacao;
            Funcoes.AtualizaQuery(IBQuery_InstrutorTurma);
         end;
         IBQuery_Sel_Materia.Next;

      end;
   end;
end;

end.

