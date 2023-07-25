unit Rel_RelatorioDeCodigoAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, Rotinas;

type
  TForm_Rel_RelacaoComCodigo = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail_Comentario: TQRSubDetail;
    IBQuery_AlunoTurma: TIBQuery;
    QRBand2: TQRBand;
    QRLabel_Curso: TQRLabel;
    QRLabel_Cabec: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText_Nome_Guerra: TQRDBText;
    IBQuery_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_AlunoTurmaCODIGO: TIntegerField;
    QRDBText1: TQRDBText;
    IBQuery_AlunoTurmaNOMEGUERRA: TIBStringField;
    QRLabel_Codigo: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail_ComentarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_RelacaoComCodigo: TForm_Rel_RelacaoComCodigo;

implementation

uses Menu_Principal, Module;

{$R *.dfm}

procedure TForm_Rel_RelacaoComCodigo.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   IBQuery_AlunoTurma.Open;
end;

procedure TForm_Rel_RelacaoComCodigo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_RelacaoComCodigo.QRSubDetail_ComentarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_Codigo.Caption:=  FormatFloat('000', IBQuery_AlunoTurma.FieldbyName('Codigo').AsInteger);
end;

end.
