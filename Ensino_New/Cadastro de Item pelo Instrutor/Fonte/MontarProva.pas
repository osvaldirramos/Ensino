unit MontarProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvRichEd, JvDBRichEd, Buttons, Mask, DBCtrls, Rotinas,
  ExtCtrls, JvEdit, Grids, DBGrids, JvComponent, JvCaptionPanel, ComCtrls,
  ToolWin, IBTable, DB, IBCustomDataSet, IBQuery, JvToolEdit, TeEngine,
  Series, TeeProcs, Chart, JvShape, JvGradient;

type
  TForm_MontarProva = class(TForm)
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Query_IP_Item: TIBQuery;
    Query_IP_ItemNUMITEM: TIntegerField;
    Query_IP_ItemIDCURSO: TSmallintField;
    Query_IP_ItemCODMATERIA: TIBStringField;
    Query_IP_ItemDISCIPLINA: TIBStringField;
    Query_IP_ItemUNIDADE: TIBStringField;
    Query_IP_ItemSUBUNIDADE: TIBStringField;
    Query_IP_ItemOBJETIVO: TIBStringField;
    Query_IP_ItemSERIE: TIBStringField;
    Query_IP_ItemTEMPORES: TIBStringField;
    Query_IP_ItemRESPOSTACORRETA: TIBStringField;
    Query_IP_ItemDESCENALT: TBlobField;
    Query_IP_ItemRECURSO: TIBStringField;
    DSQ_IP_Item: TDataSource;
    IBTable_Item_Desc: TIBTable;
    IBTable_Item_DescNUMITEM: TIntegerField;
    IBTable_Item_DescDESCENALT: TBlobField;
    DST_ItemDesc: TDataSource;
    IBQuery_Abrangencia: TIBQuery;
    IBQuery_AbrangenciaIDCURSO: TSmallintField;
    IBQuery_AbrangenciaIDTURMA: TIntegerField;
    IBQuery_AbrangenciaFASEAPLICACAO: TIBStringField;
    IBQuery_AbrangenciaREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_AbrangenciaCODMATERIA: TIBStringField;
    IBQuery_AbrangenciaMATERIA: TIBStringField;
    DSQ_Abrangencia: TDataSource;
    Table_Abrangencia: TIBTable;
    Table_AbrangenciaIDCURSO: TSmallintField;
    Table_AbrangenciaIDTURMA: TIntegerField;
    Table_AbrangenciaFASEAPLICACAO: TIBStringField;
    Table_AbrangenciaREFERENCIAAVALIACAO: TIBStringField;
    Table_AbrangenciaCODMATERIA: TIBStringField;
    Table_AbrangenciaMATERIA: TIBStringField;
    IBTable_MostraMateria: TIBTable;
    IBTable_MostraMateriaIDCURSO: TSmallintField;
    IBTable_MostraMateriaIDTURMA: TIntegerField;
    IBTable_MostraMateriaCODMATERIA: TIBStringField;
    IBTable_MostraMateriaNOMEMATERIA: TIBStringField;
    DST_MostraMateria: TDataSource;
    Query_Item_Teste: TIBQuery;
    Query_Item_TesteIDCURSO: TSmallintField;
    Query_Item_TesteIDTURMA: TIntegerField;
    Query_Item_TesteNUMITEM: TIntegerField;
    Query_Item_TesteFASEAPLICACAO: TIBStringField;
    Query_Item_TesteREFERENCIAAVALIACAO: TIBStringField;
    Query_Item_TesteCODMATERIA: TIBStringField;
    Query_Item_TesteNUMEROQUESTAO: TSmallintField;
    Query_Item_TesteMATERIA: TIBStringField;
    Query_Item_TesteDISCIPLINA: TIBStringField;
    Query_Item_TesteUNIDADE: TIBStringField;
    Query_Item_TesteSUBUNIDADE: TIBStringField;
    Query_Item_TesteOBJETIVO: TIBStringField;
    Query_Item_TesteSERIE: TIBStringField;
    Query_Item_TesteINDICEFACILIDADE: TIBStringField;
    DSQ_Item_Teste: TDataSource;
    IBQuery_Item: TIBQuery;
    DSTI_Item: TDataSource;
    Table_ItemTeste: TIBTable;
    Table_ItemTesteIDCURSO: TSmallintField;
    Table_ItemTesteIDTURMA: TIntegerField;
    Table_ItemTesteNUMITEM: TIntegerField;
    Table_ItemTesteFASEAPLICACAO: TIBStringField;
    Table_ItemTesteREFERENCIAAVALIACAO: TIBStringField;
    Table_ItemTesteCODMATERIA: TIBStringField;
    Table_ItemTesteMATERIA: TIBStringField;
    Table_ItemTesteNUMEROQUESTAO: TSmallintField;
    Table_ItemTesteQUESTAOANULADA: TIBStringField;
    Table_ItemTesteQUESTAOIRREGULAR: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAA: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAB: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAC: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAD: TIBStringField;
    Table_ItemTesteALTERNATIVACORRETAE: TIBStringField;
    Table_ItemTesteINDICEFACILIDADE: TIBStringField;
    DST_ItemTeste: TDataSource;
    Table_Editor_Demo_02: TIBTable;
    Table_Editor_Demo_02NUMITEM: TIntegerField;
    Table_Editor_Demo_02DESCENALT: TBlobField;
    DST_Editor_Demo_02: TDataSource;
    JvCaptionPanel_MostraItem: TJvCaptionPanel;
    DBRichEdit_Editor: TJvDBRichEdit;
    DBRichEdit_Editor_Demo_00: TJvDBRichEdit;
    DBRichEdit_Editor_Demo_01: TJvDBRichEdit;
    DSQ_MontaTeste: TDataSource;
    Table_Teste: TIBTable;
    Table_TesteIDCURSO: TSmallintField;
    Table_TesteIDTURMA: TIntegerField;
    Table_TesteFASEAPLICACAO: TIBStringField;
    Table_TesteREFERENCIAAVALIACAO: TIBStringField;
    Table_TesteCODMATERIA: TIBStringField;
    Table_TesteTOTALALUNOS: TSmallintField;
    Table_TesteTOTALITENS: TSmallintField;
    Table_TesteDURACAO: TIntegerField;
    Table_TesteTOTALIRREGULARIDADE: TSmallintField;
    Table_TesteTOTALANULADAS: TIntegerField;
    Table_TesteREFORMULADOS: TSmallintField;
    Table_TesteMANTIDO: TSmallintField;
    Table_TesteAPRESENTARNOTA: TIBStringField;
    Table_TesteOBSERVACAO: TIBStringField;
    Table_TesteN_GABARITOS: TIntegerField;
    Table_TesteDATAAPLICACAO: TDateTimeField;
    DST_Teste: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    JvCaptionPanel7: TJvCaptionPanel;
    DBNavigator1: TDBNavigator;
    DBGrid_Teste: TDBGrid;
    JvCaptionPanel_MontaProva_Abrangencia: TJvCaptionPanel;
    DBGrid_IP_Abrangencia: TDBGrid;
    JvCaptionPanel_MontaProva_Item: TJvCaptionPanel;
    DBNavigator3: TDBNavigator;
    DBGrid_ItemdeProva: TDBGrid;
    ToolBar1: TToolBar;
    JvEdit_Dis: TJvEdit;
    JvEdit_Unid: TJvEdit;
    JvEdit_SubUnid: TJvEdit;
    JvEdit_Obj: TJvEdit;
    JvEdit_Serie: TJvEdit;
    JvEdit_NItem: TJvEdit;
    JvCaptionPanel_MontaProva_ItemProva: TJvCaptionPanel;
    DBNavigator2: TDBNavigator;
    DBGrid_ItemProva: TDBGrid;
    Panel8: TPanel;
    GroupBox_Numero_Questao: TGroupBox;
    DBEdit_N_Questao: TDBEdit;
    BitBtn_NovoItem: TBitBtn;
    BitBtn_ExcluiItem: TBitBtn;
    BitBtn_GravarItem: TBitBtn;
    BitBtn_CancelarItem: TBitBtn;
    GroupBox_Total_Itens_Selecionado: TGroupBox;
    DBEdit_TotalIten: TDBEdit;
    GroupBox_Duracao: TGroupBox;
    DBEdit_Dur: TDBEdit;
    GroupBox1: TGroupBox;
    Label_Facil: TLabel;
    Label_Medio: TLabel;
    Label_Dificel: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Chart1: TChart;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Query_Item_TesteSTATUS: TIBStringField;
    Memo2: TMemo;
    Table_ItemTesteUSUARIO: TIBStringField;
    JvGradient1: TJvGradient;
    JvShape1: TJvShape;
    Label_Usuario: TLabel;
    StatusBar1: TStatusBar;

    procedure Limpar_MontaProva;
    Procedure BotoesProva(Status: Boolean);
    procedure AtualizaListaItens(Sender: TObject);
    Procedure Containers(Status: Boolean);
    procedure IndiceFacilidade_Prova;
    procedure IndiceFacilidade_Grafico;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure BitBtn_NovoItemClick(Sender: TObject);
    procedure BitBtn_ExcluiItemClick(Sender: TObject);
    procedure DBGrid_ItemProvaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ItemdeProvaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_IP_AbrangenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ItemProvaCellClick(Column: TColumn);
    procedure DBGrid_ItemdeProvaCellClick(Column: TColumn);
    procedure BitBtn_GravarItemClick(Sender: TObject);
    procedure BitBtn_CancelarItemClick(Sender: TObject);
    procedure DBGrid_TesteCellClick(Column: TColumn);
  private    { Private declarations }
     VS_Opcao, VS_IdTurma: String;
     VS_FaseApli, VS_RefAval, VS_CodMateria, VS_Materia, VS_NumeroItem: String;

     VI_TotalItens, VI_NumQuestao: Integer;

     bmIP_Item, bmMateriaProva : TBookmark;
   public
    { Public declarations }
  end;

