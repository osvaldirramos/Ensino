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
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Module, IBQuery, ToolWin, ShellApi, Variants;

const
   NULL     = '';
   Ultima_Atualizacao= '05-Setembro-2019';
   Versao= 'Versão: 1.14';

   //--- Status do Item de prova:

   Inserido= 'I';        // Item inserido
   Disponivel= 'D';      // Item Disponivel
   NaoDisponivel= 'D';   // Item não Disponivel
   Revisar= 'R';         // Item a ser revisado
   Excluido= 'E';        // Item Excluido

   type
   Funcao = Class
      Private
         VS_Usuario, VS_Privilegio: String;
         VS_IdTurma, VS_Identidade : String;

         VI_NumItenIdel: integer;
      Public
         Function GerarCodigoInstrutor(VS_IdCurso: String; S_IdTurma: String): String;
         Function TestaParaPar(TestaInteiro : Integer) : boolean;
         Function ValidaCampo(PS_Campo, Msg: String): Boolean;

         Function MontaCurso(PS_Curso: String): Boolean;
         Function TratarData(VS_Data: String) : string;
         Function AjustarMinuscula(VS_Entrada : String) : string;
         Function AjustarMaiscula(VS_Entrada : String) : string;
         Function CentraStr(VS_Variavel: string; Len: integer): string;
         Function LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
         Function ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
         Function DiasNoMes(AYear, AMonth: Integer): Integer;
         Function ValidarData(VS_Data: String): Boolean;
         Function criptografar (Armazena: String): string;
         Function descriptografar (Armazena: String): string;
         Function HoraAtual: String;
         Function AnoAtual: String;
         Function MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
         Function MaiorCodigoComRestricao(VS_Campo: String; VS_Restricao: String; VS_Tabela: String): Integer;
         Function DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
         Function QtdRegistro(VS_Comando: String): Integer;
         Function ContRegistro(VS_Comando: String): Integer;
         Function ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
         Function Randomico(VI_Limite: integer): String;
         Function FormatSecsToHMS(Secs: LongInt): string;
         Function FormatarData(Data, FormatoAno:String): string;
         Function GerarSenha(PI_Tamanho: Integer): String;

         Function Ctrl_Item: Integer;
         Procedure Historico_Item( NumItem, Atividade: String);

         Procedure AtualizaQuery(Query_Atualiza: TIBQuery);

         Procedure CorDBGrid(DBGrid: TDBGrid; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState );
         procedure Windows;
         Procedure ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
         Procedure ExecusaoQuery(VS_Comando: String);
         Procedure ExecutaTransacao;
         Procedure abortaTransacao;

         Function GetNumItenIdel: Integer;
         Procedure SetNumItenIdel(PI_NumItenIdel: Integer);

         Function GetUsuario: String;
         Function GetPrivilegio: String;
         Function GetIdentidade: String;
         Function GetSenha: String;

         Function GetNumItem: String;
         Procedure SetNumItem(PS_NumItem: String);

         Function GetIdCurso: String;
         Procedure SetIdCurso(PS_IdCurso: String);

         Function GetCodUsuario: String;
         Function GetFoto: String;
         Function GetCadCurso: String;
         Function GetIdTurma: String;

         Procedure SetIdTurma(PS_IdTurma: String);
         Procedure SetCadCurso(PI_CadCurso: String);
         Procedure SetSenha(PS_Senha: String);
         Procedure SetCodUsuario (PS_CodUsuario: String);
         Procedure SetUsuario (VS_SetUsuario: String);
         Procedure SetPrivilegio (VS_Set_Privelegio: String);

         Procedure SetFoto(PS_Foto: String);

         Procedure OpenQuery(VS_Comando: String);
         Procedure Grava_Exclusao_Item(VS_Usuario, VS_NumItem: String);
   end;

