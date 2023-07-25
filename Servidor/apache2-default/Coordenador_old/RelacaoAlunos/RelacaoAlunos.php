<?php
  //----------------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : RelacaoInstrutores.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a lista de Instrutores com seus
  //                             devidos códigos.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          :
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 10/06/2010
  //
  //----------------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------------

   session_start();
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html;" />
   <title>AVALIAÇÃO</title>
   <link href="../menu_esq.css" rel="stylesheet" type="text/css" />
   <script src="../SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
   <link href="../SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
   <link href="../estilos/estilo.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="corpo">

<BR>

<BR>
<p>&nbsp;</p>
   <div align="center">
   <form name="form1" method="POST" action="RelacaoPessoasNaoResponderam.php">

<?php
   $idCurso= $_SESSION[idCurso];
   $idTurma= $_SESSION[idTurma];

   echo "</br>";

     //----------------------------------------------------------------------------------------
    //--- Tratamento para mostrar os alunos que nao responderam para o Coordenador
   //------------------------------------------------------------------------------------------
   $sql_Curso = "Select CodCurso, turma
                 From Turma_View
                 where IDCURSO = $idCurso
                 and IDTURMA = $idTurma";
   $ResCurso = ibase_query($conexao, $sql_Curso);
   $dado_Curso=ibase_fetch_assoc($ResCurso);


   echo "<table border='1'><tr bgcolor='#C0FFC0'><td width='317'><p align='center'>RELAÇÃO DOS ALUNOS COM CÓDIGO <br> Curso $dado_Curso[CODCURSO] Turma $dado_Curso[TURMA] </p></td>
            </tr>
         <table>";

   $sql_Instrutores= "select NomeGuerra, PostoGraduacao, CodigoAluno
                    From ALUNOTURMA_VIEW
                    where IDCURSO = $idCurso
                    and IDTURMA = $idTurma
                    order by nomeguerra ";
   $Res_sqlInstrutores = ibase_query($conexao,$sql_Instrutores );

   echo "<select name='ListaDeFichas' class='caixa' id='conteudoCodigo''>";
   echo "<option >--- Clique aqui para vizualizar o código dos Alunos</option>";
   echo "<option value= => ------------------------------------------------------------------------- </option>";
   while($Instrutores = ibase_fetch_assoc($Res_sqlInstrutores))
   {
//      $i++;
      echo "<option value= => $Instrutores[CODIGOALUNO] => $Instrutores[POSTOGRADUACAO] - $Instrutores[NOMEGUERRA] </option>";
      echo "<option value= => ------------------------------------------------------------------------- </option>";
   }
   echo "</select>";
?>



</body>
</html>
