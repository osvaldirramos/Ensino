unit ConsultaHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ComObj,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBQuery, JvEdit, ToolWin, Grids, Rotinas,
  DBGrids, StdCtrls, JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient;

type
  TForm_Historico = class(TForm)
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo1: TMemo;
    Panel_RelacaoAlunos: TPanel;
    DBGrid_Campos: TDBGrid;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_Curso: TJvEdit;
    JvEdit_Turma: TJvEdit;
    JvEdit_Ano: TJvEdit;
    JvEdit_Nome: TJvEdit;
    JvEdit_Pais: TJvEdit;
    JvEdit_PostoGrad: TJvEdit;
    JvEdit_Unidade: TJvEdit;
    Query_Historico: TIBQuery;
    DSQ_Historico: TDataSource;
    Query_HistoricoIDENTIDADE: TIBStringField;
    Query_HistoricoNOME: TIBStringField;
    Query_HistoricoPOSTOGRAD: TIBStringField;
    Query_HistoricoQUADROESPEC: TIBStringField;
    Query_HistoricoUNIDADEPER: TIBStringField;
    Query_HistoricoUNIDADESER: TIBStringField;
    Query_HistoricoCODCURSO: TIBStringField;
    Query_HistoricoTURMA: TIBStringField;
    Query_HistoricoANO: TIBStringField;
    Query_HistoricoTIPO: TIBStringField;
    Query_HistoricoPAIS: TIBStringField;
    Query_HistoricoNOTA: TFloatField;
    Query_HistoricoDATAINI: TDateTimeField;
    Query_HistoricoDATATER: TDateTimeField;
    ToolButton1: TToolButton;
    IBQuery_Executa: TIBQuery;
    Panel_TotalReg: TPanel;
    Query_HistoricoNUMSEQ: TIntegerField;
    Query_HistoricoSITUACAO: TIBStringField;
    JvShape1: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;
    procedure JvEdit_CursoChange(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid_CamposTitleClick(Column: TColumn);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private            { Private declarations }
     OrderBy: String;
  public
    { Public declarations }
  end;

var
  Form_Historico: TForm_Historico;

implementation

uses Module_Historico;

{$R *.dfm}

procedure TForm_Historico.FormActivate(Sender: TObject);
begin
//   Query_Historico.Open;
   OrderBy:= ' order by CodCurso';
   JvEdit_CursoChange(Sender);
end;

procedure TForm_Historico.JvEdit_CursoChange(Sender: TObject);
var
   VS_Where, VS_Comando: String;
begin
   VS_Comando:= 'Select * from Historico ';
   VS_Where:= '';

   if JvEdit_Curso.Text <> '' then
      VS_Where:= ' Where CodCurso like '+#39+JvEdit_Curso.Text+'%'+#39;

   if JvEdit_Turma.Text <> '' then
      if VS_Where = '' then
         VS_Where:= VS_Where+' Where Turma like '+#39+JvEdit_Turma.Text+'%'+#39
      else
         VS_Where:= VS_Where+' and Turma like '+#39+JvEdit_Turma.Text+'%'+#39;

   if JvEdit_Ano.Text <> '' then
      if VS_Where = '' then
         VS_Where:= VS_Where+' Where Ano like '+#39+JvEdit_Ano.Text+'%'+#39
      else
         VS_Where:= VS_Where+' and Ano like '+#39+JvEdit_Ano.Text+'%'+#39;

   if JvEdit_Nome.Text <> '' then
      if VS_Where = '' then
         VS_Where:= VS_Where+' Where Nome like '+#39+JvEdit_Nome.Text+'%'+#39
      else
         VS_Where:= VS_Where+' and Nome like '+#39+JvEdit_Nome.Text+'%'+#39;

   if JvEdit_Pais.Text <> '' then
      if VS_Where = '' then
         VS_Where:= VS_Where+' Where Pais like '+#39+JvEdit_Pais.Text+'%'+#39
      else
         VS_Where:= VS_Where+' and Pais like '+#39+JvEdit_Pais.Text+'%'+#39;

   if JvEdit_PostoGrad.Text <> '' then
      if VS_Where = '' then
         VS_Where:= VS_Where+' Where PostoGrad like '+#39+JvEdit_PostoGrad.Text+'%'+#39
      else
         VS_Where:= VS_Where+' and PostoGrad like '+#39+JvEdit_PostoGrad.Text+'%'+#39;

   if JvEdit_Unidade.Text <> '' then
      if VS_Where = '' then
         VS_Where:= VS_Where+' Where UnidadePer like '+#39+JvEdit_Unidade.Text+'%'+#39
      else
         VS_Where:= VS_Where+' and UnidadePer like '+#39+JvEdit_Unidade.Text+'%'+#39;

   Query_Historico.Close;
   Query_Historico.SQL.Clear;
   Query_Historico.SQL.Add(VS_Comando+' '+VS_Where+OrderBy);
   Query_Historico.Open;

   IBQuery_Executa.Close;
   IBQuery_Executa.SQL.Clear;
   IBQuery_Executa.SQL.Add('Select count(1) as Qtd From Historico '+VS_Where);
   IBQuery_Executa.Open;

   Panel_TotalReg.Caption:= 'Total: '+IBQuery_Executa.FieldByName('Qtd').AsString;

end;


procedure TForm_Historico.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_Historico.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;


procedure TForm_Historico.DBGrid_CamposTitleClick(Column: TColumn);
var
    Sender: TObject;
begin
   OrderBy:= ' ';

  if trim(column.Title.Caption) = 'Curso' then
      OrderBy:= ' order by CodCurso'
  else
     if trim(column.Title.Caption) = 'Turma' then
         OrderBy:= ' order by Turma'
     else
        if trim(column.Title.Caption) = 'Ano' then
            OrderBy:= ' order by Ano'
        else
           if trim(column.Title.Caption) = 'Nome Completo' then
              OrderBy:= ' order by Nome'
           else
              if trim(column.Title.Caption) = 'Pais' then
                 OrderBy:= ' order by Pais '
              else
                 if trim(column.Title.Caption) = 'Posto Grad.' then
                     OrderBy:= ' order by PostoGrad '
                 else
                     if trim(column.Title.Caption) = 'Quadro Espec.' then
                        OrderBy:= ' order by QuadroEspec '
                     else
                        if trim(column.Title.Caption) = 'Unidade Pertence' then
                           OrderBy:= ' order by UnidadePer '
                        else
                           if trim(column.Title.Caption) = 'Unidade Serve' then
                              OrderBy:= ' order by UnidadeSer '
                           else
                              if trim(column.Title.Caption) = 'Ínicio' then
                                 OrderBy:= ' order by DataIni '
                              else
                                 if trim(column.Title.Caption) = 'Término' then
                                    OrderBy:= ' order by DataTer '
                                 else
                                    if trim(column.Title.Caption) = 'Nota' then
                                       OrderBy:= ' order by Nota ';

   JvEdit_CursoChange(Sender);
end;

procedure TForm_Historico.JvTransparentButton_ExcelClick(Sender: TObject);
var
   objExcel, Sheet: Variant;
   cTitulo : string;
   i : integer;
begin
   if Query_Historico.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'A Turma selecionada não possuí aluno Cadastrado...')
   else
   begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Relacao de Alunos';

      try
         objExcel := CreateOleObject('Excel.Application');
      except
         objExcel := CreateOleObject('scalc.Application');
      end;
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'Cód. Curso';
      Sheet.Range['B1'] := 'Turma';
      Sheet.Range['C1'] := 'Ano';
      Sheet.Range['D1'] := 'Nome Completo';
      Sheet.Range['E1'] := 'Pais';
      Sheet.Range['F1'] := 'Posto/Graduação';
      Sheet.Range['G1'] := 'Unidade Pertence';
      Sheet.Range['H1'] := 'Unidade Serve';
      Sheet.Range['I1'] := 'Ínicio';
      Sheet.Range['J1'] := 'Término';
      Sheet.Range['K1'] := 'Nota';

      // por aqui tu limparias a planilha

      i:= 2;
      Query_Historico.First;
      while not Query_Historico.eof do
      begin
         Sheet.Cells[i,1] := Query_Historico.FieldByName('CodCurso').AsString;
         Sheet.Cells[i,2] := Query_Historico.FieldByName('Turma').AsString;
         Sheet.Cells[i,3] := Query_Historico.FieldByName('Ano').AsString;
         Sheet.Cells[i,4] := Query_Historico.FieldByName('Nome').AsString;
         Sheet.Cells[i,5] := Query_Historico.FieldByName('PAIS').AsString;
         Sheet.Cells[i,6] := Query_Historico.FieldByName('PostoGrad').AsString;
         Sheet.Cells[i,7] := Query_Historico.FieldByName('UnidadePer').AsString;
         Sheet.Cells[i,8] := Query_Historico.FieldByName('UnidadeSer').AsString;
         Sheet.Cells[i,9] := Query_Historico.FieldByName('DataIni').AsString;
         Sheet.Cells[i,10] := Query_Historico.FieldByName('DataTer').AsString;
         Sheet.Cells[i,11] := Query_Historico.FieldByName('Nota').AsString;
         i:= i+1;
         Query_Historico.Next;
      end;
   end;
end;

procedure TForm_Historico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Historico.Close;
   Action:= caFree;
end;

end.
