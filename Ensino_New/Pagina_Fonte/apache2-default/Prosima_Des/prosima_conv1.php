<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: CONVERSOR DE BANCOS :.</title>

<link rel="shortcut icon" type="image/ico" href="image/favicon_icea.ico" >
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="validarFormulario.js"></script>
</head>
<style>
body{
	margin:0px;
	border:0px;
	padding:0px;
   	text-align:justify;
	background-image:url('image/fundo3.jpg');
	background-position:top left;
	font-family:Tahoma, Geneva, sans-serif;
}
.tabela {
	border:none;
}
.tabela th  {
	background-color:#09C !important;
	color:#fff;
	line-height:30px;
	padding:0px 10px 0px 10px;
	cursor:pointer;
}
.tabela_v th {
	background-color:#09C !important;
	color:#fff;
	line-height:30px;
	padding:0px 10px 0px 10px;
}
#tabelas {
	position:absolute;
	top:5px;
	left:5px;
	bottom:5px;
	width:350px;
	overflow:auto;
}

#tabelas tbody {
	display:none;
}

table
{
	width:100%;
	background-color:#FFFFFF;
	border:0px;
	margin:0px;
	padding:0px;
	font-family:Verdana, Arial, Helvetica, sans-serif;
    font-size:14px;
	color:#333;
	font-weight:normal;
	text-align:justify;
}
table tbody tr:nth-child(even) {  }
table tbody tr:nth-child(odd)  { background-color:#D0EBFF;}

#conteudo_tabela {
	position:absolute;
	top:150px;
	bottom:5px;
	right:5px;
	left:360px;
	border: 1px solid #ccc;
	overflow:auto;
	
}
.cab_tabela {
	font-size:14px;
	line-height:20px;
	font-weight:bold;
	text-align:center;
}
.tabela_v td {
	white-space:nowrap;
	border-right: 1px dotted #C7C7C7;
}
#mascara {
	height:100%;
	width:100%;
	margin:0px;
	padding:0px;
	position:absolute;
	top:0px;
	left:0ps;
	background-color: rgba(146, 31, 31, 0.5);;
	display:none;
}
#baixar {
	position:absolute;
	width:120px;
	line-height:25px;
	height:25px;
	text-align:center;
	background-color:rgb(134, 208, 243);
	color:#000;
	border: 1px solid #000;
	top:30px;
	right:10px;
	display:none;
}
.busca {
	position:absolute;
	top:3px;
	right:40px;
	height:30px;
	display:none;
	
}
#bt_busca {
	position:absolute;
	top:3px;
	width:25px;
	height:25px;
	right:5px;
	background-color:#0C3;
	display:none;
	font-size:8px;
	line-height:25px;
	color:#fff;
	text-align:center;
	cursor:pointer;
}
#SQL {
	position: absolute;
	top: 13px;
	width: 740px;
	height: 135px;
	left: 365px;
}
#bt_sql {
	position:absolute;
	top:33px;
	width:25px;
	height:25px;
	right:140px;
	background-color:#06C;
	font-size:8px;
	line-height:12px;
	color:#fff;
	text-align:center;
	cursor:pointer;
}
div{
	padding:0px;
	margin:0px;
}

</style>

<body>
<div class="busca"><input name="busca" size="15" type="text"  /></div>
<div id="bt_busca">Search</div>
<div id="SQL">
<textarea id="sql" name="sql" style="width:100%; resize:none; height:125px;"></textarea>
</div>
<div id="bt_sql">Send SQL</div>
<div id="tabelas">


