unit Tratar_Leitora_Otica;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, StdCtrls, Mask, Rotinas,
  Buttons, ExtCtrls, IBQuery,IBTable, JvGrdCpt, JvEdit, JvGradient, JvToolEdit,
  DBCtrls, JvComponent, JvCaptionPanel, IBCustomDataSet, JvTransBtn,
  JvShape;

type
  TForm_LeitoraOtica = class(TForm)
    ScrollBox1: TScrollBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StaticText1: TStaticText;
    ProgressBar1: TProgressBar;
    SpeedButton_SalvarLog: TSpeedButton;
    text1: TRichEdit;
    Label_Prova: TLabel;
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape_SelecaoArquivo: TJvShape;
    JvTransparentButton_SelecaoArquivo: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_IniciarOpScan: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel_Gabarito: TPanel;
    Label_Gabarito: TLabel;
    ComboBox_Gabarito: TComboBox;
    JvShape_IniciaSR1800: TJvShape;
    JvTransparentButton_IniciaSR1800: TJvTransparentButton;

    procedure LeituraDoArquivo(Leitora: String);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton_SalvarLogClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_SelecaoArquivoClick(Sender: TObject);
    procedure JvTransparentButton_IniciarOpScanClick(Sender: TObject);
    procedure JvTransparentButton_IniciaSR1800Click(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private

  end;

var
  Form_LeitoraOtica: TForm_LeitoraOtica;
  F    : TEXTFILE;
  ArquivoAberto, S    :  string;

implementation

uses Module, CorrecaoProva, Se_Prova;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure para tratar quando a Form eh ativada
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.FormActivate(Sender: TObject);
var
   VB_Status: Boolean;
   i: Integer;
begin
   Funcoes.CabecalhoForm( Form_LeitoraOtica, ' Leitora Ótica');

   Label_Prova.Caption:= 'Leitura Resposta da Prova: '+Copy( Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,1,2)+'-'+
                         Copy(Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'CodProva').AsString,3,2);

   Text1.Lines.Clear;
   StaticText1.Caption:= '';
   if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA' then
   begin
      JvTransparentButton_IniciaSR1800.Visible:= True;
      JvShape_IniciaSR1800.Visible:= True;
      JvTransparentButton_IniciaSR1800.Enabled:= False;
   end
   else
   begin
      JvTransparentButton_IniciaSR1800.Visible:= False;
      JvShape_IniciaSR1800.Visible:= False;
   end;

   JvTransparentButton_SelecaoArquivo.Enabled:= True;
   JvTransparentButton_IniciarOpScan.Enabled:= False;
   SpeedButton_SalvarLog.Enabled:= False;

    //---
   //--- Montagem do Combo de Tratamento do Gabarito

   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString <> 'ICEA' then
   begin
      ComboBox_Gabarito.Items.Clear;

      if ((Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('N_Gabaritos').AsInteger = 1) or
          (Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('N_Gabaritos').AsInteger = 0)) then
      begin
         VB_Status:= False;
         ComboBox_Gabarito.Text:= '1';
      end
      else
      begin
         VB_Status:= True;
         ComboBox_Gabarito.Visible:= True;
         For i:= 1 to Form_Cad_CorrecaoProva.IBTable_Teste.FieldByName('N_Gabaritos').AsInteger do
             ComboBox_Gabarito.Items.Add(IntToStr(i));
      end;
      Panel_Gabarito.Visible:= VB_Status;
   end;

end;

//------------------------------------------------------------------------------
// Tratamento do botao de retornar da leitora
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botao da Leitora optica OpScan
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.JvTransparentButton_IniciarOpScanClick(Sender: TObject);
begin
   LeituraDoArquivo('OpScan');
end;

//------------------------------------------------------------------------------
// Tratamento do botao da Leitora optica OpScan
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.JvTransparentButton_IniciaSR1800Click(Sender: TObject);
begin
   LeituraDoArquivo('CR_1800');
end;

//------------------------------------------------------------------------------
// Tratamento da Leitura das Respostas dos Alunos
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.LeituraDoArquivo(Leitora: String);
var
   VS_Msg, VS_GAB, VS_Tudo, VS_COD,VS_RESP,VS_Identidade,VS_referencia,VS_CodMateria: string;
   VS_Fase,VS_Comando: string;
   VB_Erro: Boolean;

   VI_IdCurso, VI_IdTurma, VI_Erro, VI_TotItensTeste: integer;
