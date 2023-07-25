<?php
   session_start();
   require_once("verifica_sessao.php");
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link  href="dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" type="text/css" rel="stylesheet" media="screen">
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="Funcoes/validarFormulario.js"></script>
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Informação da Nova Ficha de Avaliação - Prosima</title>
</head>

<body>

<a href="Sel_Avaliacao.php" title="Cancela a Inserção da Nova Ficha de Avaliação" target="_self" class="button2" >Voltar</a>
<div id="bt_sup"><input type="button" value="Enviar" class="button" onclick="if(valida($('#form1'))) $('#form1').submit();" ></div>

<form id="form1" name="form1" method="POST" action="montarFicha.php"  >
<div align="center" id="topo"><img src="image/topo.png"></div><BR>
<div align='center'>INFORMÇÃOES DA NOVA FICHA DE AVALIAÇÃO - PROSIMA </div><BR>
<p>&nbsp;</p>

<div id="corpo">
<br>
<div id="conteudo">
<?php
   $sql= "Select  ID_ATCO, ESTAGIARIO
          From pr_estagiario
          Where id_ATCO = $_SESSION[idATCO]";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $relacionado=ibase_fetch_assoc($Res_sql_relacionado);
?>
   
<input name='estagiario' value='S' type='checkbox'>Estagiário <br><br>
ATCO: <br>
<select name='listaAluno' class='requerido' id='conteudo' >
<option value="" >--- Selecione o ATCO</option>

<?

   //--- Tratamento da Combo de Selecao do Aluno:

   $sql= "Select IdCurso, IdTurma, NumOrdem, NomeCompleto, NomeGuerra,  Identidade,  PostoGraduacao, IdUnidade, IdSubUnidade
          From Aluno_Turma_VIEW
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";

   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       echo "<option value= '$relacionado[NOMECOMPLETO]|$relacionado[IDENTIDADE]' > $relacionado[NOMECOMPLETO]</option>";
   }
   echo "</select>";
   echo "<BR>";

   //--- Tratamento da Combo de Selecao do Instrutor:

   $sql= "Select IdCurso, IdTurma, CodigoInstrutor, NomeCompleto, NomeGuerra,  Identidade,  PostoGraduacao, IdUnidade, IdSubUnidade
          From Instrutor_Turma_VIEW
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";
		  
?>
  <BR />
  Instrutor: <br />
  <select name='listaInstrutor' class='requerido' id='conteudo'>
  <option value=""  >--- Selecione o Instrutor</option>
<?
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       echo "<option value= '$relacionado[IDENTIDADE]' > $relacionado[NOMECOMPLETO]</option>";
   }
?>
</select>
<BR>
<BR>
   Exercício <input name="exercicio" type='text' size='20' value='' class="numero1" >
<BR>
<BR>
Data da Avaliação <input name='data' value='' class="dataValida" onfocus="displayCalendar(document.forms[0].data,'dd.mm.yyyy',this)" type='text' size='20' >
<BR>
Local da Avaliação <input name='local' type='text' class="requerido" size='20' value='ICEA'><BR>


</div>
</div>
</form>
</body>

</html>