var
   Funcoes: Funcao;
   VS_NumItem, VS_Foto, VS_Senha, VS_Acesso, VS_CodUsuario, VS_CadCurso: String;
   VS_GravaAPC, VS_IdCurso, VS_IdTurma, VS_ChamaCadInstrutor: String;
   VI_RespAssinatura, VI_Editor: integer;
   VB_Grava, VB_Abertura: Boolean;

implementation

uses  DM_Item;

//------------------------------------------------------------------------------
//
// Tratamento de setagens
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Retorna o Numero do Item
//------------------------------------------------------------------------------

Function Funcao.GetNumItem: String;
begin
   GetNumItem:= VS_NumItem;
end;

//------------------------------------------------------------------------------
// Seta se sera apresentado Preview inicialmente pelo Editor
//------------------------------------------------------------------------------

Procedure Funcao.SetNumItem(PS_NumItem: String);
begin
   VS_NumItem:= PS_NumItem;
end;

//------------------------------------------------------------------------------
// Recebe o Id do Curso
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
// Retorna a Foto selecionada
//------------------------------------------------------------------------------

Function Funcao.GetFoto: String;
begin
   GetFoto:= VS_Foto;
end;

//------------------------------------------------------------------------------
// Recebe a data selecionada
//------------------------------------------------------------------------------

Procedure Funcao.SetFoto(PS_Foto: String);
begin
   VS_Foto:= PS_Foto;
End;

//------------------------------------------------------------------------------
// Recebe a senha
//------------------------------------------------------------------------------

Procedure Funcao.SetSenha(PS_Senha: String);
begin
   VS_Senha:= PS_Senha;
End;

//------------------------------------------------------------------------------
// Retorna a senha
//------------------------------------------------------------------------------

Function Funcao.GetSenha: String;
begin
   GetSenha:= VS_Senha;
End;

//------------------------------------------------------------------------------
// Retorna o Codigo do Usuario
//------------------------------------------------------------------------------

Function Funcao.GetCodUsuario: String;
begin
   GetCodUsuario:= VS_CodUsuario;
end;

//------------------------------------------------------------------------------
// Recebe o Codigo do Usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetCodUsuario (PS_CodUsuario: String);
begin
   VS_CodUsuario:= PS_CodUsuario;
End;

//------------------------------------------------------------------------------
// Recebe o identificador de desligamento
//------------------------------------------------------------------------------

Procedure Funcao.SetIdTurma(PS_IdTurma: String);
begin
   VS_IdTurma:= PS_IdTurma;
End;

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
// Seta inicializacao do numero ideal de itens
//------------------------------------------------------------------------------

Procedure Funcao.SetNumItenIdel(PI_NumItenIdel: Integer);
begin
   VI_NumItenIdel:= PI_NumItenIdel;
end;


//------------------------------------------------------------------------------
// Retorna o numero idel de itens
//------------------------------------------------------------------------------

Function Funcao.GetNumItenIdel: Integer;
begin
   GetNumItenIdel:= VI_NumItenIdel;
end;

//-----------------------------------------------------------------------------
//
// Tratamento de retornos
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Retorna Desligamento
//------------------------------------------------------------------------------

Function Funcao.GetIdTurma: String;
begin
   GetIdTurma:= VS_IdTurma;
end;

//------------------------------------------------------------------------------
// Retorna Identidade da pessoa
//------------------------------------------------------------------------------

Function Funcao.GetIdentidade: String;
begin
   GetIdentidade:= VS_Identidade;
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
//
// Funcoes basicas
//
//------------------------------------------------------------------------------

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
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

