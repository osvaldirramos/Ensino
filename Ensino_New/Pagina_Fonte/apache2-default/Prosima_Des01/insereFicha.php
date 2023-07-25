<?php
   session_start();
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");

   $sql="Select count(1) as Qtd From Cad_Ficha_Avl
                          Where IDCURSO = $_SESSION[idCurso]
                          and IDTURMA = $_SESSION[idTurma]
                          and ID_FICHA = 1
                          and ID_ATCO = '$_SESSION[idATCO]'
                          and ID_AVL = '1'
                          and Id_EXERCICIO = $_SESSION[idExercicio]
                          and ID_INSTRUTOR = '$_SESSION[idInstrutor]'";
   $Res_sql_relacionado=ibase_query($conexao,$sql);
   $relacionado=ibase_fetch_assoc($Res_sql_relacionado);

   //if($_POST[estagiario]=='S'){$estagiario='S';}else{$estagiario='N';}


   if($relacionado[QTD]==0)
   {
      $sql="insert into cad_ficha_avl (idcurso, idturma, id_ficha, id_atco, id_avl, id_exercicio, id_instrutor, nomecompleto,data_avl, local,ns, fichacompleta)
                 values($_SESSION[idCurso],
                          $_SESSION[idTurma],
                          1,
                          '$_SESSION[idATCO]',
                          '1',
                          $_SESSION[idExercicio],
                          '$_SESSION[idInstrutor]',
                          '$_SESSION[nomeAluno]',
                          '$_SESSION[dataAVL]',
                          '$_SESSION[local]',
                          '$_POST[ns]',
                          '$_POST[fCompleta]') ";
      $Res_sql_relacionado=ibase_query($conexao,$sql);
   }else{
        echo "<script language='javascript' type='text/javascript'>
         alert('Esta avaliação ja existe!');
         window.location='Sel_Avaliacao.php';
        </script>";
   }



   separaDados();
   function separaDados(){
       include("Funcoes/conecta.inc");
       $sql= "Select Id_Item, Id_Avl, area_avaliacao,descricao
              From Ficha_Item_View
              Where Id_Ficha = 1
              Order By Id_Item, Id_Avl";
        $Res_sql_relacionado=ibase_query($conexao,$sql);
        while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
        {             // echo "teste";
             $ponteiro = $relacionado[ID_ITEM].$relacionado[ID_AVL];
             $item = $_POST[$ponteiro];
             echo "$item ";
             if($item=="o"){$otimo=1;}else{$otimo=0;}
             if($item=="b"){$bom=1;}else{$bom=0;}
             if($item=="r"){$regular=1;}else{$regular=0;}
             if($item=="ns"){$ns=1;$_SESSION[NS]++;}else{$ns=0;}
             if($item=="na"){$na=1;}else{$na=0;}
             criaFicha($_SESSION[idCurso],$_SESSION[idTurma],1,$_SESSION[idATCO],$_SESSION[idExercicio],$relacionado[ID_ITEM],$relacionado[ID_AVL], $otimo, $bom, $regular, $ns, $na,$relacionado[AREA_AVALIACAO],$relacionado[DESCRICAO]);

        }
        criaParecer($_SESSION[idCurso],$_SESSION[idTurma],1,$_SESSION[idATCO],1,$_SESSION[idExercicio], $_POST[parecer]);
   }



   function criaFicha($idCurso, $idTurma, $idFicha, $idATCO, $idExercicio,$idItem,$idAVL, $otimo, $bom, $regular, $ns, $na,$areaAvaliacao,$descricao)
   {
       include("Funcoes/conecta.inc");
       $sql= "insert Into PR_Avaliacao (IDCURSO, IDTURMA, ID_FICHA, ID_ATCO, Id_EXERCICIO, ID_Item, ID_AVL,otimo,bom,regular,ns,na,area_avaliacao,descricao)
                         Values ( $idCurso,
                                  $idTurma,
                                  $idFicha,
                                  '$idATCO',
                                  $idExercicio,
                                  '$idItem',
                                  '$idAVL',
                                  '$otimo',
                                  '$bom',
                                  '$regular',
                                  '$ns',
                                  '$na',
                                  '$areaAvaliacao',
                                  '$descricao')";
        $Prep_sql_relacionado=ibase_prepare($conexao,$sql);
        $Res_sql_relacionado =ibase_execute($Prep_sql_relacionado);
   }
   
   estagiario($_SESSION[idATCO],$_SESSION[estagiario]);
   function estagiario($idATCO,$estagiario)
   {
       include("Funcoes/conecta.inc");
       $sql= "insert Into PR_estagiario (ID_ATCO,ESTAGIARIO)
                         Values ( '$idATCO',
                                  '$estagiario')";
        $Prep_sql_relacionado=ibase_prepare($conexao,$sql);
        $Res_sql_relacionado =ibase_execute($Prep_sql_relacionado);
   }
   
   
   function criaParecer($idCurso, $idTurma, $idFicha, $idATCO,$idAVL, $idExercicio, $parecer)
   {
       include("Funcoes/conecta.inc");
       $sql= "insert Into cad_parecer(IDCURSO, IDTURMA, ID_FICHA, ID_ATCO, ID_AVL, Id_EXERCICIO,PARECER)
                         Values ( $idCurso,
                                  $idTurma,
                                  $idFicha,
                                  '$idATCO',
                                  '$idAVL',
                                  $idExercicio,
                                  '$parecer')";
        $Prep_sql_relacionado=ibase_prepare($conexao,$sql);
        $Res_sql_relacionado =ibase_execute($Prep_sql_relacionado);
   }

   header("Location:Sel_Avaliacao.php");
?>
   <form method="POST" action="">
       <? //montaFicha(1);?>
      <input type="button" value="Botão">
   </form>
