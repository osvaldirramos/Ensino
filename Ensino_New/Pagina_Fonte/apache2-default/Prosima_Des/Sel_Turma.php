<?php
session_start();
if(!session_is_registered('ident')) {
	session_destroy();
	header("Location: index.php");
	end;	
}
$ident =$_SESSION['ident'];				
$guerra = $_SESSION['guerra'];
$idCurso = $_SESSION['idCurso'];   			
$sql= "Select AA.*,BB.DESCRICAO,BB.TURMA,BB.ANO 
		from INSTRUTOR_TURMAS_VIEW AS AA 
		LEFT JOIN TURMA AS BB ON (AA.IDTURMA = BB.IDTURMA) 
		WHERE AA.IDENTIDADE='".$ident."' 
		AND AA.NOMEGUERRA='".$guerra."' 
		AND BB.STATUS<>'P' 
		AND AA.IDCURSO=".$idCurso." 
		ORDER BY BB.IDTURMA;";
		
require_once("conecta.inc");

$RES=ibase_query($conexao,$sql);

while($turma=ibase_fetch_assoc($RES)) {
	$opEscolhida.= '<tr><td id_turma= "'.$turma[IDTURMA].'" class="turma">  
						<li>'.utf8_encode($turma[TURMA]).' - '.utf8_encode($turma[ANO]).' - '.utf8_encode($turma[DESCRICAO]).' </li>
					</td></tr>';
}

echo "<table>".$opEscolhida."</table>"; ?>

<script>
$('.turma').click(function(){
	$('titulo').html('RELA&Ccedil;&Atilde;O DE FICHAS DE AVALIA&Ccedil;&Atilde;O');
	$('#cmd_extra,#pnl_extra').show();
	$('#corpo').load('Sel_Avaliacao.php?idTurma='+$(this).attr('id_turma')+"&idCurso="+<? echo $idCurso; ?>);
})
</script>
