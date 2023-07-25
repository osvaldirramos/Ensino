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

unit CorrecaoDoItemDaProvaManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, Rotinas,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, IBCustomDataSet, IBTable,
  IBQuery, JvToolEdit, JvDBCtrl, JvRichEd, JvDBRichEd, JvComponent, 
  JvCaptionPanel, Menus, JvEdit, JvGradient, JvTransBtn, JvShape;

type
  TForm_CorrecaoDoItemDaProvaManual = class(TForm)
    Panel_TratamentoDoItem: TPanel;
    Panel_Alternativa: TPanel;
    DBGrid_Query_Item_Prova: TDBGrid;
    GroupBox_TratamentoIrregularidade: TGroupBox;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label_Gabarito: TLabel;
    ComboBox_Gabarito: TComboBox;
    GroupBox2: TGroupBox;
    JvShape6: TJvShape;
    JvTransparentButton_Anulada: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Irregular: TJvTransparentButton;
    GroupBox3: TGroupBox;
    JvShape2: TJvShape;
    JvTransparentButton_A: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_B: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_C: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_D: TJvTransparentButton;
    Label_Prova: TLabel;
    JvShape_FinalizaCorrecao: TJvShape;
    JvTransparentButton_FinalizaCorrecao: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    Memo2: TMemo;

    procedure GravaCorrecao;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox_GabaritoChange(Sender: TObject);
    procedure JvTransparentButton_AClick(Sender: TObject);
    procedure JvTransparentButton_BClick(Sender: TObject);
    procedure JvTransparentButton_CClick(Sender: TObject);
    procedure JvTransparentButton_DClick(Sender: TObject);
    procedure JvTransparentButton_AnuladaClick(Sender: TObject);
    procedure JvTransparentButton_IrregularClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_FinalizaCorrecaoClick(Sender: TObject);
  private    { Private declarations }
     HouveMudanca: Boolean;
  public    { public declarations }
  end;
var
  Form_CorrecaoDoItemDaProvaManual: TForm_CorrecaoDoItemDaProvaManual;

implementation

uses Module, CorrecaoProva, CorrecaoDaProva01;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.FormActivate(Sender: TObject);
var
   I: Integer;
begin
  HouveMudanca:= False;

  if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_CorrecaoDoItemDaProvaManual.Caption:= 'SAE(SISTEMA DE ACOMPANHAMENTO EDUCACIONAL) --> Cadastro de Irregularidade da Prova - Manual';

   Label_Prova.Caption:= 'Irregularidade da Prova: '+Copy( Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,1,2)+'-'+
                         Copy(Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,3,2);

  For i:= 1 to Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('N_Gabaritos').AsInteger do
      ComboBox_Gabarito.Items.Add(IntToStr(i));

   ComboBox_Gabarito.text:= '1';
   ComboBox_GabaritoChange(Sender);

   Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.Last;
   if Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.RecordCount = 0 then
      GroupBox_TratamentoIrregularidade.Enabled:= False
   else
      GroupBox_TratamentoIrregularidade.Enabled:= true;
   Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual.First;

   Funcoes.AtualizaQuery(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual);
end;

procedure TForm_CorrecaoDoItemDaProvaManual.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_FinalizaCorrecaoClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Questao Irregular
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_IrregularClick(Sender: TObject);
begin
   HouveMudanca:= True;
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.Edit;
   if Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoIrregular').AsString = 'X' then
   begin
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoIrregular').AsString:= ' ';
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoAnulada').AsString:= ' ';
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaA').AsString:= ' ';
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaB').AsString:= ' ';
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaC').AsString:= ' ';
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaD').AsString:= ' ';
   end
   else
   begin
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoIrregular').AsString:= 'X';
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoAnulada').AsString:= ' ';
   end;
   GravaCorrecao;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Questao Anulada
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_AnuladaClick(Sender: TObject);
begin
   HouveMudanca:= True;
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.Edit;
   if Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoAnulada').AsString = 'X' then
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoAnulada').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoAnulada').AsString:= 'X';

   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('QuestaoIrregular').AsString:= ' ';
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaA').AsString:= ' ';
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaB').AsString:= ' ';
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaC').AsString:= ' ';
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaD').AsString:= ' ';

   GravaCorrecao;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta A
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_AClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.Edit;
   if Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaA').AsString = 'X' then
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaA').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaA').AsString:= 'X';

   GravaCorrecao;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta B
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_BClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.Edit;
   if Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaB').AsString = 'X' then
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaB').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaB').AsString:= 'X';

   GravaCorrecao;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta C
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_CClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.Edit;
   if Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaC').AsString = 'X' then
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaC').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaC').AsString:= 'X';
   GravaCorrecao;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta D
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.JvTransparentButton_DClick(Sender: TObject);
begin
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.Edit;
   if  Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaD').AsString = 'X' then
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaD').AsString:= ' '
   else
      Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.FieldByName('AlternativaCorretaD').AsString:= 'X';

   GravaCorrecao;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da Alternativa Correta C
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.GravaCorrecao;
begin
   Form_Cad_CorrecaoProva.IBTable_ItemTesteManual.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual);
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar o Gabarito
//------------------------------------------------------------------------------

procedure TForm_CorrecaoDoItemDaProvaManual.ComboBox_GabaritoChange(Sender: TObject);
begin
   Funcoes.ExecutaQuery(Form_Cad_CorrecaoProva.IBQuery_ItemTesteManual, 'Select  * '+
                                                                        ' From ItemTesteManual '+
                                                                        ' Where IdCurso = :IdCurso '+
                                                                        ' and   IdTurma = :IdTurma '+
                                                                        ' and   FAseAplicacao = :FaseAplicacao '+
                                                                        ' and   ReferenciaAvaliacao = :ReferenciaAvaliacao '+
                                                                        ' and   CodMateria = :CodMateria '+
                                                                        ' and   Gabarito = '+ComboBox_Gabarito.text+
                                                                        ' Order By IdCurso, IdTurma,NumeroQuestao'
                       );
end;



end.
