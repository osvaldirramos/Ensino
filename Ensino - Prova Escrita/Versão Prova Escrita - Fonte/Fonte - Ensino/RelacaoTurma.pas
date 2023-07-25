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

unit RelacaoTurma;

interface

uses
  Printers, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, JvRichEd, JvDBRichEd, StdCtrls,
  PsyRichEdit, Rotinas, ComCtrls, ToolWin, Menus, DBCtrls, ExtCtrls,
  RichPrint, IBTable, JvGradient, JvComponent, JvTransBtn, JvShape;

type
  TForm_RelacaoTurma = class(TForm)
    JvDBRichEdit_Diploma: TJvDBRichEdit;
    ScrollBox1: TScrollBox;
    Text1: TPsyRichEdit;
    PrintDialog1: TPrintDialog;
    IBQuery_AlunoTurma: TIBQuery;
    Panel2: TPanel;
    Panel1: TPanel;
    CheckBox_SARAM: TCheckBox;
    CheckBox_NomeGuerra: TCheckBox;
    CheckBox_Identidade: TCheckBox;
    CheckBox_NomeCompleto: TCheckBox;
    CheckBox_Unidade: TCheckBox;
    CheckBox_SubUnidade: TCheckBox;
    CheckBox_Nota: TCheckBox;
    CheckBox_CPF: TCheckBox;
    CheckBox_Email: TCheckBox;
    JvGradient1: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Retonar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape11: TJvShape;
    JvTransparentButton_MsgCoordenador: TJvTransparentButton;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_MsgCoordenadorClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_RetonarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RelacaoTurma: TForm_RelacaoTurma;

implementation

