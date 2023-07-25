//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Sel_Disciplina.pas                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da Selecao  //
//                             das Disciplinas dos Cursos.                    //
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

unit CriticaEspontanea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvLookOut,

  IdMessage, IdAntiFreezeBase, IdAntiFreeze,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdException, JvTransBtn, JvCheckBox;
type
  TForm_CriticaEspontanea = class(TForm)
    Panel_Treeviw: TPanel;
    IBQuery_FA_Critica: TIBQuery;
    DSQ_FA_Critica: TDataSource;
    IBTable_CriticaEspontanea: TIBTable;
    DST_CriticaEspontanea: TDataSource;
    IBQuery_FA_CriticaIDCURSO: TSmallintField;
    IBQuery_FA_CriticaIDTURMA: TIntegerField;
    IBQuery_FA_CriticaIDCRITICA: TSmallintField;
    IBQuery_FA_CriticaDISCIPLINA: TIBStringField;
    IBQuery_FA_CriticaIDINSTRUTOR: TIBStringField;
    IBQuery_FA_CriticaIDCRITICADOR: TIBStringField;
    IBQuery_FA_CriticaFUNCAO: TIBStringField;
    IBQuery_FA_CriticaSETORCRITICADO: TIBStringField;
    IBQuery_FA_CriticaDATAAVALIACAO: TIBStringField;
    IBQuery_FA_CriticaCOMENTARIO: TMemoField;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    JvDBRichEdit_Providencia: TJvDBRichEdit;
    ToolBar_EditorAndamentoTurma: TToolBar;
    RecortarButton: TToolButton;
    CopiarButton: TToolButton;
    ColarButton: TToolButton;
    DesfazerButton: TToolButton;
    ToolButton10: TToolButton;
    JvFontComboBox: TJvFontComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton3: TToolButton;
    NegritoButton: TToolButton;
    ItalicoButton: TToolButton;
    SublinhadoButton: TToolButton;
    ToolButton20: TToolButton;
    ToolButton_Fonte: TToolButton;
    ToolButton_Cor: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_InseriLinha: TToolButton;
    ToolButton_InserirHora: TToolButton;
    ToolButton_InsereCalendario: TToolButton;
    IBTable_CriticaEspontaneaIDCURSO: TSmallintField;
    IBTable_CriticaEspontaneaIDTURMA: TIntegerField;
    IBTable_CriticaEspontaneaIDCRITICA: TSmallintField;
    IBTable_CriticaEspontaneaDISCIPLINA: TIBStringField;
    IBTable_CriticaEspontaneaIDINSTRUTOR: TIBStringField;
    IBTable_CriticaEspontaneaIDCRITICADOR: TIBStringField;
    IBTable_CriticaEspontaneaFUNCAO: TIBStringField;
    IBTable_CriticaEspontaneaSETORCRITICADO: TIBStringField;
    IBTable_CriticaEspontaneaDATAAVALIACAO: TIBStringField;
    IBTable_CriticaEspontaneaCOMENTARIO: TMemoField;
    IBTable_CriticaEspontaneaPROVIDENCIA: TMemoField;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    Panel3: TPanel;
    DBGrid_Critica: TDBGrid;
    Label3: TLabel;
    IBQuery_InstrutorTurma: TIBQuery;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBQuery_InstrutorTurmaNOME: TIBStringField;
    IBQuery_InstrutorTurmaNOMEGUERRA: TIBStringField;
    IBQuery_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_InstrutorTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDSUBUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaFUNCAO: TIBStringField;
    IBQuery_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBQuery_InstrutorTurmaDATASAIDA: TDateTimeField;
    IBQuery_InstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBQuery_InstrutorTurmaFICHA: TIBStringField;
    IBQuery_InstrutorTurmaSARAM: TIBStringField;
    DSQ_InstrutorTurma: TDataSource;
    DBText_Instrutor: TDBText;
    Label6: TLabel;
    DBText_Descricao: TDBText;
    IBTable_Disciplina: TIBTable;
    DST_Disciplina: TDataSource;
    IBTable_DisciplinaIDCURSO: TSmallintField;
    IBTable_DisciplinaIDTURMA: TIntegerField;
    IBTable_DisciplinaCODMATERIA: TIBStringField;
    IBTable_DisciplinaNOMEMATERIA: TIBStringField;
    DBText_CodDisciplina: TDBText;
    SpeedButton_Enviar: TSpeedButton;
    IBTable_CriticaEspontaneaENCAMINHADA: TIBStringField;
    IBQuery_FA_CriticaENCAMINHADA: TIBStringField;
    Panel_Turma: TPanel;
    Memo1: TMemo;
    Panel_Frame_SelCurso: TPanel;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    Panel_BotoesArq: TPanel;
    JvGradient2: TJvGradient;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Memo3: TMemo;
    JvDBRichEdit_CriticaEspontanea: TDBMemo;

    function CurrText: TJvTextAttributes;

    procedure FormActivate(Sender: TObject);

    procedure SpeedButton_AtualizaTurmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RecortarButtonClick(Sender: TObject);
    procedure CopiarButtonClick(Sender: TObject);
    procedure ColarButtonClick(Sender: TObject);
    procedure DesfazerButtonClick(Sender: TObject);
    procedure JvFontComboBoxChange(Sender: TObject);
    procedure NegritoButtonClick(Sender: TObject);
    procedure ItalicoButtonClick(Sender: TObject);
    procedure SublinhadoButtonClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_CorClick(Sender: TObject);
    procedure ToolButton_InseriLinhaClick(Sender: TObject);
    procedure ToolButton_InserirHoraClick(Sender: TObject);
    procedure ToolButton_InsereCalendarioClick(Sender: TObject);
    procedure JvDBRichEdit_ProvidenciaEnter(Sender: TObject);
    procedure SpeedButton_EnviarClick(Sender: TObject);
    procedure DBGrid_CriticaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvDBRichEdit_CriticaEspontaneaClick(Sender: TObject);

  private    { Private declarations }
     FUpdating: Boolean;

  public    { Public declarations }

  end;
