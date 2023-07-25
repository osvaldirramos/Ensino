unit Relatorio_Infraero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvToolEdit, Mask, ComObj, Grids, DBGrids, DB, IBCustomDataSet,
  IBQuery, IBTable, ComCtrls, ToolWin, JvGradient, ExtCtrls, Buttons,
  Rotinas, Rotinas_TrataData, JvComponent, JvTransBtn, JvShape;

type
  TForm_Relatorio_INFRAERO = class(TForm)
    IBQuery_Turmas: TIBQuery;
    DSQ_Turma: TDataSource;
    IBQuery_TurmasIDCURSO: TSmallintField;
    IBQuery_TurmasIDTURMA: TIntegerField;
    IBQuery_TurmasNOMECOMPLETO: TIBStringField;
    IBQuery_TurmasCPF: TIBStringField;
    IBQuery_TurmasIDUNIDADE: TIBStringField;
    IBQuery_TurmasDATAMATRICULA: TDateTimeField;
    IBQuery_TurmasDATADESLIGAMENTO: TDateTimeField;
    IBQuery_TurmasIDSUBUNIDADE: TIBStringField;
    IBQuery_TurmasNOTAFINAL: TIBBCDField;
    IBQuery_TurmasIDENTIDADE: TIBStringField;
    JvGradient3: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton_RelExcel: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit_RelatorioN: TMaskEdit;
    JvDateEdit_DataInicio: TJvDateEdit;
    ComboBox_Mes: TComboBox;
    ComboBox_Ano: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox_Dia1: TCheckBox;
    CheckBox_Dia2: TCheckBox;
    CheckBox_Dia3: TCheckBox;
    CheckBox_Dia4: TCheckBox;
    CheckBox_Dia5: TCheckBox;
    CheckBox_Dia6: TCheckBox;
    CheckBox_Dia7: TCheckBox;
    CheckBox_Dia8: TCheckBox;
    CheckBox_Dia9: TCheckBox;
    CheckBox_Dia10: TCheckBox;
    CheckBox_Dia11: TCheckBox;
    CheckBox_Dia12: TCheckBox;
    CheckBox_Dia13: TCheckBox;
    CheckBox_Dia14: TCheckBox;
    CheckBox_Dia15: TCheckBox;
    CheckBox_Dia16: TCheckBox;
    CheckBox_Dia17: TCheckBox;
    CheckBox_Dia18: TCheckBox;
    CheckBox_Dia19: TCheckBox;
    CheckBox_Dia20: TCheckBox;
    CheckBox_Dia30: TCheckBox;
    CheckBox_Dia29: TCheckBox;
    CheckBox_Dia28: TCheckBox;
    CheckBox_Dia27: TCheckBox;
    CheckBox_Dia26: TCheckBox;
    CheckBox_Dia25: TCheckBox;
    CheckBox_Dia24: TCheckBox;
    CheckBox_Dia23: TCheckBox;
    CheckBox_Dia22: TCheckBox;
    CheckBox_Dia21: TCheckBox;
    CheckBox_Dia31: TCheckBox;
    DBGrid_RegistrodeRelatroios: TDBGrid;
    Panel_GravaAlteracaoConvenio: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton_Apagar: TSpeedButton;
    SpeedButton_Cancelar: TSpeedButton;
    IBTable_Curso: TIBTable;
    IBTable_CursoIDCURSO: TSmallintField;
    IBTable_CursoCODCURSO: TIBStringField;
    IBTable_CursoNOMECURSO: TIBStringField;
    IBTable_CursoDESCRICAO: TIBStringField;
    IBTable_CursoTIPO: TIBStringField;
    IBTable_CursoTOTALEXAMESTEORICOS: TSmallintField;
    IBTable_CursoTOTALEXAMESPRATICOS: TSmallintField;
    IBTable_CursoNUMEROSEMANAAULAS: TSmallintField;
    IBTable_CursoPESOMP: TIBStringField;
    IBTable_CursoGRAVA_APC: TIBStringField;
    IBTable_CursoQUARENTENA: TIntegerField;
    IBTable_CursoNUMERO_IDEAL_ITENS: TIntegerField;
    IBTable_CursoSEM_MEDIA: TIBStringField;
    IBTable_CursoVALOR: TFloatField;
    DST_Curso: TDataSource;
    IBTable_Telefone: TIBTable;
    IBTable_TelefoneIDENTIDADE: TIBStringField;
    IBTable_TelefoneCELULAR1: TIBStringField;
    IBTable_TelefoneTEL_RESIDENCIAL: TIBStringField;
    IBTable_TelefoneTEL_CONTATO: TIBStringField;
    IBTable_TelefoneTEL_COMERCIAL: TIBStringField;
    IBTable_TelefoneCELULAR: TIBStringField;
    IBTable_TelefoneFAX: TIBStringField;
    DataSource1: TDataSource;
    IBTable_Turma: TIBTable;
    IBTable_TurmaIDCURSO: TSmallintField;
    IBTable_TurmaIDTURMA: TIntegerField;
    IBTable_TurmaTURMA: TIBStringField;
    IBTable_TurmaANO: TIBStringField;
    IBTable_TurmaDATAINICIO: TDateTimeField;
    IBTable_TurmaDATATERMINO: TDateTimeField;
    IBTable_TurmaRADIO: TIBStringField;
    IBTable_TurmaCOORDENADOR: TIBStringField;
    IBTable_TurmaDURACAO: TIntegerField;
    IBTable_TurmaSTATUS: TIBStringField;
    IBTable_TurmaCOD: TIntegerField;
    DataSource2: TDataSource;
    IBTable_ConvenioINFRAERO: TIBTable;
    IBTable_ConvenioINFRAERONUMERO_RELATORIO: TIntegerField;
    IBTable_ConvenioINFRAEROANO: TIBStringField;
    IBTable_ConvenioINFRAEROMES: TIBStringField;
    IBTable_ConvenioINFRAEROVALOR_MENSAL: TFloatField;
    IBTable_ConvenioINFRAEROVALOR_PAGO: TFloatField;
    DST_ConvenioINFRAERO: TDataSource;

    Function CalculaDiasUteisAluno(wDataInicio : TDate; wDataFim: TDate): Integer;
    procedure CalculaDiasUteis(wDataInicio : TDate; wDataFim: TDate);

    procedure MontarRelatorio_Inicio;
    procedure MontarRelatorio_Aluno(VS_Inicio, VS_Termino: String; CorCurso: TColor);
    procedure MontarRelatorio_Termino;

    Procedure Borda_Colunas(Sheet: Variant; Col_1: string; Col_2: String);
    Procedure TrataCelulas(Sheet: Variant; Col_1: string; Col_2: String; Font: String; Tamanho: Integer; Tipo: Boolean; CorFonte: TColor; CorInterior: TColor);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox_MesChange(Sender: TObject);
    procedure DBGrid_RegistrodeRelatroiosCellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton_ApagarClick(Sender: TObject);
    procedure SpeedButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RelExcelClick(Sender: TObject);
  private    { Private declarations }
      objExcel,Sheet : Variant;
      VS_DataInicial, VS_DataTermino, Titulo, Col_1, Col_2 : string;
      VS_ListaCursos, VS_InicioMes, VS_TerminoMes: String;

      VI_ContFolha, VI_ContCurso, VI_Cont, L : integer;
      VR_ValorTotal: Real;
  public
    { Public declarations }
  end;

