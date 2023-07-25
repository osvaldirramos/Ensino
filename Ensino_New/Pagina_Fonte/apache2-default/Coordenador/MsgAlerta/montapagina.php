<?php
  //----------------------------------------------------------------------------------------
  //
  // NOME DO PROJETO           : Ensino
  //
  // PROGRAMA                  : MontaPagina.php
  //
  // DESCRICAO                 : Este modulo tem a funcao de montar a página que mostra as
  //                             Mensagens enviadas para o Coordenador.
  //
  // EQUIPE DO DESENVOLVIMENTO :
  //          Gerente          :
  //          (Analista)       : Osvaldir Donizetti Ramos
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos
  //
  // INICIO DA ELABORACAO      : 14/05/2010
  //
  //----------------------------------------------------------------------------------------
  //                           DETALHES DE ALTERACAO
  //----------------------------------------------------------------------------------------
  // DATA                      :
  // AUTOR                     :
  // MODULO ALTERADO           :
  // MOTIVO                    :
  //----------------------------------------------------------------------------------------

   session_start();
   require_once("../../Funcoes/verifica_sessao.php");
   require_once("../../Funcoes/Funcoes.php");

   $f= new Funcao();
?>

<NOSCRIPT>
     Este navegador não compreende os scripts que se estão executando,
      você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
   </NOSCRIPT>
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   <html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link href="estilos/estilo.css" rel="stylesheet" type="text/css">
   <title>AVALIAÇÃO DE CURSO</title>


   </head>
   
   <div id="corpo">
<?php
   require_once("../../Funcoes/conecta.inc");

   //-------------------------------------------
   //--- Tratamento do Cabecalho da Pagina
   //-------------------------------------------

   echo "<br/>";

   echo "<br>";
   echo "<strong>INSTRUÇÕES</strong><br><br>";
   echo "Ao final da leitura das mensagens clicar no botão Mensagens Lidas.<br>";
   echo "<hr size='1'/>";
   echo "<br>";
//<form id='Form_Perguntas' name='Form_Perguntas' method='post' action="SetaMsgComoLida.php">
?>

   <td width="302" align="center"><a href="SetaMsgComoLida.php" title="Colocar Mensagens como Lidas" target="nucleo" >
  <br> <div id="descricao">Clique aqui para colocar as mensagens como Lidas <img src="../../imagem//MsgLida.png" border="0" width="30" height="30" ></div></a></td>

<?php
   //-------------------------------------------
   //--- Tratamento para montar a pagina
   //-------------------------------------------

   echo "</br>";

   $sql_Msg = "Select IdCurso, IdTurma, usuario, data, Msg, Visto
               From FC_Msg
               Where IdCurso = $_SESSION[idCurso]
               and   IdTurma = $_SESSION[idTurma]
               Order by Visto, data ";

   $Res_Msg = ibase_query($conexao, $sql_Msg);
   while ($Msg = ibase_fetch_assoc($Res_Msg))
   {
      $Data= $f-> TratarData($Msg[DATA]);

      if ($Msg[VISTO] == '0')
      {
         echo "<table border='1' cellspacing='0' cellpadding='0' width='770' class='style1' bordercolor='#cccccc'>
                  <tr>
                     <td><div><td width='170' align='left'><b style='font-size:11px' ><p class='style2' align='left'><b>Data: $Data <br>Usuario: $Msg[USUARIO] <br>Mensagem não lida</b></p></b></td></div>
                   <td> <div><td width='550' align='left'><b style='font-size:11px' ><p class='style2' align='left'><b>$Msg[MSG]</b></p></b></td></div>
                   <td><img src='../../imagem/MsgNaoLida.png' border='0' width='50' height='50' ><br> <div id='descricao'></div></a>
                  </tr>
               </table>";
      }
      else
      {
         echo "<table border='1' cellspacing='0' cellpadding='0' width='770' class='style1' bordercolor='#cccccc'>
                  <tr>
                     <td><div><td width='170' align='left'><b style='font-size:11px' ><p class='style2' align='left'><b>Data: $Data <br>Usuario: $Msg[USUARIO] <br>Mensagem lida</b></p></b></td></div>
                   <td> <div><td width='550' align='left'><b style='font-size:11px' ><p class='style2' align='left'><b>$Msg[MSG]</b></p></b></td></div>
                   <td><img src='../../imagem//MsgLida.png' border='0' width='50' height='50' ><br> <div id='descricao'></div></a>
                  </tr>
               </table>";
      }
      echo "</br>";
   }

   echo "<br/>";
   echo "<hr size='1'/>";
   echo "<br/>";

//</form>
?>

</div>

</html>
