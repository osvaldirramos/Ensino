<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : MontaPagina.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de entrada das
  //                             respostas dos alunos da Ficha de Avaliação de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj Sônia
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

   </script>
   </head>
   <div id="corpo">
<?php
   require_once("../../Funcoes/conecta.inc");
   $DataAtual= date('d/m/Y H:i:s',time());

   //---
   //--- Tratamento do Cabecalho da Pagina

   $sql_relacionado="select r.IdFicha, r.identidade, r.disciplina, r.idaluno, a.dataavaliacao, a.disponivel
                              From fa_relacao r, fa_avaliacao a
                              where r.IdCurso = $_SESSION[idCurso]
                              and r.idTurma = $_SESSION[idTurma]
                              and r.idaluno = '$_SESSION[identidadeAluno]'
                              and r.respondeu = 'N'
                              and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
                              and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina )";

   $Res_sql_relacionado=ibase_query($conexao,$sql_relacionado);
     
     
   $opEscolhida =0;

   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {

      $opEscolhida ++ ;

      if ($opEscolhida==$_POST[ListaDeFichas])
      {
         $instrutor ="";
         $disciplina = "";

         if($relacionado['IDENTIDADE']!='000000')
         {
            $sql = "select nome , postograduacao, nomeguerra
                    from pessoa
                    where identidade='$relacionado[IDENTIDADE]'";
                  

            $Res_sql=ibase_query($conexao, $sql);
            $pessoa = ibase_fetch_assoc($Res_sql);

            $posto = $pessoa['POSTOGRADUACAO'];
            $instrutor = $pessoa['NOME'];
         }

         $Coddisciplina = "";
         $disciplina = "";

         if($relacionado['DISCIPLINA']!='000000')
         {
            $sql = "select codmateria, nomemateria from materiacurso
                           where idcurso=$_SESSION[idCurso]
                           and codmateria = '$relacionado[DISCIPLINA]' ";
            $Res_sql=ibase_query($conexao, $sql);
            $materiacurso = ibase_fetch_assoc($Res_sql);

            $Coddisciplina = $materiacurso['CODMATERIA'];
            $disciplina = $materiacurso['NOMEMATERIA'];

         }

       $sql = "Select cabecalho from fa_modelo
                                where idficha= $relacionado[IDFICHA]";
       $Res_cabecalho=ibase_query($conexao, $sql);
       $cabecalho = ibase_fetch_assoc($Res_cabecalho);
       
       $_SESSION[idFicha] =$relacionado[IDFICHA];
       $_SESSION[identidadeInst]=$relacionado[IDENTIDADE];
       $_SESSION[codDisciplina]=$relacionado[DISCIPLINA] ;
     }

    }

   $sqlcurso = "Select CodCurso, NomeCurso From Curso
                    where IDCURSO = $_SESSION[idCurso]";
   $resultadocurso = ibase_query($conexao, $sqlcurso);
   $curso = ibase_fetch_assoc($resultadocurso);

   $sql_Assunto = "Select m.codmateria, m.NomeMateria, m.NUMEROAULASTEORICAS+m.NUMEROAULASPRATICAS as CargaHoraria
                    From fa_avaliacao a, MateriaCurso m
                    where a.IDCURSO = $_SESSION[idCurso]
                    and a.idTurma =  $_SESSION[idTurma]
                    and a.IDFICHA = $_SESSION[idFicha]
                    and m.IdCurso = $_SESSION[idCurso]
                    and m.codmateria = '$relacionado[DISCIPLINA]'
                    and (a.disciplina = m.codmateria )";


   $Res_Assunto = ibase_query($conexao, $sql_Assunto);
   $Assunto = ibase_fetch_assoc($Res_Assunto);


   // Pega o Instrutor
   
   $sql_Instrutor = "Select p.PostoGraduacao, P.nomeguerra
                     From fa_avaliacao a, pessoa p
                     where a.IDCURSO =  $_SESSION[idCurso]
                     and a.idTurma = $_SESSION[idTurma]
                     and a.IDFICHA = $_SESSION[idFicha]
                     and p.identidade= '$_SESSION[identidadeInst]'
                     and a.identidade = p.identidade";

   $Res_Instrutor = ibase_query($conexao, $sql_Instrutor);
   $Instrutor = ibase_fetch_assoc($Res_Instrutor);

   //faz select para montar questionario

   $sql_FAModelo = "Select * From FA_Modelo
                    where IDFICHA= $_SESSION[idFicha]";

   $Res_Modelo = ibase_query($conexao, $sql_FAModelo);
   $Modelo = ibase_fetch_assoc($Res_Modelo);
   
   //Pega Data
   $sql_Data = " Select extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao
                      From fa_avaliacao fa
                      where fa.IDCURSO =  $_SESSION[idCurso]
                      and fa.idTurma = $_SESSION[idTurma]
                      and fa.idficha = $_SESSION[idFicha]
                      and fa.identidade = '$_SESSION[identidadeInst]'
                      and fa.disciplina = '$_SESSION[codDisciplina]'";

   $Res_Data = ibase_query($conexao, $sql_Data);
   $Data = ibase_fetch_assoc($Res_Data);

   //echo "sql_Assunto $sql_Data";
   //---
   //--- Cabecalho Inicial
   //include("ListaDeAvaliacoes.php");
   echo "<br/>";

   echo "<table border='1' cellspacing='0' cellpadding='0' width='770' class='style3' bordercolor='#cccccc'>
            <tr>
              <td><img src='../../imagem/logo.png' border='0'></td>
              <td> <div><td width='770' align='Center'><b style='font-size:13px' ><p class='style2' align='center'><b>$Modelo[CABECALHO]</b></p></b></td></div>
              <td><img src='../../imagem/trainair.png' border='0'></td></td>
            </tr>
         </table>";
   echo "</br></br>";

   echo "<table>
             <tr><td width='770'style='font-size:10px'>CURSO: <b style='font-size:11px'> $curso[CODCURSO]-$curso[NOMECURSO] </b></td>
             <tr></tr>
             <tr><td width='770'style='font-size:10px'>DATA AVALIAÇÃO: <b style='font-size:11px'> $Data[DATAAVALIACAO]</b></td>
            <tr></tr>
           </table>";


   if ($Modelo[IDFICHA] == 7)
   {
      $Comentarios= "Entrou no Formulário - Ficha Avaliação do Coordenador  de Curso - Coordenador ".trim($_SESSION[identidadeInst]).' '.trim($Instrutor[POSTOGRADUACAO]).' '.trim($Instrutor[NOMEGUERRA]);
      $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                 values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', $Comentarios')";
      echo "<div><table>
              <td width='250' style='font-size:10px'>COORDENADOR: <b style='font-size:11px'>$Instrutor[POSTOGRADUACAO] $Instrutor[NOMEGUERRA]</b></td></tr>
            <tr></tr>";
      echo "<div><table>
               <tr><td width='570'style='font-size:10px'><b style='font-size:11px'>  </b></td>
               </table>
           <div/><br><br>";
   }

   if($Modelo[MODELO]=="Ficha Avaliação de Instrutor Por Disciplina")
   {
      $Comentarios= "Entrou no Formulário - Ficha Avaliação de Instrutor Por Disciplina - Disciplina ".trim($Coddisciplina).' - '.trim($disciplina).' Instrutor '.trim($_SESSION[identidadeInst]).' '.trim($Instrutor[POSTOGRADUACAO]).' '.trim($Instrutor[NOMEGUERRA]);
      $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                 values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";

       echo "<div><table>
                       <td width='250' style='font-size:10px'>INSTRUTOR AVALIADO: <b style='font-size:11px'> $Instrutor[POSTOGRADUACAO] $Instrutor[NOMEGUERRA]</b></td></tr>
                       <tr></tr>
                       <td width='720' style='font-size:10px'>DISCIPLINA AVALIADA: <b style='font-size:11px'>$Coddisciplina - $disciplina</b></td></tr>
                 </table>
            <div/><br><br>";
   }  //curso instrutor disciplina data cargahoraria
   else
   {
      if($Modelo[MODELO]=="Ficha Avaliação da Disciplina")
      {
         $Comentarios= "Entrou no Formulário - Ficha Avaliação da Disciplina - Disciplina ".trim($Coddisciplina).' - '.trim($disciplina);
         $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                    values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";

         echo "<div><table>
                  <td width='250' style='font-size:10px'>INSTRUTOR: <b style='font-size:11px'> $Instrutor[POSTOGRADUACAO] $Instrutor[NOMEGUERRA]</b></td></tr>
                    <tr></tr>
                       <td width='720' style='font-size:10px'>DISCIPLINA AVALIADA: <b style='font-size:11px'>$Coddisciplina - $disciplina</b></td></tr>
                 </table>
            <div/><br><br>";
      }   // curso instrutor disciplina data cargahoraria
      else
      {
         if($Modelo[MODELO]=="Ficha Avaliação do Instrutor")
         {
            if ($Coddisciplina != "")
            {
                $Comentarios= "Entrou no Formulário - Ficha Avaliação do Instrutor - Disciplina ".trim($Coddisciplina).' - '.trim($disciplina).' / Instrutor '.trim($_SESSION[identidadeInst]).' '.trim($Instrutor[POSTOGRADUACAO]).' '.trim($Instrutor[NOMEGUERRA]);
                $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                           values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";
               echo "<div><table>
                          <td width='250' style='font-size:10px'>INSTRUTOR AVALIADO: <b style='font-size:11px'>$Instrutor[POSTOGRADUACAO] $Instrutor[NOMEGUERRA]</b></td></tr>
                          <td width='720' style='font-size:10px'>DISCIPLINA AVALIADA: <b style='font-size:11px'>$Coddisciplina - $disciplina</b></td></tr>
                        <tr></tr>
                       </table>
                     <div/><br><br>";
            }
            else
            {
                $Comentarios= "Entrou no Formulário - Ficha Avaliação do Instrutor - Instrutor ".trim($_SESSION[identidadeInst]).' '.trim($Instrutor[POSTOGRADUACAO]).' '.trim($Instrutor[NOMEGUERRA]);
                $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                           values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', $Comentarios')";
               echo "<div><table>
                         <td width='250' style='font-size:10px'>INSTRUTOR: <b style='font-size:11px'>$Instrutor[POSTOGRADUACAO] $Instrutor[NOMEGUERRA]</b></td></tr>
                       <tr></tr>";
               echo "<div><table>
                         <tr><td width='570'style='font-size:10px'><b style='font-size:11px'>  </b></td>
                       </table>
                     <div/><br><br>";
            }
         }     //curso instrutor data
      }

   }

    //---
   //--- Insere log de acesso

 //  $resultado = ibase_query($conexao, $Comando);

    //---
   //--- Inicia a montagem da página de entrada de opçoes
   
   echo "<hr size='1'/>";
   echo "<p class='style2' align='left'><b>INSTRUÇÕES</b></br></br>";
   $Retorno= $f-> TrataEnter($Modelo[INSTRUCAO]);
   echo "<p class='style2' align='left'>$Retorno</p>";
