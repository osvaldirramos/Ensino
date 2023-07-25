unit Rel_PTS_Novo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_PTS_Novo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRImage_Log01: TQRImage;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    PageFooterBand1: TQRBand;
    QRDBText_Data: TQRDBText;
    QRDBText_Horario: TQRDBText;
    QRDBText_Trab_Escolar: TQRDBText;
    QRDBText_Local: TQRDBText;
    QRDBText_Instrutor: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    IBQuery_PTS_Relatorio: TIBQuery;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private          { Private declarations }
     VS_Data: String;
  public
    { Public declarations }
  end;

var
  Form_Rel_PTS_Novo: TForm_Rel_PTS_Novo;

implementation

uses Module;

{$R *.dfm}

procedure TForm_Rel_PTS_Novo.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

   IBQuery_PTS_Relatorio.Open;
   VS_Data:= IBQuery_PTS_Relatorio.FieldByName('Data').AsString;

   //---- Tratamento para mostrar a versão do Documento

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
end;

procedure TForm_Rel_PTS_Novo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_PTS_Novo.QuickRep1StartPage(Sender: TCustomQuickRep);
begin
   IBQuery_PTS_Relatorio.Open;
end;

procedure TForm_Rel_PTS_Novo.PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
   VS_Cor: String;
begin
   if copy(IBQuery_PTS_Relatorio.FieldByName('Data').AsString, 3,1) = '/' then
   begin
      VS_Cor:= 'White';

//      VS_Data:= IBQuery_PTS_Relatorio.FieldByName('Data').AsString;
      Funcoes.OpenQuery('Select * From Cad_Feriados where Data = '+#39+Funcoes.DePara(IBQuery_PTS_Relatorio.FieldByName('Data').AsString, '/', '.')+' 00:00'+#39);

      if DM.IBQuery_Executa.FieldByName('Data').AsString <> '' then
         VS_Cor:= 'Red';
   end;

   if VS_Cor = 'Red' then
   begin
         QRDBText_Data.Color:= clRed;
         QRDBText_Horario.Color:= clRed;
//      QRDBText_Disciplina.Color:= $00FFF2F2;
         QRDBText_Trab_Escolar.Color:= clRed;
         QRDBText_Local.Color:= clRed;
         QRDBText_Instrutor.Color:= clRed;
         PageFooterBand1.Color:= clRed;

   end
   else
   begin
      if ((IBQuery_PTS_Relatorio.FieldByName('Semana').AsString = '2º Feira') or
          (IBQuery_PTS_Relatorio.FieldByName('Semana').AsString = '4º Feira') or
          (IBQuery_PTS_Relatorio.FieldByName('Semana').AsString = '6º Feira') or
          (IBQuery_PTS_Relatorio.FieldByName('Semana').AsString = 'Domingo')) then
      begin
         QRDBText_Data.Color:= $00FFF2F2;
         QRDBText_Horario.Color:= $00FFF2F2;
//      QRDBText_Disciplina.Color:= $00FFF2F2;
         QRDBText_Trab_Escolar.Color:= $00FFF2F2;
         QRDBText_Local.Color:= $00FFF2F2;
         QRDBText_Instrutor.Color:= $00FFF2F2;
         PageFooterBand1.Color:= $00FFF2F2;
      end
      else
      begin
         QRDBText_Data.Color:= clWhite;
         QRDBText_Horario.Color:= clWhite;
//      QRDBText_Disciplina.Color:= clWhite;
         QRDBText_Trab_Escolar.Color:= clWhite;
         QRDBText_Local.Color:= clWhite;
         QRDBText_Instrutor.Color:= clWhite;
         PageFooterBand1.Color:= clWhite;
      end;
   end;

end;

end.
