<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                          //
   //                                                                               //
   // PRGRAMA                   : CadastrarInstrutor.php                            //
   //                                                                               //
   // DESCRICAO                 : Modulo responsável por cadastrar instrutores(s).  //
   //                             por localidade.                                   //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             : Ten Padilha                                       //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       ResponsÃ¡vel Ensino) : Ten Padilha                                      //
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

        <section>

            <?php 
//echo "IdCurso  $IdCurso <br>";
//echo "IdTurma rso  $IdTurma <br>";
//echo "IdPTS $IdPTS <br>";
//echo "IdSemana $IdSemana <br>";
//echo "DiaSemana $DiaSemana <br>";
//echo "Trab_Escolar $Trab_Escolar <br>";

               echo "    <form id='form1' name='form1' method='POST' action='TratarInstrutor.php?op1= ".$IdCurso."&op2=".$IdTurma."&op3=".$IdPTS."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."' onSubmit='return submete();'>";
            ?>
                <div class="card mt-2">
                    <div class="w3-left w3-padding">
  
                       <ul class="nav nav-pills nav-fill">
                       <?php 
                           echo "    <li class='w3-large w3-text-black'><b/>CADASTRAR INSTRUTOR DO $Localidade</b></li>";
                           echo "    <li class='w3-large'>&nbsp</li>";
                           echo "    <li class='w3-large'>&nbsp</li>";
                           echo "    <li class='w3-large'>&nbsp</li>";
                           echo "    <li class='w3-medium'><a class='w3-btn w3-blue w3-ripple' href='SelecionarInstrutor.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$IdPTS."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."'>Voltar</a></li>";
                       ?>
                       </ul> 

  						
                       <div class="form-group col-md-6 text-left">
                           <label class="w3-text-gray">CPF:</label>
                           <input type="text" class="form-control" name="cpf" id="Nome" placeholder="Informe CPF do instrutor"
                           maxlength="11" autocomplete="off" required
                           value="<?php echo $Nome; ?>">
                       </div>



                       <div class="form-group col-md-6 text-left">
                           <label class="w3-text-gray">Posto Graduação</label>
                           <select name="postograduacao" id="PostoGraduacao" class="form-control" required>

                           <?php 
                               $sql= "select distinct postograduacao
                                      From antiguidade
                                      where origem =  'AERONÁUTICA'
                                      and postograduacao <> 'Cb' and postograduacao <> 'AL' and postograduacao <> 'Cad'  and postograduacao <> 'Asp' and postograduacao <> 'T1' and postograduacao <> 'T2' and postograduacao <> 'T1'
                                      order by postograduacao";

                               $Res_sql_PostoGraduacao=ibase_query($conexao,$sql);
                               while($relacionado=ibase_fetch_assoc($Res_sql_PostoGraduacao))
                               {
                                   echo " <option>$relacionado[POSTOGRADUACAO]</option> ";
                               }
                               echo "       </select> ";
                               echo " </div>";
   
                           ?>

                        <div class="form-group col-md-6 text-left">
                           <label class="w3-text-gray">Nome Guerra:</label>
                           <input type="text" class="form-control" name="nomeguerra" id="Nome:Guerra" placeholder="Informe nome de guerra do instrutor"
                           maxlength="20" autocomplete="off" required
                           value="<?php echo $Nome; ?>">
                        </div>
				

                       <div class="form-group col-md-6 text-left">
                           <label class="w3-text-gray">Localidade:</label>
                           <select name="unidade" id="Unidade" class="form-control" required>

                           <?php 
                                echo " <option selected>$Localidade</option> ";

                               $sql= "Select Localidade From PTS_Localidade Where Localidade <> '$Localidade'";

                               $Res_sql_Localidade=ibase_query($conexao,$sql);

                               while($relacionado=ibase_fetch_assoc($Res_sql_Localidade))
                               {
                                   echo " <option>$relacionado[LOCALIDADE]</option> ";
                               }
                               echo "       </select> ";
                               echo " </div>";
   
     			          echo "<input type='submit' class='w3-btn w3-blue w3-ripple w3-text-white w3-hover-white' value='Cadastrar'>";
                           ?>
                      </div>
                      </div>
            </form>
	</section>

    </div>			

    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
	</body>
</html>