<?php
session_start();
include("Funcoes/verifica_sessao.php");
include("Funcoes/conecta.inc");

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="estilos/estilo.css"  />
<link rel="stylesheet" type="text/css" href="estilos/jquery-ui-custom.css">
<link rel="shortcut icon" type="image/ico" href="image/favicon_icea.ico" >
<script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" language="JavaScript" src="js/jquery-ui-custom-zip.js"></script>
<script language="javascript" type='text/javascript' src="js/masc.js"></script>

<title>Informação da Nova Ficha de Avaliação - Prosima</title>
</head>

<body>
<?
include('cabec.inc');

?>

<titulo >INFORMA&Ccedil;&Otilde;ES DE FICHA DE AVALIA&Ccedil;&Atilde;O NOVA - PROSIMA</titulo>

<div class="menu-vertical button voltar" style="right:100px !important">VOLTAR</div>
<div  class="button menu-vertical" onClick="enviar()">ENVIAR</div>

<div id="conteudo">
<?
include('indentifTurma.php');
?>

<form name="form1" >
<div class="etiqueta" style="margin-top:10px; margin-bottom:10px;">
 <div >Aluno: <br /> <select name='ID_ATCO' class="newFicha requerido" onchange="$('input[name=NOMECOMPLETO]').val($('select[name=ID_ATCO] option:selected').text()); $('input[name=ESTAGIARIO]').val($('select[name=ID_ATCO] option:selected').attr('estag')) ;$(this).removeClass('error')" onclick="$(this).removeClass('error')" >
 	<option value='' >--- Selecione o Aluno -----</option>
<?
   $sql= "Select NOMECOMPLETO, IDENTIDADE, ESTAGIARIO
          From ALUNOTURMA
          Where IDCURSO = $_SESSION[idCurso]
          and IDTURMA = $_SESSION[idTurma]";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       echo "<option value= '$relacionado[IDENTIDADE]' estag='$relacionado[ESTAGIARIO]' >$relacionado[NOMECOMPLETO]</option>";
   }
?>
</select>
<input name="NOMECOMPLETO" type="hidden" />
<input name="ESTAGIARIO" type="hidden" />
<input  name='FICHACOMPLETA'  type='hidden'>
<input  name='NS' type='hidden'>
</div>
<div>Exerc&iacute;cio:<br /><input name="ID_EXERCICIO" type='text' size='4' class="newFicha requerido" onfocus="$(this).removeClass('error')"></div>
<div>Dt. Avalia&ccedil;&atilde;o:<br /> 
<input name='DATA_AVL' class="data newFicha" type='text' size='9' onFocus="$(this).removeClass('error')"></div>
<div>Local da Avalia&ccedil;&atilde;o:<br /><input name='LOCAL' type='text' size='9' value='ICEA' class="newFicha requerido" onfocus="$(this).removeClass('error')"></div>
</div>
<table class="itens" cellpadding="0" cellspacing="0"  >
<thead>
	<tr><th rowspan="2" >ITEM DE AVALIA&Ccedil;&Atilde;O</th><th colspan="5">ATRIBUI&Ccedil;&Atilde;O DE GRAU</th></tr>
</thead>
<tbody>
<?php
       $sql= "Select ID_ITEM, ID_AVL, AREA_AVALIACAO,DESCRICAO
              From FICHA_ITEM_VIEW
              Where ID_FICHA = 1
              Order By ID_ITEM, ID_AVL";
//		echo $sql;
      $Res_sql_relacionado=ibase_query($conexao,$sql);
	  $id_item="";
      while($relacionado=ibase_fetch_assoc($Res_sql_relacionado)) {
          $nome=trim(trim($relacionado[ID_ITEM]).trim($relacionado[ID_AVL]));
		  if($id_item!=$relacionado[ID_ITEM]) {
			  $id_item=$relacionado[ID_ITEM];
			  echo ' <tr class="tit_areaAval"><td ><span>'. $relacionado[ID_ITEM]." - </span><span>".$relacionado[AREA_AVALIACAO]."</span></td>
			  <td width='5%'>&Oacute;ti.</td><td width='5%'>Bom</td><td width='5%'>Reg.</td><td width='5%'>NS</td><td width='5%'>NA</td></tr>";
		  }
		  
        echo "<tr coment='".$relacionado[ID_ITEM]." - ".$relacionado[DESCRICAO]."'  >
				<td >&nbsp;$relacionado[DESCRICAO] <input type='hidden' name='$nome' value='6'></td>
				<td class='nota' refer='5'></td>
				<td class='nota' refer='4'></td>
				<td class='nota' refer='3'></td>
				<td class='nota' refer='2'></td>
				<td class='nota' refer='1'></td>
			</tr>";
      }
   echo "</tbody></table><br /><b>Coment&aacute;rios:</b><br /><br />";
