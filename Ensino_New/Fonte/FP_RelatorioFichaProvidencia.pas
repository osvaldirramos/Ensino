{
    ClientDataSet_FA_Avaliacoes IdCurso: Integer;
    ClientDataSet_FA_Avaliacoes IdTurma: Integer;
    ClientDataSet_FA_Avaliacoes IdFicha: Integer
    ClientDataSet_FA_Avaliacoes Identidade: String (20);
    ClientDataSet_FA_Avaliacoes Disciplina: String (6);
    ClientDataSet_FA_Avaliacoes IdAVL_ICEA: String (20);
    ClientDataSet_FA_Avaliacoes DataAvaliacao: String (10);
    ClientDataSet_FA_Avaliacoes Disponivel: String (1);
    ClientDataSet_FA_Avaliacoes Cabecalho: String (100);
    ClientDataSet_FA_Avaliacoes IdCoordenador: String (20);
    ClientDataSet_FA_Avaliacoes Status: String (1);
    ClientDataSet_FA_Avaliacoes Media: String (5);
}

//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Habilita_FichaAvaliacao.PAS                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da          //
//                             Habilitacao da Avaliaçao de Curso.             //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 15/07/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit FP_RelatorioFichaProvidencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit, Rotinas_Validar,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvTransBtn,
  JvLookOut, OleCtrls, SHDocVw, TeEngine, Series, TeeProcs, Chart, jpeg,
  DBClient;

