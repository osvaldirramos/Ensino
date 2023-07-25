//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : FichaAvalicaoCurso.pas                         //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da          //
//                             rotinas de tratamento da pangina da Ficha de   //
//                             Avaliaçao de Curso.                            //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          :                                                //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 23/11/2017                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

{   --- Estrutura
    ClientDataSet_FA_Avaliacoes IdCurso         Integer;
    ClientDataSet_FA_Avaliacoes IdTurma         Integer;
    ClientDataSet_FA_Avaliacoes IdFicha         Integer
    ClientDataSet_FA_Avaliacoes Identidade      String (20);
    ClientDataSet_FA_Avaliacoes Disciplina      String (6);
    ClientDataSet_FA_Avaliacoes IdAVL_ICEA      String (20);
    ClientDataSet_FA_Avaliacoes DataAvaliacao   String (10);
    ClientDataSet_FA_Avaliacoes Disponivel      String (1);
    ClientDataSet_FA_Avaliacoes Cabecalho       String (70);
    ClientDataSet_FA_Avaliacoes Desc_Cabecalho  String (200);
    ClientDataSet_FA_Avaliacoes IdCoordenador   String (20);
    ClientDataSet_FA_Avaliacoes Status          String (1);
    ClientDataSet_FA_Avaliacoes Media           String (5);
}

unit FichaAvalicaoCurso;

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

const
   x= '';

type
   TratarFichaAvalicaoCurso = Class
      Private

      Public
         procedure Tratar_Ficha(WebBrowser1: TWebBrowser; Chart_Grafico: TChart;
                                CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores: TCheckBox;
                                ProgressBar_MontaFicha: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; BarSeries_Grafico: TBarSeries;
                                IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Itens, IBQuery_Topicos, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador: TIBQuery
                               );
         procedure AlimentaAvaliacoes(IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure LimpaAvaliacoes(ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure Atualizar(VB_CorregandoFicha: Boolean; WebBrowser1: TWebBrowser; Chart_Grafico: TChart; CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores: TCheckBox;
                             IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Topicos, IBQuery_Itens, IBQuery_FichaAvaliacao, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador: TIBQuery;
                             ProgressBar_Fichas, ProgressBar_MontaFicha: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; BarSeries_Grafico: TBarSeries);

         Function TratarStatus(IdCurso, IdTurma, IdFicha, Identidade, CodDisciplina, Cabecalho: string): Integer;

         procedure ComentarioCoordenadorInstrutor(HTML: TStringList; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure ComentarioAlunos(HTML:TStringList; VS_IdModelo: String; CheckBox_Msg: TCheckBox;
                                    IBQuery_Itens, IBQuery_Complemento01, IBQuery_Complemento02: TIBQuery;
                                    ClientDataSet_FA_Avaliacao: TClientDataSet
                                   );

         procedure ComentarioInstrutorDisciplina(HTML:TStringList; VS_IdModelo: String; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure ImprimirMsg(HTML:TStringList; Texto: String);

         procedure ComentarioCriticaInstrutor(HTML:TStringList; VS_IdModelo: String; VI_Critica: integer; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure ComentarioCriticaCoordenador(HTML:TStringList; VS_IdModelo: String; VI_Critica: integer; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure ComentarioCriticaAluno(HTML:TStringList; VS_IdModelo: String; VI_Critica: integer; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);

         procedure Assinatura(HTML:TStringList; Texto: String);

         procedure AlimentaComboBox_SelFicha(ComboBox_SelFicha: TComboBox; IdCurso, IdTurma: String);

         procedure ComboBox_SelFichaChange( JvDateEdit_Aplicacao: TJvDateEdit; ComboBox_SelFicha: TComboBox; IBQuery_FichaAvaliacao: TIBQuery; IdCurso, IdTurma: String);

         procedure IBQuery_FichaAvaliacao_AfterScroll(DataSet: TDataSet; IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; VB_CorregandoFicha: Boolean);

         procedure TratarErroCheckBox(WebBrowser1: TWebBrowser );

         procedure DBGrid_FichaAvaliacaoDrawColumnCell(Sender: TObject;
                                                        const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                        State: TGridDrawState; ClientDataSet_FA_Avaliacao: TClientDataSet; DBGrid_FichaAvaliacao: TDBGrid);

   end;

var
   Funcoes_FichaAvalicaoCurso: TratarFichaAvalicaoCurso;

implementation

uses Module, FA_RelatorioFichaAvaliacao;

//------------------------------------------------------------------------------
// Alimenta o Combobox do filtro da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.AlimentaComboBox_SelFicha(ComboBox_SelFicha: TComboBox; IdCurso, IdTurma: String);
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

procedure TratarFichaAvalicaoCurso.ComboBox_SelFichaChange( JvDateEdit_Aplicacao: TJvDateEdit; ComboBox_SelFicha: TComboBox; IBQuery_FichaAvaliacao: TIBQuery; IdCurso, IdTurma: String);
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
// Alimenta a lista de Avaliacoes
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.AlimentaAvaliacoes(IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet);
var
   Status: Integer;
   VS_Coordenador, VS_Instrutor, VS_Disciplina: String;
begin
   ProgressBar_Fichas.Visible:= true;

   ClientDataSet_FA_Avaliacao.Open;

   ProgressBar_Fichas.Max:= 50;
   ProgressBar_Fichas.Position:= 0;
   IBQuery_FichaAvaliacao.First;
   While not IBQuery_FichaAvaliacao.eof do
   begin
      VS_Coordenador:= '';
      VS_Instrutor:= '';
      VS_Disciplina:= '';

      if IBQuery_FichaAvaliacao.FieldByName('STATUS').AsInteger = 4 then
         Status:= 4
      else
         Status:= TratarStatus(IBQuery_FichaAvaliacao.FieldByName('IDCURSO').AsString,
                               IBQuery_FichaAvaliacao.FieldByName('IDTURMA').AsString,
                               IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsString,
                               trim(IBQuery_FichaAvaliacao.FieldByName('IDENTIDADE').AsString),
                               Trim(IBQuery_FichaAvaliacao.FieldByName('DISCIPLINA').AsString),
                               IBQuery_FichaAvaliacao.FieldByName('CABECALHO').AsString
                              );
      if Status = 0 then
         Status:= 3
      else
      begin
         if IBQuery_FichaAvaliacao.FieldByName('IdFicha').Asinteger = 1 then
         begin
            ClientDataSet_FA_Avaliacao.Append;
            ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDCURSO').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDTURMA').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString:= '0';
            ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDENTIDADE').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString:= IBQuery_FichaAvaliacao.FieldByName('DISCIPLINA').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('IdAVL_ICEA').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDAVL_ICEA').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString:= IBQuery_FichaAvaliacao.FieldByName('DATAAVALIACAO').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('Disponivel').AsString:= IBQuery_FichaAvaliacao.FieldByName('DISPONIVEL').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('IdCoordenador').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDCOORDENADOR').AsString;
            ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString:=  'EXTRATO CURSO';
            ClientDataSet_FA_Avaliacao.FieldByName('Desc_Cabecalho').AsString:=  'EXTRATO CURSO';
            ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger:=  Status;
            ClientDataSet_FA_Avaliacao.FieldByName('Media').AsString:= IBQuery_FichaAvaliacao.FieldByName('MEDIA').AsString;
            ClientDataSet_FA_Avaliacao.Post;
         end;
      end;

      //--- Tratamento para tratar coordenador

      if ((IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 2))  then      // Ficha Avaliacao com Instrutor
      begin
         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select PostoGraduacao, NomeGuerra '+
                                                  ' From Pessoa '+
                                                  ' where Identidade = '+#39+IBQuery_FichaAvaliacao.FieldByName('IDCOORDENADOR').AsString+#39
                             );

        if DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString <> '' then
           VS_Coordenador:= ' - '+DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString+' '+DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString;
      end;

      //--- Tratamento para tratar Instrutor

      if ((IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 2) or (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 3) or
          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 4) or (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 6))  then      // Ficha Avaliacao com Instrutor
      begin
         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select PostoGraduacao, NomeGuerra '+
                                                  ' From Pessoa '+
                                                  ' where Identidade = '+#39+IBQuery_FichaAvaliacao.FieldByName('IDENTIDADE').AsString+#39
                              );

         if DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString <> '' then
            VS_Instrutor:= ' - '+DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString+' '+DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString;
      end;



      if ((IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 2) or (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 3) or
          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 4) or (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 5) or
          (IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsInteger = 6))  then      // Ficha Avaliacao com Instrutor
      begin
         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select CodMateria, NomeMateria '+
                                            ' From MateriaCurso '+
                                            ' where idcurso= '+IBQuery_FichaAvaliacao.FieldByName('IDCURSO').AsString+
                                            ' and idturma = '+IBQuery_FichaAvaliacao.FieldByName('IDTURMA').AsString+
                                            ' and CodMateria = '+#39+IBQuery_FichaAvaliacao.FieldByName('DISCIPLINA').AsString+#39
                                 );

         if DM.IBQuery_Executa.FieldByName('CodMAteria').AsString <> '' then
             VS_Disciplina:= ' - '+DM.IBQuery_Executa.FieldByName('CodMAteria').AsString+' '+DM.IBQuery_Executa.FieldByName('NomeMateria').AsString;
      end;


      ClientDataSet_FA_Avaliacao.Append;
      ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDCURSO').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDTURMA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDENTIDADE').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString:= IBQuery_FichaAvaliacao.FieldByName('DISCIPLINA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdAVL_ICEA').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDAVL_ICEA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString:= IBQuery_FichaAvaliacao.FieldByName('DATAAVALIACAO').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Disponivel').AsString:= IBQuery_FichaAvaliacao.FieldByName('DISPONIVEL').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdCoordenador').AsString:= IBQuery_FichaAvaliacao.FieldByName('IDCOORDENADOR').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString:=  IBQuery_FichaAvaliacao.FieldByName('CABECALHO').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Desc_Cabecalho').AsString:=  IBQuery_FichaAvaliacao.FieldByName('CABECALHO').AsString+VS_Coordenador+VS_Instrutor+VS_Disciplina;
      ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger:=  Status;
      ClientDataSet_FA_Avaliacao.FieldByName('Media').AsString:= IBQuery_FichaAvaliacao.FieldByName('MEDIA').AsString;
      ClientDataSet_FA_Avaliacao.Post;

      ProgressBar_Fichas.StepBy(1);

      IBQuery_FichaAvaliacao.Next;
   end;
   ProgressBar_Fichas.Visible:= False;
   ClientDataSet_FA_Avaliacao.First;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Status