var
  Form_Relatorio_INFRAERO: TForm_Relatorio_INFRAERO;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Relatorio_INFRAERO.FormActivate(Sender: TObject);
begin
   Panel_GravaAlteracaoConvenio.Visible:= False;

   IBTable_Curso.Open;
   IBTable_Telefone.Open;
   IBTable_Turma.Open;
   IBTable_ConvenioINFRAERO.Open;
   IBTable_ConvenioINFRAERO.Last;
   MaskEdit_RelatorioN.Text:= IntToStr(IBTable_ConvenioINFRAERO.FieldByName('Numero_Relatorio').AsInteger+1);

   ComboBox_Ano.Text:= Funcoes_TrataData.AnoAtual;
   ComboBox_Mes.Text:= Funcoes_TrataData.Mes_Extenso(Funcoes_TrataData.MesAtual, 1);
   ComboBox_MesChange(Sender);
end;

procedure TForm_Relatorio_INFRAERO.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_Relatorio_INFRAERO.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Menu Principal
//------------------------------------------------------------------------------

procedure TForm_Relatorio_INFRAERO.JvTransparentButton_RelExcelClick(Sender: TObject);
var
   VI_IdCurso, VI_DefineCor: Integer;
   CorCurso: TColor;
begin
   IBTable_Curso.Open;
   IBTable_Telefone.Open;

   //--- Coletar o inicio e termino do mes


   MontarRelatorio_Inicio;

   VS_ListaCursos:= '';
   L:= 5;
   VR_ValorTotal:= 0;
   VI_Cont:= 0;
   VI_ContFolha:= 1;
   VI_IdCurso:= 0;
   VI_DefineCor:= 0;
   VI_ContCurso:= 0;

   Funcoes.ExecutaQuery(IBQuery_Turmas, 'Select distinct IdCurso, IdTurma, Identidade, NomeCompleto, CPF, IdUnidade, IdSubUnidade, DataMatricula, DataDesligamento, NotaFinal '+
                                        ' From Aluno_Turmas_View '+
                                        ' Where IdUnidade = '+#39+'INFRAERO'+#39+
                                        ' and   IdCurso <> 139 '+
                                        ' and   DataDesligamento >= '+#39+Funcoes.DePara( VS_InicioMes, '/', '.')+#39+
                                        ' and   DataMatricula  <= '+#39+Funcoes.DePara( VS_TerminoMes, '/', '.')+#39+
                                        ' Order By IdCurso, Nome collate PXW_INTL850'
                        );

   IBQuery_Turmas.First;
   While not IBQuery_Turmas.Eof do
   begin
      if IBTable_Turma.FieldByName('Radio').AsString <> 'PARA FINS DE AVALIAÇÃO' then
      begin
         if VI_IdCurso <> IBQuery_Turmas.FieldByName('IdCurso').AsInteger then
         begin
            VI_ContCurso:= VI_ContCurso + 1;
            VS_ListaCursos:= VS_ListaCursos+IBTable_Curso.FieldByName('CodCurso').AsString+', ';

            VI_IdCurso:= IBQuery_Turmas.FieldByName('IdCurso').AsInteger;
            VI_DefineCor:= VI_DefineCor+1;
            case VI_DefineCor of
               1: CorCurso:= $00F27900;
               2: CorCurso:= CLMaroon;
               3: CorCurso:= CLGreen;
               4: CorCurso:= CLRed;
               5: CorCurso:= CLTeal;
               6: CorCurso:= CLOlive;
               else
                  begin
                     CorCurso:= $00F27900;
                     VI_DefineCor:= 1;
                  end;
            end;
         end;

         VI_Cont:= VI_Cont+1;
         if ((VI_Cont = 33) or (VI_Cont = 71) or (VI_Cont = 109) or (VI_Cont = 147) or (VI_Cont = 147)) then
            VI_ContFolha:= VI_ContFolha + 1;

         if IBQuery_Turmas.FieldByName('DataMatricula').AsDateTime >  StrToDate(VS_InicioMes) Then
            VS_DataInicial:= IBQuery_Turmas.FieldByName('DataMatricula').AsString
         else
            VS_DataInicial:= VS_InicioMes;

         if IBQuery_Turmas.FieldByName('DataDesligamento').AsDateTime <  StrToDate(VS_TerminoMes) Then
            VS_DataTermino:= IBQuery_Turmas.FieldByName('DataDesligamento').AsString
         else
           VS_DataTermino:= VS_TerminoMes;

         MontarRelatorio_Aluno(VS_DataInicial, VS_DataTermino, CorCurso);
      end;
      IBQuery_Turmas.Next;
   end;

   MontarRelatorio_Termino;
