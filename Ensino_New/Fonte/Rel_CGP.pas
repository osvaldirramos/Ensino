unit Rel_CGP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_CGP = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRImage_Log01: TQRImage;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel_DescCurso: TQRLabel;
    QRLabel_Turma: TQRLabel;
    QRLabel_NItens: TQRLabel;
    QRLabel_Instrumento_Avaliacao: TQRLabel;
    QRLabel_Data_Avaliacao: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText_Disciplina: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel_Disciplina: TQRLabel;
    QRLabel_Unidade: TQRLabel;
    QRLabel_SubUnidade: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText_RespostaCorreta: TQRDBText;
    IBQuery_MontaGabarito: TIBQuery;
    DSQ_MontaGabarito: TDataSource;
    IBTable_ItemDesc: TIBTable;
    IBTable_ItemDescNUMITEM: TIntegerField;
    IBTable_ItemDescRESPOSTACORRETA: TIBStringField;
    IBQuery_MontaGabaritoNUMITEM: TIntegerField;
    IBQuery_MontaGabaritoNUMEROQUESTAO: TSmallintField;
    IBQuery_MontaGabaritoQUESTAOANULADA: TIBStringField;
    IBQuery_MontaGabaritoQUESTAOIRREGULAR: TIBStringField;
    IBQuery_MontaGabaritoALTERNATIVACORRETAA: TIBStringField;
    IBQuery_MontaGabaritoALTERNATIVACORRETAB: TIBStringField;
    IBQuery_MontaGabaritoALTERNATIVACORRETAC: TIBStringField;
    IBQuery_MontaGabaritoALTERNATIVACORRETAD: TIBStringField;
    QRLabel_GabaritoModificado: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel_Versao: TQRLabel;
    QRLabel_dataAtualizacao_SGQ: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_CGP: TForm_Rel_CGP;

implementation

uses CorrecaoProva, Module;

{$R *.dfm}

procedure TForm_Rel_CGP.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
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

   Funcoes.ExecutaQuery(IBQuery_MontaGabarito, 'Select NumItem, NumeroQuestao, QuestaoAnulada, QuestaoIrregular, AlternativaCorretaA, AlternativaCorretaB, AlternativaCorretaC, AlternativaCorretaD '+
                                                ' From Itemteste '+
                                                ' Where IdCurso =  '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                                ' and   IdTurma = '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                                                ' and   FaseAplicacao =  '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                                                ' and   ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                                ' and   CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                                                ' and  (questaoanulada = '+#39+'X'+#39+' or QuestaoIrregular = '+#39+'X'+#39+') '+
                                                ' Order By IdCurso, IdTurma,NumeroQuestao'
                        );
   IBTable_ItemDesc.Open;

   QRLabel_DescCurso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+
                                      Trim(DM.IBQuery_MontaTurma.FieldByName('Ano').AsString);
   QRLabel_NItens.Caption:= 'Nº de Itens: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('TotalItens').AsString;
   QRLabel_Instrumento_Avaliacao.Caption:= 'Instrumento de Avaliação: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
   QRLabel_Data_Avaliacao.Caption:= 'Data da Avaliação: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
end;

procedure TForm_Rel_CGP.PageFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel_GabaritoModificado.Caption:= '';
   if Trim(IBQuery_MontaGabarito.FieldByName('AlternativaCorretaA').AsString) <> '' then
      QRLabel_GabaritoModificado.Caption:= QRLabel_GabaritoModificado.Caption+'A';
   if Trim(IBQuery_MontaGabarito.FieldByName('AlternativaCorretaB').AsString) <> '' then
      QRLabel_GabaritoModificado.Caption:= QRLabel_GabaritoModificado.Caption+'B';
   if Trim(IBQuery_MontaGabarito.FieldByName('AlternativaCorretaC').AsString) <> '' then
      QRLabel_GabaritoModificado.Caption:= QRLabel_GabaritoModificado.Caption+'C';
   if Trim(IBQuery_MontaGabarito.FieldByName('AlternativaCorretaD').AsString) <> '' then
      QRLabel_GabaritoModificado.Caption:= QRLabel_GabaritoModificado.Caption+'D';

end;

procedure TForm_Rel_CGP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_MontaGabarito.Close;
   IBTable_ItemDesc.Close;
   Action:= caFree;
end;

end.
