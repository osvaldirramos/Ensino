
program Execucao;

uses
  Forms,
  Windows,
  Dialogs,
  SysUtils,
  Module in 'Module.pas' {DM: TDataModule},
  Rotinas in 'Rotinas.pas',
  Abertura in 'Abertura.pas' {Form_Abertura},
  Sobre in 'Sobre.pas' {Form_Sobre},
  ImageWin in 'ImageWin.pas' {Form_SelFoto},
  Sel_Turma in 'Sel_Turma.pas' {Form_SelTurma},
  Cad_Documentacao in 'Cad_Documentacao.pas' {Form_Cad_Documento},
  Cad_Diploma in 'Cad_Diploma.pas' {Form_Cad_Diploma},
  Rotinas_SUE in 'Rotinas_SUE.pas',
  Cad_Pessoa in 'Cad_Pessoa.pas' {Form_Cad_Pessoa},
  Sel_Curso in 'Sel_Curso.pas' {Form_Sel_Curso},
  AlterarSenha in 'AlterarSenha.pas' {Form_AlterarSenha},
  Cad_Turma in 'Cad_Turma.pas' {Form_Cad_Turma},
  Cad_Aluno in 'Cad_Aluno.pas' {Form_Cad_Aluno},
  Splash in 'Splash.pas' {SplashForm},
  Rel_CorrigirDadosERubricar in 'Rel_CorrigirDadosERubricar.pas' {Form_Rel_CorrigirDadosERubricar},
  Rel_ControleDeRefeicoes in 'Rel_ControleDeRefeicoes.pas' {Form_Rel_ControleDeRefeicoes},
  Sel_ResponsavelAssinaturaRelatorio in 'Sel_ResponsavelAssinaturaRelatorio.pas' {Form_Sel_ResponsavelAssinaturaRelatorio},
  Rel_FichaDeDesimpedimentoDeAlunos_PorTurma in 'Rel_FichaDeDesimpedimentoDeAlunos_PorTurma.pas' {Form_Rel_FichaDeDesimpedimentoDeAlunosPorTurma},
  Rel_FichaDeDesimpedimentoDeInstrutoresPorTurma in 'Rel_FichaDeDesimpedimentoDeInstrutoresPorTurma.pas' {Form_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma},
  Cad_Curso in 'Cad_Curso.pas' {Form_Cad_Curso},
  Cad_Usuario in 'Cad_Usuario.pas' {Form_Cad_Usuario},
  GerarRegCertificados in 'GerarRegCertificados.pas' {Form_GerarRegCertificados},
  Rel_FichaDeRegistrosdeCertificados_Icea in 'Rel_FichaDeRegistrosdeCertificados_Icea.pas' {Form_Rel_Recibo_do_Codigo_do_Aluno},
  ImprimirDiploma in 'ImprimirDiploma.pas' {Form_MontaDiploma},
  MontaCertidaoCurricular in 'MontaCertidaoCurricular.pas' {Form_MontaCertidaoCurricular},
  Cad_Disciplina in 'Cad_Disciplina.pas' {Form_Cad_Disciplina},
  Sel_Disciplina in 'Sel_Disciplina.pas' {Form_Sel_Disciplina},
  Cad_GQA in 'Cad_GQA.pas' {Form_Cad_QGA},
  Sel_QGA in 'Sel_QGA.pas' {Form_Sel_QGA},
  Rel_RetiradaDeFaltas in 'Rel_RetiradaDeFaltas.pas' {Form_Rel_RetiradaDeFaltas},
  Rel_ApresentacaoDeAlunosParaFinaisDeSemanaEFeriados in 'Rel_ApresentacaoDeAlunosParaFinaisDeSemanaEFeriados.pas' {Form_Rel_FichaDeViagem},
  ConsultaAlunoInstrutor in 'ConsultaAlunoInstrutor.pas' {Form_ConsultaAluno},
  Rel_RelacaoEnderecos in 'Rel_RelacaoEnderecos.pas' {Form_Rel_RelacaoEnderecos},
  Con_InstrutoresCurso in 'Con_InstrutoresCurso.pas' {Form_Con_InstrutoresCurso},
  CadDisciplinaInstrutor in 'CadDisciplinaInstrutor.pas' {Form_Cad_DisciplinaInstrutor},
  Cad_ObsInstrutorMateria in 'Cad_ObsInstrutorMateria.pas' {Form_Cad_ObsInstrutorMateria},
  Cad_InstrutorTurma in 'Cad_InstrutorTurma.pas' {Form_Cad_InstrutorTurma},
  EstatisticaDeInstruoresPorCurso in 'EstatisticaDeInstruoresPorCurso.pas' {Form_EstInstruoresPorCurso},
  Rotinas_Instrutor in 'Rotinas_Instrutor.pas',
  ApresentacaoInstrutor in 'ApresentacaoInstrutor.pas' {Form_ApresentacaoInstrutor},
  Sel_ItemProva in 'Sel_ItemProva.pas' {Form_Sel_ItemProva},
  Tratar_Turma in 'Tratar_Turma.pas',
  Preview_de_Relatorios in 'Preview_de_Relatorios.pas' {Form_PreviewRel},
  Cad_ItemProva in 'Cad_ItemProva.pas' {Form_Cad_ItemProva},
  CopiaItemParaOutroCurso in 'CopiaItemParaOutroCurso.pas' {Form_CopiaItemParaOutroCurso},
  frmSimbolo in 'frmSimbolo.pas' {Form_Simbolo},
  Fer_AjustarItem in 'Fer_AjustarItem.pas' {Form_Fer_AjustarItem},
  Se_Prova in 'Se_Prova.pas' {Form_Cad_Prova},
  Rel_RelatorioDoCadastroDeAlunosComCodigo in 'Rel_RelatorioDoCadastroDeAlunosComCodigo.pas' {Form_Rel_RelacaoComCodigo},
  MontaProva in 'MontaProva.pas' {Form_MontaProva},
  Rel_AtaDePresenca in 'Rel_AtaDePresenca.pas' {Form_Rel_APA},
  CorrecaoProva in 'CorrecaoProva.pas' {Form_Cad_CorrecaoProva},
  Tratar_Leitora_Otica in 'Tratar_Leitora_Otica.pas' {Form_LeitoraOtica},
  EntradaDasRespostaDoAlunoManualmente in 'EntradaDasRespostaDoAlunoManualmente.pas' {Form_EntradaDasRespostaDoAlunoManualmente},
  CorrecaoDoItemDaProva in 'CorrecaoDoItemDaProva.pas' {Form_CorrecaoDoItemDaProvaSistema},
  CorrecaoDoItemDaProvaManual in 'CorrecaoDoItemDaProvaManual.pas' {Form_CorrecaoDoItemDaProvaManual},
  Tratar_EstQuestao in 'Tratar_EstQuestao.pas' {Form_EstQuestao},
  ControleGeralDeGraus_New in 'ControleGeralDeGraus_New.pas' {Form_MontaControleGeraoGraus},
  CorrecaoDaProva01 in 'CorrecaoDaProva01.pas' {Form_CorrecaoDaProva01},
  EntradaDaNotaDoAlunoManualmente in 'EntradaDaNotaDoAlunoManualmente.pas' {Form_EntradaDaNotaDoAlunoManualmente},
  EntradaDaMediaDoAlunoManualmente in 'EntradaDaMediaDoAlunoManualmente.pas' {Form_EntradaDaMediaDoAlunoManualmente},
  Cad_PTS in 'Cad_PTS.pas' {Form_Cad_PTS},
  Rel_ProgramaDeTrabalhoSemanal in 'Rel_ProgramaDeTrabalhoSemanal.pas' {Form_Rel_PTS},
  Cad_Fer_PTSBase in 'Cad_Fer_PTSBase.pas' {Form_Cad_PTSBase},
  Habilita_FichaAvaliacao in 'Habilita_FichaAvaliacao.pas' {Form_Hab_FichaAvaliacao},
  Con_InstrutoresMateria in 'Con_InstrutoresMateria.pas' {Form_Con_InstrutoresMateria},
  Estatistica_Curso in 'Estatistica_Curso.pas' {Form_Estatistica_Curso},
  FA_RelacaoNaoRespondidas_old in 'FA_RelacaoNaoRespondidas_old.pas' {Form_FA_RelacaoNaoRespondidas},
  FA_Cad_AvaliadoresDeCurso in 'FA_Cad_AvaliadoresDeCurso.pas' {Form_FA_CadAvaliadoresDeCurso},
  FA_Cad_FichasAvaliacaoCurso in 'FA_Cad_FichasAvaliacaoCurso.pas' {Form_FA_Cad_FichasAvaliacao},
  FC_Cad_FichaCoordenador in 'FC_Cad_FichaCoordenador.pas' {Form_FC_Cad_FichaCoordenador},
  Mostra_GrauFinal in 'Mostra_GrauFinal.pas' {Form_Mostra_GrauFinal},
  Configuracao in 'Configuracao.pas' {Form_Configuracao},
  DM_Item in 'DM_Item.pas' {DMItem: TDataModule},
  Editor_Texto in 'Editor_Texto.pas' {Form_Editor},
  ConsultaTurmasExecutadas in 'ConsultaTurmasExecutadas.pas' {Form_ConsultaTurmasExecutadas},
  MontaGabarito in 'MontaGabarito.pas' {Form_MontaGabarito},
  Cad_PostoGraduacao in 'Cad_PostoGraduacao.pas' {Form_Tab_PostoGraduacao},
  Cad_Cargos in 'Cad_Cargos.pas' {Form_Tab_Cargos},
  Cad_Unidades in 'Cad_Unidades.pas' {Form_Tab_Unidades},
  Cad_QuadroEspcialidade in 'Cad_QuadroEspcialidade.pas' {Form_Tab_QuadroEspecialidade},
  Cad_Pais in 'Cad_Pais.pas' {Form_Tab_Paises},
  ConsultaCursosAndamento in 'ConsultaCursosAndamento.pas' {Form_ConsultaCursosAndamento},
  ConsultaValoresCurso in 'ConsultaValoresCurso.pas' {Form_AlunosPorInstituicao},
  Rel_AlunosPorUnidades in 'Rel_AlunosPorUnidades.pas' {Form_Rel_AlunosPorUnidades: TQuickRep},
  Cad_Desligamento in 'Cad_Desligamento.pas' {Form_Tab_Desligamento},
  NotasDigitas in 'NotasDigitas.pas' {Form_NotasDigitadas},
  Turma_Zero in 'Turma_Zero.pas',
  CorpoDocente in 'CorpoDocente.pas' {Form_CorpoDocente},
  Rel_ControleDeRefeicoes_Instrutor in 'Rel_ControleDeRefeicoes_Instrutor.pas' {Form_Rel_ControleDeRefeicoes_Instrutor},
  RelacaoTurma in 'RelacaoTurma.pas' {Form_RelacaoTurma},
  RelacaoInstrutorTurma in 'RelacaoInstrutorTurma.pas' {Form_RelacaoInstrutorTurma},
  Cad_IndiceFacilidade in 'Cad_IndiceFacilidade.pas' {Form_Item_IndiceFacilidade},
  CopiaTurma in 'CopiaTurma.pas' {Form_CopiaTurma},
  EstatisticaDeItensDeDisciplinasporObjetivo in 'EstatisticaDeItensDeDisciplinasporObjetivo.pas' {Form_EstatisticaDeItensDeDisciplinasporObjetivo},
  VerificaSenha in '..\..\..\Rotinas Gerais\VerificaSenha.pas',
  Utilizacao in 'Utilizacao.pas' {Form_ControleAcesso},
  Controle_Alteracoes_PTS in 'Controle_Alteracoes_PTS.pas' {Form_Controle_Alteracoes_PTS},
  EstatisticaFichasAvaliacao in 'EstatisticaFichasAvaliacao.pas' {Form_estatisticaFichasAvaliacao},
  Divisas in '..\..\..\..\Rotinas Gerais\Divisas.pas' {Form_Divisas},
  Module_Historico in 'Module_Historico.pas' {DM_Historico_APAC: TDataModule},
  ColetaItens in 'ColetaItens.pas' {Form_ColetaItens},
  CriticaEspontanea in 'CriticaEspontanea.pas' {Form_CriticaEspontanea},
  Rel_PTSBase in 'Rel_PTSBase.pas' {Form_Rel_PTSBase},
  Rel_AtaDePresenca_Cindacta2 in 'Rel_AtaDePresenca_Cindacta2.pas' {Form_Rel_AtaDePresenca_Cindacta2},
  Rel_ControleDePresencaDeAlunos in 'Rel_ControleDePresencaDeAlunos.pas' {Form_Rel_ControleDePresencaDeAlunos},
  Relatorio_Infraero in 'Relatorio_Infraero.pas' {Form_Relatorio_INFRAERO},
  Rotinas_TrataData in 'Rotinas_TrataData.pas',
  CargaAlunos_Cenipa in 'CargaAlunos_Cenipa.pas' {Form_CargaAlunos},
  Conflito_Item in 'Conflito_Item.pas' {Form_ConflitoItem},
  MontaProvaEletronica in 'MontaProvaEletronica.pas' {Form_MontaProvaEletronica},
  PedidoRevisaoItem in 'PedidoRevisaoItem.pas' {Form_PedidoRevisaoItem},
  Rel_PedidoRevisaoTeste in 'Rel_PedidoRevisaoTeste.pas' {Form_Rel_PedidoRevisaoTeste},
  Rel_DIP in 'Rel_DIP.pas' {Form_Rel_DIP},
  Rel_GPA in 'Rel_GPA.pas' {Form_Rel_GPA},
  Rel_MFC in 'Rel_MFC.pas' {Form_Rel_MFC},
  Rel_GDA in 'Rel_GDA.pas' {Form_Rel_GDA},
  Rel_GDV in 'Rel_GDV.pas' {Form_Rel_GDV},
  Rel_LGP in 'Rel_LGP.pas' {Form_Rel_LGP},
  Rel_CGG in 'Rel_CGG.pas' {Form_Rel_CGG},
  Rel_CGP in 'Rel_CGP.pas' {Form_Rel_CGP},
  Rel_GPE in 'Rel_GPE.pas' {Form_Rel_GPE},
  Rel_GPA_CINDACTAII in 'Rel_GPA_CINDACTAII.pas' {Form_Rel_GPA_CINDACTAII},
  EstatisticaItem in 'EstatisticaItem.pas' {Form_EstatisticaItem},
  Rel_EID in 'Rel_EID.pas' {Form_Rel_EID},
  IndiceFacilidadeItem in 'IndiceFacilidadeItem.pas' {Form_IndiceFacilidadeItem},
  Relacao_NotasProvasAbaixoMedia in 'Relacao_NotasProvasAbaixoMedia.pas' {Form_RelacaoAlunosNotaBaixo},
  MontarProvaAutomatica in 'MontarProvaAutomatica.pas' {Form_MontarProvaAutomatica},
  Rel_Diploma in 'Rel_Diploma.pas' {Form_Rel_Diploma},
  ConsultaHistorico in 'ConsultaHistorico.pas' {Form_Historico},
  Cad_SalaAula in 'Cad_SalaAula.pas' {Form_CadSalaAula},
  MenuPrincipal in 'MenuPrincipal.pas' {Form_MenuPrincipal},
  EstatisticaAplicacaoProva in 'EstatisticaAplicacaoProva.pas' {Form_EstatisticaAplicacaoProva},
  AlunoComProvasDeRecuperacao in 'AlunoComProvasDeRecuperacao.pas' {Form_AlunoComProvasDeRecuperacao},
  Rel_PTS_EAD in 'Rel_PTS_EAD.pas' {Form_Rel_PTS_EAD},
  Rel_Aprovados in 'Rel_Aprovados.pas' {Form_Rel_Aprovados},
  Estatistica_Diarias in 'Estatistica_Diarias.pas' {Form_Estatistica_Diarias},
  Cad_Instrutores in 'Cad_Instrutores.pas' {Form_Cad_Instrutor},
  TrataDocumento in 'TrataDocumento.pas' {Form_TrataDocumento},
  Frame_Sel_Curso in 'Frame_Sel_Curso.pas' {Frame_SelCurso: TFrame},
  Rotinas_Validar in 'Rotinas_Validar.pas',
  Rel_Recibo_do_Codigo_do_Aluno_RCA in 'Rel_Recibo_do_Codigo_do_Aluno_RCA.pas' {Form_Rel_RCA},
  Cad_Usuario_FP in 'Cad_Usuario_FP.pas' {Form_Cad_Usuario_FP},
  FA_RelatorioFichaAvaliacao in 'FA_RelatorioFichaAvaliacao.pas' {Form_FA_RelatorioFichaAvaliacao},
  Providencia in 'Providencia.pas' {Form_Cad_Providencia},
  Cad_Secoes in 'Cad_Secoes.pas' {Form_Cad_Secoes},
  DM_Manual in 'DM_Manual.pas' {DMManual: TDataModule},
  Manual in 'Manual.pas' {Form_ManualUsuario},
  Carga_PAELS in 'Carga_PAELS.pas' {Form_Carga_PAELS},
  FichaAvalicaoCurso in 'FichaAvalicaoCurso.pas',
  ControleGeralDeGraus_New_PesoMP in 'ControleGeralDeGraus_New_PesoMP.pas' {Form_MontaControleGeraoGraus_PesoMP},
  Carga_Historico in 'Carga_Historico.pas' {Form_Carga_Historico},
  Module_Historico_SGEW in 'Module_Historico_SGEW.pas' {DM_Historico_SGEW: TDataModule},
  Rotinas_Tratar_Providencia in 'Rotinas_Tratar_Providencia.pas';

