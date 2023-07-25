<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a usuario logar no sistema //
  //                             para isto devera entrar com seu Login e senha. //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj S�nia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/04/2009                                     //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

   // destroi sess�o quando usuario  clica no bot�o voltar apos ter logado****
   session_start();
   session_unset ();
   session_destroy();
   require_once("../Funcoes/Funcoes.php");

   $f= new Funcao();

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

<?php
   $f-> Cabecalho();
?>


<BR>
<BR>
<div id="titulo" class="BODY">SE��O DE AVALIA��O</div>
<BR>
<p>&nbsp;</p>

<div align='center'>Vers�o 1.00</div>

<div id="login">
  <p>&nbsp;</p>
<form id="form1" name="form1" method="POST" action="registro.php" class="BODY">
  
     <label>LOGIN
   <input type="text" name="login" id="login2" class="textbox" onkeyup="upper()" />
</label>
    <p>
      <label> SENHA
        <input type="password" name="senha" id="senha" class="textbox" onkeyup="upper()" />
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
