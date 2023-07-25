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
<div id="titulo2">CENTRO DE INSTRUÇÃO E ADAPTAÇÃO DA AERONÁUTICA <br>
DIVISÃO DE ENSINO<br><br>

FORMULÁRIO DE CADASTRO DE ALUNOS </div>
<br><br>

<table border="0" width="100%">
<tr>&nbsp;Curso/Turma/Ano<td><select size="1" name="curso"><?foreach ($ctas as $chv){?><option name='curso' value="<?=$cur=$chv[IDCURSO]."-".$chv[IDTURMA]?>"><? echo "$chv[CODCURSO] - $chv[TURMA] - $chv[ANO]";?></option><?}?></select> </td>  </tr>
</table>

<br>


<!-- Div com os dados pessoais do aluno -->
<div id="cabecalho2">Dados Pessoais</div>
<div><table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr >
  <td width="360">&nbsp;Nome <input type="text" name="nome" id="nome" size="35" onkeyup="upper('nome')"onkeydown="upper('nome')"></td>
  <td width="330"> &nbsp;Nome de Guerra <input type="text" name="nomeGuerra" id="nomeGuerra" size="15" onkeyup="upper('nomeGuerra')" onkeydown="upper('nomeGuerra')"> </td>
  <td width="260">&nbsp;Identidade <input type="text" size="10" name="identidade" id="identidade"></td>

</tr>
<tr>

  <td>&nbsp;Saran <input type="text" size="8" name="saran" OnKeyPress="return formatarNumero(this, '######-#',event)" maxlength="8"></td>

</tr>
<tr>
  <td >&nbsp;Data de Nascimento<input type="text" name="dataNascimento" size="10" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"><label id="info">somente número</label></td>
  <td>&nbsp;CPF <input type="text" name="cpf" size="15" OnKeyPress="return formatarNumero(this, '###.###.###.##',event)"maxlength="14"></td>

</tr>
<tr>
<td width="60">&nbsp;Sexo
    <select size="1" name ="sexo" >
     <option value="M">Masculino</option>
     <option value="F">Feminino</option>
    </select> </td>
  <td width="90">&nbsp;</td>
  
  <td>&nbsp;Estado Civil
     <select size="1" name="estadoCivil">
       <option value="Solteiro">Solteiro</option>
       <option value="Casado">Casado</option>
       <option value="Divorciado">Divorciado</option>
       <option value="Viúvo">Viúvo</option>
     </select>
   </td>
  

</tr>


<tr>

  <td colspan="2">
   <table border="0" id="formulario3" width="100%">
       <tr>
           <td>&nbsp;Naturalidade</td>
       </tr>
       <tr>
           <td>&nbsp;Cidade <input type="text" name="cidadeNat" id="cidadeNat" size="15" onkeyup="upper('cidadeNat')"onkeydown="upper('cidadeNat')" > UF <input type="text" name="ufNat" id="ufNat" size="5" onkeyup="upper('ufNat')" onkeydown="upper('ufNat')" maxlength="2"></td>
       </tr>
   </table>
  </td>
  <td colspan="2">&nbsp;Especialidade  <select size="1" name="especialidade"><?foreach ($especialidades as $chv){?><option value=""><?=$chv[SIGLA]?></option><?}?> </select></td>
</tr>
<tr>
  <td colspan="4">&nbsp;Telefone <input type="text" name="telResidencial" size="12" OnKeyPress="return formatarNumero(this,'(##)####-####',event)"maxlength="13"> <label id="info">(xx)xxxx-xxxx </label> Telefone de Contato <input type="text" name="telContato" size="13" OnKeyPress="return formatarNumero(this,'(##)####-####',event)"maxlength="13">Celular <input type="text" name="celular" size="12" OnKeyPress="return formatarNumero(this,'(##)####-####',event)"maxlength="13"></td>
</tr>
<tr>
  <td colspan="3">&nbsp;Email <input type="text" name="email" size="40"></td>
</tr>

</table>
</div>

<br>

<!-- Div com os dados de filiaçao  -->
<div id="cabecalho2">Filiação</div>
<div> <table id="tabela1"  width="100%" cellspacing="5" >
         <tr><td width="30">&nbsp;Pai </td><td><input type="text" size="40" name="pai"  id="pai"  onkeyup="upper('pai')"onkeydown="upper('pai')"></td>
             <td width="30">&nbsp;Mãe </td><td><input type="text" size="40" name="mae" id="mae"  onkeyup="upper('mae')" onkeydown="upper('mae')"></td>
         </tr>
      </table>
