<?php 
  //--------------------------------------------------------------------------------------------------
  //
  //
  //--------------------------------------------------------------------------------------------------

  require_once("verifica_sessao.php");
  require_once("conecta.inc");
  
     //------------------------ Atuando na área
   $sqlconsulta = "select * from APC_COMPLEMENTO
  				   where IDCURSO=$_SESSION[idCurso]
				   and IDTURMA=$_SESSION[idTurma]
				   and IDCODIGO='$_SESSION[idCodigo]'
				   and IDENTIFICACAO='$_SESSION[identificacao]'";
   $resultadoconsulta = ibase_query($conexao, $sqlconsulta);

   if (ibase_fetch_row($resultadoconsulta)!= 0)
   {
      $sqlucomplemento = "update APC_COMPLEMENTO set IDCURSO='$_SESSION[idCurso]',
	 										         IDTURMA='$_SESSION[idTurma]',
											         CODMATERIA='aa',
											         IDCODIGO='$_SESSION[idCodigo]',
											         IDENTIFICACAO='$_SESSION[identificacao]',
											         ATUANAFUNCAO ='$_POST[atuando]' ,
											         DIFICULDADES ='$_POST[dificuldade]',
											         CONSIDERACOES = '$_POST[sugestao]'
					     where IDCURSO=$_SESSION[idCurso]
					     and IDTURMA=$_SESSION[idTurma]
  				         and IDCODIGO='$_SESSION[idCodigo]'
  				         and IDENTIFICACAO='$_SESSION[identificacao]'";
       $resultadoucomplemento = ibase_query($conexao, $sqlucomplemento);
   }
   else
   {
      $sqlcomplemento = "insert into APC_COMPLEMENTO (IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,ATUANAFUNCAO,DIFICULDADES,CONSIDERACOES)
                                VALUES ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$_POST[atuando]','$_POST[dificuldade]','$_POST[sugestao]')";
      $resultadocomplemento = ibase_query($conexao, $sqlcomplemento);
   }
   



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
         $rowmat = $_POST["$radio"];

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
         $rowmat = $_POST["$radio"];

         $sqli = "insert into APC_RESPDISCIPLINA (IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,APLICABILIDADE)
                  VALUES ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$rowmat')";
               
         $resultadoi = ibase_query($sqli);
      }
   }
   
     //--- ---------------insere carga
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

         $rowmatcarga = $_POST["c$radiocarga"];

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

         $rowmatcarga = $_POST["c$radiocarga"];

         $sqlcargai = "insert into APC_CARGAHORARIA (IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,CARGAHORARIA)
                              values ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$rowmatcarga')";
         $resultadocargai = ibase_query($sqlcargai);
       }

   }
   
   
   
   // -------------insere comentario
   $sqlconsulta = "select * from APC_COMPLEMENTO
   				   where IDCURSO=$_SESSION[idCurso]
				   and IDTURMA=$_SESSION[idTurma]
				   and IDCODIGO ='$_SESSION[idCodigo]'
				   and IDENTIFICACAO='$_SESSION[identificacao]'";
         
   $resultadoconsulta = ibase_query($conexao, $sqlconsulta);

   if (ibase_fetch_row($resultadoconsulta)!= 0)
   {
       $sqlucomplemento = "update APC_COMPLEMENTO set IDCURSO='$_SESSION[idCurso]',
												      IDTURMA='$_SESSION[idTurma]',
												      CODMATERIA='aa',
												      IDCODIGO='$_SESSION[idCodigo]',
												      IDENTIFICACAO='$_SESSION[identificacao]',
 												      DIFICULDADES ='$_POST[dificuldade]',
 												      CONSIDERACOES = '$_POST[sugestao]'
 					      where IDCURSO=$_SESSION[idCurso]
					      and IDTURMA=$_SESSION[idTurma]
					      and IDCODIGO='$_SESSION[idCodigo]'
					      and IDENTIFICACAO='$_SESSION[identificacao]'";
					   
       $resultadoucomplemento = ibase_query($conexao, $sqlucomplemento);
   }
   else
   {
      $sqlcomplemento = "insert into APC_COMPLEMENTO(IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,ATUANAFUNCAO,DIFICULDADES,CONSIDERACOES) VALUES ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$_POST[atuando]','$_POST[dificuldade]','$_POST[sugestao]')";
      $resultadocomplemento = ibase_query($conexao, $sqlcomplemento);
   }

 	echo "<script language='javascript' type='text/javascript'>
          alert('Ficha inserida com sucesso!');
          window.location='login.php';
          </script>";

   
   
?>
