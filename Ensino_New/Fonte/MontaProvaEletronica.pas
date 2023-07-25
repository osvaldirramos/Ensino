//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : MontaProvaEletronica.pas                       //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da montagem //
//                             do gabarito da prova para os alunos participantes//
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : TCel Giovanni                                  //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 01/06/2014                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 25/11/2019                                     //
// AUTOR                     : Osvaldir                                       //
// MODULO ALTERADO           : Query de tratamento do numero de alunos que    //
//                             farão prova.                                   //
// MOTIVO                    : Pegar o número de alunos através de query      //
//                             descartando os que foram desligados.           //
//----------------------------------------------------------------------------//

unit MontaProvaEletronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBTable, IBQuery, Rotinas,
  StdCtrls, JvRichEd, JvDBRichEd, ToolWin, ExtCtrls, DBCtrls, Grids,
  DBGrids, Buttons, JvComponent, JvTransBtn, JvShape;

type
  TForm_MontaProvaEletronica = class(TForm)
    IBQuery_AlunoTurma: TIBQuery;
    StaticText_Msg: TStaticText;
    ProgressBar1: TProgressBar;
    JvShape6: TJvShape;
    JvTransparentButton_ProvaEletronica: TJvTransparentButton;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_ProvaEletronicaClick(Sender: TObject);
  private    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_MontaProvaEletronica: TForm_MontaProvaEletronica;

implementation

uses Se_Prova, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_MontaProvaEletronica.FormActivate(Sender: TObject);
const
   C=100;
var
   VI_NumeroItem: array[1..100] of integer;
   VS_Comando: String;

   VI_Gabarito, VI_TotalItens: Integer;
   X, I, A, P : Integer;
   Num: array[0..C-1] of Integer;
begin
   try
   Form_Cad_Prova.Query_Item_Teste.Open;

   ProgressBar1.Max:= Form_Cad_Prova.Table_Teste.FieldByName('N_gabaritos').AsInteger*2;
   StaticText_Msg.Caption:= 'Aguarde excluíndo Gabarito anteriores...';
   show;
   update;

   Funcoes.OpenQuery( ' Select count(1) as QdeAlunos From aluno_turmas_view '+
                      ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                      ' and   IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString
                    );

