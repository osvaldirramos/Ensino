<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sem título</title>
</head>

<body>
<h1>teste de RTF</h1>
<?php
include "rtf.php";
$reader = new RtfReader();
$rtf = file_get_contents("textortf.rtf"); // or use a string
$reader->Parse($rtf);

//$reader->root->dump();
$formatter = new RtfHtml();
echo $formatter->Format($reader->root);
?>

</body>
</html>