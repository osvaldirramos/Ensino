<?php
session_start();
require_once("conecta.inc");
  
$login =$_POST["login"];				
$senha = $_POST["senha"];  
$turma = ""; 			

$sql="SELECT COUNT(1) as QDT From INSTRUTOR_TURMAS_VIEW
	Where NOMEGUERRA = '".$login."' and Senha = '".$senha."'
	and IDCURSO = 139";
	
$Res_sql=ibase_query($conexao, $sql);
$Instrutor = ibase_fetch_assoc($Res_sql);
$soUm= $Instrutor['QDT'];

if ( $soUm == 0 ) $mens =utf8_encode('INSTRUTOR NÃO CADASTRADO...');
else { 
	$mens ='';
	$sql="Select IDENTIDADE From INSTRUTOR_TURMAS_VIEW
		Where NOMEGUERRA = '".$login."' and Senha = '".$senha."'
		and IDCURSO = 139";
	
	$Res_sql=ibase_query($conexao, $sql) ;
	$dados = ibase_fetch_assoc($Res_sql);
	
	$_SESSION['ident']=$dados['IDENTIDADE'];
	$_SESSION['guerra']=$login;
	$_SESSION['idCurso']=139;

	$sql="Select count(1) as QDT From INSTRUTOR_TURMAS_VIEW
		Where IDENTIDADE = '".$dados['IDENTIDADE']."'
		and IDCURSO = 139";
	
	$Res_sql=ibase_query($conexao, $sql) ;
	$qtd = ibase_fetch_assoc($Res_sql);
	if($qtd['QDT']==1) {
		$sql="Select IDTURMA as QDT From INSTRUTOR_TURMAS_VIEW
			Where IDENTIDADE = '".$dados['IDENTIDADE']."'
			and IDCURSO = 139";
		$Res=ibase_query($conexao, $sql) ;
		$curso = ibase_fetch_assoc($Res);
		$turma = $curso[IDTURMA];
	}
}
echo json_encode(array("mens"=>$mens,"qdt"=>$qtd['QDT'],"turma"=>$turma));
?>
