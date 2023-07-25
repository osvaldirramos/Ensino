<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : MostraGrafico.php                                 //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de //
  //                             entrada das respostas dos alunos.              //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/04/2009                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

   session_start();
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/verifica_sessao.php");


   //$tipo = $_SESSION[tipo];

   //------------------------------------------------------------------------
   //
   //- Funcoes do sistema
   //
   //------------------------------------------------------------------------

   //-----------------------------------
   //-- Limpa tabela que monta o grafico
   //-----------------------------------

   Function LimpaGrafico($conexao)
   {
      $sql_Grafico = "Delete from APC_Grafico";
      $ResGrafico = ibase_query($conexao, $sql_Grafico);
   }

     //-----------------------------------
    //-- Grava os dados do Grafico
   //-----------------------------------

   Function GravaGrafico($conexao, $PI_Indice, $PI_Res1= 0, $PI_Desc1= "NULL", $PI_Res2= 0, $PI_Desc2= "NULL", $PI_Res3= 0, $PI_Desc3= "NULL", $PI_Res4= 0, $PI_Desc4= "NULL", $PI_Res5= 0, $PI_Desc5= "NULL", $PI_Res6= 0, $PI_Desc6= "NULL")
   {
      $sql_Grafico = "Insert into APC_Grafico values ($PI_Indice,
                                                   $PI_Res1, '$PI_Desc1',
                                                   $PI_Res2, '$PI_Desc2',
                                                   $PI_Res3, '$PI_Desc3',
                                                   $PI_Res4, '$PI_Desc4',
                                                   $PI_Res5, '$PI_Desc5',
                                                   $PI_Res6, '$PI_Desc6')";
      $ResGrafico = ibase_query($conexao, $sql_Grafico);
   }

   //-------------------------------------------------------------------------------
   //
   // Programa Principal
   //
   //-------------------------------------------------------------------------------

   //faz select para montar questionario das Disciplinas

   $VI_IdCurso = $_SESSION[idCurso];
   $VI_IdTurma = $_SESSION[idTurma];
   $VS_Questionado =  $_SESSION[questionado];
   $tipo =  "bars";
   //faz select para montar o Complemto da Disciplina

   if ($VI_IdTurma == 0){
   $sql_Complemento = "select * from FA_COMENTARIO
                       where IDCURSO= $VI_IdCurso
                       and IDENTIFICACAO='$VS_Questionado'
                       order by idcurso, idturma, idficha";
   $ResComplemento = ibase_query($conexao, $sql_Complemento);

   }else{
   $sql_Complemento = "select * from FA_COMENTARIO
                       where IDCURSO= $VI_IdCurso
                       and IDTURMA= $VI_IdTurma
                       order by idcurso, idturma, idficha
                 ";
   $ResComplemento = ibase_query($conexao, $sql_Complemento);
   }

?>

  <html>
  <head>
    <title>ICEA -> Mostra Resultado da Avaliação Pós-Curso</title>
    <meta http-equiv='refresh' content='text/html;'  />
    <link href="apc.css" rel="stylesheet" type="text/css">
    <script>
    function setaTipo()
    {
    var tipo;
    tipo = "squared";
    document.location.reload();
    
    }
    
    function minDiv(idDiv){
       document.getElementById(idDiv).style.display = "none";
        }

   function maxDiv(idDiv){
       document.getElementById(idDiv).style.display = "";
        }

    
    </script>
  </head>
  <body>

  <div align='right'><a href='index.php' target='_self' >Sair</a></div>

  <div id="logol"><p><img src="image/brasao.gif" alt="ICEA"/></p></div>
  <div id="titulo" class="BODY">INSTITUTO DE CONTROLE DO ESPAÇO AÉREO</div>
  <hr size='1'/>
  <div id="titulo" class="style4">DIVISÃO DE ENSINO</div>
  <div id="titulo" class="style4">SUB-DIVISÃO DE AVALIAÇÃO</div>
  <hr size='1'/>

<?php //----
     // Tratamento da Resposta se AtuaNaArea
    //----

   LimpaGrafico($conexao);

   $VI_Sim= 0;
   $VI_Nao= 0;
   $VI_EmParte= 0;
   $Indice= 0;
   $QRespondidos=0;

