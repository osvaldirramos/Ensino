<?php
session_start();
require_once("../Funcoes/conecta.inc");

  if (!$_POST["senha"])
  {
     echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
  }
  else
  {
	$login =$_POST["login"];
	$senha =$_POST["senha"];
	$idCurso=$_POST["idcurso"];

	if(!$login || !$senha)
	{
          echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN ,SENHA E CURSO ');window.location='index.php';</script>";
          exit;
	}
       else
       {
         
            $sql="Select IdTurma, Identidade, CodigoTurma, NomeGuerra
                 From FA_USUARIOTURMA_VIEW
                 Where NomeGuerra='$login' and Senha='$senha' and IdCurso=$idCurso and upper(Funcao)='COORDENADOR'";
            $con= ibase_query($conexao,$sql);
            $row = ibase_fetch_object($con);
            $linhas=$row->CODIGOTURMA;

            if ($linhas > 0)
            {
                $con= ibase_query($conexao,$sql);
                $dados=ibase_fetch_assoc($con);

                $idTurma=$dados[IDTURMA];
	         $nomeGuerra=$dados[NOMEGUERRA];
                $idUsuario="Coordenador";

                $_SESSION[identidadeAluno]=$dados[IDENTIDADE];
	         $_SESSION[login]="$login";
	         $_SESSION[senha]="$senha";
                $_SESSION[idCurso]="$idCurso";
	         $_SESSION[idTurma]="$idTurma";
	         $_SESSION[nomeguerra]="$nomeGuerra";
   	         $_SESSION[IdUsuario]="$idUsuario";

                header("Location:topFrame.php");

            }
            else
            {
               session_destroy();
               echo "<script language='javascript' type='text/javascript'>
                   alert(' VERIFIQUE LOGIN ,SENHA E CURSO ');
                   window.location='index.php';</script>";
       }
   }
  }
?>
