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

unit FA_RelatorioFichaAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus,  ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit, Rotinas_Validar,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvTransBtn,
  JvLookOut, OleCtrls, SHDocVw, TeEngine, Series, DBClient, TeeProcs, Chart, Jpeg,
  Rotinas, Rotinas_SUE, FichaAvalicaoCurso;

type
  TForm_FA_RelatorioFichaAvaliacao = class(TForm)
    IBQuery_FichaAvaliacao: TIBQuery;
    DCQ_FichaAvaliacao: TDataSource;
    Panel_WebBrowser: TPanel;
    IBQuery_Disciplina: TIBQuery;
    IBQuery_DisciplinaCODMATERIA: TIBStringField;
    IBQuery_DisciplinaNOMEMATERIA: TIBStringField;
    DSQ_Disciplina: TDataSource;
    IBQuery_FARelacaoAlunos: TIBQuery;
    DSQ_FARelacaoAlunos: TDataSource;
    IBQuery_Coordenador: TIBQuery;
    DSQ_Coordenador: TDataSource;
    IBQuery_FARelacaoAlunosCODIGOALUNO: TIntegerField;
    IBQuery_FARelacaoAlunosRESPONDEU: TIBStringField;
    IBQuery_FARelacaoAlunosNOMEGUERRA: TIBStringField;
    Panel_TratarFicha: TPanel;
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
    IBQuery_Avaliado: TIBQuery;
    IBQuery_Itens: TIBQuery;
    IBQuery_Complemento01: TIBQuery;
    IBQuery_Critica: TIBQuery;
    IBQuery_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FichaAvaliacaoIDFICHA: TSmallintField;
    IBQuery_FichaAvaliacaoIDENTIDADE: TIBStringField;
    IBQuery_FichaAvaliacaoDISCIPLINA: TIBStringField;
    IBQuery_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;
    IBQuery_FichaAvaliacaoDISPONIVEL: TIBStringField;
    IBQuery_FichaAvaliacaoIDCOORDENADOR: TIBStringField;
    IBQuery_FichaAvaliacaoIDAVL_ICEA: TIBStringField;
    IBQuery_FichaAvaliacaoCABECALHO: TIBStringField;
    IBQuery_FichaAvaliacaoSTATUS: TIBStringField;
    IBQuery_FichaAvaliacaoMEDIA: TIBStringField;
    IBQuery_Complemento02: TIBQuery;
    JvShape1: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    DSQ_FichaAvaliacao: TDataSource;
    Chart_Grafico: TChart;
    BarSeries_Grafico: TBarSeries;
    ProgressBar_MontaFicha: TProgressBar;
    ProgressBar_Fichas: TProgressBar;
    CheckBox_Valores: TCheckBox;
    CheckBox_Grafico: TCheckBox;
    CheckBox_Msg: TCheckBox;
    Label_Completa: TLabel;
    Label1: TLabel;
    ClientDataSet_FA_Avaliacao: TClientDataSet;
    ClientDataSet_FA_AvaliacaoIdCurso: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdTurma: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdFicha: TIntegerField;
    ClientDataSet_FA_AvaliacaoIdentidade: TStringField;
    ClientDataSet_FA_AvaliacaoDisciplina: TStringField;
    ClientDataSet_FA_AvaliacaoIdAVL_ICEA: TStringField;
    ClientDataSet_FA_AvaliacaoDataAvaliacao: TStringField;
    ClientDataSet_FA_AvaliacaoDisponivel: TStringField;
    ClientDataSet_FA_AvaliacaoCabecalho: TStringField;
    ClientDataSet_FA_AvaliacaoDesc_Cabecalho: TStringField;
    ClientDataSet_FA_AvaliacaoIdCoordenador: TStringField;
    ClientDataSet_FA_AvaliacaoStatus: TStringField;
    ClientDataSet_FA_AvaliacaoMedia: TStringField;

    procedure FormActivate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure ComboBox_SelFichaChange(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure IBQuery_FichaAvaliacaoAfterScroll(DataSet: TDataSet);
    procedure CheckBox_GraficoClick(Sender: TObject);
    procedure DBGrid_FichaAvaliacaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ClientDataSet_FA_AvaliacaoAfterScroll(DataSet: TDataSet);

   private    { Private declarations }
      VB_TratarFicha, VB_CorregandoFicha: Boolean;
   public    { Public declarations }
  end;
var
  Form_FA_RelatorioFichaAvaliacao: TForm_FA_RelatorioFichaAvaliacao;

implementation

uses Frame_Sel_Curso, Module, FA_Relatorio;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.FormActivate(Sender: TObject);
begin
   ProgressBar_MontaFicha.Visible:= False;
   ProgressBar_Fichas.Visible:= False;
   VB_TratarFicha:= False;
   VB_CorregandoFicha:= False;
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin

      // Tratamento das janelas utilizadas

      Funcoes.SetCadCurso('CadCurso');
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Fichas Avaliação - Resultados Avaliação');    // Abre o perfil do usuario em relacao a agenda

      //--- Tratamento da Selecao dos Cursos

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_FA_RelatorioFichaAvaliacao.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', 'Todos');
      Funcoes.SetCadCurso('CadCurso');
      ComboBox_SelFichaChange( Sender );

      //--- Abre as tabelas existentes

      IBQuery_Coordenador.Open;
      IBQuery_Instrutor.Open;
      IBQuery_Disciplina.Open;

      IBQuery_FichaAvaliacao.Open;
      IBQuery_FARelacaoAlunos.Open;

      //--- Tratamento para alimentar a lista de fichas avaliadas

      Funcoes_FichaAvalicaoCurso.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
      Funcoes_FichaAvalicaoCurso.AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
      Funcoes_FichaAvalicaoCurso.AlimentaComboBox_SelFicha(ComboBox_SelFicha, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);

      //--- Tratamento para montar a Ficga Avaliada

      VB_TratarFicha:= True;
      VB_CorregandoFicha:= True;
      Funcoes_FichaAvalicaoCurso.Tratar_Ficha(WebBrowser1, Chart_Grafico, CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores, ProgressBar_MontaFicha, ClientDataSet_FA_Avaliacao, BarSeries_Grafico,
                IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Itens, IBQuery_Topicos, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento Quando fechar a Form
//--- Fecha as tabelas existentes
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   IBQuery_FichaAvaliacao.Close;
   IBQuery_Coordenador.Close;
   IBQuery_Coordenador.Close;
   IBQuery_Instrutor.Close;
   IBQuery_Disciplina.Close;

   IBQuery_Coordenador.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de Fichas a serem avaliadas
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.ComboBox_SelFichaChange( Sender: TObject);
begin
   VB_CorregandoFicha:= False;
   Funcoes_FichaAvalicaoCurso.ComboBox_SelFichaChange( JvDateEdit_Aplicacao, ComboBox_SelFicha, IBQuery_FichaAvaliacao, DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);
   Funcoes_FichaAvalicaoCurso.LimpaAvaliacoes(ClientDataSet_FA_Avaliacao);
   Funcoes_FichaAvalicaoCurso.AlimentaAvaliacoes(IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao);
   if VB_TratarFicha = True then
      VB_CorregandoFicha:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da atualizacao da lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes_FichaAvalicaoCurso.Atualizar(VB_CorregandoFicha, WebBrowser1, Chart_Grafico, CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores,
                                        IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Topicos, IBQuery_Itens, IBQuery_FichaAvaliacao, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador,
                                        ProgressBar_Fichas, ProgressBar_MontaFicha, ClientDataSet_FA_Avaliacao, BarSeries_Grafico);
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a ficha
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.JvTransparentButton_ImprimirClick(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin
    WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a ficha para ser montada
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.ClientDataSet_FA_AvaliacaoAfterScroll(DataSet: TDataSet);
var
   Sender: TObject;
begin
   if VB_CorregandoFicha = True then
   begin
      if ClientDataSet_FA_Avaliacao.FieldByName('IdCurso').AsString = '' then
          VB_CorregandoFicha:= False;

      CheckBox_GraficoClick(Sender);
   end;
end;

//------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.IBQuery_FichaAvaliacaoAfterScroll(DataSet: TDataSet);
begin
   Funcoes_FichaAvalicaoCurso.IBQuery_FichaAvaliacao_AfterScroll(DataSet, IBQuery_FichaAvaliacao, ProgressBar_Fichas, ClientDataSet_FA_Avaliacao, VB_CorregandoFicha);
end;

//------------------------------------------------------------------------------
// Tratamento para chamada do Grafico
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.CheckBox_GraficoClick(Sender: TObject);
begin
   if ((CheckBox_Valores.Checked = False) and (CheckBox_Grafico.Checked = False) and (CheckBox_Msg.Checked = False)) Then
      Funcoes_FichaAvalicaoCurso.TratarErroCheckBox( WebBrowser1 )
   else
      Funcoes_FichaAvalicaoCurso.Tratar_Ficha(WebBrowser1, Chart_Grafico, CheckBox_Msg, CheckBox_Grafico, CheckBox_Valores, ProgressBar_MontaFicha, ClientDataSet_FA_Avaliacao, BarSeries_Grafico,
                IBQuery_Complemento01, IBQuery_Complemento02, IBQuery_Critica, IBQuery_Itens, IBQuery_Topicos, IBQuery_Disciplina, IBQuery_Instrutor, IBQuery_Coordenador);
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar a classificacao da Ficha
//------------------------------------------------------------------------------

procedure TForm_FA_RelatorioFichaAvaliacao.DBGrid_FichaAvaliacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes_FichaAvalicaoCurso.DBGrid_FichaAvaliacaoDrawColumnCell(Sender, Rect, DataCol, Column, State, ClientDataSet_FA_Avaliacao, DBGrid_FichaAvaliacao,);
end;

end.

