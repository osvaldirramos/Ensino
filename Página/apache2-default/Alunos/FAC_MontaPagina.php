<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : FAC_MontaPagina.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a p�gina de entrada das
  //                             respostas dos alunos da Ficha de Avalia��o de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Ten Marcela
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 06/09/2019
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

  require_once("../Funcoes/verifica_sessao.php");
  require_once("../Funcoes/Funcoes.php");

  $f= new Funcao();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Ficha de Avaliacao de Cursos</title>
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
<p><img style="margin: -10px 0px -15px 0px;" src="../imagem/topo_ICEA.png" alt="" width="1060" /></p>


<?php
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");

   require_once("../Funcoes/conecta.inc");
   $DataAtual= date('d.m.Y 00:00',time());

   //---
   //--- Tratamento do Cabecalho da Pagina

   $sql_relacionado="Select FO.IdCurso, FO.IdTurma, FO.IdAvaliacao, FO.IdFicha, IdAvaliador, FO.dataavaliacao
                               From fac_avaliacao FO, fac_avaliador FR
                               Where FO.IdAvaliacao = FR.idavaliacao
                               and   FO.idcurso = $_SESSION[idCurso]
                               and   FO.idturma = $_SESSION[idTurma]
                               and   FR.IdAvaliador =  '$_SESSION[identidadeAluno]'
                               and   FR.respondeu = 'N'";

   $Res_sql_relacionado=ibase_query($conexao,$sql_relacionado);

   $opEscolhida =0;

   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {

      $opEscolhida ++ ;
      if ($opEscolhida==$_POST[ListaDeFichas])
      {
         $instrutor ="";
         $disciplina = "";

         $_SESSION[idFicha]=$relacionado[IDFICHA];
         $_SESSION[IdAvaliacao]=$relacionado[IDAVALIACAO];

         if ((trim($relacionado[IDFICHA]) <> 2))
         {

            $sql = "Select FO.IdAvaliacao, FO.IdAvaliado, FO.Identidade, FO.Disciplina,
                           P.Nome , P.postograduacao 
                           From FAC_Avaliado FO, Pessoa P
                           Where FO.Identidade = p.Identidade 
	     	             and   FO.IdAvaliacao = $relacionado[IDAVALIACAO]";

//	echo($sql);
				 
            $Res_sql=ibase_query($conexao, $sql);
            $pessoa = ibase_fetch_assoc($Res_sql);
          
            $instrutor = $pessoa['POSTOGRADUACAO'];
            $instrutor .= ' ';
            $instrutor .= $pessoa['NOME'];

            $_SESSION[IdAvaliado]=$pessoa [IDENTIDADE];
            $_SESSION[Instrutor]= $instrutor;
         }
					 
         if ((trim($relacionado[IDFICHA]) == 1) || (trim($relacionado[IDFICHA]) == 3) || (trim($relacionado[IDFICHA]) == 5) || (trim($relacionado[IDFICHA]) == 11) || (trim($relacionado[IDFICHA]) == 13) || (trim($relacionado[IDFICHA]) == 15))
         {
            $sql = "Select CodMateria, nomemateria 
	             From materiacurso
                    where idcurso = $_SESSION[idCurso]
                    and  idturma = $_SESSION[idTurma]
                    and codmateria = '$pessoa[DISCIPLINA]' ";
            $Res_sql=ibase_query($conexao, $sql);
            $materiacurso = ibase_fetch_assoc($Res_sql);

            $disciplina = $materiacurso['NOMEMATERIA'];
            $_SESSION[codDisciplina]=$relacionado[DISCIPLINA] ;
         }
      }
   }

    //---
   //--- Tratamento para selecao das informacoes do Curso

   $sql_Comando=" select CodCurso, NomeCurso
                  From Curso
                  Where IdCurso = $_SESSION[idCurso] ";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Res_Curso=ibase_fetch_assoc($Res_sql_Comando);

    //---
   //--- Tratamento para selecao da Ficha de Avaliacao


   $sql_Comando="select F1.IdAvaliacao, F1.IdAvaliador, F2.IdFicha, F1.respondeu,
                        extract(day from F2.DataAvaliacao)||'/'||extract(month from F2.DataAvaliacao)||'/'||extract(year from F2.DataAvaliacao) as DataAvaliacao
                 From FAC_Avaliador F1,  FAC_Avaliacao F2
                 Where F1.IDAVALIACAO = F2.IDAVALIACAO
                 and   F2.IdCurso = $_SESSION[idCurso] 
                 and   F2.idTurma = $_SESSION[idTurma] 
                 and   F1.IdAvaliador= '$_SESSION[identidadeAluno]'
                 and   F1.respondeu = 'N'";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Res_FAC_Avaliacao=ibase_fetch_assoc($Res_sql_Comando);

    //---
   //--- Tratamento do Cabecalho da Pagina

   $sql_Comando= "Select cabecalho, comentario, instrucao, modelo
                  From FAC_FichaAvaliacao
                   Where IdFicha = $_SESSION[idFicha]";
   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Res_FAC_FichaAvaliacao=ibase_fetch_assoc($Res_sql_Comando);

