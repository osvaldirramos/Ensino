<?php
  //----------------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : RelacaoFichasNaoRespondidas.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a lista de selecao das Fichas
  //                             que serao apresentadas.     //
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          : Maj Sônia
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 18/06/2009
  //
  //----------------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------------

   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html;" />
   <title>AVALIAÇÃO</title>
   <link href="menu_esq.css" rel="stylesheet" type="text/css" />
   <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
   <link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="corpo">
<div id="barra" align="left"><a href='RelacaoFichasNaoRespondidas.php' target='_self' > << Mudar Curso</a></div>

<BR>

<BR>
<p>&nbsp;</p>
   <div align="center">
   <form name="form1" method="POST" action="RelacaoPessoasNaoResponderam.php">

<?php
   $idCurso= substr($_POST[ListaDeCursos],0,4);
   $idTurma= substr($_POST[ListaDeCursos],3,4);

   echo "</br>";
   echo "</br>";

     //----------------------------------------------------------------------------------------
    //--- Tratamento para mostrar os alunos que nao responderam para o Coordenador
   //------------------------------------------------------------------------------------------
   $sql_Curso = "Select CodCurso, turma
                 From Turma_View
                 where IDCURSO = $idCurso
                 and IDTURMA = $idTurma";
   $ResCurso = ibase_query($conexao, $sql_Curso);
   $dado_Curso=ibase_fetch_assoc($ResCurso);
   

   echo "<table border='0'  ><tr bgcolor='#cccccc'height='30'><td width='755' >RELAÇÃO DE FICHAS NÃO RESPONDIDAS DO CURSO $dado_Curso[CODCURSO] - Turma $dado_Curso[TURMA] </td>
         </tr>";

   $sql_FichasAvl= "select a.IdCurso, a.IdTurma, a.IdFicha, a.Identidade, a.Disciplina,
                    extract(day from a.DataAvaliacao)||'/'||extract(month from a.DataAvaliacao)||'/'||extract(year from a.DataAvaliacao) as dataavaliacao,
                    a.Disponivel, a.IdCoordenador, m.cabecalho
                    From FA_Modelo m, FA_Avaliacao a
                    where a.IDCURSO = $idCurso
                    and a.IDTURMA = $idTurma
                    and   a.IdFicha = m.IdFicha
                    order by a.DataAvaliacao desc ";
   $Res_sqlFicha = ibase_query($conexao,$sql_FichasAvl );

   while($FichaAvl = ibase_fetch_assoc($Res_sqlFicha))
   {
       $Cabec = 0;
       $sql_Relacao= "Select r.postograduacao, r.nomeguerra
                      From FA_RelacaoFichasNaoRespondidas r
                      Where idcurso = $FichaAvl[IDCURSO]
                      and r.idturma = $FichaAvl[IDTURMA]
                      and r.idficha = $FichaAvl[IDFICHA]
                      and r.identidade like '%$FichaAvl[IDENTIDADE]%'
                      and r.disciplina = '$FichaAvl[DISCIPLINA]'
                      order by r.nomeguerra ";
       $Res_sqlRelacao = ibase_query($conexao,$sql_Relacao );
       while($Relacao = ibase_fetch_assoc($Res_sqlRelacao))
       {
          if ( $Cabec == 0)
          {
             $contCor++;
                          if($contCor%2==0){
                             $cor="#E0E0E0"; }
                          else                 {
                             $cor="#EAEAEA";   }


             echo "<tr bgcolor='$cor'><td width='750'>
                   Data Avaliação: $FichaAvl[DATAAVALIACAO]  <BR>
                    Ficha de Avaliação: <strong>$FichaAvl[CABECALHO]</strong>  <BR>";
             if ($FichaAvl[DISCIPLINA] != '000000')
             {
                //--- Pega o CodDisciplina e a Descricao

                $Sql_Disciplina = "Select NomeMateria
                                   From MateriaCurso
                                   where idcurso = $FichaAvl[IDCURSO]
                                   and CodMateria = '$FichaAvl[DISCIPLINA]'";
                $Res_Disciplina = ibase_query($conexao,$Sql_Disciplina );
                $Disciplina = ibase_fetch_assoc($Res_Disciplina);

                echo "Disciplina Avaliada: $FichaAvl[DISCIPLINA] - $Disciplina[NOMEMATERIA] <BR>";
             }

             if ($FichaAvl[IDENTIDADE] != '000000')
             {
                if ($FichaAvl[CABECALHO] != 'FICHA DE OPINIÃO DO DOCENTE')
                {
                   //--- Pega o Instrutor

                   $Sql_Instrutor = "Select PostoGraduacao, Nomeguerra
                                     From pessoa
                                     Where identidade like '%$FichaAvl[IDENTIDADE]%'";
                   $Res_Instrutor = ibase_query($conexao,$Sql_Instrutor );
                   $Instrutor = ibase_fetch_assoc($Res_Instrutor);
                    
                   if ($Instrutor <> '')
                   {
                      echo "Instrutor Avaliado: $Instrutor[POSTOGRADUACAO] - $Instrutor[NOMEGUERRA] <BR>";
                   }
                }
             }
          echo "<BR>";
          }
          echo "$Relacao[POSTOGRADUACAO] - $Relacao[NOMEGUERRA] <BR>";
          $Cabec = 1;
       }
       echo "<BR>";
       Echo "</td> </tr>";
    }
    Echo "</table>";
?>

</body>
</html>
