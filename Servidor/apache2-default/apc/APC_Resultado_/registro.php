<?php
    ob_start();
	session_start();
	require_once("conecta.inc");

	$login = $_POST["login"];
	$senha = $_POST["senha"];

	if(!$login || !$senha)
	{
    echo "Você deve digitar sua senha e login!";
    exit;
	}

     //-----------------
    // Função para descriptografar a  senha
   //-----------------

   function Des($atual)
   {
      $resultado= '';
      for ($i= 0; $i <= strlen($atual)-1; $i++)
      {
         $v= substr($atual,$i,1);
         $valorBin= ord($v);
         $valorBin= $valorBin + 2;
         $x= chr($valorBin);
         $resultado .= $x;
      }
      return $resultado;
   }

   $senha= Des($senha);

    $sql="Select count(1) qtd
           from usuario u, perfilacesso p
           where u.nome = '$login' and u.Senha = '$senha'
           and u.idCodigo = p.idcodigo and p.Modulo = 'Extras - Consulta Avaliação Pós-Curso'
           and p.possuiacesso = 'S'";                                                             //mudar para valores de tabelas pra padrao FA
    echo $sql;
    $con = ibase_query($sql);
	$dados=ibase_fetch_assoc($con);
    
    
    if($dados[QTD]==1)
    {
       $idTurma=$dados[IDTURMA];
	   $idCurso=$dados[IDCURSO];
	   $idCodigo=$dados[IDCODIGO];
	   $identificacao=$dados[IDENTIFICACAO];
	   $nome=$dados[NOME];
	   $senha=$dados[SENHA];

	   $_SESSION[idTurma]="$idTurma";
	   $_SESSION[idCurso]="$idCurso";
	   $_SESSION[idCodigo]="$idCodigo";
	   $_SESSION[identificacao]="$identificacao";
	   $_SESSION[nome]="$nome";
	   $_SESSION[senha]="$senha";
       header("Location:ListaFichas.php");
    }
    else
    {
		// echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
    }



?>
