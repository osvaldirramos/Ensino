unit Rel_AtaDePresenca_Cindacta2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_AtaDePresenca_Cindacta2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel_NomeAluno: TQRLabel;
    QRBand2: TQRBand;
    QRShape38: TQRShape;
    QRShape91: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel_DescCurso: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Query_RelacaoAlunos: TIBQuery;
    DSQ_RelacaoAlunos: TDataSource;
    QRLabel13: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private        { Private declarations }
     Cont: Integer;
  public
    { Public declarations }
  end;

var
  Form_Rel_AtaDePresenca_Cindacta2: TForm_Rel_AtaDePresenca_Cindacta2;

implementation

uses Se_Prova, Module;

{$R *.dfm}

procedure TForm_Rel_AtaDePresenca_Cindacta2.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   Query_RelacaoAlunos.Open;
   Cont:= Cont+1;
   QRLabel_NomeAluno.Caption:= FormatFloat('#00',Cont)+' - '+Trim(Query_RelacaoAlunos.FieldByName('PostoGraduacao').AsString)+' '+
                               Query_RelacaoAlunos.FieldByName('Nome').AsString;
end;

procedure TForm_Rel_AtaDePresenca_Cindacta2.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   Cont:= 0;
   Query_RelacaoAlunos.Open;

   QRLabel_Turma.Caption:= Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;

//   QRLabel_Localidade.Caption:= trim(DM.IBTable_Configuracao.FieldByName('SIGLA').AsString);
   QRLabel_DescCurso.Caption:= Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
end;

procedure TForm_Rel_AtaDePresenca_Cindacta2.FormActivate(Sender: TObject);
begin
   Query_RelacaoAlunos.Open;
end;

procedure TForm_Rel_AtaDePresenca_Cindacta2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_RelacaoAlunos.Close;
   Action:= caFree;
end;

end.
