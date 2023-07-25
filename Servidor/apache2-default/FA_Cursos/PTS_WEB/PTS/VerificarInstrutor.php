<?php
   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                          //
   //                                                                               //
   // PRGRAMA                   : IndicarInstrutor.php                              //
   //                                                                               //
   // DESCRICAO                 : Modulo responsavel por tratar da indicacao do     //
   //                             instrutor.                                        //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             :                                                   //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       Responsável Ensino) : Ten Padilha                                      //
   //                                                                               //
   // INICIO DA ELABORACAO      : 20/01/22                                          //
   //-------------------------------------------------------------------------------//
   //                           DETALHES DE ALTERACAO                               //
   //-------------------------------------------------------------------------------//
   // DATA                      :                                                   //
   // AUTOR                     :                                                   //
   // MODULO ALTERADO           :                                                   //
   // MOTIVO                    :                                                   //
   //-------------------------------------------------------------------------------//

   include_once("../Funcoes/conexao.php");   
	if (session_status() !== PHP_SESSION_ACTIVE) {
		session_start();
	}
 
   $ipaddress = '';
	if (isset($_SERVER['REMOTE_ADDR']))
		$ipaddress = $_SERVER['REMOTE_ADDR'];
	else if(isset($_SERVER['HTTP_CLIENT_IP']))
		$ipaddress = $_SERVER['HTTP_CLIENT_IP'];
  
   $tokenUser = md5('seg'.$ipaddress.$_SERVER['HTTP_USER_AGENT']);
  
   if($_SESSION["donoSessao"]  != $tokenUser){
		session_unset ();
		session_destroy();
		header('location:../index.php');
   }
   
   if(!isset($_SESSION['idCurso']) ) {
		session_unset ();
		session_destroy();
		header('location:../index.php');   }
   else   {
       $IdCurso = $_SESSION['idCurso'];
       $IdTurma = $_SESSION['idturma'];
   }

   //--- Tratamento para pegar as informações

   $IdPTS       = $_GET['op3'];
   $IdSemana    = $_GET['op4'];
   $DiaSemana   = $_GET['op5'];
   $Trab_Escolar= $_GET['op6'];
   $IdInstrutor = $_GET['op7'];

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
    <title>SGEW - Sistema de Gerenciamento Ensino</title>
	  <link href="../image/logo.png" rel="shortcut icon">

  </head>
  
  <body>
  
  
    <div class="w3-top">
      
    <?php 
        $Retorno= "op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana&op5=$DiaSemana&op6=$Trab_Escolar";
  
        //--- Verifica se o instrutor já foi indicado

        $sql="Select count(*) as qtd 
              From   PTS_Indicacao 
              Where  IdPTS = $IdPTS 
              and    IdSemana = $IdSemana 
              and    Dia_Semana = '$DiaSemana' 
              and     Trab_Escolar = '$Trab_Escolar' ";

        //echo $sql_Comando;
        $Res_sql=ibase_query($conexao,$sql);
        $Resultado=ibase_fetch_assoc($Res_sql);

        if ($Resultado['QTD'] == 0) {
           include_once("../Funcoes/cabecalho.php"); 

	        echo " <div class='w3-main w3-padding'>";
            echo "  <div class='w3-left'>";
            echo "<br>";

            echo "  <ul class='nav nav-pills nav-fill'>
                        <li class='w3-large w3-text-black'><b/>Não foi selecionado instrutor... </b></li>
                        <br>
                    </ul> ";

            echo "  <ul class='nav nav-pills nav-fill'>
                       <br>
                       <li class='w3-large w3-text-black'><b/>Deseja realmente sair sem selecionar instrutor.</b></li>
                   </ul> ";
            echo "<br>";
			   
            echo " <a href='ListarPTS.php?op1=$IdCurso&op2=$IdTurma'>
                        <input type='button' value='Sim'
                        style='background: #069cc2; border-radius: 6px; padding: 15px; cursor: pointer; color: #fff; border: none; font-size: 16px;'>
                  </a>";
			
            echo " <a href='InstrutorIndicado.php?op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana&op5=$DiaSemana&op6=$Trab_Escolar'>
                       <input type='button' value='Não'
                        style='background: #069cc2; border-radius: 6px; padding: 15px; cursor: pointer; color: #fff; border: none; font-size: 16px;'>
                  </a> ";   }  
        else {
            header("Location: ListarPTS.php?op1=$IdCurso&op2=$IdTurma"); 
        }
    ?>
	</div>
    </body>

    <?php include_once("../Funcoes/rodape.php");  ?>
</html>