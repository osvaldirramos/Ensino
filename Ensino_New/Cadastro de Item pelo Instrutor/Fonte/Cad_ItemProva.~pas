//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_ItemProva.PAS                              //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos Itens da Prova.                            //
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

unit Cad_ItemProva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvEnterTab, JvTransBtn, JvxClock, JvCombobox, JvColorCombo,
  JvBaseThumbnail, JvThumbImage,  ClipBrd,JvShape;

type
  TForm_Cad_ItemProva = class(TForm)
    Panel1: TPanel;
    JvThumbImage1: TJvThumbImage;
    ToolBar1: TToolBar;
    RecortarButton: TToolButton;
    ColarButton: TToolButton;
    DesfazerButton: TToolButton;
    ToolButton10: TToolButton;
    JvFontComboBox: TJvFontComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    NegritoButton: TToolButton;
    ItalicoButton: TToolButton;
    SublinhadoButton: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_PadronizarFonte: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    ToolButton_Cor: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_InseriImagem: TToolButton;
    ToolButton_Simbolo: TToolButton;
    ToolButton4: TToolButton;
    JvxClock1: TJvxClock;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    PrintDialog1: TPrintDialog;
    ToolButton_Fonte: TToolButton;
    ToolButton_VizuItem: TToolButton;
    ToolButton_InserirHora: TToolButton;
    RichEdit1: TRichEdit;
    Ruler: TPanel;
    RulerLine: TBevel;
    RightInd: TLabel;
    Bevel1: TBevel;
    LeftInd: TLabel;
    FirstInd: TLabel;
    ToolButton6: TToolButton;
    Panel_Area: TPanel;
    DST_ItemProva: TDataSource;
    IBTable_Item_Desc: TIBTable;
    IBTable_Item_DescNUMITEM: TIntegerField;
    IBTable_Item_DescRESPOSTACORRETA: TIBStringField;
    IBTable_Item_DescQDEAPLIC: TSmallintField;
    IBTable_Item_DescQDEIRREGULARIDADE: TSmallintField;
    IBTable_Item_DescQDEANULADA: TSmallintField;
    IBTable_Item_DescPOSSUI_IMAGEM: TIBStringField;
    IBTable_Item_DescRECURSO: TIBStringField;
    IBTable_Item_DescOBSERVACAO: TIBStringField;
    IBTable_Item_DescDESCENALT: TBlobField;
    IBTable_Item_DescNLINHAS: TSmallintField;
    IBTable_Item_DescTEMPORES: TIBStringField;
    DST_ItemDesc: TDataSource;
    IBTable_Item_Prova: TIBTable;
    JvGradient1: TJvGradient;
    Label_Serie: TLabel;
    Label_Tempo_Resposta: TLabel;
    Label_Minuto: TLabel;
    SpeedButton_NLinhas: TSpeedButton;
    Label_Objetivo: TLabel;
    Label_Resposta_Correta: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit_Disc: TDBEdit;
    DBEdit_Unid: TDBEdit;
    DBComboBox_objetivo: TDBComboBox;
    DBComboBox_Serie: TDBComboBox;
    DBComboBox_RespostaCorreta: TDBComboBox;
    DBEdit_TempoResposta: TDBEdit;
    DBEdit_NLinha: TDBEdit;
    DBRichEdit_Observacao: TDBRichEdit;
    Memo_Msg: TMemo;
    DBEdit_CodMateria: TDBEdit;
    DBEdit_SubUni: TDBEdit;
    DBComboBox_PossuiImagem: TDBComboBox;
    DBComboBox_Recurso: TDBComboBox;
    IBTable_Item_ProvaIDTURMA: TIntegerField;
    IBTable_Item_ProvaIDCURSO: TSmallintField;
    IBTable_Item_ProvaNUMITEM: TIntegerField;
    IBTable_Item_ProvaCODMATERIA: TIBStringField;
    IBTable_Item_ProvaDISCIPLINA: TIBStringField;
    IBTable_Item_ProvaUNIDADE: TIBStringField;
    IBTable_Item_ProvaSUBUNIDADE: TIBStringField;
    IBTable_Item_ProvaOBJETIVO: TIBStringField;
    IBTable_Item_ProvaQUARENTENA: TDateTimeField;
    IBTable_Item_ProvaSERIE: TIBStringField;
    IBTable_Item_ProvaSTATUS: TIBStringField;
    JvShape1: TJvShape;
    Label_Usuario: TLabel;
    Edit_Palavra: TEdit;
    JvDBRichEdit_Text: TJvDBRichEdit;
    JvGradient3: TJvGradient;
    JvShape2: TJvShape;
    Label1: TLabel;
    Label6: TLabel;
    DBEdit_NItem: TDBEdit;
    JvGradient2: TJvGradient;
    GroupBox_Palavra: TGroupBox;
    SpeedButton_TransMaiuscula: TSpeedButton;
    SpeedButton_TransMinuscula: TSpeedButton;
    Edit1: TEdit;
    Memo2: TMemo;
    JvShape_Revisar: TJvShape;
    JvTransparentButton_Revisar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;

    procedure VerificaSerie;
    procedure Converte(VS_OpcaoConverte: String);

    procedure NovoItem;
    procedure Alterar;
    procedure TeclasBasicas( Sender: TObject; var Key: Char);
    procedure AjustarItemTurmaBase(VS_IdCurso, VS_NumItem, VS_Status: String);

    procedure FormShow(Sender: TObject);
    procedure DesfazerClick(Sender: TObject);
    procedure RecortarClick(Sender: TObject);
    procedure ColarClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure NegritoButtonClick(Sender: TObject);
    procedure ItalicoButtonClick(Sender: TObject);
    procedure SublinhadoButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton_InseriImagemClick(Sender: TObject);
    procedure ToolButton_SimboloClick(Sender: TObject);
    procedure Formatar_CorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_PadronizarFonteClick(Sender: TObject);
    procedure JvDBRichEdit_TextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBRichEdit_TextSelectionChange(Sender: TObject);
    procedure SpeedButton_NLinhasClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_VizuItemClick(Sender: TObject);
    procedure ToolButton_InserirHoraClick(Sender: TObject);
    procedure SpeedButton_TransMaiusculaClick(Sender: TObject);
    procedure SpeedButton_TransMinusculaClick(Sender: TObject);
    procedure DBEdit_CodMateriaChange(Sender: TObject);
    procedure DBComboBox_objetivoChange(Sender: TObject);
    procedure DBEdit_DiscChange(Sender: TObject);
    procedure DBEdit_UnidChange(Sender: TObject);
    procedure DBEdit_SubUniChange(Sender: TObject);
    procedure DBEdit_DiscKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_UnidKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_SubUniKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_objetivoKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_RespostaCorretaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_TempoRespostaKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_PossuiImagemKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_RecursoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NLinhaKeyPress(Sender: TObject; var Key: Char);
    procedure DBRichEdit_ObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_SerieKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBRichEdit_TextKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_RevisarClick(Sender: TObject);
    procedure IBTable_Item_ProvaPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IBTable_Item_DescPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);

  private
    Tam_Font: integer;

    Fechar, FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    procedure UpdateCursorPos;
    procedure GetFontNames;
    procedure SetupRuler;
    procedure SetEditRect;
    function CurrText: TJvTextAttributes;
  public
      VI_NumItem: Integer;
  end;

