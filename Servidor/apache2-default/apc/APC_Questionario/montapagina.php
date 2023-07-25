<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : MontaPgina.php                                 //
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
   require_once("verifica_sessao.php");
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css">
<link href="apc.css" rel="stylesheet" type="text/css">

<title>AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</title>
<div id="corpo">
<div align='right'><a href='login.php' target='_self' >Sair</a></div>
<div align="center" id="topo"><img width='900' src="topo.png"></div>
<BR>
<div align='center'>AVALIA&Ccedil;&Atilde;O P&Oacute;S-CURSO</div>
<BR>
<p>&nbsp;</p>

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

   //faz select para montar questionario
   $sql = "select ano from turma
          where IDCURSO=$_SESSION[idCurso]
          and IDTURMA=$_SESSION[idTurma]";
   $resultadoTurma = ibase_query($conexao, $sql);
   $turma=ibase_fetch_assoc($resultadoTurma);

    //---
   //--- Cabecalho Inicial

   $DataResposta= date("d/m/Y",strtotime($_SESSION[DataResposta]));  // Pega a data limite para resposa do aluno

//   echo "<p class='style1' align='center'>VALIDA&Ccedil;&Atilde;O CURRICULAR</p>";
   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo "<p id='titulo'>QUESTIONÁRIO PARA O CHEFE IMEDIATO</p></br>";

      echo "
            Com o objetivo de verificar a adequação do currículo do Curso <strong> $curso[NOMECURSO] - ( $curso[CODCURSO] )</strong>  às reais necessidades do SISCEAB, o ICEA está iniciando o processo de avaliação do referido curso, a partir da coleta de informações junto aos ex-alunos de $turma[ANO].
            Para cumprir esta importante tarefa, o ICEA conta com sua valiosa contribuição, preenchendo o questionário na página do ICEA, até $DataResposta
            <p> </p><br>
            <p>Ex-aluno do $curso[NOMECURSO] - ( $curso[CODCURSO] ) - $aluno[NOME] - $aluno[NOMEGUERRA]</p>

             <p>Visando orientá-lo quanto ao preenchimento deste questionário, relacionamos abaixo o objetivo do $curso[CODCURSO] :</p>

             “$curso[DESCRICAO]”
            <p> </p>
            ";
   }
   else
   {
      echo "<p id='titulo'>QUESTIONÁRIO DO ALUNO</p></br>";

      echo "
            Com o objetivo de verificar a adequação do currículo do Curso <strong> $curso[NOMECURSO] - ( $curso[CODCURSO] )</strong>  às reais necessidades do SISCEAB, o ICEA está iniciando o processo de avaliação do referido curso, a partir da coleta de informações junto aos ex-alunos de $turma[ANO].
            Considerando a importância do assunto, a sua participação no processo desta Validação Curricular é de caráter obrigatório, devendo ser realizada através do preenchimento individual do presente até $DataResposta

            <p>Agradecemos sua colaboração, reforçando a importância de um preenchimento consciente, a fim de que o ICEA receba o maior número de dados possíveis que lhe permitam o aperfeiçoamento do referido curso. </p>

            <p> </p> <br>
            <p>Ex-aluno do $curso[NOMECURSO] - ( $curso[CODCURSO] ) - $aluno[NOME] - $aluno[NOMEGUERRA]</p>

             <p>Visando orientá-lo quanto ao preenchimento deste questionário, relacionamos abaixo o objetivo do $curso[CODCURSO] :</p>

             “$curso[DESCRICAO]”
            <p> </p>
            ";
   }
   echo "<hr size='1'/>";
?>

