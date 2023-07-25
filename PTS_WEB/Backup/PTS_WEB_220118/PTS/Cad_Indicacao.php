<?php
  //------------------------------------------------------------------------------//
  // NOME DO PROJETO           : SIS-BRAC                                         //
  //                                                                              //
  // PRGRAMA                   : CadUsuario.php                                   //
  //                                                                              //
  // DESCRICAO                 : Modulo responsavel por apresentar a janela do    //
  //                             Cadastro do Usuário.                             //
  //                                                                              //
  // EQUIPE DO DESENVOLVIMENTO :                                                  //
  //          Gerente          : Lacerda                                          //
  //          (Analista)       : Osvaldir Donizetti Ramos                         //
  //          (Programador(es)): Osvaldir Donizetti Ramos                         //
  //                                                                              //
  // INICIO DA ELABORACAO      : 05/12/2020                                       //
  //------------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                              //
  //------------------------------------------------------------------------------//
  // DATA                      : 12/01/2021                                       //
  // AUTOR                     : Osvaldir Donizetti Ramos                         //
  // MOTIVO                    : Atualização de acordo com nova proposta:         //
  //                            - Nome do usuario passa de 20 para 40 caracteres  //
  //                            - Trocar o campo Funcao por Especialidade         //
  //                            - OM passa de 25 para 100 caracteres              //
 //-------------------------------------------------------------------------------//
   // DATA                      : 19/05/2021                                      //
   // AUTOR                     : Osvaldir Donizetti Ramos                        //
   // MOTIVO                    : Passagem de parametro por funcao.               //
   //-----------------------------------------------------------------------------//
   // DATA                      : 28/06/2021                                      //
   // AUTOR                     : Osvaldir Donizetti Ramos                        //
   // MOTIVO                    : Implementação da verificação de seção pelo      //
   //                             endereço de acesso remoto.                      //
   //-----------------------------------------------------------------------------//

   include_once("../Funcoes/conexao.php");
   if (session_status() !== PHP_SESSION_ACTIVE) {
      session_start();
    }
  
    //Verifica seção Remota
    
    $tokenUser = md5('seg'.$_SERVER['REMOTE_ADDR'].$_SERVER['HTTP_USER_AGENT']);
  
    if($_SESSION["donoSessao"]  != $tokenUser){
       session_unset ();
       session_destroy();
       echo "ERRO [0221] - Acesso negado";
       exit;
     }
   
   // Verifica se existe os dados da sessão de login
   if(!isset($_SESSION["idusuario"]) ) {
     session_unset ();
     session_destroy();
     echo "ERRO [0083] - Acesso negado";
     exit;
   }
   else   {
     $idLogin = $_SESSION['idusuario'];
     $Menu = $_SESSION['Menu']; 
   }  
   $idUsuario = $_GET['op1'];
?>