//   Sheet.WorkBooks[1].SaveAs('c:\Controle.xls');
end;


//------------------------------------------------------------------------------
// Tratamento do Relatorio do
//------------------------------------------------------------------------------

procedure TForm_Relatorio_INFRAERO.MontarRelatorio_Aluno(VS_Inicio, VS_Termino: String; CorCurso: TColor);
var
   VI_DiasUteis: Integer;
begin
   //--- Linha 05 Dados
   // Inicia While
   L:= L+1;

   Col_1:= 'A'+IntToStr(L);
   Col_2:= 'K'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas

   Col_1:= 'A'+IntToStr(L);
   Col_2:= 'A'+IntToStr(L);

   Sheet.Range[Col_1,Col_2].HorizontalAlignment := 3; // 3=Center - 4=Right
   Sheet.Range[Col_1,Col_2 ].RowHeight := 15;

   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, False, CorCurso, clWhite);
   Sheet.Cells[L,1] := IBTable_Curso.FieldByName('CodCurso').AsString;

   Col_1:= 'B'+IntToStr(L);
   Col_2:= 'F'+IntToStr(L);

   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, False, clBlack, clWhite);
   Sheet.Cells[L,2] := IBQuery_Turmas.FieldByName('NomeCompleto').AsString;

   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'F'+IntToStr(L);
   Sheet.Range[Col_1,Col_2].HorizontalAlignment := 3; // 3=Center - 4=Right
   Sheet.Cells[L,3] := IBQuery_Turmas.FieldByName('CPF').AsString;
   Sheet.Cells[L,4] := IBQuery_Turmas.FieldByName('IdSubUnidade').AsString;

   if Trim(IBTable_Telefone.FieldByName('TEL_RESIDENCIAL').AsString) <> '' Then
      Sheet.Cells[L,5] := IBTable_Telefone.FieldByName('TEL_RESIDENCIAL').AsString
   else
      if Trim(IBTable_Telefone.FieldByName('CELULAR').AsString) <> '' Then
         Sheet.Cells[L,5] := IBTable_Telefone.FieldByName('CELULAR').AsString
      else
         if Trim(IBTable_Telefone.FieldByName('CELULAR1').AsString) <> '' Then
            Sheet.Cells[L,5] := IBTable_Telefone.FieldByName('CELULAR1').AsString
         else
            if Trim(IBTable_Telefone.FieldByName('FAX').AsString) <> '' Then
               Sheet.Cells[L,5] := IBTable_Telefone.FieldByName('FAX').AsString
            else
               if Trim(IBTable_Telefone.FieldByName('TEL_CONTATO').AsString) <> '' Then
                  Sheet.Cells[L,5] := IBTable_Telefone.FieldByName('TEL_CONTATO').AsString
               else
                  if Trim(IBTable_Telefone.FieldByName('TEL_COMERCIAL').AsString) <> '' Then
                     Sheet.Cells[L,5] := IBTable_Telefone.FieldByName('TEL_COMERCIAL').AsString;

   Sheet.Cells[L,6] := '160';

   Col_1:= 'G'+IntToStr(L);
   Col_2:= 'I'+IntToStr(L);
   Sheet.Range[Col_1,Col_2].HorizontalAlignment := 3; // 3=Center - 4=Right

   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, False, clRed, clWhite);
   Sheet.Cells[L,7] := Copy(VS_DataInicial, 1, 5)+' à '+Copy(VS_DataTermino, 1, 5);

   if IBTable_Turma.FieldByName('Status').AsString = 'E'then
       Sheet.Cells[L,8] := FormatFloat('#0.00', IBQuery_Turmas.FieldByName('NotaFinal').AsFloat);

   //--- Calculo dos dias de aula
   VI_DiasUteis:= CalculaDiasUteisAluno(StrToDate(VS_Inicio), StrToDate(VS_Termino));
   Sheet.Cells[L,9] := VI_DiasUteis;

   Col_1:= 'J'+IntToStr(L);
   Col_2:= 'K'+IntToStr(L);
   Sheet.Range[Col_1,Col_2].HorizontalAlignment := 3; // 3=Center - 4=Right
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, False, clBlack, clWhite);

   Sheet.Cells[L,10] := FormatFloat('###0.00', IBTable_Curso.FieldByName('Valor').AsFloat);
   Sheet.Cells[L,11] := FormatFloat('####0.00', IBTable_Curso.FieldByName('Valor').AsFloat*VI_DiasUteis);
   VR_ValorTotal:= VR_ValorTotal+IBTable_Curso.FieldByName('Valor').AsFloat*VI_DiasUteis;
