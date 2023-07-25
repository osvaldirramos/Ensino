//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGE                                            //
//                                                                            //
// PROGRAMA                  : Menu_Principal.PAS                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do menu     //
//                             principal.                                     //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/07/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 13/04/2021                                     //
// AUTOR                     : Osvaldir                                       //
// MOTIVO                    : Inserção da abertura da tabela Versao_SGQ.     //
//----------------------------------------------------------------------------//

unit MenuPrincipal;

interface

uses
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls, Rotinas_Validar,
  Menus, JvEdit, ToolWin, ComCtrls, Grids, DBGrids, JvComponent,
  JvCaptionPanel, jpeg, ExtCtrls, JvShape, Controls, JvLookOut,
  JvGradientCaption, Classes,  JvRadioButton,
  JvCheckBox, JvToolEdit, JvRichEd, JvDBRichEd, JvCombobox, JvColorCombo, ComObj,
  XPMan, JvArrowBtn, Buttons, JvGradient, Turma_Zero,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  ImgList,  ShellApi,JvScrollPanel, JvCtrls, JvSpeedButton, JvToolBar,
  JvGrdCpt, JvLabel, JvBlinkingLabel, JvTransBtn, JvDBCtrl,
  Rotinas, Rotinas_SUE, Rotinas_TrataData, ExportPack, JvDBTreeView;

type
  TForm_MenuPrincipal = class(TForm)
    Query_TurmaAndamento: TIBQuery;
    DSQ_TurmaAndamento: TDataSource;
    Query_TurmaAndamentoIDCURSO: TSmallintField;
    Query_TurmaAndamentoCODCURSO: TIBStringField;
    Query_TurmaAndamentoIDTURMA: TIntegerField;
    Query_TurmaAndamentoTURMA: TIBStringField;
    Query_TurmaAndamentoANO: TIBStringField;
    Query_TurmaAndamentoDATAINICIO: TDateTimeField;
    Query_TurmaAndamentoDATATERMINO: TDateTimeField;
    Query_TurmaAndamentoQDEALUNOS: TSmallintField;
    Query_TurmaAndamentoCODSALA: TIBStringField;
    Query_TurmaAndamentoCOORDENADOR: TIBStringField;
    Panel_Opcoes: TPanel;
    Panel_Principal: TPanel;
    MainMenu1: TMainMenu;
    MenuPrincipal_MenuGerencia: TMenuItem;
    Gerencia_CabecalhosdeDocumentos: TMenuItem;
    Gerencia_MontagemDiploma: TMenuItem;
    LN_02: TMenuItem;
    Gerencia_CadastroDosUsuario: TMenuItem;
    Gerencia_ControleAcesso: TMenuItem;
    MenuPrincipal_Instrutores: TMenuItem;
    LN_04: TMenuItem;
    Instrutor_QuantidadeDeInstrutoresPorCurso: TMenuItem;
    MenuPrincipal_Tabelas: TMenuItem;
    Tabelas_PostoGraduacao: TMenuItem;
    Tabelas_QuadroEspecialidade: TMenuItem;
    Tabelas_Cargos: TMenuItem;
    Tabelas_Unidade: TMenuItem;
    Tabelas_Paises: TMenuItem;
    Tabelas_Desligamento: TMenuItem;
    MenuPrincipal_Ferramentas: TMenuItem;
    Ferramentas_EditorTexto: TMenuItem;
    LN_06: TMenuItem;
    LN_09: TMenuItem;
    Ferramentas_ConfiguracaodoSistema: TMenuItem;
    Ferramentas_AlterarSenha: TMenuItem;
    Windows: TMenuItem;
    Ajuda: TMenuItem;
    Sobre: TMenuItem;
    Servidor: TMenuItem;
    Ferramentas_PTSBase: TMenuItem;
    MenuPrincipal_FichaAvaliacao: TMenuItem;
    Instrutor_ConsultaInstrutorporMateria: TMenuItem;
    Ferramentas_Avalicao: TMenuItem;
    LN_08: TMenuItem;
    MenuFerramenta_QtdItensdeProvaporDisciplina: TMenuItem;
    MenuPrincipal_Consultas: TMenuItem;
    Consultas_ConsultaAlunosInstrutores: TMenuItem;
    Consultas_ConsultaCursosFinalizados: TMenuItem;
    IBQuery_TurmaPlanejada: TIBQuery;
    IBQuery_TurmaPlanejadaIDCURSO: TSmallintField;
    IBQuery_TurmaPlanejadaIDTURMA: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    SmallintField1: TSmallintField;
    IBStringField4: TIBStringField;
    DSQ_TurmaPlanejada: TDataSource;
    IBQuery_TurmasExecutadas: TIBQuery;
    DSQ_TurmasExecutadas: TDataSource;
    IBQuery_TurmasExecutadasCODCURSO: TIBStringField;
    IBQuery_TurmasExecutadasTURMA: TIBStringField;
    IBQuery_TurmasExecutadasANO: TIBStringField;
    IBQuery_TurmasExecutadasDATAINICIO: TDateTimeField;
    IBQuery_TurmasExecutadasDATATERMINO: TDateTimeField;
    IBQuery_TurmasExecutadasQDEALUNOS: TIntegerField;
    IBQuery_TurmasExecutadasCOORDENADOR: TIBStringField;
    IBQuery_TurmasExecutadasIDCURSO: TSmallintField;
    IBQuery_TurmasExecutadasIDTURMA: TIntegerField;
    MenuFerramenta_EstatisticaDeItensDeDisciplinasporObjetivo: TMenuItem;
    IBQuery_FA_Critica: TIBQuery;
    DSQ_FA_Critica: TDataSource;
    IBQuery_FA_CriticaIDCURSO: TSmallintField;
    IBQuery_FA_CriticaIDTURMA: TIntegerField;
    IBQuery_FA_CriticaCODCURSO: TIBStringField;
    IBQuery_FA_CriticaTURMA: TIBStringField;
    IBQuery_FA_CriticaDATAAVALIACAO: TIBStringField;
    IBQuery_FA_CriticaENCAMINHADA: TIBStringField;
    Gerencia_CadastroSalaAula: TMenuItem;
    N2: TMenuItem;
    Consulta_1: TMenuItem;
    StatusBar: TStatusBar;
    Panel_EscolhaCurso: TPanel;
    JvGradientCaption_Curso: TJvGradientCaption;
    JvGradientCaption_MenuPrincipal: TJvGradientCaption;
    Consulta_HistoricoASEAAPAC: TMenuItem;
    N6: TMenuItem;
    EstatisticadeAplicaodeProvas1: TMenuItem;
    Consulta_EstatisticaDiarias: TMenuItem;
    IBQuery_AtivarPlanejadas: TIBQuery;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    IntegerField1: TIntegerField;
    IBStringField8: TIBStringField;
    SmallintField2: TSmallintField;
    IntegerField2: TIntegerField;
    ComboBox_Curso: TComboBox;
    IBQuery_TurmaPlanejadaDATAINICIODIST: TDateTimeField;
    IBQuery_TurmaPlanejadaDATATERMINODIST: TDateTimeField;
    Query_TurmaAndamentoDATAINICIODIST: TDateTimeField;
    Query_TurmaAndamentoDATATERMINODIST: TDateTimeField;
    IBQuery_TurmasExecutadasDATAINICIODIST: TDateTimeField;
    IBQuery_TurmasExecutadasDATATERMINODIST: TDateTimeField;
    Gerencia_CadastroUsuarioProvidencia: TMenuItem;
    Consulta_NumerodeAlunosPorInstituicao: TMenuItem;
    Gerencia_CadastrodasSecoes: TMenuItem;
    JvExpress_EscolhaOpcoes: TJvExpress;
    JvExpressButton_Curso: TJvExpressButton;
    JvExpressButton_CorpoDocente: TJvExpressButton;
    JvExpressButton_Turma: TJvExpressButton;
    JvExpressButton_Disciplina: TJvExpressButton;
    JvExpressButton_QGA: TJvExpressButton;
    JvExpressButton_ItemDeProva: TJvExpressButton;
    JvExpressButton_MontarProva: TJvExpressButton;
    JvExpressButton_CorrecaoProva: TJvExpressButton;
    JvExpressButton_PTS: TJvExpressButton;
    JvExpressButton_HabFichaAvaliacao: TJvExpressButton;
    JvExpressButton_GrauFinalTurma: TJvExpressButton;
    JvExpressButton_ConsultaDeAlunosInstrutor: TJvExpressButton;
    JvExpressButton_CriticaEspontanea__: TJvExpressButton;
    JvExpressButton_RelacaoAlunosAbaixoMedia: TJvExpressButton;
    JvExpressButton_Providencia: TJvExpressButton;
    JvCaptionPanel_TurmaPlanejados: TJvCaptionPanel;
    JvShape_AtualizarPlanejados: TJvShape;
    JvExpressButton_AtualizarCursosPlanejados: TJvExpressButton;
    JvShape8: TJvShape;
    JvShape_TratarTelaPlanejados: TJvShape;
    JvExpressButton_TratarTelaPlanejados: TJvExpressButton;
    DBGrid_TurmaPlanejada: TDBGrid;
    Panel_AlunosPlanejados_: TPanel;
    Panel_AlunosPlanejados: TPanel;
    DBNavigator_CursosPlanejados: TDBNavigator;
    JvCaptionPanel_TurmaAndamento: TJvCaptionPanel;
    JvShape4: TJvShape;
    JvExpressButton_AtualizarCursosAndamento: TJvExpressButton;
    JvShape6: TJvShape;
    JvShape_TratarTelaAndamento: TJvShape;
    JvExpressButton_TratarTelaAndamento: TJvExpressButton;
    DBGrid_Turma: TDBGrid;
    Panel4: TPanel;
    JvShape_EstatisticaCursosAndamento: TJvShape;
    JvExpressButton_EstatisticaCursosAndamento: TJvExpressButton;
    Panel_AlunosAndamento: TPanel;
    DBNavigator_CursosEmAndamento: TDBNavigator;
    JvCaptionPanel_CriticaEspontanea: TJvCaptionPanel;
    JvShape7: TJvShape;
    JvShape_TratarJanelaCiritcaEspontanea: TJvShape;
    JvExpressButton_TrataJanelaCriticaEspontanea: TJvExpressButton;
    DBNavigator_CriticaEspontanea: TDBNavigator;
    DBGrid_CriticasEspontaneas: TDBGrid;
    JvCaptionPanel_Providencia: TJvCaptionPanel;
    JvShape5: TJvShape;
    JvShape9: TJvShape;
    JvExpressButton_TratarTelaProvidencias: TJvExpressButton;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Shape1: TShape;
    Label7: TLabel;
    DBGrid_Providenia: TDBGrid;
    IBQuery_Providencia: TIBQuery;
    IBQuery_ProvidenciaIDCURSO: TSmallintField;
    IBQuery_ProvidenciaIDTURMA: TIntegerField;
    IBQuery_ProvidenciaIDSECAO: TIntegerField;
    IBQuery_ProvidenciaSIGLA: TIBStringField;
    IBQuery_ProvidenciaDESCRICAO: TIBStringField;
    IBQuery_ProvidenciaREC_DATA: TDateTimeField;
    IBQuery_ProvidenciaREC_RESPONSAVEL: TIBStringField;
    IBQuery_ProvidenciaEXEC_DATA: TDateTimeField;
    IBQuery_ProvidenciaEXEC_RESPONSAVEL: TIBStringField;
    DSQ_Providencia: TDataSource;
    IBQuery_ProvidenciaCODCURSO: TIBStringField;
    IBQuery_ProvidenciaTURMA: TIBStringField;
    Shape2: TShape;
    Ferramentas_CargaPAELS: TMenuItem;
    LN_12: TMenuItem;
    JvShape1: TJvShape;
    JvExpressButton_FecharCriticaEspontanea: TJvExpressButton;
    JvShape10: TJvShape;
    JvExpressButton_FecharProvidencia: TJvExpressButton;
    CargaHistorico: TMenuItem;
    ToolBar_PesquisarTurmaAndamento: TToolBar;
    MaskEdit_TurmaTA: TJvEdit;
    JvEdit_CursoTA: TJvEdit;
    ToolBar_TurmaPlanejada: TToolBar;
    JvEdit_CursoTP: TJvEdit;
    MaskEdit_TurmaTP: TJvEdit;
    IBQuery_ProvidenciaRAMAL: TIBStringField;
    IBTable_FichaAvaliacao: TIBTable;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoIDAVALIACAO: TIntegerField;
    IBTable_FichaAvaliacaoIDFICHA: TSmallintField;
    IBTable_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;
    IBQuery_FARelacaoAlunos: TIBQuery;
    IBQuery_FARelacaoAlunosPOSTOGRADUACAO: TIBStringField;
    IBQuery_FARelacaoAlunosNOMEGUERRA: TIBStringField;
    IBQuery_FARelacaoAlunosRESPONDEU: TIBStringField;
    IBQuery_Rel_FA: TIBQuery;
    IBQuery_RelacaoAlunos: TIBQuery;
    FichasAntigas1: TMenuItem;
    Timer1: TTimer;
    N1: TMenuItem;
    PTS_NOVO: TMenuItem;
    PTS_BASE_NOVO1: TMenuItem;
    PTSNOVO1: TMenuItem;
    JvGradient_Tela: TJvGradient;
    JvShape_Objetivo: TJvShape;
    RichEdit_Objetivo: TRichEdit;
    Label_NomeCurso: TLabel;
    Label_CodigoCurso: TLabel;
    DBText1: TDBText;
    JvShape_BrasaoICEA: TJvShape;
    JvShape_Brasao: TJvShape;
    Image_Brasao_ICEA: TImage;
    Label_Versao: TLabel;
    Label_Atualizacao: TLabel;
    JvShape_Usuario: TJvShape;
    Image_Brasao: TImage;
    DBText_NomeUsuario: TDBText;
    DBText_SecaoUsuario: TDBText;
    JvCaptionPanel_TurmaExecutada: TJvCaptionPanel;
    JvShape3: TJvShape;
    JvShape_Atualizar_Executados: TJvShape;
    JvExpressButton_AtualizarCursosExecutados: TJvExpressButton;
    JvShape_TratarTelaExecutados: TJvShape;
    JvExpressButton_TratarTelaExecutados: TJvExpressButton;
    DBNavigator_CursosExecutados: TDBNavigator;
    DBGrid_TurmaExecutada: TDBGrid;
    Panel6: TPanel;
    JvShape_EstatisticaCursosExecutados: TJvShape;
    JvExpressButton_EstatisticaCursosExecutados: TJvExpressButton;
    Label_Ano: TLabel;
    Panel_NAlunosExecutados: TPanel;
    MaskEdit_AnoTurmaEx: TMaskEdit;
    ToolBar1: TToolBar;
    JvEdit_CursoTE: TJvEdit;
    MaskEdit_TurmaTE: TJvEdit;
    Button1: TButton;
    IBQuery_TurmaPlanejadaDIAS: TFloatField;
    Shape3: TShape;
    Label1: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label5: TLabel;
    Query_TurmaAndamentoDIAS: TFloatField;
    Shape6: TShape;
    Label6: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Shape9: TShape;
    Label10: TLabel;
    Shape10: TShape;
    Label11: TLabel;
    Shape11: TShape;
    Label12: TLabel;
    HorriosparaPTS1: TMenuItem;
    N3: TMenuItem;

    Function VerificaCurso: Boolean;
    Function TrataBotoes(Opcao: String; JvExpressButton: TJvExpressButton; VB_Status: Boolean): Boolean;
    Function TrataMenu(Opcao: String; MenuItem: TMenuItem; VB_Status: Boolean): Boolean;

    procedure TratarSelTurmaPlanejada;
    Procedure TrataJanelas(Opcao: String; JvCaptionPanel: TJvCaptionPanel);
    procedure VerificarProvidencia;

    procedure TratarOpcoes(Status: Boolean);
    procedure CriticaEspontanea;
    procedure Hab_FichaAvaliacaoFinalCurso;
    procedure ChamaTurma;
    Function HabilitaTurma(Query_Turma: TIBQuery; PS_Secao: String): Boolean;

    procedure AtivarTurma(PS_IdCurso, PS_IdTurma: String);
    Procedure QueryTurmaAndamento(Sender: TObject);
    Procedure QueryTurmaPlanejada(Sender: TObject);
    Procedure QueryTurmaExecutada(Sender: TObject);

    procedure TrataGrupoCurso(VB_Status: Boolean);
    procedure HabilitaCurso(Sender: TObject);
    procedure SelecionaCurso(VS_CodCurso: String);
    Procedure MontaSelecaoCurso;
    Procedure MontaTurma(PS_IdCurso, PS_IdTurma: String);

    procedure WindowsClick(Sender: TObject);
    procedure Gerencia_CabecalhosdeDocumentosClick(Sender: TObject);
    procedure Gerencia_MontagemDiplomaClick(Sender: TObject);
    procedure Instrutor_QuantidadeDeInstrutoresPorCursoClick(Sender: TObject);
    procedure Ferramentas_EditorTextoClick(Sender: TObject);
    procedure Ferramentas_AlterarSenhaClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure ServidorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid_TurmaDblClick(Sender: TObject);
    procedure DBGrid_TurmaPlanejadaDblClick(Sender: TObject);
    procedure ComboBox_CursoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_TurmaCellClick(Column: TColumn);
    procedure Gerencia_CadastroDosUsuarioClick(Sender: TObject);
    procedure Ferramentas_PTSBaseClick(Sender: TObject);
    procedure Instrutor_ConsultaInstrutorporMateriaClick(Sender: TObject);
    procedure MenuFerramenta_QtdItensdeProvaporDisciplinaClick(Sender: TObject);
    procedure Ferramentas_ConfiguracaodoSistemaClick(Sender: TObject);
    procedure DBGrid_TurmaTitleClick(Column: TColumn);
    procedure DBGrid_TurmaPlanejadaCellClick(Column: TColumn);
    procedure Consultas_ConsultaCursosFinalizadosClick(Sender: TObject);
    procedure Tabelas_PostoGraduacaoClick(Sender: TObject);
    procedure Tabelas_UnidadeClick(Sender: TObject);
    procedure Tabelas_QuadroEspecialidadeClick(Sender: TObject);
    procedure Tabelas_PaisesClick(Sender: TObject);
    procedure DBGrid_TurmaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_TurmaPlanejadaTitleClick(Column: TColumn);
    procedure Tabelas_CargosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Tabelas_DesligamentoClick(Sender: TObject);
    procedure JvExpressButton_EstatisticaCursosAndamentoClick(Sender: TObject);
    procedure DBGrid_TurmaExecutadaTitleClick(Column: TColumn);
    procedure DBGrid_TurmaExecutadaDblClick(Sender: TObject);
    procedure DBGrid_TurmaExecutadaCellClick(Column: TColumn);
    procedure Gerencia_ControleAcessoClick(Sender: TObject);
    procedure MenuFerramenta_EstatisticaDeItensDeDisciplinasporObjetivoClick(Sender: TObject);
    procedure DBGrid_CriticasEspontaneasDblClick(Sender: TObject);
    procedure Gerencia_CadastroSalaAulaClick(Sender: TObject);
    procedure Consulta_HistoricoASEAAPACClick(Sender: TObject);
    procedure EstatisticadeAplicaodeProvas1Click(Sender: TObject);
    procedure Consulta_EstatisticaDiariasClick(Sender: TObject);
    procedure JvExpressButton_CursoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_CorpoDocenteMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_TurmaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_DisciplinaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_ItemDeProvaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_QGAMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_MontarProvaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_CorrecaoProvaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_PTSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_HabFichaAvaliacaoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_GrauFinalTurmaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_ConsultaDeAlunosInstrutorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_CriticaEspontanea__MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_RelacaoAlunosAbaixoMediaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvExpressButton_AtualizarCursosExecutadosClick(Sender: TObject);
    procedure JvExpressButton_AtualizarCursosAndamentoClick( Sender: TObject);
    procedure JvExpressButton_AtualizarCursosPlanejadosClick( Sender: TObject);
    procedure JvExpressButton_TratarTelaExecutadosClick(Sender: TObject);
    procedure Consultas_ConsultaAlunosInstrutoresClick(Sender: TObject);
    procedure JvExpressButton_TratarTelaAndamentoClick(Sender: TObject);
    procedure JvExpressButton_TratarTelaPlanejadosClick(Sender: TObject);
    procedure Consulta_NumerodeAlunosPorInstituicaoClick(Sender: TObject);
    procedure Gerencia_CadastroUsuarioProvidenciaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure JvExpressButton_EstatisticaCursosExecutadosClick(Sender: TObject);
    procedure JvExpressButton_ProvidenciaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Gerencia_CadastrodasSecoesClick(Sender: TObject);
    procedure JvExpressButton_TrataJanelaCriticaEspontaneaClick( Sender: TObject);
    procedure DBGrid_ProvideniaCellClick(Column: TColumn);
    procedure DBGrid_ProvideniaDblClick(Sender: TObject);
    procedure JvExpressButton_TratarTelaProvidenciasClick(Sender: TObject);
    procedure Ferramentas_CargaPAELSClick(Sender: TObject);
    procedure JvExpressButton_FecharCriticaEspontaneaClick(Sender: TObject);
    procedure JvExpressButton_FecharProvidenciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FichasAntigas1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PTS_BASE_NOVO1Click(Sender: TObject);
    procedure PTSNOVO1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid_TurmaPlanejadaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure HorriosparaPTS1Click(Sender: TObject);
  private   { Private declarations }
     VS_ComandoTurmaPln, OrderByTurmaPln, VS_ComandoTurmaExecutada, OrderByTurmaExecutada, VS_ComandoTurmaAndamento, OrderByTurmaAndamento: String;
     VI_AlturaJanela: Integer;

     VS_Where_And, VS_Where_Pln, VS_Where_Exec: String;
  public    { Public declarations }
     VS_IdCurso, VS_IdTurma: String;

  end;

