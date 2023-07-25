//------------------------------------------------------------------------------

unit CargaAlunos_Cenipa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ToolWin, ExtCtrls, DB, IBCustomDataSet,
  IBTable, IBQuery, Rotinas, Rotinas_TrataData, JvComponent, JvTransBtn,
  JvShape, JvGradient;

type
  TForm_CargaAlunos = class(TForm)
    OpenDialog1: TOpenDialog;
    text_Resultado: TRichEdit;
    IBTable_AlunoTurma: TIBTable;
    IBTable_Pessoa: TIBTable;
    IBQuery_AlunoTurma: TIBQuery;
    DSQ_AlunoTurma: TDataSource;
    IBQuery_Pessoa: TIBQuery;
    IBStringField1: TIBStringField;
    DSQ_Pessoa: TDataSource;
    IBTable_PessoaIDENTIDADE: TIBStringField;
    IBTable_PessoaIDENTIDADE_OLD: TIBStringField;
    IBTable_PessoaNOME: TIBStringField;
    IBTable_PessoaNOMEGUERRA: TIBStringField;
    IBTable_PessoaPOSTOGRADUACAO: TIBStringField;
    IBTable_PessoaULTIMAPROMOCAO: TDateTimeField;
    IBTable_PessoaSEXO: TIBStringField;
    IBTable_PessoaDATA_NASCIMENTO: TDateTimeField;
    IBTable_PessoaNOMEPAIS: TIBStringField;
    IBTable_PessoaEMAIL: TIBStringField;
    IBTable_PessoaCPF_CIC: TIBStringField;
    IBTable_PessoaSARAM: TIBStringField;
    IBTable_PessoaQUADRO: TIBStringField;
    IBTable_PessoaESPECIALIDADE: TIBStringField;
    IBTable_PessoaORGAOEMISSOR: TIBStringField;
    IBTable_PessoaESTADO_CIVIL: TIBStringField;
    IBTable_PessoaNATURALIDADE_CIDADE: TIBStringField;
    IBTable_PessoaNATURALIDADE_UF: TIBStringField;
    IBTable_PessoaNOME_PAI: TIBStringField;
    IBTable_PessoaNOME_MAE: TIBStringField;
    IBTable_PessoaIDUNIDADE: TIBStringField;
    IBTable_PessoaIDSUBUNIDADE: TIBStringField;
    IBTable_PessoaQUADROESP: TIBStringField;
    IBTable_PessoaSIPAER: TIBStringField;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBTable_AlunoTurmaIDUNIDADE: TIBStringField;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBTable_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBTable_AlunoTurmaIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBTable_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBTable_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBTable_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_AlunoTurmaREGISTRARVEICULO: TIBStringField;
    IBTable_AlunoTurmaINSTITUTO: TIBStringField;
    IBTable_AlunoTurmaTIPO_ALUNO: TIBStringField;
    IBTable_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBTable_AlunoTurmaCHAMADA: TIBStringField;
    IBTable_AlunoTurmaRESTRICAO: TIBStringField;
    IBTable_AlunoTurmaESTAGIARIO: TIBStringField;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Carga: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Label_NomeArquivo: TLabel;
    text_Arquivo: TRichEdit;
    IBTable_InstrutorTurma: TIBTable;
    IBTable_InstrutorTurmaIDCURSO: TSmallintField;
    IBTable_InstrutorTurmaIDTURMA: TIntegerField;
    IBTable_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBTable_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBTable_InstrutorTurmaDATASAIDA: TDateTimeField;
    IBTable_InstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBTable_InstrutorTurmaFUNCAO: TIBStringField;
    IBTable_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBTable_InstrutorTurmaIDUNIDADE: TIBStringField;
    IBTable_InstrutorTurmaIDSUBUNIDADE: TIBStringField;
    IBTable_InstrutorTurmaFICHA: TIBStringField;
    IBTable_InstrutorTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_InstrutorTurmaSENHA: TIBStringField;
    IBTable_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    DST_InstrutorTurma: TDataSource;
    IBQuery_InstrutorTurma: TIBQuery;
    IBStringField2: TIBStringField;
    DSQ_InstrutorTurma: TDataSource;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBQuery_InstrutorTurmaDATASAIDA: TDateTimeField;
    IBTable_InstrutorTurmaTIPO_INSTRUTOR: TIBStringField;

    Function TratarPostoGraduacao(VS_usuario_posto, VS_usuario_militar: String): String;

    procedure Tratar_Variaveis_ICEA;
    procedure Carga_ICEA;
    procedure Tratar_Aluno_ICEA(VI_ContReg: Integer);
    procedure Tratar_Instrutor_ICEA(VI_ContReg: Integer);

    procedure Carga_Cenipa;
    procedure FinalizaCarga;

    procedure GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_CargaClick(Sender: TObject);
  private    { Private declarations }
     VS_Pais, VS_Tipo, VS_Msg: String;

     VI_Bras, VI_Est: Integer;

     VS_curso_sigla, VS_curso_nome, VS_curso_divisao, VS_curso_material, VS_curso_status,
     VS_id_turma, VS_id_curso, VS_turma_nome, VS_turma_situacao, VS_turma_inicio,
     VS_turma_termino, VS_turma_status, VS_turma_ano, VS_id_usuario, VS_usuario_nome,
     VS_usuario_guerra, VS_usuario_posto, VS_usuario_quadro, VS_usuario_especialidade,
     VS_usuario_sexo, VS_usuario_cpf, VS_usuario_saram, VS_usuario_identidade,
     VS_usuario_org_exp, VS_usuario_data_exp, VS_usuario_naturalidade, VS_usuario_nacionalidade,
     VS_usuario_endereco, VS_usuario_bairro, VS_usuario_cidade, VS_usuario_estado,
     VS_usuario_cracha_validade, VS_usuario_cep, VS_usuario_nascimento, VS_usuario_praca,
     VS_usuario_promocao, VS_usuario_classe, VS_usuario_nivel, VS_usuario_unidade, VS_usuario_subunidade,
     VS_usuario_celular, VS_usuario_residencial, VS_usuario_ramal, VS_usuario_email,
     VS_usuario_inicio, VS_usuario_termino, VS_usuario_senha, VS_usuario_pai, VS_usuario_mae,
     VS_usuario_cnh, VS_usuario_hash, VS_usuario_status, VS_usuario_funcao,
     VS_usuario_militar, VS_usuario_civil, VS_usuario_modelo, VS_usuario_marca, VS_usuario_cor,
     VS_usuario_placa, VS_usuario_fabricacao, VS_usuario_renavam, VS_usuario_foto,
     VS_usuario_cadastro, VS_usuario_conteudo_ministrado, VS_usuario_ip_confirma: String;
     VS_usuario_chefe, VS_usuario_chefe_email, VS_usuario_chefe_telefone: String;
     VS_turma_chefe, VS_turma_ead, VS_id_turma_usuario, VS_turma_usuario_cpf: String;
     VS_portal_turma_inicio, VS_portal_turma_fim, VS_turma_usuario_status: String;
     VS_portal_turma_usuario_funcao, VS_portal_turma_chefe, VS_usuario_ano_modelo: String;

  public
    { Public declarations }
  end;

var
  Form_CargaAlunos: TForm_CargaAlunos;

  Arq : TEXTFILE;

implementation

uses Module, Sel_Turma;

{$R *.dfm}

procedure TForm_CargaAlunos.FormActivate(Sender: TObject);
begin
   Label_NomeArquivo.Caption:= '';

   IBTable_Pessoa.Open;
   IBTable_AlunoTurma.Open;
   IBTable_InstrutorTurma.Open;

   Label_NomeArquivo.Caption:= '';
   JvTransparentButton_Carga.Enabled:= False;
end;

procedure TForm_CargaAlunos.JvTransparentButton_ImprimirClick(Sender: TObject);
begin
   IF OPENDIALOG1.EXECUTE THEN
   BEGIN
      Label_NomeArquivo.Caption:= OPENDIALOG1.FILENAME;
      Text_Arquivo.Lines.LoadFromFile(OPENDIALOG1.FILENAME);
      JvTransparentButton_Carga.Enabled:= True;
   END;
end;

  //------------------------------------------------------------------------------
 // Tratamento do Botao de Carga
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.JvTransparentButton_CargaClick(Sender: TObject);
begin
   if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA' then
      Carga_ICEA
   else
      Carga_CENIPA;
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno do ICEA
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.Carga_ICEA;
var
   i, nlin, VI_ContReg, VI_Cont: integer;
   VS_Status, VS_String, VS_VAR, linha: String;
