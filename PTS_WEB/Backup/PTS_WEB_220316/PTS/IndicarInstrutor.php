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

   //--- Tratamento para pegar as informa��es

   $IdCurso     = $_GET['op1'];
   $IdTurma     = $_GET['op2'];
   $IdPTS       = $_GET['op3'];
   $IdSemana    = $_GET['op4'];
   $DiaSemana   = $_GET['op5'];
   $Horario     = $_GET['op6'];
   $IdInstrutor = $_GET['op7'];
   $IdStatus    = 'INDICADO';

   $Retorno= "InstrutorIndicado.php?op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana&op5=$DiaSemana&op6=$Horario ";


   //--- Verifica se o instrutor j� foi indicado

   $Sql_I = "Select count(*) as Qtd 
             From PTS_Indicacao 
             Where IdPTS = $IdPTS 
             and IdSemana = $IdSemana 
             and Dia_Semana= '$DiaSemana' 
             and Horario= '$Horario'
             and IdInstrutor = '$IdInstrutor'
            ";

   $Res_sql=ibase_query($conexao,$Sql_I);
   $Resultado=ibase_fetch_assoc($Res_sql);

//echo "$Sql_I <br>" ;


   if ($Resultado['QTD'] == 1) {
      echo "<script language='javascript' type='text/javascript'>
                    alert('Insrutor j� foi indicado...');
		      window.location='$Retorno';
		      </script>";
   }
   else {
      //--- Localizar o instrutor

      $Sql_I = "Select PostoGraduacao, NomeGuerra, Unidade
                From PTS_Instrutor
                Where IdLocalidade = $idLocalidade
                and   IdInstrutor = '$IdInstrutor'
              ";

//echo "$Sql_I <br>" ;

      $Res_sql=ibase_query($conexao,$Sql_I);
      $Resultado=ibase_fetch_assoc($Res_sql);

      $PostoGraduacao =  $Resultado['POSTOGRADUACAO'];
      $NomeGuerra=  $Resultado['NOMEGUERRA'];
      $Unidade=  $Resultado['UNIDADE'];
      $Data = date('d.m.Y H:i');

      $sql = "insert into PTS_Indicacao (IdPTS, IdSemana, Dia_Semana, Horario, IdInstrutor, PostoGraduacao, NomeGuerra, Unidade, Status, Data_Indicacao)
                       Values($IdPTS, $IdSemana, '$DiaSemana', '$Horario', '$IdInstrutor', '$PostoGraduacao', '$NomeGuerra', '$Unidade', 'INDICADO', '$Data')";

//echo "$sql <br>" ;

       $resultado = ibase_query($conexao, $sql );
 
      echo "<script language='javascript' type='text/javascript'>
                    alert('Insrutor indicado com sucesso...');
	   	      window.location='$Retorno';
	   	      </script>";

   }






?>