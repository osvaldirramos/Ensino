<?

include "conectaInstrutor.inc";
$rg=$HTTP_POST_VARS["rg"];
echo"rg - $rg<br>";
//seleciona dados do Usuario do curso e verifica RG
 $r = ibase_query($conexao,"select * from PESSOA where IDENTIDADE like '$rg%' order by IDENTIDADE");
    //$r = ibase_query($conexao,"select * from PESSOA ");
function ibase_num_rows($query)
{
	$i = 0;
	while ($row=ibase_fetch_assoc($query)) 
	{
		echo "$row[IDENTIDADE] - $row[NOME] - $row[NUM_IDENTIDADE]<br>";
		$i++;
	}
	return $i;
}
$nrow = ibase_num_rows($r);

if ($nrow <= 0)
	echo "Não encontrou registro(s)<br>";
else
	if ($nrow == 1)
		echo "Encontrou $nrow registro<br>";
	else
 		echo "Encontrou $nrow registro(s)<br>";
 
 
/* Verifica se existe o RG do aluno
if ($total == 1)// existe
	header("Location: menuInstrutor.php?rg=$rg");
else
	header("Location: cadInstrutor.php?rg=$rg"); 
	*/
?>


 
 