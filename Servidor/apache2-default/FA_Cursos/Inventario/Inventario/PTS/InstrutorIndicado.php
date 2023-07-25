<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                          //
   //                                                                               //
   // PRGRAMA                   : InsrutorIndicado.php                              //
   //                                                                               //
   // DESCRICAO                 : Modulo respons�vel por mostrar os instrutores     //
   //                             indicados.                                        //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             :                                                   //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       Respons�vel Ensino) : Ten Padilha                                       //
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

       $IdCurso      = $_GET['op1'];
       $IdTurma      = $_GET['op2'];
       $IdPTS        = $_GET['op3'];
       $IdSemana     = $_GET['op4'];
       $DiaSemana    = $_GET['op5'];
       $Trab_Escolar = $_GET['op6'];
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

    <!-- Tratamento para excluir -->

    <script type="text/javascript">
       function confirmacao(id) {
         var 
             resposta = confirm("Deseja excluir a indica��o selecionada ?");

            if (resposta == true) {     
                window.location.href = "ExcluirInstrutor.php?op1="+id;
            }
       }
    </script>

  </head>

  
  <body>
    <div class="w3-top">
      
    <?php include_once("../Funcoes/cabecalho.php");  ?>

	  
    <div class="w3-main w3-padding">        
        <div class="w3-center">
           <ul class="nav nav-pills nav-fill">
               <?php 
                   echo "    <li class='w3-large w3-text-black'><b/>RELA��O DE INSTRUTORES INDICADOS</b></li>";
                   for ($i = 1; $i <= 46; $i++) { echo "    <li class='w3-large'>&nbsp</li>"; }
                   echo "    <li class='w3-medium'><a class='w3-btn w3-blue w3-ripple' href='ListarPTS.php?op1=".$IdCurso."&op2=".$IdTurma."'>Voltar</a></li>";
               ?>
            </ul> 
        </div>			
				
        <?php 