var
  Form_MenuPrincipal: TForm_MenuPrincipal;

implementation

uses Module, Sel_Turma, Cad_Documentacao, Cad_Diploma, Sel_Curso,
  EstatisticaDeInstruoresPorCurso, Editor_Texto, ConsultaAlunoInstrutor,
  ConsultaTurmasExecutadas, Estatistica_Curso, AlterarSenha, Sobre,
  Cad_Usuario, Cad_Usuario_FP, Cad_Secoes, Sel_Disciplina, Sel_QGA,
  Sel_ItemProva, Se_Prova, CorrecaoProva, Cad_PTS, Cad_Fer_PTSBase,
  Con_InstrutoresMateria, Hab_FAC, Mostra_GrauFinal, Configuracao,
  ConsultaCursosAndamento, Cad_PostoGraduacao, Cad_Unidades,
  Cad_QuadroEspcialidade, Cad_Cargos, Cad_Pais, Cad_Desligamento,
  ConsultaValoresCurso, Con_InstrutoresCurso, Utilizacao,
  EstatisticaDeItensDeDisciplinasporObjetivo, EstatisticaAplicacaoProva,
  CriticaEspontanea, Cad_SalaAula, Relacao_NotasProvasAbaixoMedia,
  ConsultaHistorico, Estatistica_Diarias, Providencia, Carga_PAELS,
  Habilita_FichaAvaliacao, Sel_PTS_Base_Novo, Sel_PTS_Novo, SalaMapa, Cad_Horarios;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento na criacao do Form
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.FormCreate(Sender: TObject);
begin
   SetWindowLong(Application.Handle,GWL_EXSTYLE,
   GetWindowLong(Application.Handle, GWL_EXSTYLE)
   or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
end;

//------------------------------------------------------------------------------
// Tratamento da abertura Form Principal
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.FormActivate(Sender: TObject);
var
   VB_Status: Boolean;
   VS_Data, VS_Comando: String;
begin
   JvGradient_Tela.StartColor:= Cor_Tela;
   Panel_Principal.Color:= Cor_Tela;
   JvExpress_EscolhaOpcoes.Color:= Cor_Tela;
   JvGradientCaption_MenuPrincipal.GradientStartColor:= Cor_Tela;
   JvGradientCaption_Curso.GradientStartColor:= Cor_Tela;

   Funcoes.TrimAppMemorySize;
   if Funcoes.GetAbertura = False then
   begin

      StatusBar.SimpleText:= '['+Atualizacao+'] Selecione a opção desejada.';

      //------------------------------------------------------------------------------
     //--- Tratamento para verificar se é o primeiro acesso do usuario

     if Funcoes.GetSenha = '123' then
     begin
        ShowMessage(' '+#13+#13+'Para segurança dos dados pedimos '+#13+'trocar a senha...'+#13+#13);
        Ferramentas_AlterarSenhaClick(Sender);
     end;

      //------------------------------------------------------------------------------
     //--- Tratamento referentes ao ICEA

     if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
     begin
         //------------------------------------------------------------------------------
        //--- Tratamento para transformar turma do PAELs com data vencida para turma encerrada

        Funcoes.ExecusaoQuery( 'Update Turma set Status = '+#39+'E'+#39+
                               ' Where IdCurso = 208 '+
                               ' and DataTermino < '+#39+Funcoes.TratarData(DateToStr(Date))+#39
                             );

        Funcoes.ExecusaoQuery( 'Update Turma set Status = '+#39+'E'+#39+
                               ' Where ano <> '+#39+Funcoes_TrataData.AnoAtual+#39+
                               ' and DataTermino < '+#39+Funcoes.TratarData(DateToStr(Date))+#39
                             );

         //------------------------------------------------------------------------------
        //--- Tratamento da apresentacao do sgq

        DM.IBTable_Versao_SGQ.Open;

        //--- Tratamento da habilitacao da Ficha de Avaliacao de Final de Curso

        Hab_FichaAvaliacaoFinalCurso;

     end;

     //------------------------------------------------------------------------------


     MaskEdit_AnoTurmaEx.Text:= Funcoes_TrataData.AnoAtual;

     DM.IBQuery_Cargo.Open;
     DM.IBTable_Configuracao.Open;
     Funcoes.SetNomeInstituto(DM.IBTable_Configuracao.FieldByName('Nome').AsString);

     Label_Versao.Caption:= 'Versão '+Versao;
     Label_Atualizacao.Caption:= 'Última Atualização: '+Ultima_Atualizacao;
     Funcoes.SetSelTurma('Default-in');
     Funcoes.SetSecao;                                                         // Seta a secao do usuário

     //--- Tratamento para Verificacao da OM usuaria

     Funcoes.CabecalhoForm(Form_MenuPrincipal, ' Menu Principal');

     VB_Status:= False;
     if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
     begin
        if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
        begin
           VB_Status:= True;
           Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
        end;
     end;

     JvShape_Brasao.Visible:= VB_Status;
     Image_Brasao.Visible:= VB_Status;

     Funcoes.SetGravaAndamentoTurma(False);

      //---
     //--- Modulo para transformar a turma de Planejado para Andamento

//     VS_Data:= Funcoes.Depara( copy(Funcoes.DataAtualServidor,1, 10)+' 00:00', '/', '.');
     VS_Data:= copy(Funcoes.DataAtualServidor,1, 10);

     VS_Comando:= ' Select IdCurso, CodCurso, IdTurma, Turma, ano, datainicio, datatermino, datainiciodist, dataterminodist, qdealunos, Coordenador '+
                                                    ' From TURMAS_PLANEJADA_VIEW '+
                                                    ' Where DataInicio = '+#39+Funcoes.TratarData(DateToStr(Date))+#39+
                                                   ' or DataInicio = '+#39+Funcoes.TratarData(DateToStr(Date))+#39+
                                                    ' order by datainicio, codCurso, ano, turma desc ';

     VS_Comando:= ' Select IdCurso, CodCurso, IdTurma, Turma, ano, datainicio, datatermino, datainiciodist, dataterminodist, qdealunos, Coordenador '+
                                                    ' From TURMAS_PLANEJADA_VIEW '+
                                                    ' Where DataInicio = '+#39+Funcoes.TratarData(VS_Data)+#39+
                                                    ' order by datainicio, codCurso, ano, turma desc ';

     Funcoes.ExecutaQuery(IBQuery_AtivarPlanejadas, ' Select IdCurso, CodCurso, IdTurma, Turma, ano, datainicio, datatermino, datainiciodist, dataterminodist, qdealunos, Coordenador '+
                                                    ' From TURMAS_PLANEJADA_VIEW '+
                                                    ' Where DataInicio = '+#39+Funcoes.TratarData(VS_Data)+#39+
                                                    ' order by datainicio, codCurso, ano, turma desc '
                         );


{     Funcoes.ExecutaQuery(IBQuery_AtivarPlanejadas, ' Select IdCurso, CodCurso, IdTurma, Turma, ano, datainicio, datatermino, datainiciodist, dataterminodist, qdealunos, Coordenador '+
                                                    ' From TURMAS_PLANEJADA_VIEW '+
                                                    ' Where DataInicio = '+#39+Funcoes.TratarData(DateToStr(Date))+#39+
                                                    ' or DataInicio = '+#39+Funcoes.TratarData(DateToStr(Date))+#39+
                                                    ' order by datainicio, codCurso, ano, turma desc '
                         );
}
     if IBQuery_AtivarPlanejadas.FieldByName('IdCurso').AsString <> '' then
     begin
        IBQuery_AtivarPlanejadas.First;
        While not IBQuery_AtivarPlanejadas.Eof do
        begin
           if IBQuery_AtivarPlanejadas.FieldByName('DataInicio').AsDateTime <= Date then
           begin
               AtivarTurma(IBQuery_AtivarPlanejadas.FieldByName('IdCurso').AsString, IBQuery_AtivarPlanejadas.FieldByName('IdTurma').AsString);

               //--- Tratamento para ativar a turma e setar a indicacao do instrutor para "N"

               Funcoes.ExecusaoQuery( 'Update Turma set Status = '+#39+'A'+#39+', Indicacao_Instrutor = '+#39+'N'+#39+
                                      ' where IdCurso = '+IBQuery_AtivarPlanejadas.FieldByName('IdCurso').AsString+
                                      ' and IdTurma = '+IBQuery_AtivarPlanejadas.FieldByName('IdTurma').AsString
                                    );
           end;
           IBQuery_AtivarPlanejadas.Next;
        end;
     end;

     Funcoes.TrimAppMemorySize;
     IBQuery_FA_Critica.Open;

      //---
     //--- Tratamento da habilitacao das opcoes do Menu

     Funcoes.SetRespAssinatura(0);
     Funcoes.SetAbertura( True );

     if Funcoes.GetAcesso = 'A' then
     begin
        TrataGrupoCurso(True);
        if StrToInt(Funcoes.TotalRegistros(IBQuery_FA_Critica)) > 0 then
           JvCaptionPanel_CriticaEspontanea.Visible:= True
        else
           JvCaptionPanel_CriticaEspontanea.Visible:= False;

        TratarOpcoes(True);
        JvExpressButton_Providencia.Visible:= False;
     end
     else
     begin
        TratarOpcoes(False);

        //--- Tratamento do Menu Gerencia

        Servidor.Visible:= False;
        Gerencia_CadastroDosUsuario.Visible:= False;
        Gerencia_ControleAcesso.Visible:= False;

        VB_Status:= False;
        VB_Status:= TrataMenu('Gerência - Cabeçalhos de Documentos', Gerencia_CabecalhosdeDocumentos, VB_Status);
        VB_Status:= TrataMenu('Gerência - Montagem Diploma', Gerencia_MontagemDiploma, VB_Status);
        VB_Status:= TrataMenu('Gerência - Cadastro das Seções', Gerencia_CadastrodasSecoes, VB_Status);
        VB_Status:= TrataMenu('Gerência - Cadastro Sala Aula', Gerencia_CadastroSalaAula, VB_Status);

        LN_02.Visible:= Gerencia_MontagemDiploma.Visible;
        MenuPrincipal_MenuGerencia.Visible:= VB_Status;

         //---
        //--- Tratamento do Menu Instrutor

        VB_Status:= False;
        VB_Status:= TrataMenu('Instrutor - Consulta Instrutor por Matéria', Instrutor_ConsultaInstrutorporMateria, VB_Status);
        VB_Status:= TrataMenu('Instrutor - Quantidade de Instrutores por Curso', Instrutor_QuantidadeDeInstrutoresPorCurso, VB_Status);

        LN_04.Visible:= Instrutor_ConsultaInstrutorporMateria.Visible;
        MenuPrincipal_Instrutores.Visible:= VB_Status;

         //---
        //--- Tratamento do Menu Tabelas

        VB_Status:= False;
        VB_Status:= TrataMenu('Tabelas Auxiliares - Posto/Graduação', Tabelas_PostoGraduacao, VB_Status);
        VB_Status:= TrataMenu('Tabelas Auxiliares - Quadro/Especialidade', Tabelas_QuadroEspecialidade, VB_Status);
        VB_Status:= TrataMenu('Tabelas Auxiliares - Responsáveis pela assinatura dos relatórios', Tabelas_Cargos, VB_Status);
        VB_Status:= TrataMenu('Tabelas Auxiliares - Unidades', Tabelas_Unidade, VB_Status);
        VB_Status:= TrataMenu('Tabelas Auxiliares - Paises', Tabelas_Paises, VB_Status);
        VB_Status:= TrataMenu('Tabelas Auxiliares - Desligamento', Tabelas_Desligamento, VB_Status);

        MenuPrincipal_Tabelas.Visible:= VB_Status;

         //---
        //--- Tratamento do Menu Consultas

        VB_Status:= False;
        VB_Status:= TrataMenu('Consultas - Consulta de Alunos e Instrutores', Consultas_ConsultaAlunosInstrutores, VB_Status);
        VB_Status:= TrataMenu('Consultas - Consulta Cursos Finalizados', Consultas_ConsultaCursosFinalizados, VB_Status);

        TrataMenu('Consultas - Historico (ASEA/APAC)', Consulta_HistoricoASEAAPAC, VB_Status);

        VB_Status:= TrataMenu('Consultas - Estatistica Diárias', Consulta_EstatisticaDiarias, VB_Status);

        VB_Status:= TrataMenu('Consultas - Número de Alunos Por Instituição', Consulta_NumerodeAlunosPorInstituicao, VB_Status);

        MenuPrincipal_Consultas.Visible:= VB_Status;

         //---
        //--- Tratamento do Menu Ferramentas

        VB_Status:= False;
        VB_Status:= TrataMenu('Ferramentas - Editor de Texto', Ferramentas_EditorTexto, VB_Status);
        VB_Status:= TrataMenu('Ferramentas - Avaliação', Ferramentas_Avalicao, VB_Status);
        VB_Status:= TrataMenu('Ferramentas - PTS - Base', Ferramentas_PTSBAse, VB_Status);
        VB_Status:= TrataMenu('Ferramentas - Configuração do Sistema', Ferramentas_ConfiguracaodoSistema, VB_Status);
        if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
           VB_Status:= TrataMenu('Ferramentas - Carga PAELS', Ferramentas_CargaPAELS, VB_Status);

        LN_06.Visible:= Ferramentas_EditorTexto.Visible;
        LN_08.Visible:= Ferramentas_PTSBAse.Visible;
        LN_09.Visible:= Ferramentas_ConfiguracaodoSistema.Visible;
        if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
           LN_12.Visible:= Ferramentas_CargaPAELS.Visible;
        MenuPrincipal_Ferramentas.Visible:= VB_Status;

         //---
        //--- Tratamento do Fichas de Avaliacao

         VB_Status:= False;
         if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
            VB_Status:= TrataMenu('Fichas Avaliação - Resultados Avaliação', MenuPrincipal_FichaAvaliacao, VB_Status);

         MenuPrincipal_FichaAvaliacao.Visible:= VB_Status;

          //---
         //--- Tratamento do Botoes Curso

         VB_Status:= False;
         VB_Status:= TrataBotoes('Menu Principal - Cadastro Curso', JvExpressButton_Curso, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Corpo Docente', JvExpressButton_CorpoDocente, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Cadastro Turma/Aluno/Instrutor', JvExpressButton_Turma, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Cadastro Disciplina', JvExpressButton_Disciplina, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Quadro Global de Avaliação', JvExpressButton_QGA, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Cadastro Item Prova', JvExpressButton_ItemDeProva, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Montar Prova', JvExpressButton_MontarProva, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Correção da Prova', JvExpressButton_CorrecaoProva, VB_Status);

         VB_Status:= TrataBotoes('Menu Principal - PTS', JvExpressButton_PTS, VB_Status);

         if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
            VB_Status:= TrataBotoes('Menu Principal - Habilitar Ficha de Avaliação', JvExpressButton_HabFichaAvaliacao, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Grau Final da Turma', JvExpressButton_GrauFinalTurma, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Consulta de Alunos e Instrutores', JvExpressButton_ConsultaDeAlunosInstrutor, VB_Status);
         VB_Status:= TrataBotoes('Menu Principal - Aluno com Notas Abaixo da Média', JvExpressButton_RelacaoAlunosAbaixoMedia, VB_Status);
//         VB_Status:= TrataBotoes('Menu Principal - Consulta Avaliação Pós Curso', JvExpressButton_ConsultaMsgInstruores, VB_Status);

         //--- Tratamento para opcao Providencia

         VerificarProvidencia;

         //--- Tratamento para critica espontanea

//         Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Critica Espontanea');
//         if DM.Query_PerfilAcesso.FieldByName('PossuiAcesso').AsString = 'S' then
//         begin
//            VB_Status:= True;
//            JvExpressButton_CriticaEspontanea.Visible:= True;
//            if IBQuery_FA_Critica.recordcount <= 0 then
//                JvCaptionPanel_CriticaEspontanea.Visible:= True
//            else
//                JvCaptionPanel_CriticaEspontanea.Visible:= False;
//        end
//         else
//            JvExpressButton_CriticaEspontanea.Visible:= False;

         TrataGrupoCurso(VB_Status);

          //---
         //--- Tratamento dos Extras

         TrataJanelas('Extras - Relação de Cursos Planejados', JvCaptionPanel_TurmaPlanejados);
         TrataJanelas('Extras - Relação de Cursos Andamento', JvCaptionPanel_TurmaAndamento);
         TrataJanelas('Extras - Relação de Cursos Executados', JvCaptionPanel_TurmaExecutada);
      end;

      MenuPrincipal_Ferramentas.Visible:= True;
      Windows.Visible:= True;
      Ajuda.Visible:= True;

      if Panel_EscolhaCurso.Visible = True then
         MontaSelecaoCurso;

      if JvCaptionPanel_TurmaPlanejados.Visible = True then
      begin
         OrderByTurmaPln:= ' order by codCurso, ano, turma desc ';
         QueryTurmaPlanejada(Sender);
      end;

      if JvCaptionPanel_TurmaExecutada.Visible = True then
         QueryTurmaExecutada(Sender);

      if JvCaptionPanel_TurmaAndamento.Visible = True then
      begin
         OrderByTurmaAndamento:= ' order by codCurso, ano desc, turma ';
         QueryTurmaAndamento(Sender);
         HabilitaTurma(Query_TurmaAndamento, 'Default-in');
         DBGrid_Turma.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Menu
//------------------------------------------------------------------------------

Procedure TForm_MenuPrincipal.TrataJanelas(Opcao: String; JvCaptionPanel: TJvCaptionPanel);
begin
   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, Opcao);
   if DM.Query_PerfilAcesso.FieldByName('PossuiAcesso').AsString = 'S' then
      JvCaptionPanel.Visible:= True
   else
      JvCaptionPanel.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Menu
//------------------------------------------------------------------------------

Function TForm_MenuPrincipal.TrataMenu(Opcao: String; MenuItem: TMenuItem; VB_Status: Boolean): Boolean;
var
   Status: Boolean;
begin
   Status:= VB_Status;
   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, Opcao);
   if DM.Query_PerfilAcesso.FieldByName('PossuiAcesso').AsString = 'S' then
   begin
      Status:= True;
      MenuItem.Visible:= True;
   end
   else
      MenuItem.Visible:= False;

   TrataMenu:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao
//------------------------------------------------------------------------------

Function TForm_MenuPrincipal.TrataBotoes(Opcao: String; JvExpressButton: TJvExpressButton; VB_Status: Boolean): Boolean;
begin
   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, Opcao);
   if DM.Query_PerfilAcesso.FieldByName('PossuiAcesso').AsString = 'S' then
   begin
      VB_Status:= True;
      JvExpressButton.Visible:= True;
   end
   else
      JvExpressButton.Visible:= False;

   TrataBotoes:= VB_Status;
