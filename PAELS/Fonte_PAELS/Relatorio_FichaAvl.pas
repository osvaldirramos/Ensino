unit Relatorio_FichaAvl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, JvGIF;

type
  TForm_Relatorio_FichaAvl = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail_Dados: TQRSubDetail;
    QRBand_Cabecalho: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText_Nome_Guerra: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel_Otimo: TQRLabel;
    QRLabel_Bom: TQRLabel;
    QRLabel_Regular: TQRLabel;
    QRLabel_NS: TQRLabel;
    QRLabel_NA: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape17: TQRShape;
    QRLabel14: TQRLabel;
    QRImage1: TQRImage;
    QRBand_Comentario: TQRBand;
    QRDBRichText1: TQRDBRichText;
    QRShape19: TQRShape;
    QRShape18: TQRShape;
    QRLabel18: TQRLabel;
    QRGroup_Svc_Terceiro: TQRGroup;
    QRSubDetail_Svc_Terceiro: TQRSubDetail;
    QRShape20: TQRShape;
    QRShape26: TQRShape;
    QRLabel21: TQRLabel;
    QRShape28: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel_TotOtimo: TQRLabel;
    QRLabel_TotBom: TQRLabel;
    QRLabel_TotRegular: TQRLabel;
    QRLabel_TotNS: TQRLabel;
    QRLabel_TotNA: TQRLabel;
    QRShape9: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape27: TQRShape;
    QRLabel_DescCurso: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    IBTable_Aluno: TIBTable;
    IBTable_AlunoIDCURSO: TSmallintField;
    IBTable_AlunoIDTURMA: TIntegerField;
    IBTable_AlunoIDENTIDADE: TIBStringField;
    IBTable_AlunoNOMECOMPLETO: TIBStringField;
    IBTable_AlunoIDUNIDADE: TIBStringField;
    IBTable_AlunoIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoESTAGIARIO: TIBStringField;
    QRLabel24: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    procedure QRSubDetail_DadosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand_CabecalhoAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private          { Private declarations }
     VI_Otimo, VI_Bom, VI_Regular, VI_NS, VI_NA: Integer;
  public
    { Public declarations }
  end;

var
  Form_Relatorio_FichaAvl: TForm_Relatorio_FichaAvl;

implementation

uses Module;


{$R *.dfm}

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

procedure TForm_Relatorio_FichaAvl.QRSubDetail_DadosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_Otimo.Caption:= ' ';
   QRLabel_Bom.Caption:= ' ';
   QRLabel_Regular.Caption:= ' ';
   QRLabel_NS.Caption:= ' ';
   QRLabel_NA.Caption:= ' ';

   if DM.IBQuery_PR_Avaliacao.FieldByName('Otimo').AsInteger = 1 then
   begin
      QRLabel_Otimo.Caption:= 'X';
      VI_Otimo:= VI_Otimo+1;
   end
   else
   begin
      if DM.IBQuery_PR_Avaliacao.FieldByName('Bom').AsInteger = 1 then
      begin
         QRLabel_Bom.Caption:= 'X';
         VI_Bom:= VI_Bom+1;
      end
      else
      begin
         if DM.IBQuery_PR_Avaliacao.FieldByName('Regular').AsInteger = 1 then
         begin
            QRLabel_Regular.Caption:= 'X';
            VI_Regular:= VI_Regular+1;
         end
         else
         begin
            if DM.IBQuery_PR_Avaliacao.FieldByName('NS').AsInteger = 1 then
            begin
               QRLabel_NS.Caption:= 'X';
               VI_NS:= VI_NS+1;
            end
            else
            begin
               if DM.IBQuery_PR_Avaliacao.FieldByName('NA').AsInteger = 1 then
               begin
                  QRLabel_NA.Caption:= 'X';
                  VI_NA:= VI_NA+1;
               end;
            end;
         end;
      end;
   end;
   QRLabel_TotOtimo.Caption:= IntToStr(VI_Otimo);
   QRLabel_TotBom.Caption:= IntToStr(VI_Bom);
   QRLabel_TotRegular.Caption:= IntToStr(VI_Regular);
   QRLabel_TotNS.Caption:= IntToStr(VI_NS);
   QRLabel_TotNA.Caption:= IntToStr(VI_NA);
end;

//------------------------------------------------------------------------------
// Tratamento antes de imprimir soma as medias dos alunos
//------------------------------------------------------------------------------

procedure TForm_Relatorio_FichaAvl.QRBand_CabecalhoAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   DM.IBQuery_PR_Avaliacao.Open;
   DM.IBTable_Cad_FichaAvl.Open;
   IBTable_Aluno.Open;

   if IBTable_Aluno.FieldByName('Estagiario').AsString = 'S' then
       QRLabel24.Caption:= ' Estágiario'
   else
       QRLabel24.Caption:= '';

   VI_Otimo:= 0;
   VI_Bom:= 0;
   VI_Regular:= 0;
   VI_NS:= 0;
   VI_NA:= 0;

end;

end.
