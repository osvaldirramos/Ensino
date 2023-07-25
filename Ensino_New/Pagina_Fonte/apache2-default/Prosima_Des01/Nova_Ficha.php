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
<script type="text/javascript" src="dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="Funcoes/validarFormulario.js"></script>
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Informa��o da Nova Ficha de Avalia��o - Prosima</title>
<script type="text/javascript">


</script>
</head>

<body>
<form name="form1" method="POST" action="montarFicha.php" onSubmit="return validaForm();" >
<div align="center" id="topo"><img src="image/topo.png"></div><BR>
<div align='center'>INFORM��OES DA NOVA FICHA DE AVALIA��O - PROSIMA </div><BR>
<p>&nbsp;</p>

<div id="corpo">
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center">

   </td>
   <td width="192" align="center">
        <a href="Sel_Avaliacao.php" title="Cancela a Inser��o da Nova Ficha de Avalia��o" target="_self" >
        <img src="image/Cancelar.png" border="0" width="25" height="25" /> Voltar</a></td>
  </tr>
 </table>
<br>
<div id="conteudo">

<?php
   $sql= "Select  ID_ATCO, ESTAGIARIO
          From pr_estagiario
          Where id_ATCO = $_SESSION[idATCO]";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $relacionado=ibase_fetch_assoc($Res_sql_relacionado);
   echo "<input name='estagiario' value='S' type='checkbox'>Estagi�rio <br><br>";

   //--- Tratamento da Combo de Selecao do Aluno:

   $sql= "Select IdCurso, IdTurma, NumOrdem, NomeCompleto, NomeGuerra,  Identidade,  PostoGraduacao, IdUnidade, IdSubUnidade
          From Aluno_Turma_VIEW
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";

   echo "ATCO: <br>";
   echo "<select name='listaAluno' class='caixa' id='conteudo' >";
   echo "<option >--- Selecione o ATCO</option>";

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
   echo "<BR>";
   echo "Instrutor: <br>";
   echo "<select name='listaInstrutor' class='caixa' id='conteudo''>";
   echo "<option >--- Selecione o Instrutor</option>";

   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       echo "<option value= '$relacionado[IDENTIDADE]' > $relacionado[NOMECOMPLETO]</option>";
   }
   echo "</select>";
?>
<BR>
<BR>
   Exerc�cio <input name="exercicio" type='text' size='20' value='' onkeyup="validaExercicio()"><BR>
<BR>
<BR>
Data da Avalia��o <input name='data' value='' onfocus="displayCalendar(document.forms[0].data,'dd.mm.yyyy',this)" type='text' size='20' onkeyup="validaData()"><BR>
<BR>
Local da Avalia��o <input name='local' type='text' size='20' value='ICEA'><BR>
<BR>
<input type="submit" value="Enviar" class="button" onclick="return validaForm()" >
</div>
</div>
</form>
</body>

</html>

