<?
   session_start();
?>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIA��O DE CURSO</title>
   <head>
   <body>

<?php
  //--------------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : InsereResposta.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de inserir as respostas e o comentario
  //                             do alunos da Ficha de Avalia��o de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj S�nia
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

   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/conecta.inc");

   $DataAtual= date('d/m/Y H:i:s',time());
   $DataAtual= $DataAtual.'R';
   $Comentarios= "Inserir Resposta - Disciplina ".trim($_SESSION[codDisciplina]).' / Instrutor '.trim($_SESSION[identidadeInst]);
   $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
              values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";

   $resultado = ibase_query($conexao, $Comando);

    //------------------------------------------------------------------------------------------
   //Insere as Respostas
  //--------------------------------------------------------------------------------------------



   //---
   //Pega os Itens a serem cadastrados

   $sql_FAItens = "Select * From FA_Itens
                  where IDFICHA=  $_SESSION[idFicha]
                  order by IDFICHA, IDTOPICO, IDITEM";
   $resultado = ibase_query($conexao, $sql_FAItens);
  
   //Verifica se existe resposta da disciplina pelo aluno

   $sql_Respondeu = " Select count(1) as QTD From fa_resposta
                    where IDCURSO =$_SESSION[idCurso]
                    and IDTURMA =$_SESSION[idTurma]
                    and IDFICHA=$_SESSION[idFicha]
                    and IDENTIDADE = '$_SESSION[identidadeInst]'
                    and DISCIPLINA='$_SESSION[codDisciplina]'
                    and SENHA='$_SESSION[codAluno]'";

   $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
   $qtd = ibase_fetch_assoc($Res_Respondeu);

   if ($qtd[QTD]> 0)
   {
      while ($row = ibase_fetch_assoc($resultado))
      {
         $Contador++;
         $nomeRadio=$row['IDITEM'];

         $rowitem = $_POST[$Contador] ;

         $resposta = substr($rowitem,0,1);            //DESMEMBRA CONCATENA��O POSTADA
         $idTopico = substr($rowitem,1);              //DESMEMBRA CONCATENA��O POSTADA

         if ($resposta != '')                         // Verifica se
         {
            $sqli = "update FA_RESPOSTA set RESPOSTA='$resposta'
                     where IDCURSO =$_SESSION[idCurso]
                     and IDTURMA =$_SESSION[idTurma]
                     and IDFICHA=$_SESSION[idFicha]
                     and IDTOPICO=$idTopico
                     and IDITEM=$nomeRadio
                     and IDENTIDADE = '$_SESSION[identidadeInst]'
                     and DISCIPLINA= '$_SESSION[codDisciplina]'
                     and SENHA='$_SESSION[codAluno]'";
            $resultadoi = ibase_query($conexao, $sqli);
         }
       }
       $sqli_REL = "update FA_RELACAO set RESPONDEU='S'
                where IDCURSO =$_SESSION[idCurso]
                and IDTURMA =$_SESSION[idTurma]
                and IDFICHA=$_SESSION[idFicha]
                and IDENTIDADE ='$_SESSION[identidadeInst]'
                and DISCIPLINA='$_SESSION[codDisciplina]'
                and IDALUNO = '$_SESSION[identidadeAluno]'";
        $Res_sqli_REL = ibase_query($conexao, $sqli_REL);
   }
   else
   {
   
      while ($row = ibase_fetch_assoc($resultado))
      {
         $Contador++;
         $nomeRadio=$row['IDITEM'];

         $rowitem = $_POST[$Contador] ;

         $resposta = substr($rowitem,0,1);            //DESMEMBRA CONCATENA��O POSTADA
         $idTopico = substr($rowitem,1);              //DESMEMBRA CONCATENA��O POSTADA

         if ($resposta != '')
         {
            $sqli = "insert into FA_RESPOSTA (IDCURSO,IDTURMA, IDFICHA, IDTOPICO, IDITEM, IDENTIDADE, DISCIPLINA, RESPOSTA, SENHA)
                     VALUES ($_SESSION[idCurso],$_SESSION[idTurma],$_SESSION[idFicha],$idTopico,$nomeRadio,'$_SESSION[identidadeInst]','$_SESSION[codDisciplina]',$resposta,$_SESSION[codAluno])";

            $resultadoi = ibase_query($conexao, $sqli);
         }

      }
      $sqli_REL = "update FA_RELACAO set RESPONDEU='S'
                where IDCURSO =$_SESSION[idCurso]
                and IDTURMA =$_SESSION[idTurma]
                and IDFICHA=$_SESSION[idFicha]
                and IDENTIDADE ='$_SESSION[identidadeInst]'
                and DISCIPLINA='$_SESSION[codDisciplina]'
                and IDALUNO = '$_SESSION[identidadeAluno]'";
      $Res_sqli_REL = ibase_query($conexao, $sqli_REL);
   }
   
   //---
  //Pega os Itens a serem cadastrados

   $sql_FAItens = "Select * From FA_Itens
                  where IDFICHA=  $_SESSION[idFicha]
                  order by IDITEM";
   $resultado = ibase_query($conexao, $sql_FAItens);


    //------------------------------------------------------------------------------------------
   //Insere Comentario  por topico
  //--------------------------------------------------------------------------------------------
   //conta numero de topicos da ficha

   $sql = "select idtopico from fa_topicos where idficha= $_SESSION[idFicha]";
   $resultSql = ibase_query($conexao,$sql);
   while($idTopico=ibase_fetch_assoc($resultSql))
   {
      $indice =comentario.$idTopico[IDTOPICO];
      $comentario=ltrim($_POST[$indice]);
      $comentarioArray[]=$comentario;

     if($comentario!="")
     {
       $sql_Respondeu = " Select idcurso From FA_COMENTARIOTOPICO
                    where IDCURSO =$_SESSION[idCurso]
                    and IDTURMA =$_SESSION[idTurma]
                    and IDFICHA=$_SESSION[idFicha]
                    and IDTOPICO=$idTopico[IDTOPICO]
                    and IDENTIDADE ='$_SESSION[identidadeInst]'
                    and SENHA = $_SESSION[codAluno]
                    and DISCIPLINA='$_SESSION[codDisciplina]'";


       $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
       $qtd = ibase_fetch_assoc($Res_Respondeu);

       if ($qtd[IDCURSO]!=null )
       {
          $sqli = "update FA_COMENTARIOTOPICO set COMENTARIO='$comentario'
                    where IDCURSO =$_SESSION[idCurso]
                    and IDTURMA =$_SESSION[idTurma]
                    and IDTOPICO=$idTopico[IDTOPICO]
                    and IDENTIDADE ='$_SESSION[identidadeInst]'
                    and SENHA = $_SESSION[codAluno]
                    and DISCIPLINA='$_SESSION[codDisciplina]'";
          $resultadoi = ibase_query($conexao, $sqli);

          $DataAtual= date('d/m/Y H:i:s',time());
          $DataAtual= $DataAtual.'C';
          $Comentarios= "Inserir Coment�rio - Disciplina ".Trim($_SESSION[codDisciplina]).' / Instrutor '.trim($_SESSION[identidadeInst]);
          $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
               values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";
          $resultado = ibase_query($conexao, $Comando);


       }
       else
       {
          $sqli = "insert into FA_COMENTARIOTOPICO (IDCURSO,IDTURMA, IDFICHA,IDTOPICO, IDENTIDADE, DISCIPLINA, SENHA,COMENTARIO)
                   VALUES ($_SESSION[idCurso],$_SESSION[idTurma],$_SESSION[idFicha],$idTopico[IDTOPICO],'$_SESSION[identidadeInst]','$_SESSION[codDisciplina]',$_SESSION[codAluno],'$comentario')";

          $resultadoi = ibase_query($conexao, $sqli);
           if($resultadoi)echo "DEU";
             $DataAtual= date('d/m/Y H:i:s',time());
             $DataAtual= $DataAtual.'C';
             $Comentarios= "Inserir Coment�rio - Disciplina ".trim($_SESSION[codDisciplina]).' / Instrutor '.trim($_SESSION[identidadeInst]);
             $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                    values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";
             $resultado = ibase_query($conexao, $Comando);

      }
   }
   if($comentarioArray=="")
   {
        $DataAtual= date('d/m/Y H:i:s',time());
        $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                   values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', 'Coment�rio em branco')";
        $resultado = ibase_query($conexao, $Comando);
   }
 }
          //------------------------------------------------------------------------------------------
   //Insere Comentario
  //--------------------------------------------------------------------------------------------
   $comentarioFinal = $_POST[comentario];
   if($comentarioFinal!="")
   {
     $sql_Respondeu = " Select count(1) as QTD From FA_COMENTARIO
                    where IDCURSO =$_SESSION[idCurso]
                    and IDTURMA =$_SESSION[idTurma]
                    and IDFICHA=$_SESSION[idFicha]
                    and IDENTIDADE ='$_SESSION[identidadeInst]'
                    and SENHA = $_SESSION[codAluno]
                    and DISCIPLINA='$_SESSION[codDisciplina]'";

     $Res_Respondeu = ibase_query($conexao, $sql_Respondeu);
     $qtd = ibase_fetch_assoc($Res_Respondeu);

     if ($qtd[QTD]> 0)
     {
        $sqli = "update FA_COMENTARIO set COMENTARIO='$comentarioFinal'
                    where IDCURSO =$_SESSION[idCurso]
                    and IDTURMA =$_SESSION[idTurma]
                    and IDENTIDADE ='$_SESSION[identidadeInst]'
                    and SENHA = $_SESSION[codAluno]
                    and DISCIPLINA='$_SESSION[codDisciplina]'";
         $resultadoi = ibase_query($conexao, $sqli);

         $DataAtual= date('d/m/Y H:i:s',time());
         $DataAtual= $DataAtual.'C';
         $Comentarios= "Inserir Coment�rio - Disciplina ".Trim($_SESSION[codDisciplina]).' / Instrutor '.trim($_SESSION[identidadeInst]);
         $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
              values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";
         $resultado = ibase_query($conexao, $Comando);


      }
      else
      {
         $sqli = "insert into FA_COMENTARIO (IDCURSO,IDTURMA, IDFICHA, IDENTIDADE, DISCIPLINA, SENHA,COMENTARIO)
                  VALUES ($_SESSION[idCurso],$_SESSION[idTurma],$_SESSION[idFicha],'$_SESSION[identidadeInst]','$_SESSION[codDisciplina]',$_SESSION[codAluno],'$comentarioFinal')";

         $resultadoi = ibase_query($conexao, $sqli);

         $DataAtual= date('d/m/Y H:i:s',time());
         $DataAtual= $DataAtual.'C';
         $Comentarios= "Inserir Coment�rio - Disciplina ".trim($_SESSION[codDisciplina]).' / Instrutor '.trim($_SESSION[identidadeInst]);
         $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                    values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";
         $resultado = ibase_query($conexao, $Comando);


      }
   }else
   {
        $DataAtual= date('d/m/Y H:i:s',time());
        $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
                   values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', 'Coment�rio em branco')";
        $resultado = ibase_query($conexao, $Comando);
   }

    //------------------------------------------------------------------------------------------
   //Finaliza processo
  //--------------------------------------------------------------------------------------------

 
 
    //------------------------------------------------------------------------------------------
   //Finaliza processo
  //--------------------------------------------------------------------------------------------

  echo "<script language='javascript' type='text/javascript'>
         alert('Ficha inserida com sucesso! Obrigado!');
         window.location='Principal.php';
        </script>";
?>

</body>
</html>

