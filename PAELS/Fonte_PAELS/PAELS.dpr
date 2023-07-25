program PAELS;

uses
  Forms,
  Module in 'Module.pas' {DM: TDataModule},
  FichaAvaliacao in 'FichaAvaliacao.pas' {Form_FichaAvaliacao},
  Sel_Avaliacao in 'Sel_Avaliacao.pas' {Form_Sel_Avaliacao},
  Sel_Fichas in 'Sel_Fichas.pas' {Form_Sel_Fichas},
  Rotinas in 'Rotinas.pas',
  Login in 'Login.pas' {Form_Login},
  Frame_Sel_Curso in 'Frame_Sel_Curso.pas' {Frame_SelCurso: TFrame},
  Rotinas_SUE in 'Rotinas_SUE.pas',
  Menu_Principal in 'Menu_Principal.pas' {Form_MenuPrincipal},
  Rel_RelatorioDeCodigoAcesso in 'Rel_RelatorioDeCodigoAcesso.pas' {Form_Rel_RelacaoComCodigo},
  Sel_Rel_Fichas in 'Sel_Rel_Fichas.pas' {Form_Sel_Rel_Fichas},
  Relatorio_FichaAvl in 'Relatorio_FichaAvl.pas' {Form_Relatorio_FichaAvl},
  Cadastro in 'Cadastro.pas' {Form_Cadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Login, Form_Login);
  Application.CreateForm(TForm_FichaAvaliacao, Form_FichaAvaliacao);
  Application.CreateForm(TForm_Sel_Fichas, Form_Sel_Fichas);
  Application.CreateForm(TForm_Sel_Avaliacao, Form_Sel_Avaliacao);
  Application.CreateForm(TForm_MenuPrincipal, Form_MenuPrincipal);
  Application.CreateForm(TForm_Sel_Rel_Fichas, Form_Sel_Rel_Fichas);
  Application.CreateForm(TForm_Relatorio_FichaAvl, Form_Relatorio_FichaAvl);
//  Application.CreateForm(TForm_Cadastro, Form_Cadastro);
  Application.Run;
end.