var
  Form_MontarProva: TForm_MontarProva;

implementation

uses Sel_ItemProva, Module, Abertura;

{$R *.dfm}

procedure TForm_MontarProva.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Label_Usuario.Caption:= 'Usuário: '+Form_Abertura.MaskEdit_Nome.text;

      //--- Fecha e abre os arquivos para fazer atualização dos dados


      Query_IP_Item.Open;
      Query_Item_Teste.Open;

      Table_Teste.Open;
      IBQuery_Abrangencia.Open;
      Table_Abrangencia.Open;
      Table_ItemTeste.Open;
      Table_Editor_Demo_02.Open;
      IBTable_Item_Desc.Open;

      IBTable_MostraMateria.Open;

      JvCaptionPanel_MostraItem.Caption:= 'Item da Prova';

      Limpar_MontaProva;
      IndiceFacilidade_Prova;
      BotoesProva(True);
   end;

end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_MontarProva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ((Table_Teste.State = DSInsert) or (Table_Teste.State = DSEdit )) then
      Table_Teste.Cancel;

   if ((Table_ItemTeste.State = DSInsert) or (Table_ItemTeste.State = DSEdit )) then
      Table_ItemTeste.Cancel;

   if ((IBTable_Item_Desc.State = DSInsert) or (IBTable_Item_Desc.State = DSEdit )) then
      IBTable_Item_Desc.Cancel;


   Table_Teste.Close;
   Table_ItemTeste.Close;
   Table_Editor_Demo_02.Close;
   IBTable_MostraMateria.Close;

   Query_IP_Item.Close;
   Query_Item_Teste.Close;
   IBQuery_Item.Close;

   IBQuery_Abrangencia.Close;
   Action:= caFree;