Function Funcao.descriptografar (Armazena: String): string;
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
            Temp:= Pred(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   descriptografar:= Resultado;
End;


//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure Funcao.Windows;
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Deseja sair do sistema ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
      Application.Terminate;
end;

//------------------------------------------------------------------------------
// Esta função tem a fornecer a hora atual tratada
//------------------------------------------------------------------------------

Function Funcao.HoraAtual: String;
var
   VS_Time, VS_Retorno: string;

   VI_Cont,VI_Tam: integer;
begin
   VS_Time:= TimeToStr(Time);

   VI_Cont:= 0;
   for VI_Tam:= 1 to length(VS_Time) do
   begin
      if copy(VS_Time,VI_Tam,1) = ':' then
          VI_Cont:= VI_Cont + 1
      else
         if VI_Cont < 2 then
            VS_Retorno:= VS_Retorno+copy(VS_Time,VI_Tam,1);
   end;
   if length(VS_Retorno) = 3 then
      VS_Retorno:= '0'+VS_Retorno;

   HoraAtual:= VS_Retorno;
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
// Descricao: Tem a funcao de gerar numeros aleatorio
// Data     :
//
// Atualizado em: 19/09/2005
// Descricao    : Criacao da rotina
//------------------------------------------------------------------------------

Function Funcao.Randomico(VI_Limite: integer): String;
var
   Resultado: integer;
begin
   Resultado:= 0;

   While Resultado = 0 do
      Resultado:= Random(999);

   Randomico:= formatfloat('000',Resultado);
end;

//------------------------------------------------------------------------------
// Descricao: Funcao que recebe segundo e devolve Hora em (hh:mm;ss)
// Data     : 05/04/2006
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

function Funcao.FormatSecsToHMS(Secs: LongInt): string;
var
   Hrs, Min: Word;
begin
   Hrs := Secs div 3600;
   Secs := Secs mod 3600;
   Min := Secs div 60;
   Secs := Secs mod 60;
   Result := FormatFloat('00', Hrs)+':'+FormatFloat('00', Min)+':'+FormatFloat('00', Secs);
end;

//------------------------------------------------------------------------------
// Descricao: Formatando a data do sistema acrescentando Zeros no dia  no mes e
//            colocando o ano com 4 digitos
//
// Atualizado em: 11/09/06
//------------------------------------------------------------------------------

Function Funcao.FormatarData(Data, FormatoAno:String): string;
var
   Ano, Mes, Dia : word;
   Retorno: String;
begin
   DecodeDate (StrToDate(Data), Ano, Mes, Dia);
   Retorno:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+FormatDateTime(FormatoAno, StrToDate(Data));
   FormatarData:= Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Valida a data analisando se elea esta OK
// Data     : 30/04/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ValidarData(VS_Data: String): Boolean;
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
// Descricao: Funcao para Retorna quantos dias tem um referido mes do ano
// Data     : 10/03/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DiasNoMes(AYear, AMonth: Integer): Integer;
const
   DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
Var
   VI_Retorno: Integer;
begin
   VI_Retorno:= DaysInMonth[AMonth];
   if ((AMonth = 2) and (Ayear mod 4 = 0)) then
      VI_Retorno:= 29;

   Result := VI_Retorno
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string até atingir o tamanho especificado
// Data     : 01/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Retorno + VS_Repl;
     VI_Tam:= VI_Tam + 1;
  end;
  ReplStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string a esquerda até atingir o tamanho especificado
// Data     : 23/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Repl+VS_Retorno;
     VI_Tam:= VI_Tam + 1;
  end;
  LReplStr:= VS_Retorno;
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
   VI_Tam: Integer;
begin
  VS_Retorno:= Trim(VS_Variavel);
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len-1 do
  begin
     VS_Retorno := ' '+VS_Retorno+' ';
     VI_tam:= Length(VS_Retorno);
  end;
  CentraStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para retornar data tratada para Firebird
// Data     : 26/04/2010
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarData(VS_Data: String) : string;
var
  d,m,y : word;
begin
   DecodeDate(StrToDate(VS_Data),y,m,d);

   VS_Data:= FormatFloat('00', d)+'.'+FormatFloat('00', m)+'.'+FormatFloat('0000', y);
   TratarData:= VS_Data+' 00:00';
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para ajustar os caracteres acentuados para maiscula
// Data     : 16/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.AjustarMaiscula(VS_Entrada : String) : string;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;

begin
   VI_tam:= Length(VS_Entrada);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(VS_Entrada,i,1);
      if VS_letra = 'á' then
         VS_letra:= 'Á'
      else
         if VS_letra = 'à' then
            VS_letra:= 'À'
         else
           if VS_letra = 'ã' then
              VS_letra:= 'Ã'
           else
              if VS_letra = 'â' then
                  VS_letra:= 'Â'
              else
      if VS_letra = 'é' then
         VS_letra:= 'É'
      else
         if VS_letra = 'è' then
            VS_letra:= 'È'
         else
            if VS_letra = 'ê' then
               VS_letra:= 'Ê'
            else
      if VS_letra = 'í' then
         VS_letra:= 'Í'
      else
         if VS_letra = 'ì' then
            VS_letra:= 'Ì'
         else
           if VS_letra = 'î' then
              VS_letra:= 'Î'
           else
      if VS_letra = 'ó' then
         VS_letra:= 'Ó'
      else
         if VS_letra = 'ò' then
            VS_letra:= 'Ò'
         else
           if VS_letra = 'õ' then
              VS_letra:= 'Õ'
           else
              if VS_letra = 'ô' then
                  VS_letra:= 'Ô'
              else
      if VS_letra = 'ú' then
         VS_letra:= 'Ú'
      else
         if VS_letra = 'ù' then
            VS_letra:= 'Ù'
         else
           if VS_letra = 'û' then
              VS_letra:= 'Û'
           else
      if VS_letra = 'ç' then
         VS_letra:= 'Ç';

      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  Result := VS_Retorno;
end;


//------------------------------------------------------------------------------
// Descricao: Funcao para ajustar os caracteres acentuados para maiscula
// Data     : 16/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.AjustarMinuscula(VS_Entrada : String) : string;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;

begin
   VI_tam:= Length(VS_Entrada);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(VS_Entrada,i,1);
      if VS_letra = 'Á' then
         VS_letra:= 'á'
      else
         if VS_letra =  'À' then
            VS_letra:= 'à'
         else
           if VS_letra = 'Ã' then
              VS_letra:= 'ã'
           else
              if VS_letra = 'Â' then
                  VS_letra:= 'â'
              else
      if VS_letra = 'É' then
         VS_letra:= 'é'
      else
         if VS_letra = 'È' then
            VS_letra:= 'è'
         else
            if VS_letra = 'Ê' then
               VS_letra:= 'ê'
            else
      if VS_letra = 'Í' then
         VS_letra:= 'í'
      else
         if VS_letra = 'Ì' then
            VS_letra:= 'ì'
         else
           if VS_letra = 'Î' then
              VS_letra:= 'î'
           else
      if VS_letra = 'Ó' then
         VS_letra:= 'ó'
      else
         if VS_letra = 'Ò' then
            VS_letra:= 'ò'
         else
           if VS_letra = 'Õ' then
              VS_letra:= 'õ'
           else
              if VS_letra = 'Ô' then
                  VS_letra:= 'ô'
              else
      if VS_letra = 'Ú' then
         VS_letra:= 'ú'
      else
         if VS_letra = 'Ù' then
            VS_letra:= 'ù'
         else
           if VS_letra = 'Û' then
              VS_letra:= 'û'
           else
      if VS_letra = 'Ç' then
         VS_letra:= 'ç';

      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  Result := VS_Retorno;
end;

//------------------------------------------------------------------------------
//
// Tratamentos com Query
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Descricao: Substituir o comando RecordCount
// Data     :
//
// Atualizado em: 23/05/2005
// Descricao    : Criando
//------------------------------------------------------------------------------

Function Funcao.QtdRegistro(VS_Comando: String): Integer;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   Result:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de informar quantos registros esta sendo retornado
// Data     :
//
// Atualizado em: 23/05/2005
// Descricao    : Criando
//------------------------------------------------------------------------------

Function Funcao.ContRegistro(VS_Comando: String): Integer;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   ContRegistro:= DM.IBQuery_Executa.FieldByName('Retorno').AsInteger;
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
   VB_Atualiza:= False;
   if Query_Atualiza.Recordcount > 0 then
   begin
      bmLocal:= Query_Atualiza.GetBookMark;
      VB_Atualiza:= True;
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
// Descricao: Retorna o maior valor
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select Max('+VS_Campo+') Maior from '+VS_Tabela;
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   MaiorCodigo:= DM.IBQuery_Executa.FieldByName('Maior').AsInteger+1;
end;

//------------------------------------------------------------------------------
// Descricao: Retorna o maior valor que atende a restricao
// Data     : 18/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigoComRestricao(VS_Campo: String; VS_Restricao: String; VS_Tabela: String): Integer;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select Max('+VS_Campo+') Maior from '+VS_Tabela+' where '+VS_Restricao;
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   MaiorCodigoComRestricao:= DM.IBQuery_Executa.FieldByName('Maior').AsInteger+1;
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
// Descricao: Tem a funcao de Fazer ExecSql na Query
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecusaoQuery(VS_Comando: String);
begin
   DM.IBQuery_ExecSql.Close;
   DM.IBQuery_ExecSql.Sql.Clear;
   DM.IBQuery_ExecSql.Sql.Add(VS_Comando);
   DM.IBQuery_ExecSql.ExecSql;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Descricao: OpenQuery
//
// Atualizado em: 25/01/2006
//------------------------------------------------------------------------------

Procedure Funcao.OpenQuery(VS_Comando: String);
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.Sql.Clear;
   DM.IBQuery_Executa.Sql.Add(VS_Comando);
   DM.IBQuery_Executa.Open;
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

Function Funcao.MontaCurso(PS_Curso: String): Boolean;
var
   VS_Comando: string;
   VB_Retorno: Boolean;
begin
   VB_Retorno:= False;
   if trim(PS_Curso) <> '' then
   begin
      //--- Monta query de selecao de curso

      VS_Comando:= 'Select IdCurso, CodCurso, NomeCurso, Descricao, Grava_APC '+
                   'From Curso '+
                   ' where codcurso = '+#39+PS_Curso+#39;
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);

      if Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> '' then
      begin
         SetIdCurso(DM.IBQuery_Executa.FieldByName('IdCurso').AsString);
         VB_Retorno:= True;
     end
     else
     begin
        Showmessage('O Curso '+PS_Curso+' não esta Cadastrado...'+#13+#13+' Para cadastrar o Curso '+PS_Curso+', selecione o Botão < Cadastrar Curso >');         end;
   end;
    MontaCurso:= VB_retorno;
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

Function Funcao.ValidaCampo(PS_Campo, Msg: String): Boolean;
var
   Retorno: Boolean;
begin
   Retorno:= True;

   if trim(PS_Campo) = '' then
   begin
      ShowMessage('O Campo '+Msg+' não pode ser branco...');
      Retorno:= False;
   end;
   ValidaCampo:= Retorno
end;

//------------------------------------------------------------------------------
// Funcao para Gerar Senha
//------------------------------------------------------------------------------

Function Funcao.GerarSenha(PI_Tamanho: Integer): String;
var
   i:integer;
   VS_retorno: String;
const
   str='1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
    VS_retorno:='';
    for i:=1 to PI_Tamanho do
        VS_retorno:=VS_retorno+str[random(length(str))+1];
    GerarSenha:= VS_retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de retornar se o numero e PAR.
// Data     : 29/04/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TestaParaPar(TestaInteiro : Integer) : boolean;
begin
  if (TestaInteiro div 2) = (TestaInteiro/2) then
     result := True
  else
     result := False;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Gerar Codigo de Acesso ao Instrutor de
//            acordo com a Turma.
// Data     : 29/04/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.GerarCodigoInstrutor(VS_IdCurso: String; S_IdTurma: String): String;
var
   VS_Comando, VS_CodInstrutor: String;
   VI_CodExiste: integer;
begin
   //------------- Chama função para gerar codigo do Instrutor  --------------//
   VI_CodExiste:=0;

   while VI_CodExiste = 0  do
   begin
      VS_CodInstrutor:=Funcoes.Randomico (999);
      VS_Comando:= 'Select count(1) Qtd '+
                   'from InstrutorTurma '+
                   'where IdCurso = '+VS_IdCurso+
                   ' and IdTurma = '+S_IdTurma+
                   ' and CodigoInstrutor = '+VS_CodInstrutor;
      if Funcoes.QtdRegistro(VS_Comando) = 0 then
         VI_CodExiste:= 1;

   end;
   GerarCodigoInstrutor:= VS_CodInstrutor;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Cor da DBGrid.
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.CorDBGrid(DBGrid: TDBGrid; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState );
begin
  DBGrid.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
  begin
     DBGrid.Canvas.Brush.Color := $006A2602;
     DBGrid.Canvas.Font.Color:= clWhite;
  end
  else
     DBGrid.Canvas.Font.Color:= clBlack;


   DBGrid.Canvas.FillRect(Rect);
   DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar o Usuario que realizou alguma
//            tarefa no Item de Prova (Inserir, Alterar, Excluir, Consultar)
// Data     : 28/06/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Historico_Item( NumItem, Atividade: String);
var
   VS_Id, VS_Data, VS_Comando: String;
begin
   VS_Comando:= 'Select max(id) as Qtd from Item_Historico where NumItem = '+NumItem;
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);

   VS_Data:= TratarData(DateToStr(Date));

   VS_Id:= IntToStr(DM.IBQuery_Executa.FieldByName('Qtd').AsInteger+1);

   VS_Comando:= 'Insert into Item_Historico (NumItem, Id, Atividade, Data, Usuario) '+
                ' Values ('+NumItem+', '+VS_Id+', '+#39+Atividade+#39+', '+#39+VS_Data+#39+', '+#39+VS_Usuario+#39+')';
   Funcoes.ExecusaoQuery(VS_Comando);
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

