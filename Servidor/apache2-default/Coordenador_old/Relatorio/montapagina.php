<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : MontaPagina.php                                //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a p�gina que//
  //                             mostra as respostas dos alunos na Ficha de     //
  //                             Avalia��o de Curso.                            //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj S�nia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 18/06/2009                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//
   session_start();
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");
   require_once("../../Funcoes/conecta.inc");
   $f= new Funcao();

?>

<NOSCRIPT>
     Este navegador n�o compreende os scripts que se est�o executando,
     voc� deve habilitar o javascript no seu navegador ou  atualizar sua vers�o de navegador a uma mais recente.
</NOSCRIPT>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../apc.css" rel="stylesheet" type="text/css">
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css">
<title>AVALIA��O DE CURSO</title>

<script>

   //Fun��es que faz tratamento da textearea

    conteudo_textarea = "";
    num_caracteres_permitidos = 1000;

   function valida_longitude(){
       num_caracteres = document.form_Complemento.comentario.value.length;

       if (num_caracteres > num_caracteres_permitidos){
         document.form_Complemento.comentario.value = conteudo_textarea;
       }else{
         conteudo_textarea = document.form_Complemento.comentario.value;
       }

       if (num_caracteres >= num_caracteres_permitidos){
         document.form_Complemento.coment.style.color="#ff0000";
       }else{
          document.form_Complemento.coment.style.color="#000000";
       }
    contaComentario()
    }
    
   function contaComentario(){
       document.form_Complemento.coment.value=document.form_Complemento.comentario.value.length
    }

   //FIM - Fun��es que faz tratamento da textearea


   function showHide (ID) {

      if (document.getElementById(ID).style.display == "none") {
         document.getElementById(ID).style.display= "";
         document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='../../imagem/min.gif' onclick='showHide(ID);' width='16' height='14' border='0'>";
      }
      else {
         document.getElementById(ID).style.display = "none";
         document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='../../imagem/max.png' onclick='showHide(DISCIPL);' width='16' height='14' border='0'>";
      }
   }
   
   
   function minDiv(idDiv){
       document.getElementById(idDiv).style.display = "none";
        }

   function maxDiv(idDiv){
       document.getElementById(idDiv).style.display = "";
        }


   function selecionar_tudo(){
     for (i=0;i<document.Form_Perguntas.elements.length;i++){
        if(document.Form_Perguntas.elements[i].type == "checkbox"){
          document.Form_Perguntas.elements[i].checked=1

          }
         }
         document.Form_Perguntas.submit();
        }
        
    </script>
   </head>
   <body leftmargin="0">
   <div id="corpo">
   <div id="barra" align="left"><a href='ListaDeAvaliacoes_p.php' target='_self' > << Mudar de Ficha de Avalia��o</a></div>

