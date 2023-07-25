<?php
  //-----------------------------------------------------------------------------//
   // NOME DO PROJETO           : BDC                                            //
  //                                                                             //
  // PROGRAMA                  : Funcoes.php                                     //
  //                                                                             //
  // DESCRICAO                 : Este modulo  tem a funcao de montar as princi-  //
  //                             pais rotin as.                                  //
  //                                                                             //
  // EQUIPE DO DESENVOLVIMENTO :                                                 //
  //          Gerente          : Máriov                                          //
  //          (Analista)       : Osvaldir Donizetti Ramos                        //
  //          (Programador(es)): Osvaldir Donizetti Ramos                        //
  //                                                                             //
  // INICIO DA ELABORACAO      : 20/04/2021                                      //
  //                                                                             //
  //-----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                             //
  //-----------------------------------------------------------------------------//
  // DATA                      :                                                 //
  // AUTOR                     :                                                 //
  // MODULO ALTERADO           :                                                 //
  // MOTIVO                    :                                                 //
  //-----------------------------------------------------------------------------//

   //-----------------------------------------------------------------------------//
   //-- Funcao para montar o cabecalho das paginas
   //-----------------------------------------------------------------------------//

   class Funcao
   {
        //------------------------------------------------------------------------------------------
        // Modulo de Cadastro da Versao
        //------------------------------------------------------------------------------------------

        function TratarVersao( $conexao, $IdBrac, $idLogin, $Tabelas, $Opcao, $Campo, $ValorAnterior)
        {
            $Sql_Versao = "insert into versao (IdBRAC, IdUsuario, Tabela, Opcao, Campo, ValorAnterior)  
                           values ($IdBrac, $idLogin, '$Tabelas', '$Opcao', '$Campo', '$ValorAnterior' )";
            $result_Versao= mysqli_query($conexao, $Sql_Versao);
        }
    }

?>
