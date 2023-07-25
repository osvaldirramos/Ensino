unit Rel_ApresentacaoDeAlunosParaFinaisDeSemanaEFeriados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas, Rotinas_TrataData,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery;

type
  TForm_Rel_FichaDeViagem = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel_Semana: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape30: TQRShape;
    QRShape9: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape24: TQRShape;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape35: TQRShape;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    QRShape46: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel_Instituto: TQRLabel;
    QRShape6: TQRShape;
    QRLabel_CodCurso: TQRLabel;
    QRLabel_CodTurma: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_FichaDeViagem: TForm_Rel_FichaDeViagem;

implementation

uses MenuPrincipal, Sel_Turma, Module;

{$R *.dfm}

procedure TForm_Rel_FichaDeViagem.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_Inicio, VS_Termino: String;
begin
   QRLabel_CodCurso.Caption:= Form_SelTurma.ComboBox_Curso.Text;
   if Form_SelTurma.Edit_UnidadeAl.Text = '' then
   begin
      QRLabel_CodTurma.Caption:=  DM.IBTable_Turma.FieldByName('Turma').AsString+'/'+
                                  DM.IBTable_Turma.FieldByName('Ano').AsString;
   end
   else
   begin
      QRLabel_CodTurma.Caption:=  DM.IBTable_Turma.FieldByName('Turma').AsString+'/'+
                                  DM.IBTable_Turma.FieldByName('Ano').AsString+' ('+
                                  trim(Form_SelTurma.Edit_UnidadeAl.Text)+')';
   end;

   QRLabel_Instituto.Caption:= DM.IBTable_Configuracao.FieldByName('Nome').AsString;

   VS_Inicio:= DateToStr(Form_SelTurma.JvDateEdit_DataTermino.Date);
   VS_Termino:= DateToStr(Form_SelTurma.JvDateEdit_DataTermino.Date+2);

   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'   
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';
   QRLabel_Semana.Caption:= 'Semana de '+Funcoes_TrataData.FormatarData(VS_Inicio, 'yy')+' a '+Funcoes_TrataData.FormatarData(VS_Termino, 'yy');
end;

procedure TForm_Rel_FichaDeViagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
