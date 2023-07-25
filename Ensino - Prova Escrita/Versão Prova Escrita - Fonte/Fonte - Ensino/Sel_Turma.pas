unit Sel_Turma;
                
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvShape, ComCtrls, ToolWin, Grids, DBGrids, JvRadioButton, ShellApi,
  JvComponent, JvxCtrls, Buttons, JvColorCombo, JvRichEd, JvDBRichEd,
  JvCheckBox, JvToolEdit, JvCombobox, ComObj, XPMan, Menus, JvArrowBtn, JvLookOut,
  Rotinas_SUE, Rotinas, Rotinas_TrataData, JvTransBtn, JvGradient, Rotinas_Validar,
  ExportPack, JvEnterTab;
type
  TForm_SelTurma = class(TForm)
    DSQ_AlunoTurma: TDataSource;
    IBTable_AndamentoTurma: TIBTable;
    IBTable_AndamentoTurmaIDCURSO: TSmallintField;
    IBTable_AndamentoTurmaIDTURMA: TIntegerField;
    IBTable_AndamentoTurmaDESCANDAMENTO: TBlobField;
    DST_Andamento: TDataSource;
    DSQ_InstrutorTurma: TDataSource;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    PageControl_CadTurma: TPageControl;
    TabSheet_Instrutor: TTabSheet;
    DBGrid_SelecionaInstrutor: TDBGrid;
    TabSheet_Aluno: TTabSheet;
    DBGrid_SelecionaAluno: TDBGrid;
    TabSheet_Andamento: TTabSheet;
    TabSheet_Impressao: TTabSheet;
    TabSheet_Avaliacao: TTabSheet;
    GroupBox_FechamentoCurso: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    JvCheckBox_FichaRegistroCertificados: TJvCheckBox;
    JvCheckBox_DiplomaAssinaturaDigitalAluno: TJvCheckBox;
    JvCheckBox_DiplomaAssinaturaDigitalInstrutor: TJvCheckBox;
    JvCheckBox_DiplomaAssinaturaManualAluno: TJvCheckBox;
    JvCheckBox_CertidaoCurricularAsisinaturaDigitalAmostra: TJvCheckBox;
    JvCheckBox_CertidaoCurricularAsisinaturaDigitalPorTurma: TJvCheckBox;
    JvCheckBox_CertidaoCurricularAsisinaturaManualAmostra: TJvCheckBox;
    JvCheckBox_CertidaoCurricularAsisinaturaManualPorTurma: TJvCheckBox;
    JvShape3: TJvShape;
    SpeedButton_gerarCertidao: TSpeedButton;
    SpeedButton_Executada: TSpeedButton;
    DBEdit_Certificado: TDBEdit;
    Label_Cetificado: TLabel;
    Panel_Andamento: TPanel;
    JvDBRichEdit_Andamento: TJvDBRichEdit;
    ToolBar_EditorAndamentoTurma: TToolBar;
    RecortarButton: TToolButton;
    CopiarButton: TToolButton;
    ColarButton: TToolButton;
    DesfazerButton: TToolButton;
    ToolButton10: TToolButton;
    JvFontComboBox: TJvFontComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton6: TToolButton;
    NegritoButton: TToolButton;
    ItalicoButton: TToolButton;
    SublinhadoButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    ToolButton_Fonte: TToolButton;
    ToolButton_Cor: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_InseriLinha: TToolButton;
    ToolButton_InserirHora: TToolButton;
    ToolButton_InsereCalendario: TToolButton;
    IBQuery_InstrutorTurma_Rel: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    IBStringField9: TIBStringField;
    IBQuery_InstrutorTurma: TIBQuery;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBQuery_InstrutorTurmaNOME: TIBStringField;
    IBQuery_InstrutorTurmaNOMEGUERRA: TIBStringField;
    IBQuery_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_InstrutorTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDSUBUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaFUNCAO: TIBStringField;
    IBQuery_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBQuery_InstrutorTurmaDATASAIDA: TDateTimeField;
    IBQuery_InstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBQuery_InstrutorTurmaFICHA: TIBStringField;
    IBQuery_AlunoTurma: TIBQuery;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaNUMORDEM: TSmallintField;
    IBQuery_AlunoTurmaNOME: TIBStringField;
    IBQuery_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_AlunoTurmaNOMEGUERRA: TIBStringField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaSEXO: TIBStringField;
    IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_AlunoTurmaULTIMAPROMOCAO: TDateTimeField;
    IBQuery_AlunoTurmaIDUNIDADE: TIBStringField;
    IBQuery_AlunoTurmaIDSUBUNIDADE: TIBStringField;
    IBQuery_AlunoTurmaSARAM: TIBStringField;
    IBQuery_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBQuery_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBTable_Pessoa_IT: TIBTable;
    IBTable_Pessoa_ITIDENTIDADE: TIBStringField;
    IBTable_Pessoa_ITNOME: TIBStringField;
    IBTable_Pessoa_ITNOMEGUERRA: TIBStringField;
    IBTable_Pessoa_ITPOSTOGRADUACAO: TIBStringField;
    IBTable_Pessoa_ITULTIMAPROMOCAO: TDateTimeField;
    IBTable_Pessoa_ITSEXO: TIBStringField;
    IBTable_Pessoa_ITSARAM: TIBStringField;
    IBTable_Pessoa_ITEMAIL: TIBStringField;
    IBTable_Pessoa_ITCPF_CIC: TIBStringField;
    IBTable_Pessoa_ITNOMEPAIS: TIBStringField;
    IBTable_Pessoa_ITQUADROESP: TIBStringField;
    IBTable_Pessoa_ITQUADRO: TIBStringField;
    IBTable_Pessoa_ITESPECIALIDADE: TIBStringField;
    IBTable_Pessoa_ITIDUNIDADE: TIBStringField;
    IBTable_Pessoa_ITIDSUBUNIDADE: TIBStringField;
    DST_Pessoa: TDataSource;
    IBTable_RelacaoAlunos_: TIBTable;
    IntegerField3: TIntegerField;
    SmallintField2: TSmallintField;
    IntegerField4: TIntegerField;
    IBStringField10: TIBStringField;
    SmallintField3: TSmallintField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    DateTimeField4: TDateTimeField;
    IBStringField14: TIBStringField;
    DateTimeField5: TDateTimeField;
    IBBCDField1: TIBBCDField;
    SmallintField4: TSmallintField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBQuery_AlunoTurmaCPF: TIBStringField;
    IBQuery_InstrutorTurmaSARAM: TIBStringField;
    TabSheet_SegundaVia: TTabSheet;
    GroupBox_TratamentoTurmasExecutadas: TGroupBox;
    Bevel4: TBevel;
    JvCheckBox_DiplomaAluno2Via: TJvCheckBox;
    JvCheckBox_CertidaoCurricular2ViaAluno: TJvCheckBox;
    DBText_NotaAluno: TDBText;
    Label_Nota: TLabel;
    Label_Aluno: TLabel;
    DBText_Aluno: TDBText;
    JvCheckBox_DiplomaAssinaturaDigitalInstrutor2: TJvCheckBox;
    Panel6: TPanel;
    Label16: TLabel;
    JvExpressButton_InsereRestricao: TJvExpressButton;
    JvExpressButton_ExcluiRestricai: TJvExpressButton;
    IBTable_AlunoTurma: TIBTable;
    DST_AlunoTurma: TDataSource;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaRESTRICAO: TIBStringField;
    Edit_Restricao: TEdit;
    JvCheckBox_CertidaoCurricular2ViaAlunoAssDigital: TJvCheckBox;
    JvCheckBox_DiplomaAluno2ViaAssDigital: TJvCheckBox;
    IBTable_Pessoa_ITSIPAER: TIBStringField;
    IBTable_Pessoa_Al: TIBTable;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    DateTimeField6: TDateTimeField;
    IBStringField24: TIBStringField;
    IBStringField25: TIBStringField;
    IBStringField26: TIBStringField;
    IBStringField27: TIBStringField;
    IBStringField28: TIBStringField;
    IBStringField29: TIBStringField;
    IBStringField31: TIBStringField;
    IBStringField32: TIBStringField;
    IBStringField33: TIBStringField;
    IBStringField34: TIBStringField;
    IBStringField35: TIBStringField;
    IBTable_AlunoTurmaTIPO_ALUNO: TIBStringField;
    Panel_Botoes_CabecalhoProva: TPanel;
    Edit1: TEdit;
    ComboBox_Turma: TComboBox;
    DBEdit_ano: TDBEdit;
    DBEdit_Coordenador: TDBEdit;
    DBEdit_Radio: TDBEdit;
    DBEdit_Status: TDBEdit;
    Panel_Botoes_Turma: TPanel;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_NovaTurma: TJvTransparentButton;
    JvShape_Revisar_Item: TJvShape;
    JvTransparentButton_EditarTurma: TJvTransparentButton;
    JvShape_Excluir_Turma: TJvShape;
    JvTransparentButton_ExcluiTurma: TJvTransparentButton;
    Label_DescricaoCurso: TJvxLabel;
    Panel_Botoes_Instrutor: TPanel;
    JvShape19: TJvShape;
    JvTransparentButton_InserirIT: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_AlterarIT: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_ExcluiIT: TJvTransparentButton;
    JvShape_ApresentacaoInstrutor: TJvShape;
    JvTransparentButton_ApresentacaoInstrutor: TJvTransparentButton;
    JvShape_SenhaInstrutor: TJvShape;
    JvExpressButton_SenhaInstrutor: TJvExpressButton;
    Panel_Botoes_Aluno: TPanel;
    JvShape23: TJvShape;
    JvTransparentButton_InserirAl: TJvTransparentButton;
    JvShape24: TJvShape;
    JvTransparentButton_AlterarAl: TJvTransparentButton;
    JvShape25: TJvShape;
    JvTransparentButton_ExcluiAl: TJvTransparentButton;
    JvShape_CopiaRelacaoAlunos: TJvShape;
    JvTransparentButton_CopiaRelacaoAlunos: TJvTransparentButton;
    IBQuery_InstrutorTurmaSEXO: TIBStringField;
    ExportQR1: TExportQR;
    Panel_TratarAluno: TPanel;
    Edit_CodAlunoAl: TEdit;
    MaskEdit_SARAM: TMaskEdit;
    Edit_NomeGuerraAl: TEdit;
    Edit_EdentidadeAl: TEdit;
    Edit_NomeAl: TEdit;
    Edit_UnidadeAl: TEdit;
    DBNavigator_Aluno: TDBNavigator;
    JvShape28: TJvShape;
    JvTransparentButton_Excel_Aluno: TJvTransparentButton;
    JvShape29: TJvShape;
    JvTransparentButton_RelacaoAlunos: TJvTransparentButton;
    Panel_TratarInstrutor: TPanel;
    JvShape30: TJvShape;
    JvTransparentButton_GerarExcelInstrutor: TJvTransparentButton;
    JvShape31: TJvShape;
    JvTransparentButton_RelacaoInstrutores: TJvTransparentButton;
    Edit_UnidadeIt: TEdit;
    Edit_FuncaoIt: TEdit;
    Edit_NomeIt: TEdit;
    MaskEditSaram: TMaskEdit;
    Edit_EdentidadeIt: TEdit;
    Edit_NomeGuerraIt: TEdit;
    Edit_CodigoIt: TEdit;
    PopupMenu_PDF_Aluno: TPopupMenu;
    ImprimirEmPDFTodosAlunos: TMenuItem;
    Somentealunoselecionado: TMenuItem;
    PopupMenu_PDF_Instrutor: TPopupMenu;
    MenuItem_TodosInstrutores: TMenuItem;
    MenuItem_SomenteInstrutorSelecionado: TMenuItem;
    JvGradient5: TJvGradient;
    ComboBox_SelTurma: TComboBox;
    JvShape_Imprimir2via: TJvShape;
    JvTransparentButton_Imprimir2via: TJvTransparentButton;
    JvShape_SenhaAlunos: TJvShape;
    JvExpressButton_SenhaAlunos: TJvExpressButton;
    JvShape_CargaTurmaAluno: TJvShape;
    JvExpressButton_CargaTurmaAluno: TJvExpressButton;
    IBQuery_AlunoTurmaIDENTIDADE_OLD: TIBStringField;
    JvShape_CargaTurmaInstrutor: TJvShape;
    JvExpressButton_CargaTurmaInstrutor: TJvExpressButton;
    JvGradient6: TJvGradient;
    Panel_BotoesAndamento: TPanel;
    JvGradient_Andamento: TJvGradient;
    JvShape_Gravar_Andamento: TJvShape;
    JvTransparentButton_Gravar_Andamento: TJvTransparentButton;
    JvShape_Cancelar_Andamento: TJvShape;
    JvTransparentButton_Cancela_Andamento: TJvTransparentButton;
    JvGradient1: TJvGradient;
    IBQuery_InstrutorTurmaIDENTIDADE_OLD: TIBStringField;
    ComboBox_Curso: TComboBox;
    IBQuery_Tmp: TIBQuery;
    JvGradient2: TJvGradient;
    JvShape8: TJvShape;
    JvShape9: TJvShape;
    JvShape10: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvTransparentButton_Windows: TJvTransparentButton;
    Label_turma: TLabel;
    Label_Radio: TLabel;
    Label_Presencial: TLabel;
    Label_SemiPresencial: TLabel;
    Label2: TLabel;
    Label_Inicio_dist: TLabel;
    DBEdit_InicioDist: TDBEdit;
    DBEdit_Inicio: TDBEdit;
    Label_TerminoDist: TLabel;
    Label3: TLabel;
    DBEdit_TerminoDist: TDBEdit;
    DBEdit_termino: TDBEdit;
    Label_Local2: TLabel;
    Label_Local1: TLabel;
    DBEdit_Local2: TDBEdit;
    DBEdit_Local1: TDBEdit;
    Label_Status: TLabel;
    Label13: TLabel;
    Label_Coordenador: TLabel;
    JvShape1: TJvShape;
    Label_CodCurso: TLabel;
    SpeedButton_Patentes: TSpeedButton;
    JvShape_SelTurma: TJvShape;
    Label_Ano: TLabel;
    JvShape14: TJvShape;
    JvTransparentButton_ImprimirAvaliacao: TJvTransparentButton;
    JvShape15: TJvShape;
    JvTransparentButton_ResponsavelAsssinatura_Avaliacao: TJvTransparentButton;
    CheckBox_VizualizarAvaliacao: TJvCheckBox;
    Bevel3: TBevel;
    JvCheckBox_Rel_Recibo_do_Codigo_do_Aluno_RCA: TJvCheckBox;
    Panel1: TPanel;
    JvShape16: TJvShape;
    JvTransparentButton_Imprimir_Formulario: TJvTransparentButton;
    JvShape17: TJvShape;
    JvTransparentButton_ResponsavelAsssinatura_Formulario: TJvTransparentButton;
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Splitter1: TSplitter;
    Label11: TLabel;
    JvShape2: TJvShape;
    JvDateEdit_DataInicio: TJvDateEdit;
    JvDateEdit_DataTermino: TJvDateEdit;
    JvCheckBox_RetiradaFaltas: TJvCheckBox;
    JvCheckBox_FichaDeViagem: TJvCheckBox;
    JvCheckBox_ControleRefeicao: TJvCheckBox;
    JvCheckBox_Rel_PautaChamada: TJvCheckBox;
    JvCheckBox_ControleRefeicaoInstrutor: TJvCheckBox;
    JvCheckBox_Rel_AlunosParaCorrecao: TJvCheckBox;
    JvCheckBox_FichaDesempedimentodeAlunos: TJvCheckBox;
    JvCheckBox_FichaDesempedimentodeInstrutores: TJvCheckBox;
    JvCheckBox_RelacaoEnderecos: TJvCheckBox;
    CheckBox_VizualizarFormulario: TJvCheckBox;
    JvShape_CopiaRelacaoInstrutores: TJvShape;
    JvTransparentButton_CopiaRelacaoInstrutores: TJvTransparentButton;
    JvCheckBox_RelacaoAlunosComCodigo: TJvCheckBox;
    JvCheckBox_RelacaoInstrutoresComCodigo: TJvCheckBox;
    Panel_TratarDiploma: TPanel;
    Edit_Dip_Conferido: TEdit;
    Edit_Dip_Nome: TEdit;
    Edit_Dip_Funcao: TEdit;
    Edit_Dip_Curso01: TEdit;
    JvGradient3: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton_Dip_DiplomaPDF: TJvTransparentButton;
    JvShape12: TJvShape;
    JvTransparentButton_Dip_Fechar: TJvTransparentButton;
    JvShape13: TJvShape;
    JvTransparentButton_TratarDiplomaAluno: TJvTransparentButton;
    Edit_Dip_Curso03: TEdit;
    JvShape18: TJvShape;
    JvTransparentButton_TratarDiplomaIntrutor: TJvTransparentButton;
    Edit_Dip_Curso02: TEdit;
    Edit_Dip_Cidade: TEdit;
    DBNavigator_Dip: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Label_Dip_DiplomaPara: TLabel;
    JvShape11: TJvShape;
    JvEnterAsTab2: TJvEnterAsTab;
    CheckBox_Dip_Conferido: TCheckBox;
    CheckBox_Dip_Nome: TCheckBox;
    CheckBox_Dip_Curso01: TCheckBox;
    CheckBox_Dip_Funcao: TCheckBox;
    CheckBox_Dip_Curso02: TCheckBox;
    CheckBox_Dip_Curso03: TCheckBox;
    CheckBox_Dip_Cidade: TCheckBox;
    N1: TMenuItem;
    odosAlunosBaixaQualidade1: TMenuItem;
    AlunoSelecionadoBaixaQualidade1: TMenuItem;
    SpeedButton_TurmaExecutadaExecucao: TSpeedButton;

    procedure GerarDiploma_Pdf;
    procedure TrataNomeDiploma;
    procedure TratarDiploma(VS_Opcao: String);
    procedure ImprimirDiploma_Pdf;
    procedure ExcluiTurma;
    procedure TurmaDefault(VS_Comando: String);
    procedure TrataAvaliacao(VB_Status: Boolean);
    procedure TrataBotoes(VB_Status: Boolean);
    procedure MontaCurso(PS_Curso: String);
    procedure Monta_ComboTurma;
    procedure FechaTurma;
    procedure LimpaJanelaTurma;

    procedure ExcluiArquivos( VS_IdCurso, VS_IdTurma: String );
    procedure MontaInstrutor(Sender: TObject);
    procedure ChamaTodosAluno(Sender: TObject);
    procedure MontaAluno(Status: String);

    function CurrText: TJvTextAttributes;

    procedure TrataRestricao(VS_Restricao: String);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid_SelecionaAlunoTitleClick(Column: TColumn);
    procedure DBGrid_SelecionaInstrutorTitleClick(Column: TColumn);
    procedure RecortarButtonClick(Sender: TObject);
    procedure CopiarButtonClick(Sender: TObject);
    procedure ColarButtonClick(Sender: TObject);
    procedure JvFontComboBoxChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure NegritoButtonClick(Sender: TObject);
    procedure ItalicoButtonClick(Sender: TObject);
    procedure SublinhadoButtonClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_CorClick(Sender: TObject);
    procedure ToolButton_InseriLinhaClick(Sender: TObject);
    procedure ToolButton_InserirHoraClick(Sender: TObject);
    procedure ToolButton_InsereCalendarioClick(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure JvDateEdit_DataInicioChange(Sender: TObject);
    procedure ToolButton_ResponsavelAsssinaturaClick(Sender: TObject);
    procedure SpeedButton_gerarCertidaoClick(Sender: TObject);
    procedure SpeedButton_ExecutadaClick(Sender: TObject);
    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure DesfazerButtonClick(Sender: TObject);
    procedure TabSheet_AndamentoEnter(Sender: TObject);
    procedure DBGrid_SelecionaAlunoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_SelecionaInstrutorDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IBQuery_InstrutorTurmaAfterScroll(DataSet: TDataSet);
    procedure JvDBRichEdit_AndamentoKeyPress(Sender: TObject;var Key: Char);
    procedure ComboBox_CursoSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_SelecionaAlunoCellClick(Column: TColumn);
    procedure ComboBox_SelTurmaChange(Sender: TObject);
    procedure JvExpressButton_SenhaAlunosClick(Sender: TObject);
    procedure SpeedButton_PatentesClick(Sender: TObject);
    procedure PageControl_CadTurmaEnter(Sender: TObject);
    procedure PageControl_CadTurmaExit(Sender: TObject);
    procedure JvExpressButton_InsereRestricaoClick(Sender: TObject);
    procedure JvExpressButton_ExcluiRestricaiClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_NovaTurmaClick(Sender: TObject);
    procedure JvTransparentButton_EditarTurmaClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiTurmaClick(Sender: TObject);
    procedure JvTransparentButton_Gravar_AndamentoClick(Sender: TObject);
    procedure JvTransparentButton_Cancela_AndamentoClick(Sender: TObject);
    procedure JvTransparentButton_Imprimir2viaClick(Sender: TObject);
    procedure JvTransparentButton_InserirITClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiITClick(Sender: TObject);
    procedure JvTransparentButton_AlterarITClick(Sender: TObject);
    procedure JvTransparentButton_ApresentacaoInstrutorClick(Sender: TObject);
    procedure JvTransparentButton_InserirAlClick(Sender: TObject);
    procedure JvTransparentButton_AlterarAlClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiAlClick(Sender: TObject);
    procedure JvTransparentButton_CopiaRelacaoAlunosClick(Sender: TObject);
    procedure JvTransparentButton_Excel_AlunoClick(Sender: TObject);
    procedure JvTransparentButton_RelacaoAlunosClick(Sender: TObject);
    procedure JvTransparentButton_GerarExcelInstrutorClick( Sender: TObject);
    procedure JvTransparentButton_RelacaoInstrutoresClick(Sender: TObject);
    procedure ImprimirEmPDFTodosAlunosClick(Sender: TObject);
    procedure SomentealunoselecionadoClick(Sender: TObject);
    procedure MenuItem_TodosInstrutoresClick(Sender: TObject);
    procedure MenuItem_SomenteInstrutorSelecionadoClick(Sender: TObject);
    procedure JvExpressButton_CargaTurmaAlunoClick(Sender: TObject);
    procedure JvExpressButton_CargaTurmaInstrutorClick(Sender: TObject);
    procedure ComboBox_CursoChange(Sender: TObject);
    procedure JvTransparentButton_CopiaRelacaoInstrutoresClick(Sender: TObject);
    procedure JvExpressButton_SenhaInstrutorClick(Sender: TObject);
    procedure JvTransparentButton_TratarDiplomaAlunoClick(Sender: TObject);
    procedure JvTransparentButton_Dip_FecharClick(Sender: TObject);
    procedure JvTransparentButton_TratarDiplomaIntrutorClick( Sender: TObject);
    procedure JvTransparentButton_Dip_DiplomaPDFClick(Sender: TObject);
    procedure JvTransparentButton_Dip_DiplomaInstrutorPDFClick( Sender: TObject);
    procedure IBQuery_AlunoTurmaAfterScroll(DataSet: TDataSet);
    procedure odosAlunosBaixaQualidade1Click(Sender: TObject);
    procedure AlunoSelecionadoBaixaQualidade1Click(Sender: TObject);

  private    { Private declarations }
     FUpdating: Boolean;
     MS_Turma: Array[1..800] of String;
     VS_IdCurso, VS_AntiguidadeAl, VS_AntiguidadeIt: String;

  public    { Public declarations }
     VB_SelecaoResponsavelAssinatura: Boolean;

     VS_DescCurso, VS_CodCurso, VS_ComandoAluno, OrderByAluno, VS_Aluno: String;
     VS_ComandoInstrutor, OrderByInstrutor, VS_Instrutor, VS_Opcao, VS_Opcao_Diploma: String;
     NPaginas: integer;
  end;

var
  Form_SelTurma: TForm_SelTurma;

implementation

uses Module, MenuPrincipal, Cad_Turma, Cad_InstrutorTurma,
  ApresentacaoInstrutor, CargaAlunos_Cenipa, Cad_Aluno, Sel_ResponsavelAssinaturaRelatorio, Rel_ControleDePresencaDeAlunos,
  Rel_ControleDeRefeicoes, Rel_ControleDeRefeicoes_Instrutor,
  Rel_ApresentacaoDeAlunosParaFinaisDeSemanaEFeriados, Rel_RetiradaDeFaltas, Rel_CorrigirDadosERubricar,
  Rel_FichaDeDesimpedimentoDeAlunos_PorTurma, Rel_FichaDeDesimpedimentoDeInstrutoresPorTurma, Rel_RelacaoEnderecos,
  Rel_FichaDeRegistrosdeCertificados_Icea, ImprimirDiploma,
  MontaCertidaoCurricular, GerarRegCertificados, Cad_PTS, RelacaoTurma,
  RelacaoInstrutorTurma, CopiaTurma, Divisas, Rel_Diploma,
  Rel_Recibo_do_Codigo_do_Aluno_RCA, Rel_RelatorioDoCadastroDeAlunosComCodigo;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando abrea a Form
//------------------------------------------------------------------------------

procedure TForm_SelTurma.FormActivate(Sender: TObject);
var
   DiaSemana: Integer;
   Status: Boolean;
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      JvTransparentButton_Dip_FecharClick(Sender);
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Turma/Aluno/Instrutor');    // Abre o perfil do usuario em relacao a agenda
      Funcoes.CabecalhoForm(Form_SelTurma, ' Cadastro de Turma / Aluno / Instrutor');
      try
          if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA') or (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ILA')) then
             Status:= False
          else
             Status:= True;

          Funcoes.TratarJvTransparentButton(JvTransparentButton_CopiaRelacaoAlunos, JvShape_CopiaRelacaoAlunos, Status);

          //--- Tratamento da data do Relatorio

          VB_SelecaoResponsavelAssinatura:= False;
          JvDateEdit_DataInicio.Date:= JvDateEdit_DataTermino.Date;
          JvDateEdit_DataTermino.Date:= JvDateEdit_DataInicio.Date + 2;

          DiaSemana:= DayOfWeek(Date);
          if DiaSemana = 1 then
             JvDateEdit_DataInicio.Date:= Date+1
          else
          begin
             DiaSemana:= DiaSemana-2;
             JvDateEdit_DataInicio.Date:= Date-(DiaSemana);
          end;
          JvDateEdit_DataTermino.Date:= JvDateEdit_DataInicio.Date + 4;

          ComboBox_SelTurma.Text:= Funcoes.GetSetTurma;   //  'Default-in';

          VS_AntiguidadeAl:= 'Nome collate PXW_INTL850';
          VS_AntiguidadeIt:= 'Nome collate PXW_INTL850';
          OrderByAluno:= ' order by Nome collate PXW_INTL850 ';
          OrderByInstrutor:= ' order by nome ';

          //--- Abre as Tabelas de Trabalho

          DM.IBTable_Turma.Open;
          DM.IBTable_Turma.Filter:= 'IdTurma <> 0';
          DM.IBTable_Turma.Filtered:= True;

          IBTable_AndamentoTurma.Open;
          IBTable_Pessoa_Al.Open;

          //--- Tratamento da Selecao dos Cursos

          Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
          MontaCurso(Funcoes.GetCodCurso);
          Funcoes.SetCadCurso('CadCurso');

          MontaInstrutor(Sender);

      except
          Edit1.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_SelTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.AtualizaQuery(Form_MenuPrincipal.Query_TurmaAndamento);
   Funcoes.AtualizaQuery(Form_MenuPrincipal.IBQuery_TurmaPlanejada);
