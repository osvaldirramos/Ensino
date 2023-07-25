//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Prova Eletronica                               //
//                                                                            //
// PROGRAMA                  : Prova.PAS                                      //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade tratar aplicacao da //
//                             Prova.                                         //
//                                                                            //
// INICIO DA ELABORACAO      : 04/11/2005                                     //
// GERENTE                   : TCel Souza          Gerente                    //
//                             Osvaldir            Desenvolvedor              //
//                             Ten Mansano         Colaborador                //
//                             So Roberto          Colaborador                //
//                             So Marcos Bicudo    Colaborador                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

// midaslib,

unit PedidoRevisaoItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBTable, IBCustomDataSet, IBQuery, StdCtrls, JvRichEd, Rotinas,
  JvDBRichEd, Buttons, DBCtrls, ExtCtrls, PsyRichEdit, jpeg, ComCtrls, ShellApi,
  Grids, DBGrids, JvGradientCaption, JvComponent, JvxClock, DBClient,
  JvTransBtn, JvPanel, JvBalloonHint, JvGradient, JvListBox,
  JvDriveCtrls, JvClock, Mask, JvTransLED, midaslib, JvToolEdit, JvCurrEdit,
  ToolWin, JvShape, ImgList, Menus,  ExportPack, JvCaptionPanel, JvDBCtrl;

