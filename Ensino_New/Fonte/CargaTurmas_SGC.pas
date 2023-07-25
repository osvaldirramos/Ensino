//------------------------------------------------------------------------------

unit CargaTurmas_SGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ToolWin, ExtCtrls, DB, IBCustomDataSet,
  IBTable, IBQuery, Rotinas, Rotinas_TrataData, JvComponent, JvTransBtn,
  JvShape, JvGradient;

type
  TForm_CargaTurmas_SGC = class(TForm)
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

    Function TratarPostoGraduacao(VS_usuario_posto: String): String;

    procedure Celular(VS_Identidade, Celular: String);
    procedure Tratar_Variaveis_ICEA;
    procedure Carga_ICEA;
    procedure Tratar_Aluno_ICEA(VI_ContReg: Integer);
    procedure Tratar_Instrutor_ICEA(VI_ContReg: Integer);

    procedure FinalizaCarga;

    procedure GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_CargaClick(Sender: TObject);
  private    { Private declarations }
      VS_Msg: String;

     VS_Tipo, VS_Nacionalidade, VS_Pais, VS_saram: String;

     VS_Identidade, VS_Papel, VS_Curso, VS_Posto, VS_quadro, VS_Esp, VS_Nome,
     VS_Guerra, VS_unidade, VS_Email, VS_Celular, VS_RG, VS_CPF, VS_Matricula, linha: String;

      VI_Bras, VI_Est: Integer;

  public
    { Public declarations }
  end;

var
  Form_CargaTurmas_SGC: TForm_CargaTurmas_SGC;

  Arq : TEXTFILE;

implementation

uses Module, Sel_Turma;

{$R *.dfm}

procedure TForm_CargaTurmas_SGC.FormActivate(Sender: TObject);
begin
   text_Resultado.Lines.Clear;
   Label_NomeArquivo.Caption:= '';

   IBTable_Pessoa.Open;
   IBTable_AlunoTurma.Open;
   IBTable_InstrutorTurma.Open;

   Label_NomeArquivo.Caption:= '';
   JvTransparentButton_Carga.Enabled:= False;
end;

procedure TForm_CargaTurmas_SGC.JvTransparentButton_ImprimirClick(Sender: TObject);
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

procedure TForm_CargaTurmas_SGC.JvTransparentButton_CargaClick(Sender: TObject);
begin
   Carga_ICEA
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno do ICEA
//------------------------------------------------------------------------------

procedure TForm_CargaTurmas_SGC.Carga_ICEA;
var
   i, nlin, VI_ContReg, VI_Cont: integer;
   VS_Status, VS_String, VS_VAR: String;
begin
   Text_Resultado.Lines.Clear;
   VS_Msg:= '';
   VI_Bras:= 0;
   VI_Est:= 0;
   VS_Status:= 'Erro';


   VS_Tipo:= 'MILITAR DA AERONÁUTICA';
   VS_nacionalidade:= 'BRASILEIRA';
   VS_Pais:= 'BRASIL';

   nlin:=text_Arquivo.Lines.Count;
   nlin:= nlin-1;
   VI_ContReg:= 0;
   While VI_ContReg <= nlin do
   begin
      Linha:= trim(text_Arquivo.lines[VI_ContReg])+' ';

      VS_Papel:= '';
      VS_Curso:= '';
      VS_Posto:= '';
      VS_quadro:= '';
      VS_Esp:= '';
      VS_Nome:= '';
      VS_Guerra:= '';
      VS_unidade:= '';
      VS_Saram:= '';
      VS_CPF:= '';
      VS_RG:= '';
      VS_Email:= '';
      VS_Celular:= '';
      VS_Status:= '';

      VI_Cont:= 0;
      VS_String:= '';

      for i:= 1 to length(linha) do
      begin
         if VI_Cont = 14 then
            Break;

         VS_Var:= Copy(linha, i, 1);

//         if (VS_Var = '|') then
//         begin
//            VS_Status:= '|';
//            Break;
//         end
//         else
//         begin
            if ((VS_Var <> ';') and (VS_Var <> ',') and (VS_Var <> '|')) then
            begin
               VS_String:= VS_String+VS_Var;
            end
            else
            begin
               VI_Cont:= VI_Cont + 1;
               case VI_Cont of
                  1:VS_Papel:= VS_String;
                  2:VS_Curso:= UTF8Decode(VS_String);
                  3:VS_Posto:= UTF8Decode(VS_String);
                  4:VS_quadro:= UTF8Decode(VS_String);
                  5:VS_Esp:= UTF8Decode(VS_String);
                  6:VS_Nome:= UTF8Decode(VS_String);                        // UTF8Decode(
                  7:VS_Guerra:= UTF8Decode(VS_String);
                  8:VS_Unidade:= UTF8Decode(VS_String);
                  9:VS_Saram:= VS_String;
                  10:VS_CPF:= VS_String;
                  11:VS_RG:= VS_String;
                  12:VS_Email:= UTF8Decode(VS_String);
                  13:VS_Celular:= UTF8Decode(VS_String);
                  14:VS_Matricula:= UTF8Decode(VS_String);
               end;
               VS_String:= '';
            end;
         end;
  //    end;
