unit Relacao_NotasProvasAbaixoMedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, ComCtrls, ToolWin,
  StdCtrls, JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient, IBTable;

type
  TForm_RelacaoAlunosNotaBaixo = class(TForm)
    DBGrid_Alunos: TDBGrid;
    Query_NotaBaixa: TIBQuery;
    DSQ_NotaBaixa: TDataSource;
    Query_NotaBaixaNOMECOMPLETO: TIBStringField;
    Query_NotaBaixaCODCURSO: TIBStringField;
    Query_NotaBaixaTURMA: TIBStringField;
    Query_NotaBaixaANO: TIBStringField;
    Query_NotaBaixaNOTA: TIBBCDField;
    Query_NotaBaixaCODPROVA: TIBStringField;
    Query_NotaBaixaIDENTIDADE: TIBStringField;
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvGradient1: TJvGradient;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RelacaoAlunosNotaBaixo: TForm_RelacaoAlunosNotaBaixo;

implementation

uses Editor_Texto;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_RelacaoAlunosNotaBaixo.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_RelacaoAlunosNotaBaixo, ' Relação de Alunos com Notas Abaixo da Média' );

   Funcoes.ExecutaQuery(Query_NotaBaixa, 'Select a.identidade, a.NomeCompleto, a.CodCurso, a.Turma, a.Ano, n.nota, n.codprova '+
                                         ' From RELACAO_ALUNOSTURMAATIVA_VIEW a, Nota_Aluno_View n '+
                                         ' Where a.IdCurso = n.IdCurso '+
                                         ' and   a.idturma = n.IdTurma '+
                                         ' and   a.Identidade = n.Identidade '+
                                         ' and n.nota < 7 and n.nota > 0 '+
                                         ' order by a.CodCurso, a.Turma, a.Ano, n.codprova '
                       );
end;

//------------------------------------------------------------------------------
// Tratamento do Botao que Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_RelacaoAlunosNotaBaixo.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_RelacaoAlunosNotaBaixo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_NotaBaixa.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao que retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_RelacaoAlunosNotaBaixo.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da relação dos alunos
//------------------------------------------------------------------------------

procedure TForm_RelacaoAlunosNotaBaixo.JvTransparentButton_ImprimirClick(Sender: TObject);
var
   VS_Linha: String;
begin
   Form_Editor.Text1.Clear;
   VS_Linha:= Funcoes.ReplStr('Curso', ' ', 8)+' '+
              Funcoes.ReplStr('Turma', ' ', 10)+' '+
              Funcoes.ReplStr('CPF', ' ', 11)+' '+
              Funcoes.ReplStr('Identidade', ' ', 20)+' '+
              Funcoes.ReplStr('NomeCompleto', ' ', 50)+' '+
              Funcoes.ReplStr('Nota', ' ', 7);
   Form_Editor.Text1.Lines.Add(VS_LInha);
   Form_Editor.Text1.Lines.Add('');

   Query_NotaBaixa.First;
   While not Query_NotaBaixa.Eof do
   begin
      Form_Editor.FontSize.Text := '11';
      Form_Editor.Text1.Font.Size:= 11;
      Form_Editor.JvFontComboBox_Font.Text := 'Courier New';
      Form_Editor.Text1.Font.Name:= 'Courier New';

      VS_Linha:= Funcoes.ReplStr(Query_NotaBaixa.FieldByName('CodCurso').AsString, ' ', 8)+' '+
                 Funcoes.ReplStr(Query_NotaBaixa.FieldByName('Turma').AsString, ' ', 10)+' '+
                 Funcoes.ReplStr(Query_NotaBaixa.FieldByName('CPF').AsString, ' ', 11)+' '+
                 Funcoes.ReplStr(Query_NotaBaixa.FieldByName('Identidade').AsString, ' ', 20)+' '+
                 Funcoes.ReplStr(Query_NotaBaixa.FieldByName('NomeCompleto').AsString, ' ', 50)+' '+
                 Funcoes.ReplStr(Query_NotaBaixa.FieldByName('Nota').AsString, ' ', 7);
      Form_Editor.Text1.Lines.Add(VS_LInha);
      Query_NotaBaixa.Next;
   end;
   Form_Editor.Show;
end;

end.
