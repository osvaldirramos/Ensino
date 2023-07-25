unit CorrecaoDaProva01;

interface

uses
  Printers, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ToolWin, Rotinas, DB, IBCustomDataSet,
  IBQuery, IBTable, Grids, DBGrids, JvComponent, JvTransBtn, JvShape,
  ExtCtrls, JvGradient, DBCtrls, JvRichEd, JvDBRichEd, PsyRichEdit, Mask;

type

  TForm_CorrecaoDaProva01 = class(TForm)
    IBQuery_RespostaAluno: TIBQuery;
    DSQ_RespostaAluno: TDataSource;
    PrintDialog1: TPrintDialog;
    IBTable_Item_Teste: TIBTable;
    IBTable_Item_TesteIDCURSO: TSmallintField;
    IBTable_Item_TesteIDTURMA: TIntegerField;
    IBTable_Item_TesteNUMITEM: TIntegerField;
    IBTable_Item_TesteFASEAPLICACAO: TIBStringField;
    IBTable_Item_TesteREFERENCIAAVALIACAO: TIBStringField;
    IBTable_Item_TesteCODMATERIA: TIBStringField;
    IBTable_Item_TesteMATERIA: TIBStringField;
    IBTable_Item_TesteNUMEROQUESTAO: TSmallintField;
    IBTable_Item_TesteQUESTAOANULADA: TIBStringField;
    IBTable_Item_TesteQUESTAOIRREGULAR: TIBStringField;
    IBTable_Item_TesteALTERNATIVACORRETAA: TIBStringField;
    IBTable_Item_TesteALTERNATIVACORRETAB: TIBStringField;
    IBTable_Item_TesteALTERNATIVACORRETAC: TIBStringField;
    IBTable_Item_TesteALTERNATIVACORRETAD: TIBStringField;
    IBQuery_Gabarito: TIBQuery;
    DSQ_Gabarito: TDataSource;
    IBQuery_GabaritoNUMEROQUESTAO: TIntegerField;
    IBQuery_GabaritoNUMITEM: TIntegerField;
    IBQuery_GabaritoQUESTAO: TIntegerField;
    IBQuery_GabaritoIDCURSO: TSmallintField;
    IBQuery_GabaritoIDTURMA: TIntegerField;
    IBQuery_GabaritoFASEAPLICACAO: TIBStringField;
    IBQuery_GabaritoREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_GabaritoCODMATERIA: TIBStringField;
    IBQuery_RespostaAlunoIDCURSO: TSmallintField;
    IBQuery_RespostaAlunoIDTURMA: TIntegerField;
    IBQuery_RespostaAlunoCODMATERIA: TIBStringField;
    IBQuery_RespostaAlunoFASEAPLICACAO: TIBStringField;
    IBQuery_RespostaAlunoIDENTIDADE: TIBStringField;
    IBQuery_RespostaAlunoREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_RespostaAlunoOPCAOVETOR: TIBStringField;
    IBQuery_RespostaAlunoGABARITO: TIBStringField;
    IBTable_QGA: TIBTable;
    IBTable_QGAIDCURSO: TSmallintField;
    IBTable_QGAIDTURMA: TIntegerField;
    IBTable_QGAFASEAPLICACAO: TIBStringField;
    IBTable_QGAREFERENCIAAVALIACAO: TIBStringField;
    IBTable_QGACODMATERIA: TIBStringField;
    IBTable_QGACODPROVA: TIBStringField;
    IBTable_QGAMEDIAMINIMA: TIBBCDField;
    IBTable_TesteAplicacao: TIBTable;
    IBTable_TesteAplicacaoIDCURSO: TSmallintField;
    IBTable_TesteAplicacaoIDTURMA: TIntegerField;
    IBTable_TesteAplicacaoFASEAPLICACAO: TIBStringField;
    IBTable_TesteAplicacaoREFERENCIAAVALIACAO: TIBStringField;
    IBTable_TesteAplicacaoCODMATERIA: TIBStringField;
    IBTable_TesteAplicacaoIDENTIDADE: TIBStringField;
    IBTable_TesteAplicacaoSTATUS: TIBStringField;
    IBTable_TesteAplicacaoOBSEVACAO: TIBStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Memo2: TMemo;
    JvGradient4: TJvGradient;
    JvShape_FinalizaCorrecao: TJvShape;
    JvTransparentButton_FinalizaCorrecao: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    IBQuery_GabaritoRESPOSTACORRETA: TIBStringField;
    IBQuery_GabaritoGABARITO: TIntegerField;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documentacao: TDataSource;
    JvxRichEdit_Vizu: TPsyRichEdit;
    Documento: TJvDBRichEdit;
    JvShape2: TJvShape;
    JvTransparentButton_Recalcular: TJvTransparentButton;
    JvGradient1: TJvGradient;
    JvShape3: TJvShape;
    JvTransparentButton1: TJvTransparentButton;
    JvGradient2: TJvGradient;
    JvShape4: TJvShape;
    JvTransparentButton2: TJvTransparentButton;

    procedure IniciarCorrecao(VS_CorrigirGabarito: String);
    procedure Trocar(Trocar: String; Por: String);
    procedure TratamentoParaImprimirCabecalhos(VS_Comando: String);
    procedure GravaResultado;
    procedure Est_DivisaoGrupo;
    procedure GravaEstatisticaItem( PS_NUMITEM, PS_DATAAVALIACAO, PS_INDICEFACILIDADE, PS_INDICEDIFERENCIACAO, PS_INDICEOBJETIVIDADE, PS_BRANCOS,PS_TOTALALUNOS: String; PI_Irregularidade, PI_Anulada: Integer);

    procedure Cabecalho(VS_Cabecalho: String);
    procedure LimparResultadoExames;
    procedure CorrecaoProvaManual(VS_Gabarito, VS_CorrigirGabarito: String);
    procedure CorrecaoProvaSistema(VS_Gabarito, VS_CorrigirGabarito: String);
    procedure CorrecaoProva(VS_CorrigirGabarito: String);
    procedure GravaResultadoExames(VS_Gabarito: String);
    procedure Tratar_Resposta;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_FinalizaCorrecaoClick(Sender: TObject);
    procedure JvTransparentButton_RecalcularClick(Sender: TObject);
  private    { Private declarations }
     VI_QdeAnulada, VI_QdeIrregular, VI_RespBranco,VI_RespCerta,VI_RespErrada: integer;
     VS_msg, VS_GabaritoAnterior, VS_Resposta, VS_IndicadorPosicao, VS_PossicaoErro: String;
     VR_NotaAluno: Real;

     VINumAlunos, VI_QtdQuestao: Integer;

     MResposta: array[1..50, 1..7] of String;

      //---
     //--- Tratamento para calcular os ID e ID

     VR_MaiorNota, VR_MenorNota, VR_AA2, VR_AA1, VR_AB2, VR_AB1, VR_AM2, VR_AM1: Real;

     MCorrecao: array[1..50, 1..50] of char;    //--- 0 Errou, 1 Acertou
     MNotaAluno: array[1..50] of real;
     MNumItem: array[1..50] of integer;
     MIrregularidade: array[1..50] of integer;
     MAnulada: array[1..50] of integer;

     MAcertos: array[1..50] of integer;
     MErros: array[1..50] of integer;
     MBrancos: array[1..50] of integer;

     MAcertosAA: array[1..50] of Integer;
     MNalunosAA: array[1..50] of Integer;
     MBrancosAA: array[1..50] of Integer;

     MAcertosAB: array[1..50] of Integer;
     MNalunosAB: array[1..50] of Integer;
     MBrancosAB: array[1..50] of Integer;

     MAcertosAM: array[1..50] of Integer;
     MNalunosAM: array[1..50] of Integer;
     MBrancosAM: array[1..50] of Integer;

     MIF: array[1..50] of Real;
     MID: array[1..50] of Real;
     MIO: array[1..50] of Real;

  public    { Public declarations }
  end;

