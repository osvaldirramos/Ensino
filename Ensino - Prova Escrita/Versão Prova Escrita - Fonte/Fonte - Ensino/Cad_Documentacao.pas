//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Avaliacao.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da avaliacao.                                  //
//                                                                             //
// MODULOS CHAMADOS         :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/02/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Documentacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas, JvDlg,
  JvEnterTab, JvGrdCpt, DB, IBCustomDataSet, IBTable,
  IBQuery, JvClock, DBGrids, JvDBRichEd, Mask, JvGradient, JvTransBtn,
  JvShape;

const
  RulerAdj = 4/3;
  GutterWid = 6;

type
  TForm_Cad_Documento = class(TForm)
    IBQuery_Consulta: TIBQuery;
    DSQ_Documentacao: TDataSource;
    IBTable_Documento: TIBTable;
    DST_Doc: TDataSource;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    IBTable_DocumentoCODIGO: TIntegerField;
    IBTable_DocumentoDOC: TIBStringField;
    IBTable_DocumentoDESCRICAO: TBlobField;
    Panel_Botoes_Instrutor: TPanel;
    JvGradient4: TJvGradient;
    JvShape19: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvShape9: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    DBNavigator1: TDBNavigator;
    Memo1: TMemo;
    Panel4: TPanel;
    Panel_Doc: TPanel;
    Panel_Selecao: TPanel;
    Edit_Documento: TEdit;
    DBGrid_Selecao: TDBGrid;
    ScrollBox_Campos: TScrollBox;
    ControlBar_Botoes: TControlBar;
    ToolBar2: TToolBar;
    JvFontComboBox: TJvFontComboBox;
    ComboBox_Tamanho: TComboBox;
    ToolButton13: TToolButton;
    ToolButton_AlinhamentoEsq: TToolButton;
    ToolButton_AlinhamentoCentralizar: TToolButton;
    ToolButton_AlinhamentoDir: TToolButton;
    ToolButton17: TToolButton;
    ToolButton_Fonte: TToolButton;
    ToolButton_Cor: TToolButton;
    ToolButton20: TToolButton;
    ToolButton_Negrito: TToolButton;
    ToolButton_Italic: TToolButton;
    ToolButton_Sublinhado: TToolButton;
    ToolBar3: TToolBar;
    ToolButton_Recortar: TToolButton;
    ToolButton_Copiar: TToolButton;
    ToolButton_Colar: TToolButton;
    ToolButton_Desfazer: TToolButton;
    Text1: TJvDBRichEdit;
    Panel1: TPanel;
    Ruler: TPanel;
    RulerLine: TBevel;
    RightInd: TLabel;
    Bevel1: TBevel;
    LeftInd: TLabel;
    FirstInd: TLabel;

    procedure TrataBotoes(Status: Boolean);
    procedure Campos(Status: Boolean);

    procedure FormActivate(Sender: TObject);
    procedure Edit_DocumentoChange(Sender: TObject);
    procedure ToolButton_DesfazerClick(Sender: TObject);
    procedure ToolButton_CopiarClick(Sender: TObject);
    procedure ToolButton_ColarClick(Sender: TObject);
    procedure JvFontComboBoxClick(Sender: TObject);
    procedure ComboBox_TamanhoClick(Sender: TObject);
    procedure ToolButton_AlinhamentoEsqClick(Sender: TObject);
    procedure Text1SelectionChange(Sender: TObject);
    procedure ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
    procedure ToolButton_AlinhamentoDirClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_CorClick(Sender: TObject);
    procedure ToolButton_NegritoClick(Sender: TObject);
    procedure ToolButton_ItalicClick(Sender: TObject);
    procedure ToolButton_SublinhadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_RecortarClick(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
  private    { Private declarations }
      bmLocal : TBookmark;
      FDragOfs: Integer;
      FDragging: Boolean;

      VS_Comando: String;
  public    { Public declarations }
  end;

var
  Form_Cad_Documento: TForm_Cad_Documento;
  Alterado: Boolean;
  NovoArquivo: Boolean;
  Fechar: Boolean;
  NomeArquivo: String;

implementation

uses Module, ImageWin;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo de criacao da Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.FormCreate(Sender: TObject);
var
   N: integer;
begin
  for N := 1 to 48 do
  Begin
    ComboBox_Tamanho.Items.Add(inttostr(N));
  end;
  ComboBox_Tamanho.Text := '11';
  Text1.Font.Name := 'Courier New';
  Text1.Font.Size := 11;

   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Funcoes.CabecalhoForm( Form_Cad_Documento, ' Cadastro de Documentação');

      JvFontComboBox.FontName:= 'Courier New';

      Funcoes.SetCadCurso('CadDoc');
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Gerência - Cabeçalhos de Documentos');    // Abre o perfil do usuario em relacao a agenda

      Edit_Documento.Text:= '';

      TrataBotoes(True);
      Campos(False);

      IBTable_Documento.Open;

      Edit_DocumentoChange(Sender);
   end;
end;

procedure TForm_Cad_Documento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Documento.Close;
   IBQuery_Consulta.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.TrataBotoes(Status: Boolean);
begin
   JvTransparentButton_Alterar.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;

   if Status = True then
      Status:= False
   else
      Status:= True;
   JvTransparentButton_Gravar.Enabled:= Status;
   JvTransparentButton_Cancelar.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.Campos(Status: Boolean);
begin
   ToolButton_Desfazer.Enabled:= Status;
   ToolButton_Recortar.Enabled:= Status;
   ToolButton_Copiar.Enabled:= Status;
   ToolButton_Colar.Enabled:= Status;
   JvFontComboBox.Enabled:= Status;
   ComboBox_Tamanho.Enabled:= Status;
   ToolButton_AlinhamentoEsq.Enabled:= Status;
   ToolButton_AlinhamentoCentralizar.Enabled:= Status;
   ToolButton_AlinhamentoDir.Enabled:= Status;
   ToolButton_Fonte.Enabled:= Status;
   ToolButton_Cor.Enabled:= Status;
   ToolButton_Negrito.Enabled:= Status;
   ToolButton_Italic.Enabled:= Status;
   ToolButton_Sublinhado.Enabled:= Status;

   if Status = True then
      Status:= False
   else
      Status:= True;

   Text1.ReadOnly:= Status;
   Panel_Selecao.Enabled:= Status;
   DBGrid_Selecao.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   bmLocal:= IBQuery_Consulta.GetBookMark;
   Funcoes.GravaAcesso('Gerência - Cabeçalhos de Documentos', 'Alterar');
   Panel_Doc.Visible:= False;
   Campos(True);
   TrataBotoes(False);

   IBTable_Documento.Edit;
   Text1.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.JvTransparentButton_GravarClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Cabeçalhos de Documentos', 'Gravar');
   IBTable_Documento.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_Consulta);

   Panel_Doc.Visible:= True;
   Campos(False);
   TrataBotoes(True);

   IBQuery_Consulta.GotoBookMark(bmLocal);
   IBQuery_Consulta.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Cabeçalhos de Documentos', 'Cancelar');
   IBTable_Documento.Cancel;
   DM.IBTransaction_Ensino.RollbackRetaining;

   Panel_Doc.Visible:= True;
   Campos(False);
   TrataBotoes(True);
   IBQuery_Consulta.GotoBookMark(bmLocal);
   IBQuery_Consulta.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento da busca do documento pela descrição do documento
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.Edit_DocumentoChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select Codigo, doc from Documento '+
                ' where codigo <> 4 '+
                ' and   Codigo <> 6 '+
                ' and   Codigo <> 25 '+
                ' and   Codigo <> 29 '+
                ' and   Codigo <> 30 '+
                ' and   Codigo <> 31 '+
                ' and   Codigo <> 36 ';

   if trim(Edit_documento.Text) <> '' then
      VS_Comando:= VS_Comando+' and doc like '+#39+'%'+trim(Edit_Documento.Text)+'%'+#39;

   if ((DM.Query_Usuario.FieldByName('ACESSO').AsString <> 'A') and (Funcoes.GetSecao  <> 'ADMINISTRAÇÃO')) then
      VS_Comando:= VS_Comando+' and Secao = '+#39+DM.Query_Usuario.FieldByName('SECAO').AsString+#39;

   Funcoes.ExecutaQuery(IBQuery_Consulta, VS_Comando+' Order By Doc');
