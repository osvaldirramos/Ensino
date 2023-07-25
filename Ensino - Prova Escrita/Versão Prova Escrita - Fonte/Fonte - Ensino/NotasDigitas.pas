unit NotasDigitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin, DB, Rotinas,
  IBCustomDataSet, IBTable, JvComponent, JvTransBtn, JvShape, JvGradient;

type
  TForm_NotasDigitadas = class(TForm)
    OpenDialog1: TOpenDialog;
    ScrollBox1: TScrollBox;
    Panel3: TPanel;
    text1: TRichEdit;
    StaticText1: TStaticText;
    ProgressBar1: TProgressBar;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Sel_Arquivo: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Iniciar: TJvTransparentButton;
    Label_Prova: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_Sel_ArquivoClick(Sender: TObject);
    procedure JvTransparentButton_IniciarClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_NotasDigitadas: TForm_NotasDigitadas;


  Arq   : TEXTFILE;
  ArquivoAberto, Linha    :  string;

implementation

uses CorrecaoProva, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure para tratar quando a Form eh ativada
//------------------------------------------------------------------------------

procedure TForm_NotasDigitadas.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_NotasDigitadas, ' Carga das Notas Digitadas');

   Label_Prova.Caption:= 'Leitura das Notas Digitadas da Prova: '+Copy( Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,1,2)+'-'+
                         Copy(Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,3,2);
   Text1.Lines.Clear;
   StaticText1.Caption:= '';
   JvTransparentButton_Iniciar.Enabled:= False;
   JvTransparentButton_Sel_Arquivo.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Procedure para tratar o Fechamento da Form
//------------------------------------------------------------------------------

procedure TForm_NotasDigitadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_NotasDigitadas.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao da selecao do Arquivo contendo as Notas digitadas
//------------------------------------------------------------------------------

procedure TForm_NotasDigitadas.JvTransparentButton_Sel_ArquivoClick(Sender: TObject);
begin
   IF OPENDIALOG1.EXECUTE THEN
   BEGIN
      ArquivoAberto:= OPENDIALOG1.FILENAME;
      ASSIGNFILE(Arq,OPENDIALOG1.FILENAME);
      JvTransparentButton_Iniciar.Enabled:= True;
      JvTransparentButton_Sel_Arquivo.Enabled:= False;
   END;

end;

//------------------------------------------------------------------------------
// Tratamento do Botao para retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_NotasDigitadas.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para iniciar a leitura do Arquivo das Notas e Grava-los
//------------------------------------------------------------------------------

procedure TForm_NotasDigitadas.JvTransparentButton_IniciarClick(Sender: TObject);
var
   VS_Nota, VS_Aluno,VS_Identidade,VS_referencia,VS_CodMateria: string;
   VS_Fase,VS_Comando: string;
   VB_Erro: Boolean;

   VI_Erro, VI_TotItensTeste: integer;
begin
   JvTransparentButton_Iniciar.Enabled:= False;

   Text1.Lines.Add('--------------------------------------------------------------------------------');
   Text1.Lines.Add('Leitura feita em: '+DateToStr(Date));
   Text1.Lines.Add('Leitura do arquivo  '+ArquivoAberto);
   Text1.Lines.Add('Curso: '+Funcoes.GetCodCurso);
   Text1.Lines.Add('Turma: '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
   Text1.Lines.Add(Label_Prova.Caption+'       Data Aplicação:Prova: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'DataAplicacao').AsString);
   Text1.Lines.Add('--------------------------------------------------------------------------------');
   Text1.Lines.Add('');

   Reset ( arq );
   ReadLn ( arq, linha );

   VS_Fase:= Copy(linha,11,1);
   VS_Referencia:= Copy(linha,12,3);
   VS_CodMateria:= Copy(linha,15,6);
   ReadLn ( arq, linha );

   while not Eof ( arq ) do
   begin
      ReadLn ( arq, linha );

      VS_Nota:= Copy(linha,1,5);
      VS_Identidade:= Copy(linha,6,20);
      VS_Aluno:= Copy(linha,46,120);

      ProgressBar1.Max:= DM.IBQuery_MontaTurma.FieldByName( 'QTDBRASILEIROS').AsInteger+DM.IBQuery_MontaTurma.FieldByName( 'QTDESTRANGEIROS').AsInteger;
      show;
      update;
      ProgressBar1.Position:= 0;

      //--- Mostra o Progresso da Leitura dos Alunos

      if trim(VS_Nota) = '' then
      begin
         VB_Erro:= True;
         Break;
      end
      else
      begin
           VS_Comando:= ' Select count(1) Qtd from ResultadoExame '+
                        ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                        ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                        ' and faseAplicacao = '+#39+VS_Fase+#39+
                        ' and ReferenciaAvaliacao = '+#39+VS_Referencia+#39+
                        ' and CodMateria = '+#39+VS_CodMateria+#39+
                        ' and Identidade = '+#39+VS_Identidade+#39;

           if Funcoes.QtdRegistro(VS_Comando) = 0 then
           begin
              Text1.Lines.Add('Gravando Nota do Aluno '+VS_Aluno+' - '+VS_Nota);
              VS_Comando:= ' Insert into ResultadoExame (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Identidade, Nota ) '+
                           ' Values('+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+', '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+', '+#39+VS_Fase+#39+', '+#39+VS_Referencia+#39+', '+#39+VS_CodMateria+#39+', '+
                                     #39+VS_Identidade+#39+', '+Funcoes.DePara(VS_Nota, ',','.')+')';
              Funcoes.ExecusaoQuery(VS_Comando);
           end
           else
           begin
              Text1.Lines.Add('Atualizando Nota do Aluno Aluno '+VS_Aluno+' - '+VS_Nota);
              VS_Comando:= ' Update ResultadoExame set Nota = '+Funcoes.DePara(VS_Nota, ',','.')+
                           ' where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                           ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                           ' and faseAplicacao = '+#39+VS_Fase+#39+
                           ' and ReferenciaAvaliacao = '+#39+VS_Referencia+#39+
                           ' and CodMateria = '+#39+VS_CodMateria+#39+
                           ' and Identidade = '+#39+VS_Identidade+#39;
              Funcoes.ExecusaoQuery(VS_Comando);
         end;
      end;
   end;
   CloseFile ( arq );

   if VB_Erro = True then
   begin
      StaticText1.Caption:='Houve Erro na Operação...';
   end
   else
   begin
      ProgressBar1.Position:= 0;
      StaticText1.Caption:='Operação Finalizada...';
      update;
   end;

end;

end.
