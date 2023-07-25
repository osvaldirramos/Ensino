<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a usuario logar no sistema //
  //                             para isto devera entrarcom seu Login e senha. //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          :                                                //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germano / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/04/2009                                     //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :    29/08/2013                                         //
  // AUTOR                     :    SULZBACH                                            //
  // MODULO ALTERADO           :    LAYOUT                                            //
  // MOTIVO                    :    ATUALIZAÇÃO                                          //
  //----------------------------------------------------------------------------//

session_start();
session_unset ();
session_destroy();
include("Funcoes/conecta.inc");

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<NOSCRIPT>
Este navegador não compreende os scripts que se estão executando,
você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
</NOSCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
<title>.: FICHA DE AVALIAÇÂO PROSIMA.</title>
<link rel="stylesheet" type="text/css" href="estilos/estilo.css"  />
<link rel="shortcut icon" type="image/ico" href="image/favicon_icea.ico" >
<script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>


</head>
<style>
.llogin td {
	padding:10px;
}
	
</style>
<body>
<?
include('cabec.inc')
?>

<titulo >FICHA DE AVALIAÇÃO PROSIMA</titulo>
<div id="conteudo" >

	<div class="etiqueta" style="width:300px;">
		<form id="form1" >
		<table class="llogin" align="center">
		<tr><td width="30%">LOGIN: </td><td><input type="text" name="login"  /></td></tr>
		<tr><td width="30%">SENHA: </td><td><input type="password" name="senha" /></td></tr>
		</table>
		</form>
		<div class='button' value="ENTRAR" style="float:right; margin-top:20px;">ENTRAR</div>
	</div>
</div>
</body>
</html>
<script>
$('#conteudo').css('width',($(window).width()-60));
$('.etiqueta').css('left',($('#conteudo').width()-$('.etiqueta').width())/2);
$('.etiqueta').css('top','100px');
$('input:not([type=submit])').css('width','150px');

$('.button').click(function(){
	if($('input[name=login]').val()!="" && $('input[name=senha]').val()!="") {
		$('input[name=login]').val($('input[name=login]').val().toUpperCase())
		$('input[name=senha]').val($('input[name=senha]').val().toUpperCase())
		$.post('registro.php',$('#form1').serialize(),function(resp){
			if(resp.merro != "" ) alert(resp.merro)
			else {
				location.href="Sel_Turma.php";
			}
		},'json')
	} else { 
		alert('Login ou Senha\nINADEQUADO')
	}
})
</script>