//------------------------------------------------------------------------------

Function TratarFichaAvalicaoCurso.TratarStatus(IdCurso, IdTurma, IdFicha, Identidade, CodDisciplina, Cabecalho: string): Integer;
Var
   Status: String;
begin

   Status:= '4';
   if ((Cabecalho = 'FICHA DE AVALIAÇÃO DE FINAL DE CURSO') or
       (Cabecalho = 'FICHA DE AVALIAÇÃO DE DOCENTE E INSTRUÇÃO - AULA TEÓRICA') or
       (Cabecalho = 'FICHA DE AVALIAÇÃO DE DOCENTE E INSTRUÇÃO - AULA PRÁTICA')) then
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select Respondeu '+
                                               ' From fa_relacao '+
                                               ' where idcurso= '+IdCurso+
                                               ' and idturma = '+IdTurma+
                                               ' and idficha = '+IdFicha+
                                               ' and identidade = '+#39+Identidade+#39+
                                               ' and disciplina = '+#39+CodDisciplina+#39

                          );
      if ((DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N') or (DM.IBQuery_Executa.FieldByName('Respondeu').AsString = '')) then
          Status:= '0'
      else
      begin
         While not DM.IBQuery_Executa.eof do
         begin
            if ((DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N') or (DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N')) then
            begin
                Status:= '3';
                Break;
            end;
            DM.IBQuery_Executa.Next;
         end;
      end;
   end
   else
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select Respondeu '+
                                               ' From fa_relacao '+
                                               ' where idcurso= '+IdCurso+
                                               ' and idturma = '+IdTurma+
                                               ' and idficha = '+IdFicha+
                                               ' and identidade = '+#39+Identidade+#39+
                                               ' and disciplina = '+#39+CodDisciplina+#39
                          );

      if ((DM.IBQuery_Executa.FieldByName('Respondeu').AsString = 'N') or (DM.IBQuery_Executa.FieldByName('Respondeu').AsString = '')) then
          Status:= '3';
   end;

   Funcoes.ExecusaoQuery('update FA_AVALIACAO set status = '+Status+
                         ' where idcurso= '+IdCurso+
                         ' and idturma = '+IdTurma+
                         ' and idficha = '+IdFicha+
                         ' and identidade = '+#39+Identidade+#39+
                         ' and disciplina = '+#39+CodDisciplina+#39
                        );

   TratarStatus:= StrToInt(Status);
end;

//------------------------------------------------------------------------------
// Limpa a lista de Avaliacoes
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao: TClientDataSet);
begin
   ClientDataSet_FA_Avaliacao.First;
   While not ClientDataSet_FA_Avaliacao.eof do
      ClientDataSet_FA_Avaliacao.Delete;
end;

//------------------------------------------------------------------------------
// Tratamento da atualizacao da lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.Atualizar(VB_CorregandoFicha: Boolean; WebBrowser1: TWebBrowser; Chart_Grafico: TChart; CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores: TCheckBox;
                                             IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Topicos, IBQuery_Itens, IBQuery_FichaAvaliacao, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador: TIBQuery;
                                             ProgressBar_Fichas, ProgressBar_MontaFicha: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; BarSeries_Grafico: TBarSeries);
