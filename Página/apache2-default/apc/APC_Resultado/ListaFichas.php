<?php
   require_once("Funcoes/conecta.php");
   session_start();
   require_once("verifica_sessao.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;" />
<title>Relação de Cursos</title>
<link href="menu_esq.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<link href="apc.css" rel="stylesheet" type="text/css">
<script>
function enviar(curso,turma){
  var curso;
  var grafico;
  var questionado = document.form1.questionado[document.form1.questionado.selectedIndex].value;

  if(document.getElementById("bars").checked)
  {
  grafico = "bars";
  }
  else
  {
  grafico = "pie";
  }
  window.location.href = "MostraGrafico.php?curso="+curso+"&turma="+turma+"&grafico="+grafico+"&questionado="+questionado;
}

</script>
</head>

<body>

<div id="logol">
   <div align='right'><a href='index.php' target='_self' >Sair</a></div>
   <p><img src="image/brasao.gif" alt="ICEA" /></p>
   </div>
   <div id="titulo" class="BODY">INSTITUTO DE CONTROLE DO ESPAÇO AÉREO</div>
   <div id="titulo" class="BODY">AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>

   <p>&nbsp;</p>
   <div align="center">
   <form name="form1" method="POST" action="MostraGrafico.php">

   <?php

   echo "<div>";
   echo "<p class= 'style3'>Escolha o Curso desejado!</p>";
   echo "<input type='radio' name='grafico' id='bars' value='bars' checked>";
   echo "<img src='image/barra.gif' width='30' height='30' border='0'>";
   echo "<input type='radio' name='grafico' id='pie' value='pie'>";
   echo "<img src='image/pizza.gif' width='30' height='30' border='0'>";
   echo "</br>";
   echo "<select name='questionado'>
         <option value='Aluno'>Aluno</option>
         <option value='Chefe'>Chefe</option>
         </select>";

   //---
   //--- Inicia a lista de Curso
   
   $sql_Curso = "Select Distinct c.IdCurso, c.CodCurso
                 From Curso c, apc_agenda a
                 where ( c.idcurso = a.idcurso )
                 order by c.CodCurso";
   $ResCurso = ibase_query($conexao, $sql_Curso);

   echo "<div>";
   echo "<ul id='MenuBar1' class='MenuBarVertical' width='200'>";
   
   $i = 0;
   while ($dado_Curso=ibase_fetch_assoc($ResCurso))
   {

       echo"<li width='200'><a class='MenuBarItemSubmenu' href='#' name='curso' onClick='enviar($dado_Curso[IDCURSO],0)'>$dado_Curso[IDCURSO] - $dado_Curso[CODCURSO]</a>";

      //---
      //--- Cria a Sub-Lista de Turma


      $sql_Turma = "Select a.IdTurma, t.codTurma, t.Turma, t.Ano
                    From apc_agenda a, Turma t
                    where a.idcurso = $dado_Curso[IDCURSO]
                    and (a.idcurso = t.idcurso and a.idturma = t.idTurma  )";
      $ResTurma = ibase_query($conexao, $sql_Turma);

      echo " <ul width='200'> ";
      while($dado_Turma=ibase_fetch_assoc($ResTurma))
      {
          echo "<li width='200'><a href='#' name='turma' onClick='enviar($dado_Curso[IDCURSO],$dado_Turma[IDTURMA])'>$dado_Turma[IDTURMA]- $dado_Turma[TURMA]- $dado_Turma[ANO]</a></li>";
      }
      echo "</ul>";
      echo "</li>";
   }
   echo "</ul>";
   echo "<script type='text/javascript'>
         <!--
           var MenuBar1 = new Spry.Widget.MenuBar('MenuBar1', {imgRight:'SpryAssets/SpryMenuBarRightHover.gif'});
         //-->
         </script>";
   echo "</div>";

   ?>

</body>
</html>
