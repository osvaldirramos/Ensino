<?php
  session_start();
  require_once("Funcoes/conecta.inc");

  if (!$_POST["senha"])
  {
     echo "<script language='javascript' type='text/javascript'>
             alert('Verifique o Login e a Senha ');
             window.location='index.php';
           </script>";
  }
  else
  {
	$_SESSION[login] =$_POST[login];
	$_SESSION[senha] = $_POST[senha];
	$idCurso=$_POST[idcurso];
	if(!$_SESSION[login] || !$_SESSION[senha])
	{
       echo "<script language='javascript' type='text/javascript'>
               alert('Verifique o Login e a Senha ');
               window.location='index.php';
             </script>";
       exit;
	}
    else
    {
       $sql="Select count(1) As QTD
             From INSTRUTOR_TURMAS_VIEW
             Where NomeGuerra = '$_SESSION[login]' and Senha = '$_SESSION[senha]'";
       $Res_sql=ibase_query($conexao, $sql);
       $Instrutor = ibase_fetch_assoc($Res_sql);
       $Qtd= $Instrutor['QTD'];

       if ($Qtd == 0)
       {
          echo "<script language='javascript' type='text/javascript'>
                   alert(' Instrutor não Cadastrado...');
                   window.location='index.php';
                </script>";
       }
       else
       {
          $sql="Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA
                From INSTRUTOR_TURMAS_VIEW
                Where NomeGuerra = '$_SESSION[login]' and Senha = '$_SESSION[senha]'";

          $Res_sql=ibase_query($conexao, $sql);
          $Instrutor = ibase_fetch_assoc($Res_sql);
          $Identidade= $Instrutor['IDENTIDADE'];

          $sql="Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA
                From INSTRUTOR_TURMAS_VIEW
                Where NomeGuerra = '$_SESSION[login]'
                and Identidade = '$Identidade'
                and IdCurso = 139";
          $con= ibase_query($conexao,$sql);
          $dados=ibase_fetch_assoc($con);

          $_SESSION[identidade]=$dados[IDENTIDADE];
          $_SESSION[idCurso]="$idCurso";
          $_SESSION[idTurma]=$dados[IDTURMA];
          $_SESSION[nomeguerra]=$dados[NOMEGUERRA];
          $_SESSION[IdUsuario]= $dados[FUNCAO];

          header("Location:Sel_Turma.php");
//          header("Location:ListaDeAvaliacoes.php");
       }
     }
   }
?>
