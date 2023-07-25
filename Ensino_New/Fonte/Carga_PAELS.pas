unit Carga_PAELS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBQuery, IBCustomDataSet, IBTable, StdCtrls, JvComponent,
  JvTransBtn, ExtCtrls, JvShape, JvGradient, ComCtrls, Grids, DBGrids,
  DBClient, Rotinas, Mask, JvToolEdit, JvEdit, ToolWin, DBCtrls,
  JvCaptionPanel;

type
  TForm_Carga_PAELS = class(TForm)
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton_SelecionarCSV: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Carga: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Label_NomeArquivo: TLabel;
    OpenDialog1: TOpenDialog;
    DSC_Facil: TDataSource;
    Panel_RelacaoTurma: TPanel;
    DBGrid_CSV: TDBGrid;
    Panel_Localidade: TPanel;
    Query_MontaTurma: TIBQuery;
    Query_MontaTurmaIDCURSO: TSmallintField;
    Query_MontaTurmaIDTURMA: TIntegerField;
    Query_MontaTurmaTURMA: TIBStringField;
    Query_MontaTurmaANO: TIBStringField;
    Query_MontaTurmaDATAINICIO: TDateTimeField;
    Query_MontaTurmaDATATERMINO: TDateTimeField;
    DSQ_MontaTurma: TDataSource;
    text_Arquivo: TRichEdit;
    IBQuery_AlunoTurma: TIBQuery;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    DSQ_AlunoTurma: TDataSource;
    IBTable_AlunoTurma: TIBTable;
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
    IBQuery_Pessoa: TIBQuery;
    IBStringField1: TIBStringField;
    DSQ_Pessoa: TDataSource;
    IBTable_Pessoa: TIBTable;
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
    IBQuery_InstrutorTurma: TIBQuery;
    IBStringField2: TIBStringField;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBQuery_InstrutorTurmaDATASAIDA: TDateTimeField;
    DSQ_InstrutorTurma: TDataSource;
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
    IBTable_Turma: TIBTable;
    IBTable_TurmaIDCURSO: TSmallintField;
    IBTable_TurmaIDTURMA: TIntegerField;
    IBTable_TurmaANO: TIBStringField;
    IBTable_TurmaDATAINICIO: TDateTimeField;
    IBTable_TurmaDATATERMINO: TDateTimeField;
    IBTable_TurmaDATAINICIODIST: TDateTimeField;
    IBTable_TurmaDATATERMINODIST: TDateTimeField;
    IBTable_TurmaCOORDENADOR: TIBStringField;
    IBTable_TurmaSTATUS: TIBStringField;
    IBTable_TurmaCODSALA: TIBStringField;
    IBTable_TurmaTURMA: TIBStringField;
    IBTable_TurmaMODALIDADE: TIBStringField;
    IBTable_TurmaCOD: TIntegerField;
    IBTable_TurmaCERTIFICADO: TIntegerField;
    IBTable_TurmaRADIO: TIBStringField;
    IBTable_TurmaQTDBRASILEIROS: TIntegerField;
    IBTable_TurmaQTDESTRANGEIROS: TIntegerField;
    IBTable_TurmaDURACAO: TIntegerField;
    IBTable_TurmaDESCRICAO: TIBStringField;
    IBTable_TurmaLOCAL1: TIBStringField;
    IBTable_TurmaPARTICIPA_ESTATISTICA: TIBStringField;
    IBTable_TurmaLOCAL2: TIBStringField;
    IBTable_TurmaADMINISTRATIVAS: TIntegerField;
    IBTable_TurmaINSTRUCAO: TIntegerField;
    IBTable_TurmaFLEXIBILIZACAO: TIntegerField;
    IBTable_TurmaAVALIACAO: TIntegerField;
    IBTable_InstrutorTurmaTIPO_INSTRUTOR: TIBStringField;
    JvCaptionPanel_RelaaoTurma: TJvCaptionPanel;
    JvGradient1: TJvGradient;
    JvShape_CarregarTurma: TJvShape;
    JvTransparentButton_CarregarTurma: TJvTransparentButton;
    DBNavigator1: TDBNavigator;
    DBGrid_Turma: TDBGrid;
    ToolBar_Pesquisar: TToolBar;
    MaskEdit_Turma: TJvEdit;
    DataSource1: TDataSource;
    ClientDataSet_Carga: TClientDataSet;
    ClientDataSet_CargaCPF: TStringField;
    ClientDataSet_CargaID: TStringField;
    ClientDataSet_CargaSARAM: TStringField;
    ClientDataSet_CargaPOSTOGRADUACAO: TStringField;
    ClientDataSet_CargaNOMECOMPLETO: TStringField;
    ClientDataSet_CargaNOMEGUERRA: TStringField;
    ClientDataSet_CargaINICIOTURMA: TStringField;
    ClientDataSet_CargaTERMINOTURMA: TStringField;
    ClientDataSet_CargaFUNCAO: TStringField;
    ClientDataSet_CargaLOCALIDADE: TStringField;
    ClientDataSet_CargaUNIDADE: TStringField;
    ClientDataSet_CargaSUBUNIDADE: TStringField;
    ClientDataSet_CargaVALIDAFUNCAO: TStringField;

    Function ProcurarFuncao(Funcao: String ): String;

    Procedure Tratar_Pessoa;
    Procedure Tratar_Campo(IBTable: TIBTable; Campo, Variavel: String);


    procedure LimparLista;
    procedure GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
    procedure Tratar_Aluno_ICEA(VI_ContReg: Integer);
    procedure Tratar_Instrutor_ICEA(VI_ContReg: Integer);
    procedure Tratar_Variaveis_ICEA;
    Function TratarPostoGraduacao(VS_usuario_posto, VS_usuario_militar: String): String;

    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_SelecionarCSVClick(Sender: TObject);
    procedure JvTransparentButton_CargaClick(Sender: TObject);

    procedure JvTransparentButton_CarregarTurmaClick(Sender: TObject);
    procedure DBGrid_CSVDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_TurmaDblClick(Sender: TObject);
    procedure ClientDataSet_CargaAfterScroll(DataSet: TDataSet);
    procedure MaskEdit_TurmaChange(Sender: TObject);
  private    { Private declarations }
    VS_cpf, VS_id, VS_saram, VS_postograduacao, VS_nomecompleto, VS_nomeguerra, VS_inicioturma, VS_terminoturma, VS_funcao, VS_Localidade, VS_Unidade, VS_SubUnidade: String;
    VS_Identidade, VS_IdAntiguidade, VS_quadro: String;

    VS_usuario_identidade, VS_usuario_cpf, VS_usuario_saram, VS_usuario_militar, VS_Pais, VS_usuario_posto: String;
    VS_usuario_nome, VS_usuario_guerra, VS_usuario_nacionalidade, VS_usuario_quadro, VS_usuario_especialidade: String;

    VI_Bras: integer;

    VS_Tipo: String;
    VA_Funcao: Array[1..20] of String;
  public
    { Public declarations }
  end;

