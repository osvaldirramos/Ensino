<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : MontaPgina.php                                 //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a p�gina de //
  //                             entrada das respostas dos alunos.              //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj S�nia                                      //
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


   require_once("verifica_sessao.php");
?>

<div id="corpo">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">

<title>AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</title>
<div align='right'><a href='index.php' target='_self' >Sair</a></div>
<div id="logol">
  <img src="image/brasao.gif" alt="ICEA" />
</div>
<div id="titulo" class="BODY">INSTITUTO DE CONTROLE DO ESPA�O A�REO</div>
<div id="titulo" class="BODY">AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>
<script type="text/javascript" language="javascript">

function botao()
{
   document.Form_AtuandoNaArea.submit();
   document.form_RespDisciplina.submit();
   document.form_CargaHoraria.submit();
   document.form_Complemento.submit();
}

</script>
</head>


<?php    //---
        //--- Tratamento do Cabecalho da Pagina
   
   require_once("conecta.inc");

   //faz select para montar questionario
  $sql = "select * from APC_DISCIPLINA
          where IDCURSO=$_SESSION[idCurso]
          and IDTURMA=$_SESSION[idTurma]
          and NOMEMATERIA <> 'Total'
          order by CODMATERIA";
  
   $resultado = ibase_query($conexao, $sql);

   //faz select do nome do curso
   $sqlcurso = "select CODCURSO,NOMECURSO, DESCRICAO
                from CURSO
                where IDCURSO=$_SESSION[idCurso]";
   $resultadocurso = ibase_query($conexao, $sqlcurso);
   $curso = ibase_fetch_assoc($resultadocurso);

   //faz select do nome, nome de guerra do aluno
   $sqlaluno = "select NOME, NOMEGUERRA from PESSOA where Identidade='$_SESSION[idCodigo]'";
   $resultadoaluno = ibase_query($conexao, $sqlaluno);
   $aluno = ibase_fetch_assoc($resultadoaluno);

    //---
   //--- Cabecalho Inicial

   $DataResposta= date("d/m/Y",strtotime($_SESSION[DataResposta]));  // Pega a data limite para resposa do aluno

//   echo "<p class='style1' align='center'>VALIDA&Ccedil;&Atilde;O CURRICULAR</p>";
   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo "<p class='style1' align='center'>QUESTION�RIO PARA O CHEFE IMEDIATO</p>";

      echo "
            Com o objetivo de verificar a adequa��o do curr�culo do Curso <strong> $curso[NOMECURSO] - ($curso[CODCURSO])</strong>  �s reais necessidades do SISCEAB, o DECEA est� iniciando o processo de valida��o curricular do referido curso, a partir da coleta de informa��es junto aos ex-alunos de 2005.
            Para cumprir esta importante tarefa, o DECEA conta com sua valiosa contribui��o, preenchendo o question�rio na p�gina do ICEA, at� $DataResposta
            <p> </p>
            <p>Ex-aluno do $curso[NOMECURSO] - ($curso[CODCURSO]) - $aluno[NOME] - $aluno[NOMEGUERRA]</p>

             <p>Visando orient�-lo quanto ao preenchimento deste question�rio, relacionamos abaixo o objetivo do $curso[CODCURSO]</p>

             �$curso[DESCRICAO]�
            <p> </p>
            ";
   }
   else
   {
      echo "<p class='style1' align='center'>QUESTION�RIO DO ALUNO</p>";

      echo "
            Com o objetivo de verificar a adequa��o do curr�culo do Curso <strong> $curso[NOMECURSO] - ($curso[CODCURSO])</strong>  �s reais necessidades do SISCEAB, o DECEA est� iniciando o processo de valida��o curricular do referido curso, a partir da coleta de informa��es junto aos ex-alunos de 2005.
            Considerando a import�ncia do assunto, a sua participa��o no processo desta Valida��o Curricular � de car�ter obrigat�rio, devendo ser realizada atrav�s do preenchimento individual do presente at� $DataResposta

            <p>Agradecemos sua colabora��o, refor�ando a import�ncia de um preenchimento consciente, a fim de que o DECEA receba o maior n�mero de dados poss�veis que lhe permitam o aperfei�oamento do referido curso. </p>

            <p> </p>
            <p>Ex-aluno do $curso[NOMECURSO] - ($curso[CODCURSO]) - $aluno[NOME] - $aluno[NOMEGUERRA]</p>

             <p>Visando orient�-lo quanto ao preenchimento deste question�rio, relacionamos abaixo o objetivo do $curso[CODCURSO]</p>

             �$curso[DESCRICAO]�
            <p> </p>
            ";
   }
   echo "";
   echo "<hr size='1'/>";
   echo "";
