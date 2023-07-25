//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           :                                                //
//                                                                            //
// PROGRAMA                  : Rotinas.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns para o sistema.                         //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sonia Maria Herrera                        //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 03/11/2004                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                 //
//                                                                            //
// AUTOR                     :                                                //
//                                                                            //
// MODULO ALTERADO           :                                                 //
//                                                                            //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, IBQuery, Module, DateUtils;

const
  NULL     = '';
  ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Ultima_Atualizacao= '09/05/2023';
  Versao= '1.35';

type
   Funcao = Class
      Private
         VS_CodCurso, VS_IdCurso, VS_IdUsuario, VS_Privilegio, VS_Usuario: String;
         VS_LocalAvl, VS_UsuarioServidor, VS_CadCurso, VS_Starte: String;
         wlargura , waltura: integer;
      Public
        Procedure MontaTurma(PS_IdCurso, PS_IdTurma: String);

        Function AlteraVideo(largura : Integer; altura : Integer) : boolean;
        Procedure SetVideoAnterior;
        Procedure RetornaVideo;

         Function GetLocalAvl: String;
         Procedure SetLocalAvl;

         Function GetCadCurso: String;
         Procedure SetCadCurso(PI_CadCurso: String);

         Function GetCodCurso: String;
         Procedure SetCodCurso(PS_CodCurso: String);

        Procedure SetIdCurso(PS_IdCurso: String);
        Function GetIdCurso: String;

        Procedure SetStarte(PS_Starte: String);
        Function GetStarte: String;

        Procedure ExecutaTransacao_Prosima;
        Procedure abortaTransacao_Prosima;

        Procedure ExecutaTransacao_Ensino;
        Procedure abortaTransacao_Ensino;

        procedure TratarCaracterExercicio(Sender: TObject;var Key: Char);

        Function TratarExercicio(VS_Exercicio: String): String;
        Function AnoAtual: String;
        Function InserirPos(VS_Valor: String; VI_Total: Integer): String;
        Function Valida (VS_Valor: String; VI_Tam: integer): string;
        Function criptografar (Armazena: String): string;
        Function Extrai_Numeros(VS_PS: String): string;
        Function Extrai_Caracter(VS_PS: String): string;
        Function ValidaHora(VS_Hora: String): string;
        Function Randomico(VI_Limite: integer): String;
        Function AjustaHora(VS_Hora: String): String;
        Function VirgulaToPonto(VS_Valor: String): String;
        Function ExtraiExtensao(VS_NomeArq: String): String;
        Function DevolverSem(VS_NomeArq: String; Retirar: String): String;
        Function Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
        Function DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
        Function ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
        Function CentraStr(VS_Variavel: string; Len: integer): string;
        Function LeftStr(VS_Variavel: string; Len: integer): string;

        Function GetUsuario: String;
        Function GetUsuarioServidor: String;
        Function GetPrivilegio: String;
        Function GetIdUsuario: String;

        Procedure AtualizaQuery(Query_Atualiza: TIBQuery);

        Procedure SetUsuario (VS_SetUsuario: String);
        Procedure SetPrivilegio (VS_Set_Privelegio: String);
        Procedure SetIdUsuario (VS_Set_IdUsuario: String);

        Procedure OpenQueryProsima(IBQuery_OpenProsima: TIBQuery; PS_Comando: String);
        Procedure ExecSqlProsima(PS_Comando: String);

        Procedure OpenQueryEnsino(IBQuery_ExecutaEnsino: TIBQuery; PS_Comando: String);
        Procedure ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
        procedure Windows;
        Procedure TrataSetor(Turma: String; DBComboBox_Setor: TDBComboBox);
        Procedure TrataPesquisaSetor(Turma: String; ComboBox_Setor: TComboBox);
   end;

var
   Funcoes: Funcao ;

implementation

//------------------------------------------------------------------------------
// Retorna o Editor Selecionado
//------------------------------------------------------------------------------

