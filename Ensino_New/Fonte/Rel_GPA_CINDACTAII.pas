unit Rel_GPA_CINDACTAII;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_GPA_CINDACTAII = class(TForm)
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
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
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
    QRDBText_NumItem: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel_NumItem: TQRLabel;
    QRLabel_Historico: TQRLabel;
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
    IBQuery_MontaGabaritoHISTORICO: TIBStringField;
    QRDBText_Historico: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_GPA_CINDACTAII: TForm_Rel_GPA_CINDACTAII;

implementation

uses Se_Prova, Module, MontaGabarito;

{$R *.dfm}

procedure TForm_Rel_GPA_CINDACTAII.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   VS_Comando: String;
   VI_Top, VI_TopGab: Integer;
begin
   if Form_Cad_Prova.VS_TipoProva = 'Gabarito da Prova feita Pelo Sistema'  then
   begin
      if Funcoes.GetGabaritoProva = '' then
         Funcoes.SetGabaritoProva('1');
         
      VS_Comando:= 'Select g.IdCurso, g.IdTurma, g.Questao, g.NumItem, g.NumeroQuestao, g.Gabarito, i.RespostaCorreta, i.Observacao as Historico '+
                   ' From gabaritoprova g, ITEM_DESC i '+
                   ' where g.numitem = i.NumItem '+
                   ' and   g.IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and   g.IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                   ' and   g.FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                   ' and   g.ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                   ' and   g.CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                    ' and   g.Gabarito = '+Funcoes.GetGabaritoProva+
                   ' Order by g.Questao ';
      VI_Top:= 250;
      VI_TopGab:= 226;
   end
   else
   begin
      VS_Comando:= 'Select IdCurso, IdTurma, 0 as Questao, 0 numitem,  NumeroQuestao, RespostaCorreta, Gabarito, '' as Historico '+
                   ' From  ItemTesteManual '+
                   ' Where IdCurso =  '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and   IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                   ' and   FAseAplicacao =  '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                   ' and   ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                   ' and   CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39+
                   ' Order By IdCurso, IdTurma, NumeroQuestao';
      VI_Top:= -100;
      VI_TopGab:= -100;
   end;

   QRLabel_gabarito.Top:= VI_TopGab;
   QRLabel_NumItem.Top:= VI_Top;
   QRLabel_Historico.Top:= VI_Top;

   Funcoes.ExecutaQuery(IBQuery_MontaGabarito,  VS_Comando);
   IBTable_ItemProva.Open;

   QRLabel_DescCurso.Caption:= 'Curso: '+Funcoes.GetCodCurso+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
   QRLabel_Turma.Caption:= 'Turma: '+Trim(DM.IBQuery_MontaTurma.FieldByName('turma').AsString)+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;
   QRLabel_NItens.Caption:= 'Nº de Itens: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('TotalItens').AsString;
   QRLabel_Instrumento_Avaliacao.Caption:= 'Instrumento de Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
   QRLabel_Data_Avaliacao.Caption:= 'Data da Avaliação: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DataAplicacao').AsString;
   QRLabel_gabarito.Caption:= 'Gabarito: '+IBQuery_MontaGabarito.FieldByName('Gabarito').AsString;

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
end;

procedure TForm_Rel_GPA_CINDACTAII.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_MontaGabarito.Close;
   IBTable_ItemProva.Close;
   Action:= caFree;
end;

end.
