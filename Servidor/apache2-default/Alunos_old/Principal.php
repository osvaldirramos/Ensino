<?php
   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Ficha de Avaliação de Cursos</title>
<link rel="stylesheet" href="estilos/abas1.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Cache-control" content="no-cache">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript"> 
	$(document).ready(function(){ 
		$("#content div:nth-child(1)").show(); 
		$(".abas li:first div").addClass("selected");	
		$(".aba").click(function(){ 
			$(".aba").removeClass("selected"); 
			$(this).addClass("selected"); 
			var indice = $(this).parent().index();
			indice++; 
			$("#content div").hide(); 
			$("#content div:nth-child("+indice+")").show(); 
		}); 
		
		$(".aba").hover( 
			function(){$(this).addClass("ativa")}, 
			function(){$(this).removeClass("ativa")} 
		 );	
	}); 
</script>

</head>


<body bgcolor="#CFCFCF">
<p><img style="margin: -5px 5px -5px 5px;" src="../imagem/topo_ICEA.png" alt="" width="1130" /></p></div> </div>

<?php
    //------
   // Tratamento para pegar o nome do usuario

   if ($_SESSION[IdUsuario] == "ALUNO")
   {
      $sql = "Select nome, 'ALUNO' as Funcao
              From alunoturma_view
              where idcurso = $_SESSION[idCurso]
                and   idturma = $_SESSION[idTurma]
                and   identidade = '$_SESSION[identidadeAluno]'";
      $Executa_sql = ibase_query($conexao,$sql );
      $Res_sql= ibase_fetch_assoc($Executa_sql);
   }
   else
   {
      $sql = "Select nome, Funcao
              From INSTRUTOR_TURMAS_VIEW
              where idcurso = $_SESSION[idCurso]
                and   idturma = $_SESSION[idTurma]
                and   identidade = '$_SESSION[identidadeAluno]'";
      $Executa_sql = ibase_query($conexao,$sql );
      $Res_sql= ibase_fetch_assoc($Executa_sql);
   }


   echo "</br>";
   echo "<font style='font: 20px Arial,sans-serif;background: #CFCFCF; color: Silver; padding: 0px 0px 0px 0px;text-shadow: black -1px 0px 0px, black 0px 1px 0px, black 1px 0px 0px,black 0px -1px 0px, 0px 0px 0px;'>";

   echo "<div id='corpo'>
             <table border='0' width='100%' >
                <tr>
                   <td width='3' align='left'></td>
                   <td width='100' align='left'>$Res_sql[FUNCAO] - $Res_sql[NOME]</td>
                </tr>
             </table>
          </div>";
   echo " </font>";
   echo "</br>";
   echo "</br>";
?>


<font style='font: 13px Arial,sans-serif;background: silver;color: White;padding: 0px 0px 0px 0px;text-shadow: red 0px 0px 16px,  0px 0px 0px,  0px 0px 0px, 0px 0px 0px, 0px 0px 0px;'>

<div id="corpo">
  <table border="0" width="100%" >
    <tr>
     <td width="37" align="center"></td>

      <td width="100" align="center">
      <a href="CriticaEspontanea.php" title="Entre aqui com seus Comentários ou Sugestões" target="_self" ><img src="image/critica.png" border="0" width="25" height="25" ><br> Critica Espont&acirc;nea</a>   </td>

      <td width="100" align="center"><a href="alterarSenha.php" title="Redefinir senha" target="_self" > <img src="image/senha.png" border="0" width="25" height="25" ><br> Alterar Senha</a></td>

     <td width="192" align="center"></td>

     <td width="360" align="center" ></td>

     <td width="180" align="Left">&nbsp;<a href="index.php" title="Sair" target="_self" ><img src="image/sair.png" border="0" width="25" height="25" /> Sair</a></td>
    </tr>
  </table>
</div>
<br>

</font>

