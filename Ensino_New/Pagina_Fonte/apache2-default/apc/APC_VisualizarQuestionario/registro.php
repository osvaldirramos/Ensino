<?php
   session_start();

   require_once("../../Funcoes/conecta.inc");

	$login = $_POST["login"];
	$senha = $_POST["senha"];

	if(!$login || !$senha)
	{
       echo "VocÃª deve digitar sua senha e login!";
       exit;
	}

   function Descriptografar ($atual)
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

   $senha= StrToUpper(Descriptografar ($senha));

   $sql="Select count(1) qtd
           from usuario u
           where (u.nome = '$login' and Senha = '$senha')
           and (u.Secao = 'AVALIAÇÃO' or u.Secao = 'AVALIAÇÃO PÓS-CURSO' or u.Secao = 'ADMINISTRADOR')";

   $con = ibase_query($sql);
   $dados=ibase_fetch_assoc($con);

   if($dados[QTD]==1)
   {
      $nome=$dados[NOME];
      $senha=$dados[SENHA];
      $idCurso=$dados[IDCURSO];
      $identificacao=$dados[IDENTIFICACAO];

      $_SESSION[nome]="$nome";
      $_SESSION[senha]="$senha";
      $_SESSION[idCurso]="$idCurso";
      $_SESSION[identificacao]="$identificacao";

      header("Location:ListaCursos.php");
   }
   else
   {
      echo "<script language='javascript' type='text/javascript'>
              alert('VERIFIQUE LOGIN E SENHA ');window.location='login.php';
            </script>";
   }
?>
