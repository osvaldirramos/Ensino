program Pratica;

uses
  Forms,
  CadNotasPraticas in 'CadNotasPraticas.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Cadastro das Notas Praticas';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
