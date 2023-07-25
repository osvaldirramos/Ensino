unit Rel_Relatorio_FAC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable, Rotinas, Rotinas_Validar;

type
  TForm_Relatorio_FAC = class(TForm)
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
    QRSubDetail_Quesitos: TQRSubDetail;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRDBText_NObservado: TQRDBText;
    QRDBText_Abaixo: TQRDBText;
    QRDBText_Atingiu: TQRDBText;
    QRDBText_Acima: TQRDBText;
    QRDBText_Media: TQRDBText;
    IBQuery_Rel_Topico: TIBQuery;
    IBQuery_Topico: TIBQuery;
    DSQ_Topico: TDataSource;
    IBQuery_TopicoIDTOPICO: TIntegerField;
    IBQuery_Rel_TopicoIDCURSO: TSmallintField;
    IBQuery_Rel_TopicoIDTURMA: TIntegerField;
    IBQuery_Rel_TopicoIDTOPICO: TIntegerField;
    IBQuery_Rel_TopicoTOPICO: TIBStringField;
    IBQuery_Rel_TopicoNOBSERVADO: TIBStringField;
    IBQuery_Rel_TopicoABAIXO: TIBStringField;
    IBQuery_Rel_TopicoATINGIU: TIBStringField;
    IBQuery_Rel_TopicoACIMA: TIBStringField;
    IBQuery_Rel_TopicoMEDIA: TIBStringField;
    IBQuery_Rel_TopicoIDFICHA: TIntegerField;
    DataSource1: TDataSource;
    QRDBText_Topico: TQRDBText;
    IBTable_Rel_Topico__: TIBTable;
    IBTable_Rel_Topico__IDCURSO: TSmallintField;
    IBTable_Rel_Topico__IDTURMA: TIntegerField;
    IBTable_Rel_Topico__IDTOPICO: TIntegerField;
    IBTable_Rel_Topico__TOPICO: TIBStringField;
    IBTable_Rel_Topico__NOBSERVADO: TIBStringField;
    IBTable_Rel_Topico__ABAIXO: TIBStringField;
    IBTable_Rel_Topico__ATINGIU: TIBStringField;
    IBTable_Rel_Topico__ACIMA: TIBStringField;
    IBTable_Rel_Topico__MEDIA: TIBStringField;
    IBTable_Rel_Topico__IDFICHA: TIntegerField;
    QRRichText_Cabecalho: TQRRichText;
    QRSubDetail1: TQRSubDetail;
    QRRichText1: TQRRichText;
    QRBand1: TQRBand;
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
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail_QuesitosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand_CabecBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Relatorio_FAC: TForm_Relatorio_FAC;

implementation

uses Hab_FAC, Module;

{$R *.dfm}

procedure TForm_Relatorio_FAC.FormActivate(Sender: TObject);
begin
  IBQuery_Topico.Open;
  IBQuery_Rel_Topico.Open;
//  IBTable_Rel_Topico.Open;
end;


procedure TForm_Relatorio_FAC.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

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

procedure TForm_Relatorio_FAC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   Action:= caFree;
end;

procedure TForm_Relatorio_FAC.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   Funcoes.TrimAppMemorySize;
end;

procedure TForm_Relatorio_FAC.QRSubDetail_QuesitosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if ((IBQuery_Rel_Topico.FieldByName('IDFICHA').AsInteger = 2) or (IBQuery_Rel_Topico.FieldByName('IDFICHA').AsInteger = 12)) then
   begin
      QRDBText_Topico.Color:= $00E4E4E4;
      QRDBText_NObservado.Color:= $00E4E4E4;
      QRDBText_Abaixo.Color:= $00E4E4E4;
      QRDBText_Atingiu.Color:= $00E4E4E4;
      QRDBText_Acima.Color:= $00E4E4E4;
      QRDBText_Media.Color:= $00E4E4E4;
   end
   else
   begin
      QRDBText_Topico.Color:=  clWhite;
      QRDBText_NObservado.Color:=  clWhite;
      QRDBText_Abaixo.Color:=  clWhite;
      QRDBText_Atingiu.Color:=  clWhite;
      QRDBText_Acima.Color:=  clWhite;
      QRDBText_Media.Color:=  clWhite;
   end;
end;


procedure TForm_Relatorio_FAC.QRBand_CabecBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   IBTable_Rel_Topico.First;
end;

procedure TForm_Relatorio_FAC.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRRichText1.Lines.Clear;
  QRRichText1.Lines.Add(Form_Hab_FAC.IBQuery_Comentario_FAC.FieldByName('Tipo').AsString);
  QRRichText1.Lines.Add('');
  QRRichText1.Lines.Add(Form_Hab_FAC.IBQuery_Comentario_FAC.FieldByName('Comentario').AsString);
  QRSubDetail1.Height:= (QRRichText1.Lines.Count*22)+17;
end;



end.