type
  TForm_PedidoRevisaoItem = class(TForm)
    IBQuery_PedidoRevisaoItem: TIBQuery;
    DSQ_PedidoRevisaoItem: TDataSource;
    Panel_TratarProva: TPanel;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvDBRichEdit_MontaItem: TJvDBRichEdit;
    Panel_EditorProva: TPanel;
    Panel_Ferramenta: TPanel;
    JvGradient3: TJvGradient;
    Shape7: TShape;
    Shape8: TShape;
    Label_Prova: TLabel;
    Label_DataProva: TLabel;
    Shape9: TShape;
    Label_Aluno_: TLabel;
    Label_Curso_: TLabel;
    Label_Turma_: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Image_Brasao: TImage;
    IBTable_PedidoRevisaoItem: TIBTable;
    DST_PedidoRevisaoItem: TDataSource;
    Panel_TrataRespostaItens: TPanel;
    Panel_Itens: TPanel;
    Label_Versao: TLabel;
    Panel_TrataQuestoes: TPanel;
    Panel1: TPanel;
    Shape15: TShape;
    JvGradient1: TJvGradient;
    Label1: TLabel;
    Panel_Prova: TPanel;
    Editor_Prova: TPsyRichEdit;
    Shape14: TShape;
    DBGrid_Resultado: TDBGrid;
    Panel_PedidoRevisao: TPanel;
    IBQuery_PedidoRevisaoItemIDCURSO: TSmallintField;
    IBQuery_PedidoRevisaoItemIDTURMA: TIntegerField;
    IBQuery_PedidoRevisaoItemFASEAPLICACAO: TIBStringField;
    IBQuery_PedidoRevisaoItemREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_PedidoRevisaoItemCODMATERIA: TIBStringField;
    IBQuery_PedidoRevisaoItemIDENTIDADE: TIBStringField;
    IBQuery_PedidoRevisaoItemNUMITEM: TIntegerField;
    IBQuery_PedidoRevisaoItemNUMEROQUESTAO: TSmallintField;
    IBQuery_PedidoRevisaoItemRESPGABARITO: TIBStringField;
    IBQuery_PedidoRevisaoItemRESPALUNO: TIBStringField;
    IBQuery_PedidoRevisaoItemDATAPEDIDO: TDateTimeField;
    IBQuery_PedidoRevisaoItemDESCENALT: TBlobField;
    IBTable_AlunoTurma: TIBTable;
    DST_AlunoTurma: TDataSource;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNOMECOMPLETO: TIBStringField;
    DBText1: TDBText;
    Panel_Botoes: TPanel;
    JvShape_EncerrarProva: TJvShape;
    JvTransparentButton_ImprimirSolicitacao: TJvTransparentButton;
    IBQuery_Curso: TIBQuery;
    DSQ_Curso: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
    IBQuery_Teste: TIBQuery;
    DSQ_teste: TDataSource;
    DBText_Prova: TDBText;
    DBText_DataProva: TDBText;
    ExportQR1: TExportQR;
    JvShape1: TJvShape;
    JvTransparentButton_EnerrarSolicitacao: TJvTransparentButton;
    JvCaptionPanel_SelRelatorioSolicitacao: TJvCaptionPanel;
    JvGradientCaption2: TJvGradientCaption;
    JvShape3: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_SolPDF: TJvTransparentButton;
    Edit_NomeDoArquivo: TEdit;
    Label11: TLabel;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    PageControl_ArgumentacaoChefeEAVA: TPageControl;
    TabSheet_ArgumentacaoAluno: TTabSheet;
    TabSheet_ParecerChefeEAVA: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Label8: TLabel;
    CheckBox_AnularQuestaoCh: TCheckBox;
    CheckBox_ModificarGabaritoCh: TCheckBox;
    CheckBox_AlternativaCorretaCh: TCheckBox;
    ToolBar_ModificarGabaritoCh: TToolBar;
    ToolButton_ChMA: TToolButton;
    ToolButton_ChMB: TToolButton;
    ToolButton_ChMC: TToolButton;
    ToolButton_ChMD: TToolButton;
    ToolBar_AlternativaCorretaCh: TToolBar;
    ToolButton_ChCA: TToolButton;
    ToolButton_ChCB: TToolButton;
    ToolButton_ChCC: TToolButton;
    ToolButton_ChCD: TToolButton;
    JvDBRichEdit_ParecerAluno: TJvDBRichEdit;
    CheckBox_ManterGabaritoCh: TCheckBox;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox_AnularQuestaoDo: TCheckBox;
    CheckBox_ModificarGabaritoDo: TCheckBox;
    CheckBox_AlternativaCorretaDo: TCheckBox;
    ToolBar_ModificarGabaritoDo: TToolBar;
    ToolButton_DoMA: TToolButton;
    ToolButton_DoMB: TToolButton;
    ToolButton_DoMC: TToolButton;
    ToolButton_DoMD: TToolButton;
    ToolBar_AlternativaCorretaDo: TToolBar;
    ToolButton_DoCA: TToolButton;
    ToolButton_DoCB: TToolButton;
    ToolButton_DoCC: TToolButton;
    ToolButton_DoCD: TToolButton;
    Panel8: TPanel;
    JvShape5: TJvShape;
    JvTransparentButton_GravaParecerDocente: TJvTransparentButton;
    Panel2: TPanel;
    JvShape2: TJvShape;
    JvTransparentButton_GravaParecerChefeEAVA: TJvTransparentButton;
    Panel9: TPanel;
    JvDBRichEdit_ParecerChefeEAVA: TJvDBRichEdit;
    Panel10: TPanel;
    Label12: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label13: TLabel;
    JvDBRichEdit_ParecerDocente: TJvDBRichEdit;
    JvTransparentButton_FecharImpressao: TJvTransparentButton;
    IBTable_PedidoRevisaoItemIDCURSO: TSmallintField;
    IBTable_PedidoRevisaoItemIDTURMA: TIntegerField;
    IBTable_PedidoRevisaoItemFASEAPLICACAO: TIBStringField;
    IBTable_PedidoRevisaoItemREFERENCIAAVALIACAO: TIBStringField;
    IBTable_PedidoRevisaoItemCODMATERIA: TIBStringField;
    IBTable_PedidoRevisaoItemIDENTIDADE: TIBStringField;
    IBTable_PedidoRevisaoItemNUMITEM: TIntegerField;
    IBTable_PedidoRevisaoItemNUMEROQUESTAO: TSmallintField;
    IBTable_PedidoRevisaoItemRESPGABARITO: TIBStringField;
    IBTable_PedidoRevisaoItemRESPALUNO: TIBStringField;
    IBTable_PedidoRevisaoItemDATAPEDIDO: TDateTimeField;
    IBTable_PedidoRevisaoItemARGUMENTACAO_ALUNO: TIBStringField;
    IBTable_PedidoRevisaoItemARGUMENTACAO_DOCENTE: TIBStringField;
    IBTable_PedidoRevisaoItemPROVIDENCIA_ALUNO: TIBStringField;
    IBTable_PedidoRevisaoItemPROVIDENCIA_DOCENTE: TIBStringField;
    IBTable_PedidoRevisaoItemPROVIDENCIA_EAVA: TIBStringField;
    IBTable_PedidoRevisaoItemCONSIDERACAO_CHEFEEAVA: TIBStringField;
    IBQuery_CursoCODCURSO: TIBStringField;
    IBQuery_CursoTURMA: TIBStringField;
    IBQuery_TesteDATAAPLICACAO: TDateTimeField;
    IBQuery_TesteCODPROVA: TIBStringField;
    CheckBox_ManterGabaritoDo: TCheckBox;
    IBTable_PedidoRevisaoItemNOME_DOCENTE: TIBStringField;
    IBTable_PedidoRevisaoItemDATA_DOCENTE: TDateTimeField;
    IBTable_PedidoRevisaoItemNOME_CHEFE_EAVA: TIBStringField;
    IBTable_PedidoRevisaoItemDATA_CHEFE_EAVA: TDateTimeField;
    DSQ_ChefeAVL: TDataSource;
    Query_ChefeAVL: TIBQuery;
    Label9: TLabel;
    Query_ChefeAVLSIGLA: TIBStringField;
    Query_ChefeAVLNOME: TIBStringField;
    Label10: TLabel;
    DBEdit_NomeDocente: TDBEdit;
    JvTransparentButton_SelDocente: TJvTransparentButton;
    JvDBDate_DataDocente: TJvDBDateEdit;
    Label14: TLabel;
    DBEdit_ChefeEAVA: TDBEdit;
    JvTransparentButton_SelChefeEAVA: TJvTransparentButton;
    Label15: TLabel;
    JvDBDateEdit_ChefeEAVA: TJvDBDateEdit;
    IBQuery_InstrutorTurma: TIBQuery;
    DSQ_InstrutorTurma: TDataSource;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaNOMEGUERRA: TIBStringField;
    IBQuery_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    JvCaptionPanel_SelRelacaoDeDocente: TJvCaptionPanel;
    JvTransparentButton5: TJvTransparentButton;
    JvTransparentButton_FechaSelInstrutor: TJvTransparentButton;
    JvGradientCaption1: TJvGradientCaption;
    DBGrid_InstrutorResponsavelRevisao: TDBGrid;
    JvCaptionPanel_SellecaoDoChefeEAVA: TJvCaptionPanel;
    JvTransparentButton7: TJvTransparentButton;
    JvTransparentButton_FechaSelChefeEAVA: TJvTransparentButton;
    JvGradientCaption3: TJvGradientCaption;
    DBGrid_ChefeEAVA: TDBGrid;
    Panel_EstatisticaItem: TPanel;
    DBGrid_Lista: TStringGrid;
    Shape13: TShape;
    Label16: TLabel;
    IBQuery_PedidoRevisaoItemNOME_CHEFE_EAVA: TIBStringField;
    Table_ItemTeste: TIBTable;
    Table_ItemTesteIDCURSO: TSmallintField;
    Table_ItemTesteIDTURMA: TIntegerField;
    Table_ItemTesteNUMITEM: TIntegerField;
    Table_ItemTesteFASEAPLICACAO: TIBStringField;
    Table_ItemTesteREFERENCIAAVALIACAO: TIBStringField;
    Table_ItemTesteCODMATERIA: TIBStringField;
    Table_ItemTesteMATERIA: TIBStringField;
    Table_ItemTesteNUMEROQUESTAO: TSmallintField;
    Table_ItemTesteQUESTAOANULADA: TIBStringField;
    Table_ItemTesteQUESTAOIRREGULAR: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAA: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAB: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAC: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAD: TIBStringField;
    Table_ItemTesteINDICEFACILIDADE: TIBStringField;
    DBText5: TDBText;
    Panel_Providencia: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox_AnularQuestaoAl: TCheckBox;
    CheckBox_ModificarGabaritoAl: TCheckBox;
    CheckBox_AlternativaCorretaAl: TCheckBox;
    ToolBar_ModificarGabaritoAl: TToolBar;
    ToolButton_AlMA: TToolButton;
    ToolButton_AlMB: TToolButton;
    ToolButton_AlMC: TToolButton;
    ToolButton_AlMD: TToolButton;
    ToolBar_AlternativaCorretaAl: TToolBar;
    ToolButton_AlCA: TToolButton;
    ToolButton_AlCB: TToolButton;
    ToolButton_AlCC: TToolButton;
    ToolButton_AlCD: TToolButton;

    Function SetScreenResolution(Width, Height: integer): Longint;  // tamanho da tela

    procedure EstatisticaDoItem_Cabecalho;
    procedure EstatisticaDoItemValores;

    procedure TratarSolicitacao_Al;
    procedure TratarSolicitacao_Do;
    procedure TratarSolicitacao_Ch;

    procedure LimparProvidenciaDo;
    procedure LimparProvidencia;
    procedure LimparOpcoes( ToolButton_A, ToolButton_B, ToolButton_C, ToolButton_D: TToolButton);
    procedure MostraItemDaProva(VS_NumeroQuestao: String);
    procedure Trocar(Trocar: String; Por: String);

    procedure CheckBox_ManterGabaritoDoClick( Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_ResultadoCellClick(Column: TColumn);
    procedure JvTransparentButton_GravarSolicitacaoClick(Sender: TObject);
    procedure JvTransparentButton_SolPDFClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_EnerrarSolicitacaoClick(Sender: TObject);
    procedure CheckBox_AnularQuestaoDoClick(Sender: TObject);
    procedure CheckBox_ModificarGabaritoDoClick(Sender: TObject);
    procedure ToolButton_DoMAClick(Sender: TObject);
    procedure ToolButton_DoMBClick(Sender: TObject);
    procedure ToolButton_DoMCClick(Sender: TObject);
    procedure ToolButton_DoMDClick(Sender: TObject);
    procedure CheckBox_AlternativaCorretaDoClick(Sender: TObject);
    procedure ToolButton_DoCAClick(Sender: TObject);
    procedure ToolButton_DoCBClick(Sender: TObject);
    procedure ToolButton_DoCCClick(Sender: TObject);
    procedure ToolButton_DoCDClick(Sender: TObject);
    procedure CheckBox_AnularQuestaoChClick(Sender: TObject);
    procedure CheckBox_ManterGabaritoChClick(Sender: TObject);
    procedure CheckBox_ModificarGabaritoChClick(Sender: TObject);
    procedure ToolButton_ChMAClick(Sender: TObject);
    procedure ToolButton_ChMBClick(Sender: TObject);
    procedure ToolButton_ChMCClick(Sender: TObject);
    procedure ToolButton_ChMDClick(Sender: TObject);
    procedure CheckBox_AlternativaCorretaChClick(Sender: TObject);
    procedure ToolButton_ChCAClick(Sender: TObject);
    procedure ToolButton_ChCBClick(Sender: TObject);
    procedure ToolButton_ChCCClick(Sender: TObject);
    procedure ToolButton_ChCDClick(Sender: TObject);
    procedure JvTransparentButton_GravaParecerChefeEAVAClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirSolicitacaoClick(Sender: TObject);
    procedure JvTransparentButton_FecharImpressaoClick(Sender: TObject);
    procedure DBGrid_InstrutorResponsavelRevisaoCellClick(Column: TColumn);
    procedure JvTransparentButton_FechaSelInstrutorClick(Sender: TObject);
    procedure JvTransparentButton_SelDocenteClick(Sender: TObject);
    procedure DBGrid_ChefeEAVACellClick(Column: TColumn);
    procedure JvTransparentButton_SelChefeEAVAClick(Sender: TObject);
    procedure JvTransparentButton_FechaSelChefeEAVAClick(Sender: TObject);
    procedure DBGrid_ResultadoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure IBQuery_PedidoRevisaoItemAfterScroll(DataSet: TDataSet);

  private   { Private declarations }
     oldwidth, OldHeight, Auxwidth, Auxheight:integer ;
     HouveMudanca, Fecha_Sistama: Boolean;
     VS_NumeroQuestao_old: String;
  public
    { Public declarations }
  end;
var
  Form_PedidoRevisaoItem: TForm_PedidoRevisaoItem;


implementation

uses CorrecaoProva, Rel_PedidoRevisaoTeste, Module, CorrecaoDaProva01;

{$R *.dfm}


//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.EstatisticaDoItem_Cabecalho;
begin
   DBGrid_Lista.Cells[0,0]:= ' A';
   DBGrid_Lista.Cells[1,0]:= ' B';
   DBGrid_Lista.Cells[2,0]:= ' C';
   DBGrid_Lista.Cells[3,0]:= ' D';
   DBGrid_Lista.Cells[4,0]:= 'Bco';
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.EstatisticaDoItemValores;
var
   VS_Comando: String;
   Resp_A, Resp_B, Resp_C, Resp_D, Resp_Branco: Integer;
begin
   VS_Comando:= ' Select g.Questao, r.OpcaoVetor '+
                ' From respostaaluno r, gabaritoprova g '+
                ' where IdCurso = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and   IdTurma = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and   faseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                ' and   ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('referenciaavaliacao').AsString+#39+
                ' and   CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                ' and   r.OpcaoVetor <> '+#39+''+#39+
                ' and r.IdCurso = g.IdCurso '+
                ' and r.IdTurma = g.IdTurma '+
                ' and r.FaseAplicacao = g.FaseAplicacao '+
                ' and r.ReferenciaAvaliacao = g.ReferenciaAvaliacao '+
                ' And r.CodMateria = g.Codmateria '+
                ' and r.Gabarito = g.gabarito '+
                ' and g.NumeroQuestao = '+IBQuery_PedidoRevisaoItem.FieldByName('NumeroQuestao').AsString;
   Funcoes.OpenQuery(VS_Comando);

   Resp_A:= 0;
   Resp_B:= 0;
   Resp_C:= 0;
   Resp_D:= 0;
   Resp_Branco:= 0;
   While not DM.IBQuery_Executa.Eof do
   begin
      if Copy(DM.IBQuery_Executa.FieldByName('OpcaoVetor').AsString,DM.IBQuery_Executa.FieldByName('Questao').AsInteger,1) = 'A' then
         Resp_A:= Resp_A+1
      else
         if Copy(DM.IBQuery_Executa.FieldByName('OpcaoVetor').AsString,DM.IBQuery_Executa.FieldByName('Questao').AsInteger,1) = 'B' then
            Resp_B:= Resp_B+1
         else
            if Copy(DM.IBQuery_Executa.FieldByName('OpcaoVetor').AsString,DM.IBQuery_Executa.FieldByName('Questao').AsInteger,1) = 'C' then
               Resp_C:= Resp_C+1
            else
               if Copy(DM.IBQuery_Executa.FieldByName('OpcaoVetor').AsString,DM.IBQuery_Executa.FieldByName('Questao').AsInteger,1) = 'D' then
                  Resp_D:= Resp_D+1
               else
                  if Copy(DM.IBQuery_Executa.FieldByName('OpcaoVetor').AsString,DM.IBQuery_Executa.FieldByName('Questao').AsInteger,1) = ' ' then
                    Resp_Branco:= Resp_Branco+1;
      DM.IBQuery_Executa.Next;
   end;

   DBGrid_Lista.Cells[0, 1]:= FormatFloat('000', Resp_A);
   DBGrid_Lista.Cells[1, 1]:= FormatFloat('000', Resp_B);
   DBGrid_Lista.Cells[2, 1]:= FormatFloat('000', Resp_C);
   DBGrid_Lista.Cells[3, 1]:= FormatFloat('000', Resp_D);
   DBGrid_Lista.Cells[4, 1]:= FormatFloat('000', Resp_Branco);
end;

//------------------------------------------------------------------------------
// Tratamento do botao de fechamento da Janela
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_EnerrarSolicitacaoClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_PedidoRevisaoItem.Close;
   IBQuery_PedidoRevisaoItem.Close;
   IBTable_AlunoTurma.Close;
   IBQuery_Curso.Close;
   IBQuery_Teste.Close;
   Query_ChefeAVL.Close;
   IBQuery_InstrutorTurma.Close;
   Table_ItemTeste.Close;

   if HouveMudanca = True then
   begin
      Application.CreateForm(TForm_CorrecaoDaProva01, Form_CorrecaoDaProva01);
      Form_Cad_CorrecaoProva.IBQuery_ItemTeste.Filtered:= False;
      Form_CorrecaoDaProva01.Show;
   end;

   Action := caFree;
end;

//------------------------------------------------------------------------------
// Tratamento Quando inicia a Form
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.FormActivate(Sender: TObject);
begin
  HouveMudanca:= False;

   // Verifica se existe solicitacao sem argumentacao

   Funcoes.ExecusaoQuery(' delete From testepedidorevisaoitem Where argumentacao_aluno = '+#39+#39+' or Argumentacao_aluno is null' );

   //--- Verificando a existencia do diretorio para Solicitacao em PDF

   if not DirectoryExists('C:\SolicitacaoPedido') then
       ForceDirectories('C:\SolicitacaoPedido');

   Edit_NomeDoArquivo.Text:= 'c:\SolicitacaoPedido\';


   JvCaptionPanel_SelRelatorioSolicitacao.Visible:= False;
   JvCaptionPanel_SellecaoDoChefeEAVA.Visible:= False;
   JvCaptionPanel_SelRelacaoDeDocente.Visible:= False;
   Fecha_Sistama:= False;

    //--- Ajuste do Video
   // Alterando tamanha da tela e guardando tamanho da tela do usuario p/ restaurar  22/11/2012

   EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
   begin
      if (Screen.Width =1600) and (Screen.Height = 1200) then
      begin
        // tela que se quer
        Auxwidth := 1600;
        Auxheight:= 1200;
     end
     else
     begin
        // captacao da tela antiga
        OldWidth := Screen.Width;
        OldHeight := Screen.Height;
        Auxwidth:=oldwidth;
        Auxheight:=OldHeight;

        SetScreenResolution(1600, 1200);  // ajuste da tela para a medida do programa
     end;
   end;

    //---
   //--- Seleciona os itens que foram marcados para revisao

   LimparProvidencia;

    //---
   // Pega o Nome do Curso e o Codigo da Turma

   Funcoes.ExecutaQuery(IBQuery_Curso, 'Select CodCurso, Turma '+
                                       ' From Turmas_Em_Andamento_View '+
                                       ' Where IdCurso = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                      ' and   Idturma = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdTurma').AsString
                       );

    //---
   // Pega o Nome do Curso e o Codigo da Turma

   Funcoes.ExecutaQuery(IBQuery_Teste, 'Select DataAplicacao, CodProva'+
                                       ' From Testes_View '+
                                       ' where IdCurso = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                       ' and   IdTurma = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                                       ' and   faseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                                       ' and   ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('referenciaavaliacao').AsString+#39+
                                       ' and   CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39
                       );

   Funcoes.ExecutaQuery(IBQuery_PedidoRevisaoItem, ' Select Pr.IdCurso, Pr.IdTurma, Pr.FaseAplicacao, Pr.ReferenciaAvaliacao, Pr.CodMateria, Pr.Identidade, '+
                                                   '        Pr.NumItem, Pr.NumeroQuestao, Pr.RespGabarito, Pr.RespAluno, Pr.DataPedido, Id.DescEnAlt, Pr.Nome_Chefe_EAVA '+
                                                   ' From TestePedidoRevisaoItem Pr, Item_Desc Id '+
                                                   ' where Pr.IdCurso = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                                   ' and   Pr.IdTurma = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                                                   ' and   Pr.faseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                                                   ' and   Pr.ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('referenciaavaliacao').AsString+#39+
                                                   ' and   Pr.CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                                                   ' and   Pr.NumItem = Id.NumItem '+
                                                   ' Order By Pr.NumeroQuestao'
                       );

   Table_ItemTeste.Open;
   IBTable_PedidoRevisaoItem.Open;
   IBQuery_InstrutorTurma.Open;
   IBTable_AlunoTurma.Open;

   //--- Localizar o Chefe da AVL

   Query_ChefeAVL.Open;
   Query_ChefeAVL.Locate('SIGLA','EAVA',[]);

   if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
       IBTable_PedidoRevisaoItem.Edit;
   IBTable_PedidoRevisaoItem.FieldByName('Nome_Chefe_EAVA').AsString:= Query_ChefeAVL.FieldByName('Nome').AsString;

   //--- Tratamento da solicitacao

   MostraItemDaProva( IBQuery_PedidoRevisaoItem.FieldByName('NUMEROQUESTAO').AsString);
   TratarSolicitacao_Al;
   TratarSolicitacao_Do;
   TratarSolicitacao_Ch;
   EstatisticaDoItem_Cabecalho;
   EstatisticaDoItemValores;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para imprimir a Solictacao
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_ImprimirSolicitacaoClick(Sender: TObject);
begin
   JvCaptionPanel_SelRelatorioSolicitacao.Visible:= True;
end;

//------------------------------------------------------------------------------
// Regula tamanho de tela
//------------------------------------------------------------------------------

Function TForm_PedidoRevisaoItem.SetScreenResolution(Width, Height: integer): Longint;
var
    DeviceMode: TDeviceMode;
begin
   with DeviceMode do
   begin
      dmSize := SizeOf(TDeviceMode);
      dmPelsWidth := Width;
      dmPelsHeight := Height;
      dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    end;
   Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

//------------------------------------------------------------------------------
// Mostra o Iten da Prova
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.MostraItemDaProva(VS_NumeroQuestao: String);
begin
   Editor_Prova.Lines.Clear;
   VS_NumeroQuestao_old:= VS_NumeroQuestao;

   JvDBRichEdit_MontaItem.SelectAll;
   JvDBRichEdit_MontaItem.CopyToClipboard ;

   Editor_Prova.ReadOnly:= False;
   Editor_Prova.SelStart:= 0;
   Editor_Prova.PasteFromClipboard ;
   Editor_Prova.SelStart:= 0;
   Trocar('#N', VS_NumeroQuestao);
   Editor_Prova.ReadOnly:= True;
   Update;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel do texto
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Editor_Prova.FindText(Trocar, 0, Length(Editor_Prova.Text), []);
  if Posicao >= 0 then
  begin
    Editor_Prova.SelStart := Posicao;
    Editor_Prova.SelLength := Length(Trocar);
    Editor_Prova.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar o item
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.DBGrid_ResultadoCellClick(Column: TColumn);
begin
   if Column.FieldName = 'NUMEROQUESTAO' then
   begin
      if VS_NumeroQuestao_old <> Column.Field.Text then
      begin
         LimparProvidencia;
         LimparOpcoes( ToolButton_AlMA, ToolButton_AlMB, ToolButton_AlMC, ToolButton_AlMD);
         LimparOpcoes( ToolButton_AlCA, ToolButton_AlCB, ToolButton_AlCC, ToolButton_AlCD);

         LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
         LimparOpcoes( ToolButton_DoCA, ToolButton_DoCB, ToolButton_DoCC, ToolButton_DoCD);

         LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
         LimparOpcoes( ToolButton_ChCA, ToolButton_ChCB, ToolButton_ChCC, ToolButton_ChCD);

         MostraItemDaProva( Column.Field.Text);
         TratarSolicitacao_Al;
         TratarSolicitacao_Do;
         TratarSolicitacao_Ch;

         EstatisticaDoItemValores;
         if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
             IBTable_PedidoRevisaoItem.Edit;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Solicitacao do Aluno
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.TratarSolicitacao_Al;
var
   VS_Opcao: String;
   i: Integer;
begin
   VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 1, 16);

   if VS_Opcao = 'Anular a questão' then
      CheckBox_AnularQuestaoAl.State:= cbchecked
   else
   begin
      VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 1, 35);
      if VS_Opcao = 'Modificar gabarito para alternativa' then
      begin
         CheckBox_ModificarGabaritoAl.State:= cbchecked;
         ToolBar_ModificarGabaritoAl.Enabled:= True;
         LimparOpcoes( ToolButton_AlMA, ToolButton_AlMB, ToolButton_AlMC, ToolButton_AlMD);

         VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 37, 1);
         if VS_Opcao = 'A' then
              ToolButton_AlMA.Down:= True
         else
            if VS_Opcao = 'B' then
                ToolButton_AlMB.Down:= True
            else
               if VS_Opcao = 'C' then
                  ToolButton_AlMC.Down:= True
               else
                  ToolButton_AlMD.Down:= True
      end
      else
      begin
         VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 1, 42);
         if VS_Opcao = 'Considera como correta a(s) alternativa(s)' then
         begin
            CheckBox_AlternativaCorretaAl.State:= cbchecked;
            ToolBar_AlternativaCorretaAl.Enabled:= True;
            LimparOpcoes( ToolButton_AlCA, ToolButton_AlCB, ToolButton_AlCC, ToolButton_AlCD);

            for i := 1 to 4 do
            begin
               Case i of
                 1 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 44, 1);
                 2 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 46, 1);
                 3 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 48, 1);
                 4 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_aluno').AsString, 50, 1);
               end;

               if VS_Opcao = 'A' then
                   ToolButton_AlCA.Down:= True
               else
                  if VS_Opcao = 'B' then
                      ToolButton_AlCB.Down:= True
                  else
                     if VS_Opcao = 'C' then
                        ToolButton_AlCC.Down:= True
                     else
                        if VS_Opcao = 'D' then
                           ToolButton_AlCD.Down:= True
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Limpa as Opcoes
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.LimparOpcoes( ToolButton_A, ToolButton_B, ToolButton_C, ToolButton_D: TToolButton);
begin
   ToolButton_A.Down:= False;
   ToolButton_B.Down:= False;
   ToolButton_C.Down:= False;
   ToolButton_D.Down:= False;
