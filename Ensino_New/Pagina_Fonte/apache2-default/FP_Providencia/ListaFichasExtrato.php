<?php
   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;" />
<title>.: SISTEMA DE GERENCIAMENTO DO ENSINO :.</title>
<link href="menu_esq.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />

<script>
function enviar(curso,turma)
{
  var curso;
  var grafico;
  //var questionado = document.form1.questionado[document.form1.questionado.selectedIndex].value;

  if(document.getElementById("bars").checked)
  {
     grafico = "bars";
  }
  else
  {
     grafico = "linepoints";
  }
  window.location.href = "ListaDeAvaliacoesExtrato.php?curso="+curso+"&turma="+turma+"&grafico="+grafico;
}

</script>
</head>

<body>
<div id="corpo">
<br>
<p>&nbsp;</p>
<div align="center">
<form name="form1" method="POST" action="ListaDeAvaliacoesExtrato.php">

<?php

   echo "<div id='titulo' class='BODY'>Extrato de Curso</div>";
   echo "</br>";

   echo "<div>";
   echo "<p class= 'style3'>Escolha o Curso desejado e em seguida a Ficha!</p>";
   echo "<input type='radio' name='grafico' id='bars' value='bars' checked>";
   echo "<img src='../imagem/barra.gif' width='30' height='30' border='0'>";
   echo "<input type='radio' name='grafico' id='line' value='line'>";
   echo "<img src='../imagem/line.png' width='30' height='30' border='0'>";
   echo "</br>";

   //---
   //--- Inicia a lista de Curso
   
   $sql_Curso = "Select Distinct c.IdCurso, c.CodCurso
                 From Curso c, fa_avaliacao fa
                 where ( c.idcurso = fa.idcurso )
                 order by c.CodCurso";
   $ResCurso = ibase_query($conexao, $sql_Curso);

   echo "<div>";
   echo "<ul id='MenuBar1' class='MenuBarVertical'>";
   
   $i = 0;
   while ($dado_Curso=ibase_fetch_assoc($ResCurso))
   {
       echo"<li><a class='MenuBarItemSubmenu' href='#' name='curso')'> $dado_Curso[CODCURSO]</a>";

      echo " <ul> ";
      echo "<li><a href='#' name='turma' onClick='enviar($dado_Curso[IDCURSO])'>Emitir Relatório</a></li>";
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

   $_SESSION[idCurso] =$dado_Curso[IDCURSO];

?>
<br><br><br><br>
</body>
</html>
