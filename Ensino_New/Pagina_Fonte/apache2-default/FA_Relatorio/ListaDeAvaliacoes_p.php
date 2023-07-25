<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : ListaDeAvaliacoes.php                          //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a lista de  //
  //                             selecao das Fichas que serao apresentadas.     //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 18/06/2009                                     //
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
   require("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   $data = date("d.m.Y 00:00");

      //---
   //-- Seta a Cor de acordo com as Fichas

   function setCor($status)
   {
        if($status==0)
           $cor = "#FFFFFF";  //status inicial  - branca
        if($status==1)
           $cor = "#6AB5FF"; //lida - azul
        if($status==2)
           $cor = "#C0FFC0" ; //enviada  - verde
        if($status==3)
           $cor = "#FF8080" ; //incompleta - vermelha
        if($status==4)
           $cor = "#EEEEEE" ; //completa sem marcação - cinza
           
        return $cor;
   }
   

   function setStatus($IdCurso,$IdTurma,$IdFicha,$Identidade,$CodDisciplina )
   {

       require("Funcoes/conecta.inc");
       
       //Pega numero de aluno participantes da avaliação
       $status= 0;
       $sql_avaliadores="select count(1) QDEALUNOS
                        from fa_relacao where idcurso=$IdCurso
                        and idturma = $IdTurma
                        and idficha = $IdFicha
                        and identidade ='$Identidade'
                        and disciplina = '$CodDisciplina'
                        and respondeu = 'N'";
       $Res_avaliadores=ibase_query($conexao,$sql_avaliadores);
       $avaliadores=ibase_fetch_assoc($Res_avaliadores);

       if($avaliadores[QDEALUNOS]>0)
       {
          $status= 3;
       }
       else
       {
          $sql_status="update FA_AVALIACAO set status=4
                                 WHERE IDCURSO = $IdCurso
                                 AND IDTURMA = $IdTurma
                                 AND IDFICHA = $IdFicha
                                 AND IDENTIDADE = '$Identidade'
                                 AND DISCIPLINA = '$CodDisciplina'";
          $Res_status=ibase_query($conexao,$sql_status);
       }

       return $status;
   }


   function getStatus($IdCurso,$IdTurma,$IdFicha,$Identidade,$CodDisciplina)
   {
      require("Funcoes/conecta.inc");
      $sql_status="select status from FA_AVALIACAO
                                 WHERE IDCURSO = $IdCurso
                                 AND IDTURMA = $IdTurma
                                 AND IDFICHA = $IdFicha
                                 AND IDENTIDADE = '$Identidade'
                                 AND DISCIPLINA = '$CodDisciplina'";
      $Res_status=ibase_query($conexao,$sql_status);
      $statusFicha= ibase_fetch_assoc($Res_status);

      return $statusFicha[STATUS];
   }


   
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>
</head>
<body>
<div id="corpo">
<div id="barra" align="left"><a href='ListaFichas.php' target='_self' > << Mudar Curso</a></div>
<br>
<div id="conteudo">
<form name="form1" method="POST" action="registrarSessao.php">
<div align="center"><p class= 'style3'>Escolha da Ficha.</p></div>

<br><br>
<table border="0" width="100%">
<tr>
  <td bgcolor=#EEEEEE>&nbsp;completa</td>
  <td bgcolor=#6AB5FF>&nbsp;lida</td>
  <td bgcolor=#C0FFC0>&nbsp;enviada</td>
  <td bgcolor=#FF8080>&nbsp;incompleta</td>
</tr>
</table>
<?php

   $sql="Select codcurso
         From curso
         Where idcurso = $_SESSION[idCurso]";
   $ResSqlCurso=  ibase_query($conexao, $sql);

   // Avaliacao Disciplina por Instrutor
    $sql= "Select fa.IdFicha,fa.IDENTIDADE,  fa.STATUS,
               extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
               pe.identidade, pe.postograduacao, pe.nomeguerra,
               mc.codmateria, mc.nomemateria as nomemateria,
               mo.cabecalho
          From FA_Avaliacao fa, Pessoa pe, fa_modelo mo, materiacurso mc
          where fa.IDCURSO = $_SESSION[idCurso]
          and fa.IDTURMA = $_SESSION[idTurma]
          and fa.IDENTIDADE = pe.IDENTIDADE
          and fa.IDFICHA = mo.IDFICHA
          and (fa.IDCURSO = mc.IDCURSO and fa.IDTurma = mc.IDTurma and fa.DISCIPLINA = mc.CODMATERIA)
          and DataAvaliacao <= '$data'
          order by fa.status,DataAvaliacao, fa.IdFicha, pe.nomeguerra  ";
   $ResSql01 = ibase_query($conexao, $sql);

   // Avaliacao Curso

   $sql= "Select fa.IdFicha,   fa.STATUS,
               extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
               Cast( '' As Char(25)) as postograduacao,Cast( '' As Char(20)) as nomeguerra,
               Cast( '' As Char(120)) as nomemateria,
               mo.cabecalho
         From FA_Avaliacao fa, fa_modelo mo
         where IDCURSO = $_SESSION[idCurso]
         and IDTURMA = $_SESSION[idTurma]
         and fa.identidade = '000000'
         and fa.Disciplina = '000000'
         and fa.idficha = mo.idficha
         and DataAvaliacao <= '$data'
         order by fa.status,DataAvaliacao, fa.IdFicha  ";
     $ResSql02 = ibase_query($conexao, $sql);

   // Avaliacao Disciplina

   $sql= "Select fa.IdFicha, fa.STATUS,
               extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
               Cast( '' As Char(25)) as postograduacao,Cast( '' As Char(20)) as nomeguerra,
               mc.codmateria, mc.nomemateria as nomemateria,
               mo.cabecalho
         From FA_Avaliacao fa, fa_modelo mo, materiacurso mc
         where fa.IDCURSO = $_SESSION[idCurso]
         and fa.IDTURMA = $_SESSION[idTurma]
         and fa.identidade ='000000'
         and fa.IDFICHA = mo.IDFICHA
         and (fa.IDCURSO = mc.IDCURSO and fa.IDTurma = mc.IDTurma and fa.DISCIPLINA = mc.CODMATERIA)
         and DataAvaliacao <= '$data'
         order by  fa.status,DataAvaliacao, fa.IdFicha   ";
   $ResSql03 = ibase_query($conexao, $sql);

   // Avaliacao do Instrutor

   $sql= "Select fa.IdFicha, fa.IDENTIDADE, fa.STATUS,
                extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
                pe.postograduacao, pe.nomeguerra,
                Cast( '' As Char(120)) as nomemateria,
                mo.cabecalho
         From FA_Avaliacao fa, Pessoa pe, fa_modelo mo
         where fa.IDCURSO = $_SESSION[idCurso]
         and fa.IDTURMA = $_SESSION[idTurma]
         and fa.disponivel = 'S'
         and fa.DISCIPLINA='000000'
         and fa.IDENTIDADE = pe.IDENTIDADE
         and fa.IDFICHA = mo.IDFICHA
         and DataAvaliacao <= '$data'
         order by fa.status,DataAvaliacao, fa.IdFicha , pe.nomeguerra ";
   $ResSql04 = ibase_query($conexao, $sql);
   $NomeCurso=ibase_fetch_assoc($ResSqlCurso);
      
   echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
   echo "<option >Relatórios do  -- $NomeCurso[CODCURSO]--</option>";
   while ($dados01=ibase_fetch_assoc($ResSql01))
   {
      $var02= "";
      $var02="";
      $Var01.= ' - ';
      $Var01= $dados01[IDFICHA];
      $Var01.= ' - ';
      $Var01= $dados01[CABECALHO];
      $Var01.= ' - ';
      $Var01.= $dados01[POSTOGRADUACAO];
      $Var01.= ' ';
      $Var01.= $dados01[NOMEGUERRA];
      $Var01.= ' - ';
      $Var01.= $dados01[NOMEMATERIA];
      $Var01.= ' - ';
      $Var01.= $dados01[DATAAVALIACAO];

      $contIdentidade = strlen($dados01[IDENTIDADE]);      //20
      $semEsqIdentidade=ltrim($dados01[IDENTIDADE]);
      $contIdentidadeEsq= strlen($semEsqIdentidade);
      $semDirIdentidade=rtrim($dados01[IDENTIDADE]);
      $contIdentidadeDir= strlen($semDirIdentidade);

      $espacoEsq =   $contIdentidade - $contIdentidadeEsq;
      $espacoDir =   $contIdentidade - $contIdentidadeDir;

      $identidade =trim($dados01[IDENTIDADE]);        //RETIRA ESPAÇO EM BRANCO
      $contIdentidadeDirEsq= strlen($identidade);

      $paramEsq = $espacoEsq + $contIdentidadeDirEsq ;
      $paramDir = $espacoDir + $contIdentidadeDirEsq ;

      $identidadeComEsq= str_pad("$identidade",$paramEsq," ", STR_PAD_LEFT) ;
      $identidadeCompleta= str_pad("$identidadeComEsq",20," ", STR_PAD_RIGHT) ;

      if(strlen($dados01[IDFICHA])==1)
      {
         $var02.= "0";
         $var02.= "$dados01[IDFICHA]";
         $var02.= "}$dados01[CODMATERIA]";
         $var02.= "}$espacoEsq";                            //mod -in
         $var02.= "}$espacoDir";                            //mod -in
         $var02.= "}$identidade";         //mod                   //DISCPLINA NULA
      }
      else
      {
         $var02.= "}$dados01[IDFICHA]";
         $var02.= "}$dados01[CODMATERIA]";
         $var02.= "}$espacoEsq";                            //mod -in
         $var02.= "}$espacoDir";                            //mod -in
         $var02.= "}$identidade";         //mod                   //DISCPLINA NULA
      }

      $status= getStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados01[IDFICHA],$dados01[IDENTIDADE],$dados01[CODMATERIA]);
      if ($status == 0)
          $status=setStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados01[IDFICHA],$dados01[IDENTIDADE],$dados01[CODMATERIA]);
      $cor=setCor($status);
      echo "<option value= $var02 style='background:$cor'>- $Var01 -  $dados01[IDENTIDADE] ,$dados01[CODMATERIA]  </option>";
   }

    //---
   //--- Monta a opcao Avaliacao Final de Curso e o "EXTRATO DO CURSO"
   while ($dados02=ibase_fetch_assoc($ResSql02))
   {
 
      $Var01= $dados02[CABECALHO];
      $Var01.= ' - ';
      $Var01.= $dados02[DATAAVALIACAO];

      $Var02= "EXTRATO DO CURSO";
      $Var02.= ' - ';
      $Var02.= $dados02[DATAAVALIACAO];
      
   //alterado 28/09/2015 Germano para desvincular  o extrato da ficha final de curso, ESSA ALTERAÇÃO CAUSOU ERRO NO EXTRATO POR ISSO FOI COMENTADA EM 23/11/2015    
   //   if(strlen($dados02[IDFICHA])==1)
   //   {
   //      $var03.= "0";
   //      $var03.= "$dados02[IDFICHA]";
   //      $var03.= "}000000";               //DISCIPLINA NULA
   //      $var03.= "}000000";               //IDENTIDADE NULA      modificado de 8 para 6 zeros/
   // echo "<option value= $var03 style='background:$cor'>- $Var01 - $dados01[IDENTIDADE],$dados01[CODMATERIA]   </option>";  
   //   }
   //    else
   //   {
   //      $var04.= "00";                       // Codigo para identificar o "EXTRATO DO CURSO"
   //     $var04.= "}000000";                  //DISCIPLINA NULA
   //      $var04.= "}000000";               //IDENTIDADE NULA      modificado de 8 para 6 zeros
   //      echo "<option value= $var04 style='background:$cor'>- $Var02 - $dados01[IDENTIDADE],$dados01[CODMATERIA]    </option>";
   // }
   //  $status=getStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados02[IDFICHA],'000000','000000');
   //  if ($status == 0)
   //      $status=setStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados02[IDFICHA],'000000','000000');
   //  $cor=setCor($status);
   //  echo "<option value= $var04 style='background:$cor'>- $Var02 - $dados01[IDENTIDADE],$dados01[CODMATERIA]    </option>";

      
      $var04.= "00";                       // Codigo para identificar o "EXTRATO DO CURSO"
      $var04.= "}000000";                  //DISCIPLINA NULA
      $var04.= "}000000";               //IDENTIDADE NULA      modificado de 8 para 6 zeros

      if(strlen($dados02[IDFICHA])==1)
      {
         $var03.= "0";
         $var03.= "$dados02[IDFICHA]";
         $var03.= "}000000";               //DISCIPLINA NULA
         $var03.= "}000000";               //IDENTIDADE NULA      modificado de 8 para 6 zeros
      }
      else
      {
         $var03.= "$dados02[IDFICHA]";
         $var03.= "}000000";               //DISCIPLINA NULA
         $var03.= "}000000";               //IDENTIDADE NULA       modificado de 8 para 6 zeros
      }
      $status=getStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados02[IDFICHA],'000000','000000');
      if ($status == 0)
          $status=setStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados02[IDFICHA],'000000','000000');
      $cor=setCor($status);
      echo "<option value= $var03 style='background:$cor'>- $Var01 - $dados01[IDENTIDADE],$dados01[CODMATERIA]   </option>";  
      echo "<option value= $var04 style='background:$cor'>- $Var02 - $dados01[IDENTIDADE],$dados01[CODMATERIA]    </option>";
   }

   while ($dados03=ibase_fetch_assoc($ResSql03))
   {
      $var04= "";
      $Var01= $dados03[IDFICHA];
      $Var01.= ' - ';
      $Var01= $dados03[CABECALHO];
      $Var01.= ' - ';
      $Var01.= $dados03[NOMEMATERIA];
      $Var01.= ' - ';
      $Var01.= $dados03[DATAAVALIACAO];

      if(strlen($dados03[IDFICHA])==1)
      {
         $var04.= "0";
      }
      $var04.= "$dados03[IDFICHA]";
      $var04.= "}$dados03[CODMATERIA]";
      $var04.= "}000000";               //IDENTIDADE NULA       modificado de 8 para 6 zeros

      $status=getStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados03[IDFICHA],$dados03[IDENTIDADE],$dados03[CODMATERIA]);
      if ($status == 0)
          $status=setStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados03[IDFICHA],$dados03[IDENTIDADE],$dados03[CODMATERIA]);
      $cor=setCor($status);
      echo "<option value= $var04 style='background:$cor'>- $Var01 - $dados01[IDENTIDADE],$dados01[CODMATERIA]  </option>";
   }

   while ($dados04=ibase_fetch_assoc($ResSql04))
   {
      $var05 = "";
      $Var01= $dados04[IDFICHA];
      $Var01.= ' - ';
      $Var01= $dados04[CABECALHO];
      $Var01.= ' - ';
      $Var01.= $dados04[POSTOGRADUACAO];
      $Var01.= ' ';
      $Var01.= $dados04[NOMEGUERRA];
      $Var01.= ' - ';
      $Var01.= $dados04[DATAAVALIACAO];
      $x=strlen($dados04[IDENTIDADE]);

      if(strlen($dados04[IDFICHA])==1)
      {
         $var05.= "0";
      }
      $contIdentidade = strlen($dados04[IDENTIDADE]);      //20
          
      $semEsqIdentidade=ltrim($dados04[IDENTIDADE]);
      $contIdentidadeEsq= strlen($semEsqIdentidade);
          
      $semDirIdentidade=rtrim($dados04[IDENTIDADE]);
      $contIdentidadeDir= strlen($semDirIdentidade);

      $espacoEsq =   $contIdentidade - $contIdentidadeEsq;
      $espacoDir =   $contIdentidade - $contIdentidadeDir;

      $identidade =trim($dados04[IDENTIDADE]);        //RETIRA ESPAÇO EM BRANCO
      $contIdentidadeDirEsq= strlen($identidade);

      $paramEsq = $espacoEsq + $contIdentidadeDirEsq ;
      $paramDir = $espacoDir + $contIdentidadeDirEsq ;

      $identidadeComEsq= str_pad("$identidade",$paramEsq," ", STR_PAD_LEFT) ;
      $identidadeCompleta= str_pad("$identidadeComEsq",20," ", STR_PAD_RIGHT) ;

      $conc=strlen($identidadeCompleta);

      $var05.= "$dados04[IDFICHA]";
      $var05.= "}000000";
      $var05.= "}$espacoEsq";                            //mod -in
      $var05.= "}$espacoDir";                            //mod -in
      $var05.= "}$identidade";         //mod                   //DISCPLINA NULA

      $status= getStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados04[IDFICHA],$dados04[IDENTIDADE],'000000');
      if ($status == 0)
          $status=setStatus($_SESSION[idCurso],$_SESSION[idTurma],$dados04[IDFICHA],$dados04[IDENTIDADE],'000000');
      $cor=setCor($status);
      echo "<option value= $var05 style='background:$cor'>- $Var01  - $dados01[IDENTIDADE],$dados01[CODMATERIA]  </option>";
   }
   echo "</select>";

?>

</form>
</div>
</div>
</body>
</html>