?>
   <form id='Form1' name='Form1' method='post' action="MostraGraficoBarra.php">
<?php

    //----
     //--- Tratamento do Cabecalho do Relatorio
   $sql_Cabecalho = "Select a.IdCurso, a.IdTurma, c.CodCurso, c.NomeCurso, t.codTurma, t.Turma, t.Ano, t.QDeAlunos
                    From Curso c, apc_agenda a, Turma t
                    where a.idcurso = $VI_IdCurso
                    and c.idCurso = $VI_IdCurso
                    and a.idturma =  $VI_IdTurma
                    and t.idTurma =  $VI_IdTurma
                    and (a.idcurso = t.idcurso and a.idturma = t.idTurma)";
   $ResCabecalho = ibase_query($conexao, $sql_Cabecalho);

   $VS_Cabecalho = ibase_fetch_assoc($ResCabecalho);
   //----
   echo "<p class = 'style3'><strong>Nome do Curso:</strong> $VS_Cabecalho[NOMECURSO] - $VS_Cabecalho[CODCURSO]</p>";
   echo "<p class = 'style3'><strong>Turma:</strong> $VS_Cabecalho[CODTURMA] ---- <strong>Número de participantes:</strong> $VS_Cabecalho[QDEALUNOS]  ----  <strong>Número de questionários respondidos:</strong> $QRespondidos</p>";
   echo "<hr size='1'/>";
   echo "<br/>";

   for($i=1;$i<$_POST[contador];$i++){
    $po=$_POST[$i];
    $pos = strpos($po, '&');
    $IDTOP=substr($po,0,$pos);
    $IDITEM=substr($po,$pos+1);


    $sql_Disciplinas = "select distinct * from fa_resposta
                               where idcurso=$VI_IdCurso
                               and idturma=$VI_IdTurma
                               and idficha=$_SESSION[idFicha]
                               and iditem=$IDITEM
                               and idtopico=$IDTOP
                               order by idtopico, iditem";
                               
                               
                            //   echo "sql   $sql_Disciplinas";
    $Disciplinas = ibase_query($conexao, $sql_Disciplinas);

    $sql_nomeTop ="SELECT descricao from fa_topicos
                               where idficha=$_SESSION[idFicha]
                               and idtopico=$IDTOP";
    // echo "top $sql_nomeTop";
    $Res_sql_nomeTop = ibase_query($conexao, $sql_nomeTop);
    $row_Res_sql_nomeTop = ibase_fetch_assoc($Res_sql_nomeTop);
    
    
    $sql_nomeItem ="SELECT DISTINCT descricao from fa_itens
                           where idficha=$_SESSION[idFicha]
                           and idtopico=$IDTOP
                           and iditem=$IDITEM";

    $Res_sql_nomeItem = ibase_query($conexao, $sql_nomeItem);
    $row_Res_sql_nomeItem = ibase_fetch_assoc($Res_sql_nomeItem);


   //---
   //--- Levantamento dos Dados de Curso


   while ($rowDis =  ibase_fetch_assoc($Disciplinas)){
      $Indice++;

      $VI_Pessimo= 0;
      $VI_Ruim= 0;
      $VI_Regular= 0;
      $VI_Bom= 0;
      $VI_Otima= 0;
      $VI_Excelente= 0;

      $sql_ResDisciplinas = "select  resposta from fa_resposta
                                    where idcurso=$VI_IdCurso
                                    and idturma=$VI_IdTurma
                                    and idficha=$_SESSION[idFicha]
                                    and iditem=$IDITEM
                                    and idtopico=$IDTOP
                                    order by idtopico, iditem";
      $ResDisciplinas = ibase_query($conexao, $sql_ResDisciplinas);
      // echo "asdasd $sql_ResDisciplinas";
      while ($row = ibase_fetch_assoc($ResDisciplinas))
      {
         $VS_Aplicabilidade= $row[RESPOSTA];

         if ($VS_Aplicabilidade == 0)
            $VI_Pessimo=$VI_Pessimo+1;
         else
            if ($VS_Aplicabilidade == 1)
               $VI_Ruim= $VI_Ruim + 1;
            else
               if ($VS_Aplicabilidade == 2)
                  $VI_Regular= $VI_Regular + 1;
               else
                  if ($VS_Aplicabilidade == 3)
                     $VI_Bom= $VI_Bom + 1;
                  else
                     if ($VS_Aplicabilidade == 4)
                        $VI_Otima= $VI_Otima + 1;
                     else
                        if ($VS_Aplicabilidade == 5)
                          $VI_Excelente= $VI_Excelente + 1;
      }

   GravaGrafico($conexao, $Indice, $VI_Pessimo, 'Péssimo', $VI_Ruim, 'Ruim', $VI_Regular, 'Regular', $VI_Bom, 'Bom', $VI_Otima, 'Ótima',$VI_Excelente,'Excelente');

   }
   ini_set("allow_url_fopen",1);
   echo "
             <table cellspacing='0' cellpadding='0' border '1' width='100%'>
             <div id ='$row_Res_sql_nomeTop[DESCRICAO]'>
             <tr><td width='16' scope='col' id='Disciplinasspan' >
             <img style='cursor: pointer;' onclick='minDiv($row_Res_sql_nomeTop[DESCRICAO]);' src='min.gif' width='16' height='14' border='0'></td><td><img style='cursor: pointer;' onclick='maxDiv($row_Res_sql_nomeTop[DESCRICAO]);' src='../../imagem/max.png' width='16' height='14' border='0'></td>
             </tr>
                 <tr>
                  <td width = '200' class = 'style3'>&nbsp; <strong><h3>$rowDis[NOMEMATERIA]</h3></strong><br/><br/>

                           Péssimo - $VI_Pessimo     <br/>
                           Ruim  -   $VI_Ruim       <br/>
                           Regular -  $VI_Regular    <br/>
                           Bom  -  $VI_Bom        <br/>
                           Otima -  $VI_Otima      <br/>
                           Excelente  -  $VI_Excelente  <br/></td>

                 <div><td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&titulo=$row_Res_sql_nomeTop[DESCRICAO]&lengenda=6' ></td>";
        echo "<td width='500'><BR> $IDITEM- $row_Res_sql_nomeItem[DESCRICAO]</td>";
        echo" </tr>
             </div>
          </table>";

              echo "<input type='hidden' size='20' name='titulo' value='$row_Res_sql_nomeItem[DESCRICAO]'>";
   echo "<hr size='1'/>";

   ini_set("allow_url_fopen",0);



  }
