//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Habilita_FichaAvaliacao.PAS                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da          //
//                             Habilitacao da Avaliaçao de Curso.             //
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

unit Habilita_FichaAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus,  ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvTransBtn,
  JvLookOut, TeEngine, Series, TeeProcs, Chart, OleCtrls, SHDocVw, DBClient, FichaAvalicaoCurso,
  Rotinas_Tratar_Providencia,Rotinas_Validar, Rotinas, Rotinas_SUE,
  IWControl, IWCompMemo;

type
  TForm_Hab_FichaAvaliacao = class(TForm)
    DSQ_InstrutorTurma: TDataSource;
    Query_InstrutorTurma: TIBQuery;
    Query_InstrutorTurmaIDCURSO: TSmallintField;
    Query_InstrutorTurmaIDTURMA: TIntegerField;
    Query_InstrutorTurmaIDENTIDADE: TIBStringField;
    Query_InstrutorTurmaPOSTOGRADUACAO: TIBStringField;
    DSQ_FichaAvaliacao: TDataSource;
    IBTable_FichaAvaliacao: TIBTable;
    DST_FichaAvaliacao: TDataSource;
    IBQuery_Modelo: TIBQuery;
    DSQ_Modelo: TDataSource;
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
    IBQuery_ModeloIDFICHA: TSmallintField;
    IBQuery_ModeloMODELO: TIBStringField;
    IBQuery_ModeloCABECALHO: TIBStringField;
    IBQuery_ModeloINSTRUCAO: TIBStringField;
    IBQuery_RelacaoAlunos: TIBQuery;
    DSQ_RelacaoAlunos: TDataSource;
    IBTable_FA_Relacao: TIBTable;
    DataSource1: TDataSource;
    IBTable_FA_RelacaoIDCURSO: TSmallintField;
    IBTable_FA_RelacaoIDTURMA: TIntegerField;
    IBTable_FA_RelacaoIDFICHA: TSmallintField;
    IBTable_FA_RelacaoIDENTIDADE: TIBStringField;
    IBTable_FA_RelacaoDISCIPLINA: TIBStringField;
    IBTable_FA_RelacaoIDALUNO: TIBStringField;
    IBTable_FA_RelacaoRESPONDEU: TIBStringField;
    IBQuery_FARelacaoAlunos: TIBQuery;
    DSQ_FARelacaoAlunos: TDataSource;
    IBQuery_CoordenadorTurma: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    DSQ_CoordenadorTurma: TDataSource;
    DST_Coordenador: TDataSource;
    IBQuery_FARelacaoAlunosCODIGOALUNO: TIntegerField;
    IBQuery_FARelacaoAlunosRESPONDEU: TIBStringField;
    PopupMenu_Relatorios: TPopupMenu;
    RelacaodeAlunoscomCodigo: TMenuItem;
    RelaodeInstrutorescomCdigo1: TMenuItem;
    IBQuery_FARelacaoAlunosNOMEGUERRA: TIBStringField;
    IBQuery_FA_Usuario: TIBQuery;
    DSQ_FA_Usuario: TDataSource;
    IBQuery_Pessoa: TIBQuery;
    IBQuery_PessoaPOSTOGRADUACAO: TIBStringField;
    IBQuery_PessoaNOMEGUERRA: TIBStringField;
    Query_InstrutorTurmaNOMEGUERRA: TIBStringField;
    IBQuery_CoordenadorTurmaNOMEGUERRA: TIBStringField;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoIDFICHA: TSmallintField;
    IBTable_FichaAvaliacaoIDENTIDADE: TIBStringField;
    IBTable_FichaAvaliacaoDISCIPLINA: TIBStringField;
    IBTable_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;
    IBTable_FichaAvaliacaoDISPONIVEL: TIBStringField;
    IBTable_FichaAvaliacaoIDCOORDENADOR: TIBStringField;
    IBTable_FichaAvaliacaoIDAVL_ICEA: TIBStringField;
    IBTable_FichaAvaliacaoSTATUS: TIBStringField;
    IBTable_FichaAvaliacaoMEDIA: TIBStringField;
    Panel_TratarFicha: TPanel;
    GroupBox_Ficha: TGroupBox;
    Label_Msg01: TLabel;
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
    JvGradient1: TJvGradient;
    JvShape_EncerrarProva: TJvShape;
    JvTransparentButton_RelatoriosImprimir: TJvTransparentButton;
    JvShape_Atualizar: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape_retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel_Frame_SelCurso: TPanel;
    ProgressBar_Fichas: TProgressBar;
    N1: TMenuItem;
    ImprimiraFichadeAvaliacao: TMenuItem;
    IBQuery_FichaAvaliacao: TIBQuery;
    IBQuery_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FichaAvaliacaoIDFICHA: TSmallintField;
    IBQuery_FichaAvaliacaoIDENTIDADE: TIBStringField;
    IBQuery_FichaAvaliacaoDISCIPLINA: TIBStringField;
    IBQuery_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;
    IBQuery_FichaAvaliacaoDISPONIVEL: TIBStringField;
    IBQuery_FichaAvaliacaoIDCOORDENADOR: TIBStringField;
    IBQuery_FichaAvaliacaoIDAVL_ICEA: TIBStringField;
    IBQuery_FichaAvaliacaoCABECALHO: TIBStringField;
    IBQuery_FichaAvaliacaoSTATUS: TIBStringField;
    IBQuery_FichaAvaliacaoMEDIA: TIBStringField;
    Label_Completa: TLabel;
    Label3: TLabel;
    IBQuery_Topicos: TIBQuery;
    IBQuery_Avaliado: TIBQuery;
    IBQuery_Itens: TIBQuery;
    IBQuery_Complemento01: TIBQuery;
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
    ClientDataSet_FA_Avaliacao: TClientDataSet;
    ClientDataSet_FA_AvaliacaoIdCurso: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdTurma: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdFicha: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdentidade: TStringField;
    ClientDataSet_FA_AvaliacaoDisciplina: TStringField;
    ClientDataSet_FA_AvaliacaoIdAVL_ICEA: TStringField;
    ClientDataSet_FA_AvaliacaoDataAvaliacao: TStringField;
    ClientDataSet_FA_AvaliacaoDisponivel: TStringField;
    ClientDataSet_FA_AvaliacaoCabecalho: TStringField;
    ClientDataSet_FA_AvaliacaoDesc_Cabecalho: TStringField;
    ClientDataSet_FA_AvaliacaoIdCoordenador: TStringField;
    ClientDataSet_FA_AvaliacaoStatus: TStringField;
    ClientDataSet_FA_AvaliacaoMedia: TStringField;
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
    DSQ_BuscaProvidencia: TDataSource;
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
    PopupMenu_Opcoes: TPopupMenu;
    Colar: TMenuItem;
    PopupMenu1: TPopupMenu;
    Copiar1: TMenuItem;
    ImlLarge: TImageList;
    ImlSmall: TImageList;
    Panel_TratarOpcoes: TPanel;
    Panel_Ficha_Avaliacao: TPanel;
    Panel_Cadastro: TPanel;
    Panel_CadFichaAvl: TPanel;
    JvCaptionPanel_MontaFichaAvaliacao: TJvCaptionPanel;
    Panel_Editar: TPanel;
    Label2: TLabel;
    Label_FichaJaAvaliada: TLabel;
    Label_QtdAvl: TLabel;
    Label_Especialidade: TLabel;
    Label_QtdEsp: TLabel;
    JvDBDateEdit_DataAvaliacao: TJvDBDateEdit;
    DBComboBox_Disponivel: TDBComboBox;
    ComboBox_QtdAvaliacoes: TComboBox;
    ComboBox_Especialidade: TComboBox;
    Panel_Amostra: TPanel;
    Panel_Instrutor: TPanel;
    Label_Instrutor: TLabel;
    DBEdit_NOmeGuerra: TDBEdit;
    DBEdit_PostoGraduacao: TDBEdit;
    Panel_Disciplina: TPanel;
    Label_Disciplina: TLabel;
    DBEdit_Disciplina: TDBEdit;
    DBEdit_NomeDisciplina: TDBEdit;
    Panel_Coordenador: TPanel;
    Label_Pessoa: TLabel;
    DBEdit1: TDBEdit;
    DBEdit_Coordenador: TDBEdit;
    Panel_RelacaoAlunos: TPanel;
    Label_Msg02: TLabel;
    DBGrid_FA_Relacao: TDBGrid;
    Panel_BotoesProva: TPanel;
    JvGradient4: TJvGradient;
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
    JvCaptionPanel_Avaliacao: TJvCaptionPanel;
    DBGrid_Avaliacao: TDBGrid;
    JvCaptionPanel_Disciplina: TJvCaptionPanel;
    Panel4: TPanel;
    MaskEdit_Materia: TMaskEdit;
    MaskEdit_DescricaoDis: TMaskEdit;
    DBGrid_SelMateria: TDBGrid;
    JvCaptionPanel_Coordenador: TJvCaptionPanel;
    DBGrid_Coordenador: TDBGrid;
    JvCaptionPanel_Instrutor: TJvCaptionPanel;
    DBGrid_SelIntrutor: TDBGrid;
    Panel_AbaFichaAvaliacao: TPanel;
    JvGradient3: TJvGradient;
    JvTransparentButton_CadastroFichaAvaliacao: TJvTransparentButton;
    JvTransparentButton_FichaAvaliacao: TJvTransparentButton;
    Panel_AmostraFichaAvaliacao: TPanel;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_Imprimir_FichaAvl: TJvTransparentButton;
    CheckBox_Valores: TCheckBox;
    CheckBox_Grafico: TCheckBox;
    CheckBox_Msg: TCheckBox;
    ProgressBar_MontaFicha: TProgressBar;
    WebBrowser_Providencia: TWebBrowser;
    Chart_Grafico: TChart;
    BarSeries_Grafico: TBarSeries;

