unit teste_FAC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery;

type
  TForm_Teste_FAC = class(TForm)
    IBQuery_Topico: TIBQuery;
    IBQuery_TopicoIDTOPICO: TIntegerField;
    DSQ_Topico: TDataSource;
    IBQuery_Rel_Topico: TIBQuery;
    IBQuery_Rel_TopicoIDCURSO: TSmallintField;
    IBQuery_Rel_TopicoIDTURMA: TIntegerField;
    IBQuery_Rel_TopicoIDTOPICO: TIntegerField;
    IBQuery_Rel_TopicoTOPICO: TIBStringField;
    IBQuery_Rel_TopicoNOBSERVADO: TIBStringField;
    IBQuery_Rel_TopicoABAIXO: TIBStringField;
    IBQuery_Rel_TopicoATINGIU: TIBStringField;
    IBQuery_Rel_TopicoACIMA: TIBStringField;
    IBQuery_Rel_TopicoMEDIA: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Teste_FAC: TForm_Teste_FAC;

implementation

uses Hab_FAC;

{$R *.dfm}

end.
