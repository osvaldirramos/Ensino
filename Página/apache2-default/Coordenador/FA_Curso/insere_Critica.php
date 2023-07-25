<?
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : insere_Critica.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de inserir as respostas dos alunos
  //                             da Ficha de Avaliação de Curso.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj Sônia
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 22/06/2009
  //
  //----------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------

   session_start();
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/conecta.inc");
?>

<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="../estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>
   <head>
   <body>
<?php

   $Instrutor= $_POST[Instrutor];
   $Disciplina= $_POST[Disciplina];
   $Critica= $_POST[Critica];
   $Comentario= $_POST[comentario];
   $SetorCriticado= $_POST[outros];
   $DataAtual= date('d/m/Y H:i:s',time());

    if ($Disciplina == "--- Selecione aqui a disciplina avaliada")
       $Disciplina= "000000";

    if ($Instrutor == "--- Selecione aqui o docente avaliado")
       $Instrutor= "000000";

    if ($Critica == 1)
       $SetorCriticado= 'Instrução';
    else
       if ($Critica == 2)
           $SetorCriticado= 'Curso';
       else
          if ($Critica == 3)
              $SetorCriticado= 'Docente';

    $Sql_IdCritica = "Select max(IdCritica) as Maior
                      From FA_CRITICAESPONTANEA
                      where IdCurso = $_SESSION[idCurso]
                      and idTurma = $_SESSION[idTurma]";


   $Res_IdCritica=ibase_query($conexao,$Sql_IdCritica);
   $IdCritica=ibase_fetch_assoc($Res_IdCritica);

   if ($IdCritica[MAIOR] == '')
       $IdCritica= 1;
   else
      $IdCritica= $IdCritica[MAIOR]+1;
   
   // Insere a Critica realizada

   $Data= date('d/m/Y',time());
   $sqli = "insert into FA_CRITICAESPONTANEA (IDCURSO, IDTURMA, IDCRITICA, DISCIPLINA, IDINSTRUTOR, IDCRITICADOR, SETORCRITICADO, DATAAVALIACAO, COMENTARIO, FUNCAO)
                     VALUES ($_SESSION[idCurso],$_SESSION[idTurma],$IdCritica,'$Disciplina', '$Instrutor','$_SESSION[identidadeAluno]','$SetorCriticado', '$Data','$Comentario', '$_SESSION[IdUsuario]')";
   $resultadoi = ibase_query($conexao, $sqli);

   $Comentarios= "Inserir Critica Espontanea ";
   $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data, COMENTARIOS)
              values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual', '$Comentarios')";
   $resultado = ibase_query($conexao, $Comando);

   echo "<script language='javascript' type='text/javascript'>
          alert('Critica inserida com sucesso! Obrigado!');
          window.location='ListaDeAvaliacoes.php';
         </script>";
   
   
?>

</body>
</html>

