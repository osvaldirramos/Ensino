<?php
  class Seletor {

    function listarTurma($idcurso)
    {
       include("../../Funcoes/conecta.inc");
       $sql= "select codcurso, ano,turma, datainicio, datatermino
                from turma_view
                where idcurso = $idcurso";
       $turma=ibase_query($conexao,$sql);
       while ($relacionado=ibase_fetch_assoc($turma))
       {
          $turmas[] = $relacionado;
       }
       return $turmas;
    }
   
   
    function listarCurso()
    {
       include("../../Funcoes/conecta.inc");
       $sql= "select idcurso, codcurso
                 from curso order by codcurso";
       $curso=ibase_query($conexao,$sql);
       while ($relacionado=ibase_fetch_assoc($curso))
       {
           $cursos[] = $relacionado;
       }
       return $cursos;
    }
    
    function listarDisciplinas($idcurso)
    {
       include("../../Funcoes/conecta.inc");
       $sql= "select  codmateria from item where idcurso=2";
       $disciplina=ibase_query($conexao,$sql);
       while ($relacionado=ibase_fetch_assoc($disciplina))
       {
           $disciplinas[] = $relacionado;
       }
       return $disciplinas;
    }
    
    
    

  }






?>