begin
   VB_CorregandoFicha:= False;
   Funcoes.AtualizaQuery(IBQuery_FichaAvaliacao);
   LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
   AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
   VB_CorregandoFicha:= True;
   Tratar_Ficha(WebBrowser1, Chart_Grafico, CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores, ProgressBar_MontaFicha, ClientDataSet_FA_Avaliacao, BarSeries_Grafico,
                IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Itens, IBQuery_Topicos, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador);
end;

//------------------------------------------------------------------------------
// Tratamento para montar a ficha de avalicao
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.Tratar_Ficha(WebBrowser1: TWebBrowser; Chart_Grafico: TChart;
                                                CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores: TCheckBox;
                                                ProgressBar_MontaFicha: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; BarSeries_Grafico: TBarSeries;
                                                IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Itens, IBQuery_Topicos, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador: TIBQuery);
var
   HTML:TStringList;

   VS_IdModelo, VS_Cor, VS_Media_ajust, VS_IdFicha: String;
   VS_NomeArq, VS_Dir: String;

   VI_Cont, VI_m_cont, VI_Contador, VI_Avaliadores, VI_Cont_respondido: Integer;
   VI_Critica: Integer;

   VI_soma_media, VI_Media, VI_m1, VI_m2, VI_m3, VI_m4, VI_m5, VI_TotalRep, VI_01, VI_02, VI_03, VI_04, VI_05, VI_NO: Real;

   PR_media_topico: Array[1..10] of Real;
   Bmp : TBitmap;
   FJPEG:TJPEGImage;
