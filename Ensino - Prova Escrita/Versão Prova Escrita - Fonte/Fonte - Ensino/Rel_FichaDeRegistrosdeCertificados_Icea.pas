unit Rel_FichaDeRegistrosdeCertificados_Icea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, Rotinas, Rotinas_TrataData;

type
  TForm_Rel_FichaDeRegistrosdeCertificados_ICEA = class(TForm)
    QuickRep1: TQuickRep;
    IBTable_CertidaoAluno: TIBTable;
    IBTable_CertidaoAlunoIDCURSO: TSmallintField;
    IBTable_CertidaoAlunoIDTURMA: TIntegerField;
    IBTable_CertidaoAlunoIDENTIDADE: TIBStringField;
    IBTable_CertidaoAlunoANO: TIBStringField;
    IBTable_CertidaoAlunoCERTIFICADO: TIntegerField;
    IBTable_AlunoTurma: TIBTable;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBTable_AlunoTurmaIDUNIDADE: TIBStringField;
    IBTable_AlunoTurmaIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBTable_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBTable_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBTable_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBTable_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBTable_AlunoTurmaINSTITUTO: TIBStringField;
    IBTable_AlunoTurmaTIPO_ALUNO: TIBStringField;
    QRBand1: TQRBand;
    QRLabel_NomeAluno: TQRLabel;
    QRShape38: TQRShape;
    QRShape91: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel_OM: TQRLabel;
    QRLabel_NCertificado: TQRLabel;
    QRShape8: TQRShape;
    QRLabel_Rodape: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel_Cabecalho01: TQRLabel;
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
    QRLabel_Periodo: TQRLabel;
    QRLabel_NumeroFicha: TQRLabel;
    QRLabel_LocalData: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel_Certificado: TQRLabel;
    QRBand7: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape9: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape10: TQRShape;
    QRSysData3: TQRSysData;
    QRLabel_Pagina: TQRLabel;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_FichaDeRegistrosdeCertificados_ICEA: TForm_Rel_FichaDeRegistrosdeCertificados_ICEA;

implementation

uses Cad_Turma, Module, Sel_Turma, MenuPrincipal;

{$R *.dfm}

procedure TForm_Rel_FichaDeRegistrosdeCertificados_ICEA.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   IBTable_CertidaoAluno.Open;
   IBTable_AlunoTurma.Open;

   QRLabel_NCertificado.Caption:= FormatFloat('0000', IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger)+'/'+
                                  IBTable_CertidaoAluno.FieldByName('Ano').AsString;

   if Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString) = 'CV' then
   begin
      QRLabel_NomeAluno.Caption:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Nome').AsString;
   end
   else
   begin
      QRLabel_NomeAluno.Caption:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Nome').AsString;
   end;
   QRLabel_OM.Caption:= Trim(IBTable_AlunoTurma.FieldByName('IdUnidade').AsString);
end;

procedure TForm_Rel_FichaDeRegistrosdeCertificados_ICEA.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_DataTermino, VS_Periodo: String;
   VW_Ano1, VW_Mes1, VW_Dia1: Word;
   VW_Ano2, VW_Mes2, VW_Dia2: Word;
begin
   QRLabel_Curso.Caption:= 'Curso: '+Form_SelTurma.ComboBox_Curso.Text+' - '+Form_SelTurma.Label_DescricaoCurso.Caption;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBTable_Turma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBTable_Turma.FieldByName('Ano').AsString);

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log02.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg');

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SRPV-SP') or
       (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II')) then
      QRLabel_Cabecalho01.Caption:= 'FORMULÁRIO DE REGISTRO DE ENTREGA DE CERTIFICADOS - REC'
   else
      QRLabel_Cabecalho01.Caption:= 'FORMULÁRIO DE REGISTRO DE ENTREGA DE CERTIFICADOS E CERTIDÕES - REC';

   QRLabel_NumeroFicha.Caption:= 'Ficha de Registro Nº: '+trim(DM.IBTable_Turma.FieldByName('Certificado').AsString)+'/'+
                                 trim(DM.IBTable_Configuracao.FieldByName('SIGLA').AsString)+'/'+
                                 trim(DM.IBTable_Turma.FieldByName('Ano').AsString);

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
   QRLabel_Periodo.Caption:= 'Péríodo: '+VS_Periodo;
   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_SelTurma.NPaginas);
end;

procedure TForm_Rel_FichaDeRegistrosdeCertificados_ICEA.FormClose( Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
