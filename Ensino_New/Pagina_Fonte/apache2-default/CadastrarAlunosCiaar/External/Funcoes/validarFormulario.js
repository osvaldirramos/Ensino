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


function validaForm()
{
   d = document.cadastroAluno;
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
   if (d.telResidencial.value.length<13){
       alert ("informe pelo menos o telefone residência");
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
