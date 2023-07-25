unit Rel_ProgramaDeTrabalhoSemanal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_PTS = class(TForm)
    IBQuery_PTS: TIBQuery;
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel_Curso: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel_Semana: TQRLabel;
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
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape11: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRShape20: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRShape29: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRShape38: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
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
    IBQuery_PTSIDCURSO: TSmallintField;
    IBQuery_PTSIDTURMA: TIntegerField;
    IBQuery_PTSSEMANA: TSmallintField;
    IBQuery_PTSMSG: TIBStringField;
    IBQuery_PTSDATA_02: TIBStringField;
    IBQuery_PTSDIA_SEMANA_02: TIBStringField;
    IBQuery_PTSHORARIO_01_02: TIBStringField;
    IBQuery_PTSHORARIO_02_02: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_02: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_02: TIBStringField;
    IBQuery_PTSEQUIPE_01_02: TIBStringField;
    IBQuery_PTSEQUIPE_02_02: TIBStringField;
    IBQuery_PTSLOCAL_01_02: TIBStringField;
    IBQuery_PTSLOCAL_02_02: TIBStringField;
    IBQuery_PTSDATA_03: TIBStringField;
    IBQuery_PTSDIA_SEMANA_03: TIBStringField;
    IBQuery_PTSHORARIO_01_03: TIBStringField;
    IBQuery_PTSHORARIO_02_03: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_03: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_03: TIBStringField;
    IBQuery_PTSEQUIPE_01_03: TIBStringField;
    IBQuery_PTSEQUIPE_02_03: TIBStringField;
    IBQuery_PTSLOCAL_01_03: TIBStringField;
    IBQuery_PTSLOCAL_02_03: TIBStringField;
    IBQuery_PTSDATA_04: TIBStringField;
    IBQuery_PTSDIA_SEMANA_04: TIBStringField;
    IBQuery_PTSHORARIO_01_04: TIBStringField;
    IBQuery_PTSHORARIO_02_04: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_04: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_04: TIBStringField;
    IBQuery_PTSEQUIPE_01_04: TIBStringField;
    IBQuery_PTSEQUIPE_02_04: TIBStringField;
    IBQuery_PTSLOCAL_01_04: TIBStringField;
    IBQuery_PTSLOCAL_02_04: TIBStringField;
    IBQuery_PTSDATA_05: TIBStringField;
    IBQuery_PTSDIA_SEMANA_05: TIBStringField;
    IBQuery_PTSHORARIO_01_05: TIBStringField;
    IBQuery_PTSHORARIO_02_05: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_05: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_05: TIBStringField;
    IBQuery_PTSEQUIPE_01_05: TIBStringField;
    IBQuery_PTSEQUIPE_02_05: TIBStringField;
    IBQuery_PTSLOCAL_01_05: TIBStringField;
    IBQuery_PTSLOCAL_02_05: TIBStringField;
    IBQuery_PTSDATA_06: TIBStringField;
    IBQuery_PTSDIA_SEMANA_06: TIBStringField;
    IBQuery_PTSHORARIO_01_06: TIBStringField;
    IBQuery_PTSHORARIO_02_06: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_01_06: TIBStringField;
    IBQuery_PTSTRAB_ESCOLAR_02_06: TIBStringField;
    IBQuery_PTSEQUIPE_01_06: TIBStringField;
    IBQuery_PTSEQUIPE_02_06: TIBStringField;
    IBQuery_PTSLOCAL_01_06: TIBStringField;
    IBQuery_PTSLOCAL_02_06: TIBStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

   Funcoes.ExecutaQuery(IBQuery_PTS, 'Select * from Cad_PTS where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                     ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                     ' and Semana = '+Trim(Form_Cad_PTS.ComboBox_Semana.Text)
                       );

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';

   QRLabel_Semana.Caption:= 'SEMANA: '+Trim(Form_Cad_PTS.ComboBox_Semana.Text)+'/'+Trim(Form_Cad_PTS.Label_Semanas.Caption);
   QRLabel_Turma.Caption:=  Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString)+'/'+Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

end;

procedure TForm_Rel_PTS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_PTS.Close;
end;

end.
