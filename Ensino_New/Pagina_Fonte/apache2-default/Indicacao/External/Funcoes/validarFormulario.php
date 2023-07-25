function formatar(src, mask){
  var i = src.value.length;
  var saida = mask.substring(1,2);
  var texto = mask.substring(i)
  if (texto.substring(0,1) != saida)
  {
    src.value += texto.substring(0,1);
  }
}

function formatarNumero(src, mask,e){
  var i = src.value.length;
  var saida = mask.substring(1,2);
  var texto = mask.substring(i)
  var tecla=(window.event)?event.keyCode:e.which;
   if (texto.substring(0,1) != saida)
  {
    src.value += texto.substring(0,1);
  }
  if((tecla>47 && tecla<58)) return true;
  else{
   	if (tecla==8 || tecla==0) return true;
	else  return false;
    }


}



function verifica_data ()
{
   dia = (document.forms[0].ultimaPromocao.value.substring(0,2));
   mes = (document.forms[0].ultimaPromocao.value.substring(3,5));
   ano = (document.forms[0].ultimaPromocao.value.substring(6,10));

   situacao = "";
   if(document.forms[0].ultimaPromocao.value.length==10){

      // verifica o dia valido para cada mes
      if ((dia < 01)||(dia < 01 || dia > 30) && (  mes == 04 || mes == 06 || mes == 09 || mes == 11 ) || dia > 31) {
         situacao = "falsa";
      }

            // verifica se o mes e valido
      if (mes < 01 || mes > 12 ) {
          situacao = "falsa";
      }

            // verifica se e ano bissexto
      if (mes == 2 && ( dia < 01 || dia > 29 || ( dia > 28 && (parseInt(ano / 4) != ano / 4)))) {
          situacao = "falsa";
      }

      if (document.forms[0].ultimaPromocao.value == "") {
         situacao = "falsa";
      }

      if (situacao == "falsa") {
         alert("Data inválida!");
         document.forms[0].ultimaPromocao.value="";
         document.forms[0].ultimaPromocao.focus();
      }
   }
}




function validaForm()
{
   d = document.cadastroAluno;
   if (d.curso.value == ""){
     alert("Informe Curso/Turma/Ano !");
     d.curso.focus();
     return false;
   }
   //validar nome
   if (d.nome.value == ""){
     alert("O campo Nome deve ser preenchido!");
     d.nome.focus();
     return false;
   }
   if (d.nomeGuerra.value == ""){
     alert("Informe seu nome de guerra!");
     d.nomeGuerra.focus();
     return false;
   }
   
   //validar user
   if (d.identidade.value == ""){
     alert("Informe a Identidade");
     d.identidade.focus();
     return false;
   }
   
   //validar senha
   if (d.dataNascimento.value.length<10){
     alert("Informe a Data de Nascimento!");
     d.dataNascimento.focus();
     return false;
   }
   
   //validar senha
   if (d.cpf.value.length<14){

     alert("Informe o CPF!");
     d.cpf.focus();
     return false;
   }

   //validar senha
   if (d.cidadeNat.value == ""){
     alert("Informe a Cidade Natal!");
     d.cidadeNat.focus();
     return false;
   }
   //validar senha
   if (d.ufNat.value.length<2){
     alert("O campo UF deve ser preenchido!");
     d.ufNat.focus();
     return false;
   }

   //validar telefone
   if (d.telResidencial.value.length<13&&d.telContato.value.length<13&&d.celular.value.length<13){
       alert ("Informe pelo menos um telefone");
       d.telResidencial.focus();
       return false;
   }
    //validar telefone(verificacao se contem apenas numeros)
   if (isNaN(d.telefone.value)){
       alert ("O campo telefone deve conter apenas numeros!");
       d.telefone.focus();
       return false;
    }
    
    if (d.cep.value.length<9){
     alert("O campo CEP deve ser preenchido completamente!");
     d.cep.focus();
     return false;
   }
    //validar data de nascimento
    erro=0;
    hoje = new Date();
    anoAtual = hoje.getFullYear();
    barras = d.dataNascimento.value.split("/");
    if (barras.length == 3)
    {
      dia = barras[0];
      mes = barras[1];
      ano = barras[2];
      resultado = (!isNaN(dia) && (dia > 0) && (dia < 32)) && (!isNaN(mes) && (mes > 0) && (mes < 13)) && (!isNaN(ano) && (ano.length == 4) && (ano <= anoAtual && ano >= 1900));
      if (!resultado)
      {
          alert("Formato de data invalido!");
          d.nasce.focus();
          return false;
      }
     }
     else
     {
         alert("Formato de data invalido!");
         d.nasce.focus();
         return false;
     }
     //validar sexo
     if (!d.sexo[0].checked && !d.sexo[1].checked) {
         alert("Escolha o sexo!")
         return false;
     }
     return true;
}



function upper(caixa){

     var texto;
     texto = document.getElementById(caixa).value.toUpperCase();
     document.getElementById(caixa).value= texto;


  }
  
function habilita(valor)
{
  d = document.cadastroAluno;
  if (valor===1){
     d.forca.disabled = false;
     d.dataPraca.disabled = false;
     d.postoGraduacao.disabled = false;

  }
  else{ //Se não,
     d.forca.disabled = true;
     d.dataPraca.disabled = true;
     d.postoGraduacao.disabled = true; //habilita o campo
  }
}
