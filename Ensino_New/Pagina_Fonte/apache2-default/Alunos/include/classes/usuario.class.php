<?php

/**
 * Classe para controle de login e permiss�es de usu�rio
 *
 * (PHP 4, PHP 5)
 *
 * @author Thiago Belem <contato@thiagobelem.net>
 * @link http://blog.thiagobelem.net/
 *
 * @version v1.1
 * @todo Criar a funcionalidade "Esqueci minha senha"
 *
 */
class Usuario {
    /**
     * Nome do banco de dados onde est� a tabela de usu�rios
     *
     * @var string
     * @since v1.0
     */
    var $bancoDeDados = 'meu_site';

    /**
     * Nome da tabela de usu�rios
     *
     * @var string
     * @since v1.0
     */
    var $tabelaUsuarios = 'usuarios';

    /**
     * Nomes dos campos onde ficam o usu�rio, a senha e o e-mail de cada usu�rio
     *
     * Formato: tipo => nome do campo na tabela
     *
     * O campo (email) s� � necess�rio para o "Esqueci minha senha"
     *
     * @var array
     * @since v1.0
     */
    var $campos = array(
        'usuario' => 'usuario',
        'senha' => 'senha'
    );

    /**
     * Nomes dos campos que ser�o pegos da tabela de usuarios e salvos na sess�o,
     * caso o valor seja false nenhum dado ser� consultado
     *
     * @var mixed
     * @since v1.0
     */
    var $dados = array('id', 'nome');

    /**
     * Inicia a sess�o se necess�rio?
     *
     * @var boolean
     * @since v1.0
     */
    var $iniciaSessao = true;

    /**
     * Prefixo das chaves usadas na sess�o
     *
     * @var string
     * @since v1.0
     */
    var $prefixoChaves = 'usuario_';

    /**
     * Usa um cookie para melhorar a seguran�a?
     *
     * @var boolean
     * @since v1.0
     */
    var $cookie = true;

    /**
     * O usu�rio e senha s�o case-sensitive?
     *
     * Em valores case-sensitive "casa" � diferente de "CaSa" e de "CASA"
     *
     * @var boolean
     * @since v1.1
     */
    var $caseSensitive = true;

    /**
     * Filtra os dados antes de consult�-los usando mysql_real_escape_string()?
     *
     * @var boolean
     * @since v1.1
     */
    var $filtraDados = true;

    /**
     * Quantidade (em dias) que o sistema lembrar� os dados do usu�rio ("Lembrar minha senha")
     *
     * Usado apenas quando o terceiro par�metro do m�todo Usuario::logaUsuario() for true
     * Os dados salvos ser�o encriptados usando base64
     *
     * @var integer
     * @since v1.1
     */
    var $lembrarTempo = 7;

    /**
     * Diret�rio a qual o cookie vai pertencer
     * Aten��o: N�o edite se voc� n�o souber o que est� fazendo!
     *
     * @var string
     * @since v1.1
     */
    var $cookiePath = '/';

    /**
     * Armazena as mensagens de erro
     *
     * @var string
     * @since v1.0
     */
    var $erro = '';

    /**
     * Codifica a senha do usu�rio
     *
     * Modifique esse m�todo caso voc� use alguma senha encriptada
     *
     * @access public
     * @since v1.0
     *
     * @param string $senha A senha que ser� codificada
     * @return string A senha j� codificada
     */
    function codificaSenha($senha) {
        // Altere aqui caso voc� use, por exemplo, o MD5:
        // return md5($senha);
        return $senha;
    }

    /**
     * Verifica se um usu�rio existe no sistema
     *
     * @access public
     * @since v1.0
     * @uses Usuario::codificaSenha()
     *
     * @param string $usuario O usu�rio que ser� validado
     * @param string $senha A senha que ser� validada
     * @return boolean Se o usu�rio existe
     */
    function validaUsuario($usuario, $senha) {
        $senha = $this->codificaSenha($senha);

        // Filtra os dados?
        if ($this->filtraDados) {
            $usuario = mysql_escape_string($usuario);
            $senha = mysql_escape_string($senha);
        }

        // Os dados s�o case-sensitive?
        $binary = ($this->caseSensitive) ? 'BINARY' : '';

        // Procura por usu�rios com o mesmo usu�rio e senha
        $sql = "SELECT COUNT(*) AS total
                FROM `{$this->bancoDeDados}`.`{$this->tabelaUsuarios}`
                WHERE
                    {$binary} `{$this->campos['usuario']}` = '{$usuario}'
                    AND
                    {$binary} `{$this->campos['senha']}` = '{$senha}'";
        $query = mysql_query($sql);
        if ($query) {
            // Total de usu�rios encontrados
            $total = mysql_result($query, 0, 'total');

            // Limpa a consulta da mem�ria
            mysql_free_result($query);
        } else {
            // A consulta foi mal sucedida, retorna false
            return false;
        }

        // Se houver apenas um usu�rio, retorna true
        return ($total == 1) ? true : false;
    }