?>

<form id='Form_AtuandoNaArea' name='Form_AtuandoNaArea' method='post' action='insere_atuando.php'>
<?php
    //---
   //--- Tratamento da pergunta se esta atuando na area
      
   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo"<p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- O ex-aluno est� atuando na fun��o para a qual foi formado?</p>";
   }
   else
   {
      echo"<p style='font-family:  Arial,Verdana, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Voc&ecirc; est&aacute; atuando na fun&ccedil;&atilde;o para qual foi formado?</p>";
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

<form id='form_RespDisciplina' name='form_RespDisciplina' method='post' action='insere_respdisciplina.php'>

<?php
    //---
   //--- Tratamento da entrada da op��o de Respostas da Disciplina

   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Para cada uma das disciplinas relacionadas a seguir, informe a sua pertin&ecirc;ncia para o desenvolvimento das atividades funcionais do ex-aluno:</span></p>";
   }
   else
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Para cada uma das disciplinas relacionadas a seguir, informe a sua pertin&ecirc;ncia para o desenvolvimento de suas atividades funcionais:</span></p>";
   }

   echo "<table border='1' cellspacing='0' cellpadding='0' width='900' >
         <tr bgcolor='#CCCCCC'>
            <td width='100' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>DISCIPLINA</span></td>
            <td width='200' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>EMENTA</span></td>
            <td width='550' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>PERGUNTA</span></td>
            <td width='150' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>APLICABILIDADE</span></td>
         </tr>
         </table>";

     $Contador=0;
   //p�e resultado no array e exibe questionario
   while ($row = ibase_fetch_assoc($resultado))
   {
      $Contador++;
      $radio = $row['CODMATERIA'];

      echo "<table border='1' cellspacing='0' cellpadding='0' width='900' class='style3'>
            <tr>
               <div><td width='100'>$row[NOMEMATERIA]</td></div>
               <div><td width='200'>$row[EMENTA]</td></div>
               <div><td width='550'>$row[PERGUNTAALUNO]</td></div>

               <td width='150'><table border='0' cellspacing='0' cellpadding='0' width='100'>
               <tr>
               <tr>   <td width='23'><input type='radio' name='$radio' id='radio6' value='0' /></td>
                 <td width='60'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Nenhuma </span></td> </tr>
                <tr>  <td width='22'><input type='radio' name='$radio' id='radio6' value='1' /></td>
                 <td width='44'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Pouca </span></td>
                <tr>  <td width='22'><input type='radio' name='$radio' id='radio6' value='2' /></td>
                 <td width='48'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>M&eacute;dia</span></td>   </tr>
                <tr>  <td width='23'><input type='radio' name='$radio' id='radio6' value='3' /></td>
                 <td width='43'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Muita </span></td>
                <tr>  <td width='22'><input type='radio' name='$radio' id='radio6' value='4' /></td>
                 <td width='42'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Total </span></td>  </tr>
                </tr>
             </table></td>
             </tr>
            </table>";
	
    }
?>
</form>


<script>

function verificaFORM1(){

	var ok=0;
	var Sel=0;

  	for (i=0;i<document.Form_AtuandoNaArea.elements.length;i++) {
		if(document.Form_AtuandoNaArea[i].type=="radio")
			if(document.Form_AtuandoNaArea[i].checked==true)
				Sel++;
	}

	if(Sel != 1)
		ok=0;
	else{
	 	ok=1;
	}

	return ok;
}



