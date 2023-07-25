unit Tratar_EstQuestao;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, StdCtrls, Mask, Rotinas,
  Buttons, ExtCtrls, IBQuery,IBTable, JvGrdCpt, JvEdit, JvGradient, JvToolEdit,
  DBCtrls, Grids, DBGrids, IBCustomDataSet, TeEngine, Series, TeeProcs,
  Chart, DbChart, JvComponent, JvxCtrls, JvShape, JvRichEd, JvDBRichEd, Graphics, PsyRichEdit,
  JvTransBtn;

type
  TForm_EstQuestao = class(TForm)
    Table_RESPOSTAALUNO: TIBTable;
    Table_RESPOSTAALUNOIDCURSO: TSmallintField;
    Table_RESPOSTAALUNOIDTURMA: TIntegerField;
    Table_RESPOSTAALUNOFASEAPLICACAO: TIBStringField;
    Table_RESPOSTAALUNOREFERENCIAAVALIACAO: TIBStringField;
    Table_RESPOSTAALUNOCODMATERIA: TIBStringField;
    Table_RESPOSTAALUNOOPCAOVETOR: TIBStringField;
    Table_RESPOSTAALUNOIDENTIDADE: TIBStringField;
    DST_RespostaAluno: TDataSource;
    IBTable_ItemTeste: TIBTable;
    IBTable_ItemTesteIDCURSO: TSmallintField;
    IBTable_ItemTesteIDTURMA: TIntegerField;
    IBTable_ItemTesteNUMITEM: TIntegerField;
    IBTable_ItemTesteFASEAPLICACAO: TIBStringField;
    IBTable_ItemTesteREFERENCIAAVALIACAO: TIBStringField;
    IBTable_ItemTesteCODMATERIA: TIBStringField;
    IBTable_ItemTesteMATERIA: TIBStringField;
    IBTable_ItemTesteNUMEROQUESTAO: TSmallintField;
    DST_ItemTeste: TDataSource;
    Panel3: TPanel;
    DBGrid_Lista: TStringGrid;
    Chart1: TChart;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    Series10: TBarSeries;
    Panel_Botoes: TPanel;
    JvGradient1: TJvGradient;
    JvShape9: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape_Copiar: TJvShape;
    JvTransparentButton_Ambos: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    Memo2: TMemo;
    JvShape2: TJvShape;
    JvTransparentButton_Lista: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton2: TJvTransparentButton;
    Label_Curso: TLabel;

    procedure Estatistica;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_AmbosClick(Sender: TObject);
    procedure JvTransparentButton_ListaClick(Sender: TObject);
    procedure JvTransparentButton2Click(Sender: TObject);
  Public
     VS_referencia,VS_CodMateria, VS_Fase: string;

     VI_NumQuestao, VI_IdCurso, VI_IdTurma: integer;
  private

  end;

var
  Form_EstQuestao: TForm_EstQuestao;

implementation

uses Module, Editor_Texto, CorrecaoProva;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form principal
//------------------------------------------------------------------------------

procedure TForm_EstQuestao.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_EstQuestao, ' Estatistica de Resposta de Prova');
   Label_Curso.Caption:= Funcoes.GetCodCurso+'  -  '+Trim(DM.IBQuery_MontaTurma.FieldByName( 'Turma').AsString)+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;

   Table_RESPOSTAALUNO.Close;
   IBTable_ItemTeste.Close;

   Table_RESPOSTAALUNO.Open;
   IBTable_ItemTeste.Open;

   VI_IdCurso:= DM.IBQuery_MontaTurma.FieldByName( 'IdCurso').AsInteger;
   VI_IdTurma:= DM.IBQuery_MontaTurma.FieldByName( 'IdTurma').AsInteger;
   VS_CodMateria:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodMateria').AsString;
   VS_Referencia:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'ReferenciaAvaliacao').AsString;
   VS_Fase:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'faseAplicacao').AsString;

   Estatistica;
   Chart1.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_EstQuestao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Table_RESPOSTAALUNO.Close;
   IBTable_ItemTeste.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para retornar
//------------------------------------------------------------------------------

