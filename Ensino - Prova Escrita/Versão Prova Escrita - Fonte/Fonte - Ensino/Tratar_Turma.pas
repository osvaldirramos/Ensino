unit Tratar_Turma;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, IBQuery, ToolWin, ShellApi, Variants, Rotinas;

type
   Funcao = Class
      Private

      Public

         Function SetTurma( VS_IdCurso: String; Turma: String; Edit_TurmaAno, Edit_Inicio, Edit_termino, Edit_Status, Edit_radio, Edit_Coordenador: TEdit): String;
         Procedure Monta_ComboTurma(VS_IdCurso: String; ComboBox_Turma: TComboBox);
   end;

var
   F_Turma: Funcao;

implementation

uses Module;

//------------------------------------------------------------------------------
//
// Funcoes
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Trata da selecao do Instrutor
// Retorno: IdTurma
//------------------------------------------------------------------------------

Function Funcao.SetTurma( VS_IdCurso: String; Turma: String; Edit_TurmaAno, Edit_Inicio, Edit_termino, Edit_Status, Edit_radio, Edit_Coordenador: TEdit): String;
var
   VS_Turma, VS_Ano: String;
   VI_Inicio: Integer;
begin
   VI_Inicio:= Length(Turma) -4;
   VS_Turma:= Trim(Funcoes.ExtraiAntesDe(Turma, '-'));
   VS_Ano:= Copy(Turma, VI_Inicio+1,4);

   Funcoes.OpenQuery('Select IdTurma, Turma, Ano, DataInicio, DataTermino, Status, Radio, Coordenador from Turma where IdCurso = '+VS_IdCurso+' and Turma = '+#39+VS_Turma+#39+' and ano = '+#39+VS_Ano+#39);

   if Trim(DM.IBQuery_Executa.FieldByName('IdTurma').AsString) = '' then
   begin
      Edit_TurmaAno.Text:= '';
      Edit_Inicio.Text:= '';
      Edit_termino.Text:= '';
      Edit_Status.Text:= '';
      Edit_radio.Text:=  '';
      Edit_Coordenador.Text:=  '';
      ShowMessage('Curso selecionado não possui Turma Cadastrada...');
   end
   else
   begin
      Edit_TurmaAno.Text:= DM.IBQuery_Executa.FieldByName('Ano').AsString;
      Edit_Inicio.Text:= DM.IBQuery_Executa.FieldByName('DataInicio').AsString;
      Edit_termino.Text:= DM.IBQuery_Executa.FieldByName('DataTermino').AsString;
      if DM.IBQuery_Executa.FieldByName('Status').AsString = 'A' then
         Edit_Status.Text:= 'Ativo'
      else
         Edit_Status.Text:= 'Planejada';

      Edit_radio.Text:= DM.IBQuery_Executa.FieldByName('Radio').AsString;
      Edit_Coordenador.Text:= DM.IBQuery_Executa.FieldByName('Coordenador').AsString;
   end;
   SetTurma:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
end;

//------------------------------------------------------------------------------
// Monta a Relação das Turmas Referentes ao Curso Selecionado
// Retorno:
//------------------------------------------------------------------------------

procedure Funcao.Monta_ComboTurma(VS_IdCurso: String; ComboBox_Turma: TComboBox);
begin
   Funcoes.OpenQuery('Select turma, Ano From Turma where IdCurso = '+VS_IdCurso+' and Status <> '+#39+'E'+#39+' order by Ano desc, Turma ');

   ComboBox_Turma.Items.Clear;
   if Trim(DM.IBQuery_Executa.FieldByName('Turma').AsString) = '' then
      ComboBox_Turma.Text:= ''
   else
      ComboBox_Turma.Text:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString;

   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Turma.Items.Add( DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString);
      DM.IBQuery_Executa.Next;
   end;
   DM.IBQuery_Executa.Close;
end;


//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  F_Turma:= Funcao.Create;
end.