begin
   VS_Dir:= 'C:\Ensino\Tmp';
   if not DirectoryExists(VS_Dir) then
       ForceDirectories(VS_Dir);
   VS_Dir := VS_Dir;

   ProgressBar_MontaFicha.Visible:= true;
   ProgressBar_MontaFicha.Max:= 50;
   ProgressBar_MontaFicha.Position:= 0;

   BarSeries_Grafico.Clear;

   HTML := TSTringList.Create;
   HTML.Clear;

   //---
   // Inicia o processamento

   if ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString = '' then
   begin
      HTML.Add('<center>');
      HTML.Add('<font size=5>Não possuí ficha para ser avaliada</font><br/>');
      HTML.Add('</center>');
      HTML.Add('<br/>');
   end
   else
   begin
      VS_IdModelo:= ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString;

      if VS_IdModelo = '0' then
         VS_IdFicha:= '1'
      else
         VS_IdFicha:= VS_IdModelo;

      Funcoes.ExecutaQuery(DM.IBQuery_Executa, ' select distinct SENHA '+
                                               ' From fa_resposta'+
                                               ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                               ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                               ' and IdFicha = '+VS_IdFicha+
                                               ' and Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                               ' and Disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39
                          );
      VI_Cont_respondido:= 0;
      While not DM.IBQuery_Executa.Eof do
      begin
         VI_Cont_respondido:= VI_Cont_respondido+1;
         DM.IBQuery_Executa.Next;
      end;

      if VI_Cont_respondido = 0 then
      begin
         HTML.Add('<center>');
         HTML.Add('<font size=3>Relatório ainda não foi respondido</font><br/>');
         HTML.Add('</center>');
         HTML.Add('<br/>');
      end
      else
      begin

          //---
         //Pega a Identificacao do Instituto

         HTML.Add('<center>');
         HTML.Add('<font size=3>'+DM.IBTable_Configuracao.FieldByName('Nome').AsString+'</font><br/>');
         HTML.Add('<font size=3>'+DM.IBTable_Configuracao.FieldByName('divisao').AsString+'</font><br/>');
         HTML.Add('<font size=3>'+DM.IBTable_Configuracao.FieldByName('subdivisao').AsString+'</font><br/>');
         HTML.Add('<br/>');
         HTML.Add('<font size=3>'+ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString+'</font><br/>');
         HTML.Add('</center>');
         HTML.Add('<br/>');
         ProgressBar_MontaFicha.StepBy(1);

          //---
         //Pega a Identificacao do Curso

         Funcoes.ExecutaQuery( DM.IBQuery_Executa,'Select IdCurso, CodCurso, NomeCurso From Curso where codcurso = '+#39+Funcoes.GetCodCurso+#39 );

         HTML.Add('<hr size='+#39+'1'+#39+'/>');
         HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                  '   <tr> '+
                  '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Nome do curso:  </b>'+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' -  '+DM.IBQuery_Executa.FieldByName('NomeCurso').AsString+'</div></td> '+
                  '   </tr> '+
                  '</table> ');

         HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                  '   <tr> '+
                  '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Turma:  </b>'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' de '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+'</div></td> '+
                  '   </tr> '+
                  '</table> ');
         ProgressBar_MontaFicha.StepBy(1);

         HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                  ' <tr> '+
                  '  <td width='+#39+'650'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' > Período:  </b>'+DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString+' a '+DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString+'</div></td> '+
                  '  <td width='+#39+'200'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' > Data Avaliação:  </b>'+ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString+'</div></td> '+
                  '</tr> '+
                  '</table> ');
         ProgressBar_MontaFicha.StepBy(1);

         if ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 2 then
         begin
            HTML.Add('<div><table> '+
                        '   <tr> '+
                        '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Coordenador: </b>'+IBQuery_Coordenador.FieldByName('PostoGraduacao').AsString+' '+IBQuery_Coordenador.FieldByName('NomeGuerra').AsString+'</div></td> '+
                        '   </tr> '+
                        '   <tr> '+
                        '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Instrutor Avaliado: </b>'+IBQuery_Instrutor.FieldByName('PostoGraduacao').AsString+' '+IBQuery_Instrutor.FieldByName('NomeGuerra').AsString+'</div></td> '+
                        '   </tr> '+
                        '   <tr> '+
                        '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Disciplina Avaliada: </b>'+IBQuery_Disciplina.FieldByName('CodMateria').AsString+' - '+IBQuery_Disciplina.FieldByName('NomeMateria').AsString+'</div></td> '+
                        '   </tr> '+
                         '</table> '+
                     '<div/><br>');
         end
         else
         begin
            if ((ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 2) or (ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 3) or
                (ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 2) or (ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 3)) then
            begin
               HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                        '   <tr> '+
                        '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Instrutor: <b >'+Trim(IBQuery_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBQuery_Instrutor.FieldByName('NomeGuerra').AsString+'</b></div></td> '+
                        '   </tr> '+
                        '</table> ');

               HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                        '   <tr> '+
                        '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Disciplina Avaliada: <b >'+IBQuery_Disciplina.FieldByName('CodMateria').AsString+' - '+IBQuery_Disciplina.FieldByName('NomeMateria').AsString+'</b></div></td> '+
                        '   </tr> '+
                        '</table> ');
            end
            else
            begin
                //---
               //Pega numero de aluno participantes da avaliação

               Funcoes.ExecutaQuery(DM.IBQuery_Executa, ' Select count(1) QdeAlunos '+
                                                        ' From fa_relacao'+
                                                        ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                        ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                        ' and IdFicha = '+VS_IdFicha+
                                                        ' and Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                                        ' and Disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39
                                   );
               VI_Avaliadores:= DM.IBQuery_Executa.FieldByName('QdeAlunos').AsInteger;

               if ((ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 3) or (ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 4)) then
               begin
                  HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                           '   <tr> '+
                           '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Instrutor Avaliado:  <b >'+Trim(IBQuery_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBQuery_Instrutor.FieldByName('NomeGuerra').AsString+'</b></div></td> '+
                           '   </tr> '+
                           '</table> ');

                  HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                           '   <tr> '+
                           '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Disciplina Avaliada: <b >'+IBQuery_Disciplina.FieldByName('CodMateria').AsString+' - '+IBQuery_Disciplina.FieldByName('NomeMateria').AsString+'</b></div></td> '+
                           '   </tr> '+
                           '</table> ');
               end;

               HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                        ' <tr> '+
                        '  <td width='+#39+'650'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px'+#39+' >'+'Número de participantes:  '+IntToStr(VI_Avaliadores)+'</b></div></td> '+
                        '  <td width='+#39+'200'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >Alunos no curso: '+IntToStr(DM.IBQuery_MontaTurma.FieldByName('QtdBrasileiros').AsInteger+DM.IBQuery_MontaTurma.FieldByName('QtdEstrangeiros').AsInteger)+'</b></div></td> '+
                        '</tr> '+
                        '</table> ');

                  HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                           '   <tr> '+
                           '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Número de questionários respondidos:  <b >'+IntToStr(VI_Cont_respondido)+'</b></div></td> '+
                           '   </tr> '+
                           '</table> ');
            end;
         end;
         HTML.Add('<hr size='+#39+'1'+#39+'/>');
         ProgressBar_MontaFicha.StepBy(1);

         //  LimpaGrafico($conexao);

          //--- Tratamento das perguntas
         //faz select para montar questionario

         if CheckBox_Valores.Checked = True then
         begin
            HTML.Add('Os valores de avaliação correspondem aos seguintes conceitos:');
            HTML.Add('<br><br>');
            HTML.Add('N/O-Não Observado  | 1-Péssimo  |   2-Regular  |   3-Bom  |   4-Ótimo | 5-Excelente  ');
            HTML.Add('<br>');
            ProgressBar_MontaFicha.StepBy(1);
         end;
         //--- Verifica se foi respondido

         VI_Contador:= 0;

         Funcoes.ExecutaQuery(IBQuery_Topicos, ' Select * '+
                                               ' From FA_Topicos '+
                                               ' where IdFicha = '+VS_IdFicha+
                                               ' order by IdFicha, IdTopico '
                             );
         While not IBQuery_Topicos.eof do
         begin
            VI_M_cont:= 0;
            VI_soma_media:= 0;

            if CheckBox_Valores.Checked = True then
            begin
               HTML.Add('<table border='+#39+'1'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+' bordercolor='+#39+'#FFFFFF'+#39+' >'+
                        '   <tr> '+
                        '       <td width='+#39+'810'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >'+Funcoes.AjustarMaiscula(IBQuery_Topicos.FieldByName('Descricao').AsString)+'</b></div></td>'+
                        '       <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >Nº</b></div></td>'+
                        '       <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >1</b></div></td>'+
                        '       <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >2</b></div></td>'+
                        '       <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >3</b></div></td>'+
                        '       <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >4</b></div></td>'+
                        '       <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >5</b></div></td>'+
                        '       <td width='+#39+'40'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >Nº Obs</b></div></td>'+
                        '       <td width='+#39+'50'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:14px'+#39+' >Média</b></div></td>'+
                        '   </tr>'+
                        '</table>'
                       );
               ProgressBar_MontaFicha.StepBy(1);
            end;

            Funcoes.ExecutaQuery(IBQuery_Itens, ' Select * '+
                                                ' From FA_Itens '+
                                                ' where IdFicha = '+VS_IdFicha+
                                                ' and   IdTopico = '+IBQuery_Topicos.FieldByName('IdTopico').AsString+
                                                ' order by IdFicha, IdTopico, IdItem '
                                );
            HTML.Add('<div id='+IBQuery_Topicos.FieldByName('Descricao').AsString+'>');
            ProgressBar_MontaFicha.StepBy(1);

            While not IBQuery_Itens.Eof do
            begin
               VI_M_cont:= VI_M_cont + 1;

               VI_TotalRep:= 0;
               VI_01:= 0;
               VI_02:= 0;
               VI_03:= 0;
               VI_04:= 0;
               VI_05:= 0;
               VI_NO:= 0;

               Funcoes.ExecutaQuery( DM.IBQuery_Executa,'select resposta '+
                                                        ' From Fa_Resposta '+
                                                        ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                        ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                        ' and idficha = '+IBQuery_Itens.FieldByName('IdFicha').AsString+
                                                        ' and idtopico = '+IBQuery_Topicos.FieldByName('IdTopico').AsString+
                                                        ' and iditem = '+IBQuery_Itens.FieldByName('IdItem').AsString+
                                                        ' and Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                                        ' and Disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39
                                   );

               While not DM.IBQuery_Executa.Eof do
               begin
                  VI_TotalRep:= VI_TotalRep+1;

                  if DM.IBQuery_Executa.FieldByName('Resposta').AsString = '0' then
                     VI_NO:= VI_NO+1
                   else
                      if DM.IBQuery_Executa.FieldByName('Resposta').AsString = '1' then
                         VI_01:= VI_01+1
                      else
                         if DM.IBQuery_Executa.FieldByName('Resposta').AsString = '2' then
                            VI_02:= VI_02+1
                         else
                            if DM.IBQuery_Executa.FieldByName('Resposta').AsString = '3' then
                               VI_03:= VI_03+1
                            else
                               if DM.IBQuery_Executa.FieldByName('Resposta').AsString = '4' then
                                  VI_04:= VI_04+1
                               else
                                  if DM.IBQuery_Executa.FieldByName('Resposta').AsString = '5' then
                                     VI_05:= VI_05+1;

                  DM.IBQuery_Executa.Next;
               end;

               VI_m1:=  VI_01 * 1;
               VI_m2:=  VI_02 * 2;
               VI_m3:=  VI_03 * 3;
               VI_m4:=  VI_04 * 4;
               VI_m5:=  VI_05 * 5;

               if VI_TotalRep = 0 then
                   VS_Media_ajust:= '0.00'
               else
               begin
                  VI_Media:= (VI_m1 + VI_m2 + VI_m3 + VI_m4 + VI_m5)/VI_totalRep;
                  VI_Soma_media:= VI_soma_media+ VI_media ;
                  VS_Media_ajust:= FormatFloat('#.00', VI_media);
               end;

               VI_Contador:= VI_Contador + 1;
               if CheckBox_Valores.Checked = True then
               begin
                  HTML.Add('<table style:border-bottom:1px solid #ccc; border='+#39+'1'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                           '   <tr valign='+#39+'rigth'+#39+'> '+
                           '     <div><td width='+#39+'810'+#39+'><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+IBQuery_Itens.FieldByName('IdItem').AsString+' - '+IBQuery_Itens.FieldByName('Descricao').AsString+'</span></td></div> '+
                           '       <td width='+#39+'30'+#39+' align='+#39+'center'+#39+'><div><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+FloatToStr(VI_NO)+'</span></div></td> '+
                           '         <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+FloatToStr(VI_01)+'</span></div></td> '+
                           '          <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+FloatToStr(VI_02)+'</span></div></td> '+
                           '            <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+FloatToStr(VI_03)+'</span></div></td> '+
                           '             <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+FloatToStr(VI_04)+'</span></div></td> '+
                           '               <td width='+#39+'25'+#39+' align='+#39+'center'+#39+'><div><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+FloatToStr(VI_05)+'</span></div></td> '+
                           '                <td width='+#39+'40'+#39+' align='+#39+'center'+#39+'><div><span style='+#39+'font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'+#39+'>'+FloatToStr(VI_TotalRep)+'</span></b></div></td> '+
                           '                  <td width='+#39+'50'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:12px'+#39+' >'+VS_Media_ajust+'</b></div></td> '+
                           '    </tr> '+
                           ' </table>');
                  ProgressBar_MontaFicha.StepBy(1);
               end;

               IBQuery_Itens.Next
            end;

            PR_Media_Topico[VI_M_Cont]:= VI_Soma_media / VI_M_Cont;

            if CheckBox_Valores.Checked = True then
            begin
               HTML.Add('<table style:border-bottom:1px solid #ccc; border='+#39+'1'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                        ' <tr> '+
                        '  <td width='+#39+'760'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:12px'+#39+' >Média do Tópico</b></div></td> '+
                        '  <td width='+#39+'40'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:12px; color:red'+#39+' >'+FormatFloat('##.00', PR_Media_Topico[VI_M_Cont])+'</b></div></td> '+
                        '</tr> '+
                        '</table> ');
               ProgressBar_MontaFicha.StepBy(1);
            end;

            //--- Monta o grafico

            if CheckBox_Grafico.Checked = True then
               BarSeries_Grafico.AddY(StrToCurrDef( FormatFloat('0#.00', PR_Media_Topico[VI_M_Cont]), 0), IBQuery_Topicos.FieldByName('Descricao').AsString, ClRed);

            //----------------------------------coloca os comentarios entre os topicos

            Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select comentario '+
                                                     ' From fa_comentariotopico '+
                                                     ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                     ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                     ' and idficha = '+IBQuery_Itens.FieldByName('IdFicha').AsString+
                                                     ' and idtopico = '+IBQuery_Topicos.FieldByName('IdTopico').AsString+
                                                     ' and Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                                     ' and Disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39
                                );

            VI_Cont:= 0;                                                               // verifica se existe registro no topico
            VS_Cor:= '';

            if CheckBox_Valores.Checked = True then
            begin
               While not DM.IBQuery_Executa.Eof do
               begin
                  if VS_Cor = '' then
                  begin
                     HTML.Add('<br><table border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+' bordercolor='+#39+'#FFFFFF'+#39+' > '+
                              ' <tr><td><b style='+#39+'font-size:12px'+#39+' >COMENTÁRIOS DO TÓPICO: '+Funcoes.AjustarMaiscula(IBQuery_Topicos.FieldByName('Descricao').AsString)+'</b></td></tr></table> ');
                  end;

                  VI_Cont:= VI_Cont+1;

                  if VI_Cont = 0 then
                     VS_Cor:= '#FFFFFF'
                  else
                     VS_Cor:= 'White';

                  HTML.Add('<table width='+#39+'770'+#39+' bgcolor='+#39+VS_Cor+#39+'> '+
                           '      <tr > '+
                           '       <td class='+#39+'style3'+#39+'>&nbsp;'+DM.IBQuery_Executa.FieldByName('Comentario').AsString+' <br/> '+
                           '      </tr> '+
                           '   </table>');
                  ProgressBar_MontaFicha.StepBy(1);

                  //--- coloca os comentarios entre os topicos fim

                  HTML.Add('</div><br>');

                  HTML.Add('<input type='+#39+'hidden'+#39+' size='+#39+'20'+#39+' name='+#39+'contador'+#39+' value='+#39+IntToStr(VI_Contador)+#39+'>');

                  DM.IBQuery_Executa.Next;
                end;
             end;
            IBQuery_Topicos.Next;
         end;

          //---
         //--- Tratamento para imprimir o Grafico

         if CheckBox_Grafico.Checked = True then
         begin
            Chart_Grafico.SaveToBitmapFile(VS_Dir+'\Grafico.bmp');

            BMP := TBitmap.Create;
            BMP.LoadFromFile(VS_Dir+'\Grafico.bmp');

            FJPEG := TJPEGImage.Create;
            FJPEG.Assign( Bmp );
            FJPEG.SaveToFile(VS_Dir+'\Grafico.jpeg');
            FJPEG.Free;

            HTML.Add('<body> '+
                     '    <img src='+#39+VS_Dir+'\Grafico.jpeg'+#39+' width="770" height="280" />'+
                     '</body>');
            ProgressBar_MontaFicha.StepBy(1);
         end;

          //---
         //--- Tratamento dos Comentarios dos alunos

         ComentarioAlunos(HTML, VS_IdModelo, CheckBox_Msg, IBQuery_Itens, IBQuery_Complemento01, IBQuery_Complemento02, ClientDataSet_FA_Avaliacao);

          //>>   verificar a existencia de comentarios nesta etapa
          //---
         //--- Tratamento do comentario de Critica de Aluno

         ComentarioCriticaAluno(HTML, VS_IdModelo, VI_Critica, CheckBox_Msg, IBQuery_Critica, ClientDataSet_FA_Avaliacao);

          //---
         //--- Tratamento do comentario do Instrutor sobre disciplina

         ComentarioInstrutorDisciplina(HTML, VS_IdModelo, CheckBox_Msg, IBQuery_Critica, ClientDataSet_FA_Avaliacao);

          //---
         //--- Tratamento do comentario de Critica de Instrutor

         ComentarioCriticaInstrutor(HTML, VS_IdModelo, VI_Critica, CheckBox_Msg, IBQuery_Critica, ClientDataSet_FA_Avaliacao);

          //---
         //--- Tratamento do comentario do Coordenador sobre intrutor

         ComentarioCoordenadorInstrutor(HTML, CheckBox_Msg, IBQuery_Critica, ClientDataSet_FA_Avaliacao);


          //---
         //--- Tratamento do comentario de Critica do Coordenador

         ComentarioCriticaCoordenador(HTML, VS_IdModelo, VI_Critica, CheckBox_Msg, IBQuery_Critica, ClientDataSet_FA_Avaliacao);

          //---
         //--- Pega o nome do Chefe da Secao de Avaliacao

         Funcoes.ExecutaQuery( DM.IBQuery_Executa,' Select c.Sigla, c.PostoGraduacao, c.descCargo, c.nome '+
                                                  ' From cargo_View c '+
                                                  ' Where c.sigla = '+#39+'EAVC'+#39
                             );

         HTML.Add('<br/><br/><br/><br/><br/><br/>');

         Assinatura(HTML, trim(DM.IBQuery_Executa.FieldByName('nome').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString));
         Assinatura(HTML, trim(DM.IBQuery_Executa.FieldByName('DescCargo').AsString));
         ProgressBar_MontaFicha.StepBy(1);
      end;
   end;

   ProgressBar_MontaFicha.Visible:= False;
   VS_NomeArq:= 'FA_'+Funcoes.GetCodCurso+Funcoes.DePara(TimeToStr(Time), ':', '')+'.html';

   if FileExists(VS_Dir+'\'+VS_NomeArq) then
       DeleteFile(VS_Dir+'\'+VS_NomeArq);


   HTML.SaveToFile(VS_Dir+'\'+VS_NomeArq);
   HTML.Free;

   VS_Dir:= 'file:///C:/Ensino/Tmp/';
   WebBrowser1.Navigate(VS_Dir+VS_NomeArq)
end;


//------------------------------------------------------------------------------
//--- Tratamento do comentario do Coordenador sobre intrutorr
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.ComentarioCoordenadorInstrutor(HTML: TStringList; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);
begin
   if CheckBox_Msg.Checked = True then
   begin
      Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, descdisciplina, Identidade, comentario '+
                                            ' From FA_Comentarios_View '+
                                            ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                            ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                            ' and   IdFicha = 2'
                          );

      if Trim(IBQuery_Critica.FieldByName('Comentario').AsString) <> '' then
      begin
         HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+'  > '+
                  '  <tr>  '+
                  '     <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+' align='+#39+'center'+#39+'> &nbsp; <strong> COMENTÁRIOS DO COORDENADOR SOBRE O INSTRUTOR</strong><br/> '+
                  '  </tr> '+
                  ' </table>');

         While not IBQuery_Critica.Eof do
         begin
            if IBQuery_Critica.FieldByName('Comentario').AsString <> '' then
            begin
               Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select nomeGuerra, PostoGraduacao '+
                                                        ' From pessoa '+
                                                        ' where Identidade = '+#39+IBQuery_Critica.FieldByName('Identidade').AsString+#39
                                    );

               if IBQuery_Critica.FieldByName('Disciplina').AsString <> '000000' then
               begin
                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> '+
                           '   <tr> '+
                           '      <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;Instrutor: '+trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString)+' <br><br> '+
                           '                                            Disciplina - '+trim(IBQuery_Critica.FieldByName('Disciplina').AsString)+' - '+trim(IBQuery_Critica.FieldByName('descdisciplina').AsString)+' <br><br> '+
                           '                                            '+trim(IBQuery_Critica.FieldByName('Comentario').AsString)+'<br/> '+
                           '   </tr> '+
                           ' </table>');
               end
               else
               begin
                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> '+
                           '  <tr> '+
                           '    <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;Coordenador: '+trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString)+' <br> '+
                           '                                           '+trim(IBQuery_Critica.FieldByName('Comentario').AsString)+'<br/> '+
                           '  </tr> '+
                           ' </table>');
               end;
            end;
            IBQuery_Critica.Next
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento do comentario de Critica de Instrutor
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.ComentarioCriticaInstrutor(HTML:TStringList; VS_IdModelo: String; VI_Critica: integer; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);
var
   VS_Disciplina, VS_Docente, VS_Retorno: String;
