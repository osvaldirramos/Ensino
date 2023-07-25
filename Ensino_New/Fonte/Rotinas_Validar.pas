//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas_Validar.PAS                            //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns para tratamento das fichas de avaliacao //
//                             de curso.                                      //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Marcela/ SO Roberto                        //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/05/1999                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas_Validar;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs, Rotinas_TrataData,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids, Rotinas,
  Buttons, ExtCtrls, IBTable, IBQuery, ToolWin, ShellApi, Variants, Module, JvDBRichEd;

const
   NULL     = '';

   type
   Validacao = Class
      Private

      Public
         Function VerificarOpcao(VS_Opcao: String): String;

         Function Verificar_PTS_Ja_Cadastrado(IdPTS, IdSemana, Dia_Semana, Horario: String) : Boolean;

         Procedure ListaDisciplinas(VS_IdCurso, VS_IdTurma: String; DBComboBox_Disciplina: TDBComboBox; DBComboBox_TrabalhoEscolar: TComboBox);

         procedure ComboBox_Enter(ComboBox: TComboBox);
         procedure ComboBox_Exit(ComboBox: TComboBox);

         procedure DBComboBox_Enter(DBComboBox: TDBComboBox);
         procedure DBComboBox_Exit(DBComboBox: TDBComboBox);

         procedure JvDBRichEdit_Enter(JvDBRichEdit: TJvDBRichEdit);
         procedure JvDBRichEdit_Exit(JvDBRichEdit: TJvDBRichEdit);


         Function RetornarTotalAlunos(VS_IdCurso, VS_IdTurma: String): String;
         Procedure ApagarTodosArquivos(VS_Dir: string);
         Procedure ValidarSARAM(DBEdit_Saram: TDBEdit);
         Function  ValidarData(VS_Data: String): Boolean;
         Function  TratarConferido(PostoGraduacao, Sexo: String): String;
         Function  TratarPeriodo(DataInicio, DataTermino: String): String;

         Function  RetornaUltimoIDAvaliacao: String;
         procedure CadastroAvaliacao(IBTable_FichaAvaliacao: TIBTable; VS_IdAvaliacao, VS_IdFicha: String);
         procedure CadastroAvaliador(P_IdAvaliacao, P_IdAvaliador: String);
         procedure CadastroAvaliador_Aluno(P_IdAvaliacao: String; IdFicha: Integer; IBQuery_RelacaoAlunos: TIBQuery);
         procedure RelacaoAlunos(P_IdCurso, P_IdTurma: String; IBQuery_RelacaoAlunos: TIBQuery);
         procedure CadastroAvaliado(P_IdAvaliacao, P_Identidade, P_Disciplina: String);

   end;

var
   Validar: Validacao;
   VS_Auxilio: String;

implementation

//------------------------------------------------------------------------------
// Descricao: Funcao retornar o numero de alunos
// Data     : 27/01/2020
//
// Atualizado em:
// Descricao    : Retorna o numero de alunos menos os desligados.
//------------------------------------------------------------------------------

Function Validacao.RetornarTotalAlunos(VS_IdCurso, VS_IdTurma: String): String;
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select count(1) as Qtd '+
                ' From Aluno_Turmas_VIEW a '+
                ' Where a.motivoDesligamento = '+#39+'a'+#39+
                ' and   a.IdCurso = '+VS_IdCurso+
                ' and   a.IdTurma = '+VS_IdTurma;

   Funcoes.OpenQuery(VS_Comando);
   RetornarTotalAlunos:= DM.IBQuery_Executa.FieldByName('Qtd').AsString;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para Apagar todos os arquivos
// Data     : 30/04/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Validacao.ApagarTodosArquivos(VS_Dir: string);
var
   i: integer;
   sr: TSearchRec;