var
  Form_Cad_ItemProva: TForm_Cad_ItemProva;

implementation

uses Abertura, Sel_ItemProva, Module, Cad_IndiceFacilidade, ImageWin,
  frmSimbolo;

resourcestring
  sColRowInfo = 'Linha: %3d   Coluna: %3d';

const
  RulerAdj = 4/3;
  GutterWid = 6;
//  FDragging := False;
{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento da Form na sua criacao
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.FormCreate(Sender: TObject);
begin
  Ruler.Width := JvDBRichEdit_Text.Width-15;
  if (Screen.Width = 800) and (Screen.Height = 600) then
  begin
    JvDBRichEdit_Text.Height := 457;
    JvDBRichEdit_Text.Left := round((Screen.Width-JvDBRichEdit_Text.Width)/2);
    Ruler.Left := JvDBRichEdit_Text.Left;
  end
  else
  if (Screen.Width = 1024) and (Screen.Height = 768) then
  begin
    JvDBRichEdit_Text.Height := 625;
    JvDBRichEdit_Text.Left := round((Screen.Width-JvDBRichEdit_Text.Width)/2);
    Ruler.Left := JvDBRichEdit_Text.Left;
  end;

  GetFontNames;
  SetupRuler;
  JvDBRichEdit_TextSelectionChange(Self);

  CurrText.Name := DefFontData.Name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
end;

//------------------------------------------------------------------------------
// Tratamento quando ativar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.FormActivate(Sender: TObject);
begin
   Fechar:= False;
   Funcoes.SetCadCurso('ItemProva');

   Label_Usuario.Caption:= 'Usuário: '+Form_Abertura.MaskEdit_Nome.text;

   IBTable_Item_Prova.Open;
   IBTable_Item_Desc.Open;

   if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
   begin
      JvTransparentButton_Cancelar.Visible:= True;
      JvShape_Cancelar.Visible:= True;

      JvTransparentButton_Revisar.Visible:= False;
      JvShape_Revisar.Visible:= False;
      JvTransparentButton_Gravar.Caption:= '&Gravar';
      NovoItem;
   end
   else
   begin
      JvTransparentButton_Cancelar.Visible:= False;
      JvShape_Cancelar.Visible:= False;

      JvTransparentButton_Revisar.Visible:= True;
      JvShape_Revisar.Visible:= True;
      JvTransparentButton_Gravar.Caption:= '&Alterar';
      Alterar;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   if Fechar = False then
      Action := CaNone
   else
   Begin
      IBTable_Item_Prova.Close;
      IBTable_Item_Desc.Close;
      Action:= caFree;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro do Item
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao novo Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.NovoItem;
var
   Sender: TObject;
begin
   //--- Tratamento do Item referente a Prova

   VI_NumItem:= Funcoes.Ctrl_Item;

//   VI_NumItem:= Funcoes.MaiorCodigo('NumItem', 'Item_Prova');
//   VI_NumItem:= Funcoes.MaiorCodigoComRestricao('NumItem', 'idCurso = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString+' and idTurma = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString, 'Item_Prova');

   //--- Tratamento do Item referente a Prova

   IBTable_Item_Prova.Append;
   IBTable_Item_Prova.FieldByName( 'IdCurso').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString;
   IBTable_Item_Prova.FieldByName( 'IdTurma').AsString:= Form_Abertura.VS_IdTurma;
   IBTable_Item_Prova.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
   IBTable_Item_Prova.FieldByName( 'CodMateria').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString;
   IBTable_Item_Prova.FieldByName( 'DISCIPLINA').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,1,2);
   IBTable_Item_Prova.FieldByName( 'UNIDADE').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,3,2);
   IBTable_Item_Prova.FieldByName( 'SUBUNIDADE').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,5,2);

   //--- Tratamento referente a Descricao do Item

   Funcoes.ExecusaoQuery('Delete From Item_Desc where NumItem = '+IntToStr(VI_NumItem));

   IBTable_Item_Desc.Append;
   IBTable_Item_Desc.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
   IBTable_Item_Desc.FieldByName( 'TempoRes').AsString:= '02';
   IBTable_Item_Desc.FieldByName( 'QdeAplic').AsInteger:= 0;
   IBTable_Item_Desc.FieldByName( 'QdeIrregularidade').AsInteger:= 0;
   IBTable_Item_Desc.FieldByName( 'QdeAnulada').AsInteger:= 0;
   IBTable_Item_Desc.FieldByName( 'Recurso').AsString:= 'N';
   IBTable_Item_Desc.FieldByName( 'Possui_Imagem').AsString:= 'N';

   JvDBRichEdit_Text.Lines.Clear;