begin
   if CheckBox_Msg.Checked = True then
   begin
      if VS_IdModelo = '0' then
      begin
         Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, IdInstrutor, comentario '+
                                               ' From FA_CriticaEspontanea '+
                                               ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                               ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                               ' and   Funcao  = '+#39+'INSTRUTOR'+#39
                             );

         VI_Critica:= 1;
         While not IBQuery_Critica.Eof do
         begin
            if IBQuery_Critica.FieldByName('Comentario').AsString <> '' then
            begin
               if VI_Critica = 1 then
               begin
                  HTML.Add('<hr>' );
                  VI_Critica:= 2;
               end;

               if IBQuery_Critica.FieldByName('Disciplina').AsString <> '000000' then
               begin
                  Funcoes.ExecutaQuery( DM.IBQuery_Executa,' Select CodMateria, NomeMateria '+
                                                           ' From MateriaCurso '+
                                                           ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                           ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                           ' and CodMateria = '+#39+IBQuery_Critica.FieldByName('Disciplina').AsString+#39
                                      );
                  VS_Disciplina:= '- Disciplina: '+trim(IBQuery_Critica.FieldByName('Disciplina').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString)+'<br>';
               end;

               if copy(IBQuery_Critica.FieldByName('IdInstrutor').AsString, 0, 6) <> '000000' then
               begin
                  Funcoes.ExecutaQuery( DM.IBQuery_Executa,' Select PostoGraduacao, NomeGuerra '+
                                                           ' From Pessoa '+
                                                           ' where Identidade = '+#39+IBQuery_Critica.FieldByName('IdInstrutor').AsString+#39
                                      );
                  VS_Docente:= '- Docente: '+trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString)+'<br>';
               end;

               VS_Retorno:= trim(IBQuery_Critica.FieldByName('Comentario').AsString);

               HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> '+
                        '  <tr> '+
                        ' <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp; '+VS_Disciplina+' '+VS_Docente+' <br/> '+
                        '                                    '+VS_Retorno+' <br/> '+
                        ' </tr> '+
                        ' </table> ');
            end;
            IBQuery_Critica.Next;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento do comentario do Instrutor sobre disciplina
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.ComentarioInstrutorDisciplina(HTML:TStringList; VS_IdModelo: String; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);
begin
   if CheckBox_Msg.Checked = True then
   begin
      if VS_IdModelo = '0' then
      begin
         Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, descdisciplina, comentario '+
                                               ' From FA_Comentarios_View '+
                                               ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                               ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                               ' and   (IdFicha = 5)'
                             );
         if trim(IBQuery_Critica.FieldByName('Comentario').AsString) <> '' then
         begin
            HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+' > '+
                     '  <tr> '+
                     '     <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+' align='+#39+'center'+#39+'> &nbsp; <strong> COMENTÁRIOS INSTRUTOR </strong><br/> '+
                     '  </tr> '+
                     '</table>');

            While not IBQuery_Critica.Eof do
            begin
               HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> '+
                        ' <tr> '+
                        '          <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;'+trim(IBQuery_Critica.FieldByName('Disciplina').AsString)+' - '+trim(IBQuery_Critica.FieldByName('DESCDISCIPLINA').AsString)+' <br><br> '+
                        '                                               '+trim(IBQuery_Critica.FieldByName('Comentario').AsString)+'<br/> '+
                        ' </tr> '+
                        ' </table>');

               IBQuery_Critica.Next;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento do comentario de Critica de Aluno
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.ComentarioCriticaAluno(HTML:TStringList; VS_IdModelo: String; VI_Critica: integer; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);
var
   VS_Disciplina, VS_Docente, VS_Retorno: String;
