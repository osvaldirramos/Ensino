<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link  href="dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" type="text/css" rel="stylesheet" media="screen">
<script type="text/javascript" src="dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="Funcoes/validarFormulario.js"></script>
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Informação da Nova Ficha de Avaliação - Prosima</title>

 <script type="text/javascript">
      rC = function(radioEl)
      {
     	if(radioEl.checked == true) {
	    	radioEl.checked = false;
		    return false;
	    }
	    else {
		   radioEl.checked = true;
		   return true;
	    }
      }

    rCnS = function(radioEl,item,areaAtuacao,descricao)
    {
      var texto =item+'-'+areaAtuacao+'-'+descricao+'\n \n';
      var valor = document.form1.parecer.value;

	if(radioEl.checked == true) {
		radioEl.checked = false;
		return false;
	}
	else {
		radioEl.checked = true;
		document.form1.parecer.value=valor.concat(texto) ;
        //document.form2.nsatisfatorio.value='S';
		return true;
	}
}

   </script>
</head>
<body>
<form name="form1" method="POST" action="insereFicha.php" onSubmit="return validaForm();" >
<div align="center" id="topo"><img src="image/topo.png"></div><BR>
<div align='center'><b>INFORMAÇÃOES DA NOVA FICHA DE AVALIAÇÃO - PROSIMA </b></div><BR>
<p>&nbsp;</p>

<div id="corpo">
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center">
         </td>
   <td width="192" align="center">
        <a href="Sel_Avaliacao.php" title="Cancela a Inserção da Nova Ficha de Avaliação" target="_self" >
        <img src="image/Cancelar.png" border="0" width="30" height="30" /> Voltar</a></td>
  </tr>
 </table>
<br>
<div id="conteudo">


<?php
   session_start();
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");
   list( $_SESSION[nomeAluno],$_SESSION[idATCO]) = explode("|", $_POST[listaAluno]);
   $_SESSION[idExercicio] = $_POST[exercicio];
   $_SESSION[idInstrutor] = $_POST[listaInstrutor];
   $_SESSION[estagiario] =  $_POST[estagiario];
   $_SESSION[dataAVL]  = $_POST[data];
   $_SESSION[local]= $_POST[local];

   $sql= "Select  ID_ATCO, ESTAGIARIO
          From pr_estagiario
          Where id_ATCO = $_SESSION[idATCO]";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $relacionado=ibase_fetch_assoc($Res_sql_relacionado);
   echo "<input name='estagiario' value='S' type='checkbox'";if($_SESSION[estagiario]=="S"||$relacionado[ESTAGIARIO]=="S"){echo "checked";}echo ">Estagiário <br><br>";

   //--- Tratamento da Combo de Selecao do Aluno:

   $sql= "Select IdCurso, IdTurma, NumOrdem, NomeCompleto, NomeGuerra,  Identidade,  PostoGraduacao, IdUnidade, IdSubUnidade
          From Aluno_Turma_VIEW
          Where IdCurso = $_SESSION[idCurso]
          and IdTurma = $_SESSION[idTurma]";

   echo "ATCO: <br>";
   echo "<select name='listaAluno' class='caixa' id='conteudo' onchange='submit()'>";
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
   echo "<select name='listaInstrutor' class='caixa' id='conteudo''>";
   echo "<option >--- Selecione o Instrutor</option>";

   $Res_sql_relacionado=ibase_query($conexao,$sql);
   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
       echo "<option value= '$relacionado[IDENTIDADE]'"; if (trim($_SESSION[idInstrutor])==trim($relacionado[IDENTIDADE])) { echo "selected";  }echo" > $relacionado[NOMECOMPLETO]</option>";
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
Local da Avaliação <input name='local' type='text' size='20' value='<?=$_SESSION[local]?>'><BR>
<BR>

</div>
</div>
<?
   function montaFicha($idFicha)
   {
      $i=1;
      include("Funcoes/conecta.inc");
      $sql= "Select Id_Ficha, Id_Item, Id_Avl, Area_Avaliacao, Descricao
              From Ficha_Item_View
              Where Id_Ficha = $idFicha
              Order By Id_Item, Id_Avl";
      $Res_sql_relacionado=ibase_query($conexao,$sql);
      while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
      {
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
      echo "<br>";
      echo "<td width=890><font>
                      <b>Comentário:</b>
                      </font></td>";
      echo "<br>";
   }
?>

  <div id="corpo">
   <div id="conteudo">
      <? montaFicha(1);?>
      <textarea name="parecer" rows="10" cols="100"></textarea><br>
      <input type="button" value="ENVIAR" class="button" onclick="verificando();">
      <input  name='fCompleta' value='' type='hidden' size='20'>
      <input  name='ns' value='' type='hidden' size='20'>
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
        document.form1.fCompleta.value='S';
        document.form1.submit();
      }
      else
      {
        if(P1 == 0 )
          var p = window.confirm("Não avaliou todos os itens, deseja continuar?");
          if(p){
            document.form1.fCompleta.value='N';
            document.form1.submit();
          }
      }
    }

    function verificaFORM1()
    {
       var ok=0;
	   var Sel=0;
	   var ns=0;
	   var t=document.form1.elements.length;
       for (j=0;j<document.form1.elements.length;j++)
       {
  	     if(document.form1[j].type=="radio")
         {
	 	   if(document.form1[j].checked==true)
           {
		   	 Sel++;
		   	 if(document.form1[j].valeu=='ns')
             {
                document.form1.ns.value='S';
             }
		   }
		 }
	   }
       if(Sel <51)
              ok=0;
       else
	 	     ok=1;
          return ok;
    }
</script>