//---
  JvDBRichEdit_Text.SelectAll;
  LeftInd.Left:= 22;
  JvDBRichEdit_Text.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-JvDBRichEdit_Text.Paragraph.FirstIndent;

  JvDBRichEdit_TextSelectionChange(Sender);
//----
   //    LeftInd.Left := RulerLine.Left+25;

   JvDBRichEdit_Text.SelAttributes.Size := 11;
   FontDialog1.Font.Size := 11;
   JvDBRichEdit_Text.SelAttributes.Name:= 'Courier New';
   JvDBRichEdit_Text.SelStart:= 0;
   JvDBRichEdit_Text.Lines.Insert(0, '#N - ');

   DBComboBox_objetivo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Altera Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.Alterar;
begin
   IBTable_Item_Prova.Edit;
   IBTable_Item_Desc.Edit;
   VI_NumItem:=  IBTable_Item_Prova.FieldByName('NumItem').AsInteger;

   JvDBRichEdit_Text.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de Revisao do Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.JvTransparentButton_RevisarClick( Sender: TObject);
begin
   Funcoes.Historico_Item( Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString, 'Revisão' );
   IBTable_Item_Prova.FieldByName( 'Status').AsString:= 'D';
   if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
      IBTable_Item_Desc.Post;

   if ((IBTable_Item_Prova.State = DSInsert) or (IBTable_Item_Prova.State = DSEdit )) then
      IBTable_Item_Prova.Post;

   AjustarItemTurmaBase(IBTable_Item_Prova.FieldByName( 'IDCURSO').AsString, IBTable_Item_Prova.FieldByName('NumItem').AsString, 'D');

   DM.IBTransaction_Ensino.CommitRetaining;

   Fechar:= True;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para manter a integridade do item na turma base
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.AjustarItemTurmaBase(VS_IdCurso, VS_NumItem, VS_Status: String);
Begin
   Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+VS_Status+#39+
                          ' Where IdCurso = '+VS_IdCurso+
                          ' and  IdTurma = 0 '+
                          ' and  NumItem  = '+VS_NumItem
                         );
