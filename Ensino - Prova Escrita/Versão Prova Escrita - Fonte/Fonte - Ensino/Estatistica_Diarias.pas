unit Estatistica_Diarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, ComObj,
  JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient, Rotinas_TrataData, Rotinas;

type
  TForm_Estatistica_Diarias = class(TForm)
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    IBQuery_Estatistica: TIBQuery;
    DSQ_Estatistica: TDataSource;
    IBQuery_EstatisticaNOMECOMPLETO: TIBStringField;
    IBQuery_EstatisticaDATACHEGADA: TDateTimeField;
    IBQuery_EstatisticaDATASAIDA: TDateTimeField;
    Panel1: TPanel;
    Panel_TratarInstrutor: TPanel;
    DBGrid_SelecionaInstrutor: TDBGrid;
    ComboBox_Curso: TComboBox;
    Label3: TLabel;
    Label_Ano: TLabel;
    MaskEdit_Ano: TMaskEdit;
    GroupBox_QtdCursos: TGroupBox;
    Label_QtdCursos: TLabel;
    Edit_Instrutor: TEdit;

    procedure Trata_Estatistica;

    procedure MaskEdit_AnoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox_CursoChange(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Estatistica_Diarias: TForm_Estatistica_Diarias;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Forma Principal
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Diarias.FormActivate(Sender: TObject);
begin
   MaskEdit_Ano.Text:= Funcoes_TrataData.AnoAtual;
   MaskEdit_AnoChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da pesquisa pelo ano
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Diarias.MaskEdit_AnoChange(Sender: TObject);
begin
   Funcoes.OpenQuery( 'Select distinct CodCurso From TURMAS_VIEW '+
                      ' Where Ano = '+#39+MaskEdit_Ano.Text+#39+
                      ' Order By CodCurso '
                     );

   ComboBox_Curso.Items.Clear;
   ComboBox_Curso.Text:= 'PSM001';
   ComboBox_Curso.Items.Add('');
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Curso.Items.Add(DM.IBQuery_Executa.FieldbyName('CodCurso').AsString);
      DM.IBQuery_Executa.Next;
   end;

   Trata_Estatistica;
end;

//------------------------------------------------------------------------------
// Tratamento para chamar a estatistica atraves da selecao do Curso
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Diarias.ComboBox_CursoChange(Sender: TObject);
begin
   Trata_Estatistica;
end;

//------------------------------------------------------------------------------
// Tratamento da estatistica de instrutores de acordo com o curso
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Diarias.Trata_Estatistica;
var
  VS_Inicio, VS_Termino: String;
  VI_Cont: Integer;
begin
   VS_Inicio:= Funcoes.Depara('01/01/'+MaskEdit_Ano.Text+' 00.00','/', '.');
   VS_Termino:= Funcoes.Depara('31/12/'+MaskEdit_Ano.Text+' 00.00','/', '.');

   IBQuery_Estatistica.Close;
   IBQuery_Estatistica.Sql.Clear;
   if Edit_Instrutor.Text = '' then
      IBQuery_Estatistica.Sql.Add(' select distinct i.NomeCompleto, i.datachegada, i.datasaida '+
                                  ' From InstrutorTurma i, Curso c '+
                                  ' Where i.IdCurso = c.IdCurso '+
                                  ' and c.CodCurso = '+#39+ComboBox_Curso.Text+#39+
                                  ' and i.DataChegada >= '+#39+VS_Inicio+#39+' and i.DataChegada <= '+#39+VS_Termino+#39+
                                  ' order by i.NomeCompleto '
                                 )
   else
      IBQuery_Estatistica.Sql.Add(' select distinct i.NomeCompleto, i.datachegada, i.datasaida '+
                                  ' From InstrutorTurma i, Curso c '+
                                  ' Where i.IdCurso = c.IdCurso '+
                                  ' and c.CodCurso = '+#39+ComboBox_Curso.Text+#39+
                                  ' and i.NomeCompleto like '+#39+'%'+Edit_Instrutor.Text+'%'+#39+
                                  ' and i.DataChegada >= '+#39+VS_Inicio+#39+' and i.DataChegada <= '+#39+VS_Termino+#39+
                                  ' order by i.NomeCompleto '
                                 );

   IBQuery_Estatistica.Open;

   IBQuery_Estatistica.Last;
   Label_QtdCursos.Caption:= IntToStr(IBQuery_Estatistica.Recordcount);
   IBQuery_Estatistica.First;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a form
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Diarias.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Estatistica.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar ao rpograma e retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Diarias.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Estatistica_Diarias.JvTransparentButton_ImprimirClick(Sender: TObject);
var
   objExcel, Sheet: Variant;
   cTitulo : string;
   i : integer;
begin
   if IBQuery_Estatistica.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'A Turma selecionada não possuí instrutor Cadastrado...')
   else
   begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de Instrutores';

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
      Sheet.Range['A1'] := 'Nome Completo';
      Sheet.Range['B1'] := 'Chegada';
      Sheet.Range['C1'] := 'Saída';

      // por aqui tu limparias a planilha

      i:= 2;
      IBQuery_Estatistica.First;
      while not IBQuery_Estatistica.eof do
      begin
         Sheet.Cells[i,1] := IBQuery_Estatistica.FieldByName('NomeCompleto').AsString;
         Sheet.Cells[i,2] := IBQuery_Estatistica.FieldByName('DataChegada').AsString;
         Sheet.Cells[i,3] := IBQuery_Estatistica.FieldByName('DataSaida').AsString;
         i:= i+1;
         IBQuery_Estatistica.Next;
      end;
   end;
end;

end.
