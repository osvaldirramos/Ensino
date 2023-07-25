function formatar(src, mask)
{
  var i = src.value.length;
  var saida = mask.substring(1,2);
  var texto = mask.substring(i)
  if (texto.substring(0,1) != saida)
  {
    src.value += texto.substring(0,1);
  }
}

function validaFormExc(){
if(document.formIndicacao1.protocolo.value==""){alert("Selecione uma indicação.");return false;}
}

function formatarNumero(src, mask,e)
{
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



function verificaFORM1()
{

}






function radio(campo)
{

   d = document.formIndicacao1;
   var radios = document.formIndicacao1.elements[campo].length;
   var r=false;

   if(radios==undefined)
   {
      if(document.formIndicacao1.elements[campo].checked)
      {
         return true;
      }
      else
      {
        return false;
      }
   }
   else
   {
      for (i=0;i<radios;i++)
      {
         if(document.formIndicacao1[i].type=="radio")
           if(document.formIndicacao1.elements[campo][i].checked==false){
              r=false;
           }
           else
           {
               return true;
           }
      }
      return r;
   }

}


//function radio()
//{
//
//   d = document.formIndicacao1;
//
//
//   for(i=0;i<d.turmaSelecionada.length;i++){
//      if(d.turmaSelecionada[i].checked){
//         return true;
//      }
//      else
//      {
//         alert("Escolha uma Turma!");
//         return false;
//      }
//
//   }
//
//
//   for(i=0;i<d.codDisciplina.length;i++){
//      if(d.codDisciplina[i].checked){
//         return true;
//      }
//      else{
//         alert("Escolha uma SubUnidade!");
//         return false;
//      }
//
//   }
//
//
//   for(i=0;i<d.periodo.length;i++){
//      if(d.periodo[i].checked){
//         return true;
//      }
//      else{
//         alert("Escolha uma Período!");
//         return false;
//      }
//
//   }
//}




function validaForm()
{
   d = document.formIndicacao1;
   
   if(document.getElementById("curso").value == "")
   {
      window.alert("Escolha um Curso!");
      document.getElementById("curso").focus();
      return false;
   }

   

   if(radio('turmaSelecionada')==false){alert("Preencha a turma!");return false;}//else{return true;}
   if(radio('codDisciplina')==false){alert("Preencha a disciplina!");return false;}//else{return true;}
   if(radio('periodo')==false){alert("Preencha período!");return false;}//else{return true;}


//for (i=0;i<document.formIndicacao1.elements.length;i++)
//   {
//      if(document.formIndicacao1[i].type=="radio")
//        if(document.formIndicacao1[i].checked==false){
//           alert("Preencha Turma!");
//           return false;             }
//        else       {
//               return true;  }
//   }
//
   
   
//   var todos_elementos = document.getElementById('turmaSelecionada');
//   var precos = Array();   alert(todos_elementos.length);
//   for (var i=0; i<todos_elementos.length; i++)
//   {    alert("a");
//      var el = todos_elementos[i];
//      if (el.className == 'turmaSelecionada')
//      {
//         precos.push(el);
//         alert("a");
//      }
//   }


   if(d.postoGraduacao.value == "")
   {
     alert("Informe o Posto/ Graduação");
     d.postoGraduacao.focus();
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
   if (d.cpf.value.length<11){

     alert("Informe o CPF!");
     d.cpf.focus();
     return false;
   }
   //validar senha
   if (d.email.value.length==""){
     alert("Informe o email!");
     d.email.focus();
     return false;
   }

   //validar senha
   if (d.turmaSelecionada.value == ""){
     alert("Informe a Cidade Natal!");
     d.turmaSelecionada.focus();
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