type
  TForm_FP_RelatorioFichaProvidencia = class(TForm)
    IBQuery_FichaAvaliacao_: TIBQuery;
    DCQ_FichaAvaliacao: TDataSource;
    Panel_WebBrowser: TPanel;
    IBQuery_Disciplina: TIBQuery;
    IBQuery_DisciplinaCODMATERIA: TIBStringField;
    IBQuery_DisciplinaNOMEMATERIA: TIBStringField;
    DSQ_Disciplina: TDataSource;
    IBTable_Instrutor_: TIBTable;
    DST_Instrutor: TDataSource;
    IBTable_Disciplina_: TIBTable;
    DST_Disciplina: TDataSource;
    IBTable_Instrutor_IDENTIDADE: TIBStringField;
    IBTable_Instrutor_NOME: TIBStringField;
    IBTable_Instrutor_NOMEGUERRA: TIBStringField;
    IBTable_Instrutor_POSTOGRADUACAO: TIBStringField;
    IBTable_Disciplina_IDCURSO: TSmallintField;
    IBTable_Disciplina_CODMATERIA: TIBStringField;
    IBTable_Disciplina_NOMEMATERIA: TIBStringField;
    IBQuery_FARelacaoAlunos: TIBQuery;
    DSQ_FARelacaoAlunos: TDataSource;
    IBQuery_Coordenador: TIBQuery;
    DSQ_Coordenador: TDataSource;
    IBQuery_FARelacaoAlunosCODIGOALUNO: TIntegerField;
    IBQuery_FARelacaoAlunosRESPONDEU: TIBStringField;
    IBQuery_FARelacaoAlunosNOMEGUERRA: TIBStringField;
    Panel_TratarFicha: TPanel;
    Panel_Treeviw: TPanel;
    DBGrid_FichaAvaliacao: TDBGrid;
    Panel_Filtro_Fichas: TPanel;
    JvDateEdit_Aplicacao: TJvDateEdit;
    ComboBox_SelFicha: TComboBox;
    Panel_FichasCadastradas: TPanel;
    WebBrowser1: TWebBrowser;
    JvShape5: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape_retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel_Frame_SelCurso: TPanel;
    IBQuery_CoordenadorPOSTOGRADUACAO: TIBStringField;
    IBQuery_CoordenadorNOMEGUERRA: TIBStringField;
    IBQuery_Instrutor: TIBQuery;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    DSQ_Instrutor: TDataSource;
    IBQuery_Topicos: TIBQuery;
    DataSource2: TDataSource;
    IBQuery_Avaliado: TIBQuery;
    DataSource3: TDataSource;
    IBQuery_Itens: TIBQuery;
    DataSource4: TDataSource;
    Chart_Grafico: TChart;
    BarSeries_Grafico: TBarSeries;
    IBQuery_Complemento01: TIBQuery;
    DataSource5: TDataSource;
    IBQuery_Critica: TIBQuery;
    DataSource6: TDataSource;
    IBQuery_FichaAvaliacao_IDCURSO: TSmallintField;
    IBQuery_FichaAvaliacao_IDTURMA: TIntegerField;
    IBQuery_FichaAvaliacao_IDFICHA: TSmallintField;
    IBQuery_FichaAvaliacao_IDENTIDADE: TIBStringField;
    IBQuery_FichaAvaliacao_DISCIPLINA: TIBStringField;
    IBQuery_FichaAvaliacao_DATAAVALIACAO: TDateTimeField;
    IBQuery_FichaAvaliacao_DISPONIVEL: TIBStringField;
    IBQuery_FichaAvaliacao_IDCOORDENADOR: TIBStringField;
    IBQuery_FichaAvaliacao_IDAVL_ICEA: TIBStringField;
    IBQuery_FichaAvaliacao_CABECALHO: TIBStringField;
    IBQuery_FichaAvaliacao_STATUS: TIBStringField;
    IBQuery_FichaAvaliacao_MEDIA: TIBStringField;
    ClientDataSet_FA_Avaliacao: TClientDataSet;
    ClientDataSet_FA_AvaliacaoIdCurso: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdTurma: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdFicha: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdentidade: TStringField;
    ClientDataSet_FA_AvaliacaoDisciplina: TStringField;
    ClientDataSet_FA_AvaliacaoIdAVL_ICEA: TStringField;
    ClientDataSet_FA_AvaliacaodataAvaliacao: TStringField;
    ClientDataSet_FA_Avaliacaodisponivel: TStringField;
    ClientDataSet_FA_Avaliacaocabecalho: TStringField;
    ClientDataSet_FA_Avaliacaoidcoordenador: TStringField;
    ClientDataSet_FA_Avaliacaostatus: TStringField;
    ClientDataSet_FA_Avaliacaomedia: TStringField;
    IBQuery_Complemento02: TIBQuery;
    DataSource1: TDataSource;
    JvShape1: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    DSQ_FichaAvaliacao: TDataSource;


    procedure Assinatura(HTML:TStringList; Texto: String);

    procedure AlimentaComboBox_SelFicha;
    procedure LimpaAvaliacoes;
    procedure AlimentaAvaliacoes;
    procedure Tratar_Ficha;
    procedure Fechar;

    procedure FormActivate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure ComboBox_SelFichaChange(Sender: TObject);
    procedure ClientDataSet_FA_AvaliacaoAfterScroll(DataSet: TDataSet);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure IBQuery_FichaAvaliacao_AfterScroll(DataSet: TDataSet);

   private    { Private declarations }
      VB_CorregandoFicha: Boolean;
   public    { Public declarations }
  end;
var
  Form_FP_RelatorioFichaProvidencia: TForm_FP_RelatorioFichaProvidencia;

implementation

uses Frame_Sel_Curso, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.FormActivate(Sender: TObject);
begin
   VB_CorregandoFicha:= True;
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin

      // Tratamento das janelas utilizadas

//      Panel_FichasCadastradas.Visible:= True;

      Funcoes.SetCadCurso('CadCurso');
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Curso - Habilitar Ficha de Avaliação');    // Abre o perfil do usuario em relacao a agenda

      //--- Abre as tabelas existentes

      IBQuery_Coordenador.Open;
      IBQuery_Instrutor.Open;
      IBQuery_Disciplina.Open;

      IBQuery_FichaAvaliacao_.Open;
      IBQuery_FARelacaoAlunos.Open;

      //--- Tratamento da Selecao dos Cursos

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_FP_RelatorioFichaAvaliacao.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', 'Todos');
      Funcoes.SetCadCurso('CadCurso');
      VB_CorregandoFicha:= False;
      ComboBox_SelFichaChange( Sender );
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento Quando fechar a Form
//--- Fecha as tabelas existentes
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   IBQuery_FichaAvaliacao_.Close;
   IBQuery_Coordenador.Close;
   IBQuery_Coordenador.Close;
   IBQuery_Instrutor.Close;
   IBQuery_Disciplina.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Alimenta o Combobox do filtro da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.AlimentaComboBox_SelFicha;