Function Funcao.GetLocalAvl: String;
begin
   GetLocalAvl:= VS_LocalAvl;
end;

//------------------------------------------------------------------------------
// Seta Editor selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetLocalAvl;
begin
   OpenQueryEnsino( DM.IBQuery_ExecutaEnsino, 'Select Sigla From Configuracao ' );
   VS_LocalAvl:= DM.IBQuery_ExecutaEnsino.FieldByName('Sigla').AsString ;
End;

//------------------------------------------------------------------------------
// Retorna o Editor Selecionado
//------------------------------------------------------------------------------

Function Funcao.GetCadCurso: String;
begin
   GetCadCurso:= VS_CadCurso;
end;

//------------------------------------------------------------------------------
// Seta Editor selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetCadCurso(PI_CadCurso: String);
begin
   VS_CadCurso:= PI_CadCurso;
End;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Recebe o Codigo do Curso
//------------------------------------------------------------------------------

Procedure Funcao.SetCodCurso(PS_CodCurso: String);
begin
  VS_CodCurso:= PS_CodCurso;
end;

//------------------------------------------------------------------------------
// Retorna o Codigo do Curso
//------------------------------------------------------------------------------

Function Funcao.GetCodCurso: String;
begin
  GetCodCurso:= VS_CodCurso;
end;

//------------------------------------------------------------------------------
// Retorna o Id do Curso Selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetIdCurso(PS_IdCurso: String);
begin
  VS_IdCurso:= PS_IdCurso;
end;

//------------------------------------------------------------------------------
// Retorna o Id do Curso
//------------------------------------------------------------------------------

Function Funcao.GetIdCurso: String;
begin
  GetIdCurso:= VS_IdCurso;
end;

//------------------------------------------------------------------------------
// Retorna o tipo do Relaorio de Desempenho
//------------------------------------------------------------------------------

Procedure Funcao.SetStarte(PS_Starte: String);
begin
  VS_Starte:= PS_Starte;
end;

//------------------------------------------------------------------------------
// Retorna o tipo do Relaorio de Desempenho
//------------------------------------------------------------------------------

Function Funcao.GetStarte: String;
begin
  GetStarte:= VS_Starte;
end;

//------------------------------------------------------------------------------
// Descricao: Troca o valor da Variavel VS_De para o conteudo da variavel VS_Para
// Data     : 15/03/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.InserirPos(VS_Valor: String; VI_Total: Integer): String;
var
   VS_Retorno: String;
   VI_Cont, VI_Tam: Integer;
begin
   VI_Tam:= VI_Total-Length(VS_Valor);
   VS_Retorno:= Trim(VS_Valor);
   For VI_Cont:= 1 to VI_Tam do
   begin
      VS_Retorno:= VS_Retorno+' ';
   end;
   InserirPos:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Troca o valor da Variavel VS_De para o conteudo da variavel VS_Para
// Data     : 15/03/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   For VI_Cont:= 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = VS_De then
          VS_Retorno:= VS_Retorno+VS_Para
      else
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1);
   end;
   DePara:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Faz a Validacao do Valor de Latitude e Longitude
//------------------------------------------------------------------------------

Function Funcao.Valida (VS_Valor: String; VI_Tam: integer): string;
var
   VI_Cont: integer;
begin
  for VI_Cont := 1 to Length(VS_Valor) do
      if VS_Valor[VI_Cont] = ' ' then
         VS_Valor[VI_Cont]:= '9';

   for VI_Cont := Length(VS_Valor) to VI_Tam do
         VS_Valor:= VS_Valor+'9';

   Valida:= VS_Valor;
End;

//------------------------------------------------------------------------------
// Faz a criptografar de uma variavel fornecida
//------------------------------------------------------------------------------

