unit Sel_Relatorios_Instrutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask, Rotinas,
  DBCtrls, ExtCtrls, JvShape, JvToolEdit, JvSpin, JvComponent, ComObj,
  JvGroupHeader, Buttons, IBTable, Grids, DBGrids;

type
  TForm_Relatorio_Instrutores = class(TForm)
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
    JvGroupHeader1: TJvGroupHeader;
    SpeedButton1: TSpeedButton;
    IBQuery_InstrutorTurma: TIBQuery;
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
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaTURMA: TIBStringField;
    IBQuery_InstrutorTurmaANO: TIBStringField;
    IBQuery_InstrutorTurmaDATAINICIO: TDateTimeField;
    IBQuery_InstrutorTurmaDATATERMINO: TDateTimeField;
    IBQuery_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBQuery_InstrutorTurmaNUMORDEM: TSmallintField;
    IBQuery_InstrutorTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_InstrutorTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_InstrutorTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_InstrutorTurmaCODIGOALUNO: TIntegerField;
    IBQuery_InstrutorTurmaNOTAFINAL: TIBBCDField;
    IBQuery_InstrutorTurmaNOME: TIBStringField;
    IBQuery_InstrutorTurmaQUADROESP: TIBStringField;
    SpeedButton_Processar: TSpeedButton;
    RichEdit_Resumo: TRichEdit;
    SpeedButton_Limpar: TSpeedButton;
    IBQuery_Executa: TIBQuery;
    DataSource1: TDataSource;
    IBQuery_Relatorios: TIBQuery;
    DataSource2: TDataSource;
    RichEdit_Texto: TRichEdit;

    procedure Processar(PS_IdCurso, PS_IdTurma, PS_Turma: String) ;
    Function TratarArea(PS_Area: String): String;
    procedure Monta_ComboTurma;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton_ProcessarClick(Sender: TObject);
    procedure SpeedButton_LimparClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private
     MS_Turma: Array[1..800] of String;

      M_Funcao: Array[1..15] of String;
      TotalFuncao: Array[1..15] of Integer;
      VI_QtdFuncoes, TotalAlunos: Integer;
  public    { Public declarations }
     VS_Opcao: String;
 end;

var
  Form_Relatorio_Instrutores: TForm_Relatorio_Instrutores;

implementation

uses Module, MenuPrincipal;

{$R *.dfm}

procedure TForm_Relatorio_Instrutores.FormActivate(Sender: TObject);
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
         if ((VS_Area <> 'TUR')and (VS_Area <> 'BDS') and (VS_Area <> 'GT ') and (VS_Area <> 'PIL') and (VS_Area <> 'TWR3') and (VS_Area <> 'TWRS') and (VS_Area <> 'COPM') and (VS_Area <> 'CGNA')) then
         begin
            VS_Localidade:= Copy(DM.Query_Executa.FieldByName('Turma').AsString, 4, 2);
            ComboBox_Localidade.Items.Add(VS_Localidade);
         end;
      end;
      DM.Query_Executa.Next;
   end;
end;

procedure TForm_Relatorio_Instrutores.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;
procedure TForm_Relatorio_Instrutores.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para Identificar a Area de Atuacao
//------------------------------------------------------------------------------

Function TForm_Relatorio_Instrutores.TratarArea(PS_Area: String): String;
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

procedure TForm_Relatorio_Instrutores.ComboBox_TurmaChange(Sender: TObject);
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

procedure TForm_Relatorio_Instrutores.Monta_ComboTurma;
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

procedure TForm_Relatorio_Instrutores.Processar(PS_IdCurso, PS_IdTurma, PS_Turma: String) ;
var
   VS_Msg, VS_Comando: string;
   i: integer;