begin
   Funcoes.OpenQuery(' select distinct m.cabecalho '+
                     ' From FA_Modelo m, FA_Avaliacao a '+
                     ' Where a.IdCurso = :IdCurso'+
                     ' and   a.IdTurma = :IdTurma'+
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

procedure TForm_FP_RelatorioFichaProvidencia.ComboBox_SelFichaChange( Sender: TObject);
var
   VS_Data, VS_Comando: String;
begin
    VS_Comando:= ' Select a.IdCurso, a.IdTurma, a.IdFicha, a.Identidade, a.Disciplina, a.DataAvaliacao, a.Disponivel, a.IdCoordenador, a.IdAvl_ICEA, m.cabecalho, a.Status, a.Media '+
                ' From FA_Modelo m, FA_Avaliacao a '+
                ' Where a.IdCurso = :IdCurso '+
                ' and   a.IdTurma = :IdTurma '+
                ' and   a.IdFicha = m.IdFicha ';

   if ((JvDateEdit_Aplicacao.Text <> '  /  /    ') and (Validar.ValidarData(JvDateEdit_Aplicacao.Text) = True)) then
   begin
         VS_Data:= Funcoes.DePara(JvDateEdit_Aplicacao.Text, '/', '.')+' 00:00';
         VS_Comando:= VS_Comando+' and   a.DataAvaliacao = '+#39+VS_Data+#39;
   end;

   if (ComboBox_SelFicha.Text <> '') then
      VS_Comando:= VS_Comando+' and  m.cabecalho like '+#39+ComboBox_SelFicha.Text+'%'+#39;

   VS_Comando:= VS_Comando+' order by a.IdFicha, m.cabecalho, a.DataAvaliacao desc ';

   Funcoes.ExecutaQuery( IBQuery_FichaAvaliacao_, VS_Comando);
   AlimentaComboBox_SelFicha;
end;

//------------------------------------------------------------------------------
// Tratamento da atualizacao da lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_FichaAvaliacao_);
end;


//------------------------------------------------------------------------------
// Tratamento do botao cancela Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.Fechar;
begin
   Funcoes.AtualizaQuery(IBQuery_FichaAvaliacao_);
   DBGrid_FichaAvaliacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Alimenta a lista de Avaliacoes
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.AlimentaAvaliacoes;
begin
   ClientDataSet_FA_Avaliacao.Open;
   VB_CorregandoFicha:= True;

   IBQuery_FichaAvaliacao_.First;
   While not IBQuery_FichaAvaliacao_.eof do
   begin
      if IBQuery_FichaAvaliacao_.FieldByName('IdFicha').Asinteger = 1 then
      begin
         ClientDataSet_FA_Avaliacao.Append;
         ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDCURSO').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDTURMA').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString:= '0';
         ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDENTIDADE').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString:= IBQuery_FichaAvaliacao_.FieldByName('DISCIPLINA').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('IdAVL_ICEA').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDAVL_ICEA').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString:= IBQuery_FichaAvaliacao_.FieldByName('DATAAVALIACAO').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('Disponivel').AsString:= IBQuery_FichaAvaliacao_.FieldByName('DISPONIVEL').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('IdCoordenador').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDCOORDENADOR').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString:=  'EXTRATO CURSO';
         ClientDataSet_FA_Avaliacao.FieldByName('Status').AsString:=  IBQuery_FichaAvaliacao_.FieldByName('STATUS').AsString;
         ClientDataSet_FA_Avaliacao.FieldByName('Media').AsString:= IBQuery_FichaAvaliacao_.FieldByName('MEDIA').AsString;
         ClientDataSet_FA_Avaliacao.Post;
      end;

      ClientDataSet_FA_Avaliacao.Append;
      ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDCURSO').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDTURMA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDFICHA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDENTIDADE').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString:= IBQuery_FichaAvaliacao_.FieldByName('DISCIPLINA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdAVL_ICEA').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDAVL_ICEA').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString:= IBQuery_FichaAvaliacao_.FieldByName('DATAAVALIACAO').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Disponivel').AsString:= IBQuery_FichaAvaliacao_.FieldByName('DISPONIVEL').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('IdCoordenador').AsString:= IBQuery_FichaAvaliacao_.FieldByName('IDCOORDENADOR').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Cabecalho').AsString:=  IBQuery_FichaAvaliacao_.FieldByName('CABECALHO').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Status').AsString:=  IBQuery_FichaAvaliacao_.FieldByName('STATUS').AsString;
      ClientDataSet_FA_Avaliacao.FieldByName('Media').AsString:= IBQuery_FichaAvaliacao_.FieldByName('MEDIA').AsString;
      ClientDataSet_FA_Avaliacao.Post;

      IBQuery_FichaAvaliacao_.Next;
   end;
   VB_CorregandoFicha:= False;
   ClientDataSet_FA_Avaliacao.First;
