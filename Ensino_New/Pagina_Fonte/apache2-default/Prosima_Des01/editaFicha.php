<?php
   session_start();
   require_once("verifica_sessao.php");
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");

   $_SESSION[idCurso] = $_GET[idCurso];
   $_SESSION[idTurma] = $_GET[idTurma];
   $_SESSION[idFicha] = $_GET[idFicha];
   $_SESSION[idATCO] = $_GET[idATCO];
   $_SESSION[idAVL] = $_GET[idAVL];
   $_SESSION[idExercicio] = $_GET[idExercicio];
   $_SESSION[idInstrutor] = $_GET[idInstrutor];
   $_SESSION[local] = $_GET[local];

   list($dia,$mes, $ano) = explode("/",$_GET[data]);
   if(strlen($dia)==1){$dia="0".$dia;}
   if(strlen($mes)==1){$mes="0".$mes;}
   
   $_SESSION[dataAVL] = $dia.".".$mes.".".$ano;
   
   
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link  href="dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" type="text/css" rel="stylesheet" media="screen">
<script type="text/javascript" src="dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="Funcoes/validarFormulario.js"></script>
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
rC = function(radioEl) {
	if(radioEl.checked == true) {
		radioEl.checked = false;
		return false;
	}
	else {
		radioEl.checked = true;
		return true;
	}
}
rCnS = function(radioEl,item,areaAtuacao,descricao) {

    var texto =item+'-'+areaAtuacao+'-'+descricao+'\n \n';
    var valor = document.form1.parecer.value;

	if(radioEl.checked == true) {
		radioEl.checked = false;
		return false;
	}
	else {
		radioEl.checked = true;
		document.form1.parecer.value=valor.concat(texto) ;
        //document.form1.nsatisfatorio.value='S';
		return true;
	}
}
</script>
</head>

<body>
<div align="center" id="topo"><img src="image/topo.png"></div>
<div id="corpo">
<div id="conteudo">
<BR>
<div align='center'>RELAÇÃO DA FICHAS AVALIADAS - PROSIMA</div>
<BR>
<p>&nbsp;</p>
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center"></td>
   <td width="192" align="center"></td>
   <td width="192" align="center"></td>
   <td width="192" align="center" ></td>
   <td width="192" align="center">&nbsp;<a href="index.php" title="Sair" target="_self" ><img src="image/sair.png" border="0" width="25" height="25" /> Sair</a></td>
  </tr>
 </table>
<br>

<form name="form1" method="post" action="montaEditaFicha.php">
<?php
    $sql_Comando= "Select Turma,
                  extract(day from DataInicio)||'/'||extract(month from DataInicio)||'/'||extract(year from DataInicio) as DataInicio,
                  extract(day from DataTermino)||'/'||extract(month from DataTermino)||'/'||extract(year from DataTermino) as DataTermino,
                  Coordenador
                  From Turma
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";
   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $dados=ibase_fetch_assoc($Res_sql_Comando);

   $Turma= $dados[TURMA];

   echo "<table border='1' width=740 align=center cellpadding=0 cellspacing=0>";
   echo "<tr>";
   echo "<td width=890><font>
			 <br>
                      <b>Turma:</b> $dados[TURMA] <br>
                      <b> Data de Inicio:</b>  $dados[DATAINICIO]                       <b> Data Termino:</b>  $dados[DATATERMINO] <br>
                      <b> Coordenador:</b>  $dados[COORDENADOR] <br><br>
    </font></td>";
   echo "<tr>";
   echo "</table>";
   echo "<br>";
   echo "<br>";


   $sql= "Select  ID_ATCO, ESTAGIARIO
          From pr_estagiario
          Where id_ATCO = '$_SESSION[idATCO]'";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $relacionado=ibase_fetch_assoc($Res_sql_relacionado);
   echo "<input name='estagiario' value='S' type='checkbox'";if($relacionado[ESTAGIARIO]=="S"){echo "checked";}echo ">Estagiário <br><br>";

   $sql= "Select IdCurso, IdTurma, NumOrdem, NomeCompleto, NomeGuerra,  Identidade,
                 PostoGraduacao, IdUnidade, IdSubUnidade
          From Aluno_Turma_VIEW
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";
   echo "ATCO: <br>";
   echo "<select name='listaAluno' class='caixa' id='conteudo' >";
   echo "<option >--- Selecione o ATCO</option>";

   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       echo "<option value= '$relacionado[NOMECOMPLETO]|$relacionado[IDENTIDADE]'"; if (trim($_SESSION[idATCO])==trim($relacionado[IDENTIDADE])) { echo "selected";  }echo" > $relacionado[NOMECOMPLETO]</option>";
   }
   echo "</select>";
   echo "<BR>";

   //--- Tratamento da Combo de Selecao do Instrutor:
   $sql= "Select IdCurso, IdTurma, CodigoInstrutor, NomeCompleto, NomeGuerra,  Identidade,  PostoGraduacao, IdUnidade, IdSubUnidade
          From Instrutor_Turma_VIEW
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";
   echo "<BR>";
   echo "Instrutor: <br>";
   echo "<select name='listaInstrutor' class='caixa' id='conteudo'>";
   echo "<option >--- Selecione o Instrutor</option>";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       echo "<option value= $relacionado[IDENTIDADE]"; if(trim($_SESSION[idInstrutor])==trim($relacionado[IDENTIDADE])) { echo "selected";  }echo" > $relacionado[NOMECOMPLETO]</option>";
   }
   echo "</select>";

