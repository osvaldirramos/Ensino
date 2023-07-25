unit Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Rotinas,
  Forms, Dialogs, StdCtrls, ExtCtrls, jpeg, JvShape, JvComponent, JvxCtrls,
  JvGradient, ComCtrls;

type
  TSplashForm = class(TForm)
    JvGradient_Tela: TJvGradient;
    JvxLabel2: TJvxLabel;
    JvxLabel1: TJvxLabel;
    Image_Brasao_ICEA: TImage;
    ProgressBar1: TProgressBar;
    Label_MSG: TStaticText;
    procedure FormActivate(Sender: TObject);
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

procedure TSplashForm.FormActivate(Sender: TObject);
begin
   JvGradient_Tela.StartColor:= Cor_Tela;
end;

end.