end;

//------------------------------------------------------------------------------
// Limpa a lista de Avaliacoes
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.LimpaAvaliacoes;
begin
   ClientDataSet_FA_Avaliacao.First;
   While not ClientDataSet_FA_Avaliacao.eof do
      ClientDataSet_FA_Avaliacao.Delete;
end;


//------------------------------------------------------------------------------
// Tratamento para montar a ficha de avalicao
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.Tratar_Ficha;
var
   HTML:TStringList;

   VS_IdModelo, VS_Cor, VS_Media_ajust, VS_Comando, VS_IdCurso, VS_IdTurma, VS_IdFicha: String;
   VS_NomeArq, VS_Dir, VS_Coordenador, VS_Disciplina, VS_Docente, VS_Retorno: String;

   VI_Cont, VI_m_cont, VI_Contador, VI_Avaliadores, VI_Cont_respondido: Integer;
   VI_Critica: Integer;

   VI_soma_media, VI_Media, VI_m1, VI_m2, VI_m3, VI_m4, VI_m5, VI_TotalRep, VI_01, VI_02, VI_03, VI_04, VI_05, VI_NO: Real;

   PR_media_topico: Array[1..10] of Real;
   Bmp : TBitmap;
   FJPEG:TJPEGImage;
begin
   BarSeries_Grafico.Clear;

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

   HTML := TSTringList.Create;
   HTML.Clear;
   //---
   // Inicia o processamento

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

       //---
      //Pega a Identificacao do Curso

      Funcoes.ExecutaQuery( DM.IBQuery_Executa,'Select IdCurso, CodCurso, NomeCurso From Curso where codcurso = '+#39+Funcoes.GetCodCurso+#39 );

      HTML.Add('<hr size='+#39+'1'+#39+'/>');
      HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
               '   <tr> '+
               '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Nome do curso: <b >'+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' -  '+DM.IBQuery_Executa.FieldByName('NomeCurso').AsString+'</b></div></td> '+
               '   </tr> '+
               '</table> ');

      HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
               '   <tr> '+
               '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Turma: <b >'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' de '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+'</b></div></td> '+
               '   </tr> '+
               '</table> ');

      HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
               ' <tr> '+
               '  <td width='+#39+'650'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px'+#39+' >'+'Período: '+DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString+' a '+DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString+'</b></div></td> '+
               '  <td width='+#39+'200'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >Data Avaliação: '+ClientDataSet_FA_Avaliacao.FieldByName('DataAvaliacao').AsString+'</b></div></td> '+
               '</tr> '+
               '</table> ');

      if ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 2 then
      begin
         HTML.Add('<div><table> '+
                  '        <tr> '+
                  '          <td width='+#39+'570'+#39+'style='+#39+'font-size:12px'+#39+'>Coordenador: <b style='+#39+'font-size:11px'+#39+'>'+IBQuery_Coordenador.FieldByName('PostoGraduacao').AsString+' '+IBQuery_Coordenador.FieldByName('NomeGuerra').AsString+'</b></td> '+
                  '        </tr> '+
                  '        <tr> '+
                  '          <td width='+#39+'570'+#39+'style='+#39+'font-size:12px'+#39+'>Instrutor Avaliado: <b style='+#39+'font-size:11px'+#39+'>'+IBQuery_Instrutor.FieldByName('PostoGraduacao').AsString+' '+IBQuery_Instrutor.FieldByName('NomeGuerra').AsString+'</b></td> '+
                  '        </tr> '+
                  '     </table> '+
                  '<div/><br>');
      end
      else
      begin
         if ClientDataSet_FA_Avaliacao.FieldByName('IdFicha').AsInteger = 5 then
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
                        '      <td width='+#39+'820'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >'+'Número de questionarios respondidos:  <b >'+IntToStr(VI_Cont_respondido)+'</b></div></td> '+
                        '   </tr> '+
                        '</table> ');
         end;
      end;

      //  LimpaGrafico($conexao);

       //--- Tratamento das perguntas
      //faz select para montar questionario

      HTML.Add('<hr size='+#39+'1'+#39+'/>');

      HTML.Add('Os valores de avaliação correspondem aos seguintes conceitos:');
      HTML.Add('<br><br>');
      HTML.Add('N/O-Não Observado  | 1-Ruim  |   2-Regular  |   3-Bom  |   4-Ótimo | 5-Excelente  ');
      HTML.Add('<br>');

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

         Funcoes.ExecutaQuery(IBQuery_Itens, ' Select * '+
                                             ' From FA_Itens '+
                                             ' where IdFicha = '+VS_IdFicha+
                                             ' and   IdTopico = '+IBQuery_Topicos.FieldByName('IdTopico').AsString+
                                             ' order by IdFicha, IdTopico, IdItem '
                             );
         HTML.Add('<div id='+IBQuery_Topicos.FieldByName('Descricao').AsString+'>');

         While not IBQuery_Itens.Eof do
         begin
            VI_M_cont:= VI_M_cont + 1;

            Funcoes.ExecutaQuery( DM.IBQuery_Executa,'select count (1) qtd '+
                                                     ' From Fa_Resposta '+
                                                     ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                     ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                     ' and idficha = '+IBQuery_Itens.FieldByName('IdFicha').AsString+
                                                     ' and idtopico = '+IBQuery_Itens.FieldByName('IdTopico').AsString+
                                                     ' and iditem = '+IBQuery_Itens.FieldByName('IdItem').AsString+
                                                     ' and Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                                     ' and Disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39+
                                                     ' and resposta <> '+#39+'0'+#39
                                );

            VI_TotalRep:= DM.IBQuery_Executa.FieldByName('qtd').AsInteger;

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
                                                     ' and idtopico = '+IBQuery_Itens.FieldByName('IdTopico').AsString+
                                                     ' and iditem = '+IBQuery_Itens.FieldByName('IdItem').AsString+
                                                     ' and Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                                     ' and Disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39
                                );

            While not DM.IBQuery_Executa.Eof do
            begin
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


            IBQuery_Itens.Next
         end;

         PR_Media_Topico[VI_M_Cont]:= VI_Soma_media / VI_M_Cont;

         HTML.Add('<table style:border-bottom:1px solid #ccc; border='+#39+'1'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
                   ' <tr> '+
                   '  <td width='+#39+'760'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:12px'+#39+' >Média do Tópico</b></div></td> '+
                   '  <td width='+#39+'40'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:12px; color:red'+#39+' >'+FormatFloat('##.00', PR_Media_Topico[VI_M_Cont])+'</b></div></td> '+
                   '</tr> '+
                   '</table> ');

         //--- Monta o grafico

         BarSeries_Grafico.AddY(StrToCurrDef( FormatFloat('0#.00', PR_Media_Topico[VI_M_Cont]), 0), IBQuery_Topicos.FieldByName('Descricao').AsString, ClRed);

         //----------------------------------coloca os comentarios entre os topicos

         Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select comentario '+
                                                  ' From fa_comentariotopico '+
                                                  ' where IdCurso= '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                  ' and IdTurma = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                  ' and idficha = '+IBQuery_Itens.FieldByName('IdFicha').AsString+
                                                  ' and idtopico = '+IBQuery_Itens.FieldByName('IdTopico').AsString+
                                                  ' and Identidade = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Identidade').AsString+#39+
                                                  ' and Disciplina = '+#39+ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString+#39
                             );

         VI_Cont:= 0;                                                               // verifica se existe registro no topico
         VS_Cor:= '';

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

            //----------------------------------------coloca os comentarios entre os topicos fim

            HTML.Add('</div><br>');

            HTML.Add('<input type='+#39+'hidden'+#39+' size='+#39+'20'+#39+' name='+#39+'contador'+#39+' value='+#39+IntToStr(VI_Contador)+#39+'>');

            DM.IBQuery_Executa.Next;
          end;
         IBQuery_Topicos.Next;
      end;

       //---
      //--- Tratamento para imprimir o Grafico

      VS_Dir:= 'C:\Ensino\Tmp';
      if not DirectoryExists(VS_Dir) then
          ForceDirectories(VS_Dir);
      VS_Dir := VS_Dir;


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

       //---
      //--- Tratamento dos Comentarios dos alunos

      if VS_IdModelo = '0' then
      begin
         HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+'  > '+
                  '  <tr> '+
                  '      <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+' align='+#39+'center'+#39+'> &nbsp; <strong> COMENTÁRIOS ALUNOS</strong><br/>'+
                  '  </tr> '+
                  '</table>');

         While not IBQuery_Complemento01.Eof do
         begin
            if VS_IdModelo = '0' then
            begin
               if ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString <> '000000' then    // mostra a disciplina e o instrutor no extrato
               begin
                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'>'+
                           '  <tr> '+
                           '    <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;'+ IBQuery_Complemento01.FieldByName('Disciplina').AsString+' - ' +IBQuery_Complemento01.FieldByName('DescDisciplina').AsString+' <br/> ' +
                           '                                            ' +trim(IBQuery_Complemento01.FieldByName('PostoGraduacao').AsString)+' - ' +IBQuery_Complemento01.FieldByName('NomeGuerra').AsString+' <br/>' +
                           '                                            ' +IBQuery_Complemento01.FieldByName('Comentario').AsString+' <br/>' +
                           '  </tr> ' +
                           '</table>' );
               end
               else
               begin
                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> ' +
                           '  <tr> ' +
                           '     <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;' +IBQuery_Complemento01.FieldByName('Comentario').AsString+' <br/> ' +
                           '    </tr> ' +
                           ' </table> ');
               end;
            end
            else
            begin
               HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> ' +
                        '  <tr> ' +
                        '      <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;'+ IBQuery_Complemento01.FieldByName('Comentario').AsString+' <br/> ' +
                        '  </tr> ' +
                        ' </table> ');
            end;

            IBQuery_Complemento01.Next;
         end;
      end
      else
      begin
         Funcoes.ExecutaQuery( IBQuery_Complemento02,'select c.Disciplina, c.descdisciplina, c.comentario '+
                                                  ' From FA_Comentario_View c '+
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

         While not IBQuery_Complemento02.Eof do
         begin
            if VS_IdModelo = '0' then
            begin
               if ClientDataSet_FA_Avaliacao.FieldByName('Disciplina').AsString <> '000000' then    // mostra a disciplina e o instrutor no extrato
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

       //>>   verificar a existencia de comentarios nesta etapa
      //>>

       //---
      //--- Tratamento do comentario de Critica de Aluno

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

       //---
      //--- Tratamento do comentario do Instrutor sobre disciplina

      if VS_IdModelo = '0' then
      begin
         Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, descdisciplina, comentario '+
                                               ' From FA_Comentario_View '+
                                               ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                               ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                               ' and   (IdFicha = 5)'
                             );

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


       //---
      //--- Tratamento do comentario de Critica de Instrutor

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

       //---
      //--- Tratamento do comentario do Coordenador sobre intrutor

      Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, descdisciplina, Identidade, comentario '+
                                                 ' From FA_Comentario_View '+
                                                 ' where IDCURSO = '+ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString+
                                                 ' and   IDTURMA = '+ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString+
                                                 ' and   IdFicha = 2'
                             );

      if IBQuery_Critica.FieldByName('Comentario').AsString <> '' then
      begin
         HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+' bgcolor='+#39+'#cccccc'+#39+'  > '+
                  '  <tr>  '+
                  '     <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+' align='+#39+'center'+#39+'> &nbsp; <strong> COMENTÁRIOS DO COORDENADOR SOBRE O INSTRUTOR</strong><br/> '+
                  '  </tr> '+
                  ' </table>');
      end;

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
                        '                                            Disciplina - '+trim(IBQuery_Critica.FieldByName('Disciplina').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('descdisciplina').AsString)+' <br><br> '+
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

       //---
      //--- Tratamento do comentario de Critica do Coordenador

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

       //---
      //--- Pega o nome do Chefe da Secao de Avaliacao

      Funcoes.ExecutaQuery( DM.IBQuery_Executa,' Select c.Sigla, c.PostoGraduacao, c.descCargo, c.nome '+
                                               ' From cargo_View c '+
                                               ' Where c.sigla = '+#39+'EAVC'+#39
                          );

      HTML.Add('<br/><br/><br/><br/><br/><br/>');

      Assinatura(HTML, trim(DM.IBQuery_Executa.FieldByName('nome').AsString)+' - '+trim(DM.IBQuery_Executa.FieldByName('PostoGraduacao').AsString));
      Assinatura(HTML, trim(DM.IBQuery_Executa.FieldByName('DescCargo').AsString));
   end;

   VS_NomeArq:= 'TesteWebDelphi.html';
   HTML.SaveToFile(VS_Dir+'\TesteWebDelphi.html');
   HTML.Free;

   VS_Dir:= 'file:///C:/Ensino/Tmp/';
   WebBrowser1.Navigate(VS_Dir+'TesteWebDelphi.html')