begin
   I := FindFirst(PAnsiChar(VS_Dir+'\*.*'), faAnyFile, SR);
   while I = 0 do
   begin
     DeleteFile(PAnsiChar(VS_Dir+'\' + SR.Name));
     I := FindNext(SR);
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para validar o SARAM
// Data     : 30/04/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Validacao.ValidarSARAM(DBEdit_Saram: TDBEdit);
begin
   if ((DBEdit_Saram.Text <> '') and (length(DBEdit_Saram.Text) < 7)) then
   begin
      ShowMessage('Faltando número no SARAM ou SARAM invalido....');
      DBEdit_Saram.SetFocus;
   end
end;

//------------------------------------------------------------------------------
// Descricao: Valida a data analisando se elea esta OK
// Data     : 30/04/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Validacao.ValidarData(VS_Data: String): Boolean;
var
   VB_Retorno: Boolean;
   VI_Cont: Integer;
begin
   VB_Retorno:= True;
   For VI_Cont:= 1 to Length(VS_Data) do
   begin
      if ((Copy(VS_Data,VI_Cont,1) = '0') or (Copy(VS_Data,VI_Cont,1) = '1') or
          (Copy(VS_Data,VI_Cont,1) = '2') or (Copy(VS_Data,VI_Cont,1) = '3') or
          (Copy(VS_Data,VI_Cont,1) = '4') or (Copy(VS_Data,VI_Cont,1) = '5') or
          (Copy(VS_Data,VI_Cont,1) = '6') or (Copy(VS_Data,VI_Cont,1) = '7') or
          (Copy(VS_Data,VI_Cont,1) = '8') or (Copy(VS_Data,VI_Cont,1) = '9') or
          (Copy(VS_Data,VI_Cont,1) = '.') or (Copy(VS_Data,VI_Cont,1) = '/')) Then
          // Nao faz nada
      else
          VB_Retorno:= False;
   end;

   if VB_Retorno = True then
   begin
     try
        StrToDate(VS_Data);
     except
     on EConvertError do
     begin
         ShowMessage ('        Data Inválida!       ');
         VB_Retorno:= False;
     end;
     end;
   end;

   ValidarData:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento a palavra conferido de acordo com o Sexo
// Data     : 22/08/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Validacao.TratarConferido(PostoGraduacao, Sexo: String): String;
var
   VS_TratarSexo: String;
begin
   VS_TratarSexo:= 'Conferido a';
   if ((trim(PostoGraduacao) <> 'CV') and (Trim(PostoGraduacao) <> 'CIVIL')) then
   begin
      if Sexo = 'M' then
         VS_TratarSexo:= 'Conferido ao';
   end;

   TratarConferido:= VS_TratarSexo;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para validar a o periodo do Curso
// Data     : 22/08/2018
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Validacao.TratarPeriodo(DataInicio, DataTermino: String): String;
var
   VW_Ano1, VW_Mes1, VW_Dia1: Word;
   VW_Ano2, VW_Mes2, VW_Dia2: Word;
   VS_Periodo: String;
begin
   VS_Periodo:= '';

   //----------------------- Montando o Periodo Inicial -----------------------//

   if trim(DataInicio) <> '' then
   begin
      DecodeDate(StrToDate(DataInicio), VW_Ano1, VW_Mes1, VW_Dia1);

      //----------------- Montando o Periodo de Termino ------------------//

      DecodeDate(StrToDate(DataTermino), VW_Ano2, VW_Mes2, VW_Dia2);

      if ((VW_Dia1 = VW_Dia2) and (VW_Mes1 = VW_Mes2)) then
         VS_Periodo:= ' em '+Formatfloat('00', VW_Dia1)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),1)+' de '+IntToStr(VW_Ano2)
      else
      begin
         if VW_Mes1 = VW_Mes2 then
            VS_Periodo:= ' no período de '+Formatfloat('00', VW_Dia1)+' a '+IntToStr(VW_Dia2)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),1)+' de '+IntToStr(VW_Ano2)
         else
         begin
            if VW_Ano1 = VW_Ano2 then
               VS_Periodo:= ' no período de '+Formatfloat('00', VW_Dia1)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes1),1)+' a '+Formatfloat('00', VW_Dia2)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),1)+' de '+IntToStr(VW_Ano2)
            else
               VS_Periodo:= ' no período de '+Formatfloat('00', VW_Dia1)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes1),1)+' de '+IntToStr(VW_Ano1)+' a '+Formatfloat('00', VW_Dia2)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),1)+' de '+IntToStr(VW_Ano2);
         end;
      end;
   end;
   TratarPeriodo:= VS_Periodo;
end;


//------------------------------------------------------------------------------
// Rotina para pegar o ultimo IdAvaliacao
//------------------------------------------------------------------------------

