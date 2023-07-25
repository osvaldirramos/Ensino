unit EstatisticaAplicacaoProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvComponent, JvTransBtn, ExtCtrls, JvShape, JvGradient,
  Rotinas, ComObj, JvPanel, DB, IBCustomDataSet, IBQuery, Grids, DBGrids;

type
  TForm_EstatisticaAplicacaoProva = class(TForm)
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo1: TMemo;
    JvShape1: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;
    JvPanel1: TJvPanel;
    Panel_Teorica: TPanel;
    Panel_Pratica: TPanel;
    Panel_2Chamada: TPanel;
    Panel_RecTeorica: TPanel;
    Panel_RecPratica: TPanel;
    Panel_Diagnostica: TPanel;
    Panel_ProvaTeorica: TPanel;
    Panel_ProvaPratica: TPanel;
    Panel_ProvaSegunda: TPanel;
    Panel_ProvaRecTeo: TPanel;
    Panel_ProvaRecPra: TPanel;
    Panel_ProvaDiagnostica: TPanel;
    Panel1_TotalProvas: TPanel;
    Panel2: TPanel;
    ComboBox_Ano: TComboBox;
    Query_MontaRelacao: TIBQuery;
    DSQ_MontaRelacao: TDataSource;
    DBGrid_Curso: TDBGrid;
    Query_MontaRelacaoCODCURSO: TIBStringField;
    Query_MontaRelacaoTURMA: TIBStringField;
    Query_MontaRelacaoCODPROVA: TIBStringField;
    Query_MontaRelacaoDATAAPLICACAO: TDateTimeField;
    Query_MontaRelacaoQDEALUNOS: TIntegerField;
    Panel1_TotalAlunos: TPanel;
    Panel_TotalAlunos: TPanel;
    Panel_Total: TPanel;
    Panel_TotalProvasPorAlunos: TPanel;
    Panel_TotalProvas: TPanel;

    procedure Levantamento;

    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
    procedure ComboBox_AnoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_EstatisticaAplicacaoProva: TForm_EstatisticaAplicacaoProva;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da abertura do programa
//------------------------------------------------------------------------------

procedure TForm_EstatisticaAplicacaoProva.FormActivate(Sender: TObject);
var
   Ano, Mes, Dia : word;
begin
   DecodeDate (Date, Ano, Mes, Dia);
   ComboBox_Ano.Text:= IntToStr(Ano);

   Levantamento;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para fechar o programa
//------------------------------------------------------------------------------

procedure TForm_EstatisticaAplicacaoProva.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para fechar o Sistema
//------------------------------------------------------------------------------

procedure TForm_EstatisticaAplicacaoProva.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a form
//------------------------------------------------------------------------------

procedure TForm_EstatisticaAplicacaoProva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar um novo ano
//------------------------------------------------------------------------------

procedure TForm_EstatisticaAplicacaoProva.ComboBox_AnoChange( Sender: TObject);
begin
   Levantamento;
end;

//------------------------------------------------------------------------------
// Tratamento para levantamento das informacoes
//------------------------------------------------------------------------------

