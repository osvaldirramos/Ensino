<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>ABAS</title>
<link rel="stylesheet" href="divQ.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-control" content="no-cache">

</head>

<body>
    <div class="geral">
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
</body>
</html>