end;

//------------------------------------------------------------------------------
// Tratamento do Grupo do Curso
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.TrataGrupoCurso(VB_Status: Boolean);
begin
   Panel_EscolhaCurso.Visible:= VB_Status;
   JvGradientCaption_MenuPrincipal.Visible:= VB_Status;
   Label_CodigoCurso.Visible:= VB_Status;
   Label_NomeCurso.Visible:= VB_Status;
   RichEdit_Objetivo.Visible:= VB_Status;
   JvShape_Objetivo.Visible:= VB_Status;
end;

//------------------------------------------------------------------------------
// Tratamento Ativar Turma Planejada
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.AtivarTurma(PS_IdCurso, PS_IdTurma: String);
begin
    //---
   //--- Cadastramento das Disciplinas

   Funcoes.ExecusaoQuery( 'Delete From MateriaCurso where IdCurso = '+PS_IdCurso+' and IdTurma = '+PS_IdTurma );

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select * From MateriaCurso Where IdCurso = '+PS_IdCurso+' and IdTurma = 0');

   DM.IBTable_Materia.Open;
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.eof do
   begin
      Funcoes.Grava_Disciplina( PS_IDCURSO,
                                PS_IDTURMA,
                                DM.IBQuery_Executa.FieldByName('CODMATERIA').AsString,
                                DM.IBQuery_Executa.FieldByName('NOMEMATERIA').AsString,
                                DM.IBQuery_Executa.FieldByName('NUMEROAULASTEORICAS').AsString,
                                DM.IBQuery_Executa.FieldByName('NUMEROAULASPRATICAS').AsString,
                                DM.IBQuery_Executa.FieldByName('FASE').AsString,
                                DM.IBQuery_Executa.FieldByName('PERGUNTACHEFE').AsString,
                                DM.IBQuery_Executa.FieldByName('PERGUNTAALUNO').AsString,
                                DM.IBQuery_Executa.FieldByName('ESPECIALIDADE').AsString,
                                DM.IBQuery_Executa.FieldByName('QTD_OBJETIVOS').AsString,
                                DM.IBQuery_Executa.FieldByName('ATUALIZACAO').AsString,
                                DM.IBQuery_Executa.FieldByName('ANO').AsString
                              );
      DM.IBQuery_Executa.Next;
   end;
   DM.IBTable_Materia.Close;

    //---
   //--- Cadastramento do QGA

   Funcoes.ExecusaoQuery( 'Delete From Avaliacao where IdCurso = '+PS_IdCurso+' and IdTurma = '+PS_IdTurma );

   Funcoes.OpenQuery( 'Select IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, MediaParcial, PesoAplicacao, MediaMinima, CodProva, PesoDisciplina, Media, Observacao, Ordem '+
                      ' From Avaliacao '+
                      ' Where IdCurso = '+PS_IdCurso+
                      ' and IdTurma = 0'
                    );

   DM.IBTable_Avaliacao.Open;
   While not DM.IBQuery_Executa.eof do
   begin
      Funcoes.Grava_Avaliacao( PS_IDCURSO,
                               PS_IDTURMA,
                               DM.IBQuery_Executa.FieldByName('FASEAPLICACAO').AsString,
                               DM.IBQuery_Executa.FieldByName('REFERENCIAAVALIACAO').AsString,
                               DM.IBQuery_Executa.FieldByName('CODMATERIA').AsString,
                               DM.IBQuery_Executa.FieldByName('MEDIAPARCIAL').AsString,
                               DM.IBQuery_Executa.FieldByName('PESOAPLICACAO').AsString,
                               DM.IBQuery_Executa.FieldByName('MEDIAMINIMA').AsString,
                               DM.IBQuery_Executa.FieldByName('CODPROVA').AsString,
                               DM.IBQuery_Executa.FieldByName('PESODISCIPLINA').AsString,
                               DM.IBQuery_Executa.FieldByName('MEDIA').AsString,
                               DM.IBQuery_Executa.FieldByName('OBSERVACAO').AsString,
                               DM.IBQuery_Executa.FieldByName('ORDEM').AsString
                             );
      DM.IBQuery_Executa.Next;
   end;
   DM.IBTable_Avaliacao.Close;

    //---
   //--- Cadastramento da Abrangencia da Prova

   Funcoes.ExecusaoQuery('Delete From Abrangencia_Prova where IdCurso = '+PS_IdCurso+' and IdTurma = '+PS_IdTurma );

   Funcoes.OpenQuery(' Select a.IdCurso, a.IdTurma, a.FaseAplicacao, a.ReferenciaAvaliacao, a.CodMateria, a.Materia '+
                     ' From Abrangencia_Prova a, MateriaCurso m '+
                     ' Where a.IdCurso = m.IdCurso      and   a.IdTurma = m.IdTurma '+
                     ' and   a.IdCurso = '+PS_IdCurso+' and   a.IdTurma = 0 '+
                     ' and   m.IdCurso = '+PS_IdCurso+' and   m.IdTurma = '+PS_IDTURMA
                    );


   DM.IBTable_Abrangencia.Open;
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.eof do
   begin

      Funcoes.Grava_Abrangencia( PS_IDCURSO,
                                 PS_IDTURMA,
                                 DM.IBQuery_Executa.FieldByName('FASEAPLICACAO').AsString,
                                 DM.IBQuery_Executa.FieldByName('REFERENCIAAVALIACAO').AsString,
                                 DM.IBQuery_Executa.FieldByName('CODMATERIA').AsString,
                                 DM.IBQuery_Executa.FieldByName('MATERIA').AsString
                               );
      DM.IBQuery_Executa.Next;
   end;
   DM.IBTable_Abrangencia.Close;

    //---
   //--- Cadastramento dos Itens de Prova

   Funcoes.ExecusaoQuery( 'Delete From Item_Prova where IdCurso = '+PS_IdCurso+' and IdTurma = '+PS_IdTurma );

   Funcoes.OpenQuery('Select IdCurso, IdTurma, NumItem, CodMateria, DISCIPLINA, UNIDADE, SUBUNIDADE, OBJETIVO, QUARENTENA, SERIE, Status  '+
                     ' From Item_Prova '+
                     ' Where IdCurso = '+PS_IdCurso+
                     ' and IdTurma = 0'
                    );

   DM.IBTable_Item_Prova.Open;
   While not DM.IBQuery_Executa.eof do
   begin
     Funcoes.Grava_Item_Prova( PS_IDCURSO,
                               PS_IDTURMA,
                               DM.IBQuery_Executa.FieldByName('NUMITEM').AsString,
                               DM.IBQuery_Executa.FieldByName('CODMATERIA').AsString,
                               DM.IBQuery_Executa.FieldByName('DISCIPLINA').AsString,
                               DM.IBQuery_Executa.FieldByName('UNIDADE').AsString,
                               DM.IBQuery_Executa.FieldByName('SUBUNIDADE').AsString,
                               DM.IBQuery_Executa.FieldByName('OBJETIVO').AsString,
                               DM.IBQuery_Executa.FieldByName('QUARENTENA').AsString,
                               DM.IBQuery_Executa.FieldByName('Serie').AsString,
                               'R'
                             );

      DM.IBQuery_Executa.Next;
   end;
   DM.IBTable_Item_Prova.Close;