end;

//------------------------------------------------------------------------------
// Tratamento Avaliacao
//------------------------------------------------------------------------------

procedure TForm_SelTurma.TrataAvaliacao(VB_Status: Boolean);
begin
   SpeedButton_TurmaExecutadaExecucao.Visible:= False;
   TabSheet_SegundaVia.TabVisible:= False;
   JvCheckBox_Rel_PautaChamada.Checked:= False;
   JvCheckBox_ControleRefeicao.Checked:= False;
   JvCheckBox_ControleRefeicaoInstrutor.Checked:= False;
   JvCheckBox_FichaDeViagem.Checked:= False;
   JvCheckBox_RetiradaFaltas.Checked:= False;
   JvCheckBox_Rel_AlunosParaCorrecao.Checked:= False;
   JvCheckBox_FichaDesempedimentodeAlunos.Checked:= False;
   JvCheckBox_FichaDesempedimentodeInstrutores.Checked:= False;
   JvCheckBox_DiplomaAssinaturaDigitalInstrutor2.Checked:= False;

   if Funcoes.GetSecao = 'ADMINISTRA��O' then
   begin
      GroupBox_FechamentoCurso.Visible:= VB_Status;
      TabSheet_Andamento.TabVisible:= VB_Status;
      TabSheet_Impressao.TabVisible:= VB_Status;
      TabSheet_Avaliacao.TabVisible:= VB_Status;
      if ComboBox_SelTurma.Text = 'Executados' Then
         TabSheet_SegundaVia.TabVisible:= VB_Status;
   end
   else
   begin
      TabSheet_Andamento.TabVisible:= False;
      TabSheet_Impressao.TabVisible:= False;
      TabSheet_Avaliacao.TabVisible:= False;
      TabSheet_SegundaVia.TabVisible:= False;

      if (Funcoes.GetSecao = 'AVALIA��O') Then
      begin
         TabSheet_Avaliacao.TabVisible:= VB_Status;
         if ComboBox_SelTurma.Text = 'Executados' Then
            TabSheet_SegundaVia.TabVisible:= VB_Status;
         PageControl_CadTurma.TabIndex:= 4;
      end
      else
      begin
         if (Funcoes.GetSecao = 'EXECU��O') Then
         begin
            TabSheet_Andamento.TabVisible:= VB_Status;
            TabSheet_Impressao.TabVisible:= VB_Status;
            PageControl_CadTurma.TabIndex:= 1;
            if DM.IBTable_Turma.FieldByName('IdCurso').AsInteger = 208 then
               SpeedButton_TurmaExecutadaExecucao.Visible:= True;
         end
         else
         begin
            if (Funcoes.GetSecao = 'EOM') Then
            begin
               TabSheet_Impressao.TabVisible:= VB_Status;
               PageControl_CadTurma.TabIndex:= 0
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes Referentes a Form
//------------------------------------------------------------------------------

