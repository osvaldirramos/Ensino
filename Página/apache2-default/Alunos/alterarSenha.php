<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : alterar senha.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de permitir a alteracao da senha.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Ten Marcela
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 04/09/2019
  //
  //----------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------

   session_start();
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   require_once("../Funcoes/conecta.inc");

if($_POST['submit'])
{
   $senha = $_POST['senha'];
   $novasenha1 = $_POST['novasenha1'];
   $novasenha2 = $_POST['novasenha2'];
   if ($senha!= $_SESSION[senha])
   {
         echo "<script language='javascript' type='text/javascript'> alert('A senha digitada está incorreta. Redigite a senha atual.');window.location='alterarSenha.php';</script>";
   }
   if ($novasenha1!= $novasenha2)
   {
         echo "<script language='javascript' type='text/javascript'> alert('As senhas que você digitou não são iguais. Redigite a nova senha nas duas caixas.');window.location='alterarSenha.php';</script>";
   }else
   {
         if(strlen($novasenha1)<16&&strlen($novasenha1)>2)
         {
             if($_SESSION[IdUsuario]== "AVL ICEA")
             {
                 $sql="update FAC_USUARIO set
                            SENHA = '$novasenha1'
                            WHERE IDENTIDADE like '%$_SESSION[identidadeAluno]%'";

             }else
             {
                 $sql="update FAC_USUARIOTURMA set
                            SENHA = '$novasenha1'
                            WHERE (IDCURSO = $_SESSION[idCurso]) AND (IDTURMA = $_SESSION[idTurma])and( IDENTIDADE like '%$_SESSION[identidadeAluno]%')";

             }

             $Res_sql = ibase_query($sql, $conexao);
         
             $_SESSION[senha]= $novasenha1;
             echo "<script language='javascript' type='text/javascript'> alert('Senha alterada.');window.location='ListaDeAvaliacoes.php';</script>";
          }
          else
          {
               echo "<script language='javascript' type='text/javascript'> alert('Senha deve ter de 3 a 15 caracteres.');window.location='alterarSenha.php';</script>";

          }
   }

}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Ficha de Avaliacao de Cursos</title>
<link rel="stylesheet" href="estilos/abas1.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Cache-control" content="no-cache">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#content div:nth-child(1)").show();
		$(".abas li:first div").addClass("selected");
		$(".aba").click(function(){
			$(".aba").removeClass("selected");
			$(this).addClass("selected");
			var indice = $(this).parent().index();
			indice++;
			$("#content div").hide();
			$("#content div:nth-child("+indice+")").show();
		});

		$(".aba").hover(
			function(){$(this).addClass("ativa")},
			function(){$(this).removeClass("ativa")}
		 );
	});
</script>
</head>

<body bgcolor="#CFCFCF">
<p><img style="margin: -10px 0px -15px 0px;" src="../imagem/topo_ICEA.png" alt="" width="1060" /></p>

<table border='0' cellspacing='0' cellpadding='0' width='1060' class='style3' bordercolor='#084B8A' bgcolor='#084B8A'>
       <tr>
            <td> <div><td width='1070' align='Center'><b style='font-size:20px'; ><p class='style2'align='center'><font color='white'><b>ALTERAR SENHA</b></p></b></td></div>
          </tr>
       </table>


   <p>&nbsp;</p>
   <table border="0" width="100%" >
      <tr>
         <td width="212" align="center">&nbsp;<a href="Principal.php" title="Página Anterior" target="_self" ><img src="image/sair.png" border="0" width="25" height="25" /> Retornar</a></td>
      </tr>
    </table>
    <br>

    <br>
    <form action="" method="post" enctype="multipart/form-data">
         Senha:<br>  <input type="password" name="senha" size="30" value=""><br>
         Nova Senha<br> <input type="password"  name="novasenha1" size="30"><br>
         Redigite Senha<br>  <input type="password"  name="novasenha2" size="30"><br>
         De 3 a 15 caracteres. <br>
         <input type="submit" name="submit" value="Mudar Senha">
    </form>
   <div>
</html>

