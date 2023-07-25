unit Rel_CGG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_CGG = class(TForm)
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
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel_Serie: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape13: TQRShape;
    QRShape3: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel_dataInicio: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel_MediaTurma: TQRLabel;
    QRShape17: TQRShape;
    QRSysData_DataEmissaoRelatorio: TQRSysData;
    QRLabel_dataTermino: TQRLabel;
    Query_RelacaoAlunos: TIBQuery;
    Query_RelacaoAlunosCODIGOALUNO: TIntegerField;
    Query_RelacaoAlunosNOME: TIBStringField;
    Query_RelacaoAlunosNOTAFINAL: TIBBCDField;
    QRLabel_NotaFinal: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel_Versao: TQRLabel;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
  private       { Private declarations }
     VR_Contador, VR_MediaTurma: Real;
  public
    { Public declarations }
  end;

var
  Form_Rel_CGG: TForm_Rel_CGG;

implementation

uses CorrecaoProva, Module;

{$R *.dfm}

procedure TForm_Rel_CGG.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
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

    QRLabel_ElaboradoPorNome.Visible:= Status;
    QRLabel_ElaboradoPorPosto.Visible:= Status;

    QRLabel_AprovadoPorNome.Visible:= Status;
    QRLabel_AprovadoPorPosto.Visible:= Status;

   QRLabel_Versao.Visible:= Status;
   QRLabel_dataAtualizacao_SGQ.Visible:= Status;

   VR_Contador:= 0;
   VR_MediaTurma:= 0;
   VS_Comando:= 'Select al.codigoaluno, al.nomeCompleto as nome, al.NotaFinal '+
                ' From Aluno_Turmas_View al '+
                ' where al.IdCurso = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and   al.IdTurma = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and   al.MotivoDesligamento = '+#39+'a'+#39+
                ' Order by al.NotaFinal desc ';

   Funcoes.ExecutaQuery(Query_RelacaoAlunos,  VS_Comando);

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_dataInicio.Caption:= 'Data Início: '+DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString;
   QRLabel_dataTermino.Caption:= 'Data Término: '+DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
end;

procedure TForm_Rel_CGG.PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_NotaFinal.Caption:= FormatFloat('#0.00', Query_RelacaoAlunos.FieldByName('NotaFinal').AsFloat);
   VR_Contador:= VR_Contador+1;
   VR_MediaTurma:= VR_MediaTurma+Query_RelacaoAlunos.FieldByName('NotaFinal').AsFloat;
   QRLabel_MediaTurma.Caption:= 'Média da Turma: '+FormatFloat('#0.00', VR_MediaTurma/VR_Contador);
end;

procedure TForm_Rel_CGG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_CGG.QuickRep1StartPage(Sender: TCustomQuickRep);
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

end;

end.