var
  Form_Carga_PAELS: TForm_Carga_PAELS;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento do botao de carga do arquivo CSV para a estrutura para carga
//
//   CPF              string 30
//   ID               string 20
//   SARAM            string 9
//   PostoGraduacao  string 25
//   NomeCompleto     string 100
//   NomeGuerra       string 20
//   InicioTurma      string 10
//   TerminoTurma     string 10
//   Funcao           string 20
//   Localidade       string 30
//   Unidade          string 20
//   SubUnidade       string 20
//   ValidaFuncao     string 1
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento da form principal
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.FormActivate(Sender: TObject);
var
   VI_QtdFuncao: integer;
begin
   Label_NomeArquivo.Caption:= '';

   Query_MontaTurma.Open;
   IBQuery_AlunoTurma.Open;
   IBQuery_Pessoa.Open;
   IBQuery_InstrutorTurma.Open;

   IBTable_Turma.Open;
   IBTable_AlunoTurma.Open;
   IBTable_InstrutorTurma.Open;
   IBTable_Pessoa.Open;

   //---
   //--- Carrega na Matriz as funcoes;

    //---
   // Descricao: Carregando as Funcoes


   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add('Select distinct Funcao from Instrutor_Funcao order By Funcao');
   DM.IBQuery_Executa.Open;
   DM.IBQuery_Executa.First;

   VI_QtdFuncao:= 1;
   VA_Funcao[VI_QtdFuncao]:= 'ALUNO';

   While not DM.IBQuery_Executa.Eof do
   begin
      VI_QtdFuncao:= VI_QtdFuncao+1;
      VA_Funcao[VI_QtdFuncao]:= DM.IBQuery_Executa.FieldByName('Funcao').AsString;
      DM.IBQuery_Executa.Next;
   end;


