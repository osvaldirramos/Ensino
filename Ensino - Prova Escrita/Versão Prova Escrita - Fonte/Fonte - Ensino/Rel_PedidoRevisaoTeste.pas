unit Rel_PedidoRevisaoTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery;

type
  TForm_Rel_PedidoRevisaoTeste = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRShape8: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRImage1: TQRImage;
    QRDBRichText1: TQRDBRichText;
    QRDBText3: TQRDBText;
    QRLabel_Curso: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel_DocenteNome: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel_ParecerDo_01: TQRLabel;
    QRLabel_ParecerDo_02: TQRLabel;
    QRShape11: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel_ParecerCh_01: TQRLabel;
    QRLabel_ParecerCh_02: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape12: TQRShape;
    QRDBText14: TQRDBText;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel_ResA: TQRLabel;
    QRLabel_ResB: TQRLabel;
    QRLabel_ResC: TQRLabel;
    QRLabel_ResD: TQRLabel;
    QRLabel_ResBr: TQRLabel;
    QRLabel_DocenteData: TQRLabel;
    QRLabel_ChefeEAVAData: TQRLabel;
    QRLabel_ChefeEAVANome: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
//    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_PedidoRevisaoTeste: TForm_Rel_PedidoRevisaoTeste;

implementation

uses PedidoRevisaoItem;

{$R *.dfm}

procedure TForm_Rel_PedidoRevisaoTeste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_PedidoRevisaoTeste.QuickRep1StartPage(Sender: TCustomQuickRep);
begin
    QRLabel_DocenteNome.Caption:= 'Docente: ' +Form_PedidoRevisaoItem.DBEdit_NomeDocente.Text;
    QRLabel_DocenteData.Caption:= 'Data: ' +Form_PedidoRevisaoItem.JvDBDate_DataDocente.Text;

    QRLabel_ChefeEAVANome.Caption:= 'Chefe EAVA: ' +Form_PedidoRevisaoItem.DBEdit_ChefeEAVA.Text;
    QRLabel_ChefeEAVAData.Caption:= 'Data: ' +Form_PedidoRevisaoItem.JvDBDateEdit_ChefeEAVA.Text;

    QRLabel_ResA.Caption:= Form_PedidoRevisaoItem.DBGrid_Lista.Cells[0, 1];
    QRLabel_ResB.Caption:= Form_PedidoRevisaoItem.DBGrid_Lista.Cells[1, 1];
    QRLabel_ResC.Caption:= Form_PedidoRevisaoItem.DBGrid_Lista.Cells[2, 1];
    QRLabel_ResD.Caption:= Form_PedidoRevisaoItem.DBGrid_Lista.Cells[3, 1];
    QRLabel_ResBr.Caption:= Form_PedidoRevisaoItem.DBGrid_Lista.Cells[4, 1];

    if Form_PedidoRevisaoItem.IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString <> '' then
    begin
       QRLabel_ParecerDo_01.Caption:= Form_PedidoRevisaoItem.IBTable_PedidoRevisaoItem.FieldByName('Providencia_Docente').AsString;
       QRLabel_ParecerDo_02.Caption:= '';
    end;

    if Form_PedidoRevisaoItem.IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString <> '' then
    begin
       QRLabel_ParecerCh_01.Caption:= Form_PedidoRevisaoItem.IBTable_PedidoRevisaoItem.FieldByName('Providencia_EAVA').AsString;
       QRLabel_ParecerCh_02.Caption:= '';
    end;

end;

end.
