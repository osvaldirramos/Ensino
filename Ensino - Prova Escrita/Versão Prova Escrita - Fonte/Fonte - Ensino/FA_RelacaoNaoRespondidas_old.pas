unit FA_RelacaoNaoRespondidas_old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, DBCtrls, Buttons, ExtCtrls,
  IBTable, DB, IBCustomDataSet, IBQuery, Rotinas, ToolWin, JvComponent,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_FA_RelacaoNaoRespondidas = class(TForm)
    DBGrid_Relacao: TDBGrid;
    Editor: TRichEdit;
    PrintDialog: TPrintDialog;
    Query_MontaTurma: TIBQuery;
    DSQ_MontaTurma: TDataSource;
    Query_MontaTurmaIDCURSO: TSmallintField;
    Query_MontaTurmaCODCURSO: TIBStringField;
    Query_MontaTurmaIDTURMA: TIntegerField;
    Query_MontaTurmaANO: TIBStringField;
    Query_MontaTurmaDATAINICIO: TDateTimeField;
    Query_MontaTurmaDATATERMINO: TDateTimeField;
    Query_MontaTurmaQDEALUNOS: TSmallintField;
    Query_MontaTurmaCODSALA: TIBStringField;
    Query_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_FARelacaoAlunos: TIBQuery;
    DSQ_FARelacaoAlunos: TDataSource;
    IBQuery_FichaAvaliacao: TIBQuery;
    IBQuery_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FichaAvaliacaoIDFICHA: TSmallintField;
    IBQuery_FichaAvaliacaoIDENTIDADE: TIBStringField;
    IBQuery_FichaAvaliacaoDISCIPLINA: TIBStringField;
    IBQuery_FichaAvaliacaoDATAAVALIACAO: TDateTimeField;
    IBQuery_FichaAvaliacaoDISPONIVEL: TIBStringField;
    IBQuery_FichaAvaliacaoCABECALHO: TIBStringField;
    IBQuery_FichaAvaliacaoIDCOORDENADOR: TIBStringField;
    DSQ_FichaAvaliacao: TDataSource;
    IBQuery_FARelacaoAlunosPOSTOGRADUACAO: TIBStringField;
    IBQuery_FARelacaoAlunosNOMEGUERRA: TIBStringField;
    Panel2: TPanel;
    JvGradient1: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Retonar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape11: TJvShape;
    JvTransparentButton_MsgCoordenador: TJvTransparentButton;
    DBNavigator4: TDBNavigator;
    JvShape1: TJvShape;
    JvTransparentButton_Finalizar: TJvTransparentButton;
    Query_MontaTurmaTURMA: TIBStringField;
    procedure FormActivate(Sender: TObject);
    procedure Query_MontaTurmaAfterScroll(DataSet: TDataSet);
    procedure JvTransparentButton_RetonarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_MsgCoordenadorClick(Sender: TObject);
    procedure JvTransparentButton_FinalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private   { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_FA_RelacaoNaoRespondidas: TForm_FA_RelacaoNaoRespondidas;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_FA_RelacaoNaoRespondidas, ' Relação de Alunos que Não Responderam a Ficha de Avaliação');

   Query_MontaTurma.Open;
   IBQuery_FichaAvaliacao.Open;
   IBQuery_FARelacaoAlunos.Open;

   Editor.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a janela
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   Query_MontaTurma.Close;
   IBQuery_FichaAvaliacao.Close;
   IBQuery_FARelacaoAlunos.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Fecha a janela
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.JvTransparentButton_RetonarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Atualiza a relacao das Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_MontaTurma);
end;

