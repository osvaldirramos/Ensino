//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Aluno.pas                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos alunos.                                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 16/07/2011                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//


// Aline a  -  conclusão de curso de acordo com a MCA 37-87 item 9.3 letra a

unit Cad_Aluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, JvToolEdit, JvDBCtrl, DBCtrls,
  Mask, DB, IBCustomDataSet, IBTable, Buttons, JvComponent, JvLookOut,
  ExtCtrls, JvShape, Grids, DBGrids,  Rotinas_Validar,
  Rotinas_Sue,  Rotinas, Rotinas_TrataData, JvTransBtn, IBQuery, JvGradient;


type
  TForm_Cad_Aluno = class(TForm)
    DST_AlunoTurma: TDataSource;
    DST_PessoaAl: TDataSource;
    DST_EnderecoAl: TDataSource;
    DST_TelefoneAl: TDataSource;
    PageControl_CadAluno: TPageControl;
    TabSheet_DadosPessoais: TTabSheet;
    GroupBox_Documentacao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label_Saram: TLabel;
    GroupBox_TipoAluno: TGroupBox;
    GroupBox_NomeCargo: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label53: TLabel;
    GroupBox_Procedencia: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox_Avaliacao: TGroupBox;
    TabSheet_Endereco: TTabSheet;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label20: TLabel;
    Label30: TLabel;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    TabSheet_ParticipacaoNaTurma: TTabSheet;
    GroupBox7: TGroupBox;
    Label_MotivoDesligamento: TLabel;
    Label28: TLabel;
    Label_Alinea: TLabel;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Edit_Identidade: TEdit;
    DBEdit_CPF: TDBEdit;
    DBEdit_Saram: TDBEdit;
    DBComboBox_TipoLista: TDBComboBox;
    DBComboBox_PostoGraduacao: TDBComboBox;
    ComboBox_Quadro: TDBComboBox;
    JvDBDateEdit_UltimaPromocao: TJvDBDateEdit;
    DBEdit_NomeCompleto: TDBEdit;
    DBComboBox_Sexo: TDBComboBox;
    ComboBox_Unidade: TDBComboBox;
    ComboBox_SubUnidade: TDBComboBox;
    Label19: TLabel;
    DBEdit_CodigoAluno: TDBEdit;
    IBTable_Desligamento: TIBTable;
    DST_Desligamento: TDataSource;
    IBTable_AlunoTurma: TIBTable;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBTable_AlunoTurmaIDUNIDADE: TIBStringField;
    IBTable_AlunoTurmaIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBTable_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBTable_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBTable_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBTable_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_AlunoTurmaINSTITUTO: TIBStringField;
    IBTable_AlunoTurmaTIPO_ALUNO: TIBStringField;
    IBTable_PessoaAl: TIBTable;
    IBTable_PessoaAlIDENTIDADE: TIBStringField;
    IBTable_PessoaAlNOMEGUERRA: TIBStringField;
    IBTable_PessoaAlPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaAlULTIMAPROMOCAO: TDateTimeField;
    IBTable_PessoaAlSEXO: TIBStringField;
    IBTable_PessoaAlSARAM: TIBStringField;
    IBTable_PessoaAlEMAIL: TIBStringField;
    IBTable_PessoaAlCPF_CIC: TIBStringField;
    IBTable_PessoaAlNOMEPAIS: TIBStringField;
    IBTable_PessoaAlDATA_NASCIMENTO: TDateTimeField;
    IBTable_EnderecoAl: TIBTable;
    IBTable_EnderecoAlIDENTIDADE: TIBStringField;
    IBTable_EnderecoAlENDERECO: TIBStringField;
    IBTable_EnderecoAlCIDADE: TIBStringField;
    IBTable_EnderecoAlUF: TIBStringField;
    IBTable_EnderecoAlPAIS: TIBStringField;
    IBTable_TelefoneAl: TIBTable;
    IBTable_TelefoneAlIDENTIDADE: TIBStringField;
    DBEdit_Telefone: TDBEdit;
    DBEdit_Celular: TDBEdit;
    DBEdit_EnderecoAl: TDBRichEdit;
    DBEdit_CidadeAl: TDBEdit;
    DBComboBox_UfAl: TDBComboBox;
    DBEdit_CepAl: TDBEdit;
    DBComboBox_Pais: TDBComboBox;
    DBEdit_EMailAl: TDBEdit;
    JvDBDateEdit_DataMatricula: TJvDBDateEdit;
    DBLookupComboBoxt_MotivoDesligamento: TDBLookupComboBox;
    DBEdit_Alinea: TDBEdit;
    JvDBDateEdit_DataDesligamento: TJvDBDateEdit;
    IBTable_AlunoTurmaNOMECOMPLETO: TIBStringField;
    Label12: TLabel;
    DBEdit_Empresa: TDBEdit;
    IBTable_PessoaAlIDUNIDADE: TIBStringField;
    IBTable_PessoaAlIDSUBUNIDADE: TIBStringField;
    DBComboBox_NomeGuerra: TDBComboBox;
    IBTable_PessoaAlQUADROESP: TIBStringField;
    IBTable_AlunoTurmaCHAMADA: TIBStringField;
    IBTable_PessoaAlNOME: TIBStringField;
    BitBtn_InicioCurso: TBitBtn;
    BitBtn_TerminoCurso: TBitBtn;
    JvShape_BotaoSenha: TJvShape;
    SpeedButton_SenhaAcesso: TJvExpressButton;
    RichEdit_Msg: TRichEdit;
    IBTable_EnderecoAlCEP: TIBStringField;
    Memo2: TMemo;
    IBTable_AlunoTurmaRESTRICAO: TIBStringField;
    IBTable_AlunoTurmaESTAGIARIO: TIBStringField;
    Label_Estagiario: TLabel;
    DBComboBox_Estagiario: TDBComboBox;
    MaskEdit_CPF: TMaskEdit;
    Label16: TLabel;
    DBComboBox_Chamada: TDBComboBox;
    Label17: TLabel;
    DBEdit_Celular02: TDBEdit;
    IBTable_TelefoneAlTEL_RESIDENCIAL: TIBStringField;
    IBTable_TelefoneAlTEL_CONTATO: TIBStringField;
    IBTable_TelefoneAlTEL_COMERCIAL: TIBStringField;
    IBTable_TelefoneAlCELULAR: TIBStringField;
    IBTable_TelefoneAlCELULAR1: TIBStringField;
    Label_Sipaer: TLabel;
    DBEdit_SIPAER: TDBEdit;
    IBTable_PessoaAlSIPAER: TIBStringField;
    IBTable_PessoaAlIDENTIDADE_OLD: TIBStringField;
    Panel_Botoes: TPanel;
    IBQuery_Pessoa: TIBQuery;
    DSQ_Pessoa: TDataSource;
    IBQuery_PessoaIDENTIDADE: TIBStringField;
    JvGradient_DadosPessoais: TJvGradient;
    JvGradient_Endereco: TJvGradient;
    JvGradient_ParticipacaoTurma: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_cANCELAR: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Memo3: TMemo;
    DBEdit_LPNA: TDBEdit;
    Label_LPNA: TLabel;
    IBTable_PessoaAlLPNA: TIBStringField;
    IBTable_DesligamentoMOTIVODESLIG: TIBStringField;
    IBTable_DesligamentoDESCRICAO: TIBStringField;
    IBTable_DesligamentoALINEA: TIBStringField;
    IBTable_DesligamentoVERSAO: TIBStringField;

    procedure Pesquisa_CPF;

    Function TipoAluno(VS_Identidade: String): String;

    procedure GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
    procedure PesquisaIdentidadeAluno(VS_Identidade: String);
    procedure NovoAluno;
    procedure Cancelar;
    procedure AbreTabelas;
    procedure Tratar_DBComboBox_TipoLista;
    procedure TratarQtdAlunos;
    procedure TratarAntiguidade;

    procedure FormActivate(Sender: TObject);
    procedure Edit_IdentidadeExit(Sender: TObject);
    procedure Edit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox_QuadroExit(Sender: TObject);
    procedure DBEdit_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_SaramKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_TipoListaKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_PostoGraduacaoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_QuadroKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBDateEdit_UltimaPromocaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_SexoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_SubUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CidadeAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_UfAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CepAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_EMailAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_TelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CelularKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBDateEdit_DataMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBoxt_MotivoDesligamentoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NomeCompletoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_SubUnidadeExit(Sender: TObject);
    procedure DBEdit_EmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_TipoListaExit(Sender: TObject);
    procedure DBEdit_NomeCompletoExit(Sender: TObject);
    procedure DBComboBox_NomeGuerraKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_UnidadeExit(Sender: TObject);
    procedure DBComboBox_PostoGraduacaoExit(Sender: TObject);
    procedure BitBtn_InicioCursoClick(Sender: TObject);
    procedure BitBtn_TerminoCursoClick(Sender: TObject);
    procedure SpeedButton_SenhaAcessoClick(Sender: TObject);
    procedure DBEdit_AntigiodadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_PostoGraduacaoEnter(Sender: TObject);
    procedure MaskEdit_CPFExit(Sender: TObject);
    procedure MaskEdit_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_Celular02Exit(Sender: TObject);
    procedure DBEdit_Celular02KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_NomeGuerraExit(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure DBEdit_SaramExit(Sender: TObject);
    procedure DBEdit_LPNAKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CPFExit(Sender: TObject);
  private         { Private declarations }
     VB_AtualizarQtdAlunos, VB_AtualizaCPF: Boolean;
     VS_Antiguidade, VS_Identidade_Anterior, VS_TipoAluno, VS_OpcaoAluno, VS_DataInicio, VS_DataTermino: String;
  public
    { Public declarations }
  end;

var
  Form_Cad_Aluno: TForm_Cad_Aluno;

implementation

uses Module, Sel_Turma;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.FormActivate(Sender: TObject);
var
   Status: boolean;
begin
   JvGradient_DadosPessoais.StartColor:= Cor_Tela;
   JvGradient_Endereco.StartColor:= Cor_Tela;
   JvGradient_ParticipacaoTurma.StartColor:= Cor_Tela;
   
   VB_AtualizaCPF:= False;

   RichEdit_Msg.Visible:= False;

   //-- Tratamento da data de Matricula de acordo com a turma

   VS_DataInicio:= DM.IBTable_Turma.FieldByName('DataInicio').AsString;
   if DM.IBTable_Turma.FieldByName('DataInicioDist').AsString = '' then
      VS_DataInicio:= DM.IBTable_Turma.FieldByName('DataInicio').AsString
   else
      if (DM.IBTable_Turma.FieldByName('DataInicio').AsDateTime <= DM.IBTable_Turma.FieldByName('DataInicioDist').AsDateTime) then
         VS_DataInicio:= DM.IBTable_Turma.FieldByName('DataInicio').AsString
      else
         VS_DataInicio:= DM.IBTable_Turma.FieldByName('DataInicioDist').AsString;

   //-- Tratamento da data de desligamento de acordo com a turma

   VS_DataTermino:= DM.IBTable_Turma.FieldByName('DataTermino').AsString;
   if DM.IBTable_Turma.FieldByName('DataTerminoDist').AsString = '' then
      VS_DataTermino:= DM.IBTable_Turma.FieldByName('DataTermino').AsString
   else
      if (DM.IBTable_Turma.FieldByName('DataTermino').AsDateTime >= DM.IBTable_Turma.FieldByName('DataTerminoDist').AsDateTime) then
         VS_DataTermino:= DM.IBTable_Turma.FieldByName('DataTermino').AsString
      else
         VS_DataTermino:= DM.IBTable_Turma.FieldByName('DataTerminoDist').AsString;

   //--- Tratamento do Sistema quanto a Avaliacao

   if ((Funcoes.GetSecao = 'ADMINISTRAÇÃO') or (Funcoes.GetSecao = 'EOM') or (Funcoes.GetSecao = 'PAEL') or (Funcoes.GetSecao = 'AVALIAÇÃO')) then
      Status:= True
   else
      Status:= False;

   SpeedButton_SenhaAcesso.Visible:= Status;
   JvShape_BotaoSenha.Visible:= Status;

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
   begin
      Label_Sipaer.Visible:= True;
      DBEdit_SIPAER.Visible:= True;

      Label_Estagiario.Visible:= False;
      DBComboBox_Estagiario.Visible:= False;

      Label_LPNA.Visible:= False;
      DBEdit_LPNA.Visible:= False;
   end
   else
   begin
      if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II'))then
      begin
         Label_LPNA.Visible:= True;
         DBEdit_LPNA.Visible:= True;
      end
      else
      begin
         Label_LPNA.Visible:= False;
         DBEdit_LPNA.Visible:= False;
      end;


      Label_Sipaer.Visible:= False;
      DBEdit_SIPAER.Visible:= False;

      //--- Alimenta os ComboBox utilizados

      if DM.IBTable_Turma.FieldByName('IdCurso').AsInteger = 139 then
         Status:= True
      else
         Status:= False;

      Label_Estagiario.Visible:= Status;
      DBComboBox_Estagiario.Visible:= Status;
   end;

   Funcoes_SUE.AlimentaDBComboBox(ComboBox_Quadro, 'Quadro', 'QuadroEsp', '', 'Quadro');
   Funcoes_SUE.AlimentaDBComboBox(ComboBox_Unidade, 'IdUnidade', 'TAB_UNIDADE', '', 'IdUnidade');
   Funcoes_SUE.AlimentaDBComboBox(ComboBox_SubUnidade, 'IdSubUnidade', 'TAB_SubUnidade', '', 'IdUnidade, IdSubUnidade');
   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Pais, 'NomePais', 'Tab_Pais', '', 'NomePais');

   //--- Tratamento da operação que sera realizada com relaco ao Aluno

   PageControl_CadAluno.TabIndex:= 0;
   VB_AtualizarQtdAlunos:= False;

   AbreTabelas;

   if Form_SelTurma.VS_Aluno = 'Novo' then    // Tratamento realizado para cadastrar um novo aluno
   begin
      JvGradient_DadosPessoais.StartColor:= $00408080;
      JvGradient_Endereco.StartColor:= $00408080;
      JvGradient_ParticipacaoTurma.StartColor:= $00408080;

      Funcoes.GravaAcesso('Menu Principal - Cadastro Turma/Aluno/Instrutor', 'Inserir Dados Pessoais Aluno do Curso '+Funcoes.GetCodCurso+' Turma '+DM.IBTable_Turma.FieldByName('Turma').AsString+' Ano: '+DM.IBTable_Turma.FieldByName('Ano').AsString);
      Form_Cad_Aluno.Caption:= 'Cadastro Aluno - Novo' ;
      NovoAluno;
   end
   else                                                     // Tratamento realizado na alteração das informacoes do aluno
   begin
      if IBTable_AlunoTurma.FieldByName('MotivoDesligamento').AsString = 'a' then
      begin
         JvGradient_DadosPessoais.StartColor:= $00408080;
         JvGradient_Endereco.StartColor:= $00408080;
         JvGradient_ParticipacaoTurma.StartColor:= $00408080;
      end
      else
      begin
         JvGradient_DadosPessoais.StartColor:= ClRed;
         JvGradient_Endereco.StartColor:= ClRed;
         JvGradient_ParticipacaoTurma.StartColor:= ClRed;
      end;
      TabSheet_Endereco.Enabled:= True;
      TabSheet_ParticipacaoNaTurma.Enabled:= True;

      if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
         Status:= True
      else
         if ((DM.Query_Usuario.FieldByName('Secao').AsString = 'EEAC') or (DM.Query_Usuario.FieldByName('Secao').AsString = 'EAVA') or (Funcoes.GetSecao = 'ADMINISTRAÇÃO')) Then
            Status:= True
         else
            Status:= False;

      Label_MotivoDesligamento.Visible:= Status;
      DBLookupComboBoxt_MotivoDesligamento.Visible:= Status;
      Label_Alinea.Visible:= Status;
      DBEdit_Alinea.Visible:= Status;

      Funcoes.ExecutaQuery(IBQuery_Pessoa, 'Select identidade from pessoa pe where pe.Identidade = '+#39+Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39);

      Funcoes.GravaAcesso('Menu Principal - Cadastro Turma/Aluno/Instrutor', 'Alterar Dados Pessoais Aluno '+Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString+' do Curso '+Funcoes.GetCodCurso+' Turma '+DM.IBTable_Turma.FieldByName('Turma').AsString+' Ano: '+DM.IBTable_Turma.FieldByName('Ano').AsString);
      VS_OpcaoAluno:= 'Alterar';
      Form_Cad_Aluno.Caption:= 'Cadastro Aluno - '+Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Nome').AsString;
      if IBTable_PessoaAl.FieldByName('Identidade_Old').AsString <> '' then
         Edit_Identidade.Text:= IBTable_PessoaAl.FieldByName('Identidade_Old').AsString
      else
         Edit_Identidade.Text:= IBTable_PessoaAl.FieldByName('Identidade').AsString;
      VS_Identidade_Anterior:= Edit_Identidade.Text;
      VS_TipoAluno:= IBTable_AlunoTurma.FieldByName('Tipo_Aluno').AsString;
      DBComboBox_TipoLista.Text:= IBTable_AlunoTurma.FieldByName('Tipo_Aluno').AsString;
      IBTable_AlunoTurma.Edit;
      IBTable_PessoaAl.Edit;
      IBTable_EnderecoAl.Edit;
      IBTable_TelefoneAl.Edit;
      Tratar_DBComboBox_TipoLista;

      MaskEdit_CPF.Visible:= False;
      DBEdit_CPF.Visible:= True;

      DBEdit_Saram.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //--- Atualiza Turma

   Form_SelTurma.ChamaTodosAluno(Sender);

   // Fecha as tabelas

   IBTable_AlunoTurma.Close;
   IBTable_PessoaAl.Close;
   IBTable_EnderecoAl.Close;
   IBTable_TelefoneAl.Close;
   IBTable_Desligamento.Open;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para abrir as tabelas
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.AbreTabelas;
begin
   IBTable_AlunoTurma.Open;
   IBTable_PessoaAl.Open;
   IBTable_EnderecoAl.Open;
   IBTable_TelefoneAl.Open;
   IBTable_Desligamento.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.NovoAluno;
begin
   MaskEdit_CPF.Text:= '';

   //--- Desabilita as outras Abas

   PageControl_CadAluno.TabIndex:= 0;
   TabSheet_Endereco.Enabled:= False;
   TabSheet_ParticipacaoNaTurma.Enabled:= False;

   //--- Limpa os Campos

   MaskEdit_CPF.Visible:= True;
   DBEdit_CPF.Visible:= False;

   IBTable_PessoaAl.Close;

   DBEdit_CodigoAluno.Text:= '';
   Tratar_DBComboBox_TipoLista;    // Tratamento da Antiguidade

   Edit_Identidade.Text:= '';

   VS_OpcaoAluno:= 'Pesquisar_CPF';
   PageControl_CadAluno.TabIndex:= 0;
   MaskEdit_CPF.SetFocus;
end;

//------------------------------------------------------------------------------
// Gera o codigo do Aluno
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
var
   VS_Comando, VS_CodAluno: String;
   VI_CodExiste: integer;
begin
   //------------- Chama função para gerar codigo do aluno  --------------//

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SRPV-SP') or
       (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CRCEA-SE')) then
   begin
      VS_CodAluno:= '';
      if trim(MaskEdit_CPF.Text) <> '' Then
         VS_CodAluno:= Copy(MaskEdit_CPF.Text,1,9)
      else
         if IBTable_PessoaAl.FieldByName('CPF_CIC').AsString <> '' then
             VS_CodAluno:= Copy(IBTable_PessoaAl.FieldByName('CPF_CIC').AsString,1,9);

      IBTable_AlunoTurma.FieldByName('CodigoAluno').AsString:= VS_CodAluno;
   end
   else
   begin
      if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
      begin
         VS_CodAluno:= '';
         if trim(MaskEdit_CPF.Text) <> '' Then
            VS_CodAluno:= Copy(FormatFloat('00000000000', StrToFloat(MaskEdit_CPF.Text)),1,9)
         else
            if IBTable_PessoaAl.FieldByName('CPF_CIC').AsString <> '' then
                VS_CodAluno:= Copy(FormatFloat('00000000000', StrToFloat(IBTable_PessoaAl.FieldByName('CPF_CIC').AsString)),1,9);

         IBTable_AlunoTurma.FieldByName('CodigoAluno').AsString:= VS_CodAluno;
      end
      else
      begin
         VI_CodExiste:=0;

         while VI_CodExiste = 0  do
         begin
            VS_CodAluno:=Funcoes.Randomico (999);

            if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SIAT-MN' then
            begin
               VS_CodAluno:= Funcoes_TrataData.AnoAtual+VS_CodAluno;
               VS_Comando:= 'Select count(1) Qtd '+
                            'from CODIGO_ALUNO_VIEW '+
                            'where IdCurso = '+VS_IdCurso+
                            ' and CodigoAluno = '+VS_CodAluno;
            end
            else
            begin
               VS_Comando:= 'Select count(1) Qtd '+
                            'from CODIGO_ALUNO_VIEW '+
                            'where IdCurso = '+VS_IdCurso+
                            ' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                            ' and CodigoAluno = '+VS_CodAluno;
            end;

            if Funcoes.QtdRegistro(VS_Comando) = 0 then
            begin
               VI_CodExiste:= 1;
               IBTable_AlunoTurma.FieldByName('CodigoAluno').AsString:= VS_CodAluno;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Pesquisa se o aluno já esta cadastrado
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.PesquisaIdentidadeAluno(VS_Identidade: String);
begin
   if ((VS_OpcaoAluno = 'Pesquisar') or (VS_OpcaoAluno = 'Pesquisar_CPF')) then
   begin
      if ((trim(Edit_Identidade.Text) = '') and (VS_OpcaoAluno = 'Pesquisar')) then
      begin
         ShowMessage('A Identificação não pode ser Branco...');
         Edit_Identidade.SetFocus;
      end
      else
      begin
         // Verifica se o Aluno ja esta cadastrado para turma
         Funcoes.OpenQuery('Select IdCurso, IdTurma, NomeCompleto, Sexo from Aluno_Turmas_View where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+' and identidade =  '+#39+VS_Identidade+#39+' and MotivoDesligamento =  '+#39+'a'+#39);
         if DM.IBQuery_Executa.FieldByName('IdCurso').AsString <> '' then
         begin
            if DM.IBQuery_Executa.FieldByName('Sexo').AsString = 'M' then
               ShowMessage( 'O Aluno '+DM.IBQuery_Executa.FieldByName('NomeCompleto').AsString+' já esta Cadastrado nesta Turma...')
            else
               ShowMessage( 'A Aluna '+DM.IBQuery_Executa.FieldByName('NomeCompleto').AsString+' já está Cadastrada nesta Turma...');

            VS_OpcaoAluno:= 'Consulta';
            Cancelar;

            MaskEdit_CPF.Visible:= True;
            DBEdit_CPF.Visible:= False;
            Edit_Identidade.Text:= '';
            MaskEdit_CPF.Text:= '';
            MaskEdit_CPF.SetFocus;
         end
         else
         begin
            if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA')) then
            begin
               Funcoes.OpenQuery( 'Select a.IdCurso, a.IdTurma, a.NomeCompleto, a.Sexo, t.turma, t.Ano '+
                                  ' From aluno_turmas_view a, Turma t '+
                                  ' where a.IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                  ' and a.identidade =  '+#39+VS_Identidade+#39+
                                  ' and a.IdCurso = t.IdCurso '+
                                  ' and a.IdTurma = t.IdTurma '+
                                  ' and a.idcurso <> 208 '+
                                  ' and MotivoDesligamento =  '+#39+'a'+#39
                                );

               if DM.IBQuery_Executa.FieldByName('IdCurso').AsString <> '' then
               begin
                   if DM.IBQuery_Executa.FieldByName('Sexo').AsString = 'M' then
                      ShowMessage( 'O Aluno '+DM.IBQuery_Executa.FieldByName('NomeCompleto').AsString+' já está Cadastrado neste curso na Turma '+DM.IBQuery_Executa.FieldByName('Turma').AsString+'/'+DM.IBQuery_Executa.FieldByName('Ano').AsString)
                   else
                      ShowMessage( 'A Aluna '+DM.IBQuery_Executa.FieldByName('NomeCompleto').AsString+' já está Cadastrada neste curso na Turma '+DM.IBQuery_Executa.FieldByName('Turma').AsString+'/'+DM.IBQuery_Executa.FieldByName('Ano').AsString);
               end;
            end;

              VS_OpcaoAluno:= 'Inserir';
            MaskEdit_CPF.Visible:= False;
            DBEdit_CPF.Visible:= True;

            IBTable_PessoaAl.Open;

            //--- Habilita o cadastro do aluno

            IBTable_AlunoTurma.Append;
            IBTable_AlunoTurma.FieldByName('IdCurso').AsString:= DM.IBTable_Turma.FieldByName('IdCurso').AsString;
            IBTable_AlunoTurma.FieldByName('IdTurma').AsString:= DM.IBTable_Turma.FieldByName('IdTurma').AsString;
            IBTable_AlunoTurma.FieldByName('Identidade').AsString:= VS_Identidade;
            IBTable_AlunoTurma.FieldByName('DataMatricula').AsString:= VS_DataInicio;
            IBTable_AlunoTurma.FieldByName('MotivoDesligamento').AsString:= 'a';
            IBTable_AlunoTurma.FieldByName('DataDesligamento').AsString:= VS_DataTermino;
            IBTable_AlunoTurma.FieldByName('NumOrdem').AsInteger:= Funcoes.MaiorCodigoComRestricao('NUMORDEM','IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString,'AlunoTurma');
            IBTable_AlunoTurma.FieldByName('Tipo_Aluno').AsString:= TipoAluno(Edit_Identidade.Text);
            IBTable_AlunoTurma.FieldByName('Estagiario').AsString:= 'N';
            IBTable_AlunoTurma.FieldByName('Chamada').AsString:= 'S';
            DBComboBox_Chamada.Text:= 'S';

            if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SIAT-MN' then
            begin
               IBTable_AlunoTurma.FieldByName('IdUnidade').AsString:= 'CINDACTA IV';
               IBTable_AlunoTurma.FieldByName('CodigoAluno').Asinteger:= Funcoes.MaiorCodigo('CodigoAluno', 'AlunoTurma');
            end
            else
            begin
               GerarCodigoAluno(DM.IBTable_Turma.FieldByName('IdCurso').AsString, DM.IBTable_Turma.FieldByName('IdTurma').AsString);
            end;

           // Verifica se o aluno encontra-se na lista de pessoas

            Funcoes.ExecutaQuery(IBQuery_Pessoa, 'Select identidade from pessoa pe where pe.Identidade = '+#39+VS_Identidade+#39);

            if IBQuery_Pessoa.FieldByName('Identidade').AsString = '' then
            begin
               IBTable_PessoaAl.Append;
               IBTable_PessoaAl.FieldByName('Identidade_Old').AsString:= Edit_Identidade.Text;
               if MaskEdit_CPF.Text = '' then
                  IBTable_PessoaAl.FieldByName('Identidade').AsString:= VS_Identidade
               else
                  IBTable_PessoaAl.FieldByName('Identidade').AsString:= MaskEdit_CPF.Text;
               IBTable_PessoaAl.FieldByName('CPF_CIC').AsString:= MaskEdit_CPF.Text;
               IBTable_PessoaAl.FieldByName('NomePais').AsString:= 'BRASIL';
               IBTable_PessoaAl.FieldByName('Sexo').AsString:= '';

               IBTable_EnderecoAl.Append;
               IBTable_EnderecoAl.FieldByName('Identidade').AsString:= VS_Identidade;
               IBTable_EnderecoAl.FieldByName('Pais').AsString:= 'BRASIL';

               IBTable_TelefoneAl.Append;
               IBTable_TelefoneAl.FieldByName('Identidade').AsString:= VS_Identidade;

               DBEdit_Saram.Text:= '';
               DBComboBox_TipoLista.Text:= '';
               DBComboBox_PostoGraduacao.Text:= '';
               ComboBox_Quadro.Text:= '';
               JvDBDateEdit_UltimaPromocao.Text:= '';
               DBEdit_NomeCompleto.Text:= '';
               DBComboBox_NomeGuerra.Text:= '';
               DBComboBox_NomeGuerra.Items.Clear;
               DBComboBox_Sexo.Text:= '';
               ComboBox_Unidade.Text:= '';
               ComboBox_SubUnidade.Text:= '';
               DBEdit_EnderecoAl.Text:= '';
               DBEdit_CidadeAl.Text:= '';
               DBComboBox_UfAl.Text:= '';
               DBEdit_CepAl.Text:= '';
               DBComboBox_Pais.Text:= 'BRASIL';
               DBEdit_EMailAl.Text:= '';
               DBEdit_Telefone.Text:= '';
               DBEdit_Empresa.Text:= '';
               DBEdit_Celular.Text:= '';
               JvDBDateEdit_DataMatricula.Text:= DateToStr(Date);
               DBEdit_Alinea.Text:=  'a';
               JvDBDateEdit_DataDesligamento.Text:= VS_DataTermino;
               VS_OpcaoAluno:= 'Inserir';
            end
            else
            begin

               if (IBTable_AlunoTurma.State <> DSInsert)  then
                   IBTable_AlunoTurma.Edit;
               IBTable_PessoaAl.Edit;
               IBTable_EnderecoAl.Edit;
               IBTable_TelefoneAl.Edit;
            end;

            TabSheet_Endereco.Enabled:= True;
            TabSheet_ParticipacaoNaTurma.Enabled:= True;

            if trim(DBEdit_CPF.Text) <> '' then
               DBEdit_Saram.SetFocus
            else
            begin
               MaskEdit_CPF.Visible:= False;
               DBEdit_CPF.Visible:= True;
               DBEdit_CPF.SetFocus;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Sair da entrada da identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.Edit_IdentidadeExit(Sender: TObject);
begin
   if ((VS_OpcaoAluno <> 'Inserir') and (VS_OpcaoAluno <> 'Alterar'))  then
   begin
      VS_OpcaoAluno:= 'Pesquisar';
      PesquisaIdentidadeAluno(MaskEdit_CPF.Text);
   end
   else
      if DBEdit_CPF.Text <> '' then
         DBEdit_Saram.SetFocus
      else
         DBEdit_CPF.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando for pressionado a Tecla ENTER no numero da identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.Edit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      if VS_OpcaoAluno <> 'Alterar' then
      begin
         VS_OpcaoAluno:= 'Pesquisar';
         PesquisaIdentidadeAluno(MaskEdit_CPF.Text);
      end
      else
         if DBEdit_CPF.Text <> '' then
            DBEdit_Saram.SetFocus
         else
            DBEdit_CPF.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.JvTransparentButton_GravaClick(Sender: TObject);
var
   VS_Identidade, VS_PostoGraduacao, VS_Quadro: String;
begin

   //--- Valida os campos obrigatorios

   if ((DBComboBox_NomeGuerra.Text = '') and (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'CENIPA')) then
   begin
      PageControl_CadAluno.TabIndex:= 0;
      DBComboBox_NomeGuerra.SetFocus;
   end
   else
   begin
      if Funcoes.ValidaCampo(Edit_Identidade.Text, 'Identificação') = False then
      begin
        PageControl_CadAluno.TabIndex:= 0;
        Edit_Identidade.SetFocus;
     end
     else
     begin
        if Funcoes.ValidaCampo(DBEdit_NomeCompleto.Text, 'Nome Completo') = False then
        begin
           PageControl_CadAluno.TabIndex:= 0;
           DBEdit_NomeCompleto.SetFocus;
        end
        else
        begin
           if Funcoes.ValidaCampo(DBComboBox_PostoGraduacao.Text, 'Posto Graduação') = False then
           begin
              PageControl_CadAluno.TabIndex:= 0;
              DBComboBox_PostoGraduacao.SetFocus;
           end
           else
           begin
              if Funcoes.ValidaCampo(ComboBox_Unidade.Text, 'Unidade') = False then
              begin
                 PageControl_CadAluno.TabIndex:= 0;
                 ComboBox_Unidade.SetFocus;
              end
              else
              begin      // Inicia a Gravacao

                  //--- Alimentação da Tabela automaticamente

                  if IBTable_PessoaAl.FieldByName('Identidade').AsString <> '' then
                     VS_Identidade:= IBTable_PessoaAl.FieldByName('Identidade').AsString;
                     
                  if Trim(ComboBox_SubUnidade.Text) = '' then
                     ComboBox_SubUnidade.Text:= ComboBox_Unidade.Text;

                  if Trim(DBComboBox_PostoGraduacao.Text) = '' then
                     VS_PostoGraduacao:= ''
                  else
                     VS_PostoGraduacao:= Trim(DBComboBox_PostoGraduacao.Text)+' ';

                  if Trim(ComboBox_Quadro.Text) = '' then
                     VS_Quadro:= ''
                  else
                     VS_Quadro:= Trim(ComboBox_Quadro.Text)+' ';

                     if Form_SelTurma.VS_Aluno = 'Alterar' then
                     begin
                        IBTable_PessoaAl.Edit;
                        IBTable_PessoaAl.FieldByName('Identidade_Old').AsString:= Edit_Identidade.Text;
                        VS_Identidade:= IBTable_PessoaAl.FieldByName('Identidade').AsString;
                     end
                     else
                     begin
                        if ((IBTable_PessoaAl.State = DSInsert)) then
                        begin
                           if trim(MaskEdit_CPF.Text) = '' then
                           begin
                              if IBTable_PessoaAl.FieldByName('Identidade').AsString = '' then
                                 IBTable_PessoaAl.FieldByName('Identidade').AsString:= Edit_Identidade.Text;
                              VS_Identidade:= Edit_Identidade.Text;
                              IBTable_EnderecoAl.FieldByName('Identidade').AsString:= VS_Identidade;
                              IBTable_TelefoneAl.FieldByName('Identidade').AsString:= VS_Identidade;
                           end
                           else
                           begin
                              VS_Identidade:= MaskEdit_CPF.Text;
                           end;

                           IBTable_PessoaAl.FieldByName('Identidade_Old').AsString:= Edit_Identidade.Text;
                        end;
                     end;
                     IBTable_PessoaAl.FieldByName('IdUnidade').AsString:= ComboBox_Unidade.Text;
                     IBTable_PessoaAl.FieldByName('IdSubUnidade').AsString:= ComboBox_SubUnidade.Text;
                     IBTable_PessoaAl.FieldByName('PostoGraduacao').AsString:= VS_PostoGraduacao;

                     if (VS_OpcaoAluno = 'Inserir') then
                     begin
                        if ((IBTable_EnderecoAl.State = DSInsert) or (IBTable_EnderecoAl.State = DSEdit )) then
                        begin
                           IBTable_EnderecoAl.FieldByName('Identidade').AsString:= VS_Identidade;
                           IBTable_EnderecoAl.Post;
                        end;

                        if ((IBTable_TelefoneAl.State = DSInsert) or (IBTable_TelefoneAl.State = DSEdit )) then
                        begin
                           IBTable_TelefoneAl.FieldByName('Identidade').AsString:= VS_Identidade;
                           IBTable_TelefoneAl.Post;
                        end;
                     end;

                     if ((IBTable_PessoaAl.State = DSInsert) or (IBTable_PessoaAl.State = DSEdit )) then
                        IBTable_PessoaAl.Post;
                     Funcoes.ExecutaTransacao;

                  if ((IBTable_AlunoTurma.State = DSBrowse) and (VS_OpcaoAluno = 'Alterar')) then
                     IBTable_AlunoTurma.Edit;

                  if VB_AtualizaCPF = True then
                  begin
                     if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SRPV-SP') or
                         (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CRCEA-SE')or
                         (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II')) then
                        GerarCodigoAluno(DM.IBTable_Turma.FieldByName('IdCurso').AsString, DM.IBTable_Turma.FieldByName('IdTurma').AsString);
                  end;

                  if ((IBTable_AlunoTurma.State = DSInsert) or (IBTable_AlunoTurma.State = DSEdit )) then
                  begin
                     VB_AtualizarQtdAlunos:= True;

                     TratarAntiguidade;
                     IBTable_AlunoTurma.FieldByName('Identidade').AsString:= VS_Identidade;
                     IBTable_AlunoTurma.FieldByName('IDANTIGUIDADE').AsString:= VS_Antiguidade;
                     IBTable_AlunoTurma.FieldByName('IdUnidade').AsString:= ComboBox_Unidade.Text;
                     IBTable_AlunoTurma.FieldByName('IdSubUnidade').AsString:= ComboBox_SubUnidade.Text;
                     IBTable_AlunoTurma.FieldByName('NomeCompleto').AsString:= VS_PostoGraduacao+VS_Quadro+Trim(IBTable_PessoaAl.FieldByName('Nome').AsString);
                     IBTable_AlunoTurma.FieldByName('PostoGraduacao').AsString:= IBTable_PessoaAl.FieldByName('PostoGraduacao').AsString;
                     IBTable_AlunoTurma.FieldByName('Chamada').AsString:= DBComboBox_Chamada.Text;
                     IBTable_AlunoTurma.Post;
                  end;

                  if (VS_OpcaoAluno = 'Alterar') then
                     IBTable_EnderecoAl.Edit;

                  if ((IBTable_EnderecoAl.State = DSInsert) or (IBTable_EnderecoAl.State = DSEdit )) then
                  begin
                     IBTable_EnderecoAl.FieldByName('Identidade').AsString:= VS_Identidade;
                     IBTable_EnderecoAl.Post;
                  end;

                  if (VS_OpcaoAluno = 'Alterar') then
                         IBTable_TelefoneAl.Edit;

                  if ((IBTable_TelefoneAl.State = DSInsert) or (IBTable_TelefoneAl.State = DSEdit )) then
                  begin
                     IBTable_TelefoneAl.FieldByName('Identidade').AsString:= VS_Identidade;
                     IBTable_TelefoneAl.Post;
                  end;

                  //  Gravar FA_UsuarioTurma

                  if VS_OpcaoAluno <> 'Alterar' then
                     SpeedButton_SenhaAcessoClick(Sender);

                  //--- Tratamento quando mudar a identidade

                  if VS_OpcaoAluno = 'Alterar' then
                  begin
                     if VS_Identidade_Anterior <> VS_Identidade then
                     begin
//                        Funcoes.ExecusaoQuery('Update FA_USUARIOTURMA set Identidade = '+#39+VS_Identidade+#39+' where Identidade = '+#39+VS_Identidade_Anterior+#39);
                        if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
                        begin
                           Funcoes.ExecusaoQuery('Update FAC_USUARIOTURMA set Identidade = '+#39+VS_Identidade+#39+' where Identidade = '+#39+VS_Identidade_Anterior+#39);
                           Funcoes.ExecusaoQuery('Update FC_RESPOSTA set Identidade = '+#39+VS_Identidade+#39+' where Identidade = '+#39+VS_Identidade_Anterior+#39);
                        end;
                        Funcoes.ExecusaoQuery('Update CERTIDAOALUNO set Identidade = '+#39+VS_Identidade+#39+' where Identidade = '+#39+VS_Identidade_Anterior+#39);
                     end;
                  end;

                  //--- Finaliza a Gravacao dos Dados do Aluno

                  Funcoes.ExecutaTransacao;
                  if Form_SelTurma.VS_Aluno = 'Novo' then    // Tratamento realizado para cadastrar um novo aluno
                  begin
                     Form_Cad_Aluno.Caption:= 'Cadastro Aluno - Novo' ;
                     MaskEdit_CPF.Visible:= True;
                     DBEdit_CPF.Visible:= False;
                     NovoAluno;
                  end
                  else
                  begin
                     if VB_AtualizarQtdAlunos = True then
                        TratarQtdAlunos;

                     Close;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar o Cancelamento da Insercao ou Alteracao
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.Cancelar;
begin
   if ((IBTable_EnderecoAl.State = DSInsert) or (IBTable_EnderecoAl.State = DSEdit )) then
      IBTable_EnderecoAl.Cancel;

   if ((IBTable_TelefoneAl.State = DSInsert) or (IBTable_TelefoneAl.State = DSEdit )) then
      IBTable_TelefoneAl.Cancel;

   if ((IBTable_AlunoTurma.State = DSInsert) or (IBTable_AlunoTurma.State = DSEdit )) then
      IBTable_AlunoTurma.Cancel;

   if ((IBTable_PessoaAl.State = DSInsert) or (IBTable_PessoaAl.State = DSEdit )) then
      IBTable_PessoaAl.Cancel;

   if VB_AtualizarQtdAlunos = True then
      TratarQtdAlunos;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.JvTransparentButton_CancelarClick( Sender: TObject);
begin
   Cancelar;
   Funcoes.abortaTransacao;;
   Form_SelTurma.ChamaTodosAluno(Sender);
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.ComboBox_QuadroExit(Sender: TObject);
begin
   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CIAAR'))then
      JvDBDateEdit_DataDesligamento.SetFocus
   else
      JvDBDateEdit_UltimaPromocao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_CPFKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_Saram.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_SaramKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBComboBox_TipoLista.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_TipoListaKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      Tratar_DBComboBox_TipoLista;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_TipoListaExit(Sender: TObject);
begin
   Tratar_DBComboBox_TipoLista;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.Tratar_DBComboBox_TipoLista;
var
   VS_Origem: String;
begin
   if ((IBTable_AlunoTurma.State = DSInsert) or (IBTable_AlunoTurma.State = DSEdit )) then
   begin
      if ((DBComboBox_TipoLista.Text = 'CIVIL') or (DBComboBox_TipoLista.Text = 'ESTRANGEIRO CIVIL'))  then
      begin
         IBTable_AlunoTurma.FieldByName('Chamada').AsString:= 'N';
         DBComboBox_Chamada.Text:= 'N';

         DBComboBox_PostoGraduacao.Text:= 'CV';
         if ((IBTable_PessoaAl.State = DSInsert) or (IBTable_PessoaAl.State = DSEdit )) then
            IBTable_PessoaAl.FieldByName('PostoGraduacao').AsString:= 'CV';

         TratarAntiguidade;
         DBComboBox_PostoGraduacao.Enabled:= False;
         ComboBox_Quadro.Enabled:= False;
         JvDBDateEdit_UltimaPromocao.Enabled:= False;
         DBEdit_NomeCompleto.SetFocus;
      end
      else
      begin
        VS_Origem:= '';
        if DBComboBox_TipoLista.Text = 'MILITAR DA AERONÁUTICA' then
            VS_Origem:= 'AERONÁUTICA'
        else
           if DBComboBox_TipoLista.Text = 'MILITAR DO EXÉRCITO' then
              VS_Origem:= 'EXÉRCITO'
           else
              if DBComboBox_TipoLista.Text = 'MILITAR DA MARINHA' then
                  VS_Origem:= 'MARINHA'
              else
                 if DBComboBox_TipoLista.Text = 'OUTROS (BRASILEIROS)' then
                    VS_Origem:= 'OUTROS BRAS.'
                 else
                    if DBComboBox_TipoLista.Text = 'ESTRANGEIRO' then
                       VS_Origem:= 'ESTRANGEIRO';

         if VS_Origem = '' then
            Funcoes.OpenQuery('Select PostoGraduacao From Antiguidade where Origem <> '+#39+'AERONÁUTICA'+#39+' and Origem <> '+#39+'EXÉRCITO'+#39+' and Origem <> '+#39+'MARINHA'+#39+' order by IdAntiguidade')
         else
            Funcoes.OpenQuery('Select PostoGraduacao From Antiguidade where Origem = '+#39+VS_Origem+#39+' order by IdAntiguidade');

         DBComboBox_PostoGraduacao.Items.Clear;

         dm.IBQuery_Executa.First;
         While not dm.IBQuery_Executa.Eof do
         begin
            DBComboBox_PostoGraduacao.Items.Add(Trim(dm.IBQuery_Executa.FieldByName('PostoGraduacao').AsString));
            DM.IBQuery_Executa.Next;
         end;

         DBComboBox_PostoGraduacao.Enabled:= True;
         ComboBox_Quadro.Enabled:= True;
         JvDBDateEdit_UltimaPromocao.Enabled:= True;
         DBComboBox_PostoGraduacao.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Antiguidade do Aluno
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.TratarAntiguidade;
var
   VS_Origem: String;
begin
   if DBComboBox_TipoLista.Text = 'MILITAR DA AERONÁUTICA' then
      VS_Origem:= 'AERONÁUTICA'
   else
      if DBComboBox_TipoLista.Text = 'MILITAR DO EXÉRCITO' then
         VS_Origem:= 'EXÉRCITO'
      else
         if DBComboBox_TipoLista.Text = 'MILITAR DA MARINHA' then
            VS_Origem:= 'MARINHA'
         else
            if DBComboBox_TipoLista.Text = 'POLICIA MILITAR' then
               VS_Origem:= 'POLICIA MILITAR'
            else
               if DBComboBox_TipoLista.Text = 'CIVIL' then
                  VS_Origem:= 'CIVIL'
               else
                  if DBComboBox_TipoLista.Text = 'ESTRANGEIRO CIVIL)' then
                     VS_Origem:= 'EST. CIVIL'
                  else
                     if DBComboBox_TipoLista.Text = 'ESTRANGEIRO MILITAR' then
                        VS_Origem:= 'EST. MILITAR';
   DBComboBox_PostoGraduacao.Text:= UpperCase(Copy(DBComboBox_PostoGraduacao.Text,1,1))+
                                    Copy(DBComboBox_PostoGraduacao.Text,2,Length(DBComboBox_PostoGraduacao.Text));

   if VS_Origem = '' then
      Funcoes.OpenQuery('Select Grupo From Antiguidade where PostoGraduacao = '+#39+Trim(DBComboBox_PostoGraduacao.Text)+#39+' and Origem <> '+#39+'AERONÁUTICA'+#39+' and Origem <> '+#39+'EXÉRCITO'+#39+' and Origem <> '+#39+'MARINHA'+#39)
   else
      Funcoes.OpenQuery('Select Grupo From Antiguidade where PostoGraduacao = '+#39+Trim(DBComboBox_PostoGraduacao.Text)+#39+' and Origem = '+#39+VS_Origem+#39);

   VS_Antiguidade:= dm.IBQuery_Executa.FieldByName('Grupo').AsString;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_PostoGraduacaoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      ComboBox_Quadro.SetFocus;
end;

procedure TForm_Cad_Aluno.DBComboBox_PostoGraduacaoExit(Sender: TObject);
begin
   RichEdit_Msg.Visible:= False;
   TratarAntiguidade;
end;
//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.ComboBox_QuadroKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      JvDBDateEdit_UltimaPromocao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.JvDBDateEdit_UltimaPromocaoKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBEdit_NomeCompleto.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_NomeCompletoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      Funcoes.Tratar_NomeGuerra(DBComboBox_NomeGuerra, DBEdit_NomeCompleto.Text);
      DBComboBox_NomeGuerra.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_NomeCompletoExit(Sender: TObject);
begin
   Funcoes.Tratar_NomeGuerra(DBComboBox_NomeGuerra, DBEdit_NomeCompleto.Text);
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_NomeGuerraKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBComboBox_Sexo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_SexoKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      ComboBox_Unidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.ComboBox_UnidadeKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      ComboBox_UnidadeExit(Sender);
end;

procedure TForm_Cad_Aluno.ComboBox_UnidadeExit(Sender: TObject);
begin
   if ((IBTable_AlunoTurma.State = DSInsert) or (IBTable_AlunoTurma.State = DSEdit )) then
   begin
      Funcoes_SUE.AlimentaDBComboBox(ComboBox_SubUnidade, 'IdSubUnidade', 'TAB_SubUnidade', 'IdUnidade = '+#39+ComboBox_Unidade.Text+#39, 'IdUnidade, IdSubUnidade');
      IBTable_AlunoTurma.FieldByName('IdUnidade').AsString:= IBTable_PessoaAl.FieldByName('IdUnidade').AsString;

      ComboBox_SubUnidade.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.ComboBox_SubUnidadeKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      ComboBox_SubUnidadeExit(Sender);
end;

procedure TForm_Cad_Aluno.ComboBox_SubUnidadeExit(Sender: TObject);
begin
   if PageControl_CadAluno.TabIndex = 0 then
   begin
      if  Trim(ComboBox_SubUnidade.Text) = '' then
      begin
         PageControl_CadAluno.TabIndex:= 0;

         if ((IBTable_PessoaAl.State = DSInsert) or (IBTable_PessoaAl.State = DSEdit )) then
            IBTable_PessoaAl.FieldByName('IdSubUnidade').AsString:= IBTable_PessoaAl.FieldByName('IdUnidade').AsString;

         if ((IBTable_AlunoTurma.State = DSInsert) or (IBTable_AlunoTurma.State = DSEdit )) then
              IBTable_AlunoTurma.FieldByName('IdSubUnidade').AsString:= IBTable_PessoaAl.FieldByName('IdUnidade').AsString;
         ComboBox_SubUnidade.Text:= ComboBox_Unidade.Text;
      end;

      if ((IBTable_AlunoTurma.State = DSInsert) or (IBTable_AlunoTurma.State = DSEdit )) then
      begin
         PageControl_CadAluno.TabIndex:= 1;
         DBEdit_EnderecoAl.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_CidadeAlKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBComboBox_UfAl.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_UfAlKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_CepAl.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_CepAlKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBComboBox_Pais.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_PaisKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_EMailAl.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_EMailAlKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBEdit_Telefone.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_TelefoneKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBEdit_Empresa.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_EmpresaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_Celular.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_CelularKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBEdit_Celular02.SetFocus;
end;

procedure TForm_Cad_Aluno.DBEdit_Celular02Exit(Sender: TObject);
begin
   if PageControl_CadAluno.TabIndex = 1 then
   begin
      if TabSheet_ParticipacaoNaTurma.Enabled = False then
          TabSheet_ParticipacaoNaTurma.Enabled:= True;

      PageControl_CadAluno.TabIndex:= 2;
      JvDBDateEdit_DataMatricula.SetFocus;
   end;
end;

procedure TForm_Cad_Aluno.DBEdit_Celular02KeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_Celular02Exit(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.JvDBDateEdit_DataMatriculaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBLookupComboBoxt_MotivoDesligamento.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBLookupComboBoxt_MotivoDesligamentoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      JvDBDateEdit_DataDesligamento.SetFocus;
end;

//------------------------------------------------------------------------------
// Trata o botao que cadastra a senha de acesso do aluno com o codigo do aluno
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.SpeedButton_SenhaAcessoClick(Sender: TObject);
begin
   if ((VS_OpcaoAluno = 'Alterar') and (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II')) then
      GerarCodigoAluno(IBTable_AlunoTurma.FieldByName('IDCURSO').AsString, IBTable_AlunoTurma.FieldByName('IDTURMA').AsString);

   if IBTable_AlunoTurma.FieldByName('CODIGOALUNO').AsString <> '' then
      Funcoes.CadastrarAcessoFichaAvaliacao( IBTable_AlunoTurma.FieldByName('IDCURSO').AsString,
                                             IBTable_AlunoTurma.FieldByName('IDTURMA').AsString,
                                             IBTable_AlunoTurma.FieldByName('IDENTIDADE').AsString,
                                             IBTable_PessoaAl.FieldByName('NomeGuerra').AsString,
                                             IBTable_AlunoTurma.FieldByName('CODIGOALUNO').AsString
                                           );
end;


//------------------------------------------------------------------------------
// Trata o botao que cadastra a senha de acesso do aluno com o codigo do aluno
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.TratarQtdAlunos;
var
   VI_QtdBrasileiros, VI_QtdEstrangeiro: Integer;
begin
   Funcoes.OpenQuery( 'Select Tipo_Aluno '+
                      ' From AlunoTurma '+
                      ' Where IdCurso = '+IBTable_AlunoTurma.FieldByName('IDCURSO').AsString+
                      ' and IdTurma = '+IBTable_AlunoTurma.FieldByName('IDTURMA').AsString+
                      ' and MotivoDesligamento = '+#39+'a'+#39
                    );

   VI_QtdBrasileiros:= 0;
   VI_QtdEstrangeiro:= 0;

   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
      if Copy(DM.IBQuery_Executa.FieldByName('Tipo_Aluno').AsString, 1, 11) = 'ESTRANGEIRO' then
         VI_QtdEstrangeiro:= VI_QtdEstrangeiro + 1
      else
         VI_QtdBrasileiros:= VI_QtdBrasileiros + 1;

      DM.IBQuery_Executa.Next;
   end;

   Funcoes.ExecusaoQuery('Update Turma set QTDBRASILEIROS = '+IntToStr(VI_QtdBrasileiros)+', '+
                                         ' QTDESTRANGEIROS = '+IntToStr(VI_QtdEstrangeiro)+
                         ' Where IdCurso = '+IBTable_AlunoTurma.FieldByName('IdCurso').AsString+
                         ' and IdTurma = '+ IBTable_AlunoTurma.FieldByName('IdTurma').AsString
                        );
   DM.IBTable_Turma.Close;
   DM.IBTable_Turma.Open;
end;

procedure TForm_Cad_Aluno.BitBtn_InicioCursoClick(Sender: TObject);
begin
   if ((IBTable_AlunoTurma.State = DSBrowse) and (VS_OpcaoAluno = 'Alterar')) then
      IBTable_AlunoTurma.Edit;
   IBTable_AlunoTurma.FieldByName('DataMatricula').AsString:= VS_DataInicio;
end;

procedure TForm_Cad_Aluno.BitBtn_TerminoCursoClick(Sender: TObject);
begin
   if ((IBTable_AlunoTurma.State = DSBrowse) and (VS_OpcaoAluno = 'Alterar')) then
      IBTable_AlunoTurma.Edit;
   IBTable_AlunoTurma.FieldByName('DataDesligamento').AsString:= VS_DataTermino;
end;


procedure TForm_Cad_Aluno.DBEdit_AntigiodadeKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      ComboBox_Unidade.SetFocus;
end;

procedure TForm_Cad_Aluno.DBComboBox_PostoGraduacaoEnter(Sender: TObject);
begin
   RichEdit_Msg.Visible:= True;
end;

//------------------------------------------------------------------------------
// Procdeure para Tratar o Tipo de Aluno
//------------------------------------------------------------------------------

Function TForm_Cad_Aluno.TipoAluno(VS_Identidade: String): String;
begin
   Funcoes.OpenQuery('select distinct Identidade, Tipo_Aluno From alunoturma where Identidade = '+#39+VS_Identidade+#39);
   TipoAluno:= DM.IBQuery_Executa.FieldByName('Tipo_Aluno').AsString;
end;

//------------------------------------------------------------------------------
// Tratamento chamada pela Pesquisa pelo CPF
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.MaskEdit_CPFExit(Sender: TObject);
begin
   if VS_OpcaoAluno = 'Pesquisar_CPF' then
      Pesquisa_CPF;
end;

//------------------------------------------------------------------------------
// Tratamento quando sai do campo CPF na opcao Alterar
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBEdit_CPFExit(Sender: TObject);
begin
   VB_AtualizaCPF:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da Pesquisa do Aluno pelo CPF
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.Pesquisa_CPF;
begin
   if ((VS_OpcaoAluno = 'Pesquisar_CPF') and (MaskEdit_CPF.Text <> '')) then
   begin
      if ((MaskEdit_CPF.Text <> '') and (length(MaskEdit_CPF.Text) < 11)) then
      begin
         ShowMessage('Faltando número no CPF ou CPF invalido....');
         MaskEdit_CPF.SetFocus
      end
      else
      begin
         Funcoes.OpenQuery('Select Identidade, Identidade_old from pessoa where CPF_CIC = '+#39+MaskEdit_CPF.Text+#39);
         if DM.IBQuery_Executa.FieldByName('Identidade').AsString = '' then
         begin
            VS_OpcaoAluno:= 'Pesquisar';
            DBEdit_CPF.Text:= MaskEdit_CPF.Text;
            Edit_Identidade.SetFocus;
         end
         else
         begin
            VS_OpcaoAluno:= 'Pesquisar';
            if DM.IBQuery_Executa.FieldByName('Identidade_Old').AsString = '' then
               Edit_Identidade.Text:= DM.IBQuery_Executa.FieldByName('Identidade').AsString
            else
               Edit_Identidade.Text:= DM.IBQuery_Executa.FieldByName('Identidade_Old').AsString;

            MaskEdit_CPF.Visible:= False;
            DBEdit_CPF.Visible:= True;
            if  MaskEdit_CPF.Text <> DM.IBQuery_Executa.FieldByName('Identidade').AsString then
               PesquisaIdentidadeAluno(DM.IBQuery_Executa.FieldByName('Identidade').AsString)
            else
               PesquisaIdentidadeAluno(MaskEdit_CPF.Text);
         end;
      end;
   end;
end;

//-----------------------------------------------------------------------------
// Tratamento quando pressionado a tecla Enter no campo de tratamento do CPF
//-----------------------------------------------------------------------------

procedure TForm_Cad_Aluno.MaskEdit_CPFKeyPress(Sender: TObject; var Key: Char);
begin
   if ((Key = #13) and (VS_OpcaoAluno = 'Pesquisar_CPF')) then
      Pesquisa_CPF;
end;

//------------------------------------------------------------------------------
// Tratamento quando sai do tratamento do Nome de Guerra
//------------------------------------------------------------------------------

procedure TForm_Cad_Aluno.DBComboBox_NomeGuerraExit(Sender: TObject);
begin
   Funcoes.OpenQuery('Select count(1) as Qtd From Aluno_Turmas_View '+
                     ' Where IdCurso = '+IBTable_AlunoTurma.FieldByName('IdCurso').AsString+
                     ' and IdTurma = '+ IBTable_AlunoTurma.FieldByName('IdTurma').AsString+
                     ' and NomeGuerra = '+#39+DBComboBox_NomeGuerra.Text+#39
                    );
   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      ShowMessage('Já existe nome de guerra '+DBComboBox_NomeGuerra.Text+' cadastrado nesta turma...');
      DBComboBox_NomeGuerra.SetFocus;
   end;
end;

procedure TForm_Cad_Aluno.DBEdit_SaramExit(Sender: TObject);
begin
   Validar.ValidarSARAM(DBEdit_Saram);
end;

procedure TForm_Cad_Aluno.DBEdit_LPNAKeyPress(Sender: TObject;  var Key: Char);
begin
   if key = #13 then
      DBComboBox_TipoLista.SetFocus;
end;

end.
