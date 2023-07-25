unit pts_DIA_SEMANA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ExtCtrls, DBCtrls, Grids, DBGrids, IBTable,
  StdCtrls, Mask, Rotinas;

type
  TForm_pts_dia_semana = class(TForm)
    DataSource1: TDataSource;
    IBTable1: TIBTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    IBTable1ID: TIntegerField;
    IBTable1DIA_SEMANA: TIBStringField;
    Button1: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_pts_dia_semana: TForm_pts_dia_semana;

implementation

uses Module;

{$R *.dfm}

procedure TForm_pts_dia_semana.Button1Click(Sender: TObject);
begin
   Table1.Append;
end;

procedure TForm_pts_dia_semana.Button2Click(Sender: TObject);
begin
   Table1.Post;
   Funcoes.ExecutaTransacao;
end;

end.