//------------------------------------------------------------------------------
// Imprime a relacao dos alunos que não responderam
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.JvTransparentButton_MsgCoordenadorClick(Sender: TObject);
begin
  if PrintDialog.Execute then
    Editor.Print('Relacao.txt');
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Coloca a ficha em Status de não mais avaliada
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.JvTransparentButton_FinalizarClick(Sender: TObject);
begin
   Funcoes.ExecusaoQuery('Update FA_Avaliacao set Disponivel = '+#39+'N'+#39+
                         ' Where IdCurso = '+IBQuery_FichaAvaliacao.FieldByName('IDCURSO').AsString+
                         ' and   IdTurma = '+IBQuery_FichaAvaliacao.FieldByName('IDTURMA').AsString+
                         ' and   IDFICHA = '+IBQuery_FichaAvaliacao.FieldByName('IDFICHA').AsString+
                         ' and   IDENTIDADE = '+#39+IBQuery_FichaAvaliacao.FieldByName('IDENTIDADE').AsString+#39+
                         ' and   DISCIPLINA = '+#39+IBQuery_FichaAvaliacao.FieldByName('DISCIPLINA').AsString+#39
                        );
   JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
// Mostra a relação de possoas que nao responderam as fichas
//------------------------------------------------------------------------------

procedure TForm_FA_RelacaoNaoRespondidas.Query_MontaTurmaAfterScroll( DataSet: TDataSet);
begin
   if IBQuery_FichaAvaliacao.FieldByName('DataAvaliacao').AsString <> '' then
   begin
      IBQuery_FichaAvaliacao.First;

      Editor.Lines.Clear;
      Editor.Lines.Add('');
      Editor.Lines.Add('');
      Editor.Lines.Add('Curso Avaliado: '+Query_MontaTurma.FieldByname('CodCurso').AsString);
      Editor.Lines.Add('Turma Avaliada: '+Query_MontaTurma.FieldByname('Turma').AsString);
      Editor.Lines.Add('___________________________________________________________________________________');

      While not IBQuery_FichaAvaliacao.Eof do
      begin
         IBQuery_FARelacaoAlunos.First;
         if IBQuery_FARelacaoAlunos.FieldByName('Nomeguerra').AsString <> '' then
         begin
            Editor.Lines.Add('Data Avaliação: '+IBQuery_FichaAvaliacao.FieldByname('DataAvaliacao').AsString);
            Editor.Lines.Add('Ficha de Avaliacao: '+IBQuery_FichaAvaliacao.FieldByname('Cabecalho').AsString);

            if trim(IBQuery_FichaAvaliacao.FieldByname('Disciplina').AsString) <> '000000' then
            begin
              Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select NomeMateria '+
                                                       'From MateriaCurso '+
                                                       ' where idcurso = '+Query_MontaTurma.FieldByname('IdCurso').AsString+
                                                       ' and   idTurma = '+Query_MontaTurma.FieldByname('IdTurma').AsString+
                                                       ' and   CodMateria = '+#39+IBQuery_FichaAvaliacao.FieldByname('Disciplina').AsString+#39
                                  );
              Editor.Lines.Add('Disciplina Avaliada: '+trim(IBQuery_FichaAvaliacao.FieldByname('Disciplina').AsString)+' - '+DM.IBQuery_Executa.FieldByname('NomeMateria').AsString);
            end;

            if trim(IBQuery_FichaAvaliacao.FieldByname('Identidade').AsString) <> '000000' then
            begin
              if trim(IBQuery_FichaAvaliacao.FieldByname('Cabecalho').AsString) <> 'FICHA DE OPINIÃO DO DOCENTE' then
              begin
                 Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select PostoGraduacao, Nomeguerra from Pessoa where identidade = '+#39+IBQuery_FichaAvaliacao.FieldByname('Identidade').AsString+#39);
                 Editor.Lines.Add('Instrutor Avaliado: '+trim(DM.IBQuery_Executa.FieldByname('PostoGraduacao').AsString)+' '+DM.IBQuery_Executa.FieldByname('Nomeguerra').AsString);
              end;
            end;
            Editor.Lines.Add('');

            while not IBQuery_FARelacaoAlunos.eof do
            begin
               Editor.Lines.Add(trim(IBQuery_FARelacaoAlunos.FieldByname('PostoGraduacao').AsString)+' - '+IBQuery_FARelacaoAlunos.FieldByname('Nomeguerra').AsString) ;
               IBQuery_FARelacaoAlunos.Next
            end;
            Editor.Lines.Add('___________________________________________________________________________________');
         end;
         IBQuery_FichaAvaliacao.Next;
      end;
      editor.SetFocus;
      editor.SelStart:= 1;
   end;
end;

end.
