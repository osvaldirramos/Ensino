<?php
   session_start();
   require_once("../../Funcoes/conecta.inc");
   require_once("../../Funcoes/Funcoes.php");
   require_once("../../Funcoes/verifica_sessao.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../estilos/estilo.css" rel="stylesheet" type="text/css" />
<title>Ficha de Avaliação de Cursos</title>
</head>
<body>

<font style='font: 20px Arial,sans-serif;background: #CFCFCF; color: Silver; padding: 0px 0px 0px 0px;text-shadow: black -1px 0px 0px, black 0px 1px 0px, black 1px 0px 0px,black 0px -1px 0px, 0px 0px 0px;'>
<div align='center' id="titulo" class="BODY">FICHAS A RESPONDER</div>
</font>

<BR>
<div id="corpo">
<br>
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
                from fa_NaoRespondidas_view r
                where r.IdCurso = $_SESSION[idCurso]
                and r.idTurma = $_SESSION[idTurma]
                and r.idaluno = '$_SESSION[identidadeAluno]'
                and r.dataavaliacao <= '$DataAtual'
                and r.respondeu = 'N'";

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

   $sql_relacionado="select r.IdFicha, r.identidade, r.disciplina,r.idaluno, a.disponivel,
                              extract(day from a.dataavaliacao)||'/'||extract(month from a.dataavaliacao)||'/'||extract(year from a.dataavaliacao) as dataaplicacao
                              from fa_relacao r, fa_avaliacao a
                              where r.IdCurso = $_SESSION[idCurso]
                              and r.idTurma = $_SESSION[idTurma]
                              and r.idaluno = '$_SESSION[identidadeAluno]'
                              and a.dataavaliacao <= '$DataAtual'
                              and r.respondeu = 'N'
                              and ( a.IdCurso = $_SESSION[idCurso] and a.idTurma = $_SESSION[idTurma]
                              and r.IdFicha = a.IdFicha and r.identidade = a.identidade and r.disciplina = a.disciplina )";

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

     if($relacionado['IDENTIDADE']!='000000'){
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
                         where idcurso=$_SESSION[idCurso]
                         and   idTurma = $_SESSION[idTurma]
                         and   codmateria = '$relacionado[DISCIPLINA]' ";
          $Res_sql=ibase_query($conexao, $sql);
          $materiacurso = ibase_fetch_assoc($Res_sql);

          echo " sql $sql";
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

</p>

</form>
</div>
</div>

</body>
</html>
