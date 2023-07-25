//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : FAC.pas                                        //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da          //
//                             rotinas de tratamento da pagina da FAC.        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          :                                                //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 03/09/2019                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

//------------------------------------------------------------------------------
//--- Tratamento do comentario de Critica do Coordenador
//------------------------------------------------------------------------------

   // – DISCIPLINA          (1)
   // – DOCENTE             (2)
   // – AVALIAÇÃO           (3)
   // - MATERIAL DIDÁTICO   (4)
   // – OBSERVAÇÕES         (5)

   // CRÍTICA DO DOCENTE E INSTRUÇÃO   (1)
   // – DOCENTES
   // – OBSERVAÇÕES

   // CRÍTICA DE FINAL DE CURSO    (2)
   // – DISCIPLINA
   // - MATERIAL DIDÁTICO
   // – AVALIAÇÃO
   // – OBSERVAÇÕES

   // FICHA DE OPINIÃO       (3)
   // – DISCIPLINA
   // – OBSERVAÇÕES

   // RELATÓRIO DE AVALIAÇÃO DE FINAL DE CURSO    (4)
   // – DISCIPLINA
   // - MATERIAL DIDÁTICO
   // – AVALIAÇÃO
   // – OBSERVAÇÕES

   // FICHA DE OBSERVAÇÃO DO DOCENTE EM INSTRUÇÃO    (5)
   // – DOCENTES
   // – OBSERVAÇÕES

   {   --- Estrutura

    ClientDataSet_FA_Avaliacoes IdCurso         Integer;
    ClientDataSet_FA_Avaliacoes IdTurma         Integer;
    ClientDataSet_FA_Avaliacoes IdAvaliacao     Integer
    ClientDataSet_FA_Avaliacoes IdFicha         Integer
    ClientDataSet_FA_Avaliacoes DataAvaliacao   String (10);
    ClientDataSet_FA_Avaliacoes IdAvaliador     String (20);
    ClientDataSet_FA_Avaliacoes Identidade      String (20);
    ClientDataSet_FA_Avaliacoes Disciplina      String (6);
    ClientDataSet_FA_Avaliacoes Cabecalho       String (100);
    ClientDataSet_FA_Avaliacoes DescCabecalho  String (200);
    ClientDataSet_FA_Avaliacoes Status          String (1);
}

unit FAC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit, Rotinas_Validar,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvTransBtn,
  JvLookOut, OleCtrls, SHDocVw, TeEngine, Series, DBClient, TeeProcs, Chart, Jpeg;