?>

<form id='Form_Perguntas' name='Form_Perguntas' method='post' action="insere_Resposta.php">

<?php
   //---
   //--- Tratamento das perguntas

   //faz select para montar questionario

   $sql_FATopicos = "Select * From FA_Topicos
                     where IDFICHA= $Modelo[IDFICHA]
                     Order By IDFICHA, IdTopico";

   $res_Topicos= ibase_query($conexao, $sql_FATopicos);
   echo "<br>";
   echo "Após o preenchimento clique no botão enviar para concluir!";
   echo "<hr size='1'/>";
   echo "<br><br>";
   $Contador=0;

   //põe resultado no array e exibe questionario
   while ($Topicos = ibase_fetch_assoc($res_Topicos))
   {
      echo "<table border='1' cellspacing='0' cellpadding='0' width='770' bgcolor='#cccccc' bordercolor='#FFFFFF' >
               <tr> ";
   ?>

   <td width="735" align="center"><div><b style='font-size:12px' ><?=$Topicos[DESCRICAO]?></b></div></td>
   <td width="16" scope="col" id='<?=$Topicos[DESCRICAO]?>span' ><img style='cursor: pointer;' onclick="minDiv('<?=$Topicos[DESCRICAO]?>');" src="../../imagem/min.png" width="16" height="14" border="0"></td><td><img style='cursor: pointer;' onclick="maxDiv('<?=$Topicos[DESCRICAO]?>');" src="../../imagem/max.png" width="16" height="14" border="0"></td>

   <?php        echo "</tr>
            </table>";

      $sql_FAItens = "Select * From FA_Itens
                        where IDFICHA= $Topicos[IDFICHA]
                        and   IDTOPICO= $Topicos[IDTOPICO]
                        Order By IDFICHA, IDTOPICO, IdItem";

      $res_Itens= ibase_query($conexao, $sql_FAItens);
      echo "<div id='$Topicos[DESCRICAO]'>";
      while ($Itens = ibase_fetch_assoc($res_Itens))
      {
         $Contador++;
         $radio = $Itens['IDITEM'];
         echo "<table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='770' class='caixa'>
                  <tr>
                     <div><td width='500'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[IDITEM] - $Itens[DESCRICAO]</span></td></div>
                     <td width='400'><table border='0' cellspacing='0' cellpadding='0' width='400'>
                     <tr>
                        <td width='23'><input type='radio' name='$Contador' id='radio6' value='0$Topicos[IDTOPICO]' /></td>
                        <td width='60'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Péssimo </span></td>
                        <td width='22'><input type='radio' name='$Contador' id='radio6' value='1$Topicos[IDTOPICO]' /></td>
                        <td width='44'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Ruim </span></td>
                        <td width='22'><input type='radio' name='$Contador' id='radio6' value='2$Topicos[IDTOPICO]' /></td>
                        <td width='48'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Regular</span></td>
                        <td width='23'><input type='radio' name='$Contador' id='radio6' value='3$Topicos[IDTOPICO]' /></td>
                        <td width='43'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Bom </span></td>
                        <td width='22'><input type='radio' name='$Contador' id='radio6' value='4$Topicos[IDTOPICO]' /></td>
                        <td width='42'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Ótimo </span></td>
                        <td width='22'><input type='radio' name='$Contador' id='radio6' value='5$Topicos[IDTOPICO]' /></td>
                        <td width='42'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #5D5D5D;'>Excelente </span></td>

                      </tr>
                   </table></td>
                  </tr>
               </table>";
      }
      echo "</div>";
    }
    
   echo "<br/>";
   echo "<hr size='1'/>";
   echo "<br/>";

   //---
   //--- Tratamento da entrada do Complemento

   echo "<p>Para a MELHORIA da qualidade da instrução, utilize este campo para nos dar a sua SUGESTÃO:</p>
   <p>
    <label>
      <textarea name='comentario' id='comentarios' cols='85' rows='4' onKeyDown='valida_longitude()' onKeyUp='valida_longitude()'></textarea>
      <input name='coment' type='text' id='caracteress' size='3' maxlength='4' />
    </label>";
   echo "<br><br>";


?>
</form>

<script>
//Funções que verificam se radios foram clicados

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
		  alert('Certifique-se de que respondeu todas questões!');
    }

}
//FIM - Funções que verificam se radios foram clicados
</script>



<img src='../../imagem/enviar.png' name='enviar_consulta' id='enviar_consulta' onclick="verificando();"/>
</div>

</html>
