<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : CriticaEspontanea.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de entrada da
  //                             Critica espontanea realizado pelo Aluno/Instrutor/
  //                             Coordenador.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj Sônia
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 25/02/2010
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

<NOSCRIPT>
     Este navegador não compreende os scripts que se estão executando,
      você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
</NOSCRIPT>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css">
<title>AVALIAÇÃO DE CURSO</title>
<script>

    //Funções que faz tratamento da textearea

    conteudo_textarea = "";
    num_caracteres_permitidos = 100000;

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
    
    function contaComentario()
    {
       document.Form_Perguntas.coment.value=document.Form_Perguntas.comentario.value.length
    }

   //FIM - Funções que faz tratamento da textearea


   function showHide (ID)
   {
      if (document.getElementById(ID).style.display == "none") {
         document.getElementById(ID).style.display= "";
         document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='../imagem/min.gif' onclick='showHide(ID);' width='16' height='14' border='0'>";
      }
      else {
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
<body">

<div id="corpo">
<br>

<p><img style="margin: -5px 5px -5px 5px;" src="../imagem/topo_ICEA.png" alt="" width="930" /></p>

<font style='font: 15px Arial,sans-serif;background: silver;color: White;padding: 0px 0px 0px 0px;text-shadow: red 0px 0px 16px,  0px 0px 0px,  0px 0px 0px, 0px 0px 0px, 0px 0px 0px;'>
   <table border="0" width="93%" >
      <tr>
         <td width="180" align="Right">&nbsp;<a href="Principal.php" title="Página Anterior" target="_self" ><img src="../imagem/sair.png" border="0" width="25" height="25" /> Retornar</a></td>
      </tr>
   </table>
</font>

<font style='font: 20px Arial,sans-serif;background: #CFCFCF; color: Silver; padding: 0px 0px 0px 0px;text-shadow: black -1px 0px 0px, black 0px 1px 0px, black 1px 0px 0px,black 0px -1px 0px, 0px 0px 0px;'>
<div align='center' id="titulo" class="BODY">FORMULÁRIO DE CRÍTICA ESPONTÂNEA</div>
</font>

<?php
   require_once("../Funcoes/conecta.inc");
   $DataAtual= date('d/m/Y H:i:s',time());

   //---
   //--- Tratamento do Cabecalho da Pagina

   //---
   //--- Cabecalho Inicial

   echo "</br>";

   $sql_Curso="select CodCurso, Turma
               From Turma_View
               where IdCurso = $_SESSION[idCurso]
               and idTurma = $_SESSION[idTurma]";

   $Res_sqlCurso=ibase_query($conexao,$sql_Curso);
   $Curso=ibase_fetch_assoc($Res_sqlCurso);
   
   $DataAtual= date('d/m/Y',time());

   echo "<table width='935' border='1'>
            <tr bgcolor='#cccccc'>
             <th scope='col'><div align='left'>Curso: $Curso[CODCURSO] Turma: $Curso[TURMA] </div></th>
             <th scope='col'>$DataAtual</th>
            </tr>
         </table>";

    //---
   //--- Inicia a montagem da página de entrada de opçoes
   
   echo "<br>";
?>


<form id='Form_Perguntas' name='Form_Perguntas' method='post' action="insere_Critica.php">
<?php

    //---
   //--- Tratamento das perguntas

   //faz select para montar questionario

   echo "<br>";
   echo "<p class='style2' align='left'><b>INSTRUÇÕES</b></br>";
   echo "Após o preenchimento clique no botão enviar para concluir!";
   echo "<hr size='1'/>";
   echo "<br>";

    //---
   //--- Tratamento da Referencia da Critica


   echo "<table border='0' cellspacing='0' cellpadding='0' width='770' >
            <tr>
               <div><td width='200'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>Selecione a critica/sugestão:</span></td></div>
                    <td width='400'>
                    <table width='570' border='0'>
                      <tr>
                        <td width='142'><label>
                           <input type='radio' name='Critica' id='1' value='1' />
                           <span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Da Instrução </span>
                           </label>
                        </td>
                        <td width='140'><label>
                           <input type='radio' name='Critica' id='2' value='2' />
                           <span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>De Curso </span>
                           </label>
                        </td>
                        <td width='143'><label>
                           <input type='radio' name='Critica' id='3' value='3' />
                           <span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Do docente </span>
                           </label>
                        </td>
                        <td width='82'><label>
                           <input type='radio' name='Critica' id='4' value='4' />
                           <span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Outros </span>
                           </label>
                        </td>
                        <td width='171'><input type='text' name='outros' id='outros' maxlength='30'/></td>
                      </tr>
                    </table>
                  </td> </tr>";
   echo "</table>";
   echo "<br>";

    //---
   // Pega a Disciplina referente ao Curso

   $sql_Disc="select CodMateria, NomeMateria
               From MateriaCurso
               where IdCurso = $_SESSION[idCurso]
               and   idTurma = $_SESSION[idTurma]
               order by CodMateria";
   $Res_sqlDiscip=ibase_query($conexao,$sql_Disc);


   echo "Disciplina: ";
   echo "<select name='Disciplina'>";
   echo "<option >--- Selecione aqui a disciplina avaliada </option>";
   while ($dado_Disc=ibase_fetch_assoc($Res_sqlDiscip))
   {
       echo "<option value= '$dado_Disc[CODMATERIA]'> $dado_Disc[NOMEMATERIA] </option>";
   }
   echo "</select>";
   echo "<br>";
   echo "<br>";

    //---
   //--- Pega os instrutores referente ao Curso e a Turma

   $sql_Instrutor="select Identidade, PostoGraduacao, NomeGuerra
                   From InstrutorTurma_View
                   where IdCurso = $_SESSION[idCurso]
                   and idTurma = $_SESSION[idTurma]
                   order by NomeGuerra";

   $Res_sqlInstrutor=ibase_query($conexao,$sql_Instrutor);

   echo "Docente..: ";
   echo "<select name='Instrutor'>";
   echo "<option >--- Selecione aqui o docente avaliado </option>";
   while ($dado_Instrutor=ibase_fetch_assoc($Res_sqlInstrutor))
   {
       echo "<option value= '$dado_Instrutor[IDENTIDADE]'> $dado_Instrutor[POSTOGRADUACAO] $dado_Instrutor[NOMEGUERRA] </option>";
   }
   echo "</select>";
   echo "<br>";

   echo "<br>";

   //---
   //--- Entrada do Comentario / Sugestao
   
   echo "<br>";
   echo "<p>COMENTÁRIOS / SUGESTÃO</p> <br>
         (Exponha aqui críticas positivas/negativas, bem como sugestões relativas ao curso em andamento)

   <p>
    <label>
      <textarea name='comentario' id='comentarios' cols='90' rows='23' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
      <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
    </label>";
   echo "<br><br>";


  ?>

  </form>

<script>

function verificando()
{
   preencheu = false;
   botoes = document.Form_Perguntas.Critica.length;
   var Outros = document.Form_Perguntas.outros.value;
   var Cont;
   
   Cont= 0;
   for (i=0;i<botoes;i++)
   {
      Cont++;
      if (Form_Perguntas.Critica[i].checked)
      {
         preencheu = true;
         break;
      }
   }
   if (preencheu)
   {
      if (( Cont == 4 ) && ( Outros == ""))
      {
         alert("Foi selecionado a opção Outros, é necessario especificar...");
      }
      else
      {
         document.Form_Perguntas.submit();
      }
   }
   else
   {
      alert("É necessário escolher uma das opções.");
   }
}

</script>



<img src='../imagem/enviar.png' name='enviar_consulta' id='enviar_consulta' onclick="verificando();"/>
</div>
</body>
</html>
