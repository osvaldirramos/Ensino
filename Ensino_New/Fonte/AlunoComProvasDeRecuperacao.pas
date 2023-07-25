unit AlunoComProvasDeRecuperacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient,
  DB, IBCustomDataSet, JvEdit, ToolWin, ComCtrls, Grids, DBGrids, IBQuery, Rotinas,
  Mask, DBCtrls, ComObj;

type
  TForm_AlunoComProvasDeRecuperacao = class(TForm)
    Query_MontaRelacao: TIBQuery;
    DSQ_MontaCurso: TDataSource;
    DBGrid_Curso: TDBGrid;
    Query_MontaRelacaoIDENTIDADE: TIBStringField;
    Query_MontaRelacaoNOMECOMPLETO: TIBStringField;
    Query_MontaRelacaoCODPROVA: TIBStringField;
    Query_MontaRelacaoNOTA: TIBBCDField;
    Panel_Botoes: TPanel;
    JvGradient_Tela01: TJvGradient;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;
    Memo1: TMemo;
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AlunoComProvasDeRecuperacao: TForm_AlunoComProvasDeRecuperacao;

implementation

uses CorrecaoProva;

{$R *.dfm}


//------------------------------------------------------------------------------
// Tratamento do botao para fechar o Sistema
//------------------------------------------------------------------------------

procedure TForm_AlunoComProvasDeRecuperacao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para fechar o programa
//------------------------------------------------------------------------------

procedure TForm_AlunoComProvasDeRecuperacao.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_AlunoComProvasDeRecuperacao.FormActivate(Sender: TObject);
begin
   JvGradient_Tela01.StartColor:= Cor_Tela;

   Query_MontaRelacao.Close;
   Query_MontaRelacao.SQL.Clear;
   Query_MontaRelacao.Sql.Add( 'Select distinct n.Identidade, a.NomeCompleto, n.CodProva, n.Nota '+
                               ' From Nota_Aluno_View  n, Aluno_Turmas_View a '+
                               ' Where  n.IdCurso = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                               ' and n.IdTurma = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                               ' and  n.IdCurso = a.IdCurso '+
                               ' and  n.IdTurma = a.IdTurma '+
                               ' and  n.Identidade = a.Identidade '+
                               ' and  n.Nota is not null '+
                               ' and  n.Media = '+#39+'S'+#39+
                               ' and  ( ReferenciaAvaliacao like '+#39+'%2'+#39+' or ReferenciaAvaliacao like '+#39+'%F'+#39+' or ReferenciaAvaliacao like '+#39+'%R'+#39+')'
                              );
   Query_MontaRelacao.Open;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a form
//------------------------------------------------------------------------------

procedure TForm_AlunoComProvasDeRecuperacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;


procedure TForm_AlunoComProvasDeRecuperacao.JvTransparentButton_ExcelClick( Sender: TObject);
var
   objExcel,Sheet : Variant;
   cTitulo : string;
   i : integer;
begin
   if Query_MontaRelacao.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'A Turma selecionada não possuí aluno Cadastrado...')
   else
   begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de Alunos';
      objExcel := CreateOleObject('Excel.Application');
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'Nome Completo';
      Sheet.Range['B1'] := 'Código da Prova';
      Sheet.Range['C1'] := 'Nota';

      // por aqui tu limparias a planilha

      i:= 2;
      Query_MontaRelacao.First;
      while not Query_MontaRelacao.eof do
      begin
         Sheet.Cells[i,1] := Query_MontaRelacao.FieldByName('NomeCompleto').AsString;
         Sheet.Cells[i,2] := Query_MontaRelacao.FieldByName('CodProva').AsString;
         Sheet.Cells[i,3] := Query_MontaRelacao.FieldByName('Nota').AsString;
         i:= i+1;
         Query_MontaRelacao.Next;
      end;
   end;
end;

end.
