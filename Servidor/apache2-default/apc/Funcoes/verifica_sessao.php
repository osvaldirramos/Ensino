<?php
session_start();

// Verifica se existe os dados da sessão de login
if(!isset($_SESSION["nome"]) || !isset($_SESSION["senha"]))
{
    // Usuário não logado! Redireciona para a página de login
    header("Location:login.php");
    exit;
}
?>