end;

//------------------------------------------------------------------------------
// Tratamento para Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:= caFree;
    Application.Terminate;
end;

//------------------------------------------------------------------------------
// Montagem do combo de selecao de cliente
//------------------------------------------------------------------------------

Procedure TForm_MenuPrincipal.MontaSelecaoCurso;
begin
   Funcoes_Sue.AlimentaCurso(ComboBox_Curso);

   if Query_TurmaAndamento.FieldByName('CodCurso').AsString <> '' then
      ComboBox_Curso.Text:= Query_TurmaAndamento.FieldByName('CodCurso').AsString
   else
      if IBQuery_TurmaPlanejada.FieldByName('CodCurso').AsString <> '' then
         ComboBox_Curso.Text:= IBQuery_TurmaPlanejada.FieldByName('CodCurso').AsString;

   SelecionaCurso(ComboBox_Curso.Text);
end;

//------------------------------------------------------------------------------
// Montagem da Turma
//------------------------------------------------------------------------------

Procedure TForm_MenuPrincipal.MontaTurma(PS_IdCurso, PS_IdTurma: String);
var
   VS_Comando: String;
begin
   if PS_IdTurma = '' then
      PS_idTurma:= '-2';

   if PS_IdTurma = '0' Then
      TurmaZero.VerificaTurma_Zero(PS_IdCurso);

   VS_IdCurso:= PS_IdCurso;
   VS_IdTurma:= PS_IdTurma;

   VS_Comando:= 'Select IdCurso, IdTurma, Turma, Ano, DataInicio, DataTermino, DataInicioDist, DataTerminoDist, Local1, Local2, Coordenador, Status, Descricao, CodSala, Modalidade, QtdBrasileiros, QtdEstrangeiros '+
                ' from turma '+
                ' Where IdCurso = '+PS_IdCurso+
                ' and IdTurma = '+PS_IdTurma;

   if PS_IdTurma = '-1' Then
      VS_Comando:= VS_Comando+' and IdTurma <> 0';

   Funcoes.ExecutaQuery(DM.IBQuery_MontaTurma, VS_Comando);
   if DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString <> '' then
      Label_NomeCurso.Caption:= DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString
end;

//------------------------------------------------------------------------------
// Verifica se o Curso selecionado é valido
//------------------------------------------------------------------------------

Function TForm_MenuPrincipal.VerificaCurso: Boolean;
var
   VB_retorno: Boolean;
