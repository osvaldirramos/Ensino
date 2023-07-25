<?php

   ob_start();
   session_start();
   require_once("../Funcoes/conecta.inc");

    $sqlcurso = "Select CodCurso, NomeCurso
                     From Curso
                     where IDCURSO = $_SESSION[idCurso]";
   $resultadocurso = ibase_query($conexao, $sqlcurso);
   $curso = ibase_fetch_assoc($resultadocurso);
   $_SESSION[nomeCurso]=$curso[NOMECURSO];
   $_SESSION[codCurso] =$curso[CODCURSO];
   if($_POST[ListaDeFichas])
   {
       $_SESSION[dadosFicha]= $_POST[ListaDeFichas];
       header("Location:montapagina.php");
   }



?>