begin
   if CheckBox_Msg.Checked = True then
   begin
      if VS_IdModelo = '0' then
      begin
         Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, IdInstrutor, comentario '+
                                               ' From FA_CriticaEspontanea '+
                                               ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                               ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                               ' and   Funcao  = '+#39+'ALUNO'+#39
                             );

         VI_Critica:= 1;
         While not IBQuery_Critica.Eof do
         begin
            if IBQuery_Critica.FieldByName('Comentario').AsString <> '' then
            begin
               if VI_Critica = 1 then
               begin
                  HTML.Add('<hr>' );
                  VI_Critica:= 2;
               end;

               if IBQuery_Critica.FieldByName('Disciplina').AsString <> '000000' then
               begin
                  Funcoes.ExecutaQuery( DM.IBQuery_Executa,' Select CodMateria, NomeMateria '+
                                                           ' From MateriaCurso '+
                                                           ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                           ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                           ' and CodMateria = '+#39+IBQuery_Critica.FieldByName('Disciplina').AsString+#39
                                         );
                  VS_Disciplina:= '- Disciplina: '+trim(IBQuery_Critica.FieldByName('Disciplina').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString)+'<br>';
               end;

               if copy(IBQuery_Critica.FieldByName('IdInstrutor').AsString, 0, 6) <> '000000' then
               begin
                  Funcoes.ExecutaQuery( DM.IBQuery_Executa,' Select PostoGraduacao, NomeGuerra '+
                                                           ' From Pessoa '+
                                                           ' where Identidade = '+#39+IBQuery_Critica.FieldByName('IdInstrutor').AsString+#39
                                      );
                  VS_Docente:= '- Disciplina: '+trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString)+'<br>';
               end;

               VS_Retorno:= trim(IBQuery_Critica.FieldByName('Comentario').AsString);

               HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> '+
                        '  <tr> '+
                        ' <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp; '+VS_Disciplina+' '+VS_Docente+' <br/> '+
                        '                                    '+VS_Retorno+' <br/> '+
                        ' </tr> '+
                        ' </table> ');
            end;
            IBQuery_Critica.Next;
         end;
      end;
   end;