end;

//------------------------------------------------------------------------------
// Limpa Providencias
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.LimparProvidencia;
begin
   CheckBox_AnularQuestaoAl.State:= cbUnchecked;
   CheckBox_ModificarGabaritoAl.State:= cbUnchecked;
   ToolBar_ModificarGabaritoAl.Enabled:= False;
   CheckBox_AlternativaCorretaAl.State:= cbUnchecked;
   ToolBar_AlternativaCorretaAl.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para colocar o item selecionado em modo Edit
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.DBGrid_ResultadoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Trim(IBQuery_PedidoRevisaoItem.FieldByName('Nome_Chefe_EAVA').AsString) <> '' then
       DBGrid_Resultado.Canvas.Font.Color:= clMaroon
   else
   begin
      DBGrid_Resultado.Canvas.Font.Color:= clTeal;

      if ((IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State <> DSEdit )) then
          IBTable_PedidoRevisaoItem.Edit;

      IBTable_PedidoRevisaoItem.FieldByName('Nome_Chefe_EAVA').AsString:= Query_ChefeAVL.FieldByName('Nome').AsString;
   end;

  if gdSelected in State then
    DBGrid_Resultado.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Resultado.Canvas.FillRect(Rect);
   DBGrid_Resultado.DefaultDrawColumnCell(Rect, DataCol, Column, State);

   if Column.FieldName = 'NUMEROQUESTAO' then
   begin
      if VS_NumeroQuestao_old <> Column.Field.Text then
      begin
         EstatisticaDoItemValores;

         LimparOpcoes( ToolButton_AlMA, ToolButton_AlMB, ToolButton_AlMC, ToolButton_AlMD);
         LimparOpcoes( ToolButton_AlCA, ToolButton_AlCB, ToolButton_AlCC, ToolButton_AlCD);
         LimparProvidencia;

         LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
         LimparOpcoes( ToolButton_DoCA, ToolButton_DoCB, ToolButton_DoCC, ToolButton_DoCD);
         LimparProvidenciaDO;

         MostraItemDaProva( Column.Field.Text);
         TratarSolicitacao_Al;
      end;
   end;


   MostraItemDaProva( IBQuery_PedidoRevisaoItem.FieldByName('NUMEROQUESTAO').AsString);
   TratarSolicitacao_Al;
   TratarSolicitacao_Do;
   TratarSolicitacao_Ch;
   IBTable_PedidoRevisaoItem.Edit;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a Solicitacao para ser entregue para Docente
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_FecharImpressaoClick(Sender: TObject);
begin
   JvCaptionPanel_SelRelatorioSolicitacao.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a Solicitacao para ser entregue para Docente
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_ImprimirClick(Sender: TObject);
var
   bmItem : TBookmark;
