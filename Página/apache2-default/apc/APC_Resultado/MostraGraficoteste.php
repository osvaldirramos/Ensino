<HTML>
<HEAD>
 <TITLE>Documento PHP</TITLE>
</HEAD>
<BODY>
<?
   $VI_IdCurso = $_GET[curso];
   $VI_IdTurma = $_GET[turma];
   $tipo = $_GET[grafico];
   $VS_Questionado = $_GET[questionado];
   
   echo "cu $VI_IdCurso <br>";
   echo "tu $VI_IdTurma<br>";
   echo "qst $VS_Questionado <br>";
   echo "ti $tipo";
   
?>
</BODY>
</HTML>
