<html>
<head>
 <title>Acesso aos Resultados de Avalia��o P�s-Curso</title>
 <link href="../External/estilos/estilo.css" rel="stylesheet" type="text/css">
 <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /><!-- /IE7 mode/ -->
 <script type="text/javascript" src="../External/Funcoes/funcoes.js"></script>
<NOSCRIPT>
Este navegador n�o compreende os scripts que se est�o executando,
voc� deve habilitar o javascript no seu navegador ou  atualizar sua vers�o de navegador a uma mais recente.
</NOSCRIPT>
</head>
<body>

<div id="corpo">
<div align="center" id="topo"><img src="../External/icones/topo.png"></div>

<BR>
<div id="titulo" align="center">Resultado da Avalia��o P�s-Curso</div>
<BR>
<p>&nbsp;</p>

<div align='center'>Vers�o 1.00</div>

<div id="formulario4">
<p>&nbsp;</p>
  <form id="form1" name="acesso" method="POST" action="../Controller/acessoController.php" class="BODY" onSubmit="return validarFormAcesso();">
      <label>LOGIN
        <input type="text" name="login" id="login2" class="textbox" onkeydown="upper()" onkeyup="upper()"   />
      </label>
    <p>
      <label> SENHA
        <input type="password" name="senha" id="senha" class="textbox" />
      </label>
    </p>
    <p>
      <label>
        <input type="submit" name="entra" id="entra" value="entrar"  />
      </label>
    </p>
  </form>
</div>
</div>



</body>
</html>