<form id='form_RespDisciplina' name='form_RespDisciplina' method='post' action='insere_respdisciplina.php'>
<?php
    //---
   //--- Tratamento da pergunta se esta atuando na area
      
   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo"<p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- O ex-aluno está atuando na função para a qual foi capacitado?</p>";
   }
   else
   {
      echo"<p style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Voc&ecirc; est&aacute; atuando na fun&ccedil;&atilde;o para qual foi capacitado?</p>";
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


<?php
   echo "<hr size='1'/>";
   echo "<br/>";
?>



<?php
    //---
   //--- Tratamento da entrada da opção de Respostas da Disciplina

   if ($_SESSION[identificacao] == 'Chefe')
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Para cada uma das disciplinas relacionadas a seguir, informe a sua pertin&ecirc;ncia para o desenvolvimento das atividades funcionais do ex-aluno:</span></p>";
   }
   else
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Para cada uma das disciplinas relacionadas a seguir, informe a sua pertin&ecirc;ncia para o desenvolvimento de suas atividades funcionais:</span></p>";
   }

   echo "<table border='0' cellspacing='0' cellpadding='5' width='900' >
         <tr bgcolor='#CCCCCC'>
            <td width='450' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; color: #5D5D5D;'>ASSUNTOS</span></td>
            <td width='700' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; color: #5D5D5D;'>PERGUNTA</span></td>
            <td width='60' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; color: #5D5D5D;'>APLICABILIDADE</span></td>
         </tr>
         </table>";

     $Contador=1;
     $Cont=0;
   //põe resultado no array e exibe questionario
   while ($row = ibase_fetch_assoc($resultado))
   {

      $Contador++;
      $cor = "#FFFFFF";
      if($Cont%2!=0){$cor="#E9E9E9";}
      $radio = $row['CODMATERIA'];
      $Cont++;
      echo "<table border='0' cellspacing='0' cellpadding='10' width='900' class='style3'>
            <tr bgcolor='$cor'>
               <div><td width='200'>$row[NOMEMATERIA]</td></div>
               <div><td width='255'>$row[EMENTA]</td></div>";
               
      if ($_SESSION[identificacao] == 'Chefe'){	echo  "<div><td width='700'>$row[PERGUNTACHEFE]</td></div>";} else {echo  "<div><td width='700'>$row[PERGUNTAALUNO]</td></div>";} 
      echo    "<td width='50'><table border='0' cellspacing='0' cellpadding='0' width='50'>
               <tr>
                  <td width='23'><input type='radio' name='$radio' id='radio6' value='0' /></td>
                  <td width='60'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Nenhuma </span></td> </tr>
                  <tr ><td width='22'><input type='radio' name='$radio' id='radio6' value='1' /></td>
                  <td width='44'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Pouca </span></td></tr>
                  <tr ><td width='22'><input type='radio' name='$radio' id='radio6' value='2' /></td>
                  <td width='48'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>M&eacute;dia</span></td></tr>
                  <tr ><td width='23'><input type='radio' name='$radio' id='radio6' value='3' /></td>
                  <td width='43'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Muita </span></td></tr>
                  <tr ><td width='22'><input type='radio' name='$radio' id='radio6' value='4' /></td>
                  <td width='42'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Total </span></td>
                </tr>
             </table></td>
             </tr>
            </table>";
	
    }
    $usuario= $_SESSION[identificacao];
?>

<?php
   if ($_SESSION[identificacao] == 'Aluno')
   {
      echo "<br/>";
      echo "<hr size='1'/>";
      echo "<br/>";
   }
?>


<?php
    //---
   //--- Tratamento da entrada da Carga Horaria

   if ($_SESSION[identificacao] == 'Aluno')
   {
      echo "<p><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color:#000000;'>- Com base no objetivo do  <strong>$curso[CODCURSO] </strong> e considerando a carga hor&aacute;ria das disciplinas, d&ecirc; sua opini&atilde;o acerca da profundidade de cada uma. </span></p>";

      echo "<table border='0' cellspacing='0' cellpadding='0' width='900' bgcolor='#CCCCCC'>
            <tr>
               <td width='290' rowspan='2' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>DISCIPLINA</span></td>
               <td width='80' rowspan='2' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>CARGA HORÁRIA</span></td>
               <td width='420' height='20' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'><strong>PROFUNDIDADE</strong></span></td>
            </tr>
            <tr>
               <td><table width='416' height='30' border='0' >
               <tr height='10'>
               <td width='120' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>INSUFICIENTE</span></td>
               <td width='170' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>SUFICIENTE</span></td>
               <td width='50' align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>EXCESSIVA</span></td>
           </tr></table></td>
           </tr>
           </table>";

       $sqlcarga = "select * from APC_DISCIPLINA
                    where IDCURSO=$_SESSION[idCurso]
                    AND IDTURMA=$_SESSION[idTurma]
                    Order By CODMATERIA";
      $resultadocarga = ibase_query($conexao, $sqlcarga);
      $Cont=0;

      while ($rowcarga = ibase_fetch_assoc($resultadocarga))
      {
         $Contador++;
         $cor = "#FFFFFF";
         if($Cont%2!=0){$cor="#E9E9E9";}
         $radiocarga = $rowcarga['CODMATERIA'];
         $Cont++;
	  if($rowcarga['NOMEMATERIA']=='Total'){
	     break;
         }	
         $carga =  $rowcarga['NUMEROAULASTEORICAS'] + $row['NUMEROAULASPRATICAS'] ;
         echo "<table border='0' cellspacing='0' cellpadding='0' width='900' class='style3' >
               <tr bgcolor='$cor'>
                  <td width='283'>$rowcarga[NOMEMATERIA]</td>
                  <td width='55' align='center'>$carga</td>
                  <td width='146' align='center'><input type='radio' name='c$radiocarga' id='radio2' value='0' /></td>
                  <td width='118' align='center'><input type='radio' name='c$radiocarga' id='radio3' value='1' /></td>
                  <td width='143' align='center'><input type='radio' name='c$radiocarga' id='radio4' value='2' /></td>
               </tr>
               </table>";

      }
   }
