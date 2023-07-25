<?php
   session_start();
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/Funcoes.php");
   require_once("../../Funcoes/verifica_sessao.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>
</head>
<body>

<BR>
<div align='center'>FICHA DE AVALIAÇÃO DE CURSO</div>
<BR>
<div id="corpo">
<br>
<br>
<div id="conteudo">
<form name="form1" method="POST" action="montapagina.php">

<?php
    //---
   //--- Insere log de acesso

   $DataAtual= date('d/m/Y H:i:s',time());
   $Comando= "Insert into fa_acessos (IDCURSO, IDTURMA, IDENTIDADE, Data,COMENTARIO, COMENTARIOS)
              values ($_SESSION[idCurso], $_SESSION[idTurma], '$_SESSION[identidadeAluno]', '$DataAtual',
              'Logou no Sistema', 'Logou no Sistema')";
              
   $resultado = ibase_query($conexao, $Comando);

   $DataAtual= date('d.m.Y 00:00',time());
   $sql_Comando="select count(1) as Qtd
                from fa_NaoRespondidas_view r
                where r.IdCurso = $_SESSION[idCurso]
                and r.idTurma = $_SESSION[idTurma]
                and r.idaluno = '$_SESSION[identidadeAluno]'
                and r.dataavaliacao <= '$DataAtual'
                and r.respondeu = 'N'";

   $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
   $Comando=ibase_fetch_assoc($Res_sql_Comando);
   
   if ($Comando[QTD] == 0)
   {
       $msg= "Nenhuma ficha a ser avaliada";
   }
   else
   {
      if ($Comando[QTD] == 1)
      {
         $msg= "$Comando[QTD] ficha a ser avaliada. Selecione aqui a Ficha";
      }
      else
      {
         $msg= "$Comando[QTD] fichas a serem avaliadas. Selecione aqui as Fichas";
      }
   }

   $DataAtual= date('d.m.Y 00:00',time());

   $sql_relacionado="select r.IdFicha, r.identidade, r.disciplina,r.idaluno, a.disponivel,
                              extract(day from a.dataavaliacao)||'/'||extract(month from a.dataavaliacao)||'/'||extract(year from a.dataavaliacao) as dataaplicacao
                              from fa_relacao r, fa_avaliacao a
                              where r.IdCurso = $_SESSION[idCurso]
                              and r.idTurma = $_SESSION[idTurma]
                              and r.idaluno = '$_SESSION[identidadeAluno]'
                              and a.dataavaliacao <= '$DataAtual'
                              and r.respondeu = 'N'
                              and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
                              and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina )";

   $Res_sql_relacionado=ibase_query($conexao,$sql_relacionado);

   echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
   echo "<option >--- $msg </option>";

   $opEscolhida =0;

   while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
   {
     
     $opEscolhida ++ ;
     $instrutor ="";
     $disciplina = "";
     $Traco1= "";
     $Traco2= "";

     if($relacionado['IDENTIDADE']!='000000'){
         $sql = "select nome , postograduacao  from pessoa
                         where identidade='$relacionado[IDENTIDADE]'";
          $Res_sql=ibase_query($conexao, $sql);
          $pessoa = ibase_fetch_assoc($Res_sql);
          
          $Traco1= " - ";
          $posto = $pessoa['POSTOGRADUACAO'];
          $instrutor = $pessoa['NOME'];

       }

       if($relacionado['DISCIPLINA']!='000000'){
          $sql = "select nomemateria from materiacurso
                         where idcurso=$_SESSION[idCurso]
                         and codmateria = '$relacionado[DISCIPLINA]' ";
          $Res_sql=ibase_query($conexao, $sql);
          $materiacurso = ibase_fetch_assoc($Res_sql);

          $Traco2= " - ";
          $disciplina = $materiacurso['NOMEMATERIA'];
       }

       $sql = "Select cabecalho from fa_modelo
                                where idficha= $relacionado[IDFICHA]";
       $Res_cabecalho=ibase_query($conexao, $sql);
       $cabecalho = ibase_fetch_assoc($Res_cabecalho);
       


     echo "<option value= $opEscolhida> $cabecalho[CABECALHO] $Traco1 $posto  $instrutor $Traco2 $disciplina - $relacionado[DATAAPLICACAO]  </option>";

   }
   echo "</select>";
   echo "<BR>";
   echo "<BR>";
   echo "<BR>";
   echo "<BR>";

