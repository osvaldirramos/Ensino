unit Rel_FichaDeDesimpedimentoDeInstrutoresPorTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery;

type
  TForm_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRLabel_NomeInstrutor: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel_Subdivisao: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRSysData_Atual: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel_CodTurma: TQRLabel;
    QRLabel_CodCurso: TQRLabel;
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
  Form_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma: TForm_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma;

implementation

uses Sel_Turma, Module;

{$R *.dfm}

procedure TForm_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_NomeInstrutor.Caption:= Trim(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+' '+
                               Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Nome').AsString;

end;

procedure TForm_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'   
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';
       
   QRLabel_CodCurso.Caption:= Funcoes.GetCodCurso;
   QRLabel_CodTurma.Caption:= Trim(Form_SelTurma.ComboBox_Turma.Text)+'/'+Trim(Form_SelTurma.DBEdit_ano.Text);
   QRLabel_NomeInstrutor.Caption:= Trim(Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('PostoGraduacao').AsString)+' '+
                               Form_SelTurma.IBQuery_InstrutorTurma.FieldByName('Nome').AsString;

end;

procedure TForm_Rel_FichaDeDesimpedimentoDeInstrutores_PorTurma.FormClose( Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