procedure TForm_SelTurma.TrataBotoes(VB_Status: Boolean);
begin
   IBQuery_InstrutorTurma.Open;
   Funcoes.TratarBotoes(DM.IBQuery_MontaTurma, JvTransparentButton_NovaTurma, JvTransparentButton_EditarTurma, JvTransparentButton_ExcluiTurma);

   JvTransparentButton_ResponsavelAsssinatura_Formulario.Enabled:= VB_Status;
   JvTransparentButton_ResponsavelAsssinatura_Avaliacao.Enabled:= VB_Status;
   TrataAvaliacao(VB_Status);
end;

//------------------------------------------------------------------------------
//
// Tratamento do Curso
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento da Selecao de um Novo Curso
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ComboBox_CursoSelect(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_SelTurma.MontaCurso(PS_Curso: String);
var
   Sender: TObject;
begin
   if ((VS_CodCurso <> PS_Curso) or (Funcoes.GetCadCurso = 'MenuPrincipal') ) then
   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         Funcoes.ExecutaQuery( DM.IBQuery_Executa,'Select IdCurso, CodCurso, NomeCurso '+
                                                  'From Curso '+
                                                  ' where codcurso = '+#39+PS_Curso+#39
                             );

         if Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;
            Label_DescricaoCurso.Caption:= DM.IBQuery_Executa.FieldByNAme('NomeCurso').AsString;
            VS_IdCurso:=  DM.IBQuery_Executa.FieldByName('IdCurso').AsString;

            VS_CodCurso:= ComboBox_Curso.Text;
            VS_DescCurso:= DM.IBQuery_Executa.FieldByNAme('NomeCurso').AsString;

            Monta_ComboTurma;
            ComboBox_TurmaChange(Sender);
         end
         else
             Showmessage('Curso n�o Cadastrado.');
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Vizuzlizar as Turmas
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ComboBox_SelTurmaChange(Sender: TObject);
begin
   Monta_ComboTurma;
   ComboBox_TurmaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Fechar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.LimpaJanelaTurma;
begin
   DBEdit_Inicio.Text:= '';
   DBEdit_termino.Text:= '';
   DBEdit_Local1.Text:= '';

   DBEdit_InicioDist.Text:= '';
   DBEdit_TerminoDist.Text:= '';
   DBEdit_Local2.Text:= '';

   DBEdit_Status.Text:= '';
   DBEdit_ano.Text:= '';
   DBEdit_Coordenador.Text:= '';
   DBEdit_Radio.Text:= '';
end;

//------------------------------------------------------------------------------
// Tratamento do Combo de Selecao da Turma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ComboBox_TurmaChange(Sender: TObject);
var
   VS_Turma: String;
   VI_IdTurma: Integer;
   VB_Status: Boolean;
begin
   VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-'));

   VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
   if MS_Turma[VI_IdTurma] <> '-2' then
      Form_MenuPrincipal.MontaTurma(VS_IdCurso, MS_Turma[VI_IdTurma])
   else
      Form_MenuPrincipal.MontaTurma(VS_IdCurso, MS_Turma[1]);

   if  DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString = 'Semi' then
      VB_Status:= True
   else
   begin
      Label_Presencial.Caption:= DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString+':';
      VB_Status:= False;
   end;

   Label_SemiPresencial.Visible:= VB_Status;
   Label_Inicio_dist.Visible:= VB_Status;
   DBEdit_InicioDist.Visible:= VB_Status;
   Label_TerminoDist.Visible:= VB_Status;
   DBEdit_TerminoDist.Visible:= VB_Status;
   Label_Local2.Visible:= VB_Status;
   DBEdit_Local2.Visible:= VB_Status;

   if DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString = '' then
      Label_DescricaoCurso.Caption:= VS_DescCurso
   else
      Label_DescricaoCurso.Caption:= DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;

   if Trim(DM.IBTable_Turma.FieldByName('IdTurma').AsString) = '' then
   begin
      TrataBotoes(False);
      JvTransparentButton_NovaTurma.Enabled:= True;
   end
   else
      TrataBotoes( True);

   MontaInstrutor(Sender);
   ChamaTodosAluno(Sender);

   if DM.IBTable_Turma.FieldByName('Status').AsString = 'E' then
   begin
       JvTransparentButton_EditarTurma.Enabled:= False;
       JvTransparentButton_ExcluiTurma.Enabled:= False;
       JvTransparentButton_ResponsavelAsssinatura_Formulario.Enabled:= False;
       JvTransparentButton_ResponsavelAsssinatura_Avaliacao.Enabled:= False;
       Panel_Botoes_Aluno.Visible:= False;
       Panel_Botoes_Instrutor.Visible:= False;
       TrataAvaliacao(False);
       if ((Funcoes.GetSecao = 'AVALIA��O') or (Funcoes.GetSecao = 'ADMINISTRA��O')) Then
          TabSheet_SegundaVia.TabVisible:= True
       else
       begin
          if ((Funcoes.GetSecao = 'EXECU��O')) Then
          begin
             TabSheet_Andamento.TabVisible:= True;
             TabSheet_Impressao.TabVisible:= True;
          end;
       end;
   end
   else
   begin
      Funcoes.TratarBotoes(IBQuery_InstrutorTurma, JvTransparentButton_InserirIT, JvTransparentButton_AlterarIT, JvTransparentButton_ExcluiIT);
      Funcoes.TratarBotoes(IBQuery_AlunoTurma, JvTransparentButton_InserirAl, JvTransparentButton_AlterarAl, JvTransparentButton_ExcluiAl);
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Rela��o das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.TurmaDefault(VS_Comando: String);
begin
   Funcoes.OpenQuery(VS_Comando);

   if DM.IBQuery_Executa.FieldByName('Descricao').AsString = '' then
   begin
      if DM.IBQuery_Executa.FieldByName('Turma').AsString <> '' then
      begin
         ComboBox_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+VS_DescCurso;
         MS_Turma[1]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
//         ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+VS_DescCurso;
//         MS_Turma[1]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
      end
      else
      begin
         ComboBox_Turma.Text:= '';
         MS_Turma[1]:= '-2';
      end;
   end
   else
   begin
      ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
      MS_Turma[1]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Rela��o das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.Monta_ComboTurma;
var
   VI_Indice: Integer;
begin
   //--- Tratamento para selecao da turma para o comboBox quando a selecao for feita na Form Selecao Turma

   VI_Indice:= 1;
   LimpaJanelaTurma;
   TabSheet_SegundaVia.TabVisible:= False;

   if ((ComboBox_SelTurma.Text = 'Default-in') or (ComboBox_SelTurma.Text = 'Default')) then
   begin
      ComboBox_SelTurma.Text:= 'Default';
      TurmaDefault( 'Select idTurma, turma, Ano, Descricao '+
                         ' From Turma '+
                         ' where IdCurso = '+VS_IdCurso+
                         ' and (Status = '+#39+'A'+#39+' or Status = '+#39+'P'+#39+')'+
                         ' order by IdTurma '
                       );
   end
   else
   begin
      if ComboBox_SelTurma.Text = 'Em Andamento' then
      begin
          TurmaDefault('Select idTurma, turma, Ano, Descricao '+
                       ' From Turma '+
                       ' where IdCurso = '+VS_IdCurso+
                       ' and Status = '+#39+'A'+#39+
                       ' order by IdTurma '
                      );
      end
      else
      begin
         if ComboBox_SelTurma.Text = 'Planejados' then
         begin
            TurmaDefault('Select idTurma, turma, Ano, Descricao '+
                         ' From Turma '+
                         ' where IdCurso = '+VS_IdCurso+
                         ' and Status = '+#39+'P'+#39+
                         ' order by IdTurma '
                        );
         end
         else
         begin
            if ComboBox_SelTurma.Text = 'Executados' then
            begin
               TabSheet_SegundaVia.TabVisible:= True;

                TurmaDefault('Select idTurma, turma, Ano, Descricao '+
                             ' From Turma '+
                             ' where IdCurso = '+VS_IdCurso+
                             ' and Status = '+#39+'E'+#39+
                             ' order by IdTurma '
                            );
            end
            else
            begin
               if ComboBox_SelTurma.Text = 'Cancelados' then
               begin
                  TurmaDefault('Select idTurma, turma, Ano, Descricao '+
                               ' From Turma '+
                               ' where IdCurso = '+VS_IdCurso+
                               ' and Status = '+#39+'C'+#39+
                               ' order by IdTurma '
                              );
               end
               else
               begin
                   if ComboBox_SelTurma.Text = 'Todos' then
                   begin
                      TurmaDefault( 'Select idTurma, turma, Ano, Descricao '+
                                   ' From Turma '+
                                   ' where IdCurso = '+VS_IdCurso+
                                   ' and Status <> '+#39+'B'+#39+
                                   ' order by IdTurma '
                                  );
                  end;
               end;
            end;
         end;
      end;
   end;

   ComboBox_Turma.Items.Clear;

   if ((Trim(DM.IBQuery_Executa.FieldByName('Turma').AsString) = '') or (Trim(DM.IBQuery_Executa.FieldByName('Turma').AsString) = 'TURMA')) then
   begin
      TrataBotoes(False);
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= '-2';
      Panel_Botoes_CabecalhoProva.Visible:= True;
   end
   else
   begin
      TrataBotoes(True);
      DM.IBQuery_Executa.First;

      //---

      if ((Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString) <> '') and (Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString) <> 'TURMA')) then
      begin
         ComboBox_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
         MS_Turma[VI_Indice]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end
      else
      begin
         if ((DM.IBQuery_Executa.FieldByName('Turma').AsString <> '')) then
         begin
            ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString;
            MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
         end
      end;
      //---

      Panel_Botoes_CabecalhoProva.Visible:= True;

      While not DM.IBQuery_Executa.Eof do
      begin
         if DM.IBQuery_Executa.FieldByName('Descricao').AsString = '' then
            ComboBox_Turma.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+VS_DescCurso)
         else
            ComboBox_Turma.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString+' - '+DM.IBQuery_Executa.FieldByName('Descricao').AsString);

         VI_Indice:= VI_Indice + 1;
         MS_Turma[VI_Indice]:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;

         DM.IBQuery_Executa.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Fechar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Botao que retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
//
// Tratamento da Turma
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Botao para Inserir uma Nova Turma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_NovaTurmaClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cad_Turma, Form_Cad_Turma);
   Funcoes.CabecalhoForm( Form_Cad_Turma, 'Cadastro Turma');

   DM.IBTable_Turma.Insert;
   DM.IBTable_Turma.FieldByName('IdCurso').AsString:= VS_IdCurso;
   DM.IBTable_Turma.FieldByName('IdTurma').AsInteger:= Funcoes.MaiorCodigoComRestricao('IdTurma', 'IdCurso = '+VS_IdCurso, 'Turma');
   DM.IBTable_Turma.FieldByName('Ano').AsString:= Funcoes_TrataData.AnoAtual;
   DM.IBTable_Turma.FieldByName('Modalidade').AsString:= 'Presencial';
   DM.IBTable_Turma.FieldByName('Status').AsString:= 'P';
   DM.IBTable_Turma.FieldByName('Certificado').AsInteger:= Funcoes.MaiorCodigo('Certificado', 'Turma');
   DM.IBTable_Turma.FieldByName('Local1').AsString:= DM.IBTable_Configuracao.FieldByName('Sigla').AsString;    // ICEA
   DM.IBTable_Turma.FieldByName('QtdBrasileiros').AsString:= '0';
   DM.IBTable_Turma.FieldByName('QtdEstrangeiros').AsString:= '0';

   Funcoes.OpenQuery('Select ADMINISTRATIVAS, INSTRUCAO, FLEXIBILIZACAO, AVALIACAO from Curso where IdCurso = '+VS_IdCurso);
   DM.IBTable_Turma.FieldByName('ADMINISTRATIVAS').AsString:= DM.IBQuery_Executa.FieldByName('ADMINISTRATIVAS').AsString;
   DM.IBTable_Turma.FieldByName('INSTRUCAO').AsString:= DM.IBQuery_Executa.FieldByName('INSTRUCAO').AsString;
   DM.IBTable_Turma.FieldByName('FLEXIBILIZACAO').AsString:= DM.IBQuery_Executa.FieldByName('FLEXIBILIZACAO').AsString;
   DM.IBTable_Turma.FieldByName('AVALIACAO').AsString:= DM.IBQuery_Executa.FieldByName('AVALIACAO').AsString;
   Form_Cad_Turma.ShowModal;
   ComboBox_TurmaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Editar a Turma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_EditarTurmaClick(Sender: TObject);
begin
   DM.IBTable_Turma.Edit;

   Application.CreateForm(TForm_Cad_Turma, Form_Cad_Turma);
   Funcoes.CabecalhoForm( Form_Cad_Turma, 'Cadastro Turma');
   Form_Cad_Turma.ShowModal;
   Form_Cad_Turma.Free;

   ComboBox_TurmaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para Excluir a Turma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ExcluiTurma;
var
   VI_Retorno: integer;
   Sender: TObject;
