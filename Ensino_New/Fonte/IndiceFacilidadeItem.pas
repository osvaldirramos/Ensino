unit IndiceFacilidadeItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, ComCtrls, ToolWin, ExtCtrls,
  TeeProcs, TeEngine, Chart, DbChart, Grids, DBGrids, Rotinas, StdCtrls,
  DBCtrls, Mask, JvRichEd, JvDBRichEd, Series, JvShape, JvGradient,
  JvComponent, JvTransBtn;

type
  TForm_IndiceFacilidadeItem = class(TForm)
    DBGrid_Indice: TDBGrid;
    IBQuery_IndiceItem: TIBQuery;
    IBQuery_IndiceItemNUMITEM: TIntegerField;
    IBQuery_IndiceItemDATAAVALIACAO: TDateTimeField;
    IBQuery_IndiceItemINDICEFACILIDADE: TIBBCDField;
    IBQuery_IndiceItemINDICEDIFERENCIACAO: TIBBCDField;
    IBQuery_IndiceItemINDICEOBJETIVIDADE: TIBBCDField;
    IBQuery_IndiceItemBRANCOS: TIntegerField;
    IBQuery_IndiceItemTOTALALUNOS: TIntegerField;
    DSQ_IndiceItem: TDataSource;
    JvDBRichEdit_Text: TJvDBRichEdit;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Memo1: TMemo;
    Panel1: TPanel;
    Label_Indice: TLabel;
    Label_Media: TLabel;
    JvGradient2: TJvGradient;
    JvShape1: TJvShape;
    Label1: TLabel;
    Label4: TLabel;
    Label_Objetivo: TLabel;
    Label_Serie: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit_CodMateria: TDBEdit;
    DBEdit3: TDBEdit;
    Panel_Botoes: TPanel;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid_IndiceDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_IndiceFacilidadeItem: TForm_IndiceFacilidadeItem;

implementation

uses Sel_ItemProva, Cad_IndiceFacilidade, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento do Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_IndiceFacilidadeItem.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   IBQuery_IndiceItem.Open;

   if IBQuery_IndiceItem.FieldByName('NumItem').AsString = '' then
   begin
      //-- Insere o Indice de Facilidade

      Application.CreateForm(TForm_Item_IndiceFacilidade, Form_Item_IndiceFacilidade);
      Funcoes.SetNumItem(Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString);
      Form_Item_IndiceFacilidade.ShowModal;
   end;

   VS_Comando:= 'Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString;
   Funcoes.OpenQuery(VS_Comando);

   Label_Media.Caption:= 'Média dos Índices ->'+FormatFloat('0.00', DM.IBQuery_Executa.FieldByName('Indice').AsFloat);

   if DM.IBQuery_Executa.FieldByName('Indice').AsFloat >= 0.80 then
      Label_Indice.Caption:= 'Item Classificado como: Fácil'
   else
      if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.60 then
         Label_Indice.Caption:= 'Item Classificado como: Médio'
      else
         Label_Indice.Caption:= 'Item Classificado como: Dificel';

   Funcoes.AtualizaQuery(IBQuery_IndiceItem);
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_IndiceFacilidadeItem.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   IBQuery_IndiceItem.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Fechar
//------------------------------------------------------------------------------

procedure TForm_IndiceFacilidadeItem.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Fechar
//------------------------------------------------------------------------------

procedure TForm_IndiceFacilidadeItem.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_IndiceFacilidadeItem.JvTransparentButton_ImprimirClick( Sender: TObject);
begin
  PrintScale := poProportional;

  {OU}

  //PrintScale := poNone;

  {OU}

  //PrintScale := poPrintToFit;

  Print;
end;

procedure TForm_IndiceFacilidadeItem.DBGrid_IndiceDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_Indice, Rect, DataCol, Column, State );
end;

end.
