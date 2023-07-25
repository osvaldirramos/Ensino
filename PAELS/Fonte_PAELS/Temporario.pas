unit Temporario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, Grids, DBGrids, StdCtrls, Rotinas;

type
  TForm_Ajuste = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    IBTable1: TIBTable;
    DataSource1: TDataSource;
    IBTable2: TIBTable;
    DataSource2: TDataSource;
    IBTable2IDCURSO: TSmallintField;
    IBTable2IDTURMA: TIntegerField;
    IBTable2ID_FICHA: TIntegerField;
    IBTable2ID_ATCO: TIBStringField;
    IBTable2ID_INSTRUTOR: TIBStringField;
    IBTable2ID_EXERCICIO: TIntegerField;
    IBTable2ID_ITEM: TIBStringField;
    IBTable2ID_AVL: TIntegerField;
    IBTable2OTIMO: TIBStringField;
    IBTable2BOM: TIBStringField;
    IBTable2REGULAR: TIBStringField;
    IBTable2NS: TIBStringField;
    IBTable2NA: TIBStringField;
    IBTable2AREA_AVALIACAO: TIBStringField;
    IBTable2DESCRICAO: TIBStringField;
    IBTable2SETOR: TIBStringField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Ajuste: TForm_Ajuste;

implementation

uses Module;

{$R *.dfm}

procedure TForm_Ajuste.Button1Click(Sender: TObject);
begin
   IBTable1.Open;
   IBTable2.Open;
   IBTable1.First;
   While not IBTable1.Eof do
   begin
      IBTable2.First;
      While not IBTable2.Eof do
      begin
         IBTable2.Edit;
         IBTable2.FieldByName('Setor').AsString:= IBTable1.FieldByName('Setor').AsString;
         IBTable2.Post;
         Funcoes.ExecutaTransacao_Prosima;
         IBTable2.Next;
      end;
      IBTable1.Next;
   end;
end;

end.
