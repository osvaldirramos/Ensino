unit Rel_GPA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_GPA = class(TForm)
    QuickRep1: TQuickRep;
    QRBand_Rodape: TQRBand;
    QRBand_Cabecalho: TQRBand;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRImage_Log01: TQRImage;
    QRImage_Log02: TQRImage;
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
    QRDBText_Unidade: TQRDBText;
    QRDBText_SubUnidade: TQRDBText;
    QRDBText_Objetivo: TQRDBText;
    QRDBText_Serie: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape13: TQRShape;
    QRLabel_gabarito: TQRLabel;
    IBQuery_MontaGabarito: TIBQuery;
    IBQuery_MontaGabaritoQUESTAO: TIntegerField;
    IBQuery_MontaGabaritoNUMITEM: TIntegerField;
    IBQuery_MontaGabaritoNUMEROQUESTAO: TIntegerField;
    IBQuery_MontaGabaritoGABARITO: TIntegerField;
    IBQuery_MontaGabaritoRESPOSTACORRETA: TIBStringField;
    IBQuery_MontaGabaritoIDCURSO: TSmallintField;
    IBQuery_MontaGabaritoIDTURMA: TIntegerField;
    DSQ_MontaGabarito: TDataSource;
    IBTable_ItemProva: TIBTable;
    IBTable_ItemProvaIDTURMA: TIntegerField;
    IBTable_ItemProvaIDCURSO: TSmallintField;
    IBTable_ItemProvaNUMITEM: TIntegerField;
    IBTable_ItemProvaCODMATERIA: TIBStringField;
    IBTable_ItemProvaDISCIPLINA: TIBStringField;
    IBTable_ItemProvaUNIDADE: TIBStringField;
    IBTable_ItemProvaSUBUNIDADE: TIBStringField;
    IBTable_ItemProvaOBJETIVO: TIBStringField;
    IBTable_ItemProvaQUARENTENA: TDateTimeField;
    IBTable_ItemProvaSERIE: TIBStringField;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel_dataAtualizacao: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape3: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel_Pagina: TQRLabel;
    IBQuery_MontaGabaritoHISTORICO: TIBStringField;
    QRLabel_Disciplina: TQRLabel;
    QRLabel_Unidade: TQRLabel;
    QRLabel_SubUnidade: TQRLabel;
    QRLabel_Objetivo: TQRLabel;
    QRLabel_Serie: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel_ElaboradoPorNome: TQRLabel;
    QRLabel_ElaboradoPorPosto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_AprovadoPorNome: TQRLabel;
    QRLabel_AprovadoPorPosto: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_GPA: TForm_Rel_GPA;

implementation

uses Se_Prova, Module, MontaGabarito;

{$R *.dfm}

procedure TForm_Rel_GPA.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   Status: Boolean;
begin
   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA') then
     Status:= True
   else
     Status:= False;

    QRLabel_ElaboradoPorNome.Visible:= Status;
    QRLabel_ElaboradoPorPosto.Visible:= Status;

    QRLabel_AprovadoPorNome.Visible:= Status;
    QRLabel_AprovadoPorPosto.Visible:= Status;

   if Form_Cad_Prova.VS_TipoProva = 'Gabarito da Prova feita Pelo Sistema'  then
   begin
      if Funcoes.GetGabaritoProva = '' then
         Funcoes.SetGabaritoProva('1');

      Funcoes.ExecutaQuery(IBQuery_MontaGabarito, 'Select g.IdCurso, g.IdTurma, g.Questao, g.NumItem, g.NumeroQuestao, g.Gabarito, i.RespostaCorreta, i.Observacao as Historico '+
                                                  ' From gabaritoprova g, ITEM_DESC i '+
                                                  ' where g.numitem = i.NumItem '+
                                                  ' and   g.IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                                  ' and   g.IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                                                  ' and   g.FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                                                  ' and   g.ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                                  ' and   g.CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                                                  ' and   g.Gabarito = '+Funcoes.GetGabaritoProva+
                                                  ' Order by g.Questao '
                          );
      QRLabel_gabarito.Caption:= 'GABARITO: '+IBQuery_MontaGabarito.FieldByName('Gabarito').AsString;
      QRLabel_Disciplina.Caption:= 'DISCIPLINA';
      QRLabel_Unidade.Caption:= 'UNIDADE';
      QRLabel_SubUnidade.Caption:= 'SUBUNIDADE';
      QRLabel_Objetivo.Caption:= 'OBJETIVO';
      QRLabel_Serie.Caption:= 'SÉRIE';
   end
   else
   begin
      Funcoes.ExecutaQuery(IBQuery_MontaGabarito, 'Select IdCurso, IdTurma, 0 as Questao, 0 numitem,  NumeroQuestao, RespostaCorreta, Gabarito, Cast( '+#39+#39+' as Varchar(200)) as Historico '+
                                                  ' From  ItemTesteManual '+
                                                  ' Where IdCurso =  '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                                                  ' and   IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                                                  ' and   FAseAplicacao =  '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                                                  ' and   ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                                  ' and   CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                                                  ' Order By IdCurso, IdTurma, NumeroQuestao'

                          );
      QRLabel_gabarito.Caption:= '';
      QRLabel_Disciplina.Caption:= '';
      QRLabel_Unidade.Caption:= '';
      QRLabel_SubUnidade.Caption:= '';
      QRLabel_Objetivo.Caption:= '';
      QRLabel_Serie.Caption:= '';
   end;

   IBTable_ItemProva.Open;

   QRLabel_DescCurso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;
   QRLabel_NItens.Caption:= 'Nº de Itens: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('TotalItens').AsString;
   QRLabel_Instrumento_Avaliacao.Caption:= 'Instrumento de Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
   QRLabel_Data_Avaliacao.Caption:= 'Data da Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log02.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_SGQ.jpg');

   QRLabel_dataAtualizacao.Caption:= 'Data de atualização: '+DateToStr(Date);

   QRLabel_Pagina.Caption:= '/ '+IntToStr(Form_Cad_Prova.NPaginas);
end;

procedure TForm_Rel_GPA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_MontaGabarito.Close;
   IBTable_ItemProva.Close;
   Action:= caFree;
end;

end.