begin
   VB_retorno:= False;
   if ComboBox_Curso.Text = '' then
      Showmessage('Curso não selecionado...'+#13+#13+' Para cadastrar novo CURSO selecione o Botão "Cadastrar Curso"')
   else
   begin
      if VS_IdCurso = '' then
         Showmessage('O Curso '+ComboBox_Curso.Text+' não esta Cadastrado...'+#13+#13+' Para cadastrar o Curso '+ComboBox_Curso.Text+', selecione o Botão < Cadastrar Curso >')
      else
      begin
         Funcoes.SetCadCurso('MenuPrincipal');
         Funcoes.SetCodCurso(ComboBox_Curso.Text);
         VB_retorno:= True;
      end;
   end;
   VerificaCurso:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Selecao do curso
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.SelecionaCurso(VS_CodCurso: String);
begin
   if Funcoes.MontaCurso(VS_CodCurso) = True then
   begin
      VS_IdCurso:= DM.IBQuery_Executa.FieldByName('IdCurso').AsString;
      Label_CodigoCurso.Caption:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;
      Label_NomeCurso.Caption:= DM.IBQuery_Executa.FieldByNAme('NomeCurso').AsString;

      RichEdit_Objetivo.Text:= DM.IBQuery_Executa.FieldByNAme('Descricao').AsString;
      Funcoes.SetCodCurso(ComboBox_Curso.Text);

//      MontaTurma(VS_IdCurso, '0');
      MontaTurma(VS_IdCurso, VS_IdTurma);
   end
   else
   begin
      VS_IdCurso:= '';
      Label_CodigoCurso.Caption:=  '';
      Label_NomeCurso.Caption:=  '';
      RichEdit_Objetivo.Text:=  '';
      Funcoes.SetCodCurso('');
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para destacar os Cursos Finalizados
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   VCor: TColor;
begin
   VCor:= clBlack;
//   DBGrid_Turma.Canvas.Font.Color:= clBlack;

   if Query_TurmaAndamento.FieldByName('CodCurso').AsString <> 'PAELS' then
   begin
   if ((Query_TurmaAndamento.FieldByName('dias').Asinteger <= 60) and (Query_TurmaAndamento.FieldByName('dias').Asinteger > 30)) then
      DBGrid_Turma.Canvas.Brush.Color:= $00C08080
   else
      if ((Query_TurmaAndamento.FieldByName('dias').Asinteger <= 30) and (Query_TurmaAndamento.FieldByName('dias').Asinteger > 20)) then
         DBGrid_Turma.Canvas.Brush.Color:= $00B5B56A
      else
         if ((Query_TurmaAndamento.FieldByName('dias').Asinteger <= 20) and (Query_TurmaAndamento.FieldByName('dias').Asinteger > 0)) then
            DBGrid_Turma.Canvas.Brush.Color:= $004080FF
         else
         begin
           DBGrid_Turma.Canvas.Brush.Color := $00FAEBDE;
           if (( column.Title.Caption = 'Dias') and (Query_TurmaAndamento.FieldByName('dias').Asinteger <= 0)) then
              VCor:= $00FAEBDE;
         end;
   end
   else
   begin
      if ((column.Title.Caption = 'Dias') and (Query_TurmaAndamento.FieldByName('dias').Asinteger <= 0 ))then
         VCor:= $00E6F8FF;
   end;

   DBGrid_Turma.Canvas.Font.Color:= VCor;


   if gdSelected in State then
   begin
      DBGrid_Turma.Canvas.Brush.Color := $00FF8D1C;
      if ((column.Title.Caption = 'Dias') and (Query_TurmaAndamento.FieldByName('dias').Asinteger <= 0 ))then
         DBGrid_Turma.Canvas.Font.Color:= $00FF8D1C
   end;


   DBGrid_Turma.Canvas.FillRect(Rect);
   DBGrid_Turma.DefaultDrawColumnCell(Rect, DataCol, Column, State);

{
   if (Query_TurmaAndamento.FieldByName('DataTermino').AsDateTime < Date) then
     DBGrid_Turma.Canvas.Font.Color:= clRed
   else
      DBGrid_Turma.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
    DBGrid_Turma.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Turma.Canvas.FillRect(Rect);
   DBGrid_Turma.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  }
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da Query da Turma Em Andamento
// Data     :
//
// Atualizado em: 29/08/2018
// Descricao    : Insercão do filtro para os cursos EAD
//------------------------------------------------------------------------------

Procedure TForm_MenuPrincipal.QueryTurmaAndamento(Sender: TObject);
begin
   VS_Where_And:= '';
   VS_ComandoTurmaAndamento:= ' Select IdCurso, CodCurso, idTurma, Turma, ano, datainicio, datatermino, datainiciodist, dataterminodist, qdealunos, CodSala, Coordenador, datediff(day from current_timestamp to datainicio) Dias '+ 
                              ' From Turmas_View '+
                              ' Where Status = '+#39+'A'+#39;

   if Funcoes.GetSecao = 'EOM' Then
      VS_Where_And:= VS_Where_And+' and COPM = '+#39+'S'+#39
   else
      if Funcoes.GetSecao = 'EAD' Then
         VS_Where_And:= VS_Where_And+' and CURSO_EAD = '+#39+'S'+#39
      else
         if (DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') Then
            VS_Where_And:= VS_Where_And+' and IdCurso = 208';

   if JvEdit_CursoTA.Text <> '' then
      VS_Where_And:= VS_Where_And+' and CodCurso like '+#39+'%'+JvEdit_CursoTA.Text+'%'+#39;

   if MaskEdit_TurmaTA.Text <> '' then
      VS_Where_And:= VS_Where_And+' and Turma like '+#39+'%'+MaskEdit_TurmaTA.Text+'%'+#39;

   Funcoes.ExecutaQuery(Query_TurmaAndamento, VS_ComandoTurmaAndamento+VS_Where_And+OrderByTurmaAndamento);
   JvExpressButton_AtualizarCursosAndamentoClick(Sender);
   HabilitaTurma(Query_TurmaAndamento, 'Default-in');
end;


//------------------------------------------------------------------------------
// Atualiza a query que mostra as turmas em Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_AtualizarCursosAndamentoClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_TurmaAndamento);
   JvCaptionPanel_TurmaAndamento.Caption:= '                                            Em Andamento ('+Funcoes.TotalRegistros(Query_TurmaAndamento)+')';

   Funcoes.OpenQuery(' Select sum(qdealunos) as Qtd From Turmas_View Where Status = '+#39+'A'+#39+VS_Where_And+' and (Participa_Estatistica is null or Participa_Estatistica  <> '+#39+'N'+#39+' )');
   Panel_AlunosAndamento.Caption:= DM.IBQuery_Executa.FieldByName('Qtd').AsString+' alunos';
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da Query das Turmas Planejadas
// Data     :
//
// Atualizado em: 29/08/2018
// Descricao    : Insercão do filtro para os cursos EAD
//------------------------------------------------------------------------------

Procedure TForm_MenuPrincipal.QueryTurmaPlanejada(Sender: TObject);
var
   VS_Filtro: String;
begin
   VS_Where_Pln:= '';
   VS_Filtro:= 'Where ';

   VS_ComandoTurmaPln:= ' Select IdCurso, CodCurso, IdTurma, Turma, ano, datainicio, datatermino, datainiciodist, dataterminodist, qdealunos, Coordenador, datediff(day from current_timestamp to datainicio) Dias '+
                        ' From Turmas_Planejada_View ';

   if Funcoes.GetSecao = 'EOM' Then
   begin
      VS_Where_Pln:= VS_Filtro+VS_Where_Pln+' COPM = '+#39+'S'+#39;
      VS_Filtro:= ' and ';
   end
   else
   begin
      if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EAD') Then
      begin
         VS_Where_Pln:= VS_Filtro+VS_Where_Pln+' CURSO_EAD = '+#39+'S'+#39;
         VS_Filtro:= ' and ';
      end
      else
      begin
         if (DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') Then
         begin
            VS_Where_Pln:= VS_Filtro+VS_Where_Pln+' IdCurso = 208';
            VS_Filtro:= ' and ';
         end;
      end;
   end;

   if JvEdit_CursoTP.Text <> '' then
   begin
      VS_Where_Pln:= VS_Where_Pln+VS_Filtro+' CodCurso like '+#39+'%'+JvEdit_CursoTP.Text+'%'+#39;
      VS_Filtro:= ' and ';
   end;

   if MaskEdit_TurmaTP.Text <> '' then
      VS_Where_Pln:= VS_Where_Pln+VS_Filtro+' Turma like '+#39+'%'+MaskEdit_TurmaTP.Text+'%'+#39;

   Funcoes.ExecutaQuery(IBQuery_TurmaPlanejada, VS_ComandoTurmaPln +VS_Where_Pln+ OrderByTurmaPln);
   JvCaptionPanel_TurmaPlanejados.Caption:= '                                           Planejados ('+Funcoes.TotalRegistros(IBQuery_TurmaPlanejada)+')';

   Funcoes.OpenQuery(' Select sum(qdealunos) as Qtd From Turmas_Planejada_View '+VS_Where_Pln);
   Panel_AlunosPlanejados.Caption:= DM.IBQuery_Executa.FieldByName('Qtd').AsString+' alunos';
   TratarSelTurmaPlanejada;
end;

//------------------------------------------------------------------------------
// Atualiza a query que mostra as turmas Planejadas
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_AtualizarCursosPlanejadosClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_TurmaPlanejada);
   JvCaptionPanel_TurmaPlanejados.Caption:= '                                           Planejados ('+Funcoes.TotalRegistros(IBQuery_TurmaPlanejada)+')';

   Funcoes.OpenQuery(' Select sum(qdealunos) as Qtd From Turmas_Planejada_View '+VS_Where_Pln);
   Panel_AlunosPlanejados.Caption:= DM.IBQuery_Executa.FieldByName('Qtd').AsString+' alunos';
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da Query da Turmas Executadas
// Data     :
//
// Atualizado em: 29/08/2018
// Descricao    : Insercão do filtro para os cursos EAD
//------------------------------------------------------------------------------

Procedure TForm_MenuPrincipal.QueryTurmaExecutada(Sender: TObject);
begin
   VS_Where_Exec:= ' ';

   if MaskEdit_AnoTurmaEx.Text = '' then
   begin
      ShowMessage('O Ano de referencia da relação de turmas executada não pode ser branco...');
      MaskEdit_AnoTurmaEx.SetFocus;
   end
   else
   begin
      VS_ComandoTurmaExecutada:= ' Select IdCurso, CodCurso, IdTurma, Turma, ano, datainicio, datatermino, datainiciodist, dataterminodist, qdealunos, Coordenador '+
                                 ' From Turmas_Executada_View '+
                                 ' Where Ano = '+#39+MaskEdit_AnoTurmaEx.Text+#39;

      if Funcoes.GetSecao = 'EOM' Then
         VS_Where_Exec:= VS_Where_Exec+' and COPM = '+#39+'S'+#39
      else
         if Funcoes.GetSecao = 'EAD' Then
            VS_Where_Exec:= VS_Where_Exec+' and CURSO_EAD = '+#39+'S'+#39
         else
            if (DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') Then
               VS_Where_Exec:= VS_Where_Exec+' and IdCurso = 208';

      if JvEdit_CursoTE.Text <> '' then
         VS_Where_Exec:= VS_Where_Exec+' and  CodCurso like '+#39+'%'+JvEdit_CursoTE.Text+'%'+#39;

      if MaskEdit_TurmaTE.Text <> '' then
         VS_Where_Exec:= VS_Where_Exec+' and  Turma like '+#39+'%'+MaskEdit_TurmaTE.Text+'%'+#39;

      OrderByTurmaExecutada:= ' order by codCurso, ano, turma desc ';

      Funcoes.ExecutaQuery(IBQuery_TurmasExecutadas, VS_ComandoTurmaExecutada+VS_Where_Exec+OrderByTurmaExecutada);
      JvCaptionPanel_TurmaExecutada.Caption:= '                                            Executados ('+Funcoes.TotalRegistros(IBQuery_TurmasExecutadas)+')';

      Funcoes.OpenQuery(' Select sum(qdealunos) as Qtd From Turmas_Executada_View where Ano = '+#39+MaskEdit_AnoTurmaEx.Text+#39+VS_Where_Exec);
      Panel_NAlunosExecutados.Caption:= DM.IBQuery_Executa.FieldByName('Qtd').AsString+' alunos';
   end;
end;


//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Turma Executada
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_AtualizarCursosExecutadosClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_TurmasExecutadas);
   JvCaptionPanel_TurmaExecutada.Caption:= '                                            Executados ('+Funcoes.TotalRegistros(IBQuery_TurmasExecutadas)+')';

   Funcoes.OpenQuery(' Select sum(qdealunos) as Qtd From Turmas_Executada_View where Ano = '+#39+Funcoes_TrataData.AnoAtual+#39+VS_Where_Exec);
   Panel_NAlunosExecutados.Caption:= DM.IBQuery_Executa.FieldByName('Qtd').AsString+' alunos';
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao pelo Cabecalho pela Turma Executada
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaExecutadaTitleClick(Column: TColumn);
begin
   OrderByTurmaExecutada:= ' ';

   if (column.Title.Caption = 'Curso' ) then
          OrderByTurmaExecutada:= ' order by codCurso, ano, turma desc '
   else
     if trim(column.Title.Caption) = 'Turma' then
            OrderByTurmaExecutada:= ' order by Turma desc, Ano'
     else
        if trim(column.Title.Caption) = 'Alunos' then
           OrderByTurmaExecutada:= ' order by QDEAlunos '
        else
           if trim(column.Title.Caption) = 'Término' then
              OrderByTurmaExecutada:= ' order by DataTermino '
           else
             if trim(column.Title.Caption) = 'Ínicio' then
                OrderByTurmaExecutada:= ' order by DataInicio '
             else
                if trim(column.Title.Caption) = 'Término Dist' then
                   OrderByTurmaExecutada:= ' order by DataTerminoDist desc '
                else
                   if trim(column.Title.Caption) = 'Ínicio Dist' then
                      OrderByTurmaExecutada:= ' order by DataInicioDist desc ';

   Funcoes.ExecutaQuery(IBQuery_TurmasExecutadas, VS_ComandoTurmaExecutada + OrderByTurmaExecutada);
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao atraves da Celula
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaExecutadaCellClick( Column: TColumn);
begin
   HabilitaTurma(IBQuery_TurmasExecutadas, 'Executados');
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao pelo Cabecalho pela Turma Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaTitleClick(Column: TColumn);
begin
   OrderByTurmaAndamento:= ' ';

   if (column.Title.Caption = 'Curso' ) then
      OrderByTurmaAndamento:= ' order by CodCurso '
   else
     if trim(column.Title.Caption) = 'Turma' then
        OrderByTurmaAndamento:= ' order by Turma Desc , Ano'
     else
        if trim(column.Title.Caption) = 'Alunos' then
           OrderByTurmaAndamento:= ' order by QDEAlunos '
        else
           if trim(column.Title.Caption) = 'Término' then
              OrderByTurmaAndamento:= ' order by DataTermino '
           else
              if trim(column.Title.Caption) = 'Ínicio' then
                 OrderByTurmaAndamento:= ' order by DataInicio '
              else
                 if trim(column.Title.Caption) = 'Término Dist' then
                    OrderByTurmaAndamento:= ' order by DataTerminoDist desc '
                 else
                    if trim(column.Title.Caption) = 'Ínicio Dist' then
                       OrderByTurmaAndamento:= ' order by DataInicioDist desc ';

   Funcoes.ExecutaQuery(Query_TurmaAndamento, VS_ComandoTurmaAndamento + OrderByTurmaAndamento);
end;


//------------------------------------------------------------------------------
// Tratamento da Selecao pelo Cabecalho pela Turma Planejada
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaPlanejadaTitleClick(Column: TColumn);
begin
   OrderByTurmaPln:= ' ';

   if (column.Title.Caption = 'Curso' ) then
          OrderByTurmaPln:= ' order by CodCurso '
   else
     if trim(column.Title.Caption) = 'Turma' then
            OrderByTurmaPln:= ' order by Turma desc, Ano'
     else
        if trim(column.Title.Caption) = 'Alunos' then
           OrderByTurmaPln:= ' order by QDEAlunos '
        else
           if trim(column.Title.Caption) = 'Término' then
              OrderByTurmaPln:= ' order by DataTermino  '
           else
              if trim(column.Title.Caption) = 'Ínicio' then
                 OrderByTurmaPln:= ' order by DataInicio  '
              else
                 if trim(column.Title.Caption) = 'Término Dist' then
                    OrderByTurmaPln:= ' order by DataTerminoDist desc '
                 else
                    if trim(column.Title.Caption) = 'Ínicio Dist' then
                       OrderByTurmaPln:= ' order by DataInicioDist desc ';

   Funcoes.ExecutaQuery(IBQuery_TurmaPlanejada, VS_ComandoTurmaPln +VS_Where_And+OrderByTurmaPln);
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do Curso atraves de Relacao de Curso em Andamento
//------------------------------------------------------------------------------

Function TForm_MenuPrincipal.HabilitaTurma(Query_Turma: TIBQuery; PS_Secao: String): boolean;
var
   VB_Retorno: Boolean;
begin
   VB_Retorno:= False;
   if Query_Turma.FieldByName('CodCurso').AsString <> '' then
   begin
      VS_IdCurso:= Query_Turma.FieldByName('IdCurso').AsString;
      VS_IdTurma:= Query_Turma.FieldByName('IdTurma').AsString;

      Funcoes.SetSelTurma(PS_Secao);
      ComboBox_Curso.Text:= Query_Turma.FieldByName('CodCurso').AsString;
      SelecionaCurso(ComboBox_Curso.Text);
      MontaTurma(Query_Turma.FieldByName('IdCurso').AsString, Query_Turma.FieldByName('IdTurma').AsString);
      VB_Retorno:= True;
   end;

   HabilitaTurma:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do Curso atraves de Relacao de Curso em Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ChamaTurma;
var
   Sender: TObject;
begin
   if  VerificaCurso = True then
   begin
      Form_SelTurma.ShowModal;
      JvExpressButton_AtualizarCursosAndamentoClick(Sender);
   end;
end;

 //------------------------------------------------------------------------------
// Tratamento da selecao da Turma Em Andamento atraves do Duplo Click

procedure TForm_MenuPrincipal.DBGrid_TurmaDblClick(Sender: TObject);
begin
   if HabilitaTurma(Query_TurmaAndamento, 'Default-in') = True then
      if ((Funcoes.GetSecao = 'EXECUÇÃO') or (Funcoes.GetSecao = 'EOM') or (Funcoes.GetSecao = 'PLANEJAMENTO')) then
         ChamaTurma;
end;

 //------------------------------------------------------------------------------
// Tratamento da selecao da Turma Executada atraves do Duplo Click

procedure TForm_MenuPrincipal.DBGrid_TurmaExecutadaDblClick(Sender: TObject);
begin
   if HabilitaTurma(IBQuery_TurmasExecutadas, 'Executados') = True then
      if ((Funcoes.GetSecao = 'EXECUÇÃO') or (Funcoes.GetSecao = 'PLANEJAMENTO')) then
         ChamaTurma;
end;

 //------------------------------------------------------------------------------
// Tratamento da selecao da Turma Planejada atraves do Duplo Click

procedure TForm_MenuPrincipal.DBGrid_TurmaPlanejadaDblClick(Sender: TObject);
begin
   if HabilitaTurma(IBQuery_TurmaPlanejada, 'Default-in') = True then
      if ((Funcoes.GetSecao = 'ADMINISTRAÇÃO') or (Funcoes.GetSecao  = 'EXECUÇÃO') or
          (Funcoes.GetSecao = 'EOM') or (Funcoes.GetSecao = 'PLANEJAMENTO')) then
         ChamaTurma;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao atraves da Celula
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaCellClick(Column: TColumn);
begin
   HabilitaTurma(Query_TurmaAndamento, 'Default-in');
           // ChamaTurma;

end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para chamada para cadastro de documento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Gerencia_CabecalhosdeDocumentosClick(Sender: TObject);
begin
   Funcoes.SetCadCurso('MenuPrincipal');
   Application.CreateForm(TForm_Cad_Documento, Form_Cad_Documento);
   Form_Cad_Documento.Show;
end;

//------------------------------------------------------------------------------
// Tratamento da cadastro do arquivo de tratamento do Diploma
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Gerencia_MontagemDiplomaClick(Sender: TObject);
begin
   Funcoes.SetCadCurso('MenuPrincipal');
   Application.CreateForm(TForm_Cad_Diploma, Form_Cad_Diploma);
   Form_Cad_Diploma.Show;
end;


//------------------------------------------------------------------------------
// Tratamento do botao de selecao da opcao de tratamento de curso
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_CursoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    Application.CreateForm(TForm_Sel_Curso, Form_Sel_Curso);
    Form_Sel_Curso.ShowModal;
    Form_Sel_Curso.Free;
    Funcoes.TrimAppMemorySize;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de selecao da opcao de tratamento de curso/Turma
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_TurmaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   ChamaTurma;
end;

//------------------------------------------------------------------------------
// Chamada para Form de tratamento da estatistica de cursos
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Instrutor_QuantidadeDeInstrutoresPorCursoClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Funcoes.SetCadCurso ('MenuPrincipal');
      Application.CreateForm(TForm_EstInstruoresPorCurso, Form_EstInstruoresPorCurso);
      Form_EstInstruoresPorCurso.ShowModal;
      Form_EstInstruoresPorCurso.Free;
   end;
end;

//------------------------------------------------------------------------------
// Chamada o Editor de Texto
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Ferramentas_EditorTextoClick(Sender: TObject);
begin
   Form_Editor.Text1.Clear;
   Form_Editor.Show;
end;

//------------------------------------------------------------------------------
// Chamada para Form de tratamento da consulta dos alunos
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_ConsultaDeAlunosInstrutorMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if  VerificaCurso = True then
   begin
      Funcoes.SetCadCurso('MenuPrincipal');
      Application.CreateForm(TForm_ConsultaAluno, Form_ConsultaAluno);
      Form_ConsultaAluno.ShowModal;
      Form_ConsultaAluno.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Chamada do Consulta dos Cursos Finalizados
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Consultas_ConsultaCursosFinalizadosClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Funcoes.SetCadCurso ('MenuPrincipal');
      Application.CreateForm(TForm_ConsultaTurmasExecutadas, Form_ConsultaTurmasExecutadas);
      Form_ConsultaTurmasExecutadas.ShowModal;
      Form_ConsultaTurmasExecutadas.Free
   end;
end;

//------------------------------------------------------------------------------
// Chama Janela de Tratamento da Estatistica de Curso
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.MenuFerramenta_QtdItensdeProvaporDisciplinaClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
       Application.CreateForm(TForm_Estatistica_Curso, Form_Estatistica_Curso);
       Form_Estatistica_Curso.ShowModal;
       Form_Estatistica_Curso.Free;
   end;
end;

//------------------------------------------------------------------------------
// Chamada para Form de tratamento para usuario alterar a senha
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Ferramentas_AlterarSenhaClick(Sender: TObject);
begin
   Application.CreateForm(TForm_AlterarSenha, Form_AlterarSenha);
   Form_AlterarSenha.ShowModal;
   Form_AlterarSenha.Free;
end;

//------------------------------------------------------------------------------
// Chamada para mostrar as informacoes do sistema
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.SobreClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Sobre, Form_Sobre);
   Form_Sobre.ShowModal;
end;

//------------------------------------------------------------------------------
// Chamada para mostrar o endereco do servidor
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ServidorClick(Sender: TObject);
begin
   ShowMessage(DM.IBDatabase_Ensino.DatabaseName);
end;

procedure TForm_MenuPrincipal.HabilitaCurso(Sender: TObject);
begin
   SelecionaCurso(ComboBox_Curso.Text);
end;

procedure TForm_MenuPrincipal.ComboBox_CursoKeyPress(Sender: TObject;var Key: Char);
begin
   If Key = #13 then
      QueryTurmaExecutada(Sender);

   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro do Usuario
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Gerencia_CadastroDosUsuarioClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cad_Usuario, Form_Cad_Usuario);
   Form_Cad_Usuario.ShowModal;
   Form_Cad_Usuario.Free;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro do Usuario de Providencia
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Gerencia_CadastroUsuarioProvidenciaClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cad_Usuario_FP, Form_Cad_Usuario_FP);
   Form_Cad_Usuario_FP.ShowModal;
   Form_Cad_Usuario_FP.Free;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro das Secoes
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Gerencia_CadastrodasSecoesClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cad_Secoes, Form_Cad_Secoes);
   Form_Cad_Secoes.ShowModal;
   Form_Cad_Secoes.Free;
end;

procedure TForm_MenuPrincipal.JvExpressButton_DisciplinaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
   if  VerificaCurso = True then
   begin
      Application.CreateForm(TForm_Sel_Disciplina, Form_Sel_Disciplina);
      Form_Sel_Disciplina.ShowModal;
      Form_Sel_Disciplina.Free; //libera o form da memória
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao do Cadastro do QGA
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_QGAMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if  VerificaCurso = True then
   begin
      Application.CreateForm(TForm_Sel_QGA, Form_Sel_QGA);
      Form_Sel_QGA.ShowModal;
      Form_Sel_QGA.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao do Cadastro de Itens de Prova
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_ItemDeProvaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if  VerificaCurso = True then
      Form_Sel_ItemProva.ShowModal;
   Funcoes.TrimAppMemorySize;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao do Cadastro para Montar Prova
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_MontarProvaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if  VerificaCurso = True then
      if Funcoes.VerificaTurma('Não sendo possível montar Prova') = True then
      begin
         Application.CreateForm(TForm_Cad_Prova, Form_Cad_Prova);
         Form_Cad_Prova.ShowModal;
         Form_Cad_Prova.Free;
      end;
end;

//------------------------------------------------------------------------------
// Tratamento da modulo de Correcao da Prova
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_CorrecaoProvaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if  VerificaCurso = True then
      if Funcoes.VerificaTurma('Não foi possível corrigir Prova') = True then
         Form_Cad_CorrecaoProva.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento da modulo de Cadastro do PTS
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_PTSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   VS_Comando: String;
begin
   if  VerificaCurso = True then
   begin
      VS_Comando:= 'Select count(1) as qtd From pts_principal p, pts_semana s Where p.idpts = s.idpts and p.IdCurso = '+Funcoes.GetIdCurso+' and p.idturma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      Funcoes.OpenQuery( VS_Comando);
      if  DM.IBQuery_Executa.FieldByName('qtd').AsInteger = 0 then
      begin
         Funcoes.OpenQuery( 'Select codcurso From TURMAS_Todas_VIEW where IdCurso = '+Funcoes.GetIdCurso+' and status <> '+#39+'E'+#39);

         if  DM.IBQuery_Executa.FieldByName('codcurso').AsString = '' then
            ShowMessage('O Curso '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' não possuí Turma planejada e nem em Andamento... ')
         else
            Form_Cad_PTS.Show;
      end
      else
      begin
         if  VerificaCurso = True then
         begin
            Application.CreateForm(TForm_Sel_PTS_Novo, Form_Sel_PTS_Novo);
            Form_Sel_PTS_Novo.ShowModal;
            Form_Sel_PTS_Novo.Free;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da abertura da Form de tratamento do PTS - Base
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Ferramentas_PTSBaseClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Application.CreateForm(TForm_Cad_PTSBase, Form_Cad_PTSBase);
      Form_Cad_PTSBase.ShowModal;
      Form_Cad_PTSBase.Free;
   end;
end;


procedure TForm_MenuPrincipal.Instrutor_ConsultaInstrutorporMateriaClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Funcoes.SetCadCurso ('MenuPrincipal');
      Application.CreateForm(TForm_Con_InstrutoresMateria, Form_Con_InstrutoresMateria);
      Form_Con_InstrutoresMateria.ShowModal;
      Form_Con_InstrutoresMateria.Free;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da da Habilitacao da Fichas de Avaliacao de Curso
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_HabFichaAvaliacaoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//   if ((VerificaCurso = True) and (Funcoes.VerificaTurma('Não foi possível Habilitar Ficha de Avaliação de Curso ') = True)) then
//       Form_Hab_FichaAvaliacao.ShowModal;



      Funcoes.SetCadCurso ('MenuPrincipal');
      Form_Hab_FAC.Show;
end;

//------------------------------------------------------------------------------
// Motra o Grau final por turma
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_GrauFinalTurmaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if VerificaCurso = True then
   begin
      if Funcoes.VerificaTurma('Não foi possível mostrar o Grau Final da Turma') = True then
      begin
         Application.CreateForm(TForm_Mostra_GrauFinal, Form_Mostra_GrauFinal);{Carrega form na memória}
         Form_Mostra_GrauFinal.ShowModal;
         Form_Mostra_GrauFinal.Free;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Chama a Form de Tratamento das Informacoes da OM
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Ferramentas_ConfiguracaodoSistemaClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Configuracao, Form_Configuracao);
   Form_Configuracao.ShowModal;
   Form_Configuracao.Free;
end;

//------------------------------------------------------------------------------
// Tratamento para colocar a selecao da turma planejada como selcionana
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaPlanejadaCellClick(Column: TColumn);
begin
   TratarSelTurmaPlanejada;
end;

procedure TForm_MenuPrincipal.TratarSelTurmaPlanejada;
begin
   if ComboBox_Curso.Text = '' then
   begin
      ComboBox_Curso.Text:= IBQuery_TurmaPlanejada.FieldByName('CodCurso').AsString;
      SelecionaCurso(ComboBox_Curso.Text);
   end;

   if  VerificaCurso = True then
      HabilitaTurma(IBQuery_TurmaPlanejada, 'Planejados');
end;

//------------------------------------------------------------------------------
// Chama a janela de tratamento da estatistica dos Cursos em Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_EstatisticaCursosAndamentoClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Funcoes.SetCadCurso('MenuPrincipal');
      Application.CreateForm(TForm_ConsultaCursosAndamento, Form_ConsultaCursosAndamento);
      Funcoes.CabecalhoForm(Form_ConsultaCursosAndamento, 'Sistema de Gerenciamento do Ensino --> Estatística dos Cursos Em Andamento');
      Form_ConsultaCursosAndamento.ShowModal;
      Form_ConsultaCursosAndamento.Free;
   end;
end;

//------------------------------------------------------------------------------
// Chama a janela de tratamento da estatistica dos Cursos Executados
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_EstatisticaCursosExecutadosClick(Sender: TObject);
begin
   Funcoes.SetCadCurso('MenuPrincipal');
   Application.CreateForm(TForm_ConsultaCursosAndamento, Form_ConsultaCursosAndamento);
   Funcoes.CabecalhoForm(Form_ConsultaCursosAndamento, 'Estatística dos Cursos Executados');
   Form_ConsultaCursosAndamento.ShowModal;
   Form_ConsultaCursosAndamento.Free;
end;

//------------------------------------------------------------------------------
//
// Tratamento das Tabelas Auxiliares
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Cadastro dos Postos e Graduacoes
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Tabelas_PostoGraduacaoClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Tab_PostoGraduacao, Form_Tab_PostoGraduacao);
   Form_Tab_PostoGraduacao.ShowModal;
   Form_Tab_PostoGraduacao.Free;
end;

//------------------------------------------------------------------------------
// Cadastros das Unidades
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Tabelas_UnidadeClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Tab_Unidades, Form_Tab_Unidades);
   Form_Tab_Unidades.ShowModal;
   Form_Tab_Unidades.Free;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro dos Quadros e Especialidades
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Tabelas_QuadroEspecialidadeClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Tab_QuadroEspecialidade, Form_Tab_QuadroEspecialidade);
   Form_Tab_QuadroEspecialidade.ShowModal;
   Form_Tab_QuadroEspecialidade.Free;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro dos Responsaveis pela assinatura (Cargos)
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Tabelas_CargosClick(Sender: TObject);
begin
   Funcoes.SetRetornaCargo(False);
   Application.CreateForm(TForm_Tab_Cargos, Form_Tab_Cargos);
   Form_Tab_Cargos.ShowModal;
   Form_Tab_Cargos.Free;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro dos Paises
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Tabelas_PaisesClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Tab_Paises, Form_Tab_Paises);
   Form_Tab_Paises.ShowModal;
   Form_Tab_Paises.Free;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro da Tabela de Desligamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Tabelas_DesligamentoClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Tab_Desligamento, Form_Tab_Desligamento);
   Form_Tab_Desligamento.ShowModal;
   Form_Tab_Desligamento.Free;
