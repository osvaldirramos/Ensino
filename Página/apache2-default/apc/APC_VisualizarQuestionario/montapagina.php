<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : MontaPgina.php                                 //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de //
  //                             de demonstração das perguntas.                 //
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

<p align="right"><table border="0" width="7%">
<tr>
  <td><div align='right'><a href='ListaCursos.php' target='_self' >Voltar</a></div></td>
  <td><div align='right'><a href='../Ferramenta_Ensino/index.php' target='_self' >Sair</a></div></td>
</tr>
</table>
</p>

</br>

<script>
    //Funções que faz tratamento da textearea

    conteudo_textarea = "";
    num_caracteres_permitidos = 1000;

    function valida_longitude(){
       num_caracteres = document.forms[3].dificuldade.value.length;

       if (num_caracteres > num_caracteres_permitidos){
         document.forms[3].dificuldade.value = conteudo_textarea;
       }else{
         conteudo_textarea = document.forms[3].dificuldade.value;
       }

       if (num_caracteres >= num_caracteres_permitidos){
         document.forms[3].dificul.style.color="#ff0000";
       }else{
          document.forms[3].dificul.style.color="#000000";
    }
       contadificul()
    }
    function contadificul(){
       document.forms[3].dificul.value=document.forms[3].dificuldade.value.length
    }

   //--------------
    function valida_longitudes(){
       num_caracteres = document.forms[3].sugestao.value.length;

       if (num_caracteres > num_caracteres_permitidos){
         document.forms[3].sugestao.value = conteudo_textarea;
       }else{
         conteudo_textarea = document.forms[3].sugestao.value;
       }

       if (num_caracteres >= num_caracteres_permitidos){
         document.forms[3].caracteress.style.color="#ff0000";
       }else{
         document.forms[3].caracteress.style.color="#000000";
      }
      conta()
   }
   function conta(){
       document.forms[3].caracteress.value=document.forms[3].sugestao.value.length
   }
   //FIM - Funções que faz tratamento da textearea
</script>
</head>


<?php    //---
        //--- Tratamento do Cabecalho da Pagina
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/Funcoes.php");

   $_SESSION[idCurso]= $_POST[curso];
   $_SESSION[identificacao]= $_POST[identificacao];

   //faz select para montar questionario
   $sql = "select distinct IDCURSO, CODMATERIA, NOMEMATERIA, NUMEROAULASTEORICAS, NUMEROAULASPRATICAS, FASE, PERGUNTAALUNO, PERGUNTACHEFE from MATERIACURSO
          where IDCURSO=$_SESSION[idCurso]
          order by CODMATERIA";


//   $sql = "select * from MATERIACURSO
//          where IDCURSO=$_SESSION[idCurso]
//          order by CODMATERIA";


   $resultado = ibase_query($conexao, $sql);

   //faz select do nome do curso

   $sqlcurso = "select CODCURSO,NOMECURSO, DESCRICAO
                from CURSO
                where IDCURSO=$_SESSION[idCurso]";
   $resultadocurso = ibase_query($conexao, $sqlcurso);
   $curso = ibase_fetch_assoc($resultadocurso);

   //---
   //--- Cabecalho Inicial

   $DataResposta= date("d/m/Y",strtotime($_SESSION[DataResposta]));  // Pega a data limite para resposa do aluno


   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo "<p class='style1' align='center'>QUESTIONÁRIO PARA O CHEFE IMEDIATO</p>";

      echo "
            Com o objetivo de verificar a adequação do currículo do Curso <strong> $curso[NOMECURSO] - ( $curso[CODCURSO] )</strong>  às reais necessidades do SISCEAB, o DECEA está iniciando o processo de validação curricular do referido curso, a partir da coleta de informações junto aos ex-alunos de 2010.
            Para cumprir esta importante tarefa, o DECEA conta com sua valiosa contribuição, preenchendo o questionário na página do ICEA, até 31/10/2011
            <p> </p>
            <p>Ex-aluno do $curso[NOMECURSO] - ( $curso[CODCURSO] ) - Nome do Aluno - Nome de Guerra</p>

            <p>Visando orientá-lo quanto ao preenchimento deste questionário, relacionamos abaixo o objetivo do $curso[CODCURSO]</p>

            “$curso[DESCRICAO]”
            <p> </p>";
   }
   else
   {
      echo "<p class='style1' align='center'>QUESTIONÁRIO DO ALUNO</p>";

      echo "
            Com o objetivo de verificar a adequação do currículo do Curso <strong> $curso[NOMECURSO] - ( $curso[CODCURSO] )</strong>  às reais necessidades do SISCEAB, o DECEA está iniciando o processo de validação curricular do referido curso, a partir da coleta de informações junto aos ex-alunos de 2010.
            Considerando a importância do assunto, a sua participação no processo desta Validação Curricular é de caráter obrigatório, devendo ser realizada através do preenchimento individual do presente até 31/10/2011
            <p>Agradecemos sua colaboração, reforçando a importância de um preenchimento consciente, a fim de que o DECEA receba o maior número de dados possíveis que lhe permitam o aperfeiçoamento do referido curso. </p>
            <p> </p>
            <p>Ex-aluno do <strong>$curso[NOMECURSO] - ( $curso[CODCURSO] ) - $aluno[NOME] - $aluno[NOMEGUERRA]</strong></p>
            <p>Visando orientá-lo quanto ao preenchimento deste questionário, relacionamos abaixo o objetivo do $curso[CODCURSO]</p>
            ";
            if($curso[DESCRICAO]==""){
            }
            else{
            echo "“$curso[DESCRICAO]”<p></p>";
            }
   }
   echo "";
   echo "<hr size='1'/>";
   echo "";