    /**
     * Tenta logar um usu�rio no sistema salvando seus dados na sess�o e cookies
     *
     * @access public
     * @since v1.0
     * @uses Usuario::validaUsuario()
     * @uses Usuario::lembrarDados()
     *
     * @param string $usuario O usu�rio que ser� logado
     * @param string $senha A senha do usu�rio
     * @param boolean $lembrar Salvar os dados em cookies? (Lembrar minha senha)
     * @return boolean Se o usu�rio foi logado
     */
    function logaUsuario($usuario, $senha, $lembrar = false) {
        // Verifica se � um usu�rio v�lido
        if ($this->validaUsuario($usuario, $senha)) {

            // Inicia a sess�o?
            if ($this->iniciaSessao AND !isset($_SESSION)) {
                session_start();
            }

            // Filtra os dados?
            if ($this->filtraDados) {
                $usuario = mysql_real_escape_string($usuario);
                $senha = mysql_real_escape_string($senha);
            }

            // Traz dados da tabela?
            if ($this->dados != false) {
                // Adiciona o campo do usu�rio na lista de dados
                if (!in_array($this->campos['usuario'], $this->dados)) {
                    $this->dados[] = 'usuario';
                }

                // Monta o formato SQL da lista de campos
                $dados = '`' . join('`, `', array_unique($this->dados)) . '`';

                // Os dados s�o case-sensitive?
                $binary = ($this->caseSensitive) ? 'BINARY' : '';

                // Consulta os dados
                $sql = "SELECT {$dados}
                        FROM `{$this->bancoDeDados}`.`{$this->tabelaUsuarios}`
                        WHERE {$binary} `{$this->campos['usuario']}` = '{$usuario}'";
                $query = mysql_query($sql);

                // Se a consulta falhou
                if (!$query) {
                    // A consulta foi mal sucedida, retorna false
                    $this->erro = 'A consulta dos dados � inv�lida';
                    return false;
                } else {
                    // Traz os dados encontrados para um array
                    $dados = mysql_fetch_assoc($query);
                    // Limpa a consulta da mem�ria
                    mysql_free_result($query);

                    // Passa os dados para a sess�o
                    foreach ($dados AS $chave=>$valor) {
                        $_SESSION[$this->prefixoChaves . $chave] = $valor;
                    }
                }
            }

            // Usu�rio logado com sucesso
            $_SESSION[$this->prefixoChaves . 'logado'] = true;

            // Define um cookie para maior seguran�a?
            if ($this->cookie) {
                // Monta uma cookie com informa��es gerais sobre o usu�rio: usuario, ip e navegador
                $valor = join('#', array($usuario, $_SERVER['REMOTE_ADDR'], $_SERVER['HTTP_USER_AGENT']));

                // Encripta o valor do cookie
                $valor = sha1($valor);

                // Cria o cookie
                setcookie($this->prefixoChaves . 'token', $valor, 0, $this->cookiePath);
            }

            // Salva os dados do usu�rio em cookies? ("Lembrar minha senha")
            if ($lembrar) $this->lembrarDados($usuario, $senha);

            // Fim da verifica��o, retorna true
            return true;


        } else {
            $this->erro = 'Usu�rio inv�lido';
            return false;
        }
    }

    /**
     * Verifica se h� um usu�rio logado no sistema
     *
     * @access public
     * @since v1.0
     * @uses Usuario::verificaDadosLembrados()
     *
     * @param boolean $cookies Verifica tamb�m os cookies?
     * @return boolean Se h� um usu�rio logado
     */
    function usuarioLogado($cookies = true) {
        // Inicia a sess�o?
        if ($this->iniciaSessao AND !isset($_SESSION)) {
            session_start();
        }

        // Verifica se n�o existe o valor na sess�o
        if (!isset($_SESSION[$this->prefixoChaves . 'logado']) OR !$_SESSION[$this->prefixoChaves . 'logado']) {
            // N�o existem dados na sess�o

            // Verifica os dados salvos nos cookies?
            if ($cookies) {
                // Se os dados forem v�lidos o usu�rio � logado automaticamente
                return $this->verificaDadosLembrados();
            } else {
                // N�o h� usu�rio logado
                $this->erro = 'N�o h� usu�rio logado';
                return false;
            }
        }

        // Faz a verifica��o do cookie?
        if ($this->cookie) {
            // Verifica se o cookie n�o existe
            if (!isset($_COOKIE[$this->prefixoChaves . 'token'])) {
                $this->erro = 'N�o h� usu�rio logado';
                return false;
            } else {
                // Monta o valor do cookie
                $valor = join('#', array($_SESSION[$this->prefixoChaves . 'usuario'], $_SERVER['REMOTE_ADDR'], $_SERVER['HTTP_USER_AGENT']));

                // Encripta o valor do cookie
                $valor = sha1($valor);

                // Verifica o valor do cookie
                if ($_COOKIE[$this->prefixoChaves . 'token'] !== $valor) {
                    $this->erro = 'N�o h� usu�rio logado';
                    return false;
                }
            }
        }

        // A sess�o e o cookie foram verificados, h� um usu�rio logado
        return true;
    }

