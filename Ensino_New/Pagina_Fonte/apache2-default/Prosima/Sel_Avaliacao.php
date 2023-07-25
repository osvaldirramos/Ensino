<?
session_start();
   
include("Funcoes/verifica_sessao.php");
include("Funcoes/conecta.inc");

if(isset($_POST[ListaDeFichas])) $_SESSION[idTurma]= $idturma = $_POST[ListaDeFichas];
   
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/ico" href="image/favicon_icea.ico" >
<script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>
<title>Relação das Fichas de Avaliação Prosima</title>

</head>
<style>
#menu_fichas td {
	padding:3px 30px 10px 30px;
}
</style>
<body>

<?
include('cabec.inc')
?>

<titulo >RELA&Ccedil;&Atilde;O DA FICHAS AVALIADAS - PROSIMA</titulo>

<div id="conteudo">
<div class="menu-vertical button sair">SAIR </div>


<table border="0" width="50%" align="center" id="menu_fichas">
  <tr>
   <td width="192" align="center" ><div class="button" title="Entre aqui com as informações da Nova Ficha de Avaliação" onclick="location.href='Nova_Ficha.php';" >NOVA FICHA</div> </td>
   <td width="192" align="center" ><div class="button" title="Voltar e selecionar outra turma" onclick="location.href='Sel_Turma.php'" >SELECIONAR TURMA</div></td>
  </tr>
 </table>
<? 


   $sql_Comando= "Select Turma,
LPAD(extract(day from DataInicio),2,'0')||'/'|| LPAD(extract(month from DataInicio),2,'0')||'/'||extract(year from DataInicio) as DataInicio,    LPAD(extract(day from DataTermino),2,'0')||'/'|| LPAD(extract(month from DataTermino),2,'0')||'/'||extract(year from DataTermino) as DataTermino,                  Coordenador
                  From Turma
          Where IdCurso = ".$_SESSION[idCurso]."
          and IdTurma = ".$_SESSION[idTurma].";";
         // echo "$sql_Comando";
   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $dados=ibase_fetch_assoc($Res_sql_Comando);
   
   $_SESSION[turma] = $dados[TURMA];
   $_SESSION[turma_dtInicio] = $dados[DATAINICIO];
   $_SESSION[turma_dtTermino] = $dados[DATATERMINO];
   $_SESSION[coordenador] = $dados[COORDENADOR];
   
   include('indentifTurma.php');
   ?>
   
<table class="itens" cellpadding="0" cellspacing="0"  >
<thead>
	<tr class="tit_areaAval"><th  width="10%" >Exerc&iacute;cio</th><th >Nome do Aluno Avaliado</th><th  width="15%"  >Dt. Avalia&ccedil;&atilde;o</th><th width="5%" >Ficha<br />Compl.</th><th  width="5%"  >Excluir</th></tr>
</thead>
<tbody>

<?

   $sql="Select IDCURSO,
                IDTURMA,
                ID_FICHA,
                ID_ATCO,
                ID_AVL,
                ID_EXERCICIO,
                NOMECOMPLETO,
                LPAD(extract(day from DATA_AVL),2,'0')||'/'||LPAD(extract(month from DATA_AVL),2,'0')||'/'||extract(year from DATA_AVL) as DATA_AVL,
                FICHACOMPLETA,
                LOCAL,
				ESTAGIARIO
         From CAD_FICHA_AVL
         Where 
		 IdCurso 		= ".$_SESSION[idCurso]."
         and IdTurma 	= ".$_SESSION[idTurma]."
		 and ID_INSTRUTOR = ".$_SESSION[identidade]."
         Order By NomeCompleto, Id_Exercicio ";
   
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))   {
	   $valorDeletor ="idFicha=$relacionado[ID_FICHA]&idATCO=$relacionado[ID_ATCO]&idAVL=$relacionado[ID_AVL]&idExercicio=$relacionado[ID_EXERCICIO]"; 
	   ?>
		<tr >
             <td align="center" 
			 <? if(isset($_SESSION[aval])) if($_SESSION[aval]==$relacionado[ID_ATCO].'|'.$relacionado[ID_EXERCICIO].'|'.$_SESSION[idCurso].'|'.$_SESSION[idTurma]) echo ' class="apontado" ';
			 $_POST[idATCO].'|'.$_POST[idExercicio].'|'.$_SESSION[idCurso].'|'.$_SESSION[idTurma];
			 ?>><?=htmlentities(trim($relacionado[ID_EXERCICIO]))?><form action="editaFicha.php" method="post">
				<input type="hidden" name="idFicha" 	value="<?=$relacionado[ID_FICHA]?>" />
				<input type="hidden" name="idATCO" 		value="<?=$relacionado[ID_ATCO]?>" />
				<input type="hidden" name="idAVL" 		value="<?=$relacionado[ID_AVL]?>" />
				<input type="hidden" name="idExercicio" value="<?=$relacionado[ID_EXERCICIO]?>" />
				<input type="hidden" name="local" 		value="<?=$relacionado[LOCAL]?>" />
				<input type="hidden" name="dtAval" 		value="<?=$relacionado[DATA_AVL]?>" />
				<input type="hidden" name="nomeAluno" 	value="<?=$relacionado[NOMECOMPLETO]?>" />
				<input type="hidden" name="estagiario" 	value="<? if($relacionado[ESTAGIARIO]=='S') echo 'SIM'; else echo 'NA0'; ?>" /></form>
			 </td>
             <td> <?=$relacionado[NOMECOMPLETO]?></td>
             <td align="center"><?=$relacionado[DATA_AVL]?></td>
             <td align="center"><?=$relacionado[FICHACOMPLETA]?></td>
             <td class="deletor" valores="<?=$valorDeletor?>"><img src="image/Excluir.png" border="0" target="_self"></td></tr>

<?
   }
   ?>
</tbody></table>
<?
if(isset($_SESSION[apontado]))  echo $_SESSION[apontado]."<br />".$valorDeletor;

?>
</div>
</div>
</body>
</html>
<script>

$('#conteudo').css('width',($(window).width()-60));
$('.etiqueta').css('left',($('#conteudo').width()-$('.etiqueta').width())/2);
$('.sair').click(function(){ location.href="index.php";})
$('.itens tbody td:not(.deletor)').click(function() {
	$(this).closest('tr').find('form').submit()
})
$('.deletor').click(function() {
	if(window.confirm("Você esta excluindo a avaliação, deseja continuar?"))
	$.post('excluiFicha.php',$(this).attr('valores'),function(resp){
		if(resp.merro=="") {
			location.href="Sel_Avaliacao.php";
//			alert('DADOS EXCLUIDOS COM SUCESSO');
		} else {
			alert(resp.merro)
		}
		},'json')
})
//
</script>
