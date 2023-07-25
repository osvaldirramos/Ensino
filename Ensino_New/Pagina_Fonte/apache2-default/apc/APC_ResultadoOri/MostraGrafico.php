<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : MostraGrafico.php                              //
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

   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   session_start();

   $f= new Funcao();

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
   $VS_Ano = $_GET[ano];
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
    <meta http-equiv='refresh' content='text/html;'  />
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

   <?php
      $f-> Cabecalho();
   ?>

   <p align="right"><table border="0" width="7%">
   <tr>
     <td><div align='right'><a href='ListaCursos.php' target='_self' >Voltar</a></div></td>
     <td><div align='right'><a href='../Ferramenta_Ensino/index.php' target='_self' >Sair</a></div></td>
   </tr>
   </table>
   </p>

   </br>

  <div id="titulo" class="style4">SUB-DIVISÃO DE AVALIAÇÃO</div>
  <br>
  <div id="titulo" class="BODY">Versão 1.03</div>
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

   while ($row =  ibase_fetch_assoc($ResComplemento))
   {
      $VS_AtuaNaFuncao = $row['ATUANAFUNCAO'];
      $QRespondidos++;

      if ($VS_AtuaNaFuncao == "S")
         $VI_Sim= $VI_Sim + 1;
      else
         if ($VS_AtuaNaFuncao == "N")
            $VI_Nao= $VI_Nao + 1;
         else
            if ($VS_AtuaNaFuncao == "E")
               $VI_EmParte= $VI_EmParte + 1;
   }
?>

<?php //----
     //--- Tratamento do Cabecalho do Relatorio
   if ($VI_IdTurma == 0)
   {
      $sql_Cabecalho = "Select c.CodCurso, c.NomeCurso
                       From Curso c
                       where c.idCurso = $VI_IdCurso";
      $ResCabecalho = ibase_query($conexao, $sql_Cabecalho);

      $VS_Cabecalho = ibase_fetch_assoc($ResCabecalho);

      echo"<p class = 'style3'><strong>Nome do Curso:</strong> $VS_Cabecalho[NOMECURSO] - $VS_Cabecalho[CODCURSO]</p>";
      echo"<p class = 'style3'><strong>Número de questionários respondidos:</strong> $QRespondidos</p>";
      echo "<hr size='1'/>";
      echo "<br/>";
   }
   else
   {
      $sql_Cabecalho = "Select c.CodCurso, c.NomeCurso, t.codTurma, t.Turma, t.Ano, t.QDeAlunos
                       From Curso c, Turma t
                       where c.idCurso = $VI_IdCurso
                       and t.idTurma =  $VI_IdTurma
                       and ano = '$VS_Ano'";

      $ResCabecalho = ibase_query($conexao, $sql_Cabecalho);

      $VS_Cabecalho = ibase_fetch_assoc($ResCabecalho);
      //----
      echo"<p class = 'style3'><strong>Nome do Curso:</strong> $VS_Cabecalho[NOMECURSO] - $VS_Cabecalho[CODCURSO]</p>";
      echo"<p class = 'style3'><strong>Turma:</strong> $VS_Cabecalho[TURMA]º Turma de $VS_Cabecalho[ANO] ---- <strong>Número de participantes:</strong> $VS_Cabecalho[QDEALUNOS]  ----  <strong>Número de questionários respondidos:</strong> $QRespondidos</p>";
      echo "<hr size='1'/>";
      echo "<br/>";
   }
   echo"$sql_QtdAlunos";
?>


<?php
//
// Continuação da Resposta se AtuaNaArea
   GravaGrafico($conexao, $Indice, $VI_Sim, 'Sim', $VI_Nao, 'Não', $VI_EmParte, 'Em Parte');

   ini_set("allow_url_fopen",1);
   echo"<p class = 'style3'><strong>1 - O Miliar esta atuando na Função</strong></p>";
   
   if ($QRespondidos > 0)
   {
      echo " </h3>
               <table cellspacing='0' cellpadding='0' border '1' width='100%'>
                <tr>
                   <td width = '200' class = 'style3'> Sim - $VI_Sim </br>
                                                             Não - $VI_Nao </br>
                                                             Em parte - $VI_EmParte</td>
                  <td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&lengenda=3' ></td>
                </tr>
              </table>
              </h3>";
      echo "<hr size='1'/>";
      echo "<br/>";
   }
   ini_set("allow_url_fopen",0);
      
?>

