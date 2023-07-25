<?php
class Usuario
{
   function registrarUsuario($nome, $senha)
   {
      include("../External/Funcoes/conecta.php");
      if($conexao)
      {
         $sql="Select u.idcodigo, u.nome, u.senha, u.acesso
                                           from usuario u, perfilacesso p
                                           where u.nome = '$nome'
                                           and u.Senha = '$senha'
                                           and u.idCodigo = p.idcodigo
                                           and p.Modulo = 'Extras - Consulta Avaliação Pós-Curso'
                                           and p.possuiacesso = 'S'";
         $resultUsuario = ibase_query($sql);
         if(!ibase_errmsg())
         {
            if($dadosUsuario=ibase_fetch_assoc($resultUsuario))
            {
               $mensagem=$dadosUsuario;
            }
            else
            {
               ibase_rollback($conexao);
               $mensagem=1;
            }
         }
         return $mensagem;
      }
      else
      {
         return 0;
      }

   }

}
?>
