//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Providencia.pas                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da          //
//                             das providencias da turma.                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          :         a                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/09/2017                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Providencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit, Rotinas_Validar,
  Rotinas_Tratar_Providencia, JvGradient, JvComponent, JvArrow, JvCaptionPanel,
  JvRichEd, JvDBRichEd, JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle,
  JvEnterTab, JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvTransBtn,
  JvLookOut, OleCtrls, SHDocVw, TeEngine, Series, TeeProcs, Chart, jpeg, DBClient;
  

type
  TForm_Cad_Providencia = class(TForm)
    IBQuery_FichaAvaliacao: TIBQuery;
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
    DSQ_Complemento01: TDataSource;
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
    IBQuery_Complemento02_: TIBQuery;
    DSQ_FichaAvaliacao: TDataSource;
    IBTable_Providencia: TIBTable;
    DST_Providencia: TDataSource;
    IBQuery_Providencia: TIBQuery;
    DSQ_Providencia: TDataSource;
    Panel_TratarProvidencia: TPanel;
    GroupBox_AcaoExecutada: TGroupBox;
    Label_PorAcaoExecutada: TLabel;
    Label_DataAcao_Executada: TLabel;
    GroupBox_AcaoRecomendada: TGroupBox;
    Label_Por: TLabel;
    Label_DataAcaoRecomendada: TLabel;
    IBTable_ProvidenciaIDCURSO: TSmallintField;
    IBTable_ProvidenciaIDTURMA: TIntegerField;
    IBTable_ProvidenciaIDSECAO: TIntegerField;
    IBTable_ProvidenciaREC_DATA: TDateTimeField;
    IBTable_ProvidenciaREC_RESPONSAVEL: TIBStringField;
    IBTable_ProvidenciaREC_ACAO: TIBStringField;
    IBTable_ProvidenciaEXEC_DATA: TDateTimeField;
    IBTable_ProvidenciaEXEC_RESPONSAVEL: TIBStringField;
    IBTable_ProvidenciaEXEC_ACAO: TIBStringField;
    IBQuery_ProvidenciaIDCURSO: TSmallintField;
    IBQuery_ProvidenciaIDTURMA: TIntegerField;
    IBQuery_ProvidenciaIDSECAO: TIntegerField;
    IBQuery_ProvidenciaSIGLA: TIBStringField;
    IBQuery_ProvidenciaDESCRICAO: TIBStringField;
    IBQuery_ProvidenciaREC_DATA: TDateTimeField;
    IBQuery_ProvidenciaREC_RESPONSAVEL: TIBStringField;
    IBQuery_ProvidenciaEXEC_DATA: TDateTimeField;
    IBQuery_ProvidenciaEXEC_RESPONSAVEL: TIBStringField;
    Label_Secao_Acao_Recomendada: TLabel;
    ComboBox_Secao: TComboBox;
    DBEdit_Rec_Responsavel: TDBEdit;
    DBEdit_Rec_Data: TDBEdit;
    DBEdit_Exec_Responsavel: TDBEdit;
    DBEdit_Exec_Data: TDBEdit;
    Panel_AcaoRecomendada: TPanel;
    DBRichEdit_AcaoRecomendada: TDBRichEdit;
    Panel_AcaoExecutada: TPanel;
    DBRichEdit_AcaoExecutada: TDBRichEdit;
    PopupMenu_Acao: TPopupMenu;
    Colar1: TMenuItem;
    Splitter1: TSplitter;
    IBQuery_ProvidenciaRAMAL: TIBStringField;
    Panel_Botoes: TPanel;
    JvShape_Inserir: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape_Excluir: TJvShape;
    JvTransparentButton_Excluir: TJvTransparentButton;
    JvShape_Alterar: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    Chart_Grafico: TChart;
    BarSeries_Grafico: TBarSeries;
    Memo1: TMemo;
    Memo_MsgNaoPossuiDisciplina: TMemo;
    Panel_Principal: TPanel;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Panel_RelacaoProvidencia: TPanel;
    Panel_SelProvidencia: TPanel;
    Panel_CabecalhoProvidencia: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label_AcaoRecomendada: TLabel;
    Label_AcaoExecutada: TLabel;
    Label_Secao: TLabel;
    Panel_Limpo: TPanel;
    DBGrid_Providencia: TDBGrid;
    Splitter2: TSplitter;
    Panel_Botoes2: TPanel;
    JvShape_retornar: TJvShape;
    JvShape_Imprimir: TJvShape;
    JvShape_Windows: TJvShape;
    JvShape_Atualizar: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel_SelCurso: TPanel;
    JvGradient1: TJvGradient;
    Label_CodCurso: TLabel;
    Label_Turma: TLabel;
    Label_Presencial: TLabel;
    Label_Termino: TLabel;
    Label_Local1: TLabel;
    Label_SemiPresencial: TLabel;
    Label_Inicio: TLabel;
    DBEdit_Inicio: TDBEdit;
    DBEdit_Termino: TDBEdit;
    DBEdit_Local1: TDBEdit;
    DBEdit_InicioDist: TDBEdit;
    DBEdit_TerminoDist: TDBEdit;
    DBEdit_Local2: TDBEdit;
    Edit_Turma: TEdit;
    Edit_Curso: TEdit;
    Panel_ExtratoCurso: TPanel;
    WebBrowser_ExtratoCurso: TWebBrowser;
    JvShape_Disponibilizar: TJvShape;
    JvTransparentButton_DisponibilizaProvidencia: TJvTransparentButton;
    JvShape_Retornar_Exec: TJvShape;
    JvShape_Windows_Exec: TJvShape;
    JvTransparentButton_Retornar_Exec: TJvTransparentButton;
    JvTransparentButton_Windows_Exec: TJvTransparentButton;
    IBTable_ProvidenciaGRUPO: TIntegerField;

    Function EnterParaBr(Texto: String): String;

    procedure NaoPossuiProvidencia;
    procedure TratarAcao(HTML:TStringList; Acao: String);
    procedure PreenchidoPor(HTML:TStringList; Responsavel, Data: String);
    procedure TratarCabecalhoAcao(HTML:TStringList; Cabecalho: String);

    procedure CamposAcaoRecomendada(Cor: TColor);
    procedure CamposAcaoExecutada(Cor: TColor);
    procedure TratarAbasProvidencia(Status: boolean);
    procedure TratarTurmaSemiPresencial(Status: Boolean);
    procedure TratarCampos(Status: Boolean);

    procedure TratarBotoes(Status: Boolean);
    procedure TratarVisibilidadeBotoes(Status: boolean);

    procedure Msg_Erro_Pagina(HTML:TStringList; Msg: String);
    procedure Assinatura(HTML:TStringList; Texto: String);

    procedure Tratar_Ficha;
    procedure Fechar;

    procedure FormActivate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure ClientDataSet_FA_AvaliacaoAfterScroll(DataSet: TDataSet);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure ComboBox_SecaoChange(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluirClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure IBQuery_ProvidenciaAfterScroll(DataSet: TDataSet);
    procedure IBTable_ProvidenciaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure DBGrid_ProvidenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Colar1Click(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_DisponibilizaProvidenciaClick(
      Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);

   private    { Private declarations }
      VS_Opcao, VS_IdSecao: String;
      VB_CorregandoFicha: Boolean;
   public    { Public declarations }
  end;
var
  Form_Cad_Providencia: TForm_Cad_Providencia;

implementation

uses Frame_Sel_Curso, Module, MenuPrincipal, Rel_EAC, lixo;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.FormActivate(Sender: TObject);
begin
   VB_CorregandoFicha:= True;
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Panel_ExtratoCurso.Align:= AlClient;
      VS_Opcao:= 'Consulta';

      Memo_MsgNaoPossuiDisciplina.Visible:= False;
      Funcoes.SetCadCurso('CadCurso');
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Providência');    // Abre o perfil do usuario em relacao a agenda

      //--- Tratamento da Selecao dos Cursos

      Edit_Curso.Text:= Form_MenuPrincipal.Label_CodigoCurso.Caption;
      Edit_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;

      if ((UpperCase(DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString) = 'PRESENCIAL') or (DM.IBQuery_MontaTurma.FieldByName('Modalidade').AsString = ''))  then
          TratarTurmaSemiPresencial(False)
      else
          TratarTurmaSemiPresencial(True);

      Funcoes.SetCadCurso('CadCurso');
      VB_CorregandoFicha:= False;

      //--- Tratamento da Providencia

      if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EAVC') Then
         Funcoes.ExecutaQuery( IBQuery_Providencia,'Select fp.IdCurso, fp.IdTurma, fp.IdSecao,  fp.sigla,  fp.ramal, fp.descricao,'+
                                                   'fp.Rec_data as Rec_Data, fp.Rec_Responsavel ,  '+
                                                   'fp.Exec_data as Exec_Data, fp.Exec_Responsavel '+
                                                   'From Providencia_View fp '+
                                                   'where fp.idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                   'and fp.idturma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                   'Order By IdSecao '
                                )
      else
         Funcoes.ExecutaQuery( IBQuery_Providencia,'Select fp.IdCurso, fp.IdTurma, fp.IdSecao,  fp.sigla,  fp.ramal, fp.descricao,'+
                                                   'fp.Rec_data as Rec_Data, fp.Rec_Responsavel ,  '+
                                                   'fp.Exec_data as Exec_Data, fp.Exec_Responsavel '+
                                                   'From Providencia_View fp '+
                                                   'where fp.idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                   'and fp.idturma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                   'and fp.sigla = '+#39+DM.Query_Usuario.FieldByName('Secao').AsString+#39+
                                                   'Order By IdSecao '
                                );

      IBQuery_FichaAvaliacao.Open;
      IBQuery_FARelacaoAlunos.Open;

      if IBQuery_FichaAvaliacao.FieldByName('IdCurso').AsString = '' then
         NaoPossuiProvidencia
      else
      begin
         IBTable_Providencia.Open;
         IBQuery_Coordenador.Open;
         IBQuery_Instrutor.Open;
         IBQuery_Disciplina.Open;

         Panel_TratarProvidencia.Visible:= True;

         if (DM.Query_Usuario.FieldByName('Secao').AsString ='EAVC') then
         begin
            Form_Cad_Providencia.Width:= 1382;
            TratarVisibilidadeBotoes(True);
            TratarAbasProvidencia(True);
            Funcoes_TrataProvidencia.AlimentaComboSelecaoSecao(ComboBox_Secao);

            Tratar_Ficha;

            if IBQuery_Providencia.FieldByName('IdCurso').AsString <> '' then
               ComboBox_Secao.Text:= IBQuery_Providencia.FieldByName('Sigla').AsString;

            CamposAcaoRecomendada( clCream );
            CamposAcaoExecutada( $00E1E1E1 );

            TratarBotoes( True );
            TratarCampos(False);
         end
         else
         begin
            Form_Cad_Providencia.Width:= 582;
            if IBQuery_Providencia.FieldByName('IdCurso').AsString = '' then
                NaoPossuiProvidencia
            else
            begin
               TratarVisibilidadeBotoes(False);
               Panel_Principal.Visible:= False;
               Panel_ExtratoCurso.Visible:= False;
//               TratarAbasProvidencia(False);

               Funcoes.TratarJvTransparentButton(JvTransparentButton_Gravar, JvShape_Gravar, True);
//               Funcoes.TratarJvTransparentButton(JvTransparentButton_Retornar_Exec, JvShape_Retornar_Exec, True);
//               Funcoes.TratarJvTransparentButton(JvTransparentButton_Windows_Exec, JvShape_Windows_Exec, True);

//               TratarBotoes( True );

               CamposAcaoRecomendada( $00E1E1E1);
               CamposAcaoExecutada( clCream );
               JvTransparentButton_InserirClick(Sender);
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento dos campos e dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.NaoPossuiProvidencia;
begin
   Form_Cad_Providencia.Width:= 582;
   Panel_Principal.Visible:= False;

   Panel_ExtratoCurso.Visible:= False;
   TratarVisibilidadeBotoes(False);

   Panel_ExtratoCurso.Visible:= False;
   Panel_RelacaoProvidencia.Visible:= False;

   GroupBox_AcaoRecomendada.Visible:= False;
   GroupBox_AcaoExecutada.Visible:= False;
   Memo_MsgNaoPossuiDisciplina.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento dos campos e dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.TratarVisibilidadeBotoes(Status: boolean);
begin
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Inserir, JvShape_Inserir, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Alterar, JvShape_Alterar, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Excluir, JvShape_Excluir, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Gravar, JvShape_Gravar, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Cancelar, JvShape_Cancelar, Status);

   Funcoes.TratarJvTransparentButton(JvTransparentButton_Atualizar, JvShape_Atualizar, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Imprimir, JvShape_Imprimir, Status);

   Funcoes.TratarJvTransparentButton(JvTransparentButton_Retornar_Exec, JvShape_Retornar_Exec, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Windows_Exec, JvShape_Windows_Exec, Status);

   if Status = True then
       Status:= False
   else
      Status:= True;

   Funcoes.TratarJvTransparentButton(JvTransparentButton_Retornar_Exec, JvShape_Retornar_Exec, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Windows_Exec, JvShape_Windows_Exec, Status);

end;


//------------------------------------------------------------------------------
// Tratamento dos campos e dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.TratarCampos(Status: Boolean);
begin
   if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EAVC') Then
   begin
      GroupBox_AcaoRecomendada.Enabled:= Status;
      if Status = true then
         CamposAcaoRecomendada( clWhite)
      else
         CamposAcaoRecomendada( clCream );

      GroupBox_AcaoExecutada.Enabled:= False;
      JvShape_Alterar.Visible:= True;
      JvTransparentButton_Alterar.Visible:= True;
   end
   else
   begin
      JvShape_Alterar.Visible:= False;
      JvTransparentButton_Alterar.Visible:= False;
      GroupBox_AcaoExecutada.Enabled:= Status;
      if Status = true then
         CamposAcaoExecutada( clWhite )
      else
         CamposAcaoExecutada( clCream );
      GroupBox_AcaoRecomendada.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento dos campos e dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.TratarAbasProvidencia(Status: boolean);
begin
   Panel_RelacaoProvidencia.Visible:= Status;
   if Status = true then
      Panel_ExtratoCurso.Visible:= False
   else
      Panel_ExtratoCurso.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da turma semi presencial
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.TratarTurmaSemiPresencial(Status: Boolean);
begin
   Label_SemiPresencial.Visible:= Status;

   DBEdit_InicioDist.Visible:= Status;
   DBEdit_TerminoDist.Visible:= Status;
   DBEdit_Local2.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   if ((IBTable_Providencia.State = DSInsert) or (IBTable_Providencia.State = DSEdit )) then
   begin
      IBTable_Providencia.Post;
      Funcoes.ExecutaTransacao;
   end;

   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   if ((IBTable_Providencia.State = DSInsert) or (IBTable_Providencia.State = DSEdit )) then
   begin
      IBTable_Providencia.Post;
      Funcoes.ExecutaTransacao;
   end;

   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento Quando fechar a Form
//--- Fecha as tabelas existentes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   IBQuery_Providencia.Close;
   IBQuery_Coordenador.Close;
   IBQuery_Instrutor.Close;
   IBQuery_Disciplina.Close;

   IBQuery_FichaAvaliacao.Close;
   IBQuery_FARelacaoAlunos.Close;

   IBTable_Providencia.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento da atualizacao da lista de fichas de avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_FichaAvaliacao);
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.Fechar;
begin
   Funcoes.AtualizaQuery(IBQuery_FichaAvaliacao);
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a ficha para ser montada
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.ClientDataSet_FA_AvaliacaoAfterScroll(DataSet: TDataSet);
begin
  if IBQuery_FichaAvaliacao.FieldByName('IdTurma').AsString <> '' then
     Tratar_Ficha;