?>

   </form>

<?php    //----
        // Tratamento para Mostrar as Respostas das Disciplinas            select distinct * from fa_resposta where idcurso=14 and idturma=11 and idficha=1 and iditem=1 and idtopico=05
       //----
   echo "<hr size='1'/>";
   echo "<br/>";
   echo"<p class = 'style3'><strong>2 - Com Relação das Disciplinas de acordo com sua pertinencias</p>";
?>

<?php
   //---
   //--- Tratamento do complemento
   if($VI_IdTurma==0){
   $sql_Complemento = "select * from FA_COMENTARIO
                       where IDCURSO= $VI_IdCurso
                       and IDTURMA= $VI_IdTurma
                       order by idcurso, idturma, idficha";
   $ResComplemento = ibase_query($conexao, $sql_Complemento);


   }else{
   $sql_Complemento = "select comentario from FA_COMENTARIO
                       where IDCURSO= $VI_IdCurso
                       and IDTURMA= $VI_IdTurma
                       order by idcurso, idturma, idficha";
   $ResComplemento = ibase_query($conexao, $sql_Complemento);
   }

   echo "
             <table cellspacing='0' cellpadding='0' border '1' width='900'>
              <tr>
                  <td width = '450' class = 'style3'>&nbsp; <strong> DIFICULDADES</strong><br/><br/>
                  <td width = '450' class = 'style3'>&nbsp; <strong> CONSIDERACAOES</strong><br/><br/>
              </tr>
             </table>";

   while ($row =  ibase_fetch_assoc($ResComplemento)){

   echo "
             <table cellspacing='0' cellpadding='0' border '1' width='900'>
              <tr>
                  <td width = '450' class = 'style3'>&nbsp; => $row[COMENTARIO] <br/><br/>
                  <td width = '450' class = 'style3'>&nbsp; => $row[CONSIDERACOES]<br/><br/>
              </tr>
             </table>";
    }
?>
</body>
</html>