?>

</form>

<form name="form2" method="POST" action="montapagina.php">


<?php

  if ($_SESSION[IdUsuario] == "ALUNO")
  {
         $sql = "Select nome, notafinal
                  From alunoturma_view
                  where idcurso = $_SESSION[idCurso]
                  and   idturma = $_SESSION[idTurma]
                  and   identidade = '$_SESSION[identidadeAluno]'";
         $Res_sql = ibase_query($conexao,$sql );
         $nome = ibase_fetch_assoc($Res_sql);

        echo "$_SESSION[IdUsuario] - $nome[NOME]";
        echo "<BR>";
       echo "<BR>";

     $sql_Comando="select count(1) as Qtd
                   From notaaluno_view na, Teste te
                   where na.idcurso = $_SESSION[idCurso]
                   and   na.idturma = $_SESSION[idTurma]
                   and   na.identidade = '$_SESSION[identidadeAluno]'
                   and   na.idCurso = te.idCurso
                   and   na.idturma = te.IdTurma
                   and   na.referenciaavaliacao = te.referenciaavaliacao
                   and   na.codmateria = te.codmateria
                   and   te.ApresentarNota = 'S'";

      $Res_sql_Comando=ibase_query($conexao,$sql_Comando);
      $Comando=ibase_fetch_assoc($Res_sql_Comando);

      if ($Comando[QTD] == 0)
      {
          $msg= "Não há resultados de avaliações";
      }
      else
      {
          $msg= "Clique aqui para vizualizar nota";
      }

      $DataAtual= date('d.m.Y 00:00',time());
      $sql_Fichas="select count(1) as Qtd
                    from fa_NaoRespondidas_view r
                    where r.IdCurso = $_SESSION[idCurso]
                    and r.idTurma = $_SESSION[idTurma]
                    and r.idaluno = '$_SESSION[identidadeAluno]'
                    and r.dataavaliacao <= '$DataAtual'
                    and r.respondeu = 'N'";

      $Res_sql_Fichas=ibase_query($conexao,$sql_Fichas);
      $Fichas=ibase_fetch_assoc($Res_sql_Fichas);

      if ($Fichas[QTD] > 2)
      {
          if ($Fichas[QTD] == 1)
          {
             $msgAluno= 'Para vizualizar as notas referentes as Provas realizadas é preciso primeiro responder a Ficha de Avaliação';
          }
          else
          {
              $msgAluno= 'Para vizualizar as notas referentes as Provas realizadas é preciso primeiro responder as Fichas de Avaliação';
          }
          echo "<table border='1' width='100%'>
                  <tr>
                    <td>$msgAluno</td>
                  </tr>
                  </table>";
      }
      else
      {
         if ($Fichas[QTD] > 0)
         {
            if ($Fichas[QTD] == 1)
            {
                 echo "<table border='1' width='100%'>
                           <tr>
                            <td>Existe $Fichas[QTD] ficha sem responder, 3 fichas não será mostrada a nota das provas, favor responder...</td>
                           </tr>
                        </table>";
             }
             else
             {
                 echo "<table border='1' width='100%'>
                           <tr>
                            <td>Existem $Fichas[QTD] fichas sem responder, 3 fichas não será mostrada a nota das provas, favor responder...</td>
                           </tr>
                        </table>";
             }

        }
        echo "<br>";

           //------------------------------------------------------------------------------------
          // Mostra a nota em forma de Lista
         //--------------------------------------------------------------------------------------

         $sql_nota="select  na.CodProva, na.Nota,
                             extract(day from te.dataaplicacao)||'/'||extract(month from te.dataaplicacao)||'/'||extract(year from te.dataaplicacao) as dataaplicacao
                             From notaaluno_view na, Teste te
                             where na.idcurso = $_SESSION[idCurso]
                             and   na.idturma = $_SESSION[idTurma]
                             and   na.identidade = '$_SESSION[identidadeAluno]'
                             and   na.idCurso = te.idCurso
                             and   na.idturma = te.IdTurma
                             and   na.referenciaavaliacao = te.referenciaavaliacao
                             and   na.codmateria = te.codmateria
                             and   te.ApresentarNota = 'S'
                             Order by te.dataaplicacao";
         $Res_nota = ibase_query($conexao,$sql_nota);

         $i=0;
         $media=0;

         echo "<select name='ListaDeFichas' class='caixa' id='conteudoNota''>";
         echo "<option >--- $msg</option>";
         echo "<option value= => ------------------------------------------------------------------------- </option>";
         while($nota = ibase_fetch_assoc($Res_nota))
         {
            $i++;

            echo "<option value= => $i -  $nota[DATAAPLICACAO] -  $nota[CODPROVA] - $nota[NOTA]  </option>";
            echo "<option value= => ------------------------------------------------------------------------- </option>";
            $soma_media = $soma_media + $nota[NOTA] ;
         }

         if ( $nome[NOTAFINAL] > 0 )
         {
            if ($Fichas[QTD] > 0)
            {
                if ($Fichas[QTD] == 1)
                {
                    $msgAluno= 'Para vizualizar a média é preciso primeiro responder a Ficha de Avaliação';
                }
                else
                {
                   $msgAluno= 'Para vizualizar a média é preciso primeiro responder as Fichas de Avaliação';
                }
                echo "<option value= => Média ---- $msgAluno </option>";
            }
            else
            {
               echo "<option value= => Média ------------------>  $nome[NOTAFINAL] </option>";
            }
         }
         else
         echo "</select>";
      }
   }
   else
   {
       if ($_SESSION[IdUsuario] == "AVL ICEA")
       {
          echo "<p align='center'>$_SESSION[IdUsuario] - $_SESSION[nomeguerra]</p><br><br>";
       }
       else
       {
          $sql = "Select nome, Funcao
                  From INSTRUTORTURMA_VIEW
                  where idcurso = $_SESSION[idCurso]
                  and   idturma = $_SESSION[idTurma]
                  and   identidade = '$_SESSION[identidadeAluno]'";
          $Res_sql = ibase_query($conexao,$sql );
          $InstrutorTurma = ibase_fetch_assoc($Res_sql);

          echo "<p align='center'>$_SESSION[IdUsuario] - $InstrutorTurma[NOME]</p><br><br>";

            //----------------------------------------------------------------------------------------
           //--- Tratamento para mostrar os alunos e Instrutores que nao responderam as Fichas (Coordenador
          //------------------------------------------------------------------------------------------
         /*
          if ($InstrutorTurma[FUNCAO] == 'Coordenador' or $InstrutorTurma[FUNCAO] == 'COORDENADOR')
          {
             echo "<table border='1'  ><tr bgcolor='#cccccc'><td width='750'>RELAÇÃO DE FICHAS NÃO RESPONDIDAS  </td>
                </tr>";

             $sql_FichasAvl= "select a.IdCurso, a.IdTurma, a.IdFicha, a.Identidade, a.Disciplina,
                              extract(day from a.DataAvaliacao)||'/'||extract(month from a.DataAvaliacao)||'/'||extract(year from a.DataAvaliacao) as dataavaliacao,
                              a.Disponivel, a.IdCoordenador, m.cabecalho
                              From FA_Modelo m, FA_Avaliacao a
                              where idcurso = $_SESSION[idCurso]
                              and   idturma = $_SESSION[idTurma]
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
                       echo "<tr><td width='750'>
                             Data Avaliação: $FichaAvl[DATAAVALIACAO] <BR>
                             Ficha de Avaliação: $FichaAvl[CABECALHO]  <BR>";
                       if ($FichaAvl[DISCIPLINA] <> '000000')
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

                       if ($FichaAvl[IDENTIDADE] <> '000000')
                       {
                          if ($FichaAvl[CABECALHO] <> 'FICHA DE OPINIÃO DO DOCENTE')
                          {
                             //--- Pega o Instrutor

                             $Sql_Instrutor = "Select PostoGraduacao, Nomeguerra
                                                From pessoa
                                                Where identidade like '%$FichaAvl[IDENTIDADE]%'";
                             $Res_Instrutor = ibase_query($conexao,$Sql_Instrutor );
                             $Instrutor = ibase_fetch_assoc($Res_Instrutor);

                             echo "Instrutor Avaliado: $Instrutor[POSTOGRADUACAO] - $Instrutor[NOMEGUERRA] <BR>";
                             echo "<BR>";
                          }
                       }
                   }
                   echo "$Relacao[POSTOGRADUACAO] - $Relacao[NOMEGUERRA] <BR>";
                   $Cabec = 1;
                }
                Echo "</td> </tr>";
             }
          } */
       }
       Echo "</table>";
   }
?>
</p>

</form>
</div>
</div>

</body>
</html>
