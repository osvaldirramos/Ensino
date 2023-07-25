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
  Buttons, ExtCtrls, IBQuery, Module;

const
  NULL     = '';
  ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Ultima_Atualizacao= '21/03/2017';
  Versao= '1.45';

type
   Funcao = Class
      Private
         VS_IdCurso, VS_IdUsuario, VS_Privilegio, VS_Usuario: String;
         VS_UsuarioServidor: String;
         VS_RelDesempenho: String;
         VS_Starte: String;
         wlargura , waltura: integer;
      Public

        Function AlteraVideo(largura : Integer; altura : Integer) : boolean;
        Procedure SetVideoAnterior;
        Procedure RetornaVideo;

        Procedure SetIdCurso(PS_IdCurso: String);
        Function GetIdCurso: String;

        Procedure SetStarte(PS_Starte: String);
        Function GetStarte: String;

        Procedure SetRelDesempenho(PS_RelDesempenho: String);
        Function GetRelDesempenho: String;

        Procedure ExecutaTransacao_Prosima;
        Procedure abortaTransacao_Prosima;

        Function AnoAtual: String;
        Function InserirPos(VS_Valor: String; VI_Total: Integer): String;
        Function Valida (VS_Valor: String; VI_Tam: integer): string;
        Function criptografar (Armazena: String): string;
        Function descriptograr (Armazena: String): string;
        Function Extrai_Numeros(VS_PS: String): string;
        Function Extrai_Caracter(VS_PS: String): string;
        Function ValidaHora(VS_Hora: String): string;
        Function Randomico(VI_Limite: integer): String;
        Function AjustaHora(VS_Hora: String): String;
        Function VirgulaToPonto(VS_Valor: String): String;
        Function Localiza(BuscaArquivo:TQuery; VS_NomeArq: String; Tabela: String ): Boolean;
        Function ExtraiExtensao(VS_NomeArq: String): String;
        Function DevolverSem(VS_NomeArq: String; Retirar: String): String;
        Function MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
        Function Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
        Function DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
        Function ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
        Function CentraStr(VS_Variavel: string; Len: integer): string;
        Function LeftStr(VS_Variavel: string; Len: integer): string;

        Function GetUsuario: String;
        Function GetUsuarioServidor: String;
        Function GetPrivilegio: String;
        Function GetIdUsuario: String;
        Function RetornaCidade(Data: String): String;
        Function Mes_Extenso(VS_Mes: STRING; VI_Tipo: Integer) : String;

        Procedure AtualizaQuery(Query_Atualiza: TIBQuery);

        Procedure SetUsuario (VS_SetUsuario: String);
        Procedure SetPrivilegio (VS_Set_Privelegio: String);
        Procedure SetIdUsuario (VS_Set_IdUsuario: String);

        Procedure OpenQueryProsima(Query_Executa: TIBQuery; PS_Comando: String);
        Procedure ExecSqlProsima(PS_Comando: String);
        Procedure OpenQueryExecutaProsima(VS_Comando: String);

        Procedure OpenQuery(Query_Executa: TIBQuery; PS_Comando: String);
        Procedure OpenQueryExecuta(VS_Comando: String);
        Procedure ExecSql(PS_Comando: String);
        Procedure ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
        procedure Windows;
   end;

var
   Funcoes: Funcao ;

implementation


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
// Retorna o tipo do Relaorio de Desempenho
//------------------------------------------------------------------------------

Procedure Funcao.SetRelDesempenho(PS_RelDesempenho: String);
begin
  VS_RelDesempenho:= PS_RelDesempenho;
end;

//------------------------------------------------------------------------------
// Retorna o tipo do Relaorio de Desempenho
//------------------------------------------------------------------------------

Function Funcao.GetRelDesempenho: String;
begin
  GetRelDesempenho:= VS_RelDesempenho;
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
      for CodIndex := 1 to 2 do
      begin
         Temp:= Succ(Armazena[cont]);         Armazena[cont]:= Temp;
      end;
      Resultado:= Resultado + Temp;
   end;
   criptografar:= Resultado;
End;

//------------------------------------------------------------------------------
// Faz a descriptograr de uma variavel fornecida
//------------------------------------------------------------------------------