<?php    //----
        // Tratamento para Mostrar as Respostas das Disciplinas
       //----

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

      $VI_Nenhuma= 0;
      $VI_Pouca= 0;
      $VI_Media= 0;
      $VI_Muita= 0;
      $VI_Total= 0;

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
            $VI_Nenhuma= $VI_Nenhuma + 1;
         else
            if ($VS_Aplicabilidade == 1)
               $VI_Pouca= $VI_Pouca + 1;
            else
               if ($VS_Aplicabilidade == 2)
                  $VI_Media= $VI_Media + 1;
               else
                  if ($VS_Aplicabilidade == 3)
                     $VI_Muita= $VI_Muita + 1;
                  else
                     if ($VS_Aplicabilidade == 4)
                        $VI_Total= $VI_Total + 1;
      }

   GravaGrafico($conexao, $Indice, $VI_Nenhuma, 'Nenhuma', $VI_Pouca, 'Pouca', $VI_Media, 'Média', $VI_Muita, 'Muita', $VI_Total, 'Total','0','0');

   ini_set("allow_url_fopen",1);
   echo "
            <table cellspacing='0' cellpadding='0' border '1' width='100%'>
             <tr>
                 <td width = '200' class = 'style3'>&nbsp; <strong><h3>$rowDis[NOMEMATERIA]</h3></strong><br/><br/>
                           Nenhuma - $VI_Nenhuma<br/>
                           Pouca - $VI_Pouca<br/>
                           Média - $VI_Media<br/>
                           Muita - $VI_Muita<br/>
                           Total - $VI_Total</td>
                <td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&titulo=$rowDis[NOMEMATERIA]&lengenda=5' ></td>";
             if($VS_Questionado=='Aluno'){
                echo "<td width='600'><strong><h5>EMENTA</strong><br></h5>$rowDis[EMENTA]</br> <strong><h5>PERGUNTA ALUNO</h5></strong><br>$rowDis[PERGUNTAALUNO]</td>";
             }else{
                echo "<td width='600'><strong><h5>EMENTA</strong><br></h5>$rowDis[EMENTA]</br> <strong><h5>PERGUNTA CHEFE</h5></strong><br>$rowDis[PERGUNTACHEFE]</td>";
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

      $VI_Nenhuma= 0;
      $VI_Pouca= 0;
      $VI_Media= 0;
      $VI_Muita= 0;
      $VI_Total= 0;

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
            $VI_Nenhuma= $VI_Nenhuma + 1;
         else
            if ($VS_Aplicabilidade == 1)
               $VI_Pouca= $VI_Pouca + 1;
            else
               if ($VS_Aplicabilidade == 2)
                  $VI_Media= $VI_Media + 1;
               else
                  if ($VS_Aplicabilidade == 3)
                     $VI_Muita= $VI_Muita + 1;
                  else
                     if ($VS_Aplicabilidade == 4)
                        $VI_Total= $VI_Total + 1;
      }

   GravaGrafico($conexao, $Indice, $VI_Nenhuma, 'Nenhuma', $VI_Pouca, 'Pouca', $VI_Media, 'Média', $VI_Muita, 'Muita', $VI_Total, 'Total','0','0');

   ini_set("allow_url_fopen",1);
   echo "
             <table cellspacing='0' cellpadding='0' border '1' width='100%'>
              <tr>
                  <td width = '200' class = 'style3'>&nbsp; <strong><h3>$rowDis[NOMEMATERIA]</h3></strong><br/><br/>
                            Nenhuma - $VI_Nenhuma<br/>
                            Pouca - $VI_Pouca<br/>
                            Média - $VI_Media<br/>
                            Muita - $VI_Muita<br/>
                            Total - $VI_Total</td>
                 <td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&titulo=$rowDis[NOMEMATERIA]&lengenda=5' ></td>";
                 if($VS_Questionado=='Aluno'){
                    echo "  <td width='300'><strong><h5>$rowDis[PERGUNTAALUNO] ?</h5></strong></br> </br>$rowDis[EMENTA]-</td>";
                 }else{
                    echo "  <td width='300'><strong><h5>$rowDis[PERGUNTACHEFE] ?</h5></strong></br> </br>$rowDis[EMENTA]-</td>";
                 }
        echo" </tr>
             </table>";
   echo "<hr size='1'/>";

   ini_set("allow_url_fopen",0);

   }
   }
?>


