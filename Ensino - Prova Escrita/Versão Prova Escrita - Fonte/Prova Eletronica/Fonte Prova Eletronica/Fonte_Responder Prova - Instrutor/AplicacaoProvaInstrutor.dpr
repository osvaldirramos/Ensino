program AplicacaoProvaInstrutor;

uses
  Forms,
  AplicacaoProva in 'AplicacaoProva.pas' {Form_AplicacaoProva},
  Module in 'Module.pas' {DM: TDataModule},
  Abertura in 'Abertura.pas' {Form_Abertura},
  Rotinas in 'Rotinas.pas',
  PedidoRevisaoItem in 'PedidoRevisaoItem.pas' {Form_PedidoRevisaoItem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Prova Eletrônica Instrutor';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.Run;
end.
