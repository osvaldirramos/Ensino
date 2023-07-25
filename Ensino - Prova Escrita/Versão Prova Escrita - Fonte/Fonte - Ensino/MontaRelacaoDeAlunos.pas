//----------------------------------------------------------------------------//
// PROGRAMA                  : MontaRelacaoDeAlunosComNota.pas                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar o relatorio  //
//                             com a relação dos Alunos com Nota.             //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 13/03/2009                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit MontaRelacaoDeAlunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, JvRichEd, JvDBRichEd, DB, IBCustomDataSet,
  IBQuery, Rotinas, JvLabel, JvBlinkingLabel, IBTable, PsyRichEdit;

type
  TForm_MontaRelacaoDeAlunos = class(TForm)
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documentacao: TDataSource;
    Documento: TJvDBRichEdit;
    JvBlinkingLabel1: TJvBlinkingLabel;

    procedure FormActivate(Sender: TObject);
    procedure TracarLinha;
    procedure SetarDefault(VI_Size: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_MontaRelacaoDeAlunos: TForm_MontaRelacaoDeAlunos;

implementation

uses Module, CorrecaoProva, Editor_Texto;

{$R *.dfm}

procedure TForm_MontaRelacaoDeAlunos.FormActivate(Sender: TObject);
var
   VS_Linha: String;
begin
   if Funcoes.GetRelDesempenho = 'Iniciado' then
   begin
      Funcoes.CabecalhoForm( Form_MontaRelacaoDeAlunosComNota, ' Montagem Relação de Alunos');
      Funcoes.SetRelDesempenho('Processando');

      Form_Editor.Text1.Clear;
      Form_Editor.FontSize.Text := '11';
      Form_Editor.Text1.Font.Size:= 11;
      Form_Editor.JvFontComboBox.Text := 'Courier New';
      Form_Editor.Text1.Font.Name:= 'Courier New';

      Form_Editor.Text1.Lines.Add('Curso.....: '+Form_Cad_CorrecaoProva.ComboBox_Curso.Text);
      Form_Editor.Text1.Lines.Add('Turma.....: '+Form_Cad_CorrecaoProva.IBTable_Turma.FieldByName('Turma').AsString+' de '+Form_Cad_CorrecaoProva.IBTable_Turma.FieldByName('ano').AsString);
      Form_Editor.Text1.Lines.Add('Emitido em: '+DateToStr(Date));
      TracarLinha;   // Traca linha divisoria

      if Trim(Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('Observacao').AsString) <> '' then
      begin
         Form_Editor.FontSize.Text := '11';
         Form_Editor.Text1.Font.Size:= 11;
         Form_Editor.JvFontComboBox.Text := 'Courier New';
         Form_Editor.Text1.Font.Name:= 'Courier New';
         Form_Editor.Text1.Lines.Add(Trim(Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('Observacao').AsString));
         TracarLinha;   // Traca linha divisoria
      end;

      Form_Editor.FontSize.Text := '11';
      Form_Editor.Text1.Font.Size:= 11;
      Form_Editor.JvFontComboBox.Text := 'Courier New';
      Form_Editor.Text1.Font.Name:= 'Courier New';
      Form_Editor.Text1.Lines.Add('     CÓDIGO                   NOME                  NOTA');
      Form_Cad_CorrecaoProva.Query_RelacaoAlunos.First;
      While not Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Eof do
      begin
         Form_Editor.FontSize.Text := '11';
         Form_Editor.Text1.Font.Size:= 11;
         Form_Editor.JvFontComboBox.Text := 'Courier New';
         Form_Editor.Text1.Font.Name:= 'Courier New';

         VS_Linha:= '     '+
                    Funcoes.ReplStr(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('CodigoAluno').AsString, ' ', 7)+
                    Funcoes.ReplStr(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nome').AsString, ' ', 40)+
                    Funcoes.ReplStr(Form_Cad_CorrecaoProva.Query_RelacaoAlunos.FieldByName('Nota').AsString, ' ', 10);
         Form_Editor.Text1.Lines.Add(VS_LInha);
         Form_Cad_CorrecaoProva.Query_RelacaoAlunos.Next;
      end;

      //--- Insere o cabecalho da prova

      IBQuery_Documento.Open;
      Documento.SelectAll;
      Documento.CopyToClipboard ;

      Form_Editor.Text1.SelStart:= 0;
      Form_Editor.Text1.PasteFromClipboard ;
      IBQuery_Documento.Close;
      Funcoes.Trocar('#Cabecalho', 'RELAÇÃO DE ALUNOS COM NOTA');

      Form_Editor.Show;
   end;
   Close;
end;

//------------------------------------------------------------------------------
// Tracar linha divisoria
//------------------------------------------------------------------------------

procedure TForm_MontaRelacaoDeAlunos.TracarLinha;
begin
   SetarDefault(9);
   Form_Editor.Text1.Lines.Add('_______________________________________________________________________________');
   SetarDefault(9);
   Form_Editor.Text1.Lines.Add('');
end;

//------------------------------------------------------------------------------
// Seta a Fonte e o tamanho default de trabalho
//------------------------------------------------------------------------------

procedure TForm_MontaRelacaoDeAlunos.SetarDefault(VI_Size: Integer);
begin
   Form_Editor.Text1.Paragraph.Alignment := paLeftJustify;
   Form_Editor.Text1.SelAttributes.Name:= 'Courier New';
   Form_Editor.Text1.SelAttributes.Size := VI_Size;
end;

procedure TForm_MontaRelacaoDeAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Documento.Close;
   Action:= caFree;
end;

end.
