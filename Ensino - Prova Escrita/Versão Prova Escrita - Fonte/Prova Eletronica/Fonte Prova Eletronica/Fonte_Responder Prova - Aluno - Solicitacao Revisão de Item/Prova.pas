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

//----------------------------------------------------------------------------//
//  ESTRUTURA DA TABELA TEMPORARIA RESULTADO
//----------------------------------------------------------------------------//
//    Item            String(2)
//    NumQuestao      String(2)
//    Resp            String(1)
//    Correta         String(1)
//    Erro            String(1)   'E'
//    Revisao         String(1)   'X'
//    NumItem         integer
//----------------------------------------------------------------------------//


// midaslib,

unit Prova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBTable, IBCustomDataSet, IBQuery, StdCtrls, JvRichEd, Rotinas,
  JvDBRichEd, Buttons, DBCtrls, ExtCtrls, PsyRichEdit, jpeg, ComCtrls,
  Grids, DBGrids, JvGradientCaption, JvComponent, JvxClock, DBClient,
  JvTransBtn, JvPanel, JvBalloonHint, JvGradient, JvListBox,
  JvDriveCtrls, JvClock, Mask, JvTransLED, midaslib, JvToolEdit, JvCurrEdit,
  ToolWin, JvShape, ImgList, JvButton;

const
  HookDemo = 'WINHOOK.dll';
  Diretoria_Arq = 'C:\DataBase_Icea\Ensino\';
const
  WM_HOOKCREATE = WM_USER + 300;

type
  TForm_Prova = class(TForm)
    Query_GabaritoProva: TIBQuery;
    DSQ_GabaritoProva: TDataSource;
    DSC_ItemProva: TDataSource;
    ClientDataSet_ItemProva: TClientDataSet;
    ClientDataSet_ItemProvaItem1: TIntegerField;
    ClientDataSet_ItemProvaSel1: TStringField;
    ClientDataSet_ItemProvaResp1: TStringField;
    ClientDataSet_ItemProvaItem2: TIntegerField;
    ClientDataSet_ItemProvaSel2: TStringField;
    ClientDataSet_ItemProvaResp2: TStringField;
    ClientDataSet_ItemProvaItem3: TIntegerField;
    ClientDataSet_ItemProvaSel3: TStringField;
    ClientDataSet_ItemProvaResp3: TStringField;
    DSQ_Documentacao: TDataSource;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    Table_Teste: TIBTable;
    Table_TesteIDCURSO: TSmallintField;
    Table_TesteIDTURMA: TIntegerField;
    Table_TesteFASEAPLICACAO: TIBStringField;
    Table_TesteREFERENCIAAVALIACAO: TIBStringField;
    Table_TesteCODMATERIA: TIBStringField;
    Table_TesteDATAAPLICACAO: TDateTimeField;
    Table_TesteTOTALALUNOS: TSmallintField;
    Table_TesteTOTALITENS: TSmallintField;
    Table_TesteDURACAO: TIntegerField;
    Table_TesteTOTALIRREGULARIDADE: TSmallintField;
    Table_TesteTOTALANULADAS: TIntegerField;
    Table_TesteREFORMULADOS: TSmallintField;
    Table_TesteMANTIDO: TSmallintField;
    Table_TesteAPRESENTARNOTA: TIBStringField;
    Table_TesteOBSERVACAO: TIBStringField;
    Table_TesteN_GABARITOS: TIntegerField;
    Table_TesteSTATUS_APLICACAO: TIBStringField;
    Table_TesteINICIO_APLICACAO: TDateTimeField;
    Table_TesteTERMINO_APLICACAO: TDateTimeField;
    DST_Teste: TDataSource;
    Query_GabaritoProvaNUMEROQUESTAO: TIntegerField;
    Query_GabaritoProvaNUMITEM: TIntegerField;
    Query_GabaritoProvaQUESTAO: TIntegerField;
    Query_GabaritoProvaDESCENALT: TBlobField;
    Query_GabaritoProvaRESPOSTACORRETA: TIBStringField;
    Table_TesteNUMITEM_REVISAO: TSmallintField;
    Query_GabaritoProvaGABARITO: TIntegerField;
    IBQuery_RespostaAluno_: TIBQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    BlobField1: TBlobField;
    IBStringField1: TIBStringField;
    IntegerField4: TIntegerField;
    DSC_Resultado: TDataSource;
    ImageList1: TImageList;
    ClientDataSet_resultado: TClientDataSet;
    ClientDataSet_resultadoItem: TStringField;
    ClientDataSet_resultadoNumQuestao: TStringField;
    ClientDataSet_resultadoResp: TStringField;
    ClientDataSet_resultadoCorreta: TStringField;
    ClientDataSet_resultadoErro: TStringField;
    ClientDataSet_resultadoRevisao: TStringField;
    ClientDataSet_resultadoNumItem: TIntegerField;
    JvDBRichEdit_MontaItem: TJvDBRichEdit;
    Panel_Ferramenta: TPanel;
    Panel_TrataRespostaItens: TPanel;
    Panel_TrataQuestoes: TPanel;
    JvGradient_Itens: TJvGradient;
    JvGradient2: TJvGradient;
    Panel_Itens: TPanel;
    DBGrid_Itens: TDBGrid;
    Panel1: TPanel;
    Shape15: TShape;
    JvGradient1: TJvGradient;
    Label1: TLabel;
    Panel_Resultados: TPanel;
    Panel_Calculadora: TPanel;
    Label_Calculadora: TLabel;
    Memo_Aviso_: TMemo;
    DBGrid_Resultado: TDBGrid;
    Panel_BotaoProva: TPanel;
    JvGradient7: TJvGradient;
    Shape16: TShape;
    JvButton_MarcarParaRevisao: TJvButton;
    Panel2: TPanel;
    Panel_Botoes: TPanel;
    JvShape_VisualizarProva: TJvShape;
    JvTransparentButton_VisualizarProva: TJvTransparentButton;
    JvShape_EncerrarProva: TJvShape;
    JvTransparentButton_EncerrarProva: TJvTransparentButton;
    Panel_EditorProva: TPanel;
    Documento: TJvDBRichEdit;
    Panel_Prova: TPanel;
    Editor_Prova: TPsyRichEdit;
    Panel_Botoes_CabecalhoProva: TPanel;
    Panel_Ajuste2: TPanel;
    Memo_MsgRevisao: TMemo;
    Panel_Tempo: TPanel;
    Shape13: TShape;
    Label2: TLabel;
    Label_TempoProva: TLabel;
    Panel_BotoesSelecaoItens: TPanel;
    JvShape1: TJvShape;
    BitBtn_D: TBitBtn;
    BitBtn_C: TBitBtn;
    BitBtn_B: TBitBtn;
    BitBtn_A: TBitBtn;
    Panel_TratarBotao_FecharPrograma: TPanel;
    Panel3: TPanel;
    Panel_Calc: TPanel;
    JvCalcEdit_Calculadora: TJvCalcEdit;
    PsyRichEdit_Resposta: TPsyRichEdit;
    JvShape_FecharPrograma: TJvShape;
    JvTransparentButton_FecharPrograma_: TJvTransparentButton;
    Shape7: TShape;
    Shape8: TShape;
    Label_Prova: TLabel;
    Label_DataProva: TLabel;
    Shape9: TShape;
    Label_Aluno: TLabel;
    Label_Curso_: TLabel;
    Label_Turma_: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Image_Brasao: TImage;
    Label_Curso: TLabel;
    Label_Turma: TLabel;
    Label_Referencia_Prova: TLabel;
    Label_Data_Prova: TLabel;
    Label_Instituto: TLabel;
    Label_Versao: TLabel;
    JvClock_Tempo: TJvClock;
    Label_Rede: TLabel;
    Label_BD: TLabel;
    Label3: TLabel;
    ComboBox_Fonte: TComboBox;

    Function ProcessarItensNaoRespondidos: String;
    Function SetScreenResolution(Width, Height: integer): Longint;  // tamanho da tela

    Procedure FecharProva;
    procedure RestaurarResposta;
    procedure Open_GabaritoProva(PS_OrderBy: String);

    procedure TratarItensParaRevisao;
    procedure TratarCalculadora(Status: Boolean);

    procedure GravaTesteAplicacao(PS_Status, PS_Inicio, PS_Termino, PS_QtdRespondidas: String);
    procedure PosiconarNoItemSelecionado(VS_Linha: String);
    procedure GravaResultado;
    procedure Setaopcao(BitBtn: TBitBtn; VI_NumeroQuestao: Integer);
    procedure LimparRespostas;
    procedure MostrarRespostas(VI_NumeroQuestao: Integer);

    procedure MostraItemDaProva(VS_NumeroQuestao: String);
    procedure IniciarProva;
    procedure Trocar(Trocar: String; Por: String);
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_VisualizarProvaClick(Sender: TObject);
    procedure DBGrid_ItensDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ItensCellClick(Column: TColumn);
    procedure JvClock_TempoTime(Sender: TObject; Value: String);
    procedure JvTransparentButton_EncerrarProvaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_ResultadoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Editor_ProvaKeyPress(Sender: TObject; var Key: Char);
    procedure Editor_ProvaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvButton_MarcarParaRevisaoClick(Sender: TObject);
    procedure JvTransparentButton_FecharPrograma_Click(Sender: TObject);
    procedure BitBtn_AClick(Sender: TObject);
    procedure BitBtn_BClick(Sender: TObject);
    procedure BitBtn_CClick(Sender: TObject);
    procedure BitBtn_DClick(Sender: TObject);
    procedure ComboBox_FonteChange(Sender: TObject);

  private   { Private declarations }
     PosicaoBotaoRevisao, VI_QtdItens, VI_TotalItens : Integer;
     VS_InicioProva, VS_Where, VS_Gabarito, VS_RespostaAluno, VS_ItemSel: String;
     MResposta : array[1..60] of String;

     oldwidth, OldHeight, Auxwidth, Auxheight:integer ;
     FHookSet: Boolean;
  public
    { Public declarations }
  end;
