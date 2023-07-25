unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBTable;

type
  TForm1 = class(TForm)
    IBTable_Gabarito: TIBTable;
    DST_Gabarito: TDataSource;
    DBGrid1: TDBGrid;
    IBTable1: TIBTable;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Module;

{$R *.dfm}

end.