?>
<textarea name="PARECER" rows="10" style="width:100%; resize:none; margin-bottom:700px;" ></textarea>

</form>
</div>

</body>

</html>

<script >
var msie =  navigator.appName == 'Microsoft Internet Explorer'?1:0;

var hoje = new Date();
hoje = hoje.getFullYear()+""+((hoje.getMonth()+1)<10 ? 0+""+(hoje.getMonth()+1):(hoje.getMonth()+1))+""+(hoje.getDate()<10? 0+""+hoje.getDate():hoje.getDate());

var filters = {
	'requerido': function(el) {return ($(el).val() != "" && $(el).val() != 'null' && $(el).val() != 'undefined') ;},    
	'nome': function(el) {return /^[a-z. &A-Z0-9\xC0-\xC4\xC7-\xCA\xCC\xCD\xD1-\xDC\xE0-\xE4\xE7-\xEA\xEC\xED\xF0-\xF5\xF9\xFA]{3,}$/.test($(el).val());},   
	//data normal e pode ser anterior a data de hoje - só verifica se é válida
	'data':function(el){return (/^((0?[1-9]|[12]\d)\/(0?[1-9]|1[0-2])|30\/(0?[13-9]|1[0-2])|31\/(0?[13578]|1[02]))\/(19|20)?\d{2}$/.test($(el).val()))}  
}

function datainvert(val){
	return val.substring(6)+val.substring(3,5)+val.substring(0,2);
}

function dataForm(val){
	return val.substring(8)+"/"+val.substring(5,7)+"/"+val.substring(0,4);
}

function valida(elemento){   
	 if (elemento.each(function(){
		if (typeof filters == 'undefined') return true;
		var classe = msie ? "className" : "class";
		$(this).find("input, textarea, select").each(function(x,el){
			if ($(el).attr(classe) != 'undefined' ) {
				$(el).removeClass("error");
				$.each(new String($(el).attr(classe)).split(" "), function(x, klass){
						if ($.isFunction(filters[klass]))
							if (!filters[klass](el)) $(el).addClass("error");
				});
			}
		});
	}).find(".error").length > 0) {
		alert('CAMPOS EM VERMELHO\nSÃO OBRIGATÓRIOS\ne/ou\nESTÃO INADEQUADOS');
		return false;
	}
	else return true;
};

$(function() {
	$(".data").datepicker({
	  changeMonth: true,
	  changeYear: true,
	  numberOfMonths: 1,
	  onSelect: function(){$(this).removeClass('error');}
	});
	
});
$(function($) {
$('.data').mask('99/99/9999',{completed:function(){$(this).nextfocus();}});
});

$.fn.nextfocus = function () {
	return this.each ( function () {
		var fields = $(this).closest('form').find("button,input[class!=multickb],textarea,select") ;
		var index = fields.index(this) ;
		if ( (index>-1) && ((index+1) < fields.length) )  { fields.eq(index+1).focus();}
		return false ;
	}) ;
}


$('.error').on('focus',function() {$(this).removeClass('error');});
$('.error').on('blur',function() {$(this).removeClass('error');});
$('.error').on('click',function() {$(this).removeClass('error');});


$('#conteudo').css('width',($(window).width()-60));
$('.etiqueta').css('left',($('#conteudo').width()-$('.etiqueta').width())/2);
$('.voltar').click(function(){location.href='Sel_Avaliacao.php';})

$('.nota').click(function() {
	if($(this).hasClass('atribuido')) {
		 $(this).removeClass('atribuido');
		 $(this).closest('tr').find('input').val(6);
	} else {
		$(this).addClass('atribuido').siblings('.nota').removeClass('atribuido');
		$(this).closest('tr').find('input').val($(this).attr('refer'));
	}
	$('[name=PARECER]').text("");
	$.each($('.atribuido[refer=2]'),function(){
		$('[name=PARECER]').text($('[name=PARECER]').text()+$(this).closest('tr').attr('coment')+"\n\n")
	})

})

function enviar() {
	if(valida($('#conteudo'))) {
		if($('td[refer=2]').filter('.atribuido').length>0) $('input[name=NS]').val('S');
		else $('input[name=NS]').val('N');
		if($('tbody tr .nota').length/5==$('.atribuido').length) {
			$('input[name=FICHACOMPLETA]').val('S');
			enviaDados();
		} else if(window.confirm("Não avaliou todos os itens, deseja continuar?")) {
			$('input[name=FICHACOMPLETA]').val('N');
			enviaDados();
		}
	}
}


function enviaDados () {
	$.post('montarFicha.php',$('form[name=form1]').serialize(),function(resp){
		if(resp.merro!="") { alert(resp.merro);}
		$('.voltar').trigger('click');
	},'json')
}

</script>

