<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : Principal.php                                 //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de //
  //                             de demonstração das Turmas Cadastradas.        //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 04/04/2009                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//


   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   require_once("../Funcoes/conecta.inc");

   $f= new Funcao();
?>

<NOSCRIPT>
Este navegador não compreende os scripts que se estão executando, você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
</NOSCRIPT>
<div id="divcentral">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<title>AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</title>

<?php
   $f-> Cabecalho();
?>

</br>


<?php    //---
        //--- Tratamento do Cabecalho da Pagina

   echo "<p class='style1' align='center'>CURSOS EM ANDAMENTO</p>";

   echo "<hr size='1'/>";
   echo "<br/>";
?>

<form id='form_RespDisciplina' name='form_RespDisciplina' method='post' >
<?php


    //---
   //--- Tratamento da entrada da opção de Respostas da Disciplina

   echo "<table border='1' cellspacing='0' cellpadding='0' width='900' class='style3'>
         <tr bgcolor='#CCCCCC'>
            <td width='100' align='center'>Curso</td>
            <td width='100' align='center'>Turma</td>
            <td width='60' align='center'>Ano</td>
            <td width='100' align='center'>Ínicio</td>
            <td width='100' align='center'>Termino</td>
            <td width='60' align='center'>N. Alunos</td>
            <td width='380' align='center'>Coordenador</td>
         </tr>
         </table>";


   //faz select para montar questionario
   $sql = "Select CodCurso, Turma, ano,
                  extract(day from datainicio)||'/'||extract(month from datainicio)||'/'||extract(year from datainicio) as Inicio,
                  extract(day from datatermino)||'/'||extract(month from datatermino)||'/'||extract(year from datatermino) as Termino,
                  qdealunos, Coordenador
           From Turma_View
           Order by codCurso, ano, turma desc";

   $resultado = ibase_query($conexao, $sql);

   //põe resultado no array e exibe questionario
   while ($row = ibase_fetch_assoc($resultado))
   {
   
      echo "<table border='1' cellspacing='0' cellpadding='0' width='900' class='style3'>
       <tr>
         <td width='100' align='center'>$row[CODCURSO]</td>
         <td width='100' align='center'>$row[TURMA]</td>
         <td width='60' align='center'>$row[ANO]</td>
         <td width='100' align='center'>$row[INICIO]</td>
         <td width='100' align='center'>$row[TERMINO]</td>
         <td width='60' align='center'>$row[QDEALUNOS]</td>
         <td width='380' >-$row[COORDENADOR]</td>
       </tr>
       </table>";
    }

   $sql = "Select Count(1) as QtdTurmas, Sum(qdealunos) as QtdAlunos
           From Turma_View";

   $resultado = ibase_query($conexao, $sql);
   $row = ibase_fetch_assoc($resultado);

   echo "<table border='1' cellspacing='0' cellpadding='0' width='900' class='style3'>
       <tr>
         <td align='center'>[Qde de Turmas - $row[QTDTURMAS]]         [Qde de Alunos - $row[QTDALUNOS]]</td>
       </tr>
       </table>";

?>
</html>
</div>
