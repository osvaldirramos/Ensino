unit AplicacaoProva;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, DBTables, Db, Buttons, Grids, DBGrids, ComCtrls,
  ExtCtrls, Rotinas, JvBaseThumbnail, JvThumbImage,
  JvGradient, IBTable, IBCustomDataSet, IBQuery,Shellapi, JvGIF, JvEdit,
  JvComponent, JvGroupHeader, TeEngine, Series, TeeProcs, Chart, DbChart,
  JvTransBtn, JvGradientCaption, DBClient, PsyRichEdit, JvRichEd,
  JvDBRichEd, JvComCtrls, JvClock,

  Variants, jpeg,  midaslib, JvShape, JvButton;

type
  TForm_AplicacaoProva = class(TForm)
    Panel_Botoes_CabecalhoProva: TPanel;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documentacao: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    JvGradient4: TJvGradient;
    JvPageControl_Prova: TJvPageControl;
    TabSheet_CapaProva: TTabSheet;
    Documento: TJvDBRichEdit;
    TabSheet_AcompanhamentoProva: TTabSheet;
    TabSheet_DiscucaoProva: TTabSheet;
    IBQuery_TesteAplicacao: TIBQuery;
    DSQ_TesteAplicacao: TDataSource;
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
    Table_TesteHAB_ELABORACAO: TIBStringField;
    Table_TesteSTATUS_APLICACAO: TIBStringField;
    Table_TesteINICIO_APLICACAO: TDateTimeField;
    Table_TesteTERMINO_APLICACAO: TDateTimeField;
    Label2: TLabel;
    Label_Msg_Inicio: TLabel;
    DBEdit_StatusAplicacao: TDBEdit;
    DST_Teste: TDataSource;
    IBQuery_TesteAplicacaoIDCURSO: TSmallintField;
    IBQuery_TesteAplicacaoIDTURMA: TIntegerField;
    IBQuery_TesteAplicacaoFASEAPLICACAO: TIBStringField;
    IBQuery_TesteAplicacaoREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_TesteAplicacaoCODMATERIA: TIBStringField;
    IBQuery_TesteAplicacaoIDENTIDADE: TIBStringField;
    IBQuery_TesteAplicacaoSTATUS: TIBStringField;
    IBQuery_TesteAplicacaoINICIO: TIBStringField;
    IBQuery_TesteAplicacaoTERMINO: TIBStringField;
    IBQuery_TesteAplicacaoQTDRESPONDIDAS: TIntegerField;
    IBQuery_TesteAplicacaoNOMECOMPLETO: TIBStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel_TrataQuestoes: TPanel;
    JvDBRichEdit1: TJvDBRichEdit;
    Panel_TrataRespostaItens: TPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    JvGradient2: TJvGradient;
    DBGrid_Itens: TDBGrid;
    JvGradientCaption_Cabec1: TJvGradientCaption;
    Splitter1: TSplitter;
    Query_GabaritoProva: TIBQuery;
    DSQ_GabaritoProva: TDataSource;
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
    DSC_ItemProva: TDataSource;
    JvDBRichEdit_MontaItem: TJvDBRichEdit;
    Editor_Prova: TPsyRichEdit;
    Panel_ItemSelecionado: TPanel;
    Edit_Linha: TEdit;
    Panel_Resposta: TPanel;
    DBText1: TDBText;
    JvGradient3: TJvGradient;
    Shape7: TShape;
    Shape8: TShape;
    Label1: TLabel;
    Label9: TLabel;
    Shape9: TShape;
    Label13: TLabel;
    Label_Instrutor: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Label_Curso: TLabel;
    Label_Turma: TLabel;
    Label_Referencia_Prova: TLabel;
    Label_Data_Prova: TLabel;
    Label4: TLabel;
    Table_TesteNUMITEM_REVISAO: TSmallintField;
    Query_GabaritoProvaNUMEROQUESTAO: TIntegerField;
    Query_GabaritoProvaNUMITEM: TIntegerField;
    Query_GabaritoProvaQUESTAO: TIntegerField;
    Query_GabaritoProvaDESCENALT: TBlobField;
    Query_GabaritoProvaRESPOSTACORRETA: TIBStringField;
    Image_Brasao: TImage;
    JvShape_fecharPrograma: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_IniciaProva: TJvTransparentButton;
    JvTransparentButton_EncerraProva: TJvTransparentButton;
    JvTransparentButton_DiscussaoProva: TJvTransparentButton;
    JvTransparentButton_FinalizaDiscussaoProva: TJvTransparentButton;
    Label5: TLabel;
    PsyRichEdit_RoteiroProva: TPsyRichEdit;
    Label6: TLabel;
    Panel5: TPanel;
    JvClock_Tempo: TJvClock;
    Label_Msg_Termino: TLabel;
    Panel_Termino: TPanel;
    Label_Termino: TLabel;
    Panel_Inicio: TPanel;
    Label_Inicio: TLabel;
    Panel_BotaoProva: TPanel;
    JvGradient7: TJvGradient;
    JvButton_InterromperProva: TJvButton;
    IBQuery_TesteAplicacaoPROVAABERTA: TIBStringField;
    JvButton_RetornaProva: TJvButton;
    DBText2: TDBText;
    DBGrid_AplicacaoProva: TDBGrid;
    JvShape_RetornarProva: TJvShape;
    JvShape_interromper: TJvShape;
    IBQuery_TesteAplicacaoNOMEGUERRA: TIBStringField;
    DBText3: TDBText;
    Label_Versao: TLabel;

    Function SetScreenResolution(Width, Height: integer): Longint;  // tamanho da tela

    procedure BotoesTrataAluno(VB_Status: Boolean);
    procedure Trocar(Trocar: String; Por: String);

    procedure RoteiroProva( PI_Roteiro: Integer );
    procedure TratarTempoProva(Status: boolean);
    procedure PosiconarNoItemSelecionado(VS_Linha: String);
    procedure MostraItemDaProva(VS_NumeroQuestao: String);
    procedure IniciarProva;
    procedure ModificarPara(Trocar: String; Por: String);

    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_IniciaProvaClick(Sender: TObject);
    procedure JvTransparentButton_EncerraProvaClick(Sender: TObject);
    procedure JvTransparentButton_DiscussaoProvaClick(Sender: TObject);
    procedure DBGrid_ItensCellClick(Column: TColumn);
    procedure DBGrid_ItensDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvTransparentButton_FinalizaDiscussaoProvaClick( Sender: TObject);
    procedure JvClock_TempoTime(Sender: TObject; Value: String);
    procedure DBGrid_AplicacaoProvaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvButton_InterromperProvaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvButton_RetornaProvaClick(Sender: TObject);
    procedure DBGrid_AplicacaoProvaCellClick(Column: TColumn);
  private    { Private declarations }
     VI_TotalItens : Integer;
     VB_StatusAnterior: Boolean;

     oldwidth:integer;
     OldHeight :integer;
     Auxwidth:integer;
     Auxheight:integer ;
  public
    { Public declarations }
  end;