end;

//------------------------------------------------------------------------------
// Tratamento para identificar a secao selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.IBQuery_ProvidenciaAfterScroll(DataSet: TDataSet);
begin
   ComboBox_Secao.Text:= IBQuery_Providencia.FieldByName('Sigla').AsString;
   TratarCampos(True);
end;

//------------------------------------------------------------------------------
// Tratamento do combobox de selecao da secao
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.ComboBox_SecaoChange(Sender: TObject);
begin
   if ComboBox_Secao.Text = '' then
   begin
       ShowMessage('Não foi selecionado a seção...');
       ComboBox_Secao.SetFocus;
   end
   else
   begin
      Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select IdSecao From FP_Secao where Sigla = '+#39+ComboBox_Secao.Text+#39);
      VS_IdSecao:= DM.IBQuery_Executa.FieldByName('IdSecao').AsString;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento dos campos e dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.CamposAcaoRecomendada(Cor: TColor);
begin
   DBEdit_Rec_Responsavel.Color:= Cor;
   DBEdit_Rec_Data.Color:= Cor;
   ComboBox_Secao.Color:= Cor;
   DBRichEdit_AcaoRecomendada.Color:= Cor;
end;

//------------------------------------------------------------------------------
// Tratamento dos campos e dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.CamposAcaoExecutada(Cor: TColor);
begin
   DBEdit_Exec_Responsavel.Color:= Cor;
   DBEdit_Exec_Data.Color:= Cor;
   DBRichEdit_AcaoExecutada.Color:= Cor;
