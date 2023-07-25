//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns para o sistema.                         //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/05/1999                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs, midaslib, 
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Module, IBQuery, ToolWin, ShellApi, Variants, JvColorCombo,
  JvRichEd, JvDBRichEd, JvCheckBox, JvToolEdit, JvCombobox, ComObj, XPMan, Menus,
  JvArrowBtn, JvLookOut, JvTransBtn, JvGradient, JvShape,
  Rotinas_TrataData;

const
   ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
   SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
   NULL     = '';
   ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   Ultima_Atualizacao= '05-Fevereiro-2018';
   Versao= '05.87';

   //--- Status do Item de prova:

   Inserido= 'I';        // Item inserido
   Disponivel= 'D';      // Item Disponivel
   NaoDisponivel= 'N';   // Item não Disponivel
   Revisar= 'R';         // Item a ser revisado
   Excluido= 'E';        // Item Excluido

   type
   Funcao = Class
      Private
          AModulo: array[0..52] of String;

         VS_TransfItem, VS_Usuario, VS_Privilegio, VS_CodCurso, VS_PostoGraduacao, VS_SelTurma, VS_RelDesempenho: String;
         VS_Secao, VS_NomeInstituto, VS_Cargo, VS_Identidade, VS_IdCurso, VS_Disciplina : String;

         VB_RetUnidade, VB_RetCargo, VB_RetIdentidade : Boolean;
      Public
         procedure SomenteNumero(Sender: TObject;var Key: Char);

         procedure TrataMensagem(VS_Comando: String);

         procedure TratarJvExpressButton( JvExpressButton: TJvExpressButton; JvShape: TJvShape; Status: boolean);
         procedure TratarJvTransparentButton( JvTransparentButton: TJvTransparentButton; JvShape: TJvShape; Status: boolean);
         procedure Tratar_NomeGuerra( DBComboBox_NomeGuerra: TDBComboBox; VS_NomeCompleto: String);
         Procedure Grava_Telefone(VS_Identidade, VS_Celular1, VS_Tel_Residencial, VS_Tel_Contato, VS_Tel_Comercial, VS_Celular, VS_Fax : String);
         Procedure Grava_Endereco(VS_Identidade, VS_Endereco, VS_Cidade, VS_UF, VS_Cep, VS_Pais: String);
         Procedure Grava_Avaliacao(VS_IdCurso, VS_IdTurma, VS_FaseAplicacao, VS_ReferenciaAvaliacao, VS_CodMateria, VS_MediaParcial, VS_PesoAplicacao, VS_MediaMinima, VS_CodProva, VS_PesoDisciplina, VS_Media, VS_Observacao, VS_Ordem: String);
         Procedure Grava_Item_Prova(VS_IdCurso, VS_IdTurma, VS_NumItem, VS_CodMateria, VS_Disciplina, VS_Unidade, VS_SubUnidade, VS_Objetivo, VS_Quarentena, VS_Serie, VS_Status: String);
         Procedure Grava_Disciplina(VS_IdCurso, VS_IdTurma, VS_CodMateria, VS_NomeMateria, VS_NumeroAulasTeoricas, VS_NumeroAulasPraticas, VS_Fase, VS_PerguntaChefe, VS_PerguntaAluno, VS_Especialidade, VS_Qtd_Objetivos, VS_Atualizacao, VS_Ano: String);
         Procedure Grava_Abrangencia(VS_IdCurso, VS_IdTurma, VS_FaseAplicacao, VS_ReferenciaAvaliacao, VS_CodMateria, VS_Materia: String);

         Procedure BotoesNovo01(Status: Boolean; Novo, Editar, Excluir, Gravar, Cancelar: TJvTransparentButton);

         Procedure BotoesBasico(Status: Boolean; Novo, Editar, Excluir, Gravar, Cancelar: TJvTransparentButton);
         Procedure TrimAppMemorySize;
         Procedure Grava_Exclusao_Item(VS_NumItem: String);

         Function TotalRegistros( IBQuery: TIBQuery): String;
         Function VerificaSerie(VS_IdCurso, VS_IdTurma, VS_CodMateria, VS_Objetivo : string): String;
         Function TratarConsultaComAcento(Campo, Compara, Str: String): String;
         Function VerificaTurma(VS_Msg: String): Boolean;

         Function SemanaAno ( Dataatual: String): integer;
         Function GerarCodigoInstrutor(VS_IdCurso: String; S_IdTurma: String): String;
         Function TestaParaPar(TestaInteiro : Integer) : boolean;
         Function ValidaCampo(PS_Campo, Msg: String): Boolean;

         Function MontaCurso(PS_Curso: String): Boolean;
         Function TratarData(VS_Data: String) : string;
         Function AjustarMinuscula(VS_Entrada : String) : string;
         Function AjustarMaiscula(VS_Entrada : String) : string;
         Function CentraStr(VS_Variavel: string; Len: integer): string;
         Function LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
         Function ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
         Function TratarNota(VR_Valor: Real) : Real;
         Function Extenso(VS_Valor: String; VC_Tipo: Char):String;
         Function Converte(VS_Valor: String; VI_Grandeza: integer; VF_Numero: Double; VI_Numero: Integer; VC_Tipo: Char):String;

         Function criptografar (Armazena: String): string;
         Function descriptografar (Armazena: String): string;
         Function NFicha(VS_NFicha: String) : String;
         Function Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
         Function MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
         Function MaiorCodigoComRestricao(VS_Campo: String; VS_Restricao: String; VS_Tabela: String): Integer;
         Function DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
         Function QtdRegistro(VS_Comando: String): Integer;
         Function ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
         Function Randomico(VI_Limite: integer): String;
         Function RetornaCidade(Data: String): String;
         Function GerarSenha(PI_Tamanho: Integer): String;
         Function Ctrl_Item: Integer;

         Procedure Historico_Item( NumItem, Atividade: String);
         Procedure TratarBotoes(IBQuery: TIBQuery; Novo, Editar, Excluir: TJvTransparentButton);

         procedure CadastrarAcessoFichaAvaliacao(P_IdCurso, P_IdTurma, P_Identidade, P_senha: String);
         Procedure AtualizaQuery(Query_Atualiza: TIBQuery);

         Procedure Botoes_Principais(Status: Boolean; ToolButton_Localizar: TToolButton;
                           ToolButton_Relatorio: TToolButton; ToolButton_Retornar: TToolButton;
                           ToolButton_Windows: TToolButton;ToolButton_Sobre: TToolButton);

         Procedure CorDBGrid(DBGrid: TDBGrid; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState );
         Procedure CabecalhoForm(Form: TForm; PS_Cabecalho: String);
         procedure Windows;
         Procedure ExecutaQuery(IBQuery_Executa: TIBQuery; PS_Comando: String);
         Procedure ExecusaoQuery(VS_Comando: String);
         Procedure ExecutaTransacao;
         Procedure abortaTransacao;

         Function GetUsuario: String;
         Function GetPrivilegio: String;
         Function GetPessoa: String;
         Function GetCargo: String;
         Function GetSenha: String;

         Function GetNomeInstituto: String;
         Procedure SetNomeInstituto(PS_NomeInstituto: String);

         Function GetNumItem: String;
         Procedure SetNumItem(PS_NumItem: String);

         Function GetCodCurso: String;
         Procedure SetCodCurso(PS_CodCurso: String);

         Function GetIdCurso: String;
         Procedure SetIdCurso(PS_IdCurso: String);

          Function GetCadCurso: String;
          Procedure SetCadCurso(PI_CadCurso: String);

          Procedure SetDisciplina(PS_Disciplina: String);
          Function GetDisciplina: String;

         Function GetGravaAndamentoTurma: Boolean;
         Function GetRetornaPessoa: Boolean;
         Function GetRetornaCargo: Boolean;
         Function GetRetornaUnidade: Boolean;
         Function GetCodUsuario: String;
         Function GetAcesso: String;
         Function GetFoto: String;
         Function GetEditor: Integer;
         Function GetAbertura: Boolean;
         Function GetRelDesempenho: String;
         Function GetRespAssinatura: Integer;
         Function GetGabaritoProva: String;
         Function GetSetTurma: String;
         Function GetTransfItem: String;
         Function GetNumItenIdel: Integer;
         Function GetSecao: String;
                                                                            //---
         procedure SetSecao;
         Procedure SetNumItenIdel(PI_NumItenIdel: Integer);
         Procedure SetTransfItem(PS_TransfItem: String);
         Procedure SetSelTurma(PS_SelTurma: String);
         Procedure SetGabaritoProva(PS_GabaritoProva: String);
         Procedure SetGravaAndamentoTurma(PB_Grava: Boolean);
         Procedure SetRespAssinatura(PI_RespAssinatura: Integer);
         Procedure SetRelDesempenho(PS_RelDesempenho: String);
         Procedure SetAbertura(PB_Abertura: Boolean);
         Procedure SetEditor(PI_Editor: Integer);
         Procedure SetSenha(PS_Senha: String);
         Procedure SetAcesso(PS_Acesso: String);
         Procedure SetCodUsuario (PS_CodUsuario: String);
         Procedure SetUsuario (VS_SetUsuario: String);
         Procedure SetPrivilegio (VS_Set_Privelegio: String);
         Procedure SetPostoGraduacao (PS_PostoGraduacao: String);
         Procedure SetPessoa (PS_Identidade: String);
         Procedure SetCargo (PS_Cargo: String);

         Procedure SetRetornaPessoa (PB_RetIdentidade: Boolean);
         Procedure SetRetornaCargo (PB_RetCargo: Boolean);
         Procedure SetFoto(PS_Foto: String);

         Procedure SetaPerfilAcesso;
         Procedure GravaPerfilAcesso(PS_IdCodigo: String; PS_Acesso: String);
         Procedure PerfilAcesso(PS_IdCodigo: String; PS_Modulo: String);
         Procedure GravaAcesso(PS_Modulo: String; PS_Atividade: String);
         Procedure OpenQuery(VS_Comando: String);
         procedure Trocar(Trocar: String; Por: String);
         Procedure AjustaHora;
   end;

var
   Funcoes: Funcao;
   VS_NumItem, VS_Foto, VS_Senha, VS_Acesso, VS_CodUsuario, VS_CadCurso: String;
   VS_GabaritoProva: String;
   VI_NumItenIdel, VI_RespAssinatura, VI_Editor: integer;
   VB_Grava, VB_Abertura: Boolean;

   VS_nu : array[1..9] of String;
   VS_nd : array[1..9] of String;
   VS_ndb : array[1..10] of String;
   VS_nc : array[1..9] of String;

implementation

uses Editor_Texto, TrataDocumento;

//------------------------------------------------------------------------------
//
// Tratamento de setagens
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Retorna o Filtro da Disciplina
//------------------------------------------------------------------------------

Function Funcao.GetDisciplina: String;
begin
   GetDisciplina:= VS_Disciplina;