var
  Form_CorrecaoDaProva01: TForm_CorrecaoDaProva01;

implementation

uses CorrecaoProva, Sel_ItemProva, Editor_Texto, Module, MenuPrincipal;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento inicial do Sistema
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_CorrecaoDaProva01, ' Correção da Prova');

   Printer.Orientation := poLandscape;

   JvxRichEdit_Vizu.Lines.Clear;
   JvShape_FinalizaCorrecao.Visible:= False;
   JvTransparentButton_FinalizaCorrecao.Visible:= False;

   VINumAlunos:= 0;
   VR_MaiorNota:= 0;
   VR_MenorNota:= 10;

   VI_QdeAnulada:= 0;
   VI_QdeIrregular:= 0;

   Form_Cad_CorrecaoProva.Table_ResultadoExames.Open;
   IBTable_QGA.Open;

   JvxRichEdit_Vizu.SelStart:= 0;
   JvxRichEdit_Vizu.PasteFromClipboard;

   IniciarCorrecao('Gabarito');

   JvShape_FinalizaCorrecao.Visible:= True;
   JvTransparentButton_FinalizaCorrecao.Visible:= True;
   JvTransparentButton_Recalcular.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando fechar a Form
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_TesteAplicacao.Close;
   IBTable_QGA.Close;
   IBQuery_RespostaAluno.Close;
   IBQuery_Gabarito.Close;
   IBTable_Item_Teste.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// tratamento para recalcular a prova
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.JvTransparentButton_RecalcularClick(Sender: TObject);
begin
   IniciarCorrecao('Original');
end;

//------------------------------------------------------------------------------
// Rotina de tratamento do inicio da correçao
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.IniciarCorrecao(VS_CorrigirGabarito: String);
var
   i: integer;
begin
   JvxRichEdit_Vizu.Lines.Clear;

   TratamentoParaImprimirCabecalhos('select doc, Descricao from Documento where Codigo = 47');

      Form_Cad_CorrecaoProva.Table_ResultadoExames.First;
      Form_Cad_CorrecaoProva.Query_RelacaoAlunos.First;

      TratamentoParaImprimirCabecalhos('select doc, Descricao from Documento where Codigo = 46');

      VS_GabaritoAnterior:= '';

   if Form_Cad_CorrecaoProva.JvTransparentButton_CorrecaoProva.Caption = 'Correção da Prova Feita pelo Sistema' then
   begin
      IBTable_TesteAplicacao.Open;
      IBTable_Item_Teste.Open;

      for i:= 1 to 50 do
      begin
         MNumItem[I]:= 0;
         MAcertos[I]:= 0;
         MErros[I]:= 0;
         MBrancos[I]:= 0;
         MIrregularidade[I]:= 0;
         MAnulada[I]:= 0;
      end;

      CorrecaoProva(VS_CorrigirGabarito);
      Est_DivisaoGrupo;           //--- Inicia o proceddo de Analise Estatistica de Testes
   end
   else
   begin
      CorrecaoProva(VS_CorrigirGabarito);
   end;
   Cabecalho('');