    /**
     * Faz logout do usu�rio logado
     *
     * @access public
     * @since v1.0
     * @uses Usuario::limpaDadosLembrados()
     * @uses Usuario::usuarioLogado()
     *
     * @param boolean $cookies Limpa tamb�m os cookies de "Lembrar minha senha"?
     * @return boolean
     */
    function logout($cookies = true) {
        // Inicia a sess�o?
        if ($this->iniciaSessao AND !isset($_SESSION)) {
            session_start();
        }

        // Tamanho do prefixo
        $tamanho = strlen($this->prefixoChaves);

        // Destroi todos os valores da sess�o relativos ao sistema de login
        foreach ($_SESSION AS $chave=>$valor) {
            // Remove apenas valores cujas chaves comecem com o prefixo correto
            if (substr($chave, 0, $tamanho) == $this->prefixoChaves) {
                unset($_SESSION[$chave]);
            }
        }

        // Destr�i asess�o se ela estiver vazia
        if (count($_SESSION) == 0) {
            session_destroy();

            // Remove o cookie da sess�o se ele existir
            if (isset($_COOKIE['PHPSESSID'])) {
                setcookie('PHPSESSID', false, (time() - 3600));
                unset($_COOKIE['PHPSESSID']);
            }
        }

        // Remove o cookie com as informa��es do visitante
        if ($this->cookie AND isset($_COOKIE[$this->prefixoChaves . 'token'])) {
            setcookie($this->prefixoChaves . 'token', false, (time() - 3600), $this->cookiePath);
            unset($_COOKIE[$this->prefixoChaves . 'token']);
        }

        // Limpa tamb�m os cookies de "Lembrar minha senha"?
        if ($cookies) $this->limpaDadosLembrados();

        // Retorna SE n�o h� um usu�rio logado (sem verificar os cookies)
        return !$this->usuarioLogado(false);
    }

    /**
     * Salva os dados do usu�rio em cookies ("Lembrar minha senha")
     *
     * @access public
     * @since v1.1
     *
     * @param string $usuario O usu�rio que ser� lembrado
     * @param string $senha A senha do usu�rio
     * @return void
     */
    function lembrarDados($usuario, $senha) {
        // Calcula o timestamp final para os cookies expirarem
        $tempo = strtotime("+{$this->lembrarTempo} day", time());

        // Encripta os dados do usu�rio usando base64
        // O rand(1, 9) cria um digito no in�cio da string que impede a descriptografia
        $usuario = rand(1, 9) . base64_encode($usuario);
        $senha = rand(1, 9) . base64_encode($senha);

        // Cria um cookie com o usu�rio
        setcookie($this->prefixoChaves . 'lu', $usuario, $tempo, $this->cookiePath);
        // Cria um cookie com a senha
        setcookie($this->prefixoChaves . 'ls', $senha, $tempo, $this->cookiePath);
    }

    /**
     * Verifica os dados do cookie (caso eles existam)
     *
     * @access public
     * @since v1.1
     * @uses Usuario::logaUsuario()
     *
     * @return boolean Os dados s�o validos?
     */
    function verificaDadosLembrados() {
        // Os cookies de "Lembrar minha senha" existem?
        if (isset($_COOKIE[$this->prefixoChaves . 'lu']) AND isset($_COOKIE[$this->prefixoChaves . 'ls'])) {
            // Pega os valores salvos nos cookies removendo o digito e desencriptando
            $usuario = base64_decode(substr($_COOKIE[$this->prefixoChaves . 'lu'], 1));
            $senha = base64_decode(substr($_COOKIE[$this->prefixoChaves . 'ls'], 1));

            // Tenta logar o usu�rio com os dados encontrados nos cookies
            return $this->logaUsuario($usuario, $senha, true);
        }

        // N�o h� nenhum cookie, dados inv�lidos
        return false;
    }

    /**
     * Limpa os dados lembrados dos cookies ("Lembrar minha senha")
     *
     * @access public
     * @since v1.1
     *
     * @return void
     */
    function limpaDadosLembrados() {
        // Deleta o cookie com o usu�rio
        if (isset($_COOKIE[$this->prefixoChaves . 'lu'])) {
            setcookie($this->prefixoChaves . 'lu', false, (time() - 3600), $this->cookiePath);
            unset($_COOKIE[$this->prefixoChaves . 'lu']);
        }
        // Deleta o cookie com a senha
        if (isset($_COOKIE[$this->prefixoChaves . 'ls'])) {
            setcookie($this->prefixoChaves . 'ls', false, (time() - 3600), $this->cookiePath);
            unset($_COOKIE[$this->prefixoChaves . 'ls']);
        }
    }
}

?>


