//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Avaliacao.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da avaliacao.                                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
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

unit Cad_Diploma;

interface

uses
  Printers, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent, JvxClock,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas, JvDlg,
  JvBalloonHint, JvEnterTab, JvGrdCpt, DB, IBCustomDataSet, IBTable,
  IBQuery, JvClock, DBGrids, JvDBRichEd, Mask, JvGradient, JvTransBtn,
  JvShape;

type
  TForm_Cad_Diploma = class(TForm)
    ScrollBox_Campos: TScrollBox;
    IBQuery_Consulta: TIBQuery;
    DSQ_Documentacao: TDataSource;
    IBTable_Documento: TIBTable;
    DST_Doc: TDataSource;
    JvThumbImage1: TJvThumbImage;
    ControlBar_Botoes: TControlBar;
    ToolBar2: TToolBar;
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
    ToolButton1: TToolButton;
    ToolButton_Imagem: TToolButton;
    ToolBar3: TToolBar;
    ToolButton_Desfazer: TToolButton;
    ToolButton_Recortar: TToolButton;
    ToolButton_Copiar: TToolButton;
    ToolButton_Colar: TToolButton;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    IBTable_DocumentoCODIGO: TIntegerField;
    IBTable_DocumentoDOC: TIBStringField;
    IBTable_DocumentoDESCRICAO: TBlobField;
    ScrollBox1: TScrollBox;
    Text1: TJvDBRichEdit;
    Panel3: TPanel;
    DBGrid_Selecao: TDBGrid;
    Panel_Botoes: TPanel;
    JvGradient_Tela01: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape_Alterar: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;

    procedure ExecutaQuery;
    procedure Botoes_Basico(Status: boolean);
    procedure Campos(Status: Boolean);

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_DesfazerClick(Sender: TObject);
    procedure ToolButton_CopiarClick(Sender: TObject);
    procedure ToolButton_ColarClick(Sender: TObject);
    procedure JvFontComboBoxClick(Sender: TObject);
    procedure ToolButton_AlinhamentoEsqClick(Sender: TObject);
    procedure Text1SelectionChange(Sender: TObject);
    procedure ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
    procedure ToolButton_AlinhamentoDirClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_CorClick(Sender: TObject);
    procedure ToolButton_NegritoClick(Sender: TObject);
    procedure ToolButton_ItalicClick(Sender: TObject);
    procedure ToolButton_SublinhadoClick(Sender: TObject);
    procedure ToolButton_ImagemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
      VS_Comando, VS_OrderBy: String;
  public    { Public declarations }
  end;

var
  Form_Cad_Diploma: TForm_Cad_Diploma;
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

procedure TForm_Cad_Diploma.FormCreate(Sender: TObject);
begin
  Text1.Font.Name := 'Courier New';
  Text1.Font.Size := 11;

   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      JvGradient_Tela01.StartColor:= Cor_Tela;
      
      Funcoes.CabecalhoForm( Form_Cad_Diploma, ' Cadastro de Diploma');

      Funcoes.SetCadCurso('CadDoc');
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Gerência - Montagem Diploma');    // Abre o perfil do usuario em relacao a agenda

      Botoes_Basico( True);
      Campos(False);

      IBTable_Documento.Open;
      VS_Comando:= 'select Codigo, doc from Documento where codigo = 4 or codigo = 6 or codigo = 25 or codigo = 29 or codigo = 30 or codigo = 31 or codigo = 36 ';
      VS_OrderBy:= 'Doc';
      ExecutaQuery;
   end;
end;

//------------------------------------------------------------------------------
// Executa a query
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.Botoes_Basico(Status: boolean);
begin
   JvTransparentButton_Alterar.Enabled:= Status;
   JvShape_Alterar.Enabled:= Status;

   JvTransparentButton_Retornar.Enabled:= Status;
   JvShape_Retornar.Enabled:= Status;

   JvTransparentButton_Windows.Enabled:= Status;
   JvShape_Windows.Enabled:= Status;

   if Status = True then
       Status:= False
   else
       Status:= True;

   JvTransparentButton_Grava.Enabled:= Status;
   JvShape_Gravar.Enabled:= Status;

   JvTransparentButton_Cancelar.Enabled:= Status;
   JvShape_Cancelar.Enabled:= Status;