function verificaFORM2(){

	var ok=0;
	var Sel=0;
	<?php echo"var Nb = $Contador"; ?>

	for (i=0;i<document.form_RespDisciplina.elements.length;i++) {
		if(document.form_RespDisciplina[i].type=="radio")
			if(document.form_RespDisciplina[i].checked==true)
				Sel++;
	}

	if(Sel != Nb)
		ok=0;
	else{
	 	ok=1;
	}

	return ok;
}
function verificaFORM3(){

	var ok=0;
	var Sel=0;
	<?php echo"var Nb = $Contador+1"; ?>

	for (i=0;i<document.form_CargaHoraria.elements.length;i++) {
		if(document.form_CargaHoraria[i].type=="radio")
			if(document.form_CargaHoraria[i].checked==true)
				Sel++;
	}

	if(Sel != Nb)
		ok=0;
	else{
	 	ok=1;
	}

	return ok;
}
function verificando(){

    var P1=verificaFORM1();
    var P2=verificaFORM2();
	var P3=verificaFORM3();

	if(P1 == 0 || P2 == 0 || P3 == 0)
		alert('Existe quest�o n�o respondida, para finalizar dever� ser respondida todas quest�es...');
	if(P1 == 1 && P2 == 1 && P3 == 1)  {
     document.Form_AtuandoNaArea.submit();
     document.form_RespDisciplina.submit();
     document.form_CargaHoraria.submit();
     document.form_Complemento.submit();  }

}

</script>



<?php
   if ($_SESSION[identificacao] == 'Aluno')
   {
      echo "<br/>";
      echo "<hr size='1'/>";
      echo "<br/>";
   }
?>

<form id='form_CargaHoraria' name='form_CargaHoraria' method='post' action='inserecarga.php'>
<?php
    //---
   //--- Tratamento da entrada da Carga Horaria

   if ($_SESSION[identificacao] == 'Aluno')
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Com base no objetivo do  <strong>$curso[CODCURSO] </strong> e considerando a carga hor&aacute;ria das disciplinas, d&ecirc; sua opni&atilde;o acerca da profundidade de cada uma. </span></p>";

      echo "<table border='1' cellspacing='0' cellpadding='0' width='900' bgcolor='#CCCCCC'>
            <tr>
               <td width='420' rowspan='2' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>DISCIPLINA</span></td>
               <td width='60' rowspan='2' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>CARGA HOR�RIA</span></td>
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

       $sqlcarga = "select * from APC_DISCIPLINA
                    where IDCURSO=$_SESSION[idCurso]
                    AND IDTURMA=$_SESSION[idTurma]
                    Order By CODMATERIA";
      $resultadocarga = ibase_query($conexao, $sqlcarga);

      while ($rowcarga = ibase_fetch_assoc($resultadocarga))
      {
         $radiocarga = $rowcarga['CODMATERIA'];

         $carga =  $rowcarga['NUMEROAULASTEORICAS'] + $row['NUMEROAULASPRATICAS'] ;
         echo "<table border='1' cellspacing='0' cellpadding='0' width='900' class='style3' >
               <tr>
                  <td width='402'>$rowcarga[NOMEMATERIA]</td>
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

<form id='form_Complemento' name='form_Complemento' method='post' action='insere_complemento.php'>
<?php
    //---
   //--- Tratamento da entrada do Complemento

   echo "<p>Cite dificuldades que tenha, porventura, encontrado no desempenho da(s) fun&ccedil;&atilde;o(es) atribu&iacute;das a voc&ecirc; em sua unidade.</p>
   <p>
   <label>
      <textarea name='dificuldade' id='dificuldades' cols='100' rows='4' ></textarea>
   </label>";

   echo "<p>Neste espa&ccedil;o, registre o que voc&ecirc; considera que possa ser feito para o aperfei&ccedil;oamento do  <strong>$curso[CODCURSO] </strong> (sugest&otilde;es de novos assuntos a serem abordados, metodologias(formas ) de ensino, etc.).</p>
   <p>
   <label>
      <textarea name='sugestao' id='sugestoes' cols='100' rows='4' ></textarea>
    </label>";
   echo "<br/>";
   echo "<br/>";

?></form>

<input type='button' name='enviar_consulta' id='enviar_consulta' value='Enviar' onclick="verificando();"/>
<?php
   ibase_close($conexao);
?>
</html></div>
