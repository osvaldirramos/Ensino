<?php
session_start();
//include("../External/Funcoes/conecta.php");
include("../Model/usuarioModel.php");
$usuario = new Usuario();
$logado=$usuario->registrarUsuario($_POST[login],$_POST[senha]);
print_r($logado);
if($logado[NOME]==$_POST[login]&&$logado[SENHA]==$_POST[senha])
{
  $_SESSION[usuario]=$logado[NOME];

  header("Location:../Controller/fichaController.php");
  //echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";

}


?>
