unit Rel_ControleDePresencaDeAlunosNome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery;

type
  TForm_Rel_ControleDePresencaDeAlunosNome = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel_NomeAluno: TQRLabel;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRShape31: TQRShape;
    QRLabel_Seg: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel_Semana: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape32: TQRShape;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRLabel_Ter: TQRLabel;
    QRLabel_Qua: TQRLabel;
    QRLabel_Qui: TQRLabel;
    QRLabel_Sex: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRShape87: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape14: TQRShape;
    QRLabel18: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape27: TQRShape;
    QRLabel27: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape30: TQRShape;
    QRLabel30: TQRLabel;
    QRShape33: TQRShape;
    QRShape49: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape52: TQRShape;
    QRLabel36: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape55: TQRShape;
    QRLabel39: TQRLabel;
    QRShape56: TQRShape;
    QRShape66: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape67: TQRShape;
    QRShape70: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape80: TQRShape;
    QRLabel44: TQRLabel;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape83: TQRShape;
    QRLabel47: TQRLabel;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape86: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape91: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape24: TQRShape;
    QRBand4: TQRBand;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    QRShape163: TQRShape;
    QRShape164: TQRShape;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRShape168: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRShape88: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel_Instituto: TQRLabel;
    QRShape5: TQRShape;
    QRShape48: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape71: TQRShape;
    QRShape77: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape92: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape23: TQRShape;
    QRLabel_CodCurso: TQRLabel;
    QRLabel_CodTurma: TQRLabel;
    IBQuery_AlunoTurma: TIBQuery;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_ControleDePresencaDeAlunosNome: TForm_Rel_ControleDePresencaDeAlunosNome;

implementation

uses Sel_Turma, MenuPrincipal, Module;

{$R *.dfm}

procedure TForm_Rel_ControleDePresencaDeAlunosNome.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   IBQuery_AlunoTurma.Open;
   QRLabel_NomeAluno.Caption:= Trim(IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString)+' '+
                               Copy(IBQuery_AlunoTurma.FieldByName('Nome').AsString,1,35);
end;

procedure TForm_Rel_ControleDePresencaDeAlunosNome.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   IBQuery_AlunoTurma.Open;
   QRLabel_CodCurso.Caption:= Form_SelTurma.ComboBox_Curso.Text;
   if Form_SelTurma.Edit_UnidadeAl.Text = '' then
   begin
      QRLabel_CodTurma.Caption:=  Form_SelTurma.IBTable_Turma.FieldByName('Turma').AsString+'/'+
                                  Form_SelTurma.IBTable_Turma.FieldByName('Ano').AsString;
   end
   else
   begin
      QRLabel_CodTurma.Caption:=  Form_SelTurma.IBTable_Turma.FieldByName('Turma').AsString+'/'+
                                  Form_SelTurma.IBTable_Turma.FieldByName('Ano').AsString+' ('+
                                  trim(Form_SelTurma.Edit_UnidadeAl.Text)+')';
   end;
   QRLabel_Instituto.Caption:= DM.IBTable_Configuracao.FieldByName('Nome').AsString;
   QRLabel_Semana.Caption:= 'Semana de '+Funcoes.FormatarData(Form_SelTurma.JvDateEdit_DataInicio.Text, 'yy')+' a '+Funcoes.FormatarData(Form_SelTurma.JvDateEdit_DataTermino.Text, 'yy');
   QRLabel_Seg.Caption:= 'Seg '+Funcoes.FormatarData(Form_SelTurma.JvDateEdit_DataInicio.Text, 'yy');
   QRLabel_Ter.Caption:= 'Ter '+Funcoes.FormatarData(DateToStr(Form_SelTurma.JvDateEdit_DataInicio.Date+1),'yy');
   QRLabel_Qua.Caption:= 'Qua '+Funcoes.FormatarData(DateToStr(Form_SelTurma.JvDateEdit_DataInicio.Date+2),'yy');
   QRLabel_Qui.Caption:= 'Qui '+Funcoes.FormatarData(DateToStr(Form_SelTurma.JvDateEdit_DataInicio.Date+3),'yy');
   QRLabel_Sex.Caption:= 'Sex '+Funcoes.FormatarData(DateToStr(Form_SelTurma.JvDateEdit_DataInicio.Date+4),'yy');
end;

procedure TForm_Rel_ControleDePresencaDeAlunosNome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_AlunoTurma.Close;
   Action:= caFree;
end;

end.
