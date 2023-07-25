<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW                                              //
   //                                                                               //
   // PRGRAMA                   : ExcluirInstrutor.php                              //
   //                                                                               //
   // DESCRICAO                 : Modulo responsavel por excluir o instrutor        //
   //                             selecionada.                                      //
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
        $Localidade = $_SESSION['Localidade'];

        $IdCurso = $_GET['op1'];
        $IdTurma = $_GET['op2'];
        $idUsuario = $_GET['op3'];
	}    
   

//    echo " IdCurso  $IdCurso <br>";
//    echo " IdTurma  $IdTurma <br>";


    //$sql = "DELETE FROM usuario WHERE IdUsuario = $idUsuario";
    //mysqli_query($conexao,$sql) or die(' "ERRO [0088] - Operação invalida');
    //mysqli_close($conexao);
   
    echo "<script language='javascript' type='text/javascript'>
            alert('Instrutor excluído com sucesso..');
            window.location='ListarPTS.php?op1='.$IdCurso.'&op2='.$IdTurma;
          </script>";

?>