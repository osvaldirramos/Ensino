<?php
session_start();
require_once("conecta.inc");

	$login = $_POST["login"];
	$senha = $_POST["senha"];
	
	if(!$login || !$senha)
	{
       echo "Você deve digitar sua senha e login!";
       exit;
	}

	$sql="Select IdCurso, IdTurma, Identidade, CodigoAluno, NomeGuerra
          From ALUNOTURMA_VIEW
          Where NomeGuerra='$login' and CodigoAluno='$senha'";

	if($con= ibase_query($sql))
    {
        $dados=ibase_fetch_assoc($con);
	
   	    if(!strcmp($senha, $dados[CODIGOALUNO]))
        {
	       $idCurso=$dados[IDCURSO];
	       $idTurma=$dados[IDTURMA];
	       $nomeGuerra=$dados[NOMEGUERRA];

           $_SESSION[identidade]=$dados[IDENTIDADE];
	       $_SESSION[login]="$login";
	       $_SESSION[senha]="$senha";
           $_SESSION[idCurso]="$idCurso";
	       $_SESSION[idTurma]="$idTurma";
	       $_SESSION[nomeguerra]="$nomeGuerra";
      	   header("Location:ListaDeAvaliacoes.php");
//    	   header("Location:montapagina.php");
	   }
       else
       {
	       echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
 	   }
	}
    else
    {
 	   echo "<script language='javascript' type='text/javascript'> window.location='index.php';</script>";
	}
?>
