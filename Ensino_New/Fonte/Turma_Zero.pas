//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Turma_Zero.PAS                                 //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade verificar se existe //
//                             a Turma zero, se não existir Cria.             //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          :                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 21/11/2010                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Turma_Zero;

interface

uses
  Rotinas,  Module, IBQuery;


   type
   Funcao = Class
      Private

      Public
         Procedure VerificaTurma_Zero( VS_IdCurso: String);
   end;

var
   TurmaZero: Funcao;
   VS_NumItem, VS_Preview, VS_Auxilio, VS_Foto, VS_Senha, VS_Acesso, VS_CodUsuario, VS_ManualAjuda, VS_CadCurso: String;

implementation

//------------------------------------------------------------------------------
// Tratamento para Criar a Turma 0 (zero)
//------------------------------------------------------------------------------

procedure Funcao.VerificaTurma_Zero(VS_IdCurso: String);
var
   VS_IdTurma: String;
begin
   DM.IBTable_Abrangencia.Open;

   Funcoes.OpenQuery('Select count(1) as Qtd From Turma Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then       // cadastra a Turma 0 (zero)
   begin
     Funcoes.ExecusaoQuery('Insert into Turma(IdCurso, IdTurma, Turma, Ano, Status)'+
                           ' values ( '+VS_IdCurso+', 0, '+#39+'TURMA'+#39+', '+#39+'BASE'+#39+', '+#39+'B'+#39+')'
                          );
   end;

   Funcoes.OpenQuery('Select IdTurma, turma From Turma Where IdCurso = '+VS_IdCurso+' order By IdTurma Desc');
   VS_IdTurma:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;

    //-----
   //--- Tratamento da Tabela MateriaCurso

   Funcoes.OpenQuery('Select count(1) as Qtd From MateriaCurso Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then       // cadastra a Turma 0 (zero)
   begin
      Funcoes.OpenQuery( 'Select * from MateriaCurso Where IdCurso = '+VS_IdCurso+' and IdTurma = '+VS_IdTurma);

      DM.IBTable_Materia.Open;
      DM.IBQuery_Executa.First;
      While Not DM.IBQuery_Executa.Eof do
      begin
         Funcoes.Grava_Disciplina( VS_IdCurso,
                                   '0',
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
   end;

    //-----
   //--- Tratamento da Tabela Abrangencia

   Funcoes.OpenQuery('Select count(1) as Qtd From Abrangencia_Prova Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then       // cadastra a Turma 0 (zero)
   begin
      Funcoes.OpenQuery( 'Select * from Abrangencia_Prova Where IdCurso = '+VS_IdCurso+' and IdTurma = '+VS_IdTurma);

      DM.IBTable_Abrangencia.Open;
      DM.IBQuery_Executa.First;
      While Not DM.IBQuery_Executa.Eof do
      begin
         Funcoes.Grava_Abrangencia( VS_IdCurso,
                                    '0',
                                    DM.IBQuery_Executa.FieldByName('FASEAPLICACAO').AsString,
                                    DM.IBQuery_Executa.FieldByName('REFERENCIAAVALIACAO').AsString,
                                    DM.IBQuery_Executa.FieldByName('CODMATERIA').AsString,
                                    DM.IBQuery_Executa.FieldByName('MATERIA').AsString
                                  );
         DM.IBQuery_Executa.Next;
      end;
      DM.IBTable_Abrangencia.Close;
   end;

    //--
   //--- Tratamento do QGA

   Funcoes.OpenQuery('Select count(1) as Qtd From Avaliacao Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then       // cadastra a Turma 0 (zero)
   begin
      Funcoes.OpenQuery('Select * from Avaliacao Where IdCurso = '+VS_IdCurso+' and IdTurma = '+VS_IdTurma);

      DM.IBTable_Avaliacao.Open;
      DM.IBQuery_Executa.First;
      While Not DM.IBQuery_Executa.Eof do
      begin
         Funcoes.Grava_Avaliacao( VS_IdCurso,
                                  '0',
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
   end;

    //--
   //--- Tratamento do Item Prova

   Funcoes.OpenQuery('Select count(1) as Qtd From Item_Prova Where IdCurso = '+VS_IdCurso+' and IdTurma = 0');

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then       // cadastra a Turma 0 (zero)
   begin
      Funcoes.OpenQuery('Select * from Item_Prova  Where IdCurso = '+VS_IdCurso+' and IdTurma = '+VS_IdTurma);

      DM.IBTable_Item_Prova.Open;
      DM.IBQuery_Executa.First;
      While Not DM.IBQuery_Executa.Eof do
      begin
         Funcoes.Grava_Item_Prova( VS_IdCurso,
                                   '0',
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
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  TurmaZero:= Funcao.Create;
end.

