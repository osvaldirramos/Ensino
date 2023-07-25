unit Sobre;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Rotinas,
  Forms, Dialogs, StdCtrls, ExtCtrls, jpeg, JvShape, JvComponent, JvxCtrls,
  Buttons, JvGradient, JvTransBtn;

type
  TForm_Sobre = class(TForm)
    JvGradient1: TJvGradient;
    Version: TLabel;
    Label_Versao: TLabel;
    Label2: TLabel;
    Label_Data: TLabel;
    Copyright: TLabel;
    JvxLabel1: TJvxLabel;
    JvxLabel2: TJvxLabel;
    JvShape1: TJvShape;
    JvShape3: TJvShape;
    JvShape2: TJvShape;
    Image_Brasao: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Image_Brasao_Icea: TImage;
    JvShape4: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
  end;

var
  Form_Sobre: TForm_Sobre;

implementation

uses Module;

{$R *.dfm}


procedure TForm_Sobre.FormActivate(Sender: TObject);
begin
   if FileExists('Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('Brasao_Ensino.jpg');

   Label_Versao.Caption:= Versao;
   Label_Data.Caption:= Ultima_Atualizacao;
end;

procedure TForm_Sobre.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close
end;

procedure TForm_Sobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;


end.
