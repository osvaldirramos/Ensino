unit Sel_Relatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask, Rotinas,
  DBCtrls, ExtCtrls, JvShape, JvToolEdit, JvSpin, JvComponent, ComObj,
  JvGroupHeader, Buttons, IBTable;

type
  TForm_Relatorio = class(TForm)
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Imprimir: TToolButton;
    ToolButton_Salvar: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Panel_Turma: TPanel;
    JvShape2: TJvShape;
    Label3: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label11: TLabel;
    Label_data: TLabel;
    Label_Versao: TLabel;
    ComboBox_Turma: TComboBox;
    Label6: TLabel;
    ComboBox_Area: TComboBox;
    Label1: TLabel;
    ComboBox_Localidade: TComboBox;
    Memo1: TMemo;
    ToolButton1: TToolButton;
    IBQuery_MontaTurma: TIBQuery;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_MontaTurmaSTATUS: TIBStringField;
    IBQuery_MontaTurmaDESCRICAO: TIBStringField;
    IBQuery_MontaTurmaCODSALA: TIBStringField;
    DST_MontaTurma: TDataSource;
    Panel1: TPanel;
    JvShape1: TJvShape;
    CheckBox_instrutor: TCheckBox;
    CheckBox_Media: TCheckBox;
    CheckBox_Estagiario: TCheckBox;
    CheckBox_PossuiNS: TCheckBox;
    CheckBox_Exercicios: TCheckBox;
    JvGroupHeader1: TJvGroupHeader;
    CheckBox_Localidade: TCheckBox;
    CheckBox_Area: TCheckBox;
    CheckBox_Turma: TCheckBox;
    SpeedButton_Excel: TSpeedButton;
    IBQuery_AlunoTurma: TIBQuery;
    DSQ_AlunoTurma: TDataSource;
    IBQuery_RelacaoAlunosMedia: TIBQuery;
    IBQuery_RelacaoAlunosMediaIDCURSO: TSmallintField;
    IBQuery_RelacaoAlunosMediaIDTURMA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_FICHA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_ATCO: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_AVL: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_EXERCICIO: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_INSTRUTOR: TIBStringField;
    IBQuery_RelacaoAlunosMediaNOMECOMPLETO: TIBStringField;
    IBQuery_RelacaoAlunosMediaDATA_AVL: TDateTimeField;
    IBQuery_RelacaoAlunosMediaLOCAL: TIBStringField;
    IBQuery_RelacaoAlunosMediaMEDIA: TIBBCDField;
    IBQuery_RelacaoAlunosMediaPARECER: TBlobField;
    IBQuery_RelacaoAlunosMediaNS: TIBStringField;
    IBQuery_RelacaoAlunosMediaFICHACOMPLETA: TIBStringField;
    DSQ_RelacaoAlunosMedia: TDataSource;
    IBTable_Instrutor: TIBTable;
    IBTable_InstrutorIDENTIDADE: TIBStringField;
    IBTable_InstrutorNOME: TIBStringField;
    IBTable_InstrutorNOMEGUERRA: TIBStringField;
    IBTable_InstrutorPOSTOGRADUACAO: TIBStringField;
    IBTable_Rel_NS: TIBTable;
    IBTable_Rel_NSIDCURSO: TSmallintField;
    IBTable_Rel_NSIDTURMA: TIntegerField;
    IBTable_Rel_NSID_FICHA: TIntegerField;
    IBTable_Rel_NSID_ATCO: TIBStringField;
    IBTable_Rel_NSID_AVL: TIBStringField;
    IBTable_Rel_NSID_EXERCICIO: TIntegerField;
    IBTable_Rel_NSDESCRICAO: TIBStringField;
    DSQ_Estagiario: TDataSource;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaTURMA: TIBStringField;
    IBQuery_AlunoTurmaANO: TIBStringField;
    IBQuery_AlunoTurmaDATAINICIO: TDateTimeField;
    IBQuery_AlunoTurmaDATATERMINO: TDateTimeField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaNUMORDEM: TSmallintField;
    IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_AlunoTurmaNOME: TIBStringField;
    IBQuery_AlunoTurmaQUADROESP: TIBStringField;
    SpeedButton_Texto: TSpeedButton;
    RichEdit1: TRichEdit;
    CheckBox_Periodo: TCheckBox;
    PrintDialog1: TPrintDialog;
    IBTable_Estagiario: TIBTable;
    IBTable_EstagiarioID_ATCO: TIBStringField;
    IBTable_EstagiarioESTAGIARIO: TIBStringField;
    DST_Estagiario: TDataSource;

    procedure Abrir_Relacao;
    Function TratarArea(PS_Area: String): String;
    Function SetaCabecalho(Coluna: Integer; Texto: String; objExcel,Sheet : Variant): Integer;
    procedure Monta_ComboTurma;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure SpeedButton_ExcelClick(Sender: TObject);
    procedure SpeedButton_TextoClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_ImprimirClick(Sender: TObject);
  private
     MS_Turma: Array[1..800] of String;
  public    { Public declarations }
     VS_Opcao: String;
 end;

