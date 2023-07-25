<?php
	session_start();
	
   require_once("../Funcoes/conecta.inc");

	$login = $_POST["login"];
	$senha = $_POST["senha"];
	
	if(!$login || !$senha)
	{
       echo "Você deve digitar sua senha e login!";
       exit;
	}

	$sql="SELECT * FROM APC_USUARIO WHERE NOME='$login' and SENHA='$senha'";

	if($con= ibase_query($sql))
    {
        $dados=ibase_fetch_assoc($con);
	
   	    if(!strcmp($senha, $dados["SENHA"]))
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
			
		   $s_busca_agte="SELECT * FROM APC_AGENDA WHERE IDCURSO= $idCurso AND IDTURMA = $idTurma";
	       $r_busca_agte=ibase_query($conexao,$s_busca_agte)or die("erro");
		
		   if($f_busca_agte=ibase_fetch_assoc($r_busca_agte))
           {
		  	   if($f_busca_agte[DISPONIBILIZADOLOGIN]== N)
               {
 		           echo "<script language='javascript' type='text/javascript'> alert('O SEU ACESSO AO SISTEMA NÃO ESTA LIBERADO'); window.location='login.php';</script>";
 		  	   }
		       else
               {
	              $_SESSION[DataResposta]=$f_busca_agte[DATARESPOSTA];
               	  header("Location:montapagina.php");
		  	   }
		    }
		
	   }
       else
       {
	       echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='login.php';</script>";
  	   }
	}
    else
    {
	   echo "<script language='javascript' type='text/javascript'> window.location='login.php';</script>";
	}
?>
