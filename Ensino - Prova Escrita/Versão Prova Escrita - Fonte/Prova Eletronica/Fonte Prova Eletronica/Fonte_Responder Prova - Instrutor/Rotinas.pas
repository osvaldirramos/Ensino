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

unit Rotinas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
   IBQuery, ToolWin, ShellApi, midaslib;

const
   Versao= 'Versão: 1.29';
   Atualizacao= '16/08/2018';

type
   Funcao = Class
      Private
      Public
         Procedure Tratar_MsgErroServidor;
         Procedure ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
         Procedure AtualizaQuery(Query_Atualiza: TIBQuery);
         Procedure ExecusaoQuery(VS_Comando: String);

         Procedure OpenQuery(VS_Comando: String);
         Procedure ExecutaTransacao;
         Procedure abortaTransacao;
         Procedure AjustaHora;
   end;

var
   Funcoes: Funcao;

implementation

uses Module;

//------------------------------------------------------------------------------
// Descricao: Tratamento da mensagem de erro do servidor
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Tratar_MsgErroServidor;
begin
   MessageDlg('Não esta conectando com o Servidor...'+#13+'1- Verifique a conexão com a rede.'+#13+'2 -  entre em contato com o Fiscal da Prova para que ele possa mudá-lo de maquina.',mtError, [mbOk],0);
   Application.terminate;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para atualizar a Hora do Micro
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AjustaHora;
var
   SystemTime : TSystemTime;
begin
   Try
      OpenQuery('select current_timestamp as DataHora from rdb$database');
      With SystemTime do
      begin
         //Definindo o dia do sistema

         wDay:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,1,2));
         wMonth:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,4,2));
         wYear:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,7,4));

         //Definindo a hora do sistema

         wHour:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,12,2)); //hora
         wMinute:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,15,2)); //minutos
         wSecond:= 00; //segundos
      end;

      SetLocalTime(SystemTime);       //Colocar a hora e data do sistema
   except
       Tratar_MsgErroServidor;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamentos com Query
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Descricao: Atualiza Query
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AtualizaQuery(Query_Atualiza: TIBQuery);
var
   bmLocal : TBookmark;
begin
   Try
      bmLocal:= Query_Atualiza.GetBookMark;
      Query_Atualiza.Close;
      Query_Atualiza.open;
      Query_Atualiza.GotoBookMark(bmLocal);
      Query_Atualiza.FreeBookMark(bmLocal);
   except
       Tratar_MsgErroServidor;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de Fazer ExecSql na Query
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecusaoQuery(VS_Comando: String);
begin
   Try
      DM.IBQuery_ExecSql.Close;
      DM.IBQuery_ExecSql.Sql.Clear;
      DM.IBQuery_ExecSql.Sql.Add(VS_Comando);
      DM.IBQuery_ExecSql.ExecSql;
      DM.IBTransaction_Ensino.CommitRetaining;
   except
       Tratar_MsgErroServidor;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: OpenQuery
//
// Atualizado em: 25/01/2006
//------------------------------------------------------------------------------

Procedure Funcao.OpenQuery(VS_Comando: String);
begin
   Try
      DM.IBQuery_Executa.Close;
      DM.IBQuery_Executa.Sql.Clear;
      DM.IBQuery_Executa.Sql.Add(VS_Comando);
      DM.IBQuery_Executa.Open;
   except
      Tratar_MsgErroServidor;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar a query
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
begin
   Try
      Query_Executa.Close;
      Query_Executa.SQL.Clear;
      Query_Executa.SQL.Add(PS_Comando);
      Query_Executa.Open;
   except
      Tratar_MsgErroServidor;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaTransacao;
begin
   Try
      if not DM.IBTransaction_Ensino.Active then
          DM.IBTransaction_Ensino.Active := True;

      DM.IBTransaction_Ensino.CommitRetaining;
   except
      Tratar_MsgErroServidor;
      abortaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da parada da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.abortaTransacao;
begin
   Try
      if not DM.IBTransaction_Ensino.Active then
          DM.IBTransaction_Ensino.Active := True;
      DM.IBTransaction_Ensino.RollbackRetaining
   except
       Tratar_MsgErroServidor;
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
  Funcoes:= Funcao.Create;
end.

