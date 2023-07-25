//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_InstrutorTurma.pas                         //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos Instrutores por turma.                     //
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
// DATA                      : 07/02/19                                       //
// AUTOR                     : Osvaldir Donizetti Ramos                       //
// MODULO ALTERADO           :                                                //
// MOTIVO                    : Acrescentar Funcoes CHEFE DE EQUIPE e PSICÓLOGO//
//----------------------------------------------------------------------------//


unit Cad_InstrutorTurma;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, JvToolEdit, JvDBCtrl, DBCtrls, Rotinas_Sue, Rotinas,
  Mask, DB, IBCustomDataSet, IBTable, DBTables,Buttons, JvDBTreeView, JvEditor,
  ExtCtrls, JvComponentPanel, JvMaskEdit, JvCheckedMaskEdit, Rotinas_Validar,
  JvDatePickerEdit, JvDBDatePickerEdit, Grids, DBGrids, JvSwitch,
  JvComponent, JvClock, JvClipView, Menus, JvCaptionPanel, IBQuery,
  JvLookOut, JvShape, JvGradient, JvTransBtn, JvEnterTab;

type
  TForm_Cad_InstrutorTurma = class(TForm)
    PageControl_CadInstrutor: TPageControl;
    TabSheet_DadosPessoais: TTabSheet;
    GroupBox_Documentacao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Identidade: TEdit;
    DBEdit_CPF: TDBEdit;
    GroupBox_NomeCargo: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label53: TLabel;
    DBComboBox_PostoGraduacao: TDBComboBox;
    ComboBox_Quadro: TDBComboBox;
    DBEdit_NomeCompleto: TDBEdit;
    DBComboBox_Sexo: TDBComboBox;
    GroupBox_Procedencia: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ComboBox_Unidade: TDBComboBox;
    ComboBox_SubUnidade: TDBComboBox;
    GroupBox_Avaliacao: TGroupBox;
    Label19: TLabel;
    DBEdit_Codigo: TDBEdit;
    TabSheet_Endereco: TTabSheet;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label20: TLabel;
    DBEdit_CidadeAl: TDBEdit;
    DBComboBox_UfAl: TDBComboBox;
    DBEdit_CepAl: TDBEdit;
    DBComboBox_Pais: TDBComboBox;
    DBEdit_EnderecoAl: TDBRichEdit;
    TabSheet_ParticipacaoNaTurma: TTabSheet;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    JvDBDateEdit_DataChegada: TJvDBDateEdit;
    GroupBox_FuncaoTurma: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    JvDBDateEdit_DataSaida: TJvDBDateEdit;
    IBTable_InstrutorTurma: TIBTable;
    DST_InstrutorTurma: TDataSource;
    DST_Pessoa: TDataSource;
    IBTable_Pessoa: TIBTable;
    IBTable_PessoaIDENTIDADE: TIBStringField;
    IBTable_PessoaORGAOEMISSOR: TIBStringField;
    IBTable_PessoaNOMEGUERRA: TIBStringField;
    IBTable_PessoaPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaULTIMAPROMOCAO: TDateTimeField;
    IBTable_PessoaSEXO: TIBStringField;
    IBTable_PessoaSARAM: TIBStringField;
    IBTable_PessoaEMAIL: TIBStringField;
    IBTable_PessoaCPF_CIC: TIBStringField;
    IBTable_PessoaNOMEPAIS: TIBStringField;
    IBTable_Endereco: TIBTable;
    IBTable_EnderecoIDENTIDADE: TIBStringField;
    IBTable_EnderecoENDERECO: TIBStringField;
    IBTable_EnderecoCIDADE: TIBStringField;
    IBTable_EnderecoUF: TIBStringField;
    IBTable_EnderecoCEP: TIBStringField;
    IBTable_EnderecoPAIS: TIBStringField;
    DST_Endereco: TDataSource;
    DST_Telefone: TDataSource;
    IBTable_InstrutorTurmaIDCURSO: TSmallintField;
    IBTable_InstrutorTurmaIDTURMA: TIntegerField;
    IBTable_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBTable_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBTable_InstrutorTurmaDATASAIDA: TDateTimeField;
    IBTable_InstrutorTurmaFUNCAO: TIBStringField;
    IBTable_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBTable_InstrutorTurmaINSTITUTO: TIBStringField;
    IBTable_InstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBTable_InstrutorTurmaIDUNIDADE: TIBStringField;
    IBTable_InstrutorTurmaIDSUBUNIDADE: TIBStringField;
    DBComboBox_Funcao: TDBComboBox;
    IBTable_Telefone: TIBTable;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    DBEdit_Fax: TDBEdit;
    IBTable_InstrutorTurmaFICHA: TIBStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label12: TLabel;
    JvDBDateEdit_Apresentacao: TJvDBDateEdit;
    IBTable_PessoaQUADROESP: TIBStringField;
    TabSheet_Capacitacao: TTabSheet;
    GroupBox2: TGroupBox;
    DBEdit_DESCLICENCIATURA: TDBEdit;
    IBTable_Instrutor: TIBTable;
    DST_instrutor: TDataSource;
    IBTable_InstrutorIDENTIDADE: TIBStringField;
    IBTable_InstrutorCTP001: TIBStringField;
    IBTable_InstrutorCTP006: TIBStringField;
    IBTable_InstrutorCTP011: TIBStringField;
    IBTable_InstrutorCPI: TIBStringField;
    IBTable_InstrutorCTP500: TIBStringField;
    IBTable_InstrutorLICENCIATURA: TIBStringField;
    CheckBox_CTP001: TCheckBox;
    CheckBox_CTP006: TCheckBox;
    CheckBox_CPI: TCheckBox;
    CheckBox_CTP011: TCheckBox;
    CheckBox_CTP500: TCheckBox;
    CheckBox_Licenciatura: TCheckBox;
    TabSheet_Materia: TTabSheet;
    IBQuery_Materia: TIBQuery;
    IBQuery_MateriaIDCURSO: TSmallintField;
    IBQuery_MateriaCODMATERIA: TIBStringField;
    IBQuery_MateriaNOMEMATERIA: TIBStringField;
    IBTable_InstrutorMateria: TIBTable;
    IBTable_InstrutorMateriaIDCURSO: TSmallintField;
    IBTable_InstrutorMateriaCODMATERIA: TIBStringField;
    IBTable_InstrutorMateriaIDENTIDADE: TIBStringField;
    IBTable_InstrutorMateriaOBSERVACAO: TIBStringField;
    IBTable_InstrutorMateriaSTATUS: TIBStringField;
    DST_InstrutorMateria: TDataSource;
    DSQ_Materia: TDataSource;
    CheckBox_CG015: TCheckBox;
    CheckBox_Nenhum: TCheckBox;
    IBTable_InstrutorCG015: TIBStringField;
    IBTable_InstrutorNENHUM: TIBStringField;
    IBTable_InstrutorTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_PessoaQUADRO: TIBStringField;
    IBTable_PessoaESPECIALIDADE: TIBStringField;
    IBTable_PessoaIDUNIDADE: TIBStringField;
    IBTable_PessoaIDSUBUNIDADE: TIBStringField;
    JvShape_SenhaAcesso: TJvShape;
    SpeedButton_SenhaAcesso: TJvExpressButton;
    IBTable_InstrutorIDSUBUNIDADE: TIBStringField;
    IBTable_InstrutorDESCLICENCIATURA: TIBStringField;
    IBTable_InstrutorIDUNIDADE: TIBStringField;
    Label_Saram: TLabel;
    DBEdit_Saram: TDBEdit;
    Memo1: TMemo;
    IBTable_InstrutorTurmaSENHA: TIBStringField;
    IBTable_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    IBTable_PessoaNOME: TIBStringField;
    IBTable_TelefoneIDENTIDADE: TIBStringField;
    IBTable_TelefoneCELULAR1: TIBStringField;
    IBTable_TelefoneTEL_RESIDENCIAL: TIBStringField;
    IBTable_TelefoneTEL_CONTATO: TIBStringField;
    IBTable_TelefoneTEL_COMERCIAL: TIBStringField;
    IBTable_TelefoneCELULAR: TIBStringField;
    IBTable_TelefoneFAX: TIBStringField;
    GroupBox_TipoAluno: TGroupBox;
    DBComboBox_TipoLista: TDBComboBox;
    Panel_Botoes: TPanel;
    Memo3: TMemo;
    JvGradient_Tela01: TJvGradient;
    JvGradient_Tela02: TJvGradient;
    JvGradient_Tela03: TJvGradient;
    JvGradient_Tela04: TJvGradient;
    IBTable_InstrutorTurmaTIPO_INSTRUTOR: TIBStringField;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    MaskEdit_CPF: TMaskEdit;
    IBQuery_Pessoa: TIBQuery;
    IBQuery_PessoaIDENTIDADE: TIBStringField;
    DSQ_Pessoa: TDataSource;
    IBTable_PessoaIDENTIDADE_OLD: TIBStringField;
    JvEnterAsTab1: TJvEnterAsTab;
    Label30: TLabel;
    DBEdit_EMailAl: TDBEdit;
    Label13: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    DBEdit_Telefone: TDBEdit;
    DBEdit_Celular: TDBEdit;
    DBEdit_Empresa: TDBEdit;
    DBEdit_Celular02: TDBEdit;
    JvCaptionPanel1: TJvCaptionPanel;
    DBGrid_Materia: TDBGrid;
    DBNavigator2: TDBNavigator;
    ToolBar2: TToolBar;
    MaskEdit_CodMateria: TMaskEdit;
    Edit_DescDisciplina: TEdit;
    JvCaptionPanel2: TJvCaptionPanel;
    DBGrid_Abrangencia: TDBGrid;
    Panel4: TPanel;
    JvGradient_Tela05: TJvGradient;
    SpeedButton_Cadastra: TSpeedButton;
    SpeedButton_Excluir: TSpeedButton;
    DBComboBox_NomeGuerra: TDBComboBox;
    CheckBox_CTP020: TCheckBox;
    CheckBox_CTP021: TCheckBox;
    IBTable_InstrutorCTP020: TIBStringField;
    IBTable_InstrutorCTP021: TIBStringField;
    IBTable_FichaAvaliacao: TIBTable;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoIDAVALIACAO: TIntegerField;
    IBTable_FichaAvaliacaoIDFICHA: TSmallintField;
    IBTable_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;

    procedure Pesquisa_CPF;
    procedure Tratar_DBComboBox_TipoLista;
    procedure PesquisaIdentidadeInstrutor(VS_Identidade: String);
    procedure NovoInstrutor;
    procedure TrataCapacitacao;
    procedure GravaCapacitacao;
    procedure TrataSelDisciplina(Sender: TObject);
    procedure InstrutorCurso;
    procedure TratarAntiguidade;

    procedure FormActivate(Sender: TObject);
    procedure Edit_IdentidadeExit(Sender: TObject);
    procedure Edit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_PostoGraduacaoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_QuadroKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_NomeGuerraKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_SexoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_SubUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CidadeAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_UfAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CepAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_EMailAlKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_ResidencialKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBDateEdit_DataChegadaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NomeCompletoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CelularKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_ComercialKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_FuncaoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_SubUnidadeExit(Sender: TObject);
    procedure DBEdit_FaxExit(Sender: TObject);
    procedure JvDBDateEdit_DataSaidaKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_UnidadeExit(Sender: TObject);
    procedure JvDBDateEdit_ApresentacaoExit(Sender: TObject);
    procedure JvDBDateEdit_ApresentacaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_MateriaTitleClick(Column: TColumn);
    procedure SpeedButton_CadastraClick(Sender: TObject);
    procedure SpeedButton_ExcluirClick(Sender: TObject);
    procedure IBTable_InstrutorTurmaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure JvExpressButton_PasswordInstrutorClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure DBComboBox_TipoListaExit(Sender: TObject);
    procedure MaskEdit_CPFExit(Sender: TObject);
    procedure MaskEdit_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_SaramKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NomeCompletoExit(Sender: TObject);
    procedure DBEdit_SaramExit(Sender: TObject);
  private         { Private declarations }
     VS_PessoaTmp, VS_ComandoMateria, VS_OrderByMateria, VS_OpcaoInstrutor: String;
  public
    { Public declarations }
  end;