end;

//------------------------------------------------------------------------------
// Finaliza a correcao da prova
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.JvTransparentButton_FinalizaCorrecaoClick( Sender: TObject);
begin
   Form_Cad_CorrecaoProva.IBTable_Teste.Edit;
   Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('TotalIrregularidade').AsInteger:= VI_QdeIrregular;
   Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('TotalAnuladas').AsInteger:= VI_QdeAnulada;
   Form_Cad_CorrecaoProva.IBTable_Teste.Post;
   Funcoes.ExecutaTransacao;

   Close;
end;

//------------------------------------------------------------------------------
// Procedure para Tratar Correcao da Prova
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.CorrecaoProva(VS_CorrigirGabarito: String);
begin
   VS_msg:= '';
   while not Form_Cad_CorrecaoProva.Query_RelacaoAlunos.EOF do
   begin
      VINumAlunos:= VINumAlunos+1;            // Soma dos Alunos que feizeram a Prova - IF
      VI_RespBranco :=0;
      VI_RespCerta  :=0;
      VI_RespErrada :=0;

      if IBTable_TesteAplicacao.FieldByName('Status').AsString = 'Interrompido' then
      begin
         JvxRichEdit_Vizu.Lines.Add('O Aluno '+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString+' teve sua prova interrompida...  ');
               JvxRichEdit_Vizu.Lines.Add('____________________________________________________________________________________________________________');
         VR_NotaAluno:= 0;
         VINumAlunos:= VINumAlunos-1;            // Subtrai os Alunos que fizeram a Prova - IF

         GravaResultado;
      end
      else
      begin
         // Pega vetor com respostas do aluno

         Funcoes.ExecutaQuery( IBQuery_RespostaAluno, 'Select IdCurso, IdTurma, CodMateria, FaseAplicacao, identidade, referenciaavaliacao, opcaovetor, Gabarito '+
                                                      ' from respostaaluno '+
                                                      ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                                                      ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                                                      ' and faseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                                                      ' and ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                                                      ' and CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                                                      ' and identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName( 'Identidade').AsString+#39
                             );

         if IBQuery_RespostaAluno.FieldByName('Gabarito').AsString =  '' then
         begin
             Trocar('#Obs', 'Obs:'+#13+#13+'#MsgErro');
             Trocar('#MsgErro', 'O Aluno '+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString+' não possui identificação do Gabarito...  '+#13+'#MsgErro');
         end
         else
         begin
            if Form_Cad_CorrecaoProva.JvTransparentButton_CorrecaoProva.Caption = 'Correção da Prova Feita pelo Sistema' then
               CorrecaoProvaSistema(IBQuery_RespostaAluno.FieldByName('Gabarito').AsString, VS_CorrigirGabarito)
            else
               CorrecaoProvaManual(IBQuery_RespostaAluno.FieldByName('Gabarito').AsString, VS_CorrigirGabarito);

            if Trim(IBQuery_RespostaAluno.FieldByName('opcaovetor').AsString) <> '' then
            begin
               Tratar_Resposta;          //- Trata as informacoes do Resultado do Exame
               GravaResultadoExames( IBQuery_RespostaAluno.FieldByName('Gabarito').AsString );
               Trocar('#Obs', 'Obs:');
            end
            else
            begin
               Trocar('#Obs', 'Obs:'+#13+#13+'#MsgErro');
               if IBQuery_RespostaAluno.FieldByName('Gabarito').AsString =  '' then
                  Trocar('#MsgErro', 'O Aluno '+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString+' não possui identificação do Gabarito...  '+#13+'#MsgErro')
               else
                  Trocar('#MsgErro', 'O Aluno '+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString+' não possui resposta...  '+#13+'#MsgErro');
            end;
         end;
      end;
      Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
      Update;
   end;

   if VS_msg <> '' then
      ShowMessage('RELAÇÃO DE ALUNOS COM NOTAS ABAIXO DA  MEDIA ('+IBTable_QGA.FieldByName('MediaMinima').AsString+')'+#13+#13+VS_Msg);

   TratamentoParaImprimirCabecalhos('select doc, Descricao from Documento where Codigo = 47');
   Trocar('#MsgErro', '');
   Funcoes.AtualizaQuery(Form_Cad_CorrecaoProva.Query_RelacaoAlunos);
   JvShape_FinalizaCorrecao.Visible:= True;
   JvTransparentButton_FinalizaCorrecao.Visible:= True;
end;

//------------------------------------------------------------------------------
// Procedure para Eliminar possiveis resultados já existentes desta prova
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.LimparResultadoExames;
begin
   Funcoes.ExecusaoQuery( 'Delete from ResultadoExame '+
                          ' where IDCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                          ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                          ' and faseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                          ' and ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                          ' and CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                          ' and Identidade = '+#39+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName( 'Identidade').AsString+#39
                         );
end;

//------------------------------------------------------------------------------
// Procedure para fazer correcao da prova feita pelo sistema
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.CorrecaoProvaSistema(VS_Gabarito, VS_CorrigirGabarito: String);
var
   VI_Cont: Integer;
begin
   if ((VS_Gabarito <> VS_GabaritoAnterior) and (VS_Gabarito <> '')) then
   begin
       //---
      // Monta matriz com as respostas da Prova

      VS_GabaritoAnterior:= VS_Gabarito;
      VS_Resposta:= '';
      VI_QtdQuestao:= 0;
      VS_IndicadorPosicao:= '';
      VI_QdeAnulada:= 0;
      VI_QdeIrregular:= 0;
      VI_Cont:= 1;

       //---
      // Monta a Matriz da Prova de acordo com o Gabarito

      if VS_CorrigirGabarito = 'Original' then
      begin
         Funcoes.ExecutaQuery(IBQuery_Gabarito, 'Select GP.IdCurso, GP.IdTurma, GP.FaseAplicacao, GP.ReferenciaAvaliacao, GP.CodMateria, GP.NumeroQuestao, GP.NumItem, GP.NumeroQuestao as Questao, Id.RespostaCorreta, 0 as Gabarito '+
                                                ' From  ItemTeste_view GP,  Item_Desc ID '+
                                                ' Where GP.IdCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                                                ' and   GP.IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                                                ' and   GP.FaseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                                                ' and   GP.ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                                                ' and   GP.CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                                                ' and   GP.NumItem = ID.NumItem '+
                                                ' Order By GP.NUMEROQUESTAO'
                             );
      end
      else
      begin
         Funcoes.ExecutaQuery(IBQuery_Gabarito, 'Select GP.IdCurso, GP.IdTurma, GP.FaseAplicacao, GP.ReferenciaAvaliacao, GP.CodMateria, GP.NumeroQuestao, GP.NumItem, GP.Questao, Id.RespostaCorreta, GP.Gabarito '+
                                                ' From  GabaritoProva GP,  Item_Desc ID '+
                                                ' Where GP.IdCurso = '+DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                                                ' and   GP.IdTurma = '+DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString+
                                                ' and   GP.FaseAplicacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString+#39+
                                                ' and   GP.ReferenciaAvaliacao = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString+#39+
                                                ' and   GP.CodMateria = '+#39+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString+#39+
                                                ' and   GP.Gabarito = '+VS_Gabarito+
                                                ' and   GP.NumItem = ID.NumItem '+
                                                ' Order By GP.Questao'
                             );
      end;

      IBQuery_Gabarito.First;
      while (not IBQuery_Gabarito.EOF) do
      begin
         VS_IndicadorPosicao:= VS_IndicadorPosicao+FormatFloat('00', VI_cont)+'|';
         VI_Cont:= VI_Cont+1;

         VI_QtdQuestao:= IBQuery_Gabarito.FieldByName( 'Questao').AsInteger;

         MNumItem[VI_QtdQuestao]:= IBQuery_Gabarito.FieldByName( 'NumItem').AsInteger;
         MResposta[VI_QtdQuestao, 1]:= IBQuery_Gabarito.FieldByName( 'RespostaCorreta').AsString;
         MResposta[VI_QtdQuestao, 2]:= IBTable_Item_Teste.FieldByName( 'QuestaoAnulada').AsString;
         MResposta[VI_QtdQuestao, 3]:= IBTable_Item_Teste.FieldByName( 'QuestaoIrregular').AsString;
         MResposta[VI_QtdQuestao, 4]:= IBTable_Item_Teste.FieldByName( 'AlternativaCorretaA').AsString;
         MResposta[VI_QtdQuestao, 5]:= IBTable_Item_Teste.FieldByName( 'AlternativaCorretaB').AsString;
         MResposta[VI_QtdQuestao, 6]:= IBTable_Item_Teste.FieldByName( 'AlternativaCorretaC').AsString;
         MResposta[VI_QtdQuestao, 7]:= IBTable_Item_Teste.FieldByName( 'AlternativaCorretaD').AsString;

         if IBTable_Item_Teste.FieldByName( 'QuestaoAnulada').AsString = 'X' then
         begin
            MAnulada[VI_QtdQuestao]:= MAnulada[VI_QtdQuestao] + 1;
            VI_QdeAnulada:= VI_QdeAnulada+1;
            VS_Resposta:= VS_Resposta+'X |';
         end
         else
         begin
            if IBTable_Item_Teste.FieldByName( 'QuestaoIrregular').AsString = 'X' then
            begin
               MIrregularidade[VI_QtdQuestao]:= MIrregularidade[VI_QtdQuestao] + 1;
               VI_QdeIrregular:= VI_QdeIrregular+1;
               VS_Resposta:= VS_Resposta+'? |';
            end
            else
               VS_Resposta:= VS_Resposta+IBQuery_Gabarito.FieldByName( 'RespostaCorreta').AsString+' |';
         end;

         IBQuery_Gabarito.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para Tratar da correcao Manual da Prova
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.CorrecaoProvaManual( VS_Gabarito, VS_CorrigirGabarito: String );
var
   i, x, VI_Cont: Integer;
begin
   if ((VS_Gabarito <> VS_GabaritoAnterior) and (VS_Gabarito <>  '')) then
   begin
      for i:= 1 to 7 do
         For x:= 1 to 50 do
           MResposta[x, i]:= '';

       //---
      // Monta matriz com as respostas da Prova

      VS_GabaritoAnterior:= VS_Gabarito;
      VS_Resposta:= '';
      VI_QtdQuestao:= 0;
      VS_IndicadorPosicao:= '';
      VI_QdeAnulada:= 0;
      VI_QdeIrregular:= 0;
      VI_Cont:= 1;

      Funcoes.ExecutaQuery(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual, ' Select * '+
                                                                           ' From  ItemTesteManual '+
                                                                           ' Where IdCurso = :IdCurso '+
                                                                           ' and   IdTurma = :IdTurma '+
                                                                           ' and   FAseAplicacao = :FaseAplicacao '+
                                                                           ' and   ReferenciaAvaliacao = :ReferenciaAvaliacao '+
                                                                           ' and   CodMateria = :CodMateria '+
                                                                           ' and   Gabarito = '+VS_Gabarito+
                                                                           ' Order By IdCurso, IdTurma,NumeroQuestao '
                          );

      Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.First;
      while (not Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.EOF) do
      begin
         if Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName('Gabarito').AsString = VS_Gabarito then
         begin
            VS_IndicadorPosicao:= VS_IndicadorPosicao+FormatFloat('00', VI_cont)+'|';
            VI_Cont:= VI_Cont+1;

            VI_QtdQuestao:= Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'NumeroQuestao').AsInteger;
            MResposta[VI_QtdQuestao, 1]:= trim(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'RespostaCorreta').AsString);
            MResposta[VI_QtdQuestao, 2]:= trim(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'QuestaoAnulada').AsString);
            MResposta[VI_QtdQuestao, 3]:= trim(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'QuestaoIrregular').AsString);
            MResposta[VI_QtdQuestao, 4]:= trim(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'AlternativaCorretaA').AsString);
            MResposta[VI_QtdQuestao, 5]:= trim(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'AlternativaCorretaB').AsString);
            MResposta[VI_QtdQuestao, 6]:= trim(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'AlternativaCorretaC').AsString);
            MResposta[VI_QtdQuestao, 7]:= trim(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'AlternativaCorretaD').AsString);

            if Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'QuestaoAnulada').AsString = 'X' then
            begin
               VI_QdeAnulada:= VI_QdeAnulada+1;
               VS_Resposta:= VS_Resposta+'X |';
            end
            else
            begin
               if Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'QuestaoIrregular').AsString = 'X' then
               begin
                  VI_QdeIrregular:= VI_QdeIrregular+1;
                  VS_Resposta:= VS_Resposta+'? |';
               end
               else
                  VS_Resposta:= VS_Resposta+Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.FieldByName( 'RespostaCorreta').AsString+' |';
            end;
         end;
         Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para gravar o resultado do exame
