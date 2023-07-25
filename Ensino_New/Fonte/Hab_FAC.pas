//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : HAB_FAC.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da          //
//                             Habilitacao das Avaliaçao de Curso (FAC).      //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Marcela                                    //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 02/09/2019                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Hab_FAC;

interface

uses ShellApi, DBClient, ImgList, Controls, Menus, DB, IBTable,
  IBCustomDataSet, IBQuery, ComCtrls, TeEngine, Series, TeeProcs, Chart,
  Mask, JvComponent, JvCaptionPanel, DBCtrls, JvDBCtrl, ExtCtrls, OleCtrls,
  SHDocVw, JvTransBtn, JvShape, JvGradient, StdCtrls, JvToolEdit, Grids,
  DBGrids, Classes, Windows, Messages, SysUtils, Graphics, Forms, Dialogs,
  DBTables, Buttons, ToolWin, Variants,
  JvEdit,  JvArrow, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvLookOut, FichaAvalicaoCurso,
  Rotinas_Tratar_Providencia,Rotinas_Validar, Rotinas, Rotinas_SUE,
  IWControl, IWCompMemo, DbChart, Jpeg, ExportPack, PsyRichEdit,
  JvGradientCaption;

type
  TForm_Hab_FAC = class(TForm)
    DSQ_InstrutorTurma: TDataSource;
    Query_InstrutorTurma: TIBQuery;
    Query_InstrutorTurmaIDCURSO: TSmallintField;
    Query_InstrutorTurmaIDTURMA: TIntegerField;
    Query_InstrutorTurmaIDENTIDADE: TIBStringField;
    Query_InstrutorTurmaPOSTOGRADUACAO: TIBStringField;
    DSC_FichaAvaliacao: TDataSource;
    IBTable_FichaAvaliacao: TIBTable;
    DST_FichaAvaliacao: TDataSource;
    IBQuery_FAC_FichaAvaliacao: TIBQuery;
    DSQ_FAC_FichaAvaliacao: TDataSource;
    IBQuery_MontaMateria: TIBQuery;
    IBQuery_MontaMateriaIDCURSO: TSmallintField;
    IBQuery_MontaMateriaCODMATERIA: TIBStringField;
    IBQuery_MontaMateriaNOMEMATERIA: TIBStringField;
    DSQ_MontaMateria: TDataSource;
    IBTable_Instrutor: TIBTable;
    DST_Instrutor: TDataSource;
    IBTable_Disciplina: TIBTable;
    DST_Disciplina: TDataSource;
    IBTable_InstrutorIDENTIDADE: TIBStringField;
    IBTable_InstrutorNOME: TIBStringField;
    IBTable_InstrutorNOMEGUERRA: TIBStringField;
    IBTable_InstrutorPOSTOGRADUACAO: TIBStringField;
    IBTable_DisciplinaIDCURSO: TSmallintField;
    IBTable_DisciplinaCODMATERIA: TIBStringField;
    IBTable_DisciplinaNOMEMATERIA: TIBStringField;
    IBQuery_RelacaoAlunos: TIBQuery;
    DSQ_RelacaoAlunos: TDataSource;
    IBQuery_FARelacaoAlunos: TIBQuery;
    DSQ_FARelacaoAlunos: TDataSource;
    IBQuery_CoordenadorTurma: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    DSQ_CoordenadorTurma: TDataSource;
    DST_Coordenador: TDataSource;
    PopupMenu_Relatorios: TPopupMenu;
    RelacaodeAlunoscomCodigo: TMenuItem;
    RelaodeInstrutorescomCdigo1: TMenuItem;
    IBQuery_Pessoa: TIBQuery;
    IBQuery_PessoaPOSTOGRADUACAO: TIBStringField;
    IBQuery_PessoaNOMEGUERRA: TIBStringField;
    Query_InstrutorTurmaNOMEGUERRA: TIBStringField;
    IBQuery_CoordenadorTurmaNOMEGUERRA: TIBStringField;
    Panel_TratarFicha: TPanel;
    GroupBox_Ficha: TGroupBox;
    DBGrid_Ficha: TDBGrid;
    Panel_Treeviw: TPanel;
    Query_InstrutorTurmaNOME: TIBStringField;
    IBQuery_CoordenadorTurmaNOME: TIBStringField;
    DBGrid_FichaAvaliacao: TDBGrid;
    Panel_Filtro_Fichas: TPanel;
    JvDateEdit_Aplicacao: TJvDateEdit;
    ComboBox_SelFicha: TComboBox;
    Panel_FichasCadastradas: TPanel;
    Panel_Botoes: TPanel;
    ProgressBar_Fichas: TProgressBar;
    IBQuery_FAC: TIBQuery;
    IBQuery_Topicos: TIBQuery;
    IBQuery_Avaliado: TIBQuery;
    IBQuery_Itens: TIBQuery;
    IBQuery_Comentario_FAC: TIBQuery;
    IBQuery_Complemento02: TIBQuery;
    IBQuery_Critica: TIBQuery;
    IBQuery_Disciplina: TIBQuery;
    IBQuery_DisciplinaCODMATERIA: TIBStringField;
    IBQuery_DisciplinaNOMEMATERIA: TIBStringField;
    IBQuery_Instrutor: TIBQuery;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBQuery_Coordenador: TIBQuery;
    IBQuery_CoordenadorPOSTOGRADUACAO: TIBStringField;
    IBStringField1: TIBStringField;
    DSQ_Providencia: TDataSource;
    IBTable_Providencia: TIBTable;
    IBTable_ProvidenciaIDCURSO: TSmallintField;
    IBTable_ProvidenciaIDTURMA: TIntegerField;
    IBTable_ProvidenciaIDSECAO: TIntegerField;
    IBTable_ProvidenciaREC_DATA: TDateTimeField;
    IBTable_ProvidenciaREC_RESPONSAVEL: TIBStringField;
    IBTable_ProvidenciaREC_ACAO: TIBStringField;
    IBTable_ProvidenciaEXEC_DATA: TDateTimeField;
    IBTable_ProvidenciaEXEC_RESPONSAVEL: TIBStringField;
    IBTable_ProvidenciaEXEC_ACAO: TIBStringField;
    DST_Providencia: TDataSource;
    ImlLarge: TImageList;
    ImlSmall: TImageList;
    Panel_TratarOpcoes: TPanel;
    Panel_Cadastro: TPanel;
    Panel_CadFichaAvl: TPanel;
    Panel_RelacaoAlunos: TPanel;
    Label_Msg02: TLabel;
    DBGrid_FA_Relacao: TDBGrid;
    Panel_BotoesProva: TPanel;
    JvCaptionPanel_Avaliacao: TJvCaptionPanel;
    DBGrid_Avaliacao: TDBGrid;
    JvCaptionPanel_Instrutor: TJvCaptionPanel;
    DBGrid_SelIntrutor: TDBGrid;
    IBQuery_FAC_FichaAvaliacaoIDFICHA: TSmallintField;
    IBQuery_FAC_FichaAvaliacaoCABECALHO: TIBStringField;
    IBQuery_FAC_FichaAvaliacaoINSTRUCAO: TIBStringField;
    IBQuery_FAC_FichaAvaliacaoCOMENTARIO: TIBStringField;
    IBQuery_FAC_FichaAvaliacaoMODELO: TIBStringField;
    ClientDataSet_FAC: TClientDataSet;
    ClientDataSet_FACIdCurso: TIntegerField;
    ClientDataSet_FACIdTurma: TIntegerField;
    ClientDataSet_FACIdAvaliacao: TIntegerField;
    ClientDataSet_FACIdFicha: TIntegerField;
    ClientDataSet_FACDataAvaliacao: TStringField;
    ClientDataSet_FACIdAvaliador: TStringField;
    ClientDataSet_FACIdentidade: TStringField;
    ClientDataSet_FACDisciplina: TStringField;
    ClientDataSet_FACCabecalho: TStringField;
    ClientDataSet_FACDescCabacalho: TStringField;
    ClientDataSet_FACStatus: TStringField;
    Panel_Principal: TPanel;
    Panel_Editar: TPanel;
    Label2: TLabel;
    JvDBDateEdit_DataAvaliacao: TJvDBDateEdit;
    Panel_Amostra: TPanel;
    Panel_Instrutor: TPanel;
    Label_Instrutor: TLabel;
    DBEdit_NOmeGuerra: TDBEdit;
    DBEdit_PostoGraduacao: TDBEdit;
    Panel_Disciplina: TPanel;
    Label_Disciplina: TLabel;
    DBEdit_Disciplina: TDBEdit;
    DBEdit_NomeDisciplina: TDBEdit;
    IBTable_DisciplinaIDTURMA: TIntegerField;
    DSQ_FAC: TDataSource;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoIDAVALIACAO: TIntegerField;
    IBTable_FichaAvaliacaoIDFICHA: TSmallintField;
    IBTable_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;
    JvCaptionPanel_Disciplina: TJvCaptionPanel;
    Panel4: TPanel;
    MaskEdit_Materia: TMaskEdit;
    MaskEdit_DescricaoDis: TMaskEdit;
    DBGrid_SelMateria: TDBGrid;
    IBQuery_FAC_Usuario: TIBQuery;
    DSQ_FAC_Usuario: TDataSource;
    IBQuery_FAC_UsuarioIDENTIDADE: TIBStringField;
    IBQuery_FAC_UsuarioPOSTOGRADUACAO: TIBStringField;
    IBQuery_FAC_UsuarioNOME: TIBStringField;
    IBQuery_FARelacaoAlunosNOMEGUERRA: TIBStringField;
    IBQuery_FARelacaoAlunosRESPONDEU: TIBStringField;
    IBQuery_FARelacaoAlunosPOSTOGRADUACAO: TIBStringField;
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
    Splitter1: TSplitter;
    JvCaptionPanel_Relatorios_PDF: TJvCaptionPanel;
    JvTransparentButton_Fecha_PDF: TJvTransparentButton;
    Label10: TLabel;
    JvShape2: TJvShape;
    JvTransparentButton_SolPDF: TJvTransparentButton;
    Edit_NomeDoArquivo: TEdit;
    ExportQR1: TExportQR;
    IBQuery_Topico: TIBQuery;
    IBQuery_FACIDCURSO: TSmallintField;
    IBQuery_FACIDTURMA: TIntegerField;
    IBQuery_FACIDAVALIACAO: TIntegerField;
    IBQuery_FACIDFICHA: TSmallintField;
    IBQuery_FACDATAAVALIACAO: TDateTimeField;
    IBQuery_FACCABECALHO: TIBStringField;
    Panel_Frame_SelCurso: TPanel;
    IBQuery_FAC_Ext_FichaAvaliacao: TIBQuery;
    DSQ_FAC_Ext_FichaAvaliacao: TDataSource;
    IBQuery_Ext_Comentario: TIBQuery;
    IBQuery_Ext_ComentarioIDCURSO: TSmallintField;
    IBQuery_Ext_ComentarioIDTURMA: TIntegerField;
    IBQuery_Ext_ComentarioTIPO: TIBStringField;
    IBQuery_FAC_Ext_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FAC_Ext_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FAC_Ext_FichaAvaliacaoTIPO: TIBStringField;
    IBQuery_Ext_ComentarioCOMENTARIO: TIBStringField;
    IBQuery_TopicoIDFICHA: TSmallintField;
    IBQuery_TopicoIDTOPICO: TSmallintField;
    IBQuery_TopicoRESPOSTA: TIntegerField;
    DataSource3: TDataSource;
    IBQuery_TopicoIDAVALIACAO: TIntegerField;
    IBQuery_Comentario_FACIDCURSO: TSmallintField;
    IBQuery_Comentario_FACIDTURMA: TIntegerField;
    IBQuery_Comentario_FACIDAVALIACAO: TIntegerField;
    IBQuery_Comentario_FACTIPO: TIBStringField;
    IBQuery_Comentario_FACCOMENTARIO: TIBStringField;
    Imprimir_FichaAvaliacao: TMenuItem;
    JvCaptionPanel_MontaFichaAvaliacao: TJvGradientCaption;
    JvGradient1: TJvGradient;
    JvGradient_Tela_01: TJvGradient;
    JvShape_EncerrarProva: TJvShape;
    JvTransparentButton_RelatoriosImprimir: TJvTransparentButton;
    JvShape_Atualizar: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape_retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Label_Completa: TLabel;
    JvShape4: TJvShape;
    JvTransparentButton_PDF: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_AbrePagina: TJvTransparentButton;
    Label3: TLabel;
    JvGradient_Tela_02: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancel: TJvTransparentButton;
    JvShape_Inserir: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Comentarios_Fac: TJvTransparentButton;
    N1: TMenuItem;
    IBQuery_Get_Quesito: TIBQuery;
    IBQuery_Relacao_Instrutores_FAC: TIBQuery;
    Memo_Demo: TMemo;
    IBQuery_MontaMateriaCARGAHORARIA: TIntegerField;
    IBTable_Tecnica: TIBTable;
    DST_Tecnica: TDataSource;
    IBTable_TecnicaIDAVALIACAO: TIntegerField;
    IBTable_TecnicaIDAVALIADOR: TIBStringField;
    IBTable_TecnicaIDFICHA: TSmallintField;
    IBTable_TecnicaTECNICA: TIBStringField;
    Panel1: TPanel;
    Shape1: TShape;
    Label_Msg01: TLabel;
    Chart_Medias: TChart;
    Series1: TBarSeries;

    procedure TratarMedia(IdAvaliacao: String);

    procedure Set_Grafico( VS_Descricao: String; VR_Media: Real );
    procedure TratarTopico_Anexo_F(IdAvaliacao: String);


    Function ExtratoCurso_Anexo_F(IdAvaliacao: String): Boolean;
    Function ExtratoCurso_Anexo_G(IdAvaliacao: String): Boolean;

    procedure Tratar_Grafico(VS_Cabecalho: String);
    procedure Tratar_RelacaoAvaliacoes;
    procedure AlimentaRelacaoDeAvaliados(PS_IdAvaliacao, PS_Ficha: String; VI_Matriz: Integer);

    procedure Tratar_Comentarios;

    procedure TratarTopico(IdAvaliacao: String; VB_Processamento: Boolean);
    procedure Zerar_Respostas;
    procedure AnalisarResposta(VI_Matriz: Integer);
    Procedure Get_Quesito(VS_IdTopico: String);

    procedure Grava_Fac( VS_Topico, VS_NObservado, VS_Abaixo, VS_Atingiu, VS_Acima, VS_Media_ajust, VS_Comentario, VS_Destaque: String);

    Function ExtratoCurso(IdAvaliacao: String): Boolean;

    procedure Tratar_FA_AvaliacaoAfterScroll;
    procedure CadastrarFichaNova;
    procedure DesabilitaCaixaSelecao;
    procedure SelecionaFicha(Sender: TObject);

    Procedure Containers(Status: Boolean);
    procedure FormActivate(Sender: TObject);

    procedure Campos_Ficha(Status: Boolean);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_FichaCellClick(Column: TColumn);
    procedure RelacaodeAlunoscomCodigoClick(Sender: TObject);
    procedure RelaodeInstrutorescomCdigo1Click(Sender: TObject);
    procedure MaskEdit_MateriaChange(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelClick(Sender: TObject);
    procedure ComboBox_SelFichaChange(Sender: TObject);
    procedure DBGrid_FichaAvaliacaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ImprimiraFichadeAvaliacaoClick(Sender: TObject);
    procedure DBGrid_FichaAvaliacaoEnter(Sender: TObject);
    procedure IBQuery_FACAfterScroll(DataSet: TDataSet);
    procedure ClientDataSet_FACAfterScroll(DataSet: TDataSet);
    procedure JvTransparentButton_AbrePaginaClick(Sender: TObject);
    procedure JvTransparentButton_PDFClick(Sender: TObject);
    procedure JvTransparentButton_SolPDFClick(Sender: TObject);
    procedure JvTransparentButton_Fecha_PDFClick(Sender: TObject);
    procedure JvTransparentButton_Comentarios_FacClick(Sender: TObject);
    procedure DBGrid_FichaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);

  private    { Private declarations }
     VB_Processar: Boolean;
     VS_Dir, VS_DirPdf, VS_Operacao: String;
     VB_RelacaoAvaliados, VB_AlimentaMatriz, VB_Inicio, VB_CorregandoFicha: Boolean;

     VI_RespostaAbaixo: Integer;
     VI_Grafico, VI_Matriz, VI_IdCurso, VI_IdTurma: Integer;

     VS_Disciplina: array[1..3000] of String;
     VS_Abaixo: array[1..3000] of String;

     VS_Grafico_Descricao: array[1..3000] of String;
     VR_Grafico_Valor: array[1..3000] of real;

     VS_Ficha_Identif, VS_Media_ajust, VS_Topico, VS_IdTopico, VS_Quesito: String;
     VR_IdFicha, VR_IdTopico, VR_NObservado, VR_Abaixo, VR_Atingiu, VR_Acima, VR_TotalRespondido, VR_Media: Real;
     VR_Tot_NObservado, VR_Tot_Abaixo, VR_Tot_Atingiu, VR_Tot_Acima: Real;
     VR_MAritimetica, VR_CAritimetica: Real;

  public    { Public declarations }
  end;
