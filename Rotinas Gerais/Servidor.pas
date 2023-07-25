unit Servidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PsyRichEdit;

type
  TForm_Servidor = class(TForm)
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
  private    { Private declarations }
     arq: TextFile;
     VS_Linha: String;
  public
    { Public declarations }
  end;

var
  Form_Servidor: TForm_Servidor;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

procedure TForm_Servidor.FormCreate(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

end.