end;

//------------------------------------------------------------------------------
// Tratamento do Botao Fechar
//------------------------------------------------------------------------------

procedure TForm_MontarProva.ToolButton_RetornarClick(Sender: TObject);
begin
    Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_MontarProva.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Limpa os campos Montagem do prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.Limpar_MontaProva;
begin
   DBEdit_N_Questao.Text:= '';
end;

//------------------------------------------------------------------------------
// Procedure parar tratar Botoes
//------------------------------------------------------------------------------

Procedure TForm_MontarProva.BotoesProva(Status: Boolean);
begin
   BitBtn_NovoItem.Enabled:= Status;
   BitBtn_ExcluiItem.Enabled:= Status;
   if Status = True then
      Status:= False
   else
      Status:= true;
   BitBtn_GravarItem.Enabled:= Status;
   BitBtn_CancelarItem.Enabled:= Status;
end;


//------------------------------------------------------------------------------
// Tratamento da Selecao do Item que compoem a prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.AtualizaListaItens(Sender: TObject);
var
   VS_Comando, VS_OrderBy: String;
begin
   VS_Comando:= 'Select NumItem, IdCurso, IdTurma, CodMateria, Disciplina, Unidade, SubUnidade, Objetivo, Serie, TempoRes, RespostaCorreta, DescEnAlt, Recurso '+
                ' From ItemProva_View  '+
                ' Where IdCurso   =:IdCurso  '+
                ' and   IdTurma = :IdTurma  '+
                ' and   CodMateria  =:Materia  '+
                ' and   Status = '+#39+'D'+#39;

   if Trim(JvEdit_Dis.Text) <> '' then
      VS_Comando:= VS_Comando+' and Disciplina = '+#39+Trim(JvEdit_Dis.Text)+#39;

   if Trim(JvEdit_Unid.Text) <> '' then
      VS_Comando:= VS_Comando+' and  Unidade = '+#39+Trim(JvEdit_Unid.Text)+#39;

   if Trim(JvEdit_SubUnid.Text) <> '' then
      VS_Comando:= VS_Comando+' and SubUnidade = '+#39+Trim(JvEdit_SubUnid.Text)+#39;

   if Trim(JvEdit_Obj.Text) <> '' then
      VS_Comando:= VS_Comando+' and Objetivo = '+#39+Trim(JvEdit_Obj.Text)+#39;

   if Trim(JvEdit_Serie.Text) <> '' then
      VS_Comando:= VS_Comando+' and serie = '+#39+Trim(JvEdit_Serie.Text)+#39;

   if Trim(JvEdit_NItem.Text) <> '' then
      VS_Comando:= VS_Comando+' and NumItem = '+Trim(JvEdit_NItem.Text);

   VS_OrderBy:= ' Order By Disciplina, Unidade, SubUnidade, Objetivo, Serie asc';

   Funcoes.ExecutaQuery(Query_IP_Item, VS_Comando+VS_OrderBy );