Function Funcao.descriptograr (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      for CodIndex := 1 to 2 do
      begin
         Temp:= Pred(Armazena[cont]);
         Armazena[cont]:= Temp;
      end;
      Resultado:= Resultado + Temp;
   end;
   descriptograr:= Resultado;
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
   VS_Retorno: string;

   VI_Tam: integer;
begin
   VS_Retorno:= '';
   VI_Tam:= 1;

   While (VI_Tam <= Length(VS_PS)) do
   begin
      if ((Copy(VS_PS,VI_Tam,1) <> '0') and (Copy(VS_PS,VI_Tam,1) <> '1') and
          (Copy(VS_PS,VI_Tam,1) <> '2') and (Copy(VS_PS,VI_Tam,1) <> '3') and
          (Copy(VS_PS,VI_Tam,1) <> '4') and (Copy(VS_PS,VI_Tam,1) <> '5') and
          (Copy(VS_PS,VI_Tam,1) <> '6') and (Copy(VS_PS,VI_Tam,1) <> '7') and
          (Copy(VS_PS,VI_Tam,1) <> '8') and (Copy(VS_PS,VI_Tam,1) <> '9')) then
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
// Verifica se o arquivo DBF ja foi gravado
//------------------------------------------------------------------------------

Function Funcao.Localiza(BuscaArquivo:TQuery; VS_NomeArq: String; Tabela: String ): Boolean;
var
   VS_Comando: String;
   VB_Retorno: Boolean;
Begin
   VS_Comando:= 'Select * from BDC_ARQUIVOSTRANSFERIDOS where Tabela = '+Tabela+' and nomearquivo = '+#39+VS_NomeArq+#39;
   BuscaArquivo.Close;
   BuscaArquivo.Sql.clear;
   BuscaArquivo.sql.Add(VS_comando);
   BuscaArquivo.Open;

   if BuscaArquivo.RecordCount > 0 then
      VB_Retorno:= True
   else
      VB_Retorno:= False;
   Localiza:= VB_Retorno;
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
// Retorna o maior valor
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select Max('+VS_Campo+') Maior from '+VS_Tabela;
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;

   MaiorCodigo:= DM.Query_Executa.FieldByName('Maior').AsInteger+1;
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

         DM.Query_Usuario.Close;
         DM.Query_Usuario.Sql.Clear;
         DM.Query_Usuario.Sql.Add(VS_Comando);
         DM.Query_Usuario.Open;


         if DM.Query_Usuario.RecordCount = 0 then
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
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaTransacao_Prosima;
begin
   if not DM.IBTransaction_Prosima.Active then
       DM.IBTransaction_Prosima.Active := True;

   DM.IBTransaction_Prosima.CommitRetaining;
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
   if not DM.IBTransaction_Prosima.Active then
       DM.IBTransaction_Prosima.Active := True;
   DM.IBTransaction_Prosima.RollbackRetaining;
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

Procedure Funcao.ExecSql(PS_Comando: String);
begin
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(PS_Comando);
   DM.Query_Executa.ExecSQL;
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
// Descricao: OpenQueryExecuta
//
// Atualizado em: 25/01/2006
//------------------------------------------------------------------------------

Procedure Funcao.OpenQueryExecuta(VS_Comando: String);
begin
   DM.IBQuery_Executa_ensino.Close;
   DM.IBQuery_Executa_ensino.Sql.Clear;
   DM.IBQuery_Executa_ensino.Sql.Add(VS_Comando);
   DM.IBQuery_Executa_ensino.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar o Sql na query selecionada
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.OpenQuery(Query_Executa: TIBQuery; PS_Comando: String);
begin
   Query_Executa.Close;
   Query_Executa.SQL.Clear;
   Query_Executa.SQL.Add(PS_Comando);
   Query_Executa.Open;
end;


//------------------------------------------------------------------------------
// Descricao: Retorna a Cidade e a Data atual
//
// Data     : 15/12/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.RetornaCidade(Data: String): String;
var
   Ano, Mes, Dia : word;
   Retorno: String;
begin
   DecodeDate (StrToDate(Data), Ano, Mes, Dia);
   Result:= IntToStr(Ano);

   Retorno:= Trim(dm.IBTable_Configuracao.FieldByName('Cidade').AsString)+', '+IntToStr(Dia)+' de '+Mes_Extenso(IntToStr(Mes),1)+' de '+IntToStr(Ano)+'.';
   RetornaCidade:= Retorno;
end;

//-----------------------------------------------------------------------
// Modulo que transforma o Mes de Numero para Extenso.
//-----------------------------------------------------------------------

Function Funcao.Mes_Extenso(VS_Mes: String; VI_Tipo: Integer) : String;
var
   VS_Mes_Extenso: String;
Begin
   VS_Mes_Extenso:= '';
   if (VI_Tipo = 1 ) then
     case StrToInt(VS_Mes) of
        1: VS_Mes_Extenso:= 'Janeiro';
        2: VS_Mes_Extenso:= 'Fevereiro';
        3: VS_Mes_Extenso:= 'Março';
        4: VS_Mes_Extenso:= 'Abril';
        5: VS_Mes_Extenso:= 'Maio';
        6: VS_Mes_Extenso:= 'Junho';
        7: VS_Mes_Extenso:= 'Julho';
        8: VS_Mes_Extenso:= 'Agosto';
        9: VS_Mes_Extenso:= 'Setembro';
        10: VS_Mes_Extenso:= 'Outubro';
        11: VS_Mes_Extenso:= 'Novembro';
        12: VS_Mes_Extenso:= 'Dezembro';
     end
   else
     case StrToInt(VS_Mes) of
        1: VS_Mes_Extenso:= 'Jan';
        2: VS_Mes_Extenso:= 'Fev';
        3: VS_Mes_Extenso:= 'Mar';
        4: VS_Mes_Extenso:= 'Abr';
        5: VS_Mes_Extenso:= 'Mai';
        6: VS_Mes_Extenso:= 'Jun';
        7: VS_Mes_Extenso:= 'Jul';
        8: VS_Mes_Extenso:= 'Ago';
        9: VS_Mes_Extenso:= 'Set';
        10: VS_Mes_Extenso:= 'Out';
        11: VS_Mes_Extenso:= 'Nov';
        12: VS_Mes_Extenso:= 'Dez';
     end;
   Mes_Extenso:= VS_Mes_Extenso;
End;


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
// Descricao: Esta funcao tem a finalidade de executar o Sql na query Prosima
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.OpenQueryProsima(Query_Executa: TIBQuery; PS_Comando: String);
begin
   Query_Executa.Close;
   Query_Executa.SQL.Clear;
   Query_Executa.SQL.Add(PS_Comando);
   Query_Executa.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar a query Prosima
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
// Descricao: OpenQueryExecuta
//
// Atualizado em: 25/01/2006
//------------------------------------------------------------------------------

Procedure Funcao.OpenQueryExecutaProsima(VS_Comando: String);
begin
   DM.IBQuery_Prosima_Ensino.Close;
   DM.IBQuery_Prosima_Ensino.Sql.Clear;
   DM.IBQuery_Prosima_Ensino.Sql.Add(VS_Comando);
   DM.IBQuery_Prosima_Ensino.Open;
end;

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

Begin
  Funcoes:= Funcao.Create;
end.

