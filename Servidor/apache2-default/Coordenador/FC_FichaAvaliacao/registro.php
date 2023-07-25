<?php
   session_start("Start_Avl");
   require_once("../../Funcoes/conecta.inc");

  if (!ctype_alnum($_POST["senha"]))
  {
     echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
  }
  else
  {
	$login =$_POST["login"];
	$senha =(int)$_POST["senha"];
	$idCurso=$_POST["idcurso"];;
	
	if(!$login || !$senha)
	{
       echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN ,SENHA E CURSO ');window.location='index.php';</script>";
       exit;
	}
    else
    {
  	   $sql="Select IdTurma, Identidade, CodigoAluno, NomeGuerra
             From ALUNOTURMA_VIEW
             Where NomeGuerra='$login' and CodigoAluno='$senha' and IdCurso=$idCurso";

  	   $con= ibase_query($sql);
	
       $row = ibase_fetch_object($con);
       $linhas=$row->CODIGOALUNO;

   	   if ($linhas > 0)
       {
          if($con= ibase_query($sql))
          {
             $dados=ibase_fetch_assoc($con);

   	        if(!strcmp($senha, $dados[CODIGOALUNO]))
            {
      	      $idTurma=$dados[IDTURMA];
	          $nomeGuerra=$dados[NOMEGUERRA];
	          $idUsuario="Aluno";

              $_SESSION[identidadeAluno]=$dados[IDENTIDADE];
	          $_SESSION[login]="$login";
	          $_SESSION[senha]="$senha";
              $_SESSION[idCurso]="$idCurso";
  	          $_SESSION[idTurma]="$idTurma";
	          $_SESSION[nomeguerra]="$nomeGuerra";
	          $_SESSION[IdUsuario]="$idUsuario";

      	      header("Location:ListaDeAvaliacoes.php");
              // header("Location:montapagina.php");
            }
          }
       }
       else
       {
           $sql="Select IdTurma, Identidade, CodigoInstrutor, NomeGuerra
                 From INSTRUTORTURMA_VIEW
                 Where NomeGuerra='$login' and CodigoInstrutor='$senha' and IdCurso=$idCurso";
     	   $con= ibase_query($sql);
           $row = ibase_fetch_object($con);
           $linhas=$row->CODIGOINSTRUTOR;

   	       if ($linhas > 0)
           {
    	      if($con= ibase_query($sql))
              {
                 $dados=ibase_fetch_assoc($con);

   	             if(!strcmp($senha, $dados[CODIGOINSTRUTOR]))
                 {
 	                $idTurma=$dados[IDTURMA];
	                $nomeGuerra=$dados[NOMEGUERRA];
                    $idUsuario="Instrutor";

                    $_SESSION[identidadeAluno]=$dados[IDENTIDADE];
	                $_SESSION[login]="$login";
	                $_SESSION[senha]="$senha";
                    $_SESSION[idCurso]="$idCurso";
	                $_SESSION[idTurma]="$idTurma";
	                $_SESSION[nomeguerra]="$nomeGuerra";
   	                $_SESSION[IdUsuario]="$idUsuario";

                    header("Location:ListaDeAvaliacoes.php");
	             }
              }
           }
           else        //--- Verifica se o Usuario eh Avaliador do ICEA
           {
              $sql="Select IdTurma, Identidade, Senha, Nome
                    From FA_USUARIO_VIEW
                    Where Nome='$login' and Senha='$senha' and IdCurso=$idCurso";

        	  $con= ibase_query($sql);
              $row = ibase_fetch_object($con);
              $linhas=$row->SENHA;

   	          if ($linhas > 0)
              {
                 if($con= ibase_query($sql))
                 {

                    $dados=ibase_fetch_assoc($con);

   	                if(!strcmp($senha, $dados[SENHA]))
                    {
   	                   $idTurma=$dados[IDTURMA];
	                   $nomeGuerra=$dados[NOME];
                       $idUsuario="Avaliador ICEA";

                       $_SESSION[identidadeAluno]=$dados[IDENTIDADE];
	                   $_SESSION[login]="$login";
      	               $_SESSION[senha]="$senha";
                       $_SESSION[idCurso]="$idCurso";
	                   $_SESSION[idTurma]="$idTurma";
      	               $_SESSION[nomeguerra]="$nomeGuerra";
   	                   $_SESSION[IdUsuario]="$idUsuario";

                       header("Location:ListaDeAvaliacoes.php");
                       // header("Location:montapagina.php");
                    }
                 }
              }
      	      else
      	      {
                  session_destroy("Start_Avl");
    	          echo "<script language='javascript' type='text/javascript'>
                        alert(' VERIFIQUE LOGIN ,SENHA E CURSO ');
                        window.location='index.php';</script>";
              }
           }
        }
     }
   }
?>