var
  Form_Hab_FAC: TForm_Hab_FAC;

implementation

uses Module, Frame_Sel_Curso, FAC, Rel_RelatorioDoCadastroDeAlunosComCodigo,
  RelatorioFichasAvaliacoes, Cad_Msg_FAC, RelatorioCriticaFinalCurso, Relatorio_Extrato_Curso,
  FAC_Comentario_ICEA, MenuPrincipal;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.FormActivate(Sender: TObject);
begin
   VB_Processar:= True;
   JvGradient_Tela_01.StartColor:= Cor_Tela;
   JvGradient_Tela_02.StartColor:= Cor_Tela;

   Memo_Demo.Visible:= False;

   JvCaptionPanel_Relatorios_PDF.Visible:= False;
   VS_Dir:= 'C:\Ensino\Tmp';
   VS_DirPdf:= 'C:\Ensino\RelatórioPDF';

   VB_Inicio:= True;
   Panel_Cadastro.Visible:= True;

   VB_Inicio:= True;
   ProgressBar_Fichas.Visible:= False;
   VB_CorregandoFicha:= False;

   Panel_Cadastro.Align:= AlClient;
   Panel_Cadastro.Visible:= True;

   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
     Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);

      //--- Tratamento da Selecao dos Cursos

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Hab_FAC.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', 'Todos');

      //--- Tratamento para alimentar a lista de fichas avaliadas

      IBQuery_FAC.Close;
      IBQuery_FAC.Sql.Clear;
      IBQuery_FAC.Sql.Add(' Select a.IdCurso, a.IdTurma, a.IdAvaliacao, a.IdFicha, a.DataAvaliacao, m.cabecalho '+
                          ' From FAC_FICHAAVALIACAO m, FAC_Avaliacao a '+
                          ' Where a.IdFicha = m.IdFicha '+
                          ' and   a.IdFicha > 10 '+
                          ' and   a.IdFicha <> 14 '+
                          ' and   a.IdFicha <> 24 '+
                          ' and   a.IdCurso = '+Form_MenuPrincipal.VS_IdCurso+
                          ' and   a.IdTurma = '+Form_MenuPrincipal.VS_IdTurma+
                          ' order by a.IdFicha, m.cabecalho, a.DataAvaliacao desc  '
                         );
      IBQuery_FAC.Open;

      VI_IdCurso:= StrToInt(Form_MenuPrincipal.VS_IdCurso);
      VI_IdTurma:= StrToInt(Form_MenuPrincipal.VS_IdTurma);

      ClientDataSet_FAC.Active:= true;

      Funcoes_FAC.LimpaAvaliacoes(ClientDataSet_FAC);
      Funcoes_FAC.AlimentaAvaliacoes( IBQuery_FAC, ProgressBar_Fichas, ClientDataSet_FAC);
      Funcoes_FAC.AlimentaComboBox_SelFicha(ComboBox_SelFicha, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
//      Funcoes_FAC.AlimentaComboBox_SelFicha(ComboBox_SelFicha, Form_MenuPrincipal.VS_IdCurso, Form_MenuPrincipal.VS_IdTurma);


      // Tratamento das janelas utilizadas

      Panel_FichasCadastradas.Visible:= True;
      JvCaptionPanel_Avaliacao.Height:= 118;
      JvCaptionPanel_Disciplina.Height:= 194;
      JvCaptionPanel_Instrutor.Height:= 190;

      Panel_Editar.Visible:= False;
      Funcoes.SetCadCurso('CadCurso');
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - FAC (Habilitar Ficha de Avaliação)');    // Abre o perfil do usuario em relacao a agenda
      Campos_Ficha(False);
      Containers(True);
      DesabilitaCaixaSelecao;

      //--- Abre as tabelas existentes

      IBQuery_FAC_FichaAvaliacao.Close;

      Query_InstrutorTurma.Open;
      IBQuery_CoordenadorTurma.Open;
      IBQuery_FAC_FichaAvaliacao.Open;
      IBQuery_MontaMateria.Open;
      IBQuery_FARelacaoAlunos.Open;

      IBTable_FichaAvaliacao.Open;
      IBTable_Instrutor.Open;
      IBTable_Disciplina.Open;
      IBQuery_FAC_Usuario.Open;
      DM.IBTable_Relatorio_FAC.Open;

      //--- Abre as tabelas existentes

      IBQuery_Coordenador.Open;
      IBQuery_Instrutor.Open;
      IBQuery_Disciplina.Open;
      IBTable_Tecnica.Open;

      DBGrid_FichaAvaliacao.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento Quando fechar a Form
//--- Fecha as tabelas existentes
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   IBQuery_FARelacaoAlunos.Close;
   IBQuery_RelacaoAlunos.Close;
   IBQuery_FAC.Close;
   Query_InstrutorTurma.Close;
   IBQuery_CoordenadorTurma.Close;
   IBQuery_FAC_FichaAvaliacao.Close;
   IBQuery_MontaMateria.Close;
   IBQuery_FAC_Usuario.Close;

   IBTable_FichaAvaliacao.Close;
   IBQuery_Coordenador.Close;
   IBTable_Instrutor.Close;
   IBTable_Disciplina.Close;
   IBTable_Tecnica.Close;
end;

//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_Hab_FAC.Containers(Status: Boolean);
begin
   Panel_Treeviw.Enabled:= Status;
   Panel_Botoes.Enabled:= Status;

   Panel_RelacaoAlunos.Visible:= Status;

   if status = True then
      Status:= False
   else
      Status:= True;
   GroupBox_Ficha.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de Fichas a serem avaliadas
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.ComboBox_SelFichaChange( Sender: TObject);
begin
   VB_CorregandoFicha:= False;
   Funcoes_FAC.ComboBox_SelFichaChange( JvDateEdit_Aplicacao, ComboBox_SelFicha, IBQuery_FAC, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
   Funcoes_FAC.LimpaAvaliacoes(ClientDataSet_FAC);
   Funcoes_FAC.AlimentaAvaliacoes( IBQuery_FAC, ProgressBar_Fichas, ClientDataSet_FAC);
   VB_CorregandoFicha:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da atualizacao da lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes_FAC.Atualizar(VB_CorregandoFicha, IBQuery_FAC, ProgressBar_Fichas, ClientDataSet_FAC);
   ClientDataSet_FAC.Close;
   ClientDataSet_FAC.Open;
end;

//------------------------------------------------------------------------------
//
// Tratamento Cadastro da Ficha de Avaliação
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Campos_Ficha(Status: Boolean);
begin
   JvDBDateEdit_DataAvaliacao.Enabled:= Status;
   DBGrid_SelMateria.Enabled:= Status;
   DBGrid_SelIntrutor.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_InserirClick(Sender: TObject);
begin
   try
      //--- Inicia a inserção da Ficha

      VS_Operacao:= 'Inserir';
      Campos_Ficha(True);
      Containers(False);
      Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
      JvTransparentButton_Grava.Enabled:= False;
      JvShape_Gravar.Enabled:= False;

      Panel_Amostra.Visible:= False;
      Panel_Editar.Visible:= True;
      Panel_FichasCadastradas.Visible:= False;

      IBTable_FichaAvaliacao.Append;
      JvDBDateEdit_DataAvaliacao.Date:= Date;
      CadastrarFichaNova;
      DBGrid_Ficha.SetFocus;
   except
      JvTransparentButton_CancelClick( Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   if ClientDataSet_FAC.FieldByName('DescCabacalho').AsString = 'EXTRATO DO CURSO' then
   begin
      ShowMessage('Operação invalida... - O Extrato do curso não é ficha de avaliação');
   end
   else
   begin
      Panel_FichasCadastradas.Visible:= False;
      VS_Operacao:= 'Alterar';
      JvCaptionPanel_MontaFichaAvaliacao.LabelCaption:= VS_Operacao+' '+ClientDataSet_FAC.FieldByName('Cabecalho').AsString;
      Campos_Ficha(True);
      Containers(False);
      Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
      Panel_Amostra.Visible:= False;
      GroupBox_Ficha.Visible:= False;
      Panel_Editar.Visible:= True;

      IBTable_FichaAvaliacao.Edit;
      JvDBDateEdit_DataAvaliacao.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   if copy(ClientDataSet_FAC.FieldByName('DescCabacalho').AsString,1, 16) = 'EXTRATO DE CURSO' then
   begin
      ShowMessage('Operação invalida... - O Extrato do curso não é ficha de avaliação');
   end
   else
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a Ficha selecionada '+#13+
                                       'Confirma a exclusão da Ficha ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
      begin
         Funcoes.GravaAcesso('Menu Principal - Habilitar Ficha de Avaliação', 'Excluir Ficha Avaliação Habilitada');

         Funcoes.ExecusaoQuery('Delete from FAC_Resposta where IdAvaliacao = '+ClientDataSet_FAC.FieldByName('IdAvaliacao').AsString );
         Funcoes.ExecusaoQuery('Delete from FAC_Tecnica where IdAvaliacao = '+ClientDataSet_FAC.FieldByName('IdAvaliacao').AsString );

         IBTable_FichaAvaliacao.Open;
         IBTable_FichaAvaliacao.Delete;    // Exclui o arquivo
         Funcoes.ExecutaTransacao;
         Funcoes.AtualizaQuery( IBQuery_FAC );

         VB_CorregandoFicha:= False;

         Funcoes_FAC.LimpaAvaliacoes(ClientDataSet_FAC);
         Funcoes_FAC.AlimentaAvaliacoes( IBQuery_FAC, ProgressBar_Fichas, ClientDataSet_FAC);
         Funcoes_FAC.AlimentaComboBox_SelFicha(ComboBox_SelFicha, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
         VB_CorregandoFicha:= True;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_GravaClick(Sender: TObject);
var
   VB_Gravar: Boolean;
   VS_IdAvaliacao, VS_Check_IdAvaliacao: String;
begin
   VB_Gravar:= False;

   if JvDBDateEdit_DataAvaliacao.Date = 0 then
   begin
      ShowMessage('Para Cadastrar esta Ficha é preciso fornecer a "Data da Avaliação"...'+#13);
      JvDBDateEdit_DataAvaliacao.SetFocus;
   end
   else
   begin
      if VS_Operacao = 'Alterar' then
      begin
         IBTable_FichaAvaliacao.Post;
         Funcoes.GravaAcesso('Menu Principal - Habilitar Ficha de Avaliação', 'Gravar Alteração Ficha Avaliação do Curso: '+Funcoes.GetCodCurso+' e da Turma: '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);
         Campos_Ficha(False);
         Containers(True);
         DesabilitaCaixaSelecao;
         Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
         Panel_Amostra.Visible:= True;
      end
      else
      begin       //--- Inicia o processo de gravacao da Ficha

         VS_IdAvaliacao:= Validar.RetornaUltimoIDAvaliacao;

         if (( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 1 ) or
             ( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 11 ) or
             ( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 21 ))  then               //=== CRÍTICA DO DOCENTE E INSTRUÇÃO
         begin

            //--- Verifica se a Ficha foi Cadastrada

            Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) As Qtd '+
                                                     ' From FAC_Avaliacao F1, fac_avaliado F2 '+
                                                     ' where F1.idavaliacao = F2.idavaliacao '+
                                                     ' and   F1.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                     ' and   F1.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                     ' and   F1.IdFicha = '+IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString+
                                                     ' and   F2.identidade = '+#39+Query_InstrutorTurma.FieldByName('Identidade').AsString+#39+
                                                     ' and   F2.disciplina = '+#39+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+#39
                                );
            if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
            begin
               ShowMessage('O Instrutor: '+trim(Query_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+' '+trim(Query_InstrutorTurma.FieldByName('NomeGuerra').AsString)+
                           ' já esta sendo avaliado na Disciplina: '+IBQuery_MontaMateria.FieldByName('CodMateria').AsString);
               DBGrid_SelIntrutor.SetFocus;
            end
            else
            begin
               //--- Cadastro Avaliacao

               Validar.CadastroAvaliacao(IBTable_FichaAvaliacao, VS_IdAvaliacao, IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString);

               //--- Configura o Avaliado

               Validar.CadastroAvaliado(VS_IdAvaliacao, Query_InstrutorTurma.FieldByName('Identidade').AsString, IBQuery_MontaMateria.FieldByName('CodMateria').AsString);

               //--- Configura o Avaliador

               Validar.RelacaoAlunos( DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString,DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString, IBQuery_RelacaoAlunos);
               Validar.CadastroAvaliador_Aluno(VS_IdAvaliacao, IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger, IBQuery_RelacaoAlunos);
            end;
         end
         else
         begin
            if (( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 2 ) or
                ( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 12 ) or         
                ( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 22 )) then            //=== CRÍTICA DE FINAL DE CURSO
            begin
                //--- Verificar se a Ficha foi Cadastrada

                Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) As Qtd '+
                                                         ' From FAC_Avaliacao F1 '+
                                                         ' where F1.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                         ' and   F1.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                         ' and   (F1.idFicha = 2 or F1.idFicha = 12 or F1.idFicha = 22)'
                                    );
                if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
                begin
                   ShowMessage('Já foi criado a avaliação de Final de Curso...');
                   JvTransparentButton_CancelClick(Sender);
                end
                else
                begin
                  //--- Cadastro Avaliacao

                  Validar.CadastroAvaliacao(IBTable_FichaAvaliacao, VS_IdAvaliacao, IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString);

                   //--- Configura o Avaliador

                   Validar.RelacaoAlunos( DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString,DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString, IBQuery_RelacaoAlunos);
                   Validar.CadastroAvaliador_Aluno(VS_IdAvaliacao, IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger, IBQuery_RelacaoAlunos);
                end
            end
            else
            begin
               if ((IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 3) or
                   (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 13) or
                   (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 23)) then         //=== FICHA DE OPINIÃO
               begin
                  //--- Verifica se a Ficha foi Cadastrada

                  Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select IdAvaliacao '+
                                                           ' From FAC_Avaliacao F1, fac_avaliado F2 '+
                                                           ' where F1.idavaliacao = F2.idavaliacao '+
                                                           ' and   F1.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                           ' and   F1.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                           ' and   F1.IdFicha = '+IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString+
                                                           ' and   F2.disciplina = '+#39+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+#39
                                      );
                  if DM.IBQuery_Executa.FieldByName('IdAvaliacao').AsString = '' then
                  begin
                     VB_Gravar:= True;
                  end
                  else
                  begin
                     VS_Check_IdAvaliacao:= DM.IBQuery_Executa.FieldByName('IdAvaliacao').AsString;
                     Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) As Qtd '+
                                                              ' From FAC_Avaliador F1 '+
                                                              ' where F1.idavaliacao = '+VS_Check_IdAvaliacao+
                                                              ' and   F1.IdAvaliador = '+#39+Query_InstrutorTurma.FieldByName('Identidade').AsString+#39
                                          );
                     if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
                     begin
                        ShowMessage('Já foi criado o a Ficha de Opnião da Disciplina: '+trim(IBQuery_MontaMateria.FieldByName('CodMateria').AsString)+' '+
                                    ' feita pelo instrutor: '+trim(Query_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+
                                    ' '+trim(Query_InstrutorTurma.FieldByName('NomeGuerra').AsString)+'...');
                        JvTransparentButton_CancelClick(Sender);
                     end
                     else
                     begin
                        VB_Gravar:= True;
                     end;
                  end;

                  if VB_Gravar = True Then
                  begin
                     Validar.CadastroAvaliacao(IBTable_FichaAvaliacao, VS_IdAvaliacao, IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString);

                     //--- Configura o Avaliado

                     Validar.CadastroAvaliado(VS_IdAvaliacao, Query_InstrutorTurma.FieldByName('Identidade').AsString, IBQuery_MontaMateria.FieldByName('CodMateria').AsString);

                     //--- Configura o Avaliador

                     Validar.CadastroAvaliador(VS_IdAvaliacao, Query_InstrutorTurma.FieldByName('Identidade').AsString);
                  end;
               end
               else
               begin
                  if (( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 4) or
                      (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 14) or
                      (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 24)) then     // RELATÓRIO DE AVALIAÇÃO DE FINAL DE CURSO
                  begin
                     //--- Veridicar se a Ficha foi Cadastrada

                     if Query_InstrutorTurma.FieldByName('Identidade').AsString = '' then
                     begin
                        ShowMessage('Não possuí Instrutor Responsável / Coordenador cadastrado...');
                        JvTransparentButton_CancelClick(Sender);
                     end
                     else
                     begin
                        Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd  '+
                                                                 ' From FAC_Avaliacao F1, FAC_Avaliador F2 '+
                                                                 ' where F1.idavaliacao = F2.idavaliacao '+
                                                                 ' and   F1.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                                 ' and   F1.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                                 ' and   F1.IdFicha = '+IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString+
                                                                 ' and   F2.IdAvaliador = '+#39+Query_InstrutorTurma.FieldByName('Identidade').AsString+#39
                                            );
                        if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
                        begin
                           ShowMessage('Já foi criado o Relatório de Avaliação de Final de Curso para o instrutor: '+trim(Query_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+
                                       ' '+trim(Query_InstrutorTurma.FieldByName('NomeGuerra').AsString)+'...');
                           JvTransparentButton_CancelClick(Sender);
                        end
                        else
                        begin
                           IBTable_FichaAvaliacao.Open;

                           //--- Cadastro Avaliacao

                           Validar.CadastroAvaliacao(IBTable_FichaAvaliacao, VS_IdAvaliacao, IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString);

                           //--- Configura o Avaliador

                           Validar.CadastroAvaliador(VS_IdAvaliacao, Query_InstrutorTurma.FieldByName('Identidade').AsString);
                           IBTable_FichaAvaliacao.Close;
                        end;
                     end;
                  end
                  else
                  begin
                     if (( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 5) or
                         (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 15) or
                         (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 25)) then     // (Anexo J) FICHA DE OBSERVAÇÃO DO DOCENTE EM INSTRUÇÃO
                     begin
                        //--- Verifica se a Ficha foi Cadastrada

                        Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select IdAvaliacao '+
                                                                 ' From FAC_Avaliacao F1, fac_avaliado F2 '+
                                                                 ' where F1.idavaliacao = F2.idavaliacao '+
                                                                 ' and   F1.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                                 ' and   F1.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                                 ' and   F1.IdFicha = '+IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString+
                                                                 ' and   F2.disciplina = '+#39+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+#39
                                            );
                        if DM.IBQuery_Executa.FieldByName('IdAvaliacao').AsString = '' then
                        begin
                           VB_Gravar:= True;
                        end
                        else
                        begin
                           VS_Check_IdAvaliacao:= DM.IBQuery_Executa.FieldByName('IdAvaliacao').AsString;
                           Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) As Qtd '+
                                                                    ' From FAC_Avaliador F1 '+
                                                                    ' where F1.idavaliacao = '+VS_Check_IdAvaliacao+
                                                                    ' and   F1.IdAvaliador = '+#39+IBQuery_FAC_Usuario.FieldByName('Identidade').AsString+#39
                                                );
                           if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
                           begin
                              ShowMessage('Já foi criado o a Ficha de Observação do Docente em Instrução na Disciplina: '+trim(IBQuery_MontaMateria.FieldByName('CodMateria').AsString)+' '+
                                          ' feita pelo Avaliador: '+trim(IBQuery_FAC_Usuario.FieldByName('PostoGraduacao').AsString)+
                                          ' '+trim(IBQuery_FAC_Usuario.FieldByName('NomeGuerra').AsString)+'...');
                              JvTransparentButton_CancelClick(Sender);
                           end
                           else
                           begin
                              VB_Gravar:= True;
                           end;
                        end;

                        if VB_Gravar = True Then
                        begin
                           //--- Cadastro Avaliacao
                           Validar.CadastroAvaliacao(IBTable_FichaAvaliacao, VS_IdAvaliacao, IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString);

                           //--- Configura o Avaliado

                           Validar.CadastroAvaliado(VS_IdAvaliacao, Query_InstrutorTurma.FieldByName('Identidade').AsString, IBQuery_MontaMateria.FieldByName('CodMateria').AsString);

                           //--- Configura o Avaliador

                           Validar.CadastroAvaliador(VS_IdAvaliacao, IBQuery_FAC_Usuario.FieldByName('Identidade').AsString);
                        end;
                     end;
                  end;
               end;
            end;
         end;

      end;
   Funcoes.GravaAcesso('Menu Principal - Habilitar Ficha de Avaliação', 'Grava Ficha Avaliação');

   Panel_FichasCadastradas.Visible:= True;

   Panel_Editar.Visible:= False;
   Campos_Ficha(False);
   Containers(True);
   DesabilitaCaixaSelecao;
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);


   JvTransparentButton_AtualizarClick(Sender);
   Panel_Amostra.Visible:= True;

   IBQuery_FAC.Close;
   IBQuery_FAC.Open;
      IBQuery_FAC.Close;
      IBQuery_FAC.Sql.Clear;
      IBQuery_FAC.Sql.Add(' Select a.IdCurso, a.IdTurma, a.IdAvaliacao, a.IdFicha, a.DataAvaliacao, m.cabecalho '+
                          ' From FAC_FICHAAVALIACAO m, FAC_Avaliacao a '+
                          ' Where a.IdFicha = m.IdFicha '+
                          ' and   a.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                          ' and   a.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                          ' order by a.IdFicha, m.cabecalho, a.DataAvaliacao desc  '
                         );
      IBQuery_FAC.Open;

      VB_CorregandoFicha:= False;

      Funcoes_FAC.LimpaAvaliacoes(ClientDataSet_FAC);
      Funcoes_FAC.AlimentaAvaliacoes( IBQuery_FAC, ProgressBar_Fichas, ClientDataSet_FAC);
      Funcoes_FAC.AlimentaComboBox_SelFicha(ComboBox_SelFicha, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
      VB_CorregandoFicha:= True;

      DBGrid_FichaAvaliacao.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_CancelClick(Sender: TObject);
begin
   if ((IBTable_FichaAvaliacao.State = DSInsert) or (IBTable_FichaAvaliacao.State = DSEdit )) then
   begin
      IBTable_FichaAvaliacao.Cancel;
      Funcoes.ExecutaTransacao;
   end;

   Funcoes.GravaAcesso('Menu Principal - Habilitar Ficha de Avaliação', 'Cancelar Ficha Avaliação');

   Panel_FichasCadastradas.Visible:= True;

   Panel_Editar.Visible:= False;
   Campos_Ficha(False);
   Containers(True);
   DesabilitaCaixaSelecao;
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Panel_Amostra.Visible:= True;

   if VB_Inicio = False then
      Tratar_FA_AvaliacaoAfterScroll;

   DBGrid_FichaAvaliacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Selecao do Teste
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.SelecionaFicha(Sender: TObject);
begin
   JvDBDateEdit_DataAvaliacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da seleção do modelo da ficha quando esta esta sendo Inserida ou alterada
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.DBGrid_FichaCellClick(Column: TColumn);
begin
   CadastrarFichaNova;
end;

//------------------------------------------------------------------------------
// Tratamento da seleção do modelo da ficha quando esta esta sendo Inserida ou alterada
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.CadastrarFichaNova;
begin
   JvCaptionPanel_MontaFichaAvaliacao.LabelCaption:= upperCase(VS_Operacao)+' '+IBQuery_FAC_FichaAvaliacao.FieldByName('Cabecalho').AsString;
   JvTransparentButton_Grava.Enabled:= True;
   JvShape_Gravar.Enabled:= True;

   DesabilitaCaixaSelecao;
   JvCaptionPanel_MontaFichaAvaliacao.Visible:= True;

   if ((IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 4) or
       (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 14) or
       (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 24)) then      //--- RELATÓRIO DE AVALIAÇÃO DE FINAL DE CURSO
   begin
      Funcoes.ExecutaQuery(Query_InstrutorTurma, 'Select it.IdCurso, it.IdTurma, pe.nome, pe.nomeguerra, it.Identidade,  pe.PostoGraduacao '+
                                                 ' From  InstrutorTurma it, pessoa pe '+
                                                 ' where it.Identidade = pe.identidade' +
                                                 ' and it.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                 ' and   it.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                 ' and   (it.Funcao = '+#39+'SUPERVISOR'+#39+' or it.Funcao = '+#39+'COORDENADOR'+#39+' or it.Funcao = '+#39+'INSTRUTOR RESPONSÁVEL'+#39+')'+
                                                 ' order by pe.nomeguerra '
                           );

      JvCaptionPanel_Instrutor.Visible:= True;

      JvCaptionPanel_Instrutor.Caption:= '    Selecione o Instrutor Responsável / Coordenador que será Avaliado'
   end
   else
   begin
      if ((IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 1) or         // CRÍTICA DO DOCENTE E INSTRUÇÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 3) or         // FICHA DE OPINIÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 5) or         // FICHA DE OBSERVAÇÃO DO DOCENTE EM INSTRUÇÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 11) or        // CRÍTICA DO DOCENTE E INSTRUÇÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 13) or        // FICHA DE OPINIÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 15) or        // FICHA DE OBSERVAÇÃO DO DOCENTE EM INSTRUÇÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 21) or        // CRÍTICA DO DOCENTE E INSTRUÇÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 23) or        // FICHA DE OPINIÃO
          (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 25)) then     // FICHA DE OBSERVAÇÃO DO DOCENTE EM INSTRUÇÃO
      begin
         //--- Tratamento para instrutor

         Funcoes.ExecutaQuery(Query_InstrutorTurma, 'Select it.IdCurso, it.IdTurma, pe.nome, pe.nomeguerra, it.Identidade,  pe.PostoGraduacao '+
                                                    ' From  InstrutorTurma it, pessoa pe '+
                                                    ' where it.Identidade = pe.identidade' +
                                                    ' and it.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                    ' and   it.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                    ' order by pe.nomeguerra '
                              );

         JvCaptionPanel_Instrutor.Visible:= True;

         if ((IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 3) or
             (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 13) or
             (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 23)) then
            JvCaptionPanel_Instrutor.Caption:= '    Selecione o Instrutor que fará Avaliação da Disciplina selecionada.'
         else
            JvCaptionPanel_Instrutor.Caption:= '    Selecione o Instrutor que será Avaliado';

         JvCaptionPanel_Disciplina.Visible:= True;

         if ((IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 5) or
             (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 15) or
             (IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger = 25)) then
         begin
            JvCaptionPanel_Avaliacao.Caption:= ' Selecione o Avaliador do '+DM.IBTable_Configuracao.FieldByName('Sigla').AsString+' ';

            JvCaptionPanel_Avaliacao.Visible:= True;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Desabilita os GroupBox de selecao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.DesabilitaCaixaSelecao;
begin
   JvCaptionPanel_Avaliacao.Visible := False;
   JvCaptionPanel_Disciplina.Visible:= False;
   JvCaptionPanel_Instrutor.Visible := False;
end;

//------------------------------------------------------------------------------
// Monta o relatorio com o codigo dos Alunos
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.RelacaodeAlunoscomCodigoClick(Sender: TObject);
begin
   if DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não foi selecionada a Turma')
   else
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
// Monta o relatorio com o Codigo dos Instrutores
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.RelaodeInstrutorescomCdigo1Click(Sender: TObject);
begin
   if DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não foi selecionada a Turma')
   else
   begin
      Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
      Funcoes.ExecutaQuery( Form_Rel_RelacaoComCodigo.IBQuery_AlunoTurma, 'Select NomeCompleto, NomeGuerra, CodigoInstrutor as Codigo '+
                                                                          ' From Instrutor_Turmas_View Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                                          ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                          );
      Form_Rel_RelacaoComCodigo.QRLabel_Cabec.Caption:= 'Relação de Instrutor com Código';

      Form_Rel_RelacaoComCodigo.QuickRep1.Preview
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a relação de Disciplinas
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.MaskEdit_MateriaChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select IdCurso, CodMateria, NomeMateria  '+
                ' from  MateriaCurso '+
                ' Where IdCurso = :IdCurso '+
                ' and   IdTurma = :IdTurma ';
   if trim(MaskEdit_Materia.Text) <> '' then
       VS_Comando:= VS_Comando+' and CodMateria like '+#39+MaskEdit_Materia.Text+'%'+#39;

   if trim(MaskEdit_DescricaoDis.Text) <> '' then
       VS_Comando:= VS_Comando+' and NomeMateria like '+#39+MaskEdit_DescricaoDis.Text+'%'+#39;

   VS_Comando:= VS_Comando+' Order By CodMateria';
   Funcoes.ExecutaQuery( IBQuery_MontaMateria, VS_Comando);
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar a classificacao da Ficha
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.DBGrid_FichaAvaliacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if VB_Processar = True then
      Funcoes_FAC.DBGrid_FichaAvaliacaoDrawColumnCell(Sender, Rect, DataCol, Column, State, ClientDataSet_FAC, DBGrid_FichaAvaliacao,);
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a ficha para ser montada
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.ClientDataSet_FACAfterScroll(DataSet: TDataSet);
begin
   if VB_Processar = True then
      Tratar_FA_AvaliacaoAfterScroll;
End;
//------------------------------------------------------------------------------
// Tratamento para chamar a ficha para ser montada
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Tratar_FA_AvaliacaoAfterScroll;
var
   Sender: TObject;
begin
   if VB_Processar = True then
   begin
   if ClientDataSet_FAC.FieldByName('Cabecalho').AsString = '' then
   begin
      Imprimir_FichaAvaliacao.Visible:= False;
      JvCaptionPanel_MontaFichaAvaliacao.Visible:= False;
      JvTransparentButton_Alterar.Enabled:= False;
      JvTransparentButton_Exclui.Enabled:= False;
   end
   else
   begin
      JvCaptionPanel_MontaFichaAvaliacao.Visible:= true;

      JvCaptionPanel_MontaFichaAvaliacao.LabelCaption:= ' '+ClientDataSet_FAC.FieldByName('Cabecalho').AsString;

      Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
      Label_Instrutor.Caption:= 'Instrutor................: ';
      Panel_RelacaoAlunos.Visible:= False;
      Panel_Disciplina.Visible:= False;
      Panel_Instrutor.Visible:= False;

      Imprimir_FichaAvaliacao.Visible:= True;
      Imprimir_FichaAvaliacao.Caption:= 'Imprimir - '+ClientDataSet_FAC.FieldByName('Cabecalho').AsString;

      if ((ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 1) or
          (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 11) or
          (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 21)) then
      begin
         Panel_RelacaoAlunos.Visible:= True;
         Label_Msg02.Caption:= 'Relação de Alunos que irão responder a ficha selecionada.';

         Panel_Amostra.Visible:= True;
         Panel_Disciplina.Visible:= True;
         Panel_Instrutor.Visible:= True;
      end
      else
      begin
         if ((ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 2) or
             (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 12) or
             (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 22)) then
         begin
            Panel_RelacaoAlunos.Visible:= True;
            Label_Msg02.Caption:= 'Relação de Alunos que irão responder a ficha selecionada.';
         end
         else
         begin
            if ((ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 3) or
                (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 13) or
                (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 23)) then
            begin
               Panel_RelacaoAlunos.Visible:= True;
               Label_Msg02.Caption:= 'Instrutor que irá responder a ficha selecionada.';

               Panel_Amostra.Visible:= True;
               Panel_Disciplina.Visible:= True;
               Panel_Instrutor.Visible:= True;
            end
            else
            begin
               if ((ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 4) or
                   (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 14) or
                   (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 24)) then
               begin
                  Panel_RelacaoAlunos.Visible:= True;
                  Label_Msg02.Caption:= 'Instrutor Responsável que irá responder a ficha selecionada.';
               end
               else
               begin
                  if ((ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 5) or
                      (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 15) or
                      (ClientDataSet_FAC.FieldByName('IdFicha').Asinteger = 25)) then
                  begin
                     Panel_RelacaoAlunos.Visible:= True;
                     Label_Msg02.Caption:= 'Avaliador Responsável que irá responder a ficha selecionada.';
                     Panel_Amostra.Visible:= True;
                     Panel_Disciplina.Visible:= True;
                     Panel_Instrutor.Visible:= True;
                  end
                  else
                  begin
                     JvCaptionPanel_MontaFichaAvaliacao.Visible:= False;
                     JvTransparentButton_Alterar.Enabled:= False;
                     JvTransparentButton_Exclui.Enabled:= False;
                  end
               end;
            end;
         end;
      end;
   end;
   end;
end;


//------------------------------------------------------------------------------
// Tratamento Quando Clica na DBGrid Ficha Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.DBGrid_FichaAvaliacaoEnter( Sender: TObject);
begin
   if VB_Inicio = False then
      Tratar_FA_AvaliacaoAfterScroll;
end;

//------------------------------------------------------------------------------
// Tratamento da lista de avaliacoes
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.IBQuery_FACAfterScroll(DataSet: TDataSet);
begin
{
   if  VI_IdCurso <> DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsInteger then
      VB_CorregandoFicha:= True;

   if  VI_IdTurma <> DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger then
      VB_CorregandoFicha:= True;

   if  VB_CorregandoFicha = True then
   begin
      VI_IdCurso:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsInteger;
      VI_IdTurma:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger;

      VB_CorregandoFicha:= False;
   end;
}
end;

procedure TForm_Hab_FAC.JvTransparentButton_AbrePaginaClick(Sender: TObject);
var
   buffer: String;
begin
   buffer := 'http://avalcursos.icea.interna/FA_Cursos/index.php';
   ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;


procedure TForm_Hab_FAC.JvTransparentButton_PDFClick(Sender: TObject);
begin
   JvCaptionPanel_Relatorios_PDF.Visible:= True;
end;

procedure TForm_Hab_FAC.JvTransparentButton_Fecha_PDFClick(Sender: TObject);
begin
   JvCaptionPanel_Relatorios_PDF.Visible:= True;
end;

//------------------------------------------------------------------------------
//
// Tratamento dos Relatorios
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento para imprimir a Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.ImprimiraFichadeAvaliacaoClick(Sender: TObject);
var
   VB_Retorno: Boolean;
begin
   VB_Processar:= False;

   Memo_Demo.Visible:= True;
   Memo_Demo.Lines.Clear;
   update;

   //--- Procedimento para limpar o relatorio

   Validar.ApagarTodosArquivos(VS_Dir);

   Funcoes.ExecusaoQuery('delete From FAC_Relatorio ');                         // Limpa a tabela do Relatorio

   //---- Inicia o processo para montar Relatorio

   VR_IdTopico:= 0;
   VS_Ficha_Identif:= '0';


   if ClientDataSet_FAC.FieldByName('DescCabacalho').AsString = 'EXTRATO DE CURSO - INSTRUTOR' then
   begin
      VB_RelacaoAvaliados:= True;
      VB_AlimentaMatriz:= True;

      VB_Retorno:= ExtratoCurso('100');
      Tratar_Grafico('Gráfico de Indicador de Satisfação dos Instrutores');

      if VB_RelacaoAvaliados = True then
         Tratar_RelacaoAvaliacoes;

   end
   else
   begin
      if ClientDataSet_FAC.FieldByName('DescCabacalho').AsString = 'EXTRATO DE CURSO - ALUNO' then
      begin
         VB_RelacaoAvaliados:= True;
         VB_AlimentaMatriz:= True;
         VS_Ficha_Identif:= '1';

         VB_Retorno:= ExtratoCurso_Anexo_F(ClientDataSet_FAC.FieldByName('IdFicha').AsString);
         Tratar_Grafico('Gráfico de desempenho dos instrutores observado pelos alunos');

         VB_Retorno:= ExtratoCurso_Anexo_G(ClientDataSet_FAC.FieldByName('IdAvaliacao').AsString);
         Tratar_Grafico('Gráfico de indicador de satisfação dos alunos');
      end
      else
      begin
         VB_RelacaoAvaliados:= False;
         VB_AlimentaMatriz:= False;

         VB_Retorno:= ExtratoCurso(ClientDataSet_FAC.FieldByName('IdAvaliacao').AsString);

         if VB_RelacaoAvaliados = True then
            Tratar_RelacaoAvaliacoes;
      end;
   end;

   if VB_Retorno = true then
   begin

      Tratar_Comentarios;


      Memo_Demo.Visible:= False;
      Application.CreateForm(TForm_RelatorioFichasAvaliacoes, Form_RelatorioFichasAvaliacoes);

      Form_RelatorioFichasAvaliacoes.QuickRep1.PreviewModal;
   end;
   Memo_Demo.Visible:= False;
   VB_Processar:= True;

end;

//------------------------------------------------------------------------------
// Tratamento ´para cadastrar a relaçao de avaliacoes
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Tratar_RelacaoAvaliacoes;
var
   VI_Cont: Integer;
begin
   For VI_Cont:= 1 to VI_Matriz do
      Grava_Fac(  '['+VS_Abaixo[VI_Cont]+'] '+VS_Disciplina[VI_Cont] , '', '', '', '', '', 'F', 'B');
end;

//------------------------------------------------------------------------------
// Tratamento ´para cadastrar os comentarios
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Tratar_Comentarios;
var
   VS_Tipo: String;
   VB_Cabecalho: boolean;
begin
   VB_Cabecalho:= True;
   VS_Tipo:= '';

   IBQuery_Comentario_FAC.First;
   While not IBQuery_Comentario_FAC.eof do
   begin
      if VB_Cabecalho = True then
      begin
         VB_Cabecalho:= False;

         Grava_Fac( '' , '', '', '', '', '', 'B', 'B');
         Grava_Fac( 'COMENTÁRIO' , '', '', '', '', '', 'F', 'C');
         Grava_Fac( '' , '', '', '', '', '', 'B', 'B');
      end;


      if VS_Tipo <>  trim(IBQuery_Comentario_FAC.FieldByName('Tipo').AsString) then
      begin
         VS_Tipo:= trim(IBQuery_Comentario_FAC.FieldByName('Tipo').AsString);
         Grava_Fac( trim(IBQuery_Comentario_FAC.FieldByName('Tipo').AsString) , '', '', '', '', '', 'F', 'C');
      end;

      Grava_Fac( trim(IBQuery_Comentario_FAC.FieldByName('Comentario').AsString) , '', '', '', '', '', 'C', 'B');

      IBQuery_Comentario_FAC.Next;
   end;
end;


//------------------------------------------------------------------------------
// Tratamento para montar o grafico
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Tratar_Grafico(VS_Cabecalho: String);
var
   VS_NomeArq: String;
   VI_Cont: Integer;

   Bmp : TBitmap;
   FJPEG:TJPEGImage;
begin
   if VS_Cabecalho = 'Gráfico de desempenho dos instrutores observado pelos alunos' then
      VS_NomeArq:= 'Grafico_Desempenho'
   else
      VS_NomeArq:= 'Grafico_Indicador';

   Chart_Medias.Title.Text.Clear;
   Chart_Medias.Title.Text.Add(VS_Cabecalho);

   Series1.Clear;
   For VI_Cont:= 1 to VI_Grafico do
      Series1.AddY(StrToCurrDef( FormatFloat('#0.00',VR_Grafico_Valor[VI_Cont]), 0), VS_Grafico_Descricao[VI_Cont], clRed);

   Funcoes.CriarDiretorio(VS_Dir);

   Chart_Medias.SaveToBitmapFile(VS_Dir+'\'+VS_NomeArq+'.bmp');
   BMP := TBitmap.Create;
   BMP.LoadFromFile(VS_Dir+'\'+VS_NomeArq+'.bmp');

   FJPEG := TJPEGImage.Create;
   FJPEG.Assign( Bmp );
   FJPEG.SaveToFile(VS_Dir+'\'+VS_NomeArq+'.jpeg');
   FJPEG.Free;
end;

//------------------------------------------------------------------------------
// Tratamento para gerar PDF do relatorio
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.JvTransparentButton_SolPDFClick(Sender: TObject);
var
   VS_Arquivo: String;
begin
   if not DirectoryExists(VS_DirPdf) then
       ForceDirectories(VS_DirPdf);

   VS_Arquivo:= VS_DirPdf+'\'+Edit_NomeDoArquivo.Text;

   Form_RelatorioExtratoCurso.QuickRep1.Prepare;
   ExportQR1.Report := Form_RelatorioExtratoCurso.QuickRep1;
   Form_RelatorioExtratoCurso.Free;

   ExportQR1.ExportQRPDF(VS_Arquivo, False);
   ShellExecute(Handle, nil, PChar(VS_Arquivo+'.pdf') , nil, nil, SW_SHOWNORMAL);
   JvCaptionPanel_Relatorios_PDF.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para pegar a descricao do Quesito
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Get_Quesito(VS_IdTopico: String);
begin
   if VS_IdTopico <> '' then
   begin
      Funcoes.ExecutaQuery(IBQuery_Get_Quesito, ' select topico, quesitos '+
                                                ' From FAC_Topicos '+
                                                ' Where IdFicha = '+IBQuery_Topico.FieldByName('IdFicha').AsString+
                                                ' and   IdTopico = '+VS_IdTopico
                           );
      IBQuery_Get_Quesito.First;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para analisar a resposta
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.AnalisarResposta(VI_Matriz: Integer);
begin
   if IBQuery_Topico.FieldByName('Resposta').AsInteger = 0 then
      VR_NObservado:= VR_NObservado + 1
   else
   begin
      if IBQuery_Topico.FieldByName('Resposta').AsInteger = 1 then
      begin
         VR_Abaixo:= VR_Abaixo + 1;
         VS_Abaixo[VI_Matriz]:= ' - ';
      end
      else
      begin
         if IBQuery_Topico.FieldByName('Resposta').AsInteger = 2 then
         begin
            VR_Atingiu:= VR_Atingiu + 1;
         end
         else
         begin
            if IBQuery_Topico.FieldByName('Resposta').AsInteger = 3 then
            begin
               VR_Acima:= VR_Acima + 1;
            end;
         end;
      end;
      VR_TotalRespondido:= VR_TotalRespondido + 1;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para Zerar as respostas
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Zerar_Respostas;
begin
   VR_TotalRespondido:= 0;
   VR_NObservado:= 0;
   VR_Abaixo:= 0;
   VR_Atingiu:= 0;
   VR_Acima:= 0;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do topico
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.TratarTopico(IdAvaliacao: String; VB_Processamento: Boolean);
begin

   //--- Tratamento para mostrar a ultima media

   VR_MAritimetica:= VR_MAritimetica + VR_Media;
   VR_CAritimetica:= VR_CAritimetica + 1;

   if VB_Processamento then
      if ((IdAvaliacao = '100')) then
         Grava_Fac( VS_Quesito, FloatToStr(VR_NObservado), FloatToStr(VR_Abaixo), FloatToStr(VR_Atingiu), FloatToStr(VR_Acima), VS_Media_ajust, 'N', 'X')
      else
         if ((VR_IdFicha = 13) or (VR_IdFicha = 23)) then
            Grava_Fac( VS_Quesito, '', FloatToStr(VR_NObservado), FloatToStr(VR_Abaixo), FloatToStr(VR_Atingiu), FloatToStr(VR_Acima), 'K', 'B')
         else
            Grava_Fac( VS_Quesito, FloatToStr(VR_NObservado), FloatToStr(VR_Abaixo), FloatToStr(VR_Atingiu), FloatToStr(VR_Acima), VS_Media_ajust, 'P', 'B');

   //--- Tratamento para mostrar a media

   if ( (IdAvaliacao = '100') or (VR_IdFicha <> 13) or (VR_IdFicha <> 23) ) then
   begin
      VR_Media:= Funcoes.TratarNota( VR_MAritimetica/VR_CAritimetica );
      VS_Media_ajust:= FormatFloat('#0.00', Funcoes.TratarNota(VR_Media));

      if (IdAvaliacao = '100') then
      begin
         Grava_Fac( 'MÉDIA ARITMÉTICA', '', '', '', '', VS_Media_ajust, 'M', 'C');
         Set_Grafico( VS_Topico, VR_Media);
      end
      else
      begin
         Grava_Fac( 'MÉDIA ARITMÉTICA', '', '', '', '', VS_Media_ajust, 'M', 'E');

         if ((VR_IdFicha <> 13) and (VR_IdFicha <> 23)) then
            Set_Grafico( VS_Topico, VR_Media);
      end;
   end;

end;

//------------------------------------------------------------------------------
// Tratamento do Extrato do Curso
//------------------------------------------------------------------------------

Function TForm_Hab_FAC.ExtratoCurso(IdAvaliacao: String): Boolean;
var
   VB_Retorno: Boolean;

   VS_Comando_Comentario, VS_Comando_VS_Topico, VS_IdAvaliacao, VS_IdFicha,  VS_Ficha: String;
begin
   VI_Grafico:= 0;
   VI_Matriz:= 0;
   VI_RespostaAbaixo:= 0;

   VB_Retorno:= True;

   VS_Topico:= '-1';
   VS_Quesito:= '-1';

   Zerar_Respostas;

   VR_MAritimetica:= 0;
   VR_CAritimetica:= 0;

   //---------  Levantamento do Filtro por Fica selecionada

   if IdAvaliacao = '100' then
   begin
      VS_Ficha:= '(Anexo H) FICHA DE OPINIÃO ';
      VS_IdFicha:= ' and  (FA.IdFicha = 13 or FA.IdFicha = 23)';
      VS_IdAvaliacao:= '';
   end
   else
   begin
      VS_IdFicha:= '';
      VS_IdAvaliacao:= '  and     FA.idavaliacao = '+IdAvaliacao;
   end;

   VS_Comando_VS_Topico:= ' Select FA.IdAvaliacao, FA.IdFicha, FR.IdTopico, FR.Resposta '+
                          ' From   Fac_avaliacao FA,  FAC_Resposta FR '+
                          ' Where  FA.idavaliacao = FR.idavaliacao '+
                            VS_IdAvaliacao+
                          ' and    FA.idcurso = '+ClientDataSet_FAC.FieldByName('IdCurso').AsString+
                          ' and    FA.IdTurma = '+ClientDataSet_FAC.FieldByName('IdTurma').AsString+
                            VS_IdFicha+
                          ' order By FA.IdFicha, FR.IdTopico ';

   Funcoes.ExecutaQuery(IBQuery_Topico, VS_Comando_VS_Topico );


   //------ Filtro de tratamento do Topico

   IBQuery_Topico.First;

   VS_IdTopico:= '';

   if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and ((IBQuery_Topico.FieldByName('IdFicha').AsInteger = 12) or (IBQuery_Topico.FieldByName('IdFicha').AsInteger = 22))) then
      VS_IdTopico:= ' and    FR.IdTopico <> 19 and FR.IdTopico <> 20 and FR.IdTopico <> 21 and FR.IdTopico <> 22 and FR.IdTopico <> 23 and FR.IdTopico <> 24 and FR.IdTopico <> 25 and FR.IdTopico <> 26 '
   else
      if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and ((IBQuery_Topico.FieldByName('IdFicha').AsInteger = 13) or (IBQuery_Topico.FieldByName('IdFicha').AsInteger = 23))) then
         VS_IdTopico:= ' and  FR.IdTopico <> 10 and FR.IdTopico <> 17 '
      else
         if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and ((IBQuery_Topico.FieldByName('IdFicha').AsInteger = 11) or (IBQuery_Topico.FieldByName('IdFicha').AsInteger = 21))) then
            VS_IdTopico:=  ' and    FR.IdTopico <> 5 ';


   //-- Query para levantamento dos Comentarios


   VS_Comando_Comentario:= ' Select FA.IdCurso, FA.IdTurma, FA.idavaliacao, CA.tipo, CA.Comentario '+
                           ' From FAC_AVALIACAO_VIEW FA, FAC_Comentario CA '+
                           ' Where  FA.idavaliacao = CA.idavaliacao '+
                            VS_IdAvaliacao+
                           ' and    FA.idcurso = '+ClientDataSet_FAC.FieldByName('IdCurso').AsString+
                           ' and    FA.IdTurma = '+ClientDataSet_FAC.FieldByName('IdTurma').AsString+
                           VS_IdFicha+
                          ' and    CA.Comentario <> '+#39+'.'+#39+
                ' and    CA.Comentario <> '+#39+'Não há.'+#39+
                ' and    CA.Comentario <> '+#39+'nil'+#39+
                ' and    CA.Comentario <> '+#39+'Nada a declarar.'+#39+
                ' and    CA.Comentario <> '+#39+'sem comentários.'+#39+
                ' and    CA.Comentario <> '+#39+'SEM COMENTÁRIOS.'+#39+
                ' and    CA.Comentario <> '+#39+'S/A'+#39+
                ' order by CA.idavaliacao, CA.idavaliador, CA.tipo ';


   //-- Query para levantamento da Ficha
{    Select FA.IdAvaliacao, FA.IdFicha, FR.IdTopico, FR.Resposta
                           From   Fac_avaliacao FA,  FAC_Resposta FR
                           Where  FA.idavaliacao = FR.idavaliacao
                           and     FA.idavaliacao = 4702
                           and    FA.idcurso = 165
                           and    FA.IdTurma = 9
                           and    FR.IdTopico <> 19 and FR.IdTopico <> 20 and FR.IdTopico <> 21 and FR.IdTopico <> 22 and FR.IdTopico <> 23 and FR.IdTopico <> 24 and FR.IdTopico <> 25 and FR.IdTopico <> 26
                           order By FA.IdFicha, FR.IdTopico
 }
   VS_Comando_VS_Topico:= ' Select FA.IdAvaliacao, FA.IdFicha, FR.IdTopico, FR.Resposta '+
                          ' From   Fac_avaliacao FA,  FAC_Resposta FR '+
                          ' Where  FA.idavaliacao = FR.idavaliacao '+
                            VS_IdAvaliacao+
                          ' and    FA.idcurso = '+ClientDataSet_FAC.FieldByName('IdCurso').AsString+
                          ' and    FA.IdTurma = '+ClientDataSet_FAC.FieldByName('IdTurma').AsString+
                            VS_IdTopico+
                            VS_IdFicha+
                          ' order By FA.IdFicha, FR.IdTopico ';

   Funcoes.ExecutaQuery(IBQuery_Comentario_FAC, VS_Comando_Comentario );
   Funcoes.ExecutaQuery(IBQuery_Topico, VS_Comando_VS_Topico );

   if IBQuery_Topico.FieldByName('IdTopico').AsString = '' then
   begin
      VB_Retorno:= False;
      ShowMessage('Não possuí Ficha preenchida...');
   end
   else
   begin
      IBQuery_Comentario_FAC.First;

      //---- Inicio do Processamento para montar a Ficha

      IBQuery_Topico.First;

      VR_IdFicha:= IBQuery_Topico.FieldByName('IdFicha').AsInteger;

      Get_Quesito(IBQuery_Topico.FieldByName('IdTopico').AsString);         //--- Chama o modulo para pegar o quesito

      While not IBQuery_Topico.Eof do
      begin

         VS_IdTopico:= IBQuery_Topico.FieldByName('IdTopico').AsString;

         if VS_Topico = '-1' then     //-- Tratamento do Cabecalho do Topico
         begin
            VS_Quesito:= IBQuery_Get_Quesito.FieldByName('quesitos').AsString;
            VS_Topico:= IBQuery_Get_Quesito.FieldByName('Topico').AsString;

            //---- Grava o Topico

            if (IdAvaliacao = '100')  then
            begin
               if  VS_Topico = '' then
                  Grava_Fac( VS_Topico, '', '', '', '', '', 'N', 'E')
               else
                  Grava_Fac( 'QUESITOS - '+VS_Topico, '', '', '', '', 'MÉDIA PONDERADA', 'N' , 'E');
            end
            else
            begin
               if  VS_Topico = '' then
                  Grava_Fac( VS_Topico, 'NÃO AVALIADO', 'ABAIXO DO ESPERADO', 'ATINGIU O ESPERADO', 'ACIMA DO ESPERADO', 'MÉDIA PONDERADA', 'D', 'C')
               else
                  if ((VR_IdFicha = 13) or (VR_IdFicha = 23)) then
                     Grava_Fac( 'QUESITOS - '+VS_Topico, '', 'NÃO AVALIADO', 'ABAIXO DO ESPERADO', 'ATINGIU O ESPERADO', 'ACIMA DO ESPERADO', 'K' , 'C')
                  else
                     Grava_Fac( 'QUESITOS - '+VS_Topico, 'NÃO AVALIADO', 'ABAIXO DO ESPERADO', 'ATINGIU O ESPERADO', 'ACIMA DO ESPERADO', 'MÉDIA PONDERADA', 'D' , 'C');
            end;
         end;

         if (( VR_IdFicha = IBQuery_Topico.FieldByName('IdFicha').AsInteger) and
             ( VS_Topico = IBQuery_Get_Quesito.FieldByName('Topico').AsString) and
             ( VS_Quesito = IBQuery_Get_Quesito.FieldByName('quesitos').AsString)) then
         begin
//      VS_IdTopico:= ' and    FR.IdTopico <> 19 and FR.IdTopico <> 20 and FR.IdTopico <> 21 and FR.IdTopico <> 22 and FR.IdTopico <> 23 and FR.IdTopico <> 24 and FR.IdTopico <> 25 and FR.IdTopico <> 26 '

            //if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and ( VR_IdFicha = 12 ) and
            //    ((IBQuery_Topico.FieldByName('IdTopico').AsInteger <>19 ) and (IBQuery_Topico.FieldByName('IdTopico').AsInteger = 20))) Then
            //begin
            //   IBQuery_Topico.Next;
            //   Get_Quesito(IBQuery_Topico.FieldByName('IdTopico').AsString);         //--- Chama o modulo para pegar o quesito
            //end
            //else
            //begin
            if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and (( VR_IdFicha = 13 ) or ( VR_IdFicha = 23 )) and
                ((IBQuery_Topico.FieldByName('IdTopico').AsInteger = 10) or (IBQuery_Topico.FieldByName('IdTopico').AsInteger = 17))) Then
            begin
               IBQuery_Topico.Next;
               Get_Quesito(IBQuery_Topico.FieldByName('IdTopico').AsString);         //--- Chama o modulo para pegar o quesito
            end
            else
            begin
               if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and (( VR_IdFicha = 11 ) or ( VR_IdFicha = 21 )) and
                   (IBQuery_Topico.FieldByName('IdTopico').AsInteger = 5)) Then
               begin
                  IBQuery_Topico.Next;
                  Get_Quesito(IBQuery_Topico.FieldByName('IdTopico').AsString);         //--- Chama o modulo para pegar o quesito
               end
               else
               begin
                 if VB_AlimentaMatriz = True then
                 begin
                    VI_Matriz:= VI_Matriz + 1;
                    AlimentaRelacaoDeAvaliados(IBQuery_Topico.FieldByName('IdAvaliacao').AsString, VS_Ficha, VI_Matriz);
                 end;

                 VI_RespostaAbaixo:= VI_RespostaAbaixo + 1;
                 AnalisarResposta(VI_RespostaAbaixo);
                 IBQuery_Topico.Next;
                 Get_Quesito(IBQuery_Topico.FieldByName('IdTopico').AsString);         //--- Chama o modulo para pegar o quesito
              end;
            end;
            //end;
         end
         else
         begin
            TratarMedia(IdAvaliacao);
          end;
      end;

      TratarMedia(IdAvaliacao);
      TratarTopico(IdAvaliacao, False);

      if (IdAvaliacao = '100')  then
      begin
         VR_Media:= Funcoes.TratarNota( VR_MAritimetica/VR_CAritimetica );
         VS_Media_ajust:= FormatFloat('#0.00', VR_Media);
      end
      else
      begin
         if ((VR_IdFicha <> 13) and (VR_IdFicha <> 23)) then
         begin
            VR_Media:= Funcoes.TratarNota( VR_MAritimetica/VR_CAritimetica );
            VS_Media_ajust:= FormatFloat('#0.00', VR_Media);
         end;
      end;
   end;

   ExtratoCurso:=  VB_Retorno;
