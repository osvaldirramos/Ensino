<?
   include("conecta.inc");
	$base = 0;
	$tot = 0;
	$mens = "";
if(isset($_GET[sql])) {
	$sql = 'Select count(0) as QTD from ('. $_GET[sql].")";
	//echo $sql.'<br />';
	$res1=ibase_query($conexao,$sql) or die($mens.="\n\n".ibase_errmsg());
	$qtd=ibase_fetch_assoc($res1);
	//echo 'XXXXXX - '.$qtd[QTD].' - XXXXXX<br />';
	$sql = 'select first 50 * from ('. $_GET[sql].")";
	//echo $sql;
	$res1=ibase_query($conexao,$sql) or die($mens.="\n\n".ibase_errmsg());
	$tot = $qtd[QTD];
	$tab = " AFETADOS ";
	if(1>0) {
		$tab .="<br /><table class='tabela_v' cellpadding='0' cellspacing='0' ><thead>";
		$tab1=$tab2="<tr >";
		$cabec=0;
		while($row = ibase_fetch_assoc($res1)) {
			foreach($row as $key=>$val) {
				if($cabec==0) {
					$tab1 .="<th>$key</th>";
				}
				$tab2 .="<td>".utf8_encode($val)."</td>";
			}
			$cabec=1;
			$tab1.="</tr >";
			$tab2.="</tr >";
		}
		$tab .=$tab1."</thead><tbody>".$tab2."</tbody></table>"; 
	}
} else {
	$tabela = $_GET['tabela'];
	$busca = $_GET['busca'];
	$tab ="<br /><table class='tabela_v' cellpadding='0' cellspacing='0' ><thead><tr >";
	$sql ="SELECT R.RDB\$FIELD_NAME AS NOME
			FROM RDB\$RELATION_FIELDS R
			LEFT JOIN RDB\$FIELDS F ON R.RDB\$FIELD_SOURCE = F.RDB\$FIELD_NAME
			LEFT JOIN RDB\$CHARACTER_SETS CSET ON F.RDB\$CHARACTER_SET_ID = CSET.RDB\$CHARACTER_SET_ID
			WHERE R.RDB\$RELATION_NAME= '".$tabela."'
			ORDER BY R.RDB\$FIELD_NAME ASC ";
	$Res=ibase_query($conexao,$sql);
	
	
		  //echo htmlspecialchars_decode($sql);
	$campos = array();	 
	while($Ncampo=ibase_fetch_assoc($Res)) {
		//print_r($campo);
		$tab.=  "<th >".$Ncampo[NOME]."</th>";
		$campos[]=$Ncampo[NOME];
	}
	$tab.= "</tr></thead><tbody>";


	$pesquixa = "";

	if(isset($busca)) {
		$pesquisa = ' WHERE '.implode(" containing('$busca') OR ",$campos)." containing('$busca')";
		$base = 0;
	}
	$lista_campos = implode(",",$campos);
	
	$sql = "select FIRST 40 SKIP $base $lista_campos from $tabela $pesquisa;";
	//echo $sql;
	//echo htmlspecialchars_decode($sql);
	$Res=ibase_query($conexao,$sql) or die($mens.="\n\n".ibase_errmsg());

	$sqlqtd = "Select count(0) as QTD from (select $lista_campos from $tabela $pesquisa)";
	$res1=ibase_query($conexao,$sqlqtd) or die($mens.="\n\n".ibase_errmsg());
	$qtd=ibase_fetch_assoc($res1);
	$tot = $qtd[QTD];

	while($campo=ibase_fetch_assoc($Res)) {
		//print_r($campo);
		$tab.= '<tr>';
		foreach($campo as $valor) {
		$tab.=  "<td >".utf8_encode($valor)."</td>";
		}
		$tab.= '</tr>';
	}
	$tab.='</tbody></table>';
}
echo $tot.' registros'.$tab;
?>
