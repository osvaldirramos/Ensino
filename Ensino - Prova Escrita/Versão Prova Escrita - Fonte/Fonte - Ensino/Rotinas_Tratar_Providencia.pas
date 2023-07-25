//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas_Tratar_Providencia                     //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             de tratamento da opc�o Providencia.            //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 012/2018                                    //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas_Tratar_Providencia;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs, Rotinas,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Module, IBQuery;

   type
   Funcao = Class
      Private

      Public
         Procedure AlimentaComboSelecaoSecao(ComboBox_Secao: TComboBox);
         Procedure AlimentaComboSelecaoResponsavel(DBComboBox_Rec_responsavel, DBComboBox_Exec_responsavel: TDBComboBox);
   end;

var
   Funcoes_TrataProvidencia: Funcao;

implementation


//------------------------------------------------------------------------------
// Descricao: Alimenta o Combo de selecao da secao
//
// Atualizado em: 01/02/18
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaComboSelecaoSecao(ComboBox_Secao: TComboBox);
var
   Ano, Mes, Dia : word;
   Retorno: String;
begin
   Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select Sigla From FP_Secao Order By IdSecao' );
   DM.IBQuery_Executa.First;

   ComboBox_Secao.Items.Clear;
   ComboBox_Secao.Text:= '';
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Secao.Items.Add(DM.IBQuery_Executa.FieldByName('Sigla').AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Descricao:  Alimenta o Combo de selecao dos responsaveis
//
// Atualizado em: 01/02/18
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaComboSelecaoResponsavel(DBComboBox_Rec_responsavel, DBComboBox_Exec_responsavel: TDBComboBox);
begin
   Funcoes.ExecutaQuery( DM.IBQuery_Executa,'Select u.Nome From usuario u, perfilacesso p Where u.idcodigo = p.idcodigo and p.modulo =  '+#39+'Menu Principal - Provid�ncia'+#39+' and p.Possuiacesso = '+#39+'S'+#39+' order by u.nome' );
   DM.IBQuery_Executa.First;

   DBComboBox_Rec_responsavel.Items.Clear;
   DBComboBox_Exec_responsavel.Items.Clear;

   DBComboBox_Rec_responsavel.Text:= '';
   DBComboBox_Exec_responsavel.Text:= '';
   While not DM.IBQuery_Executa.Eof do
   begin
      DBComboBox_Rec_responsavel.Items.Add(DM.IBQuery_Executa.FieldByName('Nome').AsString);
      DBComboBox_Exec_responsavel.Items.Add(DM.IBQuery_Executa.FieldByName('Nome').AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

end.