Function Funcao.criptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      if ((copy(Armazena, Cont, 1) = 'V') or (copy(Armazena, Cont, 1) = 'W')  or
          (copy(Armazena, Cont, 1) = 'X') or (copy(Armazena, Cont, 1) = 'Y')  or
          (copy(Armazena, Cont, 1) = 'Z')) then
      begin
         Resultado:= Resultado + copy(Armazena, Cont, 1);
      end
      else
      begin
         for CodIndex := 1 to 2 do
         begin
            Temp:= Succ(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   criptografar:= Resultado;
End;


//------------------------------------------------------------------------------
// Esta função Extrai da string VS_PS apanas os Numeros
//------------------------------------------------------------------------------

Function Funcao.Extrai_Numeros(VS_PS: String): string;
var
   VS_Retorno: string;

   VI_Tam: integer;
begin
   VS_Retorno:= NULL;
   VI_Tam:= 1;

   While VI_Tam <= Length(VS_PS) do
   begin
      if ((Copy(VS_PS,VI_Tam,1) = '0') or (Copy(VS_PS,VI_Tam,1) = '1') or
          (Copy(VS_PS,VI_Tam,1) = '2') or (Copy(VS_PS,VI_Tam,1) = '3') or
          (Copy(VS_PS,VI_Tam,1) = '4') or (Copy(VS_PS,VI_Tam,1) = '5') or
          (Copy(VS_PS,VI_Tam,1) = '6') or (Copy(VS_PS,VI_Tam,1) = '7') or
          (Copy(VS_PS,VI_Tam,1) = '8') or (Copy(VS_PS,VI_Tam,1) = '9')) Then
      begin
         VS_Retorno:= VS_Retorno+Copy(VS_PS,VI_Tam,1);
      end;
      VI_Tam:= VI_Tam + 1;
   end;
   Extrai_Numeros:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta função Extrai da string VS_PS apenas os caracteres
//------------------------------------------------------------------------------

Function Funcao.Extrai_Caracter(VS_PS: String): string;
var
   VS_String, VS_Retorno: string;

   VI_Tam: integer;
begin

   VS_Retorno:= '';
   VI_Tam:= 1;

   While (VI_Tam <= Length(VS_PS)) do
   begin
      VS_String:= Copy(VS_PS,VI_Tam,1);
      if ((VS_String <> '0') and (VS_String <> '1') and (VS_String <> '2') and
          (VS_String <> '3') and (VS_String <> '4') and (VS_String <> '5') and
          (VS_String <> '6') and (VS_String <> '7') and (VS_String <> '8') and (
          VS_String <> '9')) then
      begin
         VS_Retorno:= VS_Retorno+Copy(VS_PS,VI_Tam,1);
      end;
      VI_Tam:= VI_Tam + 1;
   end;
   Extrai_Caracter:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta função tem a finalidade de Validar a Hora fornecida
//------------------------------------------------------------------------------

Function Funcao.ValidaHora(VS_Hora: String): String;
var
   VS_Retorno: string;
begin
   if Trim(VS_Hora) = '' then
   begin
      MessageDlg('A hora não pode ser branco...',mtError, [mbOk],0);
      VS_Retorno:= 'IIII';
   end
   else
   begin
      if ((Length(VS_Hora) = 1) or (Length(VS_Hora) = 2)) then
         VS_Hora:= VS_Hora+'00'
      else
         if Length(VS_Hora) = 3 then
            VS_Hora:= '0'+VS_Hora;

      VS_Retorno:= VS_Hora;

      if ((StrToInt(Copy(VS_Hora,1,2)) < 0) or (StrToInt(Copy(VS_Hora,1,2)) > 24)) then
      begin
         MessageDlg('A hora deve estar entre 0 e 24...',mtError, [mbOk],0);
         VS_Retorno:= 'IIII';
      end
      else
      begin
         if ((StrToInt(Copy(VS_Hora,3,2)) < 0) or (StrToInt(Copy(VS_Hora,3,2)) > 59)) then
         begin
            MessageDlg('O minuto deve estar entre 0 e 59...',mtError, [mbOk],0);
            VS_Retorno:= 'IIII';
         end;
      end;
   end;
   ValidaHora:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure Funcao.Windows;
begin
  if MessageDlg('Deseja sair do sistema ?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
  begin
     RetornaVideo;
     Free;
     Application.Terminate;
  end;
end;

//------------------------------------------------------------------------------
// Procedure para gerar numeros aleatorio
//------------------------------------------------------------------------------

Function Funcao.Randomico(VI_Limite: integer): String;
var
   Resultado: integer;
begin
   Resultado:= 0;

   While Resultado = 0 do
      Resultado:= Random(999);

   Randomico:= IntToStr(Resultado);
end;

//------------------------------------------------------------------------------
// Esta função tem a finalidade de Validar a Hora fornecida
//------------------------------------------------------------------------------

Function Funcao.AjustaHora(VS_Hora: String): String;
var
   VS_Retorno: string;
   VI_Tam: Integer;
begin
   VI_Tam:= Length(VS_Hora);

   case VI_Tam of
      1:  VS_Retorno:= '000'+VS_Hora;
      2:  VS_Retorno:= '00'+VS_Hora;
      3:  VS_Retorno:= '0'+VS_Hora;
      4:  VS_Retorno:= VS_Hora;
   end;
   AjustaHora:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Troca Virgula por ponto
//------------------------------------------------------------------------------

Function Funcao.VirgulaToPonto(VS_Valor: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   For VI_Cont:= 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = ',' then
          VS_Retorno:= VS_Retorno+'.'
      else
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1);
   end;
   VirgulaToPonto:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Extrai a extensao do nome do arquivo
//------------------------------------------------------------------------------

Function Funcao.ExtraiExtensao(VS_NomeArq: String): String;
var
   VS_Retorno: String;
   i: integer;
Begin
   VS_Retorno:= '';
   For i := 1 to length(VS_NomeArq) do
   begin
      if copy(VS_NomeArq,i,1) = '.' then
          break
      else
         VS_Retorno:= VS_Retorno+copy(VS_NomeArq,i,1);
   end;
   ExtraiExtensao:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Devolve a variavel VS_NomeArq sem o caracter que esta na variavel Retirar
//------------------------------------------------------------------------------

Function Funcao.DevolverSem(VS_NomeArq: String; Retirar: String): String;
var
   VS_Retorno: String;
   i: integer;
Begin
   VS_Retorno:= '';
   For i := 1 to length(VS_NomeArq) do
      if copy(VS_NomeArq,i,1) <> Retirar then
         VS_Retorno:= VS_Retorno+copy(VS_NomeArq,i,1);
   DevolverSem:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta funcao tem a finalidade de extrair um periodo entre duas datas
//------------------------------------------------------------------------------

Function Funcao.Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
Var
   VS_Comando: String;
   Status: Boolean;
begin
   Status:= False;
   if Trim(VS_Usuario) = '' then
      MessageDlg('O nome do usuário não pode ser branco...',mtError, [mbOk],0)
   else
   begin
      if Trim(VS_Senha) = '' then
         MessageDlg('A senha do usuário não pode ser branco...',mtError, [mbOk],0)
      else
      begin
         VS_Comando:= 'Select * from Usuariobdc where nome = '+#39+VS_Usuario+#39+' and senha = '+#39+VS_Senha+#39;

         DM.IBQuery_Usuario.Close;
         DM.IBQuery_Usuario.Sql.Clear;
         DM.IBQuery_Usuario.Sql.Add(VS_Comando);
         DM.IBQuery_Usuario.Open;

         if DM.IBQuery_Usuario.RecordCount = 0 then
             MessageDlg('Usuário não foi Cadastrado...',mtError, [mbOk],0)
         else
         begin
            Status:= True;
         end;
      end;
   end;

   Busca_Usuario:= Status;
end;


//------------------------------------------------------------------------------
// Retorna Usuario
//------------------------------------------------------------------------------

Function Funcao.GetUsuario: String;
begin
   GetUsuario:= VS_Usuario;
end;

//------------------------------------------------------------------------------
// Retorna Privilegio
//------------------------------------------------------------------------------

Function Funcao.GetPrivilegio: String;
begin
   GetPrivilegio:= VS_Privilegio;
end;

//------------------------------------------------------------------------------
// Retorna Id Usuario
//------------------------------------------------------------------------------

Function Funcao.GetUsuarioServidor: String;
begin
   GetUsuarioServidor:= VS_UsuarioServidor;
end;

//------------------------------------------------------------------------------
// Retorna Id Usuario
//------------------------------------------------------------------------------

Function Funcao.GetIdUsuario: String;
begin
   GetIdUsuario:= VS_IdUsuario;
end;


//------------------------------------------------------------------------------
// Recebe o nome do Usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetUsuario(VS_SetUsuario: String);
begin
   VS_Usuario:= VS_SetUsuario;
End;

//------------------------------------------------------------------------------
// Recebe o privilegio do usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetPrivilegio (VS_Set_Privelegio: String);
begin
   VS_Privilegio:= VS_Set_Privelegio
End;

//------------------------------------------------------------------------------
// Recebe o numero de identificacao do usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetIdUsuario (VS_Set_IdUsuario: String);
begin
   VS_IdUsuario:= VS_Set_IdUsuario
End;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar quando a transacao for abortada
//            Ensino
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.abortaTransacao_Ensino;
begin
   if not DM.IBTransaction_Ensino.Active then
       DM.IBTransaction_Ensino.Active := True;
   DM.IBTransaction_Paels.RollbackRetaining;
end;


//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao Ensino
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaTransacao_Ensino;
begin
   if not DM.IBTransaction_Ensino.Active then
       DM.IBTransaction_Ensino.Active := True;

   DM.IBTransaction_Ensino.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da parada da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.abortaTransacao_Prosima;
begin
   if not DM.IBTransaction_Paels.Active then
       DM.IBTransaction_Paels.Active := True;
   DM.IBTransaction_Paels.RollbackRetaining;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaTransacao_Prosima;
begin
   if not DM.IBTransaction_Paels.Active then
       DM.IBTransaction_Paels.Active := True;

   DM.IBTransaction_Paels.CommitRetaining;
end;

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
   VB_Atualiza: Boolean;
begin
   if Query_Atualiza.Recordcount > 0 then
   begin
      bmLocal:= Query_Atualiza.GetBookMark;
      VB_Atualiza:= True;
   end
   else
   begin
      VB_Atualiza:= False;
   end;

   Query_Atualiza.Close;
   Query_Atualiza.open;
   if VB_Atualiza = True then
   begin
      Query_Atualiza.GotoBookMark(bmLocal);
      Query_Atualiza.FreeBookMark(bmLocal);
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
   Query_Executa.Close;
   Query_Executa.SQL.Clear;
   Query_Executa.SQL.Add(PS_Comando);
   Query_Executa.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar a query
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecSqlProsima(PS_Comando: String);
begin
   DM.IBQuery_ExecutaProsima.Close;
   DM.IBQuery_ExecutaProsima.SQL.Clear;
   DM.IBQuery_ExecutaProsima.SQL.Add(PS_Comando);
   DM.IBQuery_ExecutaProsima.ExecSQL;
   ExecutaTransacao_Prosima;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de retornar o valor antes da variavel
//            fornecida na variavel VS_DE
// Data     : 26/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   VI_Cont:= 1;
   While VI_Cont <= Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) <> VS_De then
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1)
      else
          VI_Cont:= VI_Cont+Length(VS_Valor);
      VI_Cont:= VI_Cont + 1;
   end;
   ExtraiAntesDe:= trim(VS_Retorno);
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar o Sql na query selecionada
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.OpenQueryEnsino(IBQuery_ExecutaEnsino: TIBQuery; PS_Comando: String);
begin
   IBQuery_ExecutaEnsino.Close;
   IBQuery_ExecutaEnsino.SQL.Clear;
   IBQuery_ExecutaEnsino.SQL.Add(PS_Comando);
   IBQuery_ExecutaEnsino.Open;
