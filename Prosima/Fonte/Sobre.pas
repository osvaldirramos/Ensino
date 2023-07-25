unit Sobre;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Rotinas,
  Forms, Dialogs, StdCtrls, ExtCtrls, jpeg, JvShape, JvComponent, JvxCtrls,
  Buttons, JvGradient;

type
  TForm_Sobre = class(TForm)
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    Version: TLabel;
    Label_Versao: TLabel;
    Label2: TLabel;
    Label_Data: TLabel;
    Copyright: TLabel;
    SpeedButton_Retornar: TSpeedButton;
    JvxLabel1: TJvxLabel;
    JvxLabel2: TJvxLabel;
    JvShape1: TJvShape;
    JvShape3: TJvShape;
    JvShape2: TJvShape;
    Image_Brasao: TImage;
    Image_Brasao_Icea: TImage;
    Memo1: TMemo;
    procedure SpeedButton_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  Form_Sobre: TForm_Sobre;

implementation

uses Module;

{$R *.dfm}

procedure TForm_Sobre.SpeedButton_RetornarClick(Sender: TObject);
begin
   Close
end;

procedure TForm_Sobre.FormActivate(Sender: TObject);
begin
   Label_Versao.Caption:= Versao;
   Label_Data.Caption:= Ultima_Atualizacao;
end;

procedure TForm_Sobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