end;

//------------------------------------------------------------------------------
// Tratamento do botao Undo
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_DesfazerClick(Sender: TObject);
begin
  Text1.Undo;
  if Text1.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_CopiarClick(Sender: TObject);
begin
   Text1.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_ColarClick(Sender: TObject);
begin
   Text1.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da fonte de letra
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.JvFontComboBoxClick(Sender: TObject);
begin
  Text1.SelAttributes.Name := JvFontComboBox.FontName;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do tamanho da fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ComboBox_TamanhoClick(Sender: TObject);
begin
  text1.SelAttributes.Size := StrToInt(ComboBox_Tamanho.Items[ComboBox_Tamanho.ItemIndex]);
  FontDialog1.Font.Size := StrToInt(ComboBox_Tamanho.Items[ComboBox_Tamanho.itemindex]);
  text1.SetFocus;
end;

procedure TForm_Cad_Documento.Text1SelectionChange(Sender: TObject);
begin
   ToolButton_Copiar.Enabled := Text1.SelLength > 0;
   ToolButton_Recortar.Enabled := Text1.SelLength > 0;
   ToolButton_Colar.Enabled := Clipboard.HasFormat(CF_TEXT);
   ToolButton_Negrito.Down := (fsBold in text1.SelAttributes.Style);
   ToolButton_Italic.Down := (fsItalic in text1.SelAttributes.Style);
   ToolButton_Sublinhado.Down := (fsUnderline in text1.SelAttributes.Style);
   case text1.Paragraph.Alignment of
      paLeftJustify:
          begin
             ToolButton_AlinhamentoEsq.Down := true;
             ToolButton_AlinhamentoCentralizar.Down := False;
             ToolButton_AlinhamentoDir.Down := false;
          end;
      paCenter:
          begin
             ToolButton_AlinhamentoCentralizar.Down := true;
             ToolButton_AlinhamentoDir.Down := false;
             ToolButton_AlinhamentoEsq.Down := false;
          end;
      paRightJustify:
          begin
             ToolButton_AlinhamentoDir.Down := true;
             ToolButton_AlinhamentoCentralizar.Down := false;
             ToolButton_AlinhamentoEsq.Down := false;
          end;
   end;
   JvFontComboBox.FontName:= text1.SelAttributes.Name;
   ComboBox_Tamanho.Text := inttostr(text1.SelAttributes.size);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para esquerda
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_AlinhamentoEsqClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para centralizar
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
begin
  Text1.Paragraph.Alignment := paCenter;
  Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do bota para ajustar para direita
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_AlinhamentoDirClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paRightJustify;
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_FonteClick(Sender: TObject);
begin
  FontDialog1.Execute;
  Text1.SelAttributes.Color := FontDialog1.Font.Color;
  Text1.SelAttributes.Name := FontDialog1.Font.Name;
  Text1.SelAttributes.Size := FontDialog1.Font.Size;
  Text1.SelAttributes.Style := FontDialog1.Font.Style;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da cor
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_CorClick(Sender: TObject);
begin
   ColorDialog1.Execute ;
   Text1.SelAttributes.Color := ColorDialog1.Color;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da negrito
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_NegritoClick(Sender: TObject);
begin
   if    (text1.SelAttributes.Style = [fsbold]) or
         (text1.SelAttributes.Style = [fsbold, fsitalic]) or
         (text1.SelAttributes.Style = [fsbold, fsunderline]) or
         (text1.SelAttributes.Style = [fsbold, fsitalic, fsunderline]) then
      text1.SelAttributes.Style := text1.SelAttributes.Style - [fsbold]
   else
      text1.SelAttributes.Style := text1.SelAttributes.Style + [fsbold];
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da Italico
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_ItalicClick(Sender: TObject);
begin
   if (text1.SelAttributes.Style = [fsitalic]) or
      (text1.SelAttributes.Style = [fsitalic, fsbold]) or
      (text1.SelAttributes.Style = [fsitalic, fsunderline]) or
      (text1.SelAttributes.Style = [fsitalic, fsbold, fsunderline]) then
   text1.SelAttributes.Style := text1.SelAttributes.Style - [fsitalic]
   else
   text1.SelAttributes.Style := text1.SelAttributes.Style + [fsitalic];
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da sublinhado
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.ToolButton_SublinhadoClick(Sender: TObject);
begin
    if (text1.SelAttributes.Style = [fsunderline]) or
       (text1.SelAttributes.Style = [fsunderline, fsitalic]) or
       (text1.SelAttributes.Style = [fsunderline, fsbold]) or
       (text1.SelAttributes.Style = [fsunderline, fsitalic, fsbold]) then
    text1.SelAttributes.Style := text1.SelAttributes.Style - [fsunderline]
    else
    text1.SelAttributes.Style := text1.SelAttributes.Style + [fsunderline];
    Text1SelectionChange(Sender);
end;

procedure TForm_Cad_Documento.ToolButton_RecortarClick(Sender: TObject);
begin
  Text1.CutToClipboard;
end;

//------------------------------------------------------------------------------
// Tratao tamanho da regua
//------------------------------------------------------------------------------

procedure TForm_Cad_Documento.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.Width;
end;

procedure TForm_Cad_Documento.FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_Documento.FirstIndMouseMove(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Cad_Documento.FirstIndMouseUp(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Text1.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TForm_Cad_Documento.LeftIndMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_Documento.LeftIndMouseMove(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Cad_Documento.LeftIndMouseUp(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Text1.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Text1.Paragraph.FirstIndent;
  Text1SelectionChange(Sender);
end;

procedure TForm_Cad_Documento.RightIndMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_Documento.RightIndMouseMove(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Cad_Documento.RightIndMouseUp(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if RightInd.Left > RulerLine.Width then
    RightInd.Left := RulerLine.Width-16;

  FDragging := False;
  Text1.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  Text1SelectionChange(Sender);
end;
end.
