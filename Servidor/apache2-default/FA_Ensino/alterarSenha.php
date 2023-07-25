<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : AlterarSenha.php                               //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite ao usuario alterar sua     //
  //                             senha.                                         //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          :                                                //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 17/08/2010                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

   session_start();
   require_once("verifica_sessao.php");
//   require_once("../Funcoes/Funcoes.php");
   require_once("../Funcoes/conecta.inc");

     //-----------------
    // Função para descriptografar a  senha
   //-----------------

   function Des($atual)
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
    //----
   //--- Inicia o Processamento
   
   if($_POST['submit'])
   {
      $senha =  strtoupper(Des($_POST['senha']));
      $novasenha1 = $_POST['novasenha1'];
      $novasenha2 = $_POST['novasenha2'];
      $novasenha1= strtoupper(Des($novasenha1));
      $novasenha2= strtoupper(Des($novasenha2));

      if ($senha!= $_SESSION[senha])
      {
         echo "<script language='javascript' type='text/javascript'> alert('A senha digitada está incorreta. Redigite a senha atual.');window.location='alterarSenha.php';</script>";
      }
      if ($novasenha1!= $novasenha2)
      {
         echo "<script language='javascript' type='text/javascript'> alert('As senhas que você digitou não são iguais. Redigite a nova senha nas duas caixas.');window.location='alterarSenha.php';</script>";
      }
      else
      {
         if(strlen($novasenha1)<16&&strlen($novasenha1)>2)
         {
             $sql="update USUARIO set
                   SENHA = '$novasenha1'
                   WHERE IDCODIGO like '%$_SESSION[idcodigo]%'";
             $Res_sql = ibase_query($sql, $conexao);
             $_SESSION[senha]= $novasenha1;
             echo "<script language='javascript' type='text/javascript'> alert('Senha alterada.');window.location='ListaFichas.php';</script>";
          }
          else
          {
               echo "<script language='javascript' type='text/javascript'> alert('Senha deve ter de 3 a 15 caracteres.');window.location='alterarSenha.php';</script>";

          }
      }
   }
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="estilos/estilo.css" rel="stylesheet" type="text/css">
<title>Alterar Senha</title>
</head>
<div id="corpo">
<div align="center" id="topo"><img src="topo.png"></div>
<div id="corpo">
<BR>
<div align='center'>FICHA DE AVALIAÇÃO DE CURSO</div>
<BR>
<p>&nbsp;</p>

<form action="" method="post" enctype="multipart/form-data">
Senha:<br>
<input type="password" name="senha" size="30" value=""><br>
Nova Senha<br>
<input type="password"  name="novasenha1" size="30"><br>
Redigite Senha<br>
<input type="password"  name="novasenha2" size="30"><br>
De 3 a 15 caracteres. <br>
<input type="submit" name="submit" value="Mudar">
</form>
<div>
</html>