//---
//---

   echo "<table border='0' cellspacing='0' cellpadding='0' width='1060' class='style3' bordercolor='#084B8A' bgcolor='#084B8A'>
           <tr>
              <td> <div><td width='1070' align='Center'><b style='font-size:20px'; ><p class='style2'align='center'><font color='white'><b>$Res_FAC_FichaAvaliacao[CABECALHO]</b></p></b></td></div>
            </tr>
         </table>
</div>";
   echo "</br></br>";

    //---
   // --- Mostra as informacoes do Cabecalho do Relato

   echo "<table>
             <tr><td width='1060'style='font-size:12px'><b style='font-size:12px'>CURSO: $Res_Curso[CODCURSO] - $Res_Curso[NOMECURSO] </b></td>
             <tr></tr>
         </table>";


   if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 12))
   {
     echo "<table>
               <tr><td width='1060'style='font-size:12px'>DATA AVALIA��O: <b style='font-size:12px'> $Res_FAC_Avaliacao[DATAAVALIACAO]</b></td>
               <tr></tr>
           </table>";
   }
   else
   {
      if (($_SESSION[idFicha] == 1) || ($_SESSION[idFicha] == 3) || ($_SESSION[idFicha] == 5) || ($_SESSION[idFicha] == 11) || ($_SESSION[idFicha] == 13) || ($_SESSION[idFicha] == 15))
      {

        $sql_Comando="select CodMateria, NomeMateria
                      From MateriaCurso
                      Where IdCurso = $_SESSION[idCurso]
                      and   IdTurma = $_SESSION[idTurma] 
                      and codmateria = '$pessoa[DISCIPLINA]' ";

        $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
        $Res_Disciplina=ibase_fetch_assoc($Res_sql_Comando);

        echo "<table border='0' cellspacing='0' cellpadding='0' width='1060' class='style3' bordercolor='#cccccc'>
                  <tr>
                     <td> <b style='font-size:12px'>DISCIPLINA: <b style='font-size:12px'>$Res_Disciplina[CODMATERIA] - $Res_Disciplina[NOMEMATERIA] </b></td></br>
                     <td> <b style='font-size:12px'>DATA AVALIA��O: <b style='font-size:12px'> $Res_FAC_Avaliacao[DATAAVALIACAO]</b></td></td>
                  </tr>
              </table>";
      }
   }


   //----
  //---  Instrutor que sera avaliado

  if (($_SESSION[idFicha] == 1) || ($_SESSION[idFicha] == 3) || ($_SESSION[idFicha] == 4) || ($_SESSION[idFicha] == 5) || ($_SESSION[idFicha] == 11) || ($_SESSION[idFicha] == 13) || ($_SESSION[idFicha] == 14) || ($_SESSION[idFicha] == 15))
   {
      echo "<table>
                <tr><td width='770'style='font-size:12px'><b style='font-size:12px'> INSTRUTOR AVALIADO: $_SESSION[Instrutor] </b></td>
                <tr></tr>
            </table>";
    }

   $Retorno= $f-> TrataEnter($Res_FAC_FichaAvaliacao[INSTRUCAO]);

   echo " <br />";


   echo "<table border='0' cellspacing='0' cellpadding='0' width='1060' class='style3' bordercolor='#cccccc'>
            <tr>
                <td width='1060' align='Center'> <b style2='font-size:12px'>INSTRU��ES </b></td>
            </tr>
         </table>";

    echo " <br />";
   $Retorno= $f-> TrataEnter($Res_FAC_FichaAvaliacao[INSTRUCAO]);
   echo "<p class='style2' align='left'>$Retorno</p>";
   echo " <br />";

