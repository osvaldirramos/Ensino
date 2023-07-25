unit Rel_REC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas, Rotinas_TrataData,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_REC = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText12: TQRDBText;
    QRLabel_Cabecalho01: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRImage_Log01: TQRImage;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_Periodo: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel_Desc_Assinatura: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    QRLabel_FichadeRegistro: TQRLabel;
    IBTable_CertidaoAluno: TIBTable;
    IBTable_CertidaoAlunoIDCURSO: TSmallintField;
    IBTable_CertidaoAlunoIDTURMA: TIntegerField;
    IBTable_CertidaoAlunoIDENTIDADE: TIBStringField;
    IBTable_CertidaoAlunoANO: TIBStringField;
    IBTable_CertidaoAlunoCERTIFICADO: TIntegerField;
    QRLabel_Desc_OM: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRLabel_NCertificado: TQRLabel;
    QRLabel_NomeAluno: TQRLabel;
    QRLabel_OM: TQRLabel;
    QRLabel_Versao: TQRLabel;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_REC: TForm_Rel_REC;

implementation

uses Sel_Turma, Module;

{$R *.dfm}


procedure TForm_Rel_REC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_REC.QuickRep1StartPage(Sender: TCustomQuickRep);
var
   Status: Boolean;
begin
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
   begin
      QRLabel_ElaboradoPorNome.Caption:= '';
      QRLabel_ElaboradoPorPosto.Caption:= '';

      QRLabel_AprovadoPorNome.Caption:= '';
      QRLabel_AprovadoPorPosto.Caption:= '';
   end;
end;

procedure TForm_Rel_REC.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   Status: Boolean;

   VS_DataTermino, VS_Periodo: String;
   VW_Ano1, VW_Mes1, VW_Dia1: Word;
   VW_Ano2, VW_Mes2, VW_Dia2: Word;
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

   QRLabel_ElaboradoPorNome.Visible:= Status;
   QRLabel_ElaboradoPorPosto.Visible:= Status;

   QRLabel_AprovadoPorNome.Visible:= Status;
   QRLabel_AprovadoPorPosto.Visible:= Status;

   QRLabel_Versao.Visible:= Status;
   QRLabel_dataAtualizacao_SGQ.Visible:= Status;

   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SRPV-SP') or
       (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CRCEA-SE') or
       (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II')) then
      QRLabel_Cabecalho01.Caption:= 'FORMULÁRIO DE REGISTRO DE ENTREGA DE CERTIFICADOS - REC'
   else
      QRLabel_Cabecalho01.Caption:= 'FORMULÁRIO DE REGISTRO DE ENTREGA DE CERTIFICADOS E CERTIDÕES - REC';

   QRLabel_FichadeRegistro.Caption:= 'Ficha de Registro Nº: '+trim(DM.IBTable_Turma.FieldByName('Certificado').AsString)+'/'+
                                 trim(DM.IBTable_Configuracao.FieldByName('SIGLA').AsString)+'/'+
                                 trim(DM.IBTable_Turma.FieldByName('Ano').AsString);

//   QRLabel_LocalData.Caption:= 'Data: '+DateToStr(Date);

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
//   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_SelTurma.NPaginas);
end;


procedure TForm_Rel_REC.PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
//procedure TForm_Rel_REC.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   IBTable_CertidaoAluno.Open;
//   IBTable_AlunoTurma.Open;

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
   QRLabel_OM.Caption:= Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('IdUnidade').AsString);

end;



end.