//      VS_Matricula:= trim(Funcoes.DePara(VS_String, '"', ''));

      if  VS_Status = '|' then
      begin
         ShowMessage('Verifique o separador, ele deve ser ponto e virgula ";" e não | ...');
         VS_Status:= 'Erro';
         Break;
      end
      else
      begin
         if ((VS_cpf = '') and (VS_RG = '')) then
         begin
            Text_Resultado.Lines.Add('** ERRO ** '+Trim(VS_Nome)+' Linha '+IntToStr(VI_ContReg)+' O CPF e a Identidade estão vazio');
//            ShowMessage('Verifique a Linha '+IntToStr(VI_ContReg)+#13+Linha+#13+' A linha pode estar vazia ou CPF e a Identidade estão vazio');
//            break;
         end
         else
         begin
            if VS_Status = 'Erro' then
            begin
               Text_Resultado.Lines.Add('** ERRO ** '+Trim(VS_Nome)+' Linha '+IntToStr(VI_ContReg)+' Verificar a distribuição dos dados na tabela Excel, estrutura não esta batendo com a estrutura Base');
//               ShowMessage('- '+'Verificar a distribuição dos dados na tabela Excel, estrutura não esta batendo com a estrutura Base'+#13+
//                           'papel, curso, posto, quadro, esp, nome, guerra, unidade, e-mail, telefone, rg, cpf, saram, status');
//               Break;
            end
            else
            begin
               if trim(VS_Matricula) = 'MTCL' then
               begin
                  if ( VS_CPF = '') then
                  begin
                     Text_Resultado.Lines.Add('** ERRO ** '+Trim(VS_Nome)+' Linha '+IntToStr(VI_ContReg)+' Cadastro sem CPF cadastrado...');
//                     ShowMessage('Verifique a Linha '+IntToStr(VI_ContReg)+#13+Linha+#13+' Cadastro sem CPF cadastrado...');
//                     break;
                  end
                  else
                  begin
                     if ((VS_Papel = 'ALUNO')) then
                        Tratar_Aluno_ICEA(VI_ContReg)
                     else
                        if ((VS_Papel <> 'ALUNO')) then
                           Tratar_Instrutor_ICEA(VI_ContReg);
                   end;
               end;
            end;
         end;
      end;
      VI_ContReg:= VI_ContReg+1;
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

procedure TForm_CargaTurmas_SGC.Tratar_Variaveis_ICEA;
begin
   // Tratamentos iniciais das variaveis

   VS_saram:= Funcoes.DePara(VS_saram, '-', '');
   VS_saram:= Funcoes.DePara(VS_saram, '.', '');

   VS_CPF:= Funcoes.DePara(VS_CPF, '-', '');
   VS_CPF:= Funcoes.DePara(VS_CPF, '.', '');
   if VS_CPF <> '' then
      VS_CPF:= FormatFloat ('00000000000',StrToFloat(VS_CPF));

   if IBTable_Pessoa.FieldByName('IDENTIDADE').AsString = '' then
   begin
      if trim(VS_CPF) <> '' then
         VS_Identidade:= VS_CPF;
   end;

   VS_Posto:= TratarPostoGraduacao(VS_Posto);
end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_CargaTurmas_SGC.Tratar_Aluno_ICEA(VI_ContReg: Integer);
var
   VS_IdAntiguidade: String;
