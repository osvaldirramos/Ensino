unit Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, jpeg, JvShape, JvComponent, JvxCtrls,
  JvGradient, ComCtrls;

type
  TSplashForm = class(TForm)
    JvGradient1: TJvGradient;
    JvShape2: TJvShape;
    JvxLabel2: TJvxLabel;
    JvxLabel1: TJvxLabel;
    Image_Brasao_ICEA: TImage;
    ProgressBar1: TProgressBar;
    Label_MSG: TStaticText;
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

end.