//   Funcoes.OpenQuery( ' Select QdeAlunos From Turmas_View where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
//                      ' and IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString
//                    );

   Form_Cad_Prova.Table_Teste.Edit;
   Form_Cad_Prova.Table_Teste.FieldByName('N_GABARITOS').AsInteger:= DM.IBQuery_Executa.FieldByName('QdeAlunos').AsInteger;
   Form_Cad_Prova.Table_Teste.FieldByName('Inicio_Aplicacao').AsString:= '00:00:00';
   Form_Cad_Prova.Table_Teste.Post;
   Funcoes.ExecutaTransacao;

   VI_Gabarito:= 0;

    //----
   //--- Tratamento para montagem do Gabarito

   //--- Deleta gabarito da Prova se Existir

   VS_Comando:= ' Delete from GabaritoProva '+
                ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                ' and CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;
   Funcoes.ExecusaoQuery(VS_Comando);

   VI_TotalItens:= Form_Cad_Prova.Table_Teste.FieldByName('TotalItens').AsInteger;

   while VI_Gabarito < Form_Cad_Prova.Table_Teste.FieldByName('N_gabaritos').AsInteger do
   begin
      For i:= 1 to VI_TotalItens do
         VI_NumeroItem[i]:= -1;

      VI_Gabarito:= VI_Gabarito + 1;
      StaticText_Msg.Caption:= 'Aguarde Montando Gabarito '+IntToStr(VI_Gabarito)+'...';
      ProgressBar1.StepBy(1);
      Update;

      //---
      //--- Monta sequencia para os itens

      randomize;
      for I := 0 to C - 1 do
          Num[I] := I+1;
      for I := C - 1 downto 0 do
      begin
        P := Random(I+1);
        A := Num[I];
        Num[I] := Num[P];
        Num[P] := A;
      end;

      X:= 1;
      for I := Low(Num) to High(Num) do
      begin
        if Num[I] <= VI_TotalItens then
        begin
           VI_NumeroItem[X]:= Num[I];
           X:= X+1;
        end;
      end;

      //---
      //--- Monta Gabarito

      Form_Cad_Prova.Query_Item_Teste.First;
      While not Form_Cad_Prova.Query_Item_Teste.eof do
      begin
         VS_Comando:= ' Insert Into GabaritoProva ( IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Gabarito, NumeroQuestao, Questao, NumItem)'+
                      ' Values ('+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString+' , ' +
                                     Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString+' , ' +
                                     #39+Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString+#39+' , ' +
                                     #39+Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+' , ' +
                                     #39+Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString+#39+' , ' +
                                     IntToStr(VI_Gabarito)+' , ' +
                                     Form_Cad_Prova.Query_Item_Teste.FieldByName('NumeroQuestao').AsString+' , ' +
                                     IntToStr(VI_NumeroItem[Form_Cad_Prova.Query_Item_Teste.FieldByName('NumeroQuestao').AsInteger])+' , ' +
                                     Form_Cad_Prova.Query_Item_Teste.FieldByName('NumItem').AsString+
                                  ')';
         Funcoes.ExecusaoQuery(VS_Comando);
         Form_Cad_Prova.Query_Item_Teste.Next;
      end;
   end;

    //----
   //---  Tratamento para montar gabarito por aluno

   StaticText_Msg.Caption:= 'Aguarde montando Gabarito Por Aluno...';

   //--- Deleta RespostaAluno da Prova se Existir

   VS_Comando:= ' Delete from RespostaAluno '+
                ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                ' and CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;
   Funcoes.ExecusaoQuery(VS_Comando);

   VS_Comando:= ' Delete from TesteAplicacao '+
                ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                ' and CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;
   Funcoes.ExecusaoQuery(VS_Comando);
                              
   VS_Comando:= ' Delete from TestePedidoRevisaoItem '+
                ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                ' and CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;
   Funcoes.ExecusaoQuery(VS_Comando);

   VS_Comando:=  'Select Identidade, NomeGuerra From Aluno_Turmas_View '+
                ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and   IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                 ' and  MotivoDesligamento = '+#39+'a'+#39;
   Funcoes.ExecutaQuery( IBQuery_AlunoTurma, VS_Comando);

   VI_Gabarito:= 0;
   While not IBQuery_AlunoTurma.Eof do
   begin
      VI_Gabarito:= VI_Gabarito + 1;
      StaticText_Msg.Caption:= 'Aguarde Montando Resposta Aluno '+IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString+' - Gabrito '+IntToStr(VI_Gabarito)+'...';
      ProgressBar1.StepBy(1);
      Update;

      VS_Comando:= ' Insert into RespostaAluno (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Identidade, OpcaoVetor, Gabarito) '+
                                       ' Values('+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                             ', '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                                             ', '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                                             ', '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('referenciaavaliacao').AsString+#39+
                                             ', '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                                             ', '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+
                                             ', '+#39+''+#39+
                                             ', '+#39+IntToStr(VI_Gabarito)+#39+')';
      Funcoes.ExecusaoQuery(VS_Comando);

      VS_Comando:= ' Insert into TesteAplicacao (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Identidade, Status, QtdRespondidas, Senha) '+
                                        ' Values('+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                                 ', '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                                                 ', '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                                                 ', '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('referenciaavaliacao').AsString+#39+
                                                 ', '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                                                 ', '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+
                                                 ', '+#39+'Iniciar'+#39+
                                                 ', 0'+
                                                 ', '+#39+Funcoes.GerarSenha(5)+#39+')';
      Funcoes.ExecusaoQuery(VS_Comando);

      IBQuery_AlunoTurma.Next;
   end;

   Form_Cad_Prova.Table_Teste.Edit;
   Form_Cad_Prova.Table_Teste.FieldByName( 'Status_Aplicacao').AsString:= 'APLICAR';
   Form_Cad_Prova.Table_Teste.Post;
   Funcoes.ExecutaTransacao;
   Form_Cad_Prova.Table_Teste.Close;
   Form_Cad_Prova.Table_Teste.Open;

   StaticText_Msg.Caption:= 'Finalizada a montagem da Prova Eletrônica para os '+IntToStr(VI_Gabarito)+' alunos paticipantes...';
   except
      //
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para finalizar a Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_MontaProvaEletronica.JvTransparentButton_ProvaEletronicaClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_MontaProvaEletronica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_AlunoTurma.Close;
   Action:= caFree;
end;

end.
