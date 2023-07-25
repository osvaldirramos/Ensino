<?php
   session_start();
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   require_once("../Funcoes/conecta.inc");
if($_POST['submit'])
{

   $para = $_POST['para'];
   $cc =$_POST['cc'];
   $de = "eavc@icea.gov.br";
   $assunto = $_POST['assunto'];
   $corpo = $_POST['texto'];
   $arquivo ="Rel$_GET[arquivo].pdf";
   
   require_once("PHPMailer/class.phpmailer.php");

   $mail = new PHPMailer();

   $mail->IsSMTP(); // mandar via SMTP
   $mail->Host = "192.168.24.18"; // Seu servidor smtp
   //$mail->SMTPAuth = true; // smtp autenticado
   //$mail->Username = "user"; // usuÃ¡rio deste servidor smtp
   //$mail->Password = "secret"; // senha

   $mail->From = "$de";
   $mail->FromName = "EAVC";
   $separa = explode(";", $para);
   foreach($separa AS $para) {
        $mail->AddAddress("$para");
}
   $separa = explode(";", $cc);
   foreach($separa AS $cc) {
        $mail->AddBcc("$cc"); // optional name
   }

//$mail->AddReplyTo("info@site.com","Information");

//$mail->WordWrap = 50; // set word wrap

   $mail->AddAttachment("pdf/$arquivo"); // attachment

//$mail->AddAttachment("/tmp/image.jpg", "new.jpg");
//$mail->IsHTML(true); // send as HTML

   $mail->Subject = "$assunto";
   $mail->Body = "$corpo";

//$mail->AltBody = "This is the text-only body";


   if(!$mail->Send())
   {
      echo "A mensagem nÃ£o pode ser enviada";
      echo "Erro: " . $mail->ErrorInfo;
      exit;
   }
   else
   {
       echo "Enviado!";
   }
}
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="estilos/estilo.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="javascript">
 function verificaEmail(){
   document.email.submit();
  	if(document.email.para.value !=""){
			document.email.submit();
	}else
	{alert('Email em branco!');document.email.para.focus();}

 }

</script>

</head>
<div id="corpo">
<div align="center" id="topo"><img src="topo.png"></div>
<br>
<br>

<form action="" method="post" name="email" enctype="multipart/form-data">
Para:<br>
<?php

if($_SESSION[postoGraduacao]!="CV")
{
   $posto = rtrim($_SESSION[postoGraduacao]);
}else
{$posto= "Sr(a)";
}

 $nome = $_SESSION[nomeAvaliado];
 $posto.=" $nome";

$mensagemSurg= " $posto

 O ICEA agradece sinceramente sua recente colaboração no curso $_SESSION[nomeCurso] - $_SESSION[codCurso] .
  Em anexo, segue feedback de seu desempenho, do ponto de vista do corpo discente e do coordenador.
  Ficamos à disposição para maiores informações.
  

  Seção de Avaliação de Curso - ICEA

  Tel: (12) 3945-9302
  
  Solicito confirmar o recebimento deste, com as eventuais considerações que julgar oportunas.
";
  
 echo "<input type='text' name='para' size=60 value='$_GET[email]'>";?><br> <br>

Cópia Oculta:<br>
<input type="text" name="cc" size=60 value="jorgeaugusto@icea.gov.br"><br><br>
Assunto:<br>
<input type="text" name="assunto" size=60 value="Feedback de Avaliação | Curso - <?=$_SESSION[codCurso]?> | Disciplina - <?=$_SESSION[nomeMateria]?> "><br><br>
Texto do E-mail:<br>
<textarea name="texto" rows="10" cols="59"><?=$mensagemSurg?></textarea><br>
Arquivo anexo (anexado automaticamente)
<a  href="<? echo "pdf/Rel$_GET[arquivo].pdf";?>" title="Relatório em PDF" target="_blank" style="color:red">Relatório em PDF</a>
<br>
<input type="file" disabled="disabled" name="arquivo" size=60 value="Arquivo.pdf"><br>
<input type="submit" onclick="verificaEmail();" name="submit" value="Enviar E-mail">
</form>
<div>
</html>
