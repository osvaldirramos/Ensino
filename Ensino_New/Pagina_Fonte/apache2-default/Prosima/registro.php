<?
session_start();
  
if ($_SERVER['REQUEST_METHOD'] === 'GET' || !isset($_POST[senha],$_POST[login]) ) {
	echo "ACESSO RESTRITO";
	header('Location: index.php');  
    exit();
}

$mens ='';
include("Funcoes/conecta.inc");

$sql="Select count(1) As QTD
	 From INSTRUTOR_TURMAS_VIEW
	 Where NomeGuerra = '$_POST[login]' and Senha = '$_POST[senha]'";
$Res_sql=ibase_query($conexao, $sql);
$Instrutor = ibase_fetch_assoc($Res_sql);
$Qtd= $Instrutor['QTD'];

if ($Qtd == 0) $mens =' Instrutor nao Cadastrado...';
else
{
	$sql="Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA
		From INSTRUTOR_TURMAS_VIEW
		Where NomeGuerra = '$_POST[login]' and Senha = '$_POST[senha]'";
	
	$Res_sql=ibase_query($conexao, $sql);
	$dados = ibase_fetch_assoc($Res_sql);

	$_SESSION[identidade]=$dados[IDENTIDADE];
	$_SESSION[idCurso]=139;
	$_SESSION[idTurma]=$dados[IDTURMA];
	$_SESSION[nomeguerra]=$dados[NOMEGUERRA];
	$_SESSION[IdUsuario]= $dados[FUNCAO];
	$_SESSION[nomeInstr]= $dados[NOME];
	$_SESSION[login] = $_POST[login];
	$_SESSION[senha] = $_POST[senha];
}
echo json_encode(array('merro'=>$mens));
?>