begin
   VB_Erro:= False;
   JvTransparentButton_IniciarOpScan.Enabled:= False;
   if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA' then
      JvTransparentButton_IniciaSR1800.Enabled:= False;

   VI_IdCurso:= DM.IBQuery_MontaTurma.FieldByName( 'IdCurso').AsInteger;
   VI_IdTurma:= DM.IBQuery_MontaTurma.FieldByName( 'IdTurma').AsInteger;
   VS_CodMateria:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName('CodMateria').AsString;
   VS_Referencia:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'ReferenciaAvaliacao').AsString;
   VS_Fase:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'faseAplicacao').AsString;
   VI_TotItensTeste:= Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'TotalItens').AsInteger;
   VI_Erro:= 0;
   VS_Msg:= '';

   // Elimina possiveis respostas já existentes desta prova

   StaticText1.Caption:='Limpando Arquivo de Respostas...';
   update;

   Text1.Lines.Add('--------------------------------------------------------------------------------');
   Text1.Lines.Add('Leitura feita em: '+DateToStr(Date));
   Text1.Lines.Add('Leitura do arquivo  '+ArquivoAberto);
   Text1.Lines.Add('Curso: '+Funcoes.GetCodCurso);
   Text1.Lines.Add('Turma: '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
   Text1.Lines.Add(Label_Prova.Caption+'       Data Aplicação:Prova: '+Form_Cad_CorrecaoProva.IBQuery_MontaTeste.FieldByName( 'DataAplicacao').AsString);
   Text1.Lines.Add('--------------------------------------------------------------------------------');
   Text1.Lines.Add('');

   if VI_TotItensTeste = 0 then
   begin
      Text1.Lines.Add('VERIFIQUE OS POSSIVEIS ERROS');
      Text1.Lines.Add('');
      Text1.Lines.Add('- O Total de Itens registrado esta com 0,'+#13+
                      '  Para corrigir este problema entre na opção "Montar Prova" do "Menu Principal" '+#13+
                      '  e verificar o total de Itens ');
      Text1.Lines.Add('');
      Text1.Lines.Add('- A prova que esta sendo corrigida não possuí gabarito cadastrado'+#13+
                      '  Para corrigir este problema entre na opção "Montar Prova" do "Menu Principal" '+#13+
                      '  e cadastrar o gabarito da Prova');

      if MessageDlg('Deseja entrar na opção "Montar Prova" para realizar a correção ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Form_Cad_Prova.Show;
   end
   else
   begin
      Reset(F);

      while ((not Eof(F)) and (VI_Erro = 0)) do
      begin
        readln(f,s);
        VS_Tudo := s;

        if ComboBox_Gabarito.Text = '' then
           ComboBox_Gabarito.Text:= '1';

        // Estrutura antiga
        if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'SRPV-SP') or
            (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CINDACTA II')) then
        begin
           VS_COD:= Copy(VS_Tudo,41,9);     // le codigo do aluno
           VS_COD:= FloatToStr(StrToFloat(VS_COD));     // le codigo do aluno
           VS_GAB:= '1';     // le Gabarito referente ao aluno
           VS_RESP:= Copy(VS_Tudo,54,VI_TotItensTeste);  // respostas do aluno lido max 100
        end
        else
        begin
           if ((DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'CENIPA')) then
           begin
              VS_COD:= Copy(VS_Tudo,7,4);     // le codigo do aluno
              VS_COD:= FloatToStr(StrToFloat(VS_COD));     // le codigo do aluno
              VS_GAB:= '1';     // le Gabarito referente ao aluno
              VS_RESP:= Copy(VS_Tudo,11,VI_TotItensTeste);  // respostas do aluno lido max 100
           end
           else
           begin
              VS_GAB:= ComboBox_Gabarito.Text;   // Gabarito Selecionado
              if Leitora = 'OpScan' Then     // Tratamento quando for OpScan
              begin
                 VS_COD:= Copy(VS_Tudo,41,3);     // le codigo do aluno
                 VS_RESP:= Copy(VS_Tudo,44,VI_TotItensTeste);  // respostas do aluno lido max 100
              end
              else
              begin                                // Tratamento Quando for a CR-1800
                 VS_COD:= Copy(VS_Tudo,11,3);     // le codigo do aluno
                 VS_RESP:= Copy(VS_Tudo,14,VI_TotItensTeste);                 ;  // respostas do aluno lido max 100
              end;
           end;
        end;

        ProgressBar1.Max:= DM.IBQuery_MontaTurma.FieldByName( 'QTDBRASILEIROS').AsInteger+DM.IBQuery_MontaTurma.FieldByName( 'QTDESTRANGEIROS').AsInteger;
        show;
        update;
        ProgressBar1.Position:= 0;

        //--- Mostra o Progresso da Leitura dos Alunos

        if trim(VS_Cod) = '' then
        begin
           VB_Erro:= True;
           CloseFile(F);
           Break;
        end
        else
        begin
           DM.IBQuery_Executa.Close;
           DM.IBQuery_Executa.SQL.Clear;
           DM.IBQuery_Executa.SQL.Add('Select Identidade from alunoturma where IdCurso = '+IntToStr(VI_IdCurso)+' and IdTurma = '+IntToStr(VI_IdTurma)+' and Codigoaluno = '+#39+VS_Cod+#39);
           DM.IBQuery_Executa.Open;
           VS_Identidade:= DM.IBQuery_Executa.FieldByName( 'Identidade').AsString;

           if VS_Identidade = '' then
           begin
              VB_Erro:= True;
              Text1.Lines.Add('Não possui aluno com o código '+VS_COD);
              VS_Msg:= #13+VS_Msg+'Não possui aluno com o código '+VS_COD;
           end
           else
           begin
              VS_Comando:= ' Select count(1) Qtd from RespostaAluno '+
                           ' where IdCurso = '+IntToStr(VI_IdCurso)+
                           ' and IdTurma = '+IntToStr(VI_IdTurma)+
                           ' and faseAplicacao = '+#39+VS_Fase+#39+
                           ' and ReferenciaAvaliacao = '+#39+VS_Referencia+#39+
                           ' and CodMateria = '+#39+VS_CodMateria+#39+
                           ' and Identidade = '+#39+VS_Identidade+#39;

              if Funcoes.QtdRegistro(VS_Comando) = 0 then
              begin
                 Text1.Lines.Add('Gravando resposta do Aluno código    '+VS_COD+' - '+VS_GAB+' - '+VS_RESP);
                 Funcoes.ExecusaoQuery( ' Insert into RespostaAluno (IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMAteria, Identidade, OpcaoVetor, Gabarito) '+
                                        ' Values('+IntToStr(VI_IdCurso)+', '+IntToStr(VI_IdTurma)+', '+#39+VS_Fase+#39+', '+#39+VS_Referencia+#39+', '+#39+VS_CodMateria+#39+', '+#39+VS_Identidade+#39+', '+#39+VS_RESP+#39+', '+#39+VS_GAB+#39+')'
                                      );
              end
              else
              begin
                 Text1.Lines.Add('Atualizando resposta do Aluno código '+VS_COD+' - '+VS_GAB+' - '+VS_RESP);
                 Funcoes.ExecusaoQuery( ' Update RespostaAluno set OPCAOVETOR = '+#39+VS_RESP+#39+', GABARITO = '+#39+VS_GAB+#39+
                                        ' where IdCurso = '+IntToStr(VI_IdCurso)+
                                        ' and IdTurma = '+IntToStr(VI_IdTurma)+
                                        ' and faseAplicacao = '+#39+VS_Fase+#39+
                                        ' and ReferenciaAvaliacao = '+#39+VS_Referencia+#39+
                                        ' and CodMateria = '+#39+VS_CodMateria+#39+
                                        ' and Identidade = '+#39+VS_Identidade+#39
                                       );
              end;
           end;
         end;
      end;
   end;

   ProgressBar1.Position:= 0;
   if VB_Erro = True then
   begin
      StaticText1.Caption:='Houve erro na leitura do arquivo da Leitora Otica...';
      if VS_Msg <> '' then
         ShowMessage(VS_Msg);
   end
   else
   begin
      StaticText1.Caption:='Operação Finalizada...';
      update;
      SpeedButton_SalvarLog.Enabled:= True;
   end;
end;

procedure TForm_LeitoraOtica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de selecao do arquivo gerado pela leitora otica
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.JvTransparentButton_SelecaoArquivoClick(Sender: TObject);
begin
   IF OPENDIALOG1.EXECUTE THEN
   BEGIN
      ArquivoAberto:= OPENDIALOG1.FILENAME;
      ASSIGNFILE(F,OPENDIALOG1.FILENAME);
      JvTransparentButton_IniciarOpScan.Enabled:= True;
      if DM.IBTable_Configuracao.FieldByName('SIGLA').AsString = 'ICEA' then
         JvTransparentButton_IniciaSR1800.Enabled:= True;
   END;
end;

//------------------------------------------------------------------------------
// Salva o Log de erros
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.SpeedButton_SalvarLogClick(Sender: TObject);
begin
    saveDialog1.Filter := //continua
        'Arquivo Rich Texto (*.RTF)|*.rtf|Todos os arquivos (*.*)|*.*';
    saveDialog1.DefaultExt := 'rtf';
    saveDialog1.Execute;
    If saveDialog1.Filename <> '' then
       text1.Lines.SaveToFile (saveDialog1.Filename);
end;

//------------------------------------------------------------------------------
// Sai do Sistema e retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_LeitoraOtica.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
