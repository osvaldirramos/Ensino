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
   require_once("conecta.inc");
   require_once("verifica_sessao.php");


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

   $VI_IdCurso = $_GET[curso];
   $VI_IdTurma = $_GET[turma];
   $VS_Questionado = $_GET[questionado];
   $tipo = $_GET[grafico];
   //faz select para montar o Complemto da Disciplina

   if ($VI_IdTurma == 0){
   $sql_Complemento = "select * from APC_COMPLEMENTO
                       where IDCURSO= $VI_IdCurso
                       and IDENTIFICACAO='$VS_Questionado'
                       order by CODMATERIA";
   $ResComplemento = ibase_query($conexao, $sql_Complemento);

   }else{
   $sql_Complemento = "select * from APC_COMPLEMENTO
                       where IDCURSO= $VI_IdCurso
                       and IDTURMA= $VI_IdTurma
                       and IDENTIFICACAO='$VS_Questionado'
                       order by CODMATERIA";
   $ResComplemento = ibase_query($conexao, $sql_Complemento);
   }

?>

  <html>
  <head>
    <title>ICEA -> Mostra Resultado da Avaliação Pós-Curso</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link href="apc.css" rel="stylesheet" type="text/css">
    <script>
    function setaTipo()
    {
    var tipo;
    tipo = "squared";
    document.location.reload();
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
  <div id="corpo">

<?php //----
     // Tratamento da Resposta se AtuaNaArea
    //----

   LimpaGrafico($conexao);

   $VI_Sim= 0;
   $VI_Nao= 0;
   $VI_EmParte= 0;
   $Indice= 0;

   $QRespondidos=0;

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
   echo"<p class = 'style3'><strong>Nome do Curso:</strong> $VS_Cabecalho[NOMECURSO] - $VS_Cabecalho[CODCURSO]</p>";
   echo"<p class = 'style3'><strong>Turma:</strong> $VS_Cabecalho[CODTURMA] ---- <strong>Número de participantes no Curso:</strong> $VS_Cabecalho[QDEALUNOS]  ----  <strong>Número de questionários respondidos:</strong> $QRespondidos</p>";
   echo "<hr size='1'/>";
   echo "<br/>";

    //----
        // Tratamento para Mostrar as Respostas das Disciplinas
       //----

   echo "<hr size='1'/>";
   echo "<br/>";
   echo"<p class = 'style3'><strong>2 - Com Relação das Disciplinas de acordo com sua pertinencias</p>";

    //---
   //--- Levantamento dos Dados de Curso
   if ($VI_IdTurma == 0)
   { //monta por curso
   $sql_Disciplinas = "select distinct codmateria, nomemateria, ementa, perguntaaluno, perguntachefe from APC_DISCIPLINA
                      where IDCURSO= $VI_IdCurso
                      and NOMEMATERIA <> 'Total'
                      order by CODMATERIA";
   $Disciplinas = ibase_query($conexao, $sql_Disciplinas);

   while ($rowDis =  ibase_fetch_assoc($Disciplinas))
   {
      $Indice++;

      $VI_Pessimo= 0;
      $VI_Ruim= 0;
      $VI_Regular= 0;
      $VI_Bom= 0;
      $VI_Otima= 0;
      $VI_Excelente= 0;

      $sql_ResDisciplinas = "select APLICABILIDADE
                             from APC_RESPDISCIPLINA
                             where IDCURSO= $VI_IdCurso
                             and IDENTIFICACAO = '$VS_Questionado'
                             and CODMATERIA = '$rowDis[CODMATERIA]'
                             order by CODMATERIA";
      $ResDisciplinas = ibase_query($conexao, $sql_ResDisciplinas);

      $i=0;
      while ($row = ibase_fetch_assoc($ResDisciplinas))
      {
         $VS_Aplicabilidade= $row[APLICABILIDADE];

         if ($VS_Aplicabilidade == 0)
            $VI_Pessimo= $VI_Pessimo + 1;
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

   ini_set("allow_url_fopen",1);
   echo "
            <table cellspacing='0' cellpadding='0' border '1' width='100%'>
             <tr>
                 <td width = '200' class = 'style3'>&nbsp; <strong><h3>$rowDis[NOMEMATERIA]</h3></strong><br/><br/>

                           Péssimo - $VI_Pessimo     <br/>
                           Ruim  -   $VI_Ruim       <br/>
                           Regular -  $VI_Regular    <br/>
                           Bom  -  $VI_Bom        <br/>
                           Otima -  $VI_Otima      <br/>
                           Excelente  -  $VI_Excelente  <br/></td>
                           
                <td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&titulo=$rowDis[NOMEMATERIA]&lengenda=5' ></td>";
             if($VS_Questionado=='Aluno'){
                echo "<td width='300'  class = 'style3'><strong>$rowDis[PERGUNTAALUNO]?</strong></br> </br>$rowDis[EMENTA]-</td>";
             }else{
                echo "<td width='300'  class = 'style3'><strong>$rowDis[PERGUNTACHEFE]?</strong></br> </br>$rowDis[EMENTA]-</td>";
             }
   echo      "</tr>
            </table>";
   echo "<hr size='1'/>";
   ini_set("allow_url_fopen",0);
   }
   }
   else{
   //monta por turma
   $sql_Disciplinas = "select * from APC_DISCIPLINA
                      where IDCURSO= $VI_IdCurso
                      and IDTURMA= $VI_IdTurma
                      and NOMEMATERIA <> 'Total'
                      order by CODMATERIA";
   $Disciplinas = ibase_query($conexao, $sql_Disciplinas);


   while ($rowDis =  ibase_fetch_assoc($Disciplinas)){
      $Indice++;

      $VI_Pessimo= 0;
      $VI_Ruim= 0;
      $VI_Regular= 0;
      $VI_Bom= 0;
      $VI_Otima= 0;
      $VI_Excelente= 0;

      $sql_ResDisciplinas = "select APLICABILIDADE
                             from APC_RESPDISCIPLINA
                             where IDCURSO= $VI_IdCurso
                             and IDTURMA= $VI_IdTurma
                             and IDENTIFICACAO = '$VS_Questionado'
                             and CODMATERIA = '$rowDis[CODMATERIA]'
                             order by CODMATERIA";
      $ResDisciplinas = ibase_query($conexao, $sql_ResDisciplinas);

      $i=0;
      while ($row = ibase_fetch_assoc($ResDisciplinas))
      {
         $VS_Aplicabilidade= $row[APLICABILIDADE];

         if ($VS_Aplicabilidade == 0)
            $VI_Pessimo= $VI_Pessimo + 1;
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
                          $VI_Otima= $VI_Otima + 1;
      }

       GravaGrafico($conexao, $Indice, $VI_Pessimo, 'Péssimo', $VI_Ruim, 'Ruim', $VI_Regular, 'Regular', $VI_Bom, 'Bom', $VI_Otima, 'Ótima',$VI_Excelente,'Excelente');

  // GravaGrafico($conexao, $Indice, $VI_Nenhuma, 'Nenhuma', $VI_Pouca, 'Pouca', $VI_Media, 'Média', $VI_Muita, 'Muita', $VI_Total, 'Total','0','0');

   ini_set("allow_url_fopen",1);
   echo "
             <table cellspacing='0' cellpadding='0' border '1' width='100%'>
              <tr>
                  <td width = '200' class = 'style3'>&nbsp; <strong><h3>$rowDis[NOMEMATERIA]</h3></strong><br/><br/>

                           Péssimo - $VI_Pessimo     <br/>
                           Ruim  -   $VI_Ruim       <br/>
                           Regular -  $VI_Regular    <br/>
                           Bom  -  $VI_Bom        <br/>
                           Otima -  $VI_Otima      <br/>
                           Excelente  -  $VI_Excelente  <br/></td>
                           
                 <td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&titulo=$rowDis[NOMEMATERIA]&lengenda=5' ></td>";
                 if($VS_Questionado=='Aluno'){
                    echo "  <td width='300'  class = 'style3'><strong>$rowDis[PERGUNTAALUNO] ?</strong></br> </br>$rowDis[EMENTA]-</td>";
                 }else{
                    echo "  <td width='300'  class = 'style3'><strong>$rowDis[PERGUNTACHEFE] ?</strong></br> </br>$rowDis[EMENTA]-</td>";
                 }
        echo" </tr>
             </table>";
   echo "<hr size='1'/>";

   ini_set("allow_url_fopen",0);

   }
   }
?>

<?php
   //---
   //--- Tratamento do complemento
   if($VI_IdTurma==0){
   $sql_Complemento = "select * from APC_COMPLEMENTO
                       where IDCURSO= $VI_IdCurso
                       and IDENTIFICACAO='$VS_Questionado'
                       order by CODMATERIA";
   $ResComplemento = ibase_query($conexao, $sql_Complemento);


   }else{
   $sql_Complemento = "select * from APC_COMPLEMENTO
                       where IDCURSO= $VI_IdCurso
                       and IDTURMA= $VI_IdTurma
                       and IDENTIFICACAO='$VS_Questionado'
                       order by CODMATERIA";
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
                  <td width = '450' class = 'style3'>&nbsp; => $row[DIFICULDADES]<br/><br/>
                  <td width = '450' class = 'style3'>&nbsp; => $row[CONSIDERACOES]<br/><br/>
              </tr>
             </table>";
    }
?>
</div>
</body>
</html>
