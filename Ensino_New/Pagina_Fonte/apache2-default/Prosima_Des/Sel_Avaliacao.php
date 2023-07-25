<?php
session_start();
if(!session_is_registered('ident')) {
	session_destroy();
	header("Location: index.php");
	end;	
}
require_once("conecta.inc");
$ident 		=	$_SESSION['ident'];				
$guerra 	= 	$_SESSION['guerra'];   	
$idCurso 	=	$_SESSION['idCurso'];
$idTurma 	=	$_GET['idTurma'];
$_SESSION['idTurma'] = $idTurma;	
			
$sql_Comando= "Select Turma,
			  DataInicio,
			  DataTermino,
			  Coordenador
			  From Turma
			  Where IdCurso = ".$idCurso."
			  and IdTurma = ".$idTurma;
$Res_sql_Comando=ibase_query($conexao,$sql_Comando);
$dados=ibase_fetch_assoc($Res_sql_Comando);

$di = $dados[DATAINICIO];
$dti = substr($di,8,2)."/".substr($di,5,2)."/".substr($di,0,4);
$df = $dados[DATATERMINO];
$dtf = substr($df,8,2)."/".substr($df,5,2)."/".substr($df,0,4);

$Turma= $dados[TURMA];
?>
<table align='center' cellpadding='0' cellspacing='0' id="identTurma">
    <tr>
        <td width=10%>Turma:</td><td width=60%><b><? echo  utf8_encode($dados[TURMA]); ?></b></td>
        <td width=13%>In&iacute;cio:</td><td ><b><? echo $dti; ?></b></td>
    </tr>
    <tr>
        <td>Coord.:</td><td><b><? echo utf8_encode($dados[COORDENADOR]); ?></b></td>
        <td>T&eacute;rmino:</td><td><b><? echo $dtf; ?></b></td>
    </tr>
</table>


<table id="tb_avaliadas" > 
	<thead>
    	<tr>
        	<th width="5%">Exerc.</th> 
            <th width="64%">Nome do Aluno Avaliado</th> 
            <th width="13%">Dt.<br /> Avali&ccedil;&atilde;o</th>  
            <th width="13%">Ficha<br />Completa</th>
            <th width="5%">Excluir</th> 
        </tr>
    </thead>
    <tbody>
        
<?
   $sql="Select IDCURSO,
                IDTURMA,
                ID_FICHA,
                ID_ATCO,
                ID_AVL,
                ID_EXERCICIO,
                ID_INSTRUTOR,
                NOMECOMPLETO,
                DATA_AVL,
                FICHACOMPLETA,
                LOCAL
         From CAD_FICHA_AVL
          Where IdCurso = ".$idCurso."
          and IdTurma = ".$idTurma." order by NOMECOMPLETO ASC, ID_EXERCICIO ASC;";
   $Res_sql_relacionado=ibase_query($conexao,$sql);

   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))  {
		$dv = $relacionado[DATA_AVL];
		$dval = substr($dv,8,2)."/".substr($dv,5,2)."/".substr($dv,0,4);
		$relacionado[FICHACOMPLETA]=$relacionado[FICHACOMPLETA]=="N"? 'SIM':'<span style=" font-weight:bold; font-style:italic; font-size:20px;"> N&Atilde;O</span>';
		echo '<tr ident="idFicha='.$relacionado[ID_FICHA].'&idATCO='.$relacionado[ID_ATCO].'&idExercicio='.$relacionado[ID_EXERCICIO].'&dtAval='.$dval.'" >
             <td class="c1 e1" >'.$relacionado[ID_EXERCICIO].'</td>
             <td class=" e1" >'.utf8_encode($relacionado[NOMECOMPLETO]).'</td>
             <td class="c1 e1">'.$dval.'</td>
             <td class="c1 e1">'.$relacionado[FICHACOMPLETA].'</td>
             <td class="c1 exclusao"></td>
			 </tr>';
   }
?>
</tbody>
</table>








<script>
/////// deletar fichas 
$('.exclusao').click(function(){
	var item = $(this).closest('tr');
	//item.css('background-color',"#DDAA3A");
	if(confirm('Confirma DELETAR a AVALIACAO de\n\n'+item.children(':eq(1)').html())) {
		item.remove();
		$.post('excluiFicha.php',item.attr('ident'), function (res) {
			var txt = '';
			$.each(res,function(tx,val) {
				if(!val[1]) { txt += "\n "+tx+" : "+val[0];};
			})
			if(txt.length>0) alert('EXCLUS&Atilde;O NÃO REALIZADA\n NAS TABELAS\n\n'+txt);
			else alert('EXCLUSAO COM SUCESSO!!!!');
		},'json')
	}
})
$('#div_avaliacao').click(function(){
		$('#pnl_extra').animate({
		width: 0
	  }, 300, function() {
		// Animation complete.
	  });
})
$('.e1').mousedown(function(e){
	var x = e.pageX;
	var y = e.pageY;
	//alert("posx="+x+"..................posy="+y)
	$('#ediex').css('top',(y-25)+"px").css('left',(x-70)+"px").show();
	$(this).closest('tr').addClass('selecionado');
	
/*	
	
	
	
	
	$('.apontado').removeClass('apontado');
	$(this).siblings('td:last').toggleClass('exclusao').siblings('td:first').addClass('apontado').closest('tr').toggleClass('apont_tr').siblings('tr').toggle();
	
	$('#pnl_extra').animate({
		width: 0
	  }, 300, function() {
		// Animation complete.
	  });

	var variaveis= $(this).closest('tr').attr('ident').replace(/\s/g,"%20");
	$('#div_avaliacao').toggle().load('montarFicha.php?'+variaveis);
	
	
*/
	
	
//	$.each($('#div_avaliadas td'),function(){
//		var conteudo = $('#tab_aval tbody td:eq(0)').text();
//		var linhas = $('#tab_aval td').filter(function(index) {
//			return $(this).text() == conteudo;
//		}).remove().length; 
//		$(this).attr('rowspan',linhas);
//	})
	
})
//
$('#ediex').mouseup( function(){
	$('#ediex').hide();
	$('.selecionado').removeClass('selecionado')
}).mouseout( function(){
	$('#ediex').hide();
})

</script>
