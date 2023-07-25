<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : MontaPagina.php                                //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página que//
  //                             mostra as respostas dos alunos na Ficha de     //
  //                             Avaliação de Curso.                            //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
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
   require_once("verifica_sessao.php");
   require_once("Funcoes/Funcoes.php");
   require("Funcoes/conecta.inc");
   
   $f= new Funcao();
   include "fpdf16/fpdf.php";
   include "gerarPDF.php";

    //---
   //--- Seta a FA_Avaliacao com o Statusenviado - Lido
   function marcarStatus($status)
   {
      require("Funcoes/conecta.inc");
      $sql_status="update FA_AVALIACAO set
                               STATUS = $status
                               WHERE IDCURSO = $_SESSION[idCurso]
                               AND IDTURMA = $_SESSION[idTurma]
                               AND IDFICHA = $_SESSION[idFicha]
                               AND IDENTIDADE like '%$_SESSION[identidade]%'
                               AND DISCIPLINA = '$_SESSION[codDisciplina]'";
      $Res_status=ibase_query($conexao, $sql_status);

   }

   function LimpaGrafico($conexao)
   {
      $sql_Grafico = "Delete from FA_Grafico";
      $ResGrafico = ibase_query($conexao, $sql_Grafico);
   }



   $_SESSION[statu]=$_POST[status];
   if ($_SESSION[statu])
   {
        if($_SESSION[statu]=="Lida")
        {
           marcarStatus(1);
        }
        if($_SESSION[statu]=="Enviada")
        {
           marcarStatus(2);
        }
   }

