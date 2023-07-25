<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                          //
   //                                                                               //
   // PRGRAMA                   : SelecionarInsrutorphp                             //
   //                                                                               //
   // DESCRICAO                 : Modulo responsável por selecionar instrutores(s). //
   //                             por localidade.                                   //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             :                                                   //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       Responsável Ensino) : Ten Padilha                                      //
   //                                                                               //
   // INICIO DA ELABORACAO      : 22/10/2021                                        //
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
	header('location:index.php');
    }
   
    if(!isset($_SESSION["idLocalidade"]) ) {
	session_unset ();
	session_destroy();
	header('location:index.php');   }
    else   {
       $idLocalidade = $_SESSION['idLocalidade'];
       $Localidade =   $_SESSION['Localidade'];

       //--- Tratamento para localizar o Curso e a Turma

       $IdCurso      = $_GET['op1'];
       $IdTurma      = $_GET['op2'];
       $IdPTS        = $_GET['op3'];
       $IdSemana     = $_GET['op4'];
       $DiaSemana    = $_GET['op5'];
       $Trab_Escolar = $_GET['op6'];
    }  
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
      
       <?php include_once("../Funcoes/cabecalho.php");  ?>

       <div class="w3-main w3-padding">        
           <div class="w3-center">
              <ul class="nav nav-pills nav-fill">
                  <?php 
                      echo "    <li class='w3-large w3-text-black'><b/>RELAÇÃO DE INSTRUTORES: $Localidade</b></li>";
                      for ($i = 1; $i <= 20; $i++) { echo "    <li class='w3-large'>&nbsp</li>"; }
                      echo "    <li class='w3-medium'><a class='w3-btn w3-blue w3-ripple' href='InstrutorIndicado.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$IdPTS."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."'>Voltar</a></li>";
                      echo "    <br>";
                  ?>
               </ul> 
               <ul class="nav nav-pills nav-fill">
                  <?php 
                      echo "    <br>";
                      echo "    <li class='w3-large w3-text-black'><b/>PARA A DISCIPLINA: $Trab_Escolar</b></li>";
                  ?>
               </ul> 
           </div>

           <?php 

//echo "IdCurso $IdCurso <br>";
//echo "IdTurma $IdTurma <br>";
//echo "IdPTS $IdPTS <br>";
//echo "IdSemana $IdSemana <br>";
//echo "DiaSemana $DiaSemana <br>";
//echo "Trab_Escolar $Trab_Escolar<br>";

               echo "<br/> ";
               echo "<table class='w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card'>";

               //--- Apresentação do cabecalho

               echo "<thead class='w3-2019-galaxy-blue'>";
                  echo "<tr> ";
                      echo "<th class='cabec_Center' scope='col'>IDENTIDADE</th>";
                      echo "<th class='cabec_Center' scope='col'>POSTO GRADUAÇÃO</th>";
                      echo "<th class='cabec_Center' scope='col'>NOME GUERRA</th>";
                      echo "  <td class='td_cabec_Center'><a class='w3-btn w3-blue w3-ripple w3-text-white' href='CadastrarInstrutor.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$IdPTS."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."' role='button' type='submit' formmethod='post'>Cadastrar Instrutor</a></td>";
                  echo "</tr>";
               echo "</thead>";

               $sql= "Select IdLocalidade, IdInstrutor, PostoGraduacao, NomeGuerra, Unidade
                      From pts_instrutor
                      Where IdLocalidade = 3
                      order by PostoGraduacao, NomeGuerra";

               $Res_sql_Instrutor=ibase_query($conexao,$sql);
               while($relacionado=ibase_fetch_assoc($Res_sql_Instrutor))
               {
                   echo "<tr>";
                   echo "   <td  name IdPTS style='display:none'>" . $relacionado[IDLOCALIDADE] . "</td>";
                   echo "   <td class='td_cabec_Center' name Id_Instrutor>" . $relacionado[IDINSTRUTOR] . "</td>";
                   echo "   <td class='td_cabec_Center' name PostoGraduacao>" . $relacionado[POSTOGRADUACAO] . "</td>";
                   echo "   <td class='td_cabec_Center' name nomeguerra>" . $relacionado[NOMEGUERRA] . "</td>";
                   echo "   <td class='td_cabec_Center' name unidade>" . $relacionado[UNIDADE] . "</td>";
                   echo "  <td class='td_cabec_Center'><a class='w3-btn w3-green w3-ripple w3-text-white' href='IndicarInstrutor.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$IdPTS."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."&op7=".$relacionado[IDINSTRUTOR]."' role='button' type='submit' formmethod='post'>Indicar</a></td>";
                   echo "</tr>";
               }

           ?>

       </div>
    </div>
  </body>
  
  <?php //include_once("../Funcoes/rodape.php");  ?>


