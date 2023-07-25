program AplicacaoProvaAluno;

uses
  Forms,
  Abertura in 'Abertura.pas' {Form_Abertura},
  Module in 'Module.pas' {DM: TDataModule},
  Prova in 'Prova.pas' {Form_Prova},
  Rotinas in 'Rotinas.pas',
  PedidoRevisaoItem in 'PedidoRevisaoItem.pas' {Form_PedidoRevisaoItem},
  ConsultaRespostasProva in 'ConsultaRespostasProva.pas' {Form_ConsultaRespostasProva};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Aplicação de Prova Aluno';

  Funcoes.SetLog('', '', '');
//  Funcoes.Verifica_Disponibilidade_Rede;

  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.CreateForm(TForm_ConsultaRespostasProva, Form_ConsultaRespostasProva);
  Application.Run;
end.
