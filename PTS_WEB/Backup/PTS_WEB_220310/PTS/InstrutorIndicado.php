<?php

   //-------------------------------------------------------------------------------//
   // NOME DO PROJETO           : SGEW_WEB                                          //
   //                                                                               //
   // PRGRAMA                   : SelecionarInsrutorphp                             //
   //                                                                               //
   // DESCRICAO                 : Modulo responsável por selecionar instrutores(s). //
   //                                                                               //
   // EQUIPE DO DESENVOLVIMENTO :                                                   //
   //       Gerente             :                                                   //
   //       Analista)           : Osvaldir Donizetti Ramos                          //
   //       Programador(es)     : Osvaldir Donizetti Ramos                          //
   //       ResponsÃ¡vel Ensino) : Ten Padilha                                      //
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
       $IdPTS = $_GET['op3'];
       $IdSemana = $_GET['op4'];
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
             resposta = confirm("Deseja excluir a indicação selecionada (ID: "+id+") ?");

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
                   echo "    <li class='w3-large w3-text-black'><b/>RELAÇÃO DE INSTRUTORES INDICADOS</b></li>";
                   echo "    <li class='w3-large'>&nbsp</li>";
                   echo "    <li class='w3-large'>&nbsp</li>";
                   echo "    <li class='w3-large'>&nbsp</li>";
                   echo "    <li class='w3-medium'><a class='w3-btn w3-blue w3-ripple' href='ListarPTS.php?op1=".$IdCurso."&op2=".$IdTurma."'>Voltar</a></li>";
               ?>
            </ul> 
        </div>			
			
        <br/>		


        <?php 
                //--- Tratamento para pegar os cursos que estão habilitados para indicação de instrutor

                $sql_Comando="Select count(1) as Qtd
                              From Curso c, Turma t
                              Where c.IdCurso = t.IdCurso
                              and   c.IdCurso = $IdCurso
                              and   t.IdTurma = $IdTurma";

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

                   $sql_Comando="Select codcurso, turma
                                 From Curso c, Turma t
                                 Where c.IdCurso = t.IdCurso
                                 and   c.IdCurso = $IdCurso
                                 and   t.IdTurma = $IdTurma";

   echo "$sql_Comando";

                   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
                   $Query_Curso=ibase_fetch_assoc($Res_sql_Comando);

                   //--- Identificação da Disciplina

                   $sql_Comando="Select s.IdPTS, s.IdSemana, s.Dia_Semana, s.Trab_escolar
                                 From  pts_semana s
                                 Where s.IdPTS = $IdPTS
                                 and   s.IdSemana= $IdSemana";

                   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
                   $Query_Disciplina=ibase_fetch_assoc($Res_sql_Comando);

                   echo "<ul class='nav nav-pills nav-fill'>";
                   echo "    <li class='w3-large w3-text-black'><b/>INSTRUTORES INDICADOS PARA O CURSO: $Query_Curso[CODCURSO] <br> 
                                                                    TURMA: $Query_Curso[TURMA]<br> 
                                                                    DISCIPLINA: $Query_Disciplina[TRAB_ESCOLAR]	</b></li>";

                   echo " </ul>";
                   echo "<br/> ";
                   echo "<table class='w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card'>";

                   //--- Apesentação do cabecalho

                   echo "<thead class='w3-2019-galaxy-blue'>";
                   echo "<tr> ";
                   echo "<th class='cabec_Center' scope='col'>IDENTIDADE</th>";
                   echo "<th class='cabec_Center' scope='col'>POSTO GRADUAÇÃO</th>";
                   echo "<th class='cabec_Center' scope='col'>NOME GUERRA</th>";
                   echo "<th class='cabec_Center' scope='col'>UNIDADE</th>";
                   echo "<th class='cabec_Center' scope='col'>STATUS</th>";
                   echo "  <td class='td_cabec_Center'><a class='w3-btn w3-blue w3-ripple w3-text-white' href='SelecionarInstrutor.php?op1=".$IdCurso."&op2=".$IdTurma ."&op3=". $IdPTS."&op4=".$IdSemana ."' role='button' type='submit' formmethod='post'>Selecionar Instrutor</a></td>";

                   echo "</tr>";
                   echo "</thead>";


                   $sql= "Select distinct PE.idpts, PE.idsemana, PE.idinstrutor, PE.postograduacao, PE.nomeguerra, PE.unidade, PE.status, PE.ID
                          From pts_Indicacao PE, pts_semana PS
                          where PE.idpts = PS.idpts
                          and   PE.idsemana = PS.idsemana
                          and   PS.IdPTS = $IdPTS
                          and   PE.IdSemana= $IdSemana
                          and   PS.IdSemana= $IdSemana";
                   $PTS= 3;
//   echo "$sql";
                   $Res_sql_Instrutor=ibase_query($conexao,$sql);
                   while($relacionado=ibase_fetch_assoc($Res_sql_Instrutor))
                   {
                      echo "<tr>";
                         echo "   <td  name IdPTS style='display:none'>" . $PTS . "</td>";
                         echo "   <td  name IdSemana style='display:none'>" . $relacionado[IDSEMANA] . "</td>";
                         echo "   <td  name IdSemana style='display:none'>" . $relacionado[ID] . "</td>";
                         echo "   <td class='td_cabec_Center' name Id_Instrutor>" . $relacionado[IDINSTRUTOR] . "</td>";
                         echo "   <td class='td_cabec_Center' name PostoGraduacao>" . rtrim($relacionado[POSTOGRADUACAO]) . "</td>";
                         echo "   <td class='td_cabec_Center' name nomeguerra>" . $relacionado[NOMEGUERRA] . "</td>";
                         echo "   <td class='td_cabec_Center' name unidade>" . $relacionado[UNIDADE] . "</td>";
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