<!doctype html>
<html lang="pt-br">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- Material Design for Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous"> -->


    <link href="../css/estilo_cabecalho.css" rel="stylesheet" type="text/css">       
    <!-- Title BAR and icon -->	 
     <title>SISBRAC - Cadastro de Usuário</title>
	 <!--<link rel="shortcut icon" href="sisbrac.ico" /> -->
	 <link href="http://pesquisa.icea.gov.br/static/assets/img/favicon.png" rel="shortcut icon">

    <script>
       function submete()
	   { 
            if(document.form1.Nome.value !="") {
               if(document.form1.PostoGraduacao.value !="") {
                    if(document.form1.CPF.value !="") {  
                        if(document.form1.Funcao.value !="") {
						    return true;  
    					} 
	     				else {
		    				document.form1.Funcao.focus();
			    			return false;
				    	}
    				}
	    			else {
		    			document.form1.CPF.focus();
			    		return false;						  
				    }
			    else{
				    document.form1.PostoGraduacao.focus();
				    return false;
			    } 
		    else{
     			document.form1.Nome.focus();
	    		return false;        
		    }	
	   }
      
    </script>
    
  </head>

  <?php
//     $sql = "select * from usuario where IdUsuario = $idUsuario"; 

//     if ($idUsuario <> 0) { 
 

 //       if($result = mysqli_query($conexao, $sql)){
 //           if(mysqli_num_rows($result) > 0){
 //              while($row = mysqli_fetch_array($result)){
//                  $IdUsuario      = $row["IdUsuario"];
//                  $Login          = $row["Login"];
//				      $Nome           = $row["Nome"];
//				      $Email          = $row["Email"];
//                  $Senha          = $row["Senha"];
//                  $PostoGraduacao = $row["PostoGraduacao"];
//                  $Especialidade  = $row["Especialidade"];
//                  $OM             = $row["OM"];
 //                 $Perfil         = $row["Perfil"];
//               }
//            } else{
//               echo "Nenhum registro correspondente à sua consulta foi encontrado.";
//            }
//         } else{
//            echo "ERRO [0082]: Operação invalida... ";
//         }
//     } else {
//         $Login          = "";
		   $Nome           = "";
    	   $Email          = "";
         $Senha          = "";
         $PostoGraduacao = "";
         $Especialidade  = "";
         $OM             = "";
         $Perfil         = "";
//     }
  ?>

  <body>
      <div class="container col-12">

         <?php include_once("../Funcoes/cabecalho.php");  ?>

         <section>

            <form id="form1" name="form1" method="POST" action="TratarUsuario.php?op3=<?php echo $idUsuario;?>" onSubmit="return submete();">
                <div class="card mt-1">
                    <div class="card-body text-left">
  
                        <?php 
                           if ($idUsuario == 0) { 
                              echo "<div class='text-info text-uppercase'><h4>Gerenciar Usuário - Cadastrar Usuário</h4> </div>";
                           } else {
                              echo "<div class='text-info text-uppercase'><h4>Gerenciar Usuário - Atualizar Usuário</h4> </div>";
                           }
                        ?>
                        
                        <div class="form-group col-md-6 text-left">
                           <label for="inputLogin" class="Label">Login:</label>
                           <input type="text" class="form-control" name="Login" id="Login" placeholder="Informe login do usuário"
                           maxlength="20" autocomplete="off" required
                           value="<?php echo $Login; ?>"
                           autofocus>
                        </div>
						
						
						<div class="form-group col-md-6 text-left">
                           <label for="inputNome" class="Label">Nome:</label>
                           <input type="text" class="form-control" name="Nome" id="Nome" placeholder="Informe nome do usuário"
                           maxlength="40" autocomplete="off" required
                           value="<?php echo $Nome; ?>"
                           autofocus>
                        </div>
						
						<div class="form-group col-md-6 text-left">
                           <label for="inputEmail" class="Label">E-mail:</label>
                           <input type="text" class="form-control" name="Email" id="Email" placeholder="Informe e-mail do usuário"
                           maxlength="40" autocomplete="off" required
                           value="<?php echo $Email; ?>"
                           autofocus>
                        </div>

                        <div class="form-group col-md-6 text-left">
                           <label for="inputNome" class="Label">Posto Graduação</label>
                           <input type="text" class="form-control" name="PostoGraduacao" id="PostoGraduacao" placeholder="Informe o Posto Graduação"
                           maxlength="25" autocomplete="off" required
                           value="<?php echo $PostoGraduacao; ?>">
                        </div>

                        <div class="form-group col-md-6 text-left">
                           <label for="inputNome" class="Label">Especialidade</label>
                           <input type="text" class="form-control" name="Especialidade" id="Especialidade" placeholder="Informe a Especialidade do usuário"
                           maxlength="300" autocomplete="off" required
                           value="<?php echo $Especialidade; ?>">
                        </div>

                        <div class="form-group col-md-6 text-left">
                           <label for="inputNome" class="Label">OM</label>
                           <input type="text" class="form-control" name="OM" id="OM" placeholder="Informe a OM do usuário"
                           maxlength="100" autocomplete="off" required value="<?php echo $OM; ?>">
                        </div>

                        <div class="form-group col-md-6 text-left">
                           <label for="inputPerfil" class="Label">Perfil</label>
                           <select name="Perfil" id="Perfil" class="form-control" required>
                              
                              <?php 
								 if ($idUsuario == 0) { 
                                       echo"<option value=''>Selecione o Perfil do usuário</option>";
                                    }else{
									   echo"<option selected>$Perfil</option>";
									}
                              ?>
                              <option>GERENTE</option>
							         <option>CATALOGADOR</option>
                              <option>REVISOR</option>
                              <option>AVALIADOR</option>
                              <option>ELO DO SISCEAB</option>
                           </select>
                        </div>
						
						<?php 
                           if ($idUsuario == 0) { 
                              echo "<input type='submit' class='button' value='CADASTRAR' class='btn'>";
                           } else {
                              echo "<input type='submit' class='button' value='ATUALIZAR' class='btn'>";
                           }
                        ?>
						
                        <a href="ListaUsuario.php"><input  class="button" type="button" value="CANCELAR"></a>
                   </div>
               </div>
              </form>

          </section>

            </div>
          </div>
      </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
  </body>
</html>