end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Query_MontaTurma.Close;
   IBQuery_AlunoTurma.Close;
   IBQuery_Pessoa.Close;
   IBQuery_InstrutorTurma.Close;

   IBTable_Turma.Close;
   IBTable_AlunoTurma.Close;
   IBTable_InstrutorTurma.Close;
   IBTable_Pessoa.Close;

   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botão Windows
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
//  Tratamento do botao selecionar arq csv
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.JvTransparentButton_SelecionarCSVClick( Sender: TObject);
begin
   Panel_Localidade.Caption:= '';
   IF OPENDIALOG1.EXECUTE THEN
   BEGIN
      Label_NomeArquivo.Caption:= OPENDIALOG1.FILENAME;
      Text_Arquivo.Lines.LoadFromFile(OPENDIALOG1.FILENAME);
      JvTransparentButton_Carga.Enabled:= True;
   END;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para iniciar a carga
//------------------------------------------------------------------------------

Function TForm_Carga_PAELS.ProcurarFuncao(Funcao: String ): String;
var
   VS_Retorno: String;
   VI_QtdFuncao: Integer;
begin
   VI_QtdFuncao:= 1;
   VS_Retorno:= '0';

   While ((VI_QtdFuncao < 20) and ( VS_Retorno = '0')) do
   begin
      if VA_Funcao[VI_QtdFuncao] = Funcao then
         VS_Retorno:= '1';
      VI_QtdFuncao:= VI_QtdFuncao+1;
   end;
   ProcurarFuncao:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para iniciar a carga
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.JvTransparentButton_CargaClick( Sender: TObject);
var
    i, nlin, VI_ContReg, VI_Cont: integer;
   VS_Status, VS_String, VS_VAR, linha: String;
