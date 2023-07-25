<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : MontaPagina.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a pï¿½gina de entrada das
  //                             respostas dos alunos da Ficha de Avaliaï¿½ï¿½o de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj Sï¿½nia
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 18/06/2009
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

  //require_once("../Funcoes/verifica_sessao.php");
  require_once("../Funcoes/verifica_sessao.php");
  require_once("../Funcoes/Funcoes.php");

  $f= new Funcao();
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
   <title>AVALIA&Ccedil&AtildeO DE CURSO</title>

   <script>

    //Funï¿½ï¿½es que faz tratamento da textearea

    conteudo_textarea = "";
    num_caracteres_permitidos = 1000;

    function valida_longitude(){
       num_caracteres = document.Form_Perguntas.comentario.value.length;

       if (num_caracteres > num_caracteres_permitidos){
         document.Form_Perguntas.comentario.value = conteudo_textarea;
       }else{
         conteudo_textarea = document.Form_Perguntas.comentario.value;
       }

       if (num_caracteres >= num_caracteres_permitidos){
         document.Form_Perguntas.coment.style.color="#ff0000";
       }else{
          document.Form_Perguntas.coment.style.color="#000000";
       }
    contaComentario()
    }

    function contaComentario(){
       document.Form_Perguntas.coment.value=document.Form_Perguntas.comentario.value.length
    }

   //FIM - Funï¿½ï¿½es que faz tratamento da textearea


   function showHide (ID)
   {
      if (document.getElementById(ID).style.display == "none")
      {
         document.getElementById(ID).style.display= "";
         document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='../imagem/min.gif' onclick='showHide(ID);' width='16' height='14' border='0'>";
      }
      else
      {
         document.getElementById(ID).style.display = "none";
         document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='../imagem/max.png' onclick='showHide(DISCIPL);' width='16' height='14' border='0'>";
      }
   }

   function minDiv(idDiv)
   {
      document.getElementById(idDiv).style.display = "none";
   }

   function maxDiv(idDiv)
   {
      document.getElementById(idDiv).style.display = "";
   }

   </script>
   </head>
   <div id="corpo">



<?php
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
                               and   FO.dataavaliacao <= '$DataAtual'
                               and   FR.respondeu = 'N'";
   $Res_sql_relacionado=ibase_query($conexao,$sql_relacionado);

echo "Opcao: ";
echo  $_POST[ListaDeFichas];
echo '<br>';
echo '<br>';     
     
   $opEscolhida =0;

   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {

      $opEscolhida ++ ;
      if ($opEscolhida==$_POST[ListaDeFichas])
      {
         $instrutor ="";
         $disciplina = "";

         if ((trim($relacionado[IDFICHA]) == 1) || (trim($relacionado[IDFICHA]) == 2))
         {
            $sql = "Select FO.IdAvaliacao, FO.IdAvaliado, FO.Identidade, FO.Disciplina,
                           P.Nome , P.postograduacao 
                           From FAC_Avaliado FO, Pessoa P
                           Where FO.Identidade = p.Identidade 
	     	             and   FO.IdAvaliacao = $relacionado[IDAVALIACAO]";
						 
            $Res_sql=ibase_query($conexao, $sql);
            $pessoa = ibase_fetch_assoc($Res_sql);
          
            $posto = $pessoa['POSTOGRADUACAO'];
            $instrutor = $pessoa['NOME'];

            $_SESSION[idFicha]=$relacionado[IDFICHA];
            $_SESSION[identidadeInst]=$relacionado[IDAVALIADO];
         }
					 
         if ((trim($relacionado[IDFICHA]) == 1) || (trim($relacionado[IDFICHA]) == 2) || (trim($relacionado[IDFICHA]) == 5))
         {
            $sql = "Select CodMateria, nomemateria 
	             From materiacurso
                    where idcurso = $_SESSION[idCurso]
                    and  idturma = $_SESSION[idTurma]
                    and codmateria = '$pessoa[DISCIPLINA]' ";
            $Res_sql=ibase_query($conexao, $sql);
            $MateriaCurso = ibase_fetch_assoc($Res_sql);

            $disciplina = $MateriaCurso['NOMEMATERIA'];
            $_SESSION[codDisciplina]=$MateriaCurso[CODMATERIA] ;
			
			echo "Teste Disciplina";
			echo '<br>';
			echo $_SESSION[codDisciplina]
			
         }
      }
   }

    //---
   //--- Tratamento para selecao das informacoes do Curso

   $sql_Comando="select CodCurso, NomeCurso
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
                 and   F1.IdCurso = $_SESSION[idCurso] 
                 and   F1.idTurma = $_SESSION[idTurma] 
                 and   F1.identidade = '$_SESSION[identidadeAluno]'
                 and   F1.respondeu = 'N'";