var
  Form_Cad_InstrutorTurma: TForm_Cad_InstrutorTurma;

implementation

uses Module, Sel_Turma, MenuPrincipal;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.FormActivate(Sender: TObject);
begin
   JvGradient_Tela01.StartColor:= Cor_Tela;
   JvGradient_Tela02.StartColor:= Cor_Tela;
   JvGradient_Tela03.StartColor:= Cor_Tela;
   JvGradient_Tela04.StartColor:= Cor_Tela;
   JvGradient_Tela05.StartColor:= Cor_Tela;

   //--- Tratamento do Sistema quanto a Avaliacao

   if ((Funcoes.GetSecao = 'ADMINISTRAÇÃO') or (Funcoes.GetSecao  = 'AVALIAÇÃO')) then
   begin
      SpeedButton_SenhaAcesso.Visible:= True;
      JvShape_SenhaAcesso.Visible:= True;
   end
   else
   begin
      SpeedButton_SenhaAcesso.Visible:= False;
      JvShape_SenhaAcesso.Visible:= False;
   end;

   //--- Abre as tabelas

   IBTable_InstrutorTurma.Open;
   IBTable_Pessoa.Open;
   IBTable_Endereco.Open;
   IBTable_Telefone.Open;
   IBTable_Instrutor.Open;
   IBTable_InstrutorMateria.Open;

   VS_OrderByMateria:= ' order by CodMateria ';
   TrataSelDisciplina(Sender);

   //--- Alimenta os ComboBox utilizados

   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Funcao, 'Funcao', 'Instrutor_Funcao', '', 'Id');
   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_PostoGraduacao, 'PostoGraduacao', 'Antiguidade', '', 'PostoGraduacao');

   Funcoes_SUE.AlimentaDBComboBox(ComboBox_Quadro, 'Quadro', 'QuadroEsp', '', 'Quadro');

   Funcoes_SUE.AlimentaDBComboBox(ComboBox_Unidade, 'IdUnidade', 'TAB_UNIDADE', '', 'IdUnidade');
   Funcoes_SUE.AlimentaDBComboBox(ComboBox_SubUnidade, 'IdSubUnidade', 'TAB_SubUnidade', '', 'IdUnidade, IdSubUnidade');

   Funcoes_SUE.AlimentaDBComboBox(DBComboBox_Pais, 'NomePais', 'Tab_Pais', '', 'NomePais');

   //--- Tratamento da operação que sera realizada com relaco ao Instrutor

   VS_PessoaTmp:= '';
   PageControl_CadInstrutor.TabIndex:= 0;

   if Form_SelTurma.VS_Instrutor = 'Novo' then    // Tratamento realizado para cadastrar um novo Instrutor
   begin
      Form_Cad_InstrutorTurma.Caption:= 'Cadastro Instrutor - Novo';
      NovoInstrutor;
   end
   else                                                     // Tratamento realizado na alteração das informacoes do Instrutor
   begin
      Funcoes.ExecutaQuery(IBQuery_Pessoa, 'Select identidade from pessoa pe where pe.Identidade = '+#39+Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39);

      VS_OpcaoInstrutor:= 'Alterar';
      Form_Cad_InstrutorTurma.Caption:= 'Cadastro Instrutor - '+Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Nome').AsString;

      if IBTable_Pessoa.FieldByName('Identidade_Old').AsString <> '' then
         Edit_Identidade.Text:= IBTable_Pessoa.FieldByName('Identidade_Old').AsString
      else
         Edit_Identidade.Text:= IBTable_Pessoa.FieldByName('Identidade').AsString;

      IBTable_InstrutorTurma.Edit;
      IBTable_Pessoa.Edit;
      IBTable_Instrutor.Edit;
      IBTable_Endereco.Edit;
      IBTable_Telefone.Edit;
      TrataCapacitacao;

      MaskEdit_CPF.Visible:= False;
      DBEdit_CPF.Visible:= True;

      DBEdit_Saram.SetFocus;

   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if  VS_PessoaTmp = 'Temp' then
       Funcoes.ExecusaoQuery('delete From pessoa Where Identidade = '+#39+'Temp'+#39);   // Delete a pessoa temporaria para gravar as materias do Instrutor
   IBTable_InstrutorMateria.Close;
   IBTable_InstrutorTurma.Close;
   IBTable_Pessoa.Close;
   IBTable_Instrutor.Close;
   IBTable_Endereco.Close;
   IBTable_Telefone.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.NovoInstrutor;
begin
   MaskEdit_CPF.Text:= '';

   //--- Desabilita as outras Abas

   PageControl_CadInstrutor.TabIndex:= 0;
   TabSheet_Endereco.Enabled:= False;
   TabSheet_ParticipacaoNaTurma.Enabled:= False;
   TabSheet_Capacitacao.Enabled:= False;

   //--- Limpa os Campos

   MaskEdit_CPF.Visible:= True;
   DBEdit_CPF.Visible:= False;

   IBTable_Pessoa.Close;

   Edit_Identidade.Text:= '';
   DBEdit_CPF.Text:= '';
   DBEdit_NomeCompleto.Text:= '';
   DBComboBox_NomeGuerra.Text:= '';
   DBComboBox_PostoGraduacao.Text:= '';
   ComboBox_Quadro.Text:= '';
   DBComboBox_Sexo.Text:= '';
   ComboBox_Unidade.Text:= '';
   ComboBox_SubUnidade.Text:= '';
   JvDBDateEdit_Apresentacao.Date:= Date;
   JvDBDateEdit_DataChegada.Date:= Date;

   VS_OpcaoInstrutor:= 'Pesquisar_CPF';

   MaskEdit_CPF.SetFocus;
end;

//------------------------------------------------------------------------------
// Pesquisa se o Instrutor já esta cadastrado
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.PesquisaIdentidadeInstrutor(VS_Identidade: String);
var
   VS_Identidade_Instrutor: String;
   Sender: TObject;
begin
   if ((VS_OpcaoInstrutor = 'Pesquisar') or (VS_OpcaoInstrutor = 'Pesquisar_CPF')) then
   begin
      if ((trim(Edit_Identidade.Text) = '') and (VS_OpcaoInstrutor = 'Pesquisar')) then
      begin
         ShowMessage('A Identificação não pode ser Branco...');
         Edit_Identidade.SetFocus;
      end
      else
      begin
         if VS_OpcaoInstrutor = 'Pesquisar' then
         begin
            VS_OpcaoInstrutor:= 'Inserir';
            MaskEdit_CPF.Visible:= False;
            DBEdit_CPF.Visible:= True;

            IBTable_Pessoa.Open;

            // Verifica se o Instrutor encontra-se na lista de pessoas
            Funcoes.ExecutaQuery(IBQuery_Pessoa, 'Select identidade from pessoa pe where pe.Identidade = '+#39+VS_Identidade+#39);


            if IBQuery_Pessoa.FieldByName('Identidade').AsString = '' then
            begin
               VS_Identidade_Instrutor:=  MaskEdit_CPF.Text;
               IBTable_Pessoa.Append;
               IBTable_Pessoa.FieldByName('Identidade_Old').AsString:= Edit_Identidade.Text;
               IBTable_Pessoa.FieldByName('Identidade').AsString:= VS_Identidade_Instrutor;
               IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= MaskEdit_CPF.Text;
               IBTable_Pessoa.FieldByName('NomePais').AsString:= 'BRASIL';
               IBTable_Pessoa.FieldByName('Sexo').AsString:= '';


               IBTable_Instrutor.Append;
               IBTable_Instrutor.FieldByName('IDENTIDADE').AsString:= VS_Identidade_Instrutor;

               IBTable_Endereco.Append;
               IBTable_Endereco.FieldByName('IDENTIDADE').AsString:= VS_Identidade_Instrutor;
               IBTable_Endereco.FieldByName('Pais').AsString:= 'BRASIL';

               IBTable_Telefone.Append;
               IBTable_Telefone.FieldByName('IDENTIDADE').AsString:= VS_Identidade_Instrutor;

               VS_OpcaoInstrutor:= 'Inserir';
            end
            else
            begin
               VS_Identidade_Instrutor:= IBTable_Pessoa.FieldByName('Identidade').AsString;
               if Funcoes.QtdRegistro('Select count(1) Qtd from Instrutor where Identidade = '+#39+VS_Identidade_Instrutor+#39) = 0 then
               begin
                  IBTable_Instrutor.Append;
                  IBTable_Instrutor.FieldByName('Identidade').AsString:= VS_Identidade_Instrutor;
               end
               else
                  IBTable_Instrutor.Edit;

               IBTable_Pessoa.Edit;
               IBTable_Endereco.Edit;
               IBTable_Telefone.Edit;

               if IBTable_Pessoa.FieldByName('Identidade_Old').AsString = '' then
                  IBTable_Pessoa.FieldByName('Identidade_Old').AsString:= IBTable_Pessoa.FieldByName('Identidade').AsString;
               ComboBox_Unidade.Text:= IBTable_Pessoa.FieldByName('IdUnidade').AsString;
               ComboBox_SubUnidade.Text:= IBTable_Pessoa.FieldByName('IdSubUnidade').AsString;
            end;

            IBTable_InstrutorTurma.Append;

            IBTable_InstrutorTurma.FieldByName('CodigoInstrutor').AsString:= Funcoes.GerarCodigoInstrutor(DM.IBTable_Turma.FieldByName('IdCurso').AsString, DM.IBTable_Turma.FieldByName('IdTurma').AsString);
            IBTable_InstrutorTurma.FieldByName('senha').AsString:= IBTable_InstrutorTurma.FieldByName('CodigoInstrutor').AsString;
            IBTable_InstrutorTurma.FieldByName('IdCurso').AsString:= DM.IBTable_Turma.FieldByName('IdCurso').AsString;
            IBTable_InstrutorTurma.FieldByName('IdTurma').AsString:= DM.IBTable_Turma.FieldByName('IdTurma').AsString;
            IBTable_InstrutorTurma.FieldByName('Identidade').AsString:= VS_Identidade_Instrutor;
            IBTable_InstrutorTurma.FieldByName('DataChegada').AsString:= DM.IBTable_Turma.FieldByName('DataInicio').AsString;
            IBTable_InstrutorTurma.FieldByName('DataSaida').AsString:= DM.IBTable_Turma.FieldByName('DataTermino').AsString;
            IBTable_InstrutorTurma.FieldByName('Funcao').AsString:= 'INSTRUTOR';
            IBTable_InstrutorTurma.FieldByName('Ficha').AsString:= 'Conferir';
            IBTable_InstrutorTurma.FieldByName('Apresentacao').AsString:= '';

            TrataCapacitacao;
            TabSheet_Endereco.Enabled:= True;
            TabSheet_ParticipacaoNaTurma.Enabled:= True;
            TabSheet_Capacitacao.Enabled:= True;

            VS_OpcaoInstrutor:= 'Novo';

            if MaskEdit_CPF.Text <> '' then
            begin
               DBEdit_CPF.Text:= MaskEdit_CPF.Text;
               IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= MaskEdit_CPF.Text;
               DBEdit_Saram.SetFocus;
            end
            else
               DBEdit_CPF.SetFocus;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento chamada pela Pesquisa pelo CPF
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.MaskEdit_CPFExit(Sender: TObject);
begin
   if VS_OpcaoInstrutor = 'Pesquisar_CPF' then
      Pesquisa_CPF;
end;

procedure TForm_Cad_InstrutorTurma.MaskEdit_CPFKeyPress(Sender: TObject; var Key: Char);
begin
   if ((Key = #13) and (VS_OpcaoInstrutor = 'Pesquisar_CPF')) then
      Pesquisa_CPF;
end;

//------------------------------------------------------------------------------
// Tratamento da Pesquisa do Aluno pelo CPF
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.Pesquisa_CPF;
begin
    if ((VS_OpcaoInstrutor = 'Pesquisar_CPF') and (MaskEdit_CPF.Text <> '')) then
   begin
      if ((MaskEdit_CPF.Text <> '') and (length(MaskEdit_CPF.Text) < 11)) then
      begin
         ShowMessage('Faltando número no CPF ou CPF invalido....');
         MaskEdit_CPF.SetFocus
      end
      else
      begin
         Funcoes.OpenQuery('Select Identidade, Identidade_old from pessoa where CPF_CIC = '+#39+MaskEdit_CPF.Text+#39);
         if DM.IBQuery_Executa.FieldByName('IDENTIDADE').AsString = '' then
         begin
            VS_OpcaoInstrutor:= 'Pesquisar';
            DBEdit_CPF.Text:= MaskEdit_CPF.Text;
            Edit_Identidade.SetFocus;
         end
         else
         begin
            VS_OpcaoInstrutor:= 'Pesquisar';

            if DM.IBQuery_Executa.FieldByName('Identidade_Old').AsString = '' then
               Edit_Identidade.Text:= DM.IBQuery_Executa.FieldByName('Identidade').AsString
            else
               Edit_Identidade.Text:= DM.IBQuery_Executa.FieldByName('Identidade_Old').AsString;

            MaskEdit_CPF.Visible:= False;
            DBEdit_CPF.Visible:= True;
            if  MaskEdit_CPF.Text <> DM.IBQuery_Executa.FieldByName('Identidade').AsString then
               PesquisaIdentidadeInstrutor(DM.IBQuery_Executa.FieldByName('Identidade').AsString)
            else
               PesquisaIdentidadeInstrutor(MaskEdit_CPF.Text);
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Sair da entrada da identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.Edit_IdentidadeExit(Sender: TObject);
begin
   if ((VS_OpcaoInstrutor <> 'Novo') and (VS_OpcaoInstrutor <> 'Alterar'))  then
   begin
      VS_OpcaoInstrutor:= 'Pesquisar';
      PesquisaIdentidadeInstrutor(Edit_Identidade.Text);
   end
   else
   begin
      if MaskEdit_CPF.Text <> '' then
      begin
         DBEdit_CPF.Text:= MaskEdit_CPF.Text;
         IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= MaskEdit_CPF.Text;
         DBEdit_Saram.SetFocus;
      end
      else
         DBEdit_CPF.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando for pressionado a Tecla ENTER no numero da identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.Edit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      if VS_OpcaoInstrutor <> 'Alterar' then
      begin
         VS_OpcaoInstrutor:= 'Pesquisar';
         PesquisaIdentidadeInstrutor(Edit_Identidade.Text);
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

procedure TForm_Cad_InstrutorTurma.JvTransparentButton_GravaClick(Sender: TObject);
var
   VS_IdAvaliacao, VS_Identidade, VS_Data_Chegada, VS_Data_Saida, VS_Data_Saida1, VS_POstoGraduacao, VS_Quadro: String;
   Ano, Mes, Dia : word;
begin
   //--- Valida os campos obrigatorios
   if Funcoes.ValidaCampo(Edit_Identidade.Text, 'Identificação') = False then
   begin
      PageControl_CadInstrutor.TabIndex:= 0;
      Edit_Identidade.SetFocus;
   end
   else
   begin
      if Funcoes.ValidaCampo(DBEdit_NomeCompleto.Text, 'Nome Completo') = False then
      begin
         PageControl_CadInstrutor.TabIndex:= 0;
         DBEdit_NomeCompleto.SetFocus;
      end
      else
      begin
         if Funcoes.ValidaCampo(DBComboBox_NomeGuerra.Text, 'Nome Guerra') = False then
         begin
            PageControl_CadInstrutor.TabIndex:= 0;
            DBComboBox_NomeGuerra.SetFocus;
         end
         else
         begin
            if Funcoes.ValidaCampo(DBComboBox_PostoGraduacao.Text, 'Posto Graduação') = False then
            begin
               PageControl_CadInstrutor.TabIndex:= 0;
               DBComboBox_PostoGraduacao.SetFocus;
            end
            else
            begin
               if Funcoes.ValidaCampo(ComboBox_Unidade.Text, 'Unidade') = False then
               begin
                  PageControl_CadInstrutor.TabIndex:= 0;
                  ComboBox_Unidade.SetFocus;
               end
               else
               begin      // Inicia a Gravacao
                     //--- Grava o Curso para o Instrutor

                     if IBTable_Pessoa.FieldByName('Identidade').AsString <> '' then
                        VS_Identidade:= IBTable_Pessoa.FieldByName('Identidade').AsString;

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

                     if Form_SelTurma.VS_Instrutor = 'Alterar' then
                     begin
                        IBTable_Pessoa.Edit;
                        IBTable_Pessoa.FieldByName('Identidade_Old').AsString:= Edit_Identidade.Text;
                        VS_Identidade:= IBTable_Pessoa.FieldByName('Identidade').AsString;
                     end
                     else
                     begin
                        if ((IBTable_Pessoa.State = DSInsert)) then
                        begin
                           if trim(MaskEdit_CPF.Text) = '' then
                           begin
                              IBTable_Pessoa.FieldByName('Identidade').AsString:= Edit_Identidade.Text;
                              VS_Identidade:= Edit_Identidade.Text;
                           end
                           else
                           begin
                              IBTable_Pessoa.FieldByName('Identidade').AsString:= MaskEdit_CPF.Text;
                              VS_Identidade:= MaskEdit_CPF.Text;
                           end;

                           IBTable_Pessoa.FieldByName('Identidade_Old').AsString:= Edit_Identidade.Text;
                        end;
                     end;


                     VS_Data_Chegada:= Funcoes.DePara(DateToStr(JvDBDateEdit_DataChegada.Date), '/', '.');
                     VS_Data_Chegada:= VS_Data_Chegada+' 00:00';


                     VS_Data_Saida1:= DateToStr(JvDBDateEdit_DataSaida.Date-2);
                     VS_Data_Saida:= Funcoes.DePara(DateToStr(JvDBDateEdit_DataSaida.Date), '/', '.');

                     VS_Data_Saida:= VS_Data_Saida+' 00:00';

                     Funcoes.OpenQuery( ' Select Identidade '+
                                        ' From InstrutorTurma '+
                                        ' where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                        ' and   IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                                        ' and   identidade = '+#39+IBTable_Pessoa.FieldByName('Identidade').AsString+#39+
                                        ' and   DataChegada = '+#39+VS_Data_Chegada+#39+
                                        ' and   DataSaida = '+#39+VS_Data_Saida+#39
                                      );

                     if ((DM.IBQuery_Executa.FieldByName('Identidade').AsString <> '') and (VS_OpcaoInstrutor = 'Novo')) then
                     begin
                        ShowMessage('Instrutor já cadastrado para o período selecionado, verifica a data de entrada e saída...');
                        PageControl_CadInstrutor.TabIndex:= 2;
                        JvDBDateEdit_DataChegada.SetFocus;
                     end
                     else
                     begin
                        if ((IBTable_Pessoa.State = DSInsert) or (IBTable_Pessoa.State = DSEdit )) then
                        begin
                           IBTable_Pessoa.FieldByName('IdUnidade').AsString:= ComboBox_Unidade.Text;
                           IBTable_Pessoa.FieldByName('IdSubUnidade').AsString:= ComboBox_SubUnidade.Text;
                           IBTable_Pessoa.FieldByName('PostoGraduacao').AsString:= trim(DBComboBox_PostoGraduacao.Text);
                           IBTable_Pessoa.Post;
                        end;

                        if ((IBTable_Instrutor.State = DSInsert) or (IBTable_Instrutor.State = DSEdit )) then
                        begin
                           GravaCapacitacao;
                           IBTable_Instrutor.FieldByName('Identidade').AsString:= IBTable_Pessoa.FieldByName('Identidade').AsString;
                           IBTable_Instrutor.Post;
                        end;

                        if ((IBTable_InstrutorTurma.State = DSInsert) or (IBTable_InstrutorTurma.State = DSEdit )) then
                        begin
                           if trim(IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString) = '' then
                              IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString:= IBTable_InstrutorTurma.FieldByName('IdUnidade').AsString;

                           if Trim(IBTable_Pessoa.FieldByName('PostoGraduacao').AsString) = '' then
                              VS_PostoGraduacao:= ''
                           else
                              VS_PostoGraduacao:= Trim(IBTable_Pessoa.FieldByName('PostoGraduacao').AsString)+' ';

                           if Trim(IBTable_Pessoa.FieldByName('QuadroEsp').AsString) = '' then
                              VS_Quadro:= ''
                           else
                           VS_Quadro:= Trim(IBTable_Pessoa.FieldByName('QuadroEsp').AsString)+' ';

                           TratarAntiguidade;
                           IBTable_InstrutorTurma.FieldByName('Identidade').AsString:= IBTable_Pessoa.FieldByName('Identidade').AsString;
                           IBTable_InstrutorTurma.FieldByName('IdUnidade').AsString:= ComboBox_Unidade.Text;
                           IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString:= ComboBox_SubUnidade.Text;
                           IBTable_InstrutorTurma.FieldByName('NomeCompleto').AsString:= VS_PostoGraduacao+VS_Quadro+Trim(IBTable_Pessoa.FieldByName('Nome').AsString);

                           IBTable_InstrutorTurma.Post;
                        end;

                        if ((IBTable_Endereco.State = DSInsert) or (IBTable_Endereco.State = DSEdit )) then
                        begin
                           if ((IBTable_Endereco.State = DSInsert)) then
                              IBTable_Endereco.FieldByName('Identidade').AsString:= IBTable_Pessoa.FieldByName('Identidade').AsString;
                           IBTable_Endereco.Post;
                        end;

                        if ((IBTable_Telefone.State = DSInsert) or (IBTable_Telefone.State = DSEdit )) then
                        begin
                           if ((IBTable_Telefone.State = DSInsert)) then
                              IBTable_Telefone.FieldByName('Identidade').AsString:= IBTable_Pessoa.FieldByName('Identidade').AsString;
                           IBTable_Telefone.Post;
                        end;

                        if VS_OpcaoInstrutor <> 'Alterar' then
                            JvExpressButton_PasswordInstrutorClick(Sender);

                        InstrutorCurso;
                        if  VS_PessoaTmp = 'Temp' then
                        begin
                           Funcoes.ExecusaoQuery('Update InstrutorMateria set Identidade = '+#39+Edit_Identidade.Text+#39+' Where Identidade = '+#39+'Temp'+#39);   // Muda a pessoa temporaria para o Instrutor
                           Funcoes.ExecusaoQuery('delete From pessoa Where Identidade = '+#39+'Temp'+#39);   // Delete a pessoa temporaria para gravar as materias do Instrutor
                        end;

                        Funcoes.ExecutaTransacao;
                        Funcoes.ExecusaoQuery('delete From pessoa Where Identidade = '+#39+'Temp'+#39);   // Delete a pessoa temporaria para gravar as materias do Instrutor

                        Form_SelTurma.MontaInstrutor(Sender);
                        if Form_SelTurma.VS_Instrutor = 'Novo' then    // Tratamento realizado para cadastrar um novo Instrutor
                        begin
                           // Cadastra Ficha de Avaliacao do Instrutor Responsavel/Coordenador

                           if ((IBTable_InstrutorTurma.FieldByName('Funcao').AsString = 'INSTRUTOR RESPONSÁVEL') or
                               (IBTable_InstrutorTurma.FieldByName('Funcao').AsString = 'COORDENADOR') or
                               (IBTable_InstrutorTurma.FieldByName('Funcao').AsString = 'COORDENADOR INSTRUTOR')) Then
                           begin
                              //--- Veridicar se a Ficha foi Cadastrada

                              Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd  '+
                                                                       ' From FAC_Avaliacao F1, FAC_Avaliador F2 '+
                                                                       ' where F1.idavaliacao = F2.idavaliacao '+
                                                                       ' and   F1.IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                                                       ' and   F1.IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                                                                       ' and   F1.IdFicha = 4'+
                                                                       ' and   F2.IdAvaliador = '+#39+IBTable_InstrutorTurma.FieldByName('Identidade').AsString+#39
                                            );
                              if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then
                              begin
                                 //--- Cadastro Avaliacao

                                 VS_IdAvaliacao:= Validar.RetornaUltimoIDAvaliacao;
                                 IBTable_FichaAvaliacao.Open;
                                 IBTable_FichaAvaliacao.Append;
                                 IBTable_FichaAvaliacao.FieldByName('DataAvaliacao').AsString:= VS_Data_Saida1;
                                 Validar.CadastroAvaliacao(IBTable_FichaAvaliacao, VS_IdAvaliacao, '4');

                                 //--- Configura o Avaliador

                                 Validar.CadastroAvaliador(VS_IdAvaliacao, IBTable_InstrutorTurma.FieldByName('Identidade').AsString);
                                 IBTable_FichaAvaliacao.Close;
                              end;
                           end;

                           funcoes.AtualizaQuery(Form_SelTurma.IBQuery_InstrutorTurma);
                           VS_OpcaoInstrutor:= 'Pesquisar';
                           Edit_Identidade.Text:= '';
                           NovoInstrutor;
                        end
                        else
                        begin
                           Close;
                        end;
                  end;
                end;
            end;
         end;
      end;
   end;
end;


//------------------------------------------------------------------------------
// Tratamento do Botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if ((IBTable_Instrutor.State = DSInsert) or (IBTable_Instrutor.State = DSEdit )) then
      IBTable_Instrutor.Cancel;

   if ((IBTable_Telefone.State = DSInsert) or (IBTable_Telefone.State = DSEdit )) then
      IBTable_Telefone.Cancel;

   if ((IBTable_Endereco.State = DSInsert) or (IBTable_Endereco.State = DSEdit )) then
      IBTable_Endereco.Cancel;

   if ((IBTable_InstrutorTurma.State = DSInsert) or (IBTable_InstrutorTurma.State = DSEdit )) then
      IBTable_InstrutorTurma.Cancel;

   if ((IBTable_Pessoa.State = DSInsert) or (IBTable_Pessoa.State = DSEdit )) then
      IBTable_Pessoa.Cancel;

   Funcoes.abortaTransacao;;
   if  VS_PessoaTmp = 'Temp' then
       Funcoes.ExecusaoQuery('delete From pessoa Where Identidade = '+#39+'Temp'+#39);   // Delete a pessoa temporaria para gravar as materias do Instrutor
   Close;
end;


//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_CPFKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      PageControl_CadInstrutor.TabIndex:= 0;
      DBEdit_NomeCompleto.SetFocus;
   end;
end;

procedure TForm_Cad_InstrutorTurma.DBComboBox_TipoListaExit(Sender: TObject);
begin
  Tratar_DBComboBox_TipoLista;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.Tratar_DBComboBox_TipoLista;
var
   VS_Origem: String;
begin
   if ((IBTable_InstrutorTurma.State = DSInsert) or (IBTable_InstrutorTurma.State = DSEdit )) then
   begin
      if DBComboBox_TipoLista.Text = 'CIVIL' then
      begin
         DBComboBox_PostoGraduacao.Text:= 'CV';
         if ((IBTable_Pessoa.State = DSInsert) or (IBTable_Pessoa.State = DSEdit )) then
            IBTable_Pessoa.FieldByName('PostoGraduacao').AsString:= 'CV';

         TratarAntiguidade;
         DBComboBox_PostoGraduacao.Enabled:= False;
         ComboBox_Quadro.Enabled:= False;
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
         DBComboBox_PostoGraduacao.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_NomeCompletoExit( Sender: TObject);
begin
   Funcoes.Tratar_NomeGuerra(DBComboBox_NomeGuerra, DBEdit_NomeCompleto.Text);
end;

procedure TForm_Cad_InstrutorTurma.DBEdit_NomeCompletoKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm_Cad_InstrutorTurma.DBComboBox_NomeGuerraKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBComboBox_Sexo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBComboBox_PostoGraduacaoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      ComboBox_Quadro.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.ComboBox_QuadroKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBEdit_NomeCompleto.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBComboBox_SexoKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      ComboBox_Unidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.ComboBox_UnidadeKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      ComboBox_UnidadeExit(Sender);
end;

procedure TForm_Cad_InstrutorTurma.ComboBox_UnidadeExit(Sender: TObject);
begin
   Funcoes_SUE.AlimentaDBComboBox(ComboBox_SubUnidade, 'IdSubUnidade', 'TAB_SubUnidade', 'IdUnidade = '+#39+ComboBox_Unidade.Text+#39, 'IdUnidade, IdSubUnidade');
   ComboBox_SubUnidade.SetFocus;

end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.ComboBox_SubUnidadeKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
        ComboBox_SubUnidadeExit(Sender);
end;

procedure TForm_Cad_InstrutorTurma.ComboBox_SubUnidadeExit(Sender: TObject);
begin
   if PageControl_CadInstrutor.TabIndex = 0 then
   begin
      if ((IBTable_InstrutorTurma.State = DSInsert) or (IBTable_InstrutorTurma.State = DSEdit )) then
      begin
         if  Trim(ComboBox_SubUnidade.Text) = '' then
         begin
            PageControl_CadInstrutor.TabIndex:= 0;

            IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString:= IBTable_InstrutorTurma.FieldByName('IdUnidade').AsString;
            ComboBox_SubUnidade.Text:= ComboBox_Unidade.Text;
         end;

         PageControl_CadInstrutor.TabIndex:= 1;
         DBEdit_EnderecoAl.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_CidadeAlKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBComboBox_UfAl.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBComboBox_UfAlKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_CepAl.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_CepAlKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBComboBox_Pais.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBComboBox_PaisKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_EMailAl.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_EMailAlKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBEdit_Telefone.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_ResidencialKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      DBEdit_Empresa.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_ComercialKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_Celular.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_CelularKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBEdit_Fax.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBEdit_FaxKeyPress(Sender: TObject;  var Key: Char);
begin
   if key = #13 then
      DBEdit_FaxExit(Sender);
end;

procedure TForm_Cad_InstrutorTurma.DBEdit_FaxExit(Sender: TObject);
begin
   if PageControl_CadInstrutor.TabIndex = 1 then
   begin
      if TabSheet_ParticipacaoNaTurma.Enabled = False then
          TabSheet_ParticipacaoNaTurma.Enabled:= True;

      PageControl_CadInstrutor.TabIndex:= 2;
      DBComboBox_Funcao.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBComboBox_FuncaoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      JvDBDateEdit_Apresentacao.SetFocus;
end;

procedure TForm_Cad_InstrutorTurma.JvDBDateEdit_ApresentacaoExit(Sender: TObject);
begin
   if PageControl_CadInstrutor.TabIndex = 2 then
   begin
      if TabSheet_Capacitacao.Enabled = False then
          TabSheet_Capacitacao.Enabled:= True;

      PageControl_CadInstrutor.TabIndex:= 3;
      CheckBox_CTP001.SetFocus;
   end;
end;

procedure TForm_Cad_InstrutorTurma.JvDBDateEdit_ApresentacaoKeyPress( Sender: TObject; var Key: Char);
begin
   if key = #13 then
      JvDBDateEdit_ApresentacaoExit(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da saida (exit) do campo
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.JvDBDateEdit_DataChegadaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      JvDBDateEdit_DataSaida.SetFocus;
end;

procedure TForm_Cad_InstrutorTurma.JvDBDateEdit_DataSaidaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBComboBox_Funcao.SetFocus;
end;

//------------------------------------------------------------------------------
// Chama a Rotina de Cadastro da senha de acesso as Fichas de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.JvExpressButton_PasswordInstrutorClick(Sender: TObject);
begin
   Funcoes.CadastrarAcessoFichaAvaliacao(  DM.IBTable_Turma.FieldByName('IdCurso').AsString,
                                           DM.IBTable_Turma.FieldByName('IdTurma').AsString,
                                           IBTable_InstrutorTurma.FieldByName('Identidade').AsString,
                                           IBTable_Pessoa.FieldByName('NomeGuerra').AsString,
                                           IBTable_InstrutorTurma.FieldByName('CODIGOINSTRUTOR').AsString
                                         );
end;

//------------------------------------------------------------------------------
// Trata Apresentacao da Capacitacao
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.TrataCapacitacao;
begin
   if IBTable_Instrutor.FieldByName('NENHUM').AsString = 'S' then
      CheckBox_Nenhum.Checked:= True
   else
      CheckBox_Nenhum.Checked:= False;

   if IBTable_Instrutor.FieldByName('CG015').AsString = 'S' then
      CheckBox_CG015.Checked:= True
   else
      CheckBox_CG015.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP001').AsString = 'S' then
      CheckBox_CTP001.Checked:= True
   else
      CheckBox_CTP001.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP006').AsString = 'S' then
      CheckBox_CTP006.Checked:= True
   else
      CheckBox_CTP006.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP011').AsString = 'S' then
      CheckBox_CTP011.Checked:= True
   else
      CheckBox_CTP011.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP020').AsString = 'S' then
      CheckBox_CTP020.Checked:= True
   else
      CheckBox_CTP020.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP021').AsString = 'S' then
      CheckBox_CTP021.Checked:= True
   else
      CheckBox_CTP021.Checked:= False;

   if IBTable_Instrutor.FieldByName('CPI').AsString = 'S' then
      CheckBox_CPI.Checked:= True
   else
      CheckBox_CPI.Checked:= False;

   if IBTable_Instrutor.FieldByName('CTP500').AsString = 'S' then
      CheckBox_CTP500.Checked:= True
   else
      CheckBox_CTP500.Checked:= False;

   if IBTable_Instrutor.FieldByName('LICENCIATURA').AsString = 'S' then
      CheckBox_Licenciatura.Checked:= True
   else
      CheckBox_Licenciatura.Checked:= False;
end;


//------------------------------------------------------------------------------
// Trata Gravacao da Capacitacao
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.GravaCapacitacao;
begin
   if CheckBox_Nenhum.Checked = True then
      IBTable_Instrutor.FieldByName('NENHUM').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('NENHUM').AsString:= 'N';

   if CheckBox_CG015.Checked = True then
      IBTable_Instrutor.FieldByName('CG015').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CG015').AsString:= 'N';

   if CheckBox_CTP001.Checked = True then
      IBTable_Instrutor.FieldByName('CTP001').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CTP001').AsString:= 'N';

   if CheckBox_CTP006.Checked = True then
      IBTable_Instrutor.FieldByName('CTP006').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CTP006').AsString:= 'N';

   if CheckBox_CTP011.Checked = True then
      IBTable_Instrutor.FieldByName('CTP011').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CTP011').AsString:= 'N';

   if CheckBox_CTP020.Checked = True then
      IBTable_Instrutor.FieldByName('CTP020').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CTP020').AsString:= 'N';

   if CheckBox_CTP021.Checked = True then
      IBTable_Instrutor.FieldByName('CTP021').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CTP021').AsString:= 'N';

   if CheckBox_CPI.Checked = True then
      IBTable_Instrutor.FieldByName('CPI').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CPI').AsString:= 'N';

   if CheckBox_CTP500.Checked = True then
      IBTable_Instrutor.FieldByName('CTP500').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('CTP500').AsString:= 'N';

   if CheckBox_Licenciatura.Checked = True then
      IBTable_Instrutor.FieldByName('LICENCIATURA').AsString:= 'S'
   else
      IBTable_Instrutor.FieldByName('LICENCIATURA').AsString:= 'N';
end;

//------------------------------------------------------------------------------
// Tratamento para Filtrar relacao das Disciplinas da Turma
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.TrataSelDisciplina(Sender: TObject);
begin
   VS_ComandoMateria:= ' Select Distinct IdCurso, CodMateria, NomeMateria '+
                       ' From MateriaCurso '+
                       ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                       ' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString;

   if trim(MaskEdit_CodMateria.Text) <> '' then
      VS_ComandoMateria:= VS_ComandoMateria+ ' and CodMateria like '+#39+MaskEdit_CodMateria.Text+'%'+#39;

   if trim(Edit_DescDisciplina.Text) <> '' then
      VS_ComandoMateria:= VS_ComandoMateria+ ' and NomeMateria like '+#39+Edit_DescDisciplina.Text+'%'+#39;

   Funcoes.ExecutaQuery(IBQuery_Materia, VS_ComandoMateria +VS_OrderByMateria);
end;

//------------------------------------------------------------------------------
// Tratamento do para Classificar as Disciplinas de acordo com cabecalho
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.DBGrid_MateriaTitleClick(Column: TColumn);
begin
   VS_OrderByMateria:= ' ';

   if (column.Title.Caption = 'Disciplina' ) then
       VS_OrderByMateria:= ' order by CodMateria '
   else
     if trim(column.Title.Caption) = 'Descrição' then
         VS_OrderByMateria:= ' order by NomeMateria';

   Funcoes.ExecutaQuery(IBQuery_Materia, VS_ComandoMateria +VS_OrderByMateria);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir Disciplina para o Instrutor
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.SpeedButton_CadastraClick(Sender: TObject);
var
   VS_Identidade, VS_Comando: String;
begin
   if  VS_PessoaTmp = 'Temp' then
      VS_Identidade:= VS_PessoaTmp
   else
      VS_Identidade:= IBTable_InstrutorTurma.FieldByName('Identidade').AsString;

   if IBQuery_Materia.FieldByName('CodMateria').AsString = '' then
   begin
      ShowMessage(' Não foi selecionado Disciplina...');
   end
   else
   begin
      VS_Comando:= 'Select count(1) Qtd from InstrutorMateria where IdCurso = '+IBTable_InstrutorTurma.FieldByName('IdCurso').AsString+
                   ' and Identidade = '+#39+VS_Identidade+#39+
                   ' and CodMateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39;
      if Funcoes.QtdRegistro(VS_Comando) > 0 then
          ShowMessage(' A Disciplina '+Trim(IBQuery_Materia.FieldByName('CodMateria').AsString)+' - '+Trim(IBQuery_Materia.FieldByName('NomeMateria').AsString)+#13+#13+' já foi cadastrada...   ')
      else
      begin
         IBTable_InstrutorMateria.Append;
         IBTable_InstrutorMateria.FieldByName('IdCurso').AsString:= IBTable_InstrutorTurma.FieldByName('IdCurso').AsString;
         IBTable_InstrutorMateria.FieldByName('Identidade').AsString:= VS_Identidade;
         IBTable_InstrutorMateria.FieldByName('CodMateria').AsString:= IBQuery_Materia.FieldByName('CodMateria').AsString;
         IBTable_InstrutorMateria.FieldByName('Status').AsString:= 'Ativo';
         IBTable_InstrutorMateria.FieldByName('Observacao').AsString:= '';
         IBTable_InstrutorMateria.Post;
         Funcoes.ExecutaTransacao;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Excluir Disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.SpeedButton_ExcluirClick(Sender: TObject);
begin
   if IBTable_InstrutorMateria.FieldByName('CodMateria').AsString = '' then
      ShowMessage(' Não foi selecionado Disciplina...')
   else
   begin
      IBTable_InstrutorMateria.Delete;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir Disciplina para o Instrutor
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.InstrutorCurso;
var
   VS_Identidade, VS_Comando: String;
begin
   VS_Identidade:= IBTable_InstrutorTurma.FieldByName('Identidade').AsString;

    VS_Comando:= 'Select count(1) Qtd from InstrutorCurso where IdCurso = '+IBTable_InstrutorTurma.FieldByName('IdCurso').AsString+' and Identidade = '+#39+VS_Identidade+#39;
    if Funcoes.QtdRegistro(VS_Comando) = 0 then
       Funcoes.ExecusaoQuery( 'Insert Into InstrutorCurso (IdCurso, Identidade, Status) '+
                              ' Values ('+IBTable_InstrutorTurma.FieldByName('IdCurso').AsString+', '+#39+VS_Identidade+#39+', '+#39+'Ativo'+#39+')'
                            );
end;

//------------------------------------------------------------------------------
// Tratamento da Antiguidade do Instrutor
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.TratarAntiguidade;
begin
   Funcoes.OpenQuery( 'Select Grupo From Antiguidade where PostoGraduacao = '+#39+Trim(DBComboBox_PostoGraduacao.Text)+#39);

   IBTable_InstrutorTurma.FieldByName('IDANTIGUIDADE').AsInteger:= dm.IBQuery_Executa.FieldByName('Grupo').AsInteger;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro
//------------------------------------------------------------------------------

procedure TForm_Cad_InstrutorTurma.IBTable_InstrutorTurmaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].Errorcode = 9729)) then
      MessageDlg('  Instrutor já foi cadastrado...  ',mtError, [mbOk],0);
end;

procedure TForm_Cad_InstrutorTurma.DBEdit_SaramKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      DBComboBox_TipoLista.SetFocus;
end;

procedure TForm_Cad_InstrutorTurma.DBEdit_SaramExit(Sender: TObject);
begin
   Validar.ValidarSARAM(DBEdit_Saram);
end;

end.