end;

//------------------------------------------------------------------------------
// Tratamento da assinatura do Responsavel
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.Assinatura(HTML:TStringList; Texto: String);
begin
   HTML.Add('<table style:border-bottom:1px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
            ' <tr> '+
            '  <td width='+#39+'350'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:12px'+#39+' ></b></div></td> '+
            '  <td width='+#39+'420'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:12px; color:black'+#39+' >'+Texto+'</b></div></td> '+
            '</tr> '+
            '</table> ');
end;


//------------------------------------------------------------------------------
// Tratamento para imprimir a ficha
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.JvTransparentButton_ImprimirClick(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin
    WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a ficha para ser montada
//------------------------------------------------------------------------------

procedure TForm_FP_RelatorioFichaProvidencia.ClientDataSet_FA_AvaliacaoAfterScroll(DataSet: TDataSet);
begin
  if ClientDataSet_FA_Avaliacao.FieldByName('IdTurma').AsString <> '' then
     Tratar_Ficha;
end;


procedure TForm_FP_RelatorioFichaProvidencia.IBQuery_FichaAvaliacao_AfterScroll(DataSet: TDataSet);
begin
   if VB_CorregandoFicha = False then
   begin
      LimpaAvaliacoes;
      AlimentaAvaliacoes;
   end;
end;


end.