//           Monta o resultado da avaliação do Aluno
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.GravaResultadoExames(VS_Gabarito: String);
var
   i, VI_TotalItens: integer;
   VS_RespAluno: String;
begin
   if (( Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('TotalItens').AsInteger = 0)) then
   begin
      JvxRichEdit_Vizu.Lines.Add('O Total de Itens registrado esta com 0, não sendo possível realizar o calculo da nota'+#13+#13+
                                 'Para corrigir este problema entre na opção "Montar Prova" do "Menu Principal" '+#13+#13+
                                 'e verificar o total de Itens ');
   end
   else
   begin
      // Calculo da Nota
      VI_TotalItens:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('TotalItens').AsInteger - VI_QdeAnulada;
      VR_NotaAluno := (( VI_RespCerta * 10 )/ VI_TotalItens);
      VR_NotaAluno:= Funcoes.TratarNota(VR_NotaAluno);

      //---  Grava a nota da Prova

      if VR_NotaAluno < IBTable_QGA.FieldByName('MediaMinima').AsFloat then
         VS_msg:= VS_msg+#13+'Aluno: '+Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString+' - '+FormatFloat('#0.00', VR_NotaAluno);

      GravaResultado;

      if VR_NotaAluno > VR_MaiorNota then    //--- Encontra a Maior Nota - IF
          VR_MaiorNota:= VR_NotaAluno;

      if VR_NotaAluno < VR_MenorNota then    //--- Encontra a Menor Nota - IF
          VR_MenorNota:= VR_NotaAluno;

      MNotaAluno[VINumAlunos]:= VR_NotaAluno;
      VS_RespAluno:= '';
      for i:= 1 to length(IBQuery_RespostaAluno.FieldByName('OPCAOVETOR').AsString) do
         VS_RespAluno:= VS_RespAluno+Copy(IBQuery_RespostaAluno.FieldByName('OPCAOVETOR').AsString,i,1)+ ' |';

      Documento.SetFocus;
      Documento.SelectAll ;
      Documento.CopyToClipboard ;

      JvxRichEdit_Vizu.SetFocus;
      JvxRichEdit_Vizu.SelStart:= 0;
      JvxRichEdit_Vizu.PasteFromClipboard;

      Trocar('#Co', Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('CodigoAluno').AsString);
      Trocar('#Aluno', Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString);

      Trocar('#Gab', VS_Gabarito);
      Trocar('#Cer', FormatFloat('00', VI_RespCerta));
      Trocar('#Err', FormatFloat('00', VI_RespErrada));
      Trocar('#Bco', FormatFloat('00', VI_RespBranco));

      Trocar('#ITENS', VS_IndicadorPosicao);
      Trocar('#Erros', VS_PossicaoErro);
      Trocar('#Resp', VS_Resposta);
      Trocar('#RespAluno', VS_RespAluno);
   end;
