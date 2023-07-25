<?php // classe aluno inicio de desenvolvimento 22/02/2011 por 3s germano

class AlunoCiaar{

  var $nome;
  var $cpf;
  var $identidade;
  var $dataNascimento;
  var $curso;
  var $turma;
  var $ano;
  var $nomeGuerra;
  var $sexo;
  var $estadoCivil;
  var $naturalidadeUF;
  var $naturalidadeCidade;
  var $especialidade;
  var $telefone;
  var $nomePai;
  var $nomeMae;
  var $endereco;
  var $cidade;
  var $numero;
  var $cep;
  var $bairro;


  function getNome(){
     return $nome ;
  }
  
  function setNome($nome){
     $this->$nome = $nome;
  }



  function getNomeGuerra(){
     return $nomeGuerra ;
  }
  function setNomeGuerra($nomeGuerra){
     this.$nomeGuerra = $nomeGuerra;
  }



  function getCPF(){
     return $cpf ;
  }
  function setCPF($cpf){
     this.$cpf = $cpf;
  }



  function getIdentidade(){
     return $identidade ;
  }
  function setIdentidade($identidade){
     $this->$identidade = $identidade;
  }



  function getDataNascimento(){
     return $dataNascimeto ;
  }
  function setDataNascimeto($dataNascimeto){
     this.$dataNascimeto = $dataNascimeto;
  }



  function getCurso(){
     return $curso ;
  }
  function setCurso($curso){
     this.$curso = $curso;
  }




  function getTurma(){
     return $turma ;
  }
  function setTurma($turma){
     this.$turma = $turma;
  }




  function getAno(){
     return $ano ;
  }
  function setAno($ano){
     this.$ano = $ano;
  }




  function getSexo(){
     return $sexo ;
  }
  function setSexo($sexo){
     this.$sexo = $sexo;
  }




  function getEstadoCivil(){
     return $estadoCivil ;
  }
  function setEstadoCivil($estadoCivil){
     this.$estadoCivil = $estadoCivil;
  }




  function getEndereco(){
     return $endereco ;
  }
  function setEndereco($endereco){
     this.$endereco = $endereco;
  }




  function getCidade(){
     return $cidade ;
  }
  function setCidade($cidade){
     this.$cidade = $cidade;
  }




  function getNumero(){
     return $numero ;
  }
  function setNumero($numero){
     this.$numero = $numero;
  }




  function getCep(){
     return $cep ;
  }
  function setCep($cep){
     this.$cep = $cep;
  }




  function getBairro(){
     return $bairro ;
  }
  function setBairro($bairro){
     this.$bairro = $bairro;
  }
  