end;



//------------------------------------------------------------------------------
// Procedure para Tratar Media
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.TratarMedia(IdAvaliacao: String);
begin
   VB_AlimentaMatriz:= False;

   VR_Tot_NObservado:= VR_Tot_NObservado+ VR_NObservado;
   VR_Tot_Abaixo:= VR_Tot_Abaixo + VR_Abaixo;
   VR_Tot_Atingiu:= VR_Tot_Atingiu + VR_Atingiu;
   VR_Tot_Acima:= VR_Tot_Acima + VR_Acima;

   if VR_TotalRespondido = 0 then
   begin
      VS_Media_ajust:= '0,00';
      VR_Media:= 0;
   end
   else
   begin
      VR_Media:= Funcoes.TratarNota( ((VR_Abaixo) + (VR_Atingiu * 2) + (VR_Acima * 3))/VR_TotalRespondido );
      VS_Media_ajust:= FormatFloat('#0.00', VR_Media);
   end;

   //--- Tratamento para o cadastro da Media por topico

   if VS_Topico <> IBQuery_Get_Quesito.FieldByName('Topico').AsString then   //-- Grava a Media Aritimetica
   begin
      TratarTopico(IdAvaliacao, True);
      Zerar_Respostas;

      VR_MAritimetica:= 0;
      VR_CAritimetica:= 0;
      VS_Topico:= '-1';

      VB_AlimentaMatriz:= False;
      VI_RespostaAbaixo:= 0;
   end
   else   // aqui
   begin
      //---- Grava o Topico
      VR_MAritimetica:= VR_MAritimetica + VR_Media;
      VR_CAritimetica:= VR_CAritimetica + 1;

      if (IdAvaliacao = '100') then
         Grava_Fac( VS_Quesito, FloatToStr(VR_NObservado), FloatToStr(VR_Abaixo), FloatToStr(VR_Atingiu), FloatToStr(VR_Acima), VS_Media_ajust, 'N', 'B')
      else
         if ((VR_IdFicha <> 13) and (VR_IdFicha <> 23)) then
            Grava_Fac( VS_Quesito, FloatToStr(VR_NObservado), FloatToStr(VR_Abaixo), FloatToStr(VR_Atingiu), FloatToStr(VR_Acima),VS_Media_ajust, 'K', 'B')
         else
            Grava_Fac( VS_Quesito, FloatToStr(VR_NObservado), FloatToStr(VR_Abaixo), FloatToStr(VR_Atingiu), FloatToStr(VR_Acima), VS_Media_ajust, 'P', 'B');   // N, B

         VS_Quesito:= IBQuery_Get_Quesito.FieldByName('quesitos').AsString;
         VR_IdFicha:= IBQuery_Topico.FieldByName('IdFicha').AsInteger;
         VS_IdTopico:= IBQuery_Topico.FieldByName('IdTopico').AsString;

         Zerar_Respostas;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Grafico
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Set_Grafico( VS_Descricao: String; VR_Media: Real );
var
   VB_MontarGrafico: Boolean;
