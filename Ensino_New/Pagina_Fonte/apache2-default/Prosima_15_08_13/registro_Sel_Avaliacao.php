<?php
   session_start();
   $_SESSION[idCurso]=139;
   $_SESSION[idTurma]=$_POST[ListaDeFichas];
   header("Location:Sel_Avaliacao.php");
?>
