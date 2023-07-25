<?php
//Verificação de Segurança - verifica se usuário esta tentando acesar a classe pela URL
//recebe o valor da URL atual.
$url = $_SERVER["PHP_SELF"];

// verifica se a URL digitada tem o mesmo nome do arquivo. Caso tenha, vai para index.php.
if(eregi("Conexao.php", "$url"))
{
	header("Location: ../ui/index.php");
}

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