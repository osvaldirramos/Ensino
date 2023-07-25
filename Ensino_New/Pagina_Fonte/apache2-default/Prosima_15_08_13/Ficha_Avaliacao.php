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
<title>Ficha de Avaliação Prática - Prosima</title>
</head>
<body>
<div align="center" id="topo"><img src="topo.png"></div>

<BR>
<div align='center'>FICHA DE AVALIAÇÃO PRÁTICA- PROSIMA </div>
<BR>
<p>&nbsp;</p>

<div id="corpo">
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center"></td>
   <td width="192" align="center"></td>
   <td width="192" align="center"></td>
   <td width="192" align="center"></td>
   <td width="192" align="center">
        <a href="Sel_Avaliacao.php" title="Finaliza a Inserção/Alteração da Ficha que esta sendo Avaliada" target="_self" >
        <img src="image/MsgLida.png" border="0" width="25" height="25" /> Finalizar</a></td>
  </tr>
 </table>
<br>
<div id="conteudo">
<form name="form1" method="POST" action="Sel_Avaliacao.php">


<?php

   $sql_Comando= "Select Turma,
                  extract(day from DataInicio)||'/'||extract(month from DataInicio)||'/'||extract(year from DataInicio) as DataInicio,
                  extract(day from DataTermino)||'/'||extract(month from DataTermino)||'/'||extract(year from DataTermino) as DataTermino,
                  Coordenador
                  From Turma
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";
//   echo "$sql_Comando";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $dados=ibase_fetch_assoc($Res_sql_Comando);

   $Turma= $dados[TURMA];

   echo "<table width=740 border=1 align=center cellpadding=0 cellspacing=0>";

   echo "<tr>";

   echo "<td width=890><font size=2 face=Arial><div align=left><strong>
                      Prosima...: $dados[TURMA] <br>
                      Data de Inicio: $dados[DATAINICIO]                       Data Termino: $dados[DATATERMINO] <br>
                      Avaliador: $dados[COORDENADOR] <br>
                      ATCO: $dados[COORDENADOR] <br>
                      Orgao: $dados[COORDENADOR] <br>
         </strong></div></font></td>";
   echo "<tr>";
   echo "</table>";

   echo "<br>";
   echo "<br>";
   echo "<table width=740 border=1 align=center cellpadding=0 cellspacing=0>";

   echo "<tr>";

   echo "<td width=890><font size=2 face=Arial><div align=left><strong>
                      Avaliação <br><br>
                      <input type='checkbox'>Estagiário <br>
                      Exercício <input type='text' size='20'> <br>
                      Data da Avaliação <input type='text' size='20'> <br>
                      Local da Avaliação <input type='text' size='20' value='ICEA'><BR>
         </strong></div></font></td>";
   echo "<tr>";
   echo "</table>";

   echo "<br>";
   echo "<br>";
   
   /*$sql_Comando= "Select Turma,
                  extract(day from DataInicio)||'/'||extract(month from DataInicio)||'/'||extract(year from DataInicio) as DataInicio,
                  extract(day from DataTermino)||'/'||extract(month from DataTermino)||'/'||extract(year from DataTermino) as DataTermino,
                  Coordenador
                  From Turma
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";
//   echo "$sql_Comando";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $dados=ibase_fetch_assoc($Res_sql_Comando);

*/
   

?>

</form>

<form name="form2" method="POST" action="montapagina.php">


</p>

</form>
</div>
</div>

</body>
</html>