end;

//------------------------------------------------------------------------------
// Seta filtro de disciplina
//------------------------------------------------------------------------------

Procedure Funcao.SetDisciplina(PS_Disciplina: String);
begin
   VS_Disciplina:= PS_Disciplina;
end;

//------------------------------------------------------------------------------
// Retorna o numero idel de itens
//------------------------------------------------------------------------------

Function Funcao.GetNumItenIdel: Integer;
begin
   GetNumItenIdel:= VI_NumItenIdel;
end;

//------------------------------------------------------------------------------
// Seta inicializacao do numero ideal de itens
//------------------------------------------------------------------------------

Procedure Funcao.SetNumItenIdel(PI_NumItenIdel: Integer);
begin
   VI_NumItenIdel:= PI_NumItenIdel;
end;

//------------------------------------------------------------------------------
// Retorna o nome do instituto
//------------------------------------------------------------------------------

Function Funcao.GetNomeInstituto: String;
begin
   GetNomeInstituto:= VS_NomeInstituto;
end;

//------------------------------------------------------------------------------
// Seta inicializacao da Tranferencia de Item
//------------------------------------------------------------------------------

Procedure Funcao.SetNomeInstituto(PS_NomeInstituto: String);
begin
   VS_NomeInstituto:= PS_NomeInstituto;
end;

//------------------------------------------------------------------------------
// Retorna inicializacao da Tranferencia de Item
//------------------------------------------------------------------------------

Function Funcao.GetTransfItem: String;
begin
   GetTransfItem:= VS_TransfItem;
end;

//------------------------------------------------------------------------------
// Seta inicializacao da Tranferencia de Item
//------------------------------------------------------------------------------

Procedure Funcao.SetTransfItem(PS_TransfItem: String);
begin
   VS_TransfItem:= PS_TransfItem;
end;

//------------------------------------------------------------------------------
// Retorna o Numero do Gabarito da Prova
//------------------------------------------------------------------------------

Function Funcao.GetSetTurma: String;
begin
   GetSetTurma:= VS_SelTurma;
end;

//------------------------------------------------------------------------------
// Seta se sera apresentado Preview inicialmente pelo Editor
//------------------------------------------------------------------------------

Procedure Funcao.SetSelTurma(PS_SelTurma: String);
begin
   VS_SelTurma:= PS_SelTurma;
end;

//------------------------------------------------------------------------------
// Retorna o Numero do Gabarito da Prova
//------------------------------------------------------------------------------

Function Funcao.GetGabaritoProva: String;
begin
   GetGabaritoProva:= VS_GabaritoProva;
end;

//------------------------------------------------------------------------------
// Seta se sera apresentado Preview inicialmente pelo Editor
//------------------------------------------------------------------------------

Procedure Funcao.SetGabaritoProva(PS_GabaritoProva: String);
begin
   VS_GabaritoProva:= PS_GabaritoProva;
end;

//------------------------------------------------------------------------------
// Retorna o Numero do Item
//------------------------------------------------------------------------------

Function Funcao.GetNumItem: String;
begin
   GetNumItem:= VS_NumItem;
end;

//------------------------------------------------------------------------------
// Seta se sera apresentado Preview inicialmente pelo Editor
//------------------------------------------------------------------------------

Procedure Funcao.SetNumItem(PS_NumItem: String);
begin
   VS_NumItem:= PS_NumItem;
end;

//------------------------------------------------------------------------------
// Recebe o Codigo do Curso
//------------------------------------------------------------------------------

Procedure Funcao.SetCodCurso(PS_CodCurso: String);
begin
  VS_CodCurso:= PS_CodCurso;
end;

//------------------------------------------------------------------------------
// Retorna o Codigo do Curso
//------------------------------------------------------------------------------

Function Funcao.GetCodCurso: String;
begin
  GetCodCurso:= VS_CodCurso;
end;

//------------------------------------------------------------------------------
// Recebe o Id do Curso
//------------------------------------------------------------------------------

Procedure Funcao.SetIdCurso(PS_IdCurso: String);
begin
  VS_IdCurso:= PS_IdCurso;
end;

//------------------------------------------------------------------------------
// Retorna o Id do Curso
//------------------------------------------------------------------------------

Function Funcao.GetIdCurso: String;
begin
  GetIdCurso:= VS_IdCurso;
end;

//------------------------------------------------------------------------------
// Recebe o tipo do Relatorio de Desempenho
//------------------------------------------------------------------------------

Procedure Funcao.SetGravaAndamentoTurma(PB_Grava: Boolean);
begin
  VB_Grava:= PB_Grava;
end;

//------------------------------------------------------------------------------
// Retorna se habilita o botao de cadastrar no andamento do turma ou nao
//------------------------------------------------------------------------------

Function Funcao.GetGravaAndamentoTurma: Boolean;
begin
  GetGravaAndamentoTurma:= VB_Grava;
end;

//------------------------------------------------------------------------------
// Retorna o tipo do Relatorio de Desempenho
//------------------------------------------------------------------------------

Function Funcao.GetRespAssinatura: Integer;
begin
  GetRespAssinatura:= VI_RespAssinatura;
end;

//------------------------------------------------------------------------------
// Recebe o tipo do Relatorio de Desempenho
//------------------------------------------------------------------------------

Procedure Funcao.SetRespAssinatura(PI_RespAssinatura: Integer);
begin
  VI_RespAssinatura:= PI_RespAssinatura;
end;

//------------------------------------------------------------------------------
// Retorna o tipo do Relaorio de Desempenho
//------------------------------------------------------------------------------

Function Funcao.GetRelDesempenho: String;
begin
  GetRelDesempenho:= VS_RelDesempenho;
end;

//------------------------------------------------------------------------------
// Retorna o tipo do Relaorio de Desempenho
//------------------------------------------------------------------------------

Procedure Funcao.SetRelDesempenho(PS_RelDesempenho: String);
begin
  VS_RelDesempenho:= PS_RelDesempenho;
end;

//------------------------------------------------------------------------------
// Retorna da abertura da tela inicial
//------------------------------------------------------------------------------

Function Funcao.GetAbertura: Boolean;
begin
   GetAbertura:= VB_Abertura;
end;

//------------------------------------------------------------------------------
// Seta abertura da tela inicial
//------------------------------------------------------------------------------

Procedure Funcao.SetAbertura(PB_Abertura: Boolean);
begin
   VB_Abertura:= PB_Abertura;
End;

//------------------------------------------------------------------------------
// Retorna o Editor Selecionado
//------------------------------------------------------------------------------

Function Funcao.GetCadCurso: String;
begin
   GetCadCurso:= VS_CadCurso;
end;

//------------------------------------------------------------------------------
// Seta Editor selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetCadCurso(PI_CadCurso: String);
begin
   VS_CadCurso:= PI_CadCurso;
End;

//------------------------------------------------------------------------------
// Retorna o Editor Selecionado
//------------------------------------------------------------------------------

Function Funcao.GetEditor: Integer;
begin
   GetEditor:= VI_Editor;
end;

//------------------------------------------------------------------------------
// Seta Editor selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetEditor(PI_Editor: Integer);
begin
   VI_Editor:= PI_Editor;
End;

//------------------------------------------------------------------------------
// Retorna a Foto selecionada
//------------------------------------------------------------------------------

Function Funcao.GetFoto: String;
begin
   GetFoto:= VS_Foto;
end;

//------------------------------------------------------------------------------
// Recebe a data selecionada
//------------------------------------------------------------------------------

Procedure Funcao.SetFoto(PS_Foto: String);
begin
   VS_Foto:= PS_Foto;
End;

//------------------------------------------------------------------------------
// Recebe a senha
//------------------------------------------------------------------------------

Procedure Funcao.SetSenha(PS_Senha: String);
begin
   VS_Senha:= PS_Senha;
End;

//------------------------------------------------------------------------------
// Retorna a senha
//------------------------------------------------------------------------------

Function Funcao.GetSenha: String;
begin
   GetSenha:= VS_Senha;
End;

//------------------------------------------------------------------------------
// Retorna o tipo de acesso
//------------------------------------------------------------------------------

Function Funcao.GetAcesso: String;
begin
   GetAcesso:= VS_Acesso;
end;

//------------------------------------------------------------------------------
// Recebe o tipo de Acesso
//------------------------------------------------------------------------------

Procedure Funcao.SetAcesso(PS_Acesso: String);
begin
   VS_Acesso:= PS_Acesso;
End;

//------------------------------------------------------------------------------
// Retorna o Codigo do Usuario
//------------------------------------------------------------------------------

Function Funcao.GetCodUsuario: String;
begin
   GetCodUsuario:= VS_CodUsuario;
end;

//------------------------------------------------------------------------------
// Recebe o Codigo do Usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetCodUsuario (PS_CodUsuario: String);
begin
   VS_CodUsuario:= PS_CodUsuario;
End;

//------------------------------------------------------------------------------
// Recebe a o cargo
//------------------------------------------------------------------------------

Procedure Funcao.SetCargo (PS_Cargo: String);
begin
   VS_Cargo:= PS_Cargo;
End;

//------------------------------------------------------------------------------
// Recebe a identidade da pessoa
//------------------------------------------------------------------------------

Procedure Funcao.SetPessoa (PS_Identidade: String);
begin
   VS_Identidade:= PS_Identidade;
End;

//------------------------------------------------------------------------------
// Recebe o identificador de PostoGraduacao
//------------------------------------------------------------------------------

Procedure Funcao.SetPostoGraduacao (PS_PostoGraduacao: String);
begin
   VS_PostoGraduacao:= PS_PostoGraduacao;
End;

//------------------------------------------------------------------------------
// Recebe o nome do Usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetUsuario(VS_SetUsuario: String);
begin
   VS_Usuario:= VS_SetUsuario;
End;

//------------------------------------------------------------------------------
// Recebe o privilegio do usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetPrivilegio (VS_Set_Privelegio: String);
begin
   VS_Privilegio:= VS_Set_Privelegio
End;

//------------------------------------------------------------------------------
// Recebe se retorna com o cargo
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaCargo (PB_RetCargo: Boolean);
begin
   VB_RetCargo:= PB_RetCargo;
End;

//------------------------------------------------------------------------------
// Recebe se retorna com a identidade da pessoa
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaPessoa (PB_RetIdentidade: Boolean);
begin
   VB_RetIdentidade:= PB_RetIdentidade;
End;

//-----------------------------------------------------------------------------
//
// Tratamento de retornos
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Retorna Cargo
//------------------------------------------------------------------------------

Function Funcao.GetCargo: String;
begin
   GetCargo:= VS_Cargo;
end;

//------------------------------------------------------------------------------
// Retorna Identidade da pessoa
//------------------------------------------------------------------------------

Function Funcao.GetPessoa: String;
begin
   GetPessoa:= VS_Identidade;
end;

