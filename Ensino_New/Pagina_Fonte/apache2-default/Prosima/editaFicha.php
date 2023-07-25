<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'GET' ) {
	echo "ACESSO RESTRITO";
	header('Location: index.php');  
    exit();
}
include("Funcoes/verifica_sessao.php");
include("Funcoes/conecta.inc");

$_SESSION[aval]=$_POST[idATCO].'|'.$_POST[idExercicio].'|'.$_SESSION[idCurso].'|'.$_SESSION[idTurma];
$_SESSION[idATCO] = $_POST[idATCO];
$_SESSION[idExercicio]=$_POST[idExercicio];
$_SESSION[idFicha]=$_POST[idFicha];


?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link rel="stylesheet" type="text/css" href="estilos/estilo.css"  />
<link rel="shortcut icon" type="image/ico" href="image/favicon_icea.ico" >
<script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>

</head>
<body>
<?
include('cabec.inc');
?>

<titulo >FICHA DE AVALIAÇÃO PROSIMA</titulo>

<div class="menu-vertical button voltar" style="right:100px !important">VOLTAR</div>
<div  class="button menu-vertical" onClick="verificando()">ENVIAR</div>

<div id="conteudo" >
<?
include('indentifTurma.php');
?>
	<div class="etiqueta" style="margin-top:10px; margin-bottom:10px;">
	<div style="width:80%">Aluno: <b><?=$_POST[nomeAluno]?></b></div>
	<div style="width:15%;">Estagi&aacute;rio: <b><?=$_POST[estagiario]?></b></div>
	<div style="width:30%;">Exerc&iacute;cio: <b><?=$_POST[idExercicio] ?></b></div>
	<div style="width:30%;">Dt. Avalia&ccedil;&atilde;o: <b><?= $_POST[dtAval] ?></b></div>
	<div style="width:30%;">Local: <b><?= $_POST[local] ?></b></div>
</div>
<form name="form2" >
<table class="itens" cellpadding="0" cellspacing="0"  >
<thead>
	<tr><th rowspan="2" >ITEM DE AVALIA&Ccedil;&Atilde;O</th><th colspan="5">ATRIBUI&Ccedil;&Atilde;O DE GRAU</th></tr>
</thead>
<tbody>
<?php
      $sql= "Select *
              From pr_avaliacao
              Where IDCURSO = $_SESSION[idCurso]
                     and IDTURMA = $_SESSION[idTurma]
                     and ID_FICHA = $_POST[idFicha]
                     and ID_ATCO = '$_SESSION[idATCO]'
                     and Id_EXERCICIO = $_POST[idExercicio]
              Order By Id_Item, Id_Avl";
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
		  $nota=6;
		  if     ($relacionado[NA]    ==1) $nota=1;
		  elseif($relacionado[NS]     ==1) $nota=2;
		  elseif($relacionado[REGULAR]==1) $nota=3;
		  elseif($relacionado[BOM]    ==1) $nota=4;
		  elseif($relacionado[OTIMO]  ==1) $nota=5;
		  
        echo "<tr coment='".$relacionado[ID_ITEM]." - ".$relacionado[DESCRICAO]."' >
				<td >&nbsp;$relacionado[DESCRICAO] <input type='hidden' name='$nome' value='$nota'></td>
				<td class='nota ";
		if($relacionado[OTIMO]==1){ echo " atribuido";}
		echo "' refer='5'></td><td class='nota ";
		if($relacionado[BOM]==1){ echo " atribuido";}
		echo "' refer='4'></td><td class='nota ";
		if($relacionado[REGULAR]==1){ echo " atribuido";}
		echo "' refer='3'></td><td class='nota ";
		if($relacionado[NS]==1){ echo " atribuido";}
		echo "' refer='2'></td><td class='nota ";
		if($relacionado[NA]==1){ echo " atribuido";}
		echo "' refer='1'></td></tr>";
      }
   echo "</tbody></table><br /><b>Coment&aacute;rios:</b><br /><br />";
   
   $sql= "Select PARECER
              From CAD_FICHA_AVL
              Where IDCURSO = $_SESSION[idCurso]
                     and IDTURMA =$_SESSION[idTurma]
                     and ID_FICHA=$_POST[idFicha] 
                     and ID_ATCO =  '$_SESSION[idATCO]'
                     and Id_EXERCICIO = $_SESSION[idExercicio]";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $relacionado= ibase_fetch_assoc($Res_sql_relacionado);
   $binfo = ibase_blob_info($relacionado['PARECER']);
   $bopen = ibase_blob_open($relacionado['PARECER']);

?>
<textarea name="parecer" rows="10" style="width:100%; resize:none; margin-bottom:700px;"><?=ibase_blob_get($bopen, $binfo[0])?></textarea>
 <input  name='completa'  type='hidden'>
 <input  name='nsatisfatorio' type='hidden'>
</form>
</div>

</body>
</html>
<script >


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
	$('[name=parecer]').text("");
	$.each($('.atribuido[refer=2]'),function(){
		$('[name=parecer]').text($('[name=parecer]').text()+$(this).closest('tr').attr('coment')+"\n\n")
	})
})

function verificando() {
	if($('td[refer=2]').filter('.atribuido').length>0) $('input[name=nsatisfatorio]').val('S');
	else $('input[name=nsatisfatorio]').val('N');
	if($('tbody tr .nota').length/5==$('.atribuido').length) {
		$('input[name=completa]').val('S');
		enviaDados();
	} else if(window.confirm("Não avaliou todos os itens, deseja continuar?")) {
		$('input[name=completa]').val('N');
		enviaDados();
	}
}

function enviaDados () {
	$.post('montaEditaFicha.php',$('form[name=form2]').serialize(),function(resp){
		if(resp.merro=="") {
//			alert('DADOS ALTERADOS COM SUCESSO');
			$('.voltar').trigger('click');
		} else {
			alert(resp.merro)
		}
	},'json')
}
</script >

