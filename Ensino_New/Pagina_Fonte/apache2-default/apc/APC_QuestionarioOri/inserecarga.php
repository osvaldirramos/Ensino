<?php 

   require_once("verifica_sessao.php");
   require_once("conecta.inc");

   //---
  //Pega as Disciplinas existentes

  $sql = "select * from APC_DISCIPLINA
          where IDCURSO=$_SESSION[idCurso]
          and IDTURMA=$_SESSION[idTurma]";

  $resultado = ibase_query($conexao, $sql);
   //---
  //Verifica se existe resposta da disciplina pelo aluno

   $sql = "select * from APC_CARGAHORARIA
           where IDCURSO=$_SESSION[idCurso]
           and IDTURMA=$_SESSION[idTurma]
           and IDCODIGO='$_SESSION[idCodigo]'
           and IDENTIFICACAO='$_SESSION[identificacao]'
           order by CODMATERIA";

   $res_CargaHoraria = ibase_query($conexao, $sql);

   if (ibase_fetch_row($res_CargaHoraria)!= 0)
   {
      while ($row = ibase_fetch_assoc($resultado))
      {
         $radiocarga = $row['CODMATERIA'];

         $rowmatcarga = $_REQUEST["$radiocarga"];

         $sqlcargai= "Update APC_CARGAHORARIA set CARGAHORARIA = '$rowmatcarga'
                      where IDCURSO=$_SESSION[idCurso]
                      and   IDTURMA=$_SESSION[idTurma]
                      and   CODMATERIA='$row[CODMATERIA]'
                      and   IDCODIGO='$_SESSION[idCodigo]'
                      and   IDENTIFICACAO='$_SESSION[identificacao]'";

         $resultadocargai = ibase_query($sqlcargai);
      }
   }
   else
   {
      while ($row = ibase_fetch_assoc($resultado))
      {
         $radiocarga = $row['CODMATERIA'];

         $rowmatcarga = $_REQUEST["$radiocarga"];

         $sqlcargai = "insert into APC_CARGAHORARIA (IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,CARGAHORARIA)
                              values ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$rowmatcarga')";
         $resultadocargai = ibase_query($sqlcargai);
       }

   }
?>