end;

//------------------------------------------------------------------------------
// Tratamento do Relatorio do
//------------------------------------------------------------------------------

procedure TForm_Relatorio_INFRAERO.MontarRelatorio_Termino;
var
   i: integer;
   L_SaldoRemanescente, L_VPendente, L_VToatlPagoP, Valor_Mensal, Valor_Pago: Real;
   VS_Comando: String;
begin
      // Tratamento do VALOR FINAL

      L:= L+1;
      Col_1:= 'A'+IntToStr(L);
      Col_2:= 'K'+IntToStr(L);

      Sheet.Range[Col_1,Col_2].HorizontalAlignment := 3; // 3=Center - 4=Right
      Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
      TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 16, True, clBlack, clWhite);
      Sheet.Cells[L,10] := 'VALOR FINAL';
      Sheet.Cells[L,11] := FormatFloat('######0.00', VR_ValorTotal);

      // Tratamento do "Quantidade de pessoas capacitadas"

      L:= L+1;
      Col_1:= 'A'+IntToStr(L);
      Col_2:= 'K'+IntToStr(L);
      Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
      TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 20, True, clBlack, clWhite);
      Sheet.Cells[L,1] := 'Quantidade de pessoas capacitadas';
      Sheet.Range[Col_2,Col_2].HorizontalAlignment := 3; // 3=Center - 4=Right
      Sheet.Cells[L,3] := IntToStr(VI_Cont);

      // Tratamento do "Observações"

      // Finalizar o relatorio

      L:= L+1;
      Col_1:= 'L'+IntToStr(L);
      Col_2:= 'L'+IntToStr(L);

      TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
      Sheet.Cells[L,12] := 'FL.1/'+IntToStr(VI_ContFolha+1);;

      L:= L+1;
      Col_1:= 'A'+IntToStr(L);
      Col_2:= 'K'+IntToStr(L);

      TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 20, True, clBlack, clWhite);
      Sheet.Cells[L,1] := 'Observações: ';

      L:= L+1;
      Col_1:= 'A'+IntToStr(L);
      Col_2:= 'K'+IntToStr(L);

      TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 20, True, clBlack, clWhite);
      Sheet.Cells[L,1] := '1) Todos os cursos listados neste Relatório estão compatíveis com o Plano de Trabalho do presente Convênio. ';

      if VI_ContCurso > 1 then
      begin
         L:= L+1;
         Col_1:= 'A'+IntToStr(L);
         Col_2:= 'K'+IntToStr(L);

         TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 20, True, clBlack, clWhite);
         Sheet.Cells[L,1] := '2) Foram concluídos no mês corrente os cursos '+Copy(VS_ListaCursos, 1, Length(VS_ListaCursos)-2)+'.';
      end;

   for i:= 1 to VI_ContFolha do
   begin
      Col_1:= 'J'+IntToStr(L);
      Col_2:= 'K'+IntToStr(L);
      Sheet.Range[Col_1,Col_2].HorizontalAlignment := 3; // 3=Center - 4=Right
      TrataCelulas(Sheet, 'N3', 'N3', 'Arial', 12, False, clBlack, clWhite);
     case i of
        1:    Sheet.Cells[3,12]:= 'FL.1/'+IntToStr(VI_ContFolha+1);
        2:    Sheet.Cells[37,12]:= 'FL.2/'+IntToStr(VI_ContFolha+1);
        3:    Sheet.Cells[74,12]:= 'FL.3/'+IntToStr(VI_ContFolha+1);
        4:    Sheet.Cells[112,12]:= 'FL.4/'+IntToStr(VI_ContFolha+1);
     end;
   end;

   L:= L+2;
   Col_1:= 'A'+IntToStr(L);
   Col_2:= 'K'+IntToStr(L);

   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := 'CONTINUAÇÃO DO RELATÓRIO Nº '+MaskEdit_RelatorioN.Text+', de '+JvDateEdit_DataInicio.Text;

   L:= L+3;
   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'E'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := '(A)';
   Sheet.Cells[L,4] := 'VALOR DO CONVÊNIO';
   Sheet.Cells[L,5] := 29588275.85;

   L:= L+1;
   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'E'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := '(B)';
   Sheet.Cells[L,4] := 'VALOR TOTAL PAGO';
   L_VToatlPagoP:= L;

   L:= L+1;
   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'E'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := '(C)';
   Sheet.Cells[L,4] := 'VALOR PENDENTE';
   L_VPendente:= L;

   L:= L+1;
   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'E'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := '(A)-(B)';
   Sheet.Cells[L,4] := 'SALDO REMANESCENTE';
   L_SaldoRemanescente:= L;

   L:= L+2;
   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'E'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := 'REFERÊNCIA';
   Sheet.Cells[L,4] := 'VALOR MENSAL DEVIDO';
   Sheet.Cells[L,5] := 'VALOR PAGO';

   Valor_Mensal:= 0;
   Valor_Pago:= 0;

   IBTable_ConvenioINFRAERO.First;
   While not IBTable_ConvenioINFRAERO.Eof do
   begin
      L:= L+1;
      Col_1:= 'C'+IntToStr(L);
      Col_2:= 'E'+IntToStr(L);

      Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
      TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
      Sheet.Cells[L,3] := IBTable_ConvenioINFRAERO.FieldByName('mes').AsString+' - '+IBTable_ConvenioINFRAERO.FieldByName('Ano').AsString;
      Sheet.Cells[L,4] := IBTable_ConvenioINFRAERO.FieldByName('Valor_Mensal').AsFloat;
      Sheet.Cells[L,5] := IBTable_ConvenioINFRAERO.FieldByName('Valor_Pago').AsFloat;

      Valor_Mensal:= Valor_Mensal+IBTable_ConvenioINFRAERO.FieldByName('Valor_Mensal').AsFloat;
      Valor_Pago:= Valor_Pago+IBTable_ConvenioINFRAERO.FieldByName('Valor_Pago').AsFloat;

      IBTable_ConvenioINFRAERO.Next;
   end;

   L:= L+1;
   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'E'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := 'VALOR TOTAL DEVIDO';
   Sheet.Cells[L,4] := Valor_Mensal;

   L:= L+1;
   Col_1:= 'C'+IntToStr(L);
   Col_2:= 'E'+IntToStr(L);

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3] := 'VALOR TOTAL PAGO';
   Sheet.Cells[L,4] := Valor_Pago;

   Borda_Colunas(Sheet, Col_1,Col_2);   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, Col_1, Col_2, 'Arial', 12, True, clBlack, clWhite);
   Sheet.Cells[L,3]:= 'VALOR PENDENTE';
   Sheet.Cells[L,4]:= Valor_Mensal-Valor_Pago;

   Sheet.Cells[L_VToatlPagoP,5]:= Valor_Pago;
   Sheet.Cells[L_VPendente,5]:= Valor_Mensal-Valor_Pago;
   Sheet.Cells[L_SaldoRemanescente,5]:= Valor_Pago-( Valor_Mensal-Valor_Pago );

   VS_Comando:= ' Select count(1) as Qtd From ConvenioInfraero where Numero_Relatorio = ' + MaskEdit_RelatorioN.Text;
   Funcoes.OpenQuery(VS_Comando);
   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then
       IBTable_ConvenioINFRAERO.Append
   else
       IBTable_ConvenioINFRAERO.Edit;

    IBTable_ConvenioINFRAERO.FieldByName('NUMERO_RELATORIO').AsString:= MaskEdit_RelatorioN.Text;
    IBTable_ConvenioINFRAERO.FieldByName('ANO').AsString:= UpperCase(ComboBox_Ano.Text);
    IBTable_ConvenioINFRAERO.FieldByName('MES').AsString:= UpperCase(ComboBox_Mes.Text);
    IBTable_ConvenioINFRAERO.FieldByName('VALOR_MENSAL').AsFloat:= VR_ValorTotal;
    IBTable_ConvenioINFRAERO.FieldByName('VALOR_PAGO').AsFloat:= 0.00;
    IBTable_ConvenioINFRAERO.Post;
   Funcoes.ExecutaTransacao;

