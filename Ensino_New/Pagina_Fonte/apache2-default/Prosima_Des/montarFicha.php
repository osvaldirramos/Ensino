<?php
session_start();
if(!session_is_registered('ident')) {
	session_destroy();
	header("Location: index.php");
	end;	
}
//$idCurso = $_SESSION['idCurso'];   			
//$idTurma = $_SESSION['idTurma'];   			
//$idATCO = $_POST['idATCO'];
$idFicha = $_POST['idFicha'];
//$idExercicio = $_POST['idExercicio'];
//$dtAval = $_POST['dtAval'];



//list( $_SESSION[nomeAluno],$_SESSION[idATCO]) = explode("|", $_POST[listaAluno]);
//$_SESSION[idInstrutor] = $_POST[listaInstrutor];
//$_SESSION[estagiario] =  $_POST[estagiario];
//$_SESSION[local]= $_POST[local];


//require_once("Dados_Ficha.php");

function montaFicha($idFicha)
{
  include("conecta.inc");
  $sql= "Select Id_Ficha, Id_Item, Id_Avl, Area_Avaliacao, Descricao
		  From Ficha_Item_View
		  Where Id_Ficha = $idFicha
		  Order By Id_Item, Id_Avl";
  $Res_sql_relacionado=ibase_query($conexao,$sql);
  $linha ="";
  while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
  {
	  $linha = "<tr><form tabela='CAD_FICHA_AVAL'>
		<td class='c1'>".$relacionado[ID_ITEM]."</td>
		<td>".utf8_encode($relacionado[AREA_AVALIACAO])."</td>
		<td>".utf8_encode($relacionado[DESCRICAO])."<input name='' type='hidden'></td>
		<td class='c1 xx' nota='4' ><input class='nota' name='nota' type='hidden'></td>
		<td class='c1 xx' nota='3'></td>
		<td class='c1 xx' nota='2'></td>
		<td class='c1 xx' nota='1'></td>
		<td class='c1 xx' nota='0'></td></form>
		</tr> ";
		echo $linha;
  }
}
?>

<table id="tab_aval">
    <thead>
        <tr>
            <th width='5%'>ITEM</tH>
            <th width='25%'>&Aacute;REA DE AVALIA&Ccedil;&Atilde;O</th>
            <th >DESCRI&Ccedil;&Atilde;O</th>
            <th width='7%'>&Oacute;TIMO</th>
            <th width='7%'>BOM</th>
            <th width='7%'>REGULAR</th>
            <th width='7%'>NS</th>
            <th width='7%'>NA</th>
        </tr>
    </thead>
<tbody>
<? montaFicha(1);?>
</tbody>
</table>
<form>
  <textarea name="parecer" rows="10" cols="100"></textarea>
  <input name='fCompleta' value='' type='hidden' >
  <input name='ns' value='' type='hidden' >
</form>
<script type="text/javascript">
function verificando() {
	if($('input.nota').filter(function(){ return $(this).val() == 'ns' }).length) $('input[name=ns]').val('S');
	else $('input[name=ns]').val('N');
	
	if($('.xx_marcado').length!=$('tab_aval tbody tr').length) {
		if(!confirm("Não avaliou todos os itens, deseja continuar?")) {
			$('input[name=fCompleta]').val('N');
			return true;
		}
	} else {
		$('input[name=fCompleta]').val('S');
		return true;
	}
	return false;
}
$('.xx').click(function(){ $(this).addClass('xx_marcado').siblings('td').removeClass('xx_marcado').parent().find('[name=nota]').val($(this).attr('nota'))})
</script>
