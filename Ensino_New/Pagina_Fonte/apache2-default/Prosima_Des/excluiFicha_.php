<?
$result = array();
     $sql_Comando= "Delete From PR_Avaliacao
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result[] = ibase_query($conexao, $sql_Comando);

     $sql_Comando= "Delete From Cad_Parecer
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result[] = ibase_query($conexao, $sql_Comando);

     $sql_Comando= "Delete From Rel_NS
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result[] = ibase_query($conexao, $sql_Comando);

     $sql_Comando= "Delete From Cad_Ficha_Avl
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result[] = ibase_query($conexao, $sql_Comando);
	
	
echo json_encode($result[]);

?>