begin
   bmItem:= IBQuery_PedidoRevisaoItem.GetBookMark;
   Application.CreateForm(TForm_Rel_PedidoRevisaoTeste, Form_Rel_PedidoRevisaoTeste);
   Form_Rel_PedidoRevisaoTeste.QuickRep1.Print;
   Form_Rel_PedidoRevisaoTeste.Free;
   JvCaptionPanel_SelRelatorioSolicitacao.Visible:= False;
   IBQuery_PedidoRevisaoItem.GotoBookmark(bmItem);
   IBQuery_PedidoRevisaoItem.FreeBookMark(bmItem);
end;

//------------------------------------------------------------------------------
// Tratamento do para gerar arquivo PDF da solicitacao
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_SolPDFClick(Sender: TObject);
var
  bmItem : TBookmark;
begin
   if Edit_NomeDoArquivo.Text = 'c:\SolicitacaoPedido\' then
   begin
       ShowMessage('Não foi fornecido o nome do arquivo...');
       Edit_NomeDoArquivo.SetFocus;
   end
   else
   begin
      bmItem:= IBQuery_PedidoRevisaoItem.GetBookMark;
      Application.CreateForm(TForm_Rel_PedidoRevisaoTeste, Form_Rel_PedidoRevisaoTeste);
      Form_Rel_PedidoRevisaoTeste.QuickRep1.Prepare;
      ExportQR1.Report := Form_Rel_PedidoRevisaoTeste.QuickRep1;
      ExportQR1.ExportQRPDF(Edit_NomeDoArquivo.Text, False);
      ShellExecute(Handle, nil, PChar(Edit_NomeDoArquivo.Text) , nil, nil, SW_SHOWNORMAL);
      JvCaptionPanel_SelRelatorioSolicitacao.Visible:= False;
      Form_Rel_PedidoRevisaoTeste.Free;
      IBQuery_PedidoRevisaoItem.GotoBookmark(bmItem);
      IBQuery_PedidoRevisaoItem.FreeBookMark(bmItem);
   end;