end;

//------------------------------------------------------------------------------
//--- Tratamento dos Comentarios dos alunos
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.ComentarioAlunos(HTML:TStringList; VS_IdModelo: String; CheckBox_Msg: TCheckBox;
                                                    IBQuery_Itens, IBQuery_Complemento01, IBQuery_Complemento02: TIBQuery;
                                                    ClientDataSet_FA_Avaliacao: TClientDataSet);
begin
   if CheckBox_Msg.Checked = True then
   begin
      //--- Tratamento dos Comentarios dos alunos

      if VS_IdModelo = '0' then
      begin
         HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+'  > '+
                  '  <tr> '+
                  '      <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+' align='+#39+'center'+#39+'> &nbsp; <strong> COMENTÁRIOS ALUNOS</strong><br/>'+
                  '  </tr> '+
                  '</table>');

         IBQuery_Complemento01.Open;
         IBQuery_Complemento01.First;
         While not IBQuery_Complemento01.Eof do
         begin
            if VS_IdModelo = '0' then
            begin
               if IBQuery_Complemento01.FieldByName('Disciplina').AsString <> '000000' then    // mostra a disciplina e o instrutor no extrato
               begin
                  ImprimirMsg(HTML, IBQuery_Complemento01.FieldByName('Disciplina').AsString+' - ' +IBQuery_Complemento01.FieldByName('DescDisciplina').AsString+' <br/> ' +
                                    '                    ' +trim(IBQuery_Complemento01.FieldByName('PostoGraduacao').AsString)+' - ' +IBQuery_Complemento01.FieldByName('NomeGuerra').AsString+' <br/>' +
                                    '                    ' +IBQuery_Complemento01.FieldByName('Comentario').AsString );
               end
               else
               begin
                  ImprimirMsg(HTML, IBQuery_Complemento01.FieldByName('Comentario').AsString);
               end;
            end
            else
            begin
               ImprimirMsg(HTML, IBQuery_Complemento01.FieldByName('Comentario').AsString );
            end;
            IBQuery_Complemento01.Next;
         end;
      end
      else
      begin
         Funcoes.ExecutaQuery( IBQuery_Complemento02,'select c.Disciplina, c.descdisciplina, c.comentario '+
                                                     ' From FA_Comentarios_View c '+
                                                     ' where c.IDCURSO =  :IdCurso '+
                                                     ' and c.IDTURMA =  :IdTurma '+
                                                     ' and c.idficha = '+IBQuery_Itens.FieldByName('IdFicha').AsString+
                                                     ' and c.disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39+
                                                     ' and c.identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                                     ' order by c.idcurso, c.idturma, c.idficha '
                                );
         HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+'  > '+
                  ' <tr> '+
                  '   <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+' align='+#39+'center'+#39+'> &nbsp; <strong> COMENTÁRIOS</strong><br/> '+
                  '  </tr> '+
                  '</table>');

         IBQuery_Complemento02.Open;
         IBQuery_Complemento02.First;
         While not IBQuery_Complemento02.Eof do
         begin
            if VS_IdModelo = '0' then
            begin
               if IBQuery_Complemento02.FieldByName('Disciplina').AsString <> '000000' then    // mostra a disciplina e o instrutor no extrato
               begin
                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'>'+
                           '  <tr> '+
                           '    <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;'+ IBQuery_Complemento02.FieldByName('Disciplina').AsString+' - ' +IBQuery_Complemento02.FieldByName('DescDisciplina').AsString+' <br/> ' +
                           '                                            ' +trim(IBQuery_Complemento02.FieldByName('PostoGraduacao').AsString)+' - ' +IBQuery_Complemento02.FieldByName('NomeGuerra').AsString+' <br/>' +
                           '                                            ' +IBQuery_Complemento02.FieldByName('Comentario').AsString+' <br/>' +
                           '  </tr> ' +
                           '</table>' );
               end
               else
               begin
                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> ' +
                           '  <tr> ' +
                           '     <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;' +IBQuery_Complemento02.FieldByName('Comentario').AsString+' <br/> ' +
                           '    </tr> ' +
                           ' </table> ');
               end;
            end
            else
            begin
               HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> ' +
                        '  <tr> ' +
                        '      <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;'+ IBQuery_Complemento02.FieldByName('Comentario').AsString+' <br/> ' +
                        '  </tr> ' +
                        ' </table> ');
            end;

            IBQuery_Complemento02.Next;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento do comentario de Critica do Coordenador
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.ComentarioCriticaCoordenador(HTML:TStringList; VS_IdModelo: String; VI_Critica: integer; CheckBox_Msg: TCheckBox; IBQuery_Critica: TIBQuery; ClientDataSet_FA_Avaliacao: TClientDataSet);
var
   VS_Coordenador, VS_Disciplina, VS_Docente, VS_Retorno: String;
