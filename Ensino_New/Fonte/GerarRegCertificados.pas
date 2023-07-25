unit GerarRegCertificados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, Rotinas, Rotinas_TrataData,
  Buttons, StdCtrls, JvComponent, JvTransBtn, ExtCtrls, JvShape;

type
  TForm_GerarRegCertificados = class(TForm)
    Label1: TLabel;
    IBTable_CertidaoAluno: TIBTable;
    IBTable_CertidaoAlunoIDCURSO: TSmallintField;
    IBTable_CertidaoAlunoIDTURMA: TIntegerField;
    IBTable_CertidaoAlunoIDENTIDADE: TIBStringField;
    IBTable_CertidaoAlunoANO: TIBStringField;
    IBTable_CertidaoAlunoCERTIFICADO: TIntegerField;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_GerarRegCertificados: TForm_GerarRegCertificados;

implementation

uses Module, Sel_Turma;

{$R *.dfm}

procedure TForm_GerarRegCertificados.FormActivate(Sender: TObject);
var
   bmLocal : TBookmark;
   vs_Ano: String;
begin
    IBTable_CertidaoAluno.Open;

    Funcoes.CabecalhoForm( Form_GerarRegCertificados, ' Registro de Certificação');

   //--- Tratamento para gerar o Nº~do Registro de Certificacao

   if Trim(DM.IBTable_Turma.FieldByName('Certificado').AsString) = '' then
   begin
      VS_Ano:= Funcoes_TrataData.AnoAtual;
      DM.IBTable_Turma.Edit;
      DM.IBTable_Turma.FieldByName('Certificado').AsInteger:= Funcoes.MaiorCodigoComRestricao('Certificado', 'Ano = '+#39+Funcoes_TrataData.AnoAtual+#39, 'TURMA');
      DM.IBTable_Turma.Post;
      Funcoes.ExecutaTransacao;
   end;

   //--- Tratamento para gerar o Nº de Certificado na Certidao dos Alunos

   IBTable_CertidaoAluno.Open;
   bmLocal:= Form_SelTurma.IBQuery_AlunoTurma.GetBookMark;
   Form_SelTurma.IBQuery_AlunoTurma.First;
   While not Form_SelTurma.IBQuery_AlunoTurma.eof do
   begin
      if IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsString = '' then
      begin
         IBTable_CertidaoAluno.Append;
         IBTable_CertidaoAluno.FieldByName('IDCURSO').AsString:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('IDCURSO').AsString;
         IBTable_CertidaoAluno.FieldByName('IDTURMA').AsString:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('IDTURMA').AsString;
         IBTable_CertidaoAluno.FieldByName('IDENTIDADE').AsString:= Form_SelTurma.IBQuery_AlunoTurma.FieldByName('IDENTIDADE').AsString;
         IBTable_CertidaoAluno.FieldByName('ANO').AsString:= Funcoes_TrataData.AnoAtual;
         IBTable_CertidaoAluno.FieldByName('CERTIFICADO').AsInteger:= Funcoes.MaiorCodigoComRestricao('CERTIFICADO', 'Ano = '+#39+Funcoes_TrataData.AnoAtual+#39, 'CertidaoAluno');
         IBTable_CertidaoAluno.Post;
      end;
      Form_SelTurma.IBQuery_AlunoTurma.Next;
   end;
   Funcoes.ExecutaTransacao;
   Form_SelTurma.IBQuery_AlunoTurma.GotoBookMark(bmLocal);
   Form_SelTurma.IBQuery_AlunoTurma.FreeBookMark(bmLocal);
end;

procedure TForm_GerarRegCertificados.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Close;
end;

procedure TForm_GerarRegCertificados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_CertidaoAluno.Close;
   Action:= caFree;
end;

end.