end;

//------------------------------------------------------------------------------
// Tratamento da Consulta que mostra o numero de Alunos Por Instituicao
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Consulta_NumerodeAlunosPorInstituicaoClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Funcoes.SetCadCurso('MenuPrincipal');
      Application.CreateForm(TForm_AlunosPorInstituicao, Form_AlunosPorInstituicao);{Carrega form na memória}
      Form_AlunosPorInstituicao.ShowModal;
     Form_AlunosPorInstituicao.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Consulta do Corpo docente
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_CorpoDocenteMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if VerificaCurso = True then
   begin
       Application.CreateForm(TForm_Con_InstrutoresCurso, Form_Con_InstrutoresCurso);
       Form_Con_InstrutoresCurso.ShowModal;
       Form_Con_InstrutoresCurso.Free;
   end;
end;

procedure TForm_MenuPrincipal.Gerencia_ControleAcessoClick(Sender: TObject);
begin
   Application.CreateForm(TForm_ControleAcesso, Form_ControleAcesso);
   Form_ControleAcesso.ShowModal;
   Form_ControleAcesso.Free;
end;

//------------------------------------------------------------------------------
// Tratamento da Estatistica de Itens de Disciplinas por objetivo
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.MenuFerramenta_EstatisticaDeItensDeDisciplinasporObjetivoClick(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Application.CreateForm(TForm_EstatisticaDeItensDeDisciplinasporObjetivo, Form_EstatisticaDeItensDeDisciplinasporObjetivo);
      Form_EstatisticaDeItensDeDisciplinasporObjetivo.ShowMOdal;
      Form_EstatisticaDeItensDeDisciplinasporObjetivo.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Estatistica de Provas Aplicacadas
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.EstatisticadeAplicaodeProvas1Click(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Application.CreateForm(TForm_EstatisticaAplicacaoProva, Form_EstatisticaAplicacaoProva);
      Form_EstatisticaAplicacaoProva.ShowMOdal;
      Form_EstatisticaAplicacaoProva.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para mostra a relaçao de criticas erspontaneas
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_CriticaEspontanea__MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   CriticaEspontanea;
end;

procedure TForm_MenuPrincipal.CriticaEspontanea;
begin
   Funcoes.SetCadCurso('MenuPrincipal');
   Application.CreateForm(TForm_CriticaEspontanea, Form_CriticaEspontanea);
   Form_CriticaEspontanea.ShowModal;
   Form_CriticaEspontanea.Free;
end;

//------------------------------------------------------------------------------
// Tratamento de Duplo Click na Critica Espontanea
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_CriticasEspontaneasDblClick( Sender: TObject);
var
   bmLocal : TBookmark;
begin
   if IBQuery_FA_Critica.FieldByName('CodCurso').AsString <> '' then
   begin
      bmLocal:= IBQuery_FA_Critica.GetBookMark;
      ComboBox_Curso.Text:= IBQuery_FA_Critica.FieldByName('CodCurso').AsString;
      SelecionaCurso(ComboBox_Curso.Text);
      MontaTurma(DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString);

      CriticaEspontanea;
      IBQuery_FA_Critica.GotoBookMark(bmLocal);
      IBQuery_FA_Critica.FreeBookMark(bmLocal);
   end;
end;

//------------------------------------------------------------------------------
//
//  Tratamento para Habilitar a Ficha de Avaliação de Final de Curso Automatica
//
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Hab_FichaAvaliacaoFinalCurso;
var
   VS_IdAvaliacao, VS_Data_Saida1, VS_Comando, VS_IdFicha: String;
begin
   VS_IdFicha:= '12';

   vs_comando:= 'Select count(1) as Qtd From FAC_FichaAvaliacao ';
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, vs_comando );

   if DM.IBQuery_Executa.FieldByName('Qtd').Asinteger > 0 then
   begin
       VS_Comando:= 'Select IdCurso, idTurma, qdealunos '+
                    ' From Turmas_View '+
                    ' Where DataTermino -1 = '+#39+Funcoes.TratarData(DateToStr(Date-1))+#39+
                    ' and PAET = '+#39+'S'+#39;
//                    ' and QDEALUNOS > 0 ';
      Funcoes.ExecutaQuery(IBQuery_Rel_FA, VS_Comando );

      IBTable_FichaAvaliacao.Open;
      IBQuery_RelacaoAlunos.Open;

      IBQuery_Rel_FA.First;
      While not IBQuery_Rel_FA.Eof do
      begin
         //--- Verificar se a Ficha foi Cadastrada

         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) As Qtd '+
                                                  ' From FAC_Avaliacao F1 '+
                                                  ' where F1.IdCurso = '+IBQuery_Rel_FA.FieldByName('IdCurso').AsString+
                                                  ' and   F1.IdTurma = '+IBQuery_Rel_FA.FieldByName('IdTurma').AsString+
                                                  ' and   F1.idFicha = '+VS_IdFicha
                           );
         if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then
         begin
            VS_Data_Saida1:= DateToStr(Date-1);

            //--- Cadastro Avaliacao

            VS_IdAvaliacao:= Validar.RetornaUltimoIDAvaliacao;
            IBTable_FichaAvaliacao.Open;
            IBTable_FichaAvaliacao.Append;
            IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString:= IBQuery_Rel_FA.FieldByName('IdCurso').AsString;
            IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString:= IBQuery_Rel_FA.FieldByName('IdTurma').AsString;
            IBTable_FichaAvaliacao.FieldByName('DataAvaliacao').AsString:= VS_Data_Saida1;
            IBTable_FichaAvaliacao.FieldByName('IdAvaliacao').AsString:= VS_IdAvaliacao;
            IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString:= VS_IdFicha;
            IBTable_FichaAvaliacao.Post;
            Funcoes.ExecutaTransacao;

            //--- Configura o Avaliador

            Validar.RelacaoAlunos( IBQuery_Rel_FA.FieldByName('IdCurso').AsString,IBQuery_Rel_FA.FieldByName('IdTurma').AsString, IBQuery_RelacaoAlunos);
            Validar.CadastroAvaliador_Aluno(VS_IdAvaliacao, StrToInt(VS_IdFicha), IBQuery_RelacaoAlunos);
         end;
         IBQuery_Rel_FA.Next;
      end;
      IBTable_FichaAvaliacao.Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do cadastro da sala de aula
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Gerencia_CadastroSalaAulaClick(Sender: TObject);
begin
   Application.CreateForm(TForm_CadSalaAula, Form_CadSalaAula);
   Form_CadSalaAula.ShowModal;
   Form_CadSalaAula.Free;
