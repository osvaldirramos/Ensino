<?php
      ob_start();
      session_start();
      session_unset();
      session_destroy();

	require_once('../Model/Login/LoginSystem.class.php');
	
	if(isset($_POST['Submit']))
	{
		if((!$_POST['Username']) || (!$_POST['Password']))
		{
			// display error message
			header('location: loginForm.php?msg=1');// show error
			exit;
		}
		
		$loginSystem = new LoginSystem();
		if($loginSystem->doLogin($_POST['Username'],$_POST['Password']))
		{
			/**
			 * Redirect here to your secure page
			 */

            header('Location: formSolicitacao.php');
		}
		else
		{
			header('location: loginForm.php?msg=2');
			exit;
		}
	}
	
	/**
	 * show Error messages
	 *
	 */
	function showMessage()
	{
		if(is_numeric($_GET['msg']))
		{
			switch($_GET['msg'])
			{
				case 1: echo "Preencha Login e Senha";
				break;
				
				case 2: echo "Dados Incorretos";
				break;
			}
		}
	}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Form</title>
	<link href="css/styles.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../External/estilos/estilo.css" rel="stylesheet" type="text/css">
</head>

<body>
<br><br><br><br><br><br><br><br>
<div id="wrapper">
<div id="divlogin">
     <br><br>
     <img src="../External/images/brasao.gif" width="72" height="82" border="0">
	<div class="cent"><h3>Login</h3></div>
	<div class="cent"><h3 class="error"><?php showMessage();?></h3></div>
	<div>
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
			Login <input name="Username" type="text" size="30" maxlength="30"/><br /><br>
			Senha<input name="Password" type="password" size="30" maxlength="30" /><br /><br>
			<input name="Submit" type="submit" value="Entrar" /><br /><br /><br />
		</form>
	</div>
</div>
</div>
</body>
</html>
