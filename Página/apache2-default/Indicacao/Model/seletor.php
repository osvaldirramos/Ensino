<?php
  ob_start();
  class Seletor
  {
   
    function listarTurma($idCurso)
    {
       include("../External/Funcoes/conecta.inc");
       $sql1= "select *
                from ci_solicitacao
                where idcurso = $idCurso";
       $turma1=ibase_query($conexao1,$sql1);
       while ($relacionado1=ibase_fetch_assoc($turma1))
       {
          $sql2= "select *
                       from turma
                     where idcurso = $idCurso
                     and idturma=$relacionado1[IDTURMA]";
          $turma2=ibase_query($conexao,$sql2);
          while ($relacionado=ibase_fetch_assoc($turma2))
          {

             $turmas[] = $relacionado;
          }
          
       }
       return $turmas;
       ibase_close($conexao);
       ibase_close($conexao1);
    }


    function listarSolicitacao($idCurso,$atividade)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select * from ci_solicitacao where idcurso=$idCurso and atividade='$atividade'";
       $solicitacao=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($solicitacao))
       {
           $solicitacoes[] = $relacionado;
       }

       return $solicitacoes;
       ibase_close($conexao);
       ibase_close($conexao1);
    }

   
   
    function listarCurso($idOrg)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select distinct idcurso
                 from ci_solicitacao where atividade='Curso' and idorg=$idOrg";
       $cursoPln=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($cursoPln))
       {
           $sql= "select idcurso, codcurso
                 from curso
                 where idcurso = $relacionado[IDCURSO]
                 order by codcurso";

           $curso=ibase_query($conexao,$sql);
           while ($relacionado=ibase_fetch_assoc($curso))
           {
              $cursos[] = $relacionado;
           }
       }
       return $cursos;
       ibase_close($conexao);
       ibase_close($conexao1);
    }

    
    
    function listarGruposTrabalho($idOrg)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select distinct idcurso
                 from ci_solicitacao where atividade='Grupo de Trabalh' and idorg=$idOrg";
       $grupo=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($grupo))
       {
           $sql= "select idcurso, codcurso
                 from curso
                 where idcurso = $relacionado[IDCURSO]
                 order by codcurso";
           $curso=ibase_query($conexao,$sql);

           while ($relacionado=ibase_fetch_assoc($curso))
           {
              $cursos[] = $relacionado;
              
           }
       }
       return $cursos;
       ibase_close($conexao);
       ibase_close($conexao1);
    }


    function listarDisciplinas($idCurso,$atividade,$idOrg,$idTurma,$protocolo)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select * from ci_solicitacao where idorg=$idOrg and idcurso=$idCurso and idturma=$idTurma and protocolo=$protocolo and atividade='$atividade'";

       $disciplina=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($disciplina))
       {
           $disciplinas[] = $relacionado;
       }

       return $disciplinas;
       ibase_close($conexao);
       ibase_close($conexao1);
    }


    // Retorna array com periodos do referido curso
    function listarPeriodos($idCurso,$idOrg,$idTurma,$codDisciplina)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select * from  ci_periodo where idcurso=$idCurso and idorg=$idOrg and idturma=$idTurma and coddisciplina='$codDisciplina'";

       $periodo=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($periodo))
       {
          $periodos[] = $relacionado;
       }
       return $periodos;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    
    
    // Retorna array com lista de instrutores que ministram a materia do curso
    function listarInstrutores($idcurso,$codmateria)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select identidade from instrutormateria where idcurso=$idcurso and codmateria='$codmateria'";
       $instrutor=ibase_query($conexao,$sql);
       while ($relacionado=ibase_fetch_assoc($instrutor))
       {
           $instrutores[] = $relacionado;
       }
       return $instrutores;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    //Grava indicação, havendo falha retorna false
    function gravarIndicacao($idindicacao,$idorg,$idcurso,$idturma,$protocolo,$coddisciplina,$identidade,$atividade,$nome,$nomeGuerra,$postograduacao,$cpf,$email,$datainicio,$datatermino,$funcao)
    {
        include("../External/Funcoes/conecta.inc");
        $sql="insert into ci_indicacao (idindicacao,idorg,idcurso,idturma,protocolo,coddisciplina,identidade,atividade,nome,nomeguerra,postograduacao,cpf,email,datainicio,datatermino,funcao)
             values($idindicacao,$idorg,$idcurso,$idturma,'$protocolo','$coddisciplina','$identidade','$atividade','$nome','$nomeGuerra','$postograduacao','$cpf','$email','$datainicio','$datatermino','$funcao')";
//  echo "$sql";
        if($indicacao=ibase_query($conexao1,$sql)){return true;}else{echo "falha na inserção";return false;}

        ibase_close($conexao);
        ibase_close($conexao1);

    }
    
    
    //Pega no bd o  ultimo idIndicacao exatrai os ultimos 6 digitos e incrementa
    function getIdIndicacao()
    {
        include("../External/Funcoes/conecta.inc");
        $sql= "select idindicacao from ci_indicacao order by idindicacao desc";
        $idIndicacao=ibase_query($conexao1,$sql);
        $relacionado=ibase_fetch_assoc($idIndicacao);

        $idIndicacaoTail=substr($relacionado[IDINDICACAO],-5)+1;
        $num=strlen($idIndicacaoTail);
        switch($num)
        {
           case 1:
              $idIndicacaoTail="0000".$idIndicacaoTail;
              break;
           case 2:
              $idIndicacaoTail="000".$idIndicacaoTail;
              break;
           case 3:
              $idIndicacaoTail="00".$idIndicacaoTail;
              break;
           case 4:
              $idIndicacaoTail="0".$idIndicacaoTail;
              break;
        }
        return $idIndicacaoTail;
        ibase_close($conexao);
        ibase_close($conexao1);
    }
    

    function getCodCurso($idCurso)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select codcurso, nomecurso
                 from curso
                 where idcurso = $idCurso
                 order by codcurso";
      $relacionado=ibase_query($conexao,$sql);
      $codCurso=ibase_fetch_assoc($relacionado);

       return $codCurso;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    function listarIndicados($idCurso,$idOrg,$idTurma,$codDisciplina)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select * from  ci_indicacao
                     where idcurso=$idCurso and idorg=$idOrg and idturma=$idTurma and coddisciplina='$codDisciplina'";
      //   echo " asd  $sql";
       $indicado=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($indicado))
       {
          $indicados[] = $relacionado;
       }
       return $indicados;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    
    function getQtdSolicitados($idCurso,$idOrg,$idTurma,$codDisciplina,$atividade)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select qtdinstrutor, qtdcoordenador, qtdinstrutor_trn from ci_solicitacao where  idorg=$idOrg
                  and idcurso=$idCurso and idturma=$idTurma and coddisciplina='$codDisciplina' and  atividade='$atividade'";
       //echo "qtd $sql";
       $qtdSolicitado=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($qtdSolicitado))
       {
          $qtdSolicitados[] = $relacionado;
       }
       return $qtdSolicitados;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    
    function getQtdInstrutoresIndicados($idCurso,$idOrg,$idTurma,$codDisciplina,$atividade)
    {
       include("../External/Funcoes/conecta.inc");
       //$sql= "select count(1)as qtd from ci_indicacao where idorg=$idOrg
       //        and idcurso=$idCurso and idturma=$idTurma and coddisciplina='$codDisciplina' and atividade='$atividade' and funcao='Instrutor'";
       $sql= "select count(1)as qtd from ci_indicacao where idorg=$idOrg
                 and idcurso=$idCurso and idturma=$idTurma and coddisciplina='$codDisciplina'";


      // echo "$sql";
       $qtdInstrutorIndicado=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($qtdInstrutorIndicado))
       {
          $qtdInstrutorIndicados[] = $relacionado;
       }
       return $qtdInstrutorIndicados;
       ibase_close($conexao);
       ibase_close($conexao1);
    }


    function getQtdCoordenadoresIndicados($idCurso,$idOrg,$idTurma,$codDisciplina,$atividade)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select count(1) as qtd from ci_indicacao where idorg=$idOrg
               and idcurso=$idCurso and idturma=$idTurma and coddisciplina='$codDisciplina' and atividade='$atividade' and funcao='Coordenador'";

       $qtdCoordenadorIndicado=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($qtdCoordenadorIndicado))
       {
          $qtdCoordenadorIndicados[] = $relacionado;
          
       }
       return $qtdCoordenadorIndicados;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    
    function getQtdInstrutoresTrnIndicados($idCurso,$idOrg,$idTurma,$codDisciplina,$atividade)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select count(1) as qtd from ci_indicacao where idorg=$idOrg
               and idcurso=$idCurso and idturma=$idTurma and coddisciplina='$codDisciplina' and atividade='$atividade' and funcao='Instrutor Treinamento'";

       $qtdInstrutorTrnIndicado=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($qtdInstrutorTrnIndicado))
       {
          $qtdInstrutorTrnIndicados[] = $relacionado;
       }
       return $qtdInstrutorTrnIndicados;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    
    function selecionarIndicacao($idIndicacao)
    {
       include("../External/Funcoes/conecta.inc");
       $sql= "select * from ci_indicacao where idindicacao=$idIndicacao";
       $indicacaoSelecionada=ibase_query($conexao1,$sql);
       while ($relacionado=ibase_fetch_assoc($indicacaoSelecionada))
       {
          $indicacaoSelecionadas[] = $relacionado;
       }
       return $indicacaoSelecionadas;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    

    function alterarIndicacao($idIndicacao,
                                    $idorg,
                                    $idcurso,
                                    $idturma,
                                    //$protocolo,
                                    $coddisciplina,
                                    $identidade,
                                    $atividade,
                                    $nome,
                                    $nomeGuerra,
                                    $postograduacao,
                                    $cpf,
                                    $email,
                                    $datainicio,
                                    $datatermino,
                                    $funcao){
       $alterada=false;
       include("../External/Funcoes/conecta.inc");
       $sqlAlt= "update ci_indicacao
                     set idorg=$idorg,
                     idcurso =$idcurso,
                     idturma  =$idturma,
                     coddisciplina ='$coddisciplina',
                     identidade='$identidade',
                     atividade='$atividade',
                     nome='$nome',
                     nomeGuerra='$nomeGuerra',
                     postograduacao='$postograduacao',
                     cpf='$cpf',
                     email='$email',
                     datainicio='$datainicio',
                     datatermino ='$datatermino',
                     funcao='$funcao'
                     where idindicacao=$idIndicacao";
       $indicacaoAlterada=ibase_query($conexao1,$sqlAlt);
       $alt=ibase_affected_rows($conexao1);
       if($alt==1)
       {
          $alterada=true;
       }

       return $alterada;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
    
    //exclui uma indicacao
    function excluirIndicacao($idIndicacao)
    {
       $excluido=false;
       include("../External/Funcoes/conecta.inc");
       $sql= "delete from ci_indicacao where idindicacao=$idIndicacao";
       $indicacaoExcluida=ibase_query($conexao1,$sql);
       if(!ibase_errmsg())
       {
          $excluido=true;
       }

       return $excluido;
       ibase_close($conexao);
       ibase_close($conexao1);
    }
  }
?>

