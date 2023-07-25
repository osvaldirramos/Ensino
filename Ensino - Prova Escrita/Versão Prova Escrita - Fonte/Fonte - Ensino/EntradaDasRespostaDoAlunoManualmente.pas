unit EntradaDasRespostaDoAlunoManualmente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DBCtrls, ToolWin, Rotinas, DB,
  IBCustomDataSet, IBQuery, JvGradient, JvComponent, JvTransBtn, JvShape;

type
  TForm_EntradaDasRespostaDoAlunoManualmente = class(TForm)
    GroupBox_RespostaAluno: TGroupBox;
    IBQuery_RespostaAluno: TIBQuery;
    DSQ_RespostaAluno: TDataSource;
    JvGradient1: TJvGradient;
    Bevel3: TBevel;
    Label_Contador: TLabel;
    Edit_Respostas: TEdit;
    Panel_BotoesPrincipal: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    Label_Prova: TLabel;
    StatusBar1: TStatusBar;
    JvShape6: TJvShape;
    JvTransparentButton_Limpar: TJvTransparentButton;
    Memo2: TMemo;
    Panel1: TPanel;
    JvGradient3: TJvGradient;
    Label3: TLabel;
    DBText_Aluno: TDBText;
    Label4: TLabel;
    DBText_Identidade: TDBText;
    Label5: TLabel;
    DBText3: TDBText;
    Label_Gabarito: TLabel;
    ComboBox_Gabarito: TComboBox;
    JvShape2: TJvShape;
    JvTransparentButton_AlternativaCorretaA: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_AlternativaCorretaB: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_AlternativaCorretaC: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_AlternativaCorretaD: TJvTransparentButton;
    JvShape11: TJvShape;
    JvTransparentButton_AlternativaBranco: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    DBNavigator_NotaManual: TDBNavigator;
    JvShape7: TJvShape;

    procedure CorrecaoManualDaProva;
    procedure RespostaAluno(Resposta: String);
    procedure TrataBotoesResposta;

    procedure Edit_RespostasKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit_RespostasChange(Sender: TObject);
    procedure DBNavigator_NotaManualClick(Sender: TObject; Button: TNavigateBtn);
    procedure ComboBox_GabaritoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_LimparClick(Sender: TObject);
    procedure JvTransparentButton_AlternativaCorretaAClick( Sender: TObject);
    procedure JvTransparentButton_AlternativaCorretaBClick( Sender: TObject);
    procedure JvTransparentButton_AlternativaCorretaCClick( Sender: TObject);
    procedure JvTransparentButton_AlternativaCorretaDClick( Sender: TObject);
    procedure JvTransparentButton_AlternativaBrancoClick(Sender: TObject);
  private    { Private declarations }
     VI_QtdResposta: integer;
     VS_Gabarito: String;

     VB_PossuiResposta: Boolean;

  public
    { Public declarations }
  end;

var
  Form_EntradaDasRespostaDoAlunoManualmente: TForm_EntradaDasRespostaDoAlunoManualmente;

implementation

uses Module, CorrecaoProva;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.FormActivate(Sender: TObject);
var
   VB_Status: Boolean;
   i: Integer;
begin
   Funcoes.CabecalhoForm( Form_EntradaDasRespostaDoAlunoManualmente, '--> Entrada Manual da Resposta do Aluno');

   Label_Prova.Caption:= 'Resposta Manual da Prova: '+Copy( Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,1,2)+'-'+
                         Copy(Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,3,2);
   TrataBotoesResposta;

   Edit_Respostas.MaxLength:=Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'TotalItens').AsInteger;

    //---
   //--- Montagem do Combo de Tratamento do Gabarito

   ComboBox_Gabarito.Items.Clear;

   if ((Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('N_Gabaritos').AsInteger = 1) or
       (Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('N_Gabaritos').AsInteger = 0)) then
   begin
      VB_Status:= False;
      VS_Gabarito:= '1';
   end
   else
   begin
      VB_Status:= True;
      ComboBox_Gabarito.Visible:= True;
      For i:= 1 to Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('N_Gabaritos').AsInteger do
          ComboBox_Gabarito.Items.Add(IntToStr(i));
   end;
   Label_Gabarito.Visible:= VB_Status;
   ComboBox_Gabarito.Visible:= VB_Status;

    //---
   // Inicia o processo de Correcao da prova

//   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.First;
   CorrecaoManualDaProva;
end;

procedure TForm_EntradaDasRespostaDoAlunoManualmente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_RespostaAluno.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Fecha a Janela de Trabalho
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_GravarClick(Sender: TObject);
var
   VS_Comando: String;
   VS_IdCurso, VS_IdTurma, VS_Identidade, VS_CodMateria, VS_Referencia, VS_Fase: String;
