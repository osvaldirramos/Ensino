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

  //$loginP = strtoupper(trim($_POST['login']));
  //$senhaP = trim($_POST['senha']);

  $loginP = addslashes($_POST['login']);
  $senhaP = addslashes($_POST['senha']);

  $loginP = strtoupper(trim($loginP));
  $senhaP = trim($senhaP);

  $login =filter_var($loginP,FILTER_SANITIZE_STRING);
  $senha =filter_var($senhaP,FILTER_SANITIZE_STRING);

//    $senha= utf8_encode (  $senha ); 
//    $senha = hash('sha256', $senha);

  if(!$login || !$senha)
  {
    echo "Você deve digitar sua senha e login!";
    exit;
  }

  //--- Tratamento para pegar o usuário

  $sql= "select idlocalidade, localidade, senha
         From PTS_LOCALIDADE
         Where localidade = '$login'
         and senha = '$senha'";


  $con= ibase_query($conexao,$sql);
  if ($row = ibase_fetch_object($con))  {
     $con= ibase_query($conexao,$sql);
     $dados=ibase_fetch_assoc($con);

     $_SESSION[idLocalidade]=$dados[IDLOCALIDADE];
     $_SESSION[Localidade]=$dados[LOCALIDADE];
     header("Location: PTS/ListarTurmas.php"); 
   }
  else  {
    echo "<script language='javascript' type='text/javascript'>
            alert('Usu�rio n�o encontrado!');
            window.location='index.php';
          </script>";
   }
  
?>