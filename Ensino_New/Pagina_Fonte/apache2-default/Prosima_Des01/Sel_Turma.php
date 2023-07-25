<?php
   session_start();
   require_once("verifica_sessao.php");
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");   //  ob_start();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Relação das Fichas de Avaliação Prosima</title>
</head>
<body>
<div align="center" id="topo"><img src="image/topo.png"></div>

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
<form name="form1" method="POST" action="registro_Sel_Avaliacao.php">

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
      //---- Monta a Query com as turmas que o instrutor participou
      
      $sql= "Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA
                From INSTRUTOR_TURMAS_VIEW
                Where NomeGuerra = '$_SESSION[nomeguerra]'
                and Identidade = '$_SESSION[identidade]'
                and IdCurso = 139";

      $Res_sql_relacionado=ibase_query($conexao,$sql);

      $Sql_Turma= "Select IDTURMA, TURMA, Ano, extract(day from DataInicio)||'/'||extract(month from DataInicio)||'/'||extract(year from DataInicio) as DataInicio,
                  extract(day from DataTermino)||'/'||extract(month from DataTermino)||'/'||extract(year from DataTermino) as DataTermino,
			Descricao From Turma where IdCurso = 139 ";
      $VS_Opcao= " and ";

      while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
      {
         if ($VS_Opcao == ' and ')
         {
            $Sql_Turma.= " and ( IdTurma = $relacionado[IDTURMA]";
            $VS_Opcao= " or ";
         }
         else
         {
            $Sql_Turma.= " or  IdTurma = $relacionado[IDTURMA]";
         }
      }
      $Sql_Turma.= " and Status <> 'P') Order By IdTurma desc ";

      //---- Monta a relação das Turmas que o Instrutor Participou de acordo com a Query
      echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
      echo "<option >-- Selecione a Turma que será Avaliada </option>";

      $Res_sql_relacionado=ibase_query($conexao,$Sql_Turma);
      $opEscolhida =0;
      while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
      {
         echo "<option value= '$relacionado[IDTURMA]'>  - $relacionado[TURMA] - $relacionado[ANO] - $relacionado[DATAINICIO] à $relacionado[DATATERMINO]  </option>";
      }
      echo "</select>";
      echo "<BR>";
      echo "<BR>";
      echo "<BR>";
      echo "<BR>";

   }
?>

</form>
</div>
</div>

</body>
</html>

