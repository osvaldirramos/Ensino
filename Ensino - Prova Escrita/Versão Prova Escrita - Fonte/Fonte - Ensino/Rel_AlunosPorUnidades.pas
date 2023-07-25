{ QuickReport master detail template }

unit Rel_AlunosPorUnidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Rotinas,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, jpeg, IBCustomDataSet, IBTable,
  IBQuery;

type
  TForm_Rel_AlunosPorUnidades = class(TQuickRep)
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRImage_Brasao: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    Query_RelacaoAlunos: TIBQuery;
    DSQ_RelacaoAlunos: TDataSource;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape91: TQRShape;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand4: TQRBand;
    QRLabel_ResponsavelAssinatura: TQRLabel;
    QRLabel_Descricao_Secao_AEN: TQRLabel;
    QRLabel_Responsavel_AEN: TQRLabel;
    QRLabel_DescricaoSecao: TQRLabel;
    QRLabel_LocalData: TQRLabel;
    QRLabel17: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_AlunosPorUnidades: TForm_Rel_AlunosPorUnidades;

implementation

uses ConsultaValoresCurso, Module;

{$R *.DFM}

procedure TForm_Rel_AlunosPorUnidades.QuickRepAfterPreview(Sender: TObject);
begin
   Query_RelacaoAlunos.Close;
   Query_RelacaoAlunos.Open;
   if FileExists('Brasao_Ensino.jpg') = True then
      QRImage_Brasao.Picture.LoadFromFile('Brasao_Ensino.jpg');

end;

procedure TForm_Rel_AlunosPorUnidades.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   Query_RelacaoAlunos.Close;
   Query_RelacaoAlunos.Open;
   if Form_AlunosPorInstituicao.VB_SelecaoResponsavelAssinatura = False then
   begin
      DM.IBQuery_Cargo.First;

     if DM.IBQuery_Cargo.Locate('SIGLA','ECEC',[]) then
       //
   end;

   QRLabel_LocalData.Caption:= Funcoes.RetornaCidade(DateToStr(Date));
   QRLabel_ResponsavelAssinatura.Caption:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+' - '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);
   QRLabel_DescricaoSecao.Caption:= Funcoes.CentraStr(DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString, 13+length(QRLabel_ResponsavelAssinatura.Caption));

end;

end.
