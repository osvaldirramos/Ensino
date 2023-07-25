<?php 
  //--------------------------------------------------------------------------------------------------
  //
  //
  //--------------------------------------------------------------------------------------------------

  require_once("verifica_sessao.php");
  require_once("conecta.inc");

   //---
  //Pega as Disciplinas existentes
  $sql = "select * from APC_DISCIPLINA
          where IDCURSO=$_SESSION[idCurso]
          and IDTURMA=$_SESSION[idTurma]
          order by CODMATERIA";
  $resultado = ibase_query($conexao, $sql);

   //---
  //Verifica se existe resposta da disciplina pelo aluno

   $sql = "select * from APC_RESPDISCIPLINA
           where IDCURSO=$_SESSION[idCurso]
           and IDTURMA=$_SESSION[idTurma]
           and IDCODIGO='$_SESSION[idCodigo]'
           and IDENTIFICACAO='$_SESSION[identificacao]'
           order by CODMATERIA";
   $res_Disciplina = ibase_query($conexao, $sql);

   if (ibase_fetch_row($res_Disciplina)!= 0)
   {
      while ($row = ibase_fetch_assoc($resultado))
      {
         $radio = $row['CODMATERIA'];
         $rowmat = $_REQUEST["$radio"];

         $sqlurespdisciplina = "update APC_RESPDISCIPLINA set APLICABILIDADE='$rowmat'
                                where IDCURSO=$_SESSION[idCurso]
                                and   IDTURMA=$_SESSION[idTurma]
                                and   CODMATERIA='$row[CODMATERIA]'
                                and   IDCODIGO='$_SESSION[idCodigo]'
                                and   IDENTIFICACAO='$_SESSION[identificacao]'";
         $resultadourespdisciplina = ibase_query($conexao, $sqlurespdisciplina);
      }
   }
   else   // Tratamento para Inserir
   {
      while ($row = ibase_fetch_assoc($resultado))
      {
         $radio = $row['CODMATERIA'];
         $rowmat = $_REQUEST["$radio"];

         $sqli = "insert into APC_RESPDISCIPLINA (IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,APLICABILIDADE)
                  VALUES ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$rowmat')";
         $resultadoi = ibase_query($sqli);
      }
   }
?>