end;

//------------------------------------------------------------------------------
// Tratamento dos campos e dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.TratarBotoes(Status: Boolean);
begin
   Funcoes.BotoesBasico( Status, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Excluir, JvTransparentButton_Gravar, JvTransparentButton_Cancelar);

   if ((DM.Query_Usuario.FieldByName('Secao').AsString <> 'EAVC') or (IBQuery_Providencia.FieldByName('IdCurso').AsString = '')) then
      Funcoes.TratarJvTransparentButton(JvTransparentButton_Atualizar, JvShape_Atualizar, False)
   else
   begin
      Funcoes.TratarJvTransparentButton(JvTransparentButton_Atualizar, JvShape_Atualizar, True);
      JvTransparentButton_Atualizar.Enabled:= Status;
   end;

   JvTransparentButton_Imprimir.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botão inserir
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_InserirClick(Sender: TObject);
begin
   TratarAbasProvidencia(False);

   TratarCampos( True );
   TratarBotoes( False );

   if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EAVC') Then
   begin
      VS_Opcao:= 'Inserir';

      IBTable_Providencia.Append;
      IBTable_Providencia.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
      IBTable_Providencia.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      IBTable_Providencia.FieldByName('Rec_Data').AsString:= DateToStr(Date);
      IBTable_Providencia.FieldByName('Rec_responsavel').AsString:= DM.Query_Usuario.FieldByName('Nome').AsString;

      ComboBox_Secao.Text:= '';
      ComboBox_Secao.SetFocus;
   end
   else
   begin
      VS_Opcao:= 'Alterar';

      IBTable_Providencia.Edit;
      if IBTable_Providencia.FieldByName('Exec_responsavel').AsString = '' then
      begin
         IBTable_Providencia.FieldByName('Exec_Data').AsString:= DateToStr(Date);
         IBTable_Providencia.FieldByName('Exec_responsavel').AsString:= DM.Query_Usuario.FieldByName('Nome').AsString;
      end;
      DBRichEdit_AcaoExecutada.SetFocus
   end;
