unit Item_Historico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, IBQuery, StdCtrls, Grids, DBGrids,
  ComCtrls, ToolWin, JvDBCtrl, Rotinas, ExtCtrls;

type
  TForm_Item_Historico = class(TForm)
    DST_ItemHistorico: TDataSource;
    Query_Item_Historico: TIBQuery;
    JvDBGrid1: TJvDBGrid;
    ToolBar1: TToolBar;
    ToolButton_Imprimir: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_Fechar: TToolButton;
    Windows: TToolButton;
    Splint: TSplitter;
    Splitter1: TSplitter;
    Query_Item_HistoricoID: TIntegerField;
    Query_Item_HistoricoDATA: TDateTimeField;
    Query_Item_HistoricoATIVIDADE: TIBStringField;
    Query_Item_HistoricoUSUARIO: TIBStringField;
    Memo1: TMemo;
    ToolButton2: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_FecharClick(Sender: TObject);
    procedure WindowsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Item_Historico: TForm_Item_Historico;

implementation

uses Sel_ItemProva;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Item_Historico.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_Item_Historico, ' Entrada do Índice de Facilidade do Item');
   Query_Item_Historico.Close;
   Query_Item_Historico.Open;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Item_Historico.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   Query_Item_Historico.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para imprimir a Form
//------------------------------------------------------------------------------

procedure TForm_Item_Historico.ToolButton_ImprimirClick(Sender: TObject);
begin
  PrintScale := poProportional;

  {OU}

  //PrintScale := poNone;

  {OU}

  //PrintScale := poPrintToFit;

  Print;
end;

procedure TForm_Item_Historico.ToolButton_FecharClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_Item_Historico.WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Item_Historico.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If odd(Query_Item_Historico.RecNo) then
   begin
      JvDBGrid1.Canvas.Font.Color:= clBlack;
      JvDBGrid1.Canvas.Brush.Color:= clInfoBk;
   end
   else
   begin
      JvDBGrid1.Canvas.Font.Color:= clBlack;
      JvDBGrid1.Canvas.Brush.Color:= clWhite;
   end;
   JvDBGrid1.Canvas.FillRect(Rect);
   JvDBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end; 

end.