end;

//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_MontarProva.Containers(Status: Boolean);
begin
   ToolBar_BotoesIniciais.Enabled:= Status;

   JvCaptionPanel_MontaProva_Abrangencia.Enabled:= Status;
   JvCaptionPanel_MontaProva_Item.Enabled:= Status;
   JvCaptionPanel_MontaProva_ItemProva.Enabled:= Status;
end;


//------------------------------------------------------------------------------
//
// Tratamento da Insercao dos Itens de Prova
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tratamento do botao novo Monta Prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.BitBtn_NovoItemClick(Sender: TObject);
var
   VS_Indice, VS_Comando: String;
begin
   if Query_IP_Item.FieldByName('Recurso').AsString = 'S' then
   begin
      Showmessage('O Item seleciona esta com Recurso, não sendo possível utiliza-lo...');
   end
   else
   begin
      bmMateriaProva:= IBQuery_Abrangencia.GetBookMark;
      bmIP_Item:= Query_IP_Item.GetBookMark;
      if trim(Query_IP_Item.FieldByName('numItem').AsString) = '' then
      begin
         Showmessage('Não foi selecionado nenhum Item...');
      end
      else
      begin
         VS_IdCurso:= Table_Teste.FieldByName('IdCurso').AsString;
         VS_IdTurma:= Table_Teste.FieldByName('IdTurma').AsString;
         VS_FaseApli:= Table_Teste.FieldByName('faseAplicacao').AsString;
         VS_RefAval:= Table_Teste.FieldByName('ReferenciaAvaliacao').AsString;
         VS_CodMateria:= Table_Teste.FieldByName('CodMateria').AsString;
         VS_Materia:= Table_Abrangencia.FieldByName('Materia').AsString;
         VS_NumeroItem:= Query_IP_Item.FieldByName('numItem').AsString;

         //----------------- Verifica se o Item ja foi cadastrado ------------------//

         VS_Comando:= 'Select count(1) Retorno '+
                      'From ItemTeste '+
                      'Where IdCurso = '+VS_IdCurso+' '+
                      'and   IdTurma = '+VS_IdTurma+' '+
                      'and   FaseAplicacao = '+#39+VS_FaseApli+#39+' '+
                      'and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+' '+
                      'and   CodMateria = '+#39+VS_CodMateria+#39+' '+
                      'and   NumItem = '+VS_NumeroItem;

         VI_TotalItens:= Funcoes.ContRegistro(VS_Comando);
         if VI_TotalItens > 0 then
         begin
            Showmessage('Este Item já foi cadastrado...');
         end
         else
         begin
            // Pega o Indice de Facilidade da Prova

            VS_Comando:= 'Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+VS_NumeroItem;
            Funcoes.OpenQuery(VS_Comando);

            if DM.IBQuery_Executa.FieldByName('Indice').AsFloat < 0.60 then
            begin
               VS_Indice:= 'D';                         // Dificel
               Label_Dificel.Caption:= IntToStr(StrToInt(Label_Dificel.Caption)+1);
            end
            else
            begin
              if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.80 then
              begin
                  VS_Indice:= 'F';                     // Facil
                  Label_Facil.Caption:= IntToStr(StrToInt(Label_Facil.Caption)+1);
              end
              else
              begin
                  VS_Indice:= 'M';    // Media
                  Label_Medio.Caption:= IntToStr(StrToInt(Label_Medio.Caption)+1);
              end;
            end;

            // Pega o total de Itens da Prova

            VS_Comando:= 'Select count(1) Retorno '+
                         'From ItemTeste '+
                         'Where IdCurso = '+VS_IdCurso+' '+
                         'and   IdTurma = '+VS_IdTurma+' '+
                         'and   FaseAplicacao = '+#39+VS_FaseApli+#39+' '+
                         'and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+' '+
                         'and   CodMateria = '+#39+VS_CodMateria+#39;

            VI_TotalItens:= Funcoes.ContRegistro(VS_Comando);

            //---------------- Verifica o numero da ultima questao --------------------//

            Limpar_MontaProva;
            Containers(False);
            JvCaptionPanel_MontaProva_ItemProva.Enabled:= True;
            BotoesProva(False);
            VS_Opcao:= 'Inserir';

            VI_NumQuestao:= VI_TotalItens +1;      // Tem a função de verificar a quantidade de Itens existem

            Table_ItemTeste.Append;

            Table_ItemTeste.FieldByName('IdCurso').AsString:= VS_IdCurso;
            Table_ItemTeste.FieldByName('IdTurma').AsString:= VS_IdTurma;
            Table_ItemTeste.FieldByName('faseAplicacao').AsString:= VS_FaseApli;
            Table_ItemTeste.FieldByName('ReferenciaAvaliacao').AsString:= VS_refAval;
            Table_ItemTeste.FieldByName('CodMateria').AsString:= VS_CodMateria;
            Table_ItemTeste.FieldByName('Materia').AsString:= VS_Materia;
            Table_ItemTeste.FieldByName('numItem').AsString:= VS_NumeroItem;
            Table_ItemTeste.FieldByName('NumeroQuestao').AsInteger:= VI_NumQuestao;
            Table_ItemTeste.FieldByName('IndiceFacilidade').AsString:= VS_Indice;

            DBEdit_N_Questao.SetFocus;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de exclusao do item da prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.BitBtn_ExcluiItemClick(Sender: TObject);
