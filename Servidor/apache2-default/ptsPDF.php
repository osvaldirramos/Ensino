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
   require_once("Funcoes/Funcoes.php");
   require("Funcoes/conecta.inc");

   $f= new Funcao();
   include "Funcoes/fpdf16/fpdf.php";
   include "Funcoes/gerarPDF.php";


   $idCurso=$_GET[IC];
   $idTurma=$_GET[IT];
   $semana=$_GET[S];
   $numeroSemana=$_GET[NS];
   $idCurso=$idCurso-33;
   $idTurma=$idTurma-33;
   
    error_reporting(0);

   //seleciona nome do curso
   $sql="select turma, ano from turma where idcurso=$idCurso and idturma=$idTurma";
   $resultadoTurma = ibase_query($conexao, $sql);
   $turma = ibase_fetch_assoc($resultadoTurma );

   //seleciona ano  da turma
   $sql="select codcurso, nomecurso from curso where idcurso=$idCurso";
   $resultadoCurso = ibase_query($conexao, $sql);
   $curso = ibase_fetch_assoc($resultadoCurso);

    //---
   // Tratamento para todoso PTS

   if($semana=='T')
   {
      $pdf=new pdf();   //Instância da classe pdf
      $pdf->Open();    //Abre arquivo pdf


       //seleciona tabela pts
      $sql="select * from CAD_PTS
              where idcurso=$idCurso and idturma=$idTurma
            Order By Semana";
      $resultadoPTS = ibase_query($conexao, $sql);

      while($pts = ibase_fetch_assoc($resultadoPTS)){

          $pdf->SetY(-10);
          $pdf->SetAutoPageBreak(5);
          $pdf->AddPage();

          //CABEÇALHO
          $pdf->SetFont('Times','B',10);
          $pdf->SetDrawColor(255, 255, 255);  //Cor das grades da tabela
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');
          $pdf->Row(array("INSTITUTO DE CONTROLE DO ESPAÇO AÉREO"));
          $pdf->Row(array("SEÇÃO DE EXECUÇÃO DE CURSOS"));
          $pdf->SetFont('Times','B',9);
          $pdf->Row(array("$curso[CODCURSO] - $curso[NOMECURSO]"));

          $pdf->SetFont('Times','B',9);
          $pdf->SetDrawColor(255, 255, 255);  //Cor das grades da tabela
                    $pdf->SetAligns('C');	
          $pdf->SetWidths(array(25,126,30));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');	   
          srand(microtime()*1000000);
          $pdf->Row(array("SEMANA: $pts[SEMANA]/$numeroSemana ", "                                PROGRAMA DE TRABALHO SEMANAL", "Turma: $turma[TURMA]/$turma[ANO]"));

          //SEGUNDA FEIRA
          $pdf->SetFont('Arial','B',10);
          $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
          $pdf->SetFillColor(0,0,0);
          $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');
          $pdf->Row(array("HORÁRIO", "                            TRABALHO ESCOLAR","          DOCENTE","     LOCAL"));
          $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
          $pdf->SetFont('Arial','B',10);
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');
          $pdf->Row(array("$pts[DIA_SEMANA_02] - $pts[DATA_02]"));
          $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
          $pdf->SetFont('Arial','',10);
          $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->Row(array("$pts[HORARIO_01_02]", "$pts[TRAB_ESCOLAR_01_02]","$pts[EQUIPE_01_02]","$pts[LOCAL_01_02]"));
          $pdf->Row(array("$pts[HORARIO_02_02]", "$pts[TRAB_ESCOLAR_02_02]","$pts[EQUIPE_02_02]","$pts[LOCAL_02_02]"));

          //TERÇA FEIRA
          $pdf->SetFont('Arial','B',10);
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');
          $pdf->Row(array("$pts[DIA_SEMANA_03] - $pts[DATA_03]"));
          $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
          $pdf->SetFont('Arial','',10);
          $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->Row(array("$pts[HORARIO_01_03]", "$pts[TRAB_ESCOLAR_01_03]","$pts[EQUIPE_01_03]","$pts[LOCAL_01_03]"));
          $pdf->Row(array("$pts[HORARIO_02_03]", "$pts[TRAB_ESCOLAR_02_03]","$pts[EQUIPE_02_03]","$pts[LOCAL_02_03]"));

          //QUARTA FEIRA
          $pdf->SetFont('Arial','B',10);
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');
          $pdf->Row(array("$pts[DIA_SEMANA_04] - $pts[DATA_04]"));
          $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
          $pdf->SetFont('Arial','',10);
          $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->Row(array("$pts[HORARIO_01_04]", "$pts[TRAB_ESCOLAR_01_04]","$pts[EQUIPE_01_04]","$pts[LOCAL_01_04]"));
          $pdf->Row(array("$pts[HORARIO_02_04]", "$pts[TRAB_ESCOLAR_02_04]","$pts[EQUIPE_02_04]","$pts[LOCAL_02_04]"));

          //QUINTA FEIRA
          $pdf->SetFont('Arial','B',10);
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');
          $pdf->Row(array("$pts[DIA_SEMANA_05] - $pts[DATA_05]"));
          $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
          $pdf->SetFont('Arial','',10);
          $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->Row(array("$pts[HORARIO_01_05]", "$pts[TRAB_ESCOLAR_01_05]","$pts[EQUIPE_01_05]","$pts[LOCAL_01_05]"));
          $pdf->Row(array("$pts[HORARIO_02_05]", "$pts[TRAB_ESCOLAR_02_05]","$pts[EQUIPE_02_05]","$pts[LOCAL_02_05]"));

          //SEXTA FEIRA
          $pdf->SetFont('Arial','B',10);
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('C');
          $pdf->Row(array("$pts[DIA_SEMANA_06] - $pts[DATA_06]"));
          $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
          $pdf->SetFont('Arial','',10);
          $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->Row(array("$pts[HORARIO_01_06]", "$pts[TRAB_ESCOLAR_01_06]","$pts[EQUIPE_01_06]","$pts[LOCAL_01_06]"));
          $pdf->Row(array("$pts[HORARIO_02_06]", "$pts[TRAB_ESCOLAR_02_06]","$pts[EQUIPE_02_06]","$pts[LOCAL_02_06]"));
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('L');
          $pdf->Row(array("$pts[MSG]"));

          $pdf->Ln();
          $pdf->Ln();
          $pdf->SetDrawColor(255, 255, 255);  //Cor das grades da tabela
          $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
          $pdf->SetAligns('R');
          $pdf->Row(array("Chefe da SubDivisão de Aplicação de Cursos"));
      }
      $pdf->Output("Funcoes/pdf/Rel.pdf",F); //Arquivb pdf de saida
      header ("Content-Type: application/pdf");
      echo file_get_contents ('Funcoes/pdf/Rel.pdf');
   }
   else    // Tratamento para semana selecionada 
   {
      //seleciona tabela pts
      $sql="select * from CAD_PTS
                where idcurso=$idCurso and idturma=$idTurma and semana=$semana";
      $resultadoPTS = ibase_query($conexao, $sql);
      $pts = ibase_fetch_assoc($resultadoPTS);

      $pdf=new pdf();   //Instância da classe pdf
      $pdf->Open();    //Abre arquivo pdf
      $pdf->AddPage();
      $pdf->SetAutoPageBreak(5);

      //CABEÇALHO
      $pdf->SetFont('Times','B',10);
      $pdf->SetDrawColor(255, 255, 255);  //Cor das grades da tabela
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('C');
      $pdf->Row(array("INSTITUTO DE CONTROLE DO ESPAÇC AÉREO"));
      $pdf->Row(array("SEÇÃO DE EXECUÇÃO DE CURSOS"));
      $pdf->SetFont('Times','B',9);
      $pdf->Row(array("$curso[CODCURSO] - $curso[NOMECURSO]"));
      $pdf->SetWidths(array(23,130,30));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->Ln();
      $pdf->SetFillColor(255,0,0);
      $pdf->Row(array("SEMANA: $semana/$numeroSemana ", "                                PROGRAMA DE TRABALHO SEMANAL", "Turma: $turma[TURMA]/$turma[ANO]"));

      //SEGUNDA FEIRA
      $pdf->SetFont('Arial','B',10);
      $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
      $pdf->SetFillColor(0,0,0);
      $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('C');  
      $pdf->Row(array("HORÁRIO", "                            TRABALHO ESCOLAR","          DOCENTE","     LOCAL"));
      $pdf->SetFont('Arial','B',10);
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('C');
      $pdf->Row(array("$pts[DIA_SEMANA_02] - $pts[DATA_02]"));
      $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
      $pdf->SetFont('Arial','',10);
      $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->Row(array("$pts[HORARIO_01_02]", "$pts[TRAB_ESCOLAR_01_02]","$pts[EQUIPE_01_02]","$pts[LOCAL_01_02]"));
      $pdf->Row(array("$pts[HORARIO_02_02]", "$pts[TRAB_ESCOLAR_02_02]","$pts[EQUIPE_02_02]","$pts[LOCAL_02_02]"));

      //TERÇA FEIRA

      $pdf->SetFont('Arial','B',10);
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('C');
      $pdf->Row(array("$pts[DIA_SEMANA_03] - $pts[DATA_03]"));
      $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
      $pdf->SetFont('Arial','',10);
      $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->Row(array("$pts[HORARIO_01_03]", "$pts[TRAB_ESCOLAR_01_03]","$pts[EQUIPE_01_03]","$pts[LOCAL_01_03]"));
      $pdf->Row(array("$pts[HORARIO_02_03]", "$pts[TRAB_ESCOLAR_02_03]","$pts[EQUIPE_02_03]","$pts[LOCAL_02_03]"));
      $pdf->SetFillColor(204,204,204);

      //QUARTA FEIRA

      $pdf->SetFont('Arial','B',10);
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('C');
      $pdf->Row(array("$pts[DIA_SEMANA_04] - $pts[DATA_04]"));
      $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
      $pdf->SetFont('Arial','',10);
      $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->Row(array("$pts[HORARIO_01_04]", "$pts[TRAB_ESCOLAR_01_04]","$pts[EQUIPE_01_04]","$pts[LOCAL_01_04]"));
      $pdf->Row(array("$pts[HORARIO_02_04]", "$pts[TRAB_ESCOLAR_02_04]","$pts[EQUIPE_02_04]","$pts[LOCAL_02_04]"));
      $pdf->SetFillColor(204,204,204);

      //QUINTA FEIRA
      //$pdf->SetDrawColor(255, 255, 255);  //Cor das grades da tabela
      $pdf->SetFont('Arial','B',10);
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('C');
      $pdf->Row(array("$pts[DIA_SEMANA_05] - $pts[DATA_05]"));
      $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
      $pdf->SetFont('Arial','',10);
      $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->Row(array("$pts[HORARIO_01_05]", "$pts[TRAB_ESCOLAR_01_05]","$pts[EQUIPE_01_05]","$pts[LOCAL_01_05]"));
      $pdf->Row(array("$pts[HORARIO_02_05]", "$pts[TRAB_ESCOLAR_02_05]","$pts[EQUIPE_02_05]","$pts[LOCAL_02_05]"));
      $pdf->SetFillColor(204,204,204);

      //SEXTA FEIRA
      $pdf->SetFont('Arial','B',10);
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('C');
      $pdf->Row(array("$pts[DIA_SEMANA_06] - $pts[DATA_06]"));
      $pdf->SetDrawColor(0, 0, 0);  //Cor das grades da tabela
      $pdf->SetFont('Arial','',10);
      $pdf->SetWidths(array(21,95,40,25));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->Row(array("$pts[HORARIO_01_06]", "$pts[TRAB_ESCOLAR_01_06]","$pts[EQUIPE_01_06]","$pts[LOCAL_01_06]"));
      $pdf->Row(array("$pts[HORARIO_02_06]", "$pts[TRAB_ESCOLAR_02_06]","$pts[EQUIPE_02_06]","$pts[LOCAL_02_06]"));
     
      //---- Msg
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('L');
      $pdf->Row(array("$pts[MSG]"));

      $pdf->Ln();
      $pdf->Ln();
      $pdf->SetDrawColor(255, 255, 255);  //Cor das grades da tabela
      $pdf->SetWidths(array(181));//CADA VALOR DESTE ARRAY SERÁ A LARGURA DE CADA COLUNA
      $pdf->SetAligns('R');
      $pdf->Row(array("Chefe da SubDivisão de Aplicação de Cursos"));
   
      $pdf->Output("Funcoes/pdf/Rel.pdf",F); //Arquivb pdf de saida
      header ("Content-Type: application/pdf");
      echo file_get_contents ('Funcoes/pdf/Rel.pdf');


   }
?>