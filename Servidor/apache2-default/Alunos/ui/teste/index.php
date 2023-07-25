<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Avaliação Eletronica</title>
<link rel="stylesheet" href="CSS/estilo.css" type="text/css">
<script type='text/javascript' src='http://code.jquery.com/jquery-1.5.1.min.js'></script>

<script type='text/javascript'>
$(document).ready(function(){
	$('#botoes a').live('click',function(){
		$('#questao').load($(this).attr('href'));
		return false;
	});
});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-control" content="no-cache">

</head>

<body>
    <div id="geral">
        <div id="botoes">
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
                    
                    if (($i>0) and ($i<10))
						echo "<a href='page.php?cod=$i' >0$i</a> ";
					else
						echo "<a href='page.php?cod=$i' >$i</a> ";
                }
				
            ?>
        	</p>
            <p><script> document.write(new Date()) </script> </p>
        </div>
        
        <div id="questao">Questao </div>
        
        <div class="rodape">rodape</div>
    </div>
</body>
</html>
