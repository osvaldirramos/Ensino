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
                           $cpf,
                           $sexo,
                           $especialidade,
                           $email,
                           $saran,
                           $telResidencial,
                           $celular,
                           $endereco,
                           $cidade,
                           $uf,
                           $cep,
                           $pais,
                           $postoGraduacao,
                           $tipoAluno,
                           $ultimaPromocao,
                           $idUnidade,
                           $idSubUnidade,
                           $quadro,
                           $dataMatricula,
                           $motivoDesligamento,
                           $dataDesligamento
                           ){
     include("../External/Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="insert into pessoa(identidade,
                                 ultimapromocao,
                                 postograduacao,
                                 quadro,
                                 nome,
                                 NomeGuerra,
                                 CPF_CIC,
                                 Sexo,
                                 Especialidade,
                                 email,
                                 saram)values('$identidade',
                                              '$ultimaPromocao',
                                              '$postoGraduacao',
                                              '$quadro',
                                              '$nome',
                                              '$nomeGuerra',
                                              '$cpf',
                                              '$sexo',
                                              '$especialidade',
                                              '$email',
                                              '$saran')";  echo "$sql<br>";
        $resultSql=ibase_query($conexao,$sql);
       // ibase_commit();
        if(!ibase_errmsg($resultSql))
        {

           $sqlAlunoTurma="insert into alunoturma(idcurso,
                                                          idturma,
                                                          identidade,
                                                          numordem,
                                                          postograduacao,
                                                          idunidade,
                                                          idsubunidade,
                                                          tipo_aluno,
                                                          dataMatricula,
                                                          motivoDesligamento,
                                                          dataDesligamento)values('$idCurso',
                                                                                '$idTurma',
                                                                                '$identidade',
                                                                                '$numOrdem',
                                                                                '$postoGraduacao',
                                                                                '$idUnidade',
                                                                                '$idSubUnidade',
                                                                                '$tipoAluno',
                                                                                '$dataMatricula',
                                                                                '$motivoDesligamento',
                                                                                '$dataDesligamento')";
                                                                                echo "$sqlAlunoTurma <br>";     // null,null,null)";
                                                                             //   echo "$sqlAlunoTurma <br>";

           $resultSqlAlunoTurma=ibase_query($conexao,$sqlAlunoTurma);
           if(!ibase_errmsg())
           {

               $sqlTel="insert into cad_telefone(identidade,
                                             tel_Residencial,
                                             celular)values('$identidade',
                                                            '$telResidencial',
                                                            '$celular')";      echo "$sqlTel <br>";
               $resultSqlT=ibase_query($conexao,$sqlTel);
               if(!ibase_errmsg())
               {

                  $sqlEnd="insert into cad_endereco(identidade,
                                                endereco,
                                                cidade,
                                                uf,
                                                cep,
                                                pais)values('$identidade',
                                                              '$endereco',
                                                              '$cidade',
                                                              '$uf',
                                                              '$cep',
                                                              '$pais')";        echo "$sqlEnd <br>";
                  $resultSqlE=ibase_query($conexao,$sqlEnd);
                  if(!ibase_errmsg())
                  {
                     $mensagem=2;
                  }
                  else
                  {
                      ibase_rollback($conexao);
                      $mensagem=11;       //erro 11 erro ao inserir dados na tabela     ca_telefone
                  }
               }
               else
               {
                 ibase_rollback($conexao);
                 $mensagem=14;   //erro 14 erro ao inserir dados na tabela cad_endereco
               }

           }
           else
           {
              ibase_rollback($conexao);
              $mensagem=15;   //erro 15 erro ao inserir dados na tabela alunoturma
           }
        }
        else
        {
           ibase_rollback($conexao);
           $mensagem=16;   //erro 16 erro ao inserir dados na tabela pessoa
        }
        $mensagem=2;
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
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg.  Confira dados de endereço!');history.back(1);</script>";
            break;
         case 12:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira situação anterior!');history.back(1);</script>";
            break;
         case 13:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira  os dados bancários!');history.back(1);</script>";
            break;
         case 14:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira o telefone!');history.back(1);</script>";
            break;
         case 15:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira Curso/Turma/Ano!');history.back(1);</script>";
            break;
         case 16:
            echo "<script language='javascript' type='text/javascript'>alert('Cadastro NÃO efetudo. Erro $msg. Confira os dados pessoais!');history.back(1);</script>";
            break;

      }
  }
  
  
  function getDataMatriculaDesligamento($curso,$turma)
  {
     include("../External/Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="select datainicio, datatermino from
                                             turma
                                             where idcurso=$curso and idturma=$turma";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           while($relacionado=ibase_fetch_assoc($resultSql))
           {
               $data[]=$relacionado;
           }
        }
        else
        {
           $data=1;
        }
     }
     else
     {
        $data=0;
     }
     return $data;
  }
  
  function getUnidade()
  {
     include("../External/Funcoes/conecta.inc");
     if($conexao)
     {
        $sql="select idunidade from tab_unidade";
        $resultSql=ibase_query($conexao,$sql);
        if(!ibase_errmsg())
        {
           while($relacionado=ibase_fetch_assoc($resultSql))
           {
               $unidade[]=$relacionado;
           }
        }
        else
        {
           $unidade=1;
        }
     }
     else
     {
        $unidade=0;
     }
     return $unidade;
  }
  
  
  
  
  function listarEspecialidade()
  {
     include("../External/Funcoes/conecta.inc");
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
     include("../External/Funcoes/conecta.inc");
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
     include("../External/Funcoes/conecta.inc");
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
     include("../External/Funcoes/conecta.inc");
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
     include("../External/Funcoes/conecta.inc");
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
