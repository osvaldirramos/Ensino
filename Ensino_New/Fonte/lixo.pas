unit lixo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery;

type
  TForm_Lixo = class(TForm)
    IBQuery_Providencia: TIBQuery;
    IBQuery_ProvidenciaIDCURSO: TSmallintField;
    IBQuery_ProvidenciaIDTURMA: TIntegerField;
    IBQuery_ProvidenciaIDSECAO: TIntegerField;
    IBQuery_ProvidenciaSIGLA: TIBStringField;
    IBQuery_ProvidenciaDESCRICAO: TIBStringField;
    IBQuery_ProvidenciaGRUPO: TIntegerField;
    DSQ_Providencia: TDataSource;
    IBQuery_TratarProvidencias: TIBQuery;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Lixo: TForm_Lixo;

implementation

{$R *.dfm}

procedure TForm_Lixo.FormActivate(Sender: TObject);
begin
  IBQuery_Providencia.Open;
  IBQuery_TratarProvidencias.Open
end;

end.