var
   VS_Comando: String;
   VI_Retorno, VI_TempoRes, VI_Questao, VI_QTD_Itens: Integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Item selecionado '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
//      Funcoes.GravaAcesso('Curso - Montar Prova', 'Excluir Item Prova do Curso '+Form_Sel_ItemProva.JvxLabel_CodCurso.Caption+'Item nº '+DBEdit_N_Questao.Text+' Fase: '+Table_Teste.FieldByName('faseAplicacao').AsString+' Referencia: '+Table_Teste.FieldByName('ReferenciaAvaliacao').AsString);
      try
         //---- Cadastro de numero de questao que ja existe, eh feito ajuste ----//

         bmMateriaProva:= IBQuery_Abrangencia.GetBookMark;
         bmIP_Item:= Query_IP_Item.GetBookMark;
         IBQuery_Item.Open;

         VS_FaseApli:= Table_Teste.FieldByName('faseAplicacao').AsString;
         VS_RefAval:= Table_Teste.FieldByName('ReferenciaAvaliacao').AsString;
         VS_CodMateria:= Table_Teste.FieldByName('CodMateria').AsString;
         if IBQuery_Item.FieldByName('TempoRes').AsString = '' then
            VI_TempoRes:= 0
         else
           VI_TempoRes:= IBQuery_Item.FieldByName('TempoRes').AsInteger;
         IBQuery_Item.close;

         VI_Questao:= StrToInt(DBEdit_N_Questao.Text);
         Table_ItemTeste.Delete;
         Funcoes.ExecutaTransacao;

         VI_TotalItens:= Table_Teste.FieldByName('TotalItens').AsInteger;
         VI_QTD_Itens:= VI_TotalItens-1;

          While VI_Questao <= VI_QTD_Itens  do
          begin
              VS_Comando:= 'Update ItemTeste  '+
                           ' Set NumeroQuestao =  '+IntToStr(VI_Questao)+
                           ' Where IdCurso = '+VS_IdCurso+
                           ' and   IdTurma = '+VS_IdTurma+
                           ' and   FaseAplicacao = '+#39+VS_FaseApli+#39+
                           ' and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+
                           ' and   NumeroQuestao = '+IntToStr(VI_Questao+1);
              Funcoes.ExecusaoQuery(VS_Comando);
              VI_Questao:= VI_Questao+1;
         end;

         //---- Gravacao dos Dados de Duracao e Total de Itens na Tabela TESTE -----//

         Table_Teste.Edit;
         Table_Teste.FieldByName('Duracao').AsInteger:= Table_Teste.FieldByName('Duracao').AsInteger - VI_TempoRes;
         Table_Teste.FieldByName('TotalItens').AsInteger:= VI_TotalItens-1;
         Table_Teste.Post;
         Funcoes.ExecutaTransacao;
         Funcoes.AtualizaQuery(Query_Item_Teste);
         IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
         IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

         Query_IP_Item.GotoBookmark(bmIP_Item);
         Query_IP_Item.FreeBookMark(bmIP_Item);

         Containers(True);
         BotoesProva(True);
      except
         Table_ItemTeste.Close;
         Table_ItemTeste.Open;

         Table_Teste.Close;
         Table_Teste.Open;

         Funcoes.AtualizaQuery(Query_Item_Teste);
         Funcoes.ExecutaTransacao;

         IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
         IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

         Query_IP_Item.GotoBookmark(bmIP_Item);
         Query_IP_Item.FreeBookMark(bmIP_Item);
         Containers(True);
         BotoesProva(True);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de gravacao da Prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.BitBtn_GravarItemClick(Sender: TObject);