?>

<form id='Form_AtuandoNaArea' name='Form_AtuandoNaArea' method='post' >
<?php
    //---
   //--- Tratamento da pergunta se esta atuando na area
      
   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo"<p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- O ex-aluno está atuando na função para a qual foi formado?</p>";
   }
   else
   {
      echo"<p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Voc&ecirc; est&aacute; atuando na fun&ccedil;&atilde;o para qual foi formado? *</p>";
   }

   echo "<table width='350' border='0' cellpadding='0' cellspacing='0'>
         <tr>
           <td width='23'><input type='radio' name='atuando' id='atua' value='S' /></td>
           <td width='60'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Sim </span></td>
           <td width='22'><input type='radio' name='atuando' id='atua' value='N' /></td>
           <td width='44'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>N&atilde;o </span></td>
           <td width='22'><input type='radio' name='atuando' id='atua' value='E' /></td>
           <td width='48'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Em parte</span></td>
         </tr>
         </table><br/>";
?>
</form>

<?php
   echo "<hr size='1'/>";
   echo "<br/>";
?>

<form id='form_RespDisciplina' name='form_RespDisciplina' method='post' >
<?php
    //---
   //--- Tratamento da entrada da opção de Respostas da Disciplina

   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Para cada uma das disciplinas relacionadas a seguir, informe a sua pertin&ecirc;ncia para o desenvolvimento das atividades funcionais do ex-aluno:</span></p>";
   }
   else
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Para cada uma das disciplinas relacionadas a seguir, informe a sua pertin&ecirc;ncia para o desenvolvimento de suas atividades funcionais:</span> * </p>";
   }

   echo "<table border='1' cellspacing='0' cellpadding='0' width='1030' >
         <tr bgcolor='#CCCCCC'>
            <td width='300' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>DISCIPLINA</span></td>
            <td width='380' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>EMENTA</span></td>
            <td width='350' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>APLICABILIDADE</span></td>
         </tr>
         </table>";

   $Contador=0;

   //põe resultado no array e exibe questionario
   while ($row = ibase_fetch_assoc($resultado))
   {
      $Contador++;
      $radio = $row['CODMATERIA'];

      if ($_SESSION[identificacao] == 'Chefe')
      {
         $Retorno= $f-> TrataEnter($row[PERGUNTACHEFE]);
      }
      else
      {
         $Retorno= $f-> TrataEnter($row[PERGUNTAALUNO]);
      }


      echo "<table border='1' cellspacing='0' cellpadding='0' width='1030' class='style3'>
            <tr>
               <div><td width='300'>$row[NOMEMATERIA]</td></div>
               <div><td width='380'>$Retorno</td></div>
               <td width='350'><table border='0' cellspacing='0' cellpadding='0' width='350'>
               <tr>
                  <td width='23'><input type='radio' name='$radio' id='radio6' value='0' /></td>
                  <td width='60'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Nenhuma </span></td>
                  <td width='22'><input type='radio' name='$radio' id='radio6' value='1' /></td>
                  <td width='44'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Pouca </span></td>
                  <td width='22'><input type='radio' name='$radio' id='radio6' value='2' /></td>
                  <td width='48'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>M&eacute;dia</span></td>
                  <td width='23'><input type='radio' name='$radio' id='radio6' value='3' /></td>
                  <td width='43'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Muita </span></td>
                  <td width='22'><input type='radio' name='$radio' id='radio6' value='4' /></td>
                  <td width='42'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Total </span></td>
                </tr>
             </table></td>
             </tr>
            </table>";
    }
?>
</form>

