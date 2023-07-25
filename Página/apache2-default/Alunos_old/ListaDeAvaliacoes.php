<?php
   session_start();
   require_once("../Funcoes/conecta.inc");
   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>
</head>
<body>
<div align="center" id="topo"><img src="../imagem/topo.png"></div>

<BR>
<div align='center'>FICHA DE AVALIAÇÃO DE CURSO</div>
<BR>
<p>&nbsp;</p>

<div id="corpo">
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center">
   <a href="CriticaEspontanea.php" title="Entre aqui com seus Comentários ou Sugestões" target="_self" >
<img src="image/critica.png" border="0" width="25" height="25" ><br> Critica Espont&acirc;nea</a>   </td>

   <td width="192" align="center"><a href="alterarSenha.php" title="Redefinir senha" target="_self" >
<img src="image/senha.png" border="0" width="25" height="25" ><br> Alterar Senha</a></td>

   <td width="192" align="center"></td>


   <td width="192" align="center" ></td>


   <td width="192" align="center" ></td>

   <td width="192" align="center" ></td>


   <td width="192" align="center">&nbsp;<a href="index.php" title="Sair" target="_self" ><img src="image/sair.png" border="0" width="25" height="25" /> Sair</a></td>
  </tr>
 </table>
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
                 from fa_relacao r, fa_avaliacao a
                              where r.IdCurso = $_SESSION[idCurso]
                              and r.idTurma = $_SESSION[idTurma]
                              and r.idaluno = '$_SESSION[identidadeAluno]'
                              and a.dataavaliacao <= '$DataAtual'
                              and r.respondeu = 'N'
                              and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
                              and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina 
                             )";

//   $sql_Comando="select count(1) as Qtd
//                 from fa_relacao r, fa_avaliacao a
//                              where r.IdCurso = $_SESSION[idCurso]
//                              and r.idTurma = $_SESSION[idTurma]
//                              and r.idaluno = '$_SESSION[identidadeAluno]'
//                              and r.respondeu = 'N'
//                              and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
//                              and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina 
//                              )";

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

//   $sql_relacionado="select r.IdFicha, r.identidade, r.disciplina,r.idaluno, a.disponivel,
//                              extract(day from a.dataavaliacao)||'/'||extract(month from a.dataavaliacao)||'/'||extract(year from a.dataavaliacao) as dataaplicacao
//                              from fa_relacao r, fa_avaliacao a
//                              where r.IdCurso = $_SESSION[idCurso]
//                              and r.idTurma = $_SESSION[idTurma]
//                              and r.idaluno = '$_SESSION[identidadeAluno]'
//                              and r.respondeu = 'N'
//                              and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
//                              and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina 
//                              )";
   $sql_relacionado="select r.IdFicha, r.identidade, r.disciplina,r.idaluno, a.disponivel,
                              extract(day from a.dataavaliacao)||'/'||extract(month from a.dataavaliacao)||'/'||extract(year from a.dataavaliacao) as dataaplicacao
                              from fa_relacao r, fa_avaliacao a
                              where r.IdCurso = $_SESSION[idCurso]
                              and r.idTurma = $_SESSION[idTurma]
                              and r.idaluno = '$_SESSION[identidadeAluno]'
                              and a.dataavaliacao <= '$DataAtual'
                              and r.respondeu = 'N'
                              and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
                              and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina)";

// echo "<BR>";
//echo "$sql_relacionado";
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

     if(trim($relacionado['IDENTIDADE'])!='000000'){
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
                         where idcurso = $_SESSION[idCurso]
                         and  idturma = $_SESSION[idTurma]
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
          $msg= "Clique aqui para visualizar nota";
      }

      $DataAtual= date('d.m.Y 00:00',time());
      $sql_Fichas="select count(1) as Qtd
                    from fa_NaoRespondidas_view r
                    where r.IdCurso = $_SESSION[idCurso]
                    and r.idTurma = $_SESSION[idTurma]
                    and r.idaluno = '$_SESSION[identidadeAluno]'
                    and r.respondeu = 'N'
                    and r.dataavaliacao <= '$DataAtual'";

      $Res_sql_Fichas=ibase_query($conexao,$sql_Fichas);
      $Fichas=ibase_fetch_assoc($Res_sql_Fichas);

       //-----
      //--- Tratamento para definir a tolerancia de fichas em aberto para vizualizaÇão da Nota da Prova

      if ($Fichas[QTD] > 1) 
      {
          if ($Fichas[QTD] == 1)
          {
             $msgAluno= 'Para visualizar as notas referentes as Provas realizadas é preciso primeiro responder a Ficha de Avaliação';
          }
          else
          {
              $msgAluno= 'Para visualizar as notas referentes as Provas realizadas é preciso primeiro responder as Fichas de Avaliação';
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
                            <td>Existe $Fichas[QTD] ficha sem responder, 1 fichas não será mostrada a nota das provas, favor responder...</td>
                           </tr>
                        </table>";
             }
             else
             {
                 echo "<table border='1' width='100%'>
                           <tr>
                            <td>Existem $Fichas[QTD] fichas sem responder, 1 fichas não será mostrada a nota das provas, favor responder...</td>
                           </tr>
                        </table>";
             }

        }
        echo "<br>";

           //------------------------------------------------------------------------------------
          // Mostra a nota em forma de Lista
         //--------------------------------------------------------------------------------------

         $sql_nota="select distinct na.CodProva, na.Nota,
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

         if ($Fichas[QTD] == 0)
         {
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
         }

         if ( $nome[NOTAFINAL] > 0 )
         {
            if ($Fichas[QTD] > 0)
            {
                if ($Fichas[QTD] == 1)
                {
                    $msgAluno= 'Para visualizar a(s) nota(s) das provas e a média é preciso primeiro responder a Ficha de Avaliação';
                }
                else
                {
                   $msgAluno= 'Para visualizar a(s) nota(s) das provas e a média é preciso primeiro responder as Fichas de Avaliação';
                }
                echo "<option value= => $msgAluno </option>";
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

          if ($InstrutorTurma[FUNCAO] == 'Coordenador' or $InstrutorTurma[FUNCAO] == 'COORDENADOR')
          {
          
             include "RelacaoPessoasNaoResponderam.php";

          }
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
