<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                       //
   //                                                                               //
   // PRGRAMA                   : ListarTurmas.php                                  //
   //                                                                               //
   // DESCRICAO                 : Modulo responsável em apresentar a Lista das Tumas//
   //                             disponiveis para indicacao de instrutores(s).     //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             :                                                   //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       Responsável Ensino) : Ten Padilha                                       //
   //                                                                               //
   // INICIO DA ELABORACAO      : 20/10/2021                                        //
   //-------------------------------------------------------------------------------//
   //                           DETALHES DE ALTERACAO                               //
   //-------------------------------------------------------------------------------//
   // DATA                      :                                                   //
   // AUTOR                     :                                                   //
   // MODULO ALTERADO           :                                                   //
   // MOTIVO                    :                                                   //
   //-------------------------------------------------------------------------------//

 //   include_once("../Funcoes/conexao.php");   
 //	if (session_status() !== PHP_SESSION_ACTIVE) {
 //		session_start();
 //	}
 
  //   $ipaddress = '';
 //	if (isset($_SERVER['REMOTE_ADDR']))
 //		$ipaddress = $_SERVER['REMOTE_ADDR'];
 //	else if(isset($_SERVER['HTTP_CLIENT_IP']))
 //		$ipaddress = $_SERVER['HTTP_CLIENT_IP'];
   
  //  $tokenUser = md5('seg'.$ipaddress.$_SERVER['HTTP_USER_AGENT']);
  
  //   if($_SESSION["donoSessao"]  != $tokenUser){
 //		session_unset ();
 //		session_destroy();
 //		header('location:index.php');
   //  }
   
 //	if(!isset($_SESSION["Mapa"]) ) {
 //		session_unset ();
 //		session_destroy();
 //		header('location:index.php');   }
 //	else   {
 //		$Mapa = $_SESSION['Mapa'];
 //	} 
?>

<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2019.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2020.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-safety.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-signal.css">
	
    <style>
	  html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}			
	    .w3-main {
		    margin-top: 102px;
		    bottom: 0;
		  }
		  .w3-top {
		    height: 100px;
		    bottom: 0;
		  }
	
    </style> 

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
     

    <!-- Title BAR and icon -->	 
    <title>Mapa de Digitção</title>
    <link href="../image/logo.png" rel="shortcut icon">
  
  </head>

  
  <body>
    <div class="w3-top">
      
    <?php include_once("../Funcoes/cabecalho.php");  ?>

	  
        <div class="w3-main w3-padding">        
            <div class="w3-center">
               <ul class="nav nav-pills nav-fill">
                  <?php 
                      echo "<li class='w3-large w3-text-black'><b>Relação dFormulários Digitados</b></li>";
                  ?>
                  <li class="w3-large"><?php echo"&nbsp";?></li>
                  <?php  
                      echo "<li class='w3-large'> <a class='nav-link active' href='../index.php'>VOLTAR</a> </li>";
                  ?>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
               </ul> 
	     </div>			
			
            <br/>		
	     <table class="w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card">
	
           <?php

                //--- Tratamento para Verificar a quantidade de formulários mapeada


                   echo "<thead class='w3-2019-galaxy-blue'>";
                   echo " <tr>";
                   echo "<th class='cabec_Center' scope='col'SIGLA</th>";
                   echo "<th class='cabec_Center' scope='col'>NSINOTICO</th>";
                   echo "<th class='cabec_Center' scope='col'>MÊS</th>";
                   echo "<th class='cabec_Center' scope='col'>HORA</th>";
                   echo "<th class='cabec_Center' scope='col'>MIN</th>";
                   echo "<th class='cabec_Center' scope='col'>01</th>";
                   echo "<th class='cabec_Center' scope='col'>02</th>";
                   echo "<th class='cabec_Center' scope='col'>03</th>";
                   echo "<th class='cabec_Center' scope='col'>04</th>";
                   echo "<th class='cabec_Center' scope='col'>05</th>";
                   echo "<th class='cabec_Center' scope='col'>06</th>";
                   echo "<th class='cabec_Center' scope='col'>07</th>";
                   echo "<th class='cabec_Center' scope='col'>08</th>";
                   echo "<th class='cabec_Center' scope='col'>09</th>";
                   echo "<th class='cabec_Center' scope='col'>10</th>";
                   echo "<th class='cabec_Center' scope='col'>11</th>";
                   echo "<th class='cabec_Center' scope='col'>12</th>";
                   echo "<th class='cabec_Center' scope='col'>13</th>";
                   echo "<th class='cabec_Center' scope='col'>14</th>";
                   echo "<th class='cabec_Center' scope='col'>15</th>";
                   echo "<th class='cabec_Center' scope='col'>16</th>";
                   echo "<th class='cabec_Center' scope='col'>17</th>";
                   echo "<th class='cabec_Center' scope='col'>18</th>";
                   echo "<th class='cabec_Center' scope='col'>19</th>";
                   echo "<th class='cabec_Center' scope='col'>20</th>";
                   echo "<th class='cabec_Center' scope='col'>21</th>";
                   echo "<th class='cabec_Center' scope='col'>22</th>";
                   echo "<th class='cabec_Center' scope='col'>23</th>";
                   echo "<th class='cabec_Center' scope='col'>24</th>";
                   echo "<th class='cabec_Center' scope='col'>25</th>";
                   echo "<th class='cabec_Center' scope='col'>26</th>";
                   echo "<th class='cabec_Center' scope='col'>27</th>";
                   echo "<th class='cabec_Center' scope='col'>28</th>";
                   echo "<th class='cabec_Center' scope='col'>29</th>";
                   echo "<th class='cabec_Center' scope='col'>30</th>";
                   echo "<th class='cabec_Center' scope='col'>31</th>";
                   echo "</tr>";
                   echo "</thead>";
           ?>
	 </div>
      </table>
    </body>
    <?php include_once("../Funcoes/rodape.php");  ?>

</html>