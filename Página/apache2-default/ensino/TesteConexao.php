<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
</head>
<body>
<?php
header("Content-Type: text/html;  charset=ISO-8859-1",true); 

// conexão com a base
//$conexao = ibase_connect('/var/lib/firebird2/data/ensino.gdb','sysdba','u2u6#icea','ISO8859_1',0,1);
$conexao = ibase_connect('/var/lib/firebird2/data/ensino.gdb','sysdba','u2u6#icea','PT_BR',0,1);
$rg = "180";

//$sql="SELECT * FROM PESSOA where IDENTIDADE LIKE '%$rg%'";
$sql="SELECT * FROM PESSOA";

$result = ibase_query($conexao,$sql);

function ibase_num_rows($query)
{
	$i = 0;
	while ($row=ibase_fetch_row($query)) 
	{
		echo "$row[0] - $row[1]<br>";
		$i++;
	}
	return $i;
}

$nrow = ibase_num_rows($result);

if ($nrow > 0)
	echo "Encontrou $nrow registro(s)<br>";
else
	echo "Não encontrou registro(s)<br>";

ibase_close($conexao);
?>
</body>
</html>