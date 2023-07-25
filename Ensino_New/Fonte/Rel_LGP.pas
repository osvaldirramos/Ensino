unit Rel_LGP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_LGP = class(TForm)
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
    QRLabel_InstrumentoAvaliacao: TQRLabel;
    QRLabel_dataAvaliacao: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel_Serie: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape3: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    Query_RelacaoAlunos: TIBQuery;
    Query_RelacaoAlunosCODIGOALUNO: TIntegerField;
    Query_RelacaoAlunosNOME: TIBStringField;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
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
  Form_Rel_LGP: TForm_Rel_LGP;

implementation

uses Se_Prova, Module, Sel_PTS_Novo;

{$R *.dfm}

procedure TForm_Rel_LGP.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
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

   VS_Comando:= 'Select al.codigoaluno, al.nomeCompleto as nome '+
                ' From Aluno_Turmas_View al '+
                ' where al.IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and   al.IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and   al.MotivoDesligamento = '+#39+'a'+#39+
                ' Order by al.codigoaluno ';

   Funcoes.ExecutaQuery(Query_RelacaoAlunos,  VS_Comando);

   QRLabel_Curso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;
   QRLabel_InstrumentoAvaliacao.Caption:= 'Instrumento da Avaliação: '+Trim(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString);
   QRLabel_dataAvaliacao.Caption:= 'Data da Avaliação: : '+Trim(Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString);

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
end;

procedure TForm_Rel_LGP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_Rel_LGP.QuickRep1StartPage(Sender: TCustomQuickRep);
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
