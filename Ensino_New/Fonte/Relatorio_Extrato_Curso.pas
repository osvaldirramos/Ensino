unit Relatorio_Extrato_Curso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, Rotinas, Rotinas_Validar;

type
  TForm_RelatorioExtratoCurso = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel_Curso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_Inicio: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel_Termino: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel_NAlunos: TQRLabel;
    QRShape21: TQRShape;
    IBQuery_Rel_Topico: TIBQuery;
    QRRichText_Cabecalho: TQRRichText;
    QRBand_Sumario: TQRBand;
    QRLabel_ResponsavelAssinatura: TQRLabel;
    QRLabel_Barra: TQRLabel;
    QRShape9: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape24: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage_Disciplina: TQRImage;
    QRLabel_DescricaoSecao: TQRLabel;
    QRLabel8: TQRLabel;
    PageFooterBand1: TQRBand;
    QRShape_02: TQRShape;
    QRShape_03: TQRShape;
    QRShape_04: TQRShape;
    QRShape_05: TQRShape;
    QRShape_01: TQRShape;
    QRRichText_Topico: TQRRichText;
    IBQuery_Rel_TopicoIDCURSO: TSmallintField;
    IBQuery_Rel_TopicoIDTURMA: TIntegerField;
    IBQuery_Rel_TopicoIDFICHA: TIntegerField;
    IBQuery_Rel_TopicoIDTOPICO: TIntegerField;
    IBQuery_Rel_TopicoTOPICO: TIBStringField;
    IBQuery_Rel_TopicoNOBSERVADO: TIBStringField;
    IBQuery_Rel_TopicoABAIXO: TIBStringField;
    IBQuery_Rel_TopicoATINGIU: TIBStringField;
    IBQuery_Rel_TopicoACIMA: TIBStringField;
    IBQuery_Rel_TopicoMEDIA: TIBStringField;
    QRRichText_NObservado: TQRRichText;
    QRRichText_Abaixo: TQRRichText;
    QRRichText_Atingiu: TQRRichText;
    QRRichText_Acima: TQRRichText;
    QRRichText_Media: TQRRichText;
    IBQuery_Rel_TopicoCOMENTARIO: TIBStringField;
    IBQuery_Rel_TopicoDESTAQUE: TIBStringField;
    Linha_01: TQRShape;
    Linha_03: TQRShape;
    Linha_04: TQRShape;
    Linha_05: TQRShape;

    procedure AjustarShape(VI_Height: Integer);

    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);

    procedure QRBand_CabecBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RelatorioExtratoCurso: TForm_RelatorioExtratoCurso;

implementation

uses Hab_FAC, Module;

{$R *.dfm}

procedure TForm_RelatorioExtratoCurso.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  IBQuery_Rel_Topico.Open;

  QRRichText_Cabecalho.Lines.Clear;
  QRRichText_Cabecalho.Lines.Add(Form_Hab_FAC.ClientDataSet_FAC.FieldByName('Cabecalho').AsString);

  if trim(Form_Hab_FAC.DBEdit_NOmeGuerra.Text) <> '' then
     QRRichText_Cabecalho.Lines.Add('Instrutor - '+trim(Form_Hab_FAC.DBEdit_PostoGraduacao.Text)+' '+trim(Form_Hab_FAC.DBEdit_NOmeGuerra.Text));


  if trim(Form_Hab_FAC.DBEdit_NomeDisciplina.Text) <> '' then
     QRRichText_Cabecalho.Lines.Add('Disciplina - '+trim(Form_Hab_FAC.DBEdit_Disciplina.Text)+' '+trim(Form_Hab_FAC.DBEdit_NomeDisciplina.Text));

   QRLabel_Curso.Caption:= 'Nome do Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByNAme('Descricao').AsString;

   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                     Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);

   QRLabel_Inicio.Caption:= 'Início: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString);
   QRLabel_Termino.Caption:= 'Término: '+Trim(DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsString);
   QRLabel_NAlunos.Caption:= 'Nº de Alunos: '+IntToStr(DM.IBQuery_MontaTurma.FieldByName('QTDBRASILEIROS').AsInteger+DM.IBQuery_MontaTurma.FieldByName('QTDESTRANGEIROS').AsInteger);

 //  QRLabel_QuantidadeAlunos.Caption:= 'QUANTIDADE DE ALUNOS: '+Validar.RetornarTotalAlunos(DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString, DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString);

   //--- Tratamento da Assinatura do Responsavel

   DM.IBQuery_Cargo.First;

   if DM.IBQuery_Cargo.Locate('SIGLA','EEAE',[]) then   
       //

   QRLabel_ResponsavelAssinatura.Caption:= DM.IBQuery_Cargo.FieldByName( 'Nome' ).AsString+' - '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'PostoGraduacao' ).AsString)+' '+
                                     Trim(DM.IBQuery_Cargo.FieldByName( 'QuadroEsp' ).AsString);
   QRLabel_DescricaoSecao.Caption:= Funcoes.CentraStr(DM.IBQuery_Cargo.FieldByName( 'DescCargo' ).AsString, 13+length(QRLabel_ResponsavelAssinatura.Caption));

   //--- Tratamento dos Graficos

   QRImage_Disciplina.Picture.LoadFromFile('c:\Ensino\Tmp\GraficoDisciplina.Jpeg');
