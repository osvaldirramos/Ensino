function validaForm()
{
  validaAluno();
  validaInstrutor();
  validaExercicio();
  validaData();
}


function validaAluno()
{
   d = document.form1;
   //validar aluno
   if (d.listaAluno.value == "" && d.listaAluno.value!="--- Selecione o ATCO"){
     alert("O campo 'Aluno' deve ser preenchido corretamente!");
     d.listaAluno.focus();
     return false;
   }
}

function validaInstrutor()
{
   //validar aluno
   if (d.listaInstrutor.value == "" && d.listaInstrutor.value!="--- Selecione o Instrutor"){
     alert("O campo 'Instrutor' deve ser preenchido corretamente!");
     d.listaInstrutor.focus();
     return false;
   }
}
function validaExercicio()
{

    d = document.form1;
    //validar Exercicio
    if (d.exercicio.value == ""){
       alert ("O campo exerc�cio deve ser preenchido!");
       d.exercicio.focus();
       return false;
    }
    //validar Exercicio(verificacao se contem apenas numeros)
    if (isNaN(d.exercicio.value)){
       alert ("O campo exerc�cio deve conter apenas numeros!");
       d.exercicio.value
       d.exercicio.focus();
       return false;
    }
}

function validaData()
{
    ////validar data
    d = document.form1;
    erro=0;
    hoje = new Date();
    anoAtual = hoje.getFullYear();
    barras = d.data.value.split(".");
    if (barras.length == 3)
    {
      dia = barras[0];
      mes = barras[1];
      ano = barras[2];
      resultado = (!isNaN(dia) && (dia > 0) && (dia < 32)) && (!isNaN(mes) && (mes > 0) && (mes < 13)) && (!isNaN(ano) && (ano.length == 4) && (ano <= anoAtual && ano >= 1900));
      if (!resultado)
      {
          alert("Formato de data invalido!");
          d.data.focus();
          return false;
      }
      else
      {
         return true;
      }
     }
     else
     {
         alert("Formato de data invalido!");
         d.data.focus();
         return false;
     }
}