procedure TForm_EstQuestao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Monta a estatistica das notas
//------------------------------------------------------------------------------

procedure TForm_EstQuestao.Estatistica;
var
   Resp_A, Resp_B, Resp_C, Resp_D, Resp_Branco: Integer;
   VI_ContAluno, VI_Cont, VI_TamOpcaoVetor, VI_QtdQuestao: integer;
   M_Ap00: array[0..100] of String;
begin
   series6.Clear;
   series7.Clear;
   series8.Clear;
   series9.Clear;
   series10.Clear;

   // Elimina possiveis respostas já existentes desta prova

   VI_TamOpcaoVetor:= 1;
   VI_QtdQuestao:= 0;
   VI_NumQuestao:= 0;

   Table_RESPOSTAALUNO.First;
   While not Table_RESPOSTAALUNO.Eof do
   begin
      VI_QtdQuestao:= VI_QtdQuestao + 1;
      if VI_TamOpcaoVetor < Length(Table_RESPOSTAALUNO.FieldByName('OpcaoVetor').AsString) then
         VI_TamOpcaoVetor:= Length(Table_RESPOSTAALUNO.FieldByName('OpcaoVetor').AsString);
      M_Ap00[VI_QtdQuestao]:= Table_RESPOSTAALUNO.FieldByName('OpcaoVetor').AsString;
      Table_RESPOSTAALUNO.Next;
   end;

   VI_TamOpcaoVetor:= VI_TamOpcaoVetor+1;
   DBGrid_Lista.RowCount:= VI_TamOpcaoVetor;

   for VI_Cont:= 1 to VI_TamOpcaoVetor do
   begin
      VI_NumQuestao:= VI_NumQuestao + 1;
      Resp_A:= 0;
      Resp_B:= 0;
      Resp_C:= 0;
      Resp_D:= 0;
      Resp_Branco:= 0;

      for VI_ContAluno:= 1 to VI_QtdQuestao do
      begin
         if Copy(M_Ap00[VI_ContAluno],VI_Cont,1) = 'A' then
            Resp_A:= Resp_A+1
         else
            if Copy(M_Ap00[VI_ContAluno],VI_Cont,1) = 'B' then
               Resp_B:= Resp_B+1
            else
               if Copy(M_Ap00[VI_ContAluno],VI_Cont,1) = 'C' then
                  Resp_C:= Resp_C+1
               else
                  if Copy(M_Ap00[VI_ContAluno],VI_Cont,1) = 'D' then
                     Resp_D:= Resp_D+1
                  else
                     if Copy(M_Ap00[VI_ContAluno],VI_Cont,1) = ' ' then
                       Resp_Branco:= Resp_Branco+1;
      end;

      DBGrid_Lista.Cells[0,0]:= 'Nº';
      DBGrid_Lista.Cells[1,0]:= 'A';
      DBGrid_Lista.Cells[2,0]:= 'B';
      DBGrid_Lista.Cells[3,0]:= 'C';
      DBGrid_Lista.Cells[4,0]:= 'D';
      DBGrid_Lista.Cells[5,0]:= 'Bco';

      DBGrid_Lista.Cells[0, VI_NumQuestao]:= FormatFloat('00', VI_NumQuestao);
      DBGrid_Lista.Cells[1, VI_NumQuestao]:= FormatFloat('000', Resp_A);
      DBGrid_Lista.Cells[2, VI_NumQuestao]:= FormatFloat('000', Resp_B);
      DBGrid_Lista.Cells[3, VI_NumQuestao]:= FormatFloat('000', Resp_C);
      DBGrid_Lista.Cells[4, VI_NumQuestao]:= FormatFloat('000', Resp_D);
      DBGrid_Lista.Cells[5, VI_NumQuestao]:= FormatFloat('000', Resp_Branco);

      if VI_Cont < VI_TamOpcaoVetor then
      begin
         series6.Add(Resp_A, FormatFloat('00', VI_NumQuestao), clTeeColor);
         series7.Add(Resp_B, '', clTeeColor);
         series8.Add(Resp_C, '', clTeeColor);
         series9.Add(Resp_D, '', clTeeColor);
         series10.Add(Resp_Branco, '', clTeeColor);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Sai do sistema e retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_EstQuestao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Mostra a lista
