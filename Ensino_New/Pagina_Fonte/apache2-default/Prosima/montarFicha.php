<?
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'GET' ) {
	echo "ACESSO RESTRITO";
	header('Location: index.php');  
    exit();
}
include("verifica_sessao.php");
include("Funcoes/conecta.inc");

function convertData($data) { 
	list($dia,$mes,$ano) = explode('/',$_POST[DATA_AVL]);
	return "$ano-$mes-$dia";
}
function ai($string) {
	$string = str_replace("'", "''", $string);
	return utf8_decode($string);
}

$mens = "";
$desvio = false;

$_SESSION[aval]=$_POST[ID_ATCO].'|'.$_POST[ID_EXERCICIO].'|'.$_SESSION[idCurso].'|'.$_SESSION[idTurma];

$sql= "INSERT INTO CAD_FICHA_AVL ( 
	NS, 
	PARECER, 
	NOMECOMPLETO, 
	ID_ATCO, 
	ID_AVL, 
	ESTAGIARIO, 
	FICHACOMPLETA, 
	ID_EXERCICIO, 
	ID_FICHA,
	IDCURSO, 
	IDTURMA, 
	ID_INSTRUTOR, 
	DATA_AVL, 
	LOCAL
	)
	VALUES 
	(
	'$_POST[NS]',
	'".ai($_POST[PARECER])."', 
	'".ai($_POST[NOMECOMPLETO])."',
	'$_POST[ID_ATCO]',
	'1', 
	'$_POST[ESTAGIARIO]', 
	'$_POST[FICHACOMPLETA]', 
	$_POST[ID_EXERCICIO],
	1, 
	$_SESSION[idCurso], 
	$_SESSION[idTurma], 
	'$_SESSION[identidade]', 
	'".convertData($_POST[DATA_AVL])."', 
	'$_POST[LOCAL]'
	);";
//	echo "\n\n$sql.........\n$mens\n..............................................";
if(!$res=ibase_query($conexao,$sql)) {
	$mens.="\n\n(1)".ibase_errmsg();
	if(stripos($mens,"PRIMARY")>0) {
		$mens = "ESTE ALUNO JA FOI AVALIADO\nNESTE EXERCICIO POR ESTE INSTRUTOR\n\nOPTE POR EDICAO DA AVALIACAO";
	}
	echo json_encode(array('merro'=>$mens));
	exit();
}

$sql= "Select ID_ITEM, ID_AVL, AREA_AVALIACAO,DESCRICAO
  From FICHA_ITEM_VIEW
  Where ID_FICHA = 1
  Order By ID_ITEM, ID_AVL";
//		echo "\n\n$sql.........\n$mens\n..............................................";
//		if(!$res=ibase_query($conexao,$sql)) $mens.="\n\n(2)".ibase_errmsg();
$res=ibase_query($conexao,$sql);
$vez = 1;
while($relacionado=ibase_fetch_assoc($res))
{
	$oti = $bom = $reg = $ns = $na = 0;
	$ponteiro = trim($relacionado[ID_ITEM].$relacionado[ID_AVL]);
	$item = $_POST[$ponteiro];
	if    ($item==5) $oti=1;
	elseif($item==4) $bom=1;
	elseif($item==3) $reg=1;
	elseif($item==2) $ns =1;
	elseif($item==1) $na =1;
	$sql= "INSERT INTO PR_AVALIACAO (  
		OTIMO,
		BOM,
		REGULAR,
		NS,
		NA, 
		IDCURSO, 
		IDTURMA, 
		ID_FICHA, 
		ID_ATCO, 
		Id_EXERCICIO, 
		ID_ITEM, 
		ID_AVL,
		AREA_AVALIACAO,
		DESCRICAO
		)
		VALUES
		(
		'$oti',
		'$bom',
		'$reg',
		'$ns',
		'$na',
		$_SESSION[idCurso],
		$_SESSION[idTurma],
		1,
		'$_POST[ID_ATCO]',
		$_POST[ID_EXERCICIO],
		'".$relacionado[ID_ITEM]."',
		'".$relacionado[ID_AVL]."',
		'".$relacionado[AREA_AVALIACAO]."',
		'".$relacionado[DESCRICAO]."'
		)";
//		echo "\n\n$sql.........\n$mens\n..............................................";
	if(!$res1=ibase_query($conexao,$sql)) $mens.="\n\n(3)".ibase_errmsg();
}

echo json_encode(array('merro'=>$mens));

?>