end;


//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar o Sql na query Prosima
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.OpenQueryProsima(IBQuery_OpenProsima: TIBQuery; PS_Comando: String);
begin
   IBQuery_OpenProsima.Close;
   IBQuery_OpenProsima.SQL.Clear;
   IBQuery_OpenProsima.SQL.Add(PS_Comando);
   IBQuery_OpenProsima.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Coloca a string a esquerda e completa com espacos
// Data     : 25/06/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.LeftStr(VS_Variavel: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= Trim(VS_Variavel);
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Retorno+' ';
     VI_tam:= Length(VS_Retorno);
  end;
  LeftStr:= VS_Retorno;
end;


//------------------------------------------------------------------------------
// Descricao: Centraliza uma string até atingir o tamanho especificado
// Data     : 02/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.CentraStr(VS_Variavel: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Posicao, VI_Tam: Integer;
begin
  VI_Posicao:= 1;
  VS_Retorno:= Trim(VS_Variavel);
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     if VI_Posicao = 0 then
     begin
        VI_Posicao:= 1;
        VS_Retorno := ' '+VS_Retorno;
     end
     else
     begin
        VI_Posicao:= 0;
        VS_Retorno := VS_Retorno+' ';
     end;
     VI_tam:= Length(VS_Retorno);
  end;
  CentraStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Pega a Resolucao Atual do Video
