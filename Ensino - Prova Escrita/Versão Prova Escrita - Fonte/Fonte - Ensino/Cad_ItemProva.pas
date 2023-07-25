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
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Rotinas, Rotinas_SUE,ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvEnterTab, JvxClock, JvCombobox, JvColorCombo, JvxCtrls, JvBaseThumbnail, JvThumbImage,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, ClipBrd, ValEdit, JvDlg, JvGrdCpt, JvClock, TeEngine,
  Series, TeeProcs, Chart, DbChart, PsyRichEdit, JvShape, ActnList,
  JvTransBtn, jpeg;


type
  TForm_Cad_ItemProva = class(TForm)
    Panel_Editor: TPanel;
    JvThumbImage1: TJvThumbImage;
    ToolBar1: TToolBar;
    RecortarButton: TToolButton;
    CopiarButton: TToolButton;
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
    Panel4: TPanel;
    Panel2: TPanel;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    JvDBRichEdit_Text: TJvDBRichEdit;
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
    Panel_Dados: TPanel;
    DST_ItemProva: TDataSource;
    DST_ItemDesc: TDataSource;
    Table_Item_C: TIBTable;
    Table_Item_CIDCURSO: TSmallintField;
    Table_Item_CIDTURMA: TIntegerField;
    Table_Item_CNUMITEM: TIntegerField;
    Table_Item_CCODMATERIA: TIBStringField;
    Table_Item_CDISCIPLINA: TIBStringField;
    Table_Item_CUNIDADE: TIBStringField;
    Table_Item_CSUBUNIDADE: TIBStringField;
    Table_Item_COBJETIVO: TIBStringField;
    Table_Item_CQUARENTENA: TDateTimeField;
    Table_Item_CSERIE: TIBStringField;
    Table_Item_CSTATUS: TIBStringField;
    Table_IndiceItem: TIBTable;
    Table_IndiceItemNUMITEM: TIntegerField;
    Table_IndiceItemDATAAVALIACAO: TDateTimeField;
    Table_IndiceItemINDICEFACILIDADE: TIBBCDField;
    Table_IndiceItemINDICEDIFERENCIACAO: TIBBCDField;
    Table_IndiceItemINDICEOBJETIVIDADE: TIBBCDField;
    Table_IndiceItemBRANCOS: TIntegerField;
    Table_IndiceItemTOTALALUNOS: TIntegerField;
    PopupMenu1: TPopupMenu;
    Colar1: TMenuItem;
    Panel_Historico: TPanel;
    Label5: TLabel;
    DBRichEdit_Observacao: TDBRichEdit;
    Label_Minuto: TLabel;
    JvGradient5: TJvGradient;
    Label_Serie: TLabel;
    Label_Tempo_Resposta: TLabel;
    Label_Objetivo: TLabel;
    Label_Resposta_Correta: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label_Item_Em_Recurso: TLabel;
    Label6: TLabel;
    Label_ResultadoItem: TLabel;
    Label2: TLabel;
    DBEdit_Disc: TDBEdit;
    DBEdit_Unid: TDBEdit;
    DBComboBox_objetivo: TDBComboBox;
    DBComboBox_Serie: TDBComboBox;
    DBComboBox_RespostaCorreta: TDBComboBox;
    DBEdit_TempoResposta: TDBEdit;
    DBComboBox_PossuiImagem: TDBComboBox;
    DBComboBox_Recurso: TDBComboBox;
    DBEdit_CodMateria: TDBEdit;
    DBComboBox_ResultadoProva: TDBComboBox;
    DBComboBox_PadraoItem: TDBComboBox;
    DBEdit_NLinha: TDBEdit;
    Memo_Alerta_02: TMemo;
    DBEdit_SubUni: TDBEdit;
    Memo_Msg: TMemo;
    JvShape_Gravar: TJvShape;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvTransparentButton_Gravar: TJvTransparentButton;
    Memo_Alerta: TMemo;
    SpeedButton_NLinhas: TSpeedButton;
    Label4: TLabel;
    JvGradient2: TJvGradient;
    DBComboBox1: TDBComboBox;
    Text1: TJvDBRichEdit;

    procedure SetaValoresInciaisItemDesc;
    procedure VerificaSerie(Sender: TObject);
    procedure NovoItem;
    procedure Alterar;
    procedure TeclasBasicas( Sender: TObject; var Key: Char);

    procedure FormShow(Sender: TObject);
    procedure DesfazerClick(Sender: TObject);
    procedure RecortarClick(Sender: TObject);
    procedure CopiarClick(Sender: TObject);
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
    procedure SpeedButton_NLinhasClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_VizuItemClick(Sender: TObject);
    procedure ToolButton_InserirHoraClick(Sender: TObject);
    procedure DBEdit_CodMateriaChange(Sender: TObject);
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
    procedure IBTable_Item_Prova_tmpPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IBTable_Item_Desc_tmpPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure Table_Item_CPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Colar1Click(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(
      Sender: TObject);
    procedure DBComboBox_ResultadoProvaKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBComboBox_PadraoItemExit(Sender: TObject);
    procedure DBComboBox_PadraoItemKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBComboBox_ResultadoProvaExit(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure RightAlignClick(Sender: TObject);

  private
    FUpdating: Boolean;
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

uses Sel_ItemProva, Module, ImageWin, frmSimbolo, DM_Item, Cad_IndiceFacilidade,
  Frame_Sel_Curso;

resourcestring
  sSaveChanges = 'Salvar arquivo %s?';
  sOverWrite = 'Substituir arquivo %s';
  sUntitled = 'Sem nome';
  sModified = 'Modificado';
  sColRowInfo = 'Linha: %3d   Coluna: %3d';

const
  RulerAdj = 4/3;
  GutterWid = 6;
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
  CurrText.Name := DefFontData.Name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
end;

//------------------------------------------------------------------------------
// Tratamento quando ativar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.FormActivate(Sender: TObject);
begin
   Form_Sel_ItemProva.IBTable_Item_Prova.Open;
   Form_Sel_ItemProva.IBTable_Item_Desc.Open;

   Funcoes.CabecalhoForm(Form_Cad_ItemProva, 'Cadastro de Itens de Prova');

   Funcoes.SetCadCurso('ItemProva');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Item Prova');

   if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
      NovoItem
   else
      Alterar;
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
   Label_Item_Em_Recurso.Visible:= False;
   DBComboBox_Recurso.Visible:= False;

   //--- Tratamento do Item referente a Prova

   VI_NumItem:= Funcoes.Ctrl_Item;

    //---
   //--- Grava o numero do ultimo Item

   Form_Sel_ItemProva.IBTable_Item_Prova.Append;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'IdCurso').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'IdTurma').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'CodMateria').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'DISCIPLINA').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,1,2);
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'UNIDADE').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,3,2);
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'SUBUNIDADE').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,5,2);
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'STATUS').AsString:= 'D';

   //--- Tratamento referente a Descricao do Item

   try
      SetaValoresInciaisItemDesc;
   except
      SetaValoresInciaisItemDesc;
   end;

   JvDBRichEdit_Text.Lines.Clear;
   JvDBRichEdit_Text.SelectAll;
   LeftInd.Left:= 22;
   JvDBRichEdit_Text.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-JvDBRichEdit_Text.Paragraph.FirstIndent;

   JvDBRichEdit_Text.SelAttributes.Size := 11;
   FontDialog1.Font.Size := 11;
   JvDBRichEdit_Text.SelAttributes.Name:= 'Courier New';
   JvDBRichEdit_Text.SelStart:= 0;
   JvDBRichEdit_Text.Lines.Insert(0, '#N) ');

   DBComboBox_objetivo.SetFocus;