end;

//------------------------------------------------------------------------------
// Esta procedure tem a função de tratar do cabecalho do relatorio
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.GravaResultado;
begin
   LimparResultadoExames;   // Elimina possiveis resultados já existentes desta prova

   Form_Cad_CorrecaoProva.Table_ResultadoExames.Append;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'IDCurso').AsString:= DM.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'faseAplicacao').AsString:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('faseAplicacao').AsString;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'ReferenciaAvaliacao').AsString:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('ReferenciaAvaliacao').AsString;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'CodMateria').AsString := Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('CodMateria').AsString;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'Identidade').AsString := Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName( 'Identidade').AsString;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'QDERespBco').AsInteger:= VI_RespBranco;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'QDERespCer').AsInteger:= VI_RespCerta;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'QDERespErr').AsInteger:= VI_RespErrada+VI_RespBranco;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.FieldByName( 'NOTA').AsFloat:=  VR_NotaAluno;
   Form_Cad_CorrecaoProva.Table_ResultadoExames.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Esta procedure tem a função de tratar do cabecalho do relatorio
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.Cabecalho(VS_Cabecalho: String);
begin
   TratamentoParaImprimirCabecalhos('select doc, Descricao from Documento where Codigo = 45');

   JvxRichEdit_Vizu.SelStart:= 0;
   JvxRichEdit_Vizu.PasteFromClipboard;

   Trocar('#CodCurso', Funcoes.GetCodCurso+' - '+Form_MenuPrincipal.Label_NomeCurso.Caption);
   Trocar('#Turma', Trim(DM.IBQuery_MontaTurma.FieldByName( 'Turma').AsString)+'-'+Trim(DM.IBQuery_MontaTurma.FieldByName( 'Ano').AsString));
   Trocar('#Avl', Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString );
   Trocar('#NItem', Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'TotalItens').AsString );
   Trocar('#99/99/99', Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'DataAplicacao').AsString );