Function Validacao.RetornaUltimoIDAvaliacao: String;
begin                                              
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select max(idavaliacao)+1 As Qtd  From FAC_Avaliacao ');
   RetornaUltimoIDAvaliacao:= DM.IBQuery_Executa.FieldByName('Qtd').AsString;
end;


//------------------------------------------------------------------------------
// Cadastro da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure Validacao.CadastroAvaliacao(IBTable_FichaAvaliacao: TIBTable; VS_IdAvaliacao, VS_IdFicha: String);
begin
   IBTable_FichaAvaliacao.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
   IBTable_FichaAvaliacao.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
   IBTable_FichaAvaliacao.FieldByName('IdAvaliacao').AsString:= VS_IdAvaliacao;
   IBTable_FichaAvaliacao.FieldByName('IdFicha').AsString:= VS_IdFicha;         //IBQuery_FAC_FichaAvaliacao.FieldByName('IdFicha').AsString;
   IBTable_FichaAvaliacao.Post;
   Funcoes.ExecutaTransacao;
end;


//------------------------------------------------------------------------------
// Cadastro do Avaliador Instrutor/Avaliador ICEA
//------------------------------------------------------------------------------

procedure Validacao.CadastroAvaliador(P_IdAvaliacao, P_IdAvaliador: String);
begin
   Funcoes.ExecusaoQuery(' insert into FAC_Avaliador ( IDAVALIACAO, IDAVALIADOR, RESPONDEU ) '+
                         ' Values ( '+P_IdAvaliacao+', '+#39+P_IdAvaliador+#39+', '+#39+'N'+#39+')'
                        );
end;

//------------------------------------------------------------------------------
// Cadastro do Avaliador Aluno
//------------------------------------------------------------------------------

procedure Validacao.CadastroAvaliador_Aluno(P_IdAvaliacao: String; IdFicha: integer; IBQuery_RelacaoAlunos: TIBQuery);
var
   VI_Total_Alunos, VI_Contador: Integer;
begin
   if ((IdFicha = 1) or (IdFicha = 11)) then
   begin
      IBQuery_RelacaoAlunos.Last;
      VI_Total_Alunos:= IBQuery_RelacaoAlunos.RecordCount;
      if VI_Total_Alunos > 4 then
          VI_Total_Alunos:= Trunc(VI_Total_Alunos*0.50);
   end;

   //--- Tratamento para calcular


   VI_Contador:= 1;
   IBQuery_RelacaoAlunos.First;
   While not IBQuery_RelacaoAlunos.Eof do
   begin
      if (((IdFicha = 1) or (IdFicha = 11)) and (VI_Contador > VI_Total_Alunos)) then
         Break
      else
         VI_Contador:= VI_Contador+1;

      Funcoes.ExecusaoQuery(' insert into FAC_Avaliador ( IDAVALIACAO, IDAVALIADOR, RESPONDEU ) '+
                            ' Values ( '+P_IdAvaliacao+', '+#39+IBQuery_RelacaoAlunos.FieldByNAme('Identidade').AsString+#39+', '+#39+'N'+#39+')'
                           );
      IBQuery_RelacaoAlunos.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratar da Relacao dos Aluno que irão Avaliar
//------------------------------------------------------------------------------

procedure Validacao.RelacaoAlunos(P_IdCurso, P_IdTurma: String; IBQuery_RelacaoAlunos: TIBQuery);
begin
   Funcoes.ExecutaQuery(IBQuery_RelacaoAlunos, 'select IdCurso, IdTurma, identidade, CodigoAluno '+
                                            ' From AlunoTurma '+
                                            ' Where IdCurso = '+P_IdCurso+
                                            ' and   IdTurma = '+P_IdTurma+
                                            ' and   MotivoDesligamento = '+#39+'a'+#39+
                                            ' order by rand() '
                       );
end;


//------------------------------------------------------------------------------
// Cadastro do Avaliado
//------------------------------------------------------------------------------

procedure Validacao.CadastroAvaliado(P_IdAvaliacao, P_Identidade, P_Disciplina: String);
var
   VS_IDAvaliado: String;
