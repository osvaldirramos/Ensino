//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Preview_de_Relatorios.PAS                      //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de servir de Preview  //
//                             para dados feitos pelo RichEdit .              //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 14/11/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Preview_de_Relatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvDBRichEd, StdCtrls, JvRichEd, ComCtrls, ToolWin, ImgList, Rotinas,
  JvGrdCpt, ExtCtrls, Menus, RichPrint, PsyRichEdit, DBCtrls, DB,
  IBCustomDataSet, IBQuery, JvComponent, JvTransBtn, JvShape, JvGradient;

type
  TForm_PreviewRel = class(TForm)
    ScrollBox1: TScrollBox;
    PrintDialog1: TPrintDialog;
    JvxRichEdit_Vizu: TPsyRichEdit;
    RichPrinter1: TRichPrinter;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    DBNavigator: TDBNavigator;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_ConfigurarImpressora: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvGradient1: TJvGradient;

    procedure TratamentoParaImprimirCabecalhos(VS_Comando: String);
    procedure ImprimirItemSelecionado;
    procedure Trocar(Trocar: String; Por: String);

    procedure FormActivate(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_ImprimirClick(Sender: TObject);
    procedure JvTransparentButton_ConfigurarImpressoraClick(
      Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PreviewRel: TForm_PreviewRel;
  NomeArquivo: String;

implementation

uses Cad_ItemProva, Module, Sel_ItemProva, Frame_Sel_Curso;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_PreviewRel.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_PreviewRel, 'Preview');

   if Form_Sel_ItemProva.VS_OPCRelItem = 'Todos' then
      DBNavigator.Visible:= True
   else
      DBNavigator.Visible:= False;

   ImprimirItemSelecionado;
   JvxRichEdit_Vizu.Paragraph.Alignment := paLeftJustify
end;

//------------------------------------------------------------------------------
// Fecha a janela atual e retoana para anterior
//------------------------------------------------------------------------------

procedure TForm_PreviewRel.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   JvxRichEdit_Vizu.Clear;
   JvxRichEdit_Vizu.ReadOnly:= False;
   Close;
end;


//------------------------------------------------------------------------------
// Sai do Sistema e retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_PreviewRel.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_PreviewRel.Trocar(Trocar: String; Por: String);
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

//------------------------------------------------------------------------------
// Tratamento do botao Imprimir
//------------------------------------------------------------------------------

procedure TForm_PreviewRel.JvTransparentButton_ImprimirClick(Sender: TObject);
begin
   if Form_Sel_ItemProva.VS_OPCRelItem = 'Todos' then
   begin
      While Not Form_Sel_ItemProva.Query_Item.Eof do
      begin
         ImprimirItemSelecionado;
         JvxRichEdit_Vizu.Print(NomeArquivo);
         Form_Sel_ItemProva.Query_Item.Next;
      end;
   end
   else
   begin
      JvxRichEdit_Vizu.Print(NomeArquivo);
   end;
end;

procedure TForm_PreviewRel.DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
begin
   ImprimirItemSelecionado;
end;

//------------------------------------------------------------------------------
// Tratamento da impressao da pagina
//------------------------------------------------------------------------------

procedure TForm_PreviewRel.ImprimirItemSelecionado;
var
   VS_Turma: String;
begin
   //--- Tratamento para encontrar a turma

   Funcoes.OpenQuery('Select Turma, Ano '+
                     ' From Turma '+
                     ' Where IdCurso = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString+
                     ' and   IdTurma = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString
                    );
   if DM.IBQuery_Executa.FieldByName('Ano').AsString = 'BASE' then
      VS_Turma:= 'Base'
   else
      VS_Turma:= DM.IBQuery_Executa.FieldByName('Turma').AsString+' - '+DM.IBQuery_Executa.FieldByName('Ano').AsString;

   //--- Limpar a apresentação

   Form_PreviewRel.JvxRichEdit_Vizu.Clear;

   //--- Tratamento do cabecalho do relatorio

   TratamentoParaImprimirCabecalhos('select doc, Descricao from Documento where Codigo = 2');

   //--- Tratamento da questao do relatorio

//   Form_Cad_ItemProva.JvDBRichEdit_Text.SelectAll ;

   Form_Sel_ItemProva.JvDBRichEdit_Text.SelectAll ;
   Form_Sel_ItemProva.JvDBRichEdit_Text.CopyToClipboard ;
   Form_PreviewRel.JvxRichEdit_Vizu.PasteFromClipboard;

   //--- Tratamento do Historico do Relatorio

   Form_PreviewRel.JvxRichEdit_Vizu.Lines.Add('____________________________________________________________________');
   Form_PreviewRel.JvxRichEdit_Vizu.Lines.Add('HISTÓRICO DO ITEM:');
   Form_PreviewRel.JvxRichEdit_Vizu.Lines.Add('');

   Form_Sel_ItemProva.DBRichEdit_Observacao.SelectAll ;
   Form_Sel_ItemProva.DBRichEdit_Observacao.CopyToClipboard ;
   Form_PreviewRel.JvxRichEdit_Vizu.PasteFromClipboard;

   TratamentoParaImprimirCabecalhos('select doc, Descricao from Documento where Codigo = 12');

   Form_PreviewRel.Trocar('#CodCurso', Frame_SelCurso.ComboBox_Curso.Text+' '+Form_Sel_ItemProva.Label_DescricaoCurso.Caption);
   Form_PreviewRel.Trocar('#Turma', VS_Turma);
   Form_PreviewRel.Trocar('#Materia', Form_Sel_ItemProva.Query_MontaMateria.FieldByName('NomeMateria').AsString);
   Form_PreviewRel.Trocar('#Unidade', Form_Sel_ItemProva.Query_Item.FieldByName('Disciplina').AsString+Form_Sel_ItemProva.Query_Item.FieldByName('Unidade').AsString+Form_Sel_ItemProva.Query_Item.FieldByName('SubUnidade').AsString );
   Form_PreviewRel.Trocar('#cc/cc/cc', Form_Sel_ItemProva.Query_Item_Historico.FieldByName('Data').AsString );
   Form_PreviewRel.Trocar('#RespCor', Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName('RespostaCorreta').AsString);
   Form_PreviewRel.Trocar('#NItem', Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString);
   Form_PreviewRel.Trocar('#99/99/99', DateToStr(Date));

end;

procedure TForm_PreviewRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_PreviewRel.JvTransparentButton_ConfigurarImpressoraClick(Sender: TObject);
begin
   PrinterSetupDialog1.Execute;
end;

//------------------------------------------------------------------------------
//--- Tratamento do cabecalho do relatorio
//------------------------------------------------------------------------------

procedure TForm_PreviewRel.TratamentoParaImprimirCabecalhos(VS_Comando: String);
begin
   Funcoes.TrataMensagem(VS_Comando);
   Form_PreviewRel.JvxRichEdit_Vizu.PasteFromClipboard;
end;

end.
