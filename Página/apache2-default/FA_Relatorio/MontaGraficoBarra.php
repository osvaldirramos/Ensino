<?php
   require_once("../Funcoes/conecta.inc");
   session_start();
   //O Manual do PHPlot encontra-se em http://phplot.sourceforge.net/phplotdocs/index.html

   //Inclui a biblioteca
   require("phplot/phplot.php");

   //Definimos o objeto para inicar a "montagem" do gráfico
   $grafico =& new PHPlot(750,450);
   $Tipo_Grafico =  $_SESSION[tipo];
   //$x= $_GET[sessao];
   $titulo=$_GET[titulo];
   $legenda = $_GET[legenda];
   $pdf="$_GET[nome].PNG";

   $sql_Grafico = "select media, descricao, idtopico from fa_grafico
                          where idcurso=$_SESSION[idCurso]
                          and idturma=$_SESSION[idTurma]
                          and idficha=   $_SESSION[idFicha]
                          order by idtopico";
   $ResGrafico = ibase_query($conexao, $sql_Grafico);
   $aspas="";
   $i=0;
   while ($row =  ibase_fetch_assoc($ResGrafico)){

      $dados[$i]= array( $row[DESCRICAO],$aspas,$row[MEDIA]);
      $aspas.="'',";
      $i++;
   }
   //$dadoa = array($dados[$i]);

   //Determina o numero de itens da legenda
   /*
   if($lengenda==6){
    $grafico->SetLegend($row[DESC1]);
    $grafico->SetLegend($row[DESC2]);
    $grafico->SetLegend($row[DESC3]);
    $grafico->SetLegend($row[DESC4]);
    $grafico->SetLegend($row[DESC5]);
    $grafico->SetLegend($row[DESC6]);
   }
      $dados = array
           (
               array( $row[DESCRICAO],$row[MEDIA]),
               array( $row[DESCRICAO],'',$row[MEDIA]),
               array( $row[DESCRICAO],'','',$row[MEDIA]),
               array( $row[DESCRICAO],'','','',$row[MEDIA]),
               array( $row[DESCRICAO],'','','','',$row[MEDIA]),
               array( $row[DESCRICAO],'','','','','',$row[MEDIA])
            );
   if($lengenda==3){
    $grafico->SetLegend($row[DESC1]);
    $grafico->SetLegend($row[DESC2]);
    $grafico->SetLegend($row[DESC3]);
   } */

   //if($Tipo_Grafico=='bars'){
   //$grafico->SetYTickLabelPos('none');
  // $grafico->SetYTickPos('none');
  // }
   if ($legenda>3){
       $grafico->SetXLabelAngle(90);
   }else{
       $grafico->SetXLabelAngle(0);
   }
   $grafico->SetDataColors(array('gray','red','orange',  'SkyBlue' ,'DarkGreen','green',
                           'magenta', 'brown', 'lavender', 'pink'));

   $grafico->SetFontGD(x_label,2);
   $grafico->SetFontGD(y_label,2);
   $grafico->SetShading(4);    //sombra em pixel
   $grafico->SetXTickLength(6);
   $grafico->SetYTickLength(5);
   $grafico->SetYDataLabelPos('plotin');
   //$grafico->SetDrawYGrid('False');
   $grafico->SetNumYTicks(6);
   //$grafico->SetPrecisionX(7);

   $grafico->SetYTickIncrement('1'); //Espaçamento de Y
   $grafico->SetXTickIncrement('1'); //Espaçamento de X
   $grafico->SetPlotType($Tipo_Grafico); //Tipo do groafico set pelo usuario   linepoints
   $grafico->SetXTickLabelPos('none');
   //$grafico->SetDataType('data-data');
   $grafico->SetDataValues($dados); //Dados do gráfico
   $grafico->SetTitle($titulo);
   $grafico->SetIsInline(true); //Seta salvamento da imagem em local
   $grafico->DrawGraph();
   $grafico->SetOutputFile("imagem/$pdf");    //Salva imagem no aruivo imgGrafic
   $grafico->DrawGraph();
?>
