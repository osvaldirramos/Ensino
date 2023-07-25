<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<style>
th {
	background-color:#9CF;
	font-weight:bold;
}
td,th {
	border:1px #999 solid;
	padding:5px;
	font-family:Tahoma, Geneva, sans-serif;
}
</style>
<body>
<?

require_once("conecta.inc");

$sql="Select *
         From FICHA_ITEM
          ";
		  
$Res_sql=ibase_query($conexao, $sql);
//$qtd = ibase_ affected_ rows();

$linha ="";
$qtd = 0;
while($dados = ibase_fetch_assoc($Res_sql)) {
	//print_r($dados);
	$di = $dados[DATAINICIO];
	$dti = substr($di,8,2)."/".substr($di,5,2)."/".substr($di,0,4);
	$linha .= "<tr><td>".$dados[ID_FICHA]."</td><td>".utf8_encode($dados[ID_ITEM])."</td><td>".$dados[ID_AVL]."</td><td>".$dados[ID_AVL]."</td><td>".$dados[ID_EXERCICIO]."</td><td>".$dados[ID_INSTRUTOR]."</td><td>".utf8_encode($dados[NOMECOMPLETO])."</td><td>".utf8_encode($dados[DATA_AVL])."</td><td>".$dados[FICHACOMPLETA]."</td><td>".$dados[LOCAL]."</td></tr>";
	$qtd++;
}
?>
<h1>TABELA - INSTRUTOR_TURMAS_VIEW   ..........: <? echo $qtd;?> registros </h1>
<p>
<? echo $sql; ?></p>
<p>
<table  cellpadding="0" cellspacing="0">
<thead>
<tr><th>ID_FICHA</th> <th>ID_ITEM</th><th>ID_AVL</th><th>DATA</th><th>ID_EXERCICIO</th><th>ID_INSTRUTOR</th><th>NOMECOMPLETO</th><th>DATA_AVL</th><th>FICHACOMPLETA</th><th>LOCAL</th>
</tr>
</thead>
<tbody>
<? echo $linha;?>
</tbody>
</table>

</body>
</html>