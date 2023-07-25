<?php
// destroi sessão quando usuario  clica no botão voltar apos ter logado****
session_start();
session_unset ();
session_destroy(); 
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<script type="text/javascript" language="javascript">
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

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: AVALIAÇÃO PÓS-CURSO :.</title>
<link href="apc.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="logol">
  <p><img src="image/brasao.gif" alt="ICEA" /></p>
</div>
<div id="titulo" class="BODY">INSTITUTO DE CONTROLE DO ESPAÇO AÉREO</div>
<div id="titulo" class="BODY">AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>
<p>&nbsp;</p>
<div id="titulo" class="BODY">Versão 1.00</div>
<div id="login">
  <p>&nbsp;</p>
<form id="form1" name="form1" method="POST" action="registro.php" class="BODY">
  
     <label>LOGIN
   <input type="text" name="login" id="login2" class="textbox" />
</label>
    <p>
      <label> SENHA
        <input type="password" name="senha" id="senha" class="textbox" />
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
