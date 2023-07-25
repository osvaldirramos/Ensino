unit Rel_CorrigirDadosERubricar_Instrutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_CorrigirDadosERubricar_Instrutor = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Nome_Aluno: TQRLabel;
    QRShape3: TQRShape;
    QRLabel_Cabecalho: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel_Instituto: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel_CodCurso: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel_CodTurma: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText17: TQRDBText;
    IBTable_Telefone: TIBTable;
    IBTable_TelefoneIDENTIDADE: TIBStringField;
    IBTable_TelefoneCELULAR1: TIBStringField;
    IBTable_TelefoneTEL_RESIDENCIAL: TIBStringField;
    IBTable_TelefoneTEL_CONTATO: TIBStringField;
    IBTable_TelefoneTEL_COMERCIAL: TIBStringField;
    IBTable_TelefoneCELULAR: TIBStringField;
    IBTable_TelefoneFAX: TIBStringField;
    QRLabel12: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel_TelSvc: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText21: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_CorrigirDadosERubricar_Instrutor: TForm_Rel_CorrigirDadosERubricar_Instrutor;

implementation

uses MenuPrincipal, Module, Sel_Turma;

{$R *.dfm}

procedure TForm_Rel_CorrigirDadosERubricar_Instrutor.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   IBTable_Telefone.Open;

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'   
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';

   QRLabel_CodCurso.Caption:= Form_SelTurma.ComboBox_Curso.Text;
   QRLabel_Instituto.Caption:= DM.IBTable_Configuracao.FieldByName('Nome').AsString;
   if Form_SelTurma.Edit_UnidadeAl.Text = '' then
      QRLabel_CodTurma.Caption:=  ''
   else
      QRLabel_CodTurma.Caption:=  ' ('+trim(Form_SelTurma.Edit_UnidadeAl.Text)+')';
end;

procedure TForm_Rel_CorrigirDadosERubricar_Instrutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