var
  Form_Prova: TForm_Prova;


Function SetHook(WinHandle: HWND; MsgToSend: Integer): Boolean; stdcall; external HookDemo;

Function FreeHook: Boolean; stdcall; external HookDemo;

implementation

uses Abertura, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Função para desabilitar alt+f4
//------------------------------------------------------------------------------

Function StatusTecla (Key: integer): boolean;
begin
   Result := Odd (GetKeyState (Key));                     //Result := se a tecla for pressionada
end;

//------------------------------------------------------------------------------
// Funcao para desabilitar todas restricoes
//------------------------------------------------------------------------------

procedure TForm_Prova.FormDestroy(Sender: TObject);
begin
  FHookSet := FreeHook;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Prova.FormClose(Sender: TObject; var Action: TCloseAction);
var
   numero : LongInt;
begin
   If Not Form_Abertura.Fecha_Sistama = 0 Then             //Tratamento quando não estiver habilitado para fechar
      Action := caNone
   else                                                    // nao realizará  nenhuma operação
   begin
      SystemParametersInfo(97,Word(False),@numero,0);
      FHookSet := FreeHook;
      Action := caFree;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Tecla
//------------------------------------------------------------------------------

procedure TForm_Prova.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
   If StatusTecla (VK_LMENU) And (Key = VK_F4)  And (Key = VK_TAB) Then //Se esc e Alt+f4 for apertada
      Form_Abertura.Fecha_Sistama:= 0;                    //variavel para fechar o programa desabilitada
end;

//------------------------------------------------------------------------------
// Tratamento Quando inicia a Form
//------------------------------------------------------------------------------

procedure TForm_Prova.FormActivate(Sender: TObject);
var
   VI_Cont: Integer;
