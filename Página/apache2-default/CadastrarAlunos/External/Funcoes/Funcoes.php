<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : rotinas.php                                    //
  //                                                                            //
  // DESCRICAO                 : Este modulo tem a funcao de montar as princi-  //
  //                             pais rotinas.                                  //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 23/06/2009                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

   //----------------------------------------------------------------------------//
   //-- Funcao para montar o cabecalho das paginas
   //----------------------------------------------------------------------------//

   class Funcao
   {
      function Cabecalho()
      {
         echo"<table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr>
                  <td height='0%' valign='top'>
                <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                 <tr>
	   	          <td colspan='3' bgcolor='#000099' height='10'></td>

	             </tr>
	             <tr>
                    <td width='60%' height='57' align='left'>
                         <img src='../image/brasao.gif' alt='Brasao' width='422' height='76'>
                    </td>
                    <td width='0%' height='58'>&nbsp;</td>
                    <td width='37%' height='57' rowspan='0' align='right'>
  		                <img src='../image/DivisaoEnsino.JPG' alt='fundoCab' width='328' height='67'>
                   </td>
                 </tr>
	   	         <td colspan='3' bgcolor='#606060' height='10'></td>
                </table></td>
            </tr>
          </table>";
       }

      //----------------------------------------------------------------------------//
      //-- Funcao para tratar a tecla ENTER quando for mostrar resultados.
      //----------------------------------------------------------------------------//

      function TrataEnter($atual)
      {
         $resultado= '';
         for ($i= 0; $i <= strlen($atual)-1; $i++)
         {
            $v= substr($atual,$i,1);
            $valorBin= ord($v);
            if ($valorBin == 13)
            {
               $x= '<br>';
            }
            else
            {
               $x= chr($valorBin);
            }
            $resultado .= $x;
         }

         return $resultado;
      }

      //----------------------------------------------------------------------------//
      // Função para criptografar a senha
      //----------------------------------------------------------------------------//

      function Criptografar ($atual)
      {
         $resultado= '';
         for ($i= 0; $i <= strlen($atual)-1; $i++)
         {
            $v= substr($atual,$i,1);
            $valorBin= ord($v);
            $valorBin= $valorBin - 2;
            $x= chr($valorBin);
            $resultado .= $x;
         }
         return $resultado;
      }

      //----------------------------------------------------------------------------//
      // Função para descriptografar a senha
      //----------------------------------------------------------------------------//

      function Descriptografar ($atual)
      {
         $resultado= '';
         for ($i= 0; $i <= strlen($atual)-1; $i++)
         {
            $v= substr($atual,$i,1);
            $valorBin= ord($v);
            $valorBin= $valorBin + 2;
            $x= chr($valorBin);
            $resultado .= $x;
         }
         return $resultado;
      }
      
      
      //----------------------------------------------------------------------------//
      // Função para tratar de Data
      //----------------------------------------------------------------------------//

      function TratarData($atual)
      {
         $resultado= substr($atual, 8,2);      // Dia
         $resultado .= '/';
         $resultado .= substr($atual, 5,2);   // Mes
         $resultado .= '/';
         $resultado .= substr($atual, 0,4);   // Ano
       //  $resultado .= ' ';
      //   $resultado .= substr($atual, 10,6);   // Hora

         return $resultado;
      }

      
      
      
      function formatarData($data,$separador)
      {
        //recebe o parâmetro e armazena em um array separado por -
        $dataInt = explode(' ', $data);
        $data = explode($separador, $dataInt[0]);
        $dataInt[1]="";
	    //armazena na variavel data os valores do vetor data e concatena /
	    $data = $data[0].'.'.$data[1].'.'.$data[2].' '.$dataInt[1];

	    //retorna a string da ordem correta, formatada
	    return $data;
      }
      
      function formatarInverterData($data,$separador)
      {
        //recebe o parâmetro e armazena em um array separado por -
        $dataInt = explode(' ', $data);
        $data = explode($separador, $dataInt[0]);
        $dataInt[1]="";
	    //armazena na variavel data os valores do vetor data e concatena /
	    $data = $data[2].'.'.$data[1].'.'.$data[0].' '.$dataInt[1];

	    //retorna a string da ordem correta, formatada
	    return $data;
      }
      
       //----------------------------------------------------------------------------//
      //-- Funcao para tratar a tecla ENTER quando for mostrar resultados.
      //----------------------------------------------------------------------------//


      function TrocarDePara($atual, $De, $Para)
      {
         $resultado= '';
         for ($i= 0; $i <= strlen($atual)-1; $i++)
         {
            $v= substr($atual,$i,1);
            if ($v == $De)
            {
               $resultado .= $Para;
            }
            else
            {
               $resultado .= $v;
            }
         }

         return $resultado;
      }
   }
?>