end;


//------------------------------------------------------------------------------
// Esta procedure tem a função de tratar a Opcao do Aluno
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.Tratar_Resposta;
var
   VI_Questao: Integer;
   VS_QIA, VS_QIB, VS_QIC, VS_QID, VS_Resp: String;
Begin

   VS_PossicaoErro:= '';
   For VI_Questao:= 1 to VI_QtdQuestao do
   begin
      VS_RESP := Copy(IBQuery_RespostaAluno.FieldByName('OPCAOVETOR').AsString,VI_Questao,1);

      if Trim(VS_RESP) = '' then
      begin
         MCorrecao[VINumAlunos, VI_Questao]:= 'B';   // Seta a Resposta como Branco IF
         VS_PossicaoErro:= VS_PossicaoErro+'B |';
         VI_RespBranco:= VI_RespBranco + 1;
         MBrancos[VI_Questao]:= MBrancos[VI_Questao]+1;
      end
      else
      begin
         if Trim(VS_RESP) = 'X' then
         begin
            MCorrecao[VINumAlunos, VI_Questao ]:= 'E';   // Seta a Resposta como errada IF
            VS_PossicaoErro:= VS_PossicaoErro+'E |';
            VI_RespErrada:= VI_RespErrada + 1;
            MErros[VI_Questao]:= MErros[VI_Questao]+1;
         end
         else
         begin
            if (MResposta[VI_Questao, 2] = 'X') then       // Questao Anulada
            begin
               VS_PossicaoErro:= VS_PossicaoErro+'  |';
            end
            else
            Begin
               if (MResposta[VI_Questao, 3] = 'X') then    // Questao Irregular
               begin
                  if MResposta[VI_Questao, 4] = 'X' then
                     VS_QIA:= 'A'
                  else
                     VS_QIA:= ' ';

                  if MResposta[VI_Questao, 5] = 'X' then
                     VS_QIB:= 'B'
                  else
                     VS_QIB:= ' ';

                  if MResposta[VI_Questao, 6] = 'X' then
                     VS_QIC:= 'C'
                  else
                     VS_QIC:= ' ';

                  if MResposta[VI_Questao, 7] = 'X' then
                     VS_QID:= 'D'
                  else
                     VS_QID:= ' ';

                  if ((VS_RESP = VS_QIA) or (VS_RESP = VS_QIB) or (VS_RESP = VS_QIC) or (VS_RESP = VS_QID)) then
                  begin
                     MCorrecao[VINumAlunos, VI_Questao ]:= 'C';   // Seta a Resposta como correta IF
                     VS_PossicaoErro:= VS_PossicaoErro+'  |';
                     VI_RespCerta:= VI_RespCerta + 1;
                     MAcertos[VI_Questao]:= MAcertos[VI_Questao] + 1;
                  end
                  else
                  begin
                     MCorrecao[VINumAlunos, VI_Questao ]:= 'E';   // Seta a Resposta como Errada IF
                     VS_PossicaoErro:= VS_PossicaoErro+'E |';
                     VI_RespErrada:= VI_RespErrada + 1;
                     MErros[VI_Questao]:= MErros[VI_Questao]+1;
                  end;
               end
               else
               begin
                  if VS_RESP = MResposta[VI_Questao, 1] then
                  begin
                     MCorrecao[VINumAlunos, VI_Questao ]:= 'C';   // Seta a Resposta como correta IF
                     VS_PossicaoErro:= VS_PossicaoErro+'  |';
                     VI_RespCerta:= VI_RespCerta + 1;
                     MAcertos[VI_Questao]:= MAcertos[VI_Questao] + 1;
                  end
                  else
                  begin
                     MCorrecao[VINumAlunos, VI_Questao ]:= 'E';   // Seta a Resposta como errada IF
                     VS_PossicaoErro:= VS_PossicaoErro+'E |';
                     VI_RespErrada:= VI_RespErrada + 1;
                     MErros[VI_Questao]:= MErros[VI_Questao]+1;
                  end;
               end;
            end;
         end;
      end;
   end;
