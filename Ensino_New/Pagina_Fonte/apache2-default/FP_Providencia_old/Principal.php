<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : Principal.php                                 //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página de //
  //                             de demonstração das Turmas Cadastradas.        //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 04/04/2009                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

   require_once("../Funcoes/verifica_sessao.php");
   require_once("../Funcoes/Funcoes.php");
   require_once("../Funcoes/conecta.inc");
   $f= new Funcao();
?>

<NOSCRIPT>
Este navegador não compreende os scripts que se estão executando, você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
</NOSCRIPT>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"  content="text/html;" />
<title>AVALIAÇÃO </title>
<link href="menu_esq.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />
<link href="estilos/estilo_print.css" media="print" rel="stylesheet" type="text/css" />
<script>

function esconde(id_Div){

    document.getElementById(id_Div).style.display = "none";

}

</script>




</head>
<body>
<div id="corpo">

<BR>
<p>&nbsp;</p>
<div align="center">
<p class='style1' align='center'>Cursos em Andamento</p>
<br>
<form id='form_RespDisciplina' name='form_RespDisciplina' method='post' >
<?php
    //---
   //--- Tratamento da entrada da opção de Respostas da Disciplina

   echo "<table width='770' class='tableLinha'>
         <tr bgcolor='#CCCCCC'>
            <td width='80' align='center'>Curso</td>
            <td width='80' align='center'>Turma</td>
            <td width='70' align='center'>Ano</td>
            <td width='110' align='center'>Ínicio</td>
            <td width='110' align='center'>Termino</td>
            <td width='60' align='center'>N. Alunos</td>
            <td width='200' align='center'>Coordenador</td>
         </tr>
         </table>";


   //faz select para montar questionario
   $sql = "Select CodCurso, Turma, ano,
                  extract(day from datainicio)||'/'||extract(month from datainicio)||'/'||extract(year from datainicio) as Inicio,
                  extract(day from datatermino)||'/'||extract(month from datatermino)||'/'||extract(year from datatermino) as Termino,
                  qdealunos, Coordenador
           From Turma_View
           Order by codCurso, ano, turma desc";

   $resultado = ibase_query($conexao, $sql);

   $cont_cor=0;
   $sub=0;
   $hoje=date("d/m/Y");
   
   function Diferenca_Data ($data,$hoje)
   {
      $vetor = explode("/",$data);
      $dias = $vetor[0];
      $meses = $vetor[1];
      $anos = $vetor[2];

      $vetor_hoje = explode("/",$hoje);
      $dias_hoje = $vetor_hoje[0];
      $meses_hoje = $vetor_hoje[1];
      $anos_hoje = $vetor_hoje[2];

      $d=strlen($dias);
      $m=strlen($meses);
      if($d==1)
      {
         $dias="0".$dias ;
      }
      if($m==1)
      {
         $meses="0".$meses ;
      }

     $d_h=strlen($dias_hoje);
     $m_h=strlen($meses_hoje);
    if($d_h==1){
     $dias_hoje="0".$dias_hoje ;
    }
    if($m_h==1){
     $meses_hoje="0".$meses_hoje ;
    }

    $termino= $anos.$meses.$dias;
    $hoje= $anos_hoje.$meses_hoje.$dias_hoje;
    $dif= $hoje-$termino;
    return $dif ;
    

   }
   $id_div=0;
   while ($row = ibase_fetch_assoc($resultado)){
   
    if($cont_cor%2==0){
      $cor = "#EEEEEE";
    }else{
      $cor = "#D3D3D3";//CINZA ESCURO
    }
   $cont_cor++;

   $dif_term = Diferenca_Data ($row[TERMINO],$hoje); //verifica se data de termino é anterior a do dia
   $dif_ini = Diferenca_Data ($row[INICIO],$hoje); //verifica se data de inicio é posterior a do dia

   if($dif_term<0){
     $cor_linha="#5D5D5D";
     $num_alunos =  $num_alunos + $row[QDEALUNOS];
     $num_turmas ++;

     //$id_div="a";
   }else{
     $cor_linha="#FF4500"; //laranja

     $id_div++;
   }

   if($dif_ini<0){
     $cor_linha="#6495ED";
     $num_alunos =  $num_alunos - $row[QDEALUNOS];
     $num_turmas --;
   }
   //echo "<br>";

   echo "<div id='$id_div'><table border='0' cellspacing='2' cellpadding='0' width='770' class='style3'>
       <tr bgcolor='$cor'  >
         <td width='80' align='center' ><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: $cor_linha;'>$row[CODCURSO]</span></div></td>
         <td width='80' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: $cor_linha;'>$row[TURMA]</span></div></td>
         <td width='70' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: $cor_linha;'>$row[ANO]</span></div></td>
         <td width='110' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: $cor_linha;'>$row[INICIO]</span></div></td>
         <td width='110' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: $cor_linha;'>$row[TERMINO]</span></div></td>
         <td width='60' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: $cor_linha;'>$row[QDEALUNOS]</span></div></td>
         <td width='200' align='center'><div><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: $cor_linha;'>$row[COORDENADOR]</span></div></td>
       </tr>
       </table></div>";
    }

   echo"<table  width='770' class='textbox'>
       <tr>
         <td align='center'><span style='font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;'>[ $num_turmas Turmas ]   [ $num_alunos Alunos ]</span></td>
       </tr>
       </table>"."<br>";

   echo "<div align='left'><span style='color:#6495ED'>A iniciar</span></div>";
   echo "<div align='left'><span style='color:#5D5D5D'>Em andamento</span></div>";
   echo "<div align='left'><span style='color:#FF4500'>Encerrados sem baixa no sistema</span></div>";

?>

</div>
</body>
</html>