end;

procedure TForm_RelatorioExtratoCurso.QRBand_CabecBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PageFooterBand1.Height:= 17;
end;

procedure TForm_RelatorioExtratoCurso.PageFooterBand1BeforePrint( Sender: TQRCustomBand; var PrintBand: Boolean);
var
   VI_Height: Integer;
begin
   QRRichText_Topico.Lines.Clear;
   QRRichText_Topico.Lines.Add(IBQuery_Rel_Topico.FieldByName('Topico').AsString);

   QRRichText_NObservado.Lines.Clear;
   QRRichText_Abaixo.Lines.Clear;
   QRRichText_Atingiu.Lines.Clear;
   QRRichText_Acima.Lines.Clear;
   QRRichText_Media.Lines.Clear;


   if IBQuery_Rel_Topico.FieldByName('Comentario').AsString <> 'S' then
   begin
      QRRichText_Topico.Left:= 1;
      QRRichText_Topico.Width:= 598;
      VI_Height:= (QRRichText_Topico.Lines.Count*22)+17;
      AjustarShape(VI_Height);

      if IBQuery_Rel_Topico.FieldByName('Comentario').AsString = 'C' then
      begin
         QRRichText_Topico.Color:= $00E4E4E4;
         QRRichText_NObservado.Color:= $00E4E4E4;
         QRRichText_Abaixo.Color:= $00E4E4E4;
         QRRichText_Atingiu.Color:= $00E4E4E4;
         QRRichText_Acima.Color:= $00E4E4E4;
         QRRichText_Media.Color:= $00E4E4E4;
      end
      else
      begin
         QRRichText_Topico.Color:= clRed;  // clWhite;
         QRRichText_NObservado.Color:= clWhite;
         QRRichText_Abaixo.Color:= clWhite;
         QRRichText_Atingiu.Color:= clWhite;
         QRRichText_Acima.Color:= clWhite;
         QRRichText_Media.Color:= clWhite;

      end;

      QRRichText_NObservado.Lines.Add(IBQuery_Rel_Topico.FieldByName('NOBSERVADO').AsString);
      QRRichText_Abaixo.Lines.Add(IBQuery_Rel_Topico.FieldByName('Abaixo').AsString);
      QRRichText_Atingiu.Lines.Add(IBQuery_Rel_Topico.FieldByName('Atingiu').AsString);
      QRRichText_Acima.Lines.Add(IBQuery_Rel_Topico.FieldByName('Acima').AsString);
      QRRichText_Media.Lines.Add(IBQuery_Rel_Topico.FieldByName('Media').AsString);
   end
   else
   begin
      QRRichText_Topico.Left:= 1;
      QRRichText_Topico.Width:= 1028;
      VI_Height:= (QRRichText_Topico.Lines.Count*22)+17;

      if IBQuery_Rel_Topico.FieldByName('Topico').AsString = 'COMENTÁRIO' then
         QRRichText_Topico.Color:= $00E4E4E4
      else
         QRRichText_Topico.Color:= clWhite;

      AjustarShape(0);

   end;

   PageFooterBand1.Height:= VI_Height;
end;

//------------------------------------------------------------------------------
// Ajustar o Shape(s)
//------------------------------------------------------------------------------

procedure TForm_RelatorioExtratoCurso.AjustarShape(VI_Height: Integer);
begin
   QRShape_01.Height:= VI_Height;
   QRShape_02.Height:= VI_Height;
   QRShape_03.Height:= VI_Height;
   QRShape_04.Height:= VI_Height;
   QRShape_05.Height:= VI_Height;
end;




end.
