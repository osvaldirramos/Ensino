unit Rel_PTS_EAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_PTS_EAD = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel_DivisaoPlanejamento: TQRLabel;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRShape48: TQRShape;
    QRLabel10: TQRLabel;
    QRShape49: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape47: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel_NomeInstituto: TQRLabel;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel_CodigoCurso: TQRLabel;
    
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_PTS_EAD: TForm_Rel_PTS_EAD;

implementation

uses Cad_PTS, Module;

{$R *.dfm}

procedure TForm_Rel_PTS_EAD.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   QRLabel_NomeInstituto.Caption:= Funcoes.GetNomeInstituto;
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select CodCurso, NomeCurso from Curso where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString);
   QRLabel_CodigoCurso.Caption:= 'CÓDIGO DO CURSO: '+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' - '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString)+' A '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString);
   QRLabel_Turma.Caption:= Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString)+'/'+Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

end;

procedure TForm_Rel_PTS_EAD.FormActivate(Sender: TObject);
begin
   DM.IBTable_Configuracao.Open;
end;

end.