end;


//------------------------------------------------------------------------------
// Tratamento do botão Alterar
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   TratarAbasProvidencia(False);
   TratarCampos( True );
   TratarBotoes( False );

   VS_Opcao:= 'Alterar';
   IBTable_Providencia.Edit;
   if (DM.Query_Usuario.FieldByName('Secao').AsString ='EAVC') then
      DBRichEdit_AcaoRecomendada.SetFocus
   else
      DBRichEdit_AcaoExecutada.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botão excluir
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_ExcluirClick(Sender: TObject);
var
   VI_Retorno: Integer;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão da Providência Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_Retorno = IDYes then
   begin
      IBTable_Providencia.Delete;
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(IBQuery_Providencia);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para gravar a Providencia
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_GravarClick(Sender: TObject);
var
   VB_Gravar: Boolean;
   VS_Grupo: String;
begin
   VB_Gravar:= True;
   if ComboBox_Secao.Text = '' then
   begin
       VB_Gravar:= False;
       ShowMessage('A Seção não pode ser branca...');
       ComboBox_Secao.SetFocus;
   end
   else
   begin
      if VS_Opcao = 'Inserir' then
      begin
         Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select IdSecao, Grupo From FP_Providencias '+
                                                  ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                                                  ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                                                  ' and   IdSecao = '+VS_IdSecao
                             );

         VS_Grupo:= DM.IBQuery_Executa.FieldByName('Grupo').AsString;
         if DM.IBQuery_Executa.FieldByName('IdSecao').AsString <> '' then
         begin
            VB_Gravar:= False;
            ShowMessage('Já existe providência cadastrada para Seção '+ComboBox_Secao.Text+'...');
            ComboBox_Secao.SetFocus;
         end;
      end;
   end;

   if VB_Gravar = True then
   begin
      if VS_Opcao = 'Inserir' then
      begin
         IBTable_Providencia.FieldByName('IdSecao').AsString:= VS_IdSecao;
         IBTable_Providencia.FieldByName('Grupo').AsString:= VS_Grupo;

         IBTable_Providencia.Post;
         Funcoes.ExecutaTransacao;

         TratarAbasProvidencia(True);
         TratarCampos(False);
         Funcoes.AtualizaQuery(IBQuery_Providencia);
         TratarBotoes( True );
      end
      else
      begin
         IBTable_Providencia.Post;
         Funcoes.ExecutaTransacao;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Cancelar a Providencia
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_CancelarClick( Sender: TObject);
begin
   IBTable_Providencia.Cancel;
   Funcoes.ExecutaTransacao;

   TratarAbasProvidencia(True);
   TratarCampos(False);
   TratarBotoes( True );