<div class="TabControl"> 
	<div id="header"> 
    	<ul class="abas"> 
        	<li> 
            	<div class="aba"> 
                	<span>Principal</span> 
                </div> 
            </li> 
            <li> 
            	<div class="aba"> 
                	<span>PTS - Plano Trabalho Semanal</span> 
                </div> 
            </li> 
        </ul> 
    </div> 

    <div id="content"> 
    	<div class="conteudo"> 
           </br>
           </br>
          <form name="form1" method="POST" action="montapagina.php">
          <?php
             $DataAtual= date('d.m.Y 00:00',time());
             $sql_Comando="select count(1) as Qtd
                           from fa_relacao r, fa_avaliacao a
                           where r.IdCurso = $_SESSION[idCurso]
                           and r.idTurma = $_SESSION[idTurma]
                           and r.idaluno = '$_SESSION[identidadeAluno]'
                           and a.dataavaliacao <= '$DataAtual'
                           and r.respondeu = 'N'
                           and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma] and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina)";        	
             $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
             $Comando=ibase_fetch_assoc($Res_sql_Comando);

             if ($Comando[QTD] == 0)
                $msg= "Nenhuma ficha a ser avaliada";
             else
                if ($Comando[QTD] == 1)
                   $msg= "$Comando[QTD] ficha a ser avaliada. Selecione aqui a Ficha";
                else
                   $msg= "$Comando[QTD] fichas a serem avaliadas. Selecione aqui as Fichas";

             $sql_relacionado="select r.IdFicha, r.identidade, r.disciplina,r.idaluno, a.disponivel,
                                           extract(day from a.dataavaliacao)||'/'||extract(month from a.dataavaliacao)||'/'||extract(year from a.dataavaliacao) as dataaplicacao
                               From fa_relacao r, fa_avaliacao a
                               Where r.IdCurso = $_SESSION[idCurso]
                                           and r.idTurma = $_SESSION[idTurma]
                                           and r.idaluno = '$_SESSION[identidadeAluno]'
                                           and a.dataavaliacao <= '$DataAtual'
                                           and r.respondeu = 'N'
                                           and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
                                           and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina)";

             $Res_sql_relacionado=ibase_query($conexao,$sql_relacionado);

             echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
             echo "<option >--- $msg </option>";

             $opEscolhida =0;

             while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
             {
                 $opEscolhida ++ ;
                 $instrutor ="";
                 $disciplina = "";
                 $Traco1= "";
                 $Traco2= "";

                 if(trim($relacionado['IDENTIDADE'])!='000000')
                 {
                     $sql = "select nome , postograduacao  from pessoa where identidade='$relacionado[IDENTIDADE]'";
                     $Res_sql=ibase_query($conexao, $sql);
                     $pessoa = ibase_fetch_assoc($Res_sql);
          
                     $Traco1= " - ";
                     $posto = $pessoa['POSTOGRADUACAO'];
                     $instrutor = $pessoa['NOME'];
                  }

                  if($relacionado['DISCIPLINA']!='000000')
                  {
                      $sql = "select nomemateria from materiacurso
                              where idcurso = $_SESSION[idCurso]
                                 and  idturma = $_SESSION[idTurma]
                                 and codmateria = '$relacionado[DISCIPLINA]' ";
                      $Res_sql=ibase_query($conexao, $sql);
                      $materiacurso = ibase_fetch_assoc($Res_sql);

                      $Traco2= " - ";
                      $disciplina = $materiacurso['NOMEMATERIA'];
                  }

                  $sql = "Select cabecalho from fa_modelo where idficha= $relacionado[IDFICHA]";
                  $Res_cabecalho=ibase_query($conexao, $sql);
                  $cabecalho = ibase_fetch_assoc($Res_cabecalho);

                  echo "<option value= $opEscolhida> $cabecalho[CABECALHO] $Traco1 $posto  $instrutor $Traco2 $disciplina - $relacionado[DATAAPLICACAO]  </option>";
             }
             echo "</select>";
             echo "</br>";
          ?>
          </form>

          <form name="form2" method="POST" action="montapagina.php">


          <?php
             if ($_SESSION[IdUsuario] == "ALUNO")
             {
                $sql_Comando="select count(1) as Qtd
                              From nota_aluno_view na, Teste te
                              where na.idcurso = $_SESSION[idCurso]
                                and   na.idturma = $_SESSION[idTurma]
                                and   na.identidade = '$_SESSION[identidadeAluno]'
                                and   na.idCurso = te.idCurso
                                and   na.idturma = te.IdTurma
                                and   na.referenciaavaliacao = te.referenciaavaliacao
                                and   na.codmateria = te.codmateria
                                and   te.ApresentarNota = 'S'";

                $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
                $Comando=ibase_fetch_assoc($Res_sql_Comando);

                if ($Comando[QTD] == 0)
                    $msg= "Não há resultados de avaliações";
                else
                    $msg= "Clique aqui para visualizar nota";

                $DataAtual= date('d.m.Y 00:00',time());
                $sql_Fichas="select count(1) as Qtd
                             from fa_NaoRespondidas_view r
                             where r.IdCurso = $_SESSION[idCurso]
                               and r.idTurma = $_SESSION[idTurma]
                               and r.idaluno = '$_SESSION[identidadeAluno]'
                               and r.respondeu = 'N'
                               and r.dataavaliacao <= '$DataAtual'";

                 $Res_sql_Fichas=ibase_query($conexao,$sql_Fichas);
                 $Fichas=ibase_fetch_assoc($Res_sql_Fichas);

                  //-----
                 //--- Tratamento para definir a tolerancia de fichas em aberto para vizualizaÇão da Nota da Prova

                 echo "<br>";
   
                 if ($Fichas[QTD] >= 1) 
                 {
                     if ($Fichas[QTD] == 1)
                         echo "<table border='1' width='815'>
                                  <tr>
                                      <td width='12' align='center'>Existe uma ficha sem responder, uma ficha não respondida não será mostrada a nota das provas, favor responder...</br>
                                                                         Para visualizar as notas referentes as Provas realizadas é preciso primeiro responder a Ficha de Avaliação</br>
                                      </td>
                                  </tr>
                               </table>";
                     else
                         echo "<table border='1' width='815'>
                                  <tr>
                                      <td width='12' align='center'>Existe $Fichas[QTD] fichas sem responder, apartir de uma ficha não respondida não será mostrada a nota das provas, favor responder...</br>
                                                                         Para visualizar as notas referentes as Provas realizadas é preciso primeiro responder as $Fichas[QTD] Fichas de Avaliação</br>
                                  </tr>
                               </table>";
                 }
                 else
                 {
                       // Mostra a nota em forma de Lista
                      //--------------------------------------------------------------------------------------

                      $sql_nota="select distinct na.CodProva, na.Nota,
                                          extract(day from te.dataaplicacao)||'/'||extract(month from te.dataaplicacao)||'/'||extract(year from te.dataaplicacao) as dataaplicacao
                                 From nota_aluno_view na, Teste te
                                 where na.idcurso = $_SESSION[idCurso]
                                    and   na.idturma = $_SESSION[idTurma]
                                    and   na.identidade = '$_SESSION[identidadeAluno]'
                                    and   na.idCurso = te.idCurso
                                    and   na.idturma = te.IdTurma
                                    and   na.referenciaavaliacao = te.referenciaavaliacao
                                    and   na.codmateria = te.codmateria
                                    and   te.ApresentarNota = 'S'
                                 Order by te.dataaplicacao";
                      $Res_nota = ibase_query($conexao,$sql_nota);

                      $i=0;
                      $media=0;

                      if ($Fichas[QTD] == 0)
                      {
                         echo "<select name='ListaDeFichas' class='caixa' id='conteudoNota''>";
                         echo "<option >--- $msg</option>";
                         echo "<option value= => ------------------------------------------------------------------------- </option>";
                         while($nota = ibase_fetch_assoc($Res_nota))
                         {
                            $i++;

                            echo "<option value= => $i -  $nota[DATAAPLICACAO] -  $nota[CODPROVA] - $nota[NOTA]  </option>";
                            echo "<option value= => ------------------------------------------------------------------------- </option>";
                            $soma_media = $soma_media + $nota[NOTA] ;
                         }
                      }

                      if ( $nome[NOTAFINAL] > 0 )
                          echo "<option value= => Média ------------------>  $nome[NOTAFINAL] </option>";
                      echo "</select>";
                   }
                } 
  
          ?>
          </p>

          </form>

       </div> 

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
               echo "<table border='1' width='1022'>
                        <tr>
                            <td width='12' align='left'>$Msg</td>
                        </tr>
                     </table>";

           ?>
      
        </div> 

 
        <div class="conteudo"> 
        	        <div class="botoes">
        	<h3 align="center">Questões</h3>
            <p>Clique sobre o número da questão que deseja responder.</p>
            <p>
        	<?php
                $numQuestoes=45;
                $contBt=0;
                for ($i=1; $i<=$numQuestoes; $i++)
                {
                    if($contBt>4)
                    {
                        $contBt=1;
                        echo "<br>";
                    }
                    else
                        $contBt++;
                    
                    echo "<input type='button' value='".$i."' onclick='newPage($i)' class='button'/> ";
                }
            ?>
        	</p>
            <p><script> document.write(new Date()) </script> </p>
        
        
        </div>
        <div class="questao">Questao </div>
        <div class="rodape">rodape</div>

        </div> 
    </div> 
</div>

</body>
</html>
