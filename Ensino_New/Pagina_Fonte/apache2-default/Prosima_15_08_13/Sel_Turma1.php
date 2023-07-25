<?php
   session_start();
   require_once("Funcoes/conecta.inc");
//   require_once("verifica_sessao.php");
   require_once("Funcoes/Funcoes.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Relação das Fichas de Avaliação Prosima</title>
</head>
<body>
<div align="center" id="topo"><img src="topo.png"></div>

<BR>
<div align='center'>SELEÇÃO DA TURMA QUE SERÁ AVALIADA - PROSIMA </div>
<BR>
<p>&nbsp;</p>

<div id="corpo">
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center"></td>

   <td width="192" align="center" ></td>

   <td width="192" align="center" ></td>

   <td width="192" align="center" ></td>

   <td width="192" align="center">&nbsp;<a href="index.php" title="Sair" target="_self" ><img src="image/sair.png" border="0" width="25" height="25" /> Sair</a></td>
  </tr>
 </table>
<br>
<div id="conteudo">
<form name="form1" method="POST" action="Sel_Avaliacao.php">

<?php
   //--- Verifica se o Instrutor esta avaliando apenas uma Turma   count(1) as QTD

   $sql_Comando= "Select count(1) as QTD
          From INSTRUTOR_TURMAS_VIEW
          Where NomeGuerra = '$_SESSION[nomeguerra]'
          and Identidade = '$_SESSION[identidade]'
          and IdCurso = 139";


   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Comando=ibase_fetch_assoc($Res_sql_Comando);
   $Qtd= $Comando[QTD];
   
   echo "Quantidade - $Qtd <br>";
   if ($Qtd == 1)
   {
       $sql="Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO
                From INSTRUTOR_TURMAS_VIEW
                Where NomeGuerra = '$_SESSION[nomeguerra]'
                and Identidade = '$_SESSION[identidade]'
                and IdCurso = 139";

       $con= ibase_query($conexao,$sql);
       $dados=ibase_fetch_assoc($con);
       
       $_SESSION[idCurso]=$dados[IDCURSO];
       $_SESSION[idTurma]=$dados[IDTURMA];
       $_SESSION[nome]=$dados[NOME];
       $_SESSION[nomeguerra]=$dados[NOMEGUERRA];
       $_SESSION[IdUsuario]= $dados[FUNCAO];
       $_SESSION[identidade]=$dados[IDENTIDADE];

       header("Location:Sel_Avaliacao.php");
   }
   else
   {
      $sql="Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO
                From INSTRUTOR_TURMAS_VIEW
                Where NomeGuerra = '$_SESSION[nomeguerra]'
                and Identidade = '$_SESSION[identidade]'
                and IdCurso = 139";

       $con= ibase_query($conexao,$sql);
       $dados=ibase_fetch_assoc($con);

//       $Identidade= $dados[IDENTIDADE];
//       echo "$Identidade";

       $_SESSION[idCurso]=$dados[IDCURSO];
       $_SESSION[idTurma]=$dados[IDTURMA];
       $_SESSION[nome]=$dados[NOME];
       $_SESSION[nomeguerra]=$dados[NOMEGUERRA];
       $_SESSION[IdUsuario]= $dados[FUNCAO];
       $_SESSION[identidade]=$dados[IDENTIDADE];

       header("Location:Sel_Avaliacao.php");
   }
   echo "$msg";

?>

</form>

<form name="form2" method="POST" action="montapagina.php">


</p>

</form>
</div>
</div>

</body>
</html>

