<?

$tabela = $_GET['tabela'];

$conexao = ibase_connect("192.168.24.121:/var/lib/firebird/2.5/data/BD_Ensino.gdb","sysdba","b2e5#ensino");
$tab ="<table class='tabela_v' cellpadding='0' cellspacing='0' ><thead><tr >";

$sql ="SELECT R.RDB\$FIELD_NAME AS NOME
		FROM RDB\$RELATION_FIELDS R
		LEFT JOIN RDB\$FIELDS F ON R.RDB\$FIELD_SOURCE = F.RDB\$FIELD_NAME
		LEFT JOIN RDB\$CHARACTER_SETS CSET ON F.RDB\$CHARACTER_SET_ID = CSET.RDB\$CHARACTER_SET_ID
		WHERE R.RDB\$RELATION_NAME= '".$tabela."'
		ORDER BY R.RDB\$FIELD_POSITION";
$Res=ibase_query($conexao,$sql);

	  //echo htmlspecialchars_decode($sql);
$campos = array();	 
while($Ncampo=ibase_fetch_assoc($Res)) {
	//print_r($campo);
	$tab.=  "<th >".$Ncampo[NOME]."</th>";
	$campos[]=$Ncampo[NOME];
}
$tab.= "</tr></thead><tbody>";

$lista_campos = implode(",",$campos);



$sql = 'select '.$lista_campos.' from '.$tabela;
//echo htmlspecialchars_decode($sql);
$Res=ibase_query($conexao,$sql);

while($campo=ibase_fetch_assoc($Res)) {
	//print_r($campo);
	$tab.= '<tr>';
	foreach($campo as $valor) {
	$tab.=  "<td >".$valor."</td>";
	}
	$tab.= '</tr>';
}
$tab.='</tbody></table>';


$arquivo = $tabela.'.xls';

// Criamos uma tabela HTML com o formato da planilha


// Configurações header para forçar o download
header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header ("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
header ("Cache-Control: no-cache, must-revalidate");
header ("Pragma: no-cache");
header ("Content-type: application/msexcel");
header ("Content-Disposition: attachment; filename=\"{$arquivo}\"" );
header ("Content-Description: PHP Generated Data" );

// Envia o conteúdo do arquivo
echo $tab;
exit;

?>