<?php
    $_SESSION[tipo] = $_POST[grafico];
   //---
   //--- Tratamento do Cabecalho da Pagina

   if($_SESSION[idCurso])
   {
      $_SESSION[dadosFicha]= "$_POST[ListaDeFichas]";
      $cont = strlen($_SESSION[dadosFicha]);
   
      $idModelo = substr($_SESSION[dadosFicha],0,2);                //COLETA DADO A SER ENVIADO PRA INSER��O
      if ($idModelo == "00")
      {
         $idFicha = "01";
      }
      else
      {
         $idFicha = substr($_SESSION[dadosFicha],0,2);                //COLETA DADO A SER ENVIADO PRA INSER��O
      }

      $_SESSION[codDisciplina] = substr($_SESSION[dadosFicha],2,6);//COLETA DADO A SER ENVIADO PRA INSER��O
      $_SESSION[espacoEsq] = substr($_SESSION[dadosFicha],8,1);    //COLETA DADO A SER ENVIADO PRA INSER��O
      $_SESSION[espacoDir] = substr($_SESSION[dadosFicha],9,1);    //COLETA DADO A SER ENVIADO PRA INSER��O
      $_SESSION[identidade] = substr($_SESSION[dadosFicha],10);    //COLETA DADO A SER ENVIADO PRA INSER��O
      $_SESSION[idFicha]=$idFicha;

      //trata identidade
      $identidade =$_SESSION[identidade];
      $contIdentidade = strlen($identidade);
      $paramEsq = $_SESSION[espacoEsq] + $contIdentidade ;
      $paramDir = $_SESSION[espacoDir] + $contIdentidade ;
      $identidadeComEsq= str_pad("$identidade",$paramEsq," ", STR_PAD_LEFT) ;
      $identidadeCompleta= str_pad("$identidadeComEsq",20," ", STR_PAD_RIGHT) ;

      $sqlcurso = "Select CodCurso, NomeCurso
                   From Curso
                   where IDCURSO = $_SESSION[idCurso]";
      $resultadocurso = ibase_query($conexao, $sqlcurso);
      $curso = ibase_fetch_assoc($resultadocurso);

      //---
      //--- Paga a disciplina avaliada
      
      if ($_SESSION[codDisciplina] != "000000")
      {
         $sql_Disciplina = "Select m.codmateria, m.NomeMateria
                            From MateriaCurso m
                            where m.IDCURSO = $_SESSION[idCurso]
                            and m.codmateria = '$_SESSION[codDisciplina]'";
         $Res_Disciplina = ibase_query($conexao, $sql_Disciplina);
         $Disciplina = ibase_fetch_assoc($Res_Disciplina);
      }


       //---
      //--- Pega o Instrutor

      if ($identidade != "000000")
      {
         $sql_Instrutor = "Select p.PostoGraduacao, p.nomeguerra
                           From fa_avaliacao a, pessoa p
                           where a.IDCURSO =  $_SESSION[idCurso]
                           and a.idTurma = $_SESSION[idTurma]
                           and a.IDFICHA = $idFicha
                           and a.identidade like '%$identidade%'
                           and a.identidade = p.identidade";
         $Res_Instrutor = ibase_query($conexao, $sql_Instrutor);
         $Instrutor = ibase_fetch_assoc($Res_Instrutor);
      }
      
       //---
      //--- Pega o Coordenador

      $sql_Coordenador = "Select p.PostoGraduacao, p.nomeguerra
                        From fa_avaliacao a, pessoa p
                        where a.IDCURSO =  $_SESSION[idCurso]
                        and a.idTurma = $_SESSION[idTurma]
                        and a.IDFICHA = $idFicha
                        and a.identidade like '%$identidade%'
                        and a.idCoordenador = p.identidade";
      $Res_Coordenador = ibase_query($conexao, $sql_Coordenador);
      $Coordenador = ibase_fetch_assoc($Res_Coordenador);
      
       //---
      //--- Query para pagar a identificacao da Ficha de Avaliacao

      if ($idFicha != "00")
      {
         $sql_FAModelo = "Select *
                         From FA_Modelo
                         where IDFICHA= $idFicha";
        $Res_Modelo = ibase_query($conexao, $sql_FAModelo);
        $Modelo = ibase_fetch_assoc($Res_Modelo);
      }
   

       //---
      //--- Query para pegar a Data da Avaliacao
      
      $sql_Data = " Select extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao
                    From fa_avaliacao fa
                    where fa.IDCURSO =  $_SESSION[idCurso]
                    and fa.idTurma = $_SESSION[idTurma]
                    and fa.idficha = $idFicha
                    and fa.identidade = '$identidadeCompleta'
                    and fa.disciplina = '$_SESSION[codDisciplina]'";
      $Res_Data = ibase_query($conexao, $sql_Data);
      $Data = ibase_fetch_assoc($Res_Data);
   
       //---
      //--- Pega o periodo da Turma

      $sql_periodo= " select turma, ano, qdealunos,
                          extract(day from datainicio)||'/'||extract(month from datainicio)||'/'||extract(year from datainicio) as Inicio,
                          extract(day from datatermino)||'/'||extract(month from datatermino)||'/'||extract(year from datatermino) as Termino
                      from turma
                      where idcurso=$_SESSION[idCurso]
                      and idturma=$_SESSION[idTurma]";
      $Res_periodo=ibase_query($conexao, $sql_periodo);
      $Periodo = ibase_fetch_assoc($Res_periodo);

       //---
      //Pega numero de aluno participantes da avalia��o

      $sql_avaliadores="select count(1) QDEALUNOS
                        from fa_relacao where idcurso=$_SESSION[idCurso]
                        and idturma = $_SESSION[idTurma]
                        and idficha = $idFicha
                        and identidade like '%$identidade%'
                        and disciplina = '$_SESSION[codDisciplina]'";

      $Res_avaliadores=ibase_query($conexao,$sql_avaliadores);
      $avaliadores=ibase_fetch_assoc($Res_avaliadores);


      //Pega numero de questionarios respondidos
      $sql_respondidos="select distinct SENHA
                        from fa_resposta
                        where idcurso=$_SESSION[idCurso]
                        and idturma=$_SESSION[idTurma]
                        and idficha = $idFicha
                        and identidade= '$identidadeCompleta'
                        and disciplina=  '$_SESSION[codDisciplina]'";
      $Res_respondidos=ibase_query($conexao,$sql_respondidos);

      while($Respondidos=ibase_fetch_assoc($Res_respondidos))
      {
         $cont_respondido ++;
      }

   //---
   //--- Cabecalho Inicial

   echo "<br/>";

   echo "<div id='titulo' class='BODY'>INSTITUTO DE CONTROLE DO ESPA�O A�REO</div>";
   echo "<p align='center'>DIVIS�O DE ENSINO</p>";
   echo "<p align='center'>SUBDIVIS�O DE AVALIA��O</p>";
   echo "<br/>";
   if ($idModelo != "00")
   {
      echo "<strong><p align='center' style='font-size:11px' >$Modelo[CABECALHO]</p></strong>";
   }
   else
   {
      echo "<strong><p align='center' style='font-size:11px' >EXTRATO DO CURSO</p></strong>";
   }


   echo "<hr size='1'/>";
   echo "<div><table>
                <tr>
                  <td width='820'style='font-size:10px'>Nome do curso: <b style='font-size:10px'>$curso[NOMECURSO] -  $curso[CODCURSO] </b></td>
                </tr>
                <tr>
                   <td width='250' style='font-size:10px'>Turma: <b style='font-size:11px'> $Periodo[TURMA] de $Periodo[ANO] </b></td>
                </tr>
                <tr>
                   <td width='500'style='font-size:10px'>Per�odo: <b style='font-size:11px'> $Periodo[INICIO] a $Periodo[TERMINO]  </b></td>
                   <td width='270' style='font-size:10px'>Data Avalia��o:<b style='font-size:11px'> $Data[DATAAVALIACAO] </b></td>
                </tr>
              </table>
         <div/>";


   if ($idFicha == 2)
   {
      echo "<div><table>
                   <tr>
                     <td width='570'style='font-size:10px'>Coordenador : <b style='font-size:11px'>$Coordenador[POSTOGRADUACAO] $Coordenador[NOMEGUERRA] </b></td>
                   </tr>
                   <tr>
                     <td width='570'style='font-size:10px'>Instrutor Avaliado : <b style='font-size:11px'>$Instrutor[POSTOGRADUACAO] $Instrutor[NOMEGUERRA] </b></td>
                   </tr>
                 </table>
            <div/><br>";
   }
   else
   {
     if ($idFicha == 5)    // Avaliacao da Disciplina pelo Docente
     {
        echo "<div><table>
                    <tr>
                      <td width='570'style='font-size:10px'>Instrutor : <b style='font-size:11px'>$Instrutor[NOMEGUERRA] </b></td>
                    </tr>
                    <tr>
                       <td width='570'style='font-size:10px'>Disciplina Avaliada: <b style='font-size:11px'>$Disciplina[CODMATERIA] - $Disciplina[NOMEMATERIA] </b></td>
                    </tr>
                  </table>
             <div/><br>";
      }
      else
      {
         if ($idFicha == 3 or $idFicha == 4)
         {
            echo "<div><table>
                        <tr>
                          <td width='570'style='font-size:10px'>Instrutor Avaliado: <b style='font-size:11px'>$Instrutor[POSTOGRADUACAO] $Instrutor[NOMEGUERRA] </b></td>
                        </tr>
                        <tr>
                          <td width='570'style='font-size:10px'>Disciplina Avaliada: <b style='font-size:11px'>$Disciplina[CODMATERIA] - $Disciplina[NOMEMATERIA] </b></td>
                        </tr>
                        <tr>
                          <td width='570'style='font-size:10px'>N�mero de participantes : <b style='font-size:11px'> $avaliadores[QDEALUNOS] </b></td>
                          <td width='200' style='font-size:10px'>Alunos no curso:<b style='font-size:11px'> $Periodo[QDEALUNOS] </b></td>
                        </tr>
                        <tr>
                          <td width='570'style='font-size:10px'>N�mero de questionarios respondidos : <b style='font-size:11px'>$cont_respondido </b></td>
                        </tr>
                      </table>
                 <div/><br>";
         }
         else
         {
            echo "<div><table>
                        <tr>
                          <td width='570'style='font-size:10px'>N�mero de participantes : <b style='font-size:11px'> $avaliadores[QDEALUNOS] </b></td>
                          <td width='200' style='font-size:10px'>Alunos no curso:<b style='font-size:11px'> $Periodo[QDEALUNOS] </b></td>
                        </tr>
                        <tr>
                          <td width='570'style='font-size:10px'>N�mero de questionarios respondidos : <b style='font-size:11px'>$cont_respondido </b></td>
                        </tr>
                      </table>
                 <div/><br><br>";
         }
      }
     }
   }
   echo "<p class='style2' align='left'>$Retorno</p>";
