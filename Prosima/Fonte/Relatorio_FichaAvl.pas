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
    QRLabel_DescCurso: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText_Nome_Guerra: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel_Otimo: TQRLabel;
    QRLabel_Bom: TQRLabel;
    QRLabel_Regular: TQRLabel;
    QRLabel_NS: TQRLabel;
    QRLabel_NA: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    QRBand_Comentario: TQRBand;
    QRDBRichText1: TQRDBRichText;
    QRShape19: TQRShape;
    QRShape18: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    IBTable_CadFichaAvl: TIBTable;
    IBTable_CadFichaAvlIDCURSO: TSmallintField;
    IBTable_CadFichaAvlIDTURMA: TIntegerField;
    IBTable_CadFichaAvlID_FICHA: TIntegerField;
    IBTable_CadFichaAvlID_ATCO: TIBStringField;
    IBTable_CadFichaAvlID_AVL: TIBStringField;
    IBTable_CadFichaAvlID_EXERCICIO: TIntegerField;
    IBTable_CadFichaAvlID_INSTRUTOR: TIBStringField;
    IBTable_CadFichaAvlNOMECOMPLETO: TIBStringField;
    IBTable_CadFichaAvlDATA_AVL: TDateTimeField;
    IBTable_CadFichaAvlLOCAL: TIBStringField;
    IBTable_CadFichaAvlMEDIA: TIBBCDField;
    IBTable_CadFichaAvlPARECER: TBlobField;
    IBTable_CadFichaAvlNS: TIBStringField;
    IBTable_CadFichaAvlFICHACOMPLETA: TIBStringField;
    DST_Cad_FichaAvl: TDataSource;
    IBQuery_PR_Avaliacao: TIBQuery;
    IBQuery_PR_AvaliacaoAREA_AVALIACAO: TIBStringField;
    IBQuery_PR_AvaliacaoBOM: TIBStringField;
    IBQuery_PR_AvaliacaoDESCRICAO: TIBStringField;
    IBQuery_PR_AvaliacaoID_ATCO: TIBStringField;
    IBQuery_PR_AvaliacaoID_AVL: TIBStringField;
    IBQuery_PR_AvaliacaoID_EXERCICIO: TIntegerField;
    IBQuery_PR_AvaliacaoID_FICHA: TIntegerField;
    IBQuery_PR_AvaliacaoID_ITEM: TIBStringField;
    IBQuery_PR_AvaliacaoIDCURSO: TSmallintField;
    IBQuery_PR_AvaliacaoIDTURMA: TIntegerField;
    IBQuery_PR_AvaliacaoNA: TIBStringField;
    IBQuery_PR_AvaliacaoNS: TIBStringField;
    IBQuery_PR_AvaliacaoOTIMO: TIBStringField;
    IBQuery_PR_AvaliacaoREGULAR: TIBStringField;
    DSQ_PR_Avaliacao: TDataSource;
    IBTable_Aluno: TIBTable;
    IBTable_AlunoIDCURSO: TSmallintField;
    IBTable_AlunoIDTURMA: TIntegerField;
    IBTable_AlunoIDENTIDADE: TIBStringField;
    IBTable_AlunoNOMECOMPLETO: TIBStringField;
    IBTable_AlunoIDUNIDADE: TIBStringField;
    IBTable_AlunoIDSUBUNIDADE: TIBStringField;
    IBTable_instrutor: TIBTable;
    IBTable_instrutorIDCURSO: TSmallintField;
    IBTable_instrutorIDTURMA: TIntegerField;
    IBTable_instrutorIDENTIDADE: TIBStringField;
    IBTable_instrutorCODIGOINSTRUTOR: TIntegerField;
    IBTable_instrutorFUNCAO: TIBStringField;
    IBTable_instrutorNOMECOMPLETO: TIBStringField;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRGroup_Svc_Terceiro: TQRGroup;
    QRSubDetail_Svc_Terceiro: TQRSubDetail;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape20: TQRShape;
    QRLabel19: TQRLabel;
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
    QRLabel_Turma: TQRLabel;
    IBTable_AlunoESTAGIARIO: TIBStringField;
    procedure QRSubDetail_DadosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand_CabecalhoAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand_CabecalhoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private          { Private declarations }
     VI_Otimo, VI_Bom, VI_Regular, VI_NS, VI_NA: Integer;
  public
    { Public declarations }
  end;

var
  Form_Relatorio_FichaAvl: TForm_Relatorio_FichaAvl;

implementation

uses Sel_Rel_FichaAvaliacao, MontaFicha, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

procedure TForm_Relatorio_FichaAvl.QRSubDetail_DadosBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_Otimo.Caption:= ' ';
   QRLabel_Bom.Caption:= ' ';
   QRLabel_Regular.Caption:= ' ';
   QRLabel_NS.Caption:= ' ';
   QRLabel_NA.Caption:= ' ';

   if IBQuery_PR_Avaliacao.FieldByName('Otimo').AsInteger = 1 then
   begin
      QRLabel_Otimo.Caption:= 'X';
      VI_Otimo:= VI_Otimo+1;
   end
   else
   begin
      if IBQuery_PR_Avaliacao.FieldByName('Bom').AsInteger = 1 then
      begin
         QRLabel_Bom.Caption:= 'X';
         VI_Bom:= VI_Bom+1;
      end
      else
      begin
         if IBQuery_PR_Avaliacao.FieldByName('Regular').AsInteger = 1 then
         begin
            QRLabel_Regular.Caption:= 'X';
            VI_Regular:= VI_Regular+1;
         end
         else
         begin
            if IBQuery_PR_Avaliacao.FieldByName('NS').AsInteger = 1 then
            begin
               QRLabel_NS.Caption:= 'X';
               VI_NS:= VI_NS+1;
            end
            else
            begin
               if IBQuery_PR_Avaliacao.FieldByName('NA').AsInteger = 1 then
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
   IBTable_CadFichaAvl.Open;
   IBTable_instrutor.Open;
   IBTable_Aluno.Open;

   IBQuery_PR_Avaliacao.Open;

   QRLabel_Turma.Caption:= Form_Sel_Rel_FichaAvaliacao.DBEdit_Turma.Text;

   VI_Otimo:= 0;
   VI_Bom:= 0;
   VI_Regular:= 0;
   VI_NS:= 0;
   VI_NA:= 0;

end;

procedure TForm_Relatorio_FichaAvl.QRBand_CabecalhoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_Turma.Caption:= Form_Sel_Rel_FichaAvaliacao.DBEdit_Turma.Text;

end;

end.