begin
   VB_MontarGrafico:= True;

   if trim(VS_Descricao) = 'MATERIAL DIDÁTICO' then
      VB_MontarGrafico:= True;

   if trim(VS_Descricao) = 'ICEA VIRTUAL - EAD' then
      if  DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString = 'Presencial' then
         VB_MontarGrafico:= False
      else
        VS_Descricao:= 'EAD';

   if  VB_MontarGrafico = True then
   begin
      VI_Grafico:= VI_Grafico + 1;
      VS_Grafico_Descricao[VI_Grafico]:= trim(VS_Descricao);
      VR_Grafico_Valor[VI_Grafico]:= VR_Media;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do topico - Alunos Anexo F
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.TratarTopico_Anexo_F(IdAvaliacao: String);
begin
   Get_Quesito(VS_IdTopico);         //--- Chama o modulo para pegar o quesito
   VS_Quesito:= IBQuery_Get_Quesito.FieldByName('quesitos').AsString;

   VR_Media:= Funcoes.TratarNota( VR_MAritimetica/VR_CAritimetica );
   VS_Media_ajust:= FormatFloat('#0.00', VR_Media);
end;


//------------------------------------------------------------------------------
// Tratamento do Extrato do Curso - Alunos Anexo F
//------------------------------------------------------------------------------

