<?php
   session_start();
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/verifica_sessao.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;" />
<title>.: SISTEMA DE GERENCIAMENTO DO ENSINO :.</title>
<link href="menu_esq.css" rel="stylesheet" type="text/css" />
<script src="../SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css" />

<script>
function enviar(curso,turma)
{
  var curso;
  window.location.href = "ListaDeAvaliacoes.php?curso="+curso+"&turma="+turma;
}

</script>
</head>
<body>
<div id="corpo">
<BR>
<p>&nbsp;</p>
<div align="center">
<form name="form1" method="POST" action="ListaDeAvaliacoes.php">
<?php

   echo "<div>";
   echo "<p class= 'style3'>Escolha o Curso desejado e em seguida a Ficha!</p>";
   echo "</br>";

   //---
   //--- Inicia a lista de Curso
   
   $sql_Curso = "Select Distinct c.IdCurso, c.CodCurso
                 From Curso c, fc_avaliacao fc
                 where ( c.idcurso = fc.idcurso )
                 order by c.CodCurso";
   $ResCurso = ibase_query($conexao, $sql_Curso);

   echo "<div>";
   echo "<ul id='MenuBar1' class='MenuBarVertical'>";
   
   $i = 0;
   while ($dado_Curso=ibase_fetch_assoc($ResCurso))
   {
       echo"<li><a class='MenuBarItemSubmenu' href='#' name='curso')'> $dado_Curso[CODCURSO]</a>";

      //---
      //--- Cria a Sub-Lista de Turma

      $sql_Turma = "Select Distinct a.IdTurma, t.Turma, t.Ano
                    From fc_avaliacao a, Turma t
                    where a.idcurso = $dado_Curso[IDCURSO]
                    and (a.idcurso = t.idcurso and a.idturma = t.idTurma)";
      $ResTurma = ibase_query($conexao, $sql_Turma);

      echo " <ul> ";
      while($dado_Turma=ibase_fetch_assoc($ResTurma))
      {
          echo "<li><a href='#' name='turma' onClick='enviar($dado_Curso[IDCURSO],$dado_Turma[IDTURMA])'>Turma $dado_Turma[TURMA] de $dado_Turma[ANO]</a></li>";
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

   $_SESSION[idCurso] =$dado_Curso[IDCURSO];
   $_SESSION[idTurma] =$dado_Curso[IDTURMA];

?>

</body>
</html>