Function TratarStatus(IdCurso, IdTurma, IdFicha, Identidade, CodDisciplina, Cabecalho: string): Integer;

    procedure Tratar_FA_AvaliacaoAfterScroll;
    procedure CadastrarFichaNova;
    procedure Grava_FA_Relacao(PS_IdAluno, PS_Disciplina, PS_Identidade: String);
    procedure DesabilitaCaixaSelecao;
    procedure SelecionaFicha(Sender: TObject);

    Procedure Containers(Status: Boolean);
    procedure FormActivate(Sender: TObject);

    procedure Campos_Ficha(Status: Boolean);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox_QtdAvaliacoesKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_FichaCellClick(Column: TColumn);
    procedure IBTable_FichaAvaliacaoPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure RelacaodeAlunoscomCodigoClick(Sender: TObject);
    procedure RelaodeInstrutorescomCdigo1Click(Sender: TObject);
    procedure DBGrid_AvaliacaoCellClick(Column: TColumn);
    procedure DBGrid_SelIntrutorCellClick(Column: TColumn);
    procedure ComboBox_EspecialidadeChange(Sender: TObject);
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
    procedure CheckBox_GraficoClick(Sender: TObject);
    procedure ImprimiraFichadeAvaliacaoClick(Sender: TObject);
    procedure ClientDataSet_FA_AvaliacaoAfterScroll(DataSet: TDataSet);
    procedure DBGrid_FichaAvaliacaoEnter(Sender: TObject);
    procedure JvTransparentButton_FichaAvaliacaoClick(Sender: TObject);
    procedure JvTransparentButton_CadastroFichaAvaliacaoClick( Sender: TObject);
    procedure IBQuery_FichaAvaliacaoAfterScroll(DataSet: TDataSet);

  private    { Private declarations }
     VS_MsgAvaliador, VS_Operacao: String;
     VB_CorregandoFicha: Boolean;
     VI_IdCurso, VI_IdTurma: Integer;
  public    { Public declarations }
  end;
var
  Form_Hab_FichaAvaliacao: TForm_Hab_FichaAvaliacao;

implementation

