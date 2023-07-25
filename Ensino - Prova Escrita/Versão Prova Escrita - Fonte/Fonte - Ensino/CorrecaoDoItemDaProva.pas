//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Prova.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da montagem da prova.                          //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/03/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit CorrecaoDoItemDaProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, Rotinas,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, IBCustomDataSet, IBTable,
  IBQuery, JvToolEdit, JvDBCtrl, JvRichEd, JvDBRichEd, JvComponent, 
  JvCaptionPanel, Menus, JvEdit, JvGradient, JvTransBtn, JvShape;

type
  TForm_CorrecaoDoItemDaProvaSistema = class(TForm)
    Panel_TratamentoDoItem: TPanel;
    Panel_Alternativa: TPanel;
    DBGrid_Query_Item_Prova: TDBGrid;
    GroupBox_TratamentoIrregularidade: TGroupBox;
    GroupBox_Questao: TGroupBox;
    GroupBox_AlternativaCorreta: TGroupBox;
    GroupBox_DescricaoDoItem: TGroupBox;
    JvDBRichEdit_Text: TJvDBRichEdit;
    Panel5: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel_BotoesIniciais: TPanel;
    JvGradient4: TJvGradient;
    JvShape_FinalizaCorrecao: TJvShape;
    JvTransparentButton_FinalizaCorrecao: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    Memo2: TMemo;
    Documento: TJvDBRichEdit;
    Label_Prova: TLabel;
    JvShape2: TJvShape;
    JvTransparentButton_A: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_B: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_C: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_D: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Anulada: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Irregular: TJvTransparentButton;
    GroupBox_TrataObservacaoDoItem: TGroupBox;
    DBRichEdit_Observacao: TDBRichEdit;

    procedure FormActivate(Sender: TObject);
    procedure AtualizaQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_FinalizaCorrecaoClick(Sender: TObject);
    procedure JvTransparentButton_AClick(Sender: TObject);
    procedure JvTransparentButton_BClick(Sender: TObject);
    procedure JvTransparentButton_CClick(Sender: TObject);
    procedure JvTransparentButton_DClick(Sender: TObject);
    procedure JvTransparentButton_AnuladaClick(Sender: TObject);
    procedure JvTransparentButton_IrregularClick(Sender: TObject);
  private    { Private declarations }
     HouveMudanca: Boolean;

  public    { public declarations }
  end;
var
  Form_CorrecaoDoItemDaProvaSistema: TForm_CorrecaoDoItemDaProvaSistema;

implementation

uses Module, CorrecaoProva, CorrecaoDaProva01;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.FormActivate(Sender: TObject);
begin
  HouveMudanca:= False;
  if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_CorrecaoDoItemDaProvaSistema.Caption:= 'SAE(SISTEMA DE ACOMPANHAMENTO EDUCACIONAL) --> Cadastro de Irregularidade da Prova - Sistema';

   Label_Prova.Caption:= 'Irregularidade da Prova: '+Copy( Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,1,2)+'-'+
                         Copy(Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,3,2);

   Form_Cad_CorrecaoProva.IBQuery_ItemTeste.Last;
   if Form_Cad_CorrecaoProva.IBQuery_ItemTeste.RecordCount = 0 then
   begin
      GroupBox_TratamentoIrregularidade.Enabled:= False;
      GroupBox_TrataObservacaoDoItem.Enabled:= False;
   end
   else
   begin
      Form_Cad_CorrecaoProva.IBQuery_ItemTeste.First;
      AtualizaQuery;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando fechar a janela
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if HouveMudanca = True then
   begin
      Application.CreateForm(TForm_CorrecaoDaProva01, Form_CorrecaoDaProva01);
      Form_Cad_CorrecaoProva.IBQuery_ItemTeste.Filtered:= False;
      Form_CorrecaoDaProva01.Show;
   end;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_FecharClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_FinalizaCorrecaoClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Questao Irregular
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_IrregularClick(Sender: TObject);
begin
   HouveMudanca:= True;

   Form_Cad_CorrecaoProva.Table_Item_Teste.Edit;
   if Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoIrregular').AsString = 'X' then
   begin
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoIrregular').AsString:= ' ';
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaA').AsString:= ' ';
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaB').AsString:= ' ';
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaC').AsString:= ' ';
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaD').AsString:= ' ';
   end
   else
   begin
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoIrregular').AsString:= 'X';
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoAnulada').AsString:= ' ';
   end;
   Form_Cad_CorrecaoProva.Table_Item_Teste.Post;
   Funcoes.ExecutaTransacao;
   AtualizaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Questao Anulada
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_AnuladaClick(Sender: TObject);
begin
   HouveMudanca:= True;

   Form_Cad_CorrecaoProva.Table_Item_Teste.Edit;
   if Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoAnulada').AsString = 'X' then
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoAnulada').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoAnulada').AsString:= 'X';

   Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('QuestaoIrregular').AsString:= ' ';
   Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaA').AsString:= ' ';
   Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaB').AsString:= ' ';
   Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaC').AsString:= ' ';
   Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaD').AsString:= ' ';
   Form_Cad_CorrecaoProva.Table_Item_Teste.Post;
   Funcoes.ExecutaTransacao;
   AtualizaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta A
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_AClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.Table_Item_Teste.Edit;
   if Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaA').AsString = 'X' then
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaA').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaA').AsString:= 'X';
   Form_Cad_CorrecaoProva.Table_Item_Teste.Post;
   Funcoes.ExecutaTransacao;
   AtualizaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta B
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_BClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.Table_Item_Teste.Edit;
   if Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaB').AsString = 'X' then
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaB').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaB').AsString:= 'X';
   Form_Cad_CorrecaoProva.Table_Item_Teste.Post;
   Funcoes.ExecutaTransacao;
   AtualizaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta C
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_CClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.Table_Item_Teste.Edit;
   if Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaC').AsString = 'X' then
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaC').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaC').AsString:= 'X';
   Form_Cad_CorrecaoProva.Table_Item_Teste.Post;
   Funcoes.ExecutaTransacao;
   AtualizaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta D
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.JvTransparentButton_DClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.Table_Item_Teste.Edit;
   if  Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaD').AsString = 'X' then
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaD').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.Table_Item_Teste.FieldByName('AlternativaCorretaD').AsString:= 'X';
   Form_Cad_CorrecaoProva.Table_Item_Teste.Post;
   Funcoes.ExecutaTransacao;
   AtualizaQuery;
end;

//------------------------------------------------------------------------------
// Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaSistema.AtualizaQuery;
begin
   Funcoes.AtualizaQuery(Form_Cad_CorrecaoProva.IBQuery_ItemTeste);
end;
end.
