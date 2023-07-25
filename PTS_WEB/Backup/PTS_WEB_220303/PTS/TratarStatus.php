<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                          //
   //                                                                               //
   // PRGRAMA                   : TratarStatus.php                                  //
   //                                                                               //
   // DESCRICAO                 : Modulo responsavel por tratar do status da        //
   //                             indicacao.                                        //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             :                                                   //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       ResponsÃ¡vel Ensino) : Ten Padilha                                      //
   //                                                                               //
   // INICIO DA ELABORACAO      : 20/12/2021                                        //
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
		$idLocalidade= $_SESSION[idLocalidade];
		$Localidade= $_SESSION['Localidade']; 
   }

   //--- Tratamento para pegar as informações

   $IdCurso =     $_GET['op1'];
   $IdTurma =     $_GET['op2'];
   $IdPTS =       $_GET['op3'];
   $IdSemana =    $_GET['op4'];
   $IdInstrutor = $_GET['op5'];
   $IdStatus =    $_GET['op6'];

   $Retorno= "InstrutorIndicado.php?op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana ";

   if ($IdStatus == 1) {
       $sql = "update PTS_Indicacao set Status = 'SELECIONADO' 
               where IdPTS = $IdPTS 
               and   IdSemana = $IdSemana
               and   IdInstrutor = '$IdInstrutor' ";
    } else {
         if ($IdStatus == 2) {
             $sql = "update PTS_Indicacao set Status = 'INDICADO' 
               where IdPTS = $IdPTS 
               and   IdSemana = $IdSemana
               and   IdInstrutor = '$IdInstrutor' ";
         }
    }
    $resultado = ibase_query($conexao, $sql );

    echo "<script language='javascript' type='text/javascript'>
			   alert('Status do Insrutor alterado com sucesso...');
			   window.location='$Retorno';
			   </script>";

?>