<?
	include("conecta.inc");
	$sql = 'SELECT RDB$RELATION_NAME as tabela FROM RDB$RELATIONS order by RDB$RELATION_NAME asc;';


  $Res_sql_relacionado=ibase_query($conexao,$sql);
  $linha ="";
  while($dado=ibase_fetch_assoc($Res_sql_relacionado))
  {
	  if(substr($dado[TABELA],0,4)!='RDB$' && substr($dado[TABELA],0,4)!='MON$') {
	  echo "<table class='tabela' cellpadding='0' cellspacing='0' ><thead><tr ><th colspan=3>".$dado[TABELA]."</th></tr></thead><tbody>
	  <tr class='cab_tabela'><td >NOME</TD><TD  width='10%'>TAMANHO</TD><TD  width='10%'>TIPO</TD></TR>";
		$sql ="SELECT R.RDB\$FIELD_NAME AS NOME,
				CASE F.RDB\$FIELD_TYPE
				 WHEN 7 THEN 'SMALLINT'
				 WHEN 8 THEN 'INTEGER'
				 WHEN 9 THEN 'QUAD'
				 WHEN 10 THEN 'FLOAT'
				 WHEN 11 THEN 'D_FLOAT'
				 WHEN 12 THEN 'DATE'
				 WHEN 13 THEN 'TIME'     
				 WHEN 14 THEN 'CHAR'
				 WHEN 16 THEN 'INT64'
				 WHEN 27 THEN 'DOUBLE'
				 WHEN 35 THEN 'TIMESTAMP'
				 WHEN 37 THEN 'VARCHAR'
				 WHEN 40 THEN 'CSTRING'
				 WHEN 261 THEN 'BLOB'
				 ELSE 'UNKNOWN'
				END AS TIPO,
				F.RDB\$FIELD_LENGTH AS TAM
				/* ,CSET.RDB\$CHARACTER_SET_NAME AS CARAC */
				FROM RDB\$RELATION_FIELDS R
				LEFT JOIN RDB\$FIELDS F ON R.RDB\$FIELD_SOURCE = F.RDB\$FIELD_NAME
				LEFT JOIN RDB\$CHARACTER_SETS CSET ON F.RDB\$CHARACTER_SET_ID = CSET.RDB\$CHARACTER_SET_ID
				WHERE R.RDB\$RELATION_NAME= '".$dado[TABELA]."'
				ORDER BY R.RDB\$FIELD_NAME ASC ";
	  //echo htmlspecialchars_decode($sql);
	  $Res=ibase_query($conexao,$sql);
	  while($campo=ibase_fetch_assoc($Res)) {
		  //print_r($campo);
		  echo  "<tr><td >".$campo[NOME]."</td><td >".$campo[TAM]."</td><td >".$campo[TIPO]."</td></tr>";
	  }
		//echo $linha;
	  echo "</tbody></table><hr />";
	  }
  }
?>
</div>
<div id='conteudo_tabela'>
</div>
<div id="mascara"></div>
<a href="" id="baixar" target="_self">BAIXAR XLS</a>
</body>

</html>
<script>
var tabela;
$('.tabela thead').click(function(){
	if($(this).siblings('tbody').is(':visible')) {
		$(this).siblings('tbody').hide();
		$('#conteudo_tabela').html("");
		$('#baixar,.busca,#bt_busca').hide();
	} else {
		$("#mascara").show();
		$('.tabela tbody').hide();
		$(this).siblings('tbody').show();
		tabela = $(this).text().replace(/\s+/,"");
		var ler = $('#conteudo_tabela').load('prosima_ler_tabela.php?tabela='+tabela, function(){
			$('#baixar').attr('href','prosima_arq_excel.php?tabela='+tabela);
			$("#mascara").hide();
			$('#baixar,.busca,#bt_busca').show();
		});
	}
})

$('#bt_busca').click(function(){
	$("#mascara").show();
	var ler = $('#conteudo_tabela').load('prosima_ler_tabela.php?tabela='+tabela+'&busca='+$('input[name=busca]').val(), function(){
		$("#mascara").hide();
	});
//	$('.tabela_v tbody tr').filter(function(index){
//		var valor =eval('/('+$('[name=busca]').val()+')/gi');
//		return !valor.test($(this).text())
//		}).hide()
//	$("#mascara").hide();
})

$('#bt_sql').click(function(){
	$("#mascara").show();
	$('.tabela tbody').hide()
	alert($('#sql').val())
	var ler = $('#conteudo_tabela').load('prosima_ler_tabela.php?tabela='+tabela+'&sql='+encodeURI($('#sql').val()), function(){
		
		$("#mascara").hide();
	});
})



</script>