begin
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1)+1 As Qtd  From FAC_Avaliado Where IdAvaliacao = '+P_IdAvaliacao);
   VS_IDAvaliado:= DM.IBQuery_Executa.FieldByName('Qtd').AsString;

   Funcoes.ExecusaoQuery(' insert into FAC_Avaliado ( IDAVALIACAO, IDAVALIADO, IDENTIDADE, DISCIPLINA ) '+
                         ' Values ( '+P_IdAvaliacao+', '+VS_IDAvaliado+', '+#39+P_Identidade+#39+', '+#39+P_Disciplina+#39+')'
                        );
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da selecao do ComboBox_Enter
//
// Atualizado em: 29/04/2022
//------------------------------------------------------------------------------

procedure Validacao.ComboBox_Enter(ComboBox: TComboBox);
begin
   ComboBox.Color:= $004080FF;
   ComboBox.Font.Color:= clBlack;
end;


//------------------------------------------------------------------------------
// Descricao: Tratamento da selecao do ComboBox_Exit
//
// Atualizado em: 29/04/2022
//------------------------------------------------------------------------------

procedure Validacao.ComboBox_Exit(ComboBox: TComboBox);
begin
   ComboBox.Color:= $006C6C6C;
   ComboBox.Font.Color:= clLime;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da selecao do  DBComboBox_Enter
//
// Atualizado em: 27/04/2022
//------------------------------------------------------------------------------

procedure Validacao.DBComboBox_Enter(DBComboBox: TDBComboBox);
begin
   DBComboBox.Color:= $004080FF;
   DBComboBox.Font.Color:= clBlack;
end;


//------------------------------------------------------------------------------
// Descricao: Tratamento da selecao do  DBComboBox_Exit
//
// Atualizado em: 27/04/2022
//------------------------------------------------------------------------------

procedure Validacao.DBComboBox_Exit(DBComboBox: TDBComboBox);
begin
   DBComboBox.Color:= $006C6C6C;
   DBComboBox.Font.Color:= clLime;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento da selecao do  DBComboBox_Enter
//
// Atualizado em: 27/04/2022
//------------------------------------------------------------------------------

procedure Validacao.JvDBRichEdit_Enter(JvDBRichEdit: TJvDBRichEdit);
begin
   JvDBRichEdit.Color:= $004080FF;
   JvDBRichEdit.Font.Color:= clBlack;
end;


//------------------------------------------------------------------------------
// Descricao: Tratamento da selecao do  DBComboBox_Exit
//
// Atualizado em: 27/04/2022
//------------------------------------------------------------------------------

procedure Validacao.JvDBRichEdit_Exit(JvDBRichEdit: TJvDBRichEdit);
begin
   JvDBRichEdit.Color:= $006C6C6C;
   JvDBRichEdit.Font.Color:= clLime;
end;

//------------------------------------------------------------------------------
// Descricao: Monta a lista de disciplinas para serem selecionadas
//
// Atualizado em: 27/04/2022
//------------------------------------------------------------------------------

Procedure Validacao.ListaDisciplinas(VS_IdCurso, VS_IdTurma: String; DBComboBox_Disciplina: TDBComboBox; DBComboBox_TrabalhoEscolar: TComboBox);
var
   Disciplina: String;
