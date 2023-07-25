//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Msg_FAC.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das mensagens das Fichas de Avalia豫o (FAC).   //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Marcela                                     //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 19/05/2020                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//


unit FAC_Comentario_ICEA;

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
  TForm_FAC_Comentario_ICEA = class(TForm)
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    Panel4: TPanel;
    Panel_Doc: TPanel;
    ScrollBox_Campos: TScrollBox;
    IBTable_FAC_ICEA: TIBTable;
    IBTable_FAC_ICEAIDAVALIACAO: TIntegerField;
    IBTable_FAC_ICEATIPO: TIBStringField;
    DST_FAC_ICEA: TDataSource;
    DBGrid_Item: TDBGrid;
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
    Text_Comentario: TJvDBRichEdit;
    Panel_Botoes_Instrutor: TPanel;
    DBNavigator1: TDBNavigator;
    Memo1: TMemo;
    JvGradient2: TJvGradient;
    JvShape20: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    ControlBar_Botoes: TControlBar;
    ToolBar2: TToolBar;
    JvFontComboBox: TJvFontComboBox;
    ComboBox_Tamanho: TComboBox;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolBar1: TToolBar;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    JvShape1: TJvShape;
    IBTable_FAC_ICEACOMENTARIO: TIBStringField;
    JvGradient1: TJvGradient;
    JvShape2: TJvShape;
    JvTransparentButton1: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;

    procedure Alterar;
    procedure Carga(VS_Tipo: String);
    procedure TrataBotoes(Status: Boolean);

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_DesfazerClick(Sender: TObject);
    procedure ToolButton_CopiarClick(Sender: TObject);
    procedure ToolButton_ColarClick(Sender: TObject);
    procedure JvFontComboBoxClick(Sender: TObject);
    procedure ComboBox_TamanhoClick(Sender: TObject);
    procedure ToolButton_AlinhamentoEsqClick(Sender: TObject);
    procedure Text_ComentarioSelectionChange(Sender: TObject);
    procedure ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
    procedure ToolButton_AlinhamentoDirClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_CorClick(Sender: TObject);
    procedure ToolButton_NegritoClick(Sender: TObject);
    procedure ToolButton_ItalicClick(Sender: TObject);
    procedure ToolButton_SublinhadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_RecortarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure IBTable_FAC_ICEAAfterScroll(DataSet: TDataSet);
  private    { Private declarations }
      bmLocal : TBookmark;
      FDragOfs: Integer;
      FDragging: Boolean;

      VS_Comando: String;
  public    { Public declarations }
  end;

var
  Form_FAC_Comentario_ICEA: TForm_FAC_Comentario_ICEA;
  Alterado: Boolean;
  NovoArquivo: Boolean;
  Fechar: Boolean;
  NomeArquivo: String;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo de criacao da Form
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.FormCreate(Sender: TObject);
var
   N: integer;
begin
   for N := 1 to 48 do
   Begin
      ComboBox_Tamanho.Items.Add(inttostr(N));
   end;
   ComboBox_Tamanho.Text := '11';
   Text_Comentario.Font.Name := 'Courier New';
   Text_Comentario.Font.Size := 11;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.Carga(VS_Tipo: String);
begin
   IBTable_FAC_ICEA.Append;
   IBTable_FAC_ICEA.FieldByName('Tipo').AsString:= VS_Tipo;
   IBTable_FAC_ICEA.FieldByName('Comentario').AsString:= '';
   IBTable_FAC_ICEA.Post;
end;
//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.FormActivate(Sender: TObject);
begin
   JvFontComboBox.FontName:= 'Courier New';

   IBTable_FAC_ICEA.Open;

   if IBTable_FAC_ICEA.FieldByName('Tipo').AsString = '' then
   begin
      Carga( '1 - DISCIPLINA');
      Carga( '2 - DOCENTES');
      Carga( '3 - AVALIA플O');
      Carga( '4 - MATERIAL DID햀ICO');
      Carga( '5 - OBSERVA합ES');
      Carga( '6 - A합ES DE RESPONS핦ILIDADE DA OM EXECUTORA DO CURSO');
      Carga( '7 - A합ES DE RESPONS핦ILIDADE DA DCTP');

      Funcoes.ExecutaTransacao;
   end;
   IBTable_FAC_ICEA.First;
   
   Alterar;
end;

//------------------------------------------------------------------------------
// Tratameno quando fechara a Form
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_FAC_ICEA.Close;
//   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Comantario
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao altera materia
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.Alterar;
begin
   IBTable_FAC_ICEA.Edit;
   Text_Comentario.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.TrataBotoes(Status: Boolean);
begin
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
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.JvTransparentButton_GravarClick(Sender: TObject);
begin
   if ((IBTable_FAC_ICEA.State = DSInsert) or (IBTable_FAC_ICEA.State = DSEdit )) then
   begin
      IBTable_FAC_ICEA.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if ((IBTable_FAC_ICEA.State = DSInsert) or (IBTable_FAC_ICEA.State = DSEdit )) then
   begin
      IBTable_FAC_ICEA.Cancel;
      Funcoes.ExecutaTransacao;
   end;
end;


//------------------------------------------------------------------------------
// Tratamento do botao Undo
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_DesfazerClick(Sender: TObject);
begin
  Text_Comentario.Undo;
  if Text_Comentario.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_CopiarClick(Sender: TObject);
