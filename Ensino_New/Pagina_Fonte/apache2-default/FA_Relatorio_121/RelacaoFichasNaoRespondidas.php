<?php
  //----------------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : RelacaoFichasNaoRespondidas.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a lista de selecao das Fichas
  //                             que serao apresentadas.     //
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj Sônia
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 18/06/2009
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
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>
</head>
<body onload="popup('400','300');">
<div id="corpo">

<br>
<div id="conteudo">
<form name="form1" method="POST" action="RelacaoPessoasNaoResponderam.php">

<?php
   echo "</br>";
   echo "</br>";
   echo "</br>";
   echo "</br>";

   //---
   //--- Inicia a lista de Curso

   $sql_Curso = "Select distinct cast(t.IdCurso as char(4)) as IdCurso,
                        cast(t.idTurma as char(4)) as idTurma ,
                        t.CodCurso,
                        t.Turma,
                        extract(day from t.datainicio)||'/'||extract(month from t.datainicio)||'/'||extract(year from t.datainicio) as datainicio,
                        extract(day from t.datatermino)||'/'||extract(month from t.datatermino)||'/'||extract(year from t.datatermino) as datatermino,
                        t.Coordenador
                 from Turma_View t, FA_Avaliacao f
                 where t.idCurso = f.idCurso
                 and   t.idturma = f.idturma
                 and   f.disponivel = 'S'
                 order by t.codcurso, t.turma";
   $ResCurso = ibase_query($conexao, $sql_Curso);

   echo "<select name='ListaDeCursos' class='caixa' id='conteudo' onchange='submit()'>";
   echo "<option >--- Escolha o Curso na lista </option>";
   while ($dado_Curso=ibase_fetch_assoc($ResCurso))
   {
       echo "<option value= '$dado_Curso[IDCURSO]$dado_Curso[IDTURMA]'> $dado_Curso[CODCURSO] - $dado_Curso[TURMA] - $dado_Curso[DATAINICIO] - $dado_Curso[DATATERMINO] - $dado_Curso[COORDENADOR] </option>";
   }
   echo "</select>";
   echo "<BR>";
?>

</body>
</html>