{$R *.res}

var
   Handle: THandle;
begin
    //--------------------------------------
   // Verifica se a aplicacao ja esta aberto

     Handle := FindWindow('Form_Abertura', nil);
     if Handle <> 0 then
     begin
        MessageDlg('O Sistema do Ensino j� est� aberto...',mtError, [mbOk],0);
        if not IsWindowVisible(Handle) then
           ShowWindow(Handle, SW_RESTORE);
        SetForegroundWindow(Handle);
        Exit;
     end;

      //------------------
     // Inicia a aplicacao

     Application.Initialize;
     With TSplashForm.Create(nil) do
     try
      Application.Title := 'ENSINO - Sistema de Gerenciamento de Ensino';
       ProgressBar1.Max:=10;
       show;
       update;
       ProgressBar1.Position:= 0;

      Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.CreateForm(TDM_Historico_SGEW, DM_Historico_SGEW);
  ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TDMItem, DMItem);
       ProgressBar1.StepBy(1);
       Update;


      Application.CreateForm(TDM_Historico_APAC, DM_Historico_APAC);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TDMManual, DMManual);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Abertura, Form_Abertura);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Cad_PTS, Form_Cad_PTS);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_ManualUsuario, Form_ManualUsuario);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Hab_FichaAvaliacao, Form_Hab_FichaAvaliacao);
       ProgressBar1.StepBy(1);
       Update;

       Application.CreateForm(TForm_Abertura, Form_Abertura);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_ConflitoItem, Form_ConflitoItem);
       ProgressBar1.StepBy(1);
       Update;

     Application.CreateForm(TForm_MenuPrincipal, Form_MenuPrincipal);
       Label_MSG.Caption:= 'Aguarde Abrindo o Banco de Dados';
       ProgressBar1.StepBy(1);
       Update;

        //----------------------
       //--- Cadastro
      //-----------------------

      Application.CreateForm(TForm_Cad_Pessoa, Form_Cad_Pessoa);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_SelTurma, Form_SelTurma);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Cad_CorrecaoProva, Form_Cad_CorrecaoProva);
       ProgressBar1.StepBy(1);
       Update;

        //----------------------
       //--- Relatorio
      //-----------------------

      Application.CreateForm(TForm_Sel_ResponsavelAssinaturaRelatorio, Form_Sel_ResponsavelAssinaturaRelatorio);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Rel_PTS, Form_Rel_PTS);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Rel_AlunosPorUnidades, Form_Rel_AlunosPorUnidades);
       ProgressBar1.StepBy(1);
       Update;

        //----------------------
       //--- Ferramentas
      //-----------------------

      Application.CreateForm(TForm_Sel_ItemProva, Form_Sel_ItemProva);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Cad_ItemProva, Form_Cad_ItemProva);
       ProgressBar1.StepBy(1);
       Update;

      Application.CreateForm(TForm_Editor, Form_Editor);
       ProgressBar1.StepBy(1);
       Update;

     finally
        free;
     end;
     Application.Run;
end.
