<?php
   require_once("conecta.inc");
   session_start();
   require_once("verifica_sessao.php");
?>
   <html>
   <head>
   <title>Lista de Cursos</title>
   <meta http-equiv='refresh' content='text/html;'  />
   <link href="apc.css" rel="stylesheet" type="text/css">

   <script language="JavaScript" type="text/javascript">
   //Função que deixa options "turma" invisiveis
   function funi()
   {
         var elem = document.getElementsByName('turma').length;

           while(elem>0){
           elem --;
           document.getElementsByName('turma')[elem].style.visibility='hidden';
           }
   }
    //--------------------------------

   //Função que marca options "turma"
   function fun(i)
   {
           document.getElementsByName('turma')[i].checked=true;
   }
    //--------------------------------

   //Funcão para validar dados
    function verify(nome)
    {
    var test = false;
    var objRadio = document.forms[0].elements[nome];

    for(i=0; i < objRadio.length; i++ ) {
        if (objRadio[i].checked == true) test = true;
    }
    if (test == false){ alert("Selecione um curso!");}
    else{document.form1.submit();}
    }
    
    //--------------------------------
   </script>
   </head>
   
   <body onload="funi()">
   <div id="logol">
   <p><img src="image/brasao.gif" alt="ICEA" /></p>
   </div>
   <div id="titulo" class="BODY">INSTITUTO DE CONTROLE DO ESPAÇO AÉREO</div>
   <div id="titulo" class="BODY">AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>
   <p>&nbsp;</p>
   <div align="center">
   <form name="form1" method="POST" action="MostraGrafico.php">

   <?php

   $sql_Disciplinas = "Select a.IdCurso, a.IdTurma, c.CodCurso, c.NomeCurso, t.codTurma, t.Turma, t.Ano
                    From Curso c, apc_agenda a, Turma t
                    where a.idcurso = c.idCurso
                    and (a.idcurso = t.idcurso and a.idturma = t.idTurma  )";
   $ResDisciplinas = ibase_query($conexao, $sql_Disciplinas);
     // and a.idcurso = r.idcurso and a.idturma = r.idTurma
       //, apc_respdisciplina r
   echo "<div>";
   echo "<p class= 'style3'>Escolha o Curso desejado!</p>";
   echo "<table border= '1' width='200' cellspacing='0' cellpadding='0' class='style3'  >";
   echo "<tr bgcolor='#CCCCCC'><td>Curso</td><td>Turma</td><td>Ano</td></tr>";
   

   $i = 0;
   while ($dado=ibase_fetch_assoc($ResDisciplinas))
      {

   
   echo "<tr><td><input type='radio' name='curso' id='$i' value='$dado[IDCURSO]' onclick = 'fun($i)'>
                 <input type='radio' name='turma' id='$i' value='$dado[IDTURMA]'>

                 $dado[CODCURSO]</td><td>$dado[TURMA]</td><td>$dado[ANO]</td>
         </tr>";

   $i++;
      }
   echo "</table>";
   
   echo "<input type='radio' name='grafico' id='grafico' value='bars' checked>";
   echo "<img src='image/barra.gif' width='30' height='30' border='0'>";
   echo "<input type='radio' name='grafico' id='grafico' value='pie'>";
   echo "<img src='image/pizza.gif' width='30' height='30' border='0'>";
   echo "</br>";
   echo "<select name='questionado'>
         <option>Aluno</option>
         <option>Chefe</option>
         </select>";
   echo "</div>";

   ?>


   <input type='button' name='enviar' value='Montar Gráfico' onclick ="verify('curso')">
   </form>
   </div>
   </body>
   </html>
