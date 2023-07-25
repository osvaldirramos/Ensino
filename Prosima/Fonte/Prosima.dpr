program Prosima;

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Db,
  DBTables,
  StdCtrls,
  ComCtrls,
  Grids,
  DBGrids,
  Buttons,
  Mask,
  ExtCtrls,
  MenuPrincipal in 'MenuPrincipal.pas' {Form_MenuPrincipal},
  Module in 'Module.pas' {DM: TDataModule},
  Sobre in 'Sobre.pas' {Form_Sobre},
  Rotinas in 'Rotinas.pas',
  MontaFicha in 'MontaFicha.pas' {Form_CriarModelo_Ficha},
  Rel_FichaAvaliacao in 'Rel_FichaAvaliacao.pas' {Form_Rel_FichaAvaliacao},
  Classificacao in 'Classificacao.pas' {Form_Classificacao},
  Sel_MontaProsima in 'Sel_MontaProsima.pas' {Form_Sel_Avaliacao},
  FichaAvaliacao in 'FichaAvaliacao.pas' {Form_FichaAvaliacao},
  Login in 'Login.pas' {Form_Login},
  Rel_RelatorioDoCadastroDeAlunosComCodigo in 'Rel_RelatorioDoCadastroDeAlunosComCodigo.pas' {Form_Rel_RelacaoComCodigo},
  Relatorio_Geral in 'Relatorio_Geral.pas' {Form_RelatorioGeral},
  GrauFinalCurso in 'GrauFinalCurso.pas' {Form_GrauFinalCurso},
  ProcessarClassificacao in 'ProcessarClassificacao.pas' {Form_ProcessarClassificacao},
  ProcessarClassificacaoExcel in 'ProcessarClassificacaoExcel.pas' {Form_ProcessarClassificacaoExcel},
  Sel_Rel_FichaAvaliacao in 'Sel_Rel_FichaAvaliacao.pas' {Form_Sel_Rel_FichaAvaliacao},
  Relatorio_FichaAvl in 'Relatorio_FichaAvl.pas' {Form_Relatorio_FichaAvl},
  Sel_Relatorios in 'Sel_Relatorios.pas' {Form_Relatorio},
  CalcularMedia in 'CalcularMedia.pas' {Form_CalcularMedia},
  Sel_Relatorios_Instrutores in 'Sel_Relatorios_Instrutores.pas' {Form_Relatorio_Instrutores};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Prosima';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Login, Form_Login);
  Application.CreateForm(TForm_Sel_Avaliacao, Form_Sel_Avaliacao);
  Application.CreateForm(TForm_MenuPrincipal, Form_MenuPrincipal);
  Application.CreateForm(TForm_Rel_FichaAvaliacao, Form_Rel_FichaAvaliacao);
  Application.CreateForm(TForm_Sobre, Form_Sobre);
  Application.CreateForm(TForm_Classificacao, Form_Classificacao);
  Application.CreateForm(TForm_RelatorioGeral, Form_RelatorioGeral);
  Application.CreateForm(TForm_GrauFinalCurso, Form_GrauFinalCurso);
  Application.CreateForm(TForm_ProcessarClassificacao, Form_ProcessarClassificacao);
  Application.CreateForm(TForm_ProcessarClassificacaoExcel, Form_ProcessarClassificacaoExcel);
  Application.CreateForm(TForm_Sel_Rel_FichaAvaliacao, Form_Sel_Rel_FichaAvaliacao);
  Application.CreateForm(TForm_Relatorio_FichaAvl, Form_Relatorio_FichaAvl);
  Application.CreateForm(TForm_Relatorio, Form_Relatorio);
  Application.CreateForm(TForm_CalcularMedia, Form_CalcularMedia);
  Application.CreateForm(TForm_Relatorio_Instrutores, Form_Relatorio_Instrutores);
  //  Application.CreateForm(TForm_FichaAvaliacao, Form_FichaAvaliacao);
//  Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
  Application.Run;
end.