begin
   if CheckBox_Msg.Checked = True then
   begin
      if VS_IdModelo = '0' then
         begin
            Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, IdInstrutor, IdCriticador, comentario '+
                                                  ' From FA_CriticaEspontanea '+
                                                  ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                  ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                  ' and   Funcao  = '+#39+'COORDENADOR'+#39
                                );

            VI_Critica:= 1;
            While not IBQuery_Critica.Eof do
            begin
               if IBQuery_Critica.FieldByName('Comentario').AsString <> '' then
               begin
                  if VI_Critica = 1 then
                  begin
                     HTML.Add('<hr>' );
                     VI_Critica:= 2;
                  end;

                  Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select nomeGuerra, PostoGraduacao '+
                                                           ' From pessoa '+
                                                           ' where Identidade = '+#39+IBQuery_Critica.FieldByName('IdCriticador').AsString+#39
                                      );
                  VS_Coordenador:= trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString);

                  if IBQuery_Critica.FieldByName('Disciplina').AsString <> '000000' then
                  begin
                     Funcoes.ExecutaQuery( DM.IBQuery_Executa,' Select CodMateria, NomeMateria '+
                                                              ' From MateriaCurso '+
                                                              ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                              ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                              ' and   CodMateria = '+#39+IBQuery_Critica.FieldByName('Disciplina').AsString+#39
                                         );
                     VS_Disciplina:= '- Disciplina: '+trim(IBQuery_Critica.FieldByName('Disciplina').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString)+'<br>';
                  end;

                  if copy(IBQuery_Critica.FieldByName('IdInstrutor').AsString,0,6) <> '000000' then
                  begin
                     Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select nomeGuerra, PostoGraduacao '+
                                                              ' From pessoa '+
                                                              ' where Identidade = '+#39+IBQuery_Critica.FieldByName('IdInstrutor').AsString+#39
                                      );
                     VS_Docente:= trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString)
                  end;

                  VS_Retorno:= trim(IBQuery_Critica.FieldByName('Comentario').AsString);

                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> '+
                           '  <tr> '+
                           ' <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;Coordenador '+VS_Coordenador+' <br/> '+
                           ' <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp; '+VS_Disciplina+' '+VS_Docente+' <br/> '+
                           '                                    '+VS_Retorno+' <br/> '+
                           ' </tr> '+
                           ' </table> ');
               end;
               IBQuery_Critica.Next;
            end;
         end;
   end;
end;


//------------------------------------------------------------------------------
// Tratamento da assinatura do Responsavel
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.ImprimirMsg(HTML:TStringList; Texto: String);
begin
   HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> ' +
            '  <tr> ' +
            '     <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;' +Texto+' <br/> ' +
            '    </tr> ' +
            ' </table> ');
end;

//------------------------------------------------------------------------------
// Tratamento da assinatura do Responsavel
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.Assinatura(HTML:TStringList; Texto: String);
begin
   HTML.Add('<table style:border-bottom:1px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
            ' <tr> '+
            '  <td width='+#39+'350'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:12px'+#39+' ></b></div></td> '+
            '  <td width='+#39+'420'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:12px; color:black'+#39+' >'+Texto+'</b></div></td> '+
            '</tr> '+
            '</table> ');
end;

//------------------------------------------------------------
procedure TratarFichaAvalicaoCurso.IBQuery_FichaAvaliacao_AfterScroll(DataSet: TDataSet; IBQuery_FichaAvaliacao: TIBQuery; ProgressBar_Fichas: TProgressBar; ClientDataSet_FA_Avaliacao: TClientDataSet; VB_CorregandoFicha: Boolean);
begin
   if VB_CorregandoFicha = True then
   begin
      LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
      AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para chada do Grafico
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.TratarErroCheckBox(WebBrowser1: TWebBrowser );
var
   HTML:TStringList;

   VS_NomeArq, VS_Dir: String;
begin
   VS_Dir:= 'C:\Ensino\Tmp';
   if not DirectoryExists(VS_Dir) then
       ForceDirectories(VS_Dir);
   VS_Dir := VS_Dir;

   HTML := TSTringList.Create;
   HTML.Clear;

   HTML.Add('<center>');
   HTML.Add('<font size=5>Para montar o relatório é preciso pelo menos uma opção...</font><br/>');
   HTML.Add('</center>');
   HTML.Add('<br/>');

   VS_NomeArq:= 'FA_'+Funcoes.GetCodCurso+'.html';
   HTML.SaveToFile(VS_Dir+'\'+VS_NomeArq);
   HTML.Free;

   VS_Dir:= 'file:///C:/Ensino/Tmp/';
   WebBrowser1.Navigate(VS_Dir+VS_NomeArq)
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar a situacao da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TratarFichaAvalicaoCurso.DBGrid_FichaAvaliacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState; ClientDataSet_FA_Avaliacao: TClientDataSet; DBGrid_FichaAvaliacao: TDBGrid);
begin

   DBGrid_FichaAvaliacao.Canvas.Brush.Color:= clCream;
   if ClientDataSet_FA_Avaliacao.FieldByName('Status').AsString = '' then
      DBGrid_FichaAvaliacao.Canvas.Font.Color:= clBlack
   else
      if ClientDataSet_FA_Avaliacao.FieldByName('Status').AsInteger = 3 then
         DBGrid_FichaAvaliacao.Canvas.Font.Color:= clRed
      else
         DBGrid_FichaAvaliacao.Canvas.Font.Color:= clBlack;



  if gdSelected in State then
    DBGrid_FichaAvaliacao.Canvas.Brush.Color := clSkyBlue;

   DBGrid_FichaAvaliacao.Canvas.FillRect(Rect);
   DBGrid_FichaAvaliacao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