// Data     : 18/03/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.SetVideoAnterior;
begin
   wlargura:= screen.Width;
   waltura:= screen.height;
end;

//------------------------------------------------------------------------------
// Descricao: retorna a Resolucao Anterior do Video
// Data     : 18/03/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure  Funcao.RetornaVideo;
begin
    alteravideo(wlargura,waltura); //VOLTA RESOLUÇÃO ANTERIOR
end;


//------------------------------------------------------------------------------
// Descricao: Tratamento para Alterar a Resolução do Video
// Data     : 18/03/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.AlteraVideo(largura : Integer; altura : Integer) : boolean;
var
   ModoVideo : TDeviceMode;
begin
   if ((wlargura = largura) and (waltura = altura)) then
   begin
      // Não faz nada
   end
   else
   begin
      EnumDisplaySettings( nil, 0, ModoVideo );
      ModoVideo.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
      ModoVideo.dmPelsWidth := largura;
      ModoVideo.dmPelsHeight := altura;
      Result := ChangeDisplaySettings( ModoVideo, CDS_UPDATEREGISTRY ) =
      DISP_CHANGE_SUCCESSFUL;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de retornar o ano atual
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

function Funcao.AnoAtual: String;
var
   Ano, Mes, Dia : word;
begin
  DecodeDate (Date, Ano, Mes, Dia);
  Result:= IntToStr(Ano);