end;

//------------------------------------------------------------------------------
// Tratamento para chamada da relação dos alunos com nota abaixo da media
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_RelacaoAlunosAbaixoMediaMouseDown(  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Funcoes.SetCadCurso('MenuPrincipal');
   Application.CreateForm(TForm_RelacaoAlunosNotaBaixo, Form_RelacaoAlunosNotaBaixo);
   Form_RelacaoAlunosNotaBaixo.ShowModal;
   Form_RelacaoAlunosNotaBaixo.Free;
end;


procedure TForm_MenuPrincipal.Consulta_HistoricoASEAAPACClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Historico, Form_Historico);
   Form_Historico.ShowModal;
   Form_Historico.Free;
end;

procedure TForm_MenuPrincipal.Consulta_EstatisticaDiariasClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Estatistica_Diarias, Form_Estatistica_Diarias);
   Form_Estatistica_Diarias.ShowModal;
   Form_Estatistica_Diarias.Free;
end;


procedure TForm_MenuPrincipal.JvExpressButton_TratarTelaExecutadosClick(Sender: TObject);
begin
   if JvExpressButton_TratarTelaExecutados.Hint = 'Aumentar a Janela'  then
   begin
      JvExpressButton_TratarTelaExecutados.ImageIndex:= 19;

      JvExpressButton_TratarTelaExecutados.Hint:= 'Diminuir a Janela';
      JvExpressButton_TratarTelaExecutados.Left:= 757;
      JvShape_TratarTelaExecutados.Left:= 756;

      JvCaptionPanel_TurmaExecutada.Left:= 520;
      JvCaptionPanel_TurmaExecutada.Width:= 825;
      JvCaptionPanel_TurmaExecutada.Height:= 613;
   end
   else
   begin
      JvExpressButton_TratarTelaExecutados.ImageIndex:= 18;

      JvExpressButton_TratarTelaExecutados.Hint:= 'Aumentar a Janela';
      JvExpressButton_TratarTelaExecutados.Left:= 327;
      JvShape_TratarTelaExecutados.Left:= 325;

      JvCaptionPanel_TurmaExecutada.Left:= 952;
      JvCaptionPanel_TurmaExecutada.Width:= 393;
      JvCaptionPanel_TurmaExecutada.Height:= 185;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da tela da turma em Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_TratarTelaAndamentoClick(Sender: TObject);
begin
   if JvExpressButton_TratarTelaAndamento.Hint = 'Aumentar a Janela'  then
   begin
      JvExpressButton_TratarTelaAndamento.ImageIndex:= 19;

      JvExpressButton_TratarTelaAndamento.Hint:= 'Diminuir a Janela';
      JvExpressButton_TratarTelaAndamento.Left:= 826;
      JvShape_TratarTelaAndamento.Left:= 824;

      JvCaptionPanel_TurmaAndamento.Left:= 448;
      JvCaptionPanel_TurmaAndamento.Width:= 897;
      JvCaptionPanel_TurmaAndamento.Height:= VI_AlturaJanela;
   end
   else
   begin
      JvExpressButton_TratarTelaAndamento.ImageIndex:= 18;

      JvExpressButton_TratarTelaAndamento.Hint:= 'Aumentar a Janela';
      JvExpressButton_TratarTelaAndamento.Left:= 511;
      JvShape_TratarTelaAndamento.Left:= 509;

      JvCaptionPanel_TurmaAndamento.Left:= 764;
      JvCaptionPanel_TurmaAndamento.Width:= 581;
      JvCaptionPanel_TurmaAndamento.Height:= VI_AlturaJanela;
   end;
end;



procedure TForm_MenuPrincipal.JvExpressButton_TratarTelaPlanejadosClick(Sender: TObject);
begin
   if JvExpressButton_TratarTelaPlanejados.Hint = 'Aumentar a Janela'  then
   begin
      JvExpressButton_TratarTelaPlanejados.ImageIndex:= 19;

      JvExpressButton_TratarTelaPlanejados.Hint:= 'Diminuir a Janela';
      JvExpressButton_TratarTelaPlanejados.Left:= 756;
      JvShape_TratarTelaPlanejados.Left:= 754;

      JvCaptionPanel_TurmaPlanejados.Left:= 259;
      JvCaptionPanel_TurmaPlanejados.Width:= 822;
      JvCaptionPanel_TurmaPlanejados.Height:= VI_AlturaJanela;
   end
   else
   begin
      JvExpressButton_TratarTelaPlanejados.ImageIndex:= 18;

      JvExpressButton_TratarTelaPlanejados.Hint:= 'Aumentar a Janela';
      JvExpressButton_TratarTelaPlanejados.Left:= 440;
      JvShape_TratarTelaPlanejados.Left:= 438;

      JvCaptionPanel_TurmaPlanejados.Left:= 259;
      JvCaptionPanel_TurmaPlanejados.Width:= 502;
      JvCaptionPanel_TurmaPlanejados.Height:= VI_AlturaJanela;
   end;
end;