end;

//------------------------------------------------------------------------------
// Tratamento do botao de gravacao dos dados inseridos ou alterados Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.JvTransparentButton_GravarClick( Sender: TObject);
var
   VS_IDCURSO, VS_NUMITEM, VS_CODMATERIA, VS_DISCIPLINA, VS_UNIDADE: String;
   VS_SUBUNIDADE, VS_OBJETIVO, VS_QUARENTENA, VS_SERIE, VS_STATUS: String;
begin
   if Copy(JvDBRichEdit_Text.Text,1,4) <> '#N -' then
   begin
      Showmessage('Os quatro primeiros caracteres devem sem ser "#N -", favor corrigir...');
      JvDBRichEdit_Text.SetFocus;
   end
   else
   begin
      if DBEdit_Disc.Text = '' then
      begin
         Showmessage('A disciplina não pode ser branco...');
         DBEdit_Disc.SetFocus;
      end
      else
      begin
         if DBEdit_Unid.Text = '' then
         begin
            Showmessage('A unidade não pode ser branco...');
            DBEdit_Unid.SetFocus;
         end
         else
         begin
            if DBEdit_SubUni.Text = '' then
            begin
               Showmessage('A Subunidade não pode ser branco...');
               DBEdit_SubUni.SetFocus;
            end
            else
            begin
               if DBComboBox_objetivo.Text = '' then
               begin
                  Showmessage('Objetivo não pode ser branco...');
                  DBComboBox_objetivo.SetFocus;
               end
               else
               begin
                  if DBComboBox_Serie.Text = '' then
                  begin
                     Showmessage('A série não pode ser branco...');
                     DBComboBox_Serie.SetFocus;
                  end
                  else
                  begin
                     if DBEdit_TempoResposta.Text = '' then
                     begin
                        Showmessage('O tempo de resposta não pode ser branco...');
                        DBEdit_TempoResposta.SetFocus;
                     end
                     else
                     begin
                        if DBComboBox_RespostaCorreta.Text = '' then
                        begin
                           Showmessage('A resposta correta não pode ser branco...');
                           DBComboBox_RespostaCorreta.SetFocus;
                        end
                        else
                        begin
                           if ((DBEdit_NLinha.Text = '') and ( DBComboBox_PossuiImagem.Text = 'S')) then
                           begin
                              Showmessage('Número de linha da questão não pode ser branco...');
                              DBEdit_NLinha.SetFocus;
                           end
                           else
                           begin

                              IBTable_Item_Prova.FieldByName( 'Status').AsString:= 'I';
                              if (DBEdit_NLinha.Text = '')  then
                                  IBTable_Item_Desc.FieldByName( 'NLinhas').AsInteger:= JvDBRichEdit_Text.Lines.count;

                              if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
                              begin
                                 VI_NumItem:= Funcoes.MaiorCodigo('NumItem', 'Item_Desc');

                                 if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
                                    IBTable_Item_Desc.FieldByName( 'NumItem').AsInteger:= VI_NumItem;

                                 if ((IBTable_Item_Prova.State = DSInsert) or (IBTable_Item_Prova.State = DSEdit )) then
                                     IBTable_Item_Prova.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
                              end;

                              IBTable_Item_Prova.FieldByName( 'Serie').AsString:= FormatFloat('00',StrToInt(DBComboBox_Serie.Text));

                              if ((IBTable_Item_Prova.State = DSInsert) or (IBTable_Item_Prova.State = DSEdit )) then
                                 IBTable_Item_Prova.Post;

                              if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
                                 IBTable_Item_Desc.Post;

                              VS_IDCURSO:= IBTable_Item_Prova.FieldByName( 'IDCURSO').AsString;
                              VS_NUMITEM:= IBTable_Item_Prova.FieldByName( 'NUMITEM').AsString;
                              if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
                              begin
                                 VS_CODMATERIA:= IBTable_Item_Prova.FieldByName( 'CODMATERIA').AsString;
                                 VS_DISCIPLINA:= IBTable_Item_Prova.FieldByName( 'DISCIPLINA').AsString;
                                 VS_UNIDADE:= IBTable_Item_Prova.FieldByName( 'UNIDADE').AsString;
                                 VS_SUBUNIDADE:= IBTable_Item_Prova.FieldByName( 'SUBUNIDADE').AsString;
                                 VS_OBJETIVO:= IBTable_Item_Prova.FieldByName( 'OBJETIVO').AsString;
                                 VS_QUARENTENA:= IBTable_Item_Prova.FieldByName( 'QUARENTENA').AsString;
                                 VS_SERIE:= IBTable_Item_Prova.FieldByName( 'SERIE').AsString;
                                 VS_STATUS:= IBTable_Item_Prova.FieldByName( 'STATUS').AsString;

                                 IBTable_Item_Prova.Append;
                                 IBTable_Item_Prova.FieldByName('IDCURSO').AsString:= VS_IDCURSO;
                                 IBTable_Item_Prova.FieldByName('IdTurma').AsInteger:= 0;
                                 IBTable_Item_Prova.FieldByName('NUMITEM').AsString:= VS_NUMITEM;
                                 IBTable_Item_Prova.FieldByName('CODMATERIA').AsString:= VS_CODMATERIA;
                                 IBTable_Item_Prova.FieldByName('DISCIPLINA').AsString:= VS_DISCIPLINA;
                                 IBTable_Item_Prova.FieldByName('UNIDADE').AsString:= VS_UNIDADE;
                                 IBTable_Item_Prova.FieldByName('SUBUNIDADE').AsString:= VS_SUBUNIDADE;
                                 IBTable_Item_Prova.FieldByName('OBJETIVO').AsString:= VS_OBJETIVO;
                                 IBTable_Item_Prova.FieldByName('QUARENTENA').AsString:= VS_QUARENTENA;
                                 IBTable_Item_Prova.FieldByName('SERIE').AsString:= VS_SERIE;
                                 IBTable_Item_Prova.FieldByName('STATUS').AsString:= VS_STATUS;
                                 IBTable_Item_Prova.Post;
                              end;
                              AjustarItemTurmaBase(VS_IDCURSO, VS_NUMITEM, 'I');

                              DM.IBTransaction_Ensino.CommitRetaining;

                              // Verifica se e Insercao de Item se for solicita o Indice de Facilidade

                              if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
                              begin
                                 Application.CreateForm(TForm_Item_IndiceFacilidade, Form_Item_IndiceFacilidade);
                                 Funcoes.SetNumItem(IntToStr(VI_NumItem));
                                 Form_Item_IndiceFacilidade.ShowModal;
                              end;

                              Fechar:= True;
                              Funcoes.Historico_Item( IntToStr(VI_NumItem), Form_Sel_ItemProva.VS_Opcao );
                              Close;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;

