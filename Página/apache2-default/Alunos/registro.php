<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : registro.php
  //
  // DESCRICAO                 : Este modulo tem a funcao tratar da query que analisa o usuario.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Ten Marcela
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 03/09/2019
  //
  //----------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------

session_start();
require_once("../Funcoes/conecta.inc");

  if (!$_POST["senha"])
  {
     echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA teste 01');window.location='index.php';</script>";
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
          echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN ,SENHA E CURSO teste ');window.location='index.php';</script>";
          exit;
	}
    else
    {
       $sql="select idturma, identidade, nomeguerra,  CodigoTurma, Funcao
             From FAC_USUARIOTURMA_VIEW
             Where nomeguerra= '$login' and Senha = '$senha' and IdCurso = $idCurso";
echo "$sql <br>";
       $con= ibase_query($conexao,$sql);
       $row = ibase_fetch_object($con);
       $linhas= $row->CODIGOTURMA;

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

           $sql="Select IdTurma, Identidade, Nome as nomeguerra, 'AVL ICEA' as Funcao
                 From FAC_Usuario_View F1, fac_avaliacao F2
                 Where F1.IdAvaliacao = F2.IdAvaliacao
                 and   F1.Nome='$login' 
                 and   F1.Senha= '$senha' 
                 and   F2.IdCurso=$idCurso";

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
              $_SESSION[IdUsuario]= $dados[FUNCAO];

              header("Location:Principal.php");
           }
      	    else
      	    {
  	          echo "<script language='javascript' type='text/javascript'>
                 alert(' VERIFIQUE LOGIN ,SENHA E CURSO');
                 window.location='index.php';</script>";
           }
        }
     }
   }
?>
