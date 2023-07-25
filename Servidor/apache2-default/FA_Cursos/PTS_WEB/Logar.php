<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : SGEW_WEB                                       //
  //                                                                            //
  // PRGRAMA                   : Logar.php                                      //
  //                                                                            //
  // DESCRICAO                 : Modulo de tratamento para Logar no Sistema.    //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          :                                                //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): Osvaldir Donizetti Ramos                       //
  //                                                                            //
  // INICIO DA ELABORACAO      : 14/12/2020                                     //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                          .                     //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

    include_once("Funcoes/conexao.php");
    include 'Funcoes/Funcoes.php';

    if (session_status() !== PHP_SESSION_ACTIVE) {
       session_start();
    }

    //---Pega o o acesso remoto do usuario para verificação posterior

    $_SESSION['donoSessao'] =  md5('seg'.$_SERVER['REMOTE_ADDR'].$_SERVER['HTTP_USER_AGENT']);

    //-- Tratamento do Lotin  

    $cursoP = addslashes($_POST['curso']);
    $loginP = addslashes($_POST['login']);
    $senhaP = addslashes($_POST['senha']);

    $cursoP = strtoupper(trim($cursoP));
    $loginP = strtoupper(trim($loginP));
    $senhaP = trim($senhaP);

    $curso =filter_var($cursoP,FILTER_SANITIZE_STRING);
    $login =filter_var($loginP,FILTER_SANITIZE_STRING);
    $senha =filter_var($senhaP,FILTER_SANITIZE_STRING);

    if(!$login || !$senha)
    {
        echo "Você deve digitar sua senha e login!";
        exit;
    }

    //--- Tratamento para pegar o IdCurso

    $sql= "select idCurso, IdTurma
            From Instrutor_Turma_View
            Where IdCurso = $curso
            and NomeGuerra = '$login'
            and codigoinstrutor = $senha";

    $con= ibase_query($conexao,$sql);
    if ($row = ibase_fetch_object($con))  {
        $con= ibase_query($conexao,$sql);
        $dados=ibase_fetch_assoc($con);

        $_SESSION[idCurso]=$dados[IDCURSO];
        $_SESSION[idturma]=$dados[IDTURMA];

        header("Location: PTS/ListarPTS.php"); 
	} 
	else {
  	    echo "<script language='javascript' type='text/javascript'>
               alert(' VERIFIQUE LOGIN ,SENHA E CURSO');
                 window.location='Login.php';
			  </script>";
	}
 
?>