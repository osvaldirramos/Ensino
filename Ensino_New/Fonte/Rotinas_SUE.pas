//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas_SUE.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns do Ensino.                              //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//           Estagiário      :                                                //
//                                                                            //
// INICIO DA ELABORACAO      : 20/10/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas_SUE;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Module, IBQuery, Rotinas;

const
   NULL     = '';
   ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   Aspas= '''';

   type
   Funcao = Class
      Private

      Public

         Procedure AlimentaCurso(ComboBox: TComboBox);
         Procedure AlimentaComboBox(ComboBox: TComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);
         Procedure AlimentaDBComboBox(ComboBox: TDBComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);

         Function EncontraId( VS_Campo: String; VS_Tabela: String; VS_Condicao: String): String;
   end;

var
   Funcoes_SUE: Funcao;

implementation


//------------------------------------------------------------------------------
// Descricao: Carrega o combobox fornecido
// Data     :
//
// Atualizado em: 29/08/2018
// Descricao    :  Insercão do filtro para os cursos EAD
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaCurso(ComboBox: TComboBox);
begin
//showmessage('i 1');
   if (DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') Then
   begin
      ComboBox.Items.Clear;
      ComboBox.Text:= 'PAELS';
   end
   else
   begin
      if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EOM') Then
         Funcoes_SUE.AlimentaComboBox(ComboBox, 'CodCurso', 'Curso', ' COPM = '+#39+'S'+#39, 'CodCurso')
      else
         if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EAD') Then
            Funcoes_SUE.AlimentaComboBox(ComboBox, 'CodCurso', 'Curso', ' CURSO_EAD = '+#39+'S'+#39, 'CodCurso')
         else
            Funcoes_SUE.AlimentaComboBox(ComboBox, 'CodCurso', 'Curso', '', 'CodCurso');
   end;

   if Funcoes.GetCodCurso <> '' then
      ComboBox.Text:= Funcoes.GetCodCurso;
end;

//------------------------------------------------------------------------------
// Descricao: Carrega o combobox fornecido
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaDBComboBox(ComboBox: TDBComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select distinct '+VS_Campo+
                ' from '+VS_Tabela;
   if VS_Condicao <> '' then
       VS_Comando:= VS_Comando + ' Where '+VS_Condicao;

   if VS_OrderBy <> '' then
      VS_Comando:= VS_Comando + ' order By '+VS_OrderBy;

   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;
//   DM.IBQuery_Executa.First;

   ComboBox.Items.Clear;
   if trim(ComboBox.Text) = '' then
      ComboBox.Text:= DM.IBQuery_Executa.FieldByName(VS_Campo).AsString;
      
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox.Items.Add(DM.IBQuery_Executa.FieldByName(VS_Campo).AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Carrega o Combobox fornecido
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaComboBox(ComboBox: TComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select distinct '+VS_Campo+
                ' from '+VS_Tabela;
   if VS_Condicao <> '' then
       VS_Comando:= VS_Comando + ' Where '+VS_Condicao;
   VS_Comando:= VS_Comando + ' order By '+VS_OrderBy;

   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;
   DM.IBQuery_Executa.First;

   ComboBox.Items.Clear;
   ComboBox.Text:= DM.IBQuery_Executa.FieldByName(VS_Campo).AsString;
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox.Items.Add(DM.IBQuery_Executa.FieldByName(VS_Campo).AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Encontra Id do campo selecionado
// Data     : 27/10/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.EncontraId( VS_Campo: String; VS_Tabela: String; VS_Condicao: String): String;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select '+VS_Campo+' NumId '+
                ' from '+VS_Tabela+
                ' Where '+VS_Condicao;

   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;
   DM.IBQuery_Executa.First;

   EncontraId:= DM.IBQuery_Executa.FieldByName('NumId').AsString;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Funcoes_SUE:= Funcao.Create;
end.

