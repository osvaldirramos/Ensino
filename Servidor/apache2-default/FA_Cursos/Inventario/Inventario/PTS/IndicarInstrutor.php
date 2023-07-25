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

   //--- Tratamento para pegar as informações

   $IdCurso     = $_GET['op1'];
   $IdTurma     = $_GET['op2'];
   $IdPTS       = $_GET['op3'];
   $IdSemana    = $_GET['op4'];
   $DiaSemana   = $_GET['op5'];
   $Trab_Escolar= $_GET['op6'];
   $IdInstrutor = $_GET['op7'];
   $IdStatus    = 'INDICADO';


//   echo "IdCurso $IdCurso <br>";
//   echo "IdTurma $IdTurma <br>";
//   echo "IdPTS $IdPTS <br>";
//   echo "IdSemana $IdSemana <br>";
//   echo "DiaSemana $DiaSemana <br>";
//   echo "Trab_Escolar $Trab_Escolar<br>";
//   echo "IdInstrutor $IdInstrutor <br>";
//   echo "IdStatus $IdStatus <br>";

   $Retorno= "InstrutorIndicado.php?op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana&op5=$DiaSemana&op6=$Trab_Escolar";

  
   //--- Verifica se o instrutor já foi indicado

   $sql_I = "Select count(*) as Qtd 
             From   PTS_Indicacao 
             Where  IdPTS = $IdPTS 
             and    IdSemana = $IdSemana 
             and    Dia_Semana = '$DiaSemana' 
             and    Trab_Escolar = '$Trab_Escolar' 
             and    IdInstrutor = '$IdInstrutor'
            ";
//echo "1 - $sql_I  <br>";
			
   $Res_sql=ibase_query($conexao,$Sql_I);
   $Resultado=ibase_fetch_assoc($Res_sql);

   if ($Resultado['QTD'] == 1) {
      echo "<script language='javascript' type='text/javascript'>
                    alert('Instrutor já foi indicado para a Disciplina '+$Trab_Escolar);
		      window.location='$Retorno';
		      </script>";
   }
   else {
      $Data = date('d.m.Y H:i');

      //--- Primeiro passo - Verifica se o instrutor encntra-se no banco de pessoas
      
	  $sql= " select count(1) as Qtd
                     From Pessoa 
                     Where CPF_CIC = '$IdInstrutor' ";
//echo "2 - $sql <br>";
	  
      $Res_sql=ibase_query($conexao,$sql);
      $Resultado=ibase_fetch_assoc($Res_sql);
	  
	  $Qtd= $Resultado[QTD];

      if ($Qtd == 0) {    //--- Instrutor não cadastrado no banco de pessoas
      //--- Localizar o instrutor

         $Sql_I = "Select PostoGraduacao, NomeGuerra, Unidade
                   From PTS_Instrutor
                   Where IdLocalidade = $idLocalidade
                   and   IdInstrutor = '$IdInstrutor'
                  ";
//echo "3 - $sql_I  <br>";

         $Res_sql=ibase_query($conexao,$Sql_I);
         $Resultado=ibase_fetch_assoc($Res_sql);

         $PostoGraduacao = $Resultado['POSTOGRADUACAO'];
         $NomeGuerra=  $Resultado['NOMEGUERRA'];
         $Unidade=  $Resultado['UNIDADE'];


         $sql = "insert into pessoa (identidade, CPF_CIC, NomeGuerra, postograduacao, idunidade)
                 Values( '$IdInstrutor', '$IdInstrutor', '$NomeGuerra', '$PostoGraduacao', '$Unidade')";
//echo "4 - $sql   <br>";

         $resultado = ibase_query($conexao, $sql );
	  } 
	  
      //--- Pega o PTS Selecionado apartir do Trab_Escolar

	  $sql = " Select IdPTS, IdSemana, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, Disciplina
               From pts_semana 
               Where IdPTS =  $IdPTS 
               and   Trab_Escolar = '$Trab_Escolar'
               order by  IdPTS, IdSemana, DIA_SEMANA, HORARIO ";
//echo "5 - $sql  <br>";

      $Res_sql=ibase_query($conexao,$sql);
      while($relacionado=ibase_fetch_assoc($Res_sql))
      {
		 $sql = "insert into PTS_Indicacao (IdPTS , IdSemana , Dia_Semana  , Horario                , Trab_Escolar, IdInstrutor   , Status    , Indicado_por, Data_Indicacao, id, Disciplina) 
                                     Values($IdPTS, $IdSemana, '$DiaSemana', '$relacionado[HORARIO]', '$relacionado[TRAB_ESCOLAR]', '$IdInstrutor', 'INDICADO', '$Localidade', '$Data', null, '$relacionado[DISCIPLINA]')";

//echo "6 - $sql  <br>";
         $resultado = ibase_query($conexao, $sql );
	  }
 
      echo "<script language='javascript' type='text/javascript'>
                    alert('Insrutor indicado com sucesso...');
	   	      window.location='$Retorno';
	   	      </script>";
  }
?>