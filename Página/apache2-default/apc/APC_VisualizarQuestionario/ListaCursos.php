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

<html>
   <head>
   <title>Lista de Cursos</title>
   <meta http-equiv='refresh' content='text/html;'  />
   <link href="apc.css" rel="stylesheet" type="text/css">

   <script language="JavaScript" type="text/javascript">

     //-------------------------------------------
    //Função que deixa options "turma" invisiveis
   //-------------------------------------------

   function funi()
   {
         var elem = document.getElementsByName('turma').length;

           while(elem>0){
           elem --;
           document.getElementsByName('turma')[elem].style.visibility='hidden';
           }
   }

     //--------------------------------
    //Função que marca options "turma"
   //---------------------------------

   function fun(i)
   {
           document.getElementsByName('turma')[i].checked=true;
   }

    //--------------------------------
   //Funcão para validar dados

    function verify(nome)
    {
       var test = false;
       var objRadio = document.forms[0].elements[nome];

       for(i=0; i < objRadio.length; i++ )
       {
          if (objRadio[i].checked == true) test = true;
       }
       if (test == false){ alert("Selecione um curso!");}
       else{document.form1.submit();}
    }
    
   //--------------------------------
   </script>
   </head>
   
   <body onload="funi()">

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

   <BR>
   <div id="titulo" class="BODY">AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>
   <BR>

   <div align="center">
   <form name="form1" method="POST" action="montapagina.php">

   <input type='button' name='enviar' value='Montar Página' onclick ="verify('curso')">

   <?php

      echo "<BR><BR></table>";
      echo "<select name='identificacao'>
            <option value= 'Aluno'>Aluno</option>
            <option value= 'Chefe'>Chefe</option>
            </select>";


      $sql_Curso = "Select c.IdCurso, c.CodCurso, c.NomeCurso
                          From Curso c
                          order by c.CodCurso";
      $ResCursos = ibase_query($conexao, $sql_Curso);
      echo "<div>";
      echo "<p class= 'style3'>Escolha o Curso desejado!</p>";
      echo "<table border= '1' width='200' cellspacing='0' cellpadding='0' class='style3'  >";
      echo "<tr bgcolor='#CCCCCC'><td>Curso</td>";
   

      $i = 0;
      while ($dados=ibase_fetch_assoc($ResCursos))
      {
         echo "<tr><td><input type='radio' name='curso' id='$i' value='$dados[IDCURSO]' onclick = 'fun($i)'>
                     $dados[CODCURSO]</td>
              </tr>";

         $i++;
      }
   ?>

   </form>
   </div>
   </body>
</html>
