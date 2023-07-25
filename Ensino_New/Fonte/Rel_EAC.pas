unit Rel_EAC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_EAC = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRImage_Log01: TQRImage;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_Periodo: TQRLabel;
    IBQuery_Providencia: TIBQuery;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText_Comentario: TQRDBText;
    IBQuery_ProvidenciaIDCURSO: TSmallintField;
    IBQuery_ProvidenciaIDTURMA: TIntegerField;
    IBQuery_ProvidenciaIDSECAO: TIntegerField;
    IBQuery_ProvidenciaSIGLA: TIBStringField;
    IBQuery_ProvidenciaDESCRICAO: TIBStringField;
    IBQuery_ProvidenciaGRUPO: TIntegerField;
    DSQ_Providencia: TDataSource;
    IBQuery_TratarProvidencias: TIBQuery;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel_AcaoRecomendada: TQRLabel;
    QRShape3: TQRShape;
    QRBand4: TQRBand;
    QRImage: TQRImage;
    QRLabel_Versao: TQRLabel;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
  private       { Private declarations }
     VR_Contador, VR_MediaTurma: Real;
  public
    { Public declarations }
  end;

var
  Form_Rel_EAC: TForm_Rel_EAC;

implementation

uses Providencia, Module;

{$R *.dfm}

procedure TForm_Rel_EAC.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   //---- Tratamento para mostrar a versão do Documento

   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
   begin
      QRLabel_Versao.Caption:= 'Versão: '+DM.IBTable_Versao_SGQ.FieldByName('VERSAO').AsString;
      QRLabel_dataAtualizacao_SGQ.Caption:= 'Atualização SGEW: '+DM.IBTable_Versao_SGQ.FieldByName('DATA').AsString;
   end;

   IBQuery_Providencia.Open;
   IBQuery_TratarProvidencias.Open;

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;
   QRLabel_Periodo.Caption:= 'Período: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString)+' a '+DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
end;

procedure TForm_Rel_EAC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Providencia.Open;
   IBQuery_TratarProvidencias.Close;
   IBQuery_Providencia.Close;
   Action:= caFree;
end;

procedure TForm_Rel_EAC.QuickRep1StartPage(Sender: TCustomQuickRep);
var
   Status: Boolean;
begin
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
   begin
      QRLabel_ElaboradoPorNome.Caption:= '';
      QRLabel8.Caption:= '';

      QRLabel_AprovadoPorNome.Caption:= '';
      QRLabel6.Caption:= '';
   end;
end;

end.
