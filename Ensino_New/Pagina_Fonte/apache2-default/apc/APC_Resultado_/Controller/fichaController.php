<?php
session_start();
//include("../External/Funcoes/conecta.php");
include("../Model/fichaModel.php");
$ficha = new Ficha();
$lista=$ficha->listarFichas();
//$lista=$ficha->montarLista($lista); ?><pre>      <?
print_r($lista);                           ?> </pre>
 <?
 

//print_r($lista[curso]);
//echo "<br> ";

//print_r($lista[turma]);
//echo $lista[turma][1][IDTURMA];
//if($logado[NOME]==$_POST[login]&&$logado[SENHA]==$_POST[senha])
//{
//  $_SESSION[usuario]=$logado[NOME];
//
//  header("Location:../Model/teste.php");
//  //echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
//
//}


?>