end;


//------------------------------------------------------------------------------
// Esta procedure tem de encontrar os tercos
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.Est_DivisaoGrupo;
var
   VR_Res: Real;
   VI_Q, VI_Al: integer;
   VS_DataAplicacao: String;
begin
   VR_Res:= VR_MaiorNota - VR_MenorNota;
   VR_Res:= VR_Res/3;

   //--- Terco Superior

   VR_AA2:= VR_MaiorNota;
   VR_AA1:= VR_MaiorNota-VR_Res;

   //--- Terco Inferior

   VR_AB2:= VR_MenorNota+VR_Res;
   VR_AB1:= VR_MenorNota;

   //--- Terco Medio

   VR_AM2:= VR_AA1-0.01;
   VR_AM1:= VR_AB2+0.01;


   //--- Encontrar os Acertos em AA

   For VI_Q:= 1 to VI_QtdQuestao do
   begin
      MAcertosAA[VI_Q]:= 0;
      MNalunosAA[VI_Q]:= 0;

      MAcertosAM[VI_Q]:= 0;
      MNalunosAM[VI_Q]:= 0;

      MAcertosAB[VI_Q]:= 0;
      MNalunosAB[VI_Q]:= 0;
   end;


   For VI_Al:= 1 to VINumAlunos do
   begin
      //--- Encontra o Grupo do Terco Superior - AA

      if (( MNotaAluno[VI_Al] <= VR_AA2) and ( MNotaAluno[VI_Al] >= VR_AA1)) then
      begin
         For VI_Q:= 1 to VI_QtdQuestao do
         begin
            if MCorrecao[VI_Al, VI_Q] <> '' then
            begin
               MNalunosAA[VI_Q]:= MNalunosAA[VI_Q]+1;

               if MCorrecao[VI_Al, VI_Q] = ' ' then
                  MBrancosAA[VI_Q]:= MBrancosAA[VI_Q]+1;

               if MCorrecao[VI_Al, VI_Q] = 'C' then
                  MAcertosAA[VI_Q]:= MAcertosAA[VI_Q]+1;
            end;
         end;
      end;

      //--- Encontra o Grupo do Terco Inferior - AB

      if (( MNotaAluno[VI_Al] <= VR_AB2) and ( MNotaAluno[VI_Al] >= VR_AB1)) then
      begin
         For VI_Q:= 1 to VI_QtdQuestao do
         begin
            if MCorrecao[VI_Al, VI_Q] <> '' then
            begin
               MNalunosAB[VI_Q]:= MNalunosAB[VI_Q]+1;

               if MCorrecao[VI_Al, VI_Q] = ' ' then
                  MBrancosAB[VI_Q]:= MBrancosAB[VI_Q]+1;

               if MCorrecao[VI_Al, VI_Q] = 'C' then
                  MAcertosAB[VI_Q]:= MAcertosAB[VI_Q]+1;
            end;
         end;
      end;

      //--- Encontra o Grupo do Terco Medio - AM

      if (( MNotaAluno[VI_Al] <= VR_AM2) and ( MNotaAluno[VI_Al] >= VR_AM1)) then
      begin
         For VI_Q:= 1 to VI_QtdQuestao do
         begin
            if MCorrecao[VI_Al, VI_Q] <> '' then
            begin
               MNalunosAM[VI_Q]:= MNalunosAM[VI_Q]+1;

               if MCorrecao[VI_Al, VI_Q] = ' ' then
                  MBrancosAM[VI_Q]:= MBrancosAM[VI_Q]+1;

               if MCorrecao[VI_Al, VI_Q] = 'C' then
                  MAcertosAM[VI_Q]:= MAcertosAM[VI_Q]+1;
            end;
         end;
      end;

   end;

   For VI_Q:= 1 to VI_QtdQuestao do
   begin
      //--- Tratamento do IF ( Indice de Facilidade )

      if (MNalunosAB[VI_Q]+MNalunosAA[VI_Q]) > 0 then
         MIF[VI_Q]:= Funcoes.TratarNota((MAcertosAB[VI_Q]+MAcertosAA[VI_Q]) / (MNalunosAB[VI_Q]+MNalunosAA[VI_Q]))
      else
         MIF[VI_Q]:= 0;

      //--- Tratamento do ID ( Indice de Diferenciacao )

      if (MNalunosAB[VI_Q]+MNalunosAA[VI_Q]) > 0 then
         if ((MAcertosAA[VI_Q] = 0) and (MAcertosAB[VI_Q] = 0)) then
            MID[VI_Q]:= 0
         else
            MID[VI_Q]:= Funcoes.TratarNota(( 3 * (MAcertosAA[VI_Q]-MAcertosAB[VI_Q])) / (VINumAlunos-MBrancos[VI_Q]))
      else
         MID[VI_Q]:= 0;

      //--- Tratamento do IO ( Indice de Objetividade )

      if (MNalunosAA[VI_Q]+MNalunosAM[VI_Q]) > 0 then
         MIO[VI_Q]:= Funcoes.TratarNota(( (MBrancosAA[VI_Q]+MBrancosAM[VI_Q]) + (MAcertosAA[VI_Q]+MAcertosAM[VI_Q]))
                                           / (MNalunosAA[VI_Q]+MNalunosAM[VI_Q]))
      else
         MIO[VI_Q]:= 0;
   end;

   VS_DataAplicacao:= Funcoes.DePara(Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByNAme('DataAplicacao').AsString, '/', '.');
   VS_DataAplicacao:= VS_DataAplicacao+' 00:00';

   For VI_Q:= 1 to VI_QtdQuestao do
   begin
      GravaEstatisticaItem(  IntToStr(MNumItem[VI_Q]),
                             VS_DataAplicacao,
                             Funcoes.DePara(FloatToStr(MIF[VI_Q]), ',', '.'),
                             Funcoes.DePara(FloatToStr(MID[VI_Q]), ',', '.'),
                             Funcoes.DePara(FloatToStr(MIO[VI_Q]), ',', '.'),
                             Funcoes.DePara(FloatToStr(MBrancosAA[VI_Q]+MBrancosAM[VI_Q]+MBrancosAB[VI_Q]), ',', '.'),
                             Funcoes.DePara(IntToStr(MNalunosAA[VI_Q]+MNalunosAM[VI_Q]+MNalunosAB[VI_Q]), ',', '.'),
                             MIrregularidade[VI_Q],
                             MAnulada[VI_Q]
                           );
   end;