Function TForm_Hab_FAC.ExtratoCurso_Anexo_F(IdAvaliacao: String): Boolean;
var
   VB_Retorno: Boolean;
   VI_RespostaAbaixo, VI_Disciplina, VI_Id_Instrutor: Integer;

   VS_Comando, VS_Avaliacao, VS_Instrutor: String;
begin
   VI_Grafico:= 0;
   VI_Matriz:= 0;
   VI_Id_Instrutor:= 0;
   VB_Retorno:= True;

   //--- Tratamento para pegar os topico do anexo F

//   VS_Comando:= 'select IdTopico, Quesitos '+
//                ' From fac_topicos '+
//                ' where (idficha = 11 or idficha = 21) '+
//                ' order by IdTopico ';

   VS_Comando:= 'select IdTopico, Quesitos '+
                ' From fac_topicos '+
                ' where idficha = 21 '+
                ' order by IdTopico ';

   Funcoes.ExecutaQuery( DM.IBQuery_Executa, VS_Comando );
   DM.IBQuery_Executa.First;

   Grava_Fac( 'QUESITOS DO ANEXO "F"' , '', '', '', '', '', 'F', 'C');
   While not DM.IBQuery_Executa.Eof do
   begin
      if (( DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and (DM.IBQuery_Executa.FieldByName('IdTopico').AsInteger = 5 )) Then
      begin
         DM.IBQuery_Executa.Next;
      end
      else
      begin
         Grava_Fac( DM.IBQuery_Executa.FieldByName('Quesitos').AsString , '', '', '', '', '', 'A', 'B');
         DM.IBQuery_Executa.Next;
      end;
   end;

   //--- Tratamento para pegar a relação de Instrutores Avaliados

   Grava_Fac( 'DESEMPENHO DOS INSTRUTORES' , '', '', '', '', 'MÉDIA ARITMÉTICA', 'F', 'C');

   VS_Comando:='select a.idCurso, a.IdTurma, a.IdFicha, b.IdAvaliacao, b.Identidade, b.Disciplina '+
               ' From FAC_Avaliacao a, FAC_Avaliado b '+
               ' where a.IdAvaliacao = b.IdAvaliacao  '+
               ' and   a.idcurso = '+ClientDataSet_FAC.FieldByName('IdCurso').AsString+
               ' and   a.IdTurma = '+ClientDataSet_FAC.FieldByName('IdTurma').AsString+
               ' and   (a.IdFicha = 11 or a.IdFicha = 21)';

   Funcoes.ExecutaQuery(IBQuery_Relacao_Instrutores_FAC, VS_Comando );

   IBQuery_Relacao_Instrutores_FAC.First;
   While not IBQuery_Relacao_Instrutores_FAC.Eof do
   begin
      //--- Query para pegar os dados do instrutor

      VS_Comando:= 'Select nomeguerra, postograduacao '+
                   ' From Pessoa '+
                   ' Where identidade = '+#39+IBQuery_Relacao_Instrutores_FAC.FieldByName('Identidade').AsString+#39;

      Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando );
      VI_Id_Instrutor:= VI_Id_Instrutor+1;
      VS_Instrutor:= FormatFloat('000', VI_Id_Instrutor)+' - '+Trim(DM.IBQuery_Executa.FieldByName('postograduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('nomeguerra').AsString);
      VS_Avaliacao:=  VS_Instrutor+' - '+Trim(IBQuery_Relacao_Instrutores_FAC.FieldByName('Disciplina').AsString);

      VI_Disciplina:= 1;
      VS_Topico:= '-1';
      VS_Quesito:= '-1';

      Zerar_Respostas;

      VR_MAritimetica:= 0;
      VR_CAritimetica:= 0;


      //-- Query para levantamento da Ficha

      if (DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') then
      begin
         VS_Comando:= ' Select FA.IdAvaliacao, FA.IdFicha, FR.IdTopico, FR.Resposta '+
                      ' From   Fac_avaliacao FA,  FAC_Resposta FR '+
                      ' Where  FA.idavaliacao = FR.idavaliacao '+
                      ' and    FR.IdTopico <> 5 '+
                      ' and    FR.IdTopico <> 15 '+
                      ' and    FR.IdTopico <> 25 '+
                      ' and    FA.idavaliacao = '+IBQuery_Relacao_Instrutores_FAC.FieldByName('IdAvaliacao').AsString+
                      ' order By FA.IdFicha, FR.IdTopico ';
      end
      else
      begin
         VS_Comando:= ' Select FA.IdAvaliacao, FA.IdFicha, FR.IdTopico, FR.Resposta '+
                      ' From   Fac_avaliacao FA,  FAC_Resposta FR '+
                      ' Where  FA.idavaliacao = FR.idavaliacao '+
                      ' and    FA.idavaliacao = '+IBQuery_Relacao_Instrutores_FAC.FieldByName('IdAvaliacao').AsString+
                      ' order By FA.IdFicha, FR.IdTopico ';
      end;

      Funcoes.ExecutaQuery(IBQuery_Topico, VS_Comando );


      if IBQuery_Topico.FieldByName('IdTopico').AsString = '' then
      begin
         Grava_Fac( VS_Avaliacao+' - Não possuí Ficha avaliada...' , '', '', '', '', '', 'F', 'C')
      end
      else
      begin
         IBQuery_Topico.First;

         VR_IdFicha:= IBQuery_Topico.FieldByName('IdFicha').AsInteger;

         Get_Quesito(IBQuery_Topico.FieldByName('IdTopico').AsString);         //--- Chama o modulo para pegar o quesito

         While not IBQuery_Topico.Eof do
         begin
            VS_IdTopico:= IBQuery_Topico.FieldByName('IdTopico').AsString;

            if VS_Topico = '-1' then     //-- Tratamento do Cabecalho do Topico
            begin
               VS_Quesito:= IBQuery_Get_Quesito.FieldByName('quesitos').AsString;
               VS_Topico:= IBQuery_Get_Quesito.FieldByName('Topico').AsString;

               VS_Avaliacao:= VS_Avaliacao+' Nº'+IntToStr(VI_Disciplina);     //+++
            end;

            if (( VR_IdFicha = IBQuery_Topico.FieldByName('IdFicha').AsInteger) and
                ( VS_Topico = IBQuery_Get_Quesito.FieldByName('Topico').AsString) and
                ( VS_Quesito = IBQuery_Get_Quesito.FieldByName('quesitos').AsString)) then
            begin
               VI_RespostaAbaixo:= VI_RespostaAbaixo + 1;
               AnalisarResposta(VI_RespostaAbaixo);
               IBQuery_Topico.Next;
               Get_Quesito(IBQuery_Topico.FieldByName('IdTopico').AsString);         //--- Chama o modulo para pegar o quesito
            end
            else
            begin
               VR_Tot_NObservado:= VR_Tot_NObservado+ VR_NObservado;
               VR_Tot_Abaixo:= VR_Tot_Abaixo + VR_Abaixo;
               VR_Tot_Atingiu:= VR_Tot_Atingiu + VR_Atingiu;
               VR_Tot_Acima:= VR_Tot_Acima + VR_Acima;

               if VR_TotalRespondido = 0 then
               begin
                   VS_Media_ajust:= '0,00';
                   VR_Media:= 0;
               end
               else
               begin
                  if ((DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString <> 'EAD') and (( VR_IdFicha = 11 ) or ( VR_IdFicha = 21 )) and
                      ((IBQuery_Topico.FieldByName('IdTopico').AsInteger = 6) )) Then
                  begin
                     VI_Disciplina:= VI_Disciplina + 1;
                  end;

                  VR_Media:=  Funcoes.TratarNota( ((VR_Abaixo) + (VR_Atingiu * 2) + (VR_Acima * 3))/VR_TotalRespondido );
                  VS_Media_ajust:= FormatFloat('#0.00', VR_Media);

                  VI_Disciplina:= VI_Disciplina + 1;
                  VS_Avaliacao:= VS_Avaliacao+' [ '+VS_Media_ajust+' ] - Nº'+IntToStr(VI_Disciplina);
               end;

               //--- Tratamento para o cadastro da Media por topico

               if VS_Topico <> IBQuery_Get_Quesito.FieldByName('Topico').AsString then   //-- Grava a Media Aritimetica
               begin
                  Get_Quesito(VS_IdTopico);         //--- Chama o modulo para pegar o quesito
                  VS_Quesito:= IBQuery_Get_Quesito.FieldByName('quesitos').AsString;

                  VR_Media:= Funcoes.TratarNota( VR_MAritimetica/VR_CAritimetica );
                  VS_Media_ajust:= FormatFloat('#0.00', VR_Media);

                  VI_Disciplina:= VI_Disciplina + 1;

                  VS_Avaliacao:= VS_Avaliacao+' - MÉDIA ARITMÉTICA ['+VS_Media_ajust+' ]';     //+++

                  //--- Tratamento do Grafico

                  Set_Grafico( VS_Topico, VR_Media);

                  Zerar_Respostas;

                  VR_MAritimetica:= 0;
                  VR_CAritimetica:= 0;
                  VS_Topico:= '-1';

                  VB_AlimentaMatriz:= False;
                  VI_RespostaAbaixo:= 0;
                end
                else   // aqui
                begin
                   //---- Grava o Topico

                  VR_MAritimetica:= VR_MAritimetica + VR_Media;
                  VR_CAritimetica:= VR_CAritimetica + 1;

                  VS_Quesito:= IBQuery_Get_Quesito.FieldByName('quesitos').AsString;

                  VR_IdFicha:= IBQuery_Topico.FieldByName('IdFicha').AsInteger;
                  VS_IdTopico:= IBQuery_Topico.FieldByName('IdTopico').AsString;

                  Zerar_Respostas;
               end;
//               end;
            end;
        end;

        VR_MAritimetica:= VR_MAritimetica + VR_Media;
        VR_CAritimetica:= VR_CAritimetica + 1;

        VR_Media:= Funcoes.TratarNota( ((VR_Abaixo) + (VR_Atingiu * 2) + (VR_Acima * 3))/VR_TotalRespondido );
        VS_Media_ajust:= FormatFloat('#0.00', VR_Media);
        VS_Avaliacao:= VS_Avaliacao+' [ '+VS_Media_ajust+' ]';

         TratarTopico_Anexo_F(IdAvaliacao);

          //---- Grava o Topico

         VS_Avaliacao:= VS_Avaliacao+' -   MÉDIA ARITMÉTICA [ '+VS_Media_ajust+' ]';

         Grava_Fac( VS_Avaliacao , '', '', '', '', '', 'F', 'B');  

         Set_Grafico( FormatFloat('000', VI_Id_Instrutor), VR_Media);       //--- Tratamento do Grafico

      end;

      IBQuery_Relacao_Instrutores_FAC.Next;
   end;

   ExtratoCurso_Anexo_F:=  VB_Retorno;
end;


//------------------------------------------------------------------------------
// Tratamento do Extrato do Curso - Alunos Anexo G
//------------------------------------------------------------------------------

Function TForm_Hab_FAC.ExtratoCurso_Anexo_G(IdAvaliacao: String): Boolean;
var
   VB_Retorno: Boolean;

   VS_Comando: String;
begin
   VI_Grafico:= 0;
   VI_Matriz:= 0;

   VS_Topico:= '-1';
   VS_Quesito:= '-1';

   Zerar_Respostas;

   VR_MAritimetica:= 0;
   VR_CAritimetica:= 0;

   //-- Query para levantamento dos comentarios

   VS_Comando:= ' Select FA.IdCurso, FA.IdTurma, FA.idavaliacao, CA.tipo, CA.Comentario '+
                ' From FAC_AVALIACAO_VIEW FA, FAC_Comentario CA '+
                ' Where  FA.idavaliacao = CA.idavaliacao '+
                ' and    FA.idcurso = '+ClientDataSet_FAC.FieldByName('IdCurso').AsString+
                ' and    FA.IdTurma = '+ClientDataSet_FAC.FieldByName('IdTurma').AsString+
                ' and    (FA.IdFicha = 12 or FA.IdFicha = 22) '+
                ' and    CA.Comentario <> '+#39+'.'+#39+
                ' and    CA.Comentario <> '+#39+'Não há.'+#39+
                ' and    CA.Comentario <> '+#39+'nil'+#39+
                ' and    CA.Comentario <> '+#39+'Nada a declarar.'+#39+
                ' and    CA.Comentario <> '+#39+'sem comentários.'+#39+
                ' and    CA.Comentario <> '+#39+'SEM COMENTÁRIOS.'+#39+
                ' and    CA.Comentario <> '+#39+'S/A'+#39+
                ' order by CA.idavaliacao, CA.idavaliador, CA.tipo ';

   Funcoes.ExecutaQuery(IBQuery_Comentario_FAC, VS_Comando );

   //--- Tratamento para pegar a relação de Instrutores Avaliados

   Grava_Fac( '' , '', '', '', '', '', 'B', 'B');
   Grava_Fac( 'QUESITOS DO ANEXO "G"' , '', '', '', '', '', 'F', 'C');
   Grava_Fac( '' , '', '', '', '', '', 'B', 'B');

   VS_Comando:=' select distinct a.IdFicha, a.idAvaliacao '+
               ' From fac_avaliacao a, fac_resposta r '+
               ' Where a.IdCurso = '+ClientDataSet_FAC.FieldByName('IdCurso').AsString+
               ' and   a.IdTurma = '+ClientDataSet_FAC.FieldByName('IdTurma').AsString+
               ' and   (a.IdFicha = 12 or a.IdFicha = 22) '+
               ' and   a.idAvaliacao = r.idAvaliacao ';

   Funcoes.ExecutaQuery(IBQuery_Relacao_Instrutores_FAC, VS_Comando );

   IBQuery_Relacao_Instrutores_FAC.First;
   While not IBQuery_Relacao_Instrutores_FAC.Eof do
   begin
      VB_Retorno:= ExtratoCurso(IBQuery_Relacao_Instrutores_FAC.FieldByName('IdAvaliacao').AsString);

      IBQuery_Relacao_Instrutores_FAC.Next;
   end;

   ExtratoCurso_Anexo_G:=  True
end;


//------------------------------------------------------------------------------
// Tratamento para gravar a relação de disciplinas e instrutores avaliados
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.AlimentaRelacaoDeAvaliados(PS_IdAvaliacao, PS_Ficha: String; VI_Matriz: Integer);
var
   VS_Comando, VS_Ficha: String;
begin
   //--- Pega a instrutor

   VS_Comando:= ' select A.IdAvaliacao, P.Identidade, P.PostoGraduacao, P.NomeGuerra  '+
                ' From Pessoa P, FAC_Avaliado A '+
                ' where A.Identidade = p.identidade '+
                ' and A.IdAvaliacao = '+PS_IdAvaliacao;

   Funcoes.ExecutaQuery( DM.IBQuery_Executa, VS_Comando );
   VS_Ficha:= PS_Ficha+ ' - INSTRUTOR - '+trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString);

   //--- Pega a instrutor Disciplina

   VS_Comando:= 'Select FA.IdAvaliacao, MC.CodMateria, MC.NomeMateria '+
                ' From Fac_avaliado FA, MateriaCurso MC '+
                ' Where FA.Disciplina = MC.CodMateria '+
                ' and   FA.IdAvaliacao = '+PS_IdAvaliacao;

   Funcoes.ExecutaQuery( DM.IBQuery_Executa, VS_Comando );
   VS_Ficha:= VS_Ficha+' - '+DM.IBQuery_Executa.FieldByName('CodMateria').AsString+' - '+DM.IBQuery_Executa.FieldByName('NomeMateria').AsString;

   VS_Disciplina[VI_Matriz]:= VS_Ficha;
   VS_Abaixo[VI_Matriz]:= ' + ';
end;

//------------------------------------------------------------------------------
// Tratamento para gravar a FAC
//------------------------------------------------------------------------------

procedure TForm_Hab_FAC.Grava_Fac( VS_Topico, VS_NObservado, VS_Abaixo, VS_Atingiu, VS_Acima, VS_Media_ajust, VS_Comentario, VS_Destaque: String);
begin
   if ((( VR_IdFicha = 13 ) or (VR_IdFicha = 23)) and
       ((VS_Topico = '6- Ambiente Virtual de Aprendizagem - AVA.') or
        (VS_Topico = '6- Utilizei a interface disponível (fórum) para promover uma comunicação interativa e colaborativa.'))) Then
   begin
      //
   end
   else
   begin

      VR_IdTopico:= VR_IdTopico+1;

      DM.IBTable_Relatorio_FAC.Append;
      DM.IBTable_Relatorio_FAC.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
      DM.IBTable_Relatorio_FAC.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      DM.IBTable_Relatorio_FAC.FieldByName('IdFicha').AsString:= VS_Ficha_Identif;
      DM.IBTable_Relatorio_FAC.FieldByName('IdTopico').AsFloat:= VR_IdTopico;

      if VS_Topico = 'QUESITOS - AVA' then
         DM.IBTable_Relatorio_FAC.FieldByName('Topico').AsString:= 'QUESITOS - AMBIENTE VIRTUAL DE APRENDIZAGEM'
      else
         if VS_Topico = 'AVA' then
            DM.IBTable_Relatorio_FAC.FieldByName('Topico').AsString:= 'AMBIENTE VIRTUAL DE APRENDIZAGEM'
         else
            DM.IBTable_Relatorio_FAC.FieldByName('Topico').AsString:= VS_Topico;

      DM.IBTable_Relatorio_FAC.FieldByName('NOBSERVADO').AsString:= VS_NObservado;
      DM.IBTable_Relatorio_FAC.FieldByName('Abaixo').AsString:= VS_Abaixo;
      DM.IBTable_Relatorio_FAC.FieldByName('Atingiu').AsString:= VS_Atingiu;
      DM.IBTable_Relatorio_FAC.FieldByName('Acima').AsString:= VS_Acima;
      DM.IBTable_Relatorio_FAC.FieldByName('Media').AsString:= VS_Media_ajust;
      DM.IBTable_Relatorio_FAC.FieldByName('Comentario').AsString:= VS_Comentario;
      DM.IBTable_Relatorio_FAC.FieldByName('Destaque').AsString:= VS_Destaque;
      DM.IBTable_Relatorio_FAC.Post;
      Funcoes.ExecutaTransacao;

      Memo_Demo.Lines.Add(VS_Topico);
      update;
   end;
end;

procedure TForm_Hab_FAC.JvTransparentButton_Comentarios_FacClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cad_FAC_Comentario, Form_Cad_FAC_Comentario);
   Form_Cad_FAC_Comentario.Show;
end;


procedure TForm_Hab_FAC.DBGrid_FichaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if VB_Processar = True then
   begin
     DBGrid_FichaAvaliacao.Canvas.Brush.Color:= clCream;
     if (( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger >= 0) and
         ( IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsInteger <= 5)) then
        DBGrid_Ficha.Canvas.Font.Color:= clRed
     else
        DBGrid_Ficha.Canvas.Font.Color:= clBlue;

     if gdSelected in State then
        DBGrid_Ficha.Canvas.Brush.Color := clSkyBlue;

     DBGrid_Ficha.Canvas.FillRect(Rect);
     DBGrid_Ficha.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

end.

