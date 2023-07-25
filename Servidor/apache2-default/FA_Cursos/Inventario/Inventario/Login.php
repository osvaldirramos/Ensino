<?php
   //----------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                       //
   //                                                                            //
   // PRGRAMA                   : Login.php                                      //
   //                                                                            //
   // DESCRICAO                 : modulo responsÃ¡vel em apresentar a tela de     //
   //                             abertura.                                      //
   //                                                                            //
   // EQUIPE DO DESENVOLVIMENTO :                                                //
   //          Gerente          :                                                //
   //          (Analista)       : Osvaldir Donizetti Ramos                       //
   //          (Programador(es)): Osvaldir Donizetti Ramos                       //
   //                                                                            //
   // INICIO DA ELABORACAO      : 13/10/2021                                     //
   //----------------------------------------------------------------------------//
   //                           DETALHES DE ALTERACAO                            //
   //----------------------------------------------------------------------------//
   // DATA                      :                                                //
   // AUTOR                     :                                                //
   // MODULO ALTERADO           :                                                //
   // MOTIVO                    :                                                //
   //----------------------------------------------------------------------------//

   session_cache_expire(10);
   if (session_status() !== PHP_SESSION_ACTIVE) {
      session_start();
    }
    
    if ( isset( $_SESSION['seg'] ) )  {
      $_SESSION['seg'] = $_SESSION['seg'] + 1;
    }
    else  {
      $_SESSION['seg'] = 1;
    }

   if($_SESSION['seg']==4){
      echo "<script language='javascript' type='text/javascript'>
               alert('Verifique junto ao administrador se existe algum problema com o seu login');
            </script>";
      session_unset ();
      session_destroy();      
   }
?>

<!doctype html>
<html lang="pt-br">
  <head>
	  
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">    

    <link href="../css/estilo.css" rel="stylesheet" type="text/css">       
    
	<!-- Title BAR and icon -->
	<title>PTS-WEB - Login</title>
	<link href="image/logo.png" rel="shortcut icon">
  </head>

  <script type="text/javascript" language="javascript">

    function upper(){
       var texto;
       var texto1; 
       texto = document.form1.login.value; 
       texto1 = document.form1.senha.value;
       document.form1.login.value = texto;
       document.form1.senha.value = texto1;
    }

    function submete()
    { 
        if(document.form1.login.value !="")
         {
         if(document.form1.senha.value !="")
           {  
              return true;  
           }else
           {
              alert('Senha em Branco');	
                   document.form1.senha.focus();
             return false;
            
         }        
         else
         {
             alert('Login em Branco');	
             document.form1.login.focus();
          return false;        
        }
    }
 </script>

 <NOSCRIPT>
    Este navegador nãoo compreende os scripts que se estãoo executando,
    você deve habilitar o javascript no seu navegador ou atualizar sua versão de navegador a uma mais recente.
 </NOSCRIPT>

		<header class="w3-container w3-center">

		<div class="w3-card w3-margin w3-margin-top w3-padding w3-blue">
		  <img src="image/logo.png" style="width:10%">
			<div class="w3-container w3-blue">
				<h4><b>Instituto de Controle do Espaço Aéreo</b></h4>
			</div>
		  </div>
		  <p><h4><p>Bem-Vindo ao Portal do MAPA<h4></p></p>
		</header>

  <body>
  <div class="ms-site-container">      	  
	  
	<div class="w3-main">

	  <div class="w3-row w3-padding">
		<div class="w3-container">		  
		  <p class="w3-large w3-center"><h6>Para ter acesso ao Portal você precisa possuir um login e senha.<br>
                        Para solicitar seu login/senha ou se voce encontrar algum problema, por favor, entre em contato com o
                        Administrador do Portal pelo email: <b>hhhh@icea.fab.mil.br</b>
                        <br><br>
		</div>
		
	  </div>
	  <div class="w3-card w3-margin w3-margin-top w3-center w3-padding w3-blue">
	  
		<form id="form1" name="form1" method="POST" action="Logar.php" onSubmit="return submete();">
                        <div>
                           <div class="w3-center">
                              <p class="w3-text-white">Login *</p>
                              <input type="text" class="form-control w3-center" name="login" id="login" placeholder="Informe seu login"
                              maxlength="20" autocomplete="off" required autofocus>
                           </div>
                         </div>

                         <div>
                           <div class="w3-center w3-padding">
                              <p class="w3-text-white">Senha *</p>
                              <input type="password" class="form-control w3-center" name="senha" id="senha" placeholder="Informe sua senha"
                              maxlength="20" autocomplete="off" required>
                           </div>
                         </div>

                         <button type="submit" name="entra" id="entra" class="btn btn-primary">Acessar</button>
		</form>
		</div>
	  
	  
	</div>
	<script defer="defer" src="//barra.brasil.gov.br/barra.js" type="text/javascript"></script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
  </body>
</html>