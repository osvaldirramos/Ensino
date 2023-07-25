<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : FAC_MontaPagina.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a p�gina de entrada das
  //                             respostas dos alunos da Ficha de Avalia��o de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Ten Marcela
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 06/09/2019
  //
  //----------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------

  require_once("../Funcoes/Funcoes.php");
  $f= new Funcao();

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
	header('location:../ex.php');
    }
   
    if(!isset($_SESSION["idCurso"]) ) {
	session_unset ();
	session_destroy();
	header('location:index.php');   }
    else   {
       $IdCurso = $_SESSION['idCurso'];
       $IdTurma = $_SESSION['idturma'];

       //--- Tratamento para localizar o Curso e a Turma
//       $IdTurma      = $_GET['op2'];
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
     
<link rel="stylesheet" href="estilos/abas1.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Cache-control" content="no-cache">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#content div:nth-child(1)").show();
		$(".abas li:first div").addClass("selected");
		$(".aba").click(function(){
			$(".aba").removeClass("selected");
			$(this).addClass("selected");
			var indice = $(this).parent().index();
			indice++;
			$("#content div").hide();
			$("#content div:nth-child("+indice+")").show();
		});

		$(".aba").hover(
			function(){$(this).addClass("ativa")},
			function(){$(this).removeClass("ativa")}
		 );
	});
</script>

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
                      echo "    <li class='w3-large w3-text-black'><b/>RELAÇÃO DE INSTRUTORES: </b></li>";
                      for ($i = 1; $i <= 20; $i++) { echo "    <li class='w3-large'>&nbsp</li>"; }
                      echo "    <li class='w3-medium'><a class='w3-btn w3-blue w3-ripple' href='InstrutorIndicado.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$IdPTS."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."'>Voltar</a></li>";
                      echo "    <br>";
                  ?>
               </ul> 

               <ul class="nav nav-pills nav-fill">
                  <?php 
                      echo "    <br>";
                      echo "    <li class='w3-large w3-text-black'><b/>PARA A DISCIPLINA: $Trab_Escolar</b></li>";
                  ?>
               </ul> 
           </div>

           <?php 
                   //--- Identificação da Turma

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
                   echo "    <li class='w3-large w3-text-black'><b/>CURSO: $Query_Curso[CODCURSO]    <br> 
                                                                    TURMA: $Query_Curso[TURMA] de $Query_Curso[DATAINICIO] a $Query_Curso[DATATERMINO] <br></li>";

                   echo " </ul>";
                   echo "<br/> ";


               echo "<br/> ";
               echo "<table class='w3-table w3-centered w3-hoverable w3-responsive w3-striped w3-card'>";

               //--- Apresentação do cabecalho

               echo "<thead class='w3-2019-galaxy-blue'>";
                  echo "<tr> ";
                      echo "<th class='cabec_Center' scope='col'>POSTO GRADUAÇÃO</th>";
                      echo "<th class='cabec_Center' scope='col'>NOME GUERRA</th>";
                  echo "</tr>";
               echo "</thead>";

               $sql= "Select IdCurso, IdTurma, Identidade, PostoGraduacao, NomeGuerra
                      From Instrutor_Turma_View
                      Where IdCurso = $IdCurso
                      and   IdTurma = $IdTurma
                      order by PostoGraduacao, NomeGuerra";
					  
//                  echo "$sql </br>";
               echo "<form id='Form_Perguntas' name='Form_Perguntas' method='post' action='indicar.php'>";

               $Contador=0;				

               $Res_sql_Instrutor=ibase_query($conexao,$sql);
               while($relacionado=ibase_fetch_assoc($Res_sql_Instrutor))
               {
                  $Contador++;
                  $radio = $Itens['IDTOPICO'];

                  echo "<table style:border-bottom:0.5px solid #FFFFF0; border='1' cellspacing='0' cellpadding='0' width='1070' class='caixa'>
                     <tr>
                        <td width='400'><table border='0' cellspacing='0' cellpadding='0' width='400'>
                        <tr>
                           <td width='23' align='Left'><input type='radio' name='$Contador' id='radio6' value='0 $relacionado[IDENTIDADE]' /></td>
                           <td width='60' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>-> $relacionado[POSTOGRADUACAO] $relacionado[NOMEGUERRA] </span></td>
                         </tr>
                      </table></td>
                     </tr>
                  </table>";
   
//                   echo "<tr>";
//                   echo "   <td  name IdPTS style='display:none'>" . $relacionado[IDLOCALIDADE] . "</td>";
//                   echo "   <td  name Identidade style='display:none'>". $relacionado[IDENTIDADE] . "</td>";
//                   echo "   <td class='td_cabec_Center' name PostoGraduacao>" . $relacionado[POSTOGRADUACAO] . "</td>";
//                   echo "   <td class='td_cabec_Center' name nomeguerra>" . $relacionado[NOMEGUERRA] . "</td>";
                   //echo "   <td class='td_cabec_Center' name unidade>" . $relacionado[UNIDADE] . "</td>";
                   echo "  <td class='td_cabec_Center'><a class='w3-btn w3-green w3-ripple w3-text-white' href='IndicarInstrutor.php?op1=".$IdCurso."&op2=".$IdTurma."&op3=".$IdPTS."&op4=".$IdSemana."&op5=".$DiaSemana."&op6=".$Trab_Escolar."&op7=".$relacionado[IDENTIDADE]."' role='button' type='submit' formmethod='post'>Indicar</a></td>";
//                   echo "</tr>";
               }

           ?>

       </div>
	</div>
    </body>

</form>

<script>

//------------------------------------------------------------------------------------------------------------------------------------------
//Funcoes que verificam se radios foram clicados

function verificaFORM1()
{
    var ok=0;
	var Sel=0;
	<?php echo"var Nb = $Contador;
               var Ficha = $_SESSION[idFicha];";
    ?>

       for (i=0;i<document.Form_Perguntas.elements.length;i++)
       {
  		  if(document.Form_Perguntas[i].type=="radio")
		 	if(document.Form_Perguntas[i].checked==true)
				Sel++;
	   }

	   if(Sel != Nb)
	 	  ok=0;
  	   else
	 	  ok=1;

    	return ok;
}


function verificando()
{
//    var P1=verificaFORM1();

		  alert('Certifique-se de que respondeu todas questões!');

//	if(P1 == 1 )
//    {

//      document.Form_Perguntas.submit();
    //  document.form_Complemento.submit();
    //}
//    else
//    {
//  	   if(P1 == 0 )
//		  alert('Certifique-se de que respondeu todas questões!');
//    }

}
//FIM - Fun??es que verificam se radios foram clicados
</script>



<img src='../image/indicar.png' name='enviar_consulta' id='enviar_consulta' onclick="verificando();"/>
</div>

    <?php include_once("../Funcoes/rodape.php");  ?>
</html>