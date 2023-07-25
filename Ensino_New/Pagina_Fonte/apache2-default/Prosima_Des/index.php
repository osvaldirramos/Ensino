<?
session_start();
session_destroy();

  //----------------------------------------------------------------------------//
  // NOME DO PROJETO           : Ensino                                         //
  //                                                                            //
  // DESCRICAO                 : Este modulo permite a usuario logar no sistema //
  //                             para isto devera entrarcom seu Login e senha. //
  //                                                                            //
  // EQUIPE DO DESENVOLVIMENTO :                                                //
  //          Gerente          :                                                //
  //          (Analista)       : Osvaldir Donizetti Ramos                       //
  //          (Programador(es)): 3 Sgt Germano / Osvaldir Donizetti Ramos       //
  //          (Programador(es)): SO SULZBACH                                    //
  //                                                                            //
  // INICIO DA ELABORACAO      : 13/04/2009                                     //
  //----------------------------------------------------------------------------//
  //                           DETALHES DE ALTERACAO                            //
  //----------------------------------------------------------------------------//
  // DATA                      :  16/05/2013                                    //
  // AUTOR                     :                                                //
  // MODULO ALTERADO           :                                                //
  // MOTIVO                    :  ALTERAÇÃO DE LAY-OUT                          //
  //----------------------------------------------------------------------------//

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta http-equiv="content-language" content="pt-BR" />

<html>
<head>

<NOSCRIPT>
Este navegador não compreende os scripts que se estão executando,
você deve habilitar o javascript no seu navegador ou  atualizar sua versão de navegador a uma mais recente.
</NOSCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: FICHA DE AVALIAÇÂO PROSIMA.</title>

<link rel="shortcut icon" type="image/ico" href="image/favicon_icea.ico" >
<link href="estilo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="validarFormulario.js"></script>

</head>

<body>
<?
include('cabec.inc')
?>

<titulo >FICHA DE AVALIAÇÃO PROSIMA</titulo>

<div class="button" onclick="if(valida($('#formLogin'))) confere();" id="ok" >OK</div>
<div class="button" onclick="if(valida($('#formLogin'))) confere();" id="ok2" style="display:none;" >OK</div>
<div class="button2" href='index.php' style="display:none;" id="sair" alvo="" >SAIR</div>
<div id='ediex'><div id='editar' class="ediex"></div><div id="excluir" class="ediex"></div></div>
<div id="cmd_extra"><span>OP&Ccedil;&Otilde;ES</span></div>

<div id="pnl_extra">
<div class="button3 inf" title="Entre aqui com as informações da Nova Ficha de Avaliação" alvo="corpo" ref="Nova_Ficha.php" titulo='SELE&Ccedil;&Atilde;O DA TURMA A SER AVALIADA' >NOVA FICHA</div>
<div class="button3" title="Voltar e selecionar outra turma" alvo="corpo"  ref="Sel_Turma.php" titulo='SELE&Ccedil;&Atilde;O DA TURMA A SER AVALIADA' >SELECIONAR TURMA</div>
</div>

<div id="div_avaliacao"></div>

<div id="corpo">
    <div id="login" style="position:absolute; width:300px; top:30px; left:50%; margin-left:-150px;">
        <form id="formLogin" name="formLogin" method="POST" action="registro.php" onSubmit="return submete();" class="BODY">
        <table style=" background-color:transparent; font-size:18px" cellpadding="0" cellspacing="0">
        	<tr style="height:70px; background-color:transparent !important;"> <td>LOGIN</td><td>
                <input style="font-size:25px;"  class="requerido" type="text" name="login" id="login" size="10" onkeyup="$(this).val($(this).val().toUpperCase());"  />
            </td></tr>
        	<tr> <td>SENHA</td><td>
                <input style="font-size:25px;" class="requerido" type="password" name="senha" id="senha" size="10" onkeyup="$(this).val($(this).val().toUpperCase());" />
            </td></tr>
            </table>
        </form>
  </div>
</div>
</body>
<script>
function confere(){
	$.post('registro.php', $('#formLogin').serialize(),function(resp){
		if(resp.mens ==""){
			if(resp.qdt>1) {
				$('#corpo').load('Sel_Turma.php');
				$('titulo').html('SELE&Ccedil;&Atilde;O DA TURMA A SER AVALIADA');
				$('#sair,#ok').toggle();
			} else $('#corpo').load('Sel_Avaliacao.php?idTurma='+resp.turma);
		} else {
			alert(resp.mens)
		}
	},'json')
}
</script>

</html>
