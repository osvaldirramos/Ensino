//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas_TratarDatas                            //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             de tratamento de Datas.                        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 26/02/2015                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas_TrataData;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Module, IBQuery;

   type
   Funcao = Class
      Private

      Public
         Function DiasNoMes(AYear, AMonth: Integer): Integer;
         Function DiadaSemana(Data : String) : string;
         Function FormatarData(Data, FormatoAno:String): string;
         Function HoraAtual: String;
         Function Mes_Extenso(VS_Mes: STRING; VI_Tipo: Integer) : String;
         Function AnoAtual: String;
         Function MesAtual: String;
         Function TratarData(VS_Data: String) : string;
         Function CalculaDiasUteis(wDataInicio : TDate; wDataFim: TDate): Integer;
   end;

var
   Funcoes_TrataData: Funcao;

implementation
       
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
// Descricao: Esta funcao tem a finalidade de retornar o mes atual
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

function Funcao.MesAtual: String;
var
   Ano, Mes, Dia : word;
begin
  DecodeDate (Date, Ano, Mes, Dia);
  Result:= IntToStr(Mes);
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
// Descricao: PFuncao para Calcular os Dias Uteis
// Data     : 26/02/2015
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.CalculaDiasUteis(wDataInicio : TDate; wDataFim: TDate): Integer;
var
   VS_Comando: String;
var
  wQtde : Integer;
begin
   wQtde:= 0;
   while wDataInicio <= wDataFim do
   begin
      if ((DayOfWeek(wDataInicio) <> 1) and (DayOfWeek(wDataInicio) <> 7)) then
      begin
         // VERIFICA SE NAO É FERIADO
         VS_Comando:= 'Select Data From Cad_Feriados where Data = '+#39+FormatDateTime('DD.MM.YYYY',wDataInicio)+' 00:00'+#39;
         DM.IBQuery_Executa.Close;
         DM.IBQuery_Executa.SQL.Clear;
         DM.IBQuery_Executa.SQL.Add(VS_Comando);
         DM.IBQuery_Executa.Open;
         if Trim(DM.IBQuery_Executa.FieldByName('data').AsString) = '' then
            wQtde := wQtde + 1;
      end;
      wDataInicio := wDataInicio + 1;
   end;
   Result := wQtde;
end;

//------------------------------------------------------------------------------
// Descricao: Modulo que transforma o Mes de Numero para Extenso.
// Data     : 26/02/2015
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

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
// Descricao: Esta função tem a fornecer a hora atual tratada
// Data     :
//
// Atualizado em:
// Descricao    :
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
// Descricao: Funcao para retornar o dia da semana
// Data     : 06/08/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DiadaSemana(Data : String) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sábado');
begin
  Result := semana[DayOfWeek(strtodate(Data))]
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
   if AMonth = 2 then
   begin
      if Ayear mod 4 = 0 then
      begin
         VI_Retorno:= 29;
      end;
   end;
   Result := VI_Retorno
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Funcoes_TrataData:= Funcao.Create;
end.

