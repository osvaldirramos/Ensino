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
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   require_once("../Funcoes/conecta.inc");
   $f= new Funcao();

    //---
   //--- Funcao para limpar o Grafico

   Function LimpaGrafico($conexao)
   {
      $sql_Grafico = "Delete from FA_Grafico";
      $ResGrafico = ibase_query($conexao, $sql_Grafico);
   }
?>

<NOSCRIPT>
     Este navegador n�o compreende os scripts que se est�o executando,
     voc� deve habilitar o javascript no seu navegador ou  atualizar sua vers�o de navegador a uma mais recente.
</NOSCRIPT>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="estilos/estilo.css" rel="stylesheet" type="text/css">
<title>AVALIA��O DE CURSO</title>

<script language="JavaScript">

  function stAba(menu,conteudo)
  {
    this.menu = menu;
    this.conteudo = conteudo;
  }

  var arAbas = new Array();
  arAbas[0] = new stAba('td_relatorio','div_relatorio');
  arAbas[1] = new stAba('td_providencia','div_providencia');


  function AlternarAbas(menu,conteudo)
  {
     for (i=0;i<arAbas.length;i++)
     {
       m = document.getElementById(arAbas[i].menu);
       m.className = 'menu';
       c = document.getElementById(arAbas[i].conteudo)
       c.style.display = 'none';
     }
     m = document.getElementById(menu)
     m.className = 'menu-sel';
     c = document.getElementById(conteudo)
     c.style.display = '';
  }

  function darParecer(parecer)
  {
    form = document.getElementById(parecer)
    form.style.display = '';
    document.getElementById("txRecomendada").focus();
    document.getElementById("txRecomendada").innerHTML=document.getElementById("vazio").innerHTML;
    document.getElementById("txExecutada").innerHTML=document.getElementById("vazio").innerHTML;
    document.getElementById('tit1').selected=true;
  }

  function addParecer()
  {
    document.parecer.submit();
  }

  //Fun��es que faz tratamento da textearea

  conteudo_textarea = "";
  num_caracteres_permitidos = 1000;

  function valida_longitude()
  {
     num_caracteres = document.form_Complemento.comentario.value.length;

     if (num_caracteres > num_caracteres_permitidos)
     {
        document.form_Complemento.comentario.value = conteudo_textarea;
     }
     else
     {
        conteudo_textarea = document.form_Complemento.comentario.value;
     }
     if (num_caracteres >= num_caracteres_permitidos)
     {
        document.form_Complemento.coment.style.color="#ff0000";
     }
     else
     {
        document.form_Complemento.coment.style.color="#000000";
     }
     contaComentario()
  }

  function contaComentario()
  {
     document.form_Complemento.coment.value=document.form_Complemento.comentario.value.length
  }
  //FIM - Fun��es que faz tratamento da textearea

  function showHide (ID) {
     if (document.getElementById(ID).style.display == "none")
     {
        document.getElementById(ID).style.display= "";
        document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='min.gif' onclick='showHide(ID);' width='16' height='14' border='0'>";
     }
     else {
        document.getElementById(ID).style.display = "none";
        document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='max.png' onclick='showHide(DISCIPL);' width='16' height='14' border='0'>";
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

  function selecionar_tudo()
  {
    for (i=0;i<document.Form_Perguntas.elements.length;i++){
       if(document.Form_Perguntas.elements[i].type == "checkbox"){
         document.Form_Perguntas.elements[i].checked=1
            }
        }
        document.Form_Perguntas.submit();
  }

  function atualizarPagina()
  {
        history.go(0);
        document.execCommand('Refresh');
        //event.keyCode = 116;
  }

  function enviarEmail(a,e)
  {
       location.href = "email.php?arquivo="+a+"&email="+e;
  }
  

  function mostrarDiv(elemento)
  {
      form = document.getElementById(elemento);
      form.style.display= '';
  }


  function darFoco(elemento)
  {
      document.getElementById(elemento).focus();
  }

  function alterarParecer(rec,exec,titulo)
  {
       var tit;
       tit="tit"+titulo;
       
       mostrarDiv("parecer");
       darFoco("txRecomendada");
       if(rec=="rec")
       {
          document.getElementById("txRecomendada").value="";
       }
       else
       {
          document.getElementById("txRecomendada").innerHTML=document.getElementById(rec).innerHTML;
       }

       if(exec!="exec")
       {
          document.getElementById("txExecutada").innerHTML=document.getElementById(exec).innerHTML;
       }
       else
       {
          document.getElementById("txExecutada").innerHTML=document.getElementById("vazio").innerHTML;
       }
       document.getElementById(tit).selected=true;
       document.getElementById("secaoAtual").value=titulo;
  }
  </script>
  </head>
  <div id="corpo">
  <div id="barra" align="left"><a href='ListaDeAvaliacoes_p.php' target='_self' > << Mudar de Ficha de Avalia��o</a></div>
  <body onLoad="AlternarAbas('td_providencia','div_providencia')">
   <table width="770" cellspacing="0" cellpadding="0" border="0" style="border-left: 0px solid #000000;">
   <tr>
    <td height="20" width="100" class="menu" id="td_relatorio" style="border-left: 1px solid #000000;" onClick="AlternarAbas('td_relatorio','div_relatorio')">
     Relat�rio
    </td>
    <td height="20" width="100" class="menu" id="td_providencia"onClick="AlternarAbas('td_providencia','div_providencia')">
      Provid�ncias
    </td>
    <td width="460" style="border-bottom: 1px solid #000000">
    <td>
   </tr>
   <tr>
    <td  class="tb-conteudo" colspan="4">
    <div id="div_providencia" class="conteudo" style="display:none">
     <br>
     <br>
     <div>
     <div align="center">FORMUL�RIO DE PROVID�NCIAS</div>
     <div align="center">SISTEMA DA GARANTIA DA QUALIDADE DE CURSOS</div>
     <br>
<?php
      echo"<div><table id='rodape'><tr><td width='500'>Curso:<strong> $_SESSION[codCurso] ($_SESSION[nomeCurso]) </strong>  </td><td>Per�odo:<strong> $_SESSION[inicio]</strong> � <strong>$_SESSION[termino]</strong></td></tr></table></div>";

      $sql="Select fs.descricao, fs.idsecao, fs.sigla,
          Cast( fp.acao_executada As varchar(5000)) as acao_executada, Cast( fp.acao_recomendada As Varchar(5000))  as acao_recomendada, Cast( '' As Char(10))  as data
          from fp_providencia fp, fp_secao fs
            where fp.idcurso=$_SESSION[idCurso]
            and fp.idturma=$_SESSION[idTurma]
            and fS.idsecao = fp.idsecao
            union
       Select fs.descricao, fs.idsecao, fs.sigla,
              Cast( '' As varchar(5000)) as acao_executada, Cast( '' As Varchar(5000))  as acao_recomendada, Cast( '' As Char(10))  as data
       from fp_secao fs
       where fs.Idsecao not in
       (Select fs.idsecao
             from fp_secao fs, fp_providencia fp
              where fp.idcurso=$_SESSION[idCurso]
              and fp.idturma=$_SESSION[idTurma]
              and fS.idsecao = fp.idsecao )";
      $resSql=ibase_query($conexao,$sql);
      $dataAtual=date("d.m.yy",time() );
      while($acaoRecomendada=ibase_fetch_assoc($resSql))
      {
         $contSpan++;
         $tit=$acaoRecomendada[IDSECAO];
         if($acaoRecomendada[DATA])
            $dataParecer=$f->formatarData($acaoRecomendada[DATA]);
         echo"<br><br>";
         echo"<div class='parecer'>";
         echo"<div id='titulo1'><strong><div id='$tit'>$acaoRecomendada[DESCRICAO]($acaoRecomendada[SIGLA])</div> </strong></div>";
         echo"<div id='recomendada'><strong>A��o Recomendada: </strong><div id='rec$contSpan'>$acaoRecomendada[ACAO_RECOMENDADA]</div><br></div>";
         echo"<div id='executada'><strong>A��o Executada: </strong><div id='exec$contSpan'>$acaoRecomendada[ACAO_EXECUTADA]</div><br></div>";
         if($acaoRecomendada[IDENTIDADE]==$_SESSION[identidadeUsuario]||$acaoRecomendada[IDENTIDADE]=="")
         {
?>
            <div><table id='rodape'><tr><td width='450'><strong>Por: </strong><?=$acaoRecomendada[NOME]?></td><td width='150'><strong>Data: </strong><?=$dataParecer?> </td><td><input type='button' value='D� parecer' onclick='alterarParecer("rec<?=$contSpan?>","exec<?=$contSpan?>","<?=$tit?>")'></td></tr></table></div>
<?php
         }
         else
         {
            echo"<div><table id='rodape'><tr><td width='450'><strong>Por: </strong>$acaoRecomendada[NOME]</td><td><strong>Data: </strong>$dataParecer</td></tr></table></div>";
         }
         echo"</div>";
      }

?>

<?php 
 	   $sql= "Select * from fp_secao";
          $respostaSecao= ibase_query($conexao, $sql);
	   
?>  

      <form method="POST" name="parecer" action="addParecer.php">
      <br><br>

      <div id="parecer" class='parecer' >
       <p id="titulo2">D� seu parecer</p>
         <div id="formulario1">

         <select size="1" name="divisao" id="divisao" >
           <option id="tit0">-----------</option>
  	    <?while($secao=ibase_fetch_assoc($respostaSecao)){
              echo " <option value='$secao[IDSECAO]' id='tit$secao[IDSECAO]'>$secao[DESCRICAO]- $secao[SIGLA] </option>";
	    }?>
         </select>
         <br>
         <br>
         A��o Recomendada
         <br>
         <textarea rows="3" cols="40" name="txRecomendada" id="txRecomendada" ></textarea>
         <br>
         <br>
         A��o Executada
         <br>
         <textarea rows="3" cols="40" name="txExecutada" id="txExecutada" ></textarea>
         <input type="hidden" value="" name="vazio" id="vazio">
         <input type="hidden" value="" name="secaoAtual" id="secaoAtual">
         <input type="hidden" value="<?=$dataAtual?>" name="dataAtual" id="dataAtual">
         <input type="button" value="Postar" onclick="addParecer()">
         </div>
      </div>
    </form>
    </div>
   </div>

   <div id="div_relatorio" class="conteudo" style="display: none">
<?php
        //---
        //--- Tratamento do Cabecalho da Pagina
  if($_SESSION[dadosFicha])
  {
     if($_SESSION[idCurso])
     {
        //$_SESSION[dadosFicha]= $_POST[ListaDeFichas];
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

        //select para dados do curso :codcurso, nomecurso
        $sqlcurso = "Select CodCurso, NomeCurso
                     From Curso
                     where IDCURSO = $_SESSION[idCurso]";
        $resultadocurso = ibase_query($conexao, $sqlcurso);
        $curso = ibase_fetch_assoc($resultadocurso);
        $_SESSION[nomeCurso]=$curso[NOMECURSO];
        $_SESSION[codCurso] =$curso[CODCURSO];

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
           $_SESSION[postoInstrutor]=$Instrutor[POSTOGRADUACAO];
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
         //Pega a Identificacao do Instituto

         $sql_Configuracao="Select nome, divisao, subdivisao
                           From configuracao";

         $Res_Configuracao=ibase_query($conexao,$sql_Configuracao);
         $Configuracao=ibase_fetch_assoc($Res_Configuracao);

         //---
         //--- Cabecalho Inicial

         echo "<br/>";
         echo "<div id='titulo' class='BODY'>$Configuracao[NOME]</div>";
         echo "<p align='center'>$Configuracao[DIVISAO]</p>";
         echo "<p align='center'>$Configuracao[SUBDIVISAO]</p>";
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
                        <td width='820'style='font-size:10px'>Curso: <b style='font-size:10px'>$curso[CODCURSO] ($curso[NOMECURSO]) </b></td>
                      </tr>
                      <tr>
                         <td width='250' style='font-size:10px'>Turma: <b style='font-size:11px'> $_SESSION[turma] de $_SESSION[ano] </b></td>
                      </tr>
                      <tr>
                         <td width='500'style='font-size:10px'>Per�odo: <b style='font-size:11px'> $_SESSION[inicio] a $_SESSION[termino]  </b></td>
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
             $postoInt = rtrim($Instrutor[POSTOGRADUACAO]);
             $postoCoord = rtrim($Coordenador[POSTOGRADUACAO]);
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
                                <td width='200' style='font-size:10px'>Alunos no curso:<b style='font-size:11px'> $_SESSION[qdealunos] </b></td>
                              </tr>
                              <tr>
                                <td width='570'style='font-size:10px'>N�mero de questionarios respondidos : <b style='font-size:11px'>$cont_respondido </b></td>
                              </tr>
                            </table>
                       <div/><br>";
                    $postoInt = rtrim($Instrutor[POSTOGRADUACAO]);
               }
               else
               {
                  echo "<div><table>
                              <tr>
                                <td width='570'style='font-size:10px'>N�mero de participantes : <b style='font-size:11px'> $avaliadores[QDEALUNOS] </b></td>
                                <td width='200' style='font-size:10px'>Alunos no curso:<b style='font-size:11px'> $_SESSION[qdealunos] </b></td>
                              </tr>
                              <tr>
                                <td width='570'style='font-size:10px'>N�mero de questionarios respondidos : <b style='font-size:11px'>$cont_respondido </b></td>
                              </tr>
                            </table>
                       <div/>";
               }
            }
         }
     }
     echo "<p class='style2' align='left'>$Retorno</p>";
     if($cont_respondido>0)
     {
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
         echo "N/O-N�o Observado  | 1-Ruim  |   2-Regular  |   3-Bom  |   4-�timo | 5-Excelente  ";
         echo "<br><br>";

        //Verifica se foi respondido
        $sql_avaliado="select idcurso, idturma, idficha
                       from fa_resposta
                       where idcurso = $_SESSION[idCurso]
                       and idturma = $_SESSION[idTurma]
                       and idficha = $idFicha";
        $Res_avaliado=ibase_query($conexao, $sql_avaliado);
        if(ibase_fetch_assoc($Res_avaliado))
        {
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
               <td width="25" align="center"><div><b style='font-size:12px' >N/O</b></div></td>
               <td width="25" align="center"><div><b style='font-size:12px' >1</b></div></td>
               <td width="25" align="center"><div><b style='font-size:12px' >2</b></div></td>
               <td width="25" align="center"><div><b style='font-size:12px' >3</b></div></td>
               <td width="25" align="center"><div><b style='font-size:12px' >4</b></div></td>
               <td width="25" align="center"><div><b style='font-size:12px' >5</b></div></td>
               <td width="40" align="center"><div><b style='font-size:12px' >N� Obs</b></div></td>
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
                 $m_cont++;
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
                  $NO=0;

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
                         $NO=$NO+1;
                    else
                    if ($total[RESPOSTA]==1)
                        $VI_01=$VI_01+1;
                     else
                        if ($total[RESPOSTA]==2)
                            $VI_02=$VI_02+1;
                     else
                        if ($total[RESPOSTA]==3)
                            $VI_03=$VI_03+1;
                     else
                        if ($total[RESPOSTA]==4)
                            $VI_04=$VI_04+1;
                     else
                        if ($total[RESPOSTA]==5)
                            $VI_05=$VI_05+1;
                  }

                  //$m1=  $VI_01 * 1;
                  $m1=  $VI_01 * 1;
                  $m2=  $VI_02 * 2;
                  $m3=  $VI_03 * 3;
                  $m4=  $VI_04 * 4;
                  $m5=  $VI_05 * 5;

                  if($totalRep[QTD]==0)
                  {
                    $media_ajust=0;

                  }
                  else
                  {
                     $media = ($m1 + $m2 + $m3 + $m4 + $m5)/$totalRep[QTD];
                     $soma_media = $soma_media+ $media ;
                     $media_ajust=substr($media,0,4);
                  }

                  $Contador++;
                  $radio = $Itens['IDITEM'];
                  echo "<table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='770' class='caixa'>
                      <tr valign='rigth'>
                        <div><td width='510'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$Itens[IDITEM] - $Itens[DESCRICAO]</span></td></div>
                          <td width='30' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$NO</span></div></td>
                            <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_01</span></div></td>
                             <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_02</span></div></td>
                               <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_03</span></div></td>
                                <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_04</span></div></td>
                                  <td width='25' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #5D5D5D;'>$VI_05</span></div></td>
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
                   <div><td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&legenda=$legenda&nome=Img$_SESSION[dadosFicha]' ></td>";
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
              else
              {
                  ok=1;
              }

              return ok;
          }


          function verificando()
          {
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

          <br>
          <hr size='1'/>
          <br>
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
          while ($row =  ibase_fetch_assoc($ResGrafico))
          {
              $dados[$i]= array( $row[DESCRICAO],$aspas,$row[MEDIA]);
              $dadoa[$i]=str_pad($dados,  0  , "," ,  STR_PAD_LEFT);
              $aspas.="'',";
              $i++;
          }

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
        }
        else
        {
            echo "<br><br><br><br><span  style='color:#FF0000; font-size:15px;'>Nenhuma coment�rio cadastrado!</span>";
        }

         //>>   verificar a existencia de comentarios nesta etapa
         //>>
        //---
        //--- Tratamento do comentario de Critica de Aluno

        if ($idModelo == "00")     //--- Monta o comentario com rela��o ao Extrato
        {
            $sql_CriticaAluno = "select Disciplina, IdInstrutor, comentario
                                 From FA_CriticaEspontanea
                                 where IDCURSO= $_SESSION[idCurso]
                                 and IDTURMA= $_SESSION[idTurma]
                                and Funcao = 'ALUNO'";
            $ResCriticaAluno = ibase_query($conexao, $sql_CriticaAluno);

            $VI_Critica= 1;
            while ($dado_Critica =  ibase_fetch_assoc($ResCriticaAluno))
            {
               if ($VI_Critica == 1)
               {
                  echo "<hr>";
                  $VI_Critica= 2;
               }

               if ($dado_Critica[DISCIPLINA] != '000000')
               {
                  $sql_Disciplina = "Select CodMateria, NomeMateria
                                     From MateriaCurso
                                     where idcurso = $_SESSION[idCurso]
                                     and CodMateria = '$dado_Critica[DISCIPLINA]'";
                  $ResDisciplina = ibase_query($conexao, $sql_Disciplina);
                  $dado_Disciplina=ibase_fetch_assoc($ResDisciplina);

                  $Disciplina= '- Disciplina: '.$dado_Critica[DISCIPLINA].' - '.$dado_Disciplina[NOMEMATERIA].'<br>';
               }

               if (substr($dado_Critica[IDINSTRUTOR],0,6)!= '000000')
               {
                  $sql_Instrutor = "Select PostoGraduacao, NomeGuerra
                                    From Pessoa
                                    where Identidade = '$dado_Critica[IDINSTRUTOR]'";
                  $ResInstrutor = ibase_query($conexao, $sql_Instrutor);
                  $dado_Instrutor=ibase_fetch_assoc($ResInstrutor);
                  $Docente= '    - Docente: '.$dado_Instrutor[POSTOGRADUACAO].' '.$dado_Instrutor[NOMEGUERRA].'<br>';
               }

               if($dado_Critica[COMENTARIO])
               {
                  $binfo = ibase_blob_info($dado_Critica['COMENTARIO']);
                  $bopen = ibase_blob_open($dado_Critica['COMENTARIO']);
                  $Retorno= $f-> TrataEnter(ibase_blob_get($bopen, $binfo[0]));

                  echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                          <tr>
                            <td width = '450' class = 'style3'>&nbsp;$VI_Cont $Disciplina $Docente<br/>
                                                                     $Retorno <br/>
                                </tr>
                              </table>";
               }
               $VI_Cont++;
            }
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
         //--- Tratamento do comentario de Critica de Instrutor

         if ($idModelo == "00")     //--- Monta o comentario com rela��o ao Extrato
         {
            $sql_CriticaAluno = "select Disciplina, IdInstrutor, comentario
                                   From FA_CriticaEspontanea
                                   where IDCURSO= $_SESSION[idCurso]
                                   and IDTURMA= $_SESSION[idTurma]
                                   and Funcao = 'INSTRUTOR'";
            $ResCriticaAluno = ibase_query($conexao, $sql_CriticaAluno);

            $VI_Critica= 1;
            while ($dado_Critica =  ibase_fetch_assoc($ResCriticaAluno))
            {
               if ($VI_Critica == 1)
               {
                  echo "<hr>";
                  $VI_Critica= 2;
               }

               if ($dado_Critica[DISCIPLINA] != '000000')
               {
                  $sql_Disciplina = "Select CodMateria, NomeMateria
                                     From MateriaCurso
                                     where idcurso = $_SESSION[idCurso]
                                     and CodMateria = '$dado_Critica[DISCIPLINA]'";
                  $ResDisciplina = ibase_query($conexao, $sql_Disciplina);
                  $dado_Disciplina=ibase_fetch_assoc($ResDisciplina);

                  $Disciplina= '- Disciplina: '.$dado_Critica[DISCIPLINA].' - '.$dado_Disciplina[NOMEMATERIA].'<br>';
               }

               if (substr($dado_Critica[IDINSTRUTOR],0,6)!= '000000')
               {
                  $sql_Instrutor = "Select PostoGraduacao, NomeGuerra
                                    From Pessoa
                                    where Identidade = '$dado_Critica[IDINSTRUTOR]'";
                  $ResInstrutor = ibase_query($conexao, $sql_Instrutor);
                  $dado_Instrutor=ibase_fetch_assoc($ResInstrutor);
                  $Docente= '    - Docente: '.$dado_Instrutor[POSTOGRADUACAO].' '.$dado_Instrutor[NOMEGUERRA].'<br>';
               }

               if($dado_Critica[COMENTARIO])
               {
                  $binfo = ibase_blob_info($dado_Critica['COMENTARIO']);
                  $bopen = ibase_blob_open($dado_Critica['COMENTARIO']);
                  $Retorno= $f-> TrataEnter(ibase_blob_get($bopen, $binfo[0]));

                  echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                          <tr>
                            <td width = '450' class = 'style3'>&nbsp;$VI_Cont $Disciplina $Docente<br/>
                                                                     $Retorno <br/>
                                </tr>
                              </table>";
               }
               $VI_Cont++;
            }
         }

             //---
            //--- Tratamento do comentario do Coordenador

            $sql_Complemento = "select Disciplina, descdisciplina, Identidade, comentario
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
               $sql_Pessoa= "select nomeGuerra, PostoGraduacao
                                From pessoa
                                 where Identidade = '$row[IDENTIDADE]'";
               $ResPessoa = ibase_query($conexao, $sql_Pessoa);
               $dado_Pessoa=ibase_fetch_assoc($ResPessoa);

               if($row[COMENTARIO])
               {
                  if ($row[DISCIPLINA] != "000000")
                  {
                     echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                             <tr>
                                <td width = '450' class = 'style3'>&nbsp;$VI_Cont - Coordenador $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA] <br><br>
                                                                         Disciplina - $row[DISCIPLINA] - $row[DESCDISCIPLINA] <br><br>
                                                                         $row[COMENTARIO] <br/><br/>
                            </tr>
                         </table>";
                  }
                  else
                  {
                     echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                             <tr>
                                <td width = '450' class = 'style3'>&nbsp;$VI_Cont - Coordenador $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA] <br>
                                                                         $row[COMENTARIO] <br/><br/>
                                  </tr>
                         </table>";
                  }
                  $VI_Cont++;
               }
            }

             //---
            //--- Tratamento do comentario de Critica do Coordenador

            if ($idModelo == "00")     //--- Monta o comentario com rela��o ao Extrato
            {
               $sql_CriticaAluno = "select Disciplina, IdInstrutor, IdCriticador, comentario
                                      From FA_CriticaEspontanea
                                      where IDCURSO= $_SESSION[idCurso]
                                      and IDTURMA= $_SESSION[idTurma]
                                      and Funcao = 'COORDENADOR'";
               $ResCriticaAluno = ibase_query($conexao, $sql_CriticaAluno);

               $VI_Critica= 1;
               while ($dado_Critica =  ibase_fetch_assoc($ResCriticaAluno))
               {
                  if ($VI_Critica == 1)
                  {
                     echo "<hr>";
                     $VI_Critica= 2;
                  }

                  $sql_Pessoa= "select nomeGuerra, PostoGraduacao
                                From pessoa
                                where Identidade = '$dado_Critica[IDCRITICADOR]'";
                  $ResPessoa = ibase_query($conexao, $sql_Pessoa);
                  $dado_Pessoa=ibase_fetch_assoc($ResPessoa);

                  if ($dado_Critica[DISCIPLINA] != '000000')
                  {
                     $sql_Disciplina = "Select CodMateria, NomeMateria
                                        From MateriaCurso
                                        where idcurso = $_SESSION[idCurso]
                                        and CodMateria = '$dado_Critica[DISCIPLINA]'";
                     $ResDisciplina = ibase_query($conexao, $sql_Disciplina);
                     $dado_Disciplina=ibase_fetch_assoc($ResDisciplina);

                     $Disciplina= '- Disciplina: '.$dado_Critica[DISCIPLINA].' - '.$dado_Disciplina[NOMEMATERIA].'<br>';
                  }

                  if (substr($dado_Critica[IDINSTRUTOR],0,6)!= '000000')
                  {
                     $sql_Instrutor = "Select PostoGraduacao, NomeGuerra
                                       From Pessoa
                                       where Identidade = '$dado_Critica[IDINSTRUTOR]'";
                     $ResInstrutor = ibase_query($conexao, $sql_Instrutor);
                     $dado_Instrutor=ibase_fetch_assoc($ResInstrutor);
                     $Docente= '    - Docente: '.$dado_Instrutor[POSTOGRADUACAO].' '.$dado_Instrutor[NOMEGUERRA].'<br>';
                  }

                  if($dado_Critica[COMENTARIO])
                  {
                     $binfo = ibase_blob_info($dado_Critica['COMENTARIO']);
                     $bopen = ibase_blob_open($dado_Critica['COMENTARIO']);
                     $Retorno= $f-> TrataEnter(ibase_blob_get($bopen, $binfo[0]));

                     echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                             <tr>
                               <td width = '450' class = 'style3'>&nbsp;$VI_Cont  - Coordenador $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA] <br><br>
                                                                        $Disciplina $Docente<br/>
                                                                        $Retorno <br/>
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
        }
        else
        {
            echo "<hr size='1'/>";
            echo "<span style= 'font-size:13px; color:#FF0000';>Nenhum question�rio foi respondido!</span>";
        }
     }
     else
     {
         echo "Por falha no navegador o PDF n�o foi gerado (comum para o Chrome),volte ao relat�rio e precione F5 para ger�-lo.";
     }
?>
   </div>


  </td>
 </tr>
</table>
</body>
</html>