?>

<form id='Form_Perguntas' name='Form_Perguntas' method='post' action="MostraGrafico.php">
<?php

   //---

   Function LimpaGrafico($conexao)
   {
      $sql_Grafico = "Delete from FA_Grafico";
      $ResGrafico = ibase_query($conexao, $sql_Grafico);
   }
      LimpaGrafico($conexao);
   //--- Tratamento das perguntas
   //faz select para montar questionario

   $sql_FATopicos = "Select * From FA_Topicos
                     where IDFICHA= $idFicha
                     Order By IDFICHA, IdTopico";
   $res_Topicos= ibase_query($conexao, $sql_FATopicos);

   echo "<hr size='1'/>";
   echo "Os valores de avalia��o correspondem aos seguintes conceitos:";
   echo "<br><br>";
   echo " 1-P�ssimo    2-Ruim     3-Regular     4-Bom      5-�timo      6-Excelente";
   echo "<br><br>";


   //Verifica se foi respondido
   $sql_avaliado="select idcurso, idturma, idficha
                  from fa_resposta
                  where idcurso = $_SESSION[idCurso]
                  and idturma = $_SESSION[idTurma]
                  and idficha = $idFicha";
   $Res_avaliado=ibase_query($conexao, $sql_avaliado);
   if(ibase_fetch_assoc($Res_avaliado)){


   $Contador=0;
   $legenda=0;   //  se o numero de topicos for maior que tr�s label y fica na vertical
   //p�e resultado no array e exibe questionario
   while ($Topicos = ibase_fetch_assoc($res_Topicos))
   {
      $m_cont=0;
      $soma_media=0;
      $legenda++;
      echo "<table border='1' cellspacing='0' cellpadding='0' width='770' bgcolor='#cccccc' bordercolor='#FFFFFF' >
      <tr> ";
      ?>
      <td width="510" align="center"><div><b style='font-size:12px' ><?=$Topicos[DESCRICAO]?></b></div></td>
       <td width="25" align="center"><div><b style='font-size:12px' >1</b></div></td>
        <td width="25" align="center"><div><b style='font-size:12px' >2</b></div></td>
         <td width="25" align="center"><div><b style='font-size:12px' >3</b></div></td>
          <td width="25" align="center"><div><b style='font-size:12px' >4</b></div></td>
           <td width="25" align="center"><div><b style='font-size:12px' >5</b></div></td>
            <td width="25" align="center"><div><b style='font-size:12px' >6</b></div></td>
             <td width="40" align="center"><div><b style='font-size:12px' >N Obs</b></div></td>
              <td width="50" align="center"><div><b style='font-size:12px' >M�dia</b></div></td>
      <?php
      echo "</tr>
      </table>";
   
      $sql_FAItens = "Select  * From FA_Itens
                        where IDFICHA= $Topicos[IDFICHA]
                        and   IDTOPICO= $Topicos[IDTOPICO]
                        Order By IDFICHA, IDTOPICO, IdItem";

      $res_Itens= ibase_query($conexao, $sql_FAItens);
      echo "<div id='$Topicos[DESCRICAO]'>";

      while ($Itens = ibase_fetch_assoc($res_Itens))
      {
         // $m_cont++;
         $sql_FAResposta = "select count (1) qtd  from fa_resposta
                            where idcurso =$_SESSION[idCurso]
                            and idturma=$_SESSION[idTurma]
                            and idficha = $idFicha
                            and idtopico=$Topicos[IDTOPICO]
                            and iditem=$Itens[IDITEM]
                            and identidade like '%$identidade%'
                            and disciplina='$_SESSION[codDisciplina]'";
          $res_Resposta= ibase_query($conexao, $sql_FAResposta);
          $totalRep=ibase_fetch_assoc($res_Resposta);

          $VI_01=0;
          $VI_02=0;
          $VI_03=0;
          $VI_04=0;
          $VI_05=0;
          $VI_06=0;
       
          $Cont_sql_FAResposta = "select resposta from fa_resposta
                                  where idcurso =$_SESSION[idCurso]
                                  and idturma=$_SESSION[idTurma]
                                  and idficha = $idFicha
                                  and idtopico=$Topicos[IDTOPICO]
                                  and iditem=$Itens[IDITEM]
                                  and identidade like '%$identidade%'
                                  and disciplina='$_SESSION[codDisciplina]'";
          $res_Resposta= ibase_query($conexao, $Cont_sql_FAResposta);
          while($total=ibase_fetch_assoc($res_Resposta))
          {
            if ($total[RESPOSTA]==0)
                $VI_01=$VI_01+1;
            else
               if ($total[RESPOSTA]==1)
                  $VI_02=$VI_02+1;
               else
                  if ($total[RESPOSTA]==2)
                     $VI_03=$VI_03+1;
                  else
                    if ($total[RESPOSTA]==3)
                      $VI_04=$VI_04+1;
                    else
                       if ($total[RESPOSTA]==4)
                           $VI_05=$VI_05+1;
                       else
                          if ($total[RESPOSTA]==5)
                             $VI_06=$VI_06+1;
       }

       $m1=  $VI_01 * 1;
       $m2=  $VI_02 * 2;
       $m3=  $VI_03 * 3;
       $m4=  $VI_04 * 4;
       $m5=  $VI_05 * 5;
       $m6=  $VI_06 * 6;

       if ($totalRep[QTD] > 0)
       {
          $m_cont++;
          if($totalRep[QTD])
          {
             $media = ($m1+$m2 + $m3 + $m4 + $m5 + $m6)/$totalRep[QTD];
             $soma_media = $soma_media+ $media ;
             $media_ajust=substr($media,0,4);
          }
          else
          {
             echo "<b style='font-size:12px' >ERRO! Consulte o administrador</b>";
          }
       }
       else
       {
          $media_ajust=0;
       }
       
       $Contador++;
       $radio = $Itens['IDITEM'];
       echo "<table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='770' class='caixa'>
                  <tr valign='rigth'>
                     <div><td width='510'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[IDITEM] - $Itens[DESCRICAO]</span></td></div>
                         <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_01</span></div></td>
                          <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_02</span></div></td>
                           <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_03</span></div></td>
                            <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_04</span></div></td>
                             <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_05</span></div></td>
                              <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_06</span></div></td>
                               <td width='40' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$totalRep[QTD]</span></b></div></td>
                                <td width='50' align='center'><div><b style='font-size:12px' >$media_ajust</b></div></td>
                  </tr>
             </table>";
      }
      $media_topico[$m_cont] = $soma_media / $m_cont;

      $sql_Grafico = "Insert into FA_Grafico values ($_SESSION[idCurso],
                                                      $_SESSION[idTurma],
                                                      $idFicha,
                                                      $Topicos[IDTOPICO],
                                                      $media_topico[$m_cont],'$Topicos[DESCRICAO]','' )";

      $ResGrafico = ibase_query($conexao, $sql_Grafico);
      
  ?>

    <table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='770' class='caixa'>
     <tr>
         <td width="720" align="left"><div><b style='font-size:12px' >M�dia do T�pico</b></div></td>
         <td width="50" align="center"><div><b style='font-size:12px; color:red' ><?=substr($media_topico[$m_cont],0,4)?></b></div></td>
     </tr>
    </table>
    <br>
  <?
     echo "</div>";
     echo "<input type='hidden' size='20' name='contador' value='$Contador'>";
    }

    
   ini_set("allow_url_fopen",1);

   echo "<table cellspacing='0' cellpadding='0' border '1' width='100%'>
          <div id ='$row_Res_sql_nomeTop[DESCRICAO]'>
          <tr>
           <div><td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&legenda=$legenda' ></td>";
   echo  "</tr>
          </div>
         </table>";

   echo "<input type='hidden' size='20' name='titulo' value='$row_Res_sql_nomeItem[DESCRICAO]'>";
   echo "<hr size='1'/>";

   ini_set("allow_url_fopen",0);
   


  ?>
  </form>
