<?php 
   session_start();
   session_unset ();
   session_destroy();

// Iniciando Session Block 3x

   $_SESSION["seg"] = 0;

   header("Location: Login.php"); 


?>