begin
   VS_Comando:= 'Select count(1) as Qtd From AlunoTurma Where IdCurso = '+PS_IdCurso+' and IdTurma ='+PS_IdTurma;
   Funcoes.OpenQuery(IBQuery_Executa, VS_Comando);
   VS_Msg:= 'Total de ';

   RichEdit_Texto.Lines.Add('Turma: '+PS_Turma);
   RichEdit_Texto.Lines.Add('Total de Alunos: '+IBQuery_Executa.FieldByName('Qtd').AsString);
   TotalAlunos:= TotalAlunos+IBQuery_Executa.FieldByName('Qtd').AsInteger;

   For i:= 1 to VI_QtdFuncoes do
   begin
      VS_Comando:= 'Select count(1) as Qtd From InstrutorTurma Where IdCurso = '+PS_IdCurso+' and idTurma ='+PS_IdTurma+' and Funcao = '+#39+M_Funcao[i]+#39;
      Funcoes.OpenQuery(IBQuery_Executa, VS_Comando);

      VS_Msg:= VS_Msg+' - '+M_Funcao[i]+': '+IBQuery_Executa.FieldByName('Qtd').AsString;
      TotalFuncao[i]:= TotalFuncao[i]+IBQuery_Executa.FieldByName('Qtd').AsInteger;
   end;
   RichEdit_Texto.Lines.Add(VS_Msg);
   RichEdit_Texto.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
end;


//------------------------------------------------------------------------------
// Tratamento para montar o Relatorio no Formato do Excel
//------------------------------------------------------------------------------

procedure TForm_Relatorio_Instrutores.SpeedButton1Click(Sender: TObject);
var
   VS_Msg: String;
   i: Integer;
begin
   RichEdit_Resumo.Lines.Clear;
   RichEdit_Resumo.Lines.Add('Resumo: ');
   RichEdit_Resumo.Lines.Add('Total de Alunos: '+IntToStr(TotalAlunos));
   VS_Msg:= '';

   For i:= 1 to VI_QtdFuncoes do
   begin
      VS_Msg:= VS_Msg+' - '+M_Funcao[i]+': '+IntToStr(TotalFuncao[i]);
   end;
   RichEdit_Resumo.Lines.Add(VS_Msg);
   RichEdit_Resumo.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
end;

//------------------------------------------------------------------------------
// Tratamento da geracao do relatorio Txt
//------------------------------------------------------------------------------

procedure TForm_Relatorio_Instrutores.SpeedButton_ProcessarClick(Sender: TObject);
var
   VS_Turma, VS_Comando: String;
begin
   RichEdit_Resumo.Lines.Clear;

   VI_QtdFuncoes:= 0;
   VS_Comando:= 'Select distinct Funcao From InstrutorTurma Where IdCurso = '+Funcoes.GetIdCurso+' and idTurma <> 0';
   Funcoes.OpenQuery(IBQuery_Executa, VS_Comando);
   IBQuery_Executa.First;
   While not IBQuery_Executa.Eof do
   begin
      VI_QtdFuncoes:= VI_QtdFuncoes+1;
      M_Funcao[VI_QtdFuncoes]:= IBQuery_Executa.FieldByName('Funcao').AsString;
      TotalFuncao[VI_QtdFuncoes]:= 0;
      IBQuery_Executa.Next;
   end;

   VS_Turma:= '';
   VS_Comando:= 'Select IdCurso, IdTurma, Turma From Turma Where IdCurso = '+Funcoes.GetIdCurso;

   if trim(ComboBox_Turma.Text) <> '' then
      VS_Comando:= VS_Comando+' and IdTurma = '+IBQuery_MontaTurma.FieldByName('IdTurma').AsString
   else
      if ((trim(ComboBox_Area.Text) <> '') or (Trim(ComboBox_Localidade.Text) <> '')) then
         VS_Comando:= VS_Comando+' and Turma Like '+#39+'%'+trim(ComboBox_Area.Text)+Trim(ComboBox_Localidade.Text)+'%'+#39;

   Funcoes.OpenQuery(IBQuery_Relatorios, VS_Comando);
   IBQuery_Relatorios.First;
   While not IBQuery_Relatorios.Eof do
   begin
      Processar(IBQuery_Relatorios.FieldbyName('IdCurso').AsString, IBQuery_Relatorios.FieldbyName('IdTurma').AsString, IBQuery_Relatorios.FieldbyName('Turma').AsString);
      IBQuery_Relatorios.Next;
   end;


   ShowMEssage('Relatório Finalizado...');
end;

procedure TForm_Relatorio_Instrutores.SpeedButton_LimparClick(Sender: TObject);
begin
   RichEdit_Resumo.Lines.Clear;
   RichEdit_Texto.Lines.Clear;
end;

end.
