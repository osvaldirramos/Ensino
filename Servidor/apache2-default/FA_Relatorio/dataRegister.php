<?php
   session_start();
   require_once("../verifica_sessao.php");
   $_SESSION[identidadeCoord]= $_POST[ListaDeFichas];
   header("Location:FichaCoordenador.php");

?>