Procedure Funcao.abortaTransacao;
begin
   if not DM.IBTransaction_Ensino.Active then
       DM.IBTransaction_Ensino.Active := True;
   DM.IBTransaction_Ensino.RollbackRetaining
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar qual usuario exclui o Item
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Grava_Exclusao_Item(VS_Usuario, VS_NumItem: String);
var
   VS_Data: String;
begin
   Funcoes.ExecusaoQuery('Delete from Item_Excluido Where NumItem = '+VS_NumItem);

   VS_Data:= TratarData(DateToStr(Date));
   Funcoes.ExecusaoQuery( 'Insert into Item_Excluido (NumItem, Data, NomeUsuario) '+
                          ' Values ('+VS_NumItem+', '+#39+VS_Data+#39+', '+#39+VS_Usuario+#39+')'
                        );
end;


//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a Funcao de Gravar a identificacao do ultimo item
//            inserido gravando junto o reposnavel e a data.
// Data     : 28/06/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.Ctrl_Item: Integer;
var
   VI_NumItem, VI_NumItem1: Integer;
   VS_Data: String;
begin
   try
      VI_NumItem:= Funcoes.MaiorCodigo('NumItem', 'Item_Ctrl');
      VI_NumItem1:= Funcoes.MaiorCodigo('NumItem', 'Item_Desc');

      if VI_NumItem < VI_NumItem1 then
         VI_NumItem:= VI_NumItem1;

      VS_Data:= TratarData(DateToStr(Date));
      Funcoes.ExecusaoQuery('Insert into Item_Ctrl (NumItem, Data, Usuario) '+
                            ' Values ('+IntToStr(VI_NumItem)+', '+#39+VS_Data+#39+', '+#39+VS_Usuario+#39+')');

      Ctrl_Item:= VI_NumItem;
   except

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