end;

//------------------------------------------------------------------------------
// Tratamento do Relatorio do
//------------------------------------------------------------------------------

procedure TForm_Relatorio_INFRAERO.MontarRelatorio_Inicio;
begin
   Titulo := 'Cadastro de Alunos';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := Titulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := Titulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[Titulo];

   //--- Linha 02 - Cabecalho Relatorio N

   Sheet.Range['A2' ].ColumnWidth := 60;
   Sheet.Range['A2', 'A2'].HorizontalAlignment := 2; // 3=Center - 4=Right

   Borda_Colunas(Sheet, 'A2', 'K2');   // Adiciona Borda nas Colunas
   TrataCelulas(Sheet, 'A2', 'K2', 'Arial', 18, True, clRed, clSilver);
   Sheet.Cells[2,1] := '             RELATÓRIO Nº '+MaskEdit_RelatorioN.Text+', de '+JvDateEdit_DataInicio.Text+'                   ';

   TrataCelulas(Sheet, 'C2', 'K2', 'Arial', 18, True, clBlack, clSilver);
   Sheet.Cells[2,3] := '                          CONVÊNIO Nº 001/INFRAERO-ICEA-DECEA/2014   -   Nº INFRAERO: CV 0006/2014/0001';
   Sheet.Cells[2,10] := 'TERMO ORIGINAL';

   //--- Linha 03

   TrataCelulas(Sheet, 'A3', 'K3', 'Arial', 22, True, clRed, clWhite);
   Sheet.Range['A3', 'K3'].RowHeight := 25;
   Sheet.Range['A3', 'K3'].VerticalAlignment := 2; // 1=Top - 2=Center - 3=Bottom
   Sheet.Cells[3,3] := 'DADOS DA CAPACITAÇÃO OFERECIDA – JANEIRO DE 2015';

   //--- Linha 04

   Sheet.Range['A4', 'K4'].VerticalAlignment := 2; // Alinhando as Células - 1=Top - 2=Center - 3=Bottom
   Sheet.Range['A4', 'K4'].HorizontalAlignment := 3; // 3=Center - 4=Right
   Borda_Colunas(Sheet, 'A4', 'K4');   // Adiciona Borda nas Colunas

   TrataCelulas(Sheet, 'A4','K4', 'Arial', 16, True, clBlack, $00B6FEB4);
   Sheet.Range['A4','C4' ].RowHeight := 70;

   Sheet.Range['A4' ].ColumnWidth := 15;
   Sheet.Cells[4,1] := 'Cód. do Curso';

   Sheet.Range['B4' ].ColumnWidth := 100;
   Sheet.Cells[4,2] := 'Nome do aluno(a)';

   Sheet.Range['C4' ].ColumnWidth := 30;
   Sheet.Cells[4,3] := 'Matrícula da INFRAERO ou CPF';

   Sheet.Range['D4' ].ColumnWidth := 30;
   Sheet.Cells[4,4] := 'Lotação';

   Sheet.Range['E4' ].ColumnWidth := 25;
   Sheet.Cells[4,5] := 'Telefone';

   Sheet.Range['F4' ].ColumnWidth := 25;
   Sheet.Cells[4,6] := 'Carga '+#13+'horária (h)';

   Sheet.Range['G4' ].ColumnWidth := 25;
   Sheet.Cells[4,7] := 'Período do curso';

   Sheet.Range['H4' ].ColumnWidth := 25;
   Sheet.Cells[4,8] := 'Média final (curso concluído)';

   Sheet.Range['I4' ].ColumnWidth := 25;
   Sheet.Cells[4,9] := 'Nº Dias';

   Sheet.Range['J4' ].ColumnWidth := 25;
   Sheet.Cells[4,10] := 'V. unit.';

   Sheet.Range['K4' ].ColumnWidth := 25;
   Sheet.Cells[4,11] := 'V. total';