var
  Form_AplicacaoProva: TForm_AplicacaoProva;

implementation

uses Module;

{$R *.dfm}

procedure TForm_AplicacaoProva.FormActivate(Sender: TObject);
begin
   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg');

   Label_Versao.Caption:= Versao;
   VB_StatusAnterior:= False;
   BotoesTrataAluno(VB_StatusAnterior);

   Funcoes.AjustaHora;    //--- Ajusta a hoara pelo servidor

   //--- Abre a Prova que esta sendo aplicada

   // Pega o Codigo do Curso e o Codigo da Turma

   Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select CodCurso, Turma '+
                                             ' From Turmas_Em_Andamento_View '+
                                             ' Where IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                                             ' and   Idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString
                       );

   Label_Curso.Caption:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;
   Label_Turma.Caption:= DM.IBQuery_Executa.FieldByName('Turma').AsString;

   Label_Instrutor.Caption:= DM.Query_Usuario.FieldByName('Nome').AsString+' (' +DM.Query_Usuario.FieldByName('NomeGuerra').AsString+')';
   Label_Referencia_Prova.Caption:= DM.Query_Usuario.FieldByName('CodProva').AsString;
   Label_Data_Prova.Caption:= DM.Query_Usuario.FieldByName('DataAplicacao').AsString;


   Funcoes.ExecutaQuery( IBQuery_TesteAplicacao, 'Select t.IdCurso, t.IdTurma, t.FaseAplicacao, t.ReferenciaAvaliacao, t.CodMateria, t.Identidade, t.Status, t.Inicio, t.Termino, t.QtdRespondidas, a.nomeGuerra, a.nomecompleto, t.ProvaAberta '+
                                                 ' From testeaplicacao t, Aluno_Turmas_Em_Andamento_View a '+
                                                 ' Where   t.IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                                                 ' and   t.Idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString+
                                                 ' and   t.FaseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
                                                 ' and   t.ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                                 ' and   t.CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
                                                 ' and   a.IdCurso = T.idcurso '+
                                                 ' and   a.IdTurma = t.IdTurma '+
                                                 ' and   a.identidade = t.Identidade '+
                                                 ' Order By a.NomeCompleto '
                       );

   IBQuery_Documento.Open;

   ModificarPara('#Itens', '20');

   Table_Teste.Open;

   //--- Tratamento dos botoes


   JvTransparentButton_EncerraProva.Top:= 172;
   JvTransparentButton_DiscussaoProva.Top:= 172;
   JvTransparentButton_FinalizaDiscussaoProva.Top:= 172;

   JvTransparentButton_IniciaProva.Visible:= False;
   JvTransparentButton_EncerraProva.Visible:= False;
   JvTransparentButton_DiscussaoProva.Visible:= False;
   JvTransparentButton_FinalizaDiscussaoProva.Visible:= False;

   TabSheet_AcompanhamentoProva.TabVisible:= False;
   TabSheet_DiscucaoProva.TabVisible:= False;

   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'FINALIZADA' then
   begin
      TratarTempoProva(False);
      Table_Teste.Edit;
      Table_Teste.FieldByName('Status_Aplicacao').AsString:= 'DISCUSSÃO';
      Table_Teste.FieldByName('NumItem_Revisao').AsString:= '1';
      Table_Teste.Post;
      Funcoes.ExecutaTransacao;
   end;

   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'APLICAR' then
   begin
      TratarTempoProva(False);
      RoteiroProva( 1 );
      JvTransparentButton_IniciaProva.Visible:= True;
   end
   else
   begin
      if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'ANDAMENTO' then
      begin
         RoteiroProva( 2 );
         TratarTempoProva(True);
         JvTransparentButton_EncerraProva.Visible:= True;
         TabSheet_AcompanhamentoProva.TabVisible:= True;
         JvPageControl_Prova.TabIndex:= 1;
      end
      else
      begin
         if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'DISCUSSÃO' then
         begin
            TratarTempoProva(False);
            RoteiroProva( 2 );
            JvPageControl_Prova.TabIndex:= 2;
            JvTransparentButton_DiscussaoProva.Visible:= True;

            TabSheet_AcompanhamentoProva.TabVisible:= True;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.ModificarPara(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Documento.FindText(Trocar, 0, Length(Documento.Text), []);
  if Posicao > 0 then
  begin
    Documento.SelStart := Posicao;
    Documento.SelLength := Length(Trocar);
    Documento.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do botão Winodows
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.JvTransparentButton_WindowsClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Confirma o fechamento do programa ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Table_Teste.Close;
      IBQuery_Documento.Close;
      Application.Terminate;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para controlar o tempo de prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.TratarTempoProva(Status: boolean);
begin
   Label_Msg_Inicio.Visible:= Status;
   Label_Msg_Termino.Visible:= Status;

   Panel_Inicio.Visible:= Status;
   Panel_Termino.Visible:= Status;

   if Status = True then
   begin
      Label_Inicio.Caption:= Copy(Table_Teste.FieldByName('Inicio_Aplicacao').AsString,12,5)+':00';
      Label_Termino.Caption:= Copy(TimeToStr(StrToTime(Label_Inicio.Caption)+StrToTime('1:20:00')), 1,5)+':00';
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para iniciar a Prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.JvTransparentButton_IniciaProvaClick(Sender: TObject);
begin
   TabSheet_AcompanhamentoProva.TabVisible:= True;

   JvTransparentButton_IniciaProva.Visible:= False;
   JvTransparentButton_EncerraProva.Visible:= True;

   Table_Teste.Edit;
   Table_Teste.FieldByName('Status_Aplicacao').AsString:= 'ANDAMENTO';
   Table_Teste.FieldByName('Inicio_Aplicacao').AsString:= DateToStr(Date)+Copy(TimeToStr(Time),1,5);
   Table_Teste.Post;
   Funcoes.ExecutaTransacao;

   JvPageControl_Prova.TabIndex:= 1;
   TratarTempoProva(True);
end;

//------------------------------------------------------------------------------
// Tratamento do botão de encerrar a Prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.JvTransparentButton_EncerraProvaClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Confirma o encerramento da Prova ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      RoteiroProva( 2 );

      TratarTempoProva(False);

      JvTransparentButton_EncerraProva.Visible:= False;
      JvTransparentButton_DiscussaoProva.Visible:= True;

      TabSheet_CapaProva.TabVisible:= False;
      TabSheet_AcompanhamentoProva.TabVisible:= True;

      Table_Teste.Edit;
      Table_Teste.FieldByName('Status_Aplicacao').AsString:= 'FINALIZADA';
      Table_Teste.FieldByName('Termino_Aplicacao').AsString:= DateToStr(Date)+Copy(TimeToStr(Time),1,5);
      Table_Teste.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botão de Discucao da Prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.JvTransparentButton_DiscussaoProvaClick(Sender: TObject);
begin
   RoteiroProva( 3 );

   JvShape_fecharPrograma.Visible:= False;
   JvTransparentButton_Windows.Visible:= False;
   JvTransparentButton_DiscussaoProva.Visible:= False;
   JvTransparentButton_FinalizaDiscussaoProva.Visible:= True;
   TabSheet_DiscucaoProva.TabVisible:= True;
   JvPageControl_Prova.TabIndex:= 2;

   Editor_Prova.Lines.Clear;

   Funcoes.ExecutaQuery( Query_GabaritoProva, 'Select GP.IdCurso, GP.idturma, GP.faseAplicacao, GP.ReferenciaAvaliacao, GP.NumeroQuestao, GP.NumItem, GP.Questao, ID.DescEnAlt, Id.RespostaCorreta, GP.Gabarito '+
                                              ' From  GabaritoProva GP,  Item_Desc ID '+
                                              ' Where GP.IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                                              ' and   GP.idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString+
                                              ' and   GP.faseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
                                              ' and   GP.ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+
                                              ' and   GP.CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
                                              ' and   GP.NumItem = ID.NumItem '+
                                              ' Order By GP.NumeroQuestao '
                       );

   IniciarProva;

   Table_Teste.Edit;
   Table_Teste.FieldByName('Status_Aplicacao').AsString:= 'DISCUSSÃO';
   Table_Teste.FieldByName('NumItem_Revisao').AsString:= '1';
   Table_Teste.Post;
   Funcoes.ExecutaTransacao;

   Query_GabaritoProva.First;
   Editor_Prova.Lines.Clear;
   MostraItemDaProva(Query_GabaritoProva.FieldByName('NumeroQuestao').AsString);
   PosiconarNoItemSelecionado(Edit_Linha.Text);
end;

//------------------------------------------------------------------------------
// Iniciar Prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.IniciarProva;
var
   Cont_Item, i: Integer;
begin
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
end;

//------------------------------------------------------------------------------
// Posiciona no Item Anterior
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.PosiconarNoItemSelecionado(VS_Linha: String);
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
// Mostra o Iten da Prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.MostraItemDaProva(VS_NumeroQuestao: String);
begin
   VS_NumeroQuestao:= FormatFloat('00',StrToInt(VS_NumeroQuestao));
   Edit_Linha.Text:= VS_NumeroQuestao;

   JvDBRichEdit_MontaItem.SelectAll;
   JvDBRichEdit_MontaItem.CopyToClipboard ;

   Editor_Prova.SelStart:= 0;  //5
   Editor_Prova.PasteFromClipboard ;
   Editor_Prova.SelStart:= 0;  //5
   Trocar('#N', VS_NumeroQuestao);
   Update;
end;

//------------------------------------------------------------------------------
//  Tratamento quando posiciona no item atraves do Clique
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.DBGrid_ItensCellClick(Column: TColumn);
begin
   if Column.Field.Text <> '' then
   begin
      Editor_Prova.Lines.Clear;
      if Query_GabaritoProva.Locate('NumeroQuestao', Column.Field.Text, []) then
      begin
         MostraItemDaProva(Column.Field.Text);
         Table_Teste.Edit;
         Table_Teste.FieldByName('NumItem_Revisao').AsString:= Edit_Linha.Text;
         Table_Teste.Post;
         Funcoes.ExecutaTransacao;
      end;
      PosiconarNoItemSelecionado(Column.Field.Text);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar os itens ja veriticado
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.DBGrid_ItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'DISCUSSÃO' then
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
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel do texto
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.Trocar(Trocar: String; Por: String);
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
// Tratamento para finalizar a discussão
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.JvTransparentButton_FinalizaDiscussaoProvaClick( Sender: TObject);
begin
   Table_Teste.Edit;
   Table_Teste.FieldByName('Status_Aplicacao').AsString:= 'ENCERRADA';
   Table_Teste.FieldByName('Termino_Aplicacao').AsString:= DateToStr(Date);
   Table_Teste.Post;
   Funcoes.ExecutaTransacao;

   JvTransparentButton_WindowsClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para atualizar as informacoes da aplicacao da prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.JvClock_TempoTime(Sender: TObject; Value: String);
begin
   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'ANDAMENTO' then
      Funcoes.AtualizaQuery(IBQuery_TesteAplicacao);
end;

//------------------------------------------------------------------------------
// Tratamento para ajustar a tela Regula tamanho de tela
//------------------------------------------------------------------------------

Function TForm_AplicacaoProva.SetScreenResolution(Width, Height: integer): Longint;
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
// Tratamento para apresentar a grid de acompanhamento da aplicacao da prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.DBGrid_AplicacaoProvaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'ANDAMENTO' then
   begin
      if IBQuery_TesteAplicacao.FieldByName('Status').AsString = 'Encerrado' then
         DBGrid_AplicacaoProva.Canvas.Brush.Color:= $00FFCD9B
      else
         if IBQuery_TesteAplicacao.FieldByName('Status').AsString = 'Respondendo' then
            if IBQuery_TesteAplicacao.FieldByName('ProvaAberta').AsString = 'N' then
               DBGrid_AplicacaoProva.Canvas.Brush.Color:= $00DFEEDF
            else
               DBGrid_AplicacaoProva.Canvas.Brush.Color:= ClRed
         else
            if IBQuery_TesteAplicacao.FieldByName('Status').AsString = 'Iniciar' then
               DBGrid_AplicacaoProva.Canvas.Brush.Color:= $009D9DCE;

      if gdSelected in State then
         DBGrid_AplicacaoProva.Canvas.Brush.Color := $00804000;

      DBGrid_AplicacaoProva.Canvas.FillRect(Rect);
      DBGrid_AplicacaoProva.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar a grid de acompanhamento da aplicacao da prova
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.RoteiroProva( PI_Roteiro: Integer );
begin
   PsyRichEdit_RoteiroProva.Lines.Clear;
   PsyRichEdit_RoteiroProva.Lines.Add('ROTEIRO PARA APLICAÇÃO DE PROVA TEÓRICA - '+Table_Teste.FieldByName('Status_Aplicacao').AsString);
   PsyRichEdit_RoteiroProva.Lines.Add('');
   Case PI_Roteiro of
      1 : begin
             PsyRichEdit_RoteiroProva.Lines.Add('1. O fiscal da prova deverá verificar qualquer irregularidade na arrumação da sala. Ex.: Disposição das carteiras, Micros, etc.;');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('2. Colocar próximo à porta de saída a folha de controle de tempo;');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('3. Ler as INSTRUÇÕES AOS ALUNOS a viva voz;');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('4. Para dar início à prova deverá pressionar o botão "Iniciar Prova".');
          end;
      2 : begin
             PsyRichEdit_RoteiroProva.Lines.Add('1. Orientar aos alunos que, no horário previsto, retornem à sala para realização da discussão dirigida de prova;');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('2. Verificar se todos os alunos assinaram a folha de controle de tempo e o cartão de respostas ao término da prova;');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('3. Para inciar a Discussão dirigida o instrutor deverá pressionar o botão "Iniciar a Discussão Prova".');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('4. Caso ocorra de um aluno ter sua prova interrompida bruscamente, e o programa não permitir sua entrada novamente na prova emitindo a mensagem "PROVA ABERTA,..." o instrutor poderá liberar a prova pressionando o botão "Retornar Prova".');
          end;
      3 : begin
             PsyRichEdit_RoteiroProva.Lines.Add('1. Para discução dirigida o Instrutor deverá posicionar no Item a ser discutido;');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('2. Para encerrar a discussão dirigida deverá pressionar o botão "Finalizar Discussão Prova";');
             PsyRichEdit_RoteiroProva.Lines.Add('');
             PsyRichEdit_RoteiroProva.Lines.Add('3. Após clicar no botão "Finalizar Discussão Prova" a prova será encerrada.');
          end;
     end;
end;

//------------------------------------------------------------------------------
// Tratar da aplresentacao da situacao do aluno
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.DBGrid_AplicacaoProvaCellClick( Column: TColumn);
var
   VB_Status: Boolean;
begin
   if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'ANDAMENTO' then
   begin
      if IBQuery_TesteAplicacao.FieldByName('Status').AsString = 'Respondendo' then
         VB_Status:= True
      else
         VB_Status:= True;

      if VB_StatusAnterior <> VB_Status then
      begin
         VB_StatusAnterior:= VB_Status;
         BotoesTrataAluno(VB_StatusAnterior);
      end;
   end
   else
   begin
      if Table_Teste.FieldByName('Status_Aplicacao').AsString = 'DISCUSSÃO' then
      begin
         if IBQuery_TesteAplicacao.FieldByName('Status').AsString = 'Iniciar' then
         begin
            JvButton_RetornaProva.Visible:= False;
            JvShape_RetornarProva.Visible:= False;
         end
         else
         begin
            JvButton_RetornaProva.Visible:= True;
            JvShape_RetornarProva.Visible:= True;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratar da aplresentacao da situacao do aluno
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.BotoesTrataAluno(VB_Status: Boolean);
Begin
   JvButton_InterromperProva.Visible:= VB_Status;
   JvShape_interromper.Visible:= VB_Status;
   JvButton_RetornaProva.Visible:= VB_Status;
   JvShape_RetornarProva.Visible:= VB_Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de interrupcao da prova do aluno
//------------------------------------------------------------------------------

procedure TForm_AplicacaoProva.JvButton_InterromperProvaClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox( PChar('Confirma a interrupção da prova do aluno '+#13+#13+IBQuery_TesteAplicacao.FieldByName('NomeCompleto').AsString+#13+#13+'Confirma a interrupção do registro ?'
                                             ), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_retorno = 0 then
      Funcoes.ExecusaoQuery('Update TesteAplicacao set Status = '+#39+'Interrompido'+#39+
                            ' where IdCurso = '+IBQuery_TesteAplicacao.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+IBQuery_TesteAplicacao.FieldByName('IdTurma').AsString+
                            ' and faseAplicacao = '+#39+IBQuery_TesteAplicacao.FieldByName('FaseAplicacao').AsString+#39+
                            ' and ReferenciaAvaliacao = '+#39+IBQuery_TesteAplicacao.FieldByName('referenciaavaliacao').AsString+#39+
                            ' and CodMateria = '+#39+IBQuery_TesteAplicacao.FieldByName('CodMateria').AsString+#39+
                            ' and Identidade = '+#39+IBQuery_TesteAplicacao.FieldByName('Identidade').AsString+#39
                           );
end;

procedure TForm_AplicacaoProva.JvButton_RetornaProvaClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox(PChar('Confirma o retorno da prova cuja a maquina foi desligada acidentalmente '+#13+#13+IBQuery_TesteAplicacao.FieldByName('NomeCompleto').AsString+#13+#13+'Confirma o retorno da prova ?'
                                            ), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_Retorno = IDYes then
      Funcoes.ExecusaoQuery('Update TesteAplicacao set ProvaAberta = '+#39+'N'+#39+
                            ' where IdCurso = '+IBQuery_TesteAplicacao.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+IBQuery_TesteAplicacao.FieldByName('IdTurma').AsString+
                            ' and faseAplicacao = '+#39+IBQuery_TesteAplicacao.FieldByName('FaseAplicacao').AsString+#39+
                            ' and ReferenciaAvaliacao = '+#39+IBQuery_TesteAplicacao.FieldByName('referenciaavaliacao').AsString+#39+
                            ' and CodMateria = '+#39+IBQuery_TesteAplicacao.FieldByName('CodMateria').AsString+#39+
                            ' and Identidade = '+#39+IBQuery_TesteAplicacao.FieldByName('Identidade').AsString+#39
                           );
end;


end.
