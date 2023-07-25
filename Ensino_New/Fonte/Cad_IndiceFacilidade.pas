unit Cad_IndiceFacilidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DB, IBCustomDataSet, Rotinas,
  IBTable, Buttons;

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
    SpeedButton_Grava: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton_GravaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Item_IndiceFacilidade: TForm_Item_IndiceFacilidade;

implementation

uses Module, Sel_ItemProva, Cad_ItemProva;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Item_IndiceFacilidade.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_Item_IndiceFacilidade, ' Entrada do Índice de Facilidade do Item');
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Item_IndiceFacilidade.SpeedButton_GravaClick( Sender: TObject);
var
   VS_NumItem, VS_Comando: String;
begin
   VS_NumItem:= Funcoes.GetNumItem;

   VS_Comando:= ' Delete From Indice_Item Where NumItem = '+VS_NumItem;
   Funcoes.ExecusaoQuery(VS_Comando);

   Table_IndiceItem.Open;
   Table_IndiceItem.Append;
   Table_IndiceItem.FieldByName('NUMITEM').AsString:= VS_NumItem;
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
   Funcoes.ExecutaTransacao;
   Close;
end;

procedure TForm_Item_IndiceFacilidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
