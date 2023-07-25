<?php

class Conexao
{		
	public static function Conecta()
	{	
		$conexao = ibase_connect("192.168.24.121:/var/lib/firebird/2.5/data/BD_Ensino.gdb","sysdba","b2e5#ensino");
		if (!$conexao)
		{
			echo "<h2 align='center'>ATENÇÃO</h2>
			<h3 align='center'>Erro ao se conectar com o banco de dados.</h3>";
			exit;
		}
		else
			return $conexao;
	}	
}
?>