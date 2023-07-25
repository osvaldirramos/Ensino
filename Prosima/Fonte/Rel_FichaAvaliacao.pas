//------------------------------------------------------------------------------
//
// Prosima
//
// Responsavel: Osvaldir D Ramos
// Data       : 01/11/2012
// Modulo     : Modulo responsavel pelo cadastramento das respostas da Ficha de
//              Avaliacao
//
//------------------------------------------------------------------------------

unit Rel_FichaAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvShape, ComCtrls, ToolWin, Grids, DBGrids, JvRadioButton,
  JvComponent, JvxCtrls, Buttons, JvColorCombo, JvRichEd, JvDBRichEd, Rotinas,
  JvCheckBox, JvToolEdit, JvCombobox, ComObj,
  XPMan, Menus, JvArrowBtn, JvLookOut, JvGradient;

type
  TForm_Rel_FichaAvaliacao = class(TForm)
    DBGrid1: TDBGrid;
    DST_Cad_ATCO: TDataSource;
    Panel1: TPanel;
    DBEdit_termino: TDBEdit;
    DBEdit_Inicio: TDBEdit;
    Panel_NA: TPanel;
    Panel_NS: TPanel;
    Panel_Bom: TPanel;
    Panel_Reg: TPanel;
    Panel_Otimo: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox2: TGroupBox;
    Panel_Media: TPanel;
    DBEdit_DataAval: TDBEdit;
    DBEdit8: TDBEdit;
    JvGradient2: TJvGradient;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    SpeedButton_Finalizar: TSpeedButton;
    Panel3: TPanel;
    ToolBar_EditorAndamentoTurma: TToolBar;
    JvDBRichEdit_Parecer: TJvDBRichEdit;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    Edit_Prosima: TEdit;
    Label13: TLabel;
    Label15: TLabel;
    DBEdit_Exercicio: TDBEdit;
    JvGradient1: TJvGradient;

    procedure Processar;
    procedure Mostrar_Medias;

    procedure FormActivate(Sender: TObject);

    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton_FinalizarClick(Sender: TObject);
  private    { Private declarations }
      VI_TotalReg, VI_OTIMO, VI_BOM, VI_REGULAR, VI_NS, VI_NA: Integer;
      VS_Msg: String;
  public    { Public declarations }

  end;

var
  Form_Rel_FichaAvaliacao: TForm_Rel_FichaAvaliacao;

implementation

uses Module, Classificacao;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Rel_FichaAvaliacao.FormActivate(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Form_Classificacao.IBQuery_FichaAvaliacao);
   Edit_Prosima.Text:= Form_Classificacao.ComboBox_Turma.Text;
   VS_Msg:= '' ;
   Panel_Media.Caption:= '0';

   Processar;
end;

procedure TForm_Rel_FichaAvaliacao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Check: Integer;
   R: TRect;
begin
   // Tratamento do zebrado

   if not odd(Form_Classificacao.IBQuery_FichaAvaliacao.RecNo) then
   begin
      DBGrid1.Canvas.Font.Color:= clBlack;
      DBGrid1.Canvas.Brush.Color:= $00EAFFEA;
   end
   else
   begin
      DBGrid1.Canvas.Font.Color:= clBlack;
      DBGrid1.Canvas.Brush.Color:= clWhite;
   end;
   DBGrid1.Canvas.FillRect(Rect);
   DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);

   //Desenha um checkbox no dbgrid
   if Column.FieldName = 'OTIMO' then
   begin
      DBGrid1.Canvas.FillRect(Rect);
      if Form_Classificacao.IBQuery_FichaAvaliacao.FieldByName('OTIMO').AsString = '1' then
         Check := DFCS_CHECKED
      else
        Check := 0;

      R:=Rect;
      InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

   if Column.FieldName = 'BOM' then
   begin
      DBGrid1.Canvas.FillRect(Rect);
      if Form_Classificacao.IBQuery_FichaAvaliacao.FieldByName('BOM').AsString = '1' then
         Check := DFCS_CHECKED
      else
        Check := 0;

      R:=Rect;
      InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

   if Column.FieldName = 'REGULAR' then
   begin
      DBGrid1.Canvas.FillRect(Rect);
      if Form_Classificacao.IBQuery_FichaAvaliacao.FieldByName('REGULAR').AsString = '1' then
         Check := DFCS_CHECKED
      else
        Check := 0;

      R:=Rect;
      InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

   if Column.FieldName = 'NS' then
   begin
      DBGrid1.Canvas.FillRect(Rect);
      if Form_Classificacao.IBQuery_FichaAvaliacao.FieldByName('NS').AsString = '1' then
         Check := DFCS_CHECKED
      else
        Check := 0;

      R:=Rect;
      InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

   if Column.FieldName = 'NA' then
   begin
      DBGrid1.Canvas.FillRect(Rect);
      if Form_Classificacao.IBQuery_FichaAvaliacao.FieldByName('NA').AsString = '1' then
         Check := DFCS_CHECKED
      else
        Check := 0;

      R:=Rect;
      InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_Rel_FichaAvaliacao.Processar;
var
   bm_Avl : TBookmark;
begin
   VI_OTIMO:= 0;
   VI_BOM:= 0;
   VI_REGULAR:= 0;
   VI_NS:= 0;
   VI_NA:= 0;
   VI_TotalReg:= 0;

   bm_Avl:= Form_Classificacao.IBQuery_FichaAvaliacao.GetBookMark;
   Form_Classificacao.IBQuery_FichaAvaliacao.First;
   While not Form_Classificacao.IBQuery_FichaAvaliacao.Eof do
   begin
      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString = '1' then
      begin
         VI_OTIMO:= VI_OTIMO+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('BOM').AsString = '1' then
      begin
         VI_BOM:= VI_BOM+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString = '1' then
      begin
         VI_REGULAR:= VI_REGULAR+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('NS').AsString = '1' then
      begin
         VI_NS:= VI_NS+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('NA').AsString = '1' then
         VI_NA:= VI_NA+1;

      Form_Classificacao.IBQuery_FichaAvaliacao.Next;
   end;
   Form_Classificacao.IBQuery_FichaAvaliacao.GotoBookmark(bm_Avl);
   Form_Classificacao.IBQuery_FichaAvaliacao.FreeBookMark(bm_Avl);

    Mostrar_Medias;
end;

//------------------------------------------------------------------------------
// Tratamento Tratar as Medias
//------------------------------------------------------------------------------

procedure TForm_Rel_FichaAvaliacao.Mostrar_Medias;
var
  VR_Media: Real;
begin
   Panel_Otimo.Caption:= IntToStr(VI_OTIMO);
   Panel_Bom.Caption:= IntToStr(VI_BOM);
   Panel_Reg.Caption:= IntToStr(VI_REGULAR);
   Panel_NS.Caption:= IntToStr(VI_NS);
   Panel_NA.Caption:= IntToStr(VI_NA);

   VR_Media:= (VI_OTIMO*4)+(VI_BOM*2)+(VI_REGULAR);
   if VI_TotalReg > 0 then
      VR_Media:= VR_Media/VI_TotalReg;

   Panel_Media.Caption:= FormatFloat('#0.00', VR_Media)
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao de Finalizacao do Cadastro da Ficha
//------------------------------------------------------------------------------

procedure TForm_Rel_FichaAvaliacao.SpeedButton_FinalizarClick(Sender: TObject);
begin
   Close;
end;

end.
