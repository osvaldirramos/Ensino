<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem o objetivo de montar a lista   //
  //                             dos Cursos que terão avaliação pos-curso.      //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/04/2009                                     //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");

   $f= new Funcao();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;" />
<title>Untitled Document</title>
<link href="menu_esq.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<link href="apc.css" rel="stylesheet" type="text/css">
<script>
function enviar(curso,turma){
  var curso;
  var grafico;
  var questionado = document.form1.questionado[document.form1.questionado.selectedIndex].value;
  var ano = document.form1.ano[document.form1.ano.selectedIndex].value;

  if(document.getElementById("bars").checked)
  {
  grafico = "bars";
  }
  else
  {
  grafico = "pie";
  }
  window.location.href = "MostraGrafico.php?curso="+curso+"&turma="+turma+"&grafico="+grafico+"&questionado="+questionado+"&ano="+ano;
}

</script>
</head>

<body>

   <?php
      $f-> Cabecalho();
   ?>

   <p align="right"><table border="0" width="7%">
   <tr>
     <td><div align='right'><a href='../Ferramenta_Ensino/MenuPrincipal.php' target='_self' >Voltar</a></div></td>
     <td><div align='right'><a href='../Ferramenta_Ensino/index.php' target='_self' >Sair</a></div></td>
   </tr>
   </table>
   </p>

   <div id="titulo" class="BODY">AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>
   <p>&nbsp;</p>
   <div align="center">
   <form name="form1" method="POST" action="MostraGrafico.php">

   <?php

   echo "<div>";
   echo "<p class= 'style3'>Escolha o Curso desejado!</p>";
   echo "<input type='radio' name='grafico' id='bars' value='bars' checked>";
   echo "<img src='../image/barra.gif' width='30' height='30' border='0'>";
   echo "<input type='radio' name='grafico' id='pie' value='pie'>";
   echo "<img src='../image/pizza.gif' width='30' height='30' border='0'>";
   echo "</br>";
   echo "<br>";
   echo "<select name='questionado'>
         <option value='Aluno'>Aluno</option>
         <option value='Chefe'>Chefe</option>
         </select>";

   echo "<br>";
   echo "<select name='ano'>
         <option value='2009'>2009</option>
         <option value='2010'>2010</option>
         <option value='2011'>2011</option>
         <option value='2012'>2012</option>
         <option value='2013'>2013</option>
         <option value='2014'>2014</option>
         <option value='2015'>2015</option>
         <option value='2016'>2016</option>
         <option value='2017'>2017</option>
         <option value='2018'>2018</option>
         <option value='2019'>2019</option>
         <option value='2020'>2020</option>
         <option value='2021'>2021</option>
         </select>";
   echo "<br>";

   //---
   //--- Inicia a lista de Curso
   
   $sql_Curso = "Select Distinct c.IdCurso, c.CodCurso
                 From Curso c, apc_agenda a
                 where ( c.idcurso = a.idcurso )
                 order by c.CodCurso";
   $ResCurso = ibase_query($conexao, $sql_Curso);

   echo "<div>";
   echo "<ul id='MenuBar1' class='MenuBarVertical'>";
   
   $i = 0;
   while ($dado_Curso=ibase_fetch_assoc($ResCurso))
   {

       echo"<li><a class='MenuBarItemSubmenu' href='#' name='curso' onClick='enviar($dado_Curso[IDCURSO],0)'>$dado_Curso[IDCURSO] - $dado_Curso[CODCURSO]</a>";

      //---
      //--- Cria a Sub-Lista de Turma


      $sql_Turma = "Select a.IdTurma, t.codTurma, t.Turma, t.Ano
                    From apc_agenda a, Turma t
                    where a.idcurso = $dado_Curso[IDCURSO]
                    and (a.idcurso = t.idcurso and a.idturma = t.idTurma  )";
      $ResTurma = ibase_query($conexao, $sql_Turma);

      echo " <ul> ";
      while($dado_Turma=ibase_fetch_assoc($ResTurma))
      {
          echo "<li><a href='#' name='turma' onClick='enviar($dado_Curso[IDCURSO],$dado_Turma[IDTURMA])'>$dado_Turma[IDTURMA]- $dado_Turma[TURMA]- $dado_Turma[ANO]</a></li>";
      }
      echo "</ul>";
      echo "</li>";
   }
   echo "</ul>";
   echo "<script type='text/javascript'>
         <!--
           var MenuBar1 = new Spry.Widget.MenuBar('MenuBar1', {imgRight:'SpryAssets/SpryMenuBarRightHover.gif'});
         //-->
         </script>";
   echo "</div>";

   ?>

</body>
</html>
