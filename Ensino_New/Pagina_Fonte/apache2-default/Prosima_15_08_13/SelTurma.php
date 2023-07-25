<?php
echo "teste";
   session_start();
   require_once("Funcoes/conecta.inc");
//   require_once("verifica_sessao.php");
   require_once("Funcoes/Funcoes.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Relação das Fichas de Avaliação Prosima</title>
</head>
<body>
<div align="center" id="topo"><img src="topo.png"></div>

<BR>
<div align='center'>SELEÇÃO DA TURMA QUE SERÁ AVALIADA - PROSIMA</div>
<BR>
<p>&nbsp;</p>

<div id="corpo">
<table border="0" width="100%" >
  <tr>
   <td width="192" align="center"></td>

   <td width="192" align="center" ></td>

   <td width="192" align="center" ></td>

   <td width="192" align="center" ></td>

   <td width="192" align="center">&nbsp;<a href="index.php" title="Sair" target="_self" ><img src="image/sair.png" border="0" width="25" height="25" /> Sair</a></td>
  </tr>
 </table>
<br>
<div id="conteudo">
<form name="form1" method="POST" action="Sel_Avaliacao.php">

<?php
   //--- Verifica se o Instrutor esta avaliando apenas uma Turma
   
   $Sql= "Select count(1) as Qtd
          From INSTRUTOR_TURMAS_VIEW
          Where NomeGuerra = '$_SESSION[nomeguerra]'
          and Identidade = '$_SESSION[identidade]'
          and IdCurso = 139";
   $Res_sql=ibase_query($conexao,$sql);
   $Anl_dados=ibase_fetch_assoc($Res_sql);

   if ($Anl_dados[Qtd] == 0)
   {
       echo "Não posssuí Turma Cadastrada...";
   }
   else
   {
      if ($Anl_dados[Qtd] == 1)
      {
         echo "ficha a ser avaliada. Selecione aqui a Ficha";
      }
      else
      {
         $msg= "Selecione a Turma que será Avaliada";

         $Sql= "Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA
                From INSTRUTOR_TURMAS_VIEW
                Where NomeGuerra = '$_SESSION[nomeguerra]'
                and Identidade = '$_SESSION[identidade]'
                and IdCurso = 139";
//         $Res_sql=ibase_query($conexao,$sql);
//         $Anl_dados=ibase_fetch_assoc($Res_sql);
         
           $Res_sql_relacionado=ibase_query($conexao,$sql);
           $Sql= "Select IdTurma, Turma From Turma where IdCurso = 139 ";
           $VS_Opcao= " and ";

           while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
           {
              if $VS_Opcao == ' and '
              {
                 $Sql= $Sql+" and ( IdTurma = $relacionado[IDTURMA]";
                 $VS_Opcao= " or ";
              }
              else
              {
                 $Sql= $Sql+" or ( IdTurma = $relacionado[IDTURMA]";
              }
           }
           
           $Sql= $Sql+" and Status <> 'P' Order By DataInicio desc";
           
           echo "<select name='ListaDeFichas' class='caixa' id='conteudo' onchange='submit()'>";
           echo "<option >--- $msg </option>";

           $Res_sql_relacionado=ibase_query($conexao,$sql);
           $opEscolhida =0;

           while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
           {
               $opEscolhida ++ ;
               echo "<option value= $opEscolhida> $relacionado[IdTurma] - $relacionado[Turma]  </option>";

           }
           echo "</select>";
           echo "<BR>";
           echo "<BR>";
           echo "<BR>";
           echo "<BR>";
      }
   }

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
       else    // INSTRUTOR
       {
          $sql = "Select nome, Funcao
                  From INSTRUTORTURMA_VIEW
                  where idcurso = $_SESSION[idCurso]
                  and   idturma = $_SESSION[idTurma]
                  and   identidade = '$_SESSION[identidadeAluno]'";
          $Res_sql = ibase_query($conexao,$sql );
          $InstrutorTurma = ibase_fetch_assoc($Res_sql);

          echo "</br>";
          echo "<p align='center'>$_SESSION[IdUsuario] - $InstrutorTurma[NOME]</p><br><br>";

          //---
          //--- Verifica se o instrutor tem ficha pendente

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

          if ($Fichas[QTD] > 0)
          {
             //--- Cabecalho Inicial

             echo "<table border='1'  width='100%'
                     <tr
                         bgcolor='#FFFFC0'>
                       <td><font color='#FF0000'<b>ATENÇÃO</b></font>
                       <br>
                       <br>
                          Informo que vossa senhoria está em débito das Fichas pertinentes, favor regularizar a situação.
                       <br>";

             //Pega a Identificacao do Instituto

             $sql_Configuracao="Select sigla
                                From configuracao";

             $Res_Configuracao=ibase_query($conexao,$sql_Configuracao);
             $Configuracao=ibase_fetch_assoc($Res_Configuracao);

             //--- Verifica se o instrutor pertence ao Instituto

             $sql_Verifica="select count(1) as Qtd
                            from Instrutor
                            where identidade = '$_SESSION[identidadeAluno]'
                            and   IdUnidade <> '$Configuracao[SIGLA]'";

             $Res_Verifica=ibase_query($conexao,$sql_Verifica);
             $Verifica=ibase_fetch_assoc($Res_Verifica);
             if ($Verifica[QTD] == 1)
             {
                 echo "<br>A falta de preenchimento das Fichas de Avaliação poderá implicar no prejuízo de suas próximas convocações.";
             }

             echo "</td></tr>
                     </table>";
          }

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

