unit TrataDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBTable, IBQuery, Rotinas,
  StdCtrls, JvRichEd, JvDBRichEd;

type
  TForm_TrataDocumento = class(TForm)
    Documento: TJvDBRichEdit;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documento: TDataSource;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_TrataDocumento: TForm_TrataDocumento;

implementation

uses Editor_Texto, Se_Prova, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_TrataDocumento.FormActivate(Sender: TObject);
begin
   Form_TrataDocumento.IBQuery_Documento.Open;

   Form_TrataDocumento.Documento.SelectAll;
   Form_TrataDocumento.Documento.CopyToClipboard ;
   close;
end;

end.
