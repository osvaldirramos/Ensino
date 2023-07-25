<?php
class Ficha
{
   function listarFichas()
   {
      include("../External/Funcoes/conecta.php");
      if($conexao)
      {
         $sql_Curso = "Select Distinct c.IdCurso, c.CodCurso
                 From Curso c, apc_agenda a
                 where ( c.idcurso = a.idcurso )
                 order by c.CodCurso";
         $ResCurso = ibase_query($conexao, $sql_Curso);
         $c= 0;
         if(!ibase_errmsg())
         {
            $i = 0;
            while ($dado_Curso=ibase_fetch_assoc($ResCurso))
            {

               $sql_Turma = "Select a.IdTurma, t.codTurma, t.Turma, t.Ano
                                   From apc_agenda a, Turma t
                                   where a.idcurso = $dado_Curso[IDCURSO]
                                   and (a.idcurso = t.idcurso and a.idturma = t.idTurma  )";
               $ResTurma = ibase_query($conexao, $sql_Turma);
               $lista[curso][]=$dado_Curso;
               $t= 0;
               while($dado_Turma=ibase_fetch_assoc($ResTurma))
               {
//                   $lista[turma][]=$dado_Turma;
                   //$lista[curso]=$lista[turma];
                                        // $lista[curso][]=$dado_Curso;
                    $lista[$c][$t]=$dado_Turma;
                    $t++;
//                  // $lista[turma][]= $dado_Turma;

                    //$lista[$i].=$dado_Curso[IDCURSO]."^".$dado_Curso[CODCURSO]."^".$dado_Turma[IDTURMA]."^".$dado_Turma[TURMA]."^".$dado_Turma[ANO];
                   //$lista[$i].=$dado_Curso[IDCURSO]."^".$dado_Curso[CODCURSO]."^".$dado_Turma[IDTURMA]."^".$dado_Turma[TURMA]."^".$dado_Turma[ANO];

               }
              // $lista[curso]=$lista[turma];
               $c++;

            }
           // $lista[]=$curso;
          }
          return $lista;
      }
      else
      {
         return 0;
      }
   }
   
   
   function montarLista($array)
   {
       $indice=sizeOf($array);
       $i=0;
       $j=0;
       echo "<div>";
       echo "<ul>";
       
       //echo $arrayTurma[1][IDCURSO];
       while($indice>=$i)
       {
          echo"<li width='200'><a class='MenuBarItemSubmenu' href='#' name='curso'>"; echo $arrayCurso[$i][CODCURSO]; echo "</a>";

          while($array[$i][IDCURSO])
          {
             echo "<li width='200'><a href='#' name='turma' onClick='enviar($dado_Curso[IDCURSO],$dado_Turma[IDTURMA])'>$dado_Turma[IDTURMA]- $dado_Turma[TURMA]- $dado_Turma[ANO]</a></li>";
             $j++;
          }
          $i++;
       }
       echo "</li></ul>";
   }
}
?>


