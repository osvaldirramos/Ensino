
<?php
#
/*
#
Ol� Amigos, hoje iremos aprender a gerar um arquivo PDF com nosso querido PHP
#
para isso , utilizaremos a biblioteca fpdf que se encontra em - > http://www.fpdf.org/
#

#
Objetivo : gerar um arquivo PDF apartir do PHP em formato de um artigo
#

#
caso tenha alguma duvida fa�a o download do manual no site do fpdf
#
j� possui vers�es em portugues.
#
os m�todos aqui utilizados estao todos explicados no final do artigo !
#

#
bom vamos ao trabalho !
#
*/
#
//incluindo o arquivo do fpdf
#
require_once("fpdf.php");
#
//defininfo a fonte !
#
define('FPDF_FONTPATH','fpdf/font/');
#
//instancia a classe.. P=Retrato, mm =tipo de medida utilizada no casso milimetros, tipo de folha =A4
#
$pdf= new FPDF("P","mm","A4");
#
//define a fonte a ser usada
#
$pdf->SetFont('arial','',10);
#
//define o titulo
#
$pdf->SetTitle("Testando PDF com PHP !");
#
//assunto
#
$pdf->SetSubject("assunto deste artigo!");
#
// posicao vertical no caso -1.. e o limite da margem
#
$pdf->SetY("-1");
#
$titulo="Titulo do Artigo";
#
//escreve no pdf largura,altura,conteudo,borda,quebra de linha,alinhamento
#
$pdf->Cell(0,5,$titulo,0,0,'L');
#
$pdf->Cell(0,5,'http://www.seusite.com.br',0,1,'R');
#
$pdf->Cell(0,0,'',1,1,'L');
#
$pdf->Ln(8);
#
//hora do conteudo do artigo
#
$pdf->SetFont('arial','',8);
#
$novo="A Ag�ncia Nacional de Avia��o Civil (Anac) informou, nesta segunda-feira (2), que vai investigar se as companhias �ereas t�m culpa pelos atrasos e cancelamentos registrados durante o fim de semana.
#
No s�bado (30), o percentual de v�os com mais de uma hora de atrasos chegou a 45,2%. No domingo (1�), at� as 19h30, 36% dos v�os tiveram atrasos.
#
";
#
//posiciona verticalmente 21mm
#
$pdf->SetY("21");
#
//posiciona horizontalmente 30mm
#
$pdf->SetX("30");
#
//escreve o conteudo de novo.. parametros posicao inicial,altura,conteudo(*texto),borda,quebra de linha,alinhamento
#
$pdf->MultiCell(0,5,$novo,0,1,'J');
#

#
$novo="
#
Nesta segunda-feira, a situa��o come�ou a se normalizar, mas ainda h� registro de problemas. At� as 10h, dos 623 v�os previstos nos 13 principais aeroportos brasileiros, 126 tiveram atrasos de mais de uma hora, segundo balan�o divulgado pela Infraero, a estatal que administra os terminais a�reos. O n�mero equivale a 20,2% do total. Quarenta e seis decolagens foram canceladas (7,3%).
#
Os terminais que tiveram maiores percentuais de atrasos foram os do Recife (PE) e de Fortaleza (CE). Na Capital de Pernambuco, oito dos 24 v�os marcados at� as 10h atrasaram mais de uma hora (33,3% do total). No terminal cearense, oito das 25 partidas ocorreram fora
#
O terminal que registrou maior �ndice de cancelamentos foi o de Curitiba (PR). Das 22 decolagens programadas, quatro foram canceladas (18,1%).
#
A assessoria de Infraero informa que os atrasos s�o conseq��ncia dos transtornos do fim de semana. Muitos v�os tiveram que ser remarcados para o in�cio desta semana.
#
Previs�o - O presidente da Infraero, brigadeiro Jos� Carlos Pereira, tamb�m foi prejudicado pela crise a�rea. Ele tinha uma viagem marcada de Bras�lia para o Rio �s 7h desta segunda, mas o avi�o s� decolou �s 9h59.
#
Apesar do transtorno, ele disse que as opera��es est�o ocorrendo normalmente nos principais aeroportos do pa�s e a situa��o deve se normalizar at� as 14h.
#
";
#
//posiciona verticalmente 41mm
#
$pdf->SetY("41");
#
//posiciona horizontalmente 10mm
#
$pdf->SetX("10");
#
//escreve o conteudo de novo.. parametros posicao inicial,altura,conteudo(*texto),borda,quebra de linha,alinhamento
#
$pdf->Write(5, $novo);
#

#
//endereco da imagem,posicao X(horizontal),posicao Y(vertical), tamanho altura, tamanho largura
#
$pdf->Image("teste.jpg", 8,20,20,20);
#
/*******definindo o rodap�*************************/
#
//posiciona verticalmente 270mm
#
$pdf->SetY("270");
#
//data atual
#
$data=date("d/m/Y");
#
$conteudo="criado em ".$data;
#
$texto="por Alexandre Oliveira";
#

#
//imprime uma celula... largura,altura, texto,borda,quebra de linha, alinhamento
#
$pdf->Cell(0,0,'',1,1,'L');
#
//imprime uma celula... largura,altura, texto,borda,quebra de linha, alinhamento
#
$pdf->Cell(0,5,$texto,0,0,'L');
#
//imprime uma celula... largura,altura, texto,borda,quebra de linha, alinhamento
#
$pdf->Cell(0,5,$conteudo,0,1,'R');
#

#

#
//imprime a saida do arquivo..
#
$pdf->Output("arquivo","I");
?>
