//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns para o sistema.                         //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
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

unit Rotinas_Instrutor;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, IBQuery, ToolWin, ShellApi, Variants, Module;

const
   NULL     = '';

   type
   Funcao = Class
      Private

      Public
         Procedure CadastrarInstrutorMateria(PS_IdCurso, PS_CodMateria, PS_Identidade: String);
         Function VerificaInstrutorMateria(PS_IdCurso, PS_CodMateria, PS_Identidade: String): Integer;
   end;

var
   Funcoes_Instrutor: Funcao;
   VS_Auxilio: String;

implementation

uses Editor_Texto;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de Cadastrar o Instrutor por Materia
// Data     : 04/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.VerificaInstrutorMateria(PS_IdCurso, PS_CodMateria, PS_Identidade: String): Integer;
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select count(1) As Qtd from InstrutorMateria where IdCurso = '+PS_IdCurso+
                ' and CodMateria = '+#39+PS_CodMateria+#39+
                ' and Identidade = '+#39+PS_Identidade+#39;

   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   VerificaInstrutorMateria:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
end;

//------------------------------------------------------------------------------
// Descricao: Cadastrar novo Instrutor Por Materia
// Data     : 04/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.CadastrarInstrutorMateria(PS_IdCurso, PS_CodMateria, PS_Identidade: String);
var
   VS_Comando: String;
begin
   if VerificaInstrutorMateria(PS_IdCurso, PS_CodMateria, PS_Identidade) = 0 then
   begin
      VS_Comando:= 'Insert Into InstrutorMateria (IdCurso, CodMateria, Identidade, Status, Observacao) '+
                    ' Values ('+PS_IdCurso+' ,'+#39+PS_CodMateria+#39+' ,'+#39+PS_Identidade+#39+' ,'+#39+'Ativo'+#39+', '+#39+''+#39+' )';
      DM.IBQuery_Executa.Close;
      DM.IBQuery_Executa.SQL.Clear;
      DM.IBQuery_Executa.SQL.Add(VS_Comando);
      DM.IBQuery_Executa.ExecSql;
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
  Funcoes_Instrutor:= Funcao.Create;
end.