var
  Form_Relatorio: TForm_Relatorio;

implementation

uses Module, MenuPrincipal;

{$R *.dfm}

procedure TForm_Relatorio.FormActivate(Sender: TObject);
var
   VS_Localidade, VS_Area: String;
begin
   Monta_ComboTurma;
   Funcoes.OpenQuery(DM.Query_Executa, 'Select Distinct Turma From Turma where IdCurso = '+Funcoes.GetIdCurso+' order by Turma');

   ComboBox_Area.Items.Clear;
   ComboBox_Area.Text:= '';
   VS_Area:= '';

   ComboBox_Localidade.Items.Clear;
   ComboBox_Localidade.Text:= '';
   VS_Localidade:= '';

   DM.Query_Executa.First;
   While not DM.Query_Executa.eof do
   begin
      if Copy(VS_Area,1,3) <> Copy(DM.Query_Executa.FieldByName('Turma').AsString, 1, 3) then
      begin
         VS_Area:= TratarArea(DM.Query_Executa.FieldByName('Turma').AsString);
         if VS_Area <> '' Then
            ComboBox_Area.Items.Add(VS_Area);
      end;

      if VS_Localidade <> Copy(DM.Query_Executa.FieldByName('Turma').AsString, 4, 2) then
      begin
         if ((VS_Area <> 'TUR')and (VS_Area <> 'BDS') and (VS_Area <> 'GT ') and (VS_Area <> 'PIL') and (VS_Area <> 'TWR3')and (VS_Area <> 'TWRS') and (VS_Area <> 'COPM') and (VS_Area <> 'CGNA')) then
         begin
            VS_Localidade:= Copy(DM.Query_Executa.FieldByName('Turma').AsString, 4, 2);
            ComboBox_Localidade.Items.Add(VS_Localidade);
         end;
      end;
      DM.Query_Executa.Next;
   end;
end;

procedure TForm_Relatorio.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para Identificar a Area de Atuacao
//------------------------------------------------------------------------------

Function TForm_Relatorio.TratarArea(PS_Area: String): String;
var
   VS_Area: String;
begin
   VS_Area:= Copy(PS_Area, 1, 3);
   if ((VS_Area <> 'TUR') and (VS_Area <> 'BDS') and (VS_Area <> 'GT ')) then
   begin
      if ((VS_Area = 'TWR') or (VS_Area = 'COP') or (VS_Area = 'CGN')) then
          VS_Area:= Copy(PS_Area, 1, 4);
   end
   else
   begin
      VS_Area:= '';
   end;

   TratarArea:= VS_Area;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da Turma
//------------------------------------------------------------------------------

procedure TForm_Relatorio.ComboBox_TurmaChange(Sender: TObject);
var
   VS_Comando, VS_Turma: String;
   VI_IdTurma: Integer;
begin
   VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-'));

   if VS_Turma <> '' then
   begin
      VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
      VS_Comando:= 'Select IdCurso, IdTurma, Turma, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao, CodSala '+
                   ' from turma '+
                   ' Where IdCurso = '+Funcoes.GetIdCurso+
                   ' and IdTurma = '+MS_Turma[VI_IdTurma];
      Funcoes.ExecutaQuery(IBQuery_MontaTurma, VS_Comando);
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_Relatorio.Monta_ComboTurma;
var
   VS_Opcao, VS_Comando :String;
   VI_Indice: Integer;
