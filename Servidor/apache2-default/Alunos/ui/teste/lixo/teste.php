<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Teste Firebird</title>
</head>

<body>
<?php
include ("Conexao.php");

$conexao=Conexao::Conecta();

echo "<h1>Teste Conexao</h1>";

$sql= "SELECT NOMECOMPLETO, IDENTIDADE FROM ALUNOTURMA";       
$result=ibase_query($conexao,$sql);

// gera um loop com as linhas encontradas
while ($row = ibase_fetch_object ($result)) {

    //imprimi as linhas na tela
    echo "Nome = ".$row->NOMECOMPLETO ."<br>";
}
//Libera a memoria usada
ibase_free_result($result);

//fecha conexão com o firebird
ibase_close($conexao);
?>
</body>
</html>