end;

//------------------------------------------------------------------------------
// Tratamento da configuração da linha do excel
//------------------------------------------------------------------------------

Procedure TForm_Relatorio_INFRAERO.TrataCelulas(Sheet: Variant; Col_1: string; Col_2: String; Font: String; Tamanho: Integer; Tipo: Boolean; CorFonte: TColor; CorInterior: TColor);
begin
   Sheet.Range[Col_1,Col_2].Font.Name:= Font;                  // Fonte
   Sheet.Range[Col_1,Col_2].Font.Size:= Tamanho;              // Tamanho da Fonte
   Sheet.Range[Col_1,Col_2].Font.Bold:= Tipo;                // Negrito
   Sheet.Range[Col_1,Col_2].Font.Color:= CorFonte;          // Cor da Fonte
   Sheet.Range[Col_1,Col_2].Interior.Color:= CorInterior;  // Cor da Célula
end;

//------------------------------------------------------------------------------
// Adiciona Grade nas Colunas
//------------------------------------------------------------------------------

Procedure TForm_Relatorio_INFRAERO.Borda_Colunas(Sheet: Variant; Col_1: string; Col_2: String);
Begin
   Sheet.Range[Col_1,Col_2].Borders.LineStyle := 1;
   Sheet.Range[Col_1,Col_2].Borders.Weight := 2;
   Sheet.Range[Col_1,Col_2].Borders.ColorIndex := 1;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para verificar quantidade de dias de aula por aluno
// Data     : 26/02/2015
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function TForm_Relatorio_INFRAERO.CalculaDiasUteisAluno(wDataInicio : TDate; wDataFim: TDate): Integer;
var
   VI_DiaInicial, VI_DiaFinal, wQtde : Integer;
   VS_Data: string;
   Ano, Mes, Dia : word;
