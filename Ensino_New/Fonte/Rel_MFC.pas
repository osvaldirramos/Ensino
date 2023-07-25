unit Rel_MFC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_MFC = class(TForm)
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
    PageFooterBand1: TQRBand;
    QRShape13: TQRShape;
    IBQuery_AlunoTurma: TIBQuery;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel_gabarito: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel_Sequencia: TQRLabel;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_AlunoTurmaNUMORDEM: TSmallintField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_AlunoTurmaNOME: TIBStringField;
    IBQuery_AlunoTurmaQUADROESP: TIBStringField;
    QRLabel_PostoGraduacao: TQRLabel;
    QRLabel_Nome: TQRLabel;
    QRLabel_MediaFinal: TQRLabel;
    QRShape3: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel_MediaTurma: TQRLabel;
    QRLabel_DataInicio: TQRLabel;
    QRLabel_DataTermino: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    QRLabel_Assinatura: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel_Versao: TQRLabel;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
  private          { Private declarations }
     VI_Cont: Integer;
     VR_MediaTurma: Real;
  public
    { Public declarations }
  end;

var
  Form_Rel_MFC: TForm_Rel_MFC;

implementation

uses CorrecaoProva, Module;

{$R *.dfm}

procedure TForm_Rel_MFC.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   Status: Boolean;
begin
   //---- Tratamento para mostrar a versão do Documento

   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
   begin
      QRLabel_Versao.Caption:= 'Versão: '+DM.IBTable_Versao_SGQ.FieldByName('VERSAO').AsString;
      QRLabel_dataAtualizacao_SGQ.Caption:= 'Atualização SGEW: '+DM.IBTable_Versao_SGQ.FieldByName('DATA').AsString;
      QRLabel_Assinatura.Caption:= 'Nome completo e assinatura do chefe da EEAE';

      Status:= True;
   end
   else
   begin
      QRLabel_Versao.Caption:= '';
      QRLabel_dataAtualizacao_SGQ.Caption:= '';
      QRLabel_Assinatura.Caption:= 'Nome completo e assinatura do emitente';

      Status:= False;
   end;

   QRLabel_ElaboradoPorNome.Visible:= Status;
   QRLabel_ElaboradoPorPosto.Visible:= Status;

   QRLabel_AprovadoPorNome.Visible:= Status;
   QRLabel_AprovadoPorPosto.Visible:= Status;

   QRLabel_Versao.Visible:= Status;
   QRLabel_dataAtualizacao_SGQ.Visible:= Status;

   VR_MediaTurma:= 0;
   VI_Cont:= 0;
  Funcoes.ExecutaQuery( IBQuery_AlunoTurma, 'Select IdCurso, IdTurma, Identidade, IdAntiguidade, NumOrdem, PostoGraduacao, MotivoDesligamento, CodigoAluno, NotaFinal, nome, quadroEsp '+
                                            ' From Aluno_Turmas_View'+
                                            ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                            ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                            ' and   MotivoDesligamento = '+#39+'a'+#39+
                                            ' Order by NotaFinal Desc, IdAntiguidade'
                      );

   QRLabel_DataInicio.Caption:= 'DATA INÍCIO: '+ DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString;
   QRLabel_DataTermino.Caption:= 'DATA TÉRMINO: '+DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString;

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

//   QRLabel_dataAtualizacao.Caption:= 'Data de atualização: '+DateToStr(Date);

//   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_Cad_CorrecaoProva.NPaginas);
end;

procedure TForm_Rel_MFC.PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
   VI_Tama: integer;
   VS_NotaFinal: String;
begin
   VI_Cont:= VI_Cont+1;

   QRLabel_Sequencia.Caption:= FormatFloat('#0', VI_Cont);

   //--- Tratamento do Posto Graduacao do Aluno

   if trim(IBQuery_AlunoTurma.FieldByName('PostoGraduacao' ).AsString) = 'CV' then
      QRLabel_PostoGraduacao.Caption:= 'CIVIL'
   else
   begin
      QRLabel_PostoGraduacao.Caption:= trim(IBQuery_AlunoTurma.FieldByName('PostoGraduacao' ).AsString);
      if IBQuery_AlunoTurma.FieldByName('QuadroEsp').AsString <> 'x' then
         QRLabel_PostoGraduacao.Caption:= QRLabel_PostoGraduacao.Caption+' '+Trim(IBQuery_AlunoTurma.FieldByName('QuadroEsp').AsString);
   end;

   //--- Tratamento do nome do Aluno

   QRLabel_Nome.Caption:= trim(IBQuery_AlunoTurma.FieldByName('Nome' ).AsString);

   //--- Tratamento da Nota Final

   if IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsString = '' then
      VS_NotaFinal:= ''
   else
   begin
      VS_NotaFinal := FormatFloat('0#.00',IBQuery_AlunoTurma.FieldByName('NOTAFINAL').AsFloat);

      if VS_NotaFinal = '' then
         VS_NotaFinal:= '0,00'
      else
      begin
         VI_Tama := length(VS_NotaFinal);

         if (( VS_NotaFinal = '10' ) or (VI_Tama = 1)) then
            VS_NotaFinal:=VS_NotaFinal+',00' ;

         if (copy(VS_NotaFinal,2,1)=',') then
            VS_NotaFinal := copy(VS_NotaFinal,1,4)
         else
            VS_NotaFinal := copy(VS_NotaFinal,1,5) ;
      end;

      VR_MediaTurma:= VR_MediaTurma+StrToFloat(VS_NotaFinal);
   end;

   QRLabel_MediaFinal.Caption:= VS_NotaFinal;
   QRLabel_MediaTurma.Caption:= 'MÉDIA DA TURMA: '+FormatFloat('0#.00',VR_MediaTurma/VI_Cont)
end;

procedure TForm_Rel_MFC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_AlunoTurma.Close;
   Action:= caFree;
end;

procedure TForm_Rel_MFC.QuickRep1StartPage(Sender: TCustomQuickRep);
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

end.
