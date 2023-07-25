<?php
   session_start();
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/verifica_sessao.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;" />
<title>AVALIA��O</title>
<link href="../menu_esq.css" rel="stylesheet" type="text/css" />
<script src="../SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryMenuBarVertical_02.css" rel="stylesheet" type="text/css" />
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css" />

<script>
function enviar(idcurso, idturma, idcritica)
{
  window.location.href = "MontaFichaDeCriticaEspontanea.php?idcurso="+idcurso+"&idturma="+idturma+"&idcritica="+idcritica;
}

</script>
</head>

<body>
<div id="corpo">
<BR>
<div align="center">
<form name="form1" method="POST" action="">

<div align="center" ><a href="CriticaEspontanea.php" title="Entre aqui com seus Coment�rios ou Sugest�es" target="nucleo" >
<img src="../../imagem/lista_critica.png" border="0" width="25" height="25" >Fa�a Cr�tica Espont&acirc;nea
</a></div>
<br>
<br>
<?php
   //---
   //--- Inicia a lista de Curso

   $sql_Curso = "Select count(1) as Qtd
                        From FA_CriticaEspontanea f
                        where f.idcurso = $_SESSION[idCurso]";
   $ResCurso = ibase_query($conexao, $sql_Curso);
   $dado_Curso=ibase_fetch_assoc($ResCurso);
   
   if ($dado_Curso == 0 )
   {
      echo "<div>";
      echo "<p class= 'style3'><strong>N�o possu� nenhuma Cr�tica Espont�nea cadastrada!</strong></p>";
      echo "</br>";
   }
   {
      $sql_Curso = "Select distinct cast(f.IdCurso as char(4)) as IdCurso,
                           c.CodCurso
                           From Curso c, FA_CriticaEspontanea f
                           where (f.idcurso = $_SESSION[idCurso])
                           and (c.idcurso = $_SESSION[idCurso])
                           order by c.CodCurso";
      $ResCurso = ibase_query($conexao, $sql_Curso);

      while ($dado_Curso=ibase_fetch_assoc($ResCurso))
      {
         echo "<div>";
         echo "<p class= 'style3'><strong>Veja as cr�ticas feitas!</strong></p>";
         echo "</br>";
         echo "<div>";
         echo "<ul id='MenuBar1' class='MenuBarVertical'>";

         echo"<li><a class='MenuBarItemSubmenu' href='#' name='curso')'> $dado_Curso[CODCURSO]</a>";
         echo " <ul> ";

          //---
         //--- Cria a Sub-Lista das Fichas Respondidas

         $sql_Ficha = "Select distinct t.IdCurso,
                              t.idTurma,
                              f.idCritica,
                              t.CodCurso,
                              t.Turma,
                              t.Ano,
                              f.dataAvaliacao,
                              f.SetorCriticado,
                              f.disciplina,
                              f.idinstrutor
                       from Turma_View t, FA_CriticaEspontanea f
                       where t.idcurso = $dado_Curso[IDCURSO]
                       and (t.idCurso = f.idCurso and t.idturma = f.idturma)
                       and (f.idturma=$_SESSION[idTurma])
                       order by t.codcurso, t.turma";

         $ResFicha = ibase_query($conexao, $sql_Ficha);

         while($dado_Ficha=ibase_fetch_assoc($ResFicha))
         {
            if ($dado_Ficha[DISCIPLINA] == '000000')
            {
               $Disciplina= '';
            }
            else
            {
               $sql_Disciplina = "Select CodMateria, NomeMateria
                                  From MateriaCurso
                                  where idcurso = $dado_Curso[IDCURSO]
                                  and   CodMateria = $dado_Ficha[DISCIPLINA]";

               $ResDisciplina = ibase_query($conexao, $sql_Disciplina);
               $dado_Disciplina=ibase_fetch_assoc($ResDisciplina);
               $Disciplina= ' - Disc. '.$dado_Disciplina[CODMATERIA].' '.$dado_Disciplina[NOMEMATERIA];
            }

            if (substr($dado_Ficha[IDINSTRUTOR],0,6) == '000000')
            {
               $Instrutor= '';
            }
            else
            {
               $sql_Instrutor = "Select PostoGraduacao, NomeGuerra
                                 From Pessoa
                                 where Identidade = '$dado_Ficha[IDINSTRUTOR]'";
               $ResInstrutor = ibase_query($conexao, $sql_Instrutor);
               $dado_Instrutor=ibase_fetch_assoc($ResInstrutor);
               $Instrutor= ' - Inst '.$dado_Instrutor[POSTOGRADUACAO].' '.$dado_Instrutor[NOMEGUERRA];
            }

            if ($dado_Ficha[SETORCRITICADO] == '' )
            {
               $SetorCriticado= '';
            }
            else
            {
               $SetorCriticado= ' - Critica a(o) '.$dado_Ficha[SETORCRITICADO];
            }

             echo "<li><a href='#' name='ficha' onClick='enviar($dado_Curso[IDCURSO],$dado_Ficha[IDTURMA],$dado_Ficha[IDCRITICA])'>Turma $dado_Ficha[TURMA] de $dado_Ficha[ANO] - Data Avl. $dado_Ficha[DATAAVALIACAO]$SetorCriticado $Disciplina $Instrutor</a></li>";
         }
         echo "</ul>";
         echo "</li>";
      }
      }
      echo "</ul>";
      echo "<script type='text/javascript'>
            <!--
              var MenuBar1 = new Spry.Widget.MenuBar('MenuBar1', {imgRight:'SpryAssets/SpryMenuBarRightHover.gif'});
            //-->
            </script>";
      echo "</div>";
?>
</form>
</body>
</html>
