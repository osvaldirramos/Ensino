<?php
session_start();
require_once("../Model/seletor.php");
   $obj = new Seletor();

   $_SESSION[idCurso]= $_POST[idCurso];
   $_SESSION[idCursoGrupo]= $_POST[idCursoGrupo];
   $_SESSION[codCurso]= "Atm005";
   $cursos = $obj->listarCurso($_SESSION[idOrg]);
   $grupostrabalho = $obj->listarGruposTrabalho($_SESSION[idOrg]);
   $_SESSION[codDisciplina]=$_POST[codDisciplina];
   $dadosFormTurma=unserialize(urldecode($_POST[turmaSelecionada]));
   $_SESSION[idTurma]=$dadosFormTurma[IDTURMA];
   $_SESSION[protocolo]=$dadosFormTurma[PROTOCOLO];

   if($_POST[idCurso])
   {

     $solicitacoes = $obj->listarSolicitacao($_POST[idCurso],'Curso');
     $turmas = $obj->listarTurma($_POST[idCurso]);
     $codCurso= $obj->getCodCurso($_POST[idCurso]);
     $_SESSION[atividade]='Curso';
   }

   if($_POST[idCursoGrupo])
   {
     $codCurso= $obj->getCodCurso($_POST[idCursoGrupo]);
     $turmas = $obj->listarTurma($_POST[idCursoGrupo]);
     $_SESSION[atividade]='Grupo de Trabalh';
   }


   if($_POST[turmaSelecionada])
   {
     $solicitacoes = $obj->listarSolicitacao($dadosFormTurma[IDCURSO],$_SESSION[atividade]);
     $dadosFormTurma=unserialize(urldecode($_POST[turmaSelecionada]));
     $codCurso= $obj->getCodCurso($dadosFormTurma[IDCURSO]);
     $turmas = $obj->listarTurma($dadosFormTurma[IDCURSO]);
     $disciplinas= $obj->listarDisciplinas($dadosFormTurma[IDCURSO],$_SESSION[atividade],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$dadosFormTurma[PROTOCOLO]);
   }
   
   if($_POST[codDisciplina])
   {
     $dadosFormTurma=unserialize(urldecode($_POST[turmaSelecionada]));
     $solicitacoes = $obj->listarSolicitacao($dadosFormTurma[IDCURSO],$_SESSION[atividade]);
     $turmas = $obj->listarTurma($dadosFormTurma[IDCURSO]);
     $disciplinas= $obj->listarDisciplinas($dadosFormTurma[IDCURSO],$_SESSION[atividade],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$dadosFormTurma[PROTOCOLO]);
     $periodos=$obj->listarPeriodos($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$_POST[codDisciplina]);
     $indicados=$obj->listarIndicados($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$_POST[codDisciplina]);
     $qtdSolicitados=$obj->getQtdSolicitados($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$_POST[codDisciplina],$_SESSION[atividade]);

   }
   if(isset($_POST[editar]))
   {
       $indicacaoSelecionada=$obj->selecionarIndicacao($_POST[editar]);
   }
   if($_POST[enviar])
   {
      $dadosFormTurma=unserialize(urldecode($_POST[turmaSelecionada]));
      $dadosFormPeriodo=unserialize(urldecode($_POST[periodo]));
      $idIndicacaoTail= $obj->getIdIndicacao();
      $idIndicacao=$_SESSION[idOrg]."$dadosFormTurma[IDCURSO]"."$dadosFormTurma[IDTURMA]"."$idIndicacaoTail";
      $qtdSolicitados=$obj->getQtdSolicitados($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$_POST[codDisciplina],$_SESSION[atividade]);


      //chama  funcao Atualizar
      if($_POST[enviar]=='Atualizar'){
         $obj->alterarIndicacao($_POST[protocolo],$_SESSION[idOrg],$dadosFormTurma[IDCURSO],$dadosFormTurma[IDTURMA],$_POST[codDisciplina],$_POST[identidade],$_SESSION[atividade],$_POST[nome],$_POST[nomeGuerra],$_POST[postoGraduacao],$_POST[cpf],$_POST[email],$dadosFormPeriodo[DATAINICIO],$dadosFormPeriodo[DATATERMINO],$_POST[funcao]);
      }

      //chama funcao Excluir
      if($_POST[enviar]=='Excluir'){
         $obj->excluirIndicacao($_POST[protocolo]);
      }


      //chama funcao Adicionar
      if($_POST[enviar]=='Salvar'){
      //Verifica se numero de solicitação ja foi atendida
      foreach($qtdSolicitados as $chv)
      {
        if($_POST[funcao]=="Coordenador")
        {
          $getQtdCoordenadoresIndicados=$obj->getQtdCoordenadoresIndicados($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$_POST[codDisciplina],$_SESSION[atividade]);
          foreach($getQtdCoordenadoresIndicados as $chv1)
          {
            if(($chv[QTDCOORDENADOR]*$chv1[QTD])>=$chv1[QTD])
            {
               $obj->gravarIndicacao($idIndicacao,$_SESSION[idOrg],$dadosFormTurma[IDCURSO],$dadosFormTurma[IDTURMA],$dadosFormPeriodo[PROTOCOLO],$_POST[codDisciplina],$_POST[identidade],$_SESSION[atividade],$_POST[nome],$_POST[nomeGuerra],$_POST[postoGraduacao],$_POST[cpf],$_POST[email],$dadosFormPeriodo[DATAINICIO],$dadosFormPeriodo[DATATERMINO],$_POST[funcao]);
            }
            else
            {
               echo "<script>alert('Número solicitado já atentido. Observe o extrato');</script>";echo "nO";
            }
          }
        }


        if($_POST[funcao]=="Instrutor")
        {
          $getQtdInstrutoresIndicados=$obj->getQtdInstrutoresIndicados($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$dadosFormPeriodo[PROTOCOLO],$_POST[codDisciplina],$_SESSION[atividade]);
          foreach($getQtdInstrutoresIndicados as $chv1)
          {
            if(($chv[QTDINSTRUTOR]*$chv1[QTD])>=$chv1[QTD])
            {
               $obj->gravarIndicacao($idIndicacao,$_SESSION[idOrg],$dadosFormTurma[IDCURSO],$dadosFormTurma[IDTURMA],$dadosFormPeriodo[PROTOCOLO],$_POST[codDisciplina],$_POST[identidade],$_SESSION[atividade],$_POST[nome],$_POST[nomeGuerra],$_POST[postoGraduacao],$_POST[cpf],$_POST[email],$dadosFormPeriodo[DATAINICIO],$dadosFormPeriodo[DATATERMINO],$_POST[funcao]);
            }
            else
            {
               echo "<script>alert('Número solicitado já atentido. Observe o extrato');</script>";echo "nO";
            }

          }
        }


        if($_POST[funcao]=="Instrutor Treinamento")
        {
          $getQtdInstrutoresTrnIndicados=$obj->getQtdInstrutoresTrnIndicados($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$_POST[codDisciplina],$_SESSION[atividade]);
          foreach($getQtdInstrutoresTrnIndicados as $chv1)
          {
            if(($chv[QTDINSTRUTOR_TRN]*$chv1[QTD])>=$chv1[QTD])
            {
               $obj->gravarIndicacao($idIndicacao,$_SESSION[idOrg],$dadosFormTurma[IDCURSO],$dadosFormTurma[IDTURMA],$dadosFormPeriodo[PROTOCOLO],$_POST[codDisciplina],$_POST[identidade],$_SESSION[atividade],$_POST[nome],$_POST[nomeGuerra],$_POST[postoGraduacao],$_POST[cpf],$_POST[email],$dadosFormPeriodo[DATAINICIO],$dadosFormPeriodo[DATATERMINO],$_POST[funcao]);
            }
            else
            {
               echo "<script>alert('Número solicitado já atentido. Observe o extrato');</script>";echo "nO";
            }
          }
        }
      }
      }
      $indicados=$obj->listarIndicados($dadosFormTurma[IDCURSO],$_SESSION[idOrg],$dadosFormTurma[IDTURMA],$_POST[codDisciplina]);
   }

?>
