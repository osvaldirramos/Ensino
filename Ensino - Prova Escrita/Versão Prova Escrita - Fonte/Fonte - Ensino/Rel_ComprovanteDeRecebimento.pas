unit Rel_ComprovanteDeRecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery;

type
  TForm_Rel_ComprovanteDeRecebimento = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRLabel_NomeAluno: TQRLabel;
    QRLabel_Desligado: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Nome_Aluno: TQRLabel;
    QRShape3: TQRShape;
    QRLabel_Cabecalho: TQRLabel;
    QRShape1: TQRShape;
    QRRichText1: TQRRichText;
    QRBand4: TQRBand;
    QRLabel_ResponsavelAssinatura: TQRLabel;
    QRLabel_Descricao_Secao_AEN: TQRLabel;
    QRLabel_Responsavel_AEN: TQRLabel;
    QRLabel_DescricaoSecao: TQRLabel;
    QRLabel_LocalData: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel_Subdivisao: TQRLabel;
    QRLabel_Instituto: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel_CodTurma: TQRLabel;
    QRLabel_CodCurso: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_ComprovanteDeRecebimento: TForm_Rel_ComprovanteDeRecebimento;

implementation

uses Sel_Turma, MenuPrincipal, Module;

{$R *.dfm}

procedure TForm_Rel_ComprovanteDeRecebimento.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_NomeAluno.Caption:= Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('PostoGraduacao').AsString)+' '+
                               Form_SelTurma.IBQuery_AlunoTurma.FieldByName('Nome').AsString;

   if ((Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString) <> '') and
       (Trim(Form_SelTurma.IBQuery_AlunoTurma.FieldByName('MotivoDesligamento').AsString) <> 'a')) then
      QRLabel_Desligado.Caption:= 'D E S L I G A D O'
   else
      QRLabel_Desligado.Caption:= '';
end;

procedure TForm_Rel_ComprovanteDeRecebimento.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA'))then
       QRLabel_Subdivisao.Caption:= 'DIVISÃO DE FORMAÇÃO E APERFEIÇOAMENTO'   
   else
       QRLabel_Subdivisao.Caption:= 'SEÇÃO DE EXECUÇÃO DE CURSOS';

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

   QRRichText1.Lines.Clear;
   if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
   begin
      QRRichText1.Lines.Add('Recebi, do '+DM.IBTable_Configuracao.FieldByName('Sigla').AsString+', um envelope contendo os seguintes Documentos: ' );
      QRRichText1.Lines.Add('');
      QRRichText1.Lines.Add('- 01 (UM) Certificado de Conclusão de Curso ');
   end
   else
   begin
      QRRichText1.Lines.Add('Recebi, do '+DM.IBTable_Configuracao.FieldByName('Nome').AsString+', um envelope contendo os seguintes Documentos: ' );
      QRRichText1.Lines.Add('');
      QRRichText1.Lines.Add('- 01 (UM) Certificado de Conclusão de Curso ');
      QRRichText1.Lines.Add('- 01 (UM) Curriculum Escolar');
      QRRichText1.Lines.Add('- 01 (UM) Relatório de Desempenho');
   end;


   QRLabel_Instituto.Caption:= DM.IBTable_Configuracao.FieldByName('Nome').AsString;

   if Form_SelTurma.VB_SelecaoResponsavelAssinatura = False then
   begin
      DM.IBQuery_Cargo.Open;
      DM.IBQuery_Cargo.First;

     if DM.IBQuery_Cargo.Locate('SIGLA','ECR',[]) then
       //
   end;

   QRLabel_LocalData.Caption:= Funcoes.RetornaCidade(DateToStr(Date));
   QRLabel_ResponsavelAssinatura.Caption:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+' - '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);
   QRLabel_DescricaoSecao.Caption:= Funcoes.CentraStr(DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString, 13+length(QRLabel_ResponsavelAssinatura.Caption));
end;

end.