end;

//------------------------------------------------------------------------------
// Tratamento para Disponibilizar a providencia para secao selecionada
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.JvTransparentButton_DisponibilizaProvidenciaClick(Sender: TObject);
begin
   IBTable_Providencia.Edit;
   IBTable_Providencia.FieldByName('Exec_Responsavel').AsString:= '';
   IBTable_Providencia.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento de erro de inserção de providencia
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.IBTable_ProvidenciaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
    if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].ErrorCode = 9729)) then
    begin
       ShowMessage(' A providência para '+ComboBox_Secao.Text+' ja foi cadastrada...');
       ComboBox_Secao.SetFocus;
    end;
end;

//------------------------------------------------------------------------------
// Tratamento para destacar a relação de providencias
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.DBGrid_ProvidenciaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if gdSelected in State then
   begin
     DBGrid_Providencia.Canvas.Brush.Color := $00FF5959;
      if IBQuery_Providencia.FieldByName('Exec_Responsavel').AsString = '' then
         DBGrid_Providencia.Canvas.Font.Color:= $00F7E8FF
      else
         DBGrid_Providencia.Canvas.Font.Color:= clLime;
   end
   else
   begin
      if IBQuery_Providencia.FieldByName('Exec_Responsavel').AsString = '' then
         DBGrid_Providencia.Canvas.Font.Color:= $00F7E8FF
      else
         DBGrid_Providencia.Canvas.Font.Color:= clLime;
   end;

   DBGrid_Providencia.Canvas.FillRect(Rect);
   DBGrid_Providencia.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Tratamento para colar o topico selecionado no extrato para a providencia
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.Colar1Click(Sender: TObject);
begin
   DBRichEdit_AcaoRecomendada.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do Enter vindo do Delphi para <br> HTML
