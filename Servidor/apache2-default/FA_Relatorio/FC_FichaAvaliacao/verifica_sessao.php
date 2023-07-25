<?php
   //----------------------------------------------------------------------------//
   // NOME DO PROJETO           : Ensino                                         //
   //                                                                            //
   // DESCRICAO                 : Este modulo verifica a secao e estartala.      //
   //                                                                            //
   // EQUIPE DO DESENVOLVIMENTO :                                                //
   //          Gerente          :                                                //
   //          (Analista)       : Osvaldir Donizetti Ramos                       //
   //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
   //                                                                            //
   // INICIO DA ELABORACAO      : 13/04/2009                                     //
   //----------------------------------------------------------------------------//
   //                           DETALHES DE ALTERACAO                            //
   //----------------------------------------------------------------------------//
   // DATA                      :                                                //
   // AUTOR                     :                                                //
   // MODULO ALTERADO           :                                                //
   // MOTIVO                    :                                                //
   //----------------------------------------------------------------------------//

   session_start();

   // Verifica se existe os dados da sessão de login

   if(!isset($_SESSION["login"]) || !isset($_SESSION["senha"]))
   {
      // Usuário não logado! Redireciona para a página de login
      header("Location:index.php");
      exit;
   }
?>