type
   Tratar_FAC = Class
      Private

      Public
         procedure AlimentaExtratos(IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; IdFicha, Extrato: String);

         procedure AlimentaAvaliacoes(IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure LimpaAvaliacoes(ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure Atualizar(VB_CorregandoFicha: Boolean; IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure AlimentaComboBox_SelFicha(ComboBox_SelFicha: TComboBox; IdCurso, IdTurma: String);

         procedure ComboBox_SelFichaChange( JvDateEdit_Aplicacao: TJvDateEdit; ComboBox_SelFicha: TComboBox; IBQuery_FichaAvaliacao: TIBQuery; IdCurso, IdTurma: String);

         procedure DBGrid_FichaAvaliacaoDrawColumnCell(Sender: TObject;
                                                        const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                        State: TGridDrawState; ClientDataSet_FA_Avaliacao: TClientDataSet; DBGrid_FichaAvaliacao: TDBGrid);

   end;

var
   Funcoes_FAC: Tratar_FAC;

implementation

uses Module;

//------------------------------------------------------------------------------
// Alimenta o Combobox do filtro da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure Tratar_FAC.AlimentaComboBox_SelFicha(ComboBox_SelFicha: TComboBox; IdCurso, IdTurma: String);
begin
   Funcoes.OpenQuery(' select distinct m.cabecalho '+
                     ' From FA_Modelo m, FA_Avaliacao a '+
                     ' Where a.IdCurso = '+IdCurso+
                     ' and   a.IdTurma = '+IdTurma+
                     ' and   a.IdFicha = m.IdFicha '
                    );

   ComboBox_SelFicha.Items.Clear;
   ComboBox_SelFicha.Items.Add('');
   ComboBox_SelFicha.Text:= '';

   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_SelFicha.Items.Add(DM.IBQuery_Executa.FieldByName('cabecalho').AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de Fichas a serem avaliadas
//------------------------------------------------------------------------------

procedure Tratar_FAC.ComboBox_SelFichaChange( JvDateEdit_Aplicacao: TJvDateEdit; ComboBox_SelFicha: TComboBox; IBQuery_FichaAvaliacao: TIBQuery; IdCurso, IdTurma: String);
var
   VS_Data, VS_Comando: String;
begin
    VS_Comando:= ' Select a.IdCurso, a.IdTurma, a.IdFicha, a.Identidade, a.Disciplina, a.DataAvaliacao, a.Disponivel, a.IdCoordenador, a.IdAvl_ICEA, m.cabecalho, a.Status, a.Media '+
                ' From FA_Modelo m, FA_Avaliacao a '+
                ' Where a.IdCurso = '+IdCurso+
                ' and   a.IdTurma = '+IdTurma+
                ' and   a.IdFicha = m.IdFicha ';

   if ((JvDateEdit_Aplicacao.Text <> '  /  /    ') and (Validar.ValidarData(JvDateEdit_Aplicacao.Text) = True)) then
   begin
         VS_Data:= Funcoes.DePara(JvDateEdit_Aplicacao.Text, '/', '.')+' 00:00';
         VS_Comando:= VS_Comando+' and   a.DataAvaliacao = '+#39+VS_Data+#39;
   end;

   if (ComboBox_SelFicha.Text <> '') then
      VS_Comando:= VS_Comando+' and  m.cabecalho like '+#39+ComboBox_SelFicha.Text+'%'+#39;

   VS_Comando:= VS_Comando+' order by a.IdFicha, m.cabecalho, a.DataAvaliacao desc ';

   Funcoes.ExecutaQuery( IBQuery_FichaAvaliacao, VS_Comando);
end;

//------------------------------------------------------------------------------
// Alimenta a lista de Avaliacoes com a relação de extratos
//------------------------------------------------------------------------------

procedure Tratar_FAC.AlimentaExtratos(IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; IdFicha, Extrato: String);
begin
   ClientDataSet_FA_Avaliacao.Append;
   ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
   ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
   ClientDataSet_FA_Avaliacao.FieldByName('IdAvaliacao').AsString:=  '0';
   ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString:= IdFicha;
   ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString:= '';

   ClientDataSet_FA_Avaliacao.FieldByName('IdAvaliador').AsString:= '';
   ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString:= '';
   ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString:= '';
   ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString:= Extrato;
   ClientDataSet_FA_Avaliacao.FieldByName('DescCabacalho').AsString:= Extrato;
   ClientDataSet_FA_Avaliacao.FieldByName('Status').AsString:= '2';
   ClientDataSet_FA_Avaliacao.Post;

    ProgressBar_Fichas.StepBy(1);
end;

//------------------------------------------------------------------------------
// Alimenta a lista de Avaliacoes
//------------------------------------------------------------------------------

procedure Tratar_FAC.AlimentaAvaliacoes(IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet);
var
   Status: Integer;
   VS_Coordenador, VS_Instrutor, VS_Disciplina: String;
begin
//   if IBQuery_FichaAvaliacao.FieldByName('IdAvaliacao').AsString <> '' then
//   begin
   IBQuery_FichaAvaliacao.Open;
   ProgressBar_Fichas.Visible:= true;

   ClientDataSet_FA_Avaliacao.Open;

   ProgressBar_Fichas.Max:= 50;
   ProgressBar_Fichas.Position:= 0;
   IBQuery_FichaAvaliacao.First;


   AlimentaExtratos(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao, '100', 'EXTRATO DE CURSO - INSTRUTOR');   //--- Tratamento para alimentar o extrato
   AlimentaExtratos(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao, '101', 'EXTRATO DE CURSO - ALUNO');        //--- Tratamento para alimentar o extrato

   IBQuery_FichaAvaliacao.First;
   While not IBQuery_FichaAvaliacao.eof do
   begin
      VS_Coordenador:= '';
      VS_Instrutor:= '';
      VS_Disciplina:= '';

      ClientDataSet_FA_Avaliacao.Append;
      ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdAvaliacao').AsString:= IBQuery_FichaAvaliacao.FieldByName('IdAvaliacao').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString:= IBQuery_FichaAvaliacao.FieldByName('IdFicha').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString:= IBQuery_FichaAvaliacao.FieldByName('DataAvaliacao').AsString;

      ClientDataSet_FA_Avaliacao.FieldByName('IdAvaliador').AsString:= '';
      ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString:= '';
      ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString:= '';
      ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString:= IBQuery_FichaAvaliacao.FieldByName('Cabecalho').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('DescCabacalho').AsString:= IBQuery_FichaAvaliacao.FieldByName('Cabecalho').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Status').AsString:= '1';

      //--- Tratamento para verificar se existe ficha sem responder

      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select IdAvaliador, Respondeu '+
                                               ' From Fac_Avaliador '+
                                               ' where IDAVALIACAO = '+IBQuery_FichaAvaliacao.FieldByName('IdAvaliacao').AsString
                           );

      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         if DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N' then
         begin
            ClientDataSet_FA_Avaliacao.FieldByName('Status').AsString:= '0';
            break;
         end;

         DM.IBQuery_Executa.Next;
      end;

      //--- Tratamento para verificar o avaliado

//      if ((IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 11) or
//          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 13) or
//          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 15) or
//          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 21) or
//          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 23) or
//          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 25) )  then

      if ((IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 21) or
          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 23) or
          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 25) )  then
      begin
         Funcoes.ExecutaQuery(DM.IBQuery_Executa, ' select A.IdAvaliacao, P.Identidade, P.PostoGraduacao, P.NomeGuerra  '+
                                                  ' From Pessoa P, FAC_Avaliado A '+
                                                  ' where A.Identidade = p.identidade '+
                                                  ' and A.IdAvaliacao = '+IBQuery_FichaAvaliacao.FieldByName('IdAvaliacao').AsString
                              );
         if DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString <> '' then
        begin
           ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString:= DM.IBQuery_Executa.FieldByName('Identidade').AsString;
           ClientDataSet_FA_Avaliacao.FieldByName('DescCabacalho').AsString:= ClientDataSet_FA_Avaliacao.FieldByName('DescCabacalho').AsString+
                                                                              ' - INSTRUTOR: '+DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString+' '+
                                                                              DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString;
        end;
         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select M.CodMateria, M.NomeMateria, A.Disciplina '+
                                                  ' From MateriaCurso M, FAC_Avaliado A '+
                                                  ' where M.idcurso= '+DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+
                                                  ' and   M.idturma = '+DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+
                                                  ' and   A.IdAvaliacao = '+IBQuery_FichaAvaliacao.FieldByName('IdAvaliacao').AsString+
                                                  ' and   M.CodMateria = A.Disciplina '
                              );

        if DM.IBQuery_Executa.FieldByName('CodMAteria').AsString <> '' then
        begin
           ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString:= DM.IBQuery_Executa.FieldByName('CodMAteria').AsString;
           ClientDataSet_FA_Avaliacao.FieldByName('DescCabacalho').AsString:= ClientDataSet_FA_Avaliacao.FieldByName('DescCabacalho').AsString+
                                                                              ' - DISCIPLINA: '+DM.IBQuery_Executa.FieldByName('CodMAteria').AsString+' '+
                                                                              DM.IBQuery_Executa.FieldByName('NomeMateria').AsString;
        end;

      end;
      ClientDataSet_FA_Avaliacao.Post;

      ProgressBar_Fichas.StepBy(1);

      IBQuery_FichaAvaliacao.Next;
