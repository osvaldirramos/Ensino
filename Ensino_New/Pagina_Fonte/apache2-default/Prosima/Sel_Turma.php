<?
session_start();

include("Funcoes/verifica_sessao.php");
include("Funcoes/conecta.inc");

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Relação das Fichas de Avaliação Prosima</title>
<link rel="shortcut icon" type="image/ico" href="image/favicon_icea.ico" >
<script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>
</head>
<body>
<?
include('cabec.inc')
?>

<titulo >SELE&Ccedil;&Atilde;O DA TURMA QUE SER&Aacute; AVALIADA - PROSIMA</titulo>

<div id="conteudo">
<div class="menu-vertical button sair">SAIR </div>
<form name="form1" method="POST" action="Sel_Avaliacao.php">
<input type="hidden" name='ListaDeFichas' />
</form>
<div class="etiqueta" style='margin-bottom: 15px; margin-top:13px;'><div>Instrutor:<br /><b>
<?php
   //--- Verifica se o Instrutor esta avaliando apenas uma Turma   count(1) as QTD

//   $sql_Comando= "Select count(1) as QTD
//          From INSTRUTOR_TURMAS_VIEW
//          Where NomeGuerra = '$_SESSION[nomeguerra]'
//          and Identidade = '$_SESSION[identidade]'
//          and IdCurso = $_SESSION[idCurso]";
//
//
//   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
//   $Comando=ibase_fetch_assoc($Res_sql_Comando);
//   $Qtd= $Comando[QTD];
//   
//   if ($Qtd == 1)
//   {
//       header("Location:Sel_Avaliacao.php");
//   }
//   else
//   {
      //---- Monta a Query com as turmas que o instrutor participou
      
      $sql= "Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA
                From INSTRUTOR_TURMAS_VIEW
                Where NomeGuerra = '$_SESSION[nomeguerra]'
                and Identidade = '$_SESSION[identidade]'
                and IdCurso = $_SESSION[idCurso]";

      $Res_sql_relacionado=ibase_query($conexao,$sql);

      $Sql_Turma= "Select IDTURMA, TURMA, Ano,  
	LPAD(extract(day from DataInicio),2,'0')||'/'|| LPAD(extract(month from DataInicio),2,'0')||'/'||extract(year from DataInicio) as DataInicio,    LPAD(extract(day from DataTermino),2,'0')||'/'|| LPAD(extract(month from DataTermino),2,'0')||'/'||extract(year from DataTermino) as DataTermino,
			Descricao From Turma where IdCurso = $_SESSION[idCurso] ";
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
	  
      $Res_sql_relacionado=ibase_query($conexao,$Sql_Turma);

      //---- Monta a relação das Turmas que o Instrutor Participou de acordo com a Query
      echo "$_SESSION[nomeInstr]</b></div><div style='text-align:center; float: right;'>Qtde. Turmas:<br /><b>$Qtd</b></div></div><table class='itens' cellpadding='0' cellspacing='0' ><thead><tr class='tit_areaAval'><th colspan='3'>Selecione a Turma que ser&aacute; Avaliada </th></tr><tr><th>NOME DA TURMA</th><th>Dt. In&iacute;cio</th><th>Dt. T&eacute;rmino</th></tr><thead><tbody>";

      $opEscolhida =0;
      while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
      {
		 echo "<tr valor ='".$relacionado[IDTURMA]."' ><td";
		 if(isset($_SESSION[idTurma])) if($_SESSION[idTurma]==$relacionado[IDTURMA]) echo ' class="apontado" ';
		 echo ">".$relacionado[TURMA]." - ".$relacionado[ANO]."</td>
		 		<td width='12%' align='center'>".$relacionado[DATAINICIO]."</td><td width='12%' align='center'>".$relacionado[DATATERMINO]."</td></tr>";
      }
      echo "</tbody></table>";

//   }
?>

</div>

</body>
</html>
<script>
$('#conteudo').css('width',($(window).width()-60));
$('.etiqueta').css('left',($('#conteudo').width()-$('.etiqueta').width())/2);

$('.itens tbody tr').click(function(){
	$('input[name=ListaDeFichas]').val($(this).attr('valor')).closest('form').submit();
})
$('#conteudo').css('width',($(window).width()-60));
$('.sair').click(function(){ location.href="index.php";})
</script>