end;


//------------------------------------------------------------------------------
//
// Tratamento da opcao do Docente
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// Tratamento da opcao do Docente
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Limpa as Repostas
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.TratarSolicitacao_Do;
var
   VS_Opcao: String;
   i: Integer;
begin
   VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 1, 16);

   if VS_Opcao = 'Anular a questão' then
      CheckBox_AnularQuestaoDo.State:= cbchecked
   else
   begin
      if VS_Opcao = 'Manter Gabarito' then
         CheckBox_ManterGabaritoDo.State:= cbchecked
      else
      begin
         VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 1, 35);
         if VS_Opcao = 'Modificar gabarito para alternativa' then
         begin
            CheckBox_ModificarGabaritoDo.State:= cbchecked;
            ToolBar_ModificarGabaritoDo.Enabled:= True;
            LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);

            VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 37, 1);
            if VS_Opcao = 'A' then
                ToolButton_DoMA.Down:= True
            else
               if VS_Opcao = 'B' then
                  ToolButton_DoMB.Down:= True
               else
                  if VS_Opcao = 'C' then
                     ToolButton_DoMC.Down:= True
                  else
                     ToolButton_DoMD.Down:= True
         end
         else
         begin
            VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 1, 42);
            if VS_Opcao = 'Considera como correta a(s) alternativa(s)' then
            begin
               CheckBox_AlternativaCorretaDo.State:= cbchecked;
               ToolBar_AlternativaCorretaDo.Enabled:= True;
               LimparOpcoes( ToolButton_DoCA, ToolButton_DoCB, ToolButton_DoCC, ToolButton_DoCD);

               for i := 1 to 4 do
               begin
                  Case i of
                     1 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 44, 1);
                     2 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 46, 1);
                     3 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 48, 1);
                     4 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString, 50, 1);
                  end;

                  if VS_Opcao = 'A' then
                      ToolButton_DoCA.Down:= True
                  else
                     if VS_Opcao = 'B' then
                         ToolButton_DoCB.Down:= True
                     else
                        if VS_Opcao = 'C' then
                           ToolButton_DoCC.Down:= True
                        else
                           if VS_Opcao = 'D' then
                              ToolButton_DoCD.Down:= True
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Anular Questao
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_AnularQuestaoDoClick(Sender: TObject);
begin
   if CheckBox_AnularQuestaoDo.State = cbchecked then
   begin
      CheckBox_ManterGabaritoDo.State:= cbUnchecked;

      CheckBox_ModificarGabaritoDo.State:= cbUnchecked;
      LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
      ToolBar_ModificarGabaritoDo.Enabled:= False;

      CheckBox_AlternativaCorretaDo.State:= cbUnchecked;
      LimparOpcoes( ToolButton_DoCA, ToolButton_DoCB, ToolButton_DoCC, ToolButton_DoCD);
      ToolBar_AlternativaCorretaDo.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Anular Questao
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_ManterGabaritoDoClick( Sender: TObject);
begin
   if CheckBox_ManterGabaritoDo.State = cbchecked then
   begin
      CheckBox_AnularQuestaoDo.State:= cbUnchecked;

      CheckBox_ModificarGabaritoDo.State:= cbUnchecked;
      LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
      ToolBar_ModificarGabaritoDo.Enabled:= False;

      CheckBox_AlternativaCorretaDo.State:= cbUnchecked;
      LimparOpcoes( ToolButton_DoCA, ToolButton_DoCB, ToolButton_DoCC, ToolButton_DoCD);
      ToolBar_AlternativaCorretaDo.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Modificar Gabarito
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_ModificarGabaritoDoClick( Sender: TObject);
begin
   if CheckBox_ModificarGabaritoDo.State = cbchecked then
   begin
      CheckBox_AnularQuestaoDo.State:= cbUnchecked;
      CheckBox_ManterGabaritoDo.State:= cbUnchecked;

      ToolBar_ModificarGabaritoDo.Enabled:= True;

      CheckBox_AlternativaCorretaDo.State:= cbUnchecked;
      LimparOpcoes( ToolButton_DoCA, ToolButton_DoCB, ToolButton_DoCC, ToolButton_DoCD);
      ToolBar_AlternativaCorretaDo.Enabled:= False;
   end
   else
   begin
      ToolBar_ModificarGabaritoDo.Enabled:= False;
      LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoMAClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
   ToolButton_DoMA.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MB
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoMBClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
   ToolButton_DoMB.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MC
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoMCClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
   ToolButton_DoMC.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MD
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoMDClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
   ToolButton_DoMD.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao de Alternativa Correta
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_AlternativaCorretaDoClick(Sender: TObject);
begin
   if CheckBox_AlternativaCorretaDo.State = cbchecked then
   begin
      ToolBar_AlternativaCorretaDo.Enabled:= True;

      CheckBox_AnularQuestaoDo.State:= cbUnchecked;
      CheckBox_ManterGabaritoDo.State:= cbUnchecked;

      CheckBox_ModificarGabaritoDo.State:= cbUnchecked;
      LimparOpcoes( ToolButton_DoMA, ToolButton_DoMB, ToolButton_DoMC, ToolButton_DoMD);
      ToolBar_ModificarGabaritoDo.Enabled:= False;
   end
   else
   begin
      LimparOpcoes( ToolButton_DoCA, ToolButton_DoCB, ToolButton_DoCC, ToolButton_DoCD);
      ToolBar_AlternativaCorretaDo.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoCAClick(Sender: TObject);
