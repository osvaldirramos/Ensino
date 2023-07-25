<?php
include "../External/Funcoes/conecta.inc";
require_once("../Controller/seletor.php");

?>
<HTML>
<HEAD>
 <TITLE>Solicitação - Indicação</TITLE>
 <link href="../External/estilos/estilo.css" rel="stylesheet" type="text/css">
 <meta http-equiv="ISO-8859-1" content="IE=EmulateIE7" /><!-- /IE7 mode/ -->
 <script type="text/javascript" src="../External/Funcoes/validarFormulario.js"></script>
</HEAD>
<BODY>
<div class="container">
<?include "../Model/Login/securePage.php";?>
<br>
<form method="POST" name="principal">
<form method="POST" name="formIndicacao">
<div id="cabecalho1">
 <p id="titulo2">INDICAÇÃO</p>
</div>
<!-- div com curso, grupo de trabalho, indicação para -->
<div id="formulario2">

<table border="0" width="100%">
 <tr>
  <td>
   <p id="formularioItem1">Curso:<select size="1" id="idCurso"name="idCurso" onchange="submit()" ><option></option>
   <?foreach ($cursos as $chv){?><option value="<?=$chv[IDCURSO]?>"><?=$chv[CODCURSO];?></option><?}?></select>
   </p>
  </td>
  <td>
   <p id="formularioItem1">Grupo de Trabalho <select size="1" name="idCursoGrupo"  onchange="submit()"><option></option>
    <?foreach ($grupostrabalho as $chv){?><option value="<?=$chv[IDCURSO]?>"><?=$chv[CODCURSO];?></option><?}?></select>
   </p>
  </td>
 </tr>
 <tr>
  <td align="center"colspan="2" style='Margin:10px;padding:10px;font-size:12px' width='100'><?echo "$codCurso[CODCURSO] - $codCurso[NOMECURSO]"?><input type="hidden" size="20" id="curso" name="curso" value="<?=$codCurso[CODCURSO]?>"></td>
 </tr> </table>
 </form>
 
