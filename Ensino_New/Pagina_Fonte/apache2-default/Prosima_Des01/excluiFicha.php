<?
   session_start();
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");
?>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>
   <head>
   <body>

<?php
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
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //------------------------------------------------------------------------------------------

   $_SESSION[idCurso] = $_GET[idCurso];
   $_SESSION[idTurma] = $_GET[idTurma];
   $_SESSION[idFicha] = $_GET[idFicha];
   $_SESSION[idATCO] = $_GET[idATCO];
   $_SESSION[idAVL] = $_GET[idAVL];
   $_SESSION[idExercicio] = $_GET[idExercicio];
?>

<?php
     $sql_Comando= "Delete From PR_Avaliacao
                    Where IDCURSO = $_SESSION[idCurso]
                    and   IDTURMA = $_SESSION[idTurma]
                    and   ID_ATCO = '$_SESSION[idATCO]'
                    and   ID_FICHA = $_SESSION[idFicha]
                    and   ID_Exercicio = $_SESSION[idExercicio]";

    $resultadoi = ibase_query($conexao, $sql_Comando);

     $sql_Comando= "Delete From Cad_Parecer
                    Where IDCURSO = $_SESSION[idCurso]
                    and   IDTURMA = $_SESSION[idTurma]
                    and   ID_ATCO = '$_SESSION[idATCO]'
                    and   ID_FICHA = $_SESSION[idFicha]
                    and   ID_Exercicio = $_SESSION[idExercicio]";

    $resultadoi = ibase_query($conexao, $sql_Comando);

     $sql_Comando= "Delete From Rel_NS
                    Where IDCURSO = $_SESSION[idCurso]
                    and   IDTURMA = $_SESSION[idTurma]
                    and   ID_ATCO = '$_SESSION[idATCO]'
                    and   ID_FICHA = $_SESSION[idFicha]
                    and   ID_Exercicio = $_SESSION[idExercicio]";

    $resultadoi = ibase_query($conexao, $sql_Comando);

     $sql_Comando= "Delete From Cad_Ficha_Avl
                    Where IDCURSO = $_SESSION[idCurso]
                    and   IDTURMA = $_SESSION[idTurma]
                    and   ID_ATCO = '$_SESSION[idATCO]'
                    and   ID_FICHA = $_SESSION[idFicha]
                    and   ID_Exercicio = $_SESSION[idExercicio]";

    $resultadoi = ibase_query($conexao, $sql_Comando);

  echo "<script language='javascript' type='text/javascript'>
         alert('Ficha ecluída com sucesso! ');
         window.location='Sel_Avaliacao.php';
        </script>";
?>

</body>
</html>

