<?php
   session_start();
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");
   require_once("../../Funcoes/conecta.inc");
if($_POST['submit'])
{
   $senha = $_POST['senha'];
   $novasenha1 = $_POST['novasenha1'];
   $novasenha2 = $_POST['novasenha2'];
   if ($senha!= $_SESSION[senha])
   {
         echo "<script language='javascript' type='text/javascript'> alert('A senha digitada está incorreta. Redigite a senha atual.');window.location='alterarSenha.php';</script>";
   }
   if ($novasenha1!= $novasenha2)
   {
         echo "<script language='javascript' type='text/javascript'> alert('As senhas que você digitou não são iguais. Redigite a nova senha nas duas caixas.');window.location='alterarSenha.php';</script>";
   }else
   {
         if(strlen($novasenha1)<16&&strlen($novasenha1)>2)
         {
             if($_SESSION[IdUsuario]== "AVL ICEA")
             {
                 $sql="update FA_USUARIO set
                            SENHA = '$novasenha1'
                            WHERE IDENTIDADE like '%$_SESSION[identidadeAluno]%'";

             }else
             {
                 $sql="update FA_USUARIOTURMA set
                            SENHA = '$novasenha1'
                            WHERE (IDCURSO = $_SESSION[idCurso]) AND (IDTURMA = $_SESSION[idTurma])and( IDENTIDADE like '%$_SESSION[identidadeAluno]%')";

                             }

             $Res_sql = ibase_query($conexao,$sql);
         
             $_SESSION[senha]= $novasenha1;
             echo "<script language='javascript' type='text/javascript'> alert('Senha alterada.');window.location='alterarSenha.php';</script>";
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
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css">
<title>Alterar Senha</title>
</head>

<BR>

<BR>
<p>&nbsp;</p>
<div id="corpo">
 <br>
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