//------------------------------------------------------------------------------

Function TForm_Cad_Providencia.EnterParaBr(Texto: String): String;
var
   x, c: String;
   Cont: Integer;
begin
   x:= '';
   for Cont := 1 to length(Texto)-1 do
   begin
      c:= copy(Texto, Cont, 1);

      if c = #13 then
          x:= x+'</br>'
      else
          x:= x+c
   end;

   EnterParaBr:= x;
end;

//------------------------------------------------------------------------------
// Tratamento para menssagem de erro
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.Msg_Erro_Pagina(HTML:TStringList; Msg: String);
begin
   HTML.Add('<br/>');
   HTML.Add('<br/>');
   HTML.Add('<br/>');
   HTML.Add('<center>');
   HTML.Add('<font size=3>'+Msg+'</font><br/>');
   HTML.Add('</center>');
   HTML.Add('<br/>');
end;


//------------------------------------------------------------------------------
// Tratamento da apresentacao da descricao
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.PreenchidoPor(HTML:TStringList; Responsavel, Data: String);
begin
   HTML.Add('<table style:border-bottom:2px solid #ccc; border='+#39+'1'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
            '   <tr> '+
            '    <td width='+#39+'650'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px'+#39+' >'+'Preenchido Por: '+Responsavel+'</b></div></td> '+
            '    <td width='+#39+'200'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >Data: '+Data+'</b></div></td> '+
            '  </tr> '+
            '</table> ');
end;

//------------------------------------------------------------------------------
// Tratamento da apresentacao da descricao
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.TratarCabecalhoAcao(HTML:TStringList; Cabecalho: String);
begin
   HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'>'+
            '  <tr> '+
            '    <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp; '+Cabecalho+
            '  </tr> ' +
            '</table>' );
end;

//------------------------------------------------------------------------------
// Tratamento da apresentacao da descricao
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.TratarAcao(HTML:TStringList; Acao: String);
begin
   HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'>'+
            '  <tr> '+
            '                                            ' +EnterParaBr(Acao)+' <br/>' +
            '  </tr> ' +
            '</table>' );

   HTML.Add('<br/>');
end;

