<?php
require_once("../Model/seletor.php");
$obj = new Seletor();


$cursos = $obj->listarCurso();
if($_POST[idCurso]){
  $turmas = $obj->listarTurma($_POST[idCurso]);
}
$disciplinas= $obj->listarDisciplinas($_POST[idCurso]);
//print_r($disciplinas);
?>
