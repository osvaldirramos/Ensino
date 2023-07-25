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
   //       ResponsÃ¡vel Ensino) : Ten Padilha                                       //
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

   //--- Tratamento para pegar IdPTS e IdSemana

   $sql_Comando="SELECT IDPTS, IDSEMANA FROM PTS_INDICACAO WHERE ID = $Id";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Query_Curso=ibase_fetch_assoc($Res_sql_Comando);

   $IdPTS = $Query_Curso[IDPTS];
   $IdSemana= $Query_Curso[IDSEMANA ];

   //--- Tratamento para pegar IdCurso e IdTurma

   $sql_Comando="SELECT IDCURSO, IDTURMA FROM PTS_PRINCIPAL WHERE idpts = 1 = $IdPTS ";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Query_Curso=ibase_fetch_assoc($Res_sql_Comando);

   $IdCurso = $Query_Curso[IDCURSO];
   $IdTurma= $Query_Curso[IDTURMA ];

   $Id = $_GET['op1'];
   echo " IdPTS $IdPTS <br>";
   echo " IdSemana $IdSemana<br>";
   echo " IdCurso $IdCurso <br>";
   echo " IdTurma $IdTurma<br>";


   $sql = "DELETE FROM PTS_INDICACAO WHERE id = $Id";
//   mysqli_query($conexao,$sql) or die(' "ERRO [0088] - Operação invalida');
//   mysqli_close($conexao);
   
//    echo "<script language='javascript' type='text/javascript'>
//            alert('Instrutor excluí­do com sucesso..');
//            window.location='ListarPTS.php?op1='.$IdCurso.'&op2='.$IdTurma;
          </script>";

?>