begin
   //--- Verifica se existe o diretorio de gravacao das imagens

   if not DirectoryExists(Diretorio_Imagens) then
       ForceDirectories(Diretorio_Imagens);

   //--- Tratamento das variaveis iniciais

   PosicaoBotaoRevisao:= 2;
   Label_Versao.Caption:= Versao;
   Panel_BotaoProva.Visible:= False;
   Memo_MsgRevisao.Visible:= False;

    //--- Ajuste do Video
   // Alterando tamanha da tela e guardando tamanho da tela do usuario p/ restaurar  22/11/2012

   EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
   begin
      if (Screen.Width =1600) and (Screen.Height = 1200) then
      begin
        Auxwidth := 1600;
        Auxheight:= 1200;
     end
     else
     begin              // captacao da tela antiga
        OldWidth := Screen.Width;
        OldHeight := Screen.Height;
        Auxwidth:=oldwidth;
        Auxheight:=OldHeight;

        SetScreenResolution(1600, 1200);  // ajuste da tela para a medida do programa
     end;
   end;

   if  Auxwidth <= 1280 then
      Panel_Ajuste2.Width:= 17;

    //---
   //--- Monta  Clausaula Where basica

   VS_Where:= ' where IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
              ' and IdTurma = '+DM.Query_Usuario.FieldByName('IdTurma').AsString+
              ' and FaseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
              ' and ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+
              ' and CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
              ' and Identidade = '+#39+DM.Query_Usuario.FieldByName('Identidade').AsString+#39;

    //---
   //--- Seta a prova como prova aberta

   Funcoes.ExecusaoQuery(' Update TesteAplicacao set ProvaAberta = '+#39+'S'+#39+VS_Where);

    //---
   //--- Pega o numero do gabarito da prova do aluno

   Table_Teste.Open;
   Funcoes.OpenQuery(' Select Gabarito, OpcaoVetor from RespostaAluno '+VS_Where);

   VS_Gabarito:= DM.IBQuery_Executa.FieldByName('Gabarito').AsString;
   VS_RespostaAluno:= DM.IBQuery_Executa.FieldByName('OpcaoVetor').AsString;

   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'FINALIZADA' then
   begin
      Table_Teste.Edit;
      Table_Teste.FieldByName('Status_Aplicacao').AsString:= 'DISCUSSÃO';
      Table_Teste.Post;
      Funcoes.ExecutaTransacao;
   end;

    //---
   // Pega o Nome do Curso e o Codigo da Turma

   Funcoes.OpenQuery('Select CodCurso, Turma '+
                     ' From Turma_Em_Andamento_View '+
                     ' Where IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                     ' and   Idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString
                    );

   Label_Curso.Caption:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;
   Label_Turma.Caption:= DM.IBQuery_Executa.FieldByName('Turma').AsString;

   Label_Aluno.Caption:= 'Aluno: '+DM.Query_Usuario.FieldByName('NomeCompleto').AsString;
   Label_Referencia_Prova.Caption:= DM.Query_Usuario.FieldByName('CodProva').AsString;
   Label_Data_Prova.Caption:= DM.Query_Usuario.FieldByName('DataAplicacao').AsString;

  Funcoes.SetLog(Label_Curso.Caption, Label_Turma.Caption, Label_Referencia_Prova.Caption);

   TratarCalculadora(False);
   Panel_TrataQuestoes.Visible:= False;
   Panel_TrataRespostaItens.Visible:= False;

   if DM.Query_Usuario.FieldByName('status_aplicacao').AsString = 'DISCUSSÃO' then     //--- Discussao
   begin
      Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'Discussão_Logar_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
      Panel_BotaoProva.Visible:= True;
      JvButton_MarcarParaRevisao.Visible:= True;

      //--- Monta Extrato da Prova

      Panel_Calc.Visible:= True;
      Panel_Calculadora.Visible:= True;
      Memo_MsgRevisao.Visible:= True;
      Panel_Tempo.Height:= 61;
      DBGrid_Resultado.Visible:= True;

//      Open_GabaritoProva(' Order By GP.Questao');
      Open_GabaritoProva(' Order By GP.NumeroQuestao');

      VS_ItemSel:= '0';

      VI_cont:= 1;
      Query_GabaritoProva.First;
      While not Query_GabaritoProva.Eof do
      begin
         ClientDataSet_resultado.Append;
         ClientDataSet_resultado.FieldByName('ITEM').AsString:= Query_GabaritoProva.FieldByName('Questao').AsString;
         ClientDataSet_resultado.FieldByName('NumQuestao').AsString:= Query_GabaritoProva.FieldByName('NumeroQuestao').AsString;
         ClientDataSet_resultado.FieldByName('NumItem').AsString:= Query_GabaritoProva.FieldByName('NumItem').AsString;
         ClientDataSet_resultado.FieldByName('Resp').AsString:= Copy(VS_RespostaAluno, Query_GabaritoProva.FieldByName('Questao').AsInteger,1);
         ClientDataSet_resultado.FieldByName('Correta').AsString:= Query_GabaritoProva.FieldByName('RespostaCorreta').AsString;
         ClientDataSet_resultado.FieldByName('Revisao').AsString:= '';
//         if Copy(VS_RespostaAluno, VI_cont,1) = ' ' then
         if Copy(VS_RespostaAluno, Query_GabaritoProva.FieldByName('Questao').AsInteger,1) = ' ' then
            ClientDataSet_resultado.FieldByName('ERRO').AsString:= 'B'
         else
            if Query_GabaritoProva.FieldByName('RespostaCorreta').AsString <> Copy(VS_RespostaAluno, Query_GabaritoProva.FieldByName('Questao').AsInteger,1) then
               ClientDataSet_resultado.FieldByName('ERRO').AsString:= 'E';
         ClientDataSet_resultado.Post;

         VI_cont:= VI_cont+1;
         Query_GabaritoProva.Next;
      end;

      Panel_Botoes.Visible:= False;
      Panel_TratarBotao_FecharPrograma.Visible:= False;
      Panel_Tempo.Visible:= False;
      Documento.Visible:= False;
   end
   else
   begin
      DBGrid_Resultado.Visible:= False;
      if DM.Query_Usuario.FieldByName('status_aplicacao').AsString = 'ANDAMENTO' then   //--- Andamento
      begin
         Panel_Ferramenta.Visible:= True;
         Funcoes.AjustaHora;
         Funcoes.OpenQuery('Select Status From TesteAplicacao '+VS_Where);

         if DM.IBQuery_Executa.FieldByName('Status').AsString = 'Iniciar' then
         begin
            Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'InicioProva_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
            IniciarProva
         end
         else
         begin
            Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'RestaurarProva_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
            RestaurarResposta;
         end;
      end
      else
      begin
         if DM.Query_Usuario.FieldByName('status_aplicacao').AsString = 'APLICAR' then   //--- Aplicar
         begin
            //--- Inicia a Prova

            Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'Aplicar_'+FormatDateTime('yymmdd_hhnnss',now)+'.jpg');
            Funcoes.AjustaHora;

            Panel_Botoes.Visible:= False;
            Panel_Tempo.Height:= 163;
            Panel_Botoes.Visible:= True;

            Panel_TratarBotao_FecharPrograma.Visible:= True;

            JvTransparentButton_VisualizarProva.Caption:= 'Visualizar Prova Inteira';
            JvShape_VisualizarProva.Visible:= False;
            JvTransparentButton_VisualizarProva.Visible:= False;

            Panel_Ferramenta.Visible:= False;

            JvShape_EncerrarProva.Visible:= False;
            JvTransparentButton_EncerrarProva.Visible:= False;

            Panel_Prova.Visible:= False;

            IBQuery_Documento.Open;
            Documento.Visible:= True;
            Documento.Width:= 881;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Abre a Query de tratamento do Gabarito da Prova
//------------------------------------------------------------------------------

procedure TForm_Prova.Open_GabaritoProva(PS_OrderBy: String);
begin
   Funcoes.ExecutaQuery(Query_GabaritoProva, 'Select GP.NumeroQuestao, GP.NumItem, GP.Questao, ID.DescEnAlt, Id.RespostaCorreta, GP.Gabarito '+
                                             ' From  GabaritoProva GP,  Item_Desc ID '+
                                             ' Where GP.IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                                             ' and   GP.idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString+
                                             ' and   GP.faseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
                                             ' and   GP.ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+
                                             ' and   GP.CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
                                             ' and   GP.Gabarito = '+VS_Gabarito+
                                             ' and   GP.NumItem = ID.NumItem '+ PS_OrderBy
                       );
end;

//------------------------------------------------------------------------------
// Finaliza o programa
//------------------------------------------------------------------------------

