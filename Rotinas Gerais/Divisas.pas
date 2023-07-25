unit Divisas;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Rotinas,
  StdCtrls, Forms, DBCtrls, DB, Buttons, ExtCtrls, jpeg, ComCtrls, ToolWin;

type
  TForm_Divisas = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    SpeedButton_Patentes: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton_PatentesClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Divisas: TForm_Divisas;

implementation

{$R *.DFM}

procedure TForm_Divisas.SpeedButton_PatentesClick(Sender: TObject);
begin
   Close
end;

procedure TForm_Divisas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