//------------------------------------------------------------------------------
// Retorna Usuario
//------------------------------------------------------------------------------

Function Funcao.GetUsuario: String;
begin
   GetUsuario:= VS_Usuario;
end;

//------------------------------------------------------------------------------
// Retorna Privilegio
//------------------------------------------------------------------------------

Function Funcao.GetPrivilegio: String;
begin
   GetPrivilegio:= VS_Privilegio;
end;

//------------------------------------------------------------------------------
// Retorna se a unidade devera ser retornada
//------------------------------------------------------------------------------

Function Funcao.GetRetornaUnidade: Boolean;
begin
   GetRetornaUnidade:= VB_RetUnidade;
end;

//------------------------------------------------------------------------------
// Retorna se o cargo devera ser retornada
//------------------------------------------------------------------------------

Function Funcao.GetRetornaCargo: Boolean;
begin
   GetRetornaCargo:= VB_RetCargo
end;

//------------------------------------------------------------------------------
// Retorna se o Identidade devera ser retornada
//------------------------------------------------------------------------------

Function Funcao.GetRetornaPessoa: Boolean;
begin
   GetRetornaPessoa:= VB_Retidentidade;
end;

//------------------------------------------------------------------------------
//
// Funcoes basicas
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Faz a criptografar de uma variavel fornecida
//------------------------------------------------------------------------------