?>
<BR>
<BR>
   Exercício <input name="exercicio" type='text' size='20' value='<?=$_SESSION[idExercicio]?>' onkeyup="validaExercicio()"><BR>
<BR>
<BR>
Data da Avaliação <input name='data' value='<?=$_SESSION[dataAVL]?>' onfocus="displayCalendar(document.forms[0].data,'dd.mm.yyyy',this)" type='text' size='20' onkeyup="validaData()"><BR>
<BR>
Local da Avaliação <input name='local' type='text' size='20' value='ICEA'><BR>
<BR>

<?php

   montaFicha($_SESSION[idCurso], $_SESSION[idTurma], $_SESSION[idFicha], $_SESSION[idATCO], $_SESSION[idExercicio]);
   function montaFicha($idCurso,$idTurma,$idFicha,$idATCO,$idExercicio)
   {
      include("Funcoes/conecta.inc");
      $i=1;
      $sql= "Select *
              From pr_avaliacao
              Where IDCURSO = $idCurso
                     and IDTURMA =$idTurma
                     and ID_FICHA=$idFicha
                     and ID_ATCO =  '$idATCO'
                     and Id_EXERCICIO = $idExercicio
              Order By Id_Item, Id_Avl";
      $Res_sql_relacionado=ibase_query($conexao,$sql);
      while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
      {
          if($relacionado[OTIMO]==1){$otimo="checked='checked'";}else{$otimo="";}
          if($relacionado[BOM]==1){$bom="checked='checked'";}else{$bom="";}
          if($relacionado[REGULAR]==1){$regular="checked='checked'";}else{$regular="";}
          if($relacionado[NS]==1){$ns="checked='checked'";}else{$ns="";}
          if($relacionado[NA]==1){$na="checked='checked'";}else{$na="";}
          trim($relacionado[ID_ITEM]);
          trim($relacionado[ID_AVL]);
          $nome=trim($relacionado[ID_ITEM].$relacionado[ID_AVL]);
          if(($i%2)==0){$cor='#FFFFFF';}else{$cor='#C0C0FF';}
          echo "<table width='820'> <tr bgcolor='$cor'>
                        <td width='10'>&nbsp;$relacionado[ID_ITEM]</td>
                        <td width='250'>&nbsp;$relacionado[AREA_AVALIACAO]</td>
                        <td width='300'>&nbsp;$relacionado[DESCRICAO]</td>
                        <td width='30'>&nbsp;ÓTIMO<input name='$nome' type='radio' $otimo value='otimo' onClick='return false' onMouseDown='rC(this)'></td>
                        <td width='30'>&nbsp;BOM<input name='$nome' type='radio' $bom value='bom' onClick='return false' onMouseDown='rC(this)'></td>
                        <td width='30'>&nbsp;REGULAR<input name='$nome' type='radio' $regular value='regular' onClick='return false' onMouseDown='rC(this)'></td>";?>
                        <td width='30'>&nbsp;NS<input name=<?=$nome?> type='radio' <?php echo"$ns";?> value='ns' onClick='return false'  onMouseDown="rCnS(this,'<?=$relacionado[ID_ITEM]?>','<?=$relacionado[AREA_AVALIACAO]?>','<?=$relacionado[DESCRICAO]?>')" ></td>
       <?php      echo "<td width='30'>&nbsp;NA<input name='$nome' type='radio' $na value='na' onClick='return false' onMouseDown='rC(this)' ></td>
                    </tr> </table>";
          $i++;

      }
   }

   echo "<br>";
   echo "<td width=890><font>
                      <b>Comentário:</b>
    </font></td>";
   echo "<br>";

   
   $sql= "Select PARECER
              From cad_parecer
              Where IDCURSO = $_SESSION[idCurso]
                     and IDTURMA =$_SESSION[idTurma]
                     and ID_FICHA=$_SESSION[idFicha]
                     and ID_ATCO =  '$_SESSION[idATCO]'
                     and Id_EXERCICIO = $_SESSION[idExercicio]";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $relacionado= ibase_fetch_assoc($Res_sql_relacionado);
   $binfo = ibase_blob_info($relacionado['PARECER']);
   $bopen = ibase_blob_open($relacionado['PARECER']);

?>
<textarea name="parecer" rows="10" cols="100"><?=ibase_blob_get($bopen, $binfo[0]);?></textarea>
<div id="menu-vertical">
   <input type="button" value="ENVIAR" class="button" onclick="verificando()">
</div>
 <input  name='completa' value='' type='hidden' size='20'>
 <input  name='nsatisfatorio' value='' type='hidden' size='20'>
</form>
</div>
</div>
</body>
</html>
<script type="text/javascript">
   function verificando()
   {
      var P1=verificaFORM1();
      if(P1 == 1 )
      {
        document.form1.completa.value='S';
        document.form1.submit();
      }
      else
      {
        if(P1 == 0 )
          var p = window.confirm("Não avaliou todos os itens, deseja continuar?");
          if(p){
            document.form1.completa.value='N';
            document.form1.submit();
          }
      }
    }

    function verificaFORM1()
    {
       var ok = 0;
	   var Sel = 0;
	   var ns = document.getElementsByName("ns");
	   var t = document.form1.elements.length;
       for (j=0;j<document.form1.elements.length;j++)
       {
         if(document.form1[j].checked==true)
         {
            Sel++;
		 }
	   }
       if(Sel <=51)
              ok=0;
       else
	 	     ok=1;
          return ok;
    }
    </script >
