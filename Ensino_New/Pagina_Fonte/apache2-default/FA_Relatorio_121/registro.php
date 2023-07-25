<?php
  //----------------------------------------------------------------------------//
  //                                                                            //
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // PROGRAMA                  : registro.php                                   //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a entrada do nome e a senha//
  //                             do usuario e verifica se este tem acesso.      //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          : Maj Sônia                                      //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germando / Osvaldir Donizetti Ramos      //
  //                                                                            //
  // INICIO DA ELABORACAO      : 18/06/2009                                     //
  //                                                                            //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :                                                //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :                                                //
  //----------------------------------------------------------------------------//

	session_start();
	require_once("../Funcoes/conecta.inc");
	//-----------------
       // Para acesso da administração
       //-----------------

	$login = $_POST["login"];
	$senha = $_POST["senha"];

	if(!$login || !$senha)
	{
          echo "Você deve digitar sua senha e login!";
    	   exit;
	}

       //-----------------
       // Função para descriptografar a  senha
       //-----------------

       function Des($atual)
       {
          $resultado= '';
          for ($i= 0; $i <= strlen($atual)-1; $i++)
         {
            $v= substr($atual,$i,1);
            $v= strtoupper(substr($atual,$i,1));
            if (($v == 'V') || ($v == 'W') || ($v == 'X') || ($v == 'Y') || ($v == 'Z'))
            {
               $resultado .= $v;
            }
            else
            {
              $valorBin= ord($v);
              $valorBin= $valorBin + 2;
              $x= chr($valorBin);
              $resultado .= $x;
            }
         }
         return $resultado;
       }
       $senha= strtoupper(Des($senha));

       $sql="Select count(1) qtd
           from usuario u, perfilacesso p
           where (u.nome = '$login' and Senha = '$senha')
           and (u.idCodigo = p.idcodigo
                and Modulo = 'Extras - Consulta de Ficha de Avaliação de Curso'
                and p.possuiacesso = 'S'
               )";
       $con = ibase_query($sql);
       $dados=ibase_fetch_assoc($con);
       if($dados[QTD]==1)
       {
	   $_SESSION[login]=$login;
	   $_SESSION[senha]=$senha;
          $_SESSION[senhaDigitada]=strtoupper(Des($_POST['senha']));
          header("Location:topFrame.php");
       }
       else
       {
  	   echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
       }



?>
