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
  JvComponent, JvxClock, JvxCtrls, XPMan;

type
  TForm_Editor = class(TForm)
    Text1: TPsyRichEdit;
    JvThumbImage1: TJvThumbImage;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Ruler: TPanel;
    RulerLine: TBevel;
    RightInd: TLabel;
    Bevel1: TBevel;
    LeftInd: TLabel;
    FirstInd: TLabel;
    RichPrinter1: TRichPrinter;
    PrintDialog1: TPrintDialog;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton_Vizualizar: TSpeedButton;
    SpeedButton_Imprimir: TSpeedButton;
    SpeedButton_Sair: TSpeedButton;

    procedure SelecionarTudo1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Text1SelectionChange(Sender: TObject);
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
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_VizualizarClick(Sender: TObject);
    procedure SpeedButton_SairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton_VizualizarClick(Sender: TObject);
    procedure SpeedButton_ImprimirClick(Sender: TObject);
  private
    FFileName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    procedure SetFileName(const FileName: String);
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

   Form_Editor.SelecionarTudo1Click(Sender);
   Form_Editor.Text1.Paragraph.FirstIndent:= 15;
   Form_Editor.Text1.Paragraph.LeftIndent:= 15;
   Form_Editor.Text1.Paragraph.RightIndent:= 15;
   Form_Editor.Text1SelectionChange(Sender);
   Form_Editor.Text1.SelStart:= 0;  //5
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

procedure TForm_Editor.SpeedButton_SairClick(Sender: TObject);
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

procedure TForm_Editor.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    PerformFileOpen(OpenDialog1.FileName);
    Text1.ReadOnly := ofReadOnly in OpenDialog1.Options;
  end;
end;

procedure TForm_Editor.PerformFileOpen(const AFileName: string);
begin
  Text1.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Text1.SetFocus;
  Text1.Modified := False;
end;

//------------------------------------------------------------------------------
// Tratamento para Vizualizar o Arquivo
//------------------------------------------------------------------------------

procedure TForm_Editor.ToolButton_VizualizarClick(Sender: TObject);
begin
  RichPrinter1.PrintRichEditPreview(Text1);
end;

//------------------------------------------------------------------------------
// Tratamento da Opcao de Imprimir
//------------------------------------------------------------------------------

procedure TForm_Editor.SpeedButton_ImprimirClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
    RichPrinter1.PrintRichEdit(Text1,1);
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
    FirstInd.Left := Trunc(Text1.Paragraph.FirstIndent*RulerAdj)+4+GutterWid;
    LeftInd.Left := Trunc((Text1.Paragraph.LeftIndent+Text1.Paragraph.FirstIndent)*RulerAdj)+4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((Text1.Paragraph.RightIndent+GutterWid)*RulerAdj);
    UpdateCursorPos;

  finally
    FUpdating := False;
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
//  SaveDialog1.InitialDir := OpenDialog1.InitialDir;
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
//  EnumFonts(DC, nil, @EnumFontsProc, Pointer(JvFontComboBox_Font.Items));
  ReleaseDC(0, DC);
//  JvFontComboBox_Font.Sorted := True;
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

//------------------------------------------------------------------------------
// Mostra a versao do editor
//------------------------------------------------------------------------------

procedure TForm_Editor.SpeedButton_VizualizarClick(Sender: TObject);
begin
  RichPrinter1.PrintRichEditPreview(Text1);
end;

end.
