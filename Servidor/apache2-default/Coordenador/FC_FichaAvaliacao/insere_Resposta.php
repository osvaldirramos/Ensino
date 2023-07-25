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

   $DataAtual= date('d/m/Y H:i:s',time());
   $DataAtual= $f-> TrocarDePara($DataAtual, '/', '.');
   
   $sql_Respondeu = " Select count(1) as QTD From FC_Avaliacao
                      where IDCURSO =$_SESSION[idCurso]
                      and IDTURMA =$_SESSION[idTurma]
                      and IDENTIDADE = '$_SESSION[identidadeAluno]'";
   $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
   $qtd = ibase_fetch_assoc($Res_Respondeu);

   if ($qtd[QTD] > 0)
   {
       $sqli = "update FC_Avaliacao set DataAvaliacao = '$DataAtual'
                             where IDCURSO =$_SESSION[idCurso]
                             and IDTURMA =$_SESSION[idTurma]
                             and IDENTIDADE = '$_SESSION[identidadeAluno]'";
   }
   else
   {
       $sqli = "insert into FC_Avaliacao (IDCURSO,IDTURMA, IDENTIDADE, DataAvaliacao)
                       VALUES ($_SESSION[idCurso],$_SESSION[idTurma],'$_SESSION[identidadeAluno]','$DataAtual')";
   }
   $resultadoi = ibase_query($conexao, $sqli);


     //------------------------------------------------------------------------------------------
    //Insere os Comentarios dos Modelos
   //--------------------------------------------------------------------------------------------

    //---
   //Pega os Modelos a serem cadastrados

   $Contador2= 200;
   $sql_FCModelo = "Select * From FC_Modelo
                  order by IDMODELO";
   $resultado = ibase_query($conexao, $sql_FCModelo);
   while ($Modelo = ibase_fetch_assoc($resultado))
   {
       $Contador2++;
       $Comentario = $_POST[$Contador2];
	if(trim($Comentario)=="")$Comentario='Não possui sugestão.';
       if ($Comentario <> '')
       {
          $sql_Respondeu = " Select count(1) as QTD From FC_ComentarioModelo
                             where IDCURSO =$_SESSION[idCurso]
                             and IDTURMA =$_SESSION[idTurma]
                             and IDENTIDADE = '$_SESSION[identidadeAluno]'
                             and IDMODELO= $Modelo[IDMODELO]";
          $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
          $qtd = ibase_fetch_assoc($Res_Respondeu);

          if ($qtd[QTD] > 0)
          {
              $sqli = "update FC_ComentarioModelo set COMENTARIO = '$Comentario'
                             where IDCURSO =$_SESSION[idCurso]
                             and IDTURMA =$_SESSION[idTurma]
                             and IDENTIDADE = '$_SESSION[identidadeAluno]'
                             and IDMODELO= $Modelo[IDMODELO]";
          }
          else
          {
              $sqli = "insert into FC_ComentarioModelo (IDCURSO,IDTURMA, IDENTIDADE, IDMODELO, COMENTARIO)
                       VALUES ($_SESSION[idCurso],$_SESSION[idTurma],'$_SESSION[identidadeAluno]',$Modelo[IDMODELO],'$Comentario')";
          }
          $resultadoi = ibase_query($conexao, $sqli);
      }
   }

     //------------------------------------------------------------------------------------------
    //Insere as Respostas
   //--------------------------------------------------------------------------------------------

    //---
   //Pega os Itens e as Justificativas a serem cadastrados

   $sql_FCItens = "Select * From FC_Itens
                  order by IDMODELO, IDTOPICO, IDITEM";
   $resultado = ibase_query($conexao, $sql_FCItens);

   $Contador= 0;
   $Contador1= 100;
   while ($row = ibase_fetch_assoc($resultado))
   {
      $Contador++;
      $Contador1++;
      $nomeRadio=$row['IDITEM'];

      $rowitem = $_POST[$Contador] ;
      $Justificativa = $_POST[$Contador1] ;

      $resposta = substr($rowitem,0,1);            //DESMEMBRA CONCATENAÇÃO POSTADA
      $idModelo = substr($rowitem,1,2);              //DESMEMBRA CONCATENAÇÃO POSTADA
      $idTopico = substr($rowitem,3,2);              //DESMEMBRA CONCATENAÇÃO POSTADA
      $idItem = substr($rowitem,5,2);              //DESMEMBRA CONCATENAÇÃO POSTADA

       //---
      //--- Grava a Resposta
      
      if ($resposta != '')
      {
          $sql_Respondeu = " Select count(1) as QTD From FC_RESPOSTA
                             where IDCURSO = $_SESSION[idCurso]
                             and IDTURMA = $_SESSION[idTurma]
                             and IDENTIDADE = '$_SESSION[identidadeAluno]'
                             and IDMODELO = $idModelo
                             and IDTOPICO = $idTopico
                             and IDITEM = $idItem";

          $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
          $qtd = ibase_fetch_assoc($Res_Respondeu);

          if ($qtd[QTD]> 0)
          {
             $sqli = "update FC_RESPOSTA set RESPOSTA = '$resposta'
                          where IDCURSO = $_SESSION[idCurso]
                          and IDTURMA = $_SESSION[idTurma]
                          and IDENTIDADE = '$_SESSION[identidadeAluno]'
                          and IDMODELO = $idModelo
                          and IDTOPICO = $idTopico
                          and IDITEM = $idItem";
          }
          else
          {
             $sqli = "insert into FC_RESPOSTA (IDCURSO,IDTURMA, IDENTIDADE, IDMODELO, IDTOPICO, IDITEM, RESPOSTA)
                       VALUES ($_SESSION[idCurso],$_SESSION[idTurma],'$_SESSION[identidadeAluno]',$idModelo,$idTopico,$idItem,$resposta)";
          }
          $resultadoi = ibase_query($conexao, $sqli);
      }

       //---
      //--- Grava a Justificativa
      if (trim($Justificativa) == "") $Justificativa = "Não possui justificativa.";
      if ($Justificativa != '')
      {
          $Identidade= trim($_SESSION[identidadeAluno]);
          $sql_Respondeu = " Select count(1) as QTD From FC_Justificativa
                             where IDCURSO = $_SESSION[idCurso]
                             and IDTURMA = $_SESSION[idTurma]
                             and IDENTIDADE = '$_SESSION[identidadeAluno]'
                             and IDMODELO = $idModelo
                             and IDTOPICO = $idTopico
                             and IDITEM = $idItem";
          $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
          $qtd = ibase_fetch_assoc($Res_Respondeu);

          if ($qtd[QTD]> 0)
          {
             $sqli = "update FC_Justificativa set Justificativa = '$Justificativa'
                          where IDCURSO = $_SESSION[idCurso]
                          and IDTURMA = $_SESSION[idTurma]
                          and IDENTIDADE = '$_SESSION[identidadeAluno]'
                          and IDMODELO = $idModelo
                          and IDTOPICO = $idTopico
                          and IDITEM = $idItem";
          }
          else
          {
             $sqli = "insert into FC_Justificativa (IDCURSO,IDTURMA, IDENTIDADE, IDMODELO, IDTOPICO, IDITEM, Justificativa)
                       VALUES ($_SESSION[idCurso],$_SESSION[idTurma],'$_SESSION[identidadeAluno]',$idModelo,$idTopico,$idItem,'$Justificativa')";
          }
          $resultadoi = ibase_query($conexao, $sqli);
      }
   }

     //------------------------------------------------------------------------------------------
    //Insere Comentario
   //--------------------------------------------------------------------------------------------

   $comentario = $_POST[comentario];
   
   if($comentario!="")
   {
     $sql_Respondeu = " Select count(1) as QTD From FC_COMENTARIO
                             where IDCURSO = $_SESSION[idCurso]
                             and IDTURMA = $_SESSION[idTurma]
                             and IDENTIDADE = '$_SESSION[identidadeAluno]'";

     $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
     $qtd = ibase_fetch_assoc($Res_Respondeu);

     if ($qtd[QTD]> 0)
     {
        $sqli = "update FC_COMENTARIO set COMENTARIO='$comentario'
                             where IDCURSO = $_SESSION[idCurso]
                             and IDTURMA = $_SESSION[idTurma]
                             and IDENTIDADE = '$_SESSION[identidadeAluno]'";
      }
      else
      {
         $sqli = "insert into FC_COMENTARIO (IDCURSO,IDTURMA, IDENTIDADE, COMENTARIO)
                  VALUES ($_SESSION[idCurso],$_SESSION[idTurma],'$_SESSION[identidadeAluno]', '$comentario')";
      }
      $resultadoi = ibase_query($conexao, $sqli);
   }
   
     //------------------------------------------------------------------------------------------
    //Finaliza processo
   //--------------------------------------------------------------------------------------------

   echo "<script language='javascript' type='text/javascript'>
          alert('Ficha inserida com sucesso! Obrigado!');
          window.location='../MsgAlerta/montapagina.php';
         </script>";
?>

</body>
</html>

