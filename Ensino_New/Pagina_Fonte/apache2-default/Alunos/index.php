<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a usuario logar no sistema //
  //                             para isto devera entrar com seu Login e senha. //
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
  require_once("../Funcoes/conecta.inc");


   // destroi sess�o quando usuario  clica no bot�o voltar apos ter logado****

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
Este navegador n�o compreende os scripts que se est�o executando,
voc� deve habilitar o javascript no seu navegador ou  atualizar sua vers�o de navegador a uma mais recente.
</NOSCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: FICHA DE AVALIA��O DE CURSO :.</title>
<link href="apc.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="corpo">
<div align="center" id="topo"><img src="../imagem/topo.png"></div>
<div id="barra" align="right">
 <table border="0" width="100%" >
  <tr>
    <td width="192" align="center"> </td>
      <td width="192" align="right"><a href="../FA_Cursos/index.php" title="Sair" target="_top" >
         <img src="image/sair.png" border="0" width="25" height="25" > voltar
      </a></td>
   </tr>
 </table>
</div>
<BR>
<div id="titulo" class="BODY">FICHA DE AVALIA��O DE CURSO</div>
<BR>
<p>&nbsp;</p>

<div align='center'>Vers�o 1.04</div>

<div id="login">
<p>&nbsp;</p>
  <form id="form1" name="form1" method="POST" action="registro.php" onSubmit="return submete();" class="BODY">
<?php

  $sql_curso= "Select distinct c.idcurso,c.codcurso
                    From curso c, Turma t
                    where t.status = 'A'
                    and (C.idcurso = t.idcurso )
                    order by c.codcurso ";
  $Res_sql_curso = ibase_query($conexao,$sql_curso);
  
  echo "CURSO ";
  echo "<select name='idcurso' class='textbox'>";

  while ($curso = ibase_fetch_assoc($Res_sql_curso))
  {
     echo "<option value='$curso[IDCURSO]'>$curso[CODCURSO]</option>";
  }

  echo "</select>";

?>

      <label>LOGIN
        <input type="text" name="login" id="login2" class="textbox" onkeydown="upper()" onkeyup="upper()"   />
      </label>
    <p>
      <label> SENHA
        <input type="password" name="senha" id="senha" class="textbox" onkeydown="upper()" onkeyup="upper()"/>
      </label>
    </p>
    <p>
      <label>
        <input type="submit" name="entra" id="entra" value="entrar"/>
      </label>
    </p>
  </form>
  </div>
</div>
</body>
</html>