?>

<form id='Form_Perguntas' name='Form_Perguntas' method='post' action="insere_Resposta.php">

<?php
     //---
    //--- Tratamento das perguntas
   //faz select para montar questionario

   echo "Ap�s o preenchimento clique no bot�o enviar para concluir!";


//   echo "<hr size='1'/>";
   echo "<br><br>";
   $Contador=0;

   $sql_Comando = "Select * From FAC_Topicos
                  where IDFICHA= $_SESSION[idFicha]
                  Order By IdFicha, IdTopico";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);

   echo "<table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='1070' class='caixa'>
             <tr>
                 <td> <div><td width='1070' align='Center'><b style='font-size:20px' ><p class='style2' align='center'><b>QUESITOS</b></p></b></td>
                    <div><td width='705'<'--'></td>
             </tr>
          </table>";

   $VS_TopicoAnt = '';

   while ($Itens=ibase_fetch_assoc($Res_sql_Comando))
   {
//      if(  $VS_TopicoAnt != $Itens[TOPICO])
//      {
          $VS_Topico= $Itens[TOPICO];
//          $VS_TopicoAnt = $Itens[TOPICO];
//      }
//      else
//      {
//          $VS_Topico= ' ';
//      }


      $Contador++;
      $radio = $Itens['IDTOPICO'];


      if (($_SESSION[idFicha] >= 10)) {

         if (($_SESSION[idFicha] == 12) || ($_SESSION[idFicha] == 13)|| ($_SESSION[idFicha] == 14))
         {
            echo "<table style:border-bottom:0.5px solid #FFFFF0; border='1' cellspacing='0' cellpadding='0' width='1070' class='caixa'>
                     <tr>
                        <div><td width='170'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'><b>$VS_Topico</b> </span></td></div>
                        <div><td width='530'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'> $Itens[QUESITOS] </span></td></div>
                        <td width='400'><table border='0' cellspacing='0' cellpadding='0' width='400'>
                        <tr>
                           <td width='23' align='Left'><input type='radio' name='$Contador' id='radio6' value='0$Topicos[IDTOPICO]' /></td>
                           <td width='60' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>N�o Avaliado</span></td>

                           <td width='23' align='Left'><input type='radio' name='$Contador' id='radio6' value='1$Topicos[IDTOPICO]' /></td>
                           <td width='60' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Abaixo do Esperado</span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='2$Topicos[IDTOPICO]' /></td>
                           <td width='44' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Atingiu o Esperado</span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='3$Topicos[IDTOPICO]' /></td>
                           <td width='48' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Acima do Esperado</span></td>
                         </tr>
                      </table></td>
                     </tr>
                  </table>";
         }
         else
         {
            echo "<table style:border-bottom:1px solid #FFFFF0; border='1' cellspacing='0' cellpadding='0' width='1070' class='caixa'>
                     <tr>
                        <div><td width='700'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[QUESITOS] </span></td></div>
                        <td width='400'><table border='0' cellspacing='0' cellpadding='0' width='400'>
                        <tr>
                           <td width='23' align='Left'><input type='radio' name='$Contador' id='radio6' value='0$Topicos[IDTOPICO]' /></td>
                           <td width='60' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>N�o Avaliado</span></td>

                           <td width='23' align='Left'><input type='radio' name='$Contador' id='radio6' value='1$Topicos[IDTOPICO]' /></td>
                           <td width='60' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Abaixo do Esperado</span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='2$Topicos[IDTOPICO]' /></td>
                           <td width='44' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Atingiu o Esperado</span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='3$Topicos[IDTOPICO]' /></td>
                           <td width='48' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Acima do Esperado</span></td>
                         </tr>
                      </table></td>
                    </tr>
                  </table>";
         } 

      }
      else {
         if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 3)|| ($_SESSION[idFicha] == 4))
         {
            echo "<table style:border-bottom:1px solid #FFFFF0; border='1' cellspacing='0' cellpadding='0' width='1070' class='caixa'>
                     <tr>
                        <div><td width='140'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'><b>$VS_Topico</b> </span></td></div>
                        <div><td width='560'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[QUESITOS] </span></td></div>
                        <td width='400'><table border='0' cellspacing='0' cellpadding='0' width='400'>
                        <tr>
                           <td width='23' align='Left'><input type='radio' name='$Contador' id='radio6' value='0$Topicos[IDTOPICO]' /></td>
                           <td width='60' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Abaixo do Esperado </span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='1$Topicos[IDTOPICO]' /></td>
                           <td width='44' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Atingiu o Esperado </span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='2$Topicos[IDTOPICO]' /></td>
                           <td width='48' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Acima do Esperado </span></td>
                         </tr>
                      </table></td>
                     </tr>
                  </table>";
         }
         else
         {
            echo "<table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='1070' class='caixa'>
                     <tr>
                        <div><td width='700'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[QUESITOS] </span></td></div>
                        <td width='400'><table border='0' cellspacing='0' cellpadding='0' width='400'>
                        <tr>
                           <td width='23' align='Left'><input type='radio' name='$Contador' id='radio6' value='0$Topicos[IDTOPICO]' /></td>
                           <td width='60' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Abaixo do Esperado </span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='1$Topicos[IDTOPICO]' /></td>
                           <td width='44' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Atingiu o Esperado </span></td>
                           <td width='22' align='Left'><input type='radio' name='$Contador' id='radio6' value='2$Topicos[IDTOPICO]' /></td>
                           <td width='48' align='Left'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Acima do Esperado </span></td>
                         </tr>
                      </table></td>
                    </tr>
                  </table>";
         } 
      }
   }

   //---
   //--- Tratamento da entrada de comentario

   echo "<br>";

   $Retorno= $f-> TrataEnter($Res_FAC_FichaAvaliacao[COMENTARIO]);

   echo "<p>$Retorno</p>";

  if (($_SESSION[idFicha] >= 10)) {
      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (ESTRUTURA)
      //--------------------------------------------------------------------------------------------------------------------------------------------------

      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 12)) {
         echo "<p>� ESTRUTURA</p>";
         echo "
            <label>
               <textarea name='comentario_4' id='comentarios_4' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }

      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (DISCIPLINA)
      //--------------------------------------------------------------------------------------------------------------------------------------------------
  
      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 3) || ($_SESSION[idFicha] == 12) || ($_SESSION[idFicha] == 13)) {
         echo "<p>� DISCIPLINA</p>";
         echo "
         <label>
            <textarea name='comentario_1' id='comentarios_1' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
            <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
          </label>";
         echo "<br><br>";
      }

      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (MATERIAL DID�TICO)
      //--------------------------------------------------------------------------------------------------------------------------------------------------

      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 12)) {
         echo "<p>� MATERIAL DID�TICO</p>";
         echo "
            <label>
               <textarea name='comentario_5' id='comentarios_5' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }

      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (AVA)
      //--------------------------------------------------------------------------------------------------------------------------------------------------

      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 12)) {
         echo "<p>� AVA</p>";
         echo "
            <label>
               <textarea name='comentario_6' id='comentarios_6' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }

      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (PLANEJAMENTO)
      //--------------------------------------------------------------------------------------------------------------------------------------------------
  
      if (($_SESSION[idFicha] == 4) || ($_SESSION[idFicha] == 14)) {
         echo "<p>� PLANEJAMENTO</p>";
         echo "
            <label>
               <textarea name='comentario_8' id='comentarios_8' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }

      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (EXECU��O)      
      //--------------------------------------------------------------------------------------------------------------------------------------------------
  
      if (($_SESSION[idFicha] == 3) || ($_SESSION[idFicha] == 4) || ($_SESSION[idFicha] == 13) || ($_SESSION[idFicha] == 14) ) {
         echo "<p>� EXECU��O</p>";
         echo "
            <label>
               <textarea name='comentario_2' id='comentarios_2' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }


      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (AVALIA��O)
      //--------------------------------------------------------------------------------------------------------------------------------------------------
  
      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 4) || ($_SESSION[idFicha] == 12) || ($_SESSION[idFicha] == 14)) {
         echo "<p>� AVALIA��O</p>";
         echo "
            <label>
               <textarea name='comentario_7' id='comentarios_7' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }


      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (DOCENTES)
      //--------------------------------------------------------------------------------------------------------------------------------------------------
  
      if (($_SESSION[idFicha] == 4) || ($_SESSION[idFicha] == 14)) {
         echo "<p>� DOCENTES</p>";
         echo "
            <label>
               <textarea name='comentario_9' id='comentarios_9' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }


      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (AUTOAVALIA��O)
      //--------------------------------------------------------------------------------------------------------------------------------------------------
  
      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 3) || ($_SESSION[idFicha] == 12) || ($_SESSION[idFicha] == 13)) {
         echo "<p>� AUTOAVALIA��O</p>";
         echo "
            <label>
               <textarea name='comentario_3' id='comentarios_3' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }

   
      //--------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Tratamento da entrada de comentario (GERAIS)
      //--------------------------------------------------------------------------------------------------------------------------------------------------

       echo "<p>� GERAIS</p>";
       echo "
         <label>
            <textarea name='comentario_10' id='comentarios_10' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
            <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
          </label>";
      echo "<br><br>";
   }
   else {                   //--- Tratamento do modelo antigo (0- 5)

      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 3) || ($_SESSION[idFicha] == 4))    // � DISCIPLINA  (1)
      {
         echo "<p>� DISCIPLINA</p>";
         echo "
            <label>
               <textarea name='comentario_1' id='comentarios_1' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }


      //   if (($_SESSION[idFicha] == 1) || ($_SESSION[idFicha] == 5))    // � DOCENTE  (2)
      if (($_SESSION[idFicha] == 2))    // � DOCENTE  (2)
      {
         echo "<p>� DOCENTE</p>";
         echo "
            <label>
               <textarea name='comentario_2' id='comentarios_2' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }


      if (($_SESSION[idFicha] == 2) || ($_SESSION[idFicha] == 3) || ($_SESSION[idFicha] == 4))    // �  // � AVALIA��O  (3) / - MATERIAL DID�TICO   (4)
       {
         echo "<p>� AVALIA��O</p>";
         echo "
            <label>
               <textarea name='comentario_3' id='comentarios_3' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";

         echo "<p>� MATERIAL DID�TICO</p>";
         echo "
            <label>
               <textarea name='comentario_4' id='comentarios_4' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
               <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
             </label>";
         echo "<br><br>";
      }


       echo "<p>� OBSERVA��ES</p>";
       echo "
         <label>
            <textarea name='comentario_5' id='comentarios_5' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
            <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
          </label>";
      echo "<br><br>";
   
   }

   //----- FIM DOS COMENTARIOS
?>


</form>

<script>

//------------------------------------------------------------------------------------------------------------------------------------------
//Funcoes que verificam se radios foram clicados

function verificaFORM1()
{
    var ok=0;
	var Sel=0;
	<?php echo"var Nb = $Contador;
               var Ficha = $_SESSION[idFicha];";
    ?>

       for (i=0;i<document.Form_Perguntas.elements.length;i++)
       {
  		  if(document.Form_Perguntas[i].type=="radio")
		 	if(document.Form_Perguntas[i].checked==true)
				Sel++;
	   }

	   if(Sel != Nb)
	 	  ok=0;
  	   else
	 	  ok=1;

    	return ok;
}


function verificando()
{
    var P1=verificaFORM1();

	if(P1 == 1 )
    {
      document.Form_Perguntas.submit();
    //  document.form_Complemento.submit();
    }
    else
    {
  	   if(P1 == 0 )
		  alert('Certifique-se de que respondeu todas quest�es!');
    }

}
//FIM - Fun��es que verificam se radios foram clicados
</script>



<img src='../imagem/enviar.png' name='enviar_consulta' id='enviar_consulta' onclick="verificando();"/>
</div>

</html>
