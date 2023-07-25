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
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");

    //---
   //-- Seta a Cor de acordo com as Fichas

   function setCor($status)
   {
        if($status==0)
           $cor =  "#FF9D3C";
        if($status==1)
           $cor = "#6AB5FF";
        if($status==2)
           $cor =  "#C0FFC0" ;
           
        return $cor;
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
<body onload="popup('400','300');">
<div id="corpo">
<div id="barra" align="left"><a href='ListaFichas.php' target='_self' > << Mudar Curso</a></div>
<div id="conteudo">
<form name="form1" method="POST" action="registrarSessao.php">
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
          and (fa.IDCURSO = mc.IDCURSO and fa.DISCIPLINA = mc.CODMATERIA)
          order by fa.status asc";

   $ResSql01 = ibase_query($conexao, $sql);
      // echo"$sql";

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
                   order by fa.status asc";

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
         and (fa.IDCURSO = mc.IDCURSO and fa.DISCIPLINA = mc.CODMATERIA)
         order by  fa.status asc";

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
         order by fa.status asc";

  $ResSql04 = ibase_query($conexao, $sql);

  $NomeCurso=ibase_fetch_assoc($ResSqlCurso);
      
  echo "<BR><BR>";

  echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
  echo "<option >Relátorios do  -- $NomeCurso[CODCURSO]--</option>";

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

     //$cor= setCor($dados02[STATUS]);
     //echo "<option value= $var03 style='background:$cor'>- $Var01</option>";    FICHA DE FINAL DE CURSO
     echo "<option value= $var04 style='background:$cor'>- $Var02</option>";      //EXTRATO DE CURSO
   }


   echo "</select>";

?>

</form>
</div>
</div>

</body>
</html>