var
  Form_CriticaEspontanea: TForm_CriticaEspontanea;

implementation

uses Frame_Sel_Curso, MenuPrincipal, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'CertidaoCurricular')) then
   begin

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_CriticaEspontanea.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Cadastro', 'Em Andamento');

      Funcoes.SetCadCurso('CadCurso');
      IBQuery_FA_Critica.Open;
      IBQuery_InstrutorTurma.Open;
      IBTable_Disciplina.Open;
      IBTable_CriticaEspontanea.Open;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.AtualizaQuery(Form_MenuPrincipal.IBQuery_FA_Critica);

   IBTable_CriticaEspontanea.Close;
   IBQuery_FA_Critica.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_FA_Critica);
end;

//------------------------------------------------------------------------------
// Atualiza Materia
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.SpeedButton_AtualizaTurmaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_FA_Critica);
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro da Critica Espontanea
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Editor
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao recortar
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.RecortarButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Providencia.CutToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.CopiarButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Providencia.CopyToClipboard;

end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.ColarButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Providencia.PasteFromClipboard;

end;

//------------------------------------------------------------------------------
// Tratamento do botao Desfazer
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.DesfazerButtonClick(Sender: TObject);
begin
  JvDBRichEdit_Providencia.Undo;
  if JvDBRichEdit_Providencia.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento da Fonte
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.JvFontComboBoxChange(Sender: TObject);
begin
  if FUpdating then
      Exit;
  CurrText.Name:= JvFontComboBox.Items[JvFontComboBox.ItemIndex];
end;

//------------------------------------------------------------------------------
// Muda para negrito o texto selecionado
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.NegritoButtonClick(Sender: TObject);
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

procedure TForm_CriticaEspontanea.ItalicoButtonClick(Sender: TObject);
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

procedure TForm_CriticaEspontanea.SublinhadoButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if SublinhadoButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];

end;

//------------------------------------------------------------------------------
// Tratamento do botao Fonte
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.ToolButton_FonteClick(Sender: TObject);
begin
  FontDialog1.Execute;
  JvDBRichEdit_Providencia.SelAttributes.Color := FontDialog1.Font.Color;
  JvDBRichEdit_Providencia.SelAttributes.Name := FontDialog1.Font.Name;
  JvDBRichEdit_Providencia.SelAttributes.Size := FontDialog1.Font.Size;
  JvDBRichEdit_Providencia.SelAttributes.Style := FontDialog1.Font.Style;

end;

//------------------------------------------------------------------------------
// Muda a cor do texto selecionado
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.ToolButton_CorClick(Sender: TObject);
begin
   ColorDialog1.Execute ;
   JvDBRichEdit_Providencia.SelAttributes.Color := ColorDialog1.Color;
end;

//------------------------------------------------------------------------------
// Coloca o Traco no texto
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.ToolButton_InseriLinhaClick(Sender: TObject);
begin
   JvDBRichEdit_Providencia.Lines.Add('=================================================================================');

end;

//------------------------------------------------------------------------------
// Tratamento do botao para inserir Hora
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.ToolButton_InserirHoraClick( Sender: TObject);
begin
  JvDBRichEdit_Providencia.Lines.Add(FormatDateTime('hh":"mm "Horas"', Now));
end;

//------------------------------------------------------------------------------
// Tratamento para inserir data
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.ToolButton_InsereCalendarioClick( Sender: TObject);
begin
  JvDBRichEdit_Providencia.Lines.Add(FormatDateTime(LongDateFormat, Now));
