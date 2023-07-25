<?php
session_start();
$_SESSION[ALUNO]=$_POST[aluno];
$_SESSION[INSTRUTOR]=$_POST[instrutor];

echo  "$_SESSION[ALUNO] <br>";
echo  $_SESSION[INSTRUTOR];
?>


<form method="POST" name="ficha" >
<br>
<br>
Aluno <select size="1" name="aluno" onchange="submit()">
  <option>---</option>
  <option <?php if ($_SESSION[ALUNO]=="SGT NADA") { echo "selected"; } ?>>SGT NADA</option>
  <option <?php if ($_SESSION[ALUNO]=="SO LINO") { echo "selected"; } ?>>SO LINO</option>
  <option <?php if ($_SESSION[ALUNO]=="SGT BOS") { echo "selected"; } ?>>SGT BOS</option>
  <option <?php if ($_SESSION[ALUNO]=="SGT TADO") { echo "selected"; } ?>>SGT TADO</option>
</select>

<br>
Instrutor <select size="1" name="instrutor" >
  <option>---</option>
  <option <?php if ($_SESSION[INSTRUTOR]=="TEN ARRUDA") { echo "selected"; } ?>>TEN ARRUDA</option>
  <option <?php if ($_SESSION[INSTRUTOR]=="CAP CABREIRO") { echo "selected"; } ?>>CAP CABREIRO</option>
  <option <?php if ($_SESSION[INSTRUTOR]=="MAJ CALANGO") { echo "selected"; } ?>>MAJ CALANGO</option>
  <option <?php if ($_SESSION[INSTRUTOR]=="CEL ARBORE") { echo "selected"; } ?>>CEL ARBORE</option>
</select>

</form>


