<?php
/* **********************************************************************
* Arquivo: 		 conectaInstrutor.inc
* Objetivo: 	 Faz a conexão com o banco de dados 
* Responsável: 	 Angela out/2008
***************************************************************************/
	$conexao = ibase_connect('/var/lib/firebird2/data/ensino.gdb','sysdba','u2u6#icea','ISO8859_1',0,1);
	
	if (!$conexao)
	{
		echo "<center>Não foi possível estabelecer uma conexão com o banco de dados<br></center>";
		exit;
	}
?>
