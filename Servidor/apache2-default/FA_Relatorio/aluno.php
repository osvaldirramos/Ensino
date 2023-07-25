<?php
   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   //include("ListaFichas.php");
?>
<HTML>
<HEAD>
  <TITLE>Alunos</TITLE>
</HEAD>
<BODY>
<?php


  $sql="select nome, nomeguerra, notafinal
       from alunoturma_view
       where idcurso=$_SESSION[idCurso]
       and idturma =$_SESSION[idTurma]
       order by notafinal DESC";
  $Res_sql = ibase_query($conexao , $sql);

  echo "<table>
         <tr bgcolor='#CCCCCC' >
             <td width='350' align='center'><b>NOME</b></td>
              <td width='100' align='center'><b>DE GUERRA</b></td>
            <td width='30' align='center'><b>N. FINAL</b></td>
         </tr>";
  $cont_cor=0;
  while ($aluno=ibase_fetch_assoc($Res_sql)){

   if($cont_cor%2==0){
       $cor = "#F5F5F5";
   }else{
       $cor = "#D3D3D3";
   }
   $cont_cor++;
   $soma_nota = $soma_nota + $aluno[NOTAFINAL];

   echo "<tr bgcolor = $cor style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px;'>";
   echo "<td>$aluno[NOME]</td>  <td>$aluno[NOMEGUERRA]</td>  <td>$aluno[NOTAFINAL]</td>";
   echo "</tr>";
   
  }
   $media_turma = $soma_nota / $cont_cor ;

   //echo "<tr><td>A média da turma de  0 e 10 é : $media_turma</td></tr>";
   //echo "</table>";
?>
</BODY>
</HTML>