end;

//------------------------------------------------------------------------------
// Montagem da Turma
//------------------------------------------------------------------------------

Procedure Funcao.MontaTurma(PS_IdCurso, PS_IdTurma: String);
var
   VS_Status, VS_Comando: String;
begin
   if PS_IdTurma = '' then
      PS_idTurma:= '-2';

   VS_Comando:= ' Select IdCurso, IdTurma, Turma, CodCurso, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao  '+
                ' From turmas_Todas_View '+
                ' Where IdCurso = '+PS_IdCurso+
                ' and IdTurma = '+PS_IdTurma;

   if PS_IdTurma = '-1' Then
      VS_Comando:= VS_Comando+' and IdTurma <> 0';

   Funcoes.ExecutaQuery(DM.IBQuery_MontaTurma, VS_Comando);
   VS_Status:= DM.IBQuery_MontaTurma.FieldByNAme('Status').AsString;
end;

//------------------------------------------------------------------------------
//--- Tratamento para definir o Setor
//------------------------------------------------------------------------------

Procedure Funcao.TrataSetor(Turma: String; DBComboBox_Setor: TDBComboBox);
begin
   DBComboBox_Setor.Items.Clear;

   if (copy(Turma,5,3) = 'TWR' ) then
   begin
      DBComboBox_Setor.Items.Add('TORRE');
      DBComboBox_Setor.Items.Add('TORRE 1');
      DBComboBox_Setor.Items.Add('TORRE 2');
      DBComboBox_Setor.Items.Add('SOLO');
      DBComboBox_Setor.Items.Add('SOLO 1');
      DBComboBox_Setor.Items.Add('SOLO 2');
      DBComboBox_Setor.Items.Add('CLEARANCE');
      DBComboBox_Setor.Items.Add('SUPERVISOR');
      DBComboBox_Setor.Items.Add('ASSISTENTE');
      DBComboBox_Setor.Items.Add('AMBIENTAÇÃ');
      DBComboBox_Setor.Items.Add('COORDENADO');
   end
   else
   begin
      DBComboBox_Setor.Items.Add('CONTROLE');
      DBComboBox_Setor.Items.Add('ASSISTENTE');
      DBComboBox_Setor.Items.Add('SUPERVISOR');
      DBComboBox_Setor.Items.Add('ASSISTENTE');
      DBComboBox_Setor.Items.Add('COORDENADO');
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento para definir o Setor
//------------------------------------------------------------------------------