<?php //----
      // Tratamento da Resposta se Carga Horária
      //----
   echo"<p class = 'style3'><strong>3 - Com relação a Carga Horária </strong></p>";

   if ($VI_IdTurma == 0){    //monta por curso
    $sql_Disciplinas = "select distinct codmateria, nomemateria,
                       ementa, perguntaaluno, perguntachefe from APC_DISCIPLINA
                       where IDCURSO= $VI_IdCurso
                       order by CODMATERIA";
    $Disciplinas = ibase_query($conexao, $sql_Disciplinas);
   
   
   //faz select para montar o Carga Horária
   while ($rowDis =  ibase_fetch_assoc($Disciplinas)){
    $sql_CargaHoraria = "select * from APC_CARGAHORARIA
                        where IDCURSO= $VI_IdCurso
                        and IDENTIFICACAO='$VS_Questionado'
                        and CODMATERIA = '$rowDis[CODMATERIA]'
                        order by CODMATERIA";
    $ResCargaHoraria = ibase_query($conexao, $sql_CargaHoraria);


    $Indice++;
    $VI_Insuficiente= 0;
    $VI_Suficiente= 0;
    $VI_Excessiva= 0;

    while ($row =  ibase_fetch_assoc($ResCargaHoraria)){
      $VI_CargaHoraria = $row['CARGAHORARIA'];

      if ($VI_CargaHoraria == "0")
         $VI_Insuficiente= $VI_Insuficiente + 1;
      else
         if ($VI_CargaHoraria == "1")
            $VI_Suficiente= $VI_Suficiente + 1;
         else
            if ($VI_CargaHoraria == "2")
               $VI_Excessiva= $VI_Excessiva + 1;
   }

   GravaGrafico($conexao, $Indice, $VI_Insuficiente, 'Insuficiente', $VI_Suficiente, 'Suficiente', $VI_Excessiva, 'Excessiva');

   ini_set("allow_url_fopen",1);
   echo " </h3>
            <table cellspacing='0' cellpadding='0' border '1' width='100%'>
             <tr>
                <td width = '200' class = 'style3'>&nbsp; <strong> <h3>$rowDis[NOMEMATERIA]</h3></strong><br/><br/>
                                                          Insuficiente - $VI_Insuficiente </br>
                                                          Suficiente - $VI_Suficiente </br>
                                                          Excessiva - $VI_Excessiva</td>
                <td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&titulo=$rowDis[NOMEMATERIA]&lengenda=3' ></td>";

               if($VS_Questionado=='Aluno'){
                 echo "  <td width='300'><strong><h5>$rowDis[PERGUNTAALUNO]?</h5></strong></br> </br>$rowDis[EMENTA]-</td>";
               }else
               {
                 echo "  <td width='300'><strong><h5>$rowDis[PERGUNTACHEFE]?</h5></strong></br> </br>$rowDis[EMENTA]-</td>";
               }
           echo"</tr>
           </table>
           </h3>";
   echo "<hr size='1'/>";
   ini_set("allow_url_fopen",0);
   }
   }else{     //monta por turma
   $sql_Disciplinas = "select * from APC_DISCIPLINA
                      where IDCURSO= $VI_IdCurso
                      and IDTURMA= $VI_IdTurma
                      order by CODMATERIA";
   $Disciplinas = ibase_query($conexao, $sql_Disciplinas);

   //faz select para montar o Carga Horária
   while ($rowDis =  ibase_fetch_assoc($Disciplinas)){
   $sql_CargaHoraria = "select * from APC_CARGAHORARIA
                       where IDCURSO= $VI_IdCurso
                       and IDTURMA= $VI_IdTurma
                       and IDENTIFICACAO='$VS_Questionado'
                       and CODMATERIA = '$rowDis[CODMATERIA]'
                       order by CODMATERIA";
   $ResCargaHoraria = ibase_query($conexao, $sql_CargaHoraria);

   $Indice++;
   $VI_Insuficiente= 0;
   $VI_Suficiente= 0;
   $VI_Excessiva= 0;

   while ($row =  ibase_fetch_assoc($ResCargaHoraria)){
      $VI_CargaHoraria = $row['CARGAHORARIA'];

      if ($VI_CargaHoraria == "0")
         $VI_Insuficiente= $VI_Insuficiente + 1;
      else
         if ($VI_CargaHoraria == "1")
            $VI_Suficiente= $VI_Suficiente + 1;
         else
            if ($VI_CargaHoraria == "2")
               $VI_Excessiva= $VI_Excessiva + 1;
   }

   GravaGrafico($conexao, $Indice, $VI_Insuficiente, 'Insuficiente', $VI_Suficiente, 'Suficiente', $VI_Excessiva, 'Excessiva');

   ini_set("allow_url_fopen",1);
   echo " </h3>
            <table cellspacing='0' cellpadding='0' border '1' width='100%'>
             <tr>
                <td width = '200' class = 'style3'>&nbsp; <strong> <h3>$rowDis[NOMEMATERIA]</h3></strong><br/><br/>
                                                          Insuficiente - $VI_Insuficiente </br>
                                                          Suficiente - $VI_Suficiente </br>
                                                          Excessiva - $VI_Excessiva</td>
               <td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&titulo=$rowDis[NOMEMATERIA]&lengenda=3' ></td>";

               if($VS_Questionado=='Aluno'&&$rowDis[PERGUNTAALUNO]!=""){
                 echo "  <td width='300'><strong><h5>$rowDis[PERGUNTAALUNO]?</h5></strong></br> </br>$rowDis[EMENTA]-</td>";
               }else
               {
                 echo "  <td width='300'><strong><h5>$rowDis[PERGUNTACHEFE]?</h5></strong></br> </br>$rowDis[EMENTA]-</td>";
               }
   echo  " </tr>
          </table>
          </h3>";
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
             <table cellspacing='0' cellpadding='0' border '1' width='100%'>
              <tr>
                  <td width = '50%' class = 'style3'>&nbsp; <strong> DIFICULDADES</strong><br/><br/>
                  <td width = '50%' class = 'style3'>&nbsp; <strong> CONSIDERACAOES</strong><br/><br/>
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
</body>
</html>