end;

//------------------------------------------------------------------------------
// Esta procedure tem de encontrar os tercos
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.GravaEstatisticaItem( PS_NumItem, PS_DataAvaliacao, PS_IndiceFacilidade, PS_IndiceDiferenciacao, PS_IndiceObjetividade, PS_Brancos,PS_TotalAlunos: String; PI_Irregularidade, PI_Anulada: Integer);
var
 VS_Comando: String;
begin
   if Funcoes.QtdRegistro('Select count(1) Qtd from Item_desc Where NumItem = '+PS_NUMITEM) <> 0 then
   begin
      VS_Comando:= 'Select count(1) Qtd from Indice_Item Where NumItem = '+PS_NUMITEM+' and DataAvaliacao = '+#39+PS_DATAAVALIACAO+#39;

      if Funcoes.QtdRegistro(VS_Comando) = 0 then
      begin
         Funcoes.ExecusaoQuery( 'Insert into Indice_Item ( NumItem, DataAvaliacao, IndiceFacilidade, IndiceDiferenciacao, IndiceObjetividade, Brancos, TotalAlunos) '+
                                '                 values ('+PS_NUMITEM+', '+#39+PS_DATAAVALIACAO+#39+', '+PS_INDICEFACILIDADE+', '+PS_INDICEDIFERENCIACAO+', '+PS_INDICEOBJETIVIDADE+', '+PS_BRANCOS+', '+PS_TOTALALUNOS+')'
                               );

         if  PI_Irregularidade > 0 then
            Funcoes.ExecusaoQuery( 'Update Item_desc Set QdeIrregularidade = QdeIrregularidade + 1 Where NumItem = '+PS_NUMITEM )
         else
            if PI_Anulada > 0 then
               Funcoes.ExecusaoQuery('Update Item_desc Set QdeAnulada = QdeAnulada + 1 Where NumItem = '+PS_NUMITEM);

          Funcoes.ExecusaoQuery( 'Update Item_desc Set QDEAplic = QDEAplic + 1 Where NumItem = '+PS_NUMITEM);
      end
      else
          Funcoes.ExecusaoQuery( 'Update Indice_Item Set IndiceFacilidade = '+PS_INDICEFACILIDADE+', '+
                                                       ' IndiceDiferenciacao = '+PS_INDICEDIFERENCIACAO+', '+
                                                       ' IndiceObjetividade = '+PS_INDICEOBJETIVIDADE+', '+
                                                       ' Brancos = '+PS_BRANCOS+', '+
                                                       ' TotalAlunos = '+PS_TOTALALUNOS+
                              ' Where NumItem = '+PS_NUMITEM+
                              ' and DataAvaliacao = '+#39+PS_DATAAVALIACAO+#39
                             );
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Imprimir o Relatorio
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.JvTransparentButton_ImprimirClick( Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      JvxRichEdit_Vizu.Print('');
end;


//------------------------------------------------------------------------------
//--- Tratamento do cabecalho do relatorio
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.TratamentoParaImprimirCabecalhos(VS_Comando: String);
begin
   IBQuery_Documento.Close;
   IBQuery_Documento.Sql.Clear;
   IBQuery_Documento.Sql.Add(VS_Comando);
   IBQuery_Documento.Open;

   Documento.SelectAll ;
   Documento.CopyToClipboard ;

end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDaProva01.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := JvxRichEdit_Vizu.FindText(Trocar, 0, Length(JvxRichEdit_Vizu.Text), []);
  if Posicao > 0 then
  begin
    JvxRichEdit_Vizu.SelStart := Posicao;
    JvxRichEdit_Vizu.SelLength := Length(Trocar);
    JvxRichEdit_Vizu.SelText := Por;
  end;
  JvxRichEdit_Vizu.SelStart := 1;
end;

end.