?>

   <NOSCRIPT>
       Este navegador não compreende os scripts que se estão executando,
       você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
   </NOSCRIPT>
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   <html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="apc.css" rel="stylesheet" type="text/css">
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>

   <script>
      //Funções que faz tratamento da textearea
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
    
      function contaComentario(){
         document.form_Complemento.coment.value=document.form_Complemento.comentario.value.length
      }
      //FIM - Funções que faz tratamento da textearea

      function showHide (ID)
      {
         if (document.getElementById(ID).style.display == "none")
         {
            document.getElementById(ID).style.display= "";
            document.getElementById(ID + "span").innerHTML= "<img style='cursor: pointer;' src='min.gif' onclick='showHide(ID);' width='16' height='14' border='0'>";
         }
         else
         {
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
         for (i=0;i<document.Form_Perguntas.elements.length;i++)
         {
            if(document.Form_Perguntas.elements[i].type == "checkbox")
            {
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
         //parent.location = "email.php?arquivo="+a+"&email="+e;
         window.open("email.php?arquivo="+a+"&email="+e,width=50,height=50);
      }
   
   </script>
   </head>
   <body>
   <div id="corpo">
   <div id="barra" align="left"><a href='ListaDeAvaliacoes_p.php' target='_self' > << Mudar de Ficha de Avaliação</a></div>

<?php
   //---
   //--- Tratamento do Cabecalho da Pagina
   if($_SESSION[dadosFicha])
   {
      if($_SESSION[idCurso])
      {
         $cont = strlen($_SESSION[dadosFicha]);
         $idModelo = substr($_SESSION[dadosFicha],0,2);                //COLETA DADO A SER ENVIADO PRA INSERÇÃO
         if ($idModelo == "00")
         {
            $idFicha = "01";
         }
         else
         {
            $idFicha = substr($_SESSION[dadosFicha],0,2);                //COLETA DADO A SER ENVIADO PRA INSERÇÃO
         }

         $_SESSION[codDisciplina] = substr($_SESSION[dadosFicha],2,6);//COLETA DADO A SER ENVIADO PRA INSERÇÃO
         $_SESSION[espacoEsq] = substr($_SESSION[dadosFicha],8,1);    //COLETA DADO A SER ENVIADO PRA INSERÇÃO
         $_SESSION[espacoDir] = substr($_SESSION[dadosFicha],9,1);    //COLETA DADO A SER ENVIADO PRA INSERÇÃO
         $_SESSION[identidade] = substr($_SESSION[dadosFicha],10);    //COLETA DADO A SER ENVIADO PRA INSERÇÃO
         $_SESSION[idFicha]=$idFicha;

         //trata identidade
         $identidade =$_SESSION[identidade];
         $contIdentidade = strlen($identidade);
         $paramEsq = $_SESSION[espacoEsq] + $contIdentidade ;
         $paramDir = $_SESSION[espacoDir] + $contIdentidade ;
         $identidadeComEsq= str_pad("$identidade",$paramEsq," ", STR_PAD_LEFT) ;
         $identidadeCompleta= str_pad("$identidadeComEsq",20," ", STR_PAD_RIGHT) ;
         $_SESSION[identidadeCompleta]="$identidadeCompleta";

         //select para dados do curso :codcurso, nomecurso
         $sqlcurso = "Select CodCurso, NomeCurso
                      From Curso
                      where IDCURSO = $_SESSION[idCurso]";
         $resultadocurso = ibase_query($conexao, $sqlcurso);
         $curso = ibase_fetch_assoc($resultadocurso);

         $_SESSION[nomeCurso]=$curso[NOMECURSO];
         $_SESSION[codCurso] =$curso[CODCURSO];

         //select para email do avaliado :email
         $sqlemail ="Select  email, postoGraduacao, nomeGuerra
                     From pessoa
                     where identidade ='$identidadeCompleta'";
         $resultadoemail = ibase_query($conexao, $sqlemail);
         $email = ibase_fetch_assoc($resultadoemail);
         $_SESSION[postoGraduacao]=$email[POSTOGRADUACAO];
         $_SESSION[nomeAvaliado]=$email[NOMEGUERRA];

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
            $_SESSION[nomeMateria]=$Disciplina[NOMEMATERIA];
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
         //Pega numero de aluno participantes da avaliação

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

         $pdf=new pdf();   //Instância da classe pdf
         $pdf->Open();    //Abre arquivo pdf
         $pdf->AddPage();

         //---
         //--- Cabecalho Inicial   no pdf
         $pdf->SetFont('Arial','B',11);     //Fonte dos cabeçalho
         $pdf->SetDrawColor(255, 255, 255);  //Cor das grades da tabela
         $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
         srand(microtime()*1000000);
         $pdf->SetAligns('C');
         $pdf->Row(array("$Configuracao[NOME]")); //Linha dos tópicos
         $pdf->SetFont('Arial','',11);     //Fonte dos sub-cabeçalho
         $pdf->Row(array("$Configuracao[DIVISAO]")); //Linha dos tópicos
         $pdf->Row(array("$Configuracao[SUBDIVISAO]")); //Linha dos tópicos
         $pdf->Ln();
         $pdf->SetFont('Arial','B',10);
         $pdf->Row(array("$Modelo[CABECALHO]")); //Linha dos tópicos
         $pdf->Ln();

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
                        <td width='820'style='font-size:10px'>Nome do curso: <b style='font-size:10px'>$curso[NOMECURSO] -  $curso[CODCURSO] </b></td>
                      </tr>
                      <tr>
                         <td width='250' style='font-size:10px'>Turma: <b style='font-size:11px'> $Periodo[TURMA] de $Periodo[ANO] </b></td>
                      </tr>
                      <tr>
                         <td width='500'style='font-size:10px'>Período: <b style='font-size:11px'> $Periodo[INICIO] a $Periodo[TERMINO]  </b></td>
                         <td width='270' style='font-size:10px'>Data Avaliação:<b style='font-size:11px'> $Data[DATAAVALIACAO] </b></td>
                      </tr>
                    </table>
               <div/>";

         //---
         //--- Cabecalho Inicial   no pdf
         $pdf->SetFont('Arial','',10);  //Fonte das linha subsequentes aos tópicos
         $pdf->SetAligns('L');
         $pdf->SetWidths(array(30,150));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
         srand(microtime()*1000000);
         $pdf->Row(array("Nome do curso: ","$curso[NOMECURSO] -  $curso[CODCURSO] "));
         $pdf->SetWidths(array(20,150));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
         $pdf->Row(array("Turma: ","$Periodo[TURMA] de $Periodo[ANO] "));
         $pdf->SetWidths(array(20,80,30,40));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
         $pdf->Row(array("Período: ","$Periodo[INICIO] a $Periodo[TERMINO]  "," 	Data Avaliação: ","$Data[DATAAVALIACAO]"));


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
            //---
            //--- parte do cabeçalhon no pdf
            $pdf->SetWidths(array(30,150));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
            $pdf->Row(array("Coordenador : ","$postoCoord $Coordenador[NOMEGUERRA] "));
            $pdf->SetWidths(array(35,145));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
            $pdf->Row(array("Instrutor Avaliado : ","$postoInt $Instrutor[NOMEGUERRA] "));
            $pdf->Ln();
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
               //--- parte do cabeçalho no pdf
               $pdf->SetWidths(array(30,150));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
               $pdf->Row(array("Instrutor: ","$Instrutor[NOMEGUERRA] "));
               $pdf->SetWidths(array(35,100));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
               $pdf->Row(array("Disciplina Avaliada: ","$Disciplina[CODMATERIA] - $Disciplina[NOMEMATERIA] "));
               $pdf->Ln();
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
                             <td width='570'style='font-size:10px'>Número de participantes : <b style='font-size:11px'> $avaliadores[QDEALUNOS] </b></td>
                             <td width='200' style='font-size:10px'>Alunos no curso:<b style='font-size:11px'> $Periodo[QDEALUNOS] </b></td>
                           </tr>
                           <tr>
                             <td width='570'style='font-size:10px'>Número de questionarios respondidos : <b style='font-size:11px'>$cont_respondido </b></td>
                           </tr>
                         </table>
                    <div/><br>";
                  $postoInt = rtrim($Instrutor[POSTOGRADUACAO]);
                  //--- parte do cabeçalhon no pdf
                  $pdf->SetWidths(array(35,100));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  $pdf->Row(array("Instrutor Avaliado: ","$postoInt $Instrutor[NOMEGUERRA]  "));
                  $pdf->SetWidths(array(35,80));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  $pdf->Row(array("Disciplina Avaliada: ","$Disciplina[CODMATERIA] - $Disciplina[NOMEMATERIA]"));
                  $pdf->SetWidths(array(45,85,30,10));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  $pdf->Row(array("Número de participantes : ","$avaliadores[QDEALUNOS]  " ,"Alunos no curso: ","$Periodo[QDEALUNOS] "));
                  $pdf->SetWidths(array(65,10));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  $pdf->Row(array("Número de questionarios respondidos: ","$cont_respondido "));
                  $pdf->Ln();
               }
               else
               {
                  echo "<div><table>
                              <tr>
                                <td width='570'style='font-size:10px'>Número de participantes : <b style='font-size:11px'> $avaliadores[QDEALUNOS] </b></td>
                                <td width='200' style='font-size:10px'>Alunos no curso:<b style='font-size:11px'> $Periodo[QDEALUNOS] </b></td>
                              </tr>
                              <tr>
                                <td width='570'style='font-size:10px'>Número de questionarios respondidos : <b style='font-size:11px'>$cont_respondido </b></td>
                              </tr>
                            </table>
                       <div/><br><br>";
                  $pdf->SetWidths(array(50,10,110,10));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  $pdf->Row(array("Número de participantes : ","$avaliadores[QDEALUNOS]  " ,"Alunos no curso: ","$Periodo[QDEALUNOS] "));
                  $pdf->SetWidths(array(50,130));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  $pdf->Row(array("Número de questionarios respondidos: ","$cont_respondido "));
                  $pdf->Ln();
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
?>
         <form id='Form_Perguntas' name='Form_Perguntas' method='post' action="montapagina.php">
         <div id="barra" align="right">
         <input name="status" type="submit" value="Lida"/>
         <input name="status" type="submit" value="Enviada"/>
         <a href="JavaScript:atualizarPagina();" target='_self' ><img src="image/gerar_PDF.png" border="0" width="30" height="30" title="Gerar PDF"></a>
         <input name="enviaEmail" type="button" value="Email" onclick="enviarEmail('<?=$_SESSION[dadosFicha]?>','<?=$email[EMAIL]?>')" DISABLED/></div>
<?php
         echo "Os valores de avaliação correspondem aos seguintes conceitos:";
         echo "<br><br>";
         echo "N/O-Não Observado  | 1-Ruim  |   2-Regular  |   3-Bom  |   4-Ótimo | 5-Excelente  ";
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
            $pdf->SetFont('Arial','B',10);
            $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
            $pdf->Row(array("N/O-Não Observado   1-Péssimo    2-Ruim    3-Regular    4-Bom   5-Ótimo"));
            $pdf->Ln();
            $pdf->SetFillColor(204,204,204);

            $Contador=0;
            $legenda=0;   //  se o numero de topicos for maior que três label y fica na vertical

            //põe resultado no array e exibe questionario
            while ($Topicos = ibase_fetch_assoc($res_Topicos))
            {
               $pdf->SetFont('Times','B',14);     //Fonte dos tópicos
               $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
               $pdf->SetWidths(array(106,11,6,6,6,6,6,17,16));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
               srand(microtime()*1000000);
               $pdf->SetAligns('L');
               $pdf->Row(array("          $Topicos[DESCRICAO]","N/O","1","2","3","4","5","Nº Obs","Média")); //Linha dos tópicos

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
               <td width="40" align="center"><div><b style='font-size:12px' >Nº Obs</b></div></td>
               <td width="50" align="center"><div><b style='font-size:12px' >Média</b></div></td>
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
                               and disciplina='$_SESSION[codDisciplina]'
                               and resposta<>0";
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

                  //linhas da tabela em pdf
                  $pdf->SetFont('Arial','',11);  //Fonte das linha subsequentes aos tópicos
                  $pdf->SetWidths(array(106,11,6,6,6,6,6,17,16));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  srand(microtime()*1000000);
                  $pdf->Row(array("$Itens[IDITEM] - $Itens[DESCRICAO]","$NO"," $VI_01 ","$VI_02","$VI_03","$VI_04","$VI_05","$totalRep[QTD]","$media_ajust")); //Preenchimento das tabelas

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

               //monta as linha com as medias do topicos
               $pdf->SetFont('Times','B',12);     //Fonte dos tópicos
               $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
               $pdf->SetWidths(array(164,16));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
               srand(microtime()*1000000);
               $mediaPDF = substr($media_topico[$m_cont],0,4);
               $pdf->Row(array("Média do Tópico","$mediaPDF")); //Linha dos tópicos
               $pdf->Ln();  //Pula linha

?>
               <table style:border-bottom:1px solid #ccc; border='1' cellspacing='0' cellpadding='0' width='770' class='caixa'>
                 <tr>
                  <td width="720" align="left"><div><b style='font-size:12px' >Média do Tópico</b></div></td>
                  <td width="50" align="center"><div><b style='font-size:12px; color:red' ><?=substr($media_topico[$m_cont],0,4)?></b></div></td>
                 </tr>
               </table>

<?



               //----------------------------------TESTE




               $cont=0;
               $sqlCometTopico="select comentario from fa_comentariotopico
                                                       where idcurso =$_SESSION[idCurso]
                                                       and idturma=$_SESSION[idTurma]
                                                       and idficha = $idFicha
                                                       and idtopico=$Topicos[IDTOPICO]
                                                       and identidade='$_SESSION[identidadeCompleta]'
                                                       and disciplina='$_SESSION[codDisciplina]'";

               $resultComentTopico= ibase_query($conexao, $sqlCometTopico);
               echo "<br><table border='0' cellspacing='0' cellpadding='0' width='770' bgcolor='#cccccc' bordercolor='#FFFFFF' >
               <tr><td><b style='font-size:12px' >Comentários do tópico '$Topicos[DESCRICAO]'</b></td></tr></table> ";
               
               $pdf->SetFont('Times','B',11);     //Fonte dos tópicos
               $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
               $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
               srand(microtime()*1000000);
               $pdf->Row(array("Comentários do tópico '$Topicos[DESCRICAO]'"));
               
               while($comentTopico=ibase_fetch_assoc($resultComentTopico))
               {
                  $cont++;if($cont%2==0)$cor="#FFFFFF";else$cor="#F8F8F8";
                  echo "<table width='770' bgcolor='$cor'>
                           <tr >
                            <td class='style3'>&nbsp;$cont - $comentTopico[COMENTARIO] <br/><br/>
                           </tr>
                        </table>";

                  $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                  $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                  $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  srand(microtime()*1000000);
                  $pdf->Row(array("$cont - $comentTopico[COMENTARIO]"));

               }
               $pdf->Ln();  //Pula linha
               $pdf->Ln();  //Pula linha





               //----------------------------------------TESTE










               echo "</div><br><br>";
               
               echo "<input type='hidden' size='20' name='contador' value='$Contador'>";
            }

            //gera o gráfico
            ini_set("allow_url_fopen",1);
            echo "<table cellspacing='0' cellpadding='0' border '1' width='100%'>
                  <div id ='$row_Res_sql_nomeTop[DESCRICAO]'>
                     <tr>
                      <div><td>&nbsp; <img src='MontaGraficoBarra.php?sessao=$Indice&tipo=$tipo&legenda=$legenda&nome=Img$_SESSION[dadosFicha]' ></td>";
            echo "   </tr>
                  </div>
            </table>";
            echo "<input type='hidden' size='20' name='titulo' value='$row_Res_sql_nomeItem[DESCRICAO]'>";
            echo "<hr size='1'/>";
            ini_set("allow_url_fopen",0);
   
            //nome do arquivo .png com grafico
            $arquivoImg = "Img$_SESSION[dadosFicha].PNG";
            $_SESSION[imgLegivel]=false;

            //verifica se a imagem foi criada e é legivel
            if(!is_readable("imagem/$arquivoImg"))
            {
               $_SESSION[imgLegivel]=false;
            }
            else
            {
               $_SESSION[imgLegivel]=true;
            }
            if($_SESSION[imgLegivel]==true)
            {
               $pdf->Image("imagem/$arquivoImg", null,null,180,120,'PNG');  //Imprimi em pdf o arquivo local $arquivoImg
            }

?>
            </form>
            <script>

            //Funções que verificam se radios foram clicados
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

            function verificando()
            {
               var P1=verificaFORM1();

               if(P1 == 0 )
                  alert('Certifique-se de que respondeu todas questões!');
               if(P1 == 1 )
               {
                  document.Form_Perguntas.submit();
                  document.form_Complemento.submit();
               }

            }
            //FIM - Funções que verificam se radios foram clicados
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
                             and c.identidade='$_SESSION[identidadeCompleta]'
                             order by idcurso, idturma, idficha";
            }
            $ResComplemento = ibase_query($conexao, $sql_Complemento);

            if ($idModelo == "00")     //--- Monta o comentario com relação ao Extrato
            {
               echo "<table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
                    <tr>
                        <td width = '450' class = 'style3' align='center'> &nbsp; <strong> COMENTÁRIOS ALUNOS</strong><br/><br/>
                    </tr>
               </table>";
               //
               //inicia a inserção dos comentários
               $pdf->Ln();
               $pdf->Ln();
               $pdf->SetFont('Times','B',14);     //Fonte dos tópicos
               $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
               $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
               srand(microtime()*1000000);
               $pdf->Row(array("COMENTÁRIOS ALUNOS")); //Linha dos tópicos
             
            }
            else
            {
               echo "<table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
                    <tr>
                     <td width = '450' class = 'style3' align='center'> &nbsp; <strong> COMENTÁRIOS</strong><br/><br/>
                    </tr>
               </table>";
               //
               //inicia a inserção dos comentários
               $pdf->Ln();
               $pdf->Ln();
               $pdf->SetFont('Times','B',14);     //Fonte dos tópicos
               $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
               $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
               srand(microtime()*1000000);
               $pdf->Row(array("COMENTÁRIOS")); //Linha dos tópicos
            }

            $VI_Cont= 1;

            while ($row =  ibase_fetch_assoc($ResComplemento))
            {
               if($row[COMENTARIO])
               {
                  if ($idModelo == "00")     //--- Monta o comentario com relação ao Extrato
                  {
                     if ($row[DISCIPLINA] != "000000")    // mostra a disciplina e o instrutor no extrato
                     {
                        echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                          <tr>
                            <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[DISCIPLINA] - $row[DESCDISCIPLINA]<br/>
                                                                     $row[POSTOGRADUACAO] - $row[NOMEGUERRA]<br/><br/>
                                                                     $row[COMENTARIO] <br/><br/>
                            </tr>
                        </table>";
                        //
                        //PDF
                        $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                        $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                        $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                        srand(microtime()*1000000);
                        $pdf->Row(array("$VI_Cont - $row[DISCIPLINA] - $row[DESCDISCIPLINA] - $row[POSTOGRADUACAO] - $row[NOMEGUERRA] - $row[COMENTARIO]"));
                     }
                     else
                     {
                        echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                           <tr>
                            <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[COMENTARIO] <br/><br/>
                           </tr>
                        </table>";
                        //
                        //PDF
                        $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                        $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                        $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                        srand(microtime()*1000000);
                        $pdf->Row(array("$VI_Cont - $row[DISCIPLINA] - $row[DESCDISCIPLINA] - $row[COMENTARIO]"));
                     
                     }
                  }
                  else
                  {
                     echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                       <tr>
                           <td width = '450' class = 'style3'>&nbsp;$VI_Cont - $row[COMENTARIO] <br/><br/>
                       </tr>
                     </table>";
                     //
                     //PDF
                     $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                     $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                     $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                     srand(microtime()*1000000);
                     $pdf->Row(array("$VI_Cont - $row[COMENTARIO]"));
                  
                  }
                  $VI_Cont++;
               }
            }
         }
         else
         {
            echo "<br><br><br><br><span  style='color:#FF0000; font-size:15px;'>Nenhuma comentário cadastrado!</span>";
            //
            //PDF
            $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
            $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
            $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
            srand(microtime()*1000000);
            $pdf->Row(array("Nenhum Comentários"));
         }
         //>>   verificar a existencia de comentarios nesta etapa
         //>>

         //---
         //--- Tratamento do comentario de Critica de Aluno

         if ($idModelo == "00")     //--- Monta o comentario com relação ao Extrato
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
                  $_SESSION[nomeMateria]=$dado_Disciplina[NOMEMATERIA];
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

                  //
                  //PDF
                  $pdf->SetFont('Arial','',14);     //Fonte dos tópicos
                  $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                  $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  srand(microtime()*1000000);
                  $pdf->Row(array("$VI_Cont - $Disciplina $Docente $Retorno"));
            
               }
               $VI_Cont++;
            }
         }

         //---
         //--- Tratamento do comentario do Instrutor sobre disciplina

         if ($idModelo == "00")      //--- Monta o comentario com relação ao Extrato
         {
            $sql_Complemento = "select Disciplina, descdisciplina, comentario
                          From FA_Comentario_View
                           where IDCURSO= $_SESSION[idCurso]
                           and IDTURMA= $_SESSION[idTurma]

                           and (IdFicha = 5)";
            // and disciplina= '$_SESSION[codDisciplina]'
            $ResComplemento = ibase_query($conexao, $sql_Complemento);

            echo "<table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
                   <tr>
                      <td width = '450' class = 'style3' align='center'> &nbsp; <strong> COMENTÁRIOS INSTRUTOR </strong><br/><br/>
                   </tr>
            </table>";
            //
            //PDF
            $pdf->Ln();
            $pdf->Ln();
            $pdf->SetFont('Times','B',14);     //Fonte dos tópicos
            $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
            $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
            srand(microtime()*1000000);
            $pdf->Row(array("COMENTÁRIOS INSTRUTOR")); //Linha dos tópicos

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
                  //
                  //PDF
                  $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                  $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                  $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                  srand(microtime()*1000000);
                  $pdf->Row(array("$VI_Cont - $row[DISCIPLINA] - $row[DESCDISCIPLINA] - $row[COMENTARIO]"));

                  $VI_Cont++;
               }
            }

            //---
            //--- Tratamento do comentario de Critica de Instrutor
            if ($idModelo == "00")     //--- Monta o comentario com relação ao Extrato
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
                      $_SESSION[nomeMateria]=$dado_Disciplina[NOMEMATERIA];
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
                     //
                     //PDF
                     $pdf->SetFont('Arial','',14);     //Fonte dos tópicos
                     $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                     $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                     srand(microtime()*1000000);
                     $pdf->Row(array("$VI_Cont - $Disciplina $Docente $Retorno"));
            
                  }
                  $VI_Cont++;
               }
            }

            //---
            //--- Tratamento do comentario do Coordenador sobre intrutor
            $sql_Complemento = "select Disciplina, descdisciplina, Identidade, comentario
                          From FA_Comentario_View
                           where IDCURSO= $_SESSION[idCurso]
                           and IDTURMA= $_SESSION[idTurma]

                           and (IdFicha = 2)";                     // and identidade='$_SESSION[identidadeCompleta]'
                           

            $ResComplemento = ibase_query($conexao, $sql_Complemento);

            echo "<table cellspacing='0' cellpadding='0' border '1' width='770' bgcolor='#cccccc'  >
                 <tr>
                    <td width = '450' class = 'style3' align='center'> &nbsp; <strong> Comentários do Coordenador sobre o Instrutor</strong><br/><br/>
                 </tr>
            </table>";

             //
             //PDF
             $pdf->Ln();
             $pdf->Ln();
             $pdf->SetFont('Times','B',14);     //Fonte dos tópicos
             $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
             $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
             srand(microtime()*1000000);
             $pdf->Row(array("COMENTÁRIOS COORDENADOR")); //Linha dos tópicos

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
                             <td width = '450' class = 'style3'>&nbsp;$VI_Cont - Instrutor $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA] <br><br>
                                                                   Disciplina - $row[DISCIPLINA] - $row[DESCDISCIPLINA] <br><br>
                                                                   $row[COMENTARIO] <br/><br/>
                          </tr>
                      </table>";
                      //
                      //PDF
                      $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                      $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                      $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                      srand(microtime()*1000000);
                      $pdf->Row(array("$VI_Cont - Coordenador $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA]
                                                                   Disciplina - $row[DISCIPLINA] - $row[DESCDISCIPLINA] $row[COMENTARIO]"));


                   
                   }
                   else
                   {
                      echo "<table cellspacing='0' cellpadding='0' border '1' width='770'>
                          <tr>
                            <td width = '450' class = 'style3'>&nbsp;$VI_Cont - Coordenador $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA] <br>
                                                                   $row[COMENTARIO] <br/><br/>
                          </tr>
                      </table>";
                      //
                      //PDF
                      $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                      $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                      $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                      srand(microtime()*1000000);
                      $pdf->Row(array("$VI_Cont - Coordenador $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA]
                                                                   Disciplina - $row[DISCIPLINA] - $row[DESCDISCIPLINA] $row[COMENTARIO]"));


                   
                   }
                   $VI_Cont++;
                }
             }

             //---
             //--- Tratamento do comentario de Critica do Coordenador
             if ($idModelo == "00")     //--- Monta o comentario com relação ao Extrato
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
                      $_SESSION[nomeMateria]=$dado_Disciplina[NOMEMATERIA];
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
                      //
                      //PDF
                      $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
                      $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
                      $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
                      srand(microtime()*1000000);
                      $pdf->Row(array("$VI_Cont - Coordenador $dado_Pessoa[POSTOGRADUACAO] $dado_Pessoa[NOMEGUERRA]
                                                                   Disciplina - $row[DISCIPLINA] - $row[DESCDISCIPLINA] $row[COMENTARIO]"));
                   }
                   $VI_Cont++;
                }
             }
   
             $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
             $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
             $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
             srand(microtime()*1000000);
             $pdf->Row(array("$VI_Cont - $row[COMENTARIO]"));


             //---
             //--- Pega o nome do Chefe da Secao de Avaliacao

             $sql_chefe="Select c.Sigla, c.PostoGraduacao, c.descCargo, c.nome
                                  From cargo_View c
                                  Where c.sigla = 'EAVC'";
             $Res_chefe = ibase_query($conexao, $sql_chefe);
             $chefe = ibase_fetch_assoc($Res_chefe);
    
             echo"<br/><br/><br/><br/><br/><br/>";
             echo "<div align='right'>
                    <p>$chefe[NOME]- $chefe[POSTOGRADUACAO] $sigla[DESCCARGO]</p>
                    <p> Chefe da $chefe[SIGLA]</p><br/>
             </div>";
              
         }
         else
         {
            echo  "Retorne a página anterior!";
            $pdf->SetFont('Arial','',11);     //Fonte dos tópicos
            $pdf->SetDrawColor(204, 204, 204);  //Cor das grades da tabela
            $pdf->SetWidths(array(180));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
            srand(microtime()*1000000);
            $pdf->Row(array("$VI_Cont - $row[COMENTARIO]"));
         }
  
         //salva o arquivo PDF
         $pdf->Output("pdf/Rel$_SESSION[dadosFicha].pdf",F); //Arquivb pdf de saida
      }
      else
      {
         echo "<hr size='1'/>";
         echo "<span style= 'font-size:13px; color:#FF0000';>Nenhum questionário foi respondido!</span>";
      }
   }
   else
   {
      echo "Por falha no navegador o PDF não foi gerado (comum para o Chrome),volte ao relatório e precione F5 para gerá-lo.";

   }


?>
<script>
   if(<?=$_SESSION[imgLegivel]?>==1)
   {
          with(document.Form_Perguntas){
              enviaEmail.disabled=false;
          }
    }
</script>
</body>
</html>