begin
   Text_Resultado.Lines.Clear;
   VS_Msg:= '';
   VI_Bras:= 0;
   VI_Est:= 0;
   VS_Status:= 'Erro';

   nlin:=text_Arquivo.Lines.Count;
   nlin:= nlin-1;
   VI_ContReg:= 0;
   While VI_ContReg <= nlin do
   begin
      Linha:= trim(text_Arquivo.lines[VI_ContReg])+' ';
      //if Copy(linha, VI_ContReg, 1) <> ';' then
      //begin
         VS_Pais:= 'BRASIL';
         VS_Tipo:= 'INDEFINIDO';


         VS_id_curso:= '';      //-
         VS_curso_sigla:= '';      //-
         VS_curso_nome:= '';       //-
         VS_curso_divisao:= '';        //-
         VS_curso_material:= '';      //-
         VS_curso_status:= '';      //-
         VS_id_turma:= '';       //-
         VS_id_curso:= '';         //-
         VS_turma_nome:= '';         //-
         VS_turma_situacao:= '';       //-
         VS_turma_inicio:= '';       //-
         VS_turma_termino:= '';      //-
         VS_turma_status:= '';      //-
         VS_turma_ano:= '';        //-
         VS_turma_chefe:= '';       //-
         VS_turma_ead:= '';        //-

         VS_id_turma_usuario:= '';     //-
         VS_id_turma:= '';     //-
         VS_turma_usuario_cpf:= '';     //-
         VS_portal_turma_inicio:= '';     //-
         VS_portal_turma_fim:= '';     //-
         VS_turma_usuario_status:= '';     //-
         VS_portal_turma_usuario_funcao:= '';      //-
         VS_portal_turma_chefe:= '';       //-

         VS_id_usuario:= '';     //-
         VS_usuario_nome:= '';     //-
         VS_usuario_guerra:= '';      //-
         VS_usuario_posto:= '';      //-
         VS_usuario_quadro:= '';       //-
         VS_usuario_especialidade:= '';       //-
         VS_usuario_sexo:= '';     //-
         VS_usuario_cpf:= '';     //-
         VS_usuario_saram:= '';     //-

         VS_usuario_identidade:= '';     //-
         VS_usuario_org_exp:= '';     //-
         VS_usuario_data_exp:= '';     //-
         VS_usuario_naturalidade:= '';     //-
         VS_usuario_nacionalidade:= '';     //-
         VS_usuario_endereco:= '';     //-
         VS_usuario_bairro:= '';     //-
         VS_usuario_cidade:= '';     //-
         VS_usuario_estado:= '';     //-
         VS_usuario_cracha_validade:= '';     //-
         VS_usuario_cep:= '';     //-
         VS_usuario_nascimento:= '';     //-
         VS_usuario_praca:= '';     //-
         VS_usuario_promocao:= '';     //-
         VS_usuario_classe:= '';     //-
         VS_usuario_nivel:= '';     //-
         VS_usuario_unidade:= '';     //-
         VS_usuario_subunidade:= '';     //-
         VS_usuario_celular:= '';     //-
         VS_usuario_residencial:= '';     //-
         VS_usuario_ramal:= '';     //-
         VS_usuario_email:= '';     //-
         VS_usuario_inicio:= '';     //-
         VS_usuario_termino:= '';     //-
         VS_usuario_senha:= '';     //-
         VS_usuario_pai:= '';     //-
         VS_usuario_mae:= '';     //-
         VS_usuario_cnh:= '';     //-
         VS_id_turma:= '';     //-
         VS_usuario_hash:= '';     //-
         VS_usuario_status:= '';     //-
         VS_usuario_funcao:= '';     //-
         VS_usuario_militar:= '';     //-
         VS_usuario_civil:= '';     //-
         VS_usuario_modelo:= '';     //-
         VS_usuario_marca:= '';     //-
         VS_usuario_cor:= '';     //-
         VS_usuario_placa:= '';     //-
         VS_usuario_fabricacao:= '';     //-
         VS_usuario_ano_modelo:= '';     //-
         VS_usuario_renavam:= '';     //-
         VS_usuario_foto:= '';                 //-
         VS_usuario_cadastro:= '';     //-
         VS_usuario_conteudo_ministrado:= '';     //-
         VS_usuario_ip_confirma:= '';     //-
         VS_usuario_chefe:= '';                     //-
         VS_usuario_chefe_email:=  '';      //-
         VS_usuario_chefe_telefone:=  '';

         VI_Cont:= 0;
         VS_String:= '';

         for i:= 1 to length(linha) do
         begin
            VS_Var:= Copy(linha, i, 1);
            if VS_Var <> ';' then
            begin
               VS_String:= VS_String+VS_Var;
               if ((VS_String = 'id_curso') and (Copy(linha, 9, 1) = ',')) then
               begin
                  VS_Status:= 'Erro_Virgula';
                  ShowMessage('O Separador é virgula, trocar para ponto e virgula...');
                  Break;
               end;
            end
            else
            begin
               VI_Cont:= VI_Cont + 1;
               case VI_Cont of
                  1:VS_id_curso:=Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  2:VS_curso_sigla:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  3:VS_curso_nome:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  4:VS_curso_divisao:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  5:VS_curso_material:= '';
                  6:VS_curso_status:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  7:VS_id_turma:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  8:VS_id_curso:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  9:VS_turma_nome:= '';   //  Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  10:VS_turma_situacao:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  11:VS_turma_inicio:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  12:VS_turma_termino:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  13:VS_turma_status:='';   //  Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  14: VS_turma_ano:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  15: VS_turma_chefe:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  16: VS_turma_ead:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));

                  17: VS_id_turma_usuario:= '';
                  18: VS_id_turma:= '';
                  19: VS_turma_usuario_cpf:= '';
                  20: VS_portal_turma_inicio:= '';
                  21: VS_portal_turma_fim:= '';
                  22: VS_turma_usuario_status:= '';
                  23: VS_portal_turma_usuario_funcao:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  24: VS_portal_turma_chefe:= '';
                  25:VS_id_usuario:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  26:VS_usuario_nome:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  27:VS_usuario_guerra:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  28:VS_usuario_posto:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  29:VS_usuario_quadro:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  30:VS_usuario_especialidade:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  31:VS_usuario_sexo:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  32:VS_usuario_cpf:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  33:VS_usuario_saram:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  34:VS_usuario_identidade:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  35:VS_usuario_org_exp:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  36:VS_usuario_data_exp:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  37:VS_usuario_naturalidade:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  38:VS_usuario_nacionalidade:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  39:VS_usuario_endereco:= UpperCase(Funcoes.DePara(VS_String, '"', ''));
                  40:VS_usuario_bairro:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  41:VS_usuario_cidade:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  42:VS_usuario_estado:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  43:VS_usuario_cracha_validade:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  44:VS_usuario_cep:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  45: VS_usuario_nascimento:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  46: VS_usuario_praca:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  47: VS_usuario_promocao:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  48: VS_usuario_classe:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  49: VS_usuario_nivel:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  50: VS_usuario_unidade:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  51: VS_usuario_subunidade:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  52: VS_usuario_celular:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  53: VS_usuario_residencial:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  54: VS_usuario_ramal:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  55: VS_usuario_email:= Funcoes.DePara(VS_String, '"', '');
                  56: VS_usuario_inicio:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  57: VS_usuario_termino:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  58: VS_usuario_senha:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  59: VS_usuario_pai:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  60: VS_usuario_mae:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  61: VS_usuario_cnh:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  62: VS_id_turma:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  63: VS_usuario_hash:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  64: VS_usuario_status:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  65: VS_usuario_funcao:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  66: VS_usuario_militar:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  67: VS_usuario_civil:= Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  68: VS_usuario_modelo:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  69: VS_usuario_marca:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  70: VS_usuario_cor:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  71: VS_usuario_placa:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  72: VS_usuario_fabricacao:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  73: VS_usuario_ano_modelo:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  74: VS_usuario_renavam:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  75: VS_usuario_foto:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  76: VS_usuario_cadastro:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  77: VS_usuario_conteudo_ministrado:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  78: VS_usuario_ip_confirma:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  79: VS_usuario_chefe:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  80: VS_usuario_chefe_email:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));
                  81: VS_usuario_chefe_telefone:= '';   // Funcoes.AjustarMaiscula(Funcoes.DePara(VS_String, '"', ''));

               end;
               VS_usuario_ip_confirma:= Funcoes.DePara(VS_String, '"', '');
               VS_String:= '';
            end;
         end;

         if  VS_Status = 'Erro_Virgula' then
         begin
            VS_Status:= 'Erro';
            Break;
         end
         else
         begin
            if (( VS_Status = 'Erro') and ( VS_usuario_cpf = '') and (VS_usuario_identidade = '')) then
            begin
               ShowMessage('Verifique a Linha '+IntToStr(VI_ContReg)+#13+Linha+#13+' A linha pode estar vazia ou CPF e a Identidade estão vazio');
//               break;
            end
            else
            begin
               if (( VS_Status = 'Erro') and ( VS_id_usuario = 'ID_USUARIO') and ( VS_usuario_nome = 'USUARIO_NOME') and
                   ( VS_usuario_guerra = 'USUARIO_GUERRA') and ( VS_usuario_posto = 'USUARIO_POSTO') and ( VS_usuario_quadro = 'USUARIO_QUADRO') and
                   ( VS_usuario_especialidade = 'USUARIO_ESPECIALIDADE') and ( VS_usuario_sexo = 'USUARIO_SEXO') and ( VS_usuario_cpf = 'USUARIO_CPF') and
                   ( VS_usuario_saram = 'USUARIO_SARAM') and ( VS_usuario_identidade = 'USUARIO_IDENTIDADE') and ( VS_usuario_org_exp = 'USUARIO_ORG_EXP') and
                   ( VS_usuario_data_exp = 'USUARIO_DATA_EXP') and ( VS_usuario_naturalidade = 'USUARIO_NATURALIDADE') and ( VS_usuario_nacionalidade = 'USUARIO_NACIONALIDADE')  and
                   ( VS_usuario_endereco = 'USUARIO_ENDERECO') and ( VS_usuario_bairro = 'USUARIO_BAIRRO') and ( VS_usuario_cidade = 'USUARIO_CIDADE') and
                   ( VS_usuario_estado = 'USUARIO_ESTADO')) then
               begin
                  VS_Status:= 'Continuar';
               end
               else
               begin
                  if VS_Status = 'Erro' then
                  begin
                     ShowMessage('- '+'Verificar a distribuição dos dados na tabela Excel, estrutura não esta batendo com a estrutura Base');
                     Break;
                  end
                  else
                  begin
                     if VS_usuario_identidade = '' then
                          VS_usuario_identidade:= 'nnnnnn';

                     if ((VS_usuario_identidade <> '') and (VS_usuario_cpf <> '') and  (VS_usuario_nome <> '') and (VS_usuario_guerra <> '')) then
                     begin
                        if ((VS_portal_turma_usuario_funcao = 'ALUNO') and (Form_SelTurma.VS_Opcao = 'Carregar Aluno')) then
                           Tratar_Aluno_ICEA(VI_ContReg)
                        else
                           if ((VS_portal_turma_usuario_funcao <> 'ALUNO') and (Form_SelTurma.VS_Opcao = 'Carregar Instrutor')) then
                              Tratar_Instrutor_ICEA(VI_ContReg);
                     end;
                  end;
               end;
            end;
            VI_ContReg:= VI_ContReg+1;
         end;
   end;

   if (Form_SelTurma.VS_Opcao = 'Carregar Aluno') then
   begin
      if ((VI_Bras > 0) or (VI_Est > 0)) then
      begin
         DM.IBTable_Turma.Edit;
         DM.IBTable_Turma.FieldByName('QtdBrasileiros').AsInteger:= VI_Bras;
         DM.IBTable_Turma.FieldByName('QtdEstrangeiros').AsInteger:= VI_Est;
         DM.IBTable_Turma.Post;
      end;
   end;

   FinalizaCarga;
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.Tratar_Variaveis_ICEA;
begin
   // Tratamentos iniciais das variaveis

   VS_usuario_identidade:= Funcoes.DePara(VS_usuario_identidade, '-', '');
   VS_usuario_identidade:= Funcoes.DePara(VS_usuario_identidade, '.', '');

   VS_usuario_cpf:= Funcoes.DePara(VS_usuario_cpf, '-', '');
   VS_usuario_cpf:= Funcoes.DePara(VS_usuario_cpf, '.', '');
   if VS_usuario_cpf <> '' then
      VS_usuario_cpf:= FormatFloat ('00000000000',StrToFloat(VS_usuario_cpf));

   VS_usuario_saram:= Funcoes.DePara(VS_usuario_saram, '-', '');
   VS_usuario_saram:= Funcoes.DePara(VS_usuario_saram, '.', '');

   if (Funcoes.AjustarMaiscula(VS_usuario_militar) <> '') then
      VS_usuario_militar:= Funcoes.AjustarMaiscula(VS_usuario_militar)
   else
      VS_usuario_militar:= 'AERONÁUTICA';

   VS_Pais:= 'BRASIL';
   if VS_usuario_nacionalidade = '' then
      VS_usuario_nacionalidade:= 'BRASILEIRA'
   else
      if ((VS_usuario_nacionalidade <> 'BRASILEIRA') and (VS_usuario_nacionalidade <> 'BRASILEIRO') and (VS_usuario_nacionalidade <> 'BRASIL')) then
         VS_Pais:= 'ESTRANGEIRO';

   if ((trim(VS_usuario_cpf) <> '') and (trim(VS_usuario_identidade) = '')) then
      VS_usuario_identidade:= VS_usuario_cpf;

   VS_usuario_posto:= TratarPostoGraduacao(VS_usuario_posto, VS_usuario_militar);

   VS_usuario_cep:= Funcoes.DePara(VS_usuario_cep, '-', '');
   VS_usuario_cep:= Funcoes.DePara(VS_usuario_cep, ' ', '');
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.Tratar_Aluno_ICEA(VI_ContReg: Integer);
var
   VS_Identidade, VS_IdAntiguidade: String;
begin
   Tratar_Variaveis_ICEA;

   Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade From AlunoTurma '+
                                             ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                             ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                             ' and Identidade = '+#39+VS_usuario_cpf+#39
                        );

   If IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString = '' then
   begin
      Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade From AlunoTurma '+
                                                ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                                ' and Identidade = '+#39+VS_usuario_identidade+#39
                           );
      If IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString = '' then
      begin
         Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where CPF_CIC = '+#39+VS_usuario_cpf+#39 );
         If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
         begin
            VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
         end
         else
         begin
            Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where Identidade = '+#39+VS_usuario_identidade+#39 );
            If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
               VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
         end;

         If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString = '' then
         begin
            IBTable_Pessoa.Append;
            if VS_usuario_cpf <> '' then
               VS_Identidade:= VS_usuario_cpf
            else
               VS_Identidade:= VS_usuario_identidade
         end
         else
            IBTable_Pessoa.Edit;

         IBTable_Pessoa.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
         IBTable_Pessoa.FieldByName('IDENTIDADE_OLD').AsString:= VS_usuario_identidade;
         IBTable_Pessoa.FieldByName('NOME').AsString:= Funcoes.AjustarMaiscula(VS_usuario_nome);
         IBTable_Pessoa.FieldByName('NOMEGUERRA').AsString:= Funcoes.AjustarMaiscula(VS_usuario_guerra);
         IBTable_Pessoa.FieldByName('SARAM').AsString:= VS_usuario_saram;
         IBTable_Pessoa.FieldByName('POSTOGRADUACAO').AsString:= Funcoes.AjustarMaiscula(VS_usuario_posto);
         if copy(VS_usuario_promocao,3,1) = '/' then
            IBTable_Pessoa.FieldByName('ULTIMAPROMOCAO').AsString:= VS_usuario_promocao;
         IBTable_Pessoa.FieldByName('SEXO').AsString:= Funcoes.AjustarMaiscula(VS_usuario_sexo);

         if copy(VS_usuario_nascimento,3,1) = '/' then
            IBTable_Pessoa.FieldByName('DATA_NASCIMENTO').AsString:= VS_usuario_nascimento;
         IBTable_Pessoa.FieldByName('NOMEPAIS').AsString:= VS_Pais;
         IBTable_Pessoa.FieldByName('EMAIL').AsString:= VS_usuario_email;
         IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= VS_usuario_cpf;
         IBTable_Pessoa.FieldByName('ORGAOEMISSOR').AsString:= Funcoes.AjustarMaiscula(VS_usuario_org_exp);
         IBTable_Pessoa.FieldByName('IDUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_usuario_unidade);
         IBTable_Pessoa.FieldByName('IDSUBUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_usuario_subunidade);
         IBTable_Pessoa.FieldByName('QUADROESP').AsString:= Funcoes.AjustarMaiscula(VS_usuario_quadro)+' '+Funcoes.AjustarMaiscula(VS_usuario_especialidade);
         IBTable_Pessoa.Post;
         Funcoes.ExecutaTransacao;

          //-----
         //--- Tratamento do Cadastro Aluno Turma

         Funcoes.OpenQuery('Select IdAntiguidade From Antiguidade Where PostoGraduacao = '+#39+VS_usuario_posto+#39);

         VS_IdAntiguidade:= DM.IBQuery_Executa.FieldByName('IdAntiguidade').AsString;
         if VS_IdAntiguidade = '' then
            VS_IdAntiguidade:= '100';

         //--- Tratamento para verificar o Tipo de Aluno

         if ((UpperCase(VS_usuario_nacionalidade) <> 'BRASILEIRA') and (UpperCase(VS_usuario_nacionalidade) <> 'BRASILEIRO') and (UpperCase(VS_usuario_nacionalidade) <> 'BRASIL') and (UpperCase(VS_usuario_nacionalidade) <> '')) then
         begin
            VS_Tipo:= 'ESTRANGEIRO';
            VI_Est:= VI_Est+1;
         end
         else
         begin
            VI_Bras:= VI_Bras+1;
            if ((VS_usuario_posto = 'CV') or (VS_usuario_posto = '') or (VS_usuario_posto = 'CIVIL')) then
                VS_Tipo:= 'CIVIL'
            else
            begin
               if VS_usuario_militar = 'AERONÁUTICA' then
                  VS_Tipo:= 'MILITAR DA AERONÁUTICA'
               else
                  if VS_usuario_militar = 'EXÉRCITO' then
                     VS_Tipo:= 'MILITAR DO EXÉRCITO'
                  else
                     if VS_usuario_militar = 'MARINHA' then
                        VS_Tipo:= 'MILITAR DA MARINHA'
                     else
                        VS_Tipo:= 'OUTROS (BRASILEIROS)'
            end;
         end;

         Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade From AlunoTurma '+
                                                   ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                   ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                                   ' and Identidade = '+#39+VS_Identidade+#39
                              );

         If IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString = '' then
         begin
            IBTable_AlunoTurma.Append;
            IBTable_AlunoTurma.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
            IBTable_AlunoTurma.FieldByName('IDCURSO').AsString:= DM.IBTable_Turma.FieldByName('IDCURSO').AsString;
            IBTable_AlunoTurma.FieldByName('IDTURMA').AsString:= DM.IBTable_Turma.FieldByName('IDTURMA').AsString;
            IBTable_AlunoTurma.FieldByName('NUMORDEM').AsInteger:= VI_ContReg;
            IBTable_AlunoTurma.FieldByName('DATAMATRICULA').AsString:=DM.IBTable_Turma.FieldByName('DataInicio').AsString;
            IBTable_AlunoTurma.FieldByName('DATADESLIGAMENTO').AsString:= DM.IBTable_Turma.FieldByName('DataTermino').AsString;
            IBTable_AlunoTurma.FieldByName('MOTIVODESLIGAMENTO').AsString:=  'a';
            GerarCodigoAluno(DM.IBTable_Turma.FieldByName('IDCURSO').AsString, DM.IBTable_Turma.FieldByName('IDTURMA').AsString);
         end
         else
            IBTable_AlunoTurma.Edit;

         IBTable_AlunoTurma.FieldByName('POSTOGRADUACAO').AsString:= trim(Funcoes.AjustarMaiscula(VS_usuario_posto));
         IBTable_AlunoTurma.FieldByName('IDUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_usuario_unidade);
         IBTable_AlunoTurma.FieldByName('IDSUBUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_usuario_subunidade);
         IBTable_AlunoTurma.FieldByName('IDANTIGUIDADE').AsString:= VS_IdAntiguidade;
         IBTable_AlunoTurma.FieldByName('TIPO_ALUNO').AsString:= VS_Tipo;
         IBTable_AlunoTurma.FieldByName('NOMECOMPLETO').AsString:= trim(Funcoes.AjustarMaiscula(VS_usuario_posto))+' '+Funcoes.AjustarMaiscula(VS_usuario_quadro)+' '+Funcoes.AjustarMaiscula(VS_usuario_especialidade)+' '+Trim(Funcoes.AjustarMaiscula(VS_usuario_nome));
         IBTable_AlunoTurma.FieldByName('CHAMADA').AsString:= 'S';
         IBTable_AlunoTurma.Post;

         //--- Tratamento do Cadastro do Endereco

         Funcoes.Grava_Endereco(VS_Identidade, VS_usuario_endereco+', '+VS_usuario_bairro, VS_usuario_cidade, VS_usuario_estado, VS_usuario_cep, VS_Pais);

         //--- Tratamento do Cadastro do Telefone

         Funcoes.Grava_Telefone(VS_Identidade, '', VS_usuario_residencial, '', VS_usuario_ramal, VS_usuario_celular, '');

         Text_Resultado.Lines.Add('- '+Trim(VS_usuario_nome)+' aluno cadastrado com sucesso');
         show;
         update;
      end
      else
      begin
         Text_Resultado.Lines.Add('- '+Trim(VS_usuario_nome)+' com a Identidade '+VS_usuario_identidade+' encontra-se cadastrado, verifique a IDENTIDADE');
      end;
   end
   else
   begin
      Text_Resultado.Lines.Add('- '+Trim(VS_usuario_nome)+' com a Identidade '+VS_usuario_CPF+' encontra-se cadastrado, verifique o CPF');
   end;
end;


  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.Tratar_Instrutor_ICEA(VI_ContReg: Integer);
var
   VS_Identidade, VS_IdAntiguidade, VS_CodInstrutor, VS_DataChegada, VS_DataSaida: String;
begin
   Tratar_Variaveis_ICEA;
   VS_DataChegada:= Funcoes.DePara(VS_turma_inicio, '/', '.')+' 00:00';

   VS_DataSaida:= Funcoes.DePara(VS_turma_termino, '/', '.')+' 00:00';

   Funcoes.ExecutaQuery( IBQuery_InstrutorTurma, ' Select IdCurso, IdTurma, Identidade, DataChegada, DataSaida '+
                                                 ' From InstrutorTurma '+
                                                 ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                 ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                                 ' and Identidade = '+#39+VS_Identidade+#39+
                                                 ' and DataChegada = '+#39+VS_DataChegada+#39+
                                                 ' and DataSaida = '+#39+VS_DataSaida+#39
                        );

   If IBQuery_InstrutorTurma.FieldByName('Identidade').AsString = '' then
   begin
      // Tratamento para Cadastrar os dados do Aluno como Pessoa

      Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where CPF_CIC = '+#39+VS_usuario_cpf+#39 );
      If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
         VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString
      else
      begin
         Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where Identidade = '+#39+VS_usuario_identidade+#39 );
         If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
            VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
      end;

      If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString = '' then
      begin
         IBTable_Pessoa.Append;
         if VS_usuario_cpf <> '' then
            VS_Identidade:= VS_usuario_cpf
         else
            VS_Identidade:= VS_usuario_identidade
      end
      else
         IBTable_Pessoa.Edit;

      IBTable_Pessoa.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
      IBTable_Pessoa.FieldByName('IDENTIDADE_OLD').AsString:= VS_usuario_identidade;
      IBTable_Pessoa.FieldByName('NOME').AsString:= Funcoes.AjustarMaiscula(VS_usuario_nome);
      IBTable_Pessoa.FieldByName('NOMEGUERRA').AsString:= Funcoes.AjustarMaiscula(VS_usuario_guerra);
      IBTable_Pessoa.FieldByName('SARAM').AsString:= VS_usuario_saram;
      IBTable_Pessoa.FieldByName('POSTOGRADUACAO').AsString:= Funcoes.AjustarMaiscula(VS_usuario_posto);
      if copy(VS_usuario_promocao,3,1) = '/' then
         IBTable_Pessoa.FieldByName('ULTIMAPROMOCAO').AsString:= VS_usuario_promocao;
      IBTable_Pessoa.FieldByName('SEXO').AsString:= Funcoes.AjustarMaiscula(VS_usuario_sexo);

      if copy(VS_usuario_nascimento,3,1) = '/' then
         IBTable_Pessoa.FieldByName('DATA_NASCIMENTO').AsString:= VS_usuario_nascimento;
      IBTable_Pessoa.FieldByName('NOMEPAIS').AsString:= VS_Pais;
      IBTable_Pessoa.FieldByName('EMAIL').AsString:= VS_usuario_email;
      IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= VS_usuario_cpf;
      IBTable_Pessoa.FieldByName('ORGAOEMISSOR').AsString:= Funcoes.AjustarMaiscula(VS_usuario_org_exp);
      IBTable_Pessoa.FieldByName('IDUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_usuario_unidade);
      IBTable_Pessoa.FieldByName('IDSUBUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_usuario_subunidade);
      IBTable_Pessoa.FieldByName('QUADROESP').AsString:= Funcoes.AjustarMaiscula(VS_usuario_quadro)+' '+Funcoes.AjustarMaiscula(VS_usuario_especialidade);
      IBTable_Pessoa.Post;
      Funcoes.ExecutaTransacao;

       //-----
      //--- Tratamento do Cadastro Aluno Instrutor

      //--- Tratamento para verificar o Tipo de Aluno

      if ((UpperCase(VS_usuario_nacionalidade) <> 'BRASILEIRA') and (UpperCase(VS_usuario_nacionalidade) <> '')) then
      begin
         VS_Tipo:= 'ESTRANGEIRO';
         VI_Est:= VI_Est+1;
      end
      else
      begin
         VI_Bras:= VI_Bras+1;
         if ((VS_usuario_posto = 'CV') or (VS_usuario_posto = '') or (VS_usuario_posto = 'CIVIL')) then
             VS_Tipo:= 'CIVIL'
         else
         begin
            if VS_usuario_militar = 'AERONÁUTICA' then
               VS_Tipo:= 'MILITAR DA AERONÁUTICA'
            else
               if VS_usuario_militar = 'EXÉRCITO' then
                  VS_Tipo:= 'MILITAR DO EXÉRCITO'
               else
                  if VS_usuario_militar = 'MARINHA' then
                     VS_Tipo:= 'MILITAR DA MARINHA'
                  else
                     VS_Tipo:= 'OUTROS (BRASILEIROS)'
         end;
      end;

      VS_CodInstrutor:= Funcoes.GerarCodigoInstrutor(DM.IBTable_Turma.FieldByName('IdCurso').AsString, DM.IBTable_Turma.FieldByName('IdTurma').AsString);

      Funcoes.OpenQuery('Select IdAntiguidade From Antiguidade Where PostoGraduacao = '+#39+VS_usuario_posto+#39);
      VS_IdAntiguidade:= DM.IBQuery_Executa.FieldByName('IdAntiguidade').AsString;
      if VS_IdAntiguidade = '' then
         VS_IdAntiguidade:= '100';

      Funcoes.ExecutaQuery( IBQuery_InstrutorTurma, ' Select IdCurso, IdTurma, Identidade, DataChegada, DataSaida '+
                                                    ' From InstrutorTurma '+
                                                    ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                    ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                                    ' and Identidade = '+#39+VS_Identidade+#39+
                                                    ' and DataChegada = '+#39+VS_DataChegada+#39+
                                                    ' and DataSaida = '+#39+VS_DataSaida+#39
                           );

      If IBQuery_InstrutorTurma.FieldByName('Identidade').AsString = '' then
      begin
         IBTable_InstrutorTurma.Append;
         IBTable_InstrutorTurma.FieldByName('Identidade').AsString:= VS_Identidade;
         IBTable_InstrutorTurma.FieldByName('IdCurso').AsString:= DM.IBTable_Turma.FieldByName('IDCURSO').AsString;
         IBTable_InstrutorTurma.FieldByName('IdTurma').AsString:= DM.IBTable_Turma.FieldByName('IDTURMA').AsString;
         IBTable_InstrutorTurma.FieldByName('CodigoInstrutor').AsString:= VS_CodInstrutor;
      end
      else
         IBTable_InstrutorTurma.Edit;

      IBTable_InstrutorTurma.FieldByName('DataChegada').AsString:= VS_turma_inicio;
      IBTable_InstrutorTurma.FieldByName('DataSaida').AsString:= VS_turma_termino;
      IBTable_InstrutorTurma.FieldByName('Funcao').AsString:= VS_portal_turma_usuario_funcao;
      IBTable_InstrutorTurma.FieldByName('IdUnidade').AsString:= VS_usuario_unidade;
      IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString:= VS_usuario_subunidade;
      IBTable_InstrutorTurma.FieldByName('Ficha').AsString:= 'Conferir';
      IBTable_InstrutorTurma.FieldByName('IdAntiguidade').AsString:= VS_IdAntiguidade;
      IBTable_InstrutorTurma.FieldByName('TIPO_INSTRUTOR').AsString:= VS_Tipo;
      IBTable_InstrutorTurma.FieldByName('Senha').AsString:= VS_CodInstrutor;
      IBTable_InstrutorTurma.FieldByName('NomeCompleto').AsString:= trim(Funcoes.AjustarMaiscula(VS_usuario_posto))+' '+Funcoes.AjustarMaiscula(VS_usuario_quadro)+' '+Funcoes.AjustarMaiscula(VS_usuario_especialidade)+' '+Trim(Funcoes.AjustarMaiscula(VS_usuario_nome));
      IBTable_InstrutorTurma.Post;

      Funcoes.Grava_Endereco(VS_Identidade, VS_usuario_endereco+VS_usuario_bairro, VS_usuario_cidade, VS_usuario_estado, VS_usuario_cep, VS_Pais);
      Funcoes.Grava_Telefone(VS_Identidade, '', VS_usuario_residencial, '', VS_usuario_ramal, VS_usuario_celular, '');

      Text_Resultado.Lines.Add('- '+Trim(VS_usuario_nome)+' instrutor cadastrado com sucesso');
      show;
      update;
   end;
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno do CENIPA/ILA
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.Carga_CENIPA;
var
   VI_NAlunos, i, VI_Cont, VI_NumOrdem: integer;
   VS_Tipo, VS_IdAntiguidade, VS_String, VS_VAR, linha: String;

   VS_Status, VS_CPF, VS_Nome, VS_EMail, VS_sexo, VS_Dt_Nascimento, VS_Identidade, VS_Org_Expedidor, VS_End_Entrega_Material: String;
   VS_End_Entrega_Certificado, VS_Endereco_Comercial, VS_Telefone_Fixo, VS_Telefone_Celular, VS_Estado_Civil, VS_Naturalidade_Munic: String;
   VS_Naturalidade_UF, VS_Naturalidade, VS_Maior_Titulacao, VS_Especializacao, VS_Cargo, VS_Endereco, VS_Bairro, VS_Municipio: String;
   VS_UF, VS_Cep, VS_Pais, VS_Categotia, VS_Organizacao, VS_Posto_Graduacao, VS_Promocao, VS_Forca_Armada: String;
   VS_Aluno, VS_Curso, VS_NomeGuerra, VS_Saram, VS_Branco1, VS_Msg1, VS_Branco2, VS_Branco3, VS_Branco4, VS_Chefe, VS_EmailChefe, VS_FoneChefe: String;
begin
   Text_Resultado.Lines.Clear;
   VS_Msg:= '';
   VI_NAlunos:= 0;
   VS_Status:= 'Erro';

   Reset ( arq );
  // ReadLn ( arq, linha );

   while not Eof ( arq ) do
   begin
      if Copy(linha, i, 1) <> ';' then
      begin
         VI_NAlunos:= VI_NAlunos +1;

         VS_CPF:= '';
         VS_Nome:= '';
         VS_NomeGuerra:= '';
         VS_Saram:= '';
         VS_EMail:= '';
         VS_sexo:= '';
         VS_Dt_Nascimento:= '';
         VS_Identidade:= '';
         VS_Org_Expedidor:= '';
         VS_End_Entrega_Material:= '';
         VS_End_Entrega_Certificado:= '';
         VS_Endereco_Comercial:= '';
         VS_Telefone_Fixo:= '';
         VS_Telefone_Celular:= '';
         VS_Estado_Civil:= '';
         VS_Naturalidade_Munic:= '';
         VS_Naturalidade_UF:= '';
         VS_Naturalidade:= '';
         VS_Maior_Titulacao:= '';
         VS_Especializacao:= '';
         VS_Cargo:= '';
         VS_Endereco:= '';
         VS_Bairro:= '';
         VS_Municipio:= '';
         VS_UF:= '';
         VS_Cep:= '';
         VS_Pais:= 'BRASIL';
         VS_Categotia:= '';
         VS_Organizacao:= '';
         VS_Posto_Graduacao:= '';
         VS_Promocao:= '';
         VS_Forca_Armada:= 'AERONÁUTICA';

         VI_Cont:= 0;
         VS_String:= '';

         ReadLn ( arq, linha );
         if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA' then
         begin
            for i:= 1 to length(linha) do
            begin
               VS_Var:= Copy(linha, i, 1);
               if VS_Var <> ';' then
               begin
                  VS_String:= VS_String+VS_Var;
               end
               else
               begin
                  VI_Cont:= VI_Cont + 1;

                  case VI_Cont of
                     1:  VS_CPF:= VS_String;
                     2:  VS_Nome:= VS_String;
                     3:  VS_EMail:= VS_String;
                     4:  VS_sexo:= VS_String;
                     5:  VS_Dt_Nascimento:= VS_String;
                     6:  VS_Identidade:= VS_String;
                     7:  VS_Org_Expedidor:= VS_String;
                     8:  VS_End_Entrega_Material:= VS_String;
                     9:  VS_End_Entrega_Certificado:= VS_String;
                     10: VS_Endereco_Comercial:= VS_String;
                     11: VS_Telefone_Fixo:= VS_String;
                     12: VS_Telefone_Celular:= VS_String;
                     13: VS_Estado_Civil:= VS_String;
                     14: VS_Naturalidade_Munic:= VS_String;
                     15: VS_Naturalidade_UF:= VS_String;
                     16: VS_Naturalidade:= VS_String;
                     17: VS_Maior_Titulacao:= VS_String;
                     18: VS_Especializacao:= VS_String;
                     19: VS_Cargo:= VS_String;
                     20: VS_Endereco:= VS_String;
                     21: VS_Bairro:= VS_String;
                     22: VS_Municipio:= VS_String;
                     23: VS_UF:= VS_String;
                     24: VS_Cep:= VS_String;
                     25: VS_Pais:= VS_String;
                     26: VS_Categotia:= VS_String;
                     27: VS_Organizacao:= VS_String;
                     28: VS_Posto_Graduacao:= VS_String;
                     29: VS_Promocao:= VS_String;
                     30: VS_Forca_Armada:= VS_String;
                  end;
                  if VI_Cont < 30 then
                     VS_String:= '';
               end;
            end;
            VS_Forca_Armada:= VS_String;
         end
         else
         begin
            if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ILA' then
             begin
               VI_Cont:= 0;
               for i:= 1 to length(linha) do
               begin
                  VS_Var:= Copy(linha, i, 1);
                  if ((VS_Var <> ';') and (VS_Var <> ',')) then
                  begin
                     VS_String:= VS_String+VS_Var;
                  end
                  else
                  begin
                     VI_Cont:= VI_Cont + 1;
                     if VI_NumOrdem = 385 then
                        VI_NumOrdem:= VI_NumOrdem;

                     VS_Var:= Copy(linha, i, 1);
                     if VS_Var <> ',' then
                     begin
                        VS_String:= VS_String+VS_Var;
                     end
                     else
                     begin

                        if VI_NumOrdem = 385 then
                           VI_NumOrdem:= VI_NumOrdem;

                        case VI_Cont of
                           1:  VS_Aluno:= VS_String;
                           2:  VS_Curso:= VS_String;
                           3:  VS_Posto_Graduacao:= VS_String;
                           4:  VS_Especializacao:= VS_String;
                           5:  VS_Especializacao:= VS_Especializacao+' '+VS_String;
                           6:  VS_Nome:= VS_String;
                           7:  VS_NomeGuerra:= VS_String;
                           8:  VS_Organizacao:= VS_String;
                           9:  VS_Email:= VS_String;
                           10:  VS_Telefone_Fixo:= VS_String;
                           11:  VS_Telefone_Celular:= VS_String;
                           12: VS_Saram:= VS_String;
                           13: VS_CPF:= VS_String;
                           14: VS_Branco1:= VS_String;
                           15: VS_Msg1:= VS_String;
                           16: VS_Branco2:= VS_String;
                           17: VS_Branco3:= VS_String;
                           18: VS_Branco4:= VS_String;
                           19: VS_Chefe:= VS_String;
                           20: VS_EmailChefe:= VS_String;
                           21: VS_FoneChefe:= VS_String;
                        end;
                        if VI_Cont < 21 then
                           VS_String:= '';
                        VS_Status:= 'Continuar';
                     end;
                  end;
               end;
            end;
         end;

         if (( VS_Status = 'Erro') and ( VS_CPF = 'CPF') and ( VS_Nome = 'NOME' ) and ( VS_EMail = 'E-MAIL' ) and ( VS_sexo = 'SEXO' ) and
             ( VS_Dt_Nascimento = 'DT_NASCIMENTO' ) and ( VS_Identidade = 'IDENTIDADE' ) and ( VS_Org_Expedidor = 'ORG_EXPEDIDOR' ) and
             ( VS_End_Entrega_Material = 'END_ENTREGA_MATERIAL' ) and ( VS_End_Entrega_Certificado = 'END_ENTREGA_CERTIFICADO' ) and
             ( VS_Endereco_Comercial = 'ENDEREÇO COMERCIAL' ) and ( VS_Telefone_Fixo = 'TELEFONE FIXO' ) and ( VS_Telefone_Celular = 'TELEFONE CELULAR' ) and
             ( VS_Estado_Civil = 'ESTADO CIVIL' ) and ( VS_Naturalidade_Munic = 'NATURALIDADE_MUNIC' ) and ( VS_Naturalidade_UF = 'NATURALIDADE_UF' ) and
             ( VS_Naturalidade =  'NATURALIDADE' ) and ( VS_Maior_Titulacao = 'MAIOR TITULAÇÃO' ) and ( VS_Especializacao = 'ESPECIALIZAÇÃO' ) and
             ( VS_Cargo = 'CARGO' ) and ( VS_Endereco = 'ENDEREÇO' ) and ( VS_Bairro = 'BAIRRO' ) and ( VS_Municipio = 'MUNICIPIO' ) and
             ( VS_UF = 'UF' ) and ( VS_Cep = 'CEP' ) and ( VS_Pais = 'PAIS') and (VS_Categotia = 'CATEGORIA' ) and ( VS_Organizacao = 'ORGANIZAÇÃO' ) and
             ( VS_Posto_Graduacao = 'POSTO/GRADUAÇÃO' ) and ( VS_Promocao =  'PROMOÇÃO' ) and ( VS_Forca_Armada =  'FORÇA ARMADA' )) then
         begin
             VS_Status:= 'Continuar';
         end
         else
         begin
            if VS_Status = 'Erro' then
            begin
               ShowMessage('Verificar a distribuição dos dados na tabela Excel, estrutura não esta batendo com a estrutura Base');
               Break;
            end
            else
            begin
               VS_CPF:= Funcoes.DePara(VS_CPF, '-', '');
               VS_CPF:= Funcoes.DePara(VS_CPF, '.', '');
               if (trim(VS_CPF) <> '') then
               begin
                  if (trim(VS_Identidade) = '') then
                     VS_Identidade:= VS_CPF;

                  VI_NumOrdem:= VI_NumOrdem+1;

                  // Tratamento para Cadastrar os dados do Aluno como Pessoa

                  Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where Identidade = '+#39+VS_Identidade+#39 );

                  If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString = '' then
                     IBTable_Pessoa.Append
                  else
                     IBTable_Pessoa.Edit;

                  IBTable_Pessoa.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
                  IBTable_Pessoa.FieldByName('NOME').AsString:= VS_Nome;
                  IBTable_Pessoa.FieldByName('NOMEGUERRA').AsString:= VS_NomeGuerra;
                  IBTable_Pessoa.FieldByName('SARAM').AsString:= VS_Saram;
                  IBTable_Pessoa.FieldByName('POSTOGRADUACAO').AsString:= VS_Posto_Graduacao;
                  if copy(VS_Promocao,3,1) = '/' then
                     IBTable_Pessoa.FieldByName('ULTIMAPROMOCAO').AsString:= VS_Promocao;
                  IBTable_Pessoa.FieldByName('SEXO').AsString:= VS_sexo;

                  if copy(VS_Dt_Nascimento,3,1) = '/' then
                     IBTable_Pessoa.FieldByName('DATA_NASCIMENTO').AsString:= VS_Dt_Nascimento;
                  IBTable_Pessoa.FieldByName('NOMEPAIS').AsString:= UpperCase(VS_Naturalidade);
                  IBTable_Pessoa.FieldByName('EMAIL').AsString:= VS_EMail;
                  IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= VS_CPF;
                  IBTable_Pessoa.FieldByName('ORGAOEMISSOR').AsString:= VS_Org_Expedidor;
                  IBTable_Pessoa.FieldByName('ESTADO_CIVIL').AsString:= VS_Estado_Civil;
                  IBTable_Pessoa.FieldByName('NATURALIDADE_CIDADE').AsString:= VS_Naturalidade_Munic;
                  IBTable_Pessoa.FieldByName('NATURALIDADE_UF').AsString:= VS_Naturalidade_UF;
                  IBTable_Pessoa.FieldByName('IDUNIDADE').AsString:= VS_Organizacao;
                  IBTable_Pessoa.FieldByName('IDSUBUNIDADE').AsString:= VS_Organizacao;
                  IBTable_Pessoa.FieldByName('QUADROESP').AsString:= VS_Especializacao;

                  IBTable_Pessoa.Post;
                  Funcoes.ExecutaTransacao;

                   //-----
                  //--- Tratamento do Cadastro Aluno Turma

                  Funcoes.OpenQuery('Select IdAntiguidade From Antiguidade Where PostoGraduacao = '+#39+VS_Posto_Graduacao+#39);

                  VS_IdAntiguidade:= DM.IBQuery_Executa.FieldByName('IDAntiguidade').AsString;
                  if VS_IdAntiguidade = '' then
                      VS_IdAntiguidade:= '100';

                  //--- Tratamento para verificar o Tipo de Aluno

                  if UpperCase(VS_Pais) <> 'BRASIL' then
                     VS_Tipo:= 'ESTRANGEIRO'
                  else
                  begin
                     if ((VS_Categotia = '') or (VS_Categotia = 'CIVIL')) then
                        VS_Tipo:= 'CIVIL'
                     else
                     begin
                        if VS_Forca_Armada = 'AERONÁUTICA' then
                           VS_Tipo:= 'MILITAR DA AERONÁUTICA'
                        else
                           if VS_Forca_Armada = 'EXÉRCITO' then
                              VS_Tipo:= 'MILITAR DO EXÉRCITO'
                           else
                              if VS_Forca_Armada = 'MARINHA' then
                                 VS_Tipo:= 'MILITAR DA MARINHA'
                              else
                                 VS_Tipo:= 'OUTROS (BRASILEIROS)'
                     end;
                  end;

                  Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade From AlunoTurma '+
                                                            ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                            ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                                            ' and Identidade = '+#39+VS_Identidade+#39
                                      );

                  If IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString = '' then
                  begin
                     IBTable_AlunoTurma.Append;
                     IBTable_AlunoTurma.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
                     IBTable_AlunoTurma.FieldByName('IDCURSO').AsString:= DM.IBTable_Turma.FieldByName('IDCURSO').AsString;
                     IBTable_AlunoTurma.FieldByName('IDTURMA').AsString:= DM.IBTable_Turma.FieldByName('IDTURMA').AsString;
                     IBTable_AlunoTurma.FieldByName('NUMORDEM').AsInteger:= VI_NumOrdem;
                     IBTable_AlunoTurma.FieldByName('DATAMATRICULA').AsString:= DM.IBTable_Turma.FieldByName('DataInicio').AsString;
                     IBTable_AlunoTurma.FieldByName('DATADESLIGAMENTO').AsString:= DM.IBTable_Turma.FieldByName('DataTermino').AsString;
                     IBTable_AlunoTurma.FieldByName('MOTIVODESLIGAMENTO').AsString:=  'a';
                  end
                  else
                  begin
                     IBTable_AlunoTurma.Edit;
                  end;

                  GerarCodigoAluno(DM.IBTable_Turma.FieldByName('IDCURSO').AsString, DM.IBTable_Turma.FieldByName('IDTURMA').AsString);

                  IBTable_AlunoTurma.FieldByName('MOTIVODESLIGAMENTO').AsString:=  'a';
                  IBTable_AlunoTurma.FieldByName('POSTOGRADUACAO').AsString:= trim(VS_Posto_Graduacao);
                  IBTable_AlunoTurma.FieldByName('IDUNIDADE').AsString:= VS_Organizacao;
                  IBTable_AlunoTurma.FieldByName('IDSUBUNIDADE').AsString:= VS_Organizacao;
                  IBTable_AlunoTurma.FieldByName('IDANTIGUIDADE').AsString:= VS_IdAntiguidade;
                  IBTable_AlunoTurma.FieldByName('TIPO_ALUNO').AsString:= VS_Tipo;
                  IBTable_AlunoTurma.FieldByName('NOMECOMPLETO').AsString:= trim(VS_Posto_Graduacao)+' '+Trim(VS_Nome);
                  IBTable_AlunoTurma.FieldByName('CHAMADA').AsString:= 'S';

                  IBTable_AlunoTurma.Post;
                  Funcoes.ExecutaTransacao;

                  //--- Tratamento do Cadastro do Endereco

                  Funcoes.Grava_Endereco(VS_Identidade, VS_Endereco+VS_Bairro, VS_Municipio, VS_UF, VS_Cep, VS_Pais);

                  //--- Tratamento do Cadastro do Telefone

                  Funcoes.Grava_Telefone(VS_Identidade, '', VS_Telefone_Fixo, '', '', VS_Telefone_Celular, '');

                  Text_Resultado.Lines.Add(FormatFloat('000', VI_NAlunos-1)+' - '+VS_Identidade+' - '+VS_Nome+'  cadastrado com sucesso');
                  show;
                  update;
                end;
            end;
         end;
      end;
   end;
   FinalizaCarga;
end;
//------------------------------------------------------------------------------
// Gera o codigo do Aluno
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.FinalizaCarga;
begin
//   CloseFile ( arq );

   if VS_Msg <> '' then
      ShowMessage( 'Verificar Carga com erro '+#13+#13+VS_Msg)
   else
      ShowMessage('*** Carga dos dados Finalizada ***');

   Funcoes.AtualizaQuery(Form_SelTurma.IBQuery_AlunoTurma);
end;

//------------------------------------------------------------------------------
// Gera o codigo do Aluno
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
var
   VS_Comando, VS_CodAluno: String;
   VI_CodExiste: integer;
begin
   //------------- Chama função para gerar codigo do aluno  --------------//

   VI_CodExiste:=0;

   while VI_CodExiste = 0  do
   begin
      VS_CodAluno:=Funcoes.Randomico (999);

      VS_Comando:= 'Select count(1) Qtd '+
                   'from CODIGO_ALUNO_VIEW '+
                   'where IdCurso = '+VS_IdCurso+
                   ' and IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                   ' and CodigoAluno = '+VS_CodAluno;

      if Funcoes.QtdRegistro(VS_Comando) = 0 then
      begin
         VI_CodExiste:= 1;
         IBTable_AlunoTurma.FieldByName('CodigoAluno').AsString:= VS_CodAluno;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a janela
//-------------------------------------------------------------------------------

procedure TForm_CargaAlunos.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Pessoa.Close;
   IBTable_AlunoTurma.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o Sistema  e retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_CargaAlunos.JvTransparentButton_WindowsClick(Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para definir o posto graduacao
//------------------------------------------------------------------------------

Function TForm_CargaAlunos.TratarPostoGraduacao(VS_usuario_posto, VS_usuario_militar: String): String;
begin
   if VS_usuario_posto = 'CV' then
   begin
      VS_usuario_posto:= 'CV';     // CIVIL
   end
   else
   begin
      if VS_usuario_militar = 'MARINHA' then         // MARINHA
      begin
         if VS_usuario_posto = 'AE' then       // // Almirante-de-Esquadra
            VS_usuario_posto:= 'Alte Esq'
         else
            if VS_usuario_posto = 'VA' then        // Vice-Almirante
               VS_usuario_posto:= 'V Alte'
         else
            if VS_usuario_posto = 'CA' then        // Contra-Almirante
               VS_usuario_posto:= 'C Alte'
            else
               if VS_usuario_posto = 'CMG' then     // Capitão-de-Mar-e-Guerra
                  VS_usuario_posto:= 'CMG'
               else
                  if VS_usuario_posto = 'CMG(IM)' then     // Capitão-de-Mar-e-Guerra Intendente
                     VS_usuario_posto:= 'CMG'
                  else
                     if VS_usuario_posto = 'CF' then     // Capitão-de-Fragata
                        VS_usuario_posto:= 'CF'
                     else
                        if VS_usuario_posto = 'CC' then     // Capitão-de-Corveta
                            VS_usuario_posto:= 'CC'
                        else
                           if VS_usuario_posto = 'CT' then     // Capitão-Tenente
                              VS_usuario_posto:= 'CT'
                           else
                              if VS_usuario_posto = '1° Ten' then     // 1° Tenente
                                 VS_usuario_posto:= '1º Ten'
                              else
                                 if VS_usuario_posto = '2° Ten' then     // 2° Tenente
                                    VS_usuario_posto:= '2º Ten'
                                 else
                                    if VS_usuario_posto = 'GM' then     //Guarda-Marinha
                                       VS_usuario_posto:= 'GM'
                                    else
                                       if VS_usuario_posto = 'SO' then     // Suboficial
                                          VS_usuario_posto:= 'SO'
                                       else
                                          if VS_usuario_posto = '1° Sgt' then     // 1º Sargento
                                             VS_usuario_posto:= '1º SG'
                                          else
                                             if VS_usuario_posto = '2° Sgt' then     // 2º Sargento
                                                VS_usuario_posto:= '2º SG'
                                             else
                                                if VS_usuario_posto = '3° Sgt' then     // 3º Sargento
                                                   VS_usuario_posto:= '3º SG'
                                                else
                                                   if VS_usuario_posto = 'CB' then     // Cabo
                                                      VS_usuario_posto:= 'CB'
                                                   else
                                                      if VS_usuario_posto = 'T1' then     // Taifeiro-de-Primeira-Classe
                                                         VS_usuario_posto:= 'T1'
                                                      else
                                                         if VS_usuario_posto = 'SD' then     // Soldado
                                                            VS_usuario_posto:= 'SD'
                                                         else
                                                            if VS_usuario_posto = 'MN' then     // Marinheiro
                                                                VS_usuario_posto:= 'MN'
      end
      else
      begin
         if VS_usuario_militar = 'EXÉRCITO' then
         begin
            if VS_usuario_posto = 'Gen Ex' then    // General-de-Exército
               VS_usuario_posto:= 'Gen Ex'
            else
               if VS_usuario_posto = 'Gen Div' then   // General-de-Divisão
                  VS_usuario_posto:= 'Gen Div'
               else
                  if VS_usuario_posto = 'Gen Bda' then      // General-de-Brigada
                     VS_usuario_posto:= 'Gen Bda'
                  else
                     if VS_usuario_posto = 'Cel' then     // Coronel
                        VS_usuario_posto:= 'Cel'
                     else
                        if VS_usuario_posto = 'Ten Cel' then     // Tenente Coronel
                           VS_usuario_posto:= 'Ten Cel'
                        else
                           if VS_usuario_posto = 'Maj' then     // Major
                              VS_usuario_posto:= 'Maj'
                           else
                              if VS_usuario_posto = 'Cap' then     // Capitão
                                 VS_usuario_posto:= 'Cap'
                              else
                                 if VS_usuario_posto = '1° Ten' then     // 1° Tenente
                                    VS_usuario_posto:= '1º Ten'
                                 else
                                    if VS_usuario_posto = '2° Ten' then     // 2° Tenente
                                       VS_usuario_posto:= '2º Ten'
                                    else
                                       if VS_usuario_posto = 'Asp' then     // Aspirante
                                          VS_usuario_posto:= 'Asp'
                                       else
                                          if VS_usuario_posto = 'Cad' then     // Cadete
                                             VS_usuario_posto:= 'Cad'
                                          else
                                             if VS_usuario_posto = 'S Ten' then     // SubTenente
                                                VS_usuario_posto:= 'ST'
                                             else
                                                if VS_usuario_posto = '1° Sgt' then     // 1º Sargento
                                                   VS_usuario_posto:= '1º Sgt'
                                                else
                                                   if VS_usuario_posto = '2° Sgt' then     // 2º Sargento
                                                      VS_usuario_posto:= '2º Sgt'
                                                   else
                                                      if VS_usuario_posto = '3° Sgt' then     // 3º Sargento
                                                         VS_usuario_posto:= '3º Sgt'
                                                      else
                                                         if VS_usuario_posto = 'CB' then     // Cabo
                                                            VS_usuario_posto:= 'Cb'
                                                         else
                                                            if VS_usuario_posto = 'TM' then     // Taifeiro-Mor
                                                               VS_usuario_posto:= 'TM'
                                                            else
                                                               if VS_usuario_posto = 'T1' then     // Taifeiro-de-Primeira-Classe
                                                                   VS_usuario_posto:= 'T1'
                                                                else
                                                                   if VS_usuario_posto = 'T2' then     // Taifeiro-de-Segunda-Classe
                                                                      VS_usuario_posto:= 'T2'
                                                                   else
                                                                      if VS_usuario_posto = 'SD' then     // Soldado
                                                                         VS_usuario_posto:= 'Sd';
         end
         else
         begin
            if VS_usuario_militar = 'AERONÁUTICA' then
            begin
               if VS_usuario_posto = 'Ten Brig' then  // Tenente-Brigadeiro-do-Ar
                  VS_usuario_posto:= 'Ten Brig'
               else
                  if VS_usuario_posto = 'Maj Brig' then  // Major-Brigadeiro-do-Ar
                     VS_usuario_posto:= 'Maj Brig'
                  else
                     if VS_usuario_posto = 'Brig' then     // Brigadeiro-do-Ar
                        VS_usuario_posto:= 'Brig'
                     else
                        if VS_usuario_posto = 'Cel' then     // Coronel
                           VS_usuario_posto:= 'Cel'
                        else
                           if VS_usuario_posto = 'Ten Cel' then     // Tenente Coronel
                              VS_usuario_posto:= 'Ten Cel'
                           else
                              if VS_usuario_posto = 'Maj' then     // Major
                                 VS_usuario_posto:= 'Maj'
                              else
                                 if VS_usuario_posto = 'Cap' then     // Capitão
                                    VS_usuario_posto:= 'Cap'
                                 else
                                    if VS_usuario_posto = '1° Ten' then     // 1° Tenente
                                       VS_usuario_posto:= '1º Ten'
                                    else
                                       if VS_usuario_posto = '2° Ten' then     // 2° Tenente
                                          VS_usuario_posto:= '2º Ten'
                                       else
                                          if VS_usuario_posto = 'Asp' then     // Aspirante
                                             VS_usuario_posto:= 'Asp'
                                          else
                                             if VS_usuario_posto = 'Cad' then     // Cadete
                                                VS_usuario_posto:= 'Cad'
                                             else
                                                if VS_usuario_posto = 'SO' then     // Suboficial
                                                   VS_usuario_posto:= 'SO'
                                                else
                                                   if VS_usuario_posto = '1° Sgt' then     // 1º Sargento
                                                      VS_usuario_posto:= '1S'
                                                   else
                                                      if VS_usuario_posto = '2° Sgt' then     // 2º Sargento
                                                         VS_usuario_posto:= '2S'
                                                      else
                                                         if VS_usuario_posto = '3° Sgt' then     // 3º Sargento
                                                            VS_usuario_posto:= '3S'
                                                         else
                                                            if VS_usuario_posto = 'AL' then     // 3º Sargento
                                                               VS_usuario_posto:= 'AL'
                                                            else
                                                               if VS_usuario_posto = 'CB' then     // Cabo
                                                                  VS_usuario_posto:= 'Cb'
                                                               else
                                                                  if VS_usuario_posto = 'T1' then     // Taifeiro-de-Primeira-Classe
                                                                     VS_usuario_posto:= 'T1'
                                                                  else
                                                                     if VS_usuario_posto = 'T2' then     // Taifeiro-de-Segunda-Classe
                                                                        VS_usuario_posto:= 'T2'
                                                                     else
                                                                        if VS_usuario_posto = 'S1' then     // Soldado-de-Primeira-Classe
                                                                           VS_usuario_posto:= 'S1'
                                                                        else
                                                                           if VS_usuario_posto = 'S2' then     // Soldado-de-Segunda-Classe
                                                                              VS_usuario_posto:= 'S2';     // Soldado-de-Segunda-Classe'
            end;
         end;
      end;
   end;
   TratarPostoGraduacao:= VS_usuario_posto;
end;
end.