procedure TForm_MenuPrincipal.Consultas_ConsultaAlunosInstrutoresClick( Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Funcoes.SetCadCurso('MenuPrincipal');
      Application.CreateForm(TForm_ConsultaAluno, Form_ConsultaAluno);
      Form_ConsultaAluno.ShowModal;
      Form_ConsultaAluno.Free;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento das opcoes
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.TratarOpcoes(Status: Boolean);
begin
   MenuPrincipal_MenuGerencia.Visible:= Status;

   Gerencia_CabecalhosdeDocumentos.Visible:= Status;
   Gerencia_MontagemDiploma.Visible:= Status;
   Gerencia_CadastroDosUsuario.Visible:= Status;
   Gerencia_CadastrodasSecoes.Visible:= Status;
   Gerencia_CadastroDosUsuario.Visible:= Status;
   Gerencia_CadastroUsuarioProvidencia.Visible:= Status;
   Gerencia_CadastroSalaAula.Visible:= Status;
   Gerencia_ControleAcesso.Visible:= Status;

   Instrutor_ConsultaInstrutorporMateria.Visible:= Status;
   Instrutor_QuantidadeDeInstrutoresPorCurso.Visible:= Status;

   MenuPrincipal_Instrutores.Visible:= Status;
   MenuPrincipal_Tabelas.Visible:= Status;
   MenuPrincipal_Consultas.Visible:= Status;
   MenuPrincipal_FichaAvaliacao.Visible:= Status;


   Tabelas_PostoGraduacao.Visible:= Status;
   Tabelas_QuadroEspecialidade.Visible:= Status;
   Tabelas_Cargos.Visible:= Status;
   Tabelas_Unidade.Visible:= Status;
   Tabelas_Paises.Visible:= Status;
   Tabelas_Desligamento.Visible:= Status;

   Consultas_ConsultaAlunosInstrutores.Visible:= Status;
   Consultas_ConsultaCursosFinalizados.Visible:= Status;
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
   begin
      Consulta_HistoricoASEAAPAC.Visible:= Status;
      Consulta_EstatisticaDiarias.Visible:= Status;
   end
   else
   begin
      Consulta_HistoricoASEAAPAC.Visible:= False;
      Consulta_EstatisticaDiarias.Visible:= False;
   end;

   Ferramentas_EditorTexto.Visible:= Status;
   Ferramentas_Avalicao.Visible:= Status;
   Ferramentas_PTSBAse.Visible:= Status;
   Ferramentas_ConfiguracaodoSistema.Visible:= Status;
   Ferramentas_AlterarSenha.Visible:= True;
   Ferramentas_CargaPAELS.Visible:= Status;

   JvExpressButton_Curso.Visible:= Status;
   JvExpressButton_CorpoDocente.Visible:= Status;
   JvExpressButton_Turma.Visible:= Status;
   JvExpressButton_Disciplina.Visible:= Status;
   JvExpressButton_QGA.Visible:= Status;
   JvExpressButton_ItemDeProva.Visible:= Status;
   JvExpressButton_MontarProva.Visible:= Status;
   JvExpressButton_CorrecaoProva.Visible:= Status;
   JvExpressButton_PTS.Visible:= Status;
   JvExpressButton_HabFichaAvaliacao.Visible:= Status;
   JvExpressButton_GrauFinalTurma.Visible:= Status;
   JvExpressButton_ConsultaDeAlunosInstrutor.Visible:= Status;
//   JvExpressButton_CriticaEspontanea.Visible:= Status;
   JvExpressButton_RelacaoAlunosAbaixoMedia.Visible:= Status;
   JvExpressButton_Providencia.Visible:= Status;
//   JvExpressButton_ConsultaMsgInstruores.Visible:= Status;

   JvCaptionPanel_TurmaPlanejados.Visible:= Status;
   JvCaptionPanel_TurmaAndamento.Visible:= Status;
   JvCaptionPanel_TurmaExecutada.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento da altura das janelas de cursos
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.FormResize(Sender: TObject);
begin
   VI_AlturaJanela:= Form_MenuPrincipal.Height -270;

   if JvCaptionPanel_TurmaPlanejados.Visible = True then
      JvCaptionPanel_TurmaPlanejados.Height:= VI_AlturaJanela;

   if JvCaptionPanel_TurmaAndamento.Visible = True then
      JvCaptionPanel_TurmaAndamento.Height:= VI_AlturaJanela;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de providencia
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_ProvidenciaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
begin
   DBGrid_ProvideniaDblClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do duplo click na selacao da providencia
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_ProvideniaDblClick(Sender: TObject);
begin
   if VerificaCurso = True then
   begin
      Funcoes.SetCadCurso('MenuPrincipal');
      Application.CreateForm(TForm_Cad_Providencia, Form_Cad_Providencia);
      Form_Cad_Providencia.ShowModal;
      Form_Cad_Providencia.Free;
   end
end;

//------------------------------------------------------------------------------
// Tratamento do Botao paar minimizar a janela de critica espontanea
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_TrataJanelaCriticaEspontaneaClick(Sender: TObject);
begin
   if JvExpressButton_TrataJanelaCriticaEspontanea.Hint = 'Aumentar a Janela'  then
   begin
      JvExpressButton_TrataJanelaCriticaEspontanea.ImageIndex:= 19;
      JvExpressButton_TrataJanelaCriticaEspontanea.Hint:= 'Diminuir a Janela';

      JvCaptionPanel_CriticaEspontanea.Height:= 613;
   end
   else
   begin
      JvExpressButton_TrataJanelaCriticaEspontanea.ImageIndex:= 18;
      JvExpressButton_TrataJanelaCriticaEspontanea.Hint:= 'Aumentar a Janela';

      JvCaptionPanel_CriticaEspontanea.Height:= 185;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Fechara a janela de critica espontanea
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_FecharCriticaEspontaneaClick(Sender: TObject);
begin
   JvCaptionPanel_CriticaEspontanea.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da Verificacao da Providencia
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.VerificarProvidencia;
begin
   JvExpressButton_Providencia.Visible:= False;
   JvCaptionPanel_Providencia.Visible:= False;
   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Providência');
   if DM.Query_PerfilAcesso.FieldByName('PossuiAcesso').AsString = 'S' then
   begin
      if  DM.Query_Usuario.FieldByName('Secao').AsString = 'EAVC' then
         Funcoes.ExecutaQuery(IBQuery_Providencia, ' Select Tu.CodCurso, Tu.Turma, '+
                                                   '        fp.IdCurso, fp.IdTurma, fp.IdSecao, fp.sigla, fp.ramal, fp.descricao, '+
                                                   '        fp.Rec_data as Rec_Data, fp.Rec_Responsavel , '+
                                                   '        fp.Exec_data as Exec_Data, fp.Exec_Responsavel '+
                                                   ' From Providencia_View fp, turmas_todas_view Tu '+
                                                   ' Where fp.IdCurso = tu.IdCurso '+
                                                   ' and   fp.IdTurma = tu.IdTurma '+
                                                   ' and   fp.Exec_Responsavel is null '+
                                                   ' Order By fp.IdSecao '
                             )
      else
         Funcoes.ExecutaQuery(IBQuery_Providencia, ' Select Tu.CodCurso, Tu.Turma, '+
                                                   '        fp.IdCurso, fp.IdTurma, fp.IdSecao, fp.sigla, fp.ramal, fp.descricao, '+
                                                   '        fp.Rec_data as Rec_Data, fp.Rec_Responsavel , '+
                                                   '        fp.Exec_data as Exec_Data, fp.Exec_Responsavel '+
                                                   ' From Providencia_View fp, turmas_todas_view Tu '+
                                                   ' Where fp.IdCurso = tu.IdCurso '+
                                                   ' and   fp.IdTurma = tu.IdTurma '+
                                                   ' and   fp.sigla = '+#39+DM.Query_Usuario.FieldByName('Secao').AsString+#39+
                                                   ' and   (fp.Exec_Responsavel is null or fp.Exec_Responsavel = '+#39+#39+')'+                                                   ' Order By fp.IdSecao '
                             );

      JvExpressButton_Providencia.Visible:= True;
      if IBQuery_Providencia.FieldByName('IdCurso').AsString <> '' then
      begin
         if IBQuery_Providencia.FieldByName('Exec_Responsavel').AsString = '' then
         begin
            JvCaptionPanel_Providencia.Visible:= True;

            JvCaptionPanel_Providencia.Caption:= '                      Relação de Providências Pendentes';
            JvCaptionPanel_Providencia.Left:= 22;
            JvCaptionPanel_Providencia.Top:= 88;
            JvCaptionPanel_Providencia.Height:= 430;
            JvCaptionPanel_Providencia.Width:= 532;
         end;
      end
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da turma atraves da selecao da providencia
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_ProvideniaCellClick(Column: TColumn);
begin
   HabilitaTurma(IBQuery_Providencia, 'Default-in');
end;

//------------------------------------------------------------------------------
// Tratamento do botao da tela Providencia
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_TratarTelaProvidenciasClick(Sender: TObject);
begin
   if JvExpressButton_TratarTelaProvidencias.Hint = 'Aumentar a Janela'  then
   begin
      JvExpressButton_TratarTelaProvidencias.ImageIndex:= 19;
      JvExpressButton_TratarTelaProvidencias.Hint:= 'Diminuir a Janela';

      JvCaptionPanel_Providencia.Left:= 5;
      JvCaptionPanel_Providencia.Top:= 154;
      JvCaptionPanel_Providencia.Height:= 42;
   end
   else
   begin
      JvExpressButton_TratarTelaProvidencias.ImageIndex:= 18;
      JvExpressButton_TratarTelaProvidencias.Hint:= 'Aumentar a Janela';

      JvCaptionPanel_Providencia.Left:= 22;
      JvCaptionPanel_Providencia.Top:= 88;
      JvCaptionPanel_Providencia.Height:= 525;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para fechar a tela Providencia
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_FecharProvidenciaClick( Sender: TObject);
begin
   JvCaptionPanel_Providencia.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada do form de tratamento da carga do PAELS
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Ferramentas_CargaPAELSClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Carga_PAELS, Form_Carga_PAELS);
   Form_Carga_PAELS.ShowModal;
   Form_Carga_PAELS.Free;
end;


procedure TForm_MenuPrincipal.FichasAntigas1Click(Sender: TObject);
begin
//   if ((VerificaCurso = True) and (Funcoes.VerificaTurma('Não foi possível Habilitar Ficha de Avaliação de Curso ') = True)) then
       Form_Hab_FichaAvaliacao.ShowModal;

end;

procedure TForm_MenuPrincipal.Timer1Timer(Sender: TObject);
begin
   Funcoes.AtualizaQuery(DM.Query_Usuario);
end;

//------------------------------------------------------------------------------
// Procedure para tratar da abertura da Form de tratamento do PTS - Base Novo
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.PTS_BASE_NOVO1Click(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Application.CreateForm(TForm_Sel_PTS_Base_Novo, Form_Sel_PTS_Base_Novo);
      Form_Sel_PTS_Base_Novo.ShowModal;
      Form_Sel_PTS_Base_Novo.Free;
   end;
end;

procedure TForm_MenuPrincipal.PTSNOVO1Click(Sender: TObject);
begin
   if  VerificaCurso = True then
   begin
      Application.CreateForm(TForm_Sel_PTS_Novo, Form_Sel_PTS_Novo);
      Form_Sel_PTS_Novo.ShowModal;
      Form_Sel_PTS_Novo.Free;
   end;
end;

procedure TForm_MenuPrincipal.Button1Click(Sender: TObject);
begin
//  Application.CreateForm(TForm_Mapa_Sala, Form_Mapa_Sala);
  Form_Mapa_Sala.Show;
//  Form_Mapa_Sala.Free;

end;

procedure TForm_MenuPrincipal.DBGrid_TurmaPlanejadaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   VCor: TColor;
begin
   VCor:= clBlack;
//   DBGrid_Turma.Canvas.Font.Color:= clBlack;

   if IBQuery_TurmaPlanejada.FieldByName('CodCurso').AsString <> 'PAELS' then
   begin
   if ((IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 60) and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger > 30)) then
      DBGrid_TurmaPlanejada.Canvas.Brush.Color:= $00C08080
   else
      if ((IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 30) and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger > 20)) then
         DBGrid_TurmaPlanejada.Canvas.Brush.Color:= $00B5B56A
      else
         if ((IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 20) and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger > 0)) then
            DBGrid_TurmaPlanejada.Canvas.Brush.Color:= $004080FF
         else
         begin
           DBGrid_TurmaPlanejada.Canvas.Brush.Color := $00E6F8FF;
           if (( column.Title.Caption = 'Dias') and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 0)) then
              VCor:= $00E6F8FF;
         end;
   end
   else
   begin
      if ((column.Title.Caption = 'Dias') and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 0 ))then
         VCor:= $00E6F8FF;
   end;

   DBGrid_TurmaPlanejada.Canvas.Font.Color:= VCor;


   if gdSelected in State then
   begin
      DBGrid_TurmaPlanejada.Canvas.Brush.Color := $00FF8D1C;
      if ((column.Title.Caption = 'Dias') and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 0 ))then
         DBGrid_TurmaPlanejada.Canvas.Font.Color:= $00FF8D1C
   end;


   DBGrid_TurmaPlanejada.Canvas.FillRect(Rect);
   DBGrid_TurmaPlanejada.DefaultDrawColumnCell(Rect, DataCol, Column, State);


{   VCor:= clBlack;

   if IBQuery_TurmaPlanejada.FieldByName('CodCurso').AsString <> 'PAELS' then
   begin
   if ((IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 60) and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger > 30)) then
      DBGrid_TurmaPlanejada.Canvas.Brush.Color:= $00C08080
   else
      if ((IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 30) and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger > 20)) then
         DBGrid_TurmaPlanejada.Canvas.Brush.Color:= $00B5B56A
      else
         if ((IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 20) and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger > 0)) then
            DBGrid_TurmaPlanejada.Canvas.Brush.Color:= $004080FF
         else
         begin
           DBGrid_TurmaPlanejada.Canvas.Brush.Color := $00E6F8FF;
           if (( column.Title.Caption = 'Dias') and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 0)) then
              VCor:= $00E6F8FF;
         end;
   end
   else
   begin
      if ((column.Title.Caption = 'Dias') and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 0 ))then
         VCor:= $00FF8D1C
   end;

   DBGrid_TurmaPlanejada.Canvas.Font.Color:= VCor;

   if gdSelected in State then
   begin
      DBGrid_TurmaPlanejada.Canvas.Brush.Color := $00FF8D1C;
      if ((column.Title.Caption = 'Dias') and (IBQuery_TurmaPlanejada.FieldByName('dias').Asinteger <= 0 ))then
         DBGrid_TurmaPlanejada.Canvas.Font.Color:= $00FF8D1C
   end;


   DBGrid_TurmaPlanejada.Canvas.FillRect(Rect);
   DBGrid_TurmaPlanejada.DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
end;

procedure TForm_MenuPrincipal.HorriosparaPTS1Click(Sender: TObject);
begin
    Form_Cad_Horarios.ShowModal;
end;

end.
