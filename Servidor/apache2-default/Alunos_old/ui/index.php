<?php
   session_start();
   require_once("../../Funcoes/Funcoes.php");
   require("../../Funcoes/conecta.inc");

?>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>ABAS</title>
<link rel="stylesheet" href="abas1.css" type="text/css">
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

</head>

<body>



<div class="TabControl"> 
	<div id="header"> 
    	<ul class="abas"> 
        	<li> 
            	<div class="aba"> 
                	<span>PTS - Plano Trabalho Semanal</span> 
                </div> 
            </li> 
            <li> 
            	<div class="aba"> 
                	<span>Informações do Aluno</span> 
                </div> 
            </li> 
            <li> 
            	<div class="aba"> 
                	<span>Visualização da Prova</span> 
                </div> 
            </li> 
            <li> 
            	<div class="aba"> 
                	<span>Questões</span> 
                </div> 
            </li> 
        </ul> 
    </div> 

    <div id="content"> 
    	<div class="style1"> 
           <?php
                $sql_Configuracao="Select nome, divisao, subdivisao From configuracao";
                $Res_Configuracao=ibase_query($conexao,$sql_Configuracao);
                $Configuracao=ibase_fetch_assoc($Res_Configuracao);

                echo "<p><strong><center>INSTITUTO DE CONTROLE DO ESPA�O A�REO</br>
                                         SE��O DE EXECU��O DE CURSOS</br>
                         $Configuracao[SUBDIVISAO]</strong></center></p>";
           ?>



        	<p><strong>CURSO: </strong>TOP-002 - SUPERVISÃO TÉCNICA DO SISTEMA X-4000 APP</p> 
            <p><strong>PROVA: </strong>001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>DATA: </strong> 17/04/2015</p> 
            <p><strong>TOTAL DE QUESTÃO: </strong>40</p> 
        </div> 

        <div class="conteudo"> 
        	<p><strong>Nome: </strong>Sandra Siqueira</p> 
            <p><strong>RG: </strong>173346078</p> 
        </div> 
        <div class="conteudo"> 
            
            <p> <strong>6. De acordo com o áudio o voo está:</strong></p>
    
            <p>a) 3 horas atrasado.</p>
            <p>b) 4 horas atrasado.</p>
            <p>c) 5 horas atrasado.</p>

            
            <p>&nbsp;</p>
        </div> 
        <div class="conteudo"> 
        	        <div class="botoes">
        	<h3 align="center">Questões</h3>
            <p>Clique sobre o número da questão que deseja responder.</p>
            <p>
        	<?php
                $numQuestoes=45;
                $contBt=0;
                for ($i=1; $i<=$numQuestoes; $i++)
                {
                    if($contBt>4)
                    {
                        $contBt=1;
                        echo "<br>";
                    }
                    else
                        $contBt++;
                    
                    echo "<input type='button' value='".$i."' onclick='newPage($i)' class='button'/> ";
                }
            ?>
        	</p>
            <p><script> document.write(new Date()) </script> </p>
        
        
        </div>
        <div class="questao">Questao </div>
        <div class="rodape">rodape</div>

        </div> 
    </div> 
</div>

</body>
</html>
