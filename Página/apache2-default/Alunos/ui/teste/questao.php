<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<title>Documento sem t&iacute;tulo</title>
</head>

<body>
<?php
include ("Classes/Conexao.php");
include ("Classes/rtf.php");

$conexao=Conexao::Conecta();
/*
$conexao = ibase_connect("192.168.24.121:/var/lib/firebird/2.5/data/BD_Ensino.gdb","sysdba","b2e5#ensino");
if (!$conexao)
{
	echo "<h2 align='center'>ATENÇÃO</h2>
	<h3 align='center'>Erro ao se conectar com o banco de dados.</h3>";
	exit;
}
*/
echo "<h1>Teste Conexão Banco Firebird</h1>";

$sql= "Select GABARITOPROVA.NUMEROQUESTAO, GABARITOPROVA.NUMITEM, GABARITOPROVA.QUESTAO, ITEM_DESC.DESCENALT
		From GABARITOPROVA 
		inner join ITEM_DESC on GABARITOPROVA.NUMITEM=ITEM_DESC.NUMITEM
		Where GABARITOPROVA.IDCURSO = '160' and 
		      GABARITOPROVA.IDTURMA = '2' and 
			  GABARITOPROVA.REFERENCIAAVALIACAO = '02T' and 
			  GABARITOPROVA.NUMEROQUESTAO = '$cod'";

$result = ibase_query($sql);
$data = ibase_fetch_object($result);
//imprimi as linhas na tela
echo "<p>IDCurso=160 - Turma=2 - Avaliacao=02T</p>";
echo "<p>Número Questão = ".$data->NUMEROQUESTAO."</p>";
echo "<p>Número Item = ".$data->NUMITEM."</p>";

$blob_data = ibase_blob_info($data->DESCENALT);
$blob_hndl = ibase_blob_open($data->DESCENALT);
$descItem=ibase_blob_get($blob_hndl, $blob_data[0]);
echo "Descrição=$descItem<br>";

// grava o campo blob em um arquivo rtf
file_put_contents("Tmp/descItem.rtf", $descItem);
/**********************************************************************************/

$reader = new RtfReader();
$rtf = file_get_contents("Tmp/descItem.rtf");
$reader->Parse($rtf);

//$reader->root->dump();
$formatter = new RtfHtml();
echo $formatter->Format($reader->root);


//Libera a memoria usada
ibase_free_result($result);

//fecha conexão com o firebird
ibase_close($conexao);

?>
</body>
</html>