echo '<br>';
echo '<br>';
echo $sql_Comando;
echo '<br>';
echo '<br>';

$Res_sql_Comando=ibase_query($conexao,$sql_Comando);
$Res_FAC_Avaliacao=ibase_fetch_assoc($Res_sql_Comando);

   //---
  //--- Tratamento do Cabecalho da Pagina

   $sql_Comando= "Select cabecalho, comentario, instrucao, modelo
                  From FAC_FichaAvaliacao
                   Where IdFicha = $_SESSION[idFicha]";
echo $sql_Comando;
   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Res_FAC_FichaAvaliacao=ibase_fetch_assoc($Res_sql_Comando);


   echo "<table border='1' cellspacing='0' cellpadding='0' width='1070' class='style3' bordercolor='#0000FF' bgcolor='#0000FF'>
           <tr>
              <td><img src='../imagem/dom.png' border='0'></td>
              <td> <div><td width='1070' align='Center'><b style='font-size:20px'; ><p class='style2'align='center'><font color='white'><b>$Res_FAC_FichaAvaliacao[CABECALHO]</b></p></b></td></div>
            </tr>
         </table>";
   echo "</br></br>";

    //---
   // --- Mostra as informacoes do Cabecalho do Relato

   echo "<table>
             <tr><td width='770'style='font-size:10px'>CURSO: <b CURSO: style='font-size:11px'> $Res_Curso[CODCURSO] - $Res_Curso[NOMECURSO] </b></td>
             <tr></tr>
         </table>";

   if ((trim($relacionado[IDFICHA]) == 1) || (trim($relacionado[IDFICHA]) == 2) || (trim($relacionado[IDFICHA]) == 5))
   {
        $sql_Comando="select CodMateria, NomeMateria
                      From MateriaCurso
                      Where IdCurso = $_SESSION[idCurso]
                      and   IdTurma = $_SESSION[idTurma] ";

        $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
        $Res_Disciplina=ibase_fetch_assoc($Res_sql_Comando);

        echo "<table border='0' cellspacing='0' cellpadding='0' width='770' class='style3' bordercolor='#cccccc'>
                       <tr>
                          <td> <b style='font-size:11px'>DISCIPLINA: <b style='font-size:11px'>$Res_Disciplina[CODMATERIA] - $Res_Disciplina[NOMEMATERIA] </b></td>
                          <td> <div><td width='350' align='Center'><b style='font-size:13px' ><p class='style2' align='center'><b> </b></p></b></td></div>
                          <td><b style='font-size:11px'> DATA: <b style='font-size:11px'> $Res_FAC_Avaliacao[DATAAVALIACAO]</b></td></td>
                        </tr>
                     </table>";
   }
   else
   {
     echo "<table>
               <tr><td width='770'style='font-size:10px'>DATA AVALIA&Ccedil&AtildeO: <b style='font-size:11px'> $Res_FAC_Avaliacao[DATAAVALIACAO]</b></td>
               <tr></tr>
           </table>";
   }


   echo " <br />";
   echo "<hr size='1'/>";
   echo "<p class='style2' align='center'><b>INSTRUÇÕES</b></br></br>";
   $Retorno= $f-> TrataEnter($Res_FAC_FichaAvaliacao[INSTRUCAO]);
   echo "<p class='style2' align='left'>$Retorno</p>";
   echo " <br />";

   //----
  //--- Relacao dos instrutores que serao avaliados

  if (($Res_FAC_FichaAvaliacao[MODELO] >= 'Instrutor') or ($Res_FAC_FichaAvaliacao[MODELO] >= 'Instrutor/Disciplina'))
  {
       $sql_Comando="Select FAC.IdCurso, FAC.IdTurma, FAC.IdAvaliado, FAC.Identidade, IT.nomecompleto
                     From FAC_avaliado FAC, instrutorturma IT
                     where FAC.IdCurso = $_SESSION[idCurso]
                     and   FAC.IdTurma = $_SESSION[idTurma]
                     and   IT.IdCurso = $_SESSION[idCurso]
                     and   IT.IdTurma = $_SESSION[idTurma]
                     and   FAC.Identidade = IT.identidade ";

       $Res_sql_Comando=ibase_query($conexao,$sql_Comando);

       while ($Res_Instrutor=ibase_fetch_assoc($Res_sql_Comando))
       {
           echo "<table border='0' cellspacing='0' cellpadding='0' width='770' class='style3' bordercolor='#cccccc'>
                        <tr>
                           <td> <b style='font-size:11px'>Instrutor: <b style='font-size:11px'>$Res_Instrutor[IDAVALIADO] $Res_Instrutor[NOMECOMPLETO] </b></td>
                         </tr>
                      </table>";
       }
    }

