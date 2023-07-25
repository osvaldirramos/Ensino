unit Rel_RetiradaDeFaltas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas, Rotinas_TrataData,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids;

type
  TForm_Rel_RetiradaDeFaltas = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel_NomeAluno: TQRLabel;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRShape31: TQRShape;
    QRLabel_Seg: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape32: TQRShape;
    QRLabel14: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape87: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape34: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape42: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape91: TQRShape;
    QRShape93: TQRShape;
    QRBand4: TQRBand;
    QRShape72: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape79: TQRShape;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape152: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape158: TQRShape;
    QRShape160: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel_Instituto: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape8: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRShape13: TQRShape;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRLabel17: TQRLabel;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape26: TQRShape;
    QRLabel20: TQRLabel;
    QRShape27: TQRShape;
    QRShape14: TQRShape;
    QRShape24: TQRShape;
    QRShape18: TQRShape;
    QRLabel_Semana: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape25: TQRShape;
    QRShape9: TQRShape;
    QRShape16: TQRShape;
    QRShape19: TQRShape;
    QRShape22: TQRShape;
    QRLabel8: TQRLabel;
    QRShape23: TQRShape;
    QRLabel_CodCurso: TQRLabel;
    QRLabel_CodTurma: TQRLabel;
    IBQuery_Chamada: TIBQuery;
    IBQuery_ChamadaIDCURSO: TSmallintField;
    IBQuery_ChamadaIDTURMA: TIntegerField;
    IBQuery_ChamadaNOMEGUERRA: TIBStringField;
    IBQuery_ChamadaPOSTOGRADUACAO: TIBStringField;
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
  Form_Rel_RetiradaDeFaltas: TForm_Rel_RetiradaDeFaltas;

implementation

uses Sel_Turma, MenuPrincipal, Module;

{$R *.dfm}

procedure TForm_Rel_RetiradaDeFaltas.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   IBQuery_Chamada.Open;
   QRLabel_NomeAluno.Caption:= Trim(IBQuery_Chamada.FieldByName('PostoGraduacao').AsString)+' '+
                                    IBQuery_Chamada.FieldByName('NomeGuerra').AsString;

end;

procedure TForm_Rel_RetiradaDeFaltas.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   IBQuery_Chamada.Open;
   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'   
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';

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
   QRLabel_Semana.Caption:= Funcoes_TrataData.FormatarData(Form_SelTurma.JvDateEdit_DataInicio.Text, 'yy')+' a '+Funcoes_TrataData.FormatarData(Form_SelTurma.JvDateEdit_DataTermino.Text, 'yy');
end;

procedure TForm_Rel_RetiradaDeFaltas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Chamada.Close;
   Action:= caFree;
end;

end.