//   end;
   end;
   ProgressBar_Fichas.Visible:= False;
   ClientDataSet_FA_Avaliacao.First;
end;

//------------------------------------------------------------------------------
// Limpa a lista de Avaliacoes
//------------------------------------------------------------------------------

procedure Tratar_FAC.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao: TClientDataSet);
begin
   ClientDataSet_FA_Avaliacao.EmptyDataSet;    //---Limpa os registros do ClientDataSet
end;

//------------------------------------------------------------------------------
// Tratamento da atualizacao da lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure Tratar_FAC.Atualizar(VB_CorregandoFicha: Boolean; IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet);
begin
   VB_CorregandoFicha:= False;
   Funcoes.AtualizaQuery(IBQuery_FichaAvaliacao);
   LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
   AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
   VB_CorregandoFicha:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar a situacao da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure Tratar_FAC.DBGrid_FichaAvaliacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState; ClientDataSet_FA_Avaliacao: TClientDataSet; DBGrid_FichaAvaliacao: TDBGrid);
begin
   DBGrid_FichaAvaliacao.Canvas.Brush.Color:= clCream;
   if ClientDataSet_FA_Avaliacao.FieldByName('Status').AsString = '' then
      DBGrid_FichaAvaliacao.Canvas.Font.Color:= clBlack
   else
      if (( ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger >= 1) and
         ( ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger <= 4)) then
      begin
         DBGrid_FichaAvaliacao.Canvas.Font.Color:= clGreen;
      end
      else
      begin
         if (( ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger >= 11) and
            ( ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger <= 14)) then
         begin
            DBGrid_FichaAvaliacao.Canvas.Font.Color:= clGreen;
         end
         else
         begin
            if ((ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger = 7) or (ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger = 17)) then
               DBGrid_FichaAvaliacao.Canvas.Font.Color:= clBlue
            else
               if ((ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger = 8) or (ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger = 18)) then
                  DBGrid_FichaAvaliacao.Canvas.Font.Color:= clRed
               else
                  DBGrid_FichaAvaliacao.Canvas.Font.Color:= clBlack;
         end;
      end;

  if gdSelected in State then
    DBGrid_FichaAvaliacao.Canvas.Brush.Color := clSkyBlue;

   DBGrid_FichaAvaliacao.Canvas.FillRect(Rect);
   DBGrid_FichaAvaliacao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