begin

   //--- Tratamento da Alimentacao do Combo de selecao da Turma

   VS_Comando:= 'Select * From Turma where IdCurso = '+Funcoes.GetIdCurso;

   if DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString <> '' then
   begin
      VS_Opcao:= ' and ';
      DM.IBQuery_Login_Instrutor.First;
      While not DM.IBQuery_Login_Instrutor.eof do
      begin
         if VS_Opcao = ' and ' then
         begin
            VS_Comando:= VS_Comando+' and ( IdTurma = '+DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString;
            VS_Opcao:= ' or ';
         end
         else
         begin
            VS_Comando:= VS_Comando+' or IdTurma = '+DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString;
         end;

         DM.IBQuery_Login_Instrutor.Next;
      end;
      VS_Comando:= VS_Comando+' )';
   end;

   VS_Comando:= VS_Comando+' and Status <> '+#39+'P'+#39+' Order By DataInicio desc';

   Funcoes.OpenQuery(IBQuery_MontaTurma,VS_Comando);
   IBQuery_MontaTurma.First;

   VI_Indice:= 1;

   ComboBox_Turma.Items.Clear;
   if Trim(IBQuery_MontaTurma.FieldByName('IdTurma').AsString) = '' then
   begin
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= '-2';
   end
   else
   begin
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= 'Too';
   end;

   While not IBQuery_MontaTurma.Eof do
   begin
      if IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger <> 0 then
      begin
         //--- Verifica se possui aluno cadastrado

         VS_Comando:= 'Select count(1) as Qtd '+
                      ' from Aluno_Turmas_VIEW '+
                      ' Where IdCurso = '+IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                      ' and IdTurma = '+IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         Funcoes.OpenQuery(DM.Query_Executa,VS_Comando);

         if  DM.Query_Executa.FieldByName('Qtd').AsInteger > 0 then
         begin
            ComboBox_Turma.Items.Add( IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+IBQuery_MontaTurma.FieldByName('Descricao').AsString);
            VI_Indice:= VI_Indice + 1;
            MS_Turma[VI_Indice]:= IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         end;
      end;
      IBQuery_MontaTurma.Next;
   end;
   IBQuery_MontaTurma.First;
end;


//------------------------------------------------------------------------------
// Tratamento para montar o Relatorio no Formato do Excel
//------------------------------------------------------------------------------

Function TForm_Relatorio.SetaCabecalho(Coluna: Integer; Texto: String; objExcel,Sheet : Variant): Integer;
var
   VS_Coluna: String;
begin
   Coluna:= Coluna+1;
   case Coluna of
       1: VS_Coluna:= 'A9';
       2: VS_Coluna:= 'B9';
       3: VS_Coluna:= 'C9';
       4: VS_Coluna:= 'D9';
       5: VS_Coluna:= 'E9';
       6: VS_Coluna:= 'F9';
       7: VS_Coluna:= 'G9';
       8: VS_Coluna:= 'H9';
       9: VS_Coluna:= 'I9';
       10: VS_Coluna:= 'J9';
       11: VS_Coluna:= 'K9';
       12: VS_Coluna:= 'L9';
       13: VS_Coluna:= 'M9';
       14: VS_Coluna:= 'N9';
       15: VS_Coluna:= 'O9';
       16: VS_Coluna:= 'P9';
       17: VS_Coluna:= 'Q9';
   else
   begin
      VS_Coluna:= 'A1';
      Coluna:= Coluna-1;
   end;
   end;

   Sheet.Range[VS_Coluna] := Texto;
   SetaCabecalho:= Coluna;
end;


//------------------------------------------------------------------------------
// Tratamento para montar o Relatorio no Formato do Excel
//------------------------------------------------------------------------------

procedure TForm_Relatorio.SpeedButton_ExcelClick(Sender: TObject);
var
   objExcel,Sheet : Variant;
   VS_Area, VS_Id_Atco, cTitulo : string;
   Coluna, Linha : integer;
   C_Turma, C_Area, C_Localidade, C_Aluno, C_Instrutor, C_Media, C_Estagiario, C_PossuiNS, C_Exercicios: Integer;
