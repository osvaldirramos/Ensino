unit Rel_GPE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_GPE = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel_dataAtualizacao: TQRLabel;
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
    QRLabel_N_Itens: TQRLabel;
    QRLabel_InstrumentoAvaliacao: TQRLabel;
    QRLabel_DataAvaliacao: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape3: TQRShape;
    QRSysData3: TQRSysData;
    QRLabel_Pagina: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRImage_Encarregado: TQRImage;
    QRImage_Chefe_EAVA: TQRImage;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_GPE: TForm_Rel_GPE;

implementation

uses Se_Prova, Module, MontaGabarito;

{$R *.dfm}

procedure TForm_Rel_GPE.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);
   QRLabel_N_Itens.Caption:= 'Nº de Itens: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('TotalItens').AsString;
   QRLabel_InstrumentoAvaliacao.Caption:= 'Instrumento de Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
   QRLabel_DataAvaliacao.Caption:= 'Data da Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log02.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Encarregado.jpg') = True then
      QRImage_Encarregado.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Encarregado.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Chefe_EAVA.jpg') = True then
      QRImage_Chefe_EAVA.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Chefe_EAVA.jpg');

   QRLabel_dataAtualizacao.Caption:= 'Data de atualização: '+DateToStr(Date);

   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_Cad_Prova.NPaginas);
end;

procedure TForm_Rel_GPE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