Function Funcao.criptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      if ((copy(Armazena, Cont, 1) = 'V') or (copy(Armazena, Cont, 1) = 'W')  or
          (copy(Armazena, Cont, 1) = 'X') or (copy(Armazena, Cont, 1) = 'Y')  or
          (copy(Armazena, Cont, 1) = 'Z')) then
      begin
         Resultado:= Resultado + copy(Armazena, Cont, 1);
      end
      else
      begin
         for CodIndex := 1 to 2 do
         begin
            Temp:= Succ(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   criptografar:= Resultado;
End;

//------------------------------------------------------------------------------
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

Function Funcao.descriptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      if ((copy(Armazena, Cont, 1) = 'V') or (copy(Armazena, Cont, 1) = 'W')  or
          (copy(Armazena, Cont, 1) = 'X') or (copy(Armazena, Cont, 1) = 'Y')  or
          (copy(Armazena, Cont, 1) = 'Z')) then
      begin
         Resultado:= Resultado + copy(Armazena, Cont, 1);
      end
      else
      begin
         for CodIndex := 1 to 2 do
         begin
            Temp:= Pred(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   descriptografar:= Resultado;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure Funcao.Windows;
begin
   if Application.MessageBox('Deseja sair do sistema ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
       Application.Terminate;
end;

//------------------------------------------------------------------------------
// Descricao: Verifica se o numero da ficha eh valida e faz tratamento colocando
//            zeros.
// Data     :
//
// Atualizado em: 12/04/2005
// Descricao    : Alterado mensagen.
//------------------------------------------------------------------------------

Function Funcao.NFicha(VS_NFicha: String ) : String;
var
   VS_Ret: String;
   i: integer;
begin
  if length(VS_NFicha) = 6 then
  begin
     VS_Ret:= VS_NFicha;
  end
  else
  begin
     VS_Ret:= '';

     if trim(VS_NFicha) <> '' then
     begin
        for i := 1 to length(VS_NFicha) do
        begin
           if Copy(VS_NFicha,i,1) <> ' ' then
              VS_Ret:= VS_Ret+Copy(VS_NFicha,i,1);
        end;
        VS_Ret:= FormatFloat('000000',StrToInt(VS_Ret));
     end
     else
     begin
        MessageDlg('O número da ficha não pode ser branco...',mtError, [mbOk],0);
     end;
  end;
  NFicha:= VS_Ret;
end;

//------------------------------------------------------------------------------
// Descricao: Verifica se o usuario consta na lista de usuarios
// Data     :
//
// Atualizado em: 12/04/2005
// Descricao    : Auterado as mensagens.
//------------------------------------------------------------------------------

Function Funcao.Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
Var
   VS_Comando: String;
   Status: Boolean;
begin
   Status:= False;
   if Trim(VS_Usuario) = '' then
      MessageDlg('Para logar o sistema o nome do usuário não pode ser branco...',mtError, [mbOk],0)
   else
   begin
      if Trim(VS_Senha) = '' then
         MessageDlg('Para logar o sistema a senha do usuário não pode ser branco...',mtError, [mbOk],0)
      else
      begin
         if QtdRegistro('Select Count(1) Qtd from Usuario where Nome = '+#39+VS_Usuario+#39+' and senha = '+#39+Criptografar(VS_Senha)+#39) = 0 then
             MessageDlg('Verifique se o nome ou a senha esta errada '+#13+#13+'O usuário fornecido não encontra-se na lista...',mtError, [mbOk],0)
         else
         begin
            Status:= True;
            VS_Comando:= 'Select * from Usuario where Nome = '+#39+VS_Usuario+#39+' and senha = '+#39+Criptografar(VS_Senha)+#39;

            DM.Query_Usuario.Close;
            DM.Query_Usuario.Sql.Clear;
            DM.Query_Usuario.Sql.Add(VS_Comando);
            DM.Query_Usuario.Open;
         end;
      end;
   end;

   Busca_Usuario:= Status;
end;

//------------------------------------------------------------------------------
// Descricao: Troca o valor da Variavel VS_De para o conteudo da variavel VS_Para
// Data     : 15/03/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   For VI_Cont:= 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = VS_De then
          VS_Retorno:= VS_Retorno+VS_Para
      else
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1);
   end;
   DePara:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de retornar o valor antes da variavel
//            fornecida na variavel VS_DE
// Data     : 26/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   VI_Cont:= 1;
   While VI_Cont <= Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) <> VS_De then
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1)
      else
          VI_Cont:= VI_Cont+Length(VS_Valor);
      VI_Cont:= VI_Cont + 1;
   end;
   ExtraiAntesDe:= trim(VS_Retorno);
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de gerar numeros aleatorio
// Data     :
//
// Atualizado em: 19/09/2005
// Descricao    : Criacao da rotina
//------------------------------------------------------------------------------

Function Funcao.Randomico(VI_Limite: integer): String;
var
   Resultado: integer;
begin
   Resultado:= 0;

   While Resultado = 0 do
      Resultado:= Random(VI_Limite);

   Randomico:= formatfloat('000',Resultado);
end;

//------------------------------------------------------------------------------
// Descricao: tratar dos botoes principais
// Data     :
//
// Atualizado em: 20/09/2005
//------------------------------------------------------------------------------

Procedure Funcao.Botoes_Principais(Status: Boolean; ToolButton_Localizar: TToolButton;
                   ToolButton_Relatorio: TToolButton; ToolButton_Retornar: TToolButton;
                   ToolButton_Windows: TToolButton;ToolButton_Sobre: TToolButton);
begin
   ToolButton_Localizar.Enabled:= Status;
   ToolButton_Relatorio.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;
   ToolButton_Sobre.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Procedure tratar dos botoes quando nao possui informacao
//------------------------------------------------------------------------------

Procedure Funcao.BotoesNovo01(Status: Boolean; Novo, Editar, Excluir, Gravar, Cancelar: TJvTransparentButton);
begin
   if Funcoes.GetAcesso = 'A' then
      Novo.Enabled:= Status
   else
      if DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'S' then
         Novo.Enabled:= Status
      else
         Novo.Enabled:= False;

   Editar.Enabled:= False;
   Excluir.Enabled:= False;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Procedure tratar dos botoes Basicos padrao Novo
//------------------------------------------------------------------------------

Procedure Funcao.BotoesBasico(Status: Boolean; Novo, Editar, Excluir, Gravar, Cancelar: TJvTransparentButton);
begin
   if Funcoes.GetAcesso = 'A' then
   begin
      Novo.Enabled:= Status;
      Editar.Enabled:= Status;
      Excluir.Enabled:= Status;
   end
   else
   begin
      if DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'S' then
         Novo.Enabled:= Status
      else
         Novo.Enabled:= False;

      if DM.Query_PerfilAcesso.FieldByName('Alterar').AsString = 'S' then
         Editar.Enabled:= Status
      else
         Editar.Enabled:= False;

      if DM.Query_PerfilAcesso.FieldByName('Excluir').AsString = 'S' then
         Excluir.Enabled:= Status
      else
         Excluir.Enabled:= False;
   end;

   if Status = True then
      Status:= False
   else
      Status:= True;

   Gravar.Enabled:= Status;
   Cancelar.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Descricao: Trata do perfiu de acesso ao sistema
// Data     :
//
// Atualizado em: 17/04/2006
//------------------------------------------------------------------------------

Procedure Funcao.SetaPerfilAcesso;
begin
   AModulo[1]:= 'Gerência - Cabeçalhos de Documentos';
   AModulo[2]:= 'Gerência - Montagem Diploma';
   AModulo[3]:= 'Gerência - Cadastro das Seções';
   AModulo[4]:= 'Gerência - Cadastro Sala Aula';

   AModulo[5]:= 'Instrutor - Consulta de Instrutores por Curso';
   AModulo[6]:= 'Instrutor - Consulta Instrutor por Matéria';
   AModulo[7]:= 'Instrutor - Quantidade de Instrutores por Curso';

   AModulo[8]:= 'Tabelas Auxiliares - Posto/Graduação';
   AModulo[9]:= 'Tabelas Auxiliares - Quadro/Especialidade';
   AModulo[10]:= 'Tabelas Auxiliares - Resp. pela assinatura dos relatórios';
   AModulo[11]:= 'Tabelas Auxiliares - Unidades';
   AModulo[12]:= 'Tabelas Auxiliares - Paises';
   AModulo[13]:= 'Tabelas Auxiliares - Desligamento';

   AModulo[14]:= 'Consultas - Consulta de Alunos e Instrutores';
   AModulo[15]:= 'Consultas - Consulta Cursos Finalizados';
   AModulo[16]:= 'Consultas - Relatório INFRAERO';
   AModulo[17]:= 'Consultas - Historico (ASEA/APAC)';
   AModulo[18]:= 'Consultas - Estatistica Diárias';

   AModulo[19]:= 'Ferramentas - Editor de Texto';
   AModulo[20]:= 'Ferramentas - Avaliação';
   AModulo[21]:= 'Ferramentas - PTS - Base';
   AModulo[22]:= 'Ferramentas - Configuração do Sistema';
   AModulo[23]:= 'Ferramentas - Carga PAELS';

   AModulo[24]:= 'Fichas Avaliação - Indicadores de Qualidade EAVC';
   AModulo[25]:= 'Fichas Avaliação - Consulta das Fichas que estão para ser Avaliada';
   AModulo[26]:= 'Fichas Avaliação - Resultados Avaliação';
   AModulo[27]:= 'Fichas Avaliação - Cadastro Avaliadores de Curso';
   AModulo[28]:= 'Fichas Avaliação - Cadastro das Fichas de Avaliação';
   AModulo[29]:= 'Fichas Avaliação - Cadastro das Fichas de Avaliação Coordenador';

   AModulo[30]:= 'Menu Principal - Cadastro Curso';
   AModulo[31]:= 'Menu Principal - Corpo Docente';
   AModulo[32]:= 'Menu Principal - Cadastro Turma/Aluno/Instrutor';
   AModulo[33]:= 'Menu Principal - Cadastro Disciplina';
   AModulo[34]:= 'Menu Principal - Quadro Global de Avaliação';
   AModulo[35]:= 'Menu Principal - Cadastro Item Prova';
   AModulo[36]:= 'Menu Principal - Montar Prova';
   AModulo[37]:= 'Menu Principal - Correção da Prova';
   AModulo[38]:= 'Menu Principal - PTS';
   AModulo[39]:= 'Menu Principal - Habilitar Ficha de Avaliação';
   AModulo[40]:= 'Menu Principal - Consulta de Cursos Executados';
   AModulo[41]:= 'Menu Principal - Grau Final da Turma';
   AModulo[42]:= 'Menu Principal - Consulta de Alunos e Instrutores';
   AModulo[43]:= 'Menu Principal - Critica Espontanea';
   AModulo[44]:= 'Menu Principal - Aluno com Notas Abaixo da Média';
   AModulo[45]:= 'Menu Principal - Providência';
   AModulo[46]:= 'Menu Principal - Consulta Avaliação Pós Curso';

   AModulo[47]:= 'Extras - Relação de Cursos Planejados';
   AModulo[48]:= 'Extras - Relação de Cursos Andamento';
   AModulo[49]:= 'Extras - Relação de Cursos Executados';
   AModulo[50]:= 'Extras - Consulta de Ficha de Avaliação de Curso';
   AModulo[51]:= 'Extras - Acompanhamento das Providências';
   AModulo[52]:= 'Extras - Acompanhamento da Avaliação Pós Curso';
end;

//------------------------------------------------------------------------------
// Descricao: Trata do perfiu de acesso ao sistema
// Data     :
//
// Atualizado em: 17/04/2006
//------------------------------------------------------------------------------

Procedure Funcao.GravaPerfilAcesso(PS_IdCodigo: String; PS_Acesso: String);
var
   VS_Acesso: String;
   i: integer;
begin

   VS_Acesso:= 'N';

   if PS_Acesso = 'Livre' then
      VS_Acesso:= 'S';

   for i:= 1 to 52 do
   begin
      Funcoes.ExecusaoQuery( 'Insert into PerfilAcesso (IdCodigo, Modulo, PossuiAcesso, Inserir, Alterar, Excluir, GravaAcesso) '+
                              ' Values ('+#39+PS_IdCodigo+#39+', '+#39+AModulo[i]+#39+', '+#39+VS_Acesso+#39+', '+#39+VS_Acesso+#39+', '+#39+VS_Acesso+#39+', '+#39+VS_Acesso+#39+', '+#39+'N'+#39+')'
                           );
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de acessar o perfil de acesso do usuario
//
// Atualizado em: 17/04/2006
//------------------------------------------------------------------------------

Procedure Funcao.PerfilAcesso(PS_IdCodigo: String; PS_Modulo: String);
begin
   DM.Query_PerfilAcesso.Close;
   DM.Query_PerfilAcesso.SQL.Clear;
   DM.Query_PerfilAcesso.SQL.Add('Select * from PerfilAcesso Where IdCodigo = '+#39+PS_IdCodigo+#39+' and Modulo like '+#39+PS_Modulo+'%'+#39);
   DM.Query_PerfilAcesso.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Grava o acesso realizado ao sistema
//
// Atualizado em: 17/04/2006
//------------------------------------------------------------------------------

Procedure Funcao.GravaAcesso(PS_Modulo: String; PS_Atividade: String);
begin
   Funcoes.ExecusaoQuery( 'Insert into Acesso (IdCodigo, IdModulo, Data, Hora, Atividade) '+
                          ' Values ('+#39+GetCodUsuario+#39+', '+#39+PS_Modulo+#39+', '+#39+Funcoes_TrataData.TratarData(DateToStr(Date))+#39+', '+#39+Funcoes_TrataData.HoraAtual+#39+', '+#39+PS_Atividade+#39+')'
                         );
end;

//------------------------------------------------------------------------------
// Descricao: Retorna a Cidade e a Data atual
//
// Data     : 15/12/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.RetornaCidade(Data: String): String;
var
   Ano, Mes, Dia : word;
   Retorno: String;
begin
   dm.IBTable_Configuracao.Open;
   DecodeDate (StrToDate(Data), Ano, Mes, Dia);
   Result:= IntToStr(Ano);

   Retorno:= Trim(dm.IBTable_Configuracao.FieldByName('Cidade').AsString)+', '+IntToStr(Dia)+' de '+Funcoes_TrataData.Mes_Extenso(IntToStr(Mes),1)+' de '+IntToStr(Ano)+'.';
   RetornaCidade:= Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Funcao Recebe o Numero e Faz o tratamento inicial
//
// Data     : 15/12/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.Extenso(VS_Valor: String; VC_Tipo: Char): String;
var
   VS_Aux, VS_Numero1, VS_Posicao1, VS_Posicao2, VS_Posicao3, VS_Posicao4: String;
   VS_Extenso: string;

   Code, VI_AUX :  INTEGER;
   VI_Virgula, VI_Cont :  INTEGER;

   VF_Numero: Double;
begin
   VS_nu[1]:='UM ';
   VS_nu[2]:='DOIS ';
   VS_nu[3]:='TRÊS ';
   VS_nu[4]:='QUATRO ';
   VS_nu[5]:='CINCO ';
   VS_nu[6]:='SEIS ';
   VS_nu[7]:='SETE ';
   VS_nu[8]:='OITO ';
   VS_nu[9]:='NOVE ';

   VS_nd[1]:='DEZ ';
   VS_nd[2]:='VINTE ';
   VS_nd[3]:='TRINTA ';
   VS_nd[4]:='QUARENTA ';
   VS_nd[5]:='CINQUENTA ';
   VS_nd[6]:='SESSENTA ';
   VS_nd[7]:='SETENTA ';
   VS_nd[8]:='OITENTA ';
   VS_nd[9]:='NOVENTA ';

   VS_ndb[1]:='DEZ ';
   VS_ndb[2]:='ONZE ';
   VS_ndb[3]:='DOZE ';
   VS_ndb[4]:='TREZE ';
   VS_ndb[5]:='QUATORZE ';
   VS_ndb[6]:='QUINZE ';
   VS_ndb[7]:='DEZESSEIS ';
   VS_ndb[8]:='DEZESSETE ';
   VS_ndb[9]:='DEZOITO ';
   VS_ndb[10]:='DEZENOVE ';

   VS_nc[1]:='CENTO ';
   VS_nc[2]:='DUZENTOS ';
   VS_nc[3]:='TREZENTOS ';
   VS_nc[4]:='QUATROCENTOS ';
   VS_nc[5]:='QUINHENTOS ';
   VS_nc[6]:='SEISCENTOS ';
   VS_nc[7]:='SETECENTOS ';
   VS_nc[8]:='OITOCENTOS ';
   VS_nc[9]:='NOVECENTOS ';

   VS_Extenso:= '';

   VS_Valor:= Trim(VS_Valor);
   VF_Numero:= StrToFloat(VS_Valor);
   VS_Numero1 := FormatFloat ('0000000000.000',VF_NUMERO);
   VS_Posicao1:=Copy(VS_Numero1,2,3);
   VS_Posicao2:=Copy(VS_Numero1,5,3);
   VS_Posicao3:=Copy(VS_Numero1,8,3);

   VS_Aux:=FloatToStr(VF_Numero);
   Val(VS_AUX,VI_Aux,Code);
//   VS_Posicao4:=FormatFloat('000',(VF_Numero-VF_Aux)*100);

   VS_Posicao4:= '';
   VI_Virgula:= 0;
   For VI_Cont := 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = ',' then
         VI_Virgula:= 1
      else
         if VI_Virgula = 1 then
            VS_Posicao4:= VS_Posicao4+Copy(VS_Valor,VI_Cont,1);
   end;

   //-------------------- Tratamento para casa do Milhão ---------------------//

   VS_Extenso:= VS_Extenso+Converte(VS_Posicao1,1, VF_NUMERO, VI_Aux, VC_Tipo);

   //---------------------- Tratamento para casa do Mil ----------------------//

   If (StrToInt(VS_Posicao2) <> 0) then
   begin
      VS_Extenso:= VS_Extenso+Converte(VS_Posicao2,2, VF_NUMERO, VI_Aux, VC_Tipo);

      VS_Extenso:= VS_Extenso+' MIL ';

      If ((Copy(VS_Posicao3,2,2) = '00') and (VI_aux <> 100) and (VI_AUX <> 1000) and (VI_AUX <> 10000)) Then
          VS_Extenso:= VS_Extenso+' E ';
   end;

   //--------------------- Tratamento da Casa da Centena ---------------------//

   VS_Extenso:= VS_Extenso+Converte(VS_Posicao3,3, VF_NUMERO, VI_Aux, VC_Tipo);

   If UpCase(VC_Tipo) = 'D' then
      If ((VS_Posicao3 = '000') and ((StrToInt(VS_Posicao1)+StrToInt(VS_Posicao2)) <> 0)
       or (StrToInt(VS_Posicao2) = 1)) Then
         If ((VI_aux = 1000) or (VI_aux = 10000) or (VI_aux = 100000)) Then
             VS_Extenso:= VS_Extenso+' REAIS';

   //---------------------- Tratamento da Casa da Dezena ---------------------//

   if  VS_Posicao4 <> '' then
      VS_Extenso:= VS_Extenso+Converte(VS_Posicao4,4, VF_NUMERO, VI_Aux, VC_Tipo);

   //-------------- Tratamento do Valor quando o valor for = 0 ---------------//

   if VS_Extenso = '' then
      VS_Extenso:= 'ZERO ';

   Result:= VS_Extenso;
end;

//------------------------------------------------------------------------------
// Descricao:  Funcao de transformar numeros em extenso
//
// Data     : 15/12/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.Converte(VS_Valor: String; VI_Grandeza: integer;
                                 VF_Numero: Double; VI_Numero: integer; VC_Tipo: Char): String;
var
   VS_Retorno, vs_x1, vs_x2, vs_x3, vs_x4: String;
   VI_N1, VI_N2,VI_N3,VI_N4: Integer;
   VB_Centena: Boolean;
begin
   VS_Retorno:= '';

   If VS_Valor <> '000' then
   begin
      If UpCase(VC_Tipo) = 'D' then
      VS_Valor:= IntToStr(StrToInt(VS_Valor));

      if Length(VS_Valor) = 3 then
      begin
         VS_X1 := Copy( VS_Valor,1,1);
         VS_X2 := Copy( VS_Valor,2,1);
         VS_X3 := Copy( VS_Valor,3,1);
         VS_X4 := Copy( VS_Valor,2,2);
      end
      else
      begin
         if Length(VS_Valor) = 2 then
         begin
            VS_X1 := '';
            VS_X2 := Copy( VS_Valor,1,1);
            VS_X3 := Copy( VS_Valor,2,1);
            VS_X4 := Copy( VS_Valor,1,2);
         end
         else
         begin
            VS_X1 := '';
            VS_X2 := '';
            VS_X3 := Copy( VS_Valor,1,1);
            VS_X4 := Copy( VS_Valor,1,1);
         end;
      end;

      if VS_X1 = '' then
         VI_N1 := 0
      else
         VI_N1 := StrToInt(VS_X1);

      if VS_X2 = '' then
         VI_N2 := 0
      else
         VI_N2 := StrToInt(VS_X2);

      if VS_X3 = '' then
         VI_N3 := 0
      else
         VI_N3 := StrToInt(VS_X3);

      if VS_X4 = '' then
         VI_N4 := 0
      else
         VI_N4 := StrToInt(VS_X4);

      //--------------- Tratamento quando houver casa decimal ----------------//

      If ((VI_Grandeza = 4)  and (VI_Numero <> 0) ) then
         if UpCase(VC_Tipo) = 'D' then
            VS_Retorno := VS_Retorno + ' E '
         else
            VS_Retorno := VS_Retorno + ' VIRGULA ';

      //------------------------- Tratamento da Centena ----------------------//
      VB_Centena:= False;
      if (Length(VS_Valor) = 3) then
      begin
         If ((VI_Grandeza = 4)  and (VS_X1 = '0')) then                 //Tratamento dos Zeros quando existir
            VS_Retorno:= VS_Retorno + 'ZERO '
         else
         begin
            VB_Centena:= True;
            If VS_X1 <> '0' then                        //CENTENA
               If ((VS_X4 = '00') and (VS_X1='1'))  then
                  VS_Retorno:= VS_Retorno + 'CEM'
               Else
                  VS_Retorno:= VS_Retorno + VS_nc[VI_N1];
         end;
      end;

      //---------- Tratamento quendo o Valor estiver entre 10 e 19 ----------//

      If ((VI_Grandeza = 4)  and (VS_X2 = '0')) then                 //Tratamento dos Zeros quando existir
      begin
          if VB_Centena = False then
             VS_Retorno:= VS_Retorno + 'ZERO ';
      end
      else
         If ((VI_N4 >= 10) and (VI_N4 <= 19)) then     //DEZENA DE DEZENOVE
            If ((VI_Grandeza = 4)  and (VS_X1 <> ''))  then
            begin
               if ((VS_Retorno = ' VIRGULA ') or (VS_Retorno = ' VIRGULA ZERO ')) then
                  VS_Retorno := VS_Retorno + VS_NDB[VI_N4-9]
               else
                  VS_Retorno := VS_Retorno + ' E ' + VS_NDB[VI_N4-9];
            end
            Else
               VS_Retorno := VS_Retorno + VS_NDB[VI_N4-9];

      //----------------- Tratamento de Valor apartir de 20 ------------------//

      If VI_N2 >= 2  then
         If VS_X1 <> '0'  then
        begin
            if ((VS_Retorno = ' VIRGULA ') or (VS_Retorno = ' VIRGULA ZERO ')) then
               VS_Retorno:= VS_Retorno+VS_ND[VI_N2]
            else
               VS_Retorno:= VS_Retorno +' E '+VS_ND[VI_N2];
         end
         Else
            VS_Retorno:= VS_Retorno + VS_ND[VI_N2];

      If (VS_X3 <> '') then
      begin
         If (VI_N4 <= 10) or (VI_N4 > 19) then
         begin
            If ((VS_X1 <> '0') OR (VS_X2 <> '0')) then
            begin
               if Length(VS_Valor) > 2 then
               begin
                  If (VS_X3 <> '0') then
                     VS_Retorno := VS_Retorno + ' E ' + VS_NU[VI_N3];
               end
               else
               begin
                  if VI_N3 <> 0 then
                  begin
                     if ((VS_Retorno = ' VIRGULA ') or (VS_Retorno = ' VIRGULA ZERO ')) then
                         VS_Retorno:= VS_Retorno+VS_NU[VI_N3]
                     else
                         VS_Retorno:= VS_Retorno +' E '+VS_NU[VI_N3]
                  end
                  else
                    if Length(VS_Valor) < 2 then
                       VS_Retorno:= VS_Retorno + 'ZERO ';
               end;
            end
            Else
            begin
               VS_Retorno := VS_Retorno + VS_NU[VI_N3];
            end;
         end;
      end;

      //----------------------- Tratamento da Grandeza -----------------------//

      case VI_Grandeza of
         1: begin         // Milhao
              If StrToInt(VS_Valor) = 1 then
                 VS_Retorno:= VS_Retorno + 'MILHÃO '
              else
                 VS_Retorno:= VS_Retorno + 'MILHÕES ';
            end;

         2: begin         // Mil
              If StrToInt(VS_Valor) = 0 then
                 VS_Retorno:= VS_Retorno+ 'MIL ';
            end;

         3: begin         // Centena
              if UpCase(VC_Tipo) = 'D' then
                 If VI_Numero = 1 then
                    VS_Retorno:= VS_Retorno + 'REAL '
                 else
                    VS_Retorno:= VS_Retorno + 'REAIS ';
            end;

         4: begin           // Decina Moeda
              if UpCase(VC_Tipo) = 'D' then
                 If StrToInt(VS_Valor) = 1 then
                    VS_Retorno := VS_Retorno + 'CENTAVO'
                 else
                    VS_Retorno := VS_Retorno + 'CENTAVOS';
            end;
      end;   // case VI_Grandeza of
   end;
   Converte:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel do texto
//------------------------------------------------------------------------------

procedure Funcao.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Form_Editor.Text1.FindText(Trocar, 0, Length(Form_Editor.Text1.Text), []);
  if Posicao >= 0 then
  begin
    Form_Editor.Text1.SelStart := Posicao;
    Form_Editor.Text1.SelLength := Length(Trocar);
    Form_Editor.Text1.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para tratar do arredondamento da nota não permitindo arre-
//            dondamento
// Data     : 27/05/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarNota(VR_Valor: Real) : Real;
var
   VS_Nota: String;
   VI_Tama: Integer;
begin
   VS_Nota := FormatFloat('0#.000',VR_Valor);

   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'ICEA' then   // Tratamento para extrair apenas 2 casas decimais isto ocorre somente no ICEA
   begin
      VI_Tama := length(VS_Nota);

      if ( VS_Nota = '10' ) then
          VS_Nota:=VS_Nota+',00'
      else
      begin
         if (VI_Tama = 1) then
             VS_Nota:=VS_Nota+',00' ;

         if (copy(VS_Nota,2,1)=',') then
             VS_Nota := copy(VS_Nota,1,4)
         else
             VS_Nota := copy(VS_Nota,1,5) ;
      end;
   end;

   TratarNota:= StrToFloat(VS_Nota);
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string até atingir o tamanho especificado
// Data     : 01/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Retorno + VS_Repl;
     VI_Tam:= VI_Tam + 1;
  end;
  ReplStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string a esquerda até atingir o tamanho especificado
// Data     : 23/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Repl+VS_Retorno;
     VI_Tam:= VI_Tam + 1;
  end;
  LReplStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Centraliza uma string até atingir o tamanho especificado
// Data     : 02/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.CentraStr(VS_Variavel: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Posicao, VI_Tam: Integer;
begin
  VI_Posicao:= 1;
  VS_Retorno:= Trim(VS_Variavel);
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     if VI_Posicao = 0 then
     begin
        VI_Posicao:= 1;
        VS_Retorno := ' '+VS_Retorno;
     end
     else
     begin
        VI_Posicao:= 0;
        VS_Retorno := VS_Retorno+' ';
     end;
     VI_tam:= Length(VS_Retorno);
  end;
  CentraStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para retornar data tratada para Firebird
// Data     : 26/04/2010
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarData(VS_Data: String) : string;
var
  d,m,y : word;
begin
   DecodeDate(StrToDate(VS_Data),y,m,d);

   VS_Data:= FormatFloat('00', d)+'.'+FormatFloat('00', m)+'.'+FormatFloat('0000', y);
   TratarData:= VS_Data+' 00:00';
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para ajustar os caracteres acentuados para maiscula
// Data     : 16/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.AjustarMaiscula(VS_Entrada : String) : string;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;

begin
   VI_tam:= Length(VS_Entrada);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(VS_Entrada,i,1);
      if VS_letra = 'á' then
         VS_letra:= 'Á'
      else
         if VS_letra = 'à' then
            VS_letra:= 'À'
         else
           if VS_letra = 'ã' then
              VS_letra:= 'Ã'
           else
              if VS_letra = 'â' then
                  VS_letra:= 'Â'
              else
      if VS_letra = 'é' then
         VS_letra:= 'É'
      else
         if VS_letra = 'è' then
            VS_letra:= 'È'
         else
            if VS_letra = 'ê' then
               VS_letra:= 'Ê'
            else
      if VS_letra = 'í' then
         VS_letra:= 'Í'
      else
         if VS_letra = 'ì' then
            VS_letra:= 'Ì'
         else
           if VS_letra = 'î' then
              VS_letra:= 'Î'
           else
      if VS_letra = 'ó' then
         VS_letra:= 'Ó'
      else
         if VS_letra = 'ò' then
            VS_letra:= 'Ò'
         else
           if VS_letra = 'õ' then
              VS_letra:= 'Õ'
           else
              if VS_letra = 'ô' then
                  VS_letra:= 'Ô'
              else
      if VS_letra = 'ú' then
         VS_letra:= 'Ú'
      else
         if VS_letra = 'ù' then
            VS_letra:= 'Ù'
         else
           if VS_letra = 'û' then
              VS_letra:= 'Û'
           else
      if VS_letra = 'ç' then
         VS_letra:= 'Ç'
      else
         VS_Letra:= UpperCase(VS_Letra);      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  Result := VS_Retorno;
end;


//------------------------------------------------------------------------------
// Descricao: Funcao para ajustar os caracteres acentuados para maiscula
// Data     : 16/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.AjustarMinuscula(VS_Entrada : String) : string;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;

begin
   VI_tam:= Length(VS_Entrada);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(VS_Entrada,i,1);
      if VS_letra = 'Á' then
         VS_letra:= 'á'
      else
         if VS_letra =  'À' then
            VS_letra:= 'à'
         else
           if VS_letra = 'Ã' then
              VS_letra:= 'ã'
           else
              if VS_letra = 'Â' then
                  VS_letra:= 'â'
              else
      if VS_letra = 'É' then
         VS_letra:= 'é'
      else
         if VS_letra = 'È' then
            VS_letra:= 'è'
         else
            if VS_letra = 'Ê' then
               VS_letra:= 'ê'
            else
      if VS_letra = 'Í' then
         VS_letra:= 'í'
      else
         if VS_letra = 'Ì' then
            VS_letra:= 'ì'
         else
           if VS_letra = 'Î' then
              VS_letra:= 'î'
           else
      if VS_letra = 'Ó' then
         VS_letra:= 'ó'
      else
         if VS_letra = 'Ò' then
            VS_letra:= 'ò'
         else
           if VS_letra = 'Õ' then
              VS_letra:= 'õ'
           else
              if VS_letra = 'Ô' then
                  VS_letra:= 'ô'
              else
      if VS_letra = 'Ú' then
         VS_letra:= 'ú'
      else
         if VS_letra = 'Ù' then
            VS_letra:= 'ù'
         else
           if VS_letra = 'Û' then
              VS_letra:= 'û'
           else
      if VS_letra = 'Ç' then
         VS_letra:= 'ç'
      else
         VS_Letra:= LowerCase(VS_Letra);      VS_Retorno:= VS_Retorno+VS_Letra;

      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  Result := VS_Retorno;
end;

//------------------------------------------------------------------------------
//
// Tratamentos com Query
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Descricao: Substituir o comando RecordCount
// Data     :
//
// Atualizado em: 23/05/2005
// Descricao    : Criando
//------------------------------------------------------------------------------

Function Funcao.QtdRegistro(VS_Comando: String): Integer;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   Result:= DM.IBQuery_Executa.FieldByName('Qtd').AsInteger;
end;

//------------------------------------------------------------------------------
// Descricao: Atualiza Query
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AtualizaQuery(Query_Atualiza: TIBQuery);
var
   bmLocal : TBookmark;
   VB_Atualiza: Boolean;
begin
   if Query_Atualiza.Recordcount > 0 then
   begin
      bmLocal:= Query_Atualiza.GetBookMark;
      VB_Atualiza:= True;
   end
   else
   begin
      VB_Atualiza:= False;
   end;

   Query_Atualiza.Close;
   Query_Atualiza.open;
   if VB_Atualiza = True then
   begin
      Query_Atualiza.GotoBookMark(bmLocal);
      Query_Atualiza.FreeBookMark(bmLocal);
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Retorna o maior valor
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add('Select Max('+VS_Campo+') Maior from '+VS_Tabela);
   DM.IBQuery_Executa.Open;

   MaiorCodigo:= DM.IBQuery_Executa.FieldByName('Maior').AsInteger+1;
end;

//------------------------------------------------------------------------------
// Descricao: Retorna o maior valor que atende a restricao
// Data     : 18/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigoComRestricao(VS_Campo: String; VS_Restricao: String; VS_Tabela: String): Integer;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add('Select Max('+VS_Campo+') Maior from '+VS_Tabela+' where '+VS_Restricao);
   DM.IBQuery_Executa.Open;

   MaiorCodigoComRestricao:= DM.IBQuery_Executa.FieldByName('Maior').AsInteger+1;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar a query
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaQuery(IBQuery_Executa: TIBQuery; PS_Comando: String);
begin
   IBQuery_Executa.Close;
   IBQuery_Executa.SQL.Clear;
   IBQuery_Executa.SQL.Add(PS_Comando);
   IBQuery_Executa.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de Fazer ExecSql na Query
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecusaoQuery(VS_Comando: String);
begin
   DM.IBQuery_ExecSql.Close;
   DM.IBQuery_ExecSql.Sql.Clear;
   DM.IBQuery_ExecSql.Sql.Add(VS_Comando);
   DM.IBQuery_ExecSql.ExecSql;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Descricao: OpenQuery
//
// Atualizado em: 25/01/2006
//------------------------------------------------------------------------------

Procedure Funcao.OpenQuery(VS_Comando: String);
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.Sql.Clear;
   DM.IBQuery_Executa.Sql.Add(VS_Comando);
   DM.IBQuery_Executa.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Cadastrar a senha de acesso a Ficha de
//            Avaliacao de Curso.
// Data     : 13/07/2010
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.CadastrarAcessoFichaAvaliacao(P_IdCurso, P_IdTurma, P_Identidade, P_senha: String);
var
   VS_Comando: String;
begin
   p_senha:= formatFloat('000',StrToInt(P_Senha));

   VS_Comando:= 'Select count(1) As Qtd from FA_UsuarioTurma '+
                ' where IdCurso = '+P_IdCurso+
                ' and IdTurma = '+P_IdTurma+
                ' and Identidade =  '#39+P_Identidade+#39;

   if QtdRegistro(VS_Comando) = 0 then
   begin
      Funcoes.ExecusaoQuery('Insert into FA_USUARIOTURMA (IdCurso, IdTurma, Identidade, senha)'+
                            ' values ( '+P_IdCurso+', '+P_IdTurma+', '+#39+P_Identidade+#39+', '+#39+P_senha+#39+')'
                           );
   end
   else
   begin
      Funcoes.ExecusaoQuery('update FA_USUARIOTURMA set senha = '+#39+P_senha+#39+
                            ' where IdCurso = '+P_IdCurso+
                            ' and IdTurma = '+P_IdTurma+
                            ' and Identidade =  '#39+P_Identidade+#39
                           );
   end;

  Funcoes.ExecusaoQuery('update InstrutorTurma set senha = '+#39+P_senha+#39+', '+
                        '                          Atualizacao = NUll'+
                        ' where IdCurso = '+P_IdCurso+
                        ' and IdTurma = '+P_IdTurma+
                        ' and Identidade =  '#39+P_Identidade+#39
                       );
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

Function Funcao.MontaCurso(PS_Curso: String): Boolean;
var
   VB_Retorno: Boolean;
begin
   VB_Retorno:= False;
   if trim(PS_Curso) <> '' then
   begin
      //--- Monta query de selecao de curso

      Funcoes.ExecutaQuery(DM.IBQuery_Executa,'Select IdCurso, CodCurso, NomeCurso, Descricao, Grava_APC '+
                                              'From Curso '+
                                              ' where codcurso = '+#39+PS_Curso+#39
                           );

      if Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> '' then
      begin
         SetIdCurso(DM.IBQuery_Executa.FieldByName('IdCurso').AsString);
         VB_Retorno:= True;
     end
     else
     begin
        Showmessage('O Curso '+PS_Curso+' não esta Cadastrado...'+#13+#13+' Para cadastrar o Curso '+PS_Curso+', selecione o Botão < Cadastrar Curso >');         end;
   end;
    MontaCurso:= VB_retorno;
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

Function Funcao.ValidaCampo(PS_Campo, Msg: String): Boolean;
var
   Retorno: Boolean;
begin
   Retorno:= True;

   if trim(PS_Campo) = '' then
   begin
      ShowMessage(Msg+' não pode ser branco...');
      Retorno:= False;
   end;
   ValidaCampo:= Retorno
end;

//------------------------------------------------------------------------------
// Procedure tratar dos botoes Basicos
//------------------------------------------------------------------------------

Procedure Funcao.TratarBotoes(IBQuery: TIBQuery; Novo, Editar, Excluir: TJvTransparentButton);
var
   bmLocal : TBookmark;
   Status: Boolean;
begin
   bmLocal:= IBQuery.GetBookMark;

   IBQuery.Last;
   Status:= True;
   if IBQuery.Recordcount = 0 then
   begin
      Novo.Enabled:= True;
      Status:= False;
   end;

   if Funcoes.GetAcesso = 'A' then
   begin
      Novo.Enabled:= True;
      Editar.Enabled:= Status;
      Excluir.Enabled:= Status;
   end
   else
   begin
      if DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'S' then
         Novo.Enabled:= True
      else
         Novo.Enabled:= False;

      if DM.Query_PerfilAcesso.FieldByName('Alterar').AsString = 'S' then
         Editar.Enabled:= Status
      else
         Editar.Enabled:= False;

      if DM.Query_PerfilAcesso.FieldByName('Excluir').AsString = 'S' then
         Excluir.Enabled:= Status
      else
         Excluir.Enabled:= False;
   end;

   if IBQuery.Recordcount > 0 then
      IBQuery.GotoBookMark(bmLocal);
   IBQuery.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Funcao para Gerar Senha
//------------------------------------------------------------------------------

Function Funcao.GerarSenha(PI_Tamanho: Integer): String;
Const
   Variavel = '0ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
var
   i:integer;
   VS_retorno: String;
begin
   VS_retorno:= '';
   randomize;
   for i:= 1 to PI_Tamanho do
      VS_retorno:= VS_retorno+Copy(Variavel, Round(random(36)), 1);

   GerarSenha:= VS_retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de retornar se o numero e PAR.
// Data     : 29/04/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TestaParaPar(TestaInteiro : Integer) : boolean;
begin
  if (TestaInteiro div 2) = (TestaInteiro/2) then
     result := True
  else
     result := False;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Gerar Codigo de Acesso ao Instrutor de
//            acordo com a Turma.
// Data     : 29/04/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.GerarCodigoInstrutor(VS_IdCurso: String; S_IdTurma: String): String;
var
   VS_Comando, VS_CodInstrutor: String;
   VI_CodExiste: integer;
begin
   //------------- Chama função para gerar codigo do Instrutor  --------------//
   VI_CodExiste:=0;

   while VI_CodExiste = 0  do
   begin
      VS_CodInstrutor:=Funcoes.Randomico (999);
      VS_Comando:= 'Select count(1) Qtd '+
                   'from InstrutorTurma '+
                   'where IdCurso = '+VS_IdCurso+
                   ' and IdTurma = '+S_IdTurma+
                   ' and CodigoInstrutor = '+VS_CodInstrutor;
      if Funcoes.QtdRegistro(VS_Comando) = 0 then
         VI_CodExiste:= 1;

   end;
   GerarCodigoInstrutor:= VS_CodInstrutor;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Retornar a Descricao do Sistema de Acordo
//            Com a Instalacao do ICEA ou do CIAAR
// Data     : 10/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.CabecalhoForm(Form: TForm; PS_Cabecalho: String);
begin
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
      Form.Caption:= 'SISTEMA DE ACOMPANHAMENTO EDUCACIONAL --> '+PS_Cabecalho
   else
      Form.Caption:= 'Sistema de Gerenciamento do Ensino --> '+PS_Cabecalho;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Cor da DBGrid.
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.CorDBGrid(DBGrid: TDBGrid; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState );
begin
  DBGrid.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
  begin
     DBGrid.Canvas.Brush.Color := $006A2602;
     DBGrid.Canvas.Font.Color:= clWhite;
  end
  else
     DBGrid.Canvas.Font.Color:= clBlack;

   DBGrid.Canvas.FillRect(Rect);
   DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Devolver a Semana da data Fornecida.
// Data     : 06/06/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

function Funcao.SemanaAno ( Dataatual: String): integer;
var
   fltDiferenca: extended;
   datData, datDataInicial: TDate;
begin
   datData:= StrToDate(Dataatual);
   datDataInicial := strToDate('01/01/' + formatDateTime('yyyy',datData ));
   fltDiferenca := datData - datDataInicial;

   result := trunc ( fltDiferenca / 7 ) + 1;
end;


//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar o Usuario que realizou alguma
//            tarefa no Item de Prova (Inserir, Alterar, Excluir, Consultar)
// Data     : 28/06/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Historico_Item( NumItem, Atividade: String);
var
   VS_Id, VS_Data: String;
begin
   try
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select max(id) as Qtd from Item_Historico where NumItem = '+NumItem);

      VS_Data:= TratarData(DateToStr(Date));

      VS_Id:= IntToStr(DM.IBQuery_Executa.FieldByName('Qtd').AsInteger+1);

      Funcoes.ExecusaoQuery( 'Insert into Item_Historico (NumItem, Id, Atividade, Data, Usuario) '+
                              ' Values ('+NumItem+', '+VS_Id+', '+#39+Atividade+#39+', '+#39+VS_Data+#39+', '+#39+VS_Usuario+#39+')'
                           );
   except

   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a Funcao de Gravar a identificacao do ultimo item
//            inserido gravando junto o reposnavel e a data.
// Data     : 28/06/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.Ctrl_Item: Integer;
var
   VI_NumItem, VI_NumItem1: Integer;
   VS_Data: String;
begin
   try
      VI_NumItem:= Funcoes.MaiorCodigo('NumItem', 'Item_Ctrl');
      VI_NumItem1:= Funcoes.MaiorCodigo('NumItem', 'Item_Desc');

      if VI_NumItem < VI_NumItem1 then
         VI_NumItem:= VI_NumItem1;

      VS_Data:= TratarData(DateToStr(Date));
      Funcoes.ExecusaoQuery('Insert into Item_Ctrl (NumItem, Data, Usuario) '+
                            ' Values ('+IntToStr(VI_NumItem)+', '+#39+VS_Data+#39+', '+#39+VS_Usuario+#39+')');

      Ctrl_Item:= VI_NumItem;
   except

   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar qual usuario exclui o Item
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Grava_Exclusao_Item(VS_NumItem: String);
var
   VS_Data: String;
begin
   try
      Funcoes.ExecusaoQuery('Delete from Item_Excluido Where NumItem = '+VS_NumItem);

      VS_Data:= TratarData(DateToStr(Date));
      Funcoes.ExecusaoQuery( 'Insert into Item_Excluido (NumItem, Data, NomeUsuario) '+
                             ' Values ('+VS_NumItem+', '+#39+VS_Data+#39+', '+#39+VS_Usuario+#39+')'
                           );
   except

   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar o endereco
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Grava_Endereco(VS_Identidade, VS_Endereco, VS_Cidade, VS_UF, VS_Cep, VS_Pais: String);
begin
   try
      Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select Identidade From Cad_Endereco Where Identidade = '+#39+VS_Identidade+#39 );

      if DM.IBQuery_Executa.FieldByName('Identidade').AsString = '' then
         Funcoes.ExecusaoQuery('Insert into Cad_Endereco (Identidade, Endereco, Cidade, UF, Cep, Pais) '+
                               ' Values ('+#39+VS_Identidade+#39+', '+#39+VS_Endereco+#39+', '+#39+VS_Cidade+#39+', '+#39+VS_UF+#39+
                                         ', '+#39+VS_Cep+#39+', '+#39+VS_Pais+#39+')'
                              )
      else
         Funcoes.ExecusaoQuery('update Cad_Endereco set Endereco = '+#39+VS_Endereco+#39+', '+
                                                      ' Cidade = '+#39+VS_Cidade+#39+', '+
                                                      ' UF = '+#39+VS_UF+#39+', '+
                                                      ' Cep = '+#39+VS_Cep+#39+', '+
                                                      ' Pais = '+#39+VS_Pais+#39+
                               ' where Identidade =  '#39+VS_Identidade+#39
                              );
   except

   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar Avaliacao
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------


Procedure Funcao.Grava_Item_Prova(VS_IdCurso, VS_IdTurma, VS_NumItem, VS_CodMateria, VS_Disciplina, VS_Unidade, VS_SubUnidade, VS_Objetivo, VS_Quarentena, VS_Serie, VS_Status: String);
begin
   try
      Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select IdCurso From Item_Prova ' +
                                                ' Where IdCurso = '+VS_IdCurso+
                                                ' and   IdTurma = '+VS_IdTurma+
                                                ' and   NumItem = '+VS_NumItem
                          );

      if DM.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
         DM.IBTable_Item_Prova.Append
      else
         DM.IBTable_Item_Prova.Edit;

      DM.IBTable_Item_Prova.FieldByName('IDCURSO').AsString:= VS_IdCurso;
      DM.IBTable_Item_Prova.FieldByName('IDTURMA').AsString:= VS_IdTurma;
      DM.IBTable_Item_Prova.FieldByName('NUMITEM').AsString:= VS_NumItem;
      DM.IBTable_Item_Prova.FieldByName('CODMATERIA').AsString:= VS_CodMateria;
      DM.IBTable_Item_Prova.FieldByName('DISCIPLINA').AsString:= VS_Disciplina;
      DM.IBTable_Item_Prova.FieldByName('UNIDADE').AsString:= VS_Unidade;
      DM.IBTable_Item_Prova.FieldByName('SUBUNIDADE').AsString:= VS_SubUnidade;
      DM.IBTable_Item_Prova.FieldByName('OBJETIVO').AsString:= VS_Objetivo;
      DM.IBTable_Item_Prova.FieldByName('QUARENTENA').AsString:= VS_Quarentena;
      DM.IBTable_Item_Prova.FieldByName('SERIE').AsString:= VS_Serie;
      DM.IBTable_Item_Prova.FieldByName('Status').AsString:= VS_Status;
      DM.IBTable_Item_Prova.Post;
      Funcoes.ExecutaTransacao;
   except

   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar Avaliacao
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Grava_Avaliacao(VS_IdCurso, VS_IdTurma, VS_FaseAplicacao, VS_ReferenciaAvaliacao, VS_CodMateria, VS_MediaParcial, VS_PesoAplicacao, VS_MediaMinima, VS_CodProva, VS_PesoDisciplina, VS_Media, VS_Observacao, VS_Ordem: String);
begin
   try
      Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select IdCurso From Avaliacao ' +
                                                ' Where IdCurso = '+VS_IdCurso+
                                                ' and IdTurma = '+VS_IdTurma+
                                                ' and FaseAplicacao = '+#39+VS_FaseAplicacao+#39+
                                                ' and ReferenciaAvaliacao = '+#39+VS_ReferenciaAvaliacao+#39+
                                                ' and CodMateria = '+#39+VS_CodMateria+#39
                          );

      if DM.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
         DM.IBTable_Avaliacao.Append
      else
         DM.IBTable_Avaliacao.Edit;

      DM.IBTable_Avaliacao.FieldByName('IDCURSO').AsString:= VS_IdCurso;
      DM.IBTable_Avaliacao.FieldByName('IDTURMA').AsString:= VS_IdTurma;
      DM.IBTable_Avaliacao.FieldByName('FASEAPLICACAO').AsString:= VS_FaseAplicacao;
      DM.IBTable_Avaliacao.FieldByName('REFERENCIAAVALIACAO').AsString:= VS_ReferenciaAvaliacao;
      DM.IBTable_Avaliacao.FieldByName('CODMATERIA').AsString:= VS_CodMateria;
      DM.IBTable_Avaliacao.FieldByName('MEDIAPARCIAL').AsString:= VS_MediaParcial;
      DM.IBTable_Avaliacao.FieldByName('PESOAPLICACAO').AsString:= VS_PesoAplicacao;
      DM.IBTable_Avaliacao.FieldByName('MEDIAMINIMA').AsString:= VS_MediaMinima;
      DM.IBTable_Avaliacao.FieldByName('CODPROVA').AsString:= VS_CodProva;
      DM.IBTable_Avaliacao.FieldByName('PESODISCIPLINA').AsString:= VS_PesoDisciplina;
      DM.IBTable_Avaliacao.FieldByName('MEDIA').AsString:= VS_Media;
      DM.IBTable_Avaliacao.FieldByName('OBSERVACAO').AsString:= VS_Observacao;
      DM.IBTable_Avaliacao.FieldByName('Ordem').AsString:= VS_Ordem;
      DM.IBTable_Avaliacao.Post;
      Funcoes.ExecutaTransacao;
   except

   end;
end;


//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a Funcao de Gravar as Disciplinas
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Grava_Disciplina(VS_IdCurso, VS_IdTurma, VS_CodMateria, VS_NomeMateria, VS_NumeroAulasTeoricas, VS_NumeroAulasPraticas, VS_Fase, VS_PerguntaChefe, VS_PerguntaAluno, VS_Especialidade, VS_Qtd_Objetivos, VS_Atualizacao, VS_Ano: String);
begin
   try
      Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select IdCurso From MateriaCurso ' +
                                                ' Where IdCurso = '+VS_IdCurso+
                                                ' and IdTurma = '+VS_IdTurma+
                                                ' and CodMateria = '+#39+VS_CodMateria+#39
                          );

      if DM.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
         DM.IBTable_Materia.Append
      else
         DM.IBTable_Materia.Edit;

      DM.IBTable_Materia.FieldByName('IDCURSO').AsString:= VS_IdCurso;
      DM.IBTable_Materia.FieldByName('IDTURMA').AsString:= VS_IdTurma;
      DM.IBTable_Materia.FieldByName('CODMATERIA').AsString:= VS_CodMateria;
      DM.IBTable_Materia.FieldByName('NOMEMATERIA').AsString:= VS_NomeMateria;
      DM.IBTable_Materia.FieldByName('NUMEROAULASTEORICAS').AsString:= VS_NumeroAulasTeoricas;
      DM.IBTable_Materia.FieldByName('NUMEROAULASPRATICAS').AsString:= VS_NumeroAulasPraticas;
      DM.IBTable_Materia.FieldByName('FASE').AsString:= VS_Fase;
      DM.IBTable_Materia.FieldByName('PERGUNTACHEFE').AsString:= VS_PerguntaChefe;
      DM.IBTable_Materia.FieldByName('PERGUNTAALUNO').AsString:= VS_PerguntaAluno;
      DM.IBTable_Materia.FieldByName('ESPECIALIDADE').AsString:= VS_Especialidade;
      DM.IBTable_Materia.FieldByName('QTD_OBJETIVOS').AsString:= VS_Qtd_Objetivos;
      DM.IBTable_Materia.FieldByName('ATUALIZACAO').AsString:= VS_Atualizacao;
      DM.IBTable_Materia.FieldByName('ANO').AsString:= VS_Ano;
      DM.IBTable_Materia.Post;
      Funcoes.ExecutaTransacao;
   except

   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar Abrangencia
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Grava_Abrangencia(VS_IdCurso, VS_IdTurma, VS_FaseAplicacao, VS_ReferenciaAvaliacao, VS_CodMateria, VS_Materia: String);
begin
   try
      Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select IdCurso From Abrangencia_Prova ' +
                                                ' Where IdCurso = '+VS_IdCurso+
                                                ' and IdTurma = '+VS_IdTurma+
                                                ' and FaseAplicacao = '+#39+VS_FaseAplicacao+#39+
                                                ' and ReferenciaAvaliacao = '+#39+VS_ReferenciaAvaliacao+#39+
                                                ' and CodMateria = '+#39+VS_CodMateria+#39+
                                                ' and Materia = '+#39+VS_Materia+#39
                          );

      if DM.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
      begin
         DM.IBTable_Abrangencia.Append;
         DM.IBTable_Abrangencia.FieldByName('IDCURSO').AsString:= VS_IdCurso;
         DM.IBTable_Abrangencia.FieldByName('IDTURMA').AsString:= VS_IdTurma;
         DM.IBTable_Abrangencia.FieldByName('FASEAPLICACAO').AsString:= VS_FaseAplicacao;
         DM.IBTable_Abrangencia.FieldByName('REFERENCIAAVALIACAO').AsString:= VS_ReferenciaAvaliacao;
         DM.IBTable_Abrangencia.FieldByName('CODMATERIA').AsString:= VS_CodMateria;
         DM.IBTable_Abrangencia.FieldByName('MATERIA').AsString:= VS_Materia;
         DM.IBTable_Abrangencia.Post;
         Funcoes.ExecutaTransacao;
      end;
   except

   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Gravar o telefone