begin

   LimparLista;

   VS_Status:= 'Erro';
   VS_Localidade:= '';

   nlin:=text_Arquivo.Lines.Count;
   nlin:= nlin-1;
   VI_ContReg:= 0;
   While VI_ContReg <= nlin do
   begin
      Linha:= trim(text_Arquivo.lines[VI_ContReg])+' ';
      //if Copy(linha, VI_ContReg, 1) <> ';' then
      //begin

         VS_cpf:= '';
         VS_id:= '';
         VS_saram:= '';
         VS_postograduacao:= '';
         VS_nomecompleto:= '';
         VS_nomeguerra:= '';
         VS_inicioturma:= '';
         VS_terminoturma:= '';
         VS_Unidade:= '';
         VS_SubUnidade:= '';
         VS_funcao:= '';

         VI_Cont:= 0;
         VS_String:= '';

         for i:= 1 to length(linha) do
         begin
            VS_Var:= Copy(linha, i, 1);
            if ((VS_Var <> ';') and (VS_Var <> ',')) then
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
                  1: VS_cpf:= trim(Funcoes.DePara(VS_String, '"', ''));
                  2: VS_id:= trim(Funcoes.DePara(VS_String, '"', ''));
                  3: VS_saram:= trim(Funcoes.DePara(VS_String, '"', ''));
                  4: VS_postograduacao:= trim(Funcoes.DePara(VS_String, '"', ''));
                  5: VS_nomecompleto:= trim(Funcoes.DePara(VS_String, '"', ''));
                  6: VS_nomeguerra:= trim(Funcoes.DePara(VS_String, '"', ''));
                  7: VS_inicioturma:= trim(Funcoes.DePara(VS_String, '"', ''));
                  8: VS_terminoturma:= trim(Funcoes.DePara(VS_String, '"', ''));
                  9: VS_Unidade:= trim(Funcoes.DePara(VS_String, '"', ''));
                  10: VS_SubUnidade:= trim(Funcoes.DePara(VS_String, '"', ''));
                  11: VS_funcao:= trim(Funcoes.DePara(VS_String, '"', ''));
               end;
               VS_String:= '';
            end;
         end;
         VS_funcao:= Trim(Funcoes.DePara(VS_String, '"', ''));

         if  VS_Status = 'Erro_Virgula' then
         begin
            VS_Status:= 'Erro';
            Break;
         end
         else
         begin
            if (( VS_Status = 'Erro') and (VS_cpf = '') and (VS_id = '')) then
            begin
               VS_Status:= 'Erro';
               ShowMessage('Arquivo esta vazio vazio');
               Break;
            end
            else
            begin
               VS_cpf:= trim(VS_cpf);
               VS_id:= trim(VS_id);
               VS_saram:= trim(VS_saram);
               VS_postograduacao:= trim(VS_postograduacao);
               VS_nomecompleto:= trim(VS_nomecompleto);
               VS_nomeguerra:= trim(VS_nomeguerra);
               VS_inicioturma:= trim(VS_inicioturma);
               VS_terminoturma:= trim(VS_terminoturma);
               VS_Unidade:= trim(VS_Unidade);
               VS_SubUnidade:= trim(VS_SubUnidade);
               VS_funcao:= trim(VS_funcao);

               if (VS_cpf <> '') then
               begin
                  if (( VS_Status = 'Erro') and ( VS_cpf = 'CPF') and ( VS_id = 'ID') and ( VS_saram = 'SARAM') and ( VS_postograduacao = 'PST/GRAD') and
                      ( VS_nomecompleto = 'NOME COMPLETO') and ( VS_nomeguerra = 'NOME DE GUERRA') and ( VS_inicioturma = 'INICIO TURMA') and
                      ( VS_terminoturma = 'TERMINO TURMA') and ( VS_funcao = 'FUNCAO')) then
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
                        if ((VS_id = '') and  (VS_saram = '')) Then
                        begin
                           VS_Localidade:= VS_cpf;
                           if Panel_Localidade.Caption = '' then
                              Panel_Localidade.Caption:= VS_cpf;
                        end;

                        if VS_cpf = '#' then
                           VS_cpf:= '';

                        if VS_id = '#' then
                           VS_id:= '';

                        if VS_saram = '#' then
                           VS_saram:= '';

                        if VS_postograduacao = '#' then
                           VS_postograduacao:= '';

                        if VS_nomecompleto = '#' then
                           VS_nomecompleto:= '';

                        if VS_nomeguerra = '#' then
                           VS_nomeguerra:= '';

                        if VS_inicioturma = '#' then
                           VS_inicioturma:= '';

                        if VS_funcao = '#' then
                           VS_funcao:= '';

                        if VS_unidade = '#' then
                           VS_unidade:= '';

                        if VS_subunidade = '#' then
                           VS_subunidade:= '';

                        if VS_Localidade = '#' then
                           VS_Localidade:= '';

                        if VS_id = '' then
                           VS_id:= 'nnnnnn';

                        ClientDataSet_Carga.Append;
                        ClientDataSet_Carga.FieldByName('cpf').AsString:= VS_cpf;
                        ClientDataSet_Carga.FieldByName('id').AsString:= VS_id;
                        ClientDataSet_Carga.FieldByName('saram').AsString:= VS_saram;
                        ClientDataSet_Carga.FieldByName('postograduacao').AsString:= VS_postograduacao;
                        ClientDataSet_Carga.FieldByName('nomecompleto').AsString:= VS_nomecompleto;
                        ClientDataSet_Carga.FieldByName('nomeguerra').AsString:= VS_nomeguerra;
                        ClientDataSet_Carga.FieldByName('inicioturma').AsString:= VS_inicioturma;
                        ClientDataSet_Carga.FieldByName('terminoturma').AsString:= VS_terminoturma;
                        ClientDataSet_Carga.FieldByName('funcao').AsString:= VS_funcao;
                        ClientDataSet_Carga.FieldByName('unidade').AsString:= VS_unidade;
                        ClientDataSet_Carga.FieldByName('subunidade').AsString:= VS_subunidade;
                        ClientDataSet_Carga.FieldByName('localidade').AsString:= VS_Localidade;
                        if VS_id = 'nnnnnn' then
                           ClientDataSet_Carga.FieldByName('ValidaFuncao').AsString:= '1'
                        else
                           ClientDataSet_Carga.FieldByName('ValidaFuncao').AsString:= ProcurarFuncao(VS_funcao);
                        ClientDataSet_Carga.Post;
                     end;
                  end;
               end;
            VI_ContReg:= VI_ContReg+1;
         end;
      end;
   end;

   if VS_Status <> 'Erro' then
   begin
      ClientDataSet_Carga.Append;
      ClientDataSet_Carga.FieldByName('cpf').AsString:= 'Fim Arquivo';
      ClientDataSet_Carga.Post;
      ClientDataSet_Carga.First;
   end;

end;

//------------------------------------------------------------------------------
// Limpar matrizes
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.LimparLista;
begin
   ClientDataSet_Carga.First;
   While Not ClientDataSet_Carga.Eof do
      ClientDataSet_Carga.Delete;
end;

//------------------------------------------------------------------------------
// Tratamento do AfterScroll
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.ClientDataSet_CargaAfterScroll(DataSet: TDataSet);
begin
   Panel_Localidade.Caption:= ClientDataSet_Carga.FieldByName('localidade').AsString;

   if ClientDataSet_Carga.FieldByName('Id').AsString = '' then
      JvTransparentButton_CarregarTurma.Enabled:= True
   else
      JvTransparentButton_CarregarTurma.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do botao carregar turma
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.JvTransparentButton_CarregarTurmaClick(Sender: TObject);
var
   VI_ContReg: integer;
