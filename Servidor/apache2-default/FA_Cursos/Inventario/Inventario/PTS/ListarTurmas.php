<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                       //
   //                                                                               //
   // PRGRAMA                   : ListarTurmas.php                                  //
   //                                                                               //
   // DESCRICAO                 : Modulo responsÃ¡vel em apresentar a Lista das Tumas//
   //                             disponiveis para indicacao de instrutores(s).     //
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
		$idLocalidade = $_SESSION['idLocalidade'];
		$Localidade =   $_SESSION['Localidade'];
	} 
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
    <title>SGEW - Sistema de Gerenciamento Ensino</title>
    <link href="../image/logo.png" rel="shortcut icon">
  
  </head>

  
  <body>
    <div class="w3-top">
      
    <?php include_once("../Funcoes/cabecalho.php");  ?>

	  
        <div class="w3-main w3-padding">        
            <div class="w3-center">
               <ul class="nav nav-pills nav-fill">
                  <?php 
                      echo "<li class='w3-large w3-text-black'><b>Relação de cursos para indicação de instrutor pelo $Localidade</b></li>";
                  ?>
                  <li class="w3-large"><?php echo"&nbsp";?></li>
                  <?php  
                      echo "<li class='w3-large'> <a class='nav-link active' href='../index.php'>VOLTAR</a> </li>";
                  ?>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
		    <li class="w3-large"><?php echo"&nbsp";?></li>
               </ul> 
	     </div>			
			
            <br/>		
	     <table class="w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card">
	
           <?php

                //--- Tratamento para Verificar se existe turma para indicar istrutor

                $sql_Comando="Select count(1) as Qtd
                              From Curso c, Turma t
                              Where c.IdCurso = t.IdCurso
                              and   t.Indicacao_Instrutor = 'S'
                              and   (t.Status = 'A' or t.Status = 'P')";
        //echo $sql_Comando;
                $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
                $Comando=ibase_fetch_assoc($Res_sql_Comando);

                if ($Comando[QTD] == 0) {
                   echo "<ul class='nav nav-pills nav-fill'>";
                   echo "    <li class='w3-large w3-text-black'><b/>Não possuí turma cadastrada para indicar instrutor, verifique junto ao administrador de PTS</b></li>";
                   echo " </ul>";
                   echo "<br/> ";
                   echo "<br/> ";
                }
                else {

                   echo "<thead class='w3-2019-galaxy-blue'>";
                   echo " <tr>";
                   echo "<th class='cabec_Center' scope='col'CURSO</th>";
                   echo "<th class='cabec_Center' scope='col'>TURMA</th>";
                   echo "<th class='cabec_Center' scope='col'>PERÍODO</th>";
                   echo "<th class='cabec_Center' scope='col'>AÇÃO</th>";
                   echo "</tr>";
                   echo "</thead>";



                   //--- Tratamento para pegar os cursos que estÃ£o abilitados para indicaÃ§Ã£o de instrutor

                   $sql= "select c.idcurso, t.idturma, c.CodCurso, t.Turma, 
                                 EXTRACT(DAY FROM t.DataInicio) || '/' || EXTRACT(MONTH FROM  t.DataInicio) || '/' || EXTRACT(YEAR FROM t.DataInicio) AS Inicio,
                                 EXTRACT(DAY FROM t.DataTermino) || '/' || EXTRACT(MONTH FROM  t.DataTermino) || '/' || EXTRACT(YEAR FROM t.DataTermino) AS Termino
                          From Curso c, Turma t
                          Where c.IdCurso = t.IdCurso
                          and   t.Indicacao_Instrutor = 'S'
                          and   (t.Status = 'A' or t.Status = 'P')
                          Order By c.CodCurso";

                   $Res_sql_relacionado=ibase_query($conexao,$sql);
                   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
                   {
                      echo "<tr>";
                      echo "   <td  name IdCurso style='display:none'>" . $relacionado[IDCURSO] . "</td>";
                      echo "   <td  name IdTurma style='display:none'>" . $relacionado[IDTURMA] . "</td>";
                      echo "   <td class='td_cabec_Center' name CodCurso>" . $relacionado[CODCURSO] . "</td>";
                      echo "   <td class='td_cabec_Center' name Turma>" . $relacionado[TURMA] . "</td>";
                      echo "   <td class='td_cabec_Center' name Periodo>" . $relacionado[INICIO].' a '. $relacionado[TERMINO]. "</td>";
                      echo "  <td class='td_cabec_Center'><a class='w3-btn w3-blue w3-ripple w3-text-white' href='ListarPTS.php?op1=".$relacionado[IDCURSO]."&op2=".$relacionado[IDTURMA]."' role='button' type='submit' formmethod='post'>Indicar Instrutor</a></td>";
                      echo "</tr>";
                   }
                }  
           ?>
	 </div>
      </table>
    </body>
    <?php include_once("../Funcoes/rodape.php");  ?>

</html>