uses Module, Frame_Sel_Curso, Rel_RelatorioDoCadastroDeAlunosComCodigo;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.FormActivate(Sender: TObject);
begin
   ProgressBar_MontaFicha.Visible:= False;
   ProgressBar_Fichas.Visible:= False;
   VB_CorregandoFicha:= False;

   Panel_Cadastro.Align:= AlClient;
   Panel_Cadastro.Visible:= True;
   Panel_Ficha_Avaliacao.Visible:= False;
   Panel_Ficha_Avaliacao.Align:= AlClient;

   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin

      // Tratamento das janelas utilizadas

      Panel_FichasCadastradas.Visible:= True;
      JvCaptionPanel_Avaliacao.Height:= 118;
      JvCaptionPanel_Disciplina.Height:= 144;
      JvCaptionPanel_Coordenador.Height:= 105;
      JvCaptionPanel_Instrutor.Height:= 140;

      if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
      begin
         ClientDataSet_FA_Avaliacao.Active:= true;
         Form_Hab_FichaAvaliacao.Caption:= 'SAE(SISTEMA DE ACOMPANHAMENTO EDUCACIONAL) --> Habilita Ficha de Avaliação';
         ComboBox_QtdAvaliacoes.Text:= 'Todos';
         JvCaptionPanel_Avaliacao.Caption:=  ' Selecione o Avaliador do CIAAR ';
         Label_QtdEsp.Visible:= True;
         Label_QtdEsp.Caption:= '';

         // Alimenta o combobox com as especialidades cadastradas para os alunos

         Funcoes.OpenQuery('Select distinct QuadroEsp from Aluno_Turmas_View where QuadroEsp <> '+#39+#39);
         DM.IBQuery_Executa.First;

         ComboBox_Especialidade.Items.Clear;
         ComboBox_Especialidade.Text:= '';
         ComboBox_Especialidade.Items.Add('Todas');
         While not DM.IBQuery_Executa.Eof do
         begin
            ComboBox_Especialidade.Items.Add(Trim(DM.IBQuery_Executa.FieldByName('QuadroEsp').AsString));
            DM.IBQuery_Executa.Next;
         end;
      end
      else
      begin
         JvCaptionPanel_Avaliacao.Caption:=  ' Selecione o Avaliador do '+DM.IBTable_Configuracao.FieldByName('Sigla').AsString;
         Label_Especialidade.Visible:= False;
         ComboBox_Especialidade.Items.Clear;
         ComboBox_Especialidade.Text:= '';
         ComboBox_Especialidade.Visible:= False;
         Label_QtdEsp.Visible:= False;
      end;

      Panel_Editar.Visible:= False;
      Funcoes.SetCadCurso('CadCurso');
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Habilitar Ficha de Avaliação');    // Abre o perfil do usuario em relacao a agenda
      Campos_Ficha(False);
      Containers(True);
      DesabilitaCaixaSelecao;

      //--- Abre as tabelas existentes

      Funcoes.ExecutaQuery( IBQuery_FichaAvaliacao, 'select a.IdCurso, a.IdTurma, a.IdFicha, a.Identidade, a.Disciplina, a.DataAvaliacao, a.Disponivel, a.IdCoordenador, a.IdAvl_ICEA, m.cabecalho, a.Status, a.Media '+
                                                ' From FA_Modelo m, FA_Avaliacao a '+
                                                ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                ' and       a.IdFicha = m.IdFicha '+
                                                ' Order by a.IdFicha, m.cabecalho, a.DataAvaliacao desc '
                          );



//select a.IdCurso, a.IdTurma, a.IdFicha, a.Identidade, a.Disciplina, a.DataAvaliacao, a.Disponivel, a.IdCoordenador, a.IdAvl_ICEA, m.cabecalho, a.Status, a.Media
//from FA_Modelo m, FA_Avaliacao a
//Where a.IdCurso = :IdCurso
//and       a.IdTurma = :IdTurma
//and       a.IdFicha = m.IdFicha
//order by a.IdFicha, m.cabecalho, a.DataAvaliacao desc

      //--- Abre as tabelas existentes



      IBQuery_Modelo.Close;

      IBQuery_FichaAvaliacao.Open;
      IBQuery_FA_Usuario.Open;
      IBQuery_FARelacaoAlunos.Open;

      IBQuery_RelacaoAlunos.Open;
      IBQuery_Topicos.Open;
      IBQuery_Avaliado.Open;
      IBQuery_Itens.Open;
      IBQuery_Complemento01.Open;

      Query_InstrutorTurma.Open;
      IBQuery_CoordenadorTurma.Open;
      IBQuery_Modelo.Open;
      IBQuery_MontaMateria.Open;
      IBQuery_Critica.Open;
      IBQuery_Coordenador.Open;
      IBQuery_Instrutor.Open;
      IBQuery_Disciplina.Open;
      IBQuery_Modelo.Open;

      IBTable_FichaAvaliacao.Open;
      IBQuery_Pessoa.Open;
      IBTable_Instrutor.Open;
      IBTable_Disciplina.Open;

      IBTable_FichaAvaliacao.Open;
      IBTable_Instrutor.Open;
      IBTable_Disciplina.Open;
      IBTable_FA_Relacao.Open;
      IBTable_FA_Relacao.Open;
      IBQuery_Providencia.Open;
      IBTable_Providencia.Open;

      //--- Tratamento da Selecao dos Cursos

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Hab_FichaAvaliacao.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', 'Todos');

      //--- Tratamento para alimentar a lista de fichas avaliadas

      IBQuery_FichaAvaliacao.Open;

     VI_IdCurso:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsInteger;
     VI_IdTurma:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger;

      JvCaptionPanel_MontaFichaAvaliacao.Visible:= true;
      DBGrid_FichaAvaliacao.SetFocus;
      Tratar_FA_AvaliacaoAfterScroll;   //
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento Quando fechar a Form
//--- Fecha as tabelas existentes
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   IBQuery_FARelacaoAlunos.Close;
   IBQuery_RelacaoAlunos.Close;
   IBQuery_FichaAvaliacao.Close;
   Query_InstrutorTurma.Close;
   IBQuery_CoordenadorTurma.Close;
   IBQuery_Modelo.Close;
   IBQuery_MontaMateria.Close;
   IBQuery_FA_Usuario.Close;

   IBTable_FichaAvaliacao.Close;
   IBQuery_Coordenador.Close;
   IBTable_Instrutor.Close;
   IBTable_Disciplina.Close;
end;

//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_Hab_FichaAvaliacao.Containers(Status: Boolean);
begin
   Panel_Treeviw.Enabled:= Status;
   Panel_Botoes.Enabled:= Status;

   Panel_RelacaoAlunos.Visible:= Status;

   if status = True then
      Status:= False
   else
      Status:= True;
   GroupBox_Ficha.Visible:= Status;
   ComboBox_QtdAvaliacoes.Visible:= Status;
   Label_QtdAvl.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de Fichas a serem avaliadas
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.ComboBox_SelFichaChange( Sender: TObject);
begin
   VB_CorregandoFicha:= False;
   Funcoes_FichaAvalicaoCurso.ComboBox_SelFichaChange( JvDateEdit_Aplicacao, ComboBox_SelFicha, IBQuery_FichaAvaliacao, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
   Funcoes_FichaAvalicaoCurso.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
   Funcoes_FichaAvalicaoCurso.AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
   VB_CorregandoFicha:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da atualizacao da lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes_FichaAvalicaoCurso.Atualizar(VB_CorregandoFicha, WebBrowser_Providencia, Chart_Grafico, CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores,
                                        IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Topicos, IBQuery_Itens, IBQuery_FichaAvaliacao, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador,
                                        ProgressBar_Fichas, ProgressBar_MontaFicha, ClientDataSet_FA_Avaliacao, BarSeries_Grafico);
end;

//------------------------------------------------------------------------------
//
// Tratamento Cadastro da Ficha de Avaliação
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.Campos_Ficha(Status: Boolean);
begin
   JvDBDateEdit_DataAvaliacao.Enabled:= Status;
   DBComboBox_Disponivel.Enabled:= Status;
   DBGrid_SelMateria.Enabled:= Status;
   DBGrid_SelIntrutor.Enabled:= Status;
   ComboBox_QtdAvaliacoes.Enabled:= Status;
   ComboBox_Especialidade.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_InserirClick(Sender: TObject);
var
   VF_QtdAlunos: Real;
begin
   try
//      TabSheet_AmostraFichaAvaliacao.TabVisible:= False;

       //----
      //--- Tratamento para encontrar o numero de alunos que farão a Avaliação

      Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select Count(1) as Qtd '+
                                                ' From ALUNOTURMA '+
                                                ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                ' and MotivoDesligamento = '+#39+'a'+#39
                          );

      VF_QtdAlunos:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
      if VF_QtdAlunos > 4 then
      begin
         VF_QtdAlunos:= (VF_QtdAlunos * 30)/100;

         if VF_QtdAlunos <= 4 then
             VF_QtdAlunos:= 4;
      end;

      //--- Inicia a inserção da Ficha

      VS_Operacao:= 'Inserir';
      Campos_Ficha(True);
      Containers(False);
      Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
      JvTransparentButton_Grava.Enabled:= False;
      JvShape_Gravar.Enabled:= False;

      Panel_Amostra.Visible:= False;
      JvCaptionPanel_MontaFichaAvaliacao.Visible:= False;
      Panel_Editar.Visible:= True;
      Panel_FichasCadastradas.Visible:= False;

      IBTable_FichaAvaliacao.Append;
      JvDBDateEdit_DataAvaliacao.Date:= Date;
      ComboBox_QtdAvaliacoes.Text:= Inttostr(round(VF_QtdAlunos));
      IBTable_FichaAvaliacao.FieldByName('IDAVL_ICEA').AsString:= '0';
      IBTable_FichaAvaliacao.FieldByName('Disponivel').AsString:= 'S';
      IBTable_FichaAvaliacao.FieldByName('Status').AsString:= '0';
      IBTable_FichaAvaliacao.FieldByName('media').AsString:= '0/0';
      CadastrarFichaNova;
      DBGrid_Ficha.SetFocus;
   except
      JvTransparentButton_CancelClick( Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_AlterarClick(Sender: TObject);
begin
//   TabSheet_AmostraFichaAvaliacao.TabVisible:= False;
   JvCaptionPanel_MontaFichaAvaliacao.Height:= 113;
   Panel_FichasCadastradas.Visible:= False;
   VS_Operacao:= 'Alterar';
   JvCaptionPanel_MontaFichaAvaliacao.Caption:= VS_Operacao+' '+ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString;
   Campos_Ficha(True);
   Containers(False);
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Panel_Amostra.Visible:= False;
   GroupBox_Ficha.Visible:= False;
   Panel_Editar.Visible:= True;

   Label_QtdAvl.Visible:= False;
   ComboBox_QtdAvaliacoes.Visible:= False;
   Label_Especialidade.Visible:= False;
   ComboBox_Especialidade.Visible:= False;

   IBTable_FichaAvaliacao.Edit;
   JvDBDateEdit_DataAvaliacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
   bmLocal : TBookmark;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a Ficha selecionada '+#13+
                                       'Confirma a exclusão da Ficha ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Menu Principal - Habilitar Ficha de Avaliação', 'Excluir Ficha Avaliação Habilitada');

      Funcoes.ExecusaoQuery('Delete from FA_Relacao where IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                            ' and IdFicha = '+IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString+
                            ' and Identidade = '+#39+IBTable_FichaAvaliacao.FieldByName('Identidade').AsString+#39+
                            ' and Disciplina = '+#39+IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
                           );

      Funcoes.ExecusaoQuery('Delete from FA_Resposta where IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                            ' and IdFicha = '+IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString+
                            ' and Identidade = '+#39+IBTable_FichaAvaliacao.FieldByName('Identidade').AsString+#39+
                            ' and Disciplina = '+#39+IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
                           );

      IBTable_FichaAvaliacao.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery( IBQuery_FichaAvaliacao );

      VB_CorregandoFicha:= False;
      Funcoes_FichaAvalicaoCurso.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
      Funcoes_FichaAvalicaoCurso.AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
      Funcoes_FichaAvalicaoCurso.AlimentaComboBox_SelFicha(ComboBox_SelFicha, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
      VB_CorregandoFicha:= True;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Gravacao da Identificação do Responsavel por responder a Ficha
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.Grava_FA_Relacao(PS_IdAluno, PS_Disciplina, PS_Identidade: String);
begin
   Funcoes.ExecusaoQuery('Delete from FA_Relacao where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                         ' and IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                         ' and IDFICHA = '+IBQuery_Modelo.FieldByName('IdFicha').AsString+
                         ' and IDENTIDADE = '+#39+PS_identidade+#39+
                         ' and DISCIPLINA = '+#39+PS_Disciplina+#39+
                         ' and IDALUNO = '+#39+PS_IdAluno+#39
                        );

   IBTable_FA_Relacao.Append;
   IBTable_FA_Relacao.FieldByName('IDCURSO').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
   IBTable_FA_Relacao.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
   IBTable_FA_Relacao.FieldByName('IDFICHA').AsString:= IBQuery_Modelo.FieldByName('IdFicha').AsString;
   IBTable_FA_Relacao.FieldByName('IDENTIDADE').AsString:= PS_identidade;
   IBTable_FA_Relacao.FieldByName('DISCIPLINA').AsString:= PS_Disciplina;
   IBTable_FA_Relacao.FieldByName('IDALUNO').AsString:= PS_IdAluno;
   IBTable_FA_Relacao.FieldByName('RESPONDEU').AsString:= 'N';
   IBTable_FA_Relacao.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_GravaClick(Sender: TObject);
var
   VB_AtualizaCodigoAluno, VB_Gravar: Boolean;
   VS_Identidade, VS_Disciplina, VS_Comando: String;
   VI_Retorno, i: integer;
begin
   VB_Gravar:= False;

   if ((JvCaptionPanel_Coordenador.Visible = True) and (trim(IBQuery_CoordenadorTurma.FieldByName('Identidade').AsString) = '')) then
   begin
      ShowMessage ('Não Existe Coordenador Cadastrado, não sendo possível criar a Ficha de Avaliação...');
   end
   else
   begin
      if ((JvCaptionPanel_Instrutor.Visible = True) and (trim(Query_InstrutorTurma.FieldByName('Identidade').AsString) = '')) then
      begin
         ShowMessage ('Não Existe Instrutor Cadastrado, não sendo possível criar a Ficha de Avaliação...');
      end
      else
      begin
         VB_Gravar:= True;
         if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
         begin
            if ComboBox_Especialidade.Text <> '' then
            begin
               if ComboBox_Especialidade.Text = 'Todas' then
                  VI_Retorno:= Funcoes.QtdRegistro('select count(1) as Qtd '+
                                                   ' from Aluno_Turmas_View a '+
                                                   ' Where a.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                   ' and   a.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                   ' and   a.MotivoDesligamento = '+#39+'a'+#39)
               else
                  VI_Retorno:= Funcoes.QtdRegistro( 'select count(1) as Qtd '+
                                                    ' from Aluno_Turmas_View a '+
                                                    ' Where a.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                    ' and   a.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                    ' and   a.MotivoDesligamento = '+#39+'a'+#39+' '+
                                                    ' and   a.QuadroEsp like '+#39+'%'+Trim(ComboBox_Especialidade.Text)+'%'+#39);

               if VI_Retorno = 0 then
               begin
                  ShowMessage ('Não Existe aluno Cadastrado com a Especialidade selecionada ('+ComboBox_Especialidade.Text+')'+#13+'Verifique o campo Especialidade no Cadastro do Aluno para corrigir o problema...');
                  VB_Gravar:= False;
               end
               else
               begin
                  if ComboBox_QtdAvaliacoes.Text <> 'Todos' then
                  begin
                     if  VI_Retorno < StrToInt(ComboBox_QtdAvaliacoes.Text) then
                     begin
                        ShowMessage ('A quantidade de aluno Cadastrados ('+IntToStr(VI_Retorno)+') é manor que a quantidade selecionada ('+ComboBox_QtdAvaliacoes.Text+')'+#13+'SOLUÇÃO'+#13+#13+'Dimunua o número de avaliadores ou selecionar outra especialidade...');
                        VB_Gravar:= False;
                     end;
                  end
               end;
            end;
         end;

         if VB_Gravar = True then
         begin
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
                  VB_Gravar:= True;

                  IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
                  IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
                  IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString:= IBQuery_Modelo.FieldByName('IdFicha').AsString;

                  if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação de Curso' then
                  begin
                     IBTable_FichaAvaliacao.FieldByName('Identidade').AsString:= '000000';
                     IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString:= '000000';

                     if IBQuery_Modelo.FieldByName('IdFicha').AsInteger = 7 then
                     begin
                        IBTable_FichaAvaliacao.FieldByName('Identidade').AsString:= IBQuery_CoordenadorTurma.FieldByName('Identidade').AsString;
                        IBTable_FichaAvaliacao.FieldByName('IdCoordenador').AsString:= IBQuery_CoordenadorTurma.FieldByName('Identidade').AsString;
                     end;
                  end
                  else
                  begin
                     if (IBQuery_Modelo.FieldByName('IdFicha').AsString = '6') then
                     begin
                        VB_Gravar:= False;

                        IBTable_FichaAvaliacao.FieldByName('Identidade').AsString:= Query_InstrutorTurma.FieldByName('Identidade').AsString;
                        IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString:= IBQuery_MontaMateria.FieldByName('CodMateria').AsString;
                        IBTable_FichaAvaliacao.FieldByName('IdAvl_Icea').AsString:= IBQuery_FA_Usuario.FieldByName('Identidade').AsString;
                        IBTable_FichaAvaliacao.Post;
                        Funcoes.ExecutaTransacao;

                        Grava_FA_Relacao(IBQuery_FA_Usuario.FieldByName('Identidade').AsString, IBQuery_MontaMateria.FieldByName('CodMateria').AsString, Query_InstrutorTurma.FieldByName('Identidade').AsString);
                     end
                     else
                     begin
                       if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação de Instrutor Por Disciplina' then
                       begin
                           //--- Tratamento para catalogar a Disciplina de acordo com o Instrutor
                           VS_Comando:= 'Select count(1) as Qtd '+
                                        ' From InstrutorMateria '+
                                        ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                        ' and CodMateria = '+#39+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+#39+
                                        ' and Identidade = '+#39+Query_InstrutorTurma.FieldByName('Identidade').AsString+#39;
                           if Funcoes.QtdRegistro(VS_Comando) = 0 then
                           Begin
                              Funcoes.ExecusaoQuery('Insert into InstrutorMateria (IdCurso, CodMateria, Identidade) '+
                                                    ' Values ('+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+', '+#39+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+#39+', '+#39+Query_InstrutorTurma.FieldByName('Identidade').AsString+#39+')'
                                                    );
                           end;

                           IBTable_FichaAvaliacao.FieldByName('Identidade').AsString:= Query_InstrutorTurma.FieldByName('Identidade').AsString;
                           IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString:= IBQuery_MontaMateria.FieldByName('CodMateria').AsString;
                        end
                        else
                        begin
                           if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação da Disciplina' then
                           begin
                              if IBQuery_Modelo.FieldByName('Cabecalho').AsString = 'FICHA DE OPINIÃO DO DOCENTE' then
                                IBTable_FichaAvaliacao.FieldByName('IdCoordenador').AsString:= IBQuery_CoordenadorTurma.FieldByName('Identidade').AsString;

                              IBTable_FichaAvaliacao.FieldByName('Identidade').AsString:= Query_InstrutorTurma.FieldByName('Identidade').AsString;;
                              IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString:= IBQuery_MontaMateria.FieldByName('CodMateria').AsString;
                           end
                           else
                           begin
                              if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação do Instrutor' then
                              begin
                                 if IBQuery_Modelo.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE DOCENTE E DISCIPLINA - PELO COORDENADOR' then
                                 begin

                                    //--- Tratamento para catalogar a Disciplina de acordo com o Instrutor
                                    VS_Comando:= 'Select count(1) as Qtd '+
                                                 ' From InstrutorMateria '+
                                                 ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                 ' and CodMateria = '+#39+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+#39+
                                                 ' and Identidade = '+#39+Query_InstrutorTurma.FieldByName('Identidade').AsString+#39;
                                    if Funcoes.QtdRegistro(VS_Comando) = 0 then
                                    Begin
                                       Funcoes.ExecusaoQuery('Insert into InstrutorMateria (IdCurso, CodMateria, Identidade) '+
                                                             ' Values ('+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+', '+#39+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+#39+', '+#39+Query_InstrutorTurma.FieldByName('Identidade').AsString+#39+')'
                                                             );
                                    end;

                                    IBTable_FichaAvaliacao.FieldByName('Identidade').AsString:= Query_InstrutorTurma.FieldByName('Identidade').AsString;
                                    IBTable_FichaAvaliacao.FieldByName('IdCoordenador').AsString:= IBQuery_CoordenadorTurma.FieldByName('Identidade').AsString;
                                    IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString:= IBQuery_MontaMateria.FieldByName('CodMateria').AsString;
                                 end
                                 else
                                 begin
                                    IBTable_FichaAvaliacao.FieldByName('Identidade').AsString:= Query_InstrutorTurma.FieldByName('Identidade').AsString;
                                    IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString:= '000000';
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;

                  if VB_Gravar =  True then
                  begin
                     if ((IBQuery_Modelo.FieldByName('Cabecalho').AsString <> 'FICHA DE AVALIAÇÃO DE DOCENTE E DISCIPLINA - PELO COORDENADOR') and
                         (IBQuery_Modelo.FieldByName('Cabecalho').AsString <> 'FICHA DE OPINIÃO DO DOCENTE')) then
                     begin
                           Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select p.PostoGraduacao, P.NomeGuerra '+
                                                                    ' From fa_avaliacao a, Pessoa p '+
                                                                    ' where a.identidade = p.identidade '+
                                                                    ' and a.IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                                                                    ' and a.IdTurma = '+ IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                                                                    ' and a.IdFicha = '+IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString+
                                                                    ' and a.Disciplina = '+#39+IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString+#39+
                                                                    ' and a.Identidade = '+#39+IBTable_FichaAvaliacao.FieldByName('Identidade').AsString+#39
                                               );

                           if Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString) <> '' then   // Já existe Ficha de Avaliação
                           begin
                              ShowMessage('O Instrutor '+Trim(Query_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+' '+Trim(Query_InstrutorTurma.FieldByName('Nome').AsString)+
                                          #13+' já esta sendo Avaliando na Disciplina '+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+' '+Trim(IBQuery_MontaMateria.FieldByName('NomeMateria').AsString)+'....'+#13);
                              JvTransparentButton_CancelClick(Sender);
                           end
                           else
                           begin
                              VS_Identidade:= IBTable_FichaAvaliacao.FieldByName('Identidade').AsString;
                              VS_Disciplina:= IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString;

                              IBTable_FichaAvaliacao.Post;

                              if ComboBox_Especialidade.Text = 'Todas' then
                                 Funcoes.ExecutaQuery( IBQuery_RelacaoAlunos, 'select a.IdCurso, a.IdTurma, a.identidade, a.CodigoAluno, a.QuadroEsp '+
                                                                              ' from Aluno_Turmas_View a'+
                                                                              ' Where a.IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                                                                              ' and   a.IdTurma  = '+ IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                                                                              ' and   a.MotivoDesligamento = '+#39+'a'+#39+' '+
                                                                              ' order by a.CodigoAluno ')
                              else
                              begin
                                 if ComboBox_Especialidade.Text = '' then
                                    Funcoes.ExecutaQuery( IBQuery_RelacaoAlunos, 'select a.IdCurso, a.IdTurma, a.identidade, a.CodigoAluno, a.QuadroEsp '+
                                                                                 ' from Aluno_Turmas_View a '+
                                                                                 ' Where a.IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                                                                                 ' and   a.IdTurma  = '+ IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                                                                                 ' and   a.MotivoDesligamento = '+#39+'a'+#39+' '+
                                                                                 ' order by a.CodigoAluno ')
                                 else
                                    Funcoes.ExecutaQuery( IBQuery_RelacaoAlunos, 'select a.IdCurso, a.IdTurma, a.identidade, a.CodigoAluno, a.QuadroEsp '+
                                                                                 ' from Aluno_Turmas_View a '+
                                                                                 ' Where a.IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                                                                                 ' and   a.IdTurma  = '+ IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                                                                                 ' and   a.MotivoDesligamento = '+#39+'a'+#39+' '+
                                                                                 ' and   a.QuadroEsp like '+#39+'%'+ComboBox_Especialidade.Text+'%'+#39+
                                                                                 ' order by a.CodigoAluno ');
                              end;

                               //---
                              //--- Grava a relação de Alunos que irao responder as Fichas

                              if (((IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação de Curso') and
                                   (IBQuery_Modelo.FieldByName('IdFicha').AsInteger <> 7 )) or
                                  (ComboBox_QtdAvaliacoes.Text = 'Todos')) then
                              begin
                                 IBQuery_RelacaoAlunos.First;
                                 While not IBQuery_RelacaoAlunos.Eof do
                                 begin
                                    Grava_FA_Relacao( IBQuery_RelacaoAlunos.FieldByName('Identidade').AsString, VS_Disciplina, VS_Identidade);
                                    IBQuery_RelacaoAlunos.Next;
                                 end;
                              end
                              else
                              begin
                                  //---
                                 // Encontra o numero da ultima ficha

                                 Funcoes.OpenQuery( 'select IdCurso, IdTurma, CodigoAluno '+
                                                    ' from FA_CodigoAluno '+
                                                    ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                    ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                                                  );

                                 VB_AtualizaCodigoAluno:= False;
                                 IBQuery_RelacaoAlunos.First;
                                 if Trim(DM.IBQuery_Executa.FieldByName('CodigoAluno').AsString) <> '' then
                                 begin
                                    IBQuery_RelacaoAlunos.Locate('CodigoAluno', VarArrayOf([DM.IBQuery_Executa.FieldByName('CodigoAluno').AsString]), [loPartialKey]);
                                    VB_AtualizaCodigoAluno:= True;
                                 end;

                                  //---
                                 // Inicia o Processo de gravação da relaçao de alunos que responderam a Ficha

                                 if Trim(ComboBox_QtdAvaliacoes.Text) = 'Todos' then
                                 begin
                                    IBQuery_RelacaoAlunos.First;
                                    While not IBQuery_RelacaoAlunos.Eof do
                                    begin
                                       Grava_FA_Relacao( IBQuery_RelacaoAlunos.FieldByName('Identidade').AsString, VS_Disciplina, VS_Identidade);
                                       IBQuery_RelacaoAlunos.Next;
                                    end;
                                 end
                                 else
                                 begin
                                    for i := 1 to StrToInt(ComboBox_QtdAvaliacoes.Text) do
                                    begin
                                       Grava_FA_Relacao( IBQuery_RelacaoAlunos.FieldByName('Identidade').AsString, VS_Disciplina, VS_Identidade);

                                       if not IBQuery_RelacaoAlunos.Eof then
                                          IBQuery_RelacaoAlunos.Next
                                       else
                                          IBQuery_RelacaoAlunos.First;
                                    end;
                                 end;
                              end;

                              if ((IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação do Instrutor') or
                                  (IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação de Instrutor Por Disciplina')) then
                              begin
                                 if Trim(ComboBox_QtdAvaliacoes.Text) <> 'Todos' then
                                 begin
                                    if VB_AtualizaCodigoAluno = False then
                                       Funcoes.ExecusaoQuery( 'Insert into FA_CodigoAluno (IdCurso, IdTurma, CodigoAluno) Values ('+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+', '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+', '+IBQuery_RelacaoAlunos.FieldByName('Codigoaluno').AsString+')')
                                    else
                                       Funcoes.ExecusaoQuery( 'Update FA_CodigoAluno set CodigoAluno = '+IBQuery_RelacaoAlunos.FieldByName('Codigoaluno').AsString+
                                                              ' where  IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                              ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                                                            );
                                 end;
                              end;
                           end;
                        end;
                     end;

                     //--- Grava o Coordenador que respondera a ficha de Avaliacao

                     if IBQuery_Modelo.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE DOCENTE E DISCIPLINA - PELO COORDENADOR' then
                     begin
                        Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select p.PostoGraduacao, P.NomeGuerra '+
                                                                 ' From fa_avaliacao a, Pessoa p '+
                                                                 ' where a.idcoordenador = p.identidade '+
                                                                 ' and a.IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                                                                 ' and a.IdTurma = '+ IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                                                                 ' and a.IdFicha = '+IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString+
                                                                 ' and a.Identidade = '+#39+IBTable_FichaAvaliacao.FieldByName('Identidade').AsString+#39+
                                                                 ' and a.Disciplina = '+#39+IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
                                            );

                        if Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString) <> '' then   // Já existe Ficha de Avaliação
                        begin
                           ShowMessage('O Instrutor '+Trim(Query_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+' '+Trim(Query_InstrutorTurma.FieldByName('Nome').AsString)+
                                       #13+' na Disciplina '+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+' '+Trim(IBQuery_MontaMateria.FieldByName('NomeMateria').AsString)+
                                       #13+'já esta sendo Avaliado pelo Coordenador '+Trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' '+Trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString)+'....'+#13);
                           JvTransparentButton_CancelClick(Sender);
                        end
                        else
                        begin
                           Grava_FA_Relacao(IBQuery_CoordenadorTurma.FieldByName('Identidade').AsString, IBQuery_MontaMateria.FieldByName('CodMateria').AsString, IBTable_FichaAvaliacao.FieldByName('Identidade').AsString);

                           IBTable_FichaAvaliacao.Post;
                           Funcoes.ExecutaTransacao;
                        end;
                     end;

                     if IBQuery_Modelo.FieldByName('Cabecalho').AsString = 'FICHA DE OPINIÃO DO DOCENTE' then
                     begin
                        Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select count(*) as QTD '+
                                                                 ' From fa_avaliacao '+
                                                                 ' where IdCurso = '+IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString+
                                                                 ' and   IdTurma = '+ IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString+
                                                                 ' and   IdFicha = '+IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString+
                                                                 ' and   Identidade like '+#39+'%'+trim(IBTable_FichaAvaliacao.FieldByName('Identidade').AsString)+'%'+#39+
                                                                 ' and   Disciplina = '+#39+IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
                                            );

                        if DM.IBQuery_Executa.FieldByName('QTD').AsInteger > 0 then   // Já existe Ficha de Avaliação
                        begin
                           ShowMessage('O Instrutor já esta Avaliando na Disciplina '+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+' '+Trim(IBQuery_MontaMateria.FieldByName('NomeMateria').AsString)+'....'+#13);
                           JvTransparentButton_CancelClick(Sender);
                        end
                        else
                        begin
                           Grava_FA_Relacao(Query_InstrutorTurma.FieldByName('Identidade').AsString, IBTable_FichaAvaliacao.FieldByName('Disciplina').AsString, IBTable_FichaAvaliacao.FieldByName('Identidade').AsString);

                           IBTable_FichaAvaliacao.Post;
                           Funcoes.ExecutaTransacao;
                        end
                     end;
                  end;
                  VB_CorregandoFicha:= False;
                  Panel_FichasCadastradas.Visible:= True;

                  Panel_Editar.Visible:= False;
                  Label_QtdEsp.Caption:= '';
                  Campos_Ficha(False);
                  Containers(True);
                  DesabilitaCaixaSelecao;
                  Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
                  Panel_Amostra.Visible:= True;

                  Funcoes_FichaAvalicaoCurso.ComboBox_SelFichaChange( JvDateEdit_Aplicacao, ComboBox_SelFicha, IBQuery_FichaAvaliacao, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
                  Funcoes_FichaAvalicaoCurso.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
                  Funcoes_FichaAvalicaoCurso.AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
                  VB_CorregandoFicha:= True;
                  Tratar_FA_AvaliacaoAfterScroll;

//                  TabSheet_AmostraFichaAvaliacao.TabVisible:= True;
                  DBGrid_FichaAvaliacao.SetFocus;
            end;
         end;
         Panel_FichasCadastradas.Visible:= True;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_CancelClick(Sender: TObject);
begin
   if ((IBTable_FichaAvaliacao.State = DSInsert) or (IBTable_FichaAvaliacao.State = DSEdit )) then
   begin
      IBTable_FichaAvaliacao.Cancel;
      Funcoes.ExecutaTransacao;
   end;

   Funcoes.GravaAcesso('Menu Principal - Habilitar Ficha de Avaliação', 'Cancelar Ficha Avaliação');

   Panel_FichasCadastradas.Visible:= True;

   Panel_Editar.Visible:= False;
   Label_QtdEsp.Caption:= '';
   Campos_Ficha(False);
   Containers(True);
   DesabilitaCaixaSelecao;
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Panel_Amostra.Visible:= True;

   Tratar_FA_AvaliacaoAfterScroll;

//   TabSheet_AmostraFichaAvaliacao.TabVisible:= True;
   DBGrid_FichaAvaliacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Selecao do Teste
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.SelecionaFicha(Sender: TObject);
begin
   JvDBDateEdit_DataAvaliacao.SetFocus;
end;

procedure TForm_Hab_FichaAvaliacao.ComboBox_QtdAvaliacoesKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento da seleção do modelo da ficha quando esta esta sendo Inserida ou alterada
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.DBGrid_FichaCellClick(Column: TColumn);
begin
   CadastrarFichaNova;
end;

//------------------------------------------------------------------------------
// Tratamento da seleção do modelo da ficha quando esta esta sendo Inserida ou alterada
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.CadastrarFichaNova;
begin
   JvCaptionPanel_MontaFichaAvaliacao.Height:= 113;
   JvCaptionPanel_MontaFichaAvaliacao.Caption:= VS_Operacao+' '+IBQuery_Modelo.FieldByName('Cabecalho').AsString;
   JvTransparentButton_Grava.Enabled:= True;
   JvShape_Gravar.Enabled:= True;

   ComboBox_Especialidade.Text:= '';
   DesabilitaCaixaSelecao;
   JvCaptionPanel_MontaFichaAvaliacao.Visible:= True;

   if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação de Curso' then
   begin
      if IBQuery_Modelo.FieldByName('IdFicha').AsInteger <> 7 then
      begin
         Label_QtdAvl.Visible:= False;
         ComboBox_QtdAvaliacoes.Visible:= False;
         Label_Especialidade.Visible:= False;
         ComboBox_Especialidade.Visible:= False;
      end
      else
      begin
         Label_QtdAvl.Visible:= True;
         ComboBox_QtdAvaliacoes.Visible:= True;
         JvCaptionPanel_Coordenador.Visible:= True;
      end;
   end
   else
   begin
      Label_QtdAvl.Visible:= True;
      ComboBox_QtdAvaliacoes.Visible:= True;

      if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
      begin
         Label_Especialidade.Visible:= True;
         ComboBox_Especialidade.Visible:= True;
         ComboBox_Especialidade.Text:= 'Todas';
      end;

      if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação de Instrutor Por Disciplina' then
      begin
         JvCaptionPanel_Disciplina.Visible:= True;
         JvCaptionPanel_Instrutor.Visible:= True;
         if ((IBQuery_Modelo.FieldByName('IdFicha').AsString = '6')) then
         begin
            JvCaptionPanel_Avaliacao.Caption:= ' Selecione o Avaliador do '+DM.IBTable_Configuracao.FieldByName('Sigla').AsString+' ';

            JvCaptionPanel_Avaliacao.Visible:= True;
            Label_QtdAvl.Visible:= False;
            ComboBox_QtdAvaliacoes.Visible:= False;

            Label_Especialidade.Visible:= False;
            ComboBox_Especialidade.Visible:= False;
         end;
      end
      else
      begin
         if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação da Disciplina' then
         begin
            if IBQuery_Modelo.FieldByName('Cabecalho').AsString = 'FICHA DE OPINIÃO DO DOCENTE' then
            begin
               Label_QtdAvl.Visible:= False;
               ComboBox_QtdAvaliacoes.Visible:= False;
               Label_Especialidade.Visible:= False;
               ComboBox_Especialidade.Visible:= False;
            end;

            JvCaptionPanel_Disciplina.Visible:= True;
            JvCaptionPanel_Instrutor.Visible:= True;
         end
         else
         begin
            if IBQuery_Modelo.FieldByName('Modelo').AsString = 'Ficha Avaliação do Instrutor' then
            begin
               if IBQuery_Modelo.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE DOCENTE E DISCIPLINA - PELO COORDENADOR' then
               begin
                  Label_QtdAvl.Visible:= False;
                  ComboBox_QtdAvaliacoes.Visible:= False;

                  Label_Especialidade.Visible:= False;
                  ComboBox_Especialidade.Visible:= False;
               end;

               JvCaptionPanel_Disciplina.Visible:= True;
               JvCaptionPanel_Instrutor.Visible:= True;
               JvCaptionPanel_Coordenador.Visible:= True;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Desabilita os GroupBox de selecao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.DesabilitaCaixaSelecao;
begin
   JvCaptionPanel_Avaliacao.Visible:= False;
   JvCaptionPanel_Disciplina.Visible:= False;
   JvCaptionPanel_Instrutor.Visible:= False;
   JvCaptionPanel_Coordenador.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento de erro ao Cadastrar Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.IBTable_FichaAvaliacaoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
   Sender: TObject;
begin
   if (E is EDBEngineError) then
     if (E as EDBEngineError).Errors[0].Errorcode = 9729 then
     begin
        MessageDlg('  Ja existe "Avaliação de Curso" para Disciplina '+
                   #13+IBQuery_MontaMateria.FieldByName('CodMateria').AsString+' - '+IBQuery_MontaMateria.FieldByName('NomeMateria').AsString+
                   #13+' com o Instrutor '+VS_MsgAvaliador,mtError, [mbOk],0);
        DBGrid_Ficha.SetFocus;
     end;
end;

//------------------------------------------------------------------------------
// Monta o relatorio com o codigo dos Alunos
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.RelacaodeAlunoscomCodigoClick(Sender: TObject);
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

procedure TForm_Hab_FichaAvaliacao.RelaodeInstrutorescomCdigo1Click(Sender: TObject);
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
// Pega o avaliador do ICEA selecionado
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.DBGrid_AvaliacaoCellClick(Column: TColumn);
begin
   VS_MsgAvaliador:= 'Avalidor do '+DM.IBTable_Configuracao.FieldByName('Sigla').AsString+' '+trim(IBQuery_FA_Usuario.FieldByName('PostoGraduacao').AsString)+' '+Trim(IBQuery_FA_Usuario.FieldByName('Nome').AsString)
end;

//------------------------------------------------------------------------------
// Pega o Instrutor selecionado
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.DBGrid_SelIntrutorCellClick(Column: TColumn);
begin
   VS_MsgAvaliador:= 'Instrutor '+trim(Query_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+' '+Trim(Query_InstrutorTurma.FieldByName('Nome').AsString);
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.ComboBox_EspecialidadeChange(Sender: TObject);
var
   VI_QtdReg: Integer;
begin
   VI_QtdReg:= Funcoes.QtdRegistro( 'select count(1) as Qtd '+
                                    ' from Aluno_Turmas_View a'+
                                    ' Where a.IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                    ' and   a.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                    ' and   a.MotivoDesligamento = '+#39+'a'+#39+' '+
                                    ' and   a.QuadroEsp like '+#39+'%'+ComboBox_Especialidade.Text+'%'+#39
                                  );

   if VI_QtdReg = 0 then
      Label_QtdEsp.Caption:= 'A Especialidade ('+ComboBox_Especialidade.Text+') não possui aluno Cadastrado'
   else
      Label_QtdEsp.Caption:= 'A Especialidade ('+ComboBox_Especialidade.Text+') possuí '+IntToStr(VI_QtdReg)+' Cadastrado(s)';
end;

//------------------------------------------------------------------------------
// Tratamento para filtrar a relação de Disciplinas
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.MaskEdit_MateriaChange(Sender: TObject);
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

procedure TForm_Hab_FichaAvaliacao.DBGrid_FichaAvaliacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes_FichaAvalicaoCurso.DBGrid_FichaAvaliacaoDrawColumnCell(Sender, Rect, DataCol, Column, State, ClientDataSet_FA_Avaliacao, DBGrid_FichaAvaliacao,);
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a ficha para ser montada
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.ClientDataSet_FA_AvaliacaoAfterScroll( DataSet: TDataSet);
begin
   Tratar_FA_AvaliacaoAfterScroll;
End;
//------------------------------------------------------------------------------
// Tratamento para chamar a ficha para ser montada
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.Tratar_FA_AvaliacaoAfterScroll;
var
   Sender: TObject;
begin
//   if VB_CorregandoFicha = true then
//   begin

      JvCaptionPanel_MontaFichaAvaliacao.Caption:= ' '+ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString+' ';

      Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
      Label_Instrutor.Caption:= 'Instrutor................: ';
      Panel_Amostra.Height:= 94;

      Panel_Amostra.Visible:= False;
      if (ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'EXTRATO CURSO') then
      begin
         JvTransparentButton_Alterar.Enabled:= False;
         JvTransparentButton_Exclui.Enabled:= False;
         JvCaptionPanel_MontaFichaAvaliacao.Height:= 27;
         Panel_RelacaoAlunos.Visible:= False;
      end
      else
      begin
         if (ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE FINAL DE CURSO') then
         begin
            JvCaptionPanel_MontaFichaAvaliacao.Height:= 27;
            Panel_RelacaoAlunos.Visible:= True;
         end
         else
         begin
            JvCaptionPanel_MontaFichaAvaliacao.Height:= 118;
            if ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = '' then
            begin
               JvTransparentButton_Alterar.Enabled:= False;
               JvTransparentButton_Exclui.Enabled:= False;

               Label_QtdAvl.Visible:= False;
               ComboBox_QtdAvaliacoes.Visible:= False;

               Label_Especialidade.Visible:= False;
               ComboBox_Especialidade.Visible:= False;

               Panel_RelacaoAlunos.Visible:= False;
               Panel_Coordenador.Visible:= False;
               Panel_Disciplina.Visible:= False;
               Panel_Instrutor.Visible:= False;
            end
            else
            begin
               Label_QtdAvl.Visible:= True;
               ComboBox_QtdAvaliacoes.Visible:= True;
               if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
               begin
                  Label_Especialidade.Visible:= False;
                  ComboBox_Especialidade.Visible:= False;
                  ComboBox_Especialidade.Text:= 'Todas';
               end;
               Panel_Amostra.Visible:= True;
               Panel_RelacaoAlunos.Visible:= True;
               Panel_Coordenador.Visible:= True;
               Panel_Disciplina.Visible:= True;
               Panel_Instrutor.Visible:= True;
            end;

            if ((ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE DOCENTE E INSTRUÇÃO - AULA PRÁTICA') or
                (ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE DOCENTE E INSTRUÇÃO - AULA TEÓRICA') or
                (ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'Ficha de Avaliação do Processo de Ensino-Aprendizagem (EPORSERGS)') or
                (ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'Ficha de Avaliação do Processo de Ensino-Aprendizagem (Docente/Palestrante)') or
                (ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'Ficha de Avaliação do Processo de Ensino-aprendizagem (Docente/Palestrante)')) Then
            begin
               JvCaptionPanel_MontaFichaAvaliacao.Height:= 91;
               Panel_Coordenador.Visible:= False;
            end
            else
            begin
               if ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE DOCENTE E DISCIPLINA - PELO COORDENADOR' then
               begin
                  Funcoes.ExecutaQuery(IBQuery_Pessoa, 'Select PostoGraduacao, NomeGuerra from Pessoa where Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('IdCoordenador').AsString+#39);
                  Label_QtdAvl.Visible:= False;
                  ComboBox_QtdAvaliacoes.Visible:= False;
                  Label_Especialidade.Visible:= False;
                  ComboBox_Especialidade.Visible:= False;
                  Label_Pessoa.Caption:= 'Coordenador........: ';
                  Panel_RelacaoAlunos.Visible:= False;
               end
               else
               begin
                  if ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString = 'FICHA DE OPINIÃO DO DOCENTE' then
                  begin
                     Label_QtdAvl.Visible:= False;
                     ComboBox_QtdAvaliacoes.Visible:= False;
                     Label_Especialidade.Visible:= False;
                     ComboBox_Especialidade.Visible:= False;

                     Panel_Coordenador.Visible:= False;
                     Panel_RelacaoAlunos.Visible:= False;
                  end
                  else
                  begin
                     if (ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString = '6') then
                     begin
                        Funcoes.ExecutaQuery(IBQuery_Pessoa, 'Select PostoGraduacao, NomeGuerra from Pessoa where Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('IdAvl_ICEA').AsString+#39);
                        Label_QtdAvl.Visible:= False;
                        ComboBox_QtdAvaliacoes.Visible:= False;
                        Label_Especialidade.Visible:= False;
                        ComboBox_Especialidade.Visible:= False;

                        Label_Pessoa.Caption:= 'Avaliador '+DM.IBTable_Configuracao.FieldByName('Sigla').AsString+'..: ';
                        Panel_RelacaoAlunos.Visible:= False;
                     end
                     else
                     begin
                        if IBQuery_Modelo.FieldByName('Cabecalho').AsString = 'FICHA DE AVALIAÇÃO DE COORDENADOR DE CURSO' then
                        begin
                           Panel_Amostra.Height:= 35;
                           Panel_Amostra.Visible:= True;
                           Panel_Coordenador.Visible:= False;
                           Panel_Disciplina.Visible:= False;
                           Label_Instrutor.Caption:= 'Coordenador........: ';
                           Panel_Instrutor.Visible:= True;
                        end
                     end;
                  end;
               end;
            end;
         end;
      end;
//   end;

       CheckBox_GraficoClick(Sender);

   if VB_CorregandoFicha = True then
   begin
      if ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString = '' then
          VB_CorregandoFicha:= False;

       CheckBox_GraficoClick(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para chamada do Grafico
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.CheckBox_GraficoClick(Sender: TObject);
begin
   if ((CheckBox_Valores.Checked = False) and (CheckBox_Grafico.Checked = False) and (CheckBox_Msg.Checked = False)) Then
      Funcoes_FichaAvalicaoCurso.TratarErroCheckBox( WebBrowser_Providencia )
   else
      Funcoes_FichaAvalicaoCurso.Tratar_Ficha(WebBrowser_Providencia, Chart_Grafico, CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores, ProgressBar_MontaFicha, ClientDataSet_FA_Avaliacao, BarSeries_Grafico,
                IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Itens, IBQuery_Topicos, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador);

end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Hab_FichaAvaliacao.ImprimiraFichadeAvaliacaoClick(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin
     WebBrowser_Providencia.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;


procedure TForm_Hab_FichaAvaliacao.DBGrid_FichaAvaliacaoEnter( Sender: TObject);
begin
   Tratar_FA_AvaliacaoAfterScroll;
end;


//------------------------------------------------------------------------------
// Tratamento para setar o Status
//------------------------------------------------------------------------------

Function TForm_Hab_FichaAvaliacao.TratarStatus(IdCurso, IdTurma, IdFicha, Identidade, CodDisciplina, Cabecalho: string): Integer;
Var
   Status: String;
begin
   Status:= '4';
   if ((Cabecalho = 'FICHA DE AVALIAÇÃO DE FINAL DE CURSO') or
       (Cabecalho = 'FICHA DE AVALIAÇÃO DE DOCENTE E INSTRUÇÃO - AULA TEÓRICA') or
       (Cabecalho = 'FICHA DE AVALIAÇÃO DE DOCENTE E INSTRUÇÃO - AULA PRÁTICA')) then
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select Respondeu '+
                                               ' From fa_relacao '+
                                               ' where idcurso= '+IdCurso+
                                               ' and idturma = '+IdTurma+
                                               ' and idficha = '+IdFicha+
                                               ' and identidade = '+#39+Identidade+#39+
                                               ' and disciplina = '+#39+CodDisciplina+#39

                          );
      if ((DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N') or (DM.IBQuery_Executa.FieldByName('Respondeu').AsString = '')) then
          Status:= '0'
      else
      begin
         While not DM.IBQuery_Executa.eof do
         begin
            if ((DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N') or (DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N')) then
            begin
                Status:= '3';
                Break;
            end;
            DM.IBQuery_Executa.Next;
         end;
      end;
   end
   else
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select Respondeu '+
                                               ' From fa_relacao '+
                                               ' where idcurso= '+IdCurso+
                                               ' and idturma = '+IdTurma+
                                               ' and idficha = '+IdFicha+
                                               ' and identidade = '+#39+Identidade+#39+
                                               ' and disciplina = '+#39+CodDisciplina+#39
                          );

      if ((DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N') or (DM.IBQuery_Executa.FieldByName('Respondeu').AsString = '')) then
          Status:= '3';
   end;

   Funcoes.ExecusaoQuery('update FA_AVALIACAO set status = '+Status+
                         ' where idcurso= '+IdCurso+
                         ' and idturma = '+IdTurma+
                         ' and idficha = '+IdFicha+
                         ' and identidade = '+#39+Identidade+#39+
                         ' and disciplina = '+#39+CodDisciplina+#39
                        );

   TratarStatus:= StrToInt(Status);
end;

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_FichaAvaliacaoClick( Sender: TObject);
begin
   Panel_Cadastro.Visible:= False;
   Panel_Ficha_Avaliacao.Visible:= True;
   Tratar_FA_AvaliacaoAfterScroll;
end;

procedure TForm_Hab_FichaAvaliacao.JvTransparentButton_CadastroFichaAvaliacaoClick( Sender: TObject);
begin
   Panel_Ficha_Avaliacao.Visible:= False;
   Panel_Cadastro.Visible:= True;
end;

procedure TForm_Hab_FichaAvaliacao.IBQuery_FichaAvaliacaoAfterScroll(DataSet: TDataSet);
begin
   if  VI_IdCurso <> DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsInteger then
      VB_CorregandoFicha:= True;

   if  VI_IdTurma <> DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger then
      VB_CorregandoFicha:= True;

   if  VB_CorregandoFicha = True then
   begin
      VI_IdCurso:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsInteger;
      VI_IdTurma:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger;

      VB_CorregandoFicha:= False;

      Funcoes_FichaAvalicaoCurso.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
      Funcoes_FichaAvalicaoCurso.AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
      Funcoes_FichaAvalicaoCurso.AlimentaComboBox_SelFicha(ComboBox_SelFicha, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
   end;

end;

end.