begin
   ToolButton_DoCA.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CB
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoCBClick(Sender: TObject);
begin
   ToolButton_DoCB.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CC
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoCCClick(Sender: TObject);
begin
   ToolButton_DoCC.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CD
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_DoCDClick(Sender: TObject);
begin
   ToolButton_DoCD.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Gravar a Solicitacao Docente
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_GravarSolicitacaoClick(Sender: TObject);
var
   VS_Opcao: String;
begin
   if CheckBox_AnularQuestaoDo.State = cbchecked then
      VS_Opcao:= 'Anular a questão'
   else
   begin
      if CheckBox_ManterGabaritoDo.State = cbchecked then
         VS_Opcao:= 'Manter Gabarito'
      else
      begin
         if CheckBox_ModificarGabaritoDo.State = cbchecked then
         begin
           VS_Opcao:= 'Modificar gabarito para alternativa';
           if ToolButton_DoMA.Down = True then
               VS_Opcao:= VS_Opcao+' A'
           else
              if ToolButton_DoMB.Down = True then
                  VS_Opcao:= VS_Opcao+' B'
              else
                 if ToolButton_DoMC.Down = True then
                     VS_Opcao:= VS_Opcao+' C'
                 else
                    if ToolButton_DoMD.Down = True then
                       VS_Opcao:= VS_Opcao+' D';

           if VS_Opcao = 'Modificar gabarito para alternativa' then
           begin
              ShowMessage('O Docente não selecionau nenhuma alternativa como correta...');
              VS_Opcao:= '';
           end;
         end
         else
         begin
            if CheckBox_AlternativaCorretaDo.State = cbchecked then
            begin
               VS_Opcao:= 'Considera como correta a(s) alternativa(s)';
               if ToolButton_DoCA.Down = True then
                  VS_Opcao:= VS_Opcao+' A';

               if ToolButton_DoCB.Down = True then
                  VS_Opcao:= VS_Opcao+' B';

              if ToolButton_DoCC.Down = True then
                 VS_Opcao:= VS_Opcao+' C';

              if ToolButton_DoCD.Down = True then
                 VS_Opcao:= VS_Opcao+' D';

              if VS_Opcao = 'Considera como correta a(s) alternativa(s)' then
              begin
                 ShowMessage('O Docente não selecionau nenhuma alternativa como correta...');
                 VS_Opcao:= '';
              end;
            end
            else
            begin
               ShowMessage('O Docente não selecionau nenhuma providencia em relação ao item selecionado...');
               VS_Opcao:= '';
            end;
         end;
      end;
   end;

   if VS_Opcao <> '' then
   begin
      if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
          IBTable_PedidoRevisaoItem.Edit;

      IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString:= VS_Opcao;
      IBTable_PedidoRevisaoItem.Post;
      Funcoes.ExecutaTransacao;

      ShowMessage('Parecer do Docente gravado com sucesso...');
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento da opcao do Chefe da EAVA
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento da Consideracao do Chefe da EAVA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.TratarSolicitacao_Ch;
var
   VS_Opcao: String;
   i: Integer;
