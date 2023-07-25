unit Rel_ControleDeRefeicoes_Instrutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas, Rotinas_TrataData,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery;

type
  TForm_Rel_ControleDeRefeicoes_Instrutor = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRLabel_NomeAluno: TQRLabel;
    QRShape18: TQRShape;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel_Semana: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape32: TQRShape;
    QRLabel14: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRBand4: TQRBand;
    QRLabel_Descricao_Secao_AEN: TQRLabel;
    QRLabel_Responsavel_AEN: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape71: TQRShape;
    QRShape73: TQRShape;
    QRLabel_Observacao: TQRLabel;
    QRShape74: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape92: TQRShape;
    QRShape72: TQRShape;
    QRShape75: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape8: TQRShape;
    QRLabel15: TQRLabel;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape12: TQRShape;
    QRLabel18: TQRLabel;
    QRShape14: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape15: TQRShape;
    QRLabel22: TQRLabel;
    QRShape25: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape26: TQRShape;
    QRLabel28: TQRLabel;
    QRShape28: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape29: TQRShape;
    QRLabel31: TQRLabel;
    QRShape30: TQRShape;
    QRShape33: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape31: TQRShape;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape13: TQRShape;
    QRShape16: TQRShape;
    QRShape24: TQRShape;
    QRShape9: TQRShape;
    QRShape27: TQRShape;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel_Instituto: TQRLabel;
    QRShape23: TQRShape;
    QRLabel_CodCurso: TQRLabel;
    QRLabel_CodTurma: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_ControleDeRefeicoes_Instrutor: TForm_Rel_ControleDeRefeicoes_Instrutor;

implementation

uses Sel_Turma, MenuPrincipal, Module;

{$R *.dfm}

procedure TForm_Rel_ControleDeRefeicoes_Instrutor.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   Form_SelTurma.IBQuery_InstrutorTurma.Open;
   QRLabel_NomeAluno.Caption:= Trim(Form_SelTurma.IBQuery_InstrutorTurma_Rel.FieldByName('PostoGraduacao').AsString)+' '+
                               Form_SelTurma.IBQuery_InstrutorTurma_Rel.FieldByName('Nome').AsString;
end;

procedure TForm_Rel_ControleDeRefeicoes_Instrutor.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_Inicio, VS_Termino: String;
begin
   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'   
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';

   //   Form_SelTurma.IBQuery_InstrutorTurma.Open;
   QRLabel_CodCurso.Caption:= Form_SelTurma.ComboBox_Curso.Text;
   if Form_SelTurma.Edit_UnidadeAl.Text = '' then
   begin
      QRLabel_CodTurma.Caption:=  DM.IBTable_Turma.FieldByName('Turma').AsString+'/'+
                                  DM.IBTable_Turma.FieldByName('Ano').AsString;
   end
   else
   begin
      QRLabel_CodTurma.Caption:=  DM.IBTable_Turma.FieldByName('Turma').AsString+'/'+
                                  DM.IBTable_Turma.FieldByName('Ano').AsString+' ('+
                                  trim(Form_SelTurma.Edit_UnidadeAl.Text)+')';
   end;
   QRLabel_Instituto.Caption:= DM.IBTable_Configuracao.FieldByName('Nome').AsString;

   VS_Inicio:= DateToStr(Form_SelTurma.JvDateEdit_DataInicio.Date+7);
   VS_Termino:= DateToStr(Form_SelTurma.JvDateEdit_DataTermino.Date+9);

   QRLabel_Semana.Caption:= 'Semana de '+Funcoes_TrataData.FormatarData(VS_Inicio, 'yy')+' a '+Funcoes_TrataData.FormatarData(VS_Termino, 'yy');
   QRLabel_Observacao.Caption:= 'Observação: Esta folha deverá ser devolvida até as 14:00 do dia '+Funcoes_TrataData.FormatarData(DateToStr(Form_SelTurma.JvDateEdit_DataInicio.Date), 'yy');
end;

procedure TForm_Rel_ControleDeRefeicoes_Instrutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
