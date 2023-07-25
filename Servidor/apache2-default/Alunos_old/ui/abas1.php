<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>ABAS</title>
<link rel="stylesheet" href="abas1.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                	<span>Informações da Avaliação</span> 
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
    	<div class="conteudo"> 
        	<p><strong>CURSO: </strong>TOP-002 - SUPERVISÃO TÉCNICA DO SISTEMA X-4000 APP</p> 
            <p><strong>PROVA: </strong>001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>DATA: </strong> 17/04/2015</p> 
            <p><strong>TOTAL DE QUESTÃO: </strong>40</p> 
        </div> 
        <div class="conteudo"> 
        	<p><strong>Nome: </strong>Sandra Siqueira</p> 
            <p><strong>RG: </strong>173346078</p> 
        </div> 
        <div class="conteudo"> 
            <p> <strong>1. Ouça o audio e assinale V para verdadeiro e F para falso.</strong></p>
            <p>(       ) O avião MD-82 decolou de Madrid às 13:55.</p>
            <p>(       ) O motor da direita pegou fogo.</p>
            <p>(       ) 72 pessoas estavam a bordo.</p>
            <p>(       ) O avião caiu em uma área deserta.</p>
            <p>(       ) Após a decolagem o avião percorreu apenas 200 pés. </p>
    
            <p>a) V,F,F,F,V.</p>
            <p>b) F,F,F,V,V.</p>
            <p>c) F,F,F,F,V.</p>
             
            <p> <strong>2.	Em que aeroporto a repórter Kelly Wallace está transmitindo a notícia?</strong></p>
            <p>a) JFK Airport, New York.</p>
            <p>b) La Guardia, New York.</p>
            <p>c) Newark, New York.</p>
             
            <p> <strong>3.	O que a empresa "Airbus" espera das companhias aéreas e seus clientes, em sua nova etapa?</strong></p>
            <p>a) Mais reservas de assentos.</p>
            <p>b) Que todos gostem do que poderão ver.</p>
            <p>c) Novos horários de vôos.</p>
             
            <p> <strong>4.	Entre as comodidades possíveis de serem customizadas na aeronave, temos:</strong></p>
            <p>a) Áreas de boliche e banheiras com água quente.</p>
            <p>b) Cassino e loja "Duty Free".</p>
            <p>c) Bar, banheiros com janela e suítes na primeira classe.</p>
             
            <p> <strong>5.	Quanto custa, em média, a aeronave?</strong></p>
            <p>a) 330 milhões de dólares.</p>
            <p>b) 300 milhões de dólares.</p>
            <p>c) 303 milhões de dólares.</p>
             
            <p> <strong>6. De acordo com o áudio o voo está:</strong></p>
    
            <p>a) 3 horas atrasado.</p>
            <p>b) 4 horas atrasado.</p>
            <p>c) 5 horas atrasado.</p>
             
            <p> <strong>7.	Quantas crianças estavam no compartimento de carga? E qual era a duração do voo?</strong></p>
            <p>a) 102 crianças; 2 horas e 30 minutos de voo.</p>
            <p>b) 120 crianças; 2 horas e 30 minutos de voo.</p>
            <p>c) 122 crianças; 2 horas e 50 minutos de voo.</p>
            
            <p> <strong>8.	De acordo com o áudio qual é o problema da aeronave? </strong></p>
    
            <p>a) a turbina do avião está em chamas.</p>
            <p>b) o compartimento de carga está sem porta.</p>
            <p>c) a porta do compartimento de carga está aberta.</p>
             
            <p> <strong>9.	Para desarmar o dispositivo de evacuação movimente a alavanca de controle para armar ...  </strong></p>
            <p>a) completamente para cima.</p>
            <p>b) completamente para baixo.</p>
            <p>c) completamente para o lado.</p>
             
            <p> <strong>10.	Para evitar movimento inadvertido da alavanca de controle é necessária...  </strong></p>
            <p>a) a retirada do pino de segurança.</p>
            <p>b) a instalação do pino de segurança.</p>
            <p>c) a troca do pino de segurança.</p>
            
            <p> <strong>11.	Para desarmar o dispositivo de evacuação movimente a alavanca de controle para armar ...  </strong></p>
            <p>a) completamente para cima.</p>
            <p>b) completamente para baixo.</p>
            <p>c) completamente para o lado.</p>
             
            <p> <strong>12.	Para evitar movimento inadvertido da alavanca de controle é necessária...  </strong></p>
            <p>a) a retirada do pino de segurança.</p>
            <p>b) a instalação do pino de segurança.</p>
            <p>c) a troca do pino de segurança.</p>
            
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