end;

//------------------------------------------------------------------------------
// Seta os atributos do Texto
//------------------------------------------------------------------------------

Function TForm_CriticaEspontanea.CurrText: TJvTextAttributes;
begin
  if JvDBRichEdit_Providencia.SelLength > 0 then
    Result := JvDBRichEdit_Providencia.SelAttributes
  else
    Result := JvDBRichEdit_Providencia.DefAttributes;
end;

procedure TForm_CriticaEspontanea.JvDBRichEdit_ProvidenciaEnter( Sender: TObject);
begin
   IBTable_CriticaEspontanea.Edit;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.JvTransparentButton_GravaClick(Sender: TObject);
begin
   if ((IBTable_CriticaEspontanea.State = DSInsert) or (IBTable_CriticaEspontanea.State = DSEdit )) then
   begin
      IBTable_CriticaEspontanea.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_CriticaEspontanea.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if ((IBTable_CriticaEspontanea.State = DSInsert) or (IBTable_CriticaEspontanea.State = DSEdit )) then
   begin
      IBTable_CriticaEspontanea.Cancel;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Enviar Email
//------------------------------------------------------------------------------

//procedure TForm_Fer_Email.ToolButton_EnviarMsgClick(Sender: TObject);

procedure TForm_CriticaEspontanea.SpeedButton_EnviarClick(Sender: TObject);
var
    VS_Msg, mensagem: String;
    VS_Para, VS_Assunto:string;
begin
   try
      //--- Tratamento do Responsavel que ira receber o Email

      IBTable_CriticaEspontanea.Edit;
      IBTable_CriticaEspontanea.FieldByName('Encaminhada').AsString:= 'S';
      IBTable_CriticaEspontanea.Post;
      Funcoes.ExecutaTransacao;

      VS_Msg:= '';
      VS_Assunto:= 'Critica Espontânea do Curso '+Funcoes.GetCodCurso;

      if ((DBText_Instrutor.Caption <> '') or (DBText_CodDisciplina.Caption <> '')) then
      begin
         if DBText_Instrutor.Caption <> '' then
            VS_Assunto:= VS_Assunto+' [ Instrutor: '+DBText_Instrutor.Caption+' ]';

         if DBText_CodDisciplina.Caption <> '' then
            VS_Assunto:= VS_Assunto+' [ Disciplina: '+DBText_CodDisciplina.Caption+' '+DBText_Descricao.Caption+' ]';
      end
      else
      begin
         VS_Assunto:=  VS_Assunto+' [ '+IBQuery_FA_Critica.FieldByName('SETORCRITICADO').AsString+' ]';
      end;

      VS_Msg:= VS_Msg+PChar(JvDBRichEdit_CriticaEspontanea.Text);
      VS_Msg:= Funcoes.DePara(VS_Msg, '"', '');

      VS_Para:= '';

      mensagem := 'mailto:'+PChar(VS_Para)+'?cc= &subject='+VS_Assunto+'&body='+PChar(VS_Msg);

      ShellExecute(handle,'open',PChar(mensagem), '','',SW_SHOWNORMAL);
      Funcoes.AtualizaQuery(IBQuery_FA_Critica);
   except
      VS_Msg:= '';
      VS_Assunto:= 'Critica Espontânea do Curso '+Funcoes.GetCodCurso;
      if DBText_Instrutor.Caption <> '' then
         VS_Assunto:= VS_Assunto+' [ Instrutor: '+DBText_Instrutor.Caption+' ]';

      if DBText_CodDisciplina.Caption <> '' then
         VS_Assunto:= VS_Assunto+' [ Disciplina: '+DBText_CodDisciplina.Caption+' '+DBText_Descricao.Caption+' ]';

      VS_Msg:= VS_Msg+PChar(JvDBRichEdit_CriticaEspontanea.Text);

      VS_Para:= '';

      mensagem := 'mailto:'+PChar(VS_Para)+'?cc= &subject='+VS_Assunto+'&body='+PChar(VS_Msg);

      ShellExecute(handle,'open',PChar(mensagem), '','',SW_SHOWNORMAL);
      Funcoes.AtualizaQuery(IBQuery_FA_Critica);

   end;

end;


procedure TForm_CriticaEspontanea.DBGrid_CriticaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBQuery_FA_Critica.FieldByName('Encaminhada').AsString = 'S' then
      DBGrid_Critica.Canvas.Font.Color:= clBlack
   else
      DBGrid_Critica.Canvas.Font.Color:= clRed;

  if gdSelected in State then
    DBGrid_Critica.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Critica.Canvas.FillRect(Rect);
   DBGrid_Critica.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_CriticaEspontanea.JvDBRichEdit_CriticaEspontaneaClick(
  Sender: TObject);
begin
      IBTable_CriticaEspontanea.Edit;

end;

end.

