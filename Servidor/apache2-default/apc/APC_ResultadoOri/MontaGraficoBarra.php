<?php
   require_once("../Funcoes/conecta.inc");
   session_start();

   //O Manual do PHPlot encontra-se em http://phplot.sourceforge.net/phplotdocs/index.html

   //Inclui a biblioteca
   require("phplot/phplot.php");

   //Definimos o objeto para inicar a "montagem" do gráfico
   $grafico =& new PHPlot(500,400);

   $Tipo_Grafico =  $_GET[tipo];
   $x= $_GET[sessao];
   $titulo=$_GET[titulo];
   $lengenda = $_GET[lengenda];
   
   $sql_Grafico = "Select * from APC_Grafico where indice = $x ";
   $ResGrafico = ibase_query($conexao, $sql_Grafico);
   $row =  ibase_fetch_assoc($ResGrafico);


   //Elimina restos de barra
   if ($row[RES1]==0){
   $row[RES1] = "''";}
   if ($row[RES2]==0){
   $row[RES2] = "''";}
   if ($row[RES3]==0){
   $row[RES3] = "''";}
   if ($row[RES4]==0){
   $row[RES4] = "''";}
   if ($row[RES5]==0){
   $row[RES5] = "''";}
   
   if ($row[DESC1]=="NULL"){
   $row[DESC1] = '';}
   if ($row[DESC2]=="NULL"){
   $row[DESC2] = '';}
   if ($row[DESC3]=="NULL"){
   $row[DESC3] = '';}
   if ($row[DESC4]=="NULL"){
   $row[DESC4] = '';}
   if ($row[DESC5]=="NULL"){
   $row[DESC5] = '';}

   $dados = array
           (
               array( $row[DESC1],$row[RES1]),
               array( $row[DESC2],'',$row[RES2]),
               array( $row[DESC3],'','',$row[RES3]),
               array( $row[DESC4],'','','',$row[RES4]),
               array( $row[DESC5],'','','','',$row[RES5])
            );


   //Determina o numero de itens da legenda
   if($lengenda==5){
    $grafico->SetLegend($row[DESC1]);
    $grafico->SetLegend($row[DESC2]);
    $grafico->SetLegend($row[DESC3]);
    $grafico->SetLegend($row[DESC4]);
    $grafico->SetLegend($row[DESC5]);
   }
   
   if($lengenda==3){
    $grafico->SetLegend($row[DESC1]);
    $grafico->SetLegend($row[DESC2]);
    $grafico->SetLegend($row[DESC3]);
   }


   $grafico->SetDataColors(array('red','SkyBlue', 'green',  'orange','DarkGreen',
                          'magenta', 'brown', 'lavender', 'pink','gray'));
   $grafico->SetFontGD(x_label,3);
   $grafico->SetShading(18);
   $grafico->SetXTickLength(5);
   $grafico->SetYTickIncrement('1'); //Espaçamento de Y
   $grafico->SetXTickIncrement('1'); //Espaçamento de X
   $grafico->SetPlotType($Tipo_Grafico); //Tipo do groafico set pelo usuario
   $grafico->SetXTickLabelPos('none');
   $grafico->SetDataValues($dados); //Dados do gráfico
   $grafico->DrawGraph();

   ?>