var
   VS_Duracao, VS_Comando: String;
   VI_Questao, VI_QTD_Itens: Integer;
begin
//   Funcoes.GravaAcesso('Curso - Montar Prova', 'Gravar Item Prova do Curso '+Form_Sel_ItemProva.JvxLabel_CodCurso.Caption+' Questão: '+DBEdit_N_Questao.Text);
   try
      //----------------- Gravacao dos Dados na Tabela ITEM_TESTE ---------------//

      VS_Duracao:= Query_IP_Item.FieldByName('TempoRes').AsString;

      If ( StrToInt(DBEdit_N_Questao.Text) = VI_NumQuestao) then
      begin
         try
            Table_ItemTeste.Post;
            Funcoes.ExecutaTransacao;
         except
            Table_ItemTeste.Cancel;
            Funcoes.ExecutaTransacao;
            Table_ItemTeste.Close;
            Table_ItemTeste.Open;
         end;
      end
      else
      begin
         try
            //---- Cadastro de numero de questao que ja existe, eh feito ajuste ----//

            VI_Questao:= StrToInt(DBEdit_N_Questao.Text);
            Table_ItemTeste.Cancel;    // Cancela a Inclusao do Curso
            Funcoes.ExecutaTransacao;

            VI_QTD_Itens:= VI_TotalItens;

            While VI_QTD_Itens >= VI_Questao do
            begin
               VS_Comando:= 'Update ItemTeste  '+
                            ' Set NumeroQuestao =  '+IntToStr(VI_QTD_Itens+1)+
                            ' Where IdCurso = '+VS_IdCurso+
                            ' and   IdTurma = '+VS_IdTurma+
                            ' and   FaseAplicacao = '+#39+VS_FaseApli+#39+
                            ' and   ReferenciaAvaliacao = '+#39+VS_RefAval+#39+
                            ' and   NumeroQuestao = '+IntToStr(VI_QTD_Itens);
                Funcoes.ExecusaoQuery(VS_Comando);
                VI_QTD_Itens:= VI_QTD_Itens-1;
            end;

            //-------------------- Grava o Item Selecionado ------------------------//

            Table_ItemTeste.Append;
            Table_ItemTeste.FieldByName('IdCurso').AsString:= VS_IdCurso;
            Table_ItemTeste.FieldByName('IdTurma').AsString:= VS_IdTurma;
            Table_ItemTeste.FieldByName('faseAplicacao').AsString:= VS_FaseApli;
            Table_ItemTeste.FieldByName('ReferenciaAvaliacao').AsString:= VS_refAval;
            Table_ItemTeste.FieldByName('CodMateria').AsString:= VS_CodMateria;
            Table_ItemTeste.FieldByName('Materia').AsString:= VS_Materia;
            Table_ItemTeste.FieldByName('numItem').AsString:= VS_NumeroItem;
            Table_ItemTeste.FieldByName('NumeroQuestao').AsInteger:=  VI_Questao;
            Table_ItemTeste.FieldByName('Usuario').AsString:= Label1.Caption;
            Table_ItemTeste.Post;
            Funcoes.ExecutaTransacao;
         except
            Table_ItemTeste.Cancel;
            Funcoes.ExecutaTransacao;
            Table_ItemTeste.Close;
            Table_ItemTeste.Open;
         end;

      end;

      //---- Gravacao dos Dados de Duracao e Total de Itens na Tabela TESTE -----//

      Table_Teste.Edit;
      Table_Teste.FieldByName('Duracao').AsInteger:= Table_Teste.FieldByName('Duracao').AsInteger + StrToInt(VS_Duracao);
      Table_Teste.FieldByName('TotalItens').AsInteger:= VI_TotalItens+1;
      Table_Teste.Post;

      VS_Comando:= 'Update Item_Prova  '+
                   ' Set Status =  '+#39+'N'+#39+
                   ' Where numItem = '+VS_NumeroItem;
      Funcoes.ExecusaoQuery(VS_Comando);

      Table_Teste.Close;
      Table_Teste.Open;

      Funcoes.AtualizaQuery(Query_Item_Teste);

      IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
      IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

      Query_IP_Item.GotoBookmark(bmIP_Item);
      Query_IP_Item.FreeBookMark(bmIP_Item);

      Containers(True);
      BotoesProva(True);
   except
      Table_ItemTeste.Close;
      Table_ItemTeste.Open;

      Table_Teste.Close;
      Table_Teste.Open;
      Funcoes.AtualizaQuery(Query_Item_Teste);

      IBQuery_Abrangencia.GotoBookMark(bmMateriaProva);
      IBQuery_Abrangencia.FreeBookMark(bmMateriaProva);

      Query_IP_Item.GotoBookmark(bmIP_Item);
      Query_IP_Item.FreeBookMark(bmIP_Item);

      Containers(True);
      BotoesProva(True);
   end;