begin
   if ((ClientDataSet_Carga.FieldByName('cpf').AsString = '') or ( ClientDataSet_Carga.FieldByName('cpf').AsString = 'Fim Arquivo'))  then
      ShowMessage('Para carregar o arquivo primeiro deverá selecionar o arquivo CSV e clicar no botão "Iniciar a Carga"...')

   else
   begin
      VI_Bras:= 0;
      ClientDataSet_Carga.delete;
      VI_ContReg:= 0;
      While not ClientDataSet_Carga.Eof do
      begin
          if ((ClientDataSet_Carga.FieldByName('Id').AsString = '') or ( ClientDataSet_Carga.FieldByName('cpf').AsString = 'Fim Arquivo'))  then
              Break
          else
          begin
            VI_ContReg:= VI_ContReg+1;
            VS_usuario_cpf:= ClientDataSet_Carga.FieldByName('cpf').AsString;
            VS_usuario_identidade:= ClientDataSet_Carga.FieldByName('Id').AsString;
            VS_usuario_saram:= ClientDataSet_Carga.FieldByName('saram').AsString;
            VS_usuario_nome:= ClientDataSet_Carga.FieldByName('nomecompleto').AsString;
            VS_usuario_guerra:= ClientDataSet_Carga.FieldByName('nomeguerra').AsString;
            VS_usuario_posto:= ClientDataSet_Carga.FieldByName('postograduacao').AsString;
            VS_Unidade:= ClientDataSet_Carga.FieldByName('Unidade').AsString;
            VS_SubUnidade:= ClientDataSet_Carga.FieldByName('SubUnidade').AsString;

            if ClientDataSet_Carga.FieldByName('funcao').AsString = 'ALUNO' then
               Tratar_Aluno_ICEA(VI_ContReg)
            else
               Tratar_Instrutor_ICEA(VI_ContReg);

          end;
          ClientDataSet_Carga.delete;
          Update;
      end;
      IBTable_Turma.Edit;
      IBTable_Turma.FieldByName('QtdBrasileiros').AsInteger:= VI_Bras;
      IBTable_Turma.FieldByName('QtdEstrangeiros').AsInteger:= 0;
      IBTable_Turma.Post;
      Funcoes.ExecutaTransacao;
   end;

end;

procedure TForm_Carga_PAELS.DBGrid_TurmaDblClick(Sender: TObject);
begin
   JvTransparentButton_CarregarTurmaClick(Sender);
end;

procedure TForm_Carga_PAELS.GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
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
                   'where IdCurso = '+Query_MontaTurma.FieldByName('IdTurma').AsString+
                   ' and IdTurma = '+Query_MontaTurma.FieldByName('IdTurma').AsString+
                   ' and CodigoAluno = '+VS_CodAluno;

      if Funcoes.QtdRegistro(VS_Comando) = 0 then
      begin
         VI_CodExiste:= 1;
         IBTable_AlunoTurma.FieldByName('CodigoAluno').AsString:= VS_CodAluno;
      end;
   end;
end;


  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.Tratar_Aluno_ICEA(VI_ContReg: Integer);
