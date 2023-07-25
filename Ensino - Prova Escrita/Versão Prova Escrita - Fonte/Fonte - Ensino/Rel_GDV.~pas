unit Rel_GDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_GDV = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
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
    QRShape10: TQRShape;
    PageFooterBand1: TQRBand;
    QRDBText10: TQRDBText;
    QRLabel_Serie: TQRLabel;
    QRLabel_NomeDiscente: TQRLabel;
    QRShape13: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel_dataAtualizacao: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape3: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    IBQuery_MontaGabarito: TIBQuery;
    IBQuery_MontaGabaritoDATAAPLICACAO: TDateTimeField;
    IBQuery_MontaGabaritoNOTA: TIBBCDField;
    IBQuery_MontaGabaritoCODPROVA: TIBStringField;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel_Media_Final: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel_Pagina: TQRLabel;
    IBQuery_AlunoTurma: TIBQuery;
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
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel6: TQRLabel;
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
  Form_Rel_GDV: TForm_Rel_GDV;

implementation

uses Module, CorrecaoProva;

{$R *.dfm}

procedure TForm_Rel_GDV.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_Comando: String;
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

   VS_Comando:= 'Select IdCurso, IdTurma, Identidade, NotaFinal '+
                ' From Aluno_Turmas_View '+
                ' Where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                ' and   Identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Identidade').AsString+#39;
   Funcoes.OpenQuery(VS_Comando);
   QRLabel_Media_Final.Caption:= 'MÉDIA FINAL: '+FormatFloat('#0.00', DM.IBQuery_Executa.FieldByName('NotaFinal').AsFloat);
   QRLabel_NomeDiscente.Caption:= 'Posto/Graduação/Civil e Nome Completo do Discente: '+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString;

   VS_Comando:= 'Select t.DataAplicacao, n.Nota, n.CodProva '+
                ' From nota_aluno_view n, testes_view t '+
                ' Where n.idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                ' and   n.IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                ' and   n.Identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Identidade').AsString+#39+
                ' and   n.IdCurso = t.idcurso '+
                ' and   n.IdTurma = t.IdTurma '+
                ' and   n.ReferenciaAvaliacao = t.ReferenciaAvaliacao '+
                ' and   n.CodMateria = t.CodMateria '+
                ' and   n.Nota is not null '+
                ' and   t.media = '+#39+'S'+#39+
                ' Order By t.DataAplicacao';
   Funcoes.ExecutaQuery(IBQuery_MontaGabarito,  VS_Comando);

   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log02.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg');

   QRLabel_dataAtualizacao.Caption:= 'Data de atualização: '+DateToStr(Date);

   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_Cad_CorrecaoProva.NPaginas);
end;

procedure TForm_Rel_GDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_MontaGabarito.Close;
   Action:= caFree;
end;

end.
