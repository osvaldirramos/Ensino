<?php
// destroi sess�o quando usuario  clica no bot�o voltar apos ter logado****
session_start();
session_unset ();
session_destroy();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<script type="text/javascript" language="javascript">

function upper(){
  var texto;
  texto = document.form1.login.value.toUpperCase();
  document.form1.login.value = texto;
}

function submete(){
	if(document.form1.login.value !=""){
		if(document.form1.senha.value !="")
        {
			document.form1.submit();
		}
        else
		{
           alert('Senha em Branco');
           document.form1.senha.focus();
        }
	}
    else
	{
        alert('Login em Branco');
        document.form1.login.focus();
    }
}

</script>

<NOSCRIPT>
Este navegador n�o compreende os scripts que se est�o executando, voc� deve habilitar o javascript no seu navegador ou  atualizar sua vers�o de navegador a uma mais recente.
</NOSCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: AVALIA��O P�S-CURSO :.</title>
<link href="apc.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="logol">
  <p><img src="image/brasao.gif" alt="ICEA" /></p>
</div>
<div id="titulo" class="BODY">AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>
<p>&nbsp;</p>
<div id="titulo" class="BODY">Vers�o 1.02</div>
<div id="login">
  <p>&nbsp;</p>
<form id="form1" name="form1" method="POST" action="registro.php" class="BODY">
  
     <label>LOGIN
   <input type="text" name="login" id="login2" class="textbox" onkeyup="upper()" maxlength="22" />
</label>
    <p>
      <label> SENHA
        <input type="password" name="senha" id="senha" class="textbox" maxlength="22" />
      </label>
    </p>
    <p>
      <label>
      <input type="button" name="entra" id="entra" value="entrar" onclick="submete();" />
      </label>
    </p>
  </form>
  </div>
</body>
</html>