uses Sel_Turma, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_RelacaoTurma.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   Funcoes.CabecalhoForm(Form_RelacaoTurma, 'Ensino --> Relação de Alunos');

   VS_Comando:= 'Select a.SARAM, a.NomeGuerra, a.Identidade, a.NomeCompleto, a.CPF, a.IdUnidade, a.IdSubUnidade, a.NotaFinal, p.Email'+
                ' From Aluno_Turmas_Em_Andamento_View a, Pessoa p '+
                ' where a.IdCurso = '+DM.IBTable_Turma.FieldByName('IdCurso').AsString+
                ' and   a.IdTurma = '+DM.IBTable_Turma.FieldByName('IdTurma').AsString+
                ' and   a.Identidade = p.Identidade ';

   Funcoes.ExecutaQuery(IBQuery_AlunoTurma, VS_Comando +Form_SelTurma.OrderByAluno);

   if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
       CheckBox_Nota.Visible:= True
   else
      CheckBox_Nota.Visible:= False;
   JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_RelacaoTurma.JvTransparentButton_RetonarClick(Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_RelacaoTurma.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Printer.Orientation := poPortrait;
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de impressao do registro selecionado
//------------------------------------------------------------------------------

procedure TForm_RelacaoTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TForm_RelacaoTurma.JvTransparentButton_MsgCoordenadorClick(Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      Text1.Print('');
end;

procedure TForm_RelacaoTurma.JvTransparentButton_AtualizaClick(Sender: TObject);
var
   VS_Linha: String;
begin
   Text1.Lines.Clear;

   Text1.Lines.Add(Funcoes.CentraStr('RELAÇÃO DO CURSO', 90));
   Text1.Lines.Add('');
   Text1.Lines.Add('Relatório Emitido em '+DateToStr(Date));
   Text1.Lines.Add('Curso -> '+Form_SelTurma.ComboBox_Curso.Text);
   Text1.Lines.Add('Turma -> '+Form_SelTurma.ComboBox_Turma.Text);
   Text1.Lines.Add('________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________');

   //---- Tratamento do Cabecalho
   VS_Linha:= '';

   if CheckBox_SARAM.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('SARAM',' ', 8);

   if CheckBox_NomeGuerra.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Nome Guerra',' ', 18);

   if CheckBox_Identidade.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Identidade', ' ', 15);

   if CheckBox_NomeCompleto.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('NomeCompleto',' ', 50);

   if CheckBox_CPF.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('CPF', ' ', 22);

   if CheckBox_Unidade.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('Unidade',' ', 21);

   if CheckBox_SubUnidade.Checked = True then
      VS_Linha:= VS_Linha+Funcoes.ReplStr('SubUnidade',' ', 21);

   if CheckBox_Nota.Checked = True then
      VS_Linha:= VS_Linha+'Nota';

   if CheckBox_Email.Checked = True then
      VS_Linha:= VS_Linha+'E-Mail';

   if VS_Linha = '' then
   begin
      VS_Linha:= Funcoes.ReplStr('SARAM',' ', 8)+
                    Funcoes.ReplStr('Nome Guerra',' ', 18)+
                    Funcoes.ReplStr('Identidade', ' ', 21)+
                    Funcoes.ReplStr('NomeCompleto',' ', 50)+
                    Funcoes.ReplStr('CPF', ' ',22)+
                    Funcoes.ReplStr('Unidade',' ', 21)+
                    Funcoes.ReplStr('SubUnidade',' ', 21);

      if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
         VS_Linha:= VS_Linha+'Nota';

      VS_Linha:= VS_Linha+'E-Mail'
   end;

   Text1.Lines.Add(VS_Linha);

   //---- Tratamento dos dados

   Text1.Lines.Add('___________________________________________________________________________________________________________________________________________________________________________________________________________________________________');   IBQuery_AlunoTurma.First;
   While not IBQuery_AlunoTurma.Eof do
   begin
      VS_Linha:= '';

      if CheckBox_SARAM.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('SARAM').AsString,' ', 8);

      if CheckBox_NomeGuerra.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString,' ', 18);

       if CheckBox_Identidade.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('Identidade').AsString, ' ', 21);

       if CheckBox_NomeCompleto.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString,' ', 50);

       if ((CheckBox_CPF.Checked = True) and (trim(IBQuery_AlunoTurma.FieldByName('CPF').AsString) <> '')) then
            VS_Linha:= VS_Linha+Funcoes.ReplStr('CPF: '+Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 1,3)+'.'+
                                                        Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 4,3)+'.'+
                                                        Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 7,3)+'-'+
                                                        Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 10,2) , ' ', 18);

       if CheckBox_Unidade.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('IdUnidade').AsString,' ', 21);

       if CheckBox_SubUnidade.Checked = True then
         VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('IdSubUnidade').AsString,' ', 21);

       if CheckBox_Nota.Checked = True then
         VS_Linha:= VS_Linha+FormatFloat('#0.00', IBQuery_AlunoTurma.FieldByName('NotaFinal').AsFloat);

       if CheckBox_EMail.Checked = True then
         VS_Linha:= VS_Linha+IBQuery_AlunoTurma.FieldByName('EMail').AsString;

       if VS_Linha = '' then
       begin
           VS_Linha:= Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('SARAM').AsString,' ', 8)+
                      Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('NomeGuerra').AsString,' ', 18)+
                      Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('Identidade').AsString, ' ', 21)+
                      Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('NomeCompleto').AsString,' ', 50);

           if trim(IBQuery_AlunoTurma.FieldByName('CPF').AsString) <> '' Then
              VS_Linha:= VS_Linha+Funcoes.ReplStr('CPF: '+Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 1,3)+'.'+
                                                          Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 4,3)+'.'+
                                                          Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 7,3)+'-'+
                                                          Copy(IBQuery_AlunoTurma.FieldByName('CPF').AsString, 10,2), ' ', 22);

           VS_Linha:= VS_Linha+Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('IdUnidade').AsString,' ', 21)+
                               Funcoes.ReplStr(IBQuery_AlunoTurma.FieldByName('IdSubUnidade').AsString,' ', 21);

          if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II' then
             VS_Linha:= VS_Linha+FormatFloat('#0.00', IBQuery_AlunoTurma.FieldByName('NotaFinal').AsFloat);

          VS_Linha:= VS_Linha+IBQuery_AlunoTurma.FieldByName('EMail').AsString;
       end;

      Text1.Lines.Add(VS_Linha);
      IBQuery_AlunoTurma.Next;
   end;
   Text1.Lines.Add('___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________');   Update;
end;

end.
