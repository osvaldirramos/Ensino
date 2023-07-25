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

unit Rotinas_Validar;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs, Rotinas_TrataData,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, IBQuery, ToolWin, ShellApi, Variants, Module;

const
   NULL     = '';

   type
   Validacao = Class
      Private

      Public
         Procedure ValidarSARAM(DBEdit_Saram: TDBEdit);
         Function ValidarData(VS_Data: String): Boolean;
         Function TratarConferido(PostoGraduacao, Sexo: String): String;
         Function TratarPeriodo(DataInicio, DataTermino: String): String;
   end;

var
   Validar: Validacao;
   VS_Auxilio: String;

implementation

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
      if Sexo = 'M' then
         VS_TratarSexo:= 'Conferido ao';

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
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Validar:= Validacao.Create;
end.

