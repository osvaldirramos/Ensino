<?
session_start();
if(!session_is_registered('ident')) {
	session_destroy();
	header("Location: index.php");
	end;	
}
$idCurso = $_SESSION['idCurso'];   			
$idTurma = $_SESSION['idTurma'];   			
$idATCO = $_POST['idATCO'];
$idFicha = $_POST['idFicha'];
$idExercicio = $_POST['idExercicio'];

require_once("conecta.inc");

$result = array();
     $sql= " Delete From PR_Avaliacao
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result1 = ibase_query($conexao, $sql);

     $sql= " Delete From Cad_Parecer
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result2 = ibase_query($conexao, $sql);

     $sql= " Delete From Rel_NS
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result3 = ibase_query($conexao, $sql);

     $sql= " Delete From Cad_Ficha_Avl
                    Where IDCURSO = ".$idCurso."
                    and   IDTURMA = ".$idTurma."
                    and   ID_ATCO = '".$idATCO."'
                    and   ID_FICHA = ".$idFicha."
                    and   ID_Exercicio = ".$idExercicio;

    $result4 = ibase_query($conexao, $sql);
	
echo json_encode(array(array('PR_Avaliacao',$result1),array('Cad_Parecer',$result2),array('Rel_NS',$result3),array('Cad_Ficha_Avl',$result4)));
?>

