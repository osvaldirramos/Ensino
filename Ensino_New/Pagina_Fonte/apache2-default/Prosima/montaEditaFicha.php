<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'GET' ) {
	echo "ACESSO RESTRITO";
	header('Location: index.php');  
    exit();
}
include("Funcoes/verifica_sessao.php");
include("Funcoes/conecta.inc");
   
function ai($string) { 
	$string = str_replace("'", "''", $string);
	return utf8_decode($string);
}
   $idFicha				=$_SESSION[idFicha];
   $idCurso				=$_SESSION[idCurso];
   $idTurma				=$_SESSION[idTurma];
   $idATCO				=$_SESSION[idATCO];
   $idExercicio			=$_SESSION[idExercicio];
   $fCompleta			=$_POST[completa]; 
   $parecer				=$_POST[parecer];
   $nSatisfatorio		=$_POST[nsatisfatorio]; 
   $mens				="";

   $sql= "Select Id_Item, Id_Avl, area_avaliacao,descricao
		  From Ficha_Item_View
		  Where Id_Ficha = 1
		  Order By Id_Item, Id_Avl;";
//		echo "\n\n$sql.........\n$mens\n..............................................";
   $res=ibase_query($conexao,$sql) or die($mens.="\n\n".ibase_errmsg());
	while($relacionado=ibase_fetch_assoc($res))
	{
		$oti = $bom = $reg = $ns = $na = 0;
		$ponteiro = trim($relacionado[ID_ITEM].$relacionado[ID_AVL]);
		$item = $_POST[$ponteiro];
		if    ($item==5) $oti=1;
		elseif($item==4) $bom=1;
		elseif($item==3) $reg=1;
		elseif($item==2) $ns =1;
		elseif($item==1) $na =1;
		$sql= "update PR_Avaliacao set  
			OTIMO   	= '$oti',
			BOM     	= '$bom',
			REGULAR 	= '$reg',
			NS      	= '$ns',
			NA      	= '$na' 
			where 
			IDCURSO    		 = $idCurso 
			and IDTURMA      = $idTurma 
			and ID_FICHA     = $idFicha 
			and ID_ATCO      = '$idATCO' 
			and Id_EXERCICIO = $idExercicio 
			and ID_ITEM      = '".$relacionado[ID_ITEM]."' 
			and ID_AVL       = '".$relacionado[ID_AVL]."';";
//		echo "\n\n$sql.........\n$mens\n..............................................";
   		$res2=ibase_query($conexao,$sql) or die($mens.="\n\n".ibase_errmsg());
	}

   $sql= "update CAD_FICHA_AVL set  
			FICHACOMPLETA	= '$fCompleta', 
			NS				= '$nSatisfatorio',
			PARECER =  '".(ai($parecer))."'
			where  
			IDCURSO 		= $idCurso 
			and IDTURMA		= $idTurma 
			and ID_FICHA	= $idFicha 
			and ID_ATCO 	= '$idATCO' 
			and Id_EXERCICIO = $idExercicio;";
		//echo "\n\n$sql.........\n$mens\n..............................................";
		$res=ibase_query($conexao,$sql) or die($mens.="\n\n".ibase_errmsg());
   
//       $sql= "update CAD_PARECER set PARECER ='".ai($parecer)."' where IDCURSO = $idCurso and IDTURMA = $idTurma  and ID_FICHA = $idFicha and ID_ATCO = '$idATCO' and ID_AVL = '$idAVL' and Id_EXERCICIO = $idExercicio;";
//		$teste = "\n\n$sql.........\n$mens\n..............................................";
//		$res=ibase_query($conexao,$sql) or die($mens.="\n\n".ibase_errmsg());
		
		

echo json_encode(array('merro'=>$mens,'sql'=>$teste));
?>

