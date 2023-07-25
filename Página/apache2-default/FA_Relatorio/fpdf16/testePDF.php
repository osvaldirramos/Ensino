
<?php
#
/*
#
Olá Amigos, hoje iremos aprender a gerar um arquivo PDF com nosso querido PHP
#
para isso , utilizaremos a biblioteca fpdf que se encontra em - > http://www.fpdf.org/
#

#
Objetivo : gerar um arquivo PDF apartir do PHP em formato de um artigo
#

#
caso tenha alguma duvida faça o download do manual no site do fpdf
#
já possui versões em portugues.
#
os métodos aqui utilizados estao todos explicados no final do artigo !
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
$novo="A Agência Nacional de Aviação Civil (Anac) informou, nesta segunda-feira (2), que vai investigar se as companhias áereas têm culpa pelos atrasos e cancelamentos registrados durante o fim de semana.
#
No sábado (30), o percentual de vôos com mais de uma hora de atrasos chegou a 45,2%. No domingo (1º), até as 19h30, 36% dos vôos tiveram atrasos.
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
Nesta segunda-feira, a situação começou a se normalizar, mas ainda há registro de problemas. Até as 10h, dos 623 vôos previstos nos 13 principais aeroportos brasileiros, 126 tiveram atrasos de mais de uma hora, segundo balanço divulgado pela Infraero, a estatal que administra os terminais aéreos. O número equivale a 20,2% do total. Quarenta e seis decolagens foram canceladas (7,3%).
#
Os terminais que tiveram maiores percentuais de atrasos foram os do Recife (PE) e de Fortaleza (CE). Na Capital de Pernambuco, oito dos 24 vôos marcados até as 10h atrasaram mais de uma hora (33,3% do total). No terminal cearense, oito das 25 partidas ocorreram fora
#
O terminal que registrou maior índice de cancelamentos foi o de Curitiba (PR). Das 22 decolagens programadas, quatro foram canceladas (18,1%).
#
A assessoria de Infraero informa que os atrasos são conseqüência dos transtornos do fim de semana. Muitos vôos tiveram que ser remarcados para o início desta semana.
#
Previsão - O presidente da Infraero, brigadeiro José Carlos Pereira, também foi prejudicado pela crise aérea. Ele tinha uma viagem marcada de Brasília para o Rio às 7h desta segunda, mas o avião só decolou às 9h59.
#
Apesar do transtorno, ele disse que as operações estão ocorrendo normalmente nos principais aeroportos do país e a situação deve se normalizar até as 14h.
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
/*******definindo o rodapé*************************/
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