?>

<form id='Form_Perguntas' name='Form_Perguntas' method='post' action="insere_Resposta.php">

<?php
     //---
   //--- Tratamento das perguntas

   //faz select para montar questionario

   echo "<br>";
   echo "Após o preenchimento clique no botão enviar para concluir!";
   echo "<hr size='1'/>";
   echo "<br><br>";
   $Contador=0;

   $sql_Comando = "Select * From FAC_Topicos
                  where IDFICHA= $Res_FAC_Avaliacao[IDFICHA]
                  Order By IdFicha, IdTopico";


   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);


   echo "<table border='1' cellspacing='0' cellpadding='0' width='1070' class='style3' bordercolor='#cccccc'>
           <tr>

              <td> <div><td width='1070' align='Center'><b style='font-size:20px' ><p class='style2' align='center'><b>QUESITOS</b></p></b></td>
                   <div><td width='705'<'--'></td>
            </tr>
         </table>";

   while ($Itens=ibase_fetch_assoc($Res_sql_Comando))
   {
      $Contador++;
      $radio = $Itens['IDITEM'];
      echo "<table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='1070' class='caixa'>
               <tr>
                  <div><td width='200'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[TOPICO] </span></td></div>
                  <div><td width='500'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[QUESITOS] </span></td></div>
                  <td width='400'><table border='0' cellspacing='0' cellpadding='0' width='400'>
                  <tr>
                     <td width='23'><input type='radio' name='$Itens[QUESITOS]' id='radio6' value='1' /></td>
                     <td width='60'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Abaixo do Esperado </span></td>
                     <td width='22'><input type='radio' name='$Itens[QUESITOS]' id='radio6' value='2' /></td>
                     <td width='44'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Atingiu o Esperado </span></td>
                     <td width='22'><input type='radio' name='$Itens[QUESITOS]' id='radio6' value='3' /></td>
                     <td width='48'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Acima do Esperado</span></td>
                   </tr>
                </table></td>
               </tr>
            </table>";
   }
   //---
   //--- Tratamento da entrada do Complemento

   echo "<br>";
   echo "<br>";

   $Retorno= $f-> TrataEnter($Res_FAC_FichaAvaliacao[COMENTARIO]);

   echo "$Retorno
   <p>
    <label>
      <textarea name='comentario' id='comentarios' cols='130' rows='14' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
      <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
    </label>";
   echo "<br><br>";

?>


</form>

<script>
//Funï¿½ï¿½es que verificam se radios foram clicados

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
		  alert('Certifique-se de que respondeu todas questï¿½es!');
    }

}
//FIM - Funï¿½ï¿½es que verificam se radios foram clicados
</script>



<img src='../imagem/enviar.png' name='enviar_consulta' id='enviar_consulta' onclick="verificando();"/>
</div>

</html>
