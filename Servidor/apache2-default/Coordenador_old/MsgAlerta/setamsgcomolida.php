<?
  //--------------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : InsereResposta.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de inserir as respostas Justifictivas
  //                             e o comentario do Coordenador.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          :
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 22/06/2009
  //
  //------------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //------------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //------------------------------------------------------------------------------------------

   session_start();
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/Funcoes.php");
   require_once("../../Funcoes/verifica_sessao.php");
   $f= new Funcao();
?>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>
   <head>
   <body>

<?php

     //------------------------------------------------------------------------------------------
    //Insere as Informações referente a Avaliação
   //--------------------------------------------------------------------------------------------

 //  $sql_Msg = "Select IdCurso, IdTurma, usuario, data, Msg, Visto
 //              From FC_Msg
 //              Where IdCurso = $_SESSION[idCurso]
 //              and   IdTurma = $_SESSION[idTurma]
 //              Order by data desc";

   $sqli = "update FC_Msg set Visto = '1'
            where IDCURSO =$_SESSION[idCurso]
            and IDTURMA =$_SESSION[idTurma]";
   $resultadoi = ibase_query($conexao, $sqli);
   
     //------------------------------------------------------------------------------------------
    //Finaliza processo
   //--------------------------------------------------------------------------------------------

   echo "<script language='javascript' type='text/javascript'>
          alert('Todas Mensagens setadas como lida! Obrigado!');
          window.location='montapagina.php';
         </script>";

?>

</body>
</html>

