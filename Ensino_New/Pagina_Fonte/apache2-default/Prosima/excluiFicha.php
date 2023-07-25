<?
	session_start();
	if ($_SERVER['REQUEST_METHOD'] === 'GET' ) {
		echo "ACESSO RESTRITO";
		header('Location: index.php');  
		exit();
	}
	include("Funcoes/verifica_sessao.php");
	include("Funcoes/conecta.inc");

  //--------------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : InsereResposta.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de inserir as respostas e o comentario
  //                             do alunos da Ficha de Avaliação de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj Sônia
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 22/06/2009
  //
  //------------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //------------------------------------------------------------------------------------------
  // DATA                      :29/08/2013
  // AUTOR                     :sulzbach
  // MODULO ALTERADO           :todo- alteração de modo de transmissão de resposta - passou a ser via json
  // MOTIVO                    :atualização
  //------------------------------------------------------------------------------------------

   $idCurso = $_SESSION[idCurso];
   $idTurma = $_SESSION[idTurma];
   $idFicha = $_POST[idFicha];
   $idATCO = $_POST[idATCO];
   $idAVL = $_POST[idAVL];
   $idExercicio = $_POST[idExercicio];
   $mens="";
     $sql_Comando= "Delete From PR_Avaliacao
                    Where IDCURSO = $idCurso
                    and   IDTURMA = $idTurma
                    and   ID_ATCO = '$idATCO'
                    and   ID_FICHA = $idFicha
                    and   ID_Exercicio = $idExercicio";
    $resultadoi = ibase_query($conexao, $sql_Comando)  or die($mens.="\n\n".ibase_errmsg());

     $sql_Comando= "Delete From Cad_Parecer
                    Where IDCURSO = $idCurso
                    and   IDTURMA = $idTurma
                    and   ID_ATCO = '$idATCO'
                    and   ID_FICHA = $idFicha
                    and   ID_Exercicio = $idExercicio";

    $resultadoi = ibase_query($conexao, $sql_Comando)  or die($mens.="\n\n".ibase_errmsg());

     $sql_Comando= "Delete From Rel_NS
                    Where IDCURSO = $idCurso
                    and   IDTURMA = $idTurma
                    and   ID_ATCO = '$idATCO'
                    and   ID_FICHA = $idFicha
                    and   ID_Exercicio = $idExercicio";

    $resultadoi = ibase_query($conexao, $sql_Comando) or die($mens.="\n\n".ibase_errmsg());

     $sql_Comando= "Delete From Cad_Ficha_Avl
                    Where IDCURSO = $idCurso
                    and   IDTURMA = $idTurma
                    and   ID_ATCO = '$idATCO'
                    and   ID_FICHA = $idFicha
                    and   ID_Exercicio = $idExercicio";

    $resultadoi = ibase_query($conexao, $sql_Comando) or die($mens.="\n\n".ibase_errmsg());

echo json_encode(array('merro'=>$mens));
?>
