<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : addParecer.php                                //
  //                                                                            //
  // DESCRICAO                 : Adiciona parecer ao formulario de proviencias  //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/9/2010                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//
   session_start();
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   include("../Funcoes/conecta.inc");

     //----
    // Verifica se a secao ja foi cadastrada
   //----
   
   function VerificarSecao($idCurso,$idTurma,$divisao)
   {
         include("../Funcoes/conecta.inc");
         $sql="select count(1) as qtd from fp_providencia
                   where idcurso=$idCurso
                   and idturma=$idTurma
                   and idsecao=$divisao";
         $resSql=ibase_query($conexao,$sql);
         $linhas=ibase_fetch_assoc($resSql);

         if($linhas[QTD]>0)
         {
           echo "<script language='javascript' type='text/javascript'> alert('Já existe parecer desta Seção');window.location='montapagina_Aba.php';</script>";
         }
         return $linhas[QTD];

   }

      //---
     // Principal
    //----
    
   if($_POST[secaoAtual]=="")
   {
       if (VerificarSecao($_SESSION[idCurso],$_SESSION[idTurma],$_POST[divisao]) == 0)
       {

          $sql="insert into fp_providencia
                     (idcurso,idturma,idsecao,identidade,data,acao_recomendada,acao_executada)values
                     ($_SESSION[idCurso],$_SESSION[idTurma],$_POST[divisao],'$_SESSION[identidadeUsuario]','$_POST[dataAtual]','$_POST[txRecomendada]','$_POST[txExecutada]')";

          $resSql=ibase_query($conexao,$sql);
          header("Location:montapagina_Aba.php");
       }
   }
   else
   {

       $Retorno= 0;
       if ($_POST[secaoAtual] <> $_POST[divisao])
       {
          $Retorno= VerificarSecao($_SESSION[idCurso],$_SESSION[idTurma],$_POST[divisao]);
       }
       
       if ($Retorno == 0)
       {
          $sql="select count(1) as qtd from fp_providencia
                      where idcurso=$_SESSION[idCurso]
                      and idturma=$_SESSION[idTurma]
                      and idsecao=$_POST[secaoAtual]
                      and identidade='$_SESSION[identidadeUsuario]'";
          $resSql=ibase_query($conexao,$sql);
          $linhas=ibase_fetch_assoc($resSql);

          if($linhas[QTD]>0)
          {
            $sql="update fp_providencia set idcurso=$_SESSION[idCurso],
                                        idturma=$_SESSION[idTurma],
                                         idsecao=$_POST[divisao],
                                         identidade='$_SESSION[identidadeUsuario]',
                                         data='$_POST[dataAtual]',
                                         acao_recomendada='$_POST[txRecomendada]',
                                         acao_executada='$_POST[txExecutada]'
                        where idcurso=$_SESSION[idCurso]
                        and idturma=$_SESSION[idTurma]
                        and idsecao=$_POST[secaoAtual]
                        and identidade='$_SESSION[identidadeUsuario]'";
            $resSql=ibase_query($conexao,$sql);

            header("Location:montapagina_Aba.php");
         }
         else
         {
            $sql="insert into fp_providencia
                     (idcurso,idturma,idsecao,identidade,data,acao_recomendada,acao_executada)values
                     ($_SESSION[idCurso],$_SESSION[idTurma],$_POST[divisao],'$_SESSION[identidadeUsuario]','$_POST[dataAtual]','$_POST[txRecomendada]','$_POST[txExecutada]')";

            $resSql=ibase_query($conexao,$sql);
            header("Location:montapagina_Aba.php");
         }
      }
   }
?>