  function cadastrarPessoa($idCurso,
                           $idTurma,
                           $numOrdem,
                           $identidade,
                           $nome,
                           $nomeGuerra,
                           $dataNascimento,
                           $cpf,
                           $sexo,
                           $estadoCivil,
                           $naturalidadeCidade,
                           $naturalidadeUF,
                           $especialidade,
                           $nomePai,
                           $nomeMae,
                           $email,
                           $saran,
                           $telResidencial,
                           $telContato,
                           $celular,
                           $endereco,
                           $bairro,
                           $cidade,
                           $uf,
                           $cep,
                           $pais,
                           $nomeBanco,
                           $numeroBanco,
                           $agencia,
                           $contaCorrente,
                           $cidadeBanco,
                           $ufBanco,
                           $postoGraduacao,
                           $forca,
                           $dataPraca,
                           $alistamento,
                           $dispensado,
                           $dataAlistamento,
                           $dataIncorporacao1,
                           $dataDesligamento1,
                           $dataIncorporacao2,
                           $dataDesligamento2,
                           $dataIncorporacao3,
                           $dataDesligamento3
                           ){
                           
     include("../../Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="insert into pessoa(identidade,
                                 nome,
                                 NomeGuerra,
                                 Data_Nascimento,
                                 CPF_CIC,
                                 Sexo,
                                 Estado_Civil,
                                 Naturalidade_Cidade,
                                 Naturalidade_UF,
                                 Especialidade,
                                 nome_pai,
                                 nome_mae,
                                 email,
                                 saram)values('$identidade',
                                              '$nome',
                                              '$nomeGuerra',
                                              '$dataNascimento',
                                              '$cpf',
                                              '$sexo',
                                              '$estadoCivil',
                                              '$naturalidadeCidade',
                                              '$naturalidadeUF',
                                              '$especialidade',
                                              '$nomePai',
                                              '$nomeMae',
                                              '$email',
                                              '$saran')";  echo "$sql<br>";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           $sqlTel="insert into cad_telefone(identidade,
                                             tel_Residencial,
                                             tel_Contato,
                                             celular)values('$identidade',
                                                            '$telResidencial',
                                                            '$telContato',
                                                            '$celular')";      echo "$sqlTel <br>";
           $resultSqlT=ibase_query($conexao,$sqlTel);

           if(!ibase_errmsg())
           {
               $sqlEnd="insert into endereco(identidade,
                                             endereco,
                                             bairro,
                                             cidade,
                                             uf,
                                             cep,
                                             nomepais)values('$identidade',
                                                             '$endereco',
                                                             '$bairro',
                                                             '$cidade',
                                                             '$uf',
                                                             '$cep',
                                                             '$pais')";        echo "$sqlEnd <br>";
               $resultSqlE=ibase_query($conexao,$sqlEnd);
               if(!ibase_errmsg())
               {
                  $sqlBnc="insert into cad_banco(identidade,
                                                 banco,
                                                 n_Banco,
                                                 agencia,
                                                 conta_Corrente,
                                                 cidade,
                                                 uf)values('$identidade',
                                                           '$nomeBanco',
                                                           '$numeroBanco',
                                                           '$agencia',
                                                           '$contaCorrente',
                                                           '$cidadeBanco',
                                                           '$ufBanco')";    echo "$sqlBnc <br>";
                  $resultSqlB=ibase_query($conexao,$sqlBnc);
                  if(!ibase_errmsg())
                  {
                     $sqlSA="insert into cad_sit_anterior(identidade,
                                                          postoGraduacao,
                                                          forca,
                                                          alistamento,
                                                          dispensado,
                                                          data_Praca,
                                                          data_Alistamento,
                                                          data_Incorporacao01,
                                                          data_Desligamento01,
                                                          data_Incorporacao02,
                                                          data_Desligamento02,
                                                          data_Incorporacao03,
                                                          data_Desligamento03)values('$identidade',
                                                                                     '$postoGraduacao',
                                                                                     '$forca',
                                                                                     '$alistamento',
                                                                                     '$dispensado',
                                                                                     '$dataPraca',
                                                                                     '$dataAlistamento',
                                                                                     '$dataIncorporacao1',
                                                                                     '$dataDesligamento1',
                                                                                     '$dataIncorporacao2',
                                                                                     '$dataDesligamento2',
                                                                                     '$dataIncorporacao3',
                                                                                     '$dataDesligamento3')";     echo "$sqlSA <br>";
                     $resultSqlSA=ibase_query($conexao,$sqlSA);
                     if(!ibase_errmsg())
                     {
                     $sqlAlunoTurma="insert into alunoturma(idcurso,
                                                          idturma,
                                                          identidade,
                                                          numordem,
                                                          postograduacao)values('$idCurso',
                                                                                '$idTurma',
                                                                                '$identidade',
                                                                                '$numOrdem',
                                                                                '$postoGraduacao')";
                                                                                echo "$sqlAlunoTurma <br>";
                        $resultSqlAlunoTurma=ibase_query($conexao,$sqlAlunoTurma);
                        if(!ibase_errmsg())
                        {
                           $mensagem=2;
                        }
                        else
                        {
                           ibase_rollback($conexao);
                           $mensagem=11;       //erro 11 erro ao inserir dados na tabela alunoTurma
                        }
                     }
                     else
                     {
                        ibase_rollback($conexao);
                        $mensagem=12;   //erro 12 erro ao inserir dados na tabela cad_sit_anterior
                     }

                  }
                  else
                  {
                     ibase_rollback($conexao);
                     $mensagem=13;  //erro 13 erro ao inserir dados na tabela cad_banco
                  }
               
               
              }
              else
              {
                ibase_rollback($conexao);
                $mensagem=14;   //erro 14 erro ao inserir dados na tabela endereco
              }

           }
           else
           {
              ibase_rollback($conexao);
              $mensagem=15;   //erro 15 erro ao inserir dados na tabela cad_telefone
           }
        }
        else
        {
           ibase_rollback($conexao);
           $mensagem=16;   //erro 16 erro ao inserir dados na tabela pessoa
        }
     }
     else
     {
        $mensagem=0;
     }
     ibase_close($conexao);
     return $mensagem;

  }
  
  function mostrarMensagem($msg)
  {
      if($cadastrado==2){
        echo "<script language='javascript' type='text/javascript'>alert('Cadastro efetudo. Obrigado!');window.location='../View/cadastrarAluno.php';</script>";

      }
      switch ($msg)
      {
         case 2:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro efetudo. Obrigado!');window.location='../View/cadastrarAluno.php';</script>";
            break;
         case 11:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira Curso/Turma/Ano!');history.back(1);</script>";
            break;
         case 12:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira situação anterior!');history.back(1);</script>";
            break;
         case 13:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira  os dados bancários!');history.back(1);</script>";
            break;
         case 14:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira dados de endereço!');history.back(1);</script>";
            break;
         case 15:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira o telefone!');history.back(1);</script>";
            break;
         case 16:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira os dados pessoais!');history.back(1);</script>";
            break;

      }
      
      

  }
  
  
  
  function listarEspecialidade()
  {
     include("../../Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="select distinct sigla from especialidade";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           while($relacionado=ibase_fetch_assoc($resultSql))
           {
               $especialidade[]=$relacionado;
           }
        }
        else
        {
           $especialidade=1;
        }
     }
     else
     {
        $especialidade=0;
     }
     return $especialidade;

  }
  
  function listarTurma($ano,$idCurso)
  {
     include("../../Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="select idturma,turma from turma where status='A' and ano=$ano and idcurso=$idCurso";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           while($relacionado=ibase_fetch_assoc($resultSql))
           {
               $turma[]=$relacionado;
           }
        }
        else
        {
           $turma=1;
        }
     }
     else
     {
        $turma=0;
     }
     return $turma;

  }
  function listarCursoTurmaAno()
  {
     include("../../Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="select t.idturma, t.idcurso, t.turma, t.ano , c.codcurso from turma t, curso c where c.idcurso=t.idcurso and status='A'";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           while($relacionado=ibase_fetch_assoc($resultSql))
           {
               $cta[]=$relacionado;
           }
        }
        else
        {
           $cta=1;
        }
     }
     else
     {
        $cta=0;
     }
     return $cta;

  }


   function listarAno()
  {
     include("../../Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="select distinct ano from turma where status='A'";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           while($relacionado=ibase_fetch_assoc($resultSql))
           {
               $ano[]=$relacionado;
           }
        }
        else
        {
           $ano=1;
        }
     }
     else
     {
        $ano=0;
     }
     return $ano;

  }
  
  
  
  function listarCurso($ano)
  {
     include("../../Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="select distinct c.idcurso,c.codcurso from curso c, turma t where c.idcurso=t.idcurso and t.status='A' and ano=$ano ";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           while($relacionado=ibase_fetch_assoc($resultSql))
           {
               $curso[]=$relacionado;
           }
        }
        else
        {
           $curso=1;
        }
     }
     else
     {
        $curso=0;
     }
     return $curso;

  }

}
?>
