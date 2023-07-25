<?php
   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   //include("ListaFichas.php");
?>
<HTML>
<HEAD>
 <TITLE>Instrutores</TITLE>
</HEAD>
<BODY>
<?php


  $sql="select nome, nomeguerra
       from instrutorturma_view
       where idcurso=$_SESSION[idCurso]
       and idturma =$_SESSION[idTurma]";
  $Res_sql = ibase_query($conexao , $sql);

  echo "<table cellspacing='2'>
         <tr bgcolor='#CCCCCC' >
            <td width='350' align='center'><b>NOME</b></td>
            <td width='100' align='center'><b>DE GUERRA</b></td>

         </tr>";
  while ($aluno=ibase_fetch_assoc($Res_sql)){

   if($cont_cor%2==0){
       $cor = "#F5F5F5";
   }else{
      $cor = "#D3D3D3";
   }
   $cont_cor++;
   echo "<tr bgcolor = $cor style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px;'>";
   echo "<td>$aluno[NOME]</td>  <td>$aluno[NOMEGUERRA]</td>  <td>$aluno[NOTAFINAL]</td>";
   echo "</tr>";
}


?>
</BODY>
</HTML>
