unit Rel_Recibo_do_Codigo_do_Aluno_RCA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, Rotinas, Rotinas_TrataData;

type
  TForm_Rel_RCA = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel_NomeAluno: TQRLabel;
    QRShape38: TQRShape;
    QRShape91: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel_Login: TQRLabel;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel_Cabecalho01: TQRLabel;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRImage_Log01: TQRImage;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_LocalData: TQRLabel;
    QRShape31: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel_Periodo: TQRLabel;
    QRShape30: TQRShape;
    QRLabel_Versao: TQRLabel;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_RCA: TForm_Rel_RCA;

implementation

uses Cad_Turma, Module, Sel_Turma, MenuPrincipal;

{$R *.dfm}

procedure TForm_Rel_RCA.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_NomeAluno.Caption:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Nome').AsString;
   QRLabel_Login.Caption:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString;
end;

procedure TForm_Rel_RCA.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_DataTermino, VS_Periodo: String;
   VW_Ano1, VW_Mes1, VW_Dia1: Word;
   VW_Ano2, VW_Mes2, VW_Dia2: Word;
begin
   //---- Tratamento para mostrar a vers�o do Documento

   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
   begin
      QRLabel_Versao.Caption:= 'Vers�o: '+DM.IBTable_Versao_SGQ.FieldByName('VERSAO').AsString;
      QRLabel_dataAtualizacao_SGQ.Caption:= 'Atualiza��o SGEW: '+DM.IBTable_Versao_SGQ.FieldByName('DATA').AsString;
   end;

   QRLabel_Curso.Caption:= 'Curso: '+Form_SelTurma.ComboBox_Curso.Text+' - '+Form_SelTurma.Label_DescricaoCurso.Caption;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBTable_Turma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBTable_Turma.FieldByName('Ano').AsString);

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   QRLabel_Cabecalho01.Caption:= 'RECIBO DO C�DIGO DO ALUNO - RCA';
   QRLabel_LocalData.Caption:= 'Data: '+DateToStr(Date);

    //--------------------- Tratamento do Periodo do Curso ---------------------//
   //----------------------- Verificando a Maior Data de Termino   -----------------------//

   if DM.IBTable_Turma.FieldByName('DATATERMINODIST').AsString = '' then
      VS_DataTermino:= DM.IBTable_Turma.FieldByName('DATATERMINO').AsString
   else
   begin
      if DM.IBTable_Turma.FieldByName('DATATERMINO').AsDateTime > DM.IBTable_Turma.FieldByName('DATATERMINODIST').AsDateTime then
         VS_DataTermino:= DM.IBTable_Turma.FieldByName('DATATERMINO').AsString
      else
         VS_DataTermino:= DM.IBTable_Turma.FieldByName('DATATERMINODIST').AsString
   end;

   if trim(DM.IBTable_Turma.FieldByName('DataInicio').AsString) <> '' then
   begin
      DecodeDate(StrToDate(DM.IBTable_Turma.FieldByName('DataInicio').AsString), VW_Ano1, VW_Mes1, VW_Dia1);

      //----------------- Montando o Periodo de Termino ------------------//

      DecodeDate(StrToDate(VS_DataTermino), VW_Ano2, VW_Mes2, VW_Dia2);
      if VW_Mes1 = VW_Mes2 then
         VS_Periodo:= IntToStr(VW_Dia1)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2)
      else
      begin
         if VW_Ano1 = VW_Ano2 then
            VS_Periodo:= IntToStr(VW_Dia1)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes1),2)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2)
         else
            VS_Periodo:= IntToStr(VW_Dia1)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes1),1)+' '+Copy(IntToStr(VW_Ano1),3,2)+' a '+IntToStr(VW_Dia2)+' '+Funcoes_TrataData.Mes_Extenso(IntToStr(VW_Mes2),2)+' '+Copy(IntToStr(VW_Ano2),3,2);
      end;
   end;
   QRLabel_Periodo.Caption:= 'P�r�odo: '+VS_Periodo;
//   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_SelTurma.NPaginas);
end;

procedure TForm_Rel_RCA.FormClose( Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_RCA.QuickRep1StartPage(Sender: TCustomQuickRep);
var
   Status: Boolean;
begin
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
   begin
      QRLabel5.Caption:= '';
      QRLabel6.Caption:= '';

      QRLabel11.Caption:= '';
      QRLabel12.Caption:= '';
   end;
end;

end.
