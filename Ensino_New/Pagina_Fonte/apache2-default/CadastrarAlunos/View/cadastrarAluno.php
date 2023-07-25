<? include "../Controller/AlunoController.php";
?>
<HTML>
<HEAD>
 <TITLE>Cadastro de alunos</TITLE>
<link href="../External/estilos/estilo.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../External/Funcoes/validarFormulario.js"></script>
</HEAD>
<BODY>
<form method="POST" name="cadastroAluno" action="../Controller/AlunoController.php" onSubmit="return validaForm();" >

<div id="corpo">

<br><br>
<div id="titulo2">INSTITUTO DE CONTROLE DO ESPAÇO AÉREO <br>
DIVISÃO DE ENSINO<br><br>

FORMULÁRIO DE CADASTRO DE ALUNOS </div>
<br><br>

<table border="0" width="100%">
<tr>&nbsp;Curso/Turma/Ano<td><select size="1" name="curso"><option></option><?foreach ($ctas as $chv){?><option name='curso' value="<?=$cur=$chv[IDCURSO]."-".$chv[IDTURMA]?>"><? echo "$chv[CODCURSO] - $chv[TURMA] - $chv[ANO]";?></option><?}?></select> </td>  </tr>
</table>

<br>


<!-- Div com os dados pessoais do aluno -->
<div id="cabecalho2">Documentação</div>
<div><table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr>
  <td width="260" align="right">&nbsp;Identidade</td> <td><input type="text" size="10" name="identidade"maxlength="20" id="identidade"></td>
</tr>
<tr>
  <td align="right">&nbsp;CPF </td> <td><input type="text" name="cpf" size="15" OnKeyPress="return formatarNumero(this, '###.###.###.##',event)"maxlength="14"></td>
</tr>
<tr>
  <td align="right">&nbsp;Saran </td> <td><input type="text" size="8" name="saran" OnKeyPress="return formatarNumero(this, '######-#',event)" maxlength="8"></td>
</tr>

</table>
</div>

<!-- Div com os dados pessoais do aluno -->
<div id="cabecalho2">Tipo de Aluno</div>
<div><table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr>
 <td >
    <select size="1" name ="tipoAluno">
      <option value="Militar da Aeronáutica">Militar da Aeronáutica</option>
      <option value="Militar do Exército">Militar do Exército</option>
      <option value="Militar do Marinha">Militar do Marinha</option>
      <option value="Civil">Civil</option>
    </select>
    </td>
</tr>
</table>
</div>

<div id="cabecalho2">Nome/Cargo</div>
<div><table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr>
<td align="right">&nbsp;Posto Graduação</td><td> <input type="text" size="12" name="postoGraduacao"  onkeyup="upper('postoGraduacao')" onkeydown="upper('postoGraduacao')"maxlength="25"></td>
</tr>
<tr >
<td align="right">&nbsp;Quadro</td><td> <input type="text" size="12" name="quadro"  onkeyup="upper('quadro')" onkeydown="upper('quadro')"maxlength="8"></td> <td>&nbsp;Especialidade</td><td>  <select size="1" name="especialidade"><?foreach ($especialidades as $chv){?><option value=""><?=$chv[SIGLA]?></option><?}?> </select></td>
</tr>
<tr>
<td align="right">&nbsp;Ultima Promoção</td><td> <input type="text" size="20" name="ultimaPromocao" OnKeyPress="return formatarNumero(this,'##/##/####',event)" onkeyup="verifica_data (this.value)" maxlength="10"></td>
</tr>
<tr>
  <td width="360" align="right">&nbsp;Nome</td><td> <input type="text" name="nome" id="nome" size="35" onkeyup="upper('nome')"onkeydown="upper('nome')" maxlength="100"></td>
</tr>
<tr>
  <td align="right" > &nbsp;Nome de Guerra </td><td><input type="text" name="nomeGuerra" id="nomeGuerra" size="15" onkeyup="upper('nomeGuerra')" onkeydown="upper('nomeGuerra')" maxlength="20"> </td>
  <td align="right">&nbsp;Sexo</td><td>
    <select size="1" name ="sexo" >
     <option value="M">Masculino</option>
     <option value="F">Feminino</option>
    </select> </td>

</tr>
</table>
</div>
<!-- -->

<div id="cabecalho2">Procedência (Unidade / Sub Unidade)</div>
<div><table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr>
  <td align="right" >&nbsp;Unidade</td><td><select size='1' name= 'idUnidade'><option></option><?foreach ($unidades as $chv) echo "<option value='$chv[IDUNIDADE]'>$chv[IDUNIDADE]</option>";?>
</select>  </td>
</tr>
<tr>
   <td align="right" >&nbsp;Sub Unidade</td><td><select size='1' name= 'idSubUnidade'><option></option><?foreach ($unidades as $chv) echo "<option value='$chv[IDUNIDADE]'>$chv[IDUNIDADE]</option>";?>
</select>  <label id="info">Se não houver repita a Unidade </label></td>
</tr>
</table>
</div>
<br>

<!-- Div com os dados de endereço  -->
<div id="cabecalho2">Endereço</div>
<div> <table id="tabela1"border="0" width="100%">
<tr>
  <td align="right">&nbsp;Endereço</td><td> <input type="text" size="70" name="endereco" id="endereco"  onkeyup="upper('endereco')" onkeydown="upper('endereco')" maxlength="240"><label id="info">Rua, Av, nº, Bairro </label></td>
</tr>
<tr>
  <td align="right" >&nbsp;Cidade</td><td> <input type="text" size="20" name="cidade" id="cidade" onkeyup="upper('cidade')" onkeydown="upper('cidade')" maxlength="40"></td>
</tr>
<tr>
  <td align="right">&nbsp;UF</td><td> <input type="text" size="5" name="uf" id="uf" onkeyup="upper('uf')"  onkeydown="upper('uf')"maxlength="2"></td>
</tr>
<tr>
  <td align="right">&nbsp;CEP</td><td> <input type="text" size="20" name="cep" OnKeyPress="return formatar(this, '#####-###',event)"maxlength="9"></td>
</tr>
<tr>
  <td align="right">&nbsp;País</td><td> <input type="text" size="20" name="pais" value="BRASIL" onkeyup="upper('pais')"  onkeydown="upper('pais')" maxlength="12"> </td>
</tr>
<tr>
  <td align="right">&nbsp;Email</td><td> <input type="text" name="email" size="40" maxlength="150"></td>
</tr>

</table>
</div>
<!-- -->

<div id="cabecalho2">Telefones</div>
<div><table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr>
  <td align="right">&nbsp;Telefone</td><td> <input type="text" name="telResidencial" size="12" OnKeyPress="return formatarNumero(this,'(##)####-####',event)"maxlength="13">
</tr>
<tr>
  <td align="right">&nbsp;Celular</td><td> <input type="text" name="celular" size="12" OnKeyPress="return formatarNumero(this,'(##)####-####',event)"maxlength="13">  <label id="info">(xx)xxxx-xxxx </label></td>
</tr>
</table>
</div>

<br>



<input type="submit" value="Enviar" name="enviar">

</div>
</form>
</BODY>
</HTML>
