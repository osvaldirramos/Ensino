unit Rel_EID;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_EID = class(TForm)
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
    QRLabel_DescCurso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRShape10: TQRShape;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText_Serie: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel_Serie: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    Query_MontaMateria: TIBQuery;
    Query_MontaMateriaIDCURSO: TSmallintField;
    Query_MontaMateriaIDTURMA: TIntegerField;
    Query_MontaMateriaCODMATERIA: TIBStringField;
    Query_MontaMateriaNOMEMATERIA: TIBStringField;
    Query_MontaMateriaQTDITENS: TIntegerField;
    QRBand1: TQRBand;
    QRLabel_Total: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage_Encarregado: TQRImage;
    QRImage_Chefe_EAVA: TQRImage;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    QRLabel_Versao: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
  private          { Private declarations }
     VI_Total: Integer;
  public
    { Public declarations }
  end;

var
  Form_Rel_EID: TForm_Rel_EID;

implementation

uses EstatisticaItem, Module;


{$R *.dfm}

procedure TForm_Rel_EID.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_Comando: String;
   Status: Boolean;
begin
   //---- Tratamento para mostrar a versão do Documento

   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
   begin
      QRLabel_Versao.Caption:= 'Versão: '+DM.IBTable_Versao_SGQ.FieldByName('VERSAO').AsString;
      QRLabel_dataAtualizacao_SGQ.Caption:= 'Atualização SGEW: '+DM.IBTable_Versao_SGQ.FieldByName('DATA').AsString;

      Status:= True;
   end
   else
   begin
      QRLabel_Versao.Caption:= '';
      QRLabel_dataAtualizacao_SGQ.Caption:= '';

      Status:= False;
   end;

   QRLabel_Versao.Visible:= Status;
   QRLabel_dataAtualizacao_SGQ.Visible:= Status;


  VI_Total:= 0;

  VS_Comando:= 'select i.idcurso, i.idturma, i.codmateria, m.nomemateria, count(*) as QtdItens '+
               ' From item_prova i, MateriaCurso m '+
               ' Where i.idcurso = m.idcurso '+
               ' and   i.idTurma = m.idTurma '+
               ' and   i.codmateria = m.codmateria '+
               ' and   i.idCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
               ' and   i.idTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
               ' group by i.idcurso, i.idturma, i.codmateria, m.nomemateria '+
               ' Order by i.idcurso, i.idturma, i.codmateria, m.nomemateria ';

   Funcoes.ExecutaQuery(Query_MontaMateria, VS_Comando);


   QRLabel_DescCurso.Caption:= 'Curso: '+Form_EstatisticaItem.Edit_Curso.Text;
   QRLabel_Turma.Caption:= 'Turma: '+Form_EstatisticaItem.Edit_Turma.Text;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Encarregado.jpg') = True then
      QRImage_Encarregado.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Encarregado.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Chefe_EAVA.jpg') = True then
      QRImage_Chefe_EAVA.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Chefe_EAVA.jpg');
end;

procedure TForm_Rel_EID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_EID.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   VI_Total:= VI_Total+Query_MontaMateria.FieldByName('QtdItens').AsInteger;
   QRLabel_Total.Caption:= FormatFloat('00000', VI_Total);
end;

procedure TForm_Rel_EID.QuickRep1StartPage(Sender: TCustomQuickRep);
var
   Status: Boolean;
begin
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
   begin
      QRLabel1.Caption:= '';
      QRLabel8.Caption:= '';

      QRLabel3.Caption:= '';
      QRLabel6.Caption:= '';
   end;
end;

end.
