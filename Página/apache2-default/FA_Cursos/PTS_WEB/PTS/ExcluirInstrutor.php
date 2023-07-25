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

   $Id = $_GET['op1'];


   //--- Tratamento para pegar as informações para retornar para tela de indicacao

      $Sql_I = "Select P.IdCurso, p.IdTurma, p.IdPTS, i.IdSemana, i.Dia_Semana, i.Trab_escolar
                From pts_principal P, pts_indicacao i
                Where p.IdPTS = i.IdPTS
                and i.id = $Id
              ";

// echo "$Sql_I <br>" ;

      $Res_sql=ibase_query($conexao,$Sql_I);
      $Resultado=ibase_fetch_assoc($Res_sql);

   $IdCurso      = $Resultado['IDCURSO'];
   $IdTurma      = $Resultado['IDTURMA'];
   $IdPTS        = $Resultado['IDPTS'];
   $IdSemana     = $Resultado['IDSEMANA'];
   $DiaSemana    = $Resultado['DIA_SEMANA'];
   $Trab_Escolar = $Resultado['TRAB_ESCOLAR'];

//echo "IdCurso  $IdCurso <br>";
//echo "IdTurma  $IdTurma <br>";
//echo "IdPTS $IdPTS <br>";
//echo "IdSemana $IdSemana <br>";
//echo "DiaSemana $DiaSemana <br>";
//echo "Trab_Escolar $Trab_Escolar <br>";

   $Retorno= "InstrutorIndicado.php?op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana&op5=$DiaSemana&op6=$Trab_Escolar ";

//echo "Retorno $Retorno <br>";

   //--- Tratamento para excluir a indicacao

   $sql="delete from PTS_Indicacao where id = $Id";

   $resultado = ibase_query($conexao, $sql );
 
    echo "<script language='javascript' type='text/javascript'>
                  alert('Instrutor excluí­do com sucesso...');
                  window.location='$Retorno';
          </script>";
?>