<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                       //
   //                                                                               //
   // PRGRAMA                   : ListarPTS.php                                     //
   //                                                                               //
   // DESCRICAO                 : Modulo responsável em apresentar o PTS a ser      //
   //                             preencido.                                       //
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
       $idLocalidade = $_SESSION['idLocalidade'];
       $Localidade =   $_SESSION['Localidade'];

       //--- Tratamento para localizar o Curso e a Turma

       $IdCurso = $_GET['op1'];
       $IdTurma = $_GET['op2'];
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
                   echo "    <li class='w3-large w3-text-black'><b/>MODULO PARA INDICAÇÃO DE INSTRUTOR</b></li>";
                      for ($i = 1; $i <= 40; $i++) { echo "    <li class='w3-large'>&nbsp</li>"; }
                   echo "    <li class='w3-medium'><a class='w3-btn w3-blue w3-ripple' href='ListarTurmas.php'>VOLTAR</a></li>";
               ?>
               </ul> 
            </div>			
			
            <br/>		


            <?php 
                //--- Tratamento para Verificar se a Turma tem PTS

                $sql_Comando="Select count(1) as Qtd
                              From pts_principal P, pts_semana s
                              Where p.IdPTS = s.IdPTS
                              and   p.IdCurso = $IdCurso
                              and   p.IdTurma = $IdTurma";

                //echo $sql_Comando;
                $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
                $Comando=ibase_fetch_assoc($Res_sql_Comando);

                if ($Comando[QTD] == 0) {
                   echo "<ul class='nav nav-pills nav-fill'>";
                   echo "    <li class='w3-large w3-text-black'><b/>O Curso selecionado não possuí PTS, verifique junto ao administrador de PTS</b></li>";
                   echo " </ul>";
                   echo "<br/> ";
                   echo "<br/> ";
                }
                else {
                   //--- Identificação do Curso 

                   $sql_Comando="Select codcurso
                                 From Curso c, Turma t
                                 Where c.IdCurso = t.IdCurso
                                 and   c.IdCurso = $IdCurso
                                 and   t.IdTurma = $IdTurma";

                   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
                   $Query_Curso=ibase_fetch_assoc($Res_sql_Comando);


                   echo "<ul class='nav nav-pills nav-fill'>";
                   echo "    <li class='w3-large w3-text-black'><b/>Modulo de indicação de instrutor para o curso: $Query_Curso[CODCURSO]</b></li>";

                   echo " </ul>";
                   echo "<br/> ";
                   echo "<table class='w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card'>";

                   echo "<thead class='w3-2019-galaxy-blue'>";
                   echo "<tr> ";
                   echo "<th class='cabec_Center' scope='col'>TRABALHO ESCOLAR</th>";
                   echo "<th class='cabec_Center' scope='col'>Nº INDICADOS</th>";
//                   echo "<th class='cabec_Center' scope='col'>INDICAR INSTRUTOR</th>";
                   echo "</tr>";
                   echo "</thead>";

                   $Trab_escolar_Anterior= 'xx';
 
                   $sql= " select distinct p.IdCurso, p.IdTurma, p.IdPTS, s.IdSemana, s.Dia_Semana, s.Trab_escolar
                           From pts_principal P, pts_semana s
                           Where p.IdPTS = s.IdPTS
						   and   s.Disciplina is not null
                           and   p.IdCurso = $IdCurso
                           and   p.IdTurma = $IdTurma
                           Order by s.Trab_escolar
                         ";
//   echo "$sql";
                   $Res_sql_relacionado=ibase_query($conexao,$sql);
                   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
                   {
                      if ($Trab_escolar_Anterior <> $relacionado[TRAB_ESCOLAR]) {

                         $Trab_escolar_Anterior= $relacionado[TRAB_ESCOLAR];
						 
						 //-- Pega a quantidade de instrutores indicados
                         echo "<tr>";
						 
//                         $sql= " select Count(*) as QTD_I
//                                 From pts_indicacao
//                                 Where IdPTS = 31
//                                 and   trab_escolar = '$relacionado[TRAB_ESCOLAR]'
//                                 and   indicado_por = '$Localidade'
//                               ";
//   echo "$sql <br>";							   
//                         $Res_Qtd=ibase_query($conexao,$sql);
//                         $Indicados=ibase_fetch_assoc($Res_sql_Comando);
//   echo "$Indicados[QTD]";
                         echo "   <td  name IdCurso style='display:none'>" . $relacionado[IDCURSO] . "</td>";
                         echo "   <td  name IdTurma style='display:none'>" . $relacionado[IDTURMA] . "</td>";
                         echo "   <td  name IdPTS style='display:none'>" . $relacionado[IDPTS] . "</td>";
                         echo "   <td  name IdSemana style='display:none'>" . $relacionado[IDSEMANA] . "</td>";
                         echo "   <td  name Horario style='display:none'>" . $relacionado[DIA_SEMANA] . "</td>";
                         echo "   <td class='td_cabec_Center' name Trab_Escolar>" . $relacionado[TRAB_ESCOLAR] . "</td>";
//                         echo "   <td class='td_cabec_Center' name QtdIndicacao>" . $Indicados[QTD_I] . "</td>";
                         echo "  <td class='td_cabec_Center'><a class='w3-btn w3-blue w3-ripple w3-text-white' href='InstrutorIndicado.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$relacionado[IDPTS]."&op4=".$relacionado[IDSEMANA]."&op5=".$relacionado[DIA_SEMANA]."&op6=".$relacionado[TRAB_ESCOLAR]."' role='button' type='submit' formmethod='post'>Indicar Instrutor</a></td>";
                         echo "</tr>";
                      } 
                   }

                }  // if

            ?>
		</tbody>
   	      </table>			
	</div>
    </body>

    <?php include_once("../Funcoes/rodape.php");  ?>
</html>