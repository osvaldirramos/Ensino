1, 3, '2º Feira', '08:50/09:40', 'Noções de Altimetria', NULL);
INSERT INTO PTS_SEMANA (IDPTS, IDSEMANA, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, LOCAL) VALUES (1, 4, '3º Feira', '08:00/08:50', 'Cartas Aeronáuticas', NULL);
INSERT INTO PTS_SEMANA (IDPTS, IDSEMANA, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, LOCAL) VALUES (1, 5, '3º Feira', '08:50/09:40', 'Serviços de Tráfego Aéreo', NULL);
INSERT INTO PTS_SEMANA (IDPTS, IDSEMANA, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, LOCAL) VALUES (1, 6, '4º Feira', '08:00/08:50', 'Noções sobre Radar', NULL);
INSERT INTO PTS_SEMANA (IDPTS, IDSEMANA, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, LOCAL) VALUES (1, 7, '4º Feira', '08:50/09:40', 'Noções de Radionavegação', NULL);
INSERT INTO PTS_SEMANA (IDPTS, IDSEMANA, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, LOCAL) VALUES (1, 8, '5º Feira', '08:00/08:50', 'Simulador SRBC', NULL);
INSERT INTO PTS_SEMANA (IDPTS, IDSEMANA, DIA_SEMANA, HORARIO, TRAB_ESCOLAR, LOCAL) VALUES (1, 9, '5º Feira', '08:50/09:40', 'Comunicações de Tráfego Aéreo', NULL);





<?php
   //----------------------------------------------------------------------------//
   // NOME DO PROJETO           : BRAC                                           //
   //                                                                            //
   // PRGRAMA                   : ConsultarBrac.php                              //
   //                                                                            //
   // DESCRICAO                 : Modulo responsavel por apresentar a janela da  //
   //                             com as informacoes da Brac selecionada.        //
   //                                                                            //
   // EQUIPE DO DESENVOLVIMENTO :                                                //
   //          Gerente          : Lacerda                                        //
   //          (Analista)       : Osvaldir Donizetti Ramos                       //
   //          (Programador(es)): Osvaldir Donizetti Ramos                       //
   //                                                                            //
   // INICIO DA ELABORACAO      : 28/01/2021                                     //
   //----------------------------------------------------------------------------//
   //                           DETALHES DE ALTERACAO                            //
   //----------------------------------------------------------------------------//
   // DATA                      : 24/05/2021                                     //
   // AUTOR                     : Osvaldir Donizetti Ramos                       //
   // MOTIVO                    : Passagem de parametro por funcao.              //
   //----------------------------------------------------------------------------//
   // DATA                      : 28/06/2021                                     //
   // AUTOR                     : Osvaldir Donizetti Ramos                       //
   // MOTIVO                    : Implementação da verificação de seção pelo     //
   //                             endereço de acesso remoto.                     //
   //----------------------------------------------------------------------------//
  
   include_once("../Funcoes/conexao.php");
   if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
  }

  //a cada nova página adicione o trecho abaixo
  
//  $tokenUser = md5('seg'.$_SERVER['REMOTE_ADDR'].$_SERVER['HTTP_USER_AGENT']);
//
//  if($_SESSION["donoSessao"]  != $tokenUser){
//     session_unset ();
//     session_destroy();
//     echo "ERRO [0001] - Acesso negado";
//     exit;
//   }

   // Verifica se existe os dados da sessão de login

//   if(!isset($_SESSION["idusuario"]) ) {
//     session_unset ();
//     session_destroy();
//     echo "ERRO [0031] - Acesso negado";
//     exit;
//   }
//   else   {
//     $idLogin = $_SESSION['idusuario'];
//     $Menu = $_SESSION['Menu']; 
//   }  
//   $IdBrac  = $_GET['op3'];
//   $Status  = $_GET['op4'];
   
?>

