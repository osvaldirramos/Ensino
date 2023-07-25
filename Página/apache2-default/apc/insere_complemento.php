<?php
   require_once("verifica_sessao.php");
   require_once("conecta.inc");

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
 												      DIFICULDADES ='$_REQUEST[dificuldade]',
 												      CONSIDERACOES = '$_REQUEST[sugestao]'
 					      where IDCURSO=$_SESSION[idCurso]
					      and IDTURMA=$_SESSION[idTurma]
					      and IDCODIGO='$_SESSION[idCodigo]'
					      and IDENTIFICACAO='$_SESSION[identificacao]'";
       $resultadoucomplemento = ibase_query($conexao, $sqlucomplemento);
   }
   else
   {
      $sqlcomplemento = "insert into APC_COMPLEMENTO(IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,ATUANAFUNCAO,DIFICULDADES,CONSIDERACOES) VALUES ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$_REQUEST[atuando]','$_REQUEST[dificuldade]','$_REQUEST[sugestao]')";
      $resultadocomplemento = ibase_query($conexao, $sqlcomplemento);
   }
   
 	echo "<script language='javascript' type='text/javascript'>
          alert('Ficha inserida com sucesso! Obrigado!');
          window.location='login.php';
          </script>";

    exit;
?>

<!--
require_once("verifica_sessao.php");
require_once("conecta.inc");

$sqlcomplemento = "insert into APC_COMPLEMENTO(IDCURSO,IDTURMA,CODMATERIA,IDCODIGO,IDENTIFICACAO,ATUANAFUNCAO,DIFICULDADES,CONSIDERACOES) VALUES ('$_SESSION[idCurso]','$_SESSION[idTurma]','$row[CODMATERIA]','$_SESSION[idCodigo]','$_SESSION[identificacao]','$_REQUEST[atuando]','$_REQUEST[dificuldade]','$_REQUEST[sugestao]')";
$resultadocomplemento = ibase_query($sqlcomplemento);
-->