begin
   Text_Comentario.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_ColarClick(Sender: TObject);
begin
   Text_Comentario.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da fonte de letra
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.JvFontComboBoxClick(Sender: TObject);
begin
  Text_Comentario.SelAttributes.Name := JvFontComboBox.FontName;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do tamanho da fonte
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ComboBox_TamanhoClick(Sender: TObject);
begin
  Text_Comentario.SelAttributes.Size := StrToInt(ComboBox_Tamanho.Items[ComboBox_Tamanho.ItemIndex]);
  FontDialog1.Font.Size := StrToInt(ComboBox_Tamanho.Items[ComboBox_Tamanho.itemindex]);
  Text_Comentario.SetFocus;
end;

procedure TForm_FAC_Comentario_ICEA.Text_ComentarioSelectionChange(Sender: TObject);
begin
   ToolButton_Copiar.Enabled := Text_Comentario.SelLength > 0;
   ToolButton_Recortar.Enabled := Text_Comentario.SelLength > 0;
   ToolButton_Colar.Enabled := Clipboard.HasFormat(CF_TEXT);
   ToolButton_Negrito.Down := (fsBold in Text_Comentario.SelAttributes.Style);
   ToolButton_Italic.Down := (fsItalic in Text_Comentario.SelAttributes.Style);
   ToolButton_Sublinhado.Down := (fsUnderline in Text_Comentario.SelAttributes.Style);
   case Text_Comentario.Paragraph.Alignment of
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
   JvFontComboBox.FontName:= Text_Comentario.SelAttributes.Name;
   ComboBox_Tamanho.Text := inttostr(Text_Comentario.SelAttributes.size);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para esquerda
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_AlinhamentoEsqClick(Sender: TObject);
begin
   Text_Comentario.Paragraph.Alignment := paLeftJustify;
   Text_ComentarioSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para centralizar
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
begin
  Text_Comentario.Paragraph.Alignment := paCenter;
  Text_ComentarioSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do bota para ajustar para direita
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_AlinhamentoDirClick(Sender: TObject);
begin
   Text_Comentario.Paragraph.Alignment := paRightJustify;
   Text_ComentarioSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar fonte
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_FonteClick(Sender: TObject);
begin
  FontDialog1.Execute;
  Text_Comentario.SelAttributes.Color := FontDialog1.Font.Color;
  Text_Comentario.SelAttributes.Name := FontDialog1.Font.Name;
  Text_Comentario.SelAttributes.Size := FontDialog1.Font.Size;
  Text_Comentario.SelAttributes.Style := FontDialog1.Font.Style;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da cor
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_CorClick(Sender: TObject);
begin
   ColorDialog1.Execute ;
   Text_Comentario.SelAttributes.Color := ColorDialog1.Color;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da negrito
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_NegritoClick(Sender: TObject);
begin
   if    (Text_Comentario.SelAttributes.Style = [fsbold]) or
         (Text_Comentario.SelAttributes.Style = [fsbold, fsitalic]) or
         (Text_Comentario.SelAttributes.Style = [fsbold, fsunderline]) or
         (Text_Comentario.SelAttributes.Style = [fsbold, fsitalic, fsunderline]) then
      Text_Comentario.SelAttributes.Style := Text_Comentario.SelAttributes.Style - [fsbold]
   else
      Text_Comentario.SelAttributes.Style := Text_Comentario.SelAttributes.Style + [fsbold];
   Text_ComentarioSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da Italico
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_ItalicClick(Sender: TObject);
begin
   if (Text_Comentario.SelAttributes.Style = [fsitalic]) or
      (Text_Comentario.SelAttributes.Style = [fsitalic, fsbold]) or
      (Text_Comentario.SelAttributes.Style = [fsitalic, fsunderline]) or
      (Text_Comentario.SelAttributes.Style = [fsitalic, fsbold, fsunderline]) then
   Text_Comentario.SelAttributes.Style := Text_Comentario.SelAttributes.Style - [fsitalic]
   else
   Text_Comentario.SelAttributes.Style := Text_Comentario.SelAttributes.Style + [fsitalic];
   Text_ComentarioSelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da sublinhado
//------------------------------------------------------------------------------

procedure TForm_FAC_Comentario_ICEA.ToolButton_SublinhadoClick(Sender: TObject);
begin
    if (Text_Comentario.SelAttributes.Style = [fsunderline]) or
       (Text_Comentario.SelAttributes.Style = [fsunderline, fsitalic]) or
       (Text_Comentario.SelAttributes.Style = [fsunderline, fsbold]) or
       (Text_Comentario.SelAttributes.Style = [fsunderline, fsitalic, fsbold]) then
    Text_Comentario.SelAttributes.Style := Text_Comentario.SelAttributes.Style - [fsunderline]
    else
    Text_Comentario.SelAttributes.Style := Text_Comentario.SelAttributes.Style + [fsunderline];
    Text_ComentarioSelectionChange(Sender);
end;

procedure TForm_FAC_Comentario_ICEA.ToolButton_RecortarClick(Sender: TObject);
begin
  Text_Comentario.CutToClipboard;
end;


procedure TForm_FAC_Comentario_ICEA.IBTable_FAC_ICEAAfterScroll(
  DataSet: TDataSet);
begin
  Alterar;
end;

end.
