<?php
   //----------------------------------------------------------------------------//
   // NOME DO PROJETO           : Ensino                                         //
   //                                                                            //
   // DESCRICAO                 : Este modulo verifica se o usuario possui acesso//
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


   session_start();
   require_once("../Funcoes/conecta.inc");

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
         $valorBin= ord($v);
         $valorBin= $valorBin + 2;
         $x= chr($valorBin);
         $resultado .= $x;
      }
      return $resultado;
   }

//   $sql="Select IdCodigo, Nome, senha
   $senha= strtoupper(Des($senha));

    $sql="Select u.IdCodigo, u.nome, u.senha
           from usuario u, perfilacesso p
           where (u.nome = '$login' and Senha = '$senha')
           and (u.idCodigo = p.idcodigo
                 and Modulo = 'Extras - Consulta de Ficha de Avaliação de Curso'
                 and p.possuiacesso = 'S'
               )";
               
    $con = ibase_query($sql);
	$dados=ibase_fetch_assoc($con);

    if($dados[IDCODIGO] <> '')
    {
  	    $_SESSION[idcodigo]=$dados[IDCODIGO];
  	    $_SESSION[nome]="$nome";
	    $_SESSION[senha]="$senha";

        header("Location:topFrame.php");
    }
    else
    {
		 echo "<script language='javascript' type='text/javascript'> alert('VERIFIQUE LOGIN E SENHA ');window.location='index.php';</script>";
    }
?>