//
// Data     : 04/04/2013
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Grava_Telefone(VS_Identidade, VS_Celular1, VS_Tel_Residencial, VS_Tel_Contato, VS_Tel_Comercial, VS_Celular, VS_Fax : String);
begin
   Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select Identidade From Cad_Telefone Where Identidade = '+#39+VS_Identidade+#39 );

   if DM.IBQuery_Executa.FieldByName('Identidade').AsString = '' then
      Funcoes.ExecusaoQuery('Insert into Cad_Telefone (Identidade, Celular1, Tel_Residencial, Tel_Contato, Tel_Comercial, Celular, Fax) '+
                            ' Values ('+#39+VS_Identidade+#39+', '+#39+VS_Celular1+#39+', '+#39+VS_Tel_Residencial+#39+', '+#39+VS_Tel_Contato+#39+
                                      ', '+#39+VS_Tel_Comercial+#39+', '+#39+VS_Celular+#39+', '+#39+VS_Fax+#39+')'
                           )
   else
      Funcoes.ExecusaoQuery('update Cad_Telefone set Celular1 = '+#39+VS_Celular1+#39+', '+
                                                   ' Tel_Residencial = '+#39+VS_Tel_Residencial+#39+', '+
                                                   ' Tel_Contato = '+#39+VS_Tel_Contato+#39+', '+
                                                   ' Tel_Comercial = '+#39+VS_Tel_Comercial+#39+', '+
                                                   ' Celular = '+#39+VS_Celular+#39+', '+
                                                   ' Fax = '+#39+VS_Fax+#39+
                            ' where Identidade =  '#39+VS_Identidade+#39
                           );
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Verificar se o Curso possui Turma em
//            andamento.
// Data     : 28/11/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.VerificaTurma(VS_Msg: String): Boolean;
var
   VB_Retorno: Boolean;