end;


//------------------------------------------------------------------------------
// Seta os valores inciais do ITEM_DESC
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.SetaValoresInciaisItemDesc;
begin
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'RespostaCorreta').AsString:= '';
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'TempoRes').AsString:= '02';
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeAplic').AsInteger:= 0;
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeIrregularidade').AsInteger:= 0;
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeAnulada').AsInteger:= 0;
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Recurso').AsString:= 'N';
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Possui_Imagem').AsString:= 'N';
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Resultado_Prova').AsString:= 'POR NOTA';
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Padrao_Prova').AsString:= 'MULTIPLA ESCOLHA';
end;

//------------------------------------------------------------------------------
// Tratamento do botao Altera Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.Alterar;
begin
   Label_Item_Em_Recurso.Visible:= True;
   DBComboBox_Recurso.Visible:= True;

   Form_Sel_ItemProva.IBTable_Item_Prova.Edit;
   Form_Sel_ItemProva.IBTable_Item_Desc.Edit;
   VI_NumItem:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('NumItem').AsInteger;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'Status').AsString:= 'D';

   JvDBRichEdit_Text.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de gravacao dos dados inseridos ou alterados Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.JvTransparentButton_GravarClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if ((Copy(JvDBRichEdit_Text.Text,1,2) <> '#N')) then
   begin
      Showmessage('Os dois primeiros caracteres devem sem ser "#N, inserir o #N no inicio da primeira linha...');
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
                        if ((DBEdit_NLinha.Text = '') and ( DBComboBox_PossuiImagem.Text = 'S')) then
                        begin
                           Showmessage('Número de linha da questão não pode ser branco...');
                           DBEdit_NLinha.SetFocus;
                        end
                        else
                        begin
                           if (DBEdit_NLinha.Text = '')  then
                               Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NLinhas').AsInteger:= JvDBRichEdit_Text.Lines.count
                           else
                           begin
                              if DBComboBox_RespostaCorreta.Text = '' then
                              begin
                                   if ((DBComboBox_ResultadoProva.Text = 'POR NOTA') or ( DBComboBox_PadraoItem.Text = 'MULTIPLA ESCOLHA')) then
                                   begin
                                      Showmessage('A resposta correta não pode ser branco...');
                                      DBComboBox_RespostaCorreta.SetFocus;
                                   end;
                              end;

                              //---- Inicia o processamento da gravacao

                              if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
                              begin
                                 if ((Form_Sel_ItemProva.IBTable_Item_Desc.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Desc.State = DSEdit )) then
                                    Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NumItem').AsInteger:= VI_NumItem;

                                 if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
                                    Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
                              End;

                              if ((Form_Sel_ItemProva.IBTable_Item_Desc.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Desc.State = DSEdit )) then
                                 Form_Sel_ItemProva.IBTable_Item_Desc.Post;

                              Funcoes.ExecutaTransacao;

                              if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
                              begin
                                 Table_Item_C.Open;

                                 if Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString = '' then
                                    Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString:= DBComboBox_Serie.Text;

                                 Form_Sel_ItemProva.IBTable_Item_Prova.Post;
                                 Funcoes.ExecutaTransacao;

                                 Funcoes.ExecutaQuery( DM.IBQuery_ExecutaBase, 'Select * from Turma '+
                                                                               ' where IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+
                                                                               ' and IdTurma = 0'+
                                                                               ' or (Status = '+#39+'A'+#39+' and IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+')'
                                                     );

                                 DM.IBQuery_ExecutaBase.First;

                                 While not DM.IBQuery_ExecutaBase.Eof do
                                 begin
                                     if DM.IBQuery_ExecutaBase.FieldByName('IdTurma').AsString <> Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString then
                                     begin
                                        VS_Comando:= 'Select count(1) as Qtd '+
                                                     ' From Item_Prova '+
                                                     ' Where IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+
                                                     ' and IdTurma = '+DM.IBQuery_ExecutaBase.FieldByName('IdTurma').AsString+
                                                     ' and NumItem = '+ IntToStr(VI_NumItem);
                                        if Funcoes.QtdRegistro(VS_Comando) = 0 then
                                        begin
                                           Table_Item_C.Append;
                                           Table_Item_C.FieldByName('IDCURSO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString;
                                           Table_Item_C.FieldByName('IdTurma').AsString:= DM.IBQuery_ExecutaBase.FieldByName('IdTurma').AsString;
                                           Table_Item_C.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
                                           Table_Item_C.FieldByName('CODMATERIA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('CODMATERIA').AsString;
                                           Table_Item_C.FieldByName('DISCIPLINA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('DISCIPLINA').AsString;
                                           Table_Item_C.FieldByName('UNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('UNIDADE').AsString;
                                           Table_Item_C.FieldByName('SUBUNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('SUBUNIDADE').AsString;
                                           Table_Item_C.FieldByName('OBJETIVO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('OBJETIVO').AsString;
                                           Table_Item_C.FieldByName('QUARENTENA').AsString:= '';
                                           Table_Item_C.FieldByName('Serie').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString;
                                           Table_Item_C.FieldByName('Status').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Status').AsString;
                                           Table_Item_C.Post;
                                           Funcoes.ExecutaTransacao;
                                        end;
                                     end;
                                     DM.IBQuery_ExecutaBase.Next;
                                  end;

                                 Funcoes.ExecutaQuery(DM.IBQuery_ExecutaBase, 'Select * from Turma Where IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+' and Status = '+#39+'A'+#39);

                                 DM.IBQuery_ExecutaBase.First;
                                 While not DM.IBQuery_ExecutaBase.Eof do
                                 begin
                                    if DM.IBQuery_ExecutaBase.FieldByName('IDTurma').AsString <> Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'IdTurma').AsString then
                                    begin
                                       if Funcoes.QtdRegistro('Select count(1) as Qtd from Item_Prova '+
                                                              ' Where IdCurso = '+DM.IBQuery_ExecutaBase.FieldByName('IDCURSO').AsString+
                                                              ' and IdTurma = '+DM.IBQuery_ExecutaBase.FieldByName('IDTurma').AsString+
                                                              ' and NumItem = '+INtToStr(VI_NumItem)) = 0 then
                                       begin
                                          Table_Item_C.Append;
                                          Table_Item_C.FieldByName('IDCURSO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString;
                                          Table_Item_C.FieldByName('IdTurma').AsInteger:= DM.IBQuery_ExecutaBase.FieldByName('IDTurma').AsInteger;
                                          Table_Item_C.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
                                          Table_Item_C.FieldByName('CODMATERIA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('CODMATERIA').AsString;
                                          Table_Item_C.FieldByName('DISCIPLINA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('DISCIPLINA').AsString;
                                          Table_Item_C.FieldByName('UNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('UNIDADE').AsString;
                                          Table_Item_C.FieldByName('SUBUNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('SUBUNIDADE').AsString;
                                          Table_Item_C.FieldByName('OBJETIVO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('OBJETIVO').AsString;
                                          Table_Item_C.FieldByName('QUARENTENA').AsString:= '';
                                          Table_Item_C.FieldByName('Serie').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString;
                                          Table_Item_C.FieldByName('Status').AsString:= 'D';
                                          Table_Item_C.Post;
                                          Funcoes.ExecutaTransacao;
                                       end;
                                    end;
                                    DM.IBQuery_ExecutaBase.Next;
                                 end;
                              end;
                              DM.IBQuery_ExecutaBase.Close;

                              // Verifica se e Insercao de Item se for solicita o Indice de Facilidade

                              if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
                              begin
                                 Application.CreateForm(TForm_Item_IndiceFacilidade, Form_Item_IndiceFacilidade);
                                 Funcoes.SetNumItem(IntToStr(VI_NumItem));
                                 Form_Item_IndiceFacilidade.ShowModal;
                              end;

                              Funcoes.Historico_Item( IntToStr(VI_NumItem), Form_Sel_ItemProva.VS_Opcao);

                              //--- Grava o Responsavel que Inseriu ou Alterou o Item

                              Funcoes.GravaAcesso('Menu Principal - Cadastro Item Prova', Form_Sel_ItemProva.VS_Opcao+' do Item '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'NumItem').AsString+' do Curso '+Frame_SelCurso.ComboBox_Curso.Text+' - Usuario: '+Funcoes.GetUsuario);
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
   if ((Form_Sel_ItemProva.IBTable_Item_Desc.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Desc.State = DSEdit )) then
      Form_Sel_ItemProva.IBTable_Item_Desc.Cancel;

   if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
      Form_Sel_ItemProva.IBTable_Item_Prova.Cancel;

   Funcoes.abortaTransacao;

   if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
   begin
      DMItem.IBQuery_ExecSql.Close;
      DMItem.IBQuery_ExecSql.Sql.Clear;
      DMItem.IBQuery_ExecSql.Sql.Add('Delete from Item_Ctrl Where NumItem = '+IntToStr(VI_NumItem));
      DMItem.IBQuery_ExecSql.ExecSql;
      DMItem.IBTransaction_ItemProva.CommitRetaining;
   end;
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
  FontSize.Text := '11';
  JvDBRichEdit_Text.Font.Size:= 11;
  JvFontComboBox.Text := 'Courier New';
  JvDBRichEdit_Text.Font.Name:= 'Courier New';
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
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.CopiarClick(Sender: TObject);
begin
  JvDBRichEdit_Text.CopyToClipboard;
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
end;

procedure TForm_Cad_ItemProva.LeftIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_ItemProva.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if RightInd.Left > RulerLine.Width then
    RightInd.Left := RulerLine.Width-16;

  FDragging := False;
  JvDBRichEdit_Text.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
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
   Funcoes.SetEditor(1);

   Application.CreateForm(TForm_Simbolo, Form_Simbolo);
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
  JvDBRichEdit_Text.SelAttributes.Size := 11;
  FontDialog1.Font.Size := 11;
  JvDBRichEdit_Text.SelAttributes.Name:= 'Courier New';

  FDragging := False;
  JvDBRichEdit_Text.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-JvDBRichEdit_Text.Paragraph.FirstIndent;
end;

//------------------------------------------------------------------------------
// Tratamento od botao de leitura do numero de linhas do Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.SpeedButton_NLinhasClick(Sender: TObject);
begin
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NLinhas').AsInteger:= JvDBRichEdit_Text.Lines.count;
end;

//------------------------------------------------------------------------------
// Tratamento da Vizualizacao do Item
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.ToolButton_VizuItemClick(Sender: TObject);
begin
   if ToolButton_VizuItem.ImageIndex = 26 then
   begin
      ToolButton_VizuItem.ImageIndex:= 25;
      ToolButton_VizuItem.Hint:= 'Reduz';
      Panel_Historico.Visible:= False;
   end
   else
   begin
      ToolButton_VizuItem.ImageIndex:= 26;
      ToolButton_VizuItem.Hint:= 'Amplia' ;
      Panel_Historico.Visible:= True;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando altera o CodMateria
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.DBEdit_CodMateriaChange(Sender: TObject);
begin
   DBEdit_Disc.Text:= Copy(DBEdit_CodMateria.Text,1,2);
   VerificaSerie(Sender);
end;

//------------------------------------------------------------------------------
// Permite buscar o Item pelo Numero
//------------------------------------------------------------------------------

procedure TForm_Cad_ItemProva.VerificaSerie(Sender: TObject);
begin
   if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert)) then
      if ((DBEdit_CodMateria.Text <> '') and (DBEdit_Disc.Text <> '') and (DBEdit_Unid.Text <> '') and (DBEdit_SubUni.Text <> '') and (DBComboBox_objetivo.Text <> '')) then
         DBComboBox_Serie.Text:= Funcoes.VerificaSerie(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString, Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString, DBEdit_CodMateria.Text, DBComboBox_objetivo.Text);
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
      DBComboBox_Serie.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_SerieKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_PossuiImagem.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_RespostaCorretaKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      JvDBRichEdit_Text.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_RecursoKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      JvDBRichEdit_Text.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBEdit_TempoRespostaKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_NLinha.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_PossuiImagemKeyPress( Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_TempoResposta.SetFocus;
end;


procedure TForm_Cad_ItemProva.DBComboBox_PadraoItemKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_ResultadoProva.SetFocus;
end;

procedure TForm_Cad_ItemProva.DBComboBox_PadraoItemExit(Sender: TObject);
var
   VB_Status: Boolean;
begin
   if DBComboBox_PadraoItem.Text = 'MULTIPLA ESCOLHA' then
      VB_Status:= True
   else
      VB_Status:= False;

   Label_Resposta_Correta.Visible:= VB_Status;
   DBComboBox_RespostaCorreta.Visible:= VB_Status;
end;

procedure TForm_Cad_ItemProva.DBComboBox_ResultadoProvaExit( Sender: TObject);
var
   VB_Status: Boolean;
begin
   if DBComboBox_ResultadoProva.Text = 'POR NOTA' then
      VB_Status:= True
   else
      VB_Status:= False;

   Label_Resposta_Correta.Visible:= VB_Status;
   DBComboBox_RespostaCorreta.Visible:= VB_Status;
end;

procedure TForm_Cad_ItemProva.DBComboBox_ResultadoProvaKeyPress( Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_CodMateria.SetFocus;
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


procedure TForm_Cad_ItemProva.IBTable_Item_Prova_tmpPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          ShowMessage('Erro na Gravacao [Item Prova]...');

          if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
             Form_Sel_ItemProva.IBTable_Item_Prova.Cancel;
          Funcoes.abortaTransacao;
          Abort;
       end;
end;

procedure TForm_Cad_ItemProva.IBTable_Item_Desc_tmpPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].ErrorCode = 9729)) then
   begin
      ShowMessage('Erro na Gravacao [Item Desc]...');
      if ((Form_Sel_ItemProva.IBTable_Item_Desc.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Desc.State = DSEdit )) then
         Form_Sel_ItemProva.IBTable_Item_Desc.Cancel;
      Funcoes.abortaTransacao;
      Abort;
   end;
end;

procedure TForm_Cad_ItemProva.Table_Item_CPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].ErrorCode = 9729)) then
   begin
      ShowMessage('Erro na Gravacao [Item C]...');
      if ((Table_Item_C.State = DSInsert) or (Table_Item_C.State = DSEdit )) then
         Table_Item_C.Cancel;
      Funcoes.abortaTransacao;
      Abort;
   end;
end;

procedure TForm_Cad_ItemProva.Colar1Click(Sender: TObject);
begin
  JvDBRichEdit_Text.PasteFromClipboard;
end;






procedure TForm_Cad_ItemProva.LeftAlignClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1SelectionChange(Sender);

end;

procedure TForm_Cad_ItemProva.RightAlignClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paRightJustify;
   Text1SelectionChange(Sender);
end;

end.
