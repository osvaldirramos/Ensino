<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a usuario logar no sistema //
  //                             para isto devera entrar com seu Login e senha. //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          :                                                //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/04/2009                                     //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//
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
	<title>.: FERRAMENTAS DO ENSINO :.</title>
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
		  <p><h4><p>Bem-Vindo ao Portal do SGEW<h4></p></p>
		</header>

  <body>
  <div class="ms-site-container">      	  
     <br>
        <div align="center" id="titulo" class="BODY"><strong>Escolha a opção desejada:</strong></div>
     <br>

     <div id="login">
         <br>
        <table border="0" width="100%" >
           <tr>
       <td width="192" align="center"><a href="../Alunos/index.php" title="Fichas de avaliação de Cursos - Aluno" >
         <img src="../imagem/alunos.png" border="0" width="50" height="50" ><br> <div id="descricao">Aluno</div></a>
       </td>
       
       <td width="192" align="center"><a href="../Alunos/index.php" title="Fichas de avaliação de Cursos - Instrutor" >
         <img src="../imagem/instrutor.png" border="0" width="50" height="50" ><br> <div id="descricao">Instrutor</div></a>
       </td>
       
       <td width="192" align="center"><a href="../Alunos/index.php" title="Fichas de avaliação de Cursos - ICEA" >
         <img src="../imagem/avaliador_icea.png" border="0" width="50" height="50" ><br> <div id="descricao">ICEA</div></a>
       </td>
       
          </tr>
        </table>
      </div>
<	  
	  
	  
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

