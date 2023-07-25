<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                          //
   //                                                                               //
   // PRGRAMA                   : TratarInstrutor.php                               //
   //                                                                               //
   // DESCRICAO                 : Modulo responsavel por tratar a inserção do       //
   //                             instrutor na lista de instrutores.                //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             : Ten Padilha                                       //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       ResponsÃ¡vel Ensino) : Ten Padilha                                      //
   //                                                                               //
   // INICIO DA ELABORACAO      : 23/12/2021                                        //
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

   $IdCurso      = $_GET['op1'];
   $IdTurma      = $_GET['op2'];
   $IdPTS        = $_GET['op3'];
   $IdSemana     = $_GET['op4'];
   $DiaSemana    = $_GET['op5'];
   $Trab_Escolar = $_GET['op6'];

//echo "IdCurso  $IdCurso <br>";
//echo "IdTurma rso  $IdTurma <br>";
//echo "IdPTS $IdPTS <br>";
//echo "IdSemana $IdSemana <br>";
//echo "DiaSemana $DiaSemana <br>";
//echo "Trab_Escolar $Trab_Escolar <br>";

   $CPF = strtoupper($_POST['cpf']);
   $PostoGraduacao = $_POST['postograduacao'];
   $NomeGuerra= strtoupper($_POST['nomeguerra']);
   $Unidade= strtoupper($_POST['unidade']);

   $Retorno= "InstrutorIndicado.php?op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana&op5=$DiaSemana&op6=$Trab_Escolar ";

   //---  Verificar se o instrutor ja foi cadastrado

   $sql_Comando= "select count(1) as Qtd
                  From pts_instrutor
                  Where idlocalidade = $idLocalidade
                  and   IdInstrutor = '$CPF' ";

//echo "$sql_Comando";
   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Comando=ibase_fetch_assoc($Res_sql_Comando);

   if ($Comando[QTD] == 0) {
       $sql = "insert into PTS_Instrutor (IdLocalidade, IdInstrutor, PostoGraduacao, NomeGuerra, Unidade)
                          Values ($idLocalidade, '$CPF', '$PostoGraduacao', '$NomeGuerra', '$Unidade')";
//echo "<br> $sql";

//echo "<br> $Retorno";
   $Retorno= "IndicarInstrutor.php?op1=$IdCurso&op2=$IdTurma&op3=$IdPTS&op4=$IdSemana&op5=$DiaSemana&op6=$Trab_Escolar&op7=$CPF ";
//echo "<br> $Retorno";

       $resultado = ibase_query($conexao, $sql );

       header("Location: ".$Retorno); 
//       header("Location: IndicarInstrutor.php?op1=".$IdCurso."&op2=".$IdTurma ."&op3=". $IdPTS ."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."&op7=".$CPF); 
   }
   else {
       echo "<script language='javascript' type='text/javascript'>
  			   alert('Instrutor já cadastrado...');
			   window.location='$Retorno';
			   </script>";
   }
?>