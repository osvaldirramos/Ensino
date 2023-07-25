<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a usuario logar no sistema //
  //                             para isto devera entrarcom seu Login e senha. //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          :                                                //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germano / Osvaldir Donizetti Ramos      //
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

  session_start();
  session_unset ();
  session_destroy();
  require_once("Funcoes/conecta.inc");

   // destroi sessão quando usuario  clica no botão voltar apos ter logado****

   //  require_once("../Funcoes/Funcoes.php");

  // $f= new Funcao();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<script type="text/javascript" language="javascript">

function upper(){
  var texto;
  var texto1; 
  texto = document.form1.login.value.toUpperCase(); 
  texto1 = document.form1.senha.value.toUpperCase();
  document.form1.login.value = texto;
  document.form1.senha.value = texto1;
}

    function submete()
    {
 	 if(document.form1.login.value !="")
        {
	   if(document.form1.senha.value !="")
          {
	      return true;  
	   }else
	   {
	      alert('Senha em Branco');	
             document.form1.senha.focus();
	      return false;
	      
  	   }
        }        
        else
	 {
            alert('Login em Branco');	
            document.form1.login.focus();
	     return false;        
	 }
    }
</script>

<NOSCRIPT>
Este navegador não compreende os scripts que se estão executando,
você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
</NOSCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: FICHA DE AVALIAÇÂO PROSIMA.</title>
<link href="apc.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="corpo">
<div align="center" id="topo"><img src="image/topo.png"></div>
<BR>
<BR>
<div id="titulo" class="BODY">FICHA DE AVALIAÇÃO PROSIMA</div>
<BR>
<p>&nbsp;</p>

<div align='center'>Versão 1.00</div>

<div id="login">
<p>&nbsp;</p>
  <form id="form1" name="form1" method="POST" action="registro.php" onSubmit="return submete();" class="BODY">
      <label>LOGIN
        <input type="text" name="login" id="login2" class="textbox" onkeydown="upper()" onkeyup="upper()"   />
      </label>
    <p>
    <BR>
      <label> SENHA
        <input type="password" name="senha" id="senha" class="textbox" onkeydown="upper()" onkeyup="upper()"/>
      </label>
    <BR>
     <BR>
    </p>
    <p>
      <label>
        <input type="submit" name="entra" class="button" id="entra" value="entrar" />
      </label>   <br>
    </p>
  </form>
  </div>
</div>
</body>
</html>
