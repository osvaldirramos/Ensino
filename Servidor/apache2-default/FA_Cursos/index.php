<?php
  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a usuario logar no sistema //
  //                             para isto devera entrar com seu Login e senha. //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          :                                                //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/04/2009                                     //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: FERRAMENTAS DO ENSINO :.</title>
<link href="estilos/estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#CFCFCF">
<div id="corpo">
<br>
<p><img style="margin: -5px 5px -5px 5px;" src="../imagem/topo_ICEA.png" alt="" width="775" /></p>


<br>
<br>
<br>
<div align="center" id="titulo" class="BODY"><strong>Escolha a opção desejada:</strong></div>
<br>
<br>

 <div id="login">
 <br>
 <br>
 <br>
 <table border="0" width="100%" >
    <tr>
       <?php
       //<td width="192" align="center"><a href="../Coordenador/index.php" title="Ferramenta de Auxílio as Atividades do Coordenador" >
       //  <img src="../imagem/coordenador.png" border="0" width="50" height="50" ><br> <div id="descricao"> Coordenador</div></a>
       //</td>
       ?>
       
       <td width="192" align="center"><a href="../Alunos/index.php" title="Fichas de avaliação de Cursos - Aluno" >
         <img src="../imagem/alunos.png" border="0" width="50" height="50" ><br> <div id="descricao">Aluno</div></a>
       </td>
       
       <td width="192" align="center"><a href="../Alunos/index.php" title="Fichas de avaliação de Cursos - Instrutor" >
         <img src="../imagem/instrutor.png" border="0" width="50" height="50" ><br> <div id="descricao">Instrutor</div></a>
       </td>
       
       <td width="192" align="center"><a href="../Alunos/index.php" title="Fichas de avaliação de Cursos - ICEA" >
         <img src="../imagem/avaliador_icea.png" border="0" width="50" height="50" ><br> <div id="descricao">ICEA</div></a>
       </td>

    </tr>
 </table>
</div>
</div>
</BODY>
</HTML>



