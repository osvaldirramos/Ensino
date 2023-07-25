<?php
   session_start();
   require_once("../../Funcoes/verifica_sessao.php");
   $_SESSION[identidadeCoord]= $_POST[ListaDeFichas];
   header("Location:FichaCoordenador.php");

?>
