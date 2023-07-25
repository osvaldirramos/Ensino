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
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../apc.css" rel="stylesheet" type="text/css">
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>
</head>
<body onload="popup('400','300');">
<div id="corpo">
<div align="center" id="topo"><img src="../../imagem/topo.png"></div>
<div id="barra" align="left"> </div>

<br>
<div id="conteudo">
<form name="form1" method="POST" action="montapagina.php">

<?php
   echo "<div>";

   echo "<input type='radio' name='grafico' id='bars' value='bars' checked>";
   echo "<img src='../image/barra.gif' width='30' height='30' border='0'>";
   echo "<input type='radio' name='grafico' id='line' value='lines'>";
   echo "<img src='../../imagem/line.png' width='30' height='30' border='0'>";
   echo "</br>";
   
   $sql="Select codcurso
         From curso
         Where idcurso = $_SESSION[idCurso]";
   $ResSqlCurso=  ibase_query($conexao, $sql);

   // Avaliacao Disciplina por Instrutor

   $sql= "Select fa.IdFicha,fa.IDENTIDADE,
               extract(day from fa.DataAvaliacao)||'/'||extract(month from fa.DataAvaliacao)||'/'||extract(year from fa.DataAvaliacao) as DataAvaliacao,
               pe.identidade, pe.postograduacao, pe.nomeguerra,
               mc.codmateria, mc.nomemateria as nomemateria,
               mo.cabecalho
          From FA_Avaliacao fa, Pessoa pe, fa_modelo mo, materiacurso mc
          where fa.IDCURSO = $_SESSION[idCurso]
          and fa.IDTURMA = $_SESSION[idTurma]
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
  echo "<option onchange='#' >Relátorios do  -- $NomeCurso[CODCURSO]--</option>";
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

     if(strlen($dados01[IDFICHA])==1)
     {
        $var02.= "0";
        $var02.= "$dados01[IDFICHA]";
        $var02.= "$dados01[CODMATERIA]";
        $var02.= "$espacoEsq";                            //mod -in
        $var02.= "$espacoDir";                            //mod -in
        $var02.= "$identidade";         //mod                   //DISCPLINA NULA
     }
     else
     {
        $var02.= "$dados01[IDFICHA]";
        $var02.= "$dados01[CODMATERIA]";
        $var02.= "$espacoEsq";                            //mod -in
        $var02.= "$espacoDir";                            //mod -in
        $var02.= "$identidade";         //mod                   //DISCPLINA NULA
     }
          

     echo "<option value= $var02>- $Var01-  $dados01[IDENTIDADE]</option>";
  }

   //---
  //--- Monta a opcao Avaliacao Final de Curso e o "EXTRATO DO CURSO"

  while ($dados02=ibase_fetch_assoc($ResSql02))
  {
     $var03 = "";
     $Var01= $dados02[CABECALHO];
     $Var01.= ' - ';
     $Var01.= $dados02[DATAAVALIACAO];

     $Var02= "EXTRATO DO CURSO";
     $Var02.= ' - ';
     $Var02.= $dados02[DATAAVALIACAO];

     if(strlen($dados02[IDFICHA])==1)
     {
        $var03.= "0";
        $var03.= "$dados02[IDFICHA]";
        $var03.= "000000";               //DISCIPLINA NULA
        $var03.= "00000000";               //IDENTIDADE NULA
     }
     else
     {
        $var03.= "$dados02[IDFICHA]";
        $var03.= "000000";               //DISCIPLINA NULA
        $var03.= "00000000";               //IDENTIDADE NULA
     }
     $var04.= "00";                       // Codigo para identificar o "EXTRATO DO CURSO"
     $var04.= "000000";                  //DISCIPLINA NULA
     $var04.= "00000000";               //IDENTIDADE NULA

     echo "<option value= $var03>- $Var01</option>";
     echo "<option value= $var04>- $Var02</option>";
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

?>

</form>
</div>
</div>

</body>
</html>
