<?php
/* **********************************************************************
* Arquivo: 		 conectaInstrutor.inc
* Objetivo: 	 Faz a conex�o com o banco de dados 
* Respons�vel: 	 Angela out/2008
***************************************************************************/
	$conexao = ibase_connect('/var/lib/firebird2/data/ensino.gdb','sysdba','u2u6#icea','ISO8859_1',0,1);
	
	if (!$conexao)
	{
		echo "<center>N�o foi poss�vel estabelecer uma conex�o com o banco de dados<br></center>";
		exit;
	}
?>