<!doctype html>
<html lang="pt-br">
  <head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <!-- Material Design for Bootstrap fonts and icons -->
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

     <!-- Material Design for Bootstrap CSS -->
     <!-- <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous"> -->

     <link href="../css/estilo_cabecalho.css" rel="stylesheet" type="text/css">       
     <title>SISBRAC</title>


  </head>

  <?php

    $sql = "select idpts, idsemana, dia_semana, horario, trab_escolar, local
            from pts_semana
            where idpts = 1"; 

//    if($result = mysqli_query($conexao, $sql)){
//        if(mysqli_num_rows($result) > 0){
//            while($row = mysqli_fetch_array($result)){
//                $idPcea         = $row["IdPCEA"];
//                $PCea           = $row["PCEA"];
//                $Prazo          = $row['Prazo'];
 //               $Status         = $row["Status"];
//                $FonteRequisito = $row["FonteRequisito"];
//                $Observacao     = $row["Observacao"];
//            }
//        } else{
//            echo "Nenhum registro correspondente à sua consulta foi encontrado.";
//        }
//    } else{
//        echo "ERRO [0543]: Operação invalida... ";
//    }
  ?>

  <body>
      <div class="container col-10">

         <?php include_once("../Funcoes/cabecalho.php");  ?>

         <section>

         <?php 
             if ($Status == 'REVISAR') {
                echo "<form id='form1' name='form1' method='POST' action='../GerenciarBrac/TratarStatusBrac.php?op3=<?php echo $IdBrac;?>&op4=EM REVISÃO' onSubmit='return submete();'>";
            } else {
                if ($Status == 'APROVAR') {
                    echo "<form id='form1' name='form1' method='POST' action='../GerenciarBrac/TratarStatusBrac.php?op3=<?php echo $IdBrac;?>&op4=EM APROVAÇÃO' onSubmit='return submete();'>";
                } else {
                   if ($Status == 'APROVAR') {
                      echo "<form id='form1' name='form1' method='POST' action='../GerenciarBrac/TratarStatusBrac.php?op3=<?php echo $IdBrac;?>&op4=EM APROVAÇÃO' onSubmit='return submete();'>";
                    }
                }
            }
        ?>
            <div class="card mt-2">
                <div class="card-body text-center">
              
                    <div class="text-info text-uppercase"><h4>BRAC "<?php echo $Status; ?>"</h4> </div>

                    <div class="form-group text-left">
                           <label for="inpputPCea" class="Label">PCEA Selecionado</label>   
                           <input type="text" class="form-control" name="PCea" id="PCea"
                           readonly=“true”
                           value="<?php echo $PCea; ?>"
                           autofocus>
                     </div>
         
                     <div class="form-group text-left">
                           <label for="inpputModSensFunc" class="Label">Prazo</label>
                           <input type="Date" class="form-control" name="Prazo" id="Prazo"
                           readonly=“true”
                           value="<?php echo $Prazo; ?>">
                     </div>
         
                     <div class="form-group col-md-6 text-left">
                         <label for="Status" class="Label">Status---:</label>
                         <input type="text" class="form-control" name="Status" id="Status"
                           readonly=“true”
                           value="<?php echo $Status; ?>"
                           autofocus>
                     </div>

                     <div class="form-group text-left">
                           <label for="inpputFonteRequisito" class="Label">Fonte do Requisito</label>
                           <input type="text" class="form-control" name="FonteRequisito" id="FonteRequisito"
                           readonly=“true”
                           value="<?php echo $FonteRequisito; ?>">
                        </div>

                        <div class="form-group text-left">
                           <label for="inpputObservacao" class="Label">Observação/Justificativa</label>
                           <input type="text" class="form-control" name="Observacao" id="Observacao" placeholder="Informe a Observação"
                           readonly=“true”
                           value="<?php echo $Observacao; ?>">
                        </div>

                  <input type="submit"  class="button" value="APROVAR " class="btn">
                  <a href="../Menu/MenuRevisor.php?"><input  class="button" value="CANCELAR"></a>
               </div>
            </div>
         </form>

      </section>
   </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
  </body>
</html>         

