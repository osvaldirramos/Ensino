unit Rel_RelacaoEnderecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_RelacaoEnderecos = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Cabecalho: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel_Instituto: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel_CodCurso: TQRLabel;
    QRLabel_NomeCurso: TQRLabel;
    QRLabel_Aluno: TQRLabel;
    IBTable_EnderecoAl: TIBTable;
    IBTable_EnderecoAlIDENTIDADE: TIBStringField;
    IBTable_EnderecoAlENDERECO: TIBStringField;
    IBTable_EnderecoAlCIDADE: TIBStringField;
    IBTable_EnderecoAlUF: TIBStringField;
    IBTable_EnderecoAlCEP: TIBStringField;
    IBTable_EnderecoAlPAIS: TIBStringField;
    IBTable_TelefoneAl: TIBTable;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    IBTable_PessoaAl: TIBTable;
    IBTable_PessoaAlIDENTIDADE: TIBStringField;
    IBTable_PessoaAlEMAIL: TIBStringField;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1StartPage(Sender: TCustomQuickRep);
    procedure QuickRep1EndPage(Sender: TCustomQuickRep);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_RelacaoEnderecos: TForm_Rel_RelacaoEnderecos;

implementation

uses MenuPrincipal, Module, Sel_Turma;

{$R *.dfm}

procedure TForm_Rel_RelacaoEnderecos.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_Aluno.Caption:= 'Aluno     : '+Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString)+' '+
                               Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Nome').AsString+
                               '('+Form_SelTurma.IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString+') - '+
                               Form_SelTurma.IBQuery_AlunoTurma.FieldByName('IdUnidade').AsString;

end;

procedure TForm_Rel_RelacaoEnderecos.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   IBTable_PessoaAl.Open;
   IBTable_EnderecoAl.Open;
   IBTable_TelefoneAl.Open;

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';
   QRLabel_CodCurso.Caption:= Form_SelTurma.ComboBox_Curso.Text;
   QRLabel_NomeCurso.Caption:= Form_SelTurma.Label_DescricaoCurso.Caption;
   QRLabel_Instituto.Caption:= DM.IBTable_Configuracao.FieldByName('Nome').AsString;

end;

procedure TForm_Rel_RelacaoEnderecos.QuickRep1EndPage( Sender: TCustomQuickRep);
begin
   IBTable_PessoaAl.Close;
   IBTable_EnderecoAl.Close;
   IBTable_TelefoneAl.Close;
end;

procedure TForm_Rel_RelacaoEnderecos.QuickRep1StartPage(Sender: TCustomQuickRep);
begin
   IBTable_PessoaAl.Open;
   IBTable_EnderecoAl.Open;
   IBTable_TelefoneAl.Open;
end;

procedure TForm_Rel_RelacaoEnderecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
