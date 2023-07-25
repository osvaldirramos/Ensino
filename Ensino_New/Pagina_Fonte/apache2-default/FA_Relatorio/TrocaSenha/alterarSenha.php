<?php
   session_start();
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");
   require_once("../../Funcoes/conecta.inc");
   
   function Des($atual)
   {
      $resultado= '';
      for ($i= 0; $i <= strlen($atual)-1; $i++)
      {
          $v= substr($atual,$i,1);
          $v= strtoupper(substr($atual,$i,1));
          if (($v == 'V') || ($v == 'W') || ($v == 'X') || ($v == 'Y') || ($v == 'Z'))
          {
              $resultado .= $v;
          }
          else
          {
             $valorBin= ord($v);
             $valorBin= $valorBin + 2;
             $x= chr($valorBin);
             $resultado .= $x;
          }
      }
      return $resultado;
   }
   if($_POST['submit'])
   {

      $senhaTroca = strtoupper(Des($_POST['senhaTroca']));
      $novasenha1 = strtoupper(Des($_POST['novasenha1']));
      $novasenha2 = strtoupper(Des($_POST['novasenha2']));
      if ($senhaTroca==$_SESSION[senhaDigitada]&&$novasenha1==$novasenha2)
      {
         if(strlen($novasenha1)<16&&strlen($novasenha1)>2)
         {
             //$sql = "select nome from usuario where nome ='$_SESSION[nome]' and senha='$_SESSION[senha]'";

             $sql="update usuario set Senha = '$novasenha1'
                          where nome = '$_SESSION[nome]' and senha='$_SESSION[senha]' ";
             $Res_sql = ibase_query($conexao,$sql);


             $sql = "select senha from usuario where nome ='$_SESSION[nome]'";
             $Res_sql = ibase_query($conexao,$sql);
             $senha=ibase_fetch_assoc($Res_sql);

             $_SESSION[senhaDigitada]=$senha[SENHA];
             $_SESSION[senha]=$senha[SENHA];
             echo "<script language='javascript' type='text/javascript'> alert('Senha alterada.');window.location='alterarSenha.php';</script>";
          }
          else
          {
               echo "<script language='javascript' type='text/javascript'> alert('Senha deve ter de 3 a 15 caracteres.');window.location='alterarSenha.php';</script>";

          }
   
      }
      else
      {
         if ($senhaTroca!=$_SESSION[senhaDigitada])
         {
            echo "<script language='javascript' type='text/javascript'> alert('A senha digitada está incorreta. Redigite a senha atual.');window.location='alterarSenha.php';</script>";
         }

         if ($novasenha1!=$novasenha2)
         {
            echo "<script language='javascript' type='text/javascript'> alert('As senhas que você digitou não são iguais. Redigite a nova senha nas duas caixas.');window.location='alterarSenha.php';</script>";
         }

      }

   
   }
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css">
<title>Alterar Senha</title>
</head>

<div align="center" id="topo"><img src="topo.png"></div>

<BR>

<BR>
<p>&nbsp;</p>
<div id="corpo">
 <br>
<form action="" method="post" enctype="multipart/form-data">
Senha:<br>
<input type="password" name="senhaTroca" size="30" value=""><br>
Nova Senha<br>
<input type="password"  name="novasenha1" size="30"><br>
Redigite Senha<br>
<input type="password"  name="novasenha2" size="30"><br>
De 3 a 15 caracteres. <br>
<input type="submit" name="submit" value="Mudar">
</form>
<div>
</html>