end;
//------------------------------------------------------------------------------
// Executa a query
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ExecutaQuery;
begin
   IBQuery_Consulta.Close;
   IBQuery_Consulta.SQL.Clear;
   IBQuery_Consulta.SQL.Add(VS_Comando+' Order by '+VS_OrderBy);
   IBQuery_Consulta.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   IBQuery_Consulta.Close;
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.Campos(Status: Boolean);
begin
   ToolButton_Desfazer.Enabled:= Status;
   ToolButton_Recortar.Enabled:= Status;
   ToolButton_Copiar.Enabled:= Status;
   ToolButton_Colar.Enabled:= Status;
   ToolButton_AlinhamentoEsq.Enabled:= Status;
   ToolButton_AlinhamentoCentralizar.Enabled:= Status;
   ToolButton_AlinhamentoDir.Enabled:= Status;
   ToolButton_Fonte.Enabled:= Status;
   ToolButton_Cor.Enabled:= Status;
   ToolButton_Negrito.Enabled:= Status;
   ToolButton_Italic.Enabled:= Status;
   ToolButton_Sublinhado.Enabled:= Status;
   ToolButton_Imagem.Enabled:= Status;

   if Status = True then
      Status:= False
   else
      Status:= True;

   Text1.ReadOnly:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Montagem Diploma', 'Alterar');

   Campos(True);
   Botoes_Basico( False);

   IBTable_Documento.Edit;
   Text1.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.JvTransparentButton_GravaClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Montagem Diploma', 'Gravar');
   IBTable_Documento.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_Consulta);

   Campos(False);
   Botoes_Basico( True);
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Gerência - Montagem Diploma', 'Cancelar');
   IBTable_Documento.Cancel;
   Funcoes.abortaTransacao;;
   IBQuery_Consulta.Close;
   IBQuery_Consulta.Open;

   Campos(False);
   Botoes_Basico( True);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Undo
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_DesfazerClick(Sender: TObject);
begin
  Text1.Undo;
  if Text1.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_CopiarClick(Sender: TObject);
begin
   Text1.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_ColarClick(Sender: TObject);
begin
   Text1.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da fonte de letra
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.JvFontComboBoxClick(Sender: TObject);
begin
//  Text1.SelAttributes.Name := JvFontComboBox.FontName;
end;

procedure TForm_Cad_Diploma.Text1SelectionChange(Sender: TObject);
begin
//   ToolButton9.Enabled := Text1.SelLength > 0;
   ToolButton_Copiar.Enabled := Text1.SelLength > 0;
//   ToolButton10.Enabled := Text1.SelLength > 0;
   ToolButton_Recortar.Enabled := Text1.SelLength > 0;
//   ToolButton11.Enabled := Clipboard.HasFormat(CF_TEXT);
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
//   JvFontComboBox.FontName:= text1.SelAttributes.Name;
//   ComboBox_Tamanho.Text := inttostr(text1.SelAttributes.size);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para esquerda
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_AlinhamentoEsqClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para centralizar
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
begin
  Text1.Paragraph.Alignment := paCenter;
  Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do bota para ajustar para direita
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_AlinhamentoDirClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paRightJustify;
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_FonteClick(Sender: TObject);
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

procedure TForm_Cad_Diploma.ToolButton_CorClick(Sender: TObject);
begin
   ColorDialog1.Execute ;
   Text1.SelAttributes.Color := ColorDialog1.Color;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da negrito
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.ToolButton_NegritoClick(Sender: TObject);
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

procedure TForm_Cad_Diploma.ToolButton_ItalicClick(Sender: TObject);
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

procedure TForm_Cad_Diploma.ToolButton_SublinhadoClick(Sender: TObject);
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

procedure TForm_Cad_Diploma.ToolButton_ImagemClick(Sender: TObject);
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
   end;
   JvThumbImage1.Picture.Graphic.SaveToClipboardFormat(MyFormat,AData,APalette);
   ClipBoard.SetAsHandle(MyFormat,AData);
   Text1.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Diploma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Consulta.Close;
   IBTable_Documento.Close;
   Action:= caFree;
end;

end.