begin
   Funcoes.OpenQuery( 'Select distinct CodMateria, NomeMateria '+
                      ' From MateriaCurso '+
                      ' Where IdCurso = '+VS_IdCurso+
                      ' and idturma = '+VS_IdTurma+
                      ' order by NomeMateria'
                    );

   DM.IBQuery_Executa.First;

   DBComboBox_Disciplina.Items.Clear;
   DBComboBox_Disciplina.Items.Add('');

   DBComboBox_TrabalhoEscolar.Items.Clear;

   DBComboBox_TrabalhoEscolar.Items.Add('--------------[ Abertura /  Encerramento ]-------------' );
   DBComboBox_TrabalhoEscolar.Items.Add('');
   DBComboBox_TrabalhoEscolar.Items.Add('ABERTURA DO CURSO');
   DBComboBox_TrabalhoEscolar.Items.Add('ENCERRAMENTO DO CURSO');
   DBComboBox_TrabalhoEscolar.Items.Add('À DISPOSIÇÃO DO ENSINO');
   DBComboBox_TrabalhoEscolar.Items.Add('FLEXIBILIDADE');

   DBComboBox_TrabalhoEscolar.Items.Add('---------------------[ Avaliação]---------------------');
   DBComboBox_TrabalhoEscolar.Items.Add('');

   DBComboBox_TrabalhoEscolar.Items.Add('AVALIAÇÃO');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA TEÓRICA');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA TEÓRICA – PT01');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA TEÓRICA – PT02');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA TEÓRICA – PT03');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA PRÁTICA - PP01');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA PRÁTICA - PP02');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA PRÁTICA - PP03');
   DBComboBox_TrabalhoEscolar.Items.Add('PROVA DIAGNÓSTICA');
   DBComboBox_TrabalhoEscolar.Items.Add('DISCUSSÃO DA AVALIAÇÃO PRÁTICA');
   DBComboBox_TrabalhoEscolar.Items.Add('DISCUSSÃO DA AVALIAÇÃO TEÓRICA');
   DBComboBox_TrabalhoEscolar.Items.Add('CRÍTICA DO CURSO');
   DBComboBox_TrabalhoEscolar.Items.Add('');

   DBComboBox_TrabalhoEscolar.Items.Add('-------------------------[ Extras]----------------------');
   DBComboBox_TrabalhoEscolar.Items.Add('');
   DBComboBox_TrabalhoEscolar.Items.Add('FERIADO');

   DBComboBox_TrabalhoEscolar.Items.Add('---------------------[ Disciplinas ]---------------------');
   DBComboBox_TrabalhoEscolar.Items.Add('');

   While not DM.IBQuery_Executa.Eof do
   begin
      DBComboBox_Disciplina.Items.Add(DM.IBQuery_Executa.FieldByName('CodMateria').AsString);
      Disciplina:= Funcoes.AjustarMaiscula(DM.IBQuery_Executa.FieldByName('CodMateria').AsString+' - '+DM.IBQuery_Executa.FieldByName('NomeMateria').AsString);
      DBComboBox_TrabalhoEscolar.Items.Add(Disciplina);
      DM.IBQuery_Executa.Next;
   end;
   DBComboBox_TrabalhoEscolar.Items.Add('');
end;


//------------------------------------------------------------------------------
// Tratamento para tratar se a selecao é de disciplina
//------------------------------------------------------------------------------

Function Validacao.VerificarOpcao(VS_Opcao: String): String;
var
   VS_Retorno: string;
   i: integer;
begin
   VS_Retorno:= '';

   for i := 1 to 8 do
      if ((copy(VS_Opcao, i, 1) = '0') or (copy(VS_Opcao, i, 1) = '1') or (copy(VS_Opcao, i, 1) = '2') or (copy(VS_Opcao, i, 1) = '3') or (copy(VS_Opcao, i, 1) = '4') or
          (copy(VS_Opcao, i, 1) = '5') or (copy(VS_Opcao, i, 1) = '6') or (copy(VS_Opcao, i, 1) = '7') or (copy(VS_Opcao, i, 1) = '8') or (copy(VS_Opcao, i, 1) = '9')) then
         VS_Retorno:= VS_Retorno + 'N'
      else
         VS_Retorno:= VS_Retorno + copy(VS_Opcao, i, 1);

   if VS_Retorno = 'NNNNNN -' then
      VS_Retorno:= 'Disciplina';

   VerificarOpcao:= VS_Retorno;
end;


//------------------------------------------------------------------------------
// Tratamento para verificar se o PTS ja foi cadastrado
//------------------------------------------------------------------------------

Function Validacao.Verificar_PTS_Ja_Cadastrado(IdPTS, IdSemana, Dia_Semana, Horario: String) : Boolean;
var
   VB_Gravar: Boolean;
begin
   VB_Gravar:= True;

   //--- Tratamento para verificar se o PTS ja foi inserido com a caracteristica fornecida

   Funcoes.OpenQuery( 'Select count(1) as Qtd From PTS_Semana '+
                      ' Where IdPTS =  '+IdPTS+
                      ' and   IdSemana = '+IdSemana+
                      ' and   Dia_Semana = '+#39+Dia_Semana+#39+
                      ' and   Horario = '+#39+Horario+#39
                    );

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      VB_Gravar:= False;
      ShowMessage('Já existe PTS cadastrado na '+IdSemana+'º semana na '+Dia_Semana+' com o horário selecionado '+Horario+'...');
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Validar:= Validacao.Create;
end.