</div>
<br>
<!-- Div com os dados de endereço  -->
<div id="cabecalho2">Endereço</div>
<div> <table id="tabela1"border="0" width="100%">
<tr>
  <td colspan="3">&nbsp;Endereço <input type="text" size="70" name="endereco" id="endereco"  onkeyup="upper('endereco')" onkeydown="upper('endereco')"><label id="info">Rua, nº</label></td>
  <td >&nbsp;Bairro <input type="text" size="20" name="bairro" id="bairro" onkeyup="upper('bairro')" onkeydown="upper('bairro')"></td>
</tr>
<tr>
  <td>&nbsp;Cidade <input type="text" size="20" name="cidade" id="cidade" onkeyup="upper('cidade')" onkeydown="upper('cidade')"></td>
  <td>&nbsp;UF <input type="text" size="5" name="uf" id="uf" onkeyup="upper('uf')"  onkeydown="upper('uf')"maxlength="2"></td>
  <td>&nbsp;CEP <input type="text" size="20" name="cep" OnKeyPress="return formatar(this, '#####-###',event)"maxlength="9"></td>
  <td>&nbsp;País <input type="text" size="20" name="pais" value="BRASIL" onkeyup="upper('pais')"  onkeydown="upper('pais')"> </td>
</tr>
</table>
</div>
<br>

<!-- Div com os dados bancários  -->
<div id="cabecalho2">Dados Bancários</div>
<div> <table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr>
  <td>&nbsp;Banco <input type="text" size="20" name="nomeBanco" id="nomeBanco" onkeyup="upper('nomeBanco')" onkeydown="upper('nomeBanco')" maxlength="50"></td>
  <td>&nbsp;Nº Banco <input type="text" size="5" name="numeroBanco" maxlength="10"></td>
</tr>
<tr>
  <td>&nbsp;Agência <input type="text" size="7" name="agencia" maxlength="4"></td>
  <td>&nbsp;Conta Corrente <input type="text" size="8" name="conta" maxlength="20"></td>
  <td>&nbsp;Cidade <input type="text" size="20" name="cidadeBanco" id="cidadeBanco" onkeyup="upper('cidadeBanco')"  onkeydown="upper('cidadeBanco')" maxlength="40"> UF <input type="text" size="5" maxlength="2" name="ufBanco" id="ufBanco" onkeyup="upper('ufBanco')" onkeydown="upper('ufBanco')"></td>
</tr>
</table>
</div>
<br>

<!-- Div com os dados de situaçao anterior  -->
<div id="cabecalho2">Situação Anterior</div>
<div> <table id="tabela1" border="0" width="100%" cellspacing="5" >
<tr>
  <td>&nbsp;Civil<input type="radio" name="situacao"> Militar<input type="radio"name="situacao"> </td>
  <td>&nbsp;Força
   <select size="1" name="forca">
    <option value="Exército">Exército</option>
    <option value="Marinha">Marinha</option>
    <option value="Aeronáutica">Aeronáutica</option>
    <option value="Forças Auxiliares">Forças Auxiliares</option>
   </select>
  </td>

  <td colspan="2">&nbsp;Data de Praca <input type="text" size="20" name="dataPraca" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>

</tr>
<tr>
 <td>&nbsp;Posto Graduação <input type="text" size="12" name="postoGraduacao"  onkeyup="upper('postoGraduacao')" onkeydown="upper('postoGraduacao')"maxlength="25"></td>
</tr>
<tr>
  <td>&nbsp;Em que força se alistou?
    <select size="1" name="alistamento">
     <option value="Exército">Exército</option>
     <option value="Marinha">Marinha</option>
     <option value="Aeronáutica">Aeronáutica</option>
   </select>

  </td>
  <td>&nbsp;Dispensado?
   <select size="1" name="dispensado">
    <option value="N">Não</option>
    <option value="S">Sim</option>
   </select>
  </td>
  <td>&nbsp;Data do Alistamento <input type="text" size="12" name="dataAlistamento" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>

</tr>
<tr>
  <td>&nbsp;Data da Incorporacao <input type="text" size="12" name="dataIncorporacao1" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>
  <td width="200">&nbsp;</td>
  <td>&nbsp;Data do Desligamento <input type="text" size="12" name="dataDesligamento1" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>
</tr>
<tr>
  <td>&nbsp;Data da Incorporacao <input type="text" size="12" name="dataIncorporacao2" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>
  <td width="200">&nbsp;</td>
  <td>&nbsp;Data do Desligamento <input type="text" size="12" name="dataDesligamento2" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>
</tr>
<tr>
  <td>&nbsp;Data da Incorporacao <input type="text" size="12" name="dataIncorporacao3" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>
  <td width="200">&nbsp;</td>
  <td>&nbsp;Data do Desligamento <input type="text" size="12" name="dataDesligamento3" OnKeyPress="return formatarNumero(this,'##/##/####',event)"maxlength="10"></td>
</tr>
</table>
</div>


<input type="submit" value="Enviar" name="enviar">


</div>

</form>


</BODY>
</HTML>
