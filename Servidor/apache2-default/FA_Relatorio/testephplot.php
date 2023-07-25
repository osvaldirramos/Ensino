<?php
require("phplot/phplot.php");

 # Gerar dados para: Y1 = sen (x), Y2 = cos (x)
 $End = M_PI * 2.0;
 $Delta = $end / 20,0;
 $Data = array();
 for($x = 0; $x <= $end; $x + = $delta)
   $Data[] = array( '', $x, sin (x $), cos ($x));

 $Trama = new PHPlot(800, 600);
 $Plot->SetFailureImage(false);  // Não há imagens de erro
 $Plot->SetPrintImage(false);  // Sem saída automática
 $Plot->SetImageBorderType( 'plain');
 $Plot->SetPlotType("linhas");
 $Plot->SetDataType("-data de dados ');
 $Plot->SetDataValues?($dados);
 $Plot->SetTitle('enredo, Sin e Cos - imagem incorporada');
 $Plot->SetLegend(array ('sin (t)', 'cos (t)'));
 $Plot->SetPlotAreaWorld(0, -1, 6,8, 1);
 $Plot->SetXDataLabelPos('none');
 $Plot->SetXTickIncrement(M_PI / 8,0);
 $Plot->SetXLabelType('dados');
 $Plot->SetPrecisionX(3);
 $Plot->SetYTickIncrement(0,2);
 $Plot->SetYLabelType('dados');
 $Plot->SetPrecisionY(1);
 $Plot->SetDrawXGrid(True);
 $Plot->SetDrawYGrid(True);
 $Plot->DrawGraph();

 ?> <! DOCTYPE HTML PUBLIC "- // W3C // DTD HTML 4.01 Transitional // EN"
      "Http://www.w3.org/TR/html4/loose.dtd">
 <Html>
 <Head>
 <Title> Exemplo PHPlot - inline Imagem </ title>
 </ Head>
 <Body>
 <H1> Exemplo PHPlot - inline Imagem </ h1>
 <P> Este é um gráfico de sin () e cos (). </ P>
 <Img src = "<?Php echo $Plot->EncodeImage ();?>" Alt = "Plot Imagem">
 </ Body>
 </ Html>

