<?php
   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   //include("ListaFichas.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="apc.css" rel="stylesheet" type="text/css">
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>

<script>
function popup(largura, altura){

//window.open('aluno.php','Instrutor','width='+largura+',height='+altura+',left=250,top=200');

//window.open('instrutor.php','Aluno','width='+largura+',height='+altura+',left=650,top=200');

window.open('ListaDeAvaliacoes_p.php','Relatorio','width=770,height=700,left=250,top=200,scrollbars=yes, status=yes, toolbar=no, location=yes, menubar=yes, resizable=yes ');

}

</script>
</head>
<body onload="popup('400','300');">
<div id="corpo">
<br>
<div id="conteudo">
<form name="form1" method="POST" action="montapagina.php">
   <?php

      //if ($_SESSION[contador]<0){
      //$_SESSION[idCurso] = $_SESSION[idCurso];
      //$_SESSION[idTurma] = $_SESSION[idCurso];
      //}else{
      $_SESSION[idCurso] = $_GET[curso];
      $_SESSION[idTurma] = $_GET[turma];
      //$_SESSION[questionado] = $_GET[questionado];
      $_SESSION[tipo] = $_GET[grafico];
      //$_SESSION[contador]++;
                            //  }
 /*
     // echo "$_SESSION[idTurma]";

      $sql="Select codcurso from curso
                  where idcurso = $_SESSION[idCurso]";
      $ResSqlCurso=  ibase_query($conexao, $sql);
      // echo "$sql";

      // Avaliacao Disciplina por Instrutor

  	  $sql= "Select fa.IdFicha,fa.IDENTIDADE,
               extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
               pe.identidade, pe.postograduacao, pe.nomeguerra,
               mc.codmateria, mc.nomemateria as nomemateria,
               mo.cabecalho
           From FA_Avaliacao fa, Pessoa pe, fa_modelo mo, materiacurso mc
           where fa.IDCURSO = $_SESSION[idCurso]
           and fa.IDTURMA = $_SESSION[idTurma]
           and fa.disponivel = 'S'
           and fa.IDENTIDADE = pe.IDENTIDADE
           and fa.IDFICHA = mo.IDFICHA
           and (fa.IDCURSO = mc.IDCURSO and fa.DISCIPLINA = mc.CODMATERIA)";

      $ResSql01 = ibase_query($conexao, $sql);
      // echo"$sql";

      // Avaliacao Curso

  	  $sql= "Select fa.IdFicha,
                  extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
                  Cast( '' As Char(25)) as postograduacao,Cast( '' As Char(20)) as nomeguerra,
                  Cast( '' As Char(120)) as nomemateria,
                  mo.cabecalho
           From FA_Avaliacao fa, fa_modelo mo
           where IDCURSO = $_SESSION[idCurso]
           and IDTURMA = $_SESSION[idTurma]
           and fa.disponivel = 'S'
           and fa.identidade = '000000'
           and fa.Disciplina = '000000'
           and fa.idficha = mo.idficha";

      $ResSql02 = ibase_query($conexao, $sql);
      
      // Avaliacao Disciplina

      $sql= "Select fa.IdFicha,
                  extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
               Cast( '' As Char(25)) as postograduacao,Cast( '' As Char(20)) as nomeguerra,
               mc.codmateria, mc.nomemateria as nomemateria,
               mo.cabecalho
           From FA_Avaliacao fa, fa_modelo mo, materiacurso mc
           where fa.IDCURSO = $_SESSION[idCurso]
           and fa.IDTURMA = $_SESSION[idTurma]
           and fa.disponivel = 'S'
           and fa.identidade ='000000'
           and fa.IDFICHA = mo.IDFICHA
           and (fa.IDCURSO = mc.IDCURSO and fa.DISCIPLINA = mc.CODMATERIA)";

      $ResSql03 = ibase_query($conexao, $sql);

       // Avaliacao do Instrutor

  	  $sql= "Select fa.IdFicha, fa.IDENTIDADE,
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
           and fa.IDFICHA = mo.IDFICHA";

      $ResSql04 = ibase_query($conexao, $sql);

      $NomeCurso=ibase_fetch_assoc($ResSqlCurso);
      
      echo "<BR><BR>";

      echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
      echo "<option >Relátorios do  -- $NomeCurso[CODCURSO]--</option>";
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

         // $var02= $dados01[DATAAVALIACAO];
          //$var01 = $dados01[IDENTIDADE];

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

          if(strlen($dados01[IDFICHA])==1){
          $var02.= "0";
          $var02.= "$dados01[IDFICHA]";
          $var02.= "$dados01[CODMATERIA]";
          $var02.= "$espacoEsq";                            //mod -in
          $var02.= "$espacoDir";                            //mod -in
          $var02.= "$identidade";         //mod                   //DISCPLINA NULA
          }else{
          $var02.= "$dados01[IDFICHA]";
          $var02.= "$dados01[CODMATERIA]";
          $var02.= "$espacoEsq";                            //mod -in
          $var02.= "$espacoDir";                            //mod -in
          $var02.= "$identidade";         //mod                   //DISCPLINA NULA
          }
          

          echo "<option value= $var02>- $Var01-  $dados01[IDENTIDADE]</option>";
       }

       while ($dados02=ibase_fetch_assoc($ResSql02))
       {
          $var03 = "";
          $Var01= $dados02[CABECALHO];
          $Var01.= ' - ';
          $Var01.= $dados02[DATAAVALIACAO];

          //$var02= $dados02[DATAAVALIACAO];
          //$var02. = $dados02[IDENTIDADE];
          if(strlen($dados02[IDFICHA])==1){
          $var03.= "0";
          $var03.= "$dados02[IDFICHA]";
          $var03.= "000000";               //DISCIPLINA NULA
          $var03.= "00000000";               //IDENTIDADE NULA
          }else{
          $var03.= "$dados02[IDFICHA]";
          $var03.= "000000";               //DISCIPLINA NULA
          $var03.= "00000000";               //IDENTIDADE NULA
          }
          echo "<option value= $var03>- $Var01</option>";
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

          //$var02= $dados03[DATAAVALIACAO];
          //$var03. = $dados03[IDENTIDADE];
          if(strlen($dados03[IDFICHA])==1)
          {
             $var04.= "0";
          }
          $var04.= "$dados03[IDFICHA]";
          $var04.= "$dados03[CODMATERIA]";
          $var04.= "00000000";               //IDENTIDADE NULA


          echo "<option value= $var04>- $Var01</option>";
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

          //$var02= $dados04[DATAAVALIACAO];
          //$var04. = $dados04[IDENTIDADE];
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
          $var05.= "000000";
          $var05.= "$espacoEsq";                            //mod -in
          $var05.= "$espacoDir";                            //mod -in
          $var05.= "$identidade";         //mod                   //DISCPLINA NULA

          echo "<option value= $var05>- $Var01</option>";

       }

      echo "</select>";
      
   */
   ?>

</form>
</div>
</div>
</body>
</html>