begin
   Tratar_Variaveis_ICEA;
   VS_quadro:= '';

   Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade From AlunoTurma '+
                                             ' Where IdCurso = '+Query_MontaTurma.FieldByName('IDCURSO').AsString+
                                             ' and IdTurma =  '+Query_MontaTurma.FieldByName('IDTURMA').AsString+
                                             ' and Identidade = '+#39+VS_Identidade+#39
                        );
   Tratar_Pessoa;

    //-----
   //--- Tratamento do Cadastro Aluno Turma

   Funcoes.OpenQuery('Select IdAntiguidade From Antiguidade Where PostoGraduacao = '+#39+VS_usuario_posto+#39);

   VS_IdAntiguidade:= DM.IBQuery_Executa.FieldByName('IdAntiguidade').AsString;
   if VS_IdAntiguidade = '' then
      VS_IdAntiguidade:= '100';

   //--- Tratamento para verificar o Tipo de Aluno

   VI_Bras:= VI_Bras+1;
   if ((VS_usuario_posto = 'CV') or (VS_usuario_posto = '') or (VS_usuario_posto = 'CIVIL')) then
      VS_Tipo:= 'CIVIL'
   else
      VS_Tipo:= 'MILITAR DA AERONÁUTICA';

   Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade From AlunoTurma '+
                                             ' Where IdCurso = '+Query_MontaTurma.FieldByName('IDCURSO').AsString+
                                             ' and IdTurma =  '+Query_MontaTurma.FieldByName('IDTURMA').AsString+
                                             ' and Identidade = '+#39+VS_Identidade+#39
                        );

   If IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString = '' then
   begin
      IBTable_AlunoTurma.Append;
      IBTable_AlunoTurma.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
      IBTable_AlunoTurma.FieldByName('IDCURSO').AsString:= Query_MontaTurma.FieldByName('IDCURSO').AsString;
      IBTable_AlunoTurma.FieldByName('IDTURMA').AsString:= Query_MontaTurma.FieldByName('IDTURMA').AsString;
      IBTable_AlunoTurma.FieldByName('NUMORDEM').AsInteger:= VI_ContReg;
      IBTable_AlunoTurma.FieldByName('DATAMATRICULA').AsString:= IBTable_Turma.FieldByName('DataInicio').AsString;
      IBTable_AlunoTurma.FieldByName('DATADESLIGAMENTO').AsString:= IBTable_Turma.FieldByName('DataTermino').AsString;
      IBTable_AlunoTurma.FieldByName('MOTIVODESLIGAMENTO').AsString:=  'a';

      IBTable_AlunoTurma.FieldByName('TIPO_ALUNO').AsString:= VS_Tipo;
      IBTable_AlunoTurma.FieldByName('CHAMADA').AsString:= 'S';
      GerarCodigoAluno(IBTable_Turma.FieldByName('IDCURSO').AsString, IBTable_Turma.FieldByName('IDTURMA').AsString);
   end
   else
     IBTable_AlunoTurma.Edit;

   Tratar_Campo(IBTable_AlunoTurma, 'NOMECOMPLETO', trim(Funcoes.AjustarMaiscula(VS_usuario_posto))+' '+Funcoes.AjustarMaiscula(VS_quadro)+' '+Trim(Funcoes.AjustarMaiscula(VS_usuario_nome)));
   Tratar_Campo(IBTable_AlunoTurma, 'POSTOGRADUACAO', Funcoes.AjustarMaiscula(VS_usuario_posto));
   Tratar_Campo(IBTable_AlunoTurma, 'IdAntiguidade', VS_IdAntiguidade);
   Tratar_Campo(IBTable_AlunoTurma, 'IdUnidade', VS_Unidade);
   Tratar_Campo(IBTable_AlunoTurma, 'IdSubUnidade', VS_SubUnidade);

   IBTable_AlunoTurma.Post;
   Funcoes.ExecutaTransacao;
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.Tratar_Instrutor_ICEA(VI_ContReg: Integer);
var
   VS_CodInstrutor, VS_DataChegada, VS_DataSaida, VS_quadro: String;
begin
   Tratar_Variaveis_ICEA;
   VS_quadro:= '';

   VS_DataChegada:= Funcoes.DePara(ClientDataSet_Carga.FieldByName('inicioturma').AsString, '/', '.')+' 00:00';

   VS_DataSaida:= Funcoes.DePara(ClientDataSet_Carga.FieldByName('terminoturma').AsString, '/', '.')+' 00:00';

   Funcoes.ExecutaQuery( IBQuery_InstrutorTurma, ' Select IdCurso, IdTurma, Identidade, DataChegada, DataSaida '+
                                                 ' From InstrutorTurma '+
                                                 ' Where IdCurso = '+Query_MontaTurma.FieldByName('IDCURSO').AsString+
                                                 ' and IdTurma =  '+Query_MontaTurma.FieldByName('IDTURMA').AsString+
                                                 ' and Identidade = '+#39+VS_Identidade+#39+
                                                 ' and DataChegada = '+#39+VS_DataChegada+#39+
                                                 ' and DataSaida = '+#39+VS_DataSaida+#39
                        );