begin
   VB_Retorno:= True;
   Funcoes.OpenQuery( 'Select CodCurso From Turmas_View where IdCurso = '+Funcoes.GetIdCurso);

   if  DM.IBQuery_Executa.FieldByName('CodCurso').AsString = '' then
   begin
      ShowMessage('O Curso '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' não possuí Turma em Andamento'+#13+VS_Msg);
      VB_Retorno:= False;
   end;
   VerificaTurma:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaTransacao;
begin
   if not DM.IBTransaction_Ensino.Active then
       DM.IBTransaction_Ensino.Active := True;

   DM.IBTransaction_Ensino.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da parada da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.abortaTransacao;
begin
   if not DM.IBTransaction_Ensino.Active then
       DM.IBTransaction_Ensino.Active := True;

   DM.IBTransaction_Ensino.RollbackRetaining;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Trocar o acento pelo caracter sem acento
// Data     : 28/08/2012
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarConsultaComAcento(Campo, Compara, Str: String): String;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;
begin
   VI_tam:= Length(Str);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(Str,i,1);

      if ((VS_letra = 'A') or (VS_letra = 'E') or (VS_letra = 'I') or (VS_letra = 'O') or (VS_letra = 'U') or (VS_letra = 'C')) then
         VS_letra:= '_';

      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  if VS_Retorno <> Str then
     VS_Retorno:= ' or '+Campo+' '+Compara+' '+#39+VS_Retorno+#39+' '
  else
     VS_Retorno:= '';
  Result := VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Retornar o numero da Serie
// Data     : 25/04/2014
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.VerificaSerie(VS_IdCurso, VS_IdTurma, VS_CodMateria, VS_Objetivo : string): String;
var
   Retorno: String;
begin
   Funcoes.OpenQuery( 'Select Serie from Item_Prova  '+
                      ' where IdCurso = '+VS_IdCurso+
                      ' and IdTurma = '+VS_IdTurma+
                      ' and CodMateria = '+#39+VS_CodMateria+#39+
                      ' and Disciplina = '+#39+Copy(VS_CodMateria,1,2)+#39+
                      ' and Unidade = '+#39+Copy(VS_CodMateria,3,2)+#39+
                      ' and SubUnidade = '+#39+Copy(VS_CodMateria,5,2)+#39+
                      ' and objetivo = '+#39+VS_Objetivo+#39
                     );
   DM.IBQuery_Executa.Last;

   if DM.IBQuery_Executa.FieldByName('Serie').AsString = '' then
      Retorno:= '01'
   else
      Retorno:= FormatFloat('00', DM.IBQuery_Executa.FieldByName('Serie').AsInteger+1);
   VerificaSerie:= Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Limpa Memoria
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.TrimAppMemorySize;
var
   MainHandle : THandle;
begin
   try
      MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
      SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
      CloseHandle(MainHandle) ;
   except
   end;
   Application.ProcessMessages;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para atualizar a Hora do Micro de acordo com o servidor
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AjustaHora;
var
   SystemTime : TSystemTime;
begin
   Try
      OpenQuery('select current_timestamp as DataHora from rdb$database');
      With SystemTime do
      begin
         //Definindo o dia do sistema

         wDay:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,1,2));
         wMonth:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,4,2));
         wYear:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,7,4));

         //Definindo a hora do sistema

         wHour:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,12,2)); //hora
         wMinute:= StrToInt(copy(DM.IBQuery_Executa.FieldByName('DataHora').AsString,15,2)); //minutos
         wSecond:= 00; //segundos
      end;

      SetLocalTime(SystemTime);       //Colocar a hora e data do sistema
   except
      MessageDlg('Não esta conectando com o Servidor...'+#13+'1- Verifique a conexão com a rede.'+#13+'2 -  entre em contato com o Fiscal da Prova para que ele possa mudá-lo de maquina.',mtError, [mbOk],0);
      Application.terminate;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento do DBComboBox do Nome de Guerra de acordo com o nome completo
// Data     : 07/11/16
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.Tratar_NomeGuerra( DBComboBox_NomeGuerra: TDBComboBox; VS_NomeCompleto: String);
var
   VI_Tam, VI_Cont: Integer;
   VS_Texto, VS_Palavra: String;
begin
   DBComboBox_NomeGuerra.Items.Clear;

   VI_Tam:= Length(VS_NomeCompleto);

   VI_Cont:= 0;
   VS_Texto:= ' ';
   VS_Palavra:= '';

   While VI_Cont <= VI_Tam do
   begin
      VI_Cont:= VI_Cont+1;

      VS_texto:= Copy(VS_NomeCompleto,VI_Cont, 1);

      if VS_Texto = ' ' then
      Begin
         DBComboBox_NomeGuerra.Items.Add(Trim(VS_Palavra));
         VS_Palavra:= '';
      end
      else
      begin
         VS_Palavra:= VS_Palavra+VS_Texto;
      end;
   end;
   DBComboBox_NomeGuerra.Items.Add(Trim(VS_Palavra));
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para pegar a quantidade de registros
// Data     : 14/11/16
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TotalRegistros( IBQuery: TIBQuery): String;
var
   VS_TotalReg: String;
begin
   IBQuery.Last;
   VS_TotalReg:= IntToStr(IBQuery.Recordcount);
   IBQuery.First;
   TotalRegistros:= VS_TotalReg;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento dos JvTransparentButton quando a sua apresentacao
// Data     : 07/12/16
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.TratarJvExpressButton( JvExpressButton: TJvExpressButton; JvShape: TJvShape; Status: boolean);
begin
   JvExpressButton.Visible:= Status;
   JvShape.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento dos JvTransparentButton quando a sua apresentacao
// Data     : 07/12/16
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.TratarJvTransparentButton( JvTransparentButton: TJvTransparentButton; JvShape: TJvShape; Status: boolean);
begin
   JvTransparentButton.Visible:= Status;
   JvShape.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento das mensagens dos relatorios
// Data     : 07/12/16
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.TrataMensagem(VS_Comando: String);
begin
   Application.CreateForm(TForm_TrataDocumento, Form_TrataDocumento);

   Funcoes.ExecutaQuery( Form_TrataDocumento.IBQuery_Documento, VS_Comando);

   Form_TrataDocumento.Documento.SelectAll;
   Form_TrataDocumento.Documento.CopyToClipboard ;

   Form_TrataDocumento.IBQuery_Documento.Close;
   Form_TrataDocumento.Free;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento validar o campo com somente numero
// Data     : 26/01/17
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.SomenteNumero(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para setar a secao
// Data     : 14/09/17
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.SetSecao;
begin
   if (DM.Query_Usuario.FieldByName('Secao').AsString = 'ADMINISTRAÇÃO') then
      VS_Secao:= 'ADMINISTRAÇÃO'
   else
   begin
      Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select Sigla, SubDivisao From FP_Secao Where Sigla = '+#39+DM.Query_Usuario.FieldByName('Secao').AsString+#39 );
      VS_Secao:= DM.IBQuery_Executa.FieldByName('SubDivisao').AsString;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Tratamento para retornar a secao
// Data     : 14/09/17
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------


Function Funcao.GetSecao: String;
begin
   GetSecao:= VS_Secao;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Funcoes:= Funcao.Create;
end.

