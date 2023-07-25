unit EntradaDaNotaDoAlunoManualmente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB,
  Dialogs, StdCtrls, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls, DBCtrls, Rotinas,
  ToolWin, IBCustomDataSet, IBTable, JvGradient, JvComponent, JvTransBtn,
  JvShape;

type
  TForm_EntradaDaNotaDoAlunoManualmente = class(TForm)
    Table_Resultado_Exame: TIBTable;
    Table_Resultado_ExameIDCURSO: TSmallintField;
    Table_Resultado_ExameIDTURMA: TIntegerField;
    Table_Resultado_ExameFASEAPLICACAO: TIBStringField;
    Table_Resultado_ExameREFERENCIAAVALIACAO: TIBStringField;
    Table_Resultado_ExameCODMATERIA: TIBStringField;
    Table_Resultado_ExameIDENTIDADE: TIBStringField;
    Table_Resultado_ExameQDERESPBCO: TSmallintField;
    Table_Resultado_ExameQDERESPCER: TSmallintField;
    Table_Resultado_ExameQDERESPERR: TSmallintField;
    Table_Resultado_ExameNOTA: TIBBCDField;
    Table_Resultado_ExameHORAFIM: TIBStringField;
    Label11: TLabel;
    Label1: TLabel;
    JvFloatEdit_NotaManual: TJvFloatEdit2;
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    Label8: TLabel;
    DBText1: TDBText;
    Label10: TLabel;
    DBText4: TDBText;
    Label9: TLabel;
    DBText2: TDBText;
    Panel2: TPanel;
    JvShape3: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    DBNavigator_NotaManual: TDBNavigator;
    StatusBar1: TStatusBar;
    Label_Prova: TLabel;
    Memo2: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure DBNavigator_NotaManualClick(Sender: TObject; Button: TNavigateBtn);
    procedure JvFloatEdit_NotaManualKeyPress(Sender: TObject;var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_EntradaDaNotaDoAlunoManualmente: TForm_EntradaDaNotaDoAlunoManualmente;

implementation

uses Module, CorrecaoProva;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_EntradaDaNotaDoAlunoManualmente.FormActivate(Sender: TObject);
begin
  if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_EntradaDaNotaDoAlunoManualmente.Caption:= 'SAE(SISTEMA DE ACOMPANHAMENTO EDUCACIONAL) --> Entrada da Nota do Aluno - Manualmente';

   Label_Prova.Caption:= 'Resposta Manual da Prova: '+Copy( Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,1,2)+'-'+
                         Copy(Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,3,2);
   Table_Resultado_Exame.Open;
   JvFloatEdit_NotaManual.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_EntradaDaNotaDoAlunoManualmente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Fechar
//------------------------------------------------------------------------------

procedure TForm_EntradaDaNotaDoAlunoManualmente.JvTransparentButton_FecharClick( Sender: TObject);
begin
   Table_Resultado_Exame.Close;
   Form_Cad_CorrecaoProva.VB_CadastrarNotaManualmente:= False;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento da Gravacao da Entrada da Nota Manual
//------------------------------------------------------------------------------

procedure TForm_EntradaDaNotaDoAlunoManualmente.JvTransparentButton_GravarClick(Sender: TObject);
var
   VS_Comando: String;
   bmLocal : TBookmark;
begin
   bmLocal:= Form_Cad_CorrecaoProva.Query_RelacaoAlunos.GetBookMark;

   if ((Trim(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) = 'a') or
       (Trim(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) = ' ') or
       (Trim(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('MotivoDesligamento').AsString) = '')) then
   begin
      VS_Comando:= 'Select count(1) as Qtd from ResultadoExame '+
                   ' where IDCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                   ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                   ' and faseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                   ' and ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                   ' and CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                   ' and Identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByNAme('Identidade').AsString+#39;

      if Funcoes.QtdRegistro(VS_Comando) = 0 then   // Inserir
      begin
         Table_Resultado_Exame.Append;
         Table_Resultado_Exame.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString;
         Table_Resultado_Exame.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString;
         Table_Resultado_Exame.FieldByName('FaseAplicacao').AsString:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString;
         Table_Resultado_Exame.FieldByName('ReferenciaAvaliacao').AsString:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString;
         Table_Resultado_Exame.FieldByName('CodMateria').AsString:=Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString;
         Table_Resultado_Exame.FieldByName('Identidade').AsString:= Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByNAme('Identidade').AsString;
         Table_Resultado_Exame.FieldByName('HoraFim').AsString:= '00:00';
         Table_Resultado_Exame.FieldByName('QdeRespBco').AsString:= '0';
         Table_Resultado_Exame.FieldByName('QdeRespCer').AsString:= '0';
         Table_Resultado_Exame.FieldByName('QdeRespErr').AsString:= '0';
         Table_Resultado_Exame.FieldByName('Nota').AsFloat:= JvFloatEdit_NotaManual.Value;
         Table_Resultado_Exame.Post;
         Funcoes.ExecutaTransacao;
      end
      else
      begin
         if JvFloatEdit_NotaManual.Text = '' then
         begin
            VS_Comando:= 'Update ResultadoExame set nota = NULL'+
                         ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                         ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                         ' and FaseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                         ' and ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                         ' and CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                         ' and Identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByNAme('Identidade').AsString+#39;
         end
         else
         begin
            VS_Comando:= 'Update ResultadoExame set nota = '+Funcoes.DePara(JvFloatEdit_NotaManual.Text,',','.')+
                         ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                         ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                         ' and FaseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                         ' and ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                         ' and CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                         ' and Identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByNAme('Identidade').AsString+#39;
         end;
          Funcoes.ExecusaoQuery(VS_Comando);
      end;
   end;
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Close;
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Open;

   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.GotoBookMark(bmLocal);
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FreeBookMark(bmLocal);
   Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
   JvFloatEdit_NotaManual.SetFocus;
   JvFloatEdit_NotaManual.SelectAll;
end;

procedure TForm_EntradaDaNotaDoAlunoManualmente.DBNavigator_NotaManualClick(Sender: TObject; Button: TNavigateBtn);
begin
   JvFloatEdit_NotaManual.SetFocus;
   JvFloatEdit_NotaManual.SelectAll;
end;

procedure TForm_EntradaDaNotaDoAlunoManualmente.JvFloatEdit_NotaManualKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
       JvTransparentButton_GravarClick(Sender);
end;

end.