<script>
//Fun��es que verificam se radios foram clicados

function verificaFORM1()
{

	var ok=0;
	var Sel=0;
	<?php echo"var Nb = $Contador"; ?>

	for (i=0;i<document.Form_Perguntas.elements.length;i++)
    {
		if(document.Form_Perguntas[i].type=="radio")
			if(document.Form_Perguntas[i].checked==true)
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

	if(P1 == 0 )
		alert('Certifique-se de que respondeu todas quest�es!');
	if(P1 == 1 )
    {
      document.Form_Perguntas.submit();
      document.form_Complemento.submit();
    }

}
//FIM - Fun��es que verificam se radios foram clicados
</script>

 <?php
   echo "<br/>";
   echo "<hr size='1'/>";
   echo "<br/>";
 ?>
</div>

 <?php
   $sql_Grafico = "select media, descricao, idtopico from fa_grafico
                          where idcurso= $_SESSION[idCurso]
                          and idturma=$_SESSION[idTurma]
                          and idficha= $idFicha
                          order by idtopico";
   $ResGrafico = ibase_query($conexao, $sql_Grafico);
   $aspas="";

   $i=0;
   while ($row =  ibase_fetch_assoc($ResGrafico)){

   $dados[$i]= array( $row[DESCRICAO],$aspas,$row[MEDIA]);
   $dadoa[$i]=str_pad($dados,  0  , "," ,  STR_PAD_LEFT);
   $aspas.="'',";

   $i++;
   }
 ?>
 
 <?php
    //---
   //--- Tratamento dos Comentarios dos alunos

   if ( $idModelo == "00" )
   {

      $sql_Complemento = "select c.Disciplina,
                                Cast( p.postograduacao As Char(25)) as postograduacao,
                                Cast( p.nomeguerra As Char(20)) as nomeguerra,
                                c.comentario,
                                c.descdisciplina
                          From FA_Comentario_View c, pessoa p
                          where c.IDCURSO= $_SESSION[idCurso]
                          and c.IDTURMA= $_SESSION[idTurma]
                          and (IdFicha = 1 or IdFicha = 3 or IdFicha = 4)
                          and c.identidade = p.identidade
                          and c.identidade <> '000000'
                          union
                             select c.Disciplina,
                                    Cast( '' As Char(25)) as postograduacao,
                                    Cast( '' As Char(20)) as nomeguerra,
                                    c.comentario,
                                    c.descdisciplina
                             From FA_Comentario_View c
                             where c.IDCURSO= $_SESSION[idCurso]
                             and c.IDTURMA= $_SESSION[idTurma]
                             and (IdFicha = 1 or IdFicha = 3 or IdFicha = 4)
                             and c.identidade = '000000'";
   }
   else
   {
      $sql_Complemento = "select c.Disciplina, c.descdisciplina, c.comentario
                          From FA_Comentario_View c
                          where c.IDCURSO= $_SESSION[idCurso]
                          and c.IDTURMA= $_SESSION[idTurma]
                          and c.idficha= $idFicha
                          and c.disciplina= '$_SESSION[codDisciplina]'
                          order by idcurso, idturma, idficha";
   }
   $ResComplemento = ibase_query($conexao, $sql_Complemento);

   if ($idModelo == "00")     //--- Monta o comentario com rela��o ao Extrato
   {
      echo "
             <table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
              <tr>
                  <td width = '450' class = 'style3' align='center'> &nbsp; <strong> COMENT�RIOS ALUNOS</strong><br/><br/>
              </tr>
             </table>";
   }
   else
   {
      echo "
             <table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
              <tr>
                  <td width = '450' class = 'style3' align='center'> &nbsp; <strong> COMENT�RIOS</strong><br/><br/>
              </tr>
             </table>";
   }

   $VI_Cont= 1;
   while ($row =  ibase_fetch_assoc($ResComplemento))
   {
      if($row[COMENTARIO])
      {
         if ($idModelo == "00")     //--- Monta o comentario com rela��o ao Extrato
         {
            if ($row[DISCIPLINA] != "000000")    // mostra a disciplina e o instrutor no extrato
            {
               echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                       <tr>
                          <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[DISCIPLINA] - $row[DESCDISCIPLINA]<br/><br/>
                                                                    $row[COMENTARIO] <br/><br/>
                       </tr>
                     </table>";
            }
            else
            {
               echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                       <tr>
                          <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[COMENTARIO] <br/><br/>
                       </tr>
                     </table>";
            }
         }
         else
         {
            echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                    <tr>
                       <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[COMENTARIO] <br/><br/>
                    </tr>
                  </table>";
         }
         $VI_Cont++;
       }
   }
    
   }else
   {
      echo "<br><br><br><br><span  style='color:#FF0000; font-size:15px;'>Nenhuma coment�rio cadastrado!</span>";
   }


    //---
   //--- Tratamento do comentario do Instrutor

   if ($idModelo == "00")      //--- Monta o comentario com rela��o ao Extrato
   {

      $sql_Complemento = "select Disciplina, descdisciplina, comentario
                          From FA_Comentario_View
                           where IDCURSO= $_SESSION[idCurso]
                           and IDTURMA= $_SESSION[idTurma]
                           and (IdFicha = 5)";

      $ResComplemento = ibase_query($conexao, $sql_Complemento);

      echo "
              <table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
                <tr>
                   <td width = '450' class = 'style3' align='center'> &nbsp; <strong> COMENT�RIOS INSTRUTOR</strong><br/><br/>
                </tr>
             </table>";

      $VI_Cont= 1;
      while ($row =  ibase_fetch_assoc($ResComplemento))
      {
         if($row[COMENTARIO])
         {
            echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                    <tr>
                       <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[DISCIPLINA] - $row[DESCDISCIPLINA] <br><br>
                                                                    $row[COMENTARIO] <br/><br/>
                    </tr>
                  </table>";
            $VI_Cont++;
         }
      }

       //---
      //--- Tratamento do comentario do Coordenador

      $sql_Complemento = "select Disciplina, descdisciplina, comentario
                          From FA_Comentario_View
                           where IDCURSO= $_SESSION[idCurso]
                           and IDTURMA= $_SESSION[idTurma]
                           and (IdFicha = 2)";

      $ResComplemento = ibase_query($conexao, $sql_Complemento);

      echo "
              <table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
              <tr>
                  <td width = '450' class = 'style3' align='center'> &nbsp; <strong> COMENT�RIOS COORDENADOR</strong><br/><br/>

              </tr>
             </table>";

      $VI_Cont= 1;
      while ($row =  ibase_fetch_assoc($ResComplemento))
      {
         if($row[COMENTARIO])
         {
            if ($row[DISCIPLINA] != "000000")
            {
               echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                       <tr>
                          <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[DISCIPLINA] - $row[DESCDISCIPLINA] <br><br>
                                                                   $row[COMENTARIO] <br/><br/>
                      </tr>
                   </table>";
            }
            else
            {
               echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                       <tr>
                          <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[COMENTARIO] <br/><br/>
                      </tr>
                   </table>";
            }
            $VI_Cont++;
         }
      }



    //---
   //--- Pega o nome do Chefe da Secao de Avaliacao

   $sql_chefe="Select c.Sigla, c.PostoGraduacao, c.descCargo, c.nome
               From cargo_View c
               Where c.sigla = 'EAVC'";
   $Res_chefe = ibase_query($conexao, $sql_chefe);
   $chefe = ibase_fetch_assoc($Res_chefe);
    
   echo"<br/><br/><br/><br/><br/><br/>";
    
   echo "
             <div align='right'>
                 <p>$chefe[NOME]- $chefe[POSTOGRADUACAO] $sigla[DESCCARGO]</p>
                 <p> Chefe da $chefe[SIGLA]</p><br/>

              </div>";
              
  }
  else
  {
     echo  "Retorne a p�gina anterior!";
  }
?>
 
</body>

</html>

