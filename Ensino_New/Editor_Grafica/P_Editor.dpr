program P_Editor;

uses
  Forms,
  Editor_Texto in 'Editor_Texto.pas' {Form_Editor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Editor, Form_Editor);
  Application.Run;
end.
