<?php
include "../External/Funcoes/conecta.inc";
//require_once("../Model/seletor.php");
require_once("../Controller/seletor.php");
?>
<HTML>
<HEAD>
 <TITLE>Solicitação - Indicação</TITLE>
 <link href="../External/estilos/estilo.css" rel="stylesheet" type="text/css">
 <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /><!-- /IE7 mode/ -->
 <link type="text/css" rel="stylesheet" href="../External/dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen">
 <SCRIPT type="text/javascript" src="../External/dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
</HEAD>
<BODY>
<div class="container">
<br>
<form method="POST" name="formSolicitacao">
<div id="cabecalho1">
<p id="titulo2">SOLITAÇÃO</p>
</div>
<div id="formulario2">
<p id="formularioItem1">Curso:<select size="1" name="idCurso" onchange="submit()"><option>-----</option>
 <?foreach ($cursos as $chv ){?><option value="<?=$chv[IDCURSO]?>"><?=$chv[CODCURSO];}?></option></select>
</p>
 <?if($turmas!=""){?><div><table id='cabecalho2' ><tr><td width='50'>Curso</td><td width='50'>Turma</td><td width='50'>Ano</td><td width='80'>Início</td><td width='80'>Término<td width='50'></tr></table></div><?}?>
 <?foreach ($turmas as $chv){echo "<div><table id='tabela1'><tr><td width='100'>$chv[CODCURSO]</td><td width='90'>$chv[TURMA]</td><td width='70'>$chv[ANO]</td><td width='170'>$chv[DATAINICIO]</td><td width='170'>$chv[DATATERMINO]<td><td  width='50'><input name='turmaSelecionada' id='turmaSelecionada' type='radio' value='$chv'/></td></tr></table><br></div>";}?>
<br>
</div>
</form>

<br>
<div id="cabecalho1">
 <p id="titulo2">INDICAÇÃO</p>
</div>
<div id="formulario2">
<div id="formularioItem1">Para:</div>
<div id="formularioItem1"><input type="radio" >Curso <input type="radio">Grupo de Trabalho</div><br>
<div id="formularioItem1">OM/SIAT:</div>
<div id="formularioItem1"><input type="radio">SIAT-SP<input type="radio">SIAT-MN<input type="radio">SIAT-CR<input type="radio">SRPV<input type="radio">SRPV-SP</div><br>
<div id="formularioItem1">Disciplina<select size="1">
   <option>teste</option>
</select>
Unidade<select size="1">
   <option>teste</option>
</select>
Sub-unidade<select size="1">
   <option>teste</option>
</select></div>
<form method="POST">
<div id="formularioItem1">Início <input type="text" value="" readonly name="theDate"><input type="button" value="Cal" onclick="displayCalendar(document.forms[0].theDate,'dd/mm/yyyy',this)">
   Término <input type="text" value="" readonly name="theDate2"><input type="button" value="Cal" onclick="displayCalendar(document.forms[0].theDate2,'dd/mm/yyyy',this)"> </div> </form>
<div id="formularioItem1"><select size="1">
   <option>0</option>
   <option>1</option>
   <option>2</option>
   <option>3</option>
   <option>4</option>
   <option>5</option>
   <option>6</option>
   <option>7</option>
   <option>8</option>
</select>Instrutor</div>
<div id="formularioItem1"><select size="1">
   <option>0</option>
   <option>1</option>
   <option>2</option>
   <option>3</option>
   <option>4</option>
   <option>5</option>
   <option>6</option>
   <option>7</option>
   <option>8</option>
</select>Coordenador</div>
<div id="formularioItem1"><select size="1">
   <option>0</option>
   <option>1</option>
   <option>2</option>
   <option>3</option>
   <option>4</option>
   <option>5</option>
   <option>6</option>
   <option>7</option>
   <option>8</option>
</select>Instrutor Treinamento</div>

<div id="formularioItem1">PRAZO</div>
<div id="formularioItem1"> <input id="formularioItem1" type="button" value="enviar"></div>
</div>
<br>
</div>

</BODY>
</HTML>
