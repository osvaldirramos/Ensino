<?php
session_start();
require_once("../Funcoes/conecta.inc");

  if (!$_POST["senha"])
  {
     echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
  }
  else
  {
        $loginP =$_POST["login"];
	$senhaP =$_POST["senha"];
        $login =filter_var($loginP,FILTER_SANITIZE_STRING);
        $senha =filter_var($senhaP,FILTER_SANITIZE_STRING);
	$idCurso=$_POST["idcurso"];
	
	if(!$login || !$senha)
	{
       echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN ,SENHA E CURSO ');window.location='index.php';</script>";
       exit;
	}
    else
    {
       $sql="Select IdTurma, Identidade, NomeGuerra, CodigoTurma,  Funcao
             From FA_USUARIOTURMA_VIEW
             Where NomeGuerra = '$login' and Senha = '$senha' and IdCurso = $idCurso";
      
       $con= ibase_query($conexao,$sql);
       $row = ibase_fetch_object($con);
       $linhas=$row->CODIGOTURMA;

       if ($linhas > 0)
       {
          $con= ibase_query($conexao,$sql);
          $dados=ibase_fetch_assoc($con);

          $_SESSION[identidadeAluno]=$dados[IDENTIDADE];
          $_SESSION[login]="$login";
          $_SESSION[senha]="$senha";
          $_SESSION[idCurso]="$idCurso";
          $_SESSION[idTurma]=$dados[IDTURMA];
          $_SESSION[nomeguerra]=$dados[NOMEGUERRA];
          $_SESSION[IdUsuario]= $dados[FUNCAO];
          $_SESSION[codAluno]= $dados[CODIGOTURMA];

          header("Location:Principal.php");
       }
       else        //--- Verifica se o Usuario eh Avaliador do ICEA
       {
           $sql="Select IdTurma, Identidade, Senha, Nome
                 From FA_USUARIO_VIEW
                 Where Nome='$login' and Senha= '$senha' and IdCurso=$idCurso";

     	    $con= ibase_query($conexao,$sql);
    	    if ($row = ibase_fetch_object($con))
           {
              $con= ibase_query($conexao,$sql);
              $dados=ibase_fetch_assoc($con);

              $_SESSION[identidadeAluno]=$dados[IDENTIDADE];
              $_SESSION[login]="$login";
              $_SESSION[senha]="$senha";
              $_SESSION[idCurso]="$idCurso";
              $_SESSION[idTurma]=$dados[IDTURMA];
              $_SESSION[nomeguerra]=$dados[NOME];
              $_SESSION[IdUsuario]= "AVL ICEA";

              header("Location:ListaDeAvaliacoes.php");
           }
      	   else
      	   {
  	          echo "<script language='javascript' type='text/javascript'>
                 alert(' VERIFIQUE LOGIN ,SENHA E CURSO ');
                 window.location='index.php';</script>";
           }
        }
     }
   }
?>