begin
   VI_Retorno:= Application.MessageBox('Essa exclus�o eliminar� a turma selecionada '+#13+
                                             'Confirma a exclus�o do registro ?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Menu Principal - Cadastro Turma/Aluno/Instrutor', 'Excluir Turma do Curso '+Form_MenuPrincipal.Label_CodigoCurso.Caption+' Turma '+DM.IBTable_Turma.FieldByName('Turma').AsString+' Ano: '+DM.IBTable_Turma.FieldByName('Ano').AsString);

      Funcoes.ExecusaoQuery('Delete from AlunoTurma where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
      Funcoes.ExecusaoQuery('Delete from InstrutorTurma where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
      Funcoes.ExecusaoQuery('Delete From MateriaCurso where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
      Funcoes.ExecusaoQuery('Delete from ResultadoExame where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
      Funcoes.ExecusaoQuery('Delete from Respostaaluno where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
      ExcluiArquivos( DM.IBTable_Turma.FieldByName('IdCurso').AsString, DM.IBTable_Turma.FieldByName('IdTurma').AsString );

      DM.IBTable_Turma.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Monta_ComboTurma;
      ComboBox_TurmaChange(Sender);
   end;

end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Excluir a Turma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_ExcluiTurmaClick( Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from AlunoTurma where idcurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                    ' and idTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   if VI_retorno > 0 then
   begin
      VI_Retorno:= Application.MessageBox('A Turma selecionada possu� "Aluno Cadastrado"...'+#13+#13+
                                          'Confirma a exclus�o da Turma ?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
      begin
         VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from InstrutorTurma where idcurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                          ' and idTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
         if VI_retorno > 0 then
         begin
            VI_Retorno:= Application.MessageBox('A Turma selecionada possu� "Instrutor Cadastrado"...'+#13+#13+
                                                'Confirma a exclus�o da Turma ?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
            if VI_Retorno = IDYes then
                ExcluiTurma;
         end
         else
         begin
            ExcluiTurma;
         end;
      end;
   end
   else
   begin
      VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from InstrutorTurma where idcurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                       ' and idTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
      if VI_retorno > 0 then
      begin
         VI_Retorno:= Application.MessageBox('A Turma selecionada possu� "Instrutor Cadastrado"...'+#13+#13+
                                             'Confirma a exclus�o da Turma ?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
         if VI_Retorno = IDYes then
                ExcluiTurma;
      end
      else
         ExcluiTurma;
   end;
end;


//------------------------------------------------------------------------------
//
// Tratamento do Cadastro dos Instrutores
// 14/03/2011
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para gerar Arquivo Excel da Relacao dos Alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_GerarExcelInstrutorClick(Sender: TObject);
var
   objExcel, Sheet: Variant;
   cTitulo : string;
   i : integer;
begin
   if IBQuery_InstrutorTurma.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'A Turma selecionada n�o possu� instrutor Cadastrado...')
   else
   begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de Instrutores';

      try
         objExcel := CreateOleObject('Excel.Application');
      except
         objExcel := CreateOleObject('scalc.Application');
      end;
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'C�digo';
      Sheet.Range['B1'] := 'Posto Gradua��o';
      Sheet.Range['C1'] := 'Nome Guerra';
      Sheet.Range['D1'] := 'ID';
      Sheet.Range['E1'] := 'Nome Completo';
      Sheet.Range['F1'] := 'Fun��o';
      Sheet.Range['G1'] := 'Unidade';
      Sheet.Range['H1'] := 'SubUnidade';
      Sheet.Range['I1'] := 'Chegada';
      Sheet.Range['J1'] := 'Saida';

      // por aqui tu limparias a planilha

      i:= 2;
      IBQuery_InstrutorTurma.First;
      while not IBQuery_InstrutorTurma.eof do
      begin
         Sheet.Cells[i,1] := IBQuery_InstrutorTurma.FieldByName('CodigoInstrutor').AsString;
         Sheet.Cells[i,2] := IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString;
         Sheet.Cells[i,3] := IBQuery_InstrutorTurma.FieldByName('NomeGuerra').AsString;
         Sheet.Cells[i,4] := IBQuery_InstrutorTurma.FieldByName('Identidade').AsString;
         Sheet.Cells[i,5] := IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString;
         Sheet.Cells[i,6] := IBQuery_InstrutorTurma.FieldByName('Funcao').AsString;
         Sheet.Cells[i,7] := IBQuery_InstrutorTurma.FieldByName('IdUnidade').AsString;
         Sheet.Cells[i,8] := IBQuery_InstrutorTurma.FieldByName('IdSubUnidade').AsString;
         Sheet.Cells[i,9] := IBQuery_InstrutorTurma.FieldByName('DataChegada').AsString;
         Sheet.Cells[i,10] := IBQuery_InstrutorTurma.FieldByName('DataSaida').AsString;
         i:= i+1;
         IBQuery_InstrutorTurma.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do para Classificar Instrutor de acordo com cabecalho
//------------------------------------------------------------------------------

procedure TForm_SelTurma.DBGrid_SelecionaInstrutorTitleClick( Column: TColumn);
begin
   OrderByInstrutor:= ' ';

   if (column.Title.Caption = 'C�digo' ) then
       OrderByInstrutor:= ' order by CodigoInstrutor '
   else
     if trim(column.Title.Caption) = 'Nome Guerra' then
         OrderByInstrutor:= ' order by NomeGuerra'
     else
        if trim(column.Title.Caption) = 'ID' then
            OrderByInstrutor:= ' order by Identidade'
        else
           if trim(column.Title.Caption) = 'Nome Completo' then
           begin
              if VS_AntiguidadeIt = 'Nome collate PXW_INTL850' then
                 VS_AntiguidadeIt:= 'IdAntiguidade '
              else
                 VS_AntiguidadeIt:= 'Nome collate PXW_INTL850';

              OrderByInstrutor:= ' order by '+VS_AntiguidadeIt;
           end
           else
              if trim(column.Title.Caption) = 'Fun��o' then
                 OrderByInstrutor:= ' order by Funcao '
              else
                 if trim(column.Title.Caption) = 'Unidade' then
                    OrderByInstrutor:= ' order by IdUnidade '
                 else
                    if trim(column.Title.Caption) = 'SubUnidade' then
                       OrderByInstrutor:= ' order by IdSubUnidade'
                    else
                       if trim(column.Title.Caption) = 'Chegada' then
                           OrderByInstrutor:= ' order by DataChegada'
                       else
                          if trim(column.Title.Caption) = 'Sa�da' then
                              OrderByInstrutor:= ' order by DataSaida';

   Funcoes.ExecutaQuery(IBQuery_InstrutorTurma, VS_ComandoInstrutor +OrderByInstrutor);
   Funcoes.TratarBotoes(IBQuery_InstrutorTurma, JvTransparentButton_InserirIT, JvTransparentButton_AlterarIT, JvTransparentButton_ExcluiIT);
end;

//------------------------------------------------------------------------------
// Tratamento da Grid Instrutor
//------------------------------------------------------------------------------

procedure TForm_SelTurma.DBGrid_SelecionaInstrutorDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Trim(IBQuery_InstrutorTurma.FieldByName('Apresentacao').AsString) = '' then
     DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clRed
   else
      if Trim(IBQuery_InstrutorTurma.FieldByName('Funcao').AsString) = 'COORDENADOR' then
         DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clNavy
      else
         DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
    DBGrid_SelecionaInstrutor.Canvas.Brush.Color := clSkyBlue;

   DBGrid_SelecionaInstrutor.Canvas.FillRect(Rect);
   DBGrid_SelecionaInstrutor.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Tratamento de Consulta dos Instrutores
//------------------------------------------------------------------------------

procedure TForm_SelTurma.MontaInstrutor(Sender: TObject);
var
   Status: Boolean;
begin
   VS_ComandoInstrutor:= 'Select IdCurso, IdTurma, CodigoInstrutor, Nome, NomeGuerra, NomeCompleto, PostoGraduacao, Identidade, Sexo, saram, IdUnidade, IdSubUnidade, Funcao, DataChegada, DataSaida, Apresentacao, Ficha, identidade_old '+
                ' from Instrutor_Turmas_View '+
                ' Where IdCurso = :IdCurso'+
                ' and   IdTurma = :IdTurma';

   if Trim(Edit_CodigoIt.Text) <> '' then
       VS_ComandoInstrutor:= VS_ComandoInstrutor+' and CodigoInstrutor Like '+#39+Edit_CodigoIt.Text+'%'+#39;

   if Trim(Edit_NomeGuerraIt.Text) <> '' then
   begin
       VS_ComandoInstrutor:= VS_ComandoInstrutor+' and CAST(NomeGuerra AS VARCHAR(20) CHARACTER SET ISO8859_1) COLLATE PT_BR LIKE '+#39+Edit_NomeGuerraIt.Text+'%'+#39;
   end;

   if Trim(MaskEditSaram.Text) <> '' then
       VS_ComandoInstrutor:= VS_ComandoInstrutor+' and SARAM Like '+#39+'%'+MaskEditSaram.Text+'%'+#39;

   if Trim(Edit_EdentidadeIt.Text) <> '' then
       VS_ComandoInstrutor:= VS_ComandoInstrutor+' and Identidade Like '+#39+'%'+Edit_EdentidadeIt.Text+'%'+#39;

   if Trim(Edit_NomeIt.Text) <> '' then
   begin
       VS_ComandoInstrutor:= VS_ComandoInstrutor+' and (NomeCompleto Like '+#39+'%'+Edit_NomeIt.Text+'%'+#39;
       VS_ComandoInstrutor:= VS_ComandoInstrutor+Funcoes.TratarConsultaComAcento('NomeCompleto', 'Like', '%'+Edit_NomeIt.Text+'%')+')';
   end;

   if Trim(Edit_FuncaoIt.Text) <> '' then
       VS_ComandoInstrutor:= VS_ComandoInstrutor+' and Funcao Like '+#39+Edit_FuncaoIt.Text+'%'+#39;

   if Trim(Edit_UnidadeIt.Text) <> '' then
       VS_ComandoInstrutor:= VS_ComandoInstrutor+' and IdUnidade Like '+#39+Edit_UnidadeIt.Text+'%'+#39;

   Funcoes.ExecutaQuery(IBQuery_InstrutorTurma, VS_ComandoInstrutor +OrderByInstrutor);
   Funcoes.TratarBotoes(IBQuery_InstrutorTurma, JvTransparentButton_InserirIT, JvTransparentButton_AlterarIT, JvTransparentButton_ExcluiIT);

   if ((DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'N') and ( DM.Query_PerfilAcesso.FieldByName('Alterar').AsString = 'N')) then
      Status:= False
   else
      Status:= True;

   Funcoes.TratarJvExpressButton(JvExpressButton_SenhaInstrutor, JvShape_SenhaInstrutor, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_ApresentacaoInstrutor, JvShape_ApresentacaoInstrutor, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_CopiaRelacaoInstrutores, JvShape_CopiaRelacaoInstrutores, Status);
   Funcoes.TratarJvExpressButton(JvExpressButton_CargaTurmaInstrutor, JvShape_CargaTurmaInstrutor, Status);

   SpeedButton_gerarCertidao.Visible:= Status;
   SpeedButton_Executada.Visible:= Status;

   TabSheet_Instrutor.Caption:= 'Instrutores -> '+IntToStr(IBQuery_InstrutorTurma.RecordCount);
end;

//------------------------------------------------------------------------------
// Procedure com a funcao de tratar a Insercao do Instrutor
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_InserirITClick(Sender: TObject);
begin
   if DM.IBTable_Turma.RecordCount = 0 then
      Showmessage('Para cadastrar o instrutor � precido primeiro cadastrar a Turma...')
   else
   begin
       VS_Instrutor:= 'Novo';
       Application.CreateForm(TForm_Cad_InstrutorTurma, Form_Cad_InstrutorTurma);
       Form_Cad_InstrutorTurma.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para fazer altera��o dos dados do Instrutor selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_AlterarITClick( Sender: TObject);
var
   bmLocal : TBookmark;
begin
   bmLocal:= IBQuery_InstrutorTurma.GetBookMark;
   VS_Instrutor:= 'Alterar';
   Application.CreateForm(TForm_Cad_InstrutorTurma, Form_Cad_InstrutorTurma);
   Form_Cad_InstrutorTurma.ShowModal;
   IBQuery_InstrutorTurma.GotoBookMark(bmLocal);
   IBQuery_InstrutorTurma.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Exclusao Instrutor
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_ExcluiITClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclus�o eliminar� o instrutor selecionado '+#13+
                                       'Confirma a exclus�o do registro ?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Menu Principal - Cadastro Turma/Aluno/Instrutor', 'Exclus�o do Aluno '+IBQuery_InstrutorTurma.FieldByName('NomeGuerra').AsString+' do Curso '+Funcoes.GetCodCurso+' Turma '+DM.IBTable_Turma.FieldByName('Turma').AsString+' Ano: '+DM.IBTable_Turma.FieldByName('Ano').AsString);
      Funcoes.ExecusaoQuery( 'Delete from InstrutorTurma where idcurso = '+IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString+
                             ' and idTurma = '+IBQuery_InstrutorTurma.FieldByName('IdTurma').AsString+
                             ' and identidade = '+#39+IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39+
                             ' and CodigoInstrutor = '+IBQuery_InstrutorTurma.FieldByName('CodigoInstrutor').AsString
                           );
      Funcoes.AtualizaQuery(IBQuery_InstrutorTurma);
      Funcoes.TratarBotoes(IBQuery_InstrutorTurma, JvTransparentButton_InserirIT, JvTransparentButton_AlterarIT, JvTransparentButton_ExcluiIT);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Apresentacao do Instrutor
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_ApresentacaoInstrutorClick( Sender: TObject);
begin
   if DM.IBTable_Turma.RecordCount = 0 then
      Showmessage('N�o possu� instrutor(es) cadastrado para turma selecionada...')
   else
   begin
      Application.CreateForm(TForm_ApresentacaoInstrutor, Form_ApresentacaoInstrutor);
      Form_ApresentacaoInstrutor.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Procedure com a funcao de copiar os instrutores de uma turma para outra
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_CopiaRelacaoInstrutoresClick(Sender: TObject);
begin
   if DM.IBTable_Turma.RecordCount = 0 then
      Showmessage('Para copiar o(s) instrutor(es) � precido primeiro cadastrar a Turma...')
   else
   begin
      if IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString = '' then

      Application.CreateForm(TForm_CopiaTurma, Form_CopiaTurma);
      Funcoes.CabecalhoForm( Form_CopiaTurma, 'Copia dos instrutores de uma turma para outra');
      Form_CopiaTurma.showmodal;
      Form_CopiaTurma.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para carregar o instrutor na turma selecionada
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvExpressButton_CargaTurmaInstrutorClick(Sender: TObject);
begin
   VS_Opcao:= 'Carregar Instrutor';

   Application.CreateForm(TForm_CargaAlunos, Form_CargaAlunos);
   Form_CargaAlunos.showmodal;
   Form_CargaAlunos.Free;

   MontaInstrutor(Sender);
end;

procedure TForm_SelTurma.IBQuery_InstrutorTurmaAfterScroll( DataSet: TDataSet);
var
   Status: Boolean;
begin
   Status:= False;
   if trim(IBQuery_InstrutorTurma.FieldByName('Apresentacao').AsString) = '' then
      Status:= True;

   Funcoes.TratarJvTransparentButton(JvTransparentButton_ApresentacaoInstrutor, JvShape_ApresentacaoInstrutor, Status);
   TrataNomeDiploma;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro de Alunos
// 14/03/2011
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para gerar Arquivo Excel da Relacao dos Alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_Excel_AlunoClick(Sender: TObject);
var
   objExcel,Sheet : Variant;
   cTitulo : string;
   i : integer;
begin
   if IBQuery_AlunoTurma.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'A Turma selecionada n�o possu� aluno Cadastrado...')
   else
   begin
      IBTable_Pessoa_Al.Open;
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de Alunos';
      objExcel := CreateOleObject('Excel.Application');
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'SARAM';
      Sheet.Range['B1'] := 'CPF';
      Sheet.Range['C1'] := 'Nome Guerra';
      Sheet.Range['D1'] := 'ID';
      Sheet.Range['E1'] := 'Nome Completo';
      Sheet.Range['F1'] := 'Status';
      Sheet.Range['G1'] := 'Unidade';
      Sheet.Range['H1'] := 'SubUnidade';
      Sheet.Range['I1'] := 'Sexo';
      Sheet.Range['J1'] := 'Matricula';
      Sheet.Range['K1'] := 'Desligamento';
      Sheet.Range['L1'] := 'E-Mail';
      Sheet.Range['M1'] := 'Nota';

      // por aqui tu limparias a planilha

      i:= 2;
      IBQuery_AlunoTurma.First;
      while not IBQuery_AlunoTurma.eof do
      begin
         Sheet.Cells[i,1] := IBQuery_AlunoTurma.FieldByName('SARAM').AsString;
         Sheet.Cells[i,2] := IBQuery_AlunoTurma.FieldByName('CPF').AsString;
         Sheet.Cells[i,3] := IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString;
         Sheet.Cells[i,4] := IBQuery_AlunoTurma.FieldByName('Identidade').AsString;
         Sheet.Cells[i,5] := IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString;
         Sheet.Cells[i,6] := IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString;
         Sheet.Cells[i,7] := IBQuery_AlunoTurma.FieldByName('IdUnidade').AsString;
         Sheet.Cells[i,8] := IBQuery_AlunoTurma.FieldByName('IdSubUnidade').AsString;
         Sheet.Cells[i,9] := IBQuery_AlunoTurma.FieldByName('Sexo').AsString;
         Sheet.Cells[i,10] := IBQuery_AlunoTurma.FieldByName('DataMatricula').AsString;
         Sheet.Cells[i,11] := IBQuery_AlunoTurma.FieldByName('DataDesligamento').AsString;
         Sheet.Cells[i,12] := IBTable_Pessoa_Al.FieldByName('Email').AsString;
         Sheet.Cells[i,13] := IBQuery_AlunoTurma.FieldByName('NotaFinal').AsString;
         i:= i+1;
         IBQuery_AlunoTurma.Next;
      end;
      Sheet.Columns.AutoFit;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do para Classificar Alunos de acordo com cabecalho
//------------------------------------------------------------------------------

procedure TForm_SelTurma.DBGrid_SelecionaAlunoTitleClick(Column: TColumn);
begin
   OrderByAluno:= ' order by Nome collate PXW_INTL850 ';

   if (column.Title.Caption = 'C�d. Aluno' ) then
       OrderByAluno:= ' order by CodigoAluno '
   else
     if trim(column.Title.Caption) = 'Nome Guerra' then
         OrderByAluno:= ' order by NomeGuerra collate PXW_INTL850'
     else
        if trim(column.Title.Caption) = 'Identidade' then
            OrderByAluno:= ' order by Identidade_old'
        else
           if ((trim(column.Title.Caption) = 'Nome (Nome)') or (trim(column.Title.Caption) = 'Nome (Antiguidade)')) then
           begin
              if VS_AntiguidadeAl = 'Nome collate PXW_INTL850' then
              begin
                 VS_AntiguidadeAl:= 'IdAntiguidade, ULTIMAPROMOCAO, nome collate PXW_INTL850';
                 column.Title.Caption:= 'Nome (Antiguidade)';
              end
              else
              begin
                 VS_AntiguidadeAl:= 'Nome collate PXW_INTL850';
                 column.Title.Caption:= 'Nome (Nome)';
              end;

              OrderByAluno:= ' order by '+VS_AntiguidadeAl;
           end
           else
              if trim(column.Title.Caption) = 'Unidade' then
                 OrderByAluno:= ' order by IdUnidade '
              else
                 if trim(column.Title.Caption) = 'St' then
                    OrderByAluno:= ' order by MotivoDesligamento '
                 else
                    if trim(column.Title.Caption) = 'Sexo' then
                       OrderByAluno:= ' order by Sexo '
                    else
                       if trim(column.Title.Caption) = 'Matricula' then
                          OrderByAluno:= ' order by DataMatricula '
                       else
                          if trim(column.Title.Caption) = 'Desligamento' then
                             OrderByAluno:= ' order by DataDesligamento ';

   Funcoes.ExecutaQuery(IBQuery_AlunoTurma, VS_ComandoAluno +OrderByAluno);
   Funcoes.TratarBotoes(IBQuery_AlunoTurma, JvTransparentButton_InserirAl, JvTransparentButton_AlterarAl, JvTransparentButton_ExcluiAl);
end;

procedure TForm_SelTurma.DBGrid_SelecionaAlunoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBQuery_AlunoTurma.FieldByName('Sexo').AsString = '' then
   begin
      DBGrid_SelecionaAluno.Canvas.Brush.Color:= $000079F2;
      DBGrid_SelecionaAluno.Canvas.Font.Color:= clWhite;
   end
   else
   begin
      if ((Trim(IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString) <> 'a') and
          (Trim(IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString) <> '')) then
        DBGrid_SelecionaAluno.Canvas.Font.Color:= clRed
      else
         DBGrid_SelecionaAluno.Canvas.Font.Color:= clBlack;
   end;

  if gdSelected in State then
    DBGrid_SelecionaAluno.Canvas.Brush.Color := clSkyBlue;

   DBGrid_SelecionaAluno.Canvas.FillRect(Rect);
   DBGrid_SelecionaAluno.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Tratamento de Consulta dos Alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ChamaTodosAluno(Sender: TObject);
begin
   MontaAluno('Todos');
end;

//------------------------------------------------------------------------------
// Tratamento da query de consulta dos alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.MontaAluno(Status: String);
var
   VS_Condicao, VS_Comando: String;
   VI_Total_AlunosDesligados, VI_Total_Alunos: Integer;
   VB_Status: boolean;
begin
   VS_Condicao:= '';
   if ( (ComboBox_SelTurma.Text = 'Em Andamento')) then
   begin
      VS_ComandoAluno:= 'Select IdCurso, IdTurma, NumOrdem, nome, NomeCompleto, NomeGuerra, Identidade, CPF, CodigoAluno, sexo, idAntiguidade, PostoGraduacao, motivoDesligamento, NotaFinal, ULTIMAPROMOCAO, IdUnidade, IdSubUnidade, SARAM, '+
                        '       DataMatricula, DataDesligamento, Identidade_old '+
                        ' from Aluno_Turmas_Em_Andamento_View '+
                        ' Where IdCurso = :IdCurso'+
                        ' and IdTurma = :IdTurma';
   end
   else
   begin
      VS_ComandoAluno:= 'Select IdCurso, IdTurma, NumOrdem, nome, NomeCompleto, NomeGuerra, Identidade, CPF, CodigoAluno, sexo, idAntiguidade,  PostoGraduacao, motivoDesligamento, NotaFinal, ULTIMAPROMOCAO, IdUnidade, IdSubUnidade, SARAM, '+
                        '       DataMatricula, DataDesligamento, Identidade_old  '+
                        ' from Aluno_Turmas_VIEW '+
                        ' Where IdCurso = :IdCurso'+
                        ' and IdTurma = :IdTurma';
   end;

   if Trim(Edit_CodAlunoAl.Text) <> '' then
       VS_Condicao:= VS_Condicao+' and CodigoAluno Like '+#39+Edit_CodAlunoAl.Text+'%'+#39;

   if Trim(MaskEdit_SARAM.Text) <> '' then
       VS_Condicao:= VS_Condicao+' and SARAM Like '+#39+MaskEdit_SARAM.Text+'%'+#39;

   if Trim(Edit_NomeGuerraAl.Text) <> '' then
   begin
       VS_Condicao:= VS_Condicao+' and (NomeGuerra Like '+#39+Edit_NomeGuerraAl.Text+'%'+#39;
       VS_Condicao:= VS_Condicao+Funcoes.TratarConsultaComAcento('NomeGuerra', 'Like', Edit_NomeGuerraAl.Text+'%')+')';
   end;

   if Trim(Edit_EdentidadeAl.Text) <> '' then
       VS_Condicao:= VS_Condicao+' and Identidade Like '+#39+'%'+Edit_EdentidadeAl.Text+'%'+#39;

   if Trim(Edit_NomeAl.Text) <> '' then
   begin
       VS_Condicao:= VS_Condicao+' and (NomeCompleto Like '+#39+'%'+Edit_NomeAl.Text+'%'+#39;
       VS_Condicao:= VS_Condicao+Funcoes.TratarConsultaComAcento('NomeCompleto', 'Like', '%'+Edit_NomeAl.Text+'%')+')';
   end;

   if Trim(Edit_UnidadeAl.Text) <> '' then
       VS_Condicao:= VS_Condicao+' and IdUnidade Like '+#39+'%'+Edit_UnidadeAl.Text+'%'+#39;

    if Status <> 'Todos' then
       VS_Condicao:= VS_Condicao+' and motivodesligamento = '+#39+'a'+#39;

   VS_ComandoAluno:= VS_ComandoAluno+VS_Condicao;
   Funcoes.ExecutaQuery(IBQuery_AlunoTurma, VS_ComandoAluno +OrderByAluno);

   Funcoes.TratarBotoes(IBQuery_AlunoTurma, JvTransparentButton_InserirAl, JvTransparentButton_AlterarAl, JvTransparentButton_ExcluiAl);
   if ((DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'N') and ( DM.Query_PerfilAcesso.FieldByName('Alterar').AsString = 'N')) then
      VB_Status:= False
   else
      VB_Status:= True;

   Funcoes.TratarJvExpressButton(JvExpressButton_SenhaAlunos, JvShape_SenhaAlunos, VB_Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_CopiaRelacaoAlunos, JvShape_CopiaRelacaoAlunos, VB_Status);
   Funcoes.TratarJvExpressButton(JvExpressButton_CargaTurmaAluno, JvShape_CargaTurmaAluno, VB_Status);

    //------------
   //--- Tratamento para encontrar o numero de alunos

   if DM.IBTable_Turma.FieldByName('IdCurso').AsString <> '' then
   begin
      if ((ComboBox_SelTurma.Text = 'Default') or (ComboBox_SelTurma.Text = 'Em Andamento')) then
      begin
         VS_Comando:= 'Select count(1) as Qtd '+
                           ' from Aluno_Turmas_Em_Andamento_View '+
                           ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                           ' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                           VS_Condicao+
                           ' and MotivoDesligamento <> '+#39+'a'+#39;
      end
      else
      begin
         VS_Comando:= 'Select count(1) as Qtd '+
                           ' from Aluno_Turmas_VIEW '+
                           ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                           ' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                           VS_Condicao+
                           ' and MotivoDesligamento <> '+#39+'a'+#39;
      end;

      Funcoes.OpenQuery(VS_Comando);
      VI_Total_AlunosDesligados:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
      VI_Total_Alunos:= IBQuery_AlunoTurma.RecordCount;
      TabSheet_Aluno.Caption:= 'Alunos -> '+IntToStr(VI_Total_Alunos)+'-'+IntToStr(VI_Total_AlunosDesligados)+' = '+IntToStr(VI_Total_Alunos-VI_Total_AlunosDesligados);
   end
   else
   begin
      TabSheet_Aluno.Caption:= 'Alunos -> 0';
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro de um Novo Aluno
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_InserirAlClick(Sender: TObject);
begin
   if DM.IBTable_Turma.RecordCount = 0 then
   begin
      Showmessage('Para cadastrar o aluno � precido primeiro cadastrar a Turma...');
   end
   else
   begin
       VS_Aluno:= 'Novo';
       Application.CreateForm(TForm_Cad_Aluno, Form_Cad_Aluno);
       Form_Cad_Aluno.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para fazer altera��o dos dados do aluno selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_AlterarAlClick(Sender: TObject);
begin
   VS_Aluno:= 'Alterar';
   Application.CreateForm(TForm_Cad_Aluno, Form_Cad_Aluno);
   Form_Cad_Aluno.ShowModal;
   Funcoes.AtualizaQuery(IBQuery_AlunoTurma);
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar o conteudo de uma celula da Grid de aluno
//------------------------------------------------------------------------------

procedure TForm_SelTurma.DBGrid_SelecionaAlunoCellClick(Column: TColumn);
begin
  Edit1.text:= IBQuery_AlunoTurma.FieldByName(Column.FieldName).AsString;
  Edit1.SelectAll;
  Edit1.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da exclusao do aluno selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_ExcluiAlClick(Sender: TObject);
var
   VI_Retorno, VI_Final, VI_NumOrdemAtual, VI_Inicio, VI_Cont: integer;
   VS_IdTurma: String;
begin
   VI_Retorno:= Application.MessageBox('Essa exclus�o eliminar� o aluno selecionado '+#13+
                                    'Confirma a exclus�o do registro ?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Menu Principal - Cadastro Turma/Aluno/Instrutor', 'Exclus�o do Aluno '+IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString+' Curso '+Funcoes.GetCodCurso+' Turma '+DM.IBTable_Turma.FieldByName('Turma').AsString+' Ano: '+DM.IBTable_Turma.FieldByName('Ano').AsString);

       //-------------------------
      //--- Elimina os vestigios de Avaliacao de Curso

      VS_IdTurma:= IBQuery_AlunoTurma.FieldByName('IdTurma').AsString;
      Funcoes.ExecusaoQuery( 'Delete from FA_Relacao where idcurso = '+IBQuery_AlunoTurma.FieldByName('IdCurso').AsString+
                             ' and idTurma = '+IBQuery_AlunoTurma.FieldByName('IdTurma').AsString+
                             ' and identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39
                            );

      Funcoes.ExecusaoQuery( 'Delete from FA_Resposta where idcurso = '+IBQuery_AlunoTurma.FieldByName('IdCurso').AsString+
                            ' and idTurma = '+IBQuery_AlunoTurma.FieldByName('IdTurma').AsString+
                            ' and identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39
                           );

      Funcoes.ExecusaoQuery( 'Delete from FA_Comentario where idcurso = '+IBQuery_AlunoTurma.FieldByName('IdCurso').AsString+
                             ' and idTurma = '+IBQuery_AlunoTurma.FieldByName('IdTurma').AsString+
                             ' and identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39
                           );

      Funcoes.ExecusaoQuery( 'Delete from FA_UsuarioTurma where idcurso = '+IBQuery_AlunoTurma.FieldByName('IdCurso').AsString+
                             ' and idTurma = '+IBQuery_AlunoTurma.FieldByName('IdTurma').AsString+
                             ' and identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39
                           );

       //-------------------------
      //---Encontra o ultimo aluno e guarda o numero de ordem do aluno excluido

      VI_Final:= Funcoes.MaiorCodigoComRestricao('NUMORDEM','IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString,'AlunoTurma');
      VI_Final:= VI_Final-1;
      VI_NumOrdemAtual:= IBQuery_AlunoTurma.FieldByName('NumOrdem').Asinteger;
      VI_Inicio:= VI_NumOrdemAtual + 1;

      Funcoes.ExecusaoQuery('Delete from AlunoTurma where idcurso = '+IBQuery_AlunoTurma.FieldByName('IdCurso').AsString+
                            ' and idTurma = '+IBQuery_AlunoTurma.FieldByName('IdTurma').AsString+
                            ' and identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39
                           );

       //--- Verifica se o numero da ordem nao eh o ultimo
      //-- Se nao for o ultimo dever� mudar os numero que est�o depois da ordem apagada

      if VI_NumOrdemAtual < VI_Final then
      begin

        //--- Troca o numero de ordem

        for VI_Cont:= VI_Inicio to VI_Final do
        begin
           Funcoes.ExecusaoQuery( 'Update AlunoTurma Set NumOrdem = '+IntToStr(VI_NumOrdemAtual)+' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+VS_IdTurma+' and NumOrdem = '+IntToStr(VI_Cont));

           VI_NumOrdemAtual:= VI_NumOrdemAtual + 1;
        end;
      end;

      Funcoes.AtualizaQuery(IBQuery_AlunoTurma);
      Funcoes.TratarBotoes(IBQuery_AlunoTurma, JvTransparentButton_InserirAl, JvTransparentButton_AlterarAl, JvTransparentButton_ExcluiAl);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao das listas (Querys)
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   ComboBox_TurmaChange(Sender);
   Funcoes.AtualizaQuery(IBQuery_InstrutorTurma);
   Funcoes.TratarBotoes(IBQuery_InstrutorTurma, JvTransparentButton_InserirIT, JvTransparentButton_AlterarIT, JvTransparentButton_ExcluiIT);

   Funcoes.AtualizaQuery(IBQuery_AlunoTurma);
   Funcoes.TratarBotoes(IBQuery_AlunoTurma, JvTransparentButton_InserirAl, JvTransparentButton_AlterarAl, JvTransparentButton_ExcluiAl);
end;


//------------------------------------------------------------------------------
//
// Tratamento do Cadastro de Andamento do Curso
// 18/03/2011
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento quando selecionaa Opcao Andamento
//------------------------------------------------------------------------------

procedure TForm_SelTurma.TabSheet_AndamentoEnter(Sender: TObject);
begin
   if IBTable_AndamentoTurma.RecordCount = 0 then
      IBTable_AndamentoTurma.Append
   else
      IBTable_AndamentoTurma.Edit;

   JvDBRichEdit_Andamento.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento Quando a tecla CTR+g for pressionada
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvDBRichEdit_AndamentoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #7 then
       JvTransparentButton_Gravar_AndamentoClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_Gravar_AndamentoClick(Sender: TObject);
begin
   if ((IBTable_AndamentoTurma.State = DSInsert) or (IBTable_AndamentoTurma.State = DSEdit )) then
   begin
      IBTable_AndamentoTurma.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_Cancela_AndamentoClick(Sender: TObject);
begin
   if ((IBTable_AndamentoTurma.State = DSInsert) or (IBTable_AndamentoTurma.State = DSEdit )) then
   begin
      IBTable_AndamentoTurma.Cancel;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Editor
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao recortar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.RecortarButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Andamento.CutToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.CopiarButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Andamento.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ColarButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Andamento.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Desfazer
//------------------------------------------------------------------------------

procedure TForm_SelTurma.DesfazerButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Andamento.Undo;
  if JvDBRichEdit_Andamento.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento da Fonte
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvFontComboBoxChange(Sender: TObject);
begin
  if FUpdating then
      Exit;
  CurrText.Name:= JvFontComboBox.Items[JvFontComboBox.ItemIndex];
end;

//------------------------------------------------------------------------------
// Tratamento da tamanho Fonte
//------------------------------------------------------------------------------

procedure TForm_SelTurma.FontSizeChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

//------------------------------------------------------------------------------
// Muda para negrito o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.NegritoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if NegritoButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

//------------------------------------------------------------------------------
// Muda para Italico o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ItalicoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicoButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

//------------------------------------------------------------------------------
// Muda para Sublinhado o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.SublinhadoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if SublinhadoButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

//------------------------------------------------------------------------------
// Tratamento do botao Fonte
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_FonteClick(Sender: TObject);
begin
  FontDialog1.Execute;
  JvDBRichEdit_Andamento.SelAttributes.Color := FontDialog1.Font.Color;
  JvDBRichEdit_Andamento.SelAttributes.Name := FontDialog1.Font.Name;
  JvDBRichEdit_Andamento.SelAttributes.Size := FontDialog1.Font.Size;
  JvDBRichEdit_Andamento.SelAttributes.Style := FontDialog1.Font.Style;
end;

//------------------------------------------------------------------------------
// Muda a cor do texto selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_CorClick(Sender: TObject);
begin
   ColorDialog1.Execute ;
   JvDBRichEdit_Andamento.SelAttributes.Color := ColorDialog1.Color;
end;

//------------------------------------------------------------------------------
// Coloca o Traco no texto
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_InseriLinhaClick(Sender: TObject);
begin
   JvDBRichEdit_Andamento.Lines.Add('===============================================================================');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para inserir Hora
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_InserirHoraClick( Sender: TObject);
begin
  JvDBRichEdit_Andamento.Lines.Add(FormatDateTime('hh":"mm "Horas"', Now));
end;

//------------------------------------------------------------------------------
// Tratamento para inserir data
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_InsereCalendarioClick(Sender: TObject);
begin
  JvDBRichEdit_Andamento.Lines.Add(FormatDateTime(LongDateFormat, Now));
end;


//------------------------------------------------------------------------------
// Seta os atributos do Texto
//------------------------------------------------------------------------------

Function TForm_SelTurma.CurrText: TJvTextAttributes;
begin
  if JvDBRichEdit_Andamento.SelLength > 0 then
     Result := JvDBRichEdit_Andamento.SelAttributes
  else
     Result := JvDBRichEdit_Andamento.DefAttributes;
end;

//------------------------------------------------------------------------------
//
// Tratamento de Impressao de Relatorio
// 18/03/2011
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao para trocar o responsavel pela assinatura do Relatorio
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_ResponsavelAsssinaturaClick(Sender: TObject);
begin
   VB_SelecaoResponsavelAssinatura:= True;
   Form_Sel_ResponsavelAssinaturaRelatorio.ShowMOdal;
end;

//------------------------------------------------------------------------------
// Tratamento Quando muda a data de inicio do Relatorio
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvDateEdit_DataInicioChange(Sender: TObject);
begin
   JvDateEdit_DataTermino.Date:= JvDateEdit_DataInicio.Date + 4;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Imprimir Relatorio
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ImprimirClick(Sender: TObject);
var
   VS_DataSaida: String;
begin
   if DM.IBTable_Turma.RecordCount = 0 then
      ShowMessage('O Curso '+trim(ComboBox_Curso.Text)+' N�o possu� Turma Cadastrada...')
   else
   begin
      Funcoes.SetRelDesempenho('Iniciado');
      MontaAluno('Restrito');

      if JvCheckBox_Rel_PautaChamada.Checked = True then   // Pauta de Chamada
      begin
         JvCheckBox_Rel_PautaChamada.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
             ShowMessage('Pauta de Chamada'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Funcoes.ExecutaQuery(IBQuery_AlunoTurma, VS_ComandoAluno +' order by IdAntiguidade, ULTIMAPROMOCAO, nome collate PXW_INTL850');
            Application.CreateForm(TForm_Rel_ControleDePresencaDeAlunos, Form_Rel_ControleDePresencaDeAlunos);
            if CheckBox_VizualizarFormulario.Checked = True then
               Form_Rel_ControleDePresencaDeAlunos.QuickRep1.Preview
            else
               Form_Rel_ControleDePresencaDeAlunos.QuickRep1.Print;
            Funcoes.ExecutaQuery(IBQuery_AlunoTurma, VS_ComandoAluno +OrderByAluno);
         end;
      end;

      if JvCheckBox_ControleRefeicao.Checked = True then   // Controle de Refei��o Aluno
      begin
         JvCheckBox_ControleRefeicao.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
             ShowMessage('Controle de Refei��o'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_ControleDeRefeicoes, Form_Rel_ControleDeRefeicoes);
            if CheckBox_VizualizarFormulario.Checked = True then
               Form_Rel_ControleDeRefeicoes.QuickRep1.PreviewModal
            else
               Form_Rel_ControleDeRefeicoes.QuickRep1.Print
         end;
      end;

      if JvCheckBox_ControleRefeicaoInstrutor.Checked = True then   // Controle de Refei��o Instrutor
      begin
         JvCheckBox_ControleRefeicaoInstrutor.Checked:= False;
         if IBQuery_InstrutorTurma.RecordCount = 0 then
            ShowMessage('Controle de Refei��o'+#13+#13+'A turma selecionada n�o possu� instrutor Cadastrado...')
         else
         begin
            VS_DataSaida:= DateToStr(JvDateEdit_DataTermino.Date)+' 00:00';
            VS_DataSaida:= Funcoes.DePara(VS_DataSaida, '/','.');
            Funcoes.ExecutaQuery(IBQuery_InstrutorTurma_Rel, 'Select IdCurso, IdTurma, CodigoInstrutor, Nome, NomeGuerra, NomeCompleto, PostoGraduacao, Identidade, IdUnidade, IdSubUnidade, Funcao, DataChegada, DataSaida, Apresentacao, Ficha '+
                                                             ' from Instrutor_Turmas_View '+
                                                             ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                                             ' and   IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                                                             ' and DataSaida >  '+#39+VS_DataSaida+#39+
                                                             ' order by nome '
                                );

            if IBQuery_InstrutorTurma_Rel.FieldByName('IdTurma').AsString = '' then
            begin
                ShowMessage('Verifique a data de sa�da do(s) instrutor(es) ou se possu� instrutor cadastrado...');
            end
            else
            begin
               Application.CreateForm(TForm_Rel_ControleDeRefeicoes_Instrutor, Form_Rel_ControleDeRefeicoes_Instrutor);
               if CheckBox_VizualizarFormulario.Checked = True then
                  Form_Rel_ControleDeRefeicoes_Instrutor.QuickRep1.PreviewModal
               else
                  Form_Rel_ControleDeRefeicoes_Instrutor.QuickRep1.Print;
            end;

            IBQuery_InstrutorTurma.Filtered:= False;
         end;
      end;

      //--- Ficha de Viagem

      if JvCheckBox_FichaDeViagem.Checked = True then
      begin
         JvCheckBox_FichaDeViagem.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
            ShowMessage('Ficha de Viagem'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_FichaDeViagem, Form_Rel_FichaDeViagem);
            if CheckBox_VizualizarFormulario.Checked = True then
                Form_Rel_FichaDeViagem.QuickRep1.Preview
            else
                Form_Rel_FichaDeViagem.QuickRep1.Print
         end;
      end;

      //--- Retirada de Faltas

      if JvCheckBox_RetiradaFaltas.Checked = True then
      begin
         JvCheckBox_RetiradaFaltas.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
             ShowMessage('Relat�rio de Faltas'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_RetiradaDeFaltas, Form_Rel_RetiradaDeFaltas);
            if CheckBox_VizualizarFormulario.Checked = True then
               Form_Rel_RetiradaDeFaltas.QuickRep1.Preview
            else
               Form_Rel_RetiradaDeFaltas.QuickRep1.Print
         end;
      end;

      //--- Rela��o de Alunos para Corre��o

      if JvCheckBox_Rel_AlunosParaCorrecao.Checked = True then
      begin
         JvCheckBox_Rel_AlunosParaCorrecao.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
            ShowMessage('Rela��o de Alunos para Corre��o'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_CorrigirDadosERubricar, Form_Rel_CorrigirDadosERubricar);
            if CheckBox_VizualizarFormulario.Checked = True then
               Form_Rel_CorrigirDadosERubricar.QuickRep1.Preview
            else
               Form_Rel_CorrigirDadosERubricar.QuickRep1.Print;
         end;
      end;

      //--- Rela��o de Alunos com Codigo de Acesso

      if JvCheckBox_RelacaoAlunosComCodigo.Checked = True then
      begin
         JvCheckBox_RelacaoAlunosComCodigo.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
            ShowMessage('Rela��o de alunos para impress�o de C�digo de Acesso'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
            Funcoes.ExecutaQuery( Form_Rel_RelacaoComCodigo.IBQuery_AlunoTurma, 'Select NomeCompleto, NomeGuerra, Codigoaluno as Codigo '+
                                                                                ' From Aluno_Turmas_Em_Andamento_View Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                                                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                                );
            Form_Rel_RelacaoComCodigo.QRLabel_Cabec.Caption:= 'Rela��o de Alunos com C�digo de Acesso';
            Form_Rel_RelacaoComCodigo.QuickRep1.Preview
         end;
      end;

      //--- Rela��o de Instrutores com Codigo de Acesso

      if JvCheckBox_RelacaoInstrutoresComCodigo.Checked = True then
      begin
         JvCheckBox_RelacaoInstrutoresComCodigo.Checked:= False;
         if IBQuery_InstrutorTurma.RecordCount = 0 then
            ShowMessage('Rela��o de instrutores para impress�o de C�digo de Acesso'+#13+#13+'A turma selecionada n�o possu� Instrutor Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
            Funcoes.ExecutaQuery( Form_Rel_RelacaoComCodigo.IBQuery_AlunoTurma, 'Select NomeCompleto, NomeGuerra, CodigoInstrutor as Codigo '+
                                                                                ' From Instrutor_Turmas_View Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                                                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                                );
            Form_Rel_RelacaoComCodigo.QRLabel_Cabec.Caption:= 'Rela��o de Instrutor com C�digo de Acesso';
            Form_Rel_RelacaoComCodigo.QuickRep1.Preview
         end;
      end;

      //--- Ficha de Desimpedimento de Alunos

      if JvCheckBox_FichaDesempedimentodeAlunos.Checked = True then
      begin
         JvCheckBox_FichaDesempedimentodeAlunos.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
            ShowMessage('Ficha de Desimpedimento de Alunos'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_FichaDeDesimpedimentoDeAlunosPorTurma, Form_Rel_FichaDeDesimpedimentoDeAlunosPorTurma);
            if CheckBox_VizualizarFormulario.Checked = True then
               Form_Rel_FichaDeDesimpedimentoDeAlunosPorTurma.QuickRep1.Preview
            else
               Form_Rel_FichaDeDesimpedimentoDeAlunosPorTurma.QuickRep1.Print;
         end;
      end;

      if JvCheckBox_FichaDesempedimentodeInstrutores.Checked = True then     // Ficha de Desimpedimento de Instrutor
      begin
         JvCheckBox_FichaDesempedimentodeInstrutores.Checked:= False;
         if IBQuery_InstrutorTurma.RecordCount = 0 then
            ShowMessage('Ficha de Desimpedimento de Instrutor'+#13+#13+'A turma selecionada n�o possu� Instrutor Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma, Form_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma);
            if CheckBox_VizualizarFormulario.Checked = True then
               Form_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma.QuickRep1.Preview
            else
               Form_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma.QuickRep1.Print;
         end;
      end;

      if JvCheckBox_RelacaoEnderecos.Checked = True then     // Relacao de Enderecos Alunos
      begin
         JvCheckBox_RelacaoEnderecos.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
            ShowMessage('Rela��o de Endere�os'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_RelacaoEnderecos, Form_Rel_RelacaoEnderecos);
            if CheckBox_VizualizarFormulario.Checked = True then
               Form_Rel_RelacaoEnderecos.QuickRep1.Preview
            else
               Form_Rel_RelacaoEnderecos.QuickRep1.Print;
         end;
      end;

      //--- Ficha de Registro de Certificados

      if JvCheckBox_FichaRegistroCertificados.Checked = True then   // Registro de Certificados
      begin
         JvCheckBox_FichaRegistroCertificados.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
             ShowMessage('Registro de Certificados'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_FichaDeRegistrosdeCertificados_ICEA, Form_Rel_FichaDeRegistrosdeCertificados_ICEA);
            Form_Rel_FichaDeRegistrosdeCertificados_ICEA.QuickRep1.Prepare;
            NPaginas:= Form_Rel_FichaDeRegistrosdeCertificados_ICEA.QuickRep1.QRPrinter.PageCount;
            if CheckBox_VizualizarAvaliacao.Checked = True then
               Form_Rel_FichaDeRegistrosdeCertificados_ICEA.QuickRep1.Preview
            else
               Form_Rel_FichaDeRegistrosdeCertificados_ICEA.QuickRep1.Print;
         end;
      end;

      //--- Ficha de Registro de Entrega do Codigo do Aluno RCA

      if JvCheckBox_Rel_Recibo_do_Codigo_do_Aluno_RCA.Checked = True then   // Registro de Certificados
      begin
         JvCheckBox_Rel_Recibo_do_Codigo_do_Aluno_RCA.Checked:= False;
         if IBQuery_AlunoTurma.RecordCount = 0 then
             ShowMessage('Formul�ro de Registro de Entrega do C�digo ao Aluno'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_Rel_RCA, Form_Rel_RCA);
            Form_Rel_RCA.QuickRep1.Prepare;
            NPaginas:= Form_Rel_RCA.QuickRep1.QRPrinter.PageCount;
            if CheckBox_VizualizarAvaliacao.Checked = True then
               Form_Rel_RCA.QuickRep1.Preview
            else
               Form_Rel_RCA.QuickRep1.Print;
         end;
      end;

       //----------------
      // Diploma --> Instrutor

      if JvCheckBox_DiplomaAssinaturaDigitalInstrutor.Checked = True then
      begin
               JvCheckBox_DiplomaAssinaturaDigitalInstrutor.Checked:= False;
               if IBQuery_InstrutorTurma.RecordCount = 0 then
                   ShowMessage('Diploma Instrutor'+#13+#13+'A turma selecionada n�o possu� Instrutor Cadastrado...')
               else
               begin
                  Application.CreateForm(TForm_MontaDiploma, Form_MontaDiploma);
                  if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
                     Form_MontaDiploma.Caption:= 'SAE --> Vizualiza��o do Diploma --> Instrutor'
                  else
                     Form_MontaDiploma.Caption:= 'Ensino --> Vizualiza��o do Diploma --> Instrutor';
                  Form_MontaDiploma.ShowModal;
               end;
      end;

             //----------------
            // Diploma --> aluno

            if JvCheckBox_DiplomaAssinaturaDigitalAluno.Checked = True then
            begin
               JvCheckBox_DiplomaAssinaturaDigitalAluno.Checked:= False;
               if IBQuery_AlunoTurma.RecordCount = 0 then
                   ShowMessage('Diploma Aluno'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
               else
               begin
                  Application.CreateForm(TForm_MontaDiploma, Form_MontaDiploma);
                  if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
                     Form_MontaDiploma.Caption:= 'SAE --> Vizualiza��o do Diploma --> Aluno'
                  else
                     Form_MontaDiploma.Caption:= 'Ensino --> Vizualiza��o do Diploma --> Aluno';
                  Form_MontaDiploma.ShowModal;
               end;
            end;

             //----------------
            // Vizualiza��o do Diploma --> Aluno

            if JvCheckBox_DiplomaAssinaturaManualAluno.Checked = True then
            begin
               JvCheckBox_DiplomaAssinaturaManualAluno.Checked:= False;
               if IBQuery_AlunoTurma.RecordCount = 0 then
                   ShowMessage('Diploma Aluno Assinatura Manual'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
               else
               begin
                 Application.CreateForm(TForm_MontaDiploma, Form_MontaDiploma);
                 if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
                    Form_MontaDiploma.Caption:= 'SAE --> Vizualiza��o do Diploma Assinatura Manual --> Aluno'
                 else
                    Form_MontaDiploma.Caption:= 'Ensino --> Vizualiza��o do Diploma Assinatura Manual --> Aluno';
                 Form_MontaDiploma.ShowModal;
               end;
            end;

             //----------------
            // Certid�o Curricular - Amostra - Assinatura Digital

            if JvCheckBox_CertidaoCurricularAsisinaturaDigitalAmostra.Checked = True then   // Ficha de Avaliacao de Certificados
            begin
               Application.CreateForm(TForm_MontaCertidaoCurricular, Form_MontaCertidaoCurricular);
               JvCheckBox_CertidaoCurricularAsisinaturaDigitalAmostra.Checked:= False;
               Form_MontaCertidaoCurricular.Caption:= 'Certid�o Curricular - Amostra - Assinatura Digital';
               Form_MontaCertidaoCurricular.ShowModal;
            end;

             //----------------
            // Certid�o Curricular - Por Turma - Assinatura Digital

            if JvCheckBox_CertidaoCurricularAsisinaturaDigitalPorTurma.Checked = True then
            begin
               JvCheckBox_CertidaoCurricularAsisinaturaDigitalPorTurma.Checked:= False;
               if IBQuery_AlunoTurma.RecordCount = 0 then
                   ShowMessage('Certid�o Curricular'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
               else
               begin
                  if IBQuery_AlunoTurma.RecordCount = 0 then
                       ShowMessage('A turma selecionada n�o possu� aluno Cadastrado...')
                  else
                  begin
                     Application.CreateForm(TForm_MontaCertidaoCurricular, Form_MontaCertidaoCurricular);
                     Form_MontaCertidaoCurricular.Caption:= 'Certid�o Curricular - Por Turma - Assinatura Digital';
                     Form_MontaCertidaoCurricular.ShowModal;
                  end;
               end;
            end;

             //----------------
            // Certid�o Curricular -Amostra -  Assinatura Manual

            if JvCheckBox_CertidaoCurricularAsisinaturaManualAmostra.Checked = True then
            begin
               JvCheckBox_CertidaoCurricularAsisinaturaManualAmostra.Checked:= False;
               Application.CreateForm(TForm_MontaCertidaoCurricular, Form_MontaCertidaoCurricular);
               Form_MontaCertidaoCurricular.Caption:= 'Certid�o Curricular - Amostra - Assinatura Manual';
               Form_MontaCertidaoCurricular.ShowModal;
            end;

             //----------------
            // Certid�o Curricular - Assinatura Manual

            if JvCheckBox_CertidaoCurricularAsisinaturaManualPorTurma.Checked = True then
            begin
               JvCheckBox_CertidaoCurricularAsisinaturaManualPorTurma.Checked:= False;
               if IBQuery_AlunoTurma.RecordCount = 0 then
                   ShowMessage('Certid�o Curricular - Assinatura Manual'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
               else
               begin
                  Application.CreateForm(TForm_MontaCertidaoCurricular, Form_MontaCertidaoCurricular);
                  Form_MontaCertidaoCurricular.Caption:= 'Certid�o Curricular - Por Turma - Assinatura Manual';
                  Form_MontaCertidaoCurricular.ShowModal;
               end;
            end;
      MontaAluno('Todos');
   end;
end;

//------------------------------------------------------------------------------
// Chama a Janela de Tratamento de Gera��o de Certifidao dos Alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.SpeedButton_gerarCertidaoClick(Sender: TObject);
begin
   Form_SelTurma.MontaAluno('Restrito');
   Application.CreateForm(TForm_GerarRegCertificados, Form_GerarRegCertificados);
   Form_GerarRegCertificados.ShowModal;
   Form_SelTurma.MontaAluno('Todos');
end;

//------------------------------------------------------------------------------
// Chama a Janela de Tratamento da Turma Executada
//------------------------------------------------------------------------------

procedure TForm_SelTurma.SpeedButton_ExecutadaClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_IdCurso: String;
begin
   VI_Retorno:= Application.MessageBox('- Ao fechar a Turma as provas e as respostas dos Alunos ser�o apagada... '+#13+#13+
                                       '- Verifique com os outros setores se todos relat�rios e procedimentos j� foram feitos... '+#13+#13+
                                       '  Confirma o Fechamento da turma ?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin

      FechaTurma;

      VS_IdCurso:= DM.IBTable_Turma.FieldByName('IdCurso').AsString;
      DM.IBTable_Turma.Edit;
      DM.IBTable_Turma.FieldByName('Status').AsString:= 'E';
      DM.IBTable_Turma.Post;
      Funcoes.ExecutaTransacao;
      Funcoes.SetCadCurso('MenuPrincipal');
      FormActivate(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Fechamento da Turma  - Elimina as tabelas que n�o interessam mais
//------------------------------------------------------------------------------

procedure TForm_SelTurma.FechaTurma;
begin
   ExcluiArquivos( DM.IBTable_Turma.FieldByName('IdCurso').AsString, DM.IBTable_Turma.FieldByName('IdTurma').AsString);

   //---Monta a lista de itens a serem excluidos verificando se o item possui turma base

   Funcoes.OpenQuery('Select IdCurso, NumItem from Item_prova Where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
      Funcoes.ExecutaQuery(IBQuery_Tmp, 'Select NumItem from Item_Prova Where IdCurso = '+DM.IBQuery_Executa.FieldByName('IdCurso').AsString+' and IdTurma = 0 and NumItem = '+DM.IBQuery_Executa.FieldByName('NumItem').AsString);
      if IBQuery_Tmp .FieldByName('IdCurso').AsString = '' then
         Funcoes.ExecusaoQuery('Delete from Item_Desc where NumItem = '+IBQuery_Tmp.FieldByName('NumItem').AsString);

      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para excluir os arquivos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ExcluiArquivos( VS_IdCurso, VS_IdTurma: String );
begin
   Funcoes.ExecusaoQuery('Delete from Instrutor_Teste  where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from fa_usuarioturma where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from fa_Acessos where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete From Disciplina_Perfil where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete From Abrangencia_Prova where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete From Item_Prova where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from Respostaaluno where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from ItemTeste where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from ItemTesteManual where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete From TesteAbrangencia where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete From GabaritoProva where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from TesteAplicacao where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from PTS_TMP where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
   Funcoes.ExecusaoQuery('Delete from CAD_PTS_EAD where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para chamar a relacao de alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_RelacaoAlunosClick(Sender: TObject);
begin
   if IBQuery_AlunoTurma.RecordCount = 0 then
      ShowMessage(#13+'A Turma selecionada n�o possu� aluno Cadastrado...')
   else
   begin
      Application.CreateForm(TForm_RelacaoTurma, Form_RelacaoTurma);
      Form_RelacaoTurma.ShowModal;
      Form_RelacaoTurma.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para chamar a relacao de instrutores
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_RelacaoInstrutoresClick(Sender: TObject);
begin
   if IBQuery_InstrutorTurma.RecordCount = 0 then
      ShowMessage(#13+'A Turma selecionada n�o possu� instrutor Cadastrado...')
   else
   begin
      Application.CreateForm(TForm_RelacaoInstrutorTurma, Form_RelacaoInstrutorTurma);
      Form_RelacaoInstrutorTurma.ShowModal;
      Form_RelacaoInstrutorTurma.Free;
   end;
end;

//------------------------------------------------------------------------------
// Procedure com a funcao de copiar os alunos de uma turma para outra
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_CopiaRelacaoAlunosClick(Sender: TObject);
begin
   if IBQuery_AlunoTurma.RecordCount = 0 then
      ShowMessage(#13+'A Turma selecionada n�o possu� alunos Cadastrado...')
   else
   begin
      Application.CreateForm(TForm_CopiaTurma, Form_CopiaTurma);
      Funcoes.CabecalhoForm( Form_CopiaTurma, 'Copia dos alunos de uma turma para outra');
      Form_CopiaTurma.showmodal;
      Form_CopiaTurma.Free;
   end;
end;


//------------------------------------------------------------------------------
// Procedure com a funcao chamar a rotina para carregar a turma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvExpressButton_CargaTurmaAlunoClick(Sender: TObject);
begin
   VS_Opcao:= 'Carregar Aluno';
   Application.CreateForm(TForm_CargaAlunos, Form_CargaAlunos);
   Form_CargaAlunos.showmodal;
   Form_CargaAlunos.Free;

   ChamaTodosAluno(Sender);
end;

//------------------------------------------------------------------------------
// Procedure qcom a funcao de cadastrar o Codigo de acesso dos alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvExpressButton_SenhaInstrutorClick(Sender: TObject);
var
   bmLocal : TBookmark;
begin
   if DM.IBTable_Turma.RecordCount = 0 then
      Showmessage('Para copiar o(s) instrutor(es) � precido primeiro cadastrar a Turma...')
   else
   begin
      bmLocal:= IBQuery_InstrutorTurma.GetBookMark;
      IBQuery_InstrutorTurma.First;
      While not IBQuery_InstrutorTurma.eof do
      begin
         Funcoes.CadastrarAcessoFichaAvaliacao( IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString,
                                                IBQuery_InstrutorTurma.FieldByName('IdTurma').AsString,
                                                IBQuery_InstrutorTurma.FieldByName('Identidade').AsString,
                                                IBQuery_InstrutorTurma.FieldByName('CodigoInstrutor').AsString
                                              );
         IBQuery_InstrutorTurma.Next;
      end;
      IBQuery_InstrutorTurma.GotoBookMark(bmLocal);
      IBQuery_InstrutorTurma.FreeBookMark(bmLocal);
   end;
end;

//------------------------------------------------------------------------------
// Procedure qcom a funcao de cadastrar o Codigo de acesso dos alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvExpressButton_SenhaAlunosClick(Sender: TObject);
var
   bmLocal : TBookmark;
begin
   if IBQuery_AlunoTurma.RecordCount = 0 then
      ShowMessage(#13+'A Turma selecionada n�o possu� alunos Cadastrado...')
   else
   begin
      bmLocal:= IBQuery_AlunoTurma.GetBookMark;
      IBQuery_AlunoTurma.First;
      While not IBQuery_AlunoTurma.eof do
      begin
         Funcoes.CadastrarAcessoFichaAvaliacao(  IBQuery_AlunoTurma.FieldByName('IdCurso').AsString,
                                                 IBQuery_AlunoTurma.FieldByName('IdTurma').AsString,
                                                 IBQuery_AlunoTurma.FieldByName('Identidade').AsString,
                                                 IBQuery_AlunoTurma.FieldByName('CodigoAluno').AsString
                                               );
         IBQuery_AlunoTurma.Next;
      end;
      IBQuery_AlunoTurma.GotoBookMark(bmLocal);
      IBQuery_AlunoTurma.FreeBookMark(bmLocal);
   end;
end;

//------------------------------------------------------------------------------
// Botao para mostrar as patentes
//------------------------------------------------------------------------------

procedure TForm_SelTurma.SpeedButton_PatentesClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Divisas, Form_Divisas);
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para imprimir a 2 via dos documentos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_Imprimir2viaClick(Sender: TObject);
begin
   if DM.IBTable_Turma.RecordCount = 0 then
      ShowMessage('O Curso '+trim(ComboBox_Curso.Text)+' N�o possu� Turma Cadastrada...')
   else
   begin
      if JvCheckBox_DiplomaAssinaturaDigitalInstrutor2.Checked = True then     // Ficha de Desimpedimento de Instrutor
      begin
         JvCheckBox_DiplomaAssinaturaDigitalInstrutor.Checked:= False;
         if IBQuery_InstrutorTurma.RecordCount = 0 then
            ShowMessage('Diploma Instrutor'+#13+#13+'A turma selecionada n�o possu� Instrutor Cadastrado...')
         else
         begin
            Application.CreateForm(TForm_MontaDiploma, Form_MontaDiploma);
            if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
               Form_MontaDiploma.Caption:= 'SAE --> Vizualiza��o do Diploma --> Instrutor'
            else
               Form_MontaDiploma.Caption:= 'Ensino --> Vizualiza��o do Diploma --> Instrutor';
            Form_MontaDiploma.ShowModal;
         end;
      end;

      if ((Trim(IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString) <> 'a') and (Trim(IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString) <> '')) then
         ShowMessage('Aluno Desligado, n�o � permitido imprimir Diploma ou Certid�o Curricular de 2� Via...')
      else
      begin
          //----------------
         // Certid�o Curricular - Assinatura Manual

         if IBQuery_AlunoTurma.RecordCount = 0 then
              ShowMessage('Certid�o Curricular - 2� Via'+#13+#13+'A turma selecionada n�o possu� aluno Cadastrado...')
         else
         begin
            //--- Tratamento para imprimir a 2� via da Certidao Curricular

            if JvCheckBox_DiplomaAluno2Via.Checked = True then
            begin
               JvCheckBox_DiplomaAluno2Via.Checked:= False;
               Application.CreateForm(TForm_MontaDiploma, Form_MontaDiploma);
               Form_MontaDiploma.Caption:= 'Diploma 2� Via Aluno';
               Form_MontaDiploma.ShowModal;
            end;

            //--- Tratamento para imprimir a 2� via da Certidao Curricular Ass Digital

            if JvCheckBox_DiplomaAluno2ViaAssDigital.Checked = True then
            begin
               JvCheckBox_DiplomaAluno2Via.Checked:= False;
               Application.CreateForm(TForm_MontaDiploma, Form_MontaDiploma);
               Form_MontaDiploma.Caption:= 'Diploma 2� Via Aluno (Ass Digital)';
               Form_MontaDiploma.ShowModal;
            end;

            //--- Tratamento para imprimir a 2� via da Certidao Curricular

            if JvCheckBox_CertidaoCurricular2ViaAluno.Checked = True then
            begin
               JvCheckBox_CertidaoCurricular2ViaAluno.Checked:= False;
               Application.CreateForm(TForm_MontaCertidaoCurricular, Form_MontaCertidaoCurricular);
               Form_MontaCertidaoCurricular.Caption:= 'Certid�o Curricular - 2� Via';
               Form_MontaCertidaoCurricular.ShowModal;
            end;

            //--- Tratamento para imprimir a 2� via da Certidao Curricular Ass Digital

            if JvCheckBox_CertidaoCurricular2ViaAlunoAssDigital.Checked = True then
            begin
               JvCheckBox_CertidaoCurricular2ViaAlunoAssDigital.Checked:= False;
               Application.CreateForm(TForm_MontaCertidaoCurricular, Form_MontaCertidaoCurricular);
               Form_MontaCertidaoCurricular.Caption:= 'Certid�o Curricular 2� Via (Ass Digital)';
               Form_MontaCertidaoCurricular.ShowModal;
            end;
         end;
         MontaAluno('Todos');
      end;
   end;
end;

procedure TForm_SelTurma.PageControl_CadTurmaEnter(Sender: TObject);
begin
   IBTable_AlunoTurma.Open;
   Edit_Restricao.Text:= IBTable_AlunoTurma.FieldByName('Restricao').AsString;
end;

procedure TForm_SelTurma.PageControl_CadTurmaExit(Sender: TObject);
begin
   IBTable_AlunoTurma.Close;
end;

//------------------------------------------------------------------------------
// Rotina de tratamento do botao para inserir restricao
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvExpressButton_InsereRestricaoClick(Sender: TObject);
begin
   TrataRestricao(Edit_Restricao.Text);
end;

//------------------------------------------------------------------------------
// Rotina de tratamento do botao para retirar a restricao
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvExpressButton_ExcluiRestricaiClick(Sender: TObject);
begin
   TrataRestricao('');
   Edit_Restricao.Text:= '';
end;

//------------------------------------------------------------------------------
// Rotina de tratamento de restri��o para aluno
//------------------------------------------------------------------------------

procedure TForm_SelTurma.TrataRestricao(VS_Restricao: String);
begin
   IBTable_AlunoTurma.Edit;
   IBTable_AlunoTurma.FieldByName('Restricao').AsString:= VS_Restricao;
   IBTable_AlunoTurma.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para imprimir o disploma de todos alunos
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ImprimirEmPDFTodosAlunosClick(Sender: TObject);
var
   bmLocal : TBookmark;
begin
   bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
   Edit_Dip_Nome.Text:= '';
   VS_Opcao_Diploma:= 'Ensino --> Vizualiza��o do Diploma --> Aluno';
   While not IBQuery_AlunoTurma.Eof do
   begin
      ImprimirDiploma_Pdf;
      IBQuery_AlunoTurma.Next;
   end;
   Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);
   Edit_Dip_Nome.Text:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString;
end;


//------------------------------------------------------------------------------
// Tratamento da chamada para gerar arquivo pdf do diploma de todos alunos Baixa qualidade
//------------------------------------------------------------------------------

procedure TForm_SelTurma.AlunoSelecionadoBaixaQualidade1Click(Sender: TObject);
var
   bmLocal : TBookmark;
begin
   Application.CreateForm(TForm_Rel_Diploma, Form_Rel_Diploma);
   if not DirectoryExists('C:\Ensino\DiplomasPDF') then
      ForceDirectories('C:\Ensino\DiplomasPDF');

   bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
   GerarDiploma_Pdf;
   Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);
   Form_Rel_Diploma.Free;
   ShowMessage('Solicita��o finalizada, o arquivo ensontra-se na pasta "C:\Ensino\DiplomasPDF"');
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para gerar arquivo pdf do diploma de todos alunos Baixa qualidade
//------------------------------------------------------------------------------

procedure TForm_SelTurma.odosAlunosBaixaQualidade1Click(Sender: TObject);
var
   bmLocal : TBookmark;
begin
   Application.CreateForm(TForm_Rel_Diploma, Form_Rel_Diploma);
   if not DirectoryExists('C:\Ensino\DiplomasPDF') then
      ForceDirectories('C:\Ensino\DiplomasPDF');

   bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
   Edit_Dip_Nome.Text:= '';
   VS_Opcao_Diploma:= 'Ensino --> Vizualiza��o do Diploma --> Aluno';
   While not IBQuery_AlunoTurma.Eof do
   begin
      GerarDiploma_Pdf;
      IBQuery_AlunoTurma.Next;
   end;
   Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);
   Edit_Dip_Nome.Text:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString;
   Form_Rel_Diploma.Free;
   ShowMessage('Solicita��o finalizada, os arquivos ensontra-se na pasta "C:\Ensino\DiplomasPDF"');
end;


//------------------------------------------------------------------------------
// Rotina para tratamento da impress�o do Diploma em PDF
//------------------------------------------------------------------------------

procedure TForm_SelTurma.GerarDiploma_Pdf;
var
   VS_Pasta, VS_NomeArq: String;
begin
   VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_'+IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString;
   VS_NomeArq:= 'PTS_'+Funcoes.DePara(VS_NomeArq, '/', '_');

   VS_Pasta:= 'C:\Ensino\DiplomasPDF\';

   if not DirectoryExists(VS_Pasta) then
      ForceDirectories(VS_Pasta);

   VS_NomeArq:= VS_Pasta+VS_NomeArq;

   Form_Rel_Diploma.QuickRep1.Prepare;
   ExportQR1.Report := Form_Rel_Diploma.QuickRep1;
   ExportQR1.ExportQRPDF( VS_NomeArq , False);
end;


//------------------------------------------------------------------------------
// Tratamento da chamada para imprimir o disploma do aluno selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.SomentealunoselecionadoClick(Sender: TObject);
begin
   VS_Opcao_Diploma:= 'Ensino --> Vizualiza��o do Diploma --> Aluno';
   ImprimirDiploma_Pdf;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para imprimir o disploma de todos instrutores
//------------------------------------------------------------------------------

procedure TForm_SelTurma.MenuItem_SomenteInstrutorSelecionadoClick( Sender: TObject);
begin
   VS_Opcao_Diploma:= 'Ensino --> Vizualiza��o do Diploma --> Instrutor';
   ImprimirDiploma_Pdf;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para imprimir o disploma do instrutor selecionado
//------------------------------------------------------------------------------

procedure TForm_SelTurma.MenuItem_TodosInstrutoresClick(Sender: TObject);
begin
   VS_Opcao_Diploma:= 'Ensino --> Vizualiza��o do Diploma --> Instrutor';
   While not IBQuery_InstrutorTurma.Eof do
   begin
      ImprimirDiploma_Pdf;
      IBQuery_InstrutorTurma.Next;
   end;
end;


//------------------------------------------------------------------------------
// Rotina para tratamento da impress�o do Diploma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ImprimirDiploma_Pdf;
begin
   Application.CreateForm(TForm_Rel_Diploma, Form_Rel_Diploma);
   Form_Rel_Diploma.QuickRep1.Preview;
   Form_Rel_Diploma.Free;
   VS_Opcao_Diploma:= '';
end;

//------------------------------------------------------------------------------
// Rotina para mudanca de curso
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ComboBox_CursoChange(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text);
end;

//------------------------------------------------------------------------------
// Tratamento do Diploma PDF
//------------------------------------------------------------------------------

procedure TForm_SelTurma.TratarDiploma(VS_Opcao: String);
begin
   Label_Dip_DiplomaPara.Caption:= VS_Opcao;
   Panel_TratarDiploma.Top:= 147;
   Panel_TratarDiploma.Visible:= True;

   //---------------- Tratamento do Nome do Aluno/Instrutor ----------//

   Edit_Dip_Conferido.Text:= Validar.TratarConferido(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString, Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Sexo').AsString);

   TrataNomeDiploma;

   if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
      Edit_Dip_Curso01.Text:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption)+ ' ('+Trim(Form_SelTurma.ComboBox_Curso.Text)+')'
   else
      Edit_Dip_Curso01.Text:= Trim(Form_SelTurma.Label_DescricaoCurso.Caption)+ ' ('+Trim(Form_SelTurma.ComboBox_Curso.Text)+').';

   Edit_Dip_Cidade.Text:= Funcoes.RetornaCidade(DM.IBTable_Turma.FieldByName( 'DataTermino' ).AsString);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para abrir a jenal de tratamento do diploma PDF - Aluno
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_TratarDiplomaAlunoClick(Sender: TObject);
begin
   VS_Opcao_Diploma:= 'Ensino --> Vizualiza��o do Diploma --> Aluno';
   JvTransparentButton_Dip_DiplomaPDF.DropDownMenu:= PopupMenu_PDF_Aluno;
   JvTransparentButton_Dip_DiplomaPDF.PopupMenu:= PopupMenu_PDF_Aluno;
   Edit_Dip_Funcao.Color:= clWhite;
   Edit_Dip_Funcao.Enabled:= True;
   DBNavigator_Dip.DataSource:= DSQ_AlunoTurma;
   TratarDiploma('Aluno');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para abrir a jenal de tratamento do diploma PDF - Intrutor
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_TratarDiplomaIntrutorClick(Sender: TObject);
begin
   VS_Opcao_Diploma:= 'Ensino --> Vizualiza��o do Diploma --> Instrutor';
   JvTransparentButton_Dip_DiplomaPDF.DropDownMenu:= PopupMenu_PDF_Instrutor;
   JvTransparentButton_Dip_DiplomaPDF.PopupMenu:= PopupMenu_PDF_Instrutor;
   Edit_Dip_Funcao.Color:= $00C6D9FF;
   Edit_Dip_Funcao.Enabled:= False;
   DBNavigator_Dip.DataSource:= DSQ_InstrutorTurma;
   TratarDiploma('Instrutor');
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a janela de tratamento do diploma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_Dip_FecharClick(Sender: TObject);
begin
   Edit_Dip_Conferido.Text:= '';
   Edit_Dip_Nome.Text:= '';
   Edit_Dip_Funcao.Text:= '';
   Edit_Dip_Curso01.Text:= '';
   Edit_Dip_Curso02.Text:= '';
   Edit_Dip_Curso03.Text:= '';
   Edit_Dip_Cidade.Text:= '';
   Panel_TratarDiploma.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir o diploma em PDF do Aluno
//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_Dip_DiplomaPDFClick(Sender: TObject);
begin
   ImprimirDiploma_Pdf;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir o diploma em PDF do Intrutor

//------------------------------------------------------------------------------

procedure TForm_SelTurma.JvTransparentButton_Dip_DiplomaInstrutorPDFClick(Sender: TObject);
begin
   ImprimirDiploma_Pdf;
end;

//-------------------------------------------------------------------------------
// Tratamento do Nome, funcao do instrutor e periodo
//-------------------------------------------------------------------------------

procedure TForm_SelTurma.TrataNomeDiploma;
var
   VS_TratarCurso, VS_Termino: String;
   Ano, Mes, Dia : word;
begin
   if VS_Opcao_Diploma <> '' then
   begin
      if VS_Opcao_Diploma = 'Ensino --> Vizualiza��o do Diploma --> Instrutor' then
      begin
         if ((Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'B�SICO') or (Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'B�sico'))then
             VS_TratarCurso:= ' no curso '
         else
             VS_TratarCurso:= ' no curso de ';

         Edit_Dip_Nome.Text:= Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString;
         Edit_Dip_Funcao.Text:= 'por ter participado como '+Trim(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Funcao').AsString)+Validar.TratarPeriodo(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName( 'DataChegada' ).AsString, Form_SelTurma.IBQuery_InstrutorTurma.FieldByName( 'DataSaida' ).AsString)+', '+VS_TratarCurso ;
      end
      else
      begin
         if VS_Opcao_Diploma = 'Ensino --> Vizualiza��o do Diploma --> Aluno' then
         begin
            if ((Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'B�SICO') or (Copy(Trim(Form_MenuPrincipal.Label_NomeCurso.Caption),1,6) = 'B�sico'))then
                VS_TratarCurso:= ' o curso '
            else
                VS_TratarCurso:= ' o curso de ';
            if DM.IBTable_Turma.FieldByName( 'DataTermino' ).AsString = '' then
               VS_Termino:= ''
            else
            begin
               DecodeDate (StrToDate(DM.IBTable_Turma.FieldByName( 'DataTermino' ).AsString), Ano, Mes, Dia);
               VS_Termino:= FormatFloat('00', Dia)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(Mes),1)+' de '+FormatFloat('####', Ano);
            end;

            Edit_Dip_Nome.Text:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString;
            if trim(Edit_Dip_Funcao.Text) = '' then
               Edit_Dip_Funcao.Text:= 'por ter conclu�do com aproveitamento, em '+VS_Termino+', '+VS_TratarCurso ;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do aluno na turma
//------------------------------------------------------------------------------

procedure TForm_SelTurma.IBQuery_AlunoTurmaAfterScroll(DataSet: TDataSet);
begin
   TrataNomeDiploma;
end;


end.