begin
   Tratar_Variaveis_ICEA;

   Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade '+
                                             ' From AlunoTurma '+
                                             ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                             ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                             ' and Identidade = '+#39+VS_cpf+#39
                        );

   If IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString = '' then
   begin
      Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade '+
                                                ' From AlunoTurma '+
                                                ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                                ' and Identidade = '+#39+VS_RG+#39
                           );
      If IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString = '' then
      begin
         Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where CPF_CIC = '+#39+VS_cpf+#39 );
         If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
         begin
            VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
         end
         else
         begin
            Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where Identidade = '+#39+VS_RG+#39 );
            If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
            begin
               VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
            end
            else
            begin
               Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where Identidade = '+#39+VS_cpf+#39 );
               If ((IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '') and (VS_cpf <> '')) then
               begin
                  VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
               end;
            end;
         end;

         If trim(IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString) = '' then
         begin
            IBTable_Pessoa.Append;
            if VS_cpf <> '' then
               VS_Identidade:= VS_cpf
         end
         else
            IBTable_Pessoa.Edit;

         IBTable_Pessoa.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
         if IBTable_Pessoa.FieldByName('NOME').AsString = '' then
            IBTable_Pessoa.FieldByName('NOME').AsString:= Funcoes.AjustarMaiscula(VS_Nome)
         else
            VS_Nome:= IBTable_Pessoa.FieldByName('NOME').AsString;

         if IBTable_Pessoa.FieldByName('NOMEGUERRA').AsString = '' then
            IBTable_Pessoa.FieldByName('NOMEGUERRA').AsString:= Funcoes.AjustarMaiscula(VS_Guerra);

         IBTable_Pessoa.FieldByName('POSTOGRADUACAO').AsString:= Funcoes.AjustarMaiscula(VS_Posto);

         IBTable_Pessoa.FieldByName('NOMEPAIS').AsString:= VS_Pais;
         IBTable_Pessoa.FieldByName('EMAIL').AsString:= VS_Email;
         IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= VS_cpf;
         IBTable_Pessoa.FieldByName('IDUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_unidade);
         IBTable_Pessoa.FieldByName('IDSUBUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_unidade);
         IBTable_Pessoa.FieldByName('SARAM').AsString:= VS_Saram;

         IBTable_Pessoa.FieldByName('QUADROESP').AsString:= Funcoes.AjustarMaiscula(VS_quadro)+' '+Funcoes.AjustarMaiscula(VS_Esp);
         IBTable_Pessoa.Post;
         Funcoes.ExecutaTransacao;

          //-----
         //--- Tratamento do Cadastro Aluno Turma

         Funcoes.OpenQuery('Select IdAntiguidade From Antiguidade Where PostoGraduacao = '+#39+VS_Posto+#39);

         VS_IdAntiguidade:= DM.IBQuery_Executa.FieldByName('IdAntiguidade').AsString;
         if VS_IdAntiguidade = '' then
            VS_IdAntiguidade:= '100';

         //--- Tratamento para verificar o Tipo de Aluno

         VI_Bras:= VI_Bras+1;

         if ((VS_Posto = 'CV') or (VS_Posto = '') or (VS_Posto = 'CIVIL')) then
              VS_Tipo:= 'CIVIL';

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

         IBTable_AlunoTurma.FieldByName('POSTOGRADUACAO').AsString:= trim(Funcoes.AjustarMaiscula(VS_Posto));
         IBTable_AlunoTurma.FieldByName('IDUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_unidade);
         if IBTable_AlunoTurma.FieldByName('IDSUBUNIDADE').AsString = '' then
             IBTable_AlunoTurma.FieldByName('IDSUBUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_unidade);
         IBTable_AlunoTurma.FieldByName('IDANTIGUIDADE').AsString:= VS_IdAntiguidade;
         IBTable_AlunoTurma.FieldByName('TIPO_ALUNO').AsString:= VS_Tipo;
         IBTable_AlunoTurma.FieldByName('NOMECOMPLETO').AsString:= trim(Funcoes.AjustarMaiscula(VS_Posto))+' '+Funcoes.AjustarMaiscula(VS_Quadro)+' '+Funcoes.AjustarMaiscula(VS_Esp)+' '+Trim(Funcoes.AjustarMaiscula(VS_Nome));
         IBTable_AlunoTurma.FieldByName('CHAMADA').AsString:= 'S';
         IBTable_AlunoTurma.Post;

         //--- Tratamento do Cadastro do Telefone

         Celular(VS_Identidade, VS_Celular);

         Text_Resultado.Lines.Add('- '+Trim(VS_Nome)+' aluno cadastrado com sucesso');
         show;
         update;
      end
      else
      begin
         Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select CodCurso, Turma ' +
                                                   ' From TURMAS_TODAS_VIEW '+
                                                   ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                   ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString
                             );
          Text_Resultado.Lines.Add('- '+Trim(VS_Nome)+' com a Identidade '+VS_CPF+' encontra-se cadastrado, no curso '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' na Turma '+DM.IBQuery_Executa.FieldByName('Turma').AsString);
          update;
      end;
   end;

end;

  //------------------------------------------------------------------------------
 // Tratamento da carga dos aluno ICEA
//------------------------------------------------------------------------------

procedure TForm_CargaTurmas_SGC.Tratar_Instrutor_ICEA(VI_ContReg: Integer);
var
   VS_Identidade, VS_IdAntiguidade, VS_CodInstrutor, VS_DataChegada, VS_DataSaida,
   VS_turma_inicio, VS_turma_termino: String;
begin
   VS_turma_inicio:= DM.IBTable_Turma.FieldByName('DataInicio').AsString;
   VS_turma_termino:= DM.IBTable_Turma.FieldByName('DataTermino').AsString;

   Tratar_Variaveis_ICEA;
   VS_DataChegada:= Funcoes.DePara(VS_turma_inicio, '/', '.')+' 00:00';

   VS_DataSaida:= Funcoes.DePara(VS_turma_termino, '/', '.')+' 00:00';

   Funcoes.ExecutaQuery( IBQuery_InstrutorTurma, ' Select IdCurso, IdTurma, Identidade, DataChegada, DataSaida '+
                                                 ' From InstrutorTurma '+
                                                 ' Where IdCurso = '+DM.IBTable_Turma.FieldByName('IDCURSO').AsString+
                                                 ' and IdTurma =  '+DM.IBTable_Turma.FieldByName('IDTURMA').AsString+
                                                 ' and Identidade = '+#39+VS_RG+#39+
                                                 ' and DataChegada = '+#39+VS_DataChegada+#39+
                                                 ' and DataSaida = '+#39+VS_DataSaida+#39
                        );

   If IBQuery_InstrutorTurma.FieldByName('Identidade').AsString = '' then
   begin
      Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where CPF_CIC = '+#39+VS_cpf+#39 );
      If ((IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '') and (VS_cpf <> '')) then
      begin
         VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
      end
      else
      begin
         Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where Identidade = '+#39+VS_RG+#39 );
         If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
         begin
            VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
         end
         else
         begin
            Funcoes.ExecutaQuery( IBQuery_Pessoa, 'Select Identidade From Pessoa Where Identidade = '+#39+VS_cpf+#39 );
            If IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString <> '' then
            begin
               VS_Identidade:= IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString;
            end;
         end;
      end;

      If trim(IBQuery_Pessoa.FieldByName('IDENTIDADE').AsString) = '' then
      begin
         IBTable_Pessoa.Append;
         if VS_cpf <> '' then
            VS_Identidade:= VS_cpf
         else
            VS_Identidade:= VS_RG
      end
      else
         IBTable_Pessoa.Edit;

      IBTable_Pessoa.FieldByName('IDENTIDADE').AsString:= VS_Identidade;
      if IBTable_Pessoa.FieldByName('NOME').AsString = '' then
         IBTable_Pessoa.FieldByName('NOME').AsString:= Funcoes.AjustarMaiscula(VS_Nome)
      else
         VS_Nome:= IBTable_Pessoa.FieldByName('NOME').AsString;

      if IBTable_Pessoa.FieldByName('NOMEGUERRA').AsString = '' then
         IBTable_Pessoa.FieldByName('NOMEGUERRA').AsString:= Funcoes.AjustarMaiscula(VS_Guerra);

      IBTable_Pessoa.FieldByName('POSTOGRADUACAO').AsString:= Funcoes.AjustarMaiscula(VS_Posto);
      IBTable_Pessoa.FieldByName('NOMEPAIS').AsString:= VS_Pais;
      IBTable_Pessoa.FieldByName('EMAIL').AsString:= VS_Email;
      IBTable_Pessoa.FieldByName('CPF_CIC').AsString:= VS_CPF;
      IBTable_Pessoa.FieldByName('IDUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_Unidade);
      IBTable_Pessoa.FieldByName('SARAM').AsString:= VS_Saram;

      if IBTable_Pessoa.FieldByName('IDSUBUNIDADE').AsString = '' then
         IBTable_Pessoa.FieldByName('IDSUBUNIDADE').AsString:= Funcoes.AjustarMaiscula(VS_Unidade);
      IBTable_Pessoa.FieldByName('QUADROESP').AsString:= Funcoes.AjustarMaiscula(VS_Quadro)+' '+Funcoes.AjustarMaiscula(VS_Esp);
      IBTable_Pessoa.Post;
      Funcoes.ExecutaTransacao;

       //-----
      //--- Tratamento do Cadastro Aluno Instrutor

      //--- Tratamento para verificar o Tipo de Aluno

      VI_Bras:= VI_Bras+1;
      if ((VS_Posto = 'CV') or (VS_Posto = '') or (VS_Posto = 'CIVIL')) then
             VS_Tipo:= 'CIVIL'
      else
         VS_Tipo:= 'MILITAR DA AERONÁUTICA';

      VS_CodInstrutor:= Funcoes.GerarCodigoInstrutor(DM.IBTable_Turma.FieldByName('IdCurso').AsString, DM.IBTable_Turma.FieldByName('IdTurma').AsString);

      Funcoes.OpenQuery('Select IdAntiguidade From Antiguidade Where PostoGraduacao = '+#39+VS_Posto+#39);
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
      IBTable_InstrutorTurma.FieldByName('Funcao').AsString:= VS_Papel;
      IBTable_InstrutorTurma.FieldByName('IdUnidade').AsString:= VS_Unidade;
      if IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString = '' then
      IBTable_InstrutorTurma.FieldByName('IdSubUnidade').AsString:= VS_Unidade;
      IBTable_InstrutorTurma.FieldByName('Ficha').AsString:= 'Conferir';
      IBTable_InstrutorTurma.FieldByName('IdAntiguidade').AsString:= VS_IdAntiguidade;
      IBTable_InstrutorTurma.FieldByName('TIPO_INSTRUTOR').AsString:= VS_Tipo;
      IBTable_InstrutorTurma.FieldByName('Senha').AsString:= VS_CodInstrutor;
      IBTable_InstrutorTurma.FieldByName('NomeCompleto').AsString:= trim(Funcoes.AjustarMaiscula(VS_Posto))+' '+Funcoes.AjustarMaiscula(VS_Quadro)+' '+Funcoes.AjustarMaiscula(VS_Esp)+' '+Trim(Funcoes.AjustarMaiscula(VS_Nome));
      IBTable_InstrutorTurma.Post;

      Celular(VS_Identidade, VS_Celular);

      Text_Resultado.Lines.Add('- '+Trim(VS_Nome)+' instrutor cadastrado com sucesso');
      show;
      update;
   end;
end;



//------------------------------------------------------------------------------
// Cadastro do Celular
//------------------------------------------------------------------------------

procedure TForm_CargaTurmas_SGC.Celular(VS_Identidade, Celular: String);
begin
   //--- Tratamento do Cadastro do Telefone

   Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select Identidade From Cad_Telefone Where Identidade = '+#39+VS_Identidade+#39 );

   if DM.IBQuery_Executa.FieldByName('Identidade').AsString = '' then
      Funcoes.ExecusaoQuery('Insert into Cad_Telefone (Identidade, Celular) '+
                            ' Values ('+#39+VS_Identidade+#39+', '+#39+VS_Celular+#39+')'
                            )
      else
         Funcoes.ExecusaoQuery('update Cad_Telefone set Celular = '+#39+VS_Celular+#39+
                               ' where Identidade =  '#39+VS_Identidade+#39
                               );
end;

//------------------------------------------------------------------------------
// Gera o codigo do Aluno
//------------------------------------------------------------------------------

procedure TForm_CargaTurmas_SGC.FinalizaCarga;
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

procedure TForm_CargaTurmas_SGC.GerarCodigoAluno(VS_IdCurso: String; S_IdTurma: String);
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

procedure TForm_CargaTurmas_SGC.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_CargaTurmas_SGC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Pessoa.Close;
   IBTable_AlunoTurma.Close;
//   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o Sistema  e retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_CargaTurmas_SGC.JvTransparentButton_WindowsClick(Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para definir o posto graduacao
//------------------------------------------------------------------------------

Function TForm_CargaTurmas_SGC.TratarPostoGraduacao(VS_usuario_posto: String): String;
var
   VS_Posto: String;
begin
   VS_Posto:= VS_usuario_posto;
   if VS_usuario_posto = 'CP' then     // Capitão
        VS_Posto:= 'Cap'
   else
      if VS_usuario_posto = '1T' then     // 1° Tenente
         VS_Posto:= '1º Ten'
      else
         if VS_usuario_posto = '2T' then     // 2° Tenente
              VS_Posto:= '2º Ten'
         else
             if VS_usuario_posto = '1° Sgt' then     // 1º Sargento
                 VS_Posto:= '1S'
             else
                if VS_usuario_posto = '2° Sgt' then     // 2º Sargento
                   VS_Posto:= '2S'
                else
                   if VS_usuario_posto = '3° Sgt' then     // 3º Sargento
                      VS_Posto:= '3S'
                   else
                      if VS_usuario_posto = 'CB' then     // 3º Sargento
                         VS_Posto:= 'Cb'
                      else
                         if VS_usuario_posto = 'TC' then     // 3º Sargento
                            VS_Posto:= 'Ten Cel'
                         else
                            if VS_usuario_posto = 'MJ' then     // 3º Sargento
                               VS_Posto:= 'Maj';

   TratarPostoGraduacao:= VS_Posto;
end;
end.

