<?php
   session_start();
   require_once("verifica_sessao.php");
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");
   //$_SESSION[idCurso]=139;
  //; $_SESSION[idTurma]=$_POST[ListaDeFichas];
   
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Relação das Fichas de Avaliação Prosima</title>
<script type="text/javascript">
   function verificaExclusao()
   {
       var p = window.confirm("Você esta excluindo a avaliação, deseja continuar?");
       if(p)
            return true;
       else
            return false;
   }

</script >

</head>
<body>
<div align="center" id="topo"><img src="image/topo.png"></div>

<BR>
<div align='center'>RELAÇÃO DA FICHAS AVALIADAS - PROSIMA</div>
<BR>
<p>&nbsp;</p>

<div id="corpo">
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center"></td>
   <td width="192" align="center" ><a href="Nova_Ficha.php" title="Entre aqui com as informações da Nova Ficha de Avaliação" target="_self" >
   <h3>NOVA<br>FICHA</h3></a> </td>
   <td width="192" align="center"> </td>
   <td width="192" align="center" >
   <a href="Sel_Turma.php" title="Voltar e selecionar outra turma" target="_self" >
   <h3>SELECIONAR<BR>TURMA</h3></a></td>
   <td width="192" align="center"></td>
   <td width="192" align="center"></td>
   <td width="192" align="center" ></td>
   <td width="192" align="center">&nbsp;<a href="index.php" title="Sair" target="_self" ><img src="image/sair.png" border="0" width="25" height="25" /> Sair</a></td>
  </tr>
 </table>
 <br>
<div id="conteudo">
<form name="form1" method="POST" action="editaFicha.php">

<?php
   //--- Verifica se o Instrutor esta avaliando apenas uma Turma   count(1) as QTD

   $sql_Comando= "Select Turma,
                  extract(day from DataInicio)||'/'||extract(month from DataInicio)||'/'||extract(year from DataInicio) as DataInicio,
                  extract(day from DataTermino)||'/'||extract(month from DataTermino)||'/'||extract(year from DataTermino) as DataTermino,
                  Coordenador
                  From Turma
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";
         // echo "$sql_Comando";
   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $dados=ibase_fetch_assoc($Res_sql_Comando);

   $Turma= $dados[TURMA];

   echo "<table width=740 align=center cellpadding=0 cellspacing=0>";
   echo "<tr>";
   echo "<td width=890><font>
                      <b>Turma:</b> $dados[TURMA] <br>
                      <b> Data de Inicio:</b>  $dados[DATAINICIO]                       <b> Data Termino:</b>  $dados[DATATERMINO] <br>
                      <b> Coordenador:</b>  $dados[COORDENADOR] <br>
    </font></td>";
   echo "<tr>";
   echo "</table>";
   echo "<br>";
   echo "<br>";

   $sql="Select IDCURSO,
                IDTURMA,
                ID_FICHA,
                ID_ATCO,
                ID_AVL,
                ID_EXERCICIO,
                ID_INSTRUTOR,
                NOMECOMPLETO,
                extract(day from DATA_AVL)||'/'||extract(month from DATA_AVL)||'/'||extract(year from DATA_AVL) as DATA_AVL,
                FICHACOMPLETA,
                LOCAL
         From CAD_FICHA_AVL
         Where IdCurso = $_SESSION[idCurso]
         and IdTurma = $_SESSION[idTurma]";
   echo "<table width='770'> <tr> <td>Exercício</td> <td> Nome do Aluno Avaliado</td> <td> Data Avalição </td>  <td> Ficha Incompleta </td><td>Editar</td> <td> Excluir</td> </tr>";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $i=1;
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       if(($i%2)==0){$cor='#FFFFFF';}else{$cor='#C0C0FF';}
       echo "<tr bgcolor='$cor'>
             <td> $relacionado[ID_EXERCICIO]</td>
             <td>$relacionado[NOMECOMPLETO]</td>
             <td> $relacionado[DATA_AVL]</td>
             <td> $relacionado[FICHACOMPLETA]</td>
             <td><a target='_self' href='editaFicha.php?idCurso=$relacionado[IDCURSO]&idTurma=$relacionado[IDTURMA]&idFicha=$relacionado[ID_FICHA]&idATCO=$relacionado[ID_ATCO]&idAVL=$relacionado[ID_AVL]&idExercicio=$relacionado[ID_EXERCICIO]&idInstrutor=$relacionado[ID_INSTRUTOR]&data=$relacionado[DATA_AVL]&local=$relacionado[LOCAL]'><img src='image/Alterar1.png' border='0' target='_self'></a></td>
             <td><a target='_self' onclick=' return verificaExclusao()' href='excluiFicha.php?idCurso=$relacionado[IDCURSO]&idTurma=$relacionado[IDTURMA]&idFicha=$relacionado[ID_FICHA]&idATCO=$relacionado[ID_ATCO]&idAVL=$relacionado[ID_AVL]&idExercicio=$relacionado[ID_EXERCICIO]&idInstrutor=$relacionado[ID_INSTRUTOR]&data=$relacionado[DATA_AVL]&local=$relacionado[LOCAL]'><img src='image/Excluir.png' border='0' target='_self'></a></td></tr>";
       $i++;
   }
   echo "</table>";
   echo "<BR>";

?>

</form>
</div>
</div>
</body>
</html>