<?php
   if ($_SESSION[identificacao] == 'Aluno')
   {
      echo "<br/>";
      echo "<hr size='1'/>";
      echo "<br/>";
   }
?>


<form id='form_CargaHoraria' name='form_CargaHoraria' method='post' >
<?php
    //---
   //--- Tratamento da entrada da Carga Horaria

   if ($_SESSION[identificacao] == 'Aluno')
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Com base no objetivo do  <strong>$curso[CODCURSO] </strong> e considerando a carga hor&aacute;ria das disciplinas, d&ecirc; sua opni&atilde;o acerca da profundidade de cada uma. </span> * </p>";

      echo "<table border='1' cellspacing='0' cellpadding='0' width='1030' bgcolor='#CCCCCC'>
            <tr>
               <td width='550' rowspan='2' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>DISCIPLINA</span></td>
               <td width='60' rowspan='2' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>CARGA HORÁRIA</span></td>
               <td width='420' height='20' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>PROFUNDIDADE</span></td>
            </tr>
            <tr>
               <td><table width='416' height='30' border='0' >
               <tr height='10'>
               <td width='144' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>INSUFICIENTE</span></td>
               <td width='120' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>SUFICIENTE</span></td>
               <td width='138' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>EXCESSIVA</span></td>
           </tr></table></td>
           </tr>
           </table>";

       $sqlcarga = "select distinct IDCURSO, CODMATERIA, NOMEMATERIA, NUMEROAULASTEORICAS, NUMEROAULASPRATICAS, FASE, PERGUNTAALUNO, PERGUNTACHEFE from MATERIACURSO
                    where IDCURSO=$_SESSION[idCurso]
                    Order By CODMATERIA";
      $resultadocarga = ibase_query($conexao, $sqlcarga);

      while ($rowcarga = ibase_fetch_assoc($resultadocarga))
      {
         $radiocarga = $rowcarga['CODMATERIA'];

         $carga =  $rowcarga['NUMEROAULASTEORICAS'] + $row['NUMEROAULASPRATICAS'] ;
         echo "<table border='1' cellspacing='0' cellpadding='0' width='1030' class='style3' >
               <tr>
                  <td width='530'>$rowcarga[NOMEMATERIA]</td>
                  <td width='58' align='center'>$carga</td>
                  <td width='145' align='center'><input type='radio' name='$radiocarga' id='radio2' value='0' /></td>
                  <td width='118' align='center'><input type='radio' name='$radiocarga' id='radio3' value='1' /></td>
                  <td width='143' align='center'><input type='radio' name='$radiocarga' id='radio4' value='2' /></td>
               </tr>
               </table>";

      }
   }
?>

</form>
<?php
   echo "<br/>";
   echo "<hr size='1'/>";
   echo "<br/>";
?>

<form id='form_Complemento' name='form_Complemento' method='post' action='ListaCursos.php'>
<?php
    //---
   //--- Tratamento da entrada do Complemento

   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo "<p>Cite as principais dificuldades que o ex-aluno do curso <strong>$curso[CODCURSO] </strong> tenha encontrado no desempenho de sua(s) função(s) que podem ser sanadas através do aperfeiçoamento do curso
      <p>
      <label>
         <textarea name='dificuldade' id='dificuldades' cols='125' rows='4'onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
         <input name='dificul' type='text' id='caracteresd' size='3' maxlength='4' />
      </label>";
   }
   else
   {
      echo "<p>Cite dificuldades que tenha, porventura, encontrado no desempenho da(s) fun&ccedil;&atilde;o(es) atribu&iacute;das a voc&ecirc; em sua unidade.</p>
      <p>
      <label>
         <textarea name='dificuldade' id='dificuldades' cols='125' rows='4'onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
         <input name='dificul' type='text' id='caracteresd' size='3' maxlength='4' />
      </label>";
   }

   echo "<p>Neste espa&ccedil;o, registre o que voc&ecirc; considera que possa ser feito para o aperfei&ccedil;oamento do  <strong>$curso[CODCURSO] </strong> (sugest&otilde;es de novos assuntos a serem abordados, metodologias(formas ) de ensino, etc.).</p>
   <p>
   <label>
      <textarea name='sugestao' id='sugestoes' cols='125' rows='4' onKeyDown='valida_longitudes()' onKeyUp='valida_longitudes()'></textarea>
      <input name='caracteress' type='text' id='caracteress' size='3' maxlength='4' />
    </label>";
   echo "<br/>";
   echo "<br/>";

?>

<input type='submit' name='enviar_consulta' id='enviar_consulta' value='Voltar' />
</form>

<?php
   ibase_close($conexao);
?>
</html>
</div>
