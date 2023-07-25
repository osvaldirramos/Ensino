unit Rel_DIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_DIP = class(TForm)
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
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_DIP: TForm_Rel_DIP;

implementation

uses Se_Prova, Module, MontaGabarito;

{$R *.dfm}

procedure TForm_Rel_DIP.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
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

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;
   QRLabel_N_Itens.Caption:= 'Nº de Itens: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('TotalItens').AsString;
   QRLabel_InstrumentoAvaliacao.Caption:= 'Instrumento de Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
   QRLabel_DataAvaliacao.Caption:= 'Data da Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log02.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg');

   QRLabel_dataAtualizacao.Caption:= 'Data de atualização: '+DateToStr(Date);

   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_Cad_Prova.NPaginas);
end;

procedure TForm_Rel_DIP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
