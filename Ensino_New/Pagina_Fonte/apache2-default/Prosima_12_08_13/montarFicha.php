<?php
   session_start();
   list( $_SESSION[nomeAluno],$_SESSION[idATCO]) = explode("|", $_POST[listaAluno]);
   $_SESSION[idExercicio] = $_POST[exercicio];
   $_SESSION[idInstrutor] = $_POST[listaInstrutor];
   $_SESSION[estagiario] =  $_POST[estagiario];
   $_SESSION[dataAVL]  = $_POST[data];
   $_SESSION[local]= $_POST[local];


   require_once("Dados_Ficha.php");
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
          if(($i%2)==0){$cor='#FFFFFF';}else{$cor='#C0C0FF';}
          echo "<table width='820'> <tr bgcolor='$cor'>
                        <td width='10'>&nbsp;$relacionado[ID_ITEM]</td>
                        <td width='250'>&nbsp;$relacionado[AREA_AVALIACAO]</td>
                        <td width='300'>&nbsp;$relacionado[DESCRICAO]</td>
                        <td width='30'>&nbsp;ÓTIMO<input value='o' name='$relacionado[ID_ITEM]$relacionado[ID_AVL]' type='radio' onClick='return false' onMouseDown='rC(this)'></td>
                        <td width='30'>&nbsp;BOM<input value='b' name='$relacionado[ID_ITEM]$relacionado[ID_AVL]' type='radio' onClick='return false' onMouseDown='rC(this)'></td>
                        <td width='30'>&nbsp;REGULAR<input value='r' name='$relacionado[ID_ITEM]$relacionado[ID_AVL]' type='radio' onClick='return false' onMouseDown='rC(this)'></td>
                        <td width='30'>&nbsp;NS<input value='ns' name='$relacionado[ID_ITEM]$relacionado[ID_AVL]' type='radio' onClick='return false' onMouseDown='rC(this)'></td>
                        <td width='30'>&nbsp;NA<input value='na' name='$relacionado[ID_ITEM]$relacionado[ID_AVL]' type='radio' onClick='return false' onMouseDown='rC(this)'></td>
                    </tr> </table>";
          $i++;
      }
   }
?>
 <html>
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
   </script>
   <head>
       <link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
   </head>

 <body>
  <div id="corpo">
   <div id="conteudo">
   <form method="POST" name="form2" action="insereFicha.php">
      <div id="menu-vertical">
        <input type="button" value="ENVIAR" class="button" onclick="verificando();">
      </div>
       <? montaFicha(1);?>
      <textarea name="parecer" rows="10" cols="100"></textarea>
      <input name='fCompleta' value='' type='hidden' size='20'>
      <input name='ns' value='' type='hidden' size='20'>
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
        document.form2.fCompleta.value='S';
        document.form2.submit();
      }
      else
      {
        if(P1 == 0 )
          var p = window.confirm("Não avaliou todos os itens, deseja continuar?");
          if(p){
            document.form2.fCompleta.value='N';
            document.form2.submit();
          }
      }
    }

    function verificaFORM1()
    {
       var ok=0;
	   var Sel=0;
	   var ns=0;
	   var t=document.form2.elements.length;
       for (j=0;j<document.form2.elements.length;j++)
       {
  	     if(document.form2[j].type=="radio")
         {
	 	   if(document.form2[j].checked==true)
           {
		   	 Sel++;
		   	 if(document.form2[j].valeu=='ns')
             {
                document.form2.ns.value='S';
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
