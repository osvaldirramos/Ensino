//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : ImprimirDiploma.PAS                            //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da impressao//
//                             do Diploma (Aluno/Instrutor).                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 01/06/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit RelacaoInstrutorTurma;

interface

uses
  Printers, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, JvRichEd, JvDBRichEd, StdCtrls,
  PsyRichEdit, Rotinas, ComCtrls, ToolWin, Menus, DBCtrls, ExtCtrls,
  RichPrint, IBTable, JvGradient, JvComponent, JvTransBtn, JvShape;

type
  TForm_RelacaoInstrutorTurma = class(TForm)
    JvDBRichEdit_Diploma: TJvDBRichEdit;
    ScrollBox1: TScrollBox;
    Text1: TPsyRichEdit;
    PrintDialog1: TPrintDialog;
    IBQuery_InstrutorTurma: TIBQuery;
    DSQ_AlunoTurma: TDataSource;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Imprime: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    Panel1: TPanel;
    CheckBox_Codigo: TCheckBox;
    CheckBox_NomeGuerra: TCheckBox;
    CheckBox_Identidade: TCheckBox;
    CheckBox_NomeCompleto: TCheckBox;
    CheckBox_Unidade: TCheckBox;
    CheckBox_SubUnidade: TCheckBox;
    CheckBox_Funcao: TCheckBox;
    CheckBox_Chegada: TCheckBox;
    CheckBox_Saida: TCheckBox;

    procedure Trocar(Trocar: String; Por: String);

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_ImprimeClick(Sender: TObject);
  private    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RelacaoInstrutorTurma: TForm_RelacaoInstrutorTurma;

implementation

uses Sel_Turma, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_RelacaoInstrutorTurma.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_RelacaoInstrutorTurma, ' Relação de Instrutores');
   Funcoes.ExecutaQuery(IBQuery_InstrutorTurma, 'Select IdCurso, IdTurma, CodigoInstrutor, nome, NomeGuerra,  NomeCompleto, PostoGraduacao,  Identidade, IdUnidade, IdSubUnidade, Funcao, DataChegada, Apresentacao, DataSaida, Ficha '+
                                                ' From Instrutor_Turmas_View '+
                                                ' where IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                                                ' and   IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                                                Form_SelTurma.OrderByInstrutor
                        );
   JvTransparentButton_AtualizarClick(Sender);
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_RelacaoInstrutorTurma.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Text1.FindText(Trocar, 0, Length(Text1.Text), []);
  if Posicao > 0 then
  begin
    Text1.SelStart := Posicao;
    Text1.SelLength := Length(Trocar);
    Text1.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_RelacaoInstrutorTurma.JvTransparentButton_FecharClick( Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_RelacaoInstrutorTurma.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de impressao do registro selecionado
//------------------------------------------------------------------------------

procedure TForm_RelacaoInstrutorTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TForm_RelacaoInstrutorTurma.JvTransparentButton_ImprimeClick( Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      Text1.Print('');
end;

procedure TForm_RelacaoInstrutorTurma.JvTransparentButton_AtualizarClick(Sender: TObject);
var
   VS_Linha: String;
begin
   IBQuery_InstrutorTurma.Open;
   Text1.Lines.Clear;

   Text1.Lines.Add(Funcoes.CentraStr('RELAÇÃO DE INSTRUTORES DO CURSO', 90));
   Text1.Lines.Add('');
   Text1.Lines.Add('Relatório Emitido em '+DateToStr(Date));
   Text1.Lines.Add('Curso -> '+Form_SelTurma.ComboBox_Curso.Text);
   Text1.Lines.Add('Turma -> '+Form_SelTurma.ComboBox_Turma.Text);
   Text1.Lines.Add('__________________________________________________________________________________________________________________________________________________________');

   //---- Tratamento do Cabecalho
   VS_Linha:= '';

   if CheckBox_Codigo.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Código',' ', 7);

   if CheckBox_NomeGuerra.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Nome Guerra',' ', 18);

   if CheckBox_Identidade.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Identidade', ' ', 21);

   if CheckBox_NomeCompleto.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('NomeCompleto',' ', 71);

   if CheckBox_Funcao.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Função',' ', 21);

   if CheckBox_Unidade.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Unidade',' ', 21);

   if CheckBox_SubUnidade.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('SubUnidade',' ', 21);

   if CheckBox_Chegada.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Chegada',' ', 11);

   if CheckBox_Saida.Checked = True then
      VS_Linha:= VS_Linha+'Saída';

   if VS_Linha = '' then
      VS_Linha:= Funcoes.ReplStr('Código',' ', 7)+
                 Funcoes.ReplStr('Nome Guerra',' ', 18)+
                 Funcoes.ReplStr('Identidade', ' ', 21)+
                 Funcoes.ReplStr('NomeCompleto',' ', 71)+
                 Funcoes.ReplStr('Função',' ', 21)+
                 Funcoes.ReplStr('Unidade',' ', 21)+
                 Funcoes.ReplStr('SubUnidade',' ', 21)+
                 Funcoes.ReplStr('Chegada',' ', 11)+
                 'Saída';

   Text1.Lines.Add(VS_Linha);

   //---- Tratamento dos dados

   Text1.Lines.Add('__________________________________________________________________________________________________________________________________________________________');
   IBQuery_InstrutorTurma.First;
   While not IBQuery_InstrutorTurma.Eof do
   begin
      VS_Linha:= '';

      if CheckBox_Codigo.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('CodigoInstrutor').AsString,' ', 8);

      if CheckBox_NomeGuerra.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('NomeGuerra').AsString,' ', 18);

       if CheckBox_Identidade.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('Identidade').AsString, ' ', 21);

       if CheckBox_NomeCompleto.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString,' ', 71);

      if CheckBox_Funcao.Checked = True then
          VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('Funcao').AsString,' ', 21);

       if CheckBox_Unidade.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('IdUnidade').AsString,' ', 21);

       if CheckBox_SubUnidade.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('IdSubUnidade').AsString,' ', 21);

       if CheckBox_Chegada.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('DataChegada').AsString,' ',11);

       if CheckBox_Saida.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('DataSaida').AsString,' ',11);

       if VS_Linha = '' then
           VS_Linha:= Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('CodigoInstrutor').AsString,' ', 8)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('NomeGuerra').AsString,' ', 18)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('Identidade').AsString, ' ', 21)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString,' ', 71)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('Funcao').AsString,' ', 21)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('IdUnidade').AsString,' ', 21)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('IdSubUnidade').AsString,' ', 21)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('DataChegada').AsString,' ', 11)+
                      Funcoes.ReplStr(IBQuery_InstrutorTurma.FieldByName('DataSaida').AsString,' ', 11);

      Text1.Lines.Add(VS_Linha);
      IBQuery_InstrutorTurma.Next;
   end;
   Text1.Lines.Add('__________________________________________________________________________________________________________________________________________________________');
   Update;
end;

end.