//------------------------------------------------------------------------------
// Tratamento para montar a ficha de avalicao
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.Tratar_Ficha;
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
   VS_Dir:= 'C:\Ensino\Tmp';
   if not DirectoryExists(VS_Dir) then
       ForceDirectories(VS_Dir);

   HTML := TSTringList.Create;
   HTML.Clear;

   //---
   // Inicia o processamento

   if IBQuery_FichaAvaliacao.FieldByName('IdCurso').AsString = '' then
      Msg_Erro_Pagina(HTML, 'Não possuí Ficha Cadastrada')
   else
   begin
      BarSeries_Grafico.Clear;

      VS_IdModelo:= '0';
      if VS_IdModelo = '0' then
         VS_IdFicha:= '1'
      else
         VS_IdFicha:= VS_IdModelo;

      Funcoes.ExecutaQuery(DM.IBQuery_Executa, ' select distinct SENHA '+
                                               ' From fa_resposta'+
                                               ' where IdCurso= '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                               ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                               ' and IdFicha = '+VS_IdFicha+
                                               ' and Identidade = '+#39+IBQuery_FichaAvaliacao.FieldByName('Identidade').AsString+#39+
                                               ' and Disciplina = '+#39+IBQuery_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
                          );
      VI_Cont_respondido:= 0;
      While not DM.IBQuery_Executa.Eof do
      begin
         VI_Cont_respondido:= VI_Cont_respondido+1;
         DM.IBQuery_Executa.Next;
      end;

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
         //Pega a Identificacao do Curso

         Funcoes.ExecutaQuery( DM.IBQuery_Executa,'Select IdCurso, CodCurso, NomeCurso From Curso where codcurso = '+#39+Funcoes.GetCodCurso+#39 );

//         HTML.Add('<hr size='+#39+'1'+#39+'/>');
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
                  '  <td width='+#39+'200'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:13px; color:black'+#39+' >Data Avaliação: '+IBQuery_FichaAvaliacao.FieldByName('DataAvaliacao').AsString+'</b></div></td> '+
                  '</tr> '+
                  '</table> ');

          //---
         //Pega numero de aluno participantes da avaliação

         Funcoes.ExecutaQuery(DM.IBQuery_Executa, ' Select count(1) QdeAlunos '+
                                                  ' From fa_relacao'+
                                                  ' where IdCurso= '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                  ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                  ' and IdFicha = '+VS_IdFicha+
                                                  ' and Identidade = '+#39+IBQuery_FichaAvaliacao.FieldByName('Identidade').AsString+#39+
                                                  ' and Disciplina = '+#39+IBQuery_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
                             );
         VI_Avaliadores:= DM.IBQuery_Executa.FieldByName('QdeAlunos').AsInteger;

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

               VI_TotalRep:= 0;
               VI_01:= 0;
               VI_02:= 0;
               VI_03:= 0;
               VI_04:= 0;
               VI_05:= 0;
               VI_NO:= 0;

               Funcoes.ExecutaQuery( DM.IBQuery_Executa,'select resposta '+
                                                        ' From Fa_Resposta '+
                                                        ' where IdCurso= '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                        ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                        ' and idficha = '+IBQuery_Itens.FieldByName('IdFicha').AsString+
                                                        ' and idtopico = '+IBQuery_Itens.FieldByName('IdTopico').AsString+
                                                        ' and iditem = '+IBQuery_Itens.FieldByName('IdItem').AsString+
                                                        ' and Identidade = '+#39+IBQuery_FichaAvaliacao.FieldByName('Identidade').AsString+#39+
                                                        ' and Disciplina = '+#39+IBQuery_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
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
                                                     ' where IdCurso= '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                     ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                                     ' and idficha = '+IBQuery_Itens.FieldByName('IdFicha').AsString+
                                                     ' and idtopico = '+IBQuery_Itens.FieldByName('IdTopico').AsString+
                                                     ' and Identidade = '+#39+IBQuery_FichaAvaliacao.FieldByName('Identidade').AsString+#39+
                                                  ' and Disciplina = '+#39+IBQuery_FichaAvaliacao.FieldByName('Disciplina').AsString+#39
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

            IBQuery_Complemento01.Open;
            IBQuery_Complemento01.First;
            While not IBQuery_Complemento01.Eof do
            begin
               if VS_IdModelo = '0' then
               begin
                  if IBQuery_Complemento01.FieldByName('Disciplina').AsString <> '000000' then    // mostra a disciplina e o instrutor no extrato
                  begin
                     HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'>'+
                              '  <tr> '+
                              '    <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;'+ IBQuery_Complemento01.FieldByName('Disciplina').AsString+' - ' +IBQuery_Complemento01.FieldByName('DescDisciplina').AsString+' <br/> ' +
                              '                                            ' +trim(IBQuery_Complemento01.FieldByName('PostoGraduacao').AsString)+' - ' +IBQuery_Complemento01.FieldByName('NomeGuerra').AsString+' </br>' +
                              '                                            ' +IBQuery_Complemento01.FieldByName('Comentario').AsString+' <br/>' +
                              '  </tr> ' +
                              '</table>' );
                  end
                  else
                  begin
                     HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> ' +
                              '  <tr> ' +
                              '     <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;' +IBQuery_Complemento01.FieldByName('Comentario').AsString+' <br><br> '+
                              '    </tr> ' +
                              ' </table> ');
                  end;
               end
               else
               begin
                  HTML.Add('<table cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' border '+#39+'1'+#39+' width='+#39+'770'+#39+'> ' +
                           '  <tr> ' +
                           '      <td width = '+#39+'810'+#39+' class = '+#39+'style3'+#39+'>&nbsp;'+ IBQuery_Complemento01.FieldByName('Comentario').AsString+' <br><br> '+
                           '  </tr> ' +
                           ' </table> ');
               end;

               IBQuery_Complemento01.Next;
            end;
         end;
         IBQuery_Complemento01.Close;

            //---
           //>>   verificar a existencia de comentarios nesta etapa
          //---
         //--- Tratamento do comentario do Instrutor sobre disciplina

         if VS_IdModelo = '0' then
         begin
            Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, descdisciplina, comentario '+
                                                  ' From FA_Comentarios_View '+
                                                  ' where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                  ' and   IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
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
                                                  ' where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                  ' and   IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
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
                                                              ' where IdCurso= '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                              ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
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
                                                    ' From FA_Comentarios_View '+
                                                    ' where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                    ' and   IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
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

          //---
         //--- Tratamento do comentario de Critica do Coordenador

         if VS_IdModelo = '0' then
         begin
            Funcoes.ExecutaQuery( IBQuery_Critica,' select Disciplina, IdInstrutor, IdCriticador, comentario '+
                                                  ' From FA_CriticaEspontanea '+
                                                  ' where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                  ' and   IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
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
                                                              ' where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                                              ' and   IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
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
   end;

   VS_NomeArq:= 'Providencia.html';
   if FileExists(VS_Dir+'\Providencia.html') then
       DeleteFile(VS_Dir+'\Providencia.html');

   HTML.SaveToFile(VS_Dir+'\Providencia.html');
   HTML.Free;

   VS_Dir:= 'file:///C:/Ensino/Tmp/';
   WebBrowser_ExtratoCurso.Navigate(VS_Dir+'Providencia.html')
end;

//------------------------------------------------------------------------------
// Tratamento da assinatura do Responsavel
//------------------------------------------------------------------------------

procedure TForm_Cad_Providencia.Assinatura(HTML:TStringList; Texto: String);
begin
   HTML.Add('<table style:border-bottom:1px solid #ccc; border='+#39+'0'+#39+' cellspacing='+#39+'0'+#39+' cellpadding='+#39+'0'+#39+' width='+#39+'770'+#39+' class='+#39+'caixa'+#39+'> '+
            ' <tr> '+
            '  <td width='+#39+'350'+#39+' align='+#39+'left'+#39+'><div><b style='+#39+'font-size:12px'+#39+' ></b></div></td> '+
            '  <td width='+#39+'420'+#39+' align='+#39+'center'+#39+'><div><b style='+#39+'font-size:12px; color:black'+#39+' >'+Texto+'</b></div></td> '+
            '</tr> '+
            '</table> ');
end;

procedure TForm_Cad_Providencia.JvTransparentButton_ImprimirClick(Sender: TObject);
begin


   if IBQuery_Providencia.FieldByName('IdCurso').AsString = '' then
       ShowMessage('Não possuí providencia cadastrada...')
   else
   begin
      Application.CreateForm(TForm_Rel_EAC, Form_Rel_EAC);
      Form_Rel_EAC.QuickRep1.Preview;
   end;

//   Form_Lixo.ShowModal;
end;

end.



