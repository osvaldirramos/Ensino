unit Rel_GDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_GDA = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRImage_Log01: TQRImage;
    QRImage_Log02: TQRImage;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel_Serie: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape13: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel_dataAtualizacao: TQRLabel;
    QRLabel41: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRSysData3: TQRSysData;
    QRLabel_Pagina: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_GDA: TForm_Rel_GDA;

implementation

uses Module, CorrecaoProva;

{$R *.dfm}

procedure TForm_Rel_GDA.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
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

   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg') = True then
      QRImage_Log02.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg');

   QRLabel_dataAtualizacao.Caption:= 'Data de atualização: '+DateToStr(Date);

   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_Cad_CorrecaoProva.NPaginas);
end;

procedure TForm_Rel_GDA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
