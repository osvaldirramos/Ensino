<?php
class Fichas
{
   function listarCursos()
   {
      include("../External/Funcoes/conecta.php");
      if($conexao)
      {
         $sql_Curso = "Select Distinct c.IdCurso, c.CodCurso
                 From Curso c, apc_agenda a
                 where ( c.idcurso = a.idcurso )
                 order by c.CodCurso";
         $ResCurso = ibase_query($conexao, $sql_Curso);
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
               while($dado_Turma=ibase_fetch_assoc($ResTurma))
               {
                   $lista=$dado_Curso[IDCURSO].$dado_Turma[IDTURMA].$dado_Turma[TURMA].$dado_Turma[ANO];
               }
            }
          }
          return $lista;
      }
      else
      {
         return 0;
      }
   }


}
?>