?>


<?php
   echo "<br/>";
   echo "<hr size='1'/>";
   echo "<br/>";
?>


<?php
    //---
   //--- Tratamento da entrada do Complemento

   echo "<p>Cite dificuldades que tenha, porventura, encontrado no desempenho da(s) fun&ccedil;&atilde;o(es) atribu&iacute;das a voc&ecirc; em sua unidade.</p>
   <p>
   <label>
      <textarea name='dificuldade' id='dificuldades' cols='80' rows='4' ></textarea>
   </label>";

   echo "<p>Neste espa&ccedil;o, registre o que voc&ecirc; considera que possa ser feito para o aperfei&ccedil;oamento do  <strong>$curso[CODCURSO] </strong> sugest&otilde;es de novos assuntos a serem abordados, metodologias de ensino, etc.</p>
   <p>
   <label>
      <textarea name='sugestao' id='sugestoes' cols='80' rows='4' ></textarea>
    </label>";
   echo "<br/>";
   echo "<br/>";

?>
</form>



<script>

//function verificaFORM1(){
//
//	var ok=0;
//	var Sel=0;
//
//  	for (i=0;i<document.Form_AtuandoNaArea.elements.length;i++) {
//		if(document.Form_AtuandoNaArea[i].type=="radio")
//			if(document.Form_AtuandoNaArea[i].checked==true)
//				Sel++;
//	}
//
//	if(Sel != 1)
//		ok=0;
//	else{
//	 	ok=1;
//	}
//
//	return ok;
//}

function verificaFORM2(){

	var ok=0;
	var Sel=1;   // o campo total que não está visivel esta pré selecionado
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

//function verificaFORM3(){
//
//	var ok=0;
//	var Sel=0;
//	<?php echo"var Nb = $Contador+1"; ?>
//
//	for (i=0;i<document.form_CargaHoraria.elements.length;i++) {
//		if(document.form_CargaHoraria[i].type=="radio")
//			if(document.form_CargaHoraria[i].checked==true)
//				Sel++;
//	}
//
//	if(Sel != Nb)
//		ok=0;
//	else{
//	 	ok=1;
//	}
//
//	return ok;
//}

function verificando(){
   <?php echo"var Usuario ='$usuario' ;"; ?>
   if(Usuario!='Aluno')
      verificandoChefe();
   else
      verificandoAluno();
}

function verificandoAluno(){
//	var P1=verificaFORM1();
    var P2=verificaFORM2();
//    var P3=verificaFORM3();

    if(P2 == 0)  {
	   alert('Existe questão não respondida. Preencha para finalizar.');
    }
    if(P2 == 1)  {
  //   document.Form_AtuandoNaArea.submit();
     document.form_RespDisciplina.submit();
     //document.form_CargaHoraria.submit();
     //document.form_Complemento.submit();
      }

}

function verificandoChefe(){
//	var P1=verificaFORM1();
    var P2=verificaFORM2();

	if(P2 == 0){
	   alert('Existe questão não respondida. Preencha para finalizar.');
	}

	if(P2 == 1)  {
     //document.Form_AtuandoNaArea.submit();
     document.form_RespDisciplina.submit();
     //document.form_Complemento.submit();
     }


}

</script>

<img src='image/enviar.png' name='enviar_consulta' id='enviar_consulta' onclick="verificando();"/>
<?php
   ibase_close($conexao);
?>
</div>
</html>