Procedure Funcao.TrataPesquisaSetor(Turma: String; ComboBox_Setor: TComboBox);
begin
//   ComboBox_Setor.Items.Clear;

   if (copy(Turma,5,3) = 'TWR' ) then
   begin
      ComboBox_Setor.Items.Add('TORRE');
      ComboBox_Setor.Items.Add('TORRE 1');
      ComboBox_Setor.Items.Add('TORRE 2');
      ComboBox_Setor.Items.Add('SOLO');
      ComboBox_Setor.Items.Add('SOLO 1');
      ComboBox_Setor.Items.Add('SOLO 2');
      ComboBox_Setor.Items.Add('CLEARANCE');
      ComboBox_Setor.Items.Add('SUPERVISOR');
      ComboBox_Setor.Items.Add('ASSISTENTE');
      ComboBox_Setor.Items.Add('AMBIENTAÇÃO');
   end
   else
   begin
      ComboBox_Setor.Items.Add('CONTROLE');
      ComboBox_Setor.Items.Add('ASSISTENTE');
      ComboBox_Setor.Items.Add('SUPERVISOR');
   end;
end;


//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de retornar o valor tratado do numero
//            fdo Exercicio
// Data     : 26/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarExercicio(VS_Exercicio: String): String;
var
   VS_Traco, VS_Retorno1, VS_Retorno2 : String;
   VI_Cont: Integer;
begin
   VS_Traco:= '';
   VS_Retorno1:= '';
   VS_Retorno2:= '';
   VI_Cont:= 1;
   While VI_Cont <= Length(VS_Exercicio) do
   begin
      if Copy(VS_Exercicio,VI_Cont,1) = '-' then
         VS_Traco:= '-'
      else
      begin
         if VS_Traco = '' then
             VS_Retorno1:= VS_Retorno1+Copy(VS_Exercicio,VI_Cont,1)
         else
            if copy(VS_Retorno2,1,1) <> '0' then
                VS_Retorno2:= '00'+Copy(VS_Exercicio,VI_Cont,1)
            else
                VS_Retorno2:= VS_Retorno2+Copy(VS_Exercicio,VI_Cont,1);
      end;
      VI_Cont:= VI_Cont + 1;
   end;
   TratarExercicio:= trim(VS_Retorno1+VS_Retorno2);
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento validar o campo com somente numero
// Data     : 26/01/17
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.TratarCaracterExercicio(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', '-', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

Begin
  Funcoes:= Funcao.Create;
end.