begin
   if VS_Gabarito = '' then
   begin
      ShowMessage('Não foi fornecido o gabarito da prova...');
      ComboBox_Gabarito.SetFocus;
   end
   else
   begin
      VS_IdCurso:= DM.IBQuery_MontaTurma.FieldByName( 'IdCurso').AsString;
      VS_IdTurma:= DM.IBQuery_MontaTurma.FieldByName( 'IdTurma').AsString;
      VS_Identidade:= Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByNAme('Identidade').AsString;
      VS_CodMateria:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodMateria').AsString;
      VS_Referencia:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'ReferenciaAvaliacao').AsString;
      VS_Fase:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'faseAplicacao').AsString;

       if VB_PossuiResposta = False then
      begin
         VS_Comando:= ' Insert into RespostaAluno (IdCurso, IdTurma,FaseAplicacao, ReferenciaAvaliacao, CodMateria, Identidade, OpcaoVetor, Gabarito) '+
                      ' Values('+VS_IdCurso+', '+VS_IdTurma+', '+#39+VS_Fase+#39+', '+#39+VS_Referencia+#39+', '+#39+VS_CodMateria+#39+', '+#39+VS_Identidade+#39+', '+#39+Edit_Respostas.Text+#39+', '+VS_Gabarito+')';
      end
      else
      begin
         VS_Comando:= ' Update RespostaAluno set OPCAOVETOR = '+#39+Edit_Respostas.Text+#39+', '+
                      '                                       Gabarito = '+VS_Gabarito+
                      ' where IdCurso = '+VS_IdCurso+
                      ' and IdTurma = '+VS_IdTurma+
                      ' and faseAplicacao = '+#39+VS_Fase+#39+
                      ' and ReferenciaAvaliacao = '+#39+VS_Referencia+#39+
                      ' and CodMateria = '+#39+VS_CodMateria+#39+
                      ' and Identidade = '+#39+VS_Identidade+#39;
       end;
   end;
   Funcoes.ExecusaoQuery(VS_Comando);
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
   CorrecaoManualDaProva;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de cancelamento da insercao ou alteracao
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
   CorrecaoManualDaProva;
end;

//------------------------------------------------------------------------------
// Tratamento da seleção do Aluno
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.DBNavigator_NotaManualClick(Sender: TObject; Button: TNavigateBtn);
begin
   CorrecaoManualDaProva;
end;

//------------------------------------------------------------------------------
// Tratamento para definir a resposta correta como a resposta A
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_AlternativaCorretaAClick(Sender: TObject);
begin
  RespostaAluno('A');
end;

//------------------------------------------------------------------------------
// Tratamento para definir a resposta correta como a resposta B
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_AlternativaCorretaBClick(Sender: TObject);
begin
  RespostaAluno('B');
end;

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_AlternativaCorretaCClick(Sender: TObject);
begin
  RespostaAluno('C');
end;

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_AlternativaCorretaDClick(Sender: TObject);
begin
  RespostaAluno('D');
end;

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_AlternativaBrancoClick(Sender: TObject);
begin
  RespostaAluno(' ');
end;

//------------------------------------------------------------------------------
// Trava a entrada da resostas somente nas alternativas A, B, C, D
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.Edit_RespostasKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= Upcase(Key);
   if not (key in['A','B','C','D', #8]) then
     key:= #0;
end;

//------------------------------------------------------------------------------
// Abre o container de correção da entrada das opcoes da prova Manualmente
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.CorrecaoManualDaProva;
begin
   // Pega vetor com respostas dos alunos da leitora

   Funcoes.ExecutaQuery( IBQuery_RespostaAluno, 'Select IdCurso, opcaovetor, Gabarito '+
                                                   ' from respostaaluno '+
                                                   ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                                                   ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                                                   ' and faseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                                                   ' and ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                                                   ' and CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                                                   ' and identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName( 'Identidade').AsString+#39
                          );

      if IBQuery_RespostaAluno.FieldByName('IdCurso').AsString <> '' then
      begin
         ComboBox_Gabarito.Visible:= False;
         VB_PossuiResposta:= True;
         VS_Gabarito:= IBQuery_RespostaAluno.FieldByName('Gabarito').AsString;
         ComboBox_Gabarito.Text:= IBQuery_RespostaAluno.FieldByName('Gabarito').AsString;
         Edit_Respostas.Text:= IBQuery_RespostaAluno.FieldByName('OpcaoVetor').AsString;
         Label_Gabarito.Caption:= 'Gabarito da Prova: '+VS_Gabarito;
      end
      else
      begin
         Label_Gabarito.Caption:= 'Gabarito da Prova: ';
         ComboBox_Gabarito.Visible:= True;
         VB_PossuiResposta:= False;
         ComboBox_Gabarito.Text:= '';
         Edit_Respostas.Text:= '';
      end;
   Edit_Respostas.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento de resposta entrada manualmente pelo aluno
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.RespostaAluno(Resposta: String);
begin
   if VI_QtdResposta < Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'TotalItens').AsInteger then
       Edit_Respostas.Text:= Edit_Respostas.Text+Resposta;
end;

//------------------------------------------------------------------------------
// Tratamento quando existe alteracao na resposta
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.Edit_RespostasChange(Sender: TObject);
begin
   TrataBotoesResposta;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento dos Botoes da Resposta
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.TrataBotoesResposta;
Var
   Status: Boolean;
begin
   VI_QtdResposta:= Length(Edit_Respostas.Text);

   Label_Contador.Caption:= '< '+FormatFloat('000', VI_QtdResposta)+' / '+FormatFloat('000', Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'TotalItens').AsInteger)+' >';

   if VI_QtdResposta = Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'TotalItens').AsInteger then
      Status:= True
   else
      Status:= False;

   JvTransparentButton_Gravar.Enabled:= Status;
   JvTransparentButton_Cancelar.Enabled:= Status;
end;

procedure TForm_EntradaDasRespostaDoAlunoManualmente.ComboBox_GabaritoChange(Sender: TObject);
begin
   VS_Gabarito:= ComboBox_Gabarito.Text;
end;

//------------------------------------------------------------------------------
// Tratamento para limpar a resposta do aluno
//------------------------------------------------------------------------------

procedure TForm_EntradaDasRespostaDoAlunoManualmente.JvTransparentButton_LimparClick(Sender: TObject);
begin
    Edit_Respostas.Text:= '';
end;

end.
