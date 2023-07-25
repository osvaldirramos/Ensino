<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : MontaPagina.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de entrada das
  //                             respostas dos alunos da Ficha de Avaliação de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          :
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 13/05/2010
  //
  //----------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------

   session_start();
   require_once("../verifica_sessao.php");
?>

<NOSCRIPT>
     Este navegador não compreende os scripts que se estão executando,
      você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
   </NOSCRIPT>
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   <html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>

   </head>
   <div id="corpo">
<?php
   require_once("../../Funcoes/conecta.inc");
   $identidade= $_POST[ListaDeFichas];

    //---
   //--- Verifica se a Ficha j´afoi preenchida

   $sql_Respondeu = " Select count(1) as QTD From FC_COMENTARIO
                           where IDCURSO = $_SESSION[idCurso]
                           and IDTURMA = $_SESSION[idTurma]
                           and IDENTIDADE like '%$identidade%'";
   $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
   $qtd = ibase_fetch_assoc($Res_Respondeu);

   if ($qtd[QTD] = 0)
   {
      echo "<script language='javascript' type='text/javascript'>
            alert('Não foi feita a FICHA DE AVALIAÇÃO DE FINAL DE CURSO pelo COORDENADOR!');
            window.location='../Relatorio/ListaDeAvaliacoes_p.php';
            </script>";
   }

   //-------------------------------------------
   //--- Tratamento do Cabecalho da Pagina
   //-------------------------------------------

    //---
   //--- Tratamento para pegar os dados do Curso
   
   $sqlcurso = "Select CodCurso, NomeCurso From Curso
                    where IDCURSO = $_SESSION[idCurso]";
   $resultadocurso = ibase_query($conexao, $sqlcurso);
   $curso = ibase_fetch_assoc($resultadocurso);

    //---
   //--- Tratamento para pegar os dados do Coordenador
   
   $sql = "select nome , postograduacao, nomeguerra
           from pessoa
           where identidade like '%$identidade%'";

   $Res_sql=ibase_query($conexao, $sql);
   $pessoa = ibase_fetch_assoc($Res_sql);

   echo "<br/>";

   echo "<table border='1' cellspacing='0' cellpadding='0' width='770' class='style3' bordercolor='#cccccc'>
            <tr>
              <td><img src='../../imagem/logo.png' border='0'></td>
              <td> <div><td width='770' align='Center'><b style='font-size:13px' ><p class='style2' align='center'><b>FICHA DE AVALIAÇÃO DE FINAL DE CURSO - COORDENADOR</b></p></b></td></div>
              <td><img src='../../imagem/trainair.png' border='0'></td></td>
            </tr>
         </table>";
   echo "</br>";

   $sql = "select Identidade,
           extract(DAY from DataAvaliacao)|| '/' || extract(MONTH  from DataAvaliacao)|| '/' || extract(YEAR  from DataAvaliacao) as DataAvaliacao
           from FC_Avaliacao
           where idCurso = $_SESSION[idCurso]
           and   IdTurma = $_SESSION[idTurma]
           and   identidade like '%$identidade%'";

   $Res_sql=ibase_query($conexao, $sql);
   $FC_Avaliacao= ibase_fetch_assoc($Res_sql);

   echo "<table>
             <tr><td width='770'style='font-size:10px'>CURSO: <b style='font-size:11px'> $curso[CODCURSO]-$curso[NOMECURSO] </b></td>
             <tr></tr>
             <tr><td width='770'style='font-size:10px'>DATA AVALIAÇÃO: <b style='font-size:11px'> $FC_Avaliacao[DATAAVALIACAO]</b></td>
             <tr></tr>
             <tr><td width='770'style='font-size:10px'>COORDENADOR: <b style='font-size:11px'> $pessoa[POSTOGRADUACAO] $pessoa[NOME]</b></td>
             <tr></tr>
           </table>";

   echo "<br>";
   echo "<hr size='1'/>";
   echo "<br>";

   //-------------------------------------------
   //--- Tratamento para montar a pagina
   //-------------------------------------------

   $sql_Modelo = "Select cast(idmodelo as char(2)) as idmodelo, Descricao From FC_Modelo";

   $Res_Modelo = ibase_query($conexao, $sql_Modelo);
   while ($Modelo = ibase_fetch_assoc($Res_Modelo))
   {
      echo "<br>";
      echo "<table border='1' cellspacing='0' cellpadding='0' width='770' bgcolor='#cccccc' bordercolor='#FFFFFF' >
               <tr>
                 <td width='735' align='center'><div><b style='font-size:12px' >$Modelo[DESCRICAO]</b></div></td>
                 <td width='16' scope='col' id='$Modelo[DESCRICAO]'span' >
               </tr>
            </table>";

      //--- Pega o Topico

      $sql_Topico= "select cast(idmodelo as char(2)) as idmodelo, cast(IdTopico as char(2)) as IdTopico, Descricao from FC_Topicos where idmodelo = $Modelo[IDMODELO]";
      $Res_Topico = ibase_query($conexao, $sql_Topico);
      while ($Topico = ibase_fetch_assoc($Res_Topico))
      {
         if ($Modelo[DESCRICAO] <> $Topico[DESCRICAO])
         {
            echo "<table border='1' cellspacing='0' cellpadding='0' width='770' bgcolor='#cccccc' bordercolor='#FFFFFF' >
                    <tr>
                      <td width='735' align='center'><div><b style='font-size:12px' >$Topico[DESCRICAO]</b></div></td>
                    </tr>
               </table>";
          }

          echo "<div id=$Topico[DESCRICAO]>";


          //--- Pega o Item

          $sql_Item= "select cast(idmodelo as char(2)) as idmodelo, cast(IdTopico as char(2)) as IdTopico, cast(IdItem as char(2)) as IdItem, Descricao
                      from FC_Itens
                      where idmodelo = $Topico[IDMODELO] and idTopico = $Topico[IDTOPICO]";
          $Res_Item = ibase_query($conexao, $sql_Item);
          while ($Item = ibase_fetch_assoc($Res_Item))
          {
              //---
             //--- Query para tratar da Resposta
             
             $sql_FCResposta= "Select Resposta
                               From FC_Resposta
                               where idCurso = $_SESSION[idCurso]
                               and   IdTurma = $_SESSION[idTurma]
                               and   identidade like '%$identidade%'
                               and   IdModelo = $Topico[IDMODELO]
                               and   IdTopico = $Topico[IDTOPICO]
                               and   IdItem = $Item[IDITEM]";
             $Res_sql=ibase_query($conexao, $sql_FCResposta);
             $FC_Resposta = ibase_fetch_assoc($Res_sql);
             
             if ($FC_Resposta[RESPOSTA] == 0)
             {
                $Resposta= 'SIM';
             }
             else
             {
                $Resposta= 'NÃO';
             }
             
              //---
             //---  Query para tratar Justificativa
             
             $sql_FCJustif= "Select Justificativa
                               From FC_Justificativa
                               where idCurso = $_SESSION[idCurso]
                               and   IdTurma = $_SESSION[idTurma]
                               and   identidade like '%$identidade%'
                               and   IdModelo = $Topico[IDMODELO]
                               and   IdTopico = $Topico[IDTOPICO]
                               and   IdItem = $Item[IDITEM]";

             $Res_sql=ibase_query($conexao, $sql_FCJustif);
             $FC_Justificativa = ibase_fetch_assoc($Res_sql);

             echo "<table border='1' cellspacing='0' cellpadding='0' width='770' class='style3' bordercolor='#cccccc'>
                  <tr>
                     <div><td width='365'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Item[IDITEM]  - $Item[DESCRICAO]</span></td></div>
                     <div><td width='40'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Resposta</span></td></div>
                     <div><td width='365'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$FC_Justificativa[JUSTIFICATIVA]</span></td></div>
                  </tr>
               </table>";
          }
      }

      if ($Modelo[DESCRICAO] <> 'CONSIDERAÇÕES FINAIS')
      {
         $sql_FCCM= "Select Comentario
                      From FC_ComentarioModelo
                      where idCurso = $_SESSION[idCurso]
                      and   IdTurma = $_SESSION[idTurma]
                      and   identidade like '%$identidade%'
                      and   IdModelo = $Modelo[IDMODELO]";

         $Res_sql=ibase_query($conexao, $sql_FCCM);
         $FC_ComMod= ibase_fetch_assoc($Res_sql);

         echo "<br>";
         echo "<p>Comentário sobre o $Modelo[DESCRICAO]: </p> </label>";
         echo "<table border='1' cellspacing='0' cellpadding='0' width='770' class='style3' bordercolor='#cccccc'>
                  <tr>
                   <td width='770'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$FC_ComMod[COMENTARIO]</span></td>
                 </tr>
            </table>";
         echo "<br>";
         echo "<hr size='1'/>";
      }
   }

    //---
   //--- Tratamento para mostrar o Comentario final
   
   $sql_FCComentario= "Select Comentario
               From FC_ComentarioModelo
               where idCurso = $_SESSION[idCurso]
               and   IdTurma = $_SESSION[idTurma]
               and   identidade like '%$identidade%'";

   $Res_sql=ibase_query($conexao, $sql_FCComentario);
   $FC_Comentario= ibase_fetch_assoc($Res_sql);

   echo "<br> <br>";
   echo "SUGESTÃO:</p>";
   echo "<table border='1' cellspacing='0' cellpadding='0' width='770' class='style3' bordercolor='#cccccc'>
            <tr>
              <td width='770'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$FC_Comentario[COMENTARIO]</span></td>
            </tr>
         </table>";
?>

</div>
</html>