<form method="POST" name="formIndicacao1">
   <?if($solicitacoes!=""){?><div><table id='cabecalho2'><tr><td width='100'>Curso</td><td width='90'>Turma</td><td width='200'>Disciplina</td><td width='170'>Início</td><td width='170'>Término</td></tr></table></div>
   <?foreach ($solicitacoes as $chv){echo "<div><table id='tabela1'><tr>
   <td style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;' width='100'>$codCurso[CODCURSO]</td>
   <td style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;' width='90'>$chv[IDTURMA]</td>
   <td style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;' width='200'>$chv[DESCDISCIPLINA]</td>
   <td style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;' width='170'>";echo date('d/m/Y', strtotime($chv[DATAINICIO]));echo"</td>
   <td style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;' width='170'>";echo date('d/m/Y', strtotime($chv[DATATERMINO]));echo"<td>";?>
   <td style="border:1px dotted #6FB7FF;margin:3px;padding:5px;" width='50'><input name='turmaSelecionada' onclick="submit()" id='turmaSelecionada' " <?if($_SESSION[protocolo]==$chv[PROTOCOLO])echo "checked='CHECKED'"; ?>type='radio' value="<?=urlencode(serialize($chv))?>"/><? echo "</td></tr></table></div>";}?>  <?}?>
<tr><td></td><td>&nbsp;</td><td>&nbsp;</td>
</tr></table>
<?if($disciplinas!=""){?>
<div><table id='cabecalho2'>
<tr>
  <td width='270'>SubUnidade:</td>
  <td width='60'>Instrutor</td>
  <td width='70'>Coordenador</td>
  <td width='50'>Inst.Treinamento</td>
</tr>
</table>
<?foreach ($disciplinas as $chv ){echo "<table id='tabela1'>
<tr>
  <td width='280' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[CODDISCIPLINA] - $chv[DESCDISCIPLINA] <input name='codDisciplina' value='$chv[CODDISCIPLINA]' type='radio'";?><?if($_SESSION[codDisciplina]==$chv[CODDISCIPLINA])echo "checked='CHECKED'"; ?>  <?echo "onclick='submit()'> </td>
  <td width='60' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[QTDINSTRUTOR] </td>
  <td width='90' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[QTDCOORDENADOR] </td>
  <td width='130' style='border:1px dotted #6FB7FF;margin:4px;padding:5px;font-size:11px;'>$chv[QTDINSTRUTOR_TRN]</td>
</tr>
</table>";}?><?}?>
</div>
<br><br>

<?if($periodos!=""){?><table id='cabecalho2'><tr><td width='270'><strong><i>Períodos</i></strong></td></tr>
<tr><td width='270'>Observação</td><td width='270'>Início</td><td width='270'>Término</td></tr></table>
<?foreach ($periodos as $chv ){echo "<table id='tabela1'>
<tr>
  <td width='415' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[OBS]</td>
  <td width='415' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>"; echo date('d/m/Y', strtotime($chv[DATAINICIO])); echo"</td>
  <td width='415' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>"; echo date('d/m/Y', strtotime($chv[DATATERMINO]));?><td width='59' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;'><input type='radio' name='periodo' value="<?=urlencode(serialize($chv))?>"/></td>
<?echo "<td></tr></table>";}?>  <?}?>

<br><br>
<? if($indicacaoSelecionada!=""){foreach($indicacaoSelecionada as $chv1){}}?>

<div style="border:1px dotted #6FB7FF;margin-left:30px;margin-right:30px;padding:5px;">Adicione os indicados no formulário abaixo:</div>
<div style="border:1px dotted #6FB7FF;margin:10px;padding:5px;">
<table border="0" width="100%" id="formularioItem1">
<tr><td>Posto Graduacao</td>  <td>Nome</td><td>Nome de Guerra</td><td>Identidade</td><td>CPF</td><td>E-mail</td><td>Indicação Para</td></tr>
<tr>
<td><input type="text" size="2" name="postoGraduacao" value="<?=$chv1[POSTOGRADUACAO]?>" maxlength="8"></td>
<td><input type="text" size="30" name="nome" value="<?=$chv1[NOME]?>" maxlength="100"></td>
<td><input type="text" size="15" name="nomeGuerra" value="<?=$chv1[NOMEGUERRA]?>" maxlength="25"></td>
<td><input type="text" size="5" name="identidade" value="<?=$chv1[IDENTIDADE]?>" maxlength="20"></td>
<td><input type="text" size="10" name="cpf" value="<?=$chv1[CPF]?>" maxlength="11" OnKeyPress="return formatarNumero(this, '###########',event)"></td>
<td><input type="text" size="20" name="email" value="<?=$chv1[EMAIL]?>" maxlength="140"></td>
<td><select size="1" name="funcao"><?foreach ($qtdSolicitados as $chv ){if($chv[QTDINSTRUTOR]>0){echo'<option>Instrutor</option>';}if($chv[QTDCOORDENADOR]>0){echo'<option>Coordenador</option>';}if($chv[QTDINSTRUTOR_TRN]>0){echo'<option>Instrutor Treinamento</option>';}}?></select></td>
<td></td>
</tr>
</table>
<td><input type="hidden" size="20" name="protocolo" value="<?=$chv1[IDINDICACAO]?>"></td>

<?if($indicados!=""){?>
<div><table id='cabecalho2'>
<tr>
  <td width='70'>Curso</td>
  <td width='90'>Protocolo</td>
  <td width='180'>Nome</td>
  <td width='70'>Nome de Guerra</td>
  <td width='90'>Identidade</td>
  <td width='100'>CPF</td>
  <td width='100'>Função</td>
  <td width='100'>Inicio em</td>
</tr>
</table>
<?foreach ($indicados as $chv ){echo "<table id='tabela1'>
<tr>
  <td width='70' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$codCurso[CODCURSO] </td>
  <td width='70' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[IDINDICACAO] </td>
  <td width='180' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[POSTOGRADUACAO] $chv[NOME] </td>
  <td width='70' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[NOMEGUERRA] </td>
  <td width='80' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[IDENTIDADE] </td>
  <td width='80' style='border:1px dotted #6FB7FF;margin:3px;padding:5px;font-size:11px;'>$chv[CPF] </td>
  <td width='100' style='border:1px dotted #6FB7FF;margin:4px;padding:5px;font-size:11px;'>$chv[FUNCAO]</td>
  <td width='80' style='border:1px dotted #6FB7FF;margin:4px;padding:5px;font-size:11px;'>"; echo date('d/m/Y', strtotime($chv[DATAINICIO]));echo"</td>
  <td  width='20'><input type='checkbox' onclick='submit()' value='$chv[IDINDICACAO]' name='editar'></td>
</tr>
</table>";}?><?}?>
</div>
<div id="formularioItem1"><input type="submit" value="Salvar" name="enviar" onclick="return validaForm()"><input type="submit" value="Atualizar" name="enviar"onclick="return validaForm()"><input type="submit" value="Excluir" name="enviar" onclick="return validaFormExc()"></div>
</div>
</form>
</form>
</body>
</html>
