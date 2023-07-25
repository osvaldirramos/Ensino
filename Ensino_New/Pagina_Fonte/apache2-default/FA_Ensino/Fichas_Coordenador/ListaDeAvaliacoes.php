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
   require_once("../verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");
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
<div align="center" id="topo"><img src="../../imagem/topo.png"></div>
<div id="barra" align="left"><a href='ListaFichas.php' target='_self' > << Mudar Curso</a></div>

<br>
<div id="conteudo">
<form name="form1" method="POST" action="FichaCoordenador.php">

<?php
   $_SESSION[idCurso] = $_GET[curso];
   $_SESSION[idTurma] = $_GET[turma];

   $sql="Select codcurso
         From curso
         Where idcurso = $_SESSION[idCurso]";
   $ResSqlCurso=  ibase_query($conexao, $sql);

   // Ficha Avaliacao / Coordenador
   
   $sql= "select f.IdCurso, f.idTurma, f.Identidade,
                 extract(DAY from f.DataAvaliacao)|| '/' || extract(MONTH  from f.DataAvaliacao)|| '/' || extract(YEAR  from f.DataAvaliacao) as DataAvaliacao,
                 p.postograduacao, p.nomeguerra
          From fc_avaliacao f, pessoa p
          Where f.identidade = p.identidade
          and   f.IdCurso = $_SESSION[idCurso]
          and   f.IDTURMA = $_SESSION[idTurma]";
   
   $ResSql = ibase_query($conexao, $sql);
   echo "<BR><BR>";

   echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
   echo "<option >Relátorios do  -- $NomeCurso[CODCURSO]--</option>";
   while ($dados=ibase_fetch_assoc($ResSql))
   {
     $Var01.= ' - ';
     $Var01.= $dados[POSTOGRADUACAO];
     $Var01.= ' ';
     $Var01.= $dados[NOMEGUERRA];
     $Var01.= ' - ';
     $Var01.= $dados[DATAAVALIACAO];

     echo "<option value= $dados[IDENTIDADE]>- $Var01 -  </option>";
  }

   echo "</select>";
?>

</form>
</div>
</div>

</body>
</html>