end;

//------------------------------------------------------------------------------
// Cancela a gravacao dos Item que farao parte da prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.BitBtn_CancelarItemClick(Sender: TObject);
begin
//   Funcoes.GravaAcesso('Curso - Montar Prova', 'Cancelar Item Prova do Curso '+Form_Sel_ItemProva.JvxLabel_CodCurso.Caption);
   Containers(True);
   BotoesProva(True);
   Table_ItemTeste.Cancel;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
//Tratamento para Mostrar o Indice de Facilidade da Prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.DBGrid_ItemProvaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Query_Item_Teste.FieldByName('IndiceFacilidade').AsString = 'D' then
     DBGrid_ItemProva.Canvas.Font.Color:= clGray
   else
     if Query_Item_Teste.FieldByName('IndiceFacilidade').AsString = 'M' then
        DBGrid_ItemProva.Canvas.Font.Color:= clMaroon
     else
        DBGrid_ItemProva.Canvas.Font.Color:= clTeal;

  if gdSelected in State then
    DBGrid_ItemProva.Canvas.Brush.Color := $006A2602;

   DBGrid_ItemProva.Canvas.FillRect(Rect);
   DBGrid_ItemProva.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_MontarProva.DBGrid_ItemdeProvaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_ItemdeProva, Rect, DataCol, Column, State );
