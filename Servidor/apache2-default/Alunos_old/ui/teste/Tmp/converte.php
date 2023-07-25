<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sem título</title>
</head>

<body>
<?php
include "rtf.php";

$r = new rtf( stripslashes( "{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcharset0 Courier New;}} \viewkind4\uc1\pard\fi-440\li440\qj\f0\fs22 #N) Na Zona 2, strips eletr\'f4nicas, a cor branca representa ao operador que o plano de voo:\par \par a) apresentado pela primeira vez ao controlador sem reconhecimento por este e sem qualquer evento autom\'e1tico.\par b) em controle deste posto operador.\par c) em processo de transfer\'eancia.\par d) n\'e3o em controle deste posto operador por\'e9m, o controlador tomou conhecimento da sua exist\'eancia.\par \pard\par } "));
$r->output( "xml");
$r->parse();
if( count( $r->err) == 0) // no errors detected
	echo $r->out;
?>
</body>
</html>