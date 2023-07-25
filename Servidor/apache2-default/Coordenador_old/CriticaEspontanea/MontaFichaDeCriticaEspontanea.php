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
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/Funcoes.php");
   require_once("../../Funcoes/verifica_sessao.php");

   $f= new Funcao();
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
<div align="center" id="topo"></div>
<div id="barra" align="left"><a href='CriticaEspontanea.php' target='_self' > << Mudar de Formulário</a></div>

<BR>

<BR>
<p>&nbsp;</p>
   <div align="center">
   <form name="form1" method="POST" action="MontaFichaDeCriticaEspontanea.php">

<?php
   $idCurso= $_GET[idcurso];
   $idTurma= $_GET[idturma];
   $idCritica= $_GET[idcritica];

   $sql_Critica = "Select t.CodCurso,
                        t.Turma,
                        f.dataAvaliacao,
                        f.SetorCriticado,
                        f.disciplina,
                        f.idinstrutor,
                        f.Comentario
                 from Turma_View t, FA_CriticaEspontanea f
                 where t.IdCurso = $idCurso
                 and t.IdTurma = $idTurma
                 and f.IdCritica = $idCritica
                 and (t.idCurso = f.idCurso and t.idturma = f.idturma)
                 order by t.codcurso, t.turma";

   $ResCritica = ibase_query($conexao, $sql_Critica);
   $dado_Critica=ibase_fetch_assoc($ResCritica);

    //---
   //  Tratamento da Janela
   
   echo "</br>";
   echo "<table width='770' border='1'>
           <tr>
              <th width='730' bgcolor='#CCCCCC' scope='col'><p>SETOR DE AVALIAÇÃO</p>
              <p>FORMULÁRIO DE CRÍTICA ESPONTÂNEA  </p></th>
            </tr>
          </table>";

   echo "</br>";
   echo "<p align='left'>";
   echo "Curso: $dado_Critica[CODCURSO] <br>";
   echo "Turma: $dado_Critica[TURMA] <br>";
   echo "Data da Avaliação: $dado_Critica[DATAAVALIACAO] <br>";
   echo "Setor Criticado: $dado_Critica[SETORCRITICADO] <br>";

   if ($dado_Critica[DISCIPLINA] != '000000')
   {
      $sql_Disciplina = "Select CodMateria, NomeMateria
                         From MateriaCurso
                         where idcurso = $idCurso
                         and CodMateria = $dado_Critica[DISCIPLINA]";

      $ResDisciplina = ibase_query($conexao, $sql_Disciplina);
      $dado_Disciplina=ibase_fetch_assoc($ResDisciplina);

      echo "Disciplina: $dado_Critica[DISCIPLINA] - $dado_Disciplina[NOMEMATERIA] <br>";
   }

   if (substr($dado_Ficha[IDINSTRUTOR],0,6) != '000000')
   {
      $sql_Instrutor = "Select PostoGraduacao, NomeGuerra
                        From Pessoa
                        where Identidade = '$dado_Critica[IDINSTRUTOR]'";
      $ResInstrutor = ibase_query($conexao, $sql_Instrutor);
      $dado_Instrutor=ibase_fetch_assoc($ResInstrutor);
//      echo "Docente: $dado_Instrutor[POSTOGRADUACAO] $dado_Instrutor[NOMEGUERRA] <br>";
      echo "Docente: $dado_Instrutor[POSTOGRADUACAO] $dado_Instrutor[NOMEGUERRA] <br>";
   }


   echo "<br/>";
   echo "<table width='770' border='1'>
           <tr>
              <th width='730' bgcolor='#CCCCCC' scope='col'><p>COMENTÁRIOS / SUGESTÕES </p></th>
            </tr>
          </table>";

   echo "<hr>";
   echo "<p align='left'>";
   $binfo = ibase_blob_info($dado_Critica['COMENTARIO']);
   $bopen = ibase_blob_open($dado_Critica['COMENTARIO']);
   $Retorno= $f-> TrataEnter(ibase_blob_get($bopen, $binfo[0]));
   echo "$Retorno";
   echo "<hr>";
?>

  </form>
</body>
</html>
