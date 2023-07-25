<?
   session_start();
?>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>
   <head>
   <body>
<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : InsereResposta.php                             //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de inserir as respos- //
  //                             tas dos alunos da Ficha de Avaliação de Curso. //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 22/06/2009                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

   require_once("verifica_sessao.php");
   require_once("conecta.inc");

   //---
   //Pega os Itens a serem cadastrados

   $sql_FAItens = "Select * From FA_Itens
                  where IDFICHA=  $_SESSION[idFicha]
                  order by IDFICHA, IDTOPICO, IDITEM";
   $resultado = ibase_query($conexao, $sql_FAItens);
  
   $identidade =$_SESSION[identidade];
   $_SESSION[espacoEsq];
   $_SESSION[espacoDir];


   $contIdentidade = strlen($identidade);      //20

   $paramEsq = $_SESSION[espacoEsq] + $contIdentidade ;
   $paramDir = $_SESSION[espacoDir] + $contIdentidade ;

   $identidadeComEsq= str_pad("$identidade",$paramEsq," ", STR_PAD_LEFT) ;      //COMPLETA COM ESPAÇO EM BRANCO "ASCII 32"
   $identidadeCompleta= str_pad("$identidadeComEsq",20," ", STR_PAD_RIGHT) ;    //COMPLETA COM ESPAÇO EM BRANCO "ASCII 32"

   //Verifica se existe resposta da disciplina pelo aluno

   $sql_Respondeu = " Select count(1) as QTD From fa_resposta
                    where IDCURSO =$_SESSION[idCurso]
                    and IDTURMA =$_SESSION[idTurma]
                    and IDFICHA=$_SESSION[idFicha]
                    and IDENTIDADE ='$identidadeCompleta'
                    and DISCIPLINA='$_SESSION[codDisciplina]'";


   $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
   $qtd = ibase_fetch_assoc($Res_Respondeu);


   if ($qtd[QTD]> 0){

    while ($row = ibase_fetch_assoc($resultado)){

      $Contador++;
      $nomeRadio=$row['IDITEM'];

      $rowitem = $_POST[$Contador] ;

      $resposta = substr($rowitem,0,1);            //DESMEMBRA CONCATENAÇÃO POSTADA
      $idTopico = substr($rowitem,1);              //DESMEMBRA CONCATENAÇÃO POSTADA

      $sqli = "update FA_RESPOSTA set RESPOSTA='$resposta'
                    where IDCURSO =$_SESSION[idCurso]
                    and IDTURMA =$_SESSION[idTurma]
                    and IDFICHA=$_SESSION[idFicha]
                    and IDTOPICO=$idTopico
                    and IDITEM=$nomeRadio
                    and IDENTIDADE ='$identidadeCompleta'
                    and DISCIPLINA='$_SESSION[codDisciplina]'";
      $resultadoi = ibase_query($sqli);
    }
   }else{
    while ($row = ibase_fetch_assoc($resultado)){

      $Contador++;
      $nomeRadio=$row['IDITEM'];

      $rowitem = $_POST[$Contador] ;

      $resposta = substr($rowitem,0,1);            //DESMEMBRA CONCATENAÇÃO POSTADA
      $idTopico = substr($rowitem,1);              //DESMEMBRA CONCATENAÇÃO POSTADA

      $sqli = "insert into FA_RESPOSTA (IDCURSO,IDTURMA, IDFICHA, IDTOPICO, IDITEM, IDENTIDADE, DISCIPLINA, RESPOSTA)
               VALUES ($_SESSION[idCurso],$_SESSION[idTurma],$_SESSION[idFicha],$idTopico,$nomeRadio,'$identidadeCompleta','$_SESSION[codDisciplina]',$resposta)";

      $resultadoi = ibase_query($sqli);
   }
   }
?>

</body>
</html>

