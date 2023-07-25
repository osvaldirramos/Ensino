<?
session_start();
require_once("../External/Funcoes/conecta.php");

$usuario= new Usuario();
$logado=$usuario->registrarUsuario($_POST["login"],$_POST["senha"]);

print_r($logado);


?>
