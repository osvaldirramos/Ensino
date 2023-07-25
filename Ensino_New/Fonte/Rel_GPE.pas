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
    QRLabel5: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRImage_Encarregado: TQRImage;
    QRImage_Chefe_EAVA: TQRImage;
    QRLabel_Versao: TQRLabel;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
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
   //---- Tratamento para mostrar a versão do Documento

   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
   begin
      QRLabel_Versao.Caption:= 'Versão: '+DM.IBTable_Versao_SGQ.FieldByName('VERSAO').AsString;
      QRLabel_dataAtualizacao_SGQ.Caption:= 'Atualização SGEW: '+DM.IBTable_Versao_SGQ.FieldByName('DATA').AsString;
   end
   else
   begin
      QRLabel_Versao.Caption:= '';
      QRLabel_dataAtualizacao_SGQ.Caption:= '';
   end;


   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);
   QRLabel_N_Itens.Caption:= 'Nº de Itens: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('TotalItens').AsString;
   QRLabel_InstrumentoAvaliacao.Caption:= 'Instrumento de Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
   QRLabel_DataAvaliacao.Caption:= 'Data da Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Encarregado.jpg') = True then
      QRImage_Encarregado.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Encarregado.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Chefe_EAVA.jpg') = True then
      QRImage_Chefe_EAVA.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Chefe_EAVA.jpg');
end;

procedure TForm_Rel_GPE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_GPE.QuickRep1StartPage(Sender: TCustomQuickRep);
var
   Status: Boolean;
begin
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
   begin
      QRLabel8.Caption:= '';
      QRLabel1.Caption:= '';

      QRLabel9.Caption:= '';
      QRLabel10.Caption:= '';
   end;
end;

end.