//echo "IdCurso $IdCurso <br>";
//echo "IdTurm $IdTurma  <br>";
//echo "IdPTS $IdPTS    <br>";
//echo "IdSemana $IdSemana  <br>";
//echo "DiaSemana $DiaSemana  <br>";
//echo "Trab_Escolar $Trab_Escolar <br>";

                //--- Tratamento para pegar os cursos que est�o habilitados para indica��o de instrutor

                $sql="Select count(1) as Qtd
                              From Curso c, Turma t
                              Where c.IdCurso = t.IdCurso
                              and   c.IdCurso = $IdCurso
                              and   t.IdTurma = $IdTurma";

                //echo $sql_Comando;
                $Res_sql=ibase_query($conexao,$sql);
                $Resultado=ibase_fetch_assoc($Res_sql);

                if ($Resultado[QTD] == 0) {
                   echo "<ul class='nav nav-pills nav-fill'>";
                   echo "    <li class='w3-large w3-text-black'><b/>O Curso selecionado n�o possu� PTS, verifique junto ao administrador de PTS</b></li>";
                   echo " </ul>";
                   echo "<br/> ";
                   echo "<br/> ";
                }
                else {
                   //--- Identifica��o do Curso 

                   $sql_Comando="Select codcurso,
                                        turma,
                                        CAST(EXTRACT(DAY FROM datainicio) || '/' || EXTRACT(MONTH FROM datainicio) || '/' || EXTRACT(YEAR FROM datainicio) AS varchar(10)) AS DataInicio,
                                        CAST(EXTRACT(DAY FROM datatermino) || '/' || EXTRACT(MONTH FROM datatermino) || '/' || EXTRACT(YEAR FROM datatermino) AS VARCHAR(10)) AS datatermino
                                 From Curso c, Turma t
                                 Where c.IdCurso = t.IdCurso
                                 and   c.IdCurso = $IdCurso
                                 and   t.IdCurso = $IdCurso
                                 and   t.IdTurma = $IdTurma";

//   echo "$sql_Comando";

                   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
                   $Query_Curso=ibase_fetch_assoc($Res_sql_Comando);

                   echo "<ul class='nav nav-pills nav-fill'>";
                   echo "    <li class='w3-large w3-text-black'><b/>INSTRUTORES INDICADOS PARA O CURSO: $Query_Curso[CODCURSO]    <br> 
                                                                    TURMA: $Query_Curso[TURMA] de $Query_Curso[DATAINICIO] a $Query_Curso[DATATERMINO] <br>
                                                                    DISCIPLINA: $Trab_Escolar</b></li>";

                   echo " </ul>";
                   echo "<br/> ";
                   echo "<table class='w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card'>";

                   //--- Apesenta��o do cabecalho

                   echo "<thead class='w3-2019-galaxy-blue'>";
                   echo "<tr> ";
             //       echo "<th class='cabec_Center' scope='col'>IDENTIDADE</th>";
                   echo "<th class='cabec_Center' scope='col'>POSTO GRADUA��O</th>";
                   echo "<th class='cabec_Center' scope='col'>NOME GUERRA</th>";
                   echo "<th class='cabec_Center' scope='col'>UNIDADE</th>";
                   echo "<th class='cabec_Center' scope='col'>STATUS</th>";
                   echo "  <td class='td_cabec_Center'><a class='w3-btn w3-blue w3-ripple w3-text-white' href='SelecionarInstrutor.php?op1=".$IdCurso."&op2=".$IdTurma ."&op3=". $IdPTS."&op4=".$IdSemana ."&op5=".$DiaSemana ."&op6=".$Trab_Escolar."' role='button' type='submit' formmethod='post'>Selecionar Instrutor</a></td>";

                   echo "</tr>";
                   echo "</thead>";

                   $sql= "Select distinct PI.idpts, PI.idsemana, PI.Dia_Semana, PI.idinstrutor, PI.trab_escolar, PE.PostoGraduacao, PE.NomeGuerra, PE.idunidade, PI.status, PI.ID
                          From PTS_Indicacao PI, pts_semana PS, Pessoa PE
                          where PI.idpts = PS.idpts
                          and   PI.idsemana = PS.idsemana
                          and   PI.Dia_Semana = PS.Dia_Semana
                          and   PI.Trab_Escolar = PS.Trab_Escolar
                          and   PI.idinstrutor = PE.Identidade
                          and   PS.IdPTS = $IdPTS
						  and PI.indicado_por = '$Localidade'
                          and   PS.Trab_Escolar = '$Trab_Escolar'";
						  
  //  echo "$sql";
                   $Res_sql_Instrutor=ibase_query($conexao,$sql);
                   while($relacionado=ibase_fetch_assoc($Res_sql_Instrutor))
                   {
                      echo "<tr>";
                         echo "   <td name IdPTS style='display:none'>" . $relacionado[IDPTS] . "</td>";
                         echo "   <td name IdSemana style='display:none'>" . $relacionado[IDSEMANA] . "</td>";
                         echo "   <td name IdSemana style='display:none'>" . $relacionado[ID] . "</td>";
                         echo "   <td name Id_Instrutor style='display:none'>" . $relacionado[IDINSTRUTOR] . "</td>";
                         echo "   <td class='td_cabec_Center' name PostoGraduacao>" . rtrim($relacionado[POSTOGRADUACAO]) . "</td>";
                         echo "   <td class='td_cabec_Center' name nomeguerra>" . $relacionado[NOMEGUERRA] . "</td>";
                         echo "   <td class='td_cabec_Center' name unidade>" . $relacionado[IDUNIDADE] . "</td>";
                         echo "   <td class='td_cabec_Center' name status>" . $relacionado[STATUS] . "</td>";

                         if ( $Localidade == 'ICEA') {
                            echo "  <td class='w3-border'><a class='w3-btn w3-green w3-ripple w3-text-white' href='TratarStatus.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$relacionado[IDPTS]."&op4=".$relacionado[IDSEMANA]."&op5=".$relacionado[IDINSTRUTOR]."&op6= 1' role='button' type='submit' formmethod='post'>Selecionado</a></td>";
                            echo "  <td class='w3-border'><a class='w3-btn w3-blue  w3-ripple w3-text-white' href='TratarStatus.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$relacionado[IDPTS]."&op4=".$relacionado[IDSEMANA]."&op5=".$relacionado[IDINSTRUTOR]."&op6= 2' role='button' type='submit' formmethod='post'>Indicado</a></td>";
                         }
  			    echo "<td class='w3-border'><a class='w3-btn w3-red w3-ripple w3-text-white' href='javascript:func()' onclick='confirmacao(". $relacionado[ID] .")'>Excluir</a></td>";

                      echo "</tr>";

                   }

                }  // if

            ?>
		</tbody>
   	      </table>			
	</div>
    </body>
    <?php include_once("../Funcoes/rodape.php");  ?>

