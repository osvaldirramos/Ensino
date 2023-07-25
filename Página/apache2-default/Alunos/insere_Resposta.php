<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : InsereResposta.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de inserir as respostas e o comentario
  //                             das Fichas preencidas.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Ten Marcela
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 06/09/2009
  //
  //------------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //------------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------

  session_start();
?>


<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO </title>
   <head>
   <body>

<?php

   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/conecta.inc");

    //------------------------------------------------------------------------------------------
   //Insere as Respostas
  //--------------------------------------------------------------------------------------------
   $Contador= 0;

   //---
   //Pega os Itens a serem cadastrados

   $sql_FAItens = "Select IDFICHA, IDTOPICO From FAC_Topicos
                  where IDFICHA=  $_SESSION[idFicha]
                  order by IDFICHA, IDTOPICO";


   $resultado = ibase_query($conexao, $sql_FAItens);

    //---------
   // Verifica se existe resposta da disciplina pelo aluno

   $sql_Respondeu = "Select count(1) as Qtd
                     From fac_avaliacao FA,  FAC_Resposta FR
                     Where FA.IdAvaliacao = FR.IdAvaliacao 
                     and FA.IdCurso = $_SESSION[idCurso]
                     and FA.IdTurma = $_SESSION[idTurma]
                     and FA.IDFICHA=$_SESSION[idFicha]
                     and FA.IDAvaliacao = $_SESSION[IdAvaliacao]";

   $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
   $qtd = ibase_fetch_assoc($Res_Respondeu);


    //---------
   // Verifica se existe resposta para ficha
   //    - Se existir exclui  

   $Comando = "Delete From fac_resposta
               where IDAVALIACAO = $_SESSION[IdAvaliacao]
               and   IDAVALIADOR = '$_SESSION[identidadeAluno]'
               and   IDFICHA = $_SESSION[idFicha]";

   $Res_Comando = ibase_query($conexao, $Comando);

    //---
   // Insere a resposta 


   $Contador= 0;
   while ($row = ibase_fetch_assoc($resultado))
   {
       $Contador++;
       $nomeRadio= $row[IDTOPICO];
       $resposta = $_POST[$Contador] ;
 
       if ($resposta != '')
       {
           //-----
          // Insere a resposta

           $Comando= "insert into FAC_RESPOSTA (IDAVALIACAO, IDAVALIADOR, IDFICHA, IDTOPICO, RESPOSTA)
                      VALUES ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', $_SESSION[idFicha],$row[IDTOPICO] ,$resposta )";
 
           $Res_Comando= ibase_query($conexao, $Comando);     
       }
   }

   if ($Contador == 0)
   {
       //------------------------------------------------------------------------------------------
      //Finaliza processo
 
      echo "<script language='javascript' type='text/javascript'>
               alert('Ficha não inserida, resposta em branco...! Favor verificar!');
               window.location='Principal.php';
            </script>";
   }
   else
   {
        //---
       // Seta que o Avalidor respondeu a Ficha

       $Comando= " Update FAC_Avaliador set Respondeu = 'S'
                   where IDAVALIACAO = $_SESSION[IdAvaliacao]
                   and   IDAVALIADOR = '$_SESSION[identidadeAluno]'";

       $Res_Comando= ibase_query($conexao, $Comando);     

        //------------------------------------------------------------------------------------------
       //  Tratamento para inserir Comentario

       $Comando= " Delete From FAC_COMENTARIO
                   where FA.IDAvaliacao = $_SESSION[IdAvaliacao]
                   and   FA.IDAvaliador = '$_SESSION[identidadeAluno]'";
       $Res_Comando= ibase_query($conexao, $Comando);     


        //------------------------------------------------------------------------------------------
       //Insere Comentario (1) - DISCIPLINA
    
       if($_POST[comentario_1] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO, TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_1]', 'DISCIPLINA' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (2) - EXECUÇÃO
    
       if($_POST[comentario_2] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO, TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_2]', 'EXECUÇÃO' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }


        //------------------------------------------------------------------------------------------
       // Insere Comentario (3)   - AUTOAVALIAÇÃO
    
       if($_POST[comentario_3] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO, TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_3]', 'AUTOAVALIAÇÃO' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (4) - ESTRUTURA
    
       if($_POST[comentario_4] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO, TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_4]', 'ESTRUTURA' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (5)  - MATERIAL DIDÁTICO
    
       if($_POST[comentario_5] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO , TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_5]', 'MATERIAL DIDÁTICO' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (6)  - AVA
    
       if($_POST[comentario_6] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO , TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_6]', 'AVA' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (7)  - AVALIAÇÃO
    
       if($_POST[comentario_7] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO , TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_7]', 'AVALIAÇÃO' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (8)  - PLANEJAMENTO
    
       if($_POST[comentario_8] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO , TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_8]', 'PLANEJAMENTO' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (9)  - DOCENTES
    
       if($_POST[comentario_9] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO , TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_9]', 'DOCENTES' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }

        //------------------------------------------------------------------------------------------
       // Insere Comentario (10)  - GERAIS
    
       if($_POST[comentario_10] != "") {
           $Comando= "insert into FAC_COMENTARIO (IDAVALIACAO, IDAVALIADOR, COMENTARIO , TIPO )
                      values  ($_SESSION[IdAvaliacao],'$_SESSION[identidadeAluno]', '$_POST[comentario_10]', 'GERAIS' )";

           $Res_Comando= ibase_query($conexao, $Comando);     
       }




       //------------------------------------------------------------------------------------------
       // Finaliza a Inserção

       echo "<script language='javascript' type='text/javascript'>
               alert('Ficha inserida com sucesso...!');
               window.location='Principal.php';
             </script>";

   }
?>

</body>
</html>