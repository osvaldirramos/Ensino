function validaForm()
{
   d = document.cadastroAluno;
   //validar nome
   if (d.nome.value == ""){
     alert("O campo " + d.nome.name + " deve ser preenchido!");
     d.nome.focus();
     return false;
   }
   //validar user
   if (d.user.value == ""){
     alert("O campo " + d.user.name + " deve ser preenchido!");
     d.user.focus();
     return false;
   }
   //validar senha
   if (d.senha.value == ""){
     alert("O campo " + d.senha.name + " deve ser preenchido!");
     d.senha.focus();
     return false;
   }
   //validar email
   if (d.email.value == ""){
     alert("O campo " + d.email.name + " deve ser preenchido!");
     d.email.focus();
     return false;
    }
    //validar email(verificao de endereco eletrônico)
    parte1 = d.email.value.indexOf("@");
    parte2 = d.email.value.indexOf(".");
    parte3 = d.email.value.length;
    if (!(parte1 >= 3 && parte2 >= 6 && parte3 >= 9)) {
      alert ("O campo " + d.email.name + " deve ser conter um endereco eletronico!");
      d.email.focus();
      return false;
    }
    //validar telefone
    if (d.telefone.value == ""){
       alert ("O campo " + d.telefone.name + " deve ser preenchido!");
       d.telefone.focus();
       return false;
    }
    //validar telefone(verificacao se contem apenas numeros)
    if (isNaN(d.telefone.value)){
       alert ("O campo " + d.telefone.name + " deve conter apenas numeros!");
       d.telefone.focus();
       return false;
    }
    //validar data de nascimento
    erro=0;
    hoje = new Date();
    anoAtual = hoje.getFullYear();
    barras = d.nasce.value.split("/");
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
     
  function upper(){
     var texto;
     texto = document.cadastroAluno.nome.value.toUpperCase();
     document.cadastroAluno.nome.value = texto;
  }

     
