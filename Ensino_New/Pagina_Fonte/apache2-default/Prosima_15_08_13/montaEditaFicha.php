<?php
   session_start();
   require_once("Funcoes/conecta.inc");
   require_once("Funcoes/Funcoes.php");
   
   list( $nomeAluno,$idATCONovo) = explode("|", $_POST[listaAluno]);
   $_SESSION[idInstrutor] = $_POST[listaInstrutor];
   $_SESSION[idATCONovo]=$idATCONovo;
   $nSatisfatorio='N';
   $_SESSION[nome1]=$nomeAluno;

   setEstagiario($idATCONovo,$_POST[estagiario]);
   editaCadFicha($_SESSION[idCurso], $_SESSION[idTurma],1, $idATCONovo,$_SESSION[idATCO],$_SESSION[idInstrutor],$_SESSION[idExercicio], $_POST[exercicio],1,$nomeAluno,$_POST[data],$_POST[local],$_POST[completa],$nSatisfatorio);
   separaDados();
   function editaCadFicha($idCurso, $idTurma, $idFicha, $idATCONovo,$idATCO,$idInstrutor, $idExercicio,$idExercicioNovo,$idAVL,$nome,$data,$local,$fCompleta,$naoSatisfatorio)
   {
       include("Funcoes/conecta.inc");
       $sql= "update cad_ficha_avl set idcurso=$idCurso,
                                       idturma=$idTurma,
                                       id_atco=  '$idATCONovo',
                                       id_avl= '$idAVL',
                                       id_exercicio= $idExercicioNovo,
                                       id_instrutor='$idInstrutor',
                                       nomecompleto='$nome',
                                       data_avl='$data',
                                       local='$local',
                                       fichacompleta='$fCompleta',
                                       ns='$naoSatisfatorio'

                     where IDCURSO = $idCurso
                     and IDTURMA =$idTurma
                     and ID_FICHA=$idFicha
                     and ID_ATCO =  '$idATCO'
                     and ID_AVL = '$idAVL'
                     and Id_EXERCICIO = $idExercicio";
                     //echo "$sql";
       $Prep_sql_relacionado=ibase_prepare($conexao,$sql);
       $Res_sql_relacionado =ibase_execute($Prep_sql_relacionado);
   }


   
   function editaParecer($idCurso, $idTurma, $idFicha, $idATCONovo,$idATCO, $idExercicio,$idExercicioNovo,$idAVL,$parecer)
   {
       include("Funcoes/conecta.inc");
       $sql= "update cad_parecer set idcurso=$idCurso,
                                        idturma=$idTurma,
                                        id_ficha=$idFicha,
                                        id_atco=  '$idATCONovo',
                                        id_avl= '$idAVL',
                                        id_exercicio= $idExercicioNovo,
                                        OBSERVACAO='$parecer'
                     where IDCURSO = $idCurso
                     and IDTURMA =$idTurma
                     and ID_FICHA=$idFicha
                     and ID_ATCO =  '$idATCO'
                     and ID_AVL = '$idAVL'
                     and Id_EXERCICIO = $idExercicio";
echo "$sql";
       $Prep_sql_relacionado=ibase_prepare($conexao,$sql);
       $Res_sql_relacionado =ibase_execute($Prep_sql_relacionado);
   }


   function separaDados(){
       include("Funcoes/conecta.inc");
       $sql= "Select Id_Item, Id_Avl, area_avaliacao,descricao
              From Ficha_Item_View
              Where Id_Ficha = 1
              Order By Id_Item, Id_Avl";
        $Res_sql_relacionado=ibase_query($conexao,$sql);
        while($relacionado=ibase_fetch_assoc($Res_sql_relacionado))
        {
             $ponteiro = trim($relacionado[ID_ITEM].$relacionado[ID_AVL]);
             $item = $_POST[$ponteiro];
             if($item=="otimo"){$otimo=1;}else{$otimo=0;}
             if($item=="bom"){$bom=1;}else{$bom=0;}
             if($item=="regular"){$regular=1;}else{$regular=0;}
             if($item=="ns"){$ns=1;$nSatisfatorio='S';}else{$ns=0;}
             if($item=="na"){$na=1;}else{$na=0;}
             editaFicha($_SESSION[idCurso],$_SESSION[idTurma],$_SESSION[idFicha],$_SESSION[idATCONovo],$_SESSION[idATCO],$_SESSION[idExercicio],$_POST[exercicio],$relacionado[ID_ITEM],$relacionado[ID_AVL], $otimo, $bom, $regular, $ns, $na);
        }
        editaParecer($_SESSION[idCurso],$_SESSION[idTurma],$_SESSION[idFicha],$_SESSION[idATCONovo],$_SESSION[idATCO],$_SESSION[idExercicio],$_POST[exercicio],1,$_POST[parecer]);
        if($nSatisfatorio=='S'){
            editaCadFicha($_SESSION[idCurso], $_SESSION[idTurma],1, $_SESSION[idATCONovo],$_SESSION[idATCO],$_SESSION[idInstrutor],$_SESSION[idExercicio], $_POST[exercicio],1,$_SESSION[nome1],$_POST[data],$_POST[local],$_POST[completa],$nSatisfatorio);
        }
   }



   function editaFicha($idCurso, $idTurma, $idFicha, $idATCONovo, $idATCO, $idExercicio,$idExercicioNovo,$idItem,$idAVL, $otimo, $bom, $regular, $ns, $na)
   {
       include("Funcoes/conecta.inc");
       $sql= "update PR_Avaliacao set  ID_ATCO= '$idATCONovo',
                                 Id_EXERCICIO=$idExercicioNovo,
                                 OTIMO='$otimo',
                                 BOM='$bom',
                                 REGULAR='$regular',
                                 NS='$ns',
                                 NA= '$na'
                     where IDCURSO = $idCurso
                     and IDTURMA =$idTurma
                     and ID_FICHA=$idFicha
                     and ID_ATCO =  '$idATCO'
                     and Id_EXERCICIO = $idExercicio
                     and ID_ITEM='$idItem'
                     and ID_AVL = '$idAVL'";
       $Prep_sql_relacionado=ibase_prepare($conexao,$sql);
       $Res_sql_relacionado =ibase_execute($Prep_sql_relacionado);
   }


   function setEstagiario($idATCO, $estagiario)
   {
       include("Funcoes/conecta.inc");
       $sql= "update PR_estagiario set  estagiario= '$estagiario'
                     where ID_ATCO =  '$idATCO'";
       $Prep_sql_relacionado=ibase_prepare($conexao,$sql);
       $Res_sql_relacionado =ibase_execute($Prep_sql_relacionado);
   }
   //header("Location:Sel_Avaliacao.php");

?>

