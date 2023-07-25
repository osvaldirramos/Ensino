unit Rel_AtaDePresenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_APA = class(TForm)
    QuickRep1: TQuickRep;
    Query_RelacaoAlunos: TIBQuery;
    QRBand4: TQRBand;
    QRLabel_NomeAluno: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel19: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRImage_Log01: TQRImage;
    QRImage_Log02: TQRImage;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_HoraInicio: TQRLabel;
    QRLabel_InstrumentoAvaliacao: TQRLabel;
    QRLabel_DataAvaliacao: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRBand7: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel41: TQRLabel;
    QRShape3: TQRShape;
    QRSysData3: TQRSysData;
    QRLabel_Pagina: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel_dataAtualizacao: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape6: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel17: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_APA: TForm_Rel_APA;

implementation

uses Se_Prova, Module;

{$R *.dfm}

procedure TForm_Rel_APA.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_NomeAluno.Caption:= Trim(Query_RelacaoAlunos.FieldByName('PostoGraduacao').AsString)+' '+
                               Query_RelacaoAlunos.FieldByName('Nome').AsString;
end;

procedure TForm_Rel_APA.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   Status: Boolean;
begin
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
     Status:= True
   else
     Status:= False;

    QRLabel_ElaboradoPorNome.Visible:= Status;
    QRLabel_ElaboradoPorPosto.Visible:= Status;

    QRLabel_AprovadoPorNome.Visible:= Status;
    QRLabel_AprovadoPorPosto.Visible:= Status;

    Query_RelacaoAlunos.Open;

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;

   QRLabel_InstrumentoAvaliacao.Caption:= 'Instrumento de Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
   QRLabel_DataAvaliacao.Caption:= 'Data Avaliação:'+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log02.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg');

   QRLabel_dataAtualizacao.Caption:= 'Data de atualização: '+DateToStr(Date);

   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_Cad_Prova.NPaginas);
end;

procedure TForm_Rel_APA.FormActivate(Sender: TObject);
begin
   Query_RelacaoAlunos.Open;
end;

procedure TForm_Rel_APA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_RelacaoAlunos.Close;
   Action:= caFree;
end;

end.