//   If IBQuery_InstrutorTurma.FieldByName('Identidade').AsString = '' then
//   begin
      // Tratamento para Cadastrar os dados do Instrutor como Pessoa

      Tratar_Pessoa;

      //--- Tratamento para verificar o Tipo de Instrutor

      if ((VS_usuario_posto = 'CV') or (VS_usuario_posto = '') or (VS_usuario_posto = 'CIVIL')) then
          VS_Tipo:= 'CIVIL'
      else
          VS_Tipo:= 'MILITAR DA AERONÁUTICA';

      VS_CodInstrutor:= Funcoes.GerarCodigoInstrutor(Query_MontaTurma.FieldByName('IdCurso').AsString, Query_MontaTurma.FieldByName('IdTurma').AsString);

      Funcoes.OpenQuery('Select IdAntiguidade From Antiguidade Where PostoGraduacao = '+#39+VS_usuario_posto+#39);
      VS_IdAntiguidade:= DM.IBQuery_Executa.FieldByName('IdAntiguidade').AsString;
      if VS_IdAntiguidade = '' then
         VS_IdAntiguidade:= '100';

      Funcoes.ExecutaQuery( IBQuery_InstrutorTurma, ' Select IdCurso, IdTurma, Identidade, DataChegada, DataSaida '+
                                                    ' From InstrutorTurma '+
                                                    ' Where IdCurso = '+Query_MontaTurma.FieldByName('IDCURSO').AsString+
                                                    ' and IdTurma =  '+Query_MontaTurma.FieldByName('IDTURMA').AsString+
                                                    ' and Identidade = '+#39+VS_Identidade+#39+
                                                    ' and DataChegada = '+#39+VS_DataChegada+#39+
                                                    ' and DataSaida = '+#39+VS_DataSaida+#39
                           );

      If IBQuery_InstrutorTurma.FieldByName('Identidade').AsString = '' then
      begin
         IBTable_InstrutorTurma.Append;
         IBTable_InstrutorTurma.FieldByName('Identidade').AsString:= VS_Identidade;
         IBTable_InstrutorTurma.FieldByName('IdCurso').AsString:= Query_MontaTurma.FieldByName('IDCURSO').AsString;
         IBTable_InstrutorTurma.FieldByName('IdTurma').AsString:= Query_MontaTurma.FieldByName('IDTURMA').AsString;
         IBTable_InstrutorTurma.FieldByName('CodigoInstrutor').AsString:= VS_CodInstrutor;
         IBTable_InstrutorTurma.FieldByName('Senha').AsString:= VS_CodInstrutor;
      end
      else
         IBTable_InstrutorTurma.Edit;

      Tratar_Campo(IBTable_InstrutorTurma, 'NOMECOMPLETO', trim(Funcoes.AjustarMaiscula(VS_usuario_posto))+' '+Funcoes.AjustarMaiscula(VS_quadro)+' '+Trim(Funcoes.AjustarMaiscula(VS_usuario_nome)));
      Tratar_Campo(IBTable_InstrutorTurma, 'IdUnidade', VS_Unidade);
      Tratar_Campo(IBTable_InstrutorTurma, 'IdSubUnidade', VS_SubUnidade);
      Tratar_Campo(IBTable_InstrutorTurma, 'IdAntiguidade', VS_IdAntiguidade);

      IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString:= VS_SubUnidade;

      IBTable_InstrutorTurma.FieldByName('DataChegada').AsString:= ClientDataSet_Carga.FieldByName('inicioturma').AsString;
      IBTable_InstrutorTurma.FieldByName('DataSaida').AsString:= ClientDataSet_Carga.FieldByName('terminoturma').AsString;
      IBTable_InstrutorTurma.FieldByName('Funcao').AsString:= ClientDataSet_Carga.FieldByName('funcao').AsString;
      IBTable_InstrutorTurma.FieldByName('Ficha').AsString:= 'Conferir';
      IBTable_InstrutorTurma.FieldByName('TIPO_INSTRUTOR').AsString:= VS_Tipo;
      IBTable_InstrutorTurma.Post;
      Funcoes.ExecutaTransacao;
end;


  //------------------------------------------------------------------------------
 // Tratamento da Tabela Pessoa
//------------------------------------------------------------------------------

Procedure TForm_Carga_PAELS.Tratar_Pessoa;
begin
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
         VS_Identidade:= VS_usuario_identidade;
      IBTable_Pessoa.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
   end
   else
   begin
      IBTable_Pessoa.Edit;
      VS_quadro:= IBTable_Pessoa.FieldByName('QuadroEsp').AsString;
   end;

   Tratar_Campo(IBTable_Pessoa, 'IDENTIDADE_OLD', VS_usuario_identidade);
   Tratar_Campo(IBTable_Pessoa, 'NOME', Funcoes.AjustarMaiscula(VS_usuario_nome));
   Tratar_Campo(IBTable_Pessoa, 'NOMEGUERRA', Funcoes.AjustarMaiscula(VS_usuario_guerra));
   Tratar_Campo(IBTable_Pessoa, 'SARAM', VS_usuario_saram);
   Tratar_Campo(IBTable_Pessoa, 'POSTOGRADUACAO', Funcoes.AjustarMaiscula(VS_usuario_posto));
   Tratar_Campo(IBTable_Pessoa, 'NOMEPAIS', VS_Pais);
   Tratar_Campo(IBTable_Pessoa, 'CPF_CIC', VS_usuario_cpf);
   Tratar_Campo(IBTable_Pessoa, 'IdUnidade', VS_Unidade);
   Tratar_Campo(IBTable_Pessoa, 'IdSubUnidade', VS_SubUnidade);

   IBTable_Pessoa.Post;
   Funcoes.ExecutaTransacao;
end;

  //------------------------------------------------------------------------------
 // Tratamento do campo não permitindo atualizar com campos em branco
//------------------------------------------------------------------------------

Procedure TForm_Carga_PAELS.Tratar_Campo(IBTable: TIBTable; Campo, Variavel: String);
begin
   if Variavel <> '' then
       IBTable.FieldByName(Campo).AsString:= Variavel;
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_Carga_PAELS.Tratar_Variaveis_ICEA;
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

   VS_usuario_militar:= 'AERONÁUTICA';

   VS_Pais:= 'BRASIL';
   VS_usuario_nacionalidade:= 'BRASILEIRA';
   VS_usuario_quadro:= '';
   VS_usuario_especialidade:= '';

   if ((trim(VS_usuario_cpf) <> '') and (trim(VS_usuario_identidade) = '')) then
      VS_usuario_identidade:= VS_usuario_cpf;

   VS_usuario_posto:= TratarPostoGraduacao(VS_usuario_posto, VS_usuario_militar);
end;

//------------------------------------------------------------------------------
// Tratamento para definir o posto graduacao
//------------------------------------------------------------------------------

Function TForm_Carga_PAELS.TratarPostoGraduacao(VS_usuario_posto, VS_usuario_militar: String): String;
begin
   if VS_usuario_posto = 'CV' then
   begin
      VS_usuario_posto:= 'CV';     // CIVIL
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
                              if ((VS_usuario_posto = '1° Ten') or (VS_usuario_posto = '1 Ten')) then     // 1° Tenente
                                 VS_usuario_posto:= '1º Ten'
                              else
                                 if ((VS_usuario_posto = '2° Ten') or (VS_usuario_posto = '2 Ten')) then     // 1° Tenente
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
                                             if ((VS_usuario_posto = '1° Sgt') or (VS_usuario_posto = '1 Sgt')) then     // 1° Tenente
                                                VS_usuario_posto:= '1S'
                                             else
                                                if ((VS_usuario_posto = '2° Sgt') or (VS_usuario_posto = '2 Sgt')) then     // 1° Tenente
                                                   VS_usuario_posto:= '2S'
                                                else
                                                   if ((VS_usuario_posto = '3° Sgt') or (VS_usuario_posto = '3 Sgt')) then     // 1° Tenente
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
   TratarPostoGraduacao:= VS_usuario_posto;
end;


procedure TForm_Carga_PAELS.DBGrid_CSVDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if ClientDataSet_Carga.FieldByName('ValidaFuncao').AsString = '0' then
   begin
      DBGrid_CSV.Canvas.Brush.Color:= clRed;
      DBGrid_CSV.Canvas.Font.Color:= clWhite;
   end
   else
   begin
      if ClientDataSet_Carga.FieldByName('Id').AsString = 'nnnnnn' then
      begin
         DBGrid_CSV.Canvas.Brush.Color:= $000079F2;
         DBGrid_CSV.Canvas.Font.Color:= clWhite;
      end
      else
      begin
         DBGrid_CSV.Canvas.Brush.Color:= $00CADBFF;
         DBGrid_CSV.Canvas.Font.Color:= clBlack;
      end;
   end;

  if gdSelected in State then
    DBGrid_CSV.Canvas.Brush.Color := clSkyBlue;

   DBGrid_CSV.Canvas.FillRect(Rect);
   DBGrid_CSV.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Carga_PAELS.MaskEdit_TurmaChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select IdCurso, IdTurma, Turma, ano, datainicio, datatermino '+
                ' From turma '+
                ' Where IdCurso = 208 '+
                ' and Status = '+#39+'A'+#39+' or Status = '+#39+'P'+#39;

    if MaskEdit_Turma.Text <> '' then
         VS_Comando:= VS_Comando+' and Turma like '+#39+'%'+MaskEdit_Turma.Text+'%'+#39;

   VS_Comando:= VS_Comando+' Order By Ano desc , Turma desc ';

   Query_MontaTurma.Close;
   Query_MontaTurma.Sql.Clear;
   Query_MontaTurma.Sql.Add(VS_Comando);
   Query_MontaTurma.Open;
end;

end.
