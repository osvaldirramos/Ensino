<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : Relatorio de Final de Curso.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de fazer download do arquivo 
  //                             Relatorio de Final de Curso.doc.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Ten Nechet
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

//   session_start();
//   require_once("../Funcoes/verifica_sessao.php");

   //$arquivo = $_GET['arquivo']; // Caminho do arquivo

   $arquivo = "Relatorio de Final de Curso.doc";

   if(isset($arquivo) && file_exists($arquivo)){ // faz o teste se a variavel não esta vazia e se o arquivo realmente existe
      header('Content-type: octet/stream');
      header('Content-disposition: attachment; filename="'.basename($arquivo).'";');
      header('Content-Length: '.filesize($arquivo));
      readfile($arquivo);
   }
   else {
       echo "Arquivo não encontrado, verifique com o administrador...";
    }
    exit; // aborta pós-ações
?>

