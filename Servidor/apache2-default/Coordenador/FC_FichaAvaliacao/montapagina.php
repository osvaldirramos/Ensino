<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : MontaPagina.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de entrada das
  //                             respostas da Ficha do Coordenador do Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          :
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 13/05/2010
  //
  //----------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------
  // DATA                      : 20/10/2017
  // AUTOR                     : Osvaldir D. Ramos
  // MOTIVO                    : Ajusta para padronização dos formularios
  //----------------------------------------------------------------------------------------

   session_start();
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");

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
   <link href="../estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>

   <script>

    //Funções que faz tratamento da textearea

    conteudo_textarea = "";
    //num_caracteres_permitidos = 1000;

    function valida_longitude(num_caracteres_permitidos)
    {
       num_caracteres = document.Form_Perguntas.comentario.value.length;

       if (num_caracteres > num_caracteres_permitidos)
       {
         document.Form_Perguntas.comentario.value = conteudo_textarea;
       }
       else
       {
         conteudo_textarea = document.Form_Perguntas.comentario.value;
       }

       if (num_caracteres >= num_caracteres_permitidos)
       {
         document.Form_Perguntas.coment.style.color="#ff0000";
       }
       else
       {
          document.Form_Perguntas.coment.style.color="#000000";
       }
       contaComentario()
    }
    
    function contaComentario(){
       document.Form_Perguntas.coment.value=document.Form_Perguntas.comentario.value.length
    }

   //FIM - Funções que faz tratamento da textearea


   function showHide (ID)
   {
      if (document.getElementById(ID).style.display == "none")
      {
         document.getElementById(ID).style.display= "";
         document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='../../imagem/min.gif' onclick='showHide(ID);' width='16' height='14' border='0'>";
      }
      else
      {
         document.getElementById(ID).style.display = "none";
         document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='../../imagem/max.png' onclick='showHide(DISCIPL);' width='16' height='14' border='0'>";
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

<body>
   </script>
   </head>
   <div id="corpo">
<?php
   require_once("../../Funcoes/conecta.inc");

    //---
   //--- Verifica se a Ficha j´afoi preenchida

  /* $sql_Respondeu = " Select count(1) as QTD From FC_COMENTARIO
                           where IDCURSO = $_SESSION[idCurso]
                           and IDTURMA = $_SESSION[idTurma]
                           and IDENTIDADE = '$_SESSION[identidadeAluno]'";

   $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
   $qtd = ibase_fetch_assoc($Res_Respondeu);

   if ($qtd[QTD]> 0)
   {
      echo "<script language='javascript' type='text/javascript'>
            alert('Já foi feita a FICHA DE AVALIAÇÃO DE FINAL DE CURSO - COORDENADOR!');
            window.location='../MsgAlerta/montapagina.php';
            </script>";
   }
*/
   //-------------------------------------------
   //--- Tratamento do Cabecalho da Pagina
   //-------------------------------------------

    //---
   //--- Tratamento para pegar os dados do Curso
   
   $sqlcurso = "Select CodCurso, NomeCurso From Curso
                    where IDCURSO = $_SESSION[idCurso]";
   $resultadocurso = ibase_query($conexao, $sqlcurso);
   $curso = ibase_fetch_assoc($resultadocurso);

    //---
   //--- Tratamento para pegar os dados do Coordenador
   
   $sql = "select nome , postograduacao, nomeguerra
           from pessoa
           where identidade='$_SESSION[identidadeAluno]'";

   $Res_sql=ibase_query($conexao, $sql);
   $pessoa = ibase_fetch_assoc($Res_sql);
   $dataAtual = date("d/m/Y");

   echo "<br/>";

   echo "<font style='font: 20px Arial,sans-serif;background: #CFCFCF; color: Silver; padding: 0px 0px 0px 0px;text-shadow: black -1px 0px 0px, black 0px 1px 0px, black 1px 0px 0px,black 0px -1px 0px, 0px 0px 0px;'>
            <div align='center' id='titulo' class='BODY'>RELATÓRIO DE COORDENADOR</div>
         </font>";

   echo "<br/>";

   echo "<table>
             <tr><td width='770'style='font-size:10px'>CURSO: <b style='font-size:11px'> $curso[CODCURSO]-$curso[NOMECURSO] </b></td>
             <tr></tr>
             <tr><td width='770'style='font-size:10px'>DATA AVALIAÇÃO: <b style='font-size:11px'> $dataAtual</b></td>
             <tr></tr>
             <tr><td width='770'style='font-size:10px'>COORDENADOR: <b style='font-size:11px'> $pessoa[POSTOGRADUACAO] $pessoa[NOME]</b></td>
             <tr></tr>
           </table>";

   echo "<br>";
   echo "<Strong>INSTRUÇÕES</Strong><br><br>";
   echo "Neste questionário você irá avaliar o curso em sua totalidade (Planejamento, Execução e Avaliação).<br>";
   echo "Após o preenchimento clique no botão enviar para concluir!<br><br>";
   echo "<hr size='1'/>";
   echo "<br>";

?>

<form id='Form_Perguntas' name='Form_Perguntas' method='post' action="insere_Resposta.php">

<?php
   //-------------------------------------------
   //--- Tratamento para montar a pagina
   //-------------------------------------------


   $Contador= 0;
   $Contador1= 100;
   $Contador2= 200;
   $sql_Modelo = "Select cast(idmodelo as char(2)) as idmodelo, Descricao From FC_Modelo";

   $Res_Modelo = ibase_query($conexao, $sql_Modelo);
   while ($Modelo = ibase_fetch_assoc($Res_Modelo))
   {
      echo "<br>";
      echo "<table border='1' cellspacing='0' cellpadding='0' width='1000' bgcolor='#cccccc' bordercolor='#FFFFFF' >
               <tr>
                 <td width='735' align='center'><div><b style='font-size:12px' >$Modelo[DESCRICAO]</b></div></td>
                 <td width='16' scope='col' id='$Modelo[DESCRICAO]'span' >
               </tr>
            </table>";

      //--- Pega o Topico

      $sql_Topico= "select cast(idmodelo as char(2)) as idmodelo, cast(IdTopico as char(2)) as IdTopico, Descricao from FC_Topicos where idmodelo = $Modelo[IDMODELO]";
      $Res_Topico = ibase_query($conexao, $sql_Topico);
      while ($Topico = ibase_fetch_assoc($Res_Topico))
      {
         if ($Modelo[DESCRICAO] <> $Topico[DESCRICAO])
         {
            echo "<table border='1' cellspacing='0' cellpadding='0' width='1000' bgcolor='#cccccc' bordercolor='#FFFFFF' >
                    <tr>
                      <td width='1000' align='center'><div><b style='font-size:12px' >$Topico[DESCRICAO]</b></div></td>
                    </tr>
               </table>";
          }

          echo "<div id=$Topico[DESCRICAO]>";


          //--- Pega o Item

          $sql_Item= "select cast(idmodelo as char(2)) as idmodelo, cast(IdTopico as char(2)) as IdTopico, cast(IdItem as char(2)) as IdItem, Descricao from FC_Itens where idmodelo = $Topico[IDMODELO] and idTopico = $Topico[IDTOPICO]";
          $Res_Item = ibase_query($conexao, $sql_Item);
          while ($Item = ibase_fetch_assoc($Res_Item))
          {
             $Contador++;
             $Contador1++;
             $radio = $Itens['IDITEM'];
             echo "<table style:border-bottom:1px solid #ccc; border='0' cellspacing='0' cellpadding='0' width='1000' class='caixa'>
                  <tr>
                     <div><td width='1000'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Item[IDITEM]  - $Item[DESCRICAO]</span></td></div>
                     <td width='10'><table border='0' cellspacing='0' cellpadding='0' width='100'>
                     <tr>
                        <td width='13'><input type='radio' name='$Contador' id='radio6' value='0$Item[IDMODELO]$Item[IDTOPICO]$Item[IDITEM]' /></td>
                        <td width='60'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Sim </span></td>
                        <td width='12'><input type='radio' name='$Contador' id='radio6' value='1$Item[IDMODELO]$Item[IDTOPICO]$Item[IDITEM]' /></td>
                        <td width='44'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Não </span></td>
                      </tr>
                      </table></td>
                      <td width='23'> <textarea name='$Contador1' id='comentarios' cols='40' rows='4' onKeyDown='valida_longitude(1000)' onKeyUp='valida_longitude(1000)'></textarea></td>
                  </tr>
               </table>";
          }
      }
      
      if ($Modelo[DESCRICAO] <> 'CONSIDERAÇÕES FINAIS')
      {
         $Contador2++;
         echo "<br>";
         echo "<p>Comentário sobre o $Modelo[DESCRICAO] </p>
               <p>
               <label>
                <textarea name='$Contador2' id='comentarios' cols='97' rows='4' ></textarea>
	   	  *Até 1000 caracteres 
                </label>";
         echo "<br>";
         echo "<hr size='1'/>";
//         echo "<br/>";
//                <textarea name='$Contador2' id='comentarios' cols='97' rows='4' onKeyDown='valida_longitude(1000)' onKeyUp='valida_longitude(1000)'></textarea>
	     
      }
   }

   echo "<br/>";
   echo "<hr size='1'/>";
   echo "<br/>";

   //---
   //--- Tratamento da entrada do Complemento

   echo "<p>Para a MELHORIA da qualidade da instrução, utilize este campo para nos dar a sua SUGESTÃO:</p>
   <p>
    <label>
      <textarea name='comentario' id='comentarios' cols='85' rows='4' onKeyDown='valida_longitude(2000)' onKeyUp='valida_longitude(2000)'></textarea>
      <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />  *Até 2000 caracteres
    </label>";
   echo "<br><br>Clique aqui para enviar a Ficha de Avaliação";


?>
</form>

<script>
//Funções que verificam se radios foram clicados

function verificaFORM1()
{
    var ok=0;
	var Sel=0;
	<?php echo"var Nb = $Contador;";
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
		  alert('Existe uma ou mais opções não marcadas... (Favor selecionar as opções em todos os questionários e reenviá-las)');
    }

}
//FIM - Funções que verificam se radios foram clicados
</script>



<img src='../../imagem/enviar.png' name='enviar_consulta' id='enviar_consulta' onclick="verificando();"/>
</div>

</html>