end;

procedure TForm_MontarProva.DBGrid_IP_AbrangenciaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_IP_Abrangencia, Rect, DataCol, Column, State );
end;

procedure TForm_MontarProva.DBGrid_ItemProvaCellClick(Column: TColumn);
begin
   JvCaptionPanel_MostraItem.Caption:= 'Item da Prova';
   DBRichEdit_Editor.Visible:= True;
   DBRichEdit_Editor_Demo_01.Visible:= False;
end;

procedure TForm_MontarProva.DBGrid_ItemdeProvaCellClick(Column: TColumn);
begin
   JvCaptionPanel_MostraItem.Caption:= 'Item Disponível';
   DBRichEdit_Editor_Demo_01.Visible:= True;
   DBRichEdit_Editor.Visible:= False;
end;



//------------------------------------------------------------------------------
// Trata do Indice de Facilidade da Prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.IndiceFacilidade_Prova;
var
  VS_Comando: String;
begin
   Label_Dificel.Caption:= '0';
   Label_Facil.Caption:= '0';
   Label_Medio.Caption:= '0';

   Query_Item_Teste.First;
   While not Query_Item_Teste.Eof do
   begin
      // Pega o Indice de Facilidade da Prova

      VS_Comando:= 'Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+Query_Item_Teste.FieldByName('NumItem').AsString;
      Funcoes.OpenQuery(VS_Comando);

      if DM.IBQuery_Executa.FieldByName('Indice').AsFloat < 0.60 then
         Label_Dificel.Caption:= IntToStr(StrToInt(Label_Dificel.Caption)+1)
      else
         if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.80 then
             Label_Facil.Caption:= IntToStr(StrToInt(Label_Facil.Caption)+1)
         else
             Label_Medio.Caption:= IntToStr(StrToInt(Label_Medio.Caption)+1);
      Query_Item_Teste.Next;
   end;
   Query_Item_Teste.First;
   IndiceFacilidade_Grafico;
end;

//------------------------------------------------------------------------------
// Trata Grafico de demonstracao do Indice de Facilidade da Prova
//------------------------------------------------------------------------------

procedure TForm_MontarProva.IndiceFacilidade_Grafico;
begin
   series6.Clear;
   series7.Clear;
   series8.Clear;

   series6.Add(StrToInt(Label_Facil.Caption), FormatFloat('00', StrToInt(Label_Facil.Caption)), clTeeColor);
   series7.Add(StrToInt(Label_Medio.Caption), FormatFloat('00', StrToInt(Label_Medio.Caption)), clTeeColor);
   series8.Add(StrToInt(Label_Dificel.Caption), FormatFloat('00', StrToInt(Label_Dificel.Caption)), clTeeColor);
end;


procedure TForm_MontarProva.DBGrid_TesteCellClick(Column: TColumn);
begin
   IndiceFacilidade_Prova;
end;

end.
