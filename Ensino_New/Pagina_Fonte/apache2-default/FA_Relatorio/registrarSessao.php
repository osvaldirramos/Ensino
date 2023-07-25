<?php

   session_start();

   if($_POST[ListaDeFichas])
   {
       $_SESSION[dadosFicha]= $_POST[ListaDeFichas];
       header("Location:montapagina.php");
   }





?>
