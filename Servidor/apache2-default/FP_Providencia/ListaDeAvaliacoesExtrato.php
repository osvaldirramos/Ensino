<?php
   ob_start();
   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
?>
<?php

      $_SESSION[idCurso] = $_GET[curso];
      $_SESSION[tipo] = $_GET[grafico];

      //--- Pega a ultima Turma
      $sql= "Select max(IdTurma) as IdTurma from Turma where IdCurso = $_SESSION[idCurso] and Status = 'E'";
//  echo "sql -> $sql";

      $Res_Turmas=ibase_query($conexao, $sql);
      $Turmas = ibase_fetch_assoc($Res_Turmas);
      
      $Turma1= $Turmas[IDTURMA];
      $Turma2= $Turmas[IDTURMA]-1;
      $Turma3= $Turmas[IDTURMA]-2;

      $_SESSION[idTurma1] =$Turma1;
      $_SESSION[idTurma2] =$Turma2;
      $_SESSION[idTurma3] =$Turma3;

//      header("Location:ExtratoCurso.php");
      header("Location:montapagina_Extrato.php");

   ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>

<script>
function popup(largura, altura){

//window.open('aluno.php','Instrutor','width='+largura+',height='+altura+',left=250,top=200');

//window.open('instrutor.php','Aluno','width='+largura+',height='+altura+',left=650,top=200');

window.open('ListaDeAvaliacoes_p.php','Relatorio','width=770,height=700,left=250,top=200,scrollbars=yes, status=yes, toolbar=no, location=yes, menubar=yes, resizable=yes ');

}

</script>
</head>
<body>
<div id="corpo">
<br>
<div id="conteudo">
<form name="form1" method="POST" action="montapagina.php">


</form>
</div>
</div>
</body>
</html>