begin
  DecodeDate (wDataInicio, Ano, Mes, Dia);
   VI_DiaInicial:= Dia;

  DecodeDate (wDataFim, Ano, Mes, Dia);
   VI_DiaFinal:= Dia;

   wQtde:= 0;
   VS_Data:= DateToStr(wDataInicio)+'  -   '+DateToStr(wDataFim);
   while VI_DiaInicial <= VI_DiaFinal do
   begin
      case VI_DiaInicial of
         1: if CheckBox_Dia1.State = cbChecked then
                wQtde := wQtde + 1;

         2: if CheckBox_Dia2.State = cbChecked then
                wQtde := wQtde + 1;

         3: if CheckBox_Dia3.State = cbChecked then
                wQtde := wQtde + 1;

         4: if CheckBox_Dia4.State = cbChecked then
                wQtde := wQtde + 1;

         5: if CheckBox_Dia5.State = cbChecked then
                wQtde := wQtde + 1;

         6: if CheckBox_Dia6.State = cbChecked then
                wQtde := wQtde + 1;

         7: if CheckBox_Dia7.State = cbChecked then
                wQtde := wQtde + 1;

         8: if CheckBox_Dia8.State = cbChecked then
                wQtde := wQtde + 1;

         9: if CheckBox_Dia9.State = cbChecked then
                wQtde := wQtde + 1;

         10: if CheckBox_Dia10.State = cbChecked then
                wQtde := wQtde + 1;

         11: if CheckBox_Dia11.State = cbChecked then
                wQtde := wQtde + 1;

         12: if CheckBox_Dia12.State = cbChecked then
                wQtde := wQtde + 1;

         13: if CheckBox_Dia13.State = cbChecked then
                wQtde := wQtde + 1;

         14: if CheckBox_Dia14.State = cbChecked then
                wQtde := wQtde + 1;

         15: if CheckBox_Dia15.State = cbChecked then
                wQtde := wQtde + 1;

         16: if CheckBox_Dia16.State = cbChecked then
                wQtde := wQtde + 1;

         17: if CheckBox_Dia17.State = cbChecked then
                wQtde := wQtde + 1;

         18: if CheckBox_Dia18.State = cbChecked then
                wQtde := wQtde + 1;

         19: if CheckBox_Dia19.State = cbChecked then
                wQtde := wQtde + 1;

         20: if CheckBox_Dia20.State = cbChecked then
                wQtde := wQtde + 1;

         21: if CheckBox_Dia21.State = cbChecked then
                wQtde := wQtde + 1;

         22: if CheckBox_Dia22.State = cbChecked then
                wQtde := wQtde + 1;

         23: if CheckBox_Dia23.State = cbChecked then
                wQtde := wQtde + 1;

         24: if CheckBox_Dia24.State = cbChecked then
                wQtde := wQtde + 1;

         25: if CheckBox_Dia25.State = cbChecked then
                wQtde := wQtde + 1;

         26: if CheckBox_Dia26.State = cbChecked then
                wQtde := wQtde + 1;

         27: if CheckBox_Dia27.State = cbChecked then
                wQtde := wQtde + 1;

         28: if CheckBox_Dia28.State = cbChecked then
                wQtde := wQtde + 1;

         29: if CheckBox_Dia29.State = cbChecked then
                wQtde := wQtde + 1;

         30: if CheckBox_Dia30.State = cbChecked then
                wQtde := wQtde + 1;

         31: if CheckBox_Dia31.State = cbChecked then
                wQtde := wQtde + 1;
      end;
      VI_DiaInicial := VI_DiaInicial + 1;
   end;
   Result := wQtde;
end;

//------------------------------------------------------------------------------
// Descricao: PFuncao para Calcular os Dias Uteis
// Data     : 26/02/2015
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure TForm_Relatorio_INFRAERO.CalculaDiasUteis(wDataInicio : TDate; wDataFim: TDate);
var
   VS_Comando: String;
   VI_Dia : Integer;
begin
   CheckBox_Dia1.State:= cbUnChecked;
   CheckBox_Dia2.State:= cbUnChecked;
   CheckBox_Dia3.State:= cbUnChecked;
   CheckBox_Dia4.State:= cbUnChecked;
   CheckBox_Dia5.State:= cbUnChecked;
   CheckBox_Dia6.State:= cbUnChecked;
   CheckBox_Dia7.State:= cbUnChecked;
   CheckBox_Dia8.State:= cbUnChecked;
   CheckBox_Dia9.State:= cbUnChecked;
   CheckBox_Dia10.State:= cbUnChecked;

   CheckBox_Dia11.State:= cbUnChecked;
   CheckBox_Dia12.State:= cbUnChecked;
   CheckBox_Dia13.State:= cbUnChecked;
   CheckBox_Dia14.State:= cbUnChecked;
   CheckBox_Dia15.State:= cbUnChecked;
   CheckBox_Dia16.State:= cbUnChecked;
   CheckBox_Dia17.State:= cbUnChecked;
   CheckBox_Dia18.State:= cbUnChecked;
   CheckBox_Dia19.State:= cbUnChecked;
   CheckBox_Dia20.State:= cbUnChecked;

   CheckBox_Dia21.State:= cbUnChecked;
   CheckBox_Dia22.State:= cbUnChecked;
   CheckBox_Dia23.State:= cbUnChecked;
   CheckBox_Dia24.State:= cbUnChecked;
   CheckBox_Dia25.State:= cbUnChecked;
   CheckBox_Dia26.State:= cbUnChecked;
   CheckBox_Dia27.State:= cbUnChecked;
   CheckBox_Dia28.State:= cbUnChecked;
   CheckBox_Dia29.State:= cbUnChecked;
   CheckBox_Dia30.State:= cbUnChecked;

   CheckBox_Dia31.State:= cbUnChecked;

   VI_Dia:= 0;
   while wDataInicio <= wDataFim do
   begin
       VI_Dia:= VI_Dia+1;

      if ((DayOfWeek(wDataInicio) <> 1) and (DayOfWeek(wDataInicio) <> 7)) then
      begin
         // VERIFICA SE NAO É FERIADO
         VS_Comando:= 'Select Data From Cad_Feriados where Data = '+#39+FormatDateTime('DD.MM.YYYY',wDataInicio)+' 00:00'+#39;
         DM.IBQuery_Executa.Close;
         DM.IBQuery_Executa.SQL.Clear;
         DM.IBQuery_Executa.SQL.Add(VS_Comando);
         DM.IBQuery_Executa.Open;
         if Trim(DM.IBQuery_Executa.FieldByName('data').AsString) = '' then
         begin
            case VI_Dia of
               1: CheckBox_Dia1.State:= cbChecked;
               2: CheckBox_Dia2.State:= cbChecked;
               3: CheckBox_Dia3.State:= cbChecked;
               4: CheckBox_Dia4.State:= cbChecked;
               5: CheckBox_Dia5.State:= cbChecked;
               6: CheckBox_Dia6.State:= cbChecked;
               7: CheckBox_Dia7.State:= cbChecked;
               8: CheckBox_Dia8.State:= cbChecked;
               9: CheckBox_Dia9.State:= cbChecked;
               10: CheckBox_Dia10.State:= cbChecked;

               11: CheckBox_Dia11.State:= cbChecked;
               12: CheckBox_Dia12.State:= cbChecked;
               13: CheckBox_Dia13.State:= cbChecked;
               14: CheckBox_Dia14.State:= cbChecked;
               15: CheckBox_Dia15.State:= cbChecked;
               16: CheckBox_Dia16.State:= cbChecked;
               17: CheckBox_Dia17.State:= cbChecked;
               18: CheckBox_Dia18.State:= cbChecked;
               19: CheckBox_Dia19.State:= cbChecked;
               20: CheckBox_Dia20.State:= cbChecked;

               21: CheckBox_Dia21.State:= cbChecked;
               22: CheckBox_Dia22.State:= cbChecked;
               23: CheckBox_Dia23.State:= cbChecked;
               24: CheckBox_Dia24.State:= cbChecked;
               25: CheckBox_Dia25.State:= cbChecked;
               26: CheckBox_Dia26.State:= cbChecked;
               27: CheckBox_Dia27.State:= cbChecked;
               28: CheckBox_Dia28.State:= cbChecked;
               29: CheckBox_Dia29.State:= cbChecked;
               30: CheckBox_Dia30.State:= cbChecked;

               31: CheckBox_Dia31.State:= cbChecked;
            end;
         end;
      end;
      wDataInicio := wDataInicio + 1;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Encontrar periodo e Qtd dias uteis
