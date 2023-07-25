<?php
   //----------------------------------------------------------------------------//
   // NOME DO PROJETO           : BRAC                                           //
   //                                                                            //
   // PRGRAMA                   : SelecionaModuloSensorFuncao.php                //
   //                                                                            //
   // DESCRICAO                 : modulo responsável pela seleção do             //
   //                             ModuloSensorFuncao pelo cadastro de Requisito. //
   //                                                                            //
   // EQUIPE DO DESENVOLVIMENTO :                                                //
   //          Gerente          : Lacerda                                        //
   //          (Analista)       : Osvaldir Donizetti Ramos                       //
   //          (Programador(es)): Osvaldir Donizetti Ramos                       //
   //                                                                            //
   // INICIO DA ELABORACAO      : 22/01/2021                                     //
   //----------------------------------------------------------------------------//
   //                           DETALHES DE ALTERACAO                            //
   //----------------------------------------------------------------------------//
   // DATA                      :                                                //
   // AUTOR                     :                                                //
   // MODULO ALTERADO           :                                                //
   // MOTIVO                    :                                                //
   //----------------------------------------------------------------------------//
   // Observacao: O $Lista indentifica qual programa esta chamando o modulo de   //
   //       seleção do PCEA: 1 - Requisito  - Seleção da opção Cadastro          //
   //                        2 - Requisito  - Seleção da opção Atualiza          //
   //----------------------------------------------------------------------------//
   // DATA                      : 25/05/2021                                      //
   // AUTOR                     : Osvaldir Donizetti Ramos                       //
   // MOTIVO                    : Passagem de parametro por funcao.              //
   //----------------------------------------------------------------------------//
   // DATA                      : 28/06/2021                                      //
   // AUTOR                     : Osvaldir Donizetti Ramos                        //
   // MOTIVO                    : Implementação da verificação de seção pelo      //
   //                             endereço de acesso remoto.                      //
   //-----------------------------------------------------------------------------//

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
   
	if(!isset($_SESSION["idusuario"]) ) {
		session_unset ();
		session_destroy();
		header('location:index.php');   }
	else   {
		$idLogin = $_SESSION['idusuario'];
		$Menu = $_SESSION['Menu']; 
	}  
      
   $IdPcea = $_GET['op2'];
   $IdBRAC = $_GET['op3'];
   $IdRequisito = $_GET['op5'];
   $IdModSensFunc = $_GET['op6'];
   $BRAC = $_GET['op7'];
  
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
     <title>SISBRAC - Seleção de Módulo/Sensor/Função</title>
	 <link href="../image/logo.png" rel="shortcut icon">

  </head>

  
  <body>
      <div class="w3-top">
		  <div class="w3-bar w3-top w3-blue">
			<a href="#" class="w3-bar-item"><img src="../image/logo.png" alt="ICEA" width="63" height="72"></a>
			<div class="w3-padding-32 w3-left w3-large w3-hide-medium w3-hide-small"><b>SISTEMA DE GERENCIAMENTO DE BASE DE REQUISITOS DE AVALIAÇÃO DA CONFORMIDADE</b></div>
			<div class="w3-padding-32 w3-left w3-large w3-hide-large"><b>SISBRAC</b></div>
		  </div>
		</div>  
      
	  <div class="w3-main w3-padding">
	  
        <div class="w3-center">
                <ul class="nav nav-pills nav-fill">
                    <li class="w3-large w3-text-black"><b>GERENCIAR BRAC - REQUISITO - SELECIONAR MÓDULO/SENSOR/FUNÇÃO</b> </li>
                    <li class="w3-large"><?php echo"&nbsp"?></li>
                    <?php  
                        echo "<li class='w3-medium'> <a class='w3-btn w3-blue w3-ripple' href='../GerenciarRequisito/ListarRequisito.php?op2=$IdPcea&op3=$IdBRAC&op4=$BRAC'>Cancelar</a> </li>";
                    ?>
                </ul>                
				<br/>
		</div>		
                                
				   <table class="w3-table w3-centered w3-responsive w3-card">
                       
                         <tr class="w3-2019-galaxy-blue">
                            <th class="w3-border">BRAC | PCEA</th>
                         </tr>	                       
                       
                       <tbody>

                          <?php

                            $sql = "Select p.IdPCEA, p.TipoPcea, p.Classe 
                                    From ModuloSensorFuncao m, PCEA p
                                    where p.IdPCEA = $IdPcea";
									
							$result = mysqli_query($conexao, $sql);
							$row = mysqli_fetch_array($result);
							echo "<tr>";
                            echo " <th class='w3-border' name IdModSensFunc>Número BRAC: $BRAC | ID PCEA: $IdPcea | " . $row['TipoPcea'] . " | " . $row['Classe'] . " </th>";
                            echo "</tr>";                                              
                          ?>

                       </tbody>
                     </table>
				   </br>
				   <table class="w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card">
                       
                         <tr class="w3-2019-galaxy-blue">
							<td class="w3-border">ID MOD/SENS/FUNC</td>
							<td class="w3-border">DESCRIÇÃO</td>
                            <td class="w3-border">TIPO</td>
                            <td class="w3-border">GRANDEZA</td>
							<td class="w3-border">SELECIONAR</td>
                         </tr>	
                       
                       
                       <tbody>

                          <?php

                            $sql = "Select IdModSensFunc, IdPCEA, Descricao, Tipo, Grandeza
                                    From ModuloSensorFuncao
                                    where IdPCEA = $IdPcea
                                    order by IdModSensFunc ";

                            if($result = mysqli_query($conexao, $sql)){
                                if(mysqli_num_rows($result) > 0){
                                    while($row = mysqli_fetch_array($result)){
                                        echo "<tr>";
                                           echo "<td class='w3-border'>" . $row['IdModSensFunc'] . "</td>";
                                           echo "<td class='w3-border'>" . $row['Descricao'] . "</td>";
                                           echo "<td class='w3-border'>" . $row['Tipo'] . "</td>";
                                           echo "<td class='w3-border'>" . $row['Grandeza'] . "</td>";                                                                                                                                                                                                                                                          
                                           echo "<th class='w3-border'><a class='w3-btn w3-green w3-ripple w3-hover-white' href='../GerenciarRequisito/CadRequisito.php?op2=$IdPcea&op3=$IdBRAC&op5=0&op6=".$row['IdModSensFunc']."&op7=$BRAC'>
										   <i class='fa fa-check w3-large w3-text-white'></i></a></th>";
                                           echo "</tr>";                                              
                                    }
                                } else{
                                    echo "Nenhum registro correspondente à sua consulta foi encontrado.";
                                }
                            } else{
                              echo "ERRO [0356]: Operação invalida... ";
                             }
                          ?>

                       </tbody>
                     </table>
                  
            </div>
          </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
  </body>
  <!-- Footer -->
	<footer class="w3-light-grey w3-center w3-xlarge w3-container">
	  <div class="w3-section">
		  <p class="w3-tiny"><a href="https://www.icea.decea.mil.br" target="_blank" class="w3-hover-text-blue"><b>Instituto de Controle do Espaço Aéreo - ICEA</b></a><br/>
							<a href="http://pesquisa.icea.decea.mil.br/conformidade/" target="_blank" class="w3-hover-text-blue"><b>Subdivisão de Avaliação da Conformidade - PCO</a></b><br/>
							Praça Marechal-do-Ar Eduardo Gomes, 50 - Vila das Acácias<br/>
							São José dos Campos/SP - Brasil  CEP: 12.228-903<br/>
								+55 (12) 3945-9000 / icea@fab.mil.br</p>			
	  </div>
	  <p class="w3-tiny">Developed by <a href="https://www.sdtp.org.br/" target="_blank" class="w3-hover-text-green">Fundação SDTP</a><br/> Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
	</footer>
</html>