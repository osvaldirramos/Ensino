unit Rel_ProgramaDeTrabalhoSemanal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_PTS = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel_Curso: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel_Desc_Semana: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRShape47: TQRShape;
    QRLabel8: TQRLabel;
    QRShape48: TQRShape;
    QRLabel10: TQRLabel;
    QRShape49: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape11: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRShape20: TQRShape;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape29: TQRShape;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRShape38: TQRShape;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape8: TQRShape;
    QRShape12: TQRShape;
    QRShape7: TQRShape;
    QRDBText48: TQRDBText;
    QRLabel_Semana: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText46: TQRDBText;
    QRShape25: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape26: TQRShape;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRDBText57: TQRDBText;
    QRLabel3: TQRLabel;
    QRShape32: TQRShape;
    QRShape37: TQRShape;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRDBText66: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_PTS: TForm_Rel_PTS;

implementation

uses Cad_PTS, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure que trata a abertura do Relatorio de PTS
//------------------------------------------------------------------------------

procedure TForm_Rel_PTS.QuickRep1BeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
begin
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select CodCurso, NomeCurso from Curso where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString);

   QRLabel_Curso.Caption:= Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString)+' - '+Trim(DM.IBQuery_Executa.FieldByName('NomeCurso').AsString);

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';

//   QRLabel_Semana.Caption:= 'SEMANA: '+Trim(Form_Cad_PTS.ComboBox_Semana.Text)+'/'+Trim(Form_Cad_PTS.Label_Semanas.Caption);
   QRLabel_Semana.Caption:= '/'+Trim(Form_Cad_PTS.Label_Semanas.Caption);
   QRLabel_Turma.Caption:=  Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString)+'/'+Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);


//Form_Cad_PTS.IBQuery_PTS

//   QRLabel_Data02.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_02').AsString;
//   QRLabel_Data03.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_03').AsString;
//   QRLabel_Data04.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_04').AsString;
//   QRLabel_Data05.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_05').AsString;
//   QRLabel_Data06.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_06').AsString;

//   QRLabel_Data02.Caption:= copy(Form_Cad_PTS.JvDateEdit_Segunda.Text,1,5);
//   QRLabel_Data03.Caption:= Form_Cad_PTS.Label_Data03.Caption;
//  QRLabel_Data04.Caption:= Form_Cad_PTS.Label_Data04.Caption;
//   QRLabel_Data05.Caption:= Form_Cad_PTS.Label_Data05.Caption;
//   QRLabel_Data06.Caption:= Form_Cad_PTS.Label_Data06.Caption;
end;

procedure TForm_Rel_PTS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;


procedure TForm_Rel_PTS.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 //  QRLabel_Data02.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_02').AsString;
 //  QRLabel_Data03.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_03').AsString;
 //  QRLabel_Data04.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_04').AsString;
 //  QRLabel_Data05.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_05').AsString;
 //  QRLabel_Data06.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_06').AsString;

end;

procedure TForm_Rel_PTS.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//     QRLabel_Data02.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_02').AsString;
//   QRLabel_Data03.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_03').AsString;
//   QRLabel_Data04.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_04').AsString;
//   QRLabel_Data05.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_05').AsString;
//   QRLabel_Data06.Caption:= Form_Cad_PTS.IBQuery_PTS.FieldByName('Data_06').AsString;

end;

end.
