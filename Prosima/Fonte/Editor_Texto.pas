//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ENSINO                                         //
//                                                                            //
// PROGRAMA                  : Editor_Texto.Pas                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do Editor de//
//                             Texto.                                         //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      :                                                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Editor_Texto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, ClipBrd,
  ToolWin, ActnList, ImgList, PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvComponent, JvxClock, JvxCtrls;

type
  TForm_Editor = class(TForm)
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    FontDialog1: TFontDialog;
    ToolBar1: TToolBar;
    NovoButton: TToolButton;
    AbrirButton: TToolButton;
    SalvarButton: TToolButton;
    ToolButton_Vizualizar: TToolButton;
    ToolButton5: TToolButton;
    RecortarButton: TToolButton;
    CopiarButton: TToolButton;
    ColarButton: TToolButton;
    DesfazerButton: TToolButton;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    NegritoButton: TToolButton;
    ItalicoButton: TToolButton;
    SublinhadoButton: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    MarcadorButton: TToolButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Novo1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    SalvarComo1: TMenuItem;
    N1: TMenuItem;
    Imprimir1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    JustifyAlign: TToolButton;
    Editar1: TMenuItem;
    Desfazer: TMenuItem;
    N3: TMenuItem;
    Recortar: TMenuItem;
    Copiar: TMenuItem;
    Colar: TMenuItem;
    N4: TMenuItem;
    Text1: TPsyRichEdit;
    Localizar1: TMenuItem;
    Substituir1: TMenuItem;
    N6: TMenuItem;
    SelecionarTudo1: TMenuItem;
    JvFontComboBox: TJvFontComboBox;
    JvThumbImage1: TJvThumbImage;
    Formatar: TMenuItem;
    Formatar_Fontes: TMenuItem;
    N7: TMenuItem;
    Formatar_Alinhamento: TMenuItem;
    Formatar_Alinhamento_Esquerda: TMenuItem;
    Formatar_Alinhamento_Centralizar: TMenuItem;
    Formatar_Alinhamento_Direita: TMenuItem;
    Formatar_Alinhamento_Justificar: TMenuItem;
    Inserir: TMenuItem;
    Data1: TMenuItem;
    Hora1: TMenuItem;
    Sobre: TMenuItem;
    ColorDialog1: TColorDialog;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Ruler: TPanel;
    RulerLine: TBevel;
    RightInd: TLabel;
    Bevel1: TBevel;
    LeftInd: TLabel;
    FirstInd: TLabel;
    ToolButton7: TToolButton;
    ToolButton_Imprimir: TToolButton;
    RichPrinter1: TRichPrinter;
    ToolButton3: TToolButton;

    procedure Sair1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure SalvarComo1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DesfazerClick(Sender: TObject);
    procedure RecortarClick(Sender: TObject);
    procedure CopiarClick(Sender: TObject);
    procedure ColarClick(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure Text1SelectionChange(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure NegritoButtonClick(Sender: TObject);
    procedure ItalicoButtonClick(Sender: TObject);
    procedure SublinhadoButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure MarcadorButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure JustifyAlignClick(Sender: TObject);
    procedure FirstIndMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Text1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Localizar1Click(Sender: TObject);
    procedure Substituir1Click(Sender: TObject);
    procedure SelecionarTudo1Click(Sender: TObject);
    procedure Data1Click(Sender: TObject);
    procedure Hora1Click(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FFileName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure PerformFileOpen(const AFileName: string);
    procedure UpdateCursorPos;
    procedure GetFontNames;
    procedure SetupRuler;
    procedure SetEditRect;
    function CurrText: TRxTextAttributes;
  public
    cCabecalho, cRodape : string;
  end;

var
  Form_Editor: TForm_Editor;

implementation

uses  RichEdit, ShellAPI;

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
// Tratamento quando ativar a Form
//------------------------------------------------------------------------------

procedure TForm_Editor.FormActivate(Sender: TObject);
begin
   RichPrinter1.Header:= '';
   RichPrinter1.Footer:= '';
end;

//------------------------------------------------------------------------------
// Tratamento quando a Form e chamada
//------------------------------------------------------------------------------

procedure TForm_Editor.FormShow(Sender: TObject);
begin
  UpdateCursorPos;
  DragAcceptFiles(Handle, True);
  Text1.SetFocus;

  // Verifica se alguma linha foi carregada
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    PerformFileOpen(ParamStr(1));

  Text1.Modified := False;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de sair do editor
//------------------------------------------------------------------------------

procedure TForm_Editor.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_Editor.Novo1Click(Sender: TObject);
begin
  SetFileName(sUntitled);
  Text1.Lines.Clear;
  Text1.Modified := False;
  Text1.SetFocus;
end;

procedure TForm_Editor.SetFileName(const FileName: String);
begin
  //Nome do Arquivo Doc
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TForm_Editor.Abrir1Click(Sender: TObject);
begin
  CheckFileSave;
  if OpenDialog1.Execute then
  begin
    PerformFileOpen(OpenDialog1.FileName);
    Text1.ReadOnly := ofReadOnly in OpenDialog1.Options;
  end;
end;

procedure TForm_Editor.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not Text1.Modified then Exit;
  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]),mtConfirmation, mbYesNoCancel,0);
  case SaveResp of
    idYes: FileSave(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;

procedure TForm_Editor.PerformFileOpen(const AFileName: string);
begin
  Text1.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Text1.SetFocus;
  Text1.Modified := False;
end;

procedure TForm_Editor.FileSave(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAs(Sender)
  else
  begin
    Text1.Lines.SaveToFile(FFileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_Editor.FileSaveAs(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName+'.Doc') then
      if MessageDlg(Format(sOverWrite, [SaveDialog1.FileName+'.Doc']),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Text1.Lines.SaveToFile(SaveDialog1.FileName+'.Doc');
    SetFileName(SaveDialog1.FileName+'.Doc');
    Text1.Modified := False;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento botao Salvar
//------------------------------------------------------------------------------

procedure TForm_Editor.Salvar1Click(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAs(Sender)
  else
  begin
    Text1.Lines.SaveToFile(FFileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_Editor.SalvarComo1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName+'.Doc') then
      if MessageDlg(Format(sOverWrite, [SaveDialog1.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Text1.Lines.SaveToFile(SaveDialog1.FileName+'.Doc');
    SetFileName(SaveDialog1.FileName+'.Doc');
    Text1.Modified := False;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento da Opcao de Imprimir
//------------------------------------------------------------------------------

procedure TForm_Editor.Imprimir1Click(Sender: TObject);
begin
  RichPrinter1.PrintRichEditPreview(Text1);
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar a posição do Cursos
//------------------------------------------------------------------------------

procedure TForm_Editor.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos.Y := SendMessage(Text1.Handle, EM_EXLINEFROMCHAR, 0, Text1.SelStart);
  CharPos.X := (Text1.SelStart - SendMessage(Text1.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Desfazer
//------------------------------------------------------------------------------

procedure TForm_Editor.DesfazerClick(Sender: TObject);
begin
  Text1.Undo;
  if Text1.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento do botao recortar
//------------------------------------------------------------------------------

procedure TForm_Editor.RecortarClick(Sender: TObject);
begin
  Text1.CutToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_Editor.CopiarClick(Sender: TObject);
begin
  Text1.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_Editor.ColarClick(Sender: TObject);
begin
  Text1.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da Fontes
//------------------------------------------------------------------------------

procedure TForm_Editor.Fonte1Click(Sender: TObject);
begin
  FontDialog1.Font.Assign(Text1.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  Text1.SetFocus;
end;

//------------------------------------------------------------------------------
// Seta os atributos do Texto
//------------------------------------------------------------------------------

Function TForm_Editor.CurrText: TRxTextAttributes;
begin
  if Text1.SelLength > 0 then
    Result := Text1.SelAttributes
  else
    Result := Text1.DefAttributes;
end;

procedure TForm_Editor.Text1SelectionChange(Sender: TObject);
begin
  try
    FUpdating := True;
    FirstInd.Left := Trunc(Text1.Paragraph.FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((Text1.Paragraph.LeftIndent+Text1.Paragraph.FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((Text1.Paragraph.RightIndent+GutterWid)*RulerAdj);
    NegritoButton.Down := fsBold in Text1.SelAttributes.Style;
    ItalicoButton.Down := fsItalic in Text1.SelAttributes.Style;
    SublinhadoButton.Down := fsUnderline in Text1.SelAttributes.Style;
    MarcadorButton.Down := Boolean(Text1.Paragraph.Numbering);
    FontSize.Text := IntToStr(Text1.SelAttributes.Size);
    JvFontComboBox.Text := Text1.SelAttributes.Name;
    case Ord(Text1.Paragraph.Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
      3: JustifyAlign.Down := True;
    end;
    JvFontComboBox.FontName:= text1.SelAttributes.Name;
    FontSize.Text := inttostr(text1.SelAttributes.size);

    UpdateCursorPos;

  finally
    FUpdating := False;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento da Fonte
//------------------------------------------------------------------------------

procedure TForm_Editor.FontNameChange(Sender: TObject);
begin
  if FUpdating then
      Exit;
  CurrText.Name := JvFontComboBox.Items[JvFontComboBox.ItemIndex];
end;

//------------------------------------------------------------------------------
// Tratamento da tamanho Fonte
//------------------------------------------------------------------------------

procedure TForm_Editor.FontSizeChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

//------------------------------------------------------------------------------
// Muda para negrito o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_Editor.NegritoButtonClick(Sender: TObject);
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

procedure TForm_Editor.ItalicoButtonClick(Sender: TObject);
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

procedure TForm_Editor.SublinhadoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if SublinhadoButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

//------------------------------------------------------------------------------
// Tratamento do alinhamento para esquerda
//------------------------------------------------------------------------------

procedure TForm_Editor.LeftAlignClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if LeftAlign.Down then
    Text1.Paragraph.Alignment := paLeftJustify
  else if CenterAlign.Down then
    Text1.Paragraph.Alignment := paCenter
  else if RightAlign.Down then
    Text1.Paragraph.Alignment := paRightJustify
  else if JustifyAlign.Down then
    Text1.Justify;
end;

procedure TForm_Editor.MarcadorButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  Text1.Paragraph.Numbering := TRxNumbering(MarcadorButton.Down);
end;

procedure TForm_Editor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    CheckFileSave;
  except
    CanClose := False;
  end;
end;

procedure TForm_Editor.FormCreate(Sender: TObject);
begin
  Ruler.Width := Text1.Width-15;
  if (Screen.Width = 800) and (Screen.Height = 600) then
  begin
    Text1.Height := 457;
    Text1.Left := round((Screen.Width-Text1.Width)/2);
    Ruler.Left := Text1.Left;
  end
  else
  if (Screen.Width = 1024) and (Screen.Height = 768) then
  begin
    Text1.Height := 625;
    Text1.Left := round((Screen.Width-Text1.Width)/2);
    Ruler.Left := Text1.Left;
  end;

  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog1.InitialDir := OpenDialog1.InitialDir;
  SetFileName(sUntitled);
  GetFontNames;
  SetupRuler;
  Text1SelectionChange(Self);

  CurrText.Name := DefFontData.Name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
end;

procedure TForm_Editor.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TForm_Editor.FormResize(Sender: TObject);
begin
  SetEditRect;
  Text1SelectionChange(Sender);
end;

procedure TForm_Editor.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.Width;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TForm_Editor.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(JvFontComboBox.Items));
  ReleaseDC(0, DC);
  JvFontComboBox.Sorted := True;
end;

procedure TForm_Editor.SetupRuler;
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

procedure TForm_Editor.SetEditRect;
var
  R: TRect;
begin
  with Text1 do
  begin
    R := Rect(GutterWid, 0, ClientWidth-GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do justifiar texto
//------------------------------------------------------------------------------

procedure TForm_Editor.JustifyAlignClick(Sender: TObject);
begin
  Text1.Justify;
end;

procedure TForm_Editor.FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Editor.FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
    TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Editor.FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FirstInd.Left < RulerLine.Left then
    FirstInd.Left := RulerLine.Left+2;

  FDragging := False;
  Text1.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TForm_Editor.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if LeftInd.Left < RulerLine.Left then
    LeftInd.Left := RulerLine.Left+2;

  FDragging := False;
  Text1.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Text1.Paragraph.FirstIndent;
  Text1SelectionChange(Sender);
end;

procedure TForm_Editor.LeftIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Editor.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if RightInd.Left > RulerLine.Width then
    RightInd.Left := RulerLine.Width-16;

  FDragging := False;
  Text1.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  Text1SelectionChange(Sender);
end;


procedure TForm_Editor.Text1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F3 then
    Text1.FindNext;
end;

procedure TForm_Editor.Localizar1Click(Sender: TObject);
begin
  Text1.FindDialog('');
end;

procedure TForm_Editor.Substituir1Click(Sender: TObject);
begin
  Text1.ReplaceDialog('','');
end;

//------------------------------------------------------------------------------
// Tratamento do botao selecionar tudo
//------------------------------------------------------------------------------

procedure TForm_Editor.SelecionarTudo1Click(Sender: TObject);
begin
   Text1.SetFocus;
   Text1.SelectAll ;
end;


//------------------------------------------------------------------------------
// Tratamento para inserir data
//------------------------------------------------------------------------------

procedure TForm_Editor.Data1Click(Sender: TObject);
begin
  text1.SelText := FormatDateTime(LongDateFormat, Now);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para inserir Hora
//------------------------------------------------------------------------------

procedure TForm_Editor.Hora1Click(Sender: TObject);
begin
  text1.SelText := FormatDateTime('hh":"mm', Now);
end;

//------------------------------------------------------------------------------
// Mostra a versao do editor
//------------------------------------------------------------------------------

procedure TForm_Editor.SobreClick(Sender: TObject);
begin
   ShowMessage('         Editor de Texto         '+#13+#13+'         Versão 1.02');
end;


end.
