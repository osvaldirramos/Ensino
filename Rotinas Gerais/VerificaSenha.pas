//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : VerificaSenha.pas                              //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade verificar a senha.  //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          :                                                //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 01/06/2012                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit VerificaSenha;

interface
uses
   Dialogs, SysUtils;

Const
   CaracterEspecial= '!@#$%^&*()-_+={[}]:<>?/';
   Numeros= '1234567890';
   Letras= 'QWERTYUIOPASDFGHJKLZXCVBNM';
   PrazoLimite= 100;

type
   Funcao = Class
      Private

      Public
         Function PrazoSenha(DataVenc:TDateTime): Boolean;
         Function VerificaSenha(Senha, Conf_Senha, Senha_Anterior: String): Boolean;
         Function VerificaCaracter(VS_Caracter, VS_Comparacao: String): Boolean;
   end;

var
   TrataSenha: Funcao;

implementation

//------------------------------------------------------------------------------
//
// Rotina para verificar se a Data Esta expirando
//
//------------------------------------------------------------------------------

Function Funcao.PrazoSenha(DataVenc:TDateTime): Boolean;
var
   VI_tempo: Real;
   VB_Retorno: Boolean;
   Data, DataAtual:TDateTime;
   dia, mes, ano: Word;
begin
   VB_Retorno:= True;
   DataAtual:= Date;
   if DataVenc = 0 then        // Data vazia
   begin
      ShowMessage('Por motivo de segurança o período de utilização da senha expirou, '#13+'Favor trocar a sua senha');
      VB_Retorno:= False;
   end
   else
   begin
      if DataAtual < DataVenc then
      begin
         ShowMessage('Verifica se a Data do Computador não esta desatualizada...');
         VB_Retorno:= False;
      end
      else
      begin
         Data := DataAtual - DataVenc;
         DecodeDate( Data, ano, mes, dia);
         VI_tempo:= StrToFloat(FloatToStr(Data));
         if VI_Tempo > PrazoLimite then
         begin
            ShowMessage('Por motivo de segurança o período de utilização da senha expirou, '#13+'Favor trocar a sua senha');
            VB_Retorno:= False;
         end;
      end;
   end;
   PrazoSenha:= VB_Retorno;
end;

//------------------------------------------------------------------------------
//
// Rotina para verificar a classificacao da senha de acordo com as regras de
// Forte/Fraca
//
//- Minimo 8 e maximo 15 caracteres.
//- Obrigatorio ter pelo menos 1 caracter numerico.
//- Obrigatorio ter pelo menos 1 caracter especial.
//- A senha deve comecar e terminar com letras.
//
//------------------------------------------------------------------------------

Function Funcao.VerificaSenha(Senha, Conf_Senha, Senha_Anterior: String): Boolean;
var
   VB_Retorno: Boolean;
begin
   VB_Retorno:= True;

   if Senha = Senha_Anterior then
   begin
      ShowMessage('A senha atual não pode ser igual a anterior...'+#13+#13+'Favor digitar novamente');
      VB_Retorno:= False
   end
   else
   begin
      If Senha <> Conf_Senha then
      begin
         ShowMessage('Erro ao digitar a senha...'+#13+#13+'Favor digitar novamente');
         VB_Retorno:= False
      end
      else
      begin
         if Length(Senha) < 8 then
            VB_Retorno:= False
         else
         begin
           VB_Retorno:= VerificaCaracter(Copy(Senha, 1,1), Letras);      //--- Verifica se possui letra no inicio
           if VB_Retorno = True then
              VB_Retorno:= VerificaCaracter(Senha, Numeros);             //--- Verifica se possui numero
           if VB_Retorno = True then
              VB_Retorno:= VerificaCaracter(Senha, CaracterEspecial);    //--- Verifica se possui Caracter especial
         end;

         if VB_Retorno = False then
            ShowMessage('Para senha ser aceita, precisa: '+#13+#13+'-> Ter pelo menos 8 caracteres'+#13+'-> Ter pelo menos 8 caracteres'+#13+'-> Iniciar com Letra'+#13+'-> Ter pelo menos um número'+#13+'-> Ter pelo menos um caracter especial ('+CaracterEspecial+')');
      end;
   end;
   Result:=  VB_Retorno;
end;

//------------------------------------------------------------------------------
// Verifica se o caracter é uma letra
//------------------------------------------------------------------------------

Function Funcao.VerificaCaracter(VS_Caracter, VS_Comparacao: String): Boolean;
var
   VI_Tam_Co, VI_Tam_Ca, VI_Cont_Co, VI_Cont_Ca: Integer;
   VS_Comp_Co, VS_Comp_Ca: String;
   VB_Retorno: Boolean;
begin
   VI_Cont_Co:= 1;
   VI_Tam_Co:= Length(VS_Comparacao);
   VI_Tam_Ca:= Length(VS_Caracter);
   VB_Retorno:= False;

   While VI_Cont_Co <= VI_Tam_Co do
   begin
      VS_Comp_Co:= copy(VS_Comparacao, VI_Cont_Co,1);
      VI_Cont_Ca:= 1;
      While VI_Cont_Ca <= VI_Tam_Ca do
      begin
         VS_Comp_Ca:= copy(VS_Caracter, VI_Cont_Ca,1);
         if VS_Comp_Ca = VS_Comp_Co then
         begin
            VB_Retorno:= True;
            VI_Cont_Ca:= VI_Tam_Ca;
            VI_Cont_Co:= VI_Tam_Co;
         end;
         VI_Cont_Ca:= VI_Cont_Ca+1;
      end;
      VI_Cont_Co:= VI_Cont_Co+1;
   end;

   VerificaCaracter:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  TrataSenha:= Funcao.Create;
end.