begin
   VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 1, 16);

   if VS_Opcao = 'Anular a questão' then
      CheckBox_AnularQuestaoCh.State:= cbchecked
   else
   begin
      if trim(VS_Opcao) = 'Manter Gabarito' then
         CheckBox_ManterGabaritoCh.State:= cbchecked
      else
      begin
         VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 1, 35);
         if VS_Opcao = 'Modificar gabarito para alternativa' then
         begin
            CheckBox_ModificarGabaritoCh.State:= cbchecked;
            ToolBar_ModificarGabaritoCh.Enabled:= True;
            LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);

            VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 37, 1);
            if VS_Opcao = 'A' then
               ToolButton_ChMA.Down:= True
            else
               if VS_Opcao = 'B' then
                   ToolButton_ChMB.Down:= True
               else
                  if VS_Opcao = 'C' then
                     ToolButton_ChMC.Down:= True
                  else
                     ToolButton_ChMD.Down:= True
         end
         else
         begin
            VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 1, 42);
            if VS_Opcao = 'Considera como correta a(s) alternativa(s)' then
            begin
               CheckBox_AlternativaCorretaCh.State:= cbchecked;
               ToolBar_AlternativaCorretaCh.Enabled:= True;
               LimparOpcoes( ToolButton_ChCA, ToolButton_ChCB, ToolButton_ChCC, ToolButton_ChCD);

               for i := 1 to 4 do
               begin
                  Case i of
                    1 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 44, 1);
                    2 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 46, 1);
                    3 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 48, 1);
                    4 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString, 50, 1);
                  end;

                  if VS_Opcao = 'A' then
                      ToolButton_ChCA.Down:= True
                  else
                     if VS_Opcao = 'B' then
                         ToolButton_ChCB.Down:= True
                     else
                        if VS_Opcao = 'C' then
                           ToolButton_ChCC.Down:= True
                        else
                           if VS_Opcao = 'D' then
                              ToolButton_ChCD.Down:= True
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Anular Questao
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_AnularQuestaoChClick( Sender: TObject);
begin
   if CheckBox_AnularQuestaoCh.State = cbchecked then
   begin
      CheckBox_ManterGabaritoCh.State:= cbUnchecked;

      CheckBox_ModificarGabaritoCh.State:= cbUnchecked;
      LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
      ToolBar_ModificarGabaritoCh.Enabled:= False;

      CheckBox_AlternativaCorretaCh.State:= cbUnchecked;
      ToolBar_AlternativaCorretaCh.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Manter Gabarito
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_ManterGabaritoChClick( Sender: TObject);
begin
   if CheckBox_ManterGabaritoCh.State = cbchecked then
   begin
      CheckBox_AnularQuestaoCh.State:= cbUnchecked;
      CheckBox_ModificarGabaritoCh.State:= cbUnchecked;
      ToolBar_ModificarGabaritoCh.Enabled:= False;
      CheckBox_AlternativaCorretaCh.State:= cbUnchecked;
      ToolBar_AlternativaCorretaCh.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Modificar Gabarito
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_ModificarGabaritoChClick(Sender: TObject);
begin
   if CheckBox_ModificarGabaritoCh.State = cbchecked then
   begin
      CheckBox_AnularQuestaoCh.State:= cbUnchecked;
      CheckBox_ManterGabaritoCh.State:= cbUnchecked;

      ToolBar_ModificarGabaritoCh.Enabled:= True;

      CheckBox_AlternativaCorretaCh.State:= cbUnchecked;
      LimparOpcoes( ToolButton_ChCA, ToolButton_ChCB, ToolButton_ChCC, ToolButton_ChCD);
      ToolBar_AlternativaCorretaCh.Enabled:= False;
   end
   else
   begin
      ToolBar_ModificarGabaritoCh.Enabled:= False;
      LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChMAClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
   ToolButton_ChMA.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MB
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChMBClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
   ToolButton_ChMB.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MC
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChMCClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
   ToolButton_ChMC.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MD
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChMDClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
   ToolButton_ChMD.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao de Alternativa Correta
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_AlternativaCorretaChClick(Sender: TObject);
begin
   if CheckBox_AlternativaCorretaCh.State = cbchecked then
   begin
      CheckBox_AnularQuestaoCh.State:= cbUnchecked;
      CheckBox_ManterGabaritoCh.State:= cbUnchecked;


      ToolBar_AlternativaCorretaCh.Enabled:= True;

      CheckBox_ModificarGabaritoCh.State:= cbUnchecked;
      LimparOpcoes( ToolButton_ChMA, ToolButton_ChMB, ToolButton_ChMC, ToolButton_ChMD);
      ToolBar_ModificarGabaritoCh.Enabled:= False;
   end
   else
   begin
      LimparOpcoes( ToolButton_ChCA, ToolButton_ChCB, ToolButton_ChCC, ToolButton_ChCD);
      ToolBar_AlternativaCorretaDo.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChCAClick(Sender: TObject);
begin
   ToolButton_ChCA.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CB
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChCBClick(Sender: TObject);
begin
   ToolButton_ChCB.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CC
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChCCClick(Sender: TObject);
begin
   ToolButton_ChCC.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CD
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_ChCDClick(Sender: TObject);
begin
   ToolButton_ChCD.Down:= True;
end;

//------------------------------------------------------------------------------
// Grava a Providencia do Chefe da EAVA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_GravaParecerChefeEAVAClick(Sender: TObject);
var
   VS_Opcao: String;
   VS_QuestaoAnulada, VS_QuestaoIrregular, VS_AlternativaCorretaA, VS_AlternativaCorretaB, VS_AlternativaCorretaC, VS_AlternativaCorretaD: String;
