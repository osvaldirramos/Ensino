unit Cad_IndiceFacilidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DB, IBCustomDataSet, Rotinas,
  IBTable, JvComponent, JvTransBtn, JvShape, JvGradient;

type
  TForm_Item_IndiceFacilidade = class(TForm)
    RadioGroup_IndiceFacilidade: TRadioGroup;
    Table_IndiceItem: TIBTable;
    Table_IndiceItemNUMITEM: TIntegerField;
    Table_IndiceItemDATAAVALIACAO: TDateTimeField;
    Table_IndiceItemINDICEFACILIDADE: TIBBCDField;
    Table_IndiceItemINDICEDIFERENCIACAO: TIBBCDField;
    Table_IndiceItemINDICEOBJETIVIDADE: TIBBCDField;
    Table_IndiceItemBRANCOS: TIntegerField;
    Table_IndiceItemTOTALALUNOS: TIntegerField;
    JvGradient3: TJvGradient;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Item_IndiceFacilidade: TForm_Item_IndiceFacilidade;

implementation

uses Module, Sel_ItemProva, Cad_ItemProva, DM_Item;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Item_IndiceFacilidade.JvTransparentButton_GravaClick(Sender: TObject);
begin
   Table_IndiceItem.Open;
   Table_IndiceItem.Append;
   Table_IndiceItem.FieldByName('NUMITEM').AsString:= Funcoes.GetNumItem;
   Table_IndiceItem.FieldByName('DATAAVALIACAO').AsString:= DateToStr(Date);
   if  RadioGroup_IndiceFacilidade.ItemIndex = 0 then
      Table_IndiceItem.FieldByName('INDICEFACILIDADE').AsFloat:= 0.90
   else
      if  RadioGroup_IndiceFacilidade.ItemIndex = 1 then
         Table_IndiceItem.FieldByName('INDICEFACILIDADE').AsFloat:= 0.70
      else
         Table_IndiceItem.FieldByName('INDICEFACILIDADE').AsFloat:= 0.50;

   Table_IndiceItem.FieldByName('INDICEDIFERENCIACAO').AsString:= '';
   Table_IndiceItem.FieldByName('INDICEOBJETIVIDADE').AsString:= '';
   Table_IndiceItem.FieldByName('BRANCOS').AsString:= '';
   Table_IndiceItem.FieldByName('TOTALALUNOS').AsString:= '';
   Table_IndiceItem.Post;
   DMItem.IBTransaction_ItemProva.CommitRetaining;
   Close;
end;

procedure TForm_Item_IndiceFacilidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
