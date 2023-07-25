<?php
//$conexao = ibase_connect('/var/lib/firebird2/data/ensino.gdb','firebird','u2u6#ora','ISO8859_1',0,1);
$conexao = ibase_connect('/var/lib/firebird2/data/ensino.gdb','sysdba','u2u6#icea','ISO8859_1',0,1);
$sth=ibase_query('SELECT * FROM CURSO');
while ($row = ibase_fetch_row($sth)) 
{
	echo "IDCURSO =  $row[0]  --- 
	CODCURSO =  $row[1]  --- 
	NOMECURSO = $row[2] --- 
	<br>";
}
ibase_free_result($sth);

/*$sql = "insert into curso (codcurso,nomecurso) values ('AAA','teste curso')";
$resultado = ibase_query($conexao, $sql);
if($resultado)
	echo "Dados inseridos";
else
	echo "Erro na inserçaõ";*/

ibase_close($conexao);
?>