begin
   HouveMudanca:= True;
   VS_QuestaoAnulada:= ' ';
   VS_QuestaoIrregular:= ' ';
   VS_AlternativaCorretaA:=  ' ';
   VS_AlternativaCorretaB:= ' ';
   VS_AlternativaCorretaC:= ' ';
   VS_AlternativaCorretaD:= ' ';
   if CheckBox_AnularQuestaoCh.State = cbchecked then
   begin
      VS_Opcao:= 'Anular a questão';
      VS_QuestaoAnulada:= 'X';
   end
   else
   begin
      if CheckBox_ManterGabaritoCh.State = cbchecked then
         VS_Opcao:= 'Manter Gabarito'
      else
      begin
         if CheckBox_ModificarGabaritoCh.State = cbchecked then
         begin
            VS_QuestaoIrregular:= 'X';
            VS_Opcao:= 'Modificar gabarito para alternativa';
            if ToolButton_ChMA.Down = True then
            begin
                VS_Opcao:= VS_Opcao+' A';
                VS_AlternativaCorretaA:=  'X';
            end
            else
            begin
               if ToolButton_ChMB.Down = True then
               begin
                   VS_Opcao:= VS_Opcao+' B';
                   VS_AlternativaCorretaB:=  'X';
               end
               else
               begin
                  if ToolButton_ChMC.Down = True then
                  begin
                      VS_Opcao:= VS_Opcao+' C';
                      VS_AlternativaCorretaC:=  'X';
                  end
                  else
                  begin
                     if ToolButton_ChMD.Down = True then
                     begin
                        VS_Opcao:= VS_Opcao+' D';
                        VS_AlternativaCorretaD:=  'X';
                     end
                  end;
               end;
            end;

            if VS_Opcao = 'Modificar gabarito para alternativa' then
            begin
               ShowMessage('O Chefe da EAVA não selecionau nenhuma alternativa como correta...');
               VS_Opcao:= '';
            end;
         end
         else
         begin
            if CheckBox_AlternativaCorretaCh.State = cbchecked then
            begin
               VS_QuestaoIrregular:= 'X';
               VS_Opcao:= 'Considera como correta a(s) alternativa(s)';

               if ToolButton_ChCA.Down = True then
               begin
                  VS_Opcao:= VS_Opcao+' A';
                  VS_AlternativaCorretaA:=  'X';
               end;

               if ToolButton_ChCB.Down = True then
               begin
                  VS_Opcao:= VS_Opcao+' B';
                  VS_AlternativaCorretaB:=  'X';
               end;

               if ToolButton_ChCC.Down = True then
               begin
                  VS_Opcao:= VS_Opcao+' C';
                  VS_AlternativaCorretaC:=  'X';
               end;

               if ToolButton_ChCD.Down = True then
               begin
                  VS_Opcao:= VS_Opcao+' D';
                  VS_AlternativaCorretaD:=  'X';
               end;

              if VS_Opcao = 'Considera como correta a(s) alternativa(s)' then
              begin
                 ShowMessage('O Chefe da EAVA não selecionau nenhuma alternativa como correta...');
                 VS_Opcao:= '';
              end;
            end
            else
            begin
               ShowMessage('O Chefe da EAVA  não selecionau nenhuma providencia em relação ao item selecionado...');
               VS_Opcao:= '';
            end;
         end;
      end;
   end;

   if VS_Opcao <> '' then
   begin
      if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
          IBTable_PedidoRevisaoItem.Edit;

      IBTable_PedidoRevisaoItem.FieldByName('DATA_CHEFE_EAVA').AsDateTime:= Date;
      IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString:= VS_Opcao;
      IBTable_PedidoRevisaoItem.Post;

      if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
         Table_ItemTeste.Edit;
      Table_ItemTeste.FieldByName('QuestaoAnulada').AsString:= VS_QuestaoAnulada;
      Table_ItemTeste.FieldByName('QuestaoIrregular').AsString:= VS_QuestaoIrregular;
      Table_ItemTeste.FieldByName('AlternativaCorretaA').AsString:= VS_AlternativaCorretaA;
      Table_ItemTeste.FieldByName('AlternativaCorretaB').AsString:= VS_AlternativaCorretaB;
      Table_ItemTeste.FieldByName('AlternativaCorretaC').AsString:= VS_AlternativaCorretaC;
      Table_ItemTeste.FieldByName('AlternativaCorretaD').AsString:= VS_AlternativaCorretaD;
      Table_ItemTeste.Post;

      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery(IBQuery_PedidoRevisaoItem);
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento para selecionar o responsavel pela avaliacao da EAVA
//
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_SelChefeEAVAClick(Sender: TObject);
begin
   JvCaptionPanel_SellecaoDoChefeEAVA.Visible:= True;
end;

procedure TForm_PedidoRevisaoItem.DBGrid_ChefeEAVACellClick( Column: TColumn);
begin
   if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
       IBTable_PedidoRevisaoItem.Edit;
   IBTable_PedidoRevisaoItem.FieldByName('Nome_Chefe_EAVA').AsString:= Query_ChefeAVL.FieldByName('Nome').AsString;
   IBTable_PedidoRevisaoItem.FieldByName('Data_Chefe_EAVA').AsString:= DateToStr(Date);
   
   JvCaptionPanel_SellecaoDoChefeEAVA.Visible:= False;
end;

procedure TForm_PedidoRevisaoItem.JvTransparentButton_FechaSelChefeEAVAClick(Sender: TObject);
begin
   JvCaptionPanel_SellecaoDoChefeEAVA.Visible:= False;
end;

//------------------------------------------------------------------------------
//
// Tratamento para selecionar o rinstrutor por assinar a Solicitacao
//
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_SelDocenteClick(Sender: TObject);
begin
   JvCaptionPanel_SelRelacaoDeDocente.Visible:= True
end;

procedure TForm_PedidoRevisaoItem.DBGrid_InstrutorResponsavelRevisaoCellClick(Column: TColumn);
begin
   if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
       IBTable_PedidoRevisaoItem.Edit;
   IBTable_PedidoRevisaoItem.FieldByName('Nome_Docente').AsString:= IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString;
   IBTable_PedidoRevisaoItem.FieldByName('Data_Docente').AsString:= DateToStr(Date);

   JvCaptionPanel_SelRelacaoDeDocente.Visible:= False;
end;

procedure TForm_PedidoRevisaoItem.JvTransparentButton_FechaSelInstrutorClick(Sender: TObject);
begin
   JvCaptionPanel_SelRelacaoDeDocente.Visible:= False;
end;


procedure TForm_PedidoRevisaoItem.IBQuery_PedidoRevisaoItemAfterScroll(DataSet: TDataSet);
begin
   EstatisticaDoItemValores;
end;

//------------------------------------------------------------------------------
// Limpa Providencias
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.LimparProvidenciaDo;
begin
   CheckBox_AnularQuestaoDo.State:= cbUnchecked;
   CheckBox_ModificarGabaritoDo.State:= cbUnchecked;
   ToolBar_ModificarGabaritoDo.Enabled:= False;
   CheckBox_AlternativaCorretaDo.State:= cbUnchecked;
   ToolBar_AlternativaCorretaDo.Enabled:= False;
end;

end.