//------------------------------------------------------------------------------

procedure TForm_Relatorio_INFRAERO.ComboBox_MesChange(Sender: TObject);
var
    VI_Mes: Integer;
Begin
   if ComboBox_Mes.Text = 'Janeiro' then
      VI_Mes:= 1
   else
      if ComboBox_Mes.Text = 'Fevereiro' then
         VI_Mes:= 2
      else
         if ComboBox_Mes.Text = 'Março' then
            VI_Mes:= 3
         else
            if ComboBox_Mes.Text = 'Abril' then
               VI_Mes:= 4
            else
               if ComboBox_Mes.Text = 'Maio' then
                  VI_Mes:= 5
               else
                  if ComboBox_Mes.Text = 'Junho' then
                     VI_Mes:= 6
                  else
                     if ComboBox_Mes.Text = 'Julho' then
                        VI_Mes:= 7
                     else
                        if ComboBox_Mes.Text = 'Agosto' then
                           VI_Mes:= 8
                        else
                           if ComboBox_Mes.Text = 'Setembro' then
                              VI_Mes:= 9
                           else
                              if ComboBox_Mes.Text = 'Outubro' then
                                 VI_Mes:= 10
                              else
                                 if ComboBox_Mes.Text = 'Novembro' then
                                    VI_Mes:= 11
                                 else
                                    if ComboBox_Mes.Text = 'Dezembro' then
                                       VI_Mes:= 12;


   VS_InicioMes:= '01/'+FormatFloat('00', VI_Mes)+'/'+ComboBox_Ano.Text;
   VS_TerminoMes:= IntToStr(Funcoes_TrataData.DiasNoMes(StrToInt(ComboBox_Ano.Text), VI_Mes))+'/'+FormatFloat('00', VI_Mes)+'/'+ComboBox_Ano.Text;
   CalculaDiasUteis(StrToDate(VS_InicioMes), StrToDate(VS_TerminoMes));
   JvDateEdit_DataInicio.Date:= StrToDate(VS_TerminoMes)+1;
end;

procedure TForm_Relatorio_INFRAERO.DBGrid_RegistrodeRelatroiosCellClick(Column: TColumn);
begin
   Panel_GravaAlteracaoConvenio.Visible:= True;

   IBTable_ConvenioINFRAERO.Edit;
end;

procedure TForm_Relatorio_INFRAERO.SpeedButton1Click(Sender: TObject);
begin
   IBTable_ConvenioINFRAERO.Post;
   Funcoes.ExecutaTransacao;
   Panel_GravaAlteracaoConvenio.Visible:= False;
   MaskEdit_RelatorioN.SetFocus;
end;

procedure TForm_Relatorio_INFRAERO.SpeedButton_ApagarClick(Sender: TObject);
begin
   IBTable_ConvenioINFRAERO.Delete;
   Funcoes.ExecutaTransacao;
   Panel_GravaAlteracaoConvenio.Visible:= False;
   MaskEdit_RelatorioN.SetFocus;
end;

procedure TForm_Relatorio_INFRAERO.SpeedButton_CancelarClick(Sender: TObject);
begin
   IBTable_ConvenioINFRAERO.Cancel;
   Funcoes.ExecutaTransacao;
   Panel_GravaAlteracaoConvenio.Visible:= False;
   MaskEdit_RelatorioN.SetFocus;
end;

end.