procedure TForm_Prova.JvTransparentButton_EncerrarProvaClick( Sender: TObject);
begin
   if  Application.MessageBox(PChar(ProcessarItensNaoRespondidos+#13+#13+'Confirma o encerramento da prova...'), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
   begin
      Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'Encerrar_'+FormatDateTime('yymmdd_hhnnss',now)+'.jpg');
      GravaTesteAplicacao('Encerrado', '', TimeToStr(Time), IntToStr(VI_QtdItens));
      FecharProva;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para iniciar a prova
//------------------------------------------------------------------------------

procedure TForm_Prova.IniciarProva;
var
   Cont_Item, i: Integer;
begin
   if Table_Teste.FieldByName('Inicio_Aplicacao').AsString = '00:00:00' then
      VS_InicioProva:= TimeToStr(Time)
   else
      VS_InicioProva:= Copy(Table_Teste.FieldByName('Inicio_Aplicacao').AsString,12,5)+':00';

   VI_QtdItens:= 0;
   GravaTesteAplicacao('Respondendo', VS_InicioProva, '', IntToStr(VI_QtdItens));

   TratarCalculadora(True);
   PsyRichEdit_Resposta.Visible:= True;
   Documento.Visible:= False;

   JvTransparentButton_VisualizarProva.Visible:= True;
   JvShape_VisualizarProva.Visible:= True;

   Panel_TrataQuestoes.Visible:= True;
   Panel_TrataRespostaItens.Visible:= True;

   JvShape_EncerrarProva.Visible:= True;
   JvTransparentButton_EncerrarProva.Visible:= True;
   Panel_Prova.Visible:= True;

   Open_GabaritoProva(' Order By GP.Questao');

   Panel_BotoesSelecaoItens.Top:= 11;
   VI_TotalItens:= Table_Teste.FieldByName('TotalItens').AsInteger;
   i:= 0;

   For Cont_Item:= 1 to VI_TotalItens do
   begin
     i:= i+1;

     Case i of
       1 : begin
             ClientDataSet_ItemProva.Append;
             ClientDataSet_ItemProva.FieldByName('Item1').AsString:= FormatFloat('00', Cont_Item);
           end;
       2 : begin
             ClientDataSet_ItemProva.FieldByName('Item2').AsString:= FormatFloat('00', Cont_Item);
           end;
       3 : begin
             ClientDataSet_ItemProva.FieldByName('Item3').AsString:= FormatFloat('00', Cont_Item);
             ClientDataSet_ItemProva.Post;
             i:= 0;
           end;
     end;

     MResposta[Cont_Item]:= ' ';
     PsyRichEdit_Resposta.Lines.Add(FormatFloat('00', Cont_Item)+' - '+MResposta[Cont_Item]);
     Query_GabaritoProva.Next;
   end;

   if (ClientDataSet_ItemProva.State = DSInsert) or (ClientDataSet_ItemProva.State = DSEdit ) then
       ClientDataSet_ItemProva.Post;

   Query_GabaritoProva.First;

   Editor_Prova.Lines.Clear;
   MostraItemDaProva(Query_GabaritoProva.FieldByName('Questao').AsString);
   MostrarRespostas(Query_GabaritoProva.FieldByName('Questao').AsInteger);
   PosiconarNoItemSelecionado('01');
   Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'InicioProva_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel do texto
//------------------------------------------------------------------------------

procedure TForm_Prova.Trocar(Trocar: String; Por: String);
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
// Posiciona no Item Anterior
//------------------------------------------------------------------------------

procedure TForm_Prova.PosiconarNoItemSelecionado(VS_Linha: String);
begin
   ClientDataSet_ItemProva.First;
   While not ClientDataSet_ItemProva.Eof do
   begin
      if  ((ClientDataSet_ItemProva.FieldByName('Sel1').AsString = 'X') or (ClientDataSet_ItemProva.FieldByName('Sel2').AsString = 'X') or (ClientDataSet_ItemProva.FieldByName('Sel3').AsString = 'X')) then
      begin
         ClientDataSet_ItemProva.Edit;
         ClientDataSet_ItemProva.FieldByName('Sel1').AsString:= ' ';
         ClientDataSet_ItemProva.FieldByName('Sel2').AsString:= ' ';
         ClientDataSet_ItemProva.FieldByName('Sel3').AsString:= ' ';
         ClientDataSet_ItemProva.Post;
         Break
      end;
      ClientDataSet_ItemProva.Next;
   end;

   if ClientDataSet_ItemProva.Locate('Item1', VS_Linha, []) then
   begin
      ClientDataSet_ItemProva.Edit;
      ClientDataSet_ItemProva.FieldByName('Sel1').AsString:= 'X';
      ClientDataSet_ItemProva.Post;
   end
   else
   begin
      if ClientDataSet_ItemProva.Locate('Item2', VS_Linha, []) then
      begin
         ClientDataSet_ItemProva.Edit;
         ClientDataSet_ItemProva.FieldByName('Sel2').AsString:= 'X';
         ClientDataSet_ItemProva.Post;
      end
      else
      begin
         if ClientDataSet_ItemProva.Locate('Item3', VS_Linha, []) then
         begin
            ClientDataSet_ItemProva.Edit;
            ClientDataSet_ItemProva.FieldByName('Sel3').AsString:= 'X';
            ClientDataSet_ItemProva.Post;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Limpa as Repostas
//------------------------------------------------------------------------------

procedure TForm_Prova.LimparRespostas;
begin
   BitBtn_A.Font.Color:= clBlack;
   BitBtn_B.Font.Color:= clBlack;
   BitBtn_C.Font.Color:= clBlack;
   BitBtn_D.Font.Color:= clBlack;
end;

//------------------------------------------------------------------------------
//  Mostra a Resposta do Item Selecionado
//------------------------------------------------------------------------------

procedure TForm_Prova.MostrarRespostas(VI_NumeroQuestao: Integer);
begin
   LimparRespostas;
   if MResposta[VI_NumeroQuestao] = 'A' then
      BitBtn_A.Font.Color:= clRed
   else
      if MResposta[VI_NumeroQuestao] = 'B' then
         BitBtn_B.Font.Color:= clRed
      else
         if MResposta[VI_NumeroQuestao] = 'C' then
            BitBtn_C.Font.Color:= clRed
         else
            if MResposta[VI_NumeroQuestao] = 'D' then
               BitBtn_D.Font.Color:= clRed;
end;

//------------------------------------------------------------------------------
// Troca o tamanho da fonte
//------------------------------------------------------------------------------

procedure TForm_Prova.ComboBox_FonteChange(Sender: TObject);
begin
   if ((trim(ComboBox_Fonte.Text) <> '') and (Length(ComboBox_Fonte.Text) = 2)) then
   begin
      if ((trim(ComboBox_Fonte.Text) = '11') or (trim(ComboBox_Fonte.Text) = '12') or (trim(ComboBox_Fonte.Text) = '13') or
          (trim(ComboBox_Fonte.Text) = '14') or (trim(ComboBox_Fonte.Text) = '15') or (trim(ComboBox_Fonte.Text) = '16') or
          (trim(ComboBox_Fonte.Text) = '17') or (trim(ComboBox_Fonte.Text) = '18') ) then
      begin
         Editor_Prova.SelectAll;
         Editor_Prova.SelAttributes.Size := StrToInt(ComboBox_Fonte.Text);   //---------
         Update;
      end
      else
      begin
         ComboBox_Fonte.Text:= ''
      end;
   end;
end;

//------------------------------------------------------------------------------
// Mostra o Iten da Prova
//------------------------------------------------------------------------------

procedure TForm_Prova.MostraItemDaProva(VS_NumeroQuestao: String);
begin
   JvDBRichEdit_MontaItem.SelectAll;

  JvDBRichEdit_MontaItem.SelAttributes.Size := StrToInt(ComboBox_Fonte.Text);   //---------
  JvDBRichEdit_MontaItem.SelAttributes.Name:= 'Courier New';                    //---------

   JvDBRichEdit_MontaItem.CopyToClipboard ;

   Editor_Prova.SelStart:= 0;
   Editor_Prova.PasteFromClipboard ;
   Editor_Prova.SelStart:= 0;
   Trocar('#N', VS_NumeroQuestao);
   Update;
end;

//------------------------------------------------------------------------------
// Tratamento para visualizar a Prova
//------------------------------------------------------------------------------

procedure TForm_Prova.JvTransparentButton_VisualizarProvaClick(Sender: TObject);
begin
   if JvTransparentButton_VisualizarProva.Caption = 'Visualizar Prova Inteira' then
   begin
      PsyRichEdit_Resposta.Visible:= False;

      VS_ItemSel:= Query_GabaritoProva.FieldByName('Questao').AsString;
      Panel_TrataQuestoes.Visible:= False;
      Panel_TrataRespostaItens.Visible:= False;
      TratarCalculadora(False);

      JvShape_EncerrarProva.Visible:= False;
      JvTransparentButton_EncerrarProva.Visible:= False;

      Editor_Prova.Lines.Clear;
      Query_GabaritoProva.Last;
      While not Query_GabaritoProva.Bof do
      begin
        MostraItemDaProva(Query_GabaritoProva.FieldByName('Questao').AsString);
        Query_GabaritoProva.Prior;
      end;
      JvTransparentButton_VisualizarProva.Caption:= 'Responder Prova';
   end
   else
   begin
      if Documento.Visible = True then
      begin
         Documento.Visible:= False;
         Panel_Prova.Visible:= True;
      end;

      PsyRichEdit_Resposta.Visible:= True;
      Panel_TrataQuestoes.Visible:= True;
      Panel_TrataRespostaItens.Visible:= True;
      TratarCalculadora(True);

      JvShape_EncerrarProva.Visible:= True;
      JvTransparentButton_EncerrarProva.Visible:= True;
      Editor_Prova.Lines.Clear;

      JvTransparentButton_VisualizarProva.Caption:= 'Visualizar Prova Inteira';
      Query_GabaritoProva.Locate('Questao', VS_ItemSel, []);
      MostraItemDaProva(VS_ItemSel);
      MostrarRespostas(StrToInt(VS_ItemSel));
      PosiconarNoItemSelecionado(VS_ItemSel);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar a opcão da questao selecionada
//------------------------------------------------------------------------------

procedure TForm_Prova.Setaopcao(BitBtn: TBitBtn; VI_NumeroQuestao: Integer);
var
   i: Integer;
begin
   if not DM.IBDatabase_Ensino.TestConnected then
      Funcoes.Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
   else
   begin
      BitBtn.Font.Color:= clRed;
      if MResposta[VI_NumeroQuestao] = ' ' then    // Contabiliza a quantidade de itens respondidos
      begin
         VI_QtdItens:= VI_QtdItens+1;
         GravaTesteAplicacao('Respondendo', '', '', IntToStr(VI_QtdItens));
      end;

      if BitBtn_A.Font.Color = clRed then
         MResposta[VI_NumeroQuestao]:= 'A'
      else
         if BitBtn_B.Font.Color = clRed then
            MResposta[VI_NumeroQuestao]:= 'B'
         else
            if BitBtn_C.Font.Color = clRed then
               MResposta[VI_NumeroQuestao]:= 'C'
            else
               if BitBtn_D.Font.Color = clRed then
                  MResposta[VI_NumeroQuestao]:= 'D';

      if ClientDataSet_ItemProva.Locate('Item1', IntToStr(VI_NumeroQuestao), []) then
      begin
         ClientDataSet_ItemProva.Edit;
         ClientDataSet_ItemProva.FieldByName('Resp1').AsString:= 'X';
         ClientDataSet_ItemProva.Post;
      end
      else
      begin
         if ClientDataSet_ItemProva.Locate('Item2',IntToStr(VI_NumeroQuestao), []) then
         begin
            ClientDataSet_ItemProva.Edit;
            ClientDataSet_ItemProva.FieldByName('Resp2').AsString:= 'X';
            ClientDataSet_ItemProva.Post;
         end
         else
         begin
            if ClientDataSet_ItemProva.Locate('Item3', IntToStr(VI_NumeroQuestao), []) then
            begin
               ClientDataSet_ItemProva.Edit;
               ClientDataSet_ItemProva.FieldByName('Resp3').AsString:= 'X';
               ClientDataSet_ItemProva.Post;
            end;
         end;
      end;

      PsyRichEdit_Resposta.Lines.Clear;
      For i:= 1 to VI_TotalItens do
         PsyRichEdit_Resposta.Lines.Add(FormatFloat('00', i)+' - '+MResposta[I]);

      GravaResultado;
      update;
      Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'Resposta_'+IntToStr(VI_NumeroQuestao)+'_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar a opcão de Resposta para A
//------------------------------------------------------------------------------

procedure TForm_Prova.BitBtn_AClick(Sender: TObject);
begin
   LimparRespostas;
   Setaopcao(BitBtn_A, Query_GabaritoProva.FieldByName('Questao').AsInteger);
end;

//------------------------------------------------------------------------------
// Tratamento para setar a opcão de Resposta para B
//------------------------------------------------------------------------------

procedure TForm_Prova.BitBtn_BClick(Sender: TObject);
begin
   LimparRespostas;
   Setaopcao(BitBtn_B, Query_GabaritoProva.FieldByName('Questao').AsInteger);
end;

//------------------------------------------------------------------------------
// Tratamento para setar a opcão de Resposta para C
//------------------------------------------------------------------------------

procedure TForm_Prova.BitBtn_CClick(Sender: TObject);
begin
   LimparRespostas;
   Setaopcao(BitBtn_C, Query_GabaritoProva.FieldByName('Questao').AsInteger);
end;

//------------------------------------------------------------------------------
// Tratamento para setar a opcão de Resposta para D
//------------------------------------------------------------------------------

procedure TForm_Prova.BitBtn_DClick(Sender: TObject);
begin
   LimparRespostas;
   Setaopcao(BitBtn_D, Query_GabaritoProva.FieldByName('Questao').AsInteger);
end;

//------------------------------------------------------------------------------
// Seleciona o Item atraves do Click na Grid de Itens
//------------------------------------------------------------------------------

procedure TForm_Prova.DBGrid_ItensCellClick(Column: TColumn);
begin
   if not DM.IBDatabase_Ensino.TestConnected then
      Funcoes.Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
   else
   begin
      if Column.Field.Text <> '' then
      begin
         if VS_ItemSel <> Column.Field.Text then
         begin
            case  ClientDataSet_ItemProva.FieldByName('Item1').AsInteger of
                 1:  Panel_BotoesSelecaoItens.Top:= 11;
                 4:  Panel_BotoesSelecaoItens.Top:= 45;
                 7:  Panel_BotoesSelecaoItens.Top:= 79;
                 10: Panel_BotoesSelecaoItens.Top:= 113;
                 13: Panel_BotoesSelecaoItens.Top:= 147;
                 16: Panel_BotoesSelecaoItens.Top:= 181;
                 19: Panel_BotoesSelecaoItens.Top:= 215;
                 22: Panel_BotoesSelecaoItens.Top:= 249;
                 25: Panel_BotoesSelecaoItens.Top:= 283;
                 28: Panel_BotoesSelecaoItens.Top:= 317;
                 31: Panel_BotoesSelecaoItens.Top:= 351;
                 34: Panel_BotoesSelecaoItens.Top:= 385;
                 37: Panel_BotoesSelecaoItens.Top:= 419;
                 40: Panel_BotoesSelecaoItens.Top:= 453;
                 43: Panel_BotoesSelecaoItens.Top:= 487;
                 46: Panel_BotoesSelecaoItens.Top:= 521;
                 49: Panel_BotoesSelecaoItens.Top:= 555;
                 else
                     Panel_BotoesSelecaoItens.Top:= 555;
            end;

            VS_ItemSel:= Column.Field.Text;
            LimparRespostas;
            Editor_Prova.Lines.Clear;
            if Query_GabaritoProva.Locate('Questao', Column.Field.Text, []) then
               MostraItemDaProva(Column.Field.Text);

            if DM.Query_Usuario.FieldByName('status_aplicacao').AsString = 'ANDAMENTO' then
               MostrarRespostas(StrToInt(Column.Field.Text));
            PosiconarNoItemSelecionado(Column.Field.Text);
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para colorir a Grid
//------------------------------------------------------------------------------

procedure TForm_Prova.DBGrid_ItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   ShowScrollBar(DBGrid_Itens.Handle,SB_VERT,False); //Remove barra Vertical

   if Column.FieldName = 'Item1' then
   begin
      if ClientDataSet_ItemProva.FieldByName('Sel1').AsString = 'X' then
         DBGrid_Itens.Canvas.Brush.Color:= $00FFB871
      else
         if ClientDataSet_ItemProva.FieldByName('Resp1').AsString = 'X' then
            DBGrid_Itens.Canvas.Brush.Color:= $00DFEEDF    // Verde
         else
            DBGrid_Itens.Canvas.Brush.Color:= clWhite;
   end
   else
   begin
      if Column.FieldName = 'Item2' then
      begin
         if ClientDataSet_ItemProva.FieldByName('Sel2').AsString = 'X' then
            DBGrid_Itens.Canvas.Brush.Color:= $00FFB871
         else
            if ClientDataSet_ItemProva.FieldByName('Resp2').AsString = 'X' then
               DBGrid_Itens.Canvas.Brush.Color:= $00DFEEDF
            else
               DBGrid_Itens.Canvas.Brush.Color:= clWhite;
      end
      else
      begin
         if Column.FieldName = 'Item3' then
         begin
            if ClientDataSet_ItemProva.FieldByName('Sel3').AsString = 'X' then
               DBGrid_Itens.Canvas.Brush.Color:= $00FFB871
            else
               if ClientDataSet_ItemProva.FieldByName('Resp3').AsString = 'X' then
                  DBGrid_Itens.Canvas.Brush.Color:= $00DFEEDF
               else
                  DBGrid_Itens.Canvas.Brush.Color:= clWhite;
         end;
      end;
   end;
   DBGrid_Itens.Canvas.FillRect(Rect);
   DBGrid_Itens.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   Editor_Prova.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento para Gravar a situacao da Aplicacao do Teste
//------------------------------------------------------------------------------

procedure TForm_Prova.GravaTesteAplicacao(PS_Status, PS_Inicio, PS_Termino, PS_QtdRespondidas: String);
begin
   if StrToInt(PS_QtdRespondidas) > VI_TotalItens then
      PS_QtdRespondidas:= IntToStr(VI_TotalItens);

   if PS_Status = 'Encerrado' then
   begin
      if PS_Termino = '' then
         Funcoes.ExecusaoQuery('Update TesteAplicacao set Status = '+#39+PS_Status+#39+', QtdRespondidas = '+IntToStr(VI_TotalItens)+VS_Where)
      else
         Funcoes.ExecusaoQuery('Update TesteAplicacao set Status = '+#39+PS_Status+#39+', Termino = '+#39+PS_Termino+#39+', QtdRespondidas = '+IntToStr(VI_TotalItens)+VS_Where)
   end
   else
   begin
      if PS_Inicio = '' then
         Funcoes.ExecusaoQuery('Update TesteAplicacao set Status = '+#39+PS_Status+#39+', QtdRespondidas = '+PS_QtdRespondidas+VS_Where)
      else
         Funcoes.ExecusaoQuery('Update TesteAplicacao set Status = '+#39+PS_Status+#39+', Inicio = '+#39+PS_Inicio+#39+',QtdRespondidas = '+PS_QtdRespondidas+VS_Where);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Gravar o Resultado da Prova
//------------------------------------------------------------------------------

procedure TForm_Prova.GravaResultado;
var
   VS_RESP: String;
   VI_ContResp: Integer;
begin
   VS_RESP:= '';
   for VI_ContResp:= 1 to VI_TotalItens do
       VS_RESP:= VS_RESP+MResposta[VI_ContResp];

   Funcoes.ExecusaoQuery('Update RespostaAluno set OPCAOVETOR = '+#39+VS_RESP+#39+', GABARITO = '+#39+VS_Gabarito+#39+VS_Where);
end;

//------------------------------------------------------------------------------
// Tratamento de controle do Tempo
//------------------------------------------------------------------------------

procedure TForm_Prova.JvClock_TempoTime(Sender: TObject; Value: String);
begin
   Label_Rede.Caption:= Funcoes.GetDispRede;
   Label_BD.Caption:= Funcoes.GetDispBD;

   if  VS_InicioProva <> '' then
      Label_TempoProva.Caption:= TimeToStr(StrToTime(VS_InicioProva)-Time);

   if not DM.IBDatabase_Ensino.TestConnected then
      Funcoes.Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
   else
   begin
      if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'APLICAR' then
      begin
         Table_Teste.Close;
         Table_Teste.Open;
      end;

      if Table_Teste.FieldByName('Status_Aplicacao').AsString <> 'APLICAR' then
      begin
         if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'FINALIZADA' then
         begin
            ShowMessage('A Prova foi encerrada...');
            GravaResultado;
            GravaTesteAplicacao('Encerrado', '', TimeToStr(Time), IntToStr(VI_QtdItens));
            Application.Terminate;
         end
         else
         begin
            if Table_Teste.FieldByName('status_aplicacao').AsString = 'ANDAMENTO' then   //--- Andamento
            begin
               if Panel_Ferramenta.Visible = False then
               begin
                  Panel_Ferramenta.Visible:= True;
                  Funcoes.AjustaHora;
                  Funcoes.OpenQuery('Select Status From TesteAplicacao '+VS_Where);

                  if DM.IBQuery_Executa.FieldByName('Status').AsString = 'Iniciar' then
                  begin
                     Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'InicioProva_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
                     IniciarProva
                  end
                  else
                  begin
                     Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'RestaurarProva_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
                     RestaurarResposta;
                  end;
               end;
            end
            else
            begin
               if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'ENCERRADA' then
               begin
                  TratarItensParaRevisao;
               end
               else
               begin
                  if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'DISCUSSÃO' then
                  begin
                     if DBGrid_Resultado.Visible = False then
                        DBGrid_Resultado.Visible:= True;

                     Query_GabaritoProva.Open;
                     if Query_GabaritoProva.Locate('NumeroQuestao', Table_Teste.FieldByName('NUMITEM_REVISAO').AsString, []) then
                     begin
                        if VS_ItemSel <> Table_Teste.FieldByName('NUMITEM_REVISAO').AsString then
                        begin
                           if ClientDataSet_resultado.Locate('NumQuestao', Table_Teste.FieldByName('NUMITEM_REVISAO').AsString, [])then
                             //

                           VS_ItemSel:= Query_GabaritoProva.FieldByName('NumeroQuestao').AsString;
                           Editor_Prova.Lines.Clear;
                           MostraItemDaProva(Table_Teste.FieldByName('NUMITEM_REVISAO').AsString);

                           if ClientDataSet_resultado.Locate('NumQuestao', Table_Teste.FieldByName('NUMITEM_REVISAO').AsString, [])then
                              PosicaoBotaoRevisao:= (  ClientDataSet_resultado.FieldByName('NumQuestao').AsInteger*16)+2;
//                          PosicaoBotaoRevisao:= (  Query_GabaritoProva.FieldByName('NumQuestao').AsInteger*16)+2;
                           JvButton_MarcarParaRevisao.Top:= PosicaoBotaoRevisao;
                        end;
                     end;
                   end
                   else
                   begin
                      if Panel_Ferramenta.Visible = False then
                          Panel_Ferramenta.Visible:= True;

                      if DM.IBQuery_Executa.FieldByName('Status').AsString = 'Parar' Then
                      begin
                         ShowMessage('A Prova foi encerrada pelo Fiscal...');
                         Application.Terminate;
                      end;
                   end;
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para marcar a questao errada
//------------------------------------------------------------------------------

procedure TForm_Prova.DBGrid_ResultadoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  Icon: TBitmap;
begin
   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'DISCUSSÃO' then
   begin
      if Panel_BotaoProva.Visible = False then
         Panel_BotaoProva.Visible:= True;

      ShowScrollBar(DBGrid_Resultado.Handle,SB_VERT,False); //Remove barra Vertical

      if odd(ClientDataSet_resultado.RecNo) then
         DBGrid_Resultado.Canvas.Brush.Color:= $00B9FFFF
      else
         DBGrid_Resultado.Canvas.Brush.Color:= clCream;

      TDbGrid(Sender).Canvas.font.Color:= clBlack;
         if gdSelected in State then
         with (Sender as TDBGrid).Canvas do
           begin
             Brush.Color := $00C08000;
             FillRect(Rect);
             Font.Style := [fsbold]
           end;

      TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

      if Column.FieldName = 'Erro' then
      begin
         if ClientDataSet_resultado.FieldByName('Erro').AsString = 'E' then
            DBGrid_Resultado.Canvas.Brush.Color:= ClRed
         else
            if ClientDataSet_resultado.FieldByName('Erro').AsString = 'B' then
               DBGrid_Resultado.Canvas.Brush.Color:= clWhite
            else
               DBGrid_Resultado.Canvas.Brush.Color:= $004080FF;
      end;
      DBGrid_Resultado.Canvas.FillRect(Rect);
      DBGrid_Resultado.DefaultDrawColumnCell(Rect, DataCol, Column, State);


   Icon := TBitmap.Create;
   if (Column.FieldName = 'Revisao') then
   begin
     with DBGrid_Resultado.Canvas do
     begin
        Brush.Color := clWhite;
        FillRect(Rect);
        if ClientDataSet_resultado.FieldByName('Revisao').AsString = 'X' then
           ImageList1.GetBitmap(1, Icon)
        else
           ImageList1.GetBitmap(0, Icon);
        Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
     end;
   end;

   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para setar o item para Revisão
//------------------------------------------------------------------------------

procedure TForm_Prova.JvButton_MarcarParaRevisaoClick(Sender: TObject);
begin
   if not DM.IBDatabase_Ensino.TestConnected then
      Funcoes.Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
   else
   begin
      if ClientDataSet_resultado.FieldByName('ERRO').AsString = 'B' then
      begin
          ShowMessage('Não é possível fazer solcitação de Revisão para resposta em Branco');
      end
      else
      begin
         ClientDataSet_resultado.Edit;
         if ClientDataSet_resultado.FieldByName('Revisao').AsString = 'X' then
            ClientDataSet_resultado.FieldByName('Revisao').AsString:= ''
         else
            ClientDataSet_resultado.FieldByName('Revisao').AsString:= 'X';
         ClientDataSet_resultado.Post;
         Update;
         Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'Discussão_Revisar'+'_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para setar o item para Revisão
//------------------------------------------------------------------------------

procedure TForm_Prova.TratarCalculadora(Status: Boolean);
begin
   JvButton_MarcarParaRevisao.Visible:= Status;
   Label_Calculadora.Visible:= Status;
   JvCalcEdit_Calculadora.Visible:= Status;
   Panel_Calculadora.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento das Solicitacoes de Revisao
//------------------------------------------------------------------------------

procedure TForm_Prova.TratarItensParaRevisao;
var
   VS_Comando: String;
   Ano, Mes, Dia : word;
begin
   DBGrid_Resultado.Visible:= False;
   VS_Comando:= '';
   DecodeDate (Date, Ano, Mes, Dia);
   ClientDataSet_resultado.First;
   While not ClientDataSet_resultado.Eof do
   begin
      Update;
      if ClientDataSet_resultado.FieldByName('Revisao').AsString = 'X' then
      begin
         if not DM.IBDatabase_Ensino.TestConnected then
            Funcoes.Tratar_MsgErroServidor('Servidor do Banco de questões disponível')
         else
         begin
            VS_Comando:= 'Insert into TestePedidoRevisaoItem (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Identidade, NumItem, NumeroQuestao, RespGabarito, RespAluno, DataPedido, Argumentacao_Aluno, Providencia_Aluno)'+
                         ' Values ('+DM.Query_Usuario.FieldByName('IdCurso').AsString+', '+
                                    DM.Query_Usuario.FieldByName('IdTurma').AsString+', '+
                                    #39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+', '+
                                    #39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+', '+
                                    #39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+', '+
                                    #39+DM.Query_Usuario.FieldByName('Identidade').AsString+#39+', '+
                                    ClientDataSet_resultado.FieldByName('NumItem').AsString+', '+
                                    ClientDataSet_resultado.FieldByName('NumQuestao').AsString+', '+
                                    #39+ClientDataSet_resultado.FieldByName('Correta').AsString+#39+', '+
                                    #39+ClientDataSet_resultado.FieldByName('Resp').AsString+#39+', '+
                                    #39+IntToStr(Dia)+'.'+IntToStr(Mes)+'.'+IntToStr(Ano)+#39+', '+
                                    #39+''+#39+', '+
                                    #39+''+#39+
                                  ')';
             Funcoes.ExecusaoQuery(VS_Comando);
         end;
      end;
      ClientDataSet_resultado.Next;
   end;

   if VS_Comando = '' then
   begin
      Form_Abertura.Fecha_Sistama:= 1;
      Application.Terminate;
   end
   else
   begin
      Form_Abertura.Fecha_Sistama:= 2;
      Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para maxmizar a tela
//------------------------------------------------------------------------------

procedure TForm_Prova.FormShow(Sender: TObject);
var
   r : TRect;
begin
   SystemParametersInfo(SPI_GETWORKAREA, 0, @r,0) ;
   SetBounds(r.Left, r.Top, r.Right-r.Left, r.Bottom-r.Top) ;
end;

//------------------------------------------------------------------------------
// Regula tamanho de tela
//------------------------------------------------------------------------------

Function TForm_Prova.SetScreenResolution(Width, Height: integer): Longint;
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
// Tratamento para desabilitar as principais teclas
//------------------------------------------------------------------------------

procedure TForm_Prova.Editor_ProvaKeyPress(Sender: TObject; var Key: Char);
begin
   Editor_Prova.SelAttributes.Color := ClRed;
end;

//------------------------------------------------------------------------------
// Tratamento para travar as teclas de comando
//------------------------------------------------------------------------------

procedure TForm_Prova.Editor_ProvaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ((Key = VK_DELETE) or (Key = VK_RETURN) or (Key = VK_TAB) or (Key = VK_CONTROL) or (Key = VK_SNAPSHOT)) then
       Key := 0;
end;

//------------------------------------------------------------------------------
// Tratamento para setar a opcão da questao selecionada
//------------------------------------------------------------------------------

procedure TForm_Prova.RestaurarResposta;
var
  i, Cont_Item,  VI_NumeroQuestao, VI_Total: integer;
begin
   if Table_Teste.FieldByName('Inicio_Aplicacao').AsString = '00:00:00' then
      VS_InicioProva:= TimeToStr(Time)
   else
      VS_InicioProva:= Copy(Table_Teste.FieldByName('Inicio_Aplicacao').AsString,12,5)+':00';

   VI_QtdItens:= 0;

   TratarCalculadora(True);
   PsyRichEdit_Resposta.Visible:= True;
   Documento.Visible:= False;

   Panel_TrataQuestoes.Visible:= True;
   Panel_TrataRespostaItens.Visible:= True;

   JvShape_VisualizarProva.Visible:= True;
   JvTransparentButton_VisualizarProva.Visible:= True;

   JvShape_EncerrarProva.Visible:= True;
   JvTransparentButton_EncerrarProva.Visible:= True;

   Panel_Prova.Visible:= True;

   Open_GabaritoProva(' Order By GP.Questao');

   Panel_BotoesSelecaoItens.Top:= 11;
   VI_TotalItens:= Table_Teste.FieldByName('TotalItens').AsInteger;
   i:= 0;

   For Cont_Item:= 1 to VI_TotalItens do
   begin
     i:= i+1;

     Case i of
       1 : begin
             ClientDataSet_ItemProva.Append;
             ClientDataSet_ItemProva.FieldByName('Item1').AsString:= FormatFloat('00', Cont_Item);
           end;
       2 : begin
             ClientDataSet_ItemProva.FieldByName('Item2').AsString:= FormatFloat('00', Cont_Item);
           end;
       3 : begin
             ClientDataSet_ItemProva.FieldByName('Item3').AsString:= FormatFloat('00', Cont_Item);
             ClientDataSet_ItemProva.Post;
             i:= 0;
           end;
     end;

     Query_GabaritoProva.Next;
   end;
   if (ClientDataSet_ItemProva.State = DSInsert) or (ClientDataSet_ItemProva.State = DSEdit ) then
       ClientDataSet_ItemProva.Post;

   PsyRichEdit_Resposta.Lines.Clear;

   VI_Total:= length(trim(VS_RespostaAluno));
   For VI_NumeroQuestao:= 1 to VI_Total  do
   begin
      if ClientDataSet_ItemProva.Locate('Item1', IntToStr(VI_NumeroQuestao), []) then
      begin
         ClientDataSet_ItemProva.Edit;
         if trim(copy(VS_RespostaAluno,VI_NumeroQuestao, 1)) = '' then
             ClientDataSet_ItemProva.FieldByName('Resp1').AsString:= ' '
         else
             ClientDataSet_ItemProva.FieldByName('Resp1').AsString:= 'X';
         ClientDataSet_ItemProva.Post;
      end
      else
      begin
         if ClientDataSet_ItemProva.Locate('Item2',IntToStr(VI_NumeroQuestao), []) then
         begin
            ClientDataSet_ItemProva.Edit;
            if trim(copy(VS_RespostaAluno,VI_NumeroQuestao, 1)) = '' then
                ClientDataSet_ItemProva.FieldByName('Resp2').AsString:= ' '
            else
                ClientDataSet_ItemProva.FieldByName('Resp2').AsString:= 'X';
            ClientDataSet_ItemProva.Post;
         end
         else
         begin
            if ClientDataSet_ItemProva.Locate('Item3', IntToStr(VI_NumeroQuestao), []) then
            begin
               ClientDataSet_ItemProva.Edit;
               if trim(copy(VS_RespostaAluno,VI_NumeroQuestao, 1)) = '' then
                   ClientDataSet_ItemProva.FieldByName('Resp3').AsString:= ' '
               else
                   ClientDataSet_ItemProva.FieldByName('Resp3').AsString:= 'X';
               ClientDataSet_ItemProva.Post;
            end;
         end;
      end;
      MResposta[VI_NumeroQuestao]:= Copy(VS_RespostaAluno, VI_NumeroQuestao, 1);
      PsyRichEdit_Resposta.Lines.Add(FormatFloat('00', VI_NumeroQuestao)+' - '+MResposta[VI_NumeroQuestao])
   end;

   VI_Total:= VI_Total+1;
   For VI_NumeroQuestao:= VI_Total to VI_TotalItens  do
   begin
     MResposta[VI_NumeroQuestao]:= ' ';
     PsyRichEdit_Resposta.Lines.Add(FormatFloat('00', VI_NumeroQuestao)+' - '+MResposta[VI_NumeroQuestao]);
   end;

   Query_GabaritoProva.First;

   Editor_Prova.Lines.Clear;
   MostraItemDaProva(Query_GabaritoProva.FieldByName('Questao').AsString);
   MostrarRespostas(Query_GabaritoProva.FieldByName('Questao').AsInteger);
   PosiconarNoItemSelecionado('01');
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o programa
//------------------------------------------------------------------------------

procedure TForm_Prova.JvTransparentButton_FecharPrograma_Click(Sender: TObject);
var
   VS_Msg: String;
begin
   VS_Msg:= #13+#13+'Sua avaliação será encerrada para mudança de computador'+#13+
                    'suas respostas não serão perdidas,'+#13+
                    'não esqueça de avisar ao Fiscal de Prova,'+#13+#13+
                    'Deseja realmente fechar a prova...';

   if  Application.MessageBox(PChar(VS_Msg), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
   begin
      Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'FecharProva_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
      FecharProva;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a Prova
//------------------------------------------------------------------------------

Procedure TForm_Prova.FecharProva;
begin
   Form_Abertura.Fecha_Sistama:= 1;
   GravaResultado;
   Funcoes.ExecusaoQuery(' Update TesteAplicacao set ProvaAberta = '+#39+''+#39+VS_Where);
   Application.Terminate;
end;

//------------------------------------------------------------------------------
// Tratamento da mensagem de itens faltantes
//------------------------------------------------------------------------------

Function TForm_Prova.ProcessarItensNaoRespondidos: String;
var
   VS_Sel, VS_Msg: String;
begin
   VS_Msg:= '';
   VS_Sel:= '';
   ClientDataSet_ItemProva.First;
   While not ClientDataSet_ItemProva.Eof do
   begin
      if ClientDataSet_ItemProva.FieldByName('Resp1').AsString <> 'X' then
         if ClientDataSet_ItemProva.FieldByName('Item1').AsString <> '' then
            VS_Sel:= VS_Sel+ClientDataSet_ItemProva.FieldByName('Item1').AsString+', ';

      if ClientDataSet_ItemProva.FieldByName('Resp2').AsString <> 'X' then
         if ClientDataSet_ItemProva.FieldByName('Item2').AsString <> '' then
            VS_Sel:= VS_Sel+ClientDataSet_ItemProva.FieldByName('Item2').AsString+', ';

      if ClientDataSet_ItemProva.FieldByName('Resp3').AsString <> 'X' then
         if ClientDataSet_ItemProva.FieldByName('Item3').AsString <> '' then
            VS_Sel:= VS_Sel+ClientDataSet_ItemProva.FieldByName('Item3').AsString+', ';

      if VS_Sel <> '' then
         VS_Sel:= VS_Sel+#13;
      ClientDataSet_ItemProva.Next;
   end;

   if VS_Sel <> '' then
      VS_Msg:= 'Falta responder os itens: '+#13+VS_Sel;

   ProcessarItensNaoRespondidos:= VS_Msg;
end;


end.
