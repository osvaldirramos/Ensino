<?php
  //alunoController.php
  include("../Model/AlunoCiaar.class.php");
  include("../External/Funcoes/Funcoes.php");
  session_start();
  $aluno = new AlunoCiaar();
  $f=new Funcao();
  $especialidades=$aluno->listarEspecialidade();
  $ctas=$aluno->listarCursoTurmaAno();
  if($_POST[enviar])
  {
  
     $cursoTurma=explode("-",$_POST[curso]);
     $curso=$cursoTurma[0];
     $turma=$cursoTurma[1];
     $saranParte=explode("-",$_POST[saran]);
     $cepParte=explode("-",$_POST[cep]);
     $cpfParte=explode(".",$_POST[cpf]);
     $_POST[saran]=$saranParte[0].$saranParte[1];
     $_POST[cep]=$cepParte[0].$cepParte[1];
     $cpf = $cpfParte[0].$cpfParte[1].$cpfParte[2].$cpfParte[3];
     $_POST[dataNascimento]=$f->formatarData($_POST[dataNascimento],'/');

     if(empty($_POST[dataPraca]))$_POST[dataPraca]='11.11.1111'; else $_POST[dataPraca]=$f->formatarData($_POST[dataPraca],'/');
     if(empty($_POST[dataAlistamento]))$_POST[dataAlistamento]='11.11.1111'; else $_POST[dataAlistamento]=$f->formatarData($_POST[dataAlistamento],'/');
     if(empty($_POST[dataIncorporacao1]))$_POST[dataIncorporacao1]='11.11.1111';else $_POST[dataIncorporacao1]=$f->formatarData($_POST[dataIncorporacao1],'/');
     if(empty($_POST[dataDesligamento1]))$_POST[dataDesligamento1]='11.11.1111';else $_POST[dataDesligamento1]=$f->formatarData($_POST[dataDesligamento1],'/');
     if(empty($_POST[dataIncorporacao2]))$_POST[dataIncorporacao2]='11.11.1111';else $_POST[dataIncorporacao2]=$f->formatarData($_POST[dataIncorporacao2],'/');
     if(empty($_POST[dataDesligamento2]))$_POST[dataDesligamento2]='11.11.1111';else $_POST[dataDesligamento2]=$f->formatarData($_POST[dataDesligamento2],'/');
     if(empty($_POST[dataIncorporacao3]))$_POST[dataIncorporacao3]='11.11.1111';else $_POST[dataIncorporacao3]=$f->formatarData($_POST[dataIncorporacao3],'/');
     if(empty($_POST[dataDesligamento3]))$_POST[dataDesligamento3]='11.11.1111';else $_POST[dataDesligamento3]=$f->formatarData($_POST[dataDesligamento3],'/');

     $cadastrado=$aluno->cadastrarPessoa($curso,
                                         $turma,
                                         '1',
                                         $_POST[identidade],
                                         $_POST[nome],
                                         $_POST[nomeGuerra],
                                         $_POST[dataNascimento],
                                         $cpf,
                                         $_POST[sexo],
                                         $_POST[estadoCivil],
                                         $_POST[cidadeNat],
                                         $_POST[ufNat],
                                         $_POST[especialidade],
                                         $_POST[pai],
                                         $_POST[mae],
                                         $_POST[email],
                                         $_POST[saran],
                                         $_POST[telResidencial],
                                         $_POST[telContato],
                                         $_POST[celular],
                                         $_POST[endereco],
                                         $_POST[bairro],
                                         $_POST[cidade],
                                         $_POST[uf],
                                         $_POST[cep],
                                         $_POST[pais],
                                         $_POST[nomeBanco],
                                         $_POST[numeroBanco],
                                         $_POST[agencia],
                                         $_POST[conta],
                                         $_POST[cidadeBanco],
                                         $_POST[ufBanco],
                                         $_POST[postoGraduacao],
                                         $_POST[forca],
                                         $_POST[dataPraca],
                                         $_POST[alistamento],
                                         $_POST[dispensado],
                                         $_POST[dataAlistamento],
                                         $_POST[dataIncorporacao1],
                                         $_POST[dataDesligamento1],
                                         $_POST[dataIncorporacao2],
                                         $_POST[dataDesligamento2],
                                         $_POST[dataIncorporacao3],
                                         $_POST[dataDesligamento3]);
       $aluno->mostrarMensagem($cadastrado);

  
  }

?>