//------------------------------------------------------------------------------

procedure TForm_EstQuestao.JvTransparentButton_ListaClick(Sender: TObject);
begin
   DBGrid_Lista.Visible:= True;
   Chart1.Visible:= False;
end;

//------------------------------------------------------------------------------
// Mostra o Grafico
//------------------------------------------------------------------------------

procedure TForm_EstQuestao.JvTransparentButton2Click(Sender: TObject);
begin
   DBGrid_Lista.Visible:= False;
   Chart1.Visible:= True;
end;

procedure TForm_EstQuestao.JvTransparentButton_ImprimirClick(Sender: TObject);
var
   VI_Cont: Integer;

begin
   if DBGrid_Lista.Visible = True then
   begin
      Form_Editor.Text1.Clear;

      Form_Editor.Text1.SelAttributes.Size := 12;
      Form_Editor.FontDialog1.Font.Size := 12;
      Form_Editor.Text1.SelAttributes.Name:= 'Times New Roman';
      Form_Editor.Text1.Lines.Add('             COMANDO DA AERONÁUTICA');
      Form_Editor.Text1.SelAttributes.Size := 12;
      Form_Editor.FontDialog1.Font.Size := 12;
      Form_Editor.Text1.SelAttributes.Name:= 'Times New Roman';
      Form_Editor.Text1.Lines.Add('             '+DM.IBTable_Configuracao.FieldByName('Nome').AsString);
      Form_Editor.Text1.Lines.Add('');
      Form_Editor.Text1.Lines.Add('');

      Form_Editor.FontSize.Text := '11';
      Form_Editor.Text1.Font.Size:= 11;
      Form_Editor.JvFontComboBox_Font.Text := 'Courier New';
      Form_Editor.Text1.Font.Name:= 'Courier New';

      Form_Editor.Text1.Paragraph.Alignment := paLeftJustify;
      Form_Editor.Text1.Lines.Add('         Código do Curso...: '+Funcoes.GetCodCurso);
      Form_Editor.Text1.Lines.Add('         Código do Turma...: '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);
      Form_Editor.Text1.Lines.Add('         Ref. Avaliação....: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString);
      Form_Editor.Text1.Lines.Add('         Fase Aplicação....: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString);
      Form_Editor.Text1.Lines.Add('         Data Prova........: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString);
      Form_Editor.Text1.Lines.Add('         Data Relatório....: '+DateToStr(Date));
      Form_Editor.Text1.Lines.Add('');
      Form_Editor.Text1.Lines.Add('');
      Form_Editor.Text1.Lines.Add('     ------------------------------------------------');
      Form_Editor.Text1.Lines.Add('     |Número |              Alternativa             |');
      Form_Editor.Text1.Lines.Add('     |  da   |--------------------------------------|');
      Form_Editor.Text1.Lines.Add('     |Questão|   A   |   B   |   C   |   D   |Branco|');
      Form_Editor.Text1.Lines.Add('     |-------|-------|-------|-------|-------|------|');

      for VI_Cont:= 1 to VI_NumQuestao do
          Form_Editor.Text1.Lines.Add('     |  '+DBGrid_Lista.Cells[0, VI_Cont]+'   |  '+DBGrid_Lista.Cells[1, VI_Cont]+'  |  '+DBGrid_Lista.Cells[2, VI_Cont]+'  |  '+DBGrid_Lista.Cells[3, VI_Cont]+'  |  '+DBGrid_Lista.Cells[4, VI_Cont]+'  | '+DBGrid_Lista.Cells[5, VI_Cont]+'  |');

      Form_Editor.Text1.Lines.Add('     |----------------------------------------------|');
      Form_Editor.Show;
   end
   else
      if Chart1.Visible = True then
         Chart1.PrintLandscape;
end;

procedure TForm_EstQuestao.JvTransparentButton_AmbosClick(Sender: TObject);
begin
   DBGrid_Lista.Visible:= True;
   Chart1.Visible:= True;
end;


end.
