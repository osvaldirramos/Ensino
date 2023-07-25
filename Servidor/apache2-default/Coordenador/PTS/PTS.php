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
   <div align="left">
   <form name="form1" method="POST" action="RelacaoPessoasNaoResponderam.php">

   <?php  //----- Tratamento do PTS ----- ?> 

   <div class="conteudo"> 
       </br>
       <table border='0' width='1000'>
           <tr>
              <td width='12' align='center'>INSTITUTO DE CONTROLE DO ESPAÇO AÉREO</br>
                                            SEÇÃO DE EXECUÇÃO DE CURSOS
                  </center>
              </td>
           </tr>
       </table>

       <?php

          //--------------------------------------------------------------------------
          // Funcao para tratar da apresentacao da Semana do PTS

          function TratarSemanaPTS($P_Semana, $P_Data)
          { 
             $sql_Comando="select count(1) as Feriado From Feriado where Data = '$P_Data'";
             $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
             $Retorno_Feriado=ibase_fetch_assoc($Res_sql_Comando);

             if ($Retorno_Feriado[FERIADO] == 0)
                 echo "<table border=1>
                          <tr>
                             <td align=middle width = '1012' bgcolor = '#C0C0C0'>$P_Semana - $P_Data  $Retorno_Feriado[FERIADO]</td>
                          </tr>
                       </table>";
             else
                 echo "<table border=1>
                          <tr>
                             <td align=middle width = '1012' bgcolor = '#FF0000'>$P_Semana - $P_Data  $Retorno_Feriado[FERIADO]</td>
                          </tr>
                       </table>";
          }
          //--------------------------------------------------------------------------


          //--------------------------------------------------------------------------
          // Funcao para tratar da apresentacao das linhas do PTS

          function TratarLinhaPTS($P_Horario, $P_Trab_Escolar, $P_Equipe, $P_Local)
          { 
             $Horario= str_replace("\n", "<br>",$P_Horario);
             $Trab_Escolar= str_replace("\n", "<br>", $P_Trab_Escolar);
             $Equipe= str_replace("\n", "<br>", $P_Equipe);
             $Local= str_replace("\n", "<br>", $P_Local);

             echo "<table border='1px' bgcolor='#FFFFFF'>
                      <tr>
                          <td align=middle  center width = '120' >$Horario</td>
                          <td align=middle  left   width = '614' >$Trab_Escolar</td>
                          <td align=middle  left   width = '130' >$Equipe</td>
                          <td align=middle  center width = '130' >$P_Local</td>
                      </tr>
                   </table>";
          }
          //--------------------------------------------------------------------------


          //--------------------------------------------------------------------------
          // Funcao que retorna a semana fornecida

          function SemanaAno($ano, $dia,$mes)
          {
             $var=intval( date('z', mktime(0,0,0,$mes,$dia,$ano) ) / 7 ) + 1;

             return $var;
          } 
          //--------------------------------------------------------------------------

          $sql_Comando="select CodCurso, NomeCurso From Curso where IdCurso = $_SESSION[idCurso]";
          $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
          $Retorno=ibase_fetch_assoc($Res_sql_Comando);

          echo "<table border='0' width='1000'>
                    <tr>
                        <td width='12' align='center'>$Retorno[CODCURSO] - $Retorno[NOMECURSO]</td>
                    </tr>
                 </table>";

           //----
          //--- Tratamento para achar a semana do PTS

          $sql_Comando="select Turma, Ano, DataInicio, DataTermino From Turmas_View where IdCurso = $_SESSION[idCurso] and idTurma = $_SESSION[idTurma]";
          $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
          $Retorno=ibase_fetch_assoc($Res_sql_Comando);

          $Turma= $Retorno[TURMA];
          $AnoTurma= $Retorno[ANO];

          $Ano= substr($Retorno[DATAINICIO],0,4);
          $Mes= substr($Retorno[DATAINICIO],5,2);
          $Dia=  substr($Retorno[DATAINICIO],8,2); 
          $VI_SemIni= SemanaAno($Ano, $Dia, $Mes) ;

          $dataAtual = date("Y-m-d");
          $Ano= substr($dataAtual,0,4);
          $Mes= substr($dataAtual,5,2);
          $Dia=  substr($dataAtual,8,2); 

          $VI_SemAtual= SemanaAno($Ano, $Dia, $Mes) ;

          $VI_SemanaAtual= ($VI_SemAtual - $VI_SemIni)+1;

           //----
          //--- Tratamento para achar o numero de semanas do PTS

          $sql_Comando="select count(1) as NSemanas
                        From Cad_PTS
                        Where IdCurso = $_SESSION[idCurso]
                        and   idTurma = $_SESSION[idTurma]";
          $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
          $Retorno_PTS=ibase_fetch_assoc($Res_sql_Comando);

          if ($VI_SemanaAtual > $Retorno_PTS[NSEMANAS])
              $VI_SemanaAtual= $Retorno_PTS[NSEMANAS];
          else
             if ($VI_SemanaAtual <= 0)
                $VI_SemanaAtual= 1;


          echo "<table border=0>
                   <tr>
                       <td align= left width = '325'> SEMANA: $VI_SemanaAtual/$Retorno_PTS[NSEMANAS] </td>
                       <td align= center width = '350'>PROGRAMA SEMANAL DE TRABALHO</td>
                       <td align= right width = '325'>Turma: $Turma/$AnoTurma</td>
                    </tr>
                 </table>";

          echo "</br>";

          echo "<table border=1>
                   <tr>
                      <td align=middle width = '120' bgcolor = '#808080'> HORÁRIO</td>
                      <td align=middle width = '614' bgcolor = '#808080'>TRABALHO ESCOLAR</td>
                      <td align=middle width = '130' bgcolor = '#808080'>DOCENTE</td>
                      <td align=middle width = '130' bgcolor = '#808080'>LOCAL</td>
                   </tr>
                </table>";

               $sql_Comando="Select SEMANA, DATA_02, DIA_SEMANA_02, HORARIO_01_02, HORARIO_02_02, TRAB_ESCOLAR_01_02, TRAB_ESCOLAR_02_02, EQUIPE_01_02, EQUIPE_02_02, LOCAL_01_02, LOCAL_02_02, 
                                            DATA_03, DIA_SEMANA_03, HORARIO_01_03, HORARIO_02_03, TRAB_ESCOLAR_01_03, TRAB_ESCOLAR_02_03, EQUIPE_01_03, EQUIPE_02_03, LOCAL_01_03, LOCAL_02_03, 
                                            DATA_04, DIA_SEMANA_04, HORARIO_01_04, HORARIO_02_04, TRAB_ESCOLAR_01_04, TRAB_ESCOLAR_02_04, EQUIPE_01_04, EQUIPE_02_04, LOCAL_01_04, LOCAL_02_04, 
                                            DATA_05, DIA_SEMANA_05, HORARIO_01_05, HORARIO_02_05, TRAB_ESCOLAR_01_05, TRAB_ESCOLAR_02_05, EQUIPE_01_05, EQUIPE_02_05, LOCAL_01_05, LOCAL_02_05, 
                                            DATA_06, DIA_SEMANA_06, HORARIO_01_06, HORARIO_02_06, TRAB_ESCOLAR_01_06, TRAB_ESCOLAR_02_06, EQUIPE_01_06, EQUIPE_02_06, LOCAL_01_06, LOCAL_02_06, 
                                    MSG
                             From Cad_PTS
                             Where IdCurso = $_SESSION[idCurso]
                             and   idTurma = $_SESSION[idTurma]
                             and   Semana = $VI_SemanaAtual";

               $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
               $Retorno=ibase_fetch_assoc($Res_sql_Comando);

               TratarSemanaPTS('Segunda Feira', $Retorno[DATA_02]);
               TratarLinhaPTS($Retorno[HORARIO_01_02], $Retorno[TRAB_ESCOLAR_01_02], $Retorno[EQUIPE_01_02], $Retorno[LOCAL_01_02]);
               TratarLinhaPTS($Retorno[HORARIO_02_02], $Retorno[TRAB_ESCOLAR_02_02], $Retorno[EQUIPE_02_02], $Retorno[LOCAL_02_02]);

               TratarSemanaPTS('Terça Feira', $Retorno[DATA_03]);
               TratarLinhaPTS($Retorno[HORARIO_01_03], $Retorno[TRAB_ESCOLAR_01_03], $Retorno[EQUIPE_01_03], $Retorno[LOCAL_01_03]);
               TratarLinhaPTS($Retorno[HORARIO_02_03], $Retorno[TRAB_ESCOLAR_02_03], $Retorno[EQUIPE_02_03], $Retorno[LOCAL_02_03]);

               TratarSemanaPTS( 'Quarta Feira', $Retorno[DATA_04]);
               TratarLinhaPTS($Retorno[HORARIO_01_04], $Retorno[TRAB_ESCOLAR_01_04], $Retorno[EQUIPE_01_04], $Retorno[LOCAL_01_04]);
               TratarLinhaPTS($Retorno[HORARIO_02_04], $Retorno[TRAB_ESCOLAR_02_04], $Retorno[EQUIPE_02_04], $Retorno[LOCAL_02_04]);

               TratarSemanaPTS( 'Quinta Feira', $Retorno[DATA_05]);
               TratarLinhaPTS($Retorno[HORARIO_01_05], $Retorno[TRAB_ESCOLAR_01_05], $Retorno[EQUIPE_01_05], $Retorno[LOCAL_01_05]);
               TratarLinhaPTS($Retorno[HORARIO_02_05], $Retorno[TRAB_ESCOLAR_02_05], $Retorno[EQUIPE_02_05], $Retorno[LOCAL_02_05]);

               TratarSemanaPTS( 'Sexta Feira', $Retorno[DATA_06]);
               TratarLinhaPTS($Retorno[HORARIO_01_06], $Retorno[TRAB_ESCOLAR_01_06], $Retorno[EQUIPE_01_06], $Retorno[LOCAL_01_06]);
               TratarLinhaPTS($Retorno[HORARIO_02_06], $Retorno[TRAB_ESCOLAR_02_06], $Retorno[EQUIPE_02_06], $Retorno[LOCAL_02_06]);

               $Msg= str_replace("\n", "<br>",$Retorno[MSG]);
               echo "<table border='1' width='1000'>
                        <tr>
                            <td width='12' align='left'>$Msg</td>
                        </tr>
                     </table>";

       ?> 

   </div>
</body>
</html>