procedure TForm_EstatisticaAplicacaoProva.Levantamento;
begin
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and referenciaAvaliacao Like '+#39+'%T'+#39 );

   Panel_ProvaTeorica.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and referenciaAvaliacao Like '+#39+'%T'+#39 );

   Panel_ProvaTeorica.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and referenciaAvaliacao Like '+#39+'%P'+#39 );

   Panel_ProvaPratica.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;


   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and referenciaAvaliacao Like '+#39+'%2'+#39 );

   Panel_ProvaSegunda.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and referenciaAvaliacao Like '+#39+'%F'+#39 );

   Panel_ProvaRecTeo.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and referenciaAvaliacao Like '+#39+'%R'+#39 );

   Panel_ProvaRecPra.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and referenciaAvaliacao Like '+#39+'%D'+#39 );

   Panel_ProvaDiagnostica.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select count(1) as Qtd '+
                                            '  From teste '+
                                            ' Where dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39 );

   Panel_TotalProvas.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;

   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'select sum(QdeAlunos) As Qtd '+
                                            ' From Testes_View Te, turmas_todas_view Tu '+
                                            ' Where Te.IdCurso = Tu.idcurso '+
                                            ' and   Te.IdTurma = Tu.IdTurma '+
                                            ' and   Te.dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and   ( Te.referenciaAvaliacao Like '+#39+'%T'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%2'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%F'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%R'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%D'+#39+
                                            '        ) '
                       );
   Panel_TotalAlunos.Caption:= DM.IBQuery_Executa.FieldByName('Qtd' ).AsString;



   Panel_TotalProvasPorAlunos.Caption:= IntToStr(StrToInt(Panel_TotalProvas.Caption)*StrToInt(Panel_TotalAlunos.Caption));

   Funcoes.ExecutaQuery(Query_MontaRelacao, 'select Tu.codcurso,  Tu.turma,  Te.CodProva, tu.QdeAlunos, Te.DataAplicacao '+
                                            ' From Testes_View Te, turmas_todas_view Tu '+
                                            ' Where Te.IdCurso = Tu.idcurso '+
                                            ' and   Te.IdTurma = Tu.IdTurma '+
                                            ' and   Te.dataaplicacao between '+#39+'01.01.'+ComboBox_Ano.Text+' 00:00'+#39+' and '+#39+'31.12.'+ComboBox_Ano.Text+' 00:00'+#39+
                                            ' and   ( Te.referenciaAvaliacao Like '+#39+'%T'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%2'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%F'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%R'+#39+' or '+
                                            '         Te.referenciaAvaliacao Like '+#39+'%D'+#39+
                                            '        ) '+
                                            ' Order By Te.DataAplicacao '
                       );

end;


procedure TForm_EstatisticaAplicacaoProva.JvTransparentButton_ExcelClick( Sender: TObject);
var
   objExcel,Sheet : Variant;
   cTitulo : string;
   i: integer;
begin
   cTitulo := 'Estat�stica Aplica��o de Prova';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   // Preenchendo as Colunas
   Sheet.Range['A1'] := 'Pesquisa das provas realizadas ano '+ComboBox_Ano.Text;

   Sheet.Cells[3,1] := Panel_Teorica.Caption;
   Sheet.Cells[4,1] := Panel_Pratica.Caption;
   Sheet.Cells[5,1] := Panel_2Chamada.Caption;
   Sheet.Cells[6,1] := Panel_RecTeorica.Caption;
   Sheet.Cells[7,1] := Panel_RecPratica.Caption;
   Sheet.Cells[8,1] := Panel_Diagnostica.Caption;
   Sheet.Cells[10,1] := Panel1_TotalProvas.Caption;
   Sheet.Cells[11,1] := Panel1_TotalAlunos.Caption;
   Sheet.Cells[12,1] := Panel_Total.Caption;

   Sheet.Cells[3,2] := Panel_ProvaTeorica.Caption;
   Sheet.Cells[4,2] := Panel_ProvaPratica.Caption;
   Sheet.Cells[5,2] := Panel_ProvaSegunda.Caption;
   Sheet.Cells[6,2] := Panel_ProvaRecTeo.Caption;
   Sheet.Cells[7,2] := Panel_ProvaRecPra.Caption;
   Sheet.Cells[8,2] := Panel_ProvaDiagnostica.Caption;
   Sheet.Cells[10,2] := Panel_TotalProvas.Caption;
   Sheet.Cells[11,2] := Panel_TotalAlunos.Caption;
   Sheet.Cells[12,2] := Panel_TotalProvasPorAlunos.Caption;

   Sheet.Cells[3,4] := 'C�d. Curso';
   Sheet.Cells[3,5] := 'Turma';
   Sheet.Cells[3,6] := 'C�d. Prova';
   Sheet.Cells[3,7] := 'Qde Alunos';
   Sheet.Cells[3,8] := 'Data Aplica��o';

   i:= 5;
   Query_MontaRelacao.First;
   While not Query_MontaRelacao.Eof do
   begin
      Sheet.Cells[i,4] := Query_MontaRelacao.FieldByName('CodCurso').AsString;
      Sheet.Cells[i,5] := Query_MontaRelacao.FieldByName('Turma').AsString;
      Sheet.Cells[i,6] := Query_MontaRelacao.FieldByName('CodProva').AsString;
      Sheet.Cells[i,7] := Query_MontaRelacao.FieldByName('QdeAlunos').AsString;
      Sheet.Cells[i,8] := trim(Query_MontaRelacao.FieldByName('DataAplicacao').AsString);
      i:= i + 1;
      Query_MontaRelacao.Next;
   end;

end;
end.