end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
      IBTable_Item_Desc.Cancel;

   if ((IBTable_Item_Prova.State = DSInsert) or (IBTable_Item_Prova.State = DSEdit )) then
      IBTable_Item_Prova.Cancel;

   DM.IBTransaction_Ensino.CommitRetaining;

   Fechar:= True;
   Close;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Editor
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento quando a Form e chamada
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.FormShow(Sender: TObject);
begin
   Fechar:= True;

   Tam_Font:= 11;

   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAN' then
   begin
     JvFontComboBox.Text := 'Calibri';
     JvDBRichEdit_Text.Font.Name:= 'Calibri';
   end
   else
   begin
     JvFontComboBox.Text := 'Courier New';
     JvDBRichEdit_Text.Font.Name:= 'Courier New';
   end;

   FontSize.Text := IntToStr(Tam_Font);
   JvDBRichEdit_Text.Font.Size:= Tam_Font;

   UpdateCursorPos;
   JvDBRichEdit_Text.Modified := False;
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar a posição do Cursos
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos.X := (JvDBRichEdit_Text.SelStart - SendMessage(JvDBRichEdit_Text.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Desfazer
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.DesfazerClick(Sender: TObject);
begin
  JvDBRichEdit_Text.Undo;
  if JvDBRichEdit_Text.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento do botao recortar
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.RecortarClick(Sender: TObject);
begin
  JvDBRichEdit_Text.CutToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ColarClick(Sender: TObject);
begin
  JvDBRichEdit_Text.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Seta os atributos do Texto
//------------------------------------------------------------------------------

Function TForm_Cad_ItemProva.CurrText: TJvTextAttributes;
begin
  if JvDBRichEdit_Text.SelLength > 0 then
    Result := JvDBRichEdit_Text.SelAttributes
  else
    Result := JvDBRichEdit_Text.DefAttributes;
end;

procedure TForm_Cad_ItemProva.JvDBRichEdit_TextSelectionChange(Sender: TObject);
begin
  try
    FUpdating := True;
    FirstInd.Left := Trunc(JvDBRichEdit_Text.Paragraph.FirstIndent*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((JvDBRichEdit_Text.Paragraph.RightIndent+GutterWid)*RulerAdj);
    NegritoButton.Down := fsBold in JvDBRichEdit_Text.SelAttributes.Style;
    ItalicoButton.Down := fsItalic in JvDBRichEdit_Text.SelAttributes.Style;
    SublinhadoButton.Down := fsUnderline in JvDBRichEdit_Text.SelAttributes.Style;
    FontSize.Text := IntToStr(JvDBRichEdit_Text.SelAttributes.Size);
    JvFontComboBox.Text := JvDBRichEdit_Text.SelAttributes.Name;
    case Ord(JvDBRichEdit_Text.Paragraph.Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    JvFontComboBox.FontName:= JvDBRichEdit_Text.SelAttributes.Name;
    FontSize.Text := inttostr(JvDBRichEdit_Text.SelAttributes.size);

    UpdateCursorPos;

  finally
    FUpdating := False;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento da Fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.FontNameChange(Sender: TObject);
begin
  if FUpdating then
      Exit;
  CurrText.Name:= JvFontComboBox.Items[JvFontComboBox.ItemIndex];
end;

//------------------------------------------------------------------------------
// Tratamento da tamanho Fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.FontSizeChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

//------------------------------------------------------------------------------
// Muda para negrito o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.NegritoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if NegritoButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

//------------------------------------------------------------------------------
// Muda para Italico o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ItalicoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicoButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

//------------------------------------------------------------------------------
// Muda para Sublinhado o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.SublinhadoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if SublinhadoButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TForm_Cad_ItemProva.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TForm_Cad_ItemProva.FormResize(Sender: TObject);
begin
  SetEditRect;
  JvDBRichEdit_TextSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratao tamanho da regua
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.Width;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TForm_Cad_ItemProva.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(JvFontComboBox.Items));
  ReleaseDC(0, DC);
  JvFontComboBox.Sorted := True;
end;

procedure TForm_Cad_ItemProva.SetupRuler;
var
  I: Integer;
  S: String;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I+1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

procedure TForm_Cad_ItemProva.SetEditRect;
var
  R: TRect;
begin
  with JvDBRichEdit_Text do
  begin
    R := Rect(GutterWid, 0, ClientWidth-GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

procedure TForm_Cad_ItemProva.FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_ItemProva.FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Cad_ItemProva.FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  JvDBRichEdit_Text.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TForm_Cad_ItemProva.LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  JvDBRichEdit_Text.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-JvDBRichEdit_Text.Paragraph.FirstIndent;
  JvDBRichEdit_TextSelectionChange(Sender);
end;

procedure TForm_Cad_ItemProva.LeftIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_ItemProva.RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if RightInd.Left > RulerLine.Width then
    RightInd.Left := RulerLine.Width-16;

  FDragging := False;
  JvDBRichEdit_Text.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  JvDBRichEdit_TextSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para selecionar imagem
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ToolButton_InseriImagemClick(Sender: TObject);
var
  MyFormat : Word;
  AData: THandle;
  APalette:HPalette;
begin
   Application.CreateForm(TForm_SelFoto, Form_SelFoto);
   Form_SelFoto.ShowModal;
   if Funcoes.GetFoto <> '' then
   begin
      JvThumbImage1.LoadFromFile( Funcoes.GetFoto);
      JvThumbImage1.Picture.Graphic.SaveToClipboardFormat(MyFormat,AData,APalette);
      ClipBoard.SetAsHandle(MyFormat,AData);
      JvDBRichEdit_Text.PasteFromClipboard;
   end;
end;

procedure TForm_Cad_ItemProva.JvDBRichEdit_TextKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if Key = vk_F3 then
    JvDBRichEdit_Text.FindNext;
end;

//------------------------------------------------------------------------------
// Tratamento do bota de inserção dos simbolos expeciais
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ToolButton_SimboloClick(Sender: TObject);
var
  VS_Font: String;
  VI_Size: Integer;
begin
   VI_Size:= JvDBRichEdit_Text.SelAttributes.Size;
   VS_Font:= JvDBRichEdit_Text.SelAttributes.Name;

   Form_Simbolo.ShowModal;

   JvDBRichEdit_Text.SelAttributes.Name := VS_Font;
   FontDialog1.Font.Name := VS_Font;
   JvDBRichEdit_Text.SelAttributes.Size := VI_Size;
   FontDialog1.Font.Size := VI_Size;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para inserir Hora
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ToolButton_InserirHoraClick(Sender: TObject);
begin
  JvDBRichEdit_Text.SelText := FormatDateTime('hh "Horas e " mm " Minutos"', Now);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ToolButton_FonteClick(Sender: TObject);
begin
  FontDialog1.Execute;
  JvDBRichEdit_Text.SelAttributes.Color := FontDialog1.Font.Color;
  JvDBRichEdit_Text.SelAttributes.Name := FontDialog1.Font.Name;
  JvDBRichEdit_Text.SelAttributes.Size := FontDialog1.Font.Size;
  JvDBRichEdit_Text.SelAttributes.Style := FontDialog1.Font.Style;
end;

//------------------------------------------------------------------------------
// Muda a cor do texto selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.Formatar_CorClick(Sender: TObject);
begin
   ColorDialog1.Execute ;
   JvDBRichEdit_Text.SelAttributes.Color := ColorDialog1.Color;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de padronizacao da Fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ToolButton_PadronizarFonteClick(Sender: TObject);
begin
  JvDBRichEdit_Text.SelectAll;

  JvDBRichEdit_Text.SelAttributes.Size:= Tam_Font;
  FontDialog1.Font.Size:= Tam_Font;
  JvDBRichEdit_Text.SelAttributes.Name:= 'Calibri';

  FDragging := False;
  JvDBRichEdit_Text.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-JvDBRichEdit_Text.Paragraph.FirstIndent;
  JvDBRichEdit_TextSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento od botao de leitura do numero de linhas do Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.SpeedButton_NLinhasClick(Sender: TObject);
begin
   IBTable_Item_Desc.FieldByName( 'NLinhas').AsInteger:= JvDBRichEdit_Text.Lines.count;
end;

//------------------------------------------------------------------------------
// Tratamento da Vizualizacao do Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ToolButton_VizuItemClick(Sender: TObject);
begin
   if ToolButton_VizuItem.ImageIndex = 13 then
   begin
      ToolButton_VizuItem.ImageIndex:= 42;
      ToolButton_VizuItem.Hint:= 'Reduz';
      Panel_Area.Visible:= False;
   end
   else
   begin
      ToolButton_VizuItem.ImageIndex:= 13;
      ToolButton_VizuItem.Hint:= 'Amplia' ;
      Panel_Area.Visible:= True;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para converter a seleção em Maiuscula
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.SpeedButton_TransMaiusculaClick(Sender: TObject);
begin
   Converte('Upper');
end;

//------------------------------------------------------------------------------
// Tratamento do botao para converter a seleção em Minuscula
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.SpeedButton_TransMinusculaClick(Sender: TObject);
begin
   Converte('Lawer');
end;

//------------------------------------------------------------------------------
// Converte a seleção para opção desejada (Mai/Min
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.Converte(VS_OpcaoConverte: String);
var
   VS_Min: String;
   Posicao: Integer;
begin
   Edit_Palavra.Text:= '';
   JvDBRichEdit_Text.CopyToClipboard;
   Edit_Palavra.PasteFromClipboard;
   VS_Min:= Edit_Palavra.Text;
   if VS_OpcaoConverte = 'Upper' then
      Edit_Palavra.Text:= Funcoes.AjustarMaiscula(UpperCase(Edit_Palavra.Text))
   else
      Edit_Palavra.Text:= Funcoes.AjustarMinuscula(LowerCase(Edit_Palavra.Text));

  Posicao := JvDBRichEdit_Text.FindText(VS_Min, 0, Length(JvDBRichEdit_Text.Text), []);
  if Posicao > 0 then
  begin
    JvDBRichEdit_Text.SelStart := Posicao;
    JvDBRichEdit_Text.SelLength := Length(VS_Min);
    JvDBRichEdit_Text.SelText := Edit_Palavra.Text;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento quando altera o CodMateria
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.DBEdit_CodMateriaChange(Sender: TObject);
begin
   DBEdit_Disc.Text:= Copy(DBEdit_CodMateria.Text,1,2);
   VerificaSerie;
end;

//------------------------------------------------------------------------------
// Permite buscar o Item pelo Numero
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.VerificaSerie;
begin
   if ((IBTable_Item_Prova.State = DSInsert) or (IBTable_Item_Prova.State = DSEdit )) then
   begin
      if ((DBEdit_CodMateria.Text <> '') and (DBEdit_Disc.Text <> '') and (DBEdit_Unid.Text <> '') and (DBEdit_SubUni.Text <> '') and (DBComboBox_objetivo.Text <> '')) then
      begin
         Funcoes.OpenQuery( 'Select max(Serie) + 1 As Serie from Item_Prova  '+
                            ' where IdCurso = '+Form_Abertura.VS_IdCurso+
                            ' and IdTurma = 0'+
                            ' and CodMateria = '+#39+DBEdit_CodMateria.Text+#39+
                            ' and Disciplina = '+#39+DBEdit_Disc.Text+#39+
                            ' and Unidade = '+#39+DBEdit_Unid.Text+#39+
                            ' and SubUnidade = '+#39+DBEdit_SubUni.Text+#39+
                            ' and Objetivo = '+#39+DBComboBox_objetivo.Text+#39
                          );

        if DM.IBQuery_Executa.FieldByName('Serie').AsString = '' then
           DBComboBox_Serie.Text:= '1'
        else
           DBComboBox_Serie.Text:= DM.IBQuery_Executa.FieldByName('Serie').AsString;
      end;
   end;
end;

procedure TForm_Cad_ItemProva.DBComboBox_objetivoChange(Sender: TObject);
begin
   VerificaSerie;
end;

procedure TForm_Cad_ItemProva.DBEdit_DiscChange(Sender: TObject);
begin
   VerificaSerie;
end;

procedure TForm_Cad_ItemProva.DBEdit_UnidChange(Sender: TObject);
begin
   VerificaSerie;
end;

procedure TForm_Cad_ItemProva.DBEdit_SubUniChange(Sender: TObject);
begin
   VerificaSerie;
end;

procedure TForm_Cad_ItemProva.DBEdit_DiscKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_Unid.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBEdit_UnidKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_SubUni.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBEdit_SubUniKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_SubUni.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_objetivoKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_RespostaCorreta.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_SerieKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_TempoResposta.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_RespostaCorretaKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
end;

procedure TForm_Cad_ItemProva.DBEdit_TempoRespostaKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_Recurso.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_PossuiImagemKeyPress( Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_Serie.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_RecursoKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBRichEdit_Observacao.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBEdit_NLinhaKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBRichEdit_Observacao.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBRichEdit_ObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      JvDBRichEdit_Text.SetFocus;
end;

procedure TForm_Cad_ItemProva.JvDBRichEdit_TextKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
end;

//------------------------------------------------------------------------------
// Tratamento das teclas Basicas
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.TeclasBasicas( Sender: TObject; var Key: Char);
begin
   if key = #20 then
       JvDBRichEdit_Text.SetFocus;
end;

procedure TForm_Cad_ItemProva.IBTable_Item_ProvaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
   Sender: TObject;
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
           JvTransparentButton_GravarClick( Sender);
end;

procedure TForm_Cad_ItemProva.IBTable_Item_DescPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
   Sender: TObject;
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
           JvTransparentButton_GravarClick( Sender);
end;

end.