begin

   IBTable_Rel_NS.Open;
   IBTable_Estagiario.Open;
   IBTable_Instrutor.Open;
   IBQuery_RelacaoAlunosMedia.Open;

   // Cria uma instancia para utilizar o Excel

   cTitulo := 'Grau Final da Turma';
   objExcel := CreateOleObject('Excel.Application');

   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

    //---
   //   Tratamento do Cabecalho do Relatorio

   // Preenchendo as Colunas
   Sheet.Range['C1'] := 'INSTITUTO DE CONTROLE DO ESPAÇO AÉREO';
   Sheet.Range['C2'] := 'DIVISÃO DE ENSINO';
   Sheet.Range['C3'] := 'SUBDIVISÃO DE AVALIAÇÃO';
   Sheet.Range['C5'] := 'RELAÇÃO DE ALUNOS';
   Sheet.Range['C7'] := 'Elaborado em: '+DateToStr(Date);

   Coluna:= 0;

   if CheckBox_Turma.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Turma', objExcel, Sheet);
      C_Turma:= Coluna;
   end;

   if CheckBox_Area.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Area', objExcel, Sheet);
      C_Area:= Coluna;
   end;

   if CheckBox_Localidade.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Localidade', objExcel, Sheet);
      C_Localidade:= Coluna;
   end;

   Coluna:= SetaCabecalho(Coluna, 'ALUNO', objExcel, Sheet);
   C_Aluno:= Coluna;

   if CheckBox_instrutor.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Instrutor', objExcel, Sheet);
      C_Instrutor:= Coluna;
   end;

   if CheckBox_Media.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Média', objExcel, Sheet);
      C_Media:= Coluna;
   end;

   if CheckBox_Estagiario.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Estágiario', objExcel, Sheet);
      C_Estagiario:= Coluna;
   end;

   if CheckBox_PossuiNS.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Possuí NS', objExcel, Sheet);
      C_PossuiNS:= Coluna;
   end;

   if CheckBox_Exercicios.State = cbChecked then
   begin
      Coluna:= SetaCabecalho(Coluna, 'Exercícios', objExcel, Sheet);
      C_Exercicios:= Coluna;
   end;

   Linha:= Linha + 11;

   Abrir_Relacao;

   VS_Id_Atco:= '';

   While not IBQuery_AlunoTurma.Eof do
   begin
      VS_Area:= TratarArea(IBQuery_AlunoTurma.FieldByName('Turma').AsString);
      if VS_Area <> '' then
      begin
         if CheckBox_Turma.State = cbChecked then
            Sheet.Cells[Linha,C_Turma] := IBQuery_AlunoTurma.FieldByName('Turma').AsString;

         if CheckBox_Area.State = cbChecked then
            Sheet.Cells[Linha,C_Area] := VS_Area;

         if CheckBox_Localidade.State = cbChecked then
            if ((VS_Area = 'TWR3') or (VS_Area = 'TWRS')) then
               Sheet.Cells[Linha,C_Localidade]:= Copy(IBQuery_AlunoTurma.FieldByName('Turma').AsString, 5, 2)
            else
               Sheet.Cells[Linha,C_Localidade]:= Copy(IBQuery_AlunoTurma.FieldByName('Turma').AsString, 4, 2);

         Sheet.Cells[Linha,C_Aluno] := IBQuery_AlunoTurma.FieldByName('Nome').AsString;

         if CheckBox_instrutor.State = cbChecked then
            Sheet.Cells[Linha,C_Instrutor] := trim(IBTable_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBTable_Instrutor.FieldByName('Nome').AsString;

         if CheckBox_Media.State = cbChecked then
            Sheet.Cells[Linha,C_Media] := IBQuery_AlunoTurma.FieldByName('NotaFinal').AsString;

         if CheckBox_Estagiario.State = cbChecked then
         begin
            if Trim(IBTable_Estagiario.FieldByName('Estagiario').AsString) = '' then
               Sheet.Cells[Linha,C_Estagiario] := 'Não'
            else
               Sheet.Cells[Linha,C_Estagiario] := 'Sim';
         end;

         if CheckBox_PossuiNS.State = cbChecked then
         begin
            if Trim(IBTable_Rel_NS.FieldByName('IdCurso').AsString) <> '' then
               Sheet.Cells[Linha,C_PossuiNS] := 'Sim'
            else
               Sheet.Cells[Linha,C_PossuiNS] := 'Não';
         end;

         if CheckBox_Exercicios.State = cbChecked then
         begin
            Coluna:= C_Exercicios;
            IBQuery_RelacaoAlunosMedia.First;
            While not IBQuery_RelacaoAlunosMedia.Eof do
            begin
               Sheet.Cells[Linha,Coluna] := Trim(Funcoes.InserirPos(IBQuery_RelacaoAlunosMedia.FieldbyName('Id_Exercicio').AsString, 4))+'= '+FormatFloat('#0.00', IBQuery_RelacaoAlunosMedia.FieldByName('Media').AsFloat);
               Coluna:= Coluna+1;

               IBQuery_RelacaoAlunosMedia.Next;
            end;

            Linha:= Linha + 1;
         end;
      end;

      IBQuery_AlunoTurma.Next;
   end;
   Sheet.Columns.AutoFit;
   ShowMEssage('Relatório Finalizado...');
end;

//------------------------------------------------------------------------------
// Tratamento da geracao do relatorio Txt
//------------------------------------------------------------------------------

procedure TForm_Relatorio.SpeedButton_TextoClick(Sender: TObject);
var
   VS_Area, VS_Id_Atco : string;
   VS_Turma, VS_Linha, VS_LTurma, VS_LATCO, VS_LInstrutor, VS_LMedia, VS_LEstagiario, VS_LPossuiNS, VS_LExercicio: String;
begin

   IBTable_Rel_NS.Open;
   IBTable_Estagiario.Open;
   IBTable_Instrutor.Open;
   IBQuery_RelacaoAlunosMedia.Open;

   // Cria uma instancia para utilizar o Excel
   RichEdit1.Lines.Clear;

   //   Tratamento do Cabecalho do Relatorio

   // Preenchendo as Colunas
   RichEdit1.Lines.Add(Funcoes.CentraStr('INSTITUTO DE CONTROLE DO ESPAÇO AÉREO', 80));
   RichEdit1.Lines.Add(Funcoes.CentraStr('DIVISÃO DE ENSINO', 80));
   RichEdit1.Lines.Add(Funcoes.CentraStr('SUBDIVISÃO DE AVALIAÇÃO', 80));
   RichEdit1.Lines.Add('');
   RichEdit1.Lines.Add(Funcoes.CentraStr('RELAÇÃO DE ALUNOS', 80));
   RichEdit1.Lines.Add('');
   RichEdit1.Lines.Add(Funcoes.CentraStr('Elaborado em: '+DateToStr(Date), 80));
   RichEdit1.Lines.Add('');
   RichEdit1.Lines.Add('');

   VS_Linha:= '';
   RichEdit1.Lines.Add(VS_Linha);

   //----------------- Tratamento do Relatorio  -----------------//

   Abrir_Relacao;
   VS_Turma:= '';
   VS_Id_Atco:= '';

   While not IBQuery_AlunoTurma.Eof do
   begin
      VS_Linha:= '';
      VS_Area:= TratarArea(IBQuery_AlunoTurma.FieldByName('Turma').AsString);
      if VS_Area <> '' then
      begin
         VS_LTurma:= '';

         if VS_Turma <> IBQuery_AlunoTurma.FieldByName('Turma').AsString then
         begin
            if CheckBox_Turma.State = cbChecked then
                VS_LTurma:= VS_LTurma+Funcoes.LeftStr(IBQuery_AlunoTurma.FieldByName('Turma').AsString, 12);

            if CheckBox_Periodo.State = cbChecked then
                VS_LTurma:= VS_LTurma+' Inicio: '+Funcoes.LeftStr(IBQuery_AlunoTurma.FieldByName('DataInicio').AsString, 11)+' Termino: '+Funcoes.LeftStr(IBQuery_AlunoTurma.FieldByName('DataTermino').AsString, 11);

            if CheckBox_Area.State = cbChecked then
               VS_LTurma:= VS_LTurma+ Funcoes.LeftStr(VS_Area, 6);

            if CheckBox_Localidade.State = cbChecked then
               if ((VS_Area = 'TWR3') or (VS_Area = 'TWRS')) then
                  VS_LTurma:= VS_LTurma+Funcoes.LeftStr(Copy(IBQuery_AlunoTurma.FieldByName('Turma').AsString, 5, 2), 5)
               else
                  VS_LTurma:= VS_LTurma+Funcoes.LeftStr(Copy(IBQuery_AlunoTurma.FieldByName('Turma').AsString, 4, 2), 5);

            VS_Turma:= IBQuery_AlunoTurma.FieldByName('Turma').AsString;

            RichEdit1.Lines.Add('_______________________________________________________________________________________________');
            RichEdit1.Lines.Add('=> '+VS_LTurma);
            RichEdit1.Lines.Add('');
         end;

         VS_LATCO:= VS_Linha+'ATCO: '+Funcoes.LeftStr(IBQuery_AlunoTurma.FieldByName('Nome').AsString, 70);
         VS_LInstrutor:= '';

        if CheckBox_instrutor.State = cbChecked then
            VS_LInstrutor:= VS_LInstrutor+'Instrutor: '+Funcoes.LeftStr(trim(IBTable_Instrutor.FieldByName('PostoGraduacao').AsString)+' '+IBTable_Instrutor.FieldByName('Nome').AsString, 70);

        VS_LMedia:= '';
        if CheckBox_Media.State = cbChecked then
            VS_LMedia:= VS_LMedia+'Média: '+Funcoes.LeftStr(IBQuery_AlunoTurma.FieldByName('NotaFinal').AsString, 7);

        VS_LEstagiario:= '';
        if CheckBox_Estagiario.State = cbChecked then
        begin
           if Trim(IBTable_Estagiario.FieldByName('Estagiario').AsString) = '' then
              VS_LEstagiario:= VS_LEstagiario+ 'Estagiario: Não    '
           else
              VS_LEstagiario:= VS_LEstagiario+ 'Estagiario: Sim    ';

        end;

        VS_LPossuiNS:= '';
        if CheckBox_PossuiNS.State = cbChecked then
        begin
            if Trim(IBTable_Rel_NS.FieldByName('IdCurso').AsString) <> '' then
               VS_LPossuiNS:= VS_LPossuiNS+ 'Possuí NS (Não Satisfatório): Sim        '
            else
               VS_LPossuiNS:= VS_LPossuiNS+'Possuí NS (Não Satisfatório): Não        ';
         end;

         VS_LExercicio:= 'Exercícios: ';
         if CheckBox_Exercicios.State = cbChecked then
         begin
            IBQuery_RelacaoAlunosMedia.First;
            While not IBQuery_RelacaoAlunosMedia.Eof do
            begin
               VS_LExercicio:= VS_LExercicio+' | '+Trim(Funcoes.InserirPos(IBQuery_RelacaoAlunosMedia.FieldbyName('Id_Exercicio').AsString, 4))+'= '+FormatFloat('#0.00', IBQuery_RelacaoAlunosMedia.FieldByName('Media').AsFloat);
               IBQuery_RelacaoAlunosMedia.Next;
            end;
         end;
      end;

      RichEdit1.Lines.Add(VS_LATCO);

      if VS_LExercicio = 'Exercícios: ' then
      begin
         RichEdit1.Lines.Add('*** Não possui Ficha de Avaliação cadastrada ***' );

      end
      else
      begin
         RichEdit1.Lines.Add(VS_LInstrutor);
         RichEdit1.Lines.Add(VS_LMedia);
         RichEdit1.Lines.Add(VS_LEstagiario);
         RichEdit1.Lines.Add(VS_LPossuiNS);
         VS_LExercicio:= VS_LExercicio+' | ';
         RichEdit1.Lines.Add(VS_LExercicio);
      end;
      RichEdit1.Lines.Add('');
      IBQuery_AlunoTurma.Next;
   end;
   ShowMEssage('Relatório Finalizado...');
end;

//------------------------------------------------------------------------------
// Tratamento da Query que trata da relacao de Turmas
//------------------------------------------------------------------------------

procedure TForm_Relatorio.Abrir_Relacao;
var
   VS_Comando : string;
begin
   //----------------- Tratamento do Relatorio  -----------------//

   VS_Comando:= ' Select Tu.IdCurso, Tu.IdTurma, Tu.Turma, Tu.Ano, Tu.DataInicio, Tu.DataTermino, '+
                ' al.Identidade, al.NumOrdem, al.IdAntiguidade, al.PostoGraduacao, al.MotivoDesligamento, al.CodigoAluno, al.NotaFinal, al.nomeCompleto As Nome, al.quadroEsp '+
                ' From turma tu, Aluno_Turmas_View  al '+
                ' Where Tu.IdCurso = '+Funcoes.GetIdCurso+
                ' and   al.idcurso = '+Funcoes.GetIdCurso+
                ' and Tu.IdTurma = Al.idturma '+
                ' and   al.MotivoDesligamento = '+#39+'a'+#39;

   if trim(ComboBox_Turma.Text) <> '' then
      VS_Comando:= VS_Comando+' and IdTurma = '+IBQuery_MontaTurma.FieldByName('IdTurma').AsString
   else
      if ((trim(ComboBox_Area.Text) <> '') or (Trim(ComboBox_Localidade.Text) <> '')) then
         VS_Comando:= VS_Comando+' and Turma Like '+#39+'%'+trim(ComboBox_Area.Text)+Trim(ComboBox_Localidade.Text)+'%'+#39;

   Funcoes.OpenQuery( IBQuery_AlunoTurma, VS_Comando+' Order By tu.Turma' );
   IBQuery_AlunoTurma.First;
end;
procedure TForm_Relatorio.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Relatorio.ToolButton_ImprimirClick(Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      RichEdit1.Print('');
end;

end.
