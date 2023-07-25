unit MontaProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBTable, IBQuery, Rotinas, Rotinas_TrataData, PsyRichEdit,
  StdCtrls, JvRichEd, JvDBRichEd, ToolWin, ExtCtrls, DBCtrls, Grids,
  DBGrids, JvComponent, JvTransBtn, JvShape, JvGradient;

type
  TForm_MontaProva = class(TForm)
    IBTable_Gabarito: TIBTable;
    DST_Gabarito: TDataSource;
    IBTable_GabaritoIDCURSO: TSmallintField;
    IBTable_GabaritoIDTURMA: TIntegerField;
    IBTable_GabaritoFASEAPLICACAO: TIBStringField;
    IBTable_GabaritoREFERENCIAAVALIACAO: TIBStringField;
    IBTable_GabaritoCODMATERIA: TIBStringField;
    IBTable_GabaritoGABARITO: TIntegerField;
    IBTable_GabaritoNUMEROQUESTAO: TIntegerField;
    IBTable_GabaritoNUMITEM: TIntegerField;
    IBTable_GabaritoQUESTAO: TIntegerField;
    JvDBRichEdit_MontaItem: TJvDBRichEdit;
    IBTable_Prova: TIBTable;
    DST_Prova: TDataSource;
    IBTable_ProvaNUMITEM: TIntegerField;
    IBTable_ProvaDESCENALT: TBlobField;
    IBTable_ProvaNLINHAS: TSmallintField;
    IBQuery_Prova: TIBQuery;
    DSQ_Prova: TDataSource;
    IBQuery_ProvaIDCURSO: TSmallintField;
    IBQuery_ProvaIDTURMA: TIntegerField;
    IBQuery_ProvaFASEAPLICACAO: TIBStringField;
    IBQuery_ProvaCODMATERIA: TIBStringField;
    IBQuery_ProvaGABARITO: TIntegerField;
    IBQuery_ProvaNUMEROQUESTAO: TIntegerField;
    IBQuery_ProvaQUESTAO: TIntegerField;
    IBQuery_ProvaNUMITEM: TIntegerField;
    IBTable_ProvaPOSSUI_IMAGEM: TIBStringField;
    JvGradient3: TJvGradient;
    Label1: TLabel;
    Label_Gabarito: TLabel;
    ComboBox_Gabarito: TComboBox;
    JvShape4: TJvShape;
    JvTransparentButton_AbrirProvaEditor: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_RefazerGabarito: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_AbrirProvaWord: TJvTransparentButton;

    procedure ExcluirGabarito;
    procedure MontarGabarito;
    Function MontarProva: String;
    procedure VerificarQuebraPagina;
    procedure QuebraPagina;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AbrirProvaEditorClick(Sender: TObject);
    procedure JvTransparentButton_AbrirProvaWordClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_RefazerGabaritoClick(Sender: TObject);
  private    { Private declarations }
     Quebra_Pagina: array[1..100] of integer;
     VI_Pagina, VI_TotalDeLinhas, VI_Linha: Integer;

  public
    { Public declarations }
  end;

var
  Form_MontaProva: TForm_MontaProva;

implementation

uses Module, Se_Prova, Editor_Texto;

const
  RulerAdj = 4/3;
  GutterWid = 6;

{$R *.dfm}

//------------------------------------------------------------------------------
// Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_MontaProva.FormActivate(Sender: TObject);
var
   VI_Cont, I: Integer;
   VS_Comando: String;

   VI_NumeroItem: array[1..100] of integer;

   VI_Questao, VI_Gabarito, VI_QtdQuestoes: Integer;
   VB_Status: Boolean;
begin
   if Funcoes.GetRelDesempenho = 'Iniciado' then
   begin
      Funcoes.CabecalhoForm(Form_MontaProva, 'Montagem de Prova');
      VI_TotalDeLinhas:= 56;

       //---
      //--- Montagem do Combo de Tratamento do Gabarito

      ComboBox_Gabarito.Items.Clear;

      if Form_Cad_Prova.Table_Teste.FieldByName('N_Gabaritos').AsInteger = 1 then
         VB_Status:= False
      else
      begin
         VB_Status:= True;
         ComboBox_Gabarito.Visible:= True;
         For i:= 1 to Form_Cad_Prova.Table_Teste.FieldByName('N_Gabaritos').AsInteger do
             ComboBox_Gabarito.Items.Add(IntToStr(i));
      end;
      Label_Gabarito.Visible:= VB_Status;
      ComboBox_Gabarito.Visible:= VB_Status;

       //----
      //-Montagem do Gabarito

      IBTable_Gabarito.Open;
      IBTable_Prova.Open;

      //--- Verifica se Existe gabarito para Prova

      VS_Comando:= ' Select IdCurso from GabaritoProva '+
                   ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                   ' and IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                   ' and FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                   ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                   ' and CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39;

      Funcoes.OpenQuery(VS_Comando);

      if DM.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then   //---Não Possui gabarito
      begin
         if Form_Cad_Prova.Table_Teste.FieldByName('N_gabaritos').AsInteger = 1 then   // Preserva o Gabarito de acordo com a Prova
         begin
            Form_Cad_Prova.Query_Item_Teste.First;
            While not Form_Cad_Prova.Query_Item_Teste.eof do
            begin
               IBTable_Gabarito.Append;
               IBTable_Gabarito.FieldByName('IdCurso').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString;
               IBTable_Gabarito.FieldByName('IdTurma').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString;
               IBTable_Gabarito.FieldByName('faseAplicacao').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString;
               IBTable_Gabarito.FieldByName('ReferenciaAvaliacao').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString;
               IBTable_Gabarito.FieldByName('CodMateria').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString;
               IBTable_Gabarito.FieldByName('Gabarito').AsInteger:= 1;
               IBTable_Gabarito.FieldByName('NumeroQuestao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('NumeroQuestao').AsString;
               IBTable_Gabarito.FieldByName('Questao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('NumeroQuestao').AsString;
               IBTable_Gabarito.FieldByName('NumItem').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('NumItem').AsString;
               IBTable_Gabarito.Post;
               Form_Cad_Prova.Query_Item_Teste.Next;
            end;
            JvTransparentButton_AbrirProvaEditorClick(Sender);
            close;
         end
         else
         begin
            VI_Gabarito:= 0;
            VI_QtdQuestoes:= Form_Cad_Prova.Table_Teste.FieldByName('TotalItens').AsInteger;

            while VI_Gabarito < Form_Cad_Prova.Table_Teste.FieldByName('N_gabaritos').AsInteger do
            begin
               VI_Cont:= 0;
               VI_Gabarito:= VI_Gabarito + 1;

               For i:= 1 to 100 do
                  VI_NumeroItem[i]:= 0;

               Form_Cad_Prova.Query_Item_Teste.First;
               While not Form_Cad_Prova.Query_Item_Teste.eof do
               begin
                  VI_Cont:= VI_Cont+1;
                  VI_Questao:= 0;

                  While VI_Questao = 0 do
                  begin
                     VI_Questao:= Random(VI_QtdQuestoes+10);
                     if VI_Questao > VI_QtdQuestoes then
                        VI_Questao:= 0
                     else
                     begin
                        if VI_Cont = VI_QtdQuestoes then
                        begin
                           for i:= 1 to VI_QtdQuestoes do
                              if VI_NumeroItem[i] = 0 then
                                 VI_questao:= i;
                        end
                        else
                        begin
                           if VI_NumeroItem[VI_Questao] = VI_Questao then
                               VI_questao:= 0;
                        end;
                     end;
                  end;

                  VI_NumeroItem[VI_Questao]:= VI_Questao;

                  VS_Comando:= 'Select count(1) as Qtd '+
                               'From GabaritoProva '+
                               ' where IdCurso = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString+
                               ' and IdTurma = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString+
                               ' and faseAplicacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString+#39+
                               ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                               ' and CodMateria = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString+#39+
                               ' and Gabarito = '+IntToStr(VI_Gabarito)+
                               ' and Questao = '+IntToStr(VI_Questao);
                  if Funcoes.QtdRegistro(VS_Comando) = 0 then
                  begin
                     Funcoes.OpenQuery( 'Select NumItem '+
                                        'From ItemTeste '+
                                        ' where IdCurso = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString+
                                        ' and IdTurma = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString+
                                        ' and faseAplicacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString+#39+
                                        ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                        ' and CodMateria = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString+#39+
                                        ' and NumeroQuestao = '+IntToStr(VI_Questao)
                                      );
                     IBTable_Gabarito.Append;
                     IBTable_Gabarito.FieldByName('IdCurso').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString;
                     IBTable_Gabarito.FieldByName('IdTurma').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString;
                     IBTable_Gabarito.FieldByName('faseAplicacao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString;
                     IBTable_Gabarito.FieldByName('ReferenciaAvaliacao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString;
                     IBTable_Gabarito.FieldByName('CodMateria').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString;
                     IBTable_Gabarito.FieldByName('Gabarito').AsInteger:= VI_Gabarito;
                     IBTable_Gabarito.FieldByName('NumeroQuestao').AsInteger:= VI_Cont;
                     IBTable_Gabarito.FieldByName('Questao').AsInteger:= VI_Questao;
                     IBTable_Gabarito.FieldByName('NumItem').AsString:= DM.IBQuery_Executa.FieldByName('NumItem').AsString;
                     IBTable_Gabarito.Post;
                     Form_Cad_Prova.Query_Item_Teste.Next;
                  end;
               end;
             end;
          end;
          Funcoes.ExecutaTransacao;
      end;
   end;
end;

procedure TForm_MontaProva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Gabarito.Close;
   IBQuery_Prova.Close;
   IBTable_Prova.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
//--- Abre a prova utilizando o editor do sistema 
//------------------------------------------------------------------------------

procedure TForm_MontaProva.JvTransparentButton_AbrirProvaEditorClick(Sender: TObject);
begin
   if MontarProva <> '' then
   begin
      Form_Editor.ShowModal;
      Close;
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento para Word
//------------------------------------------------------------------------------

procedure TForm_MontaProva.JvTransparentButton_AbrirProvaWordClick(Sender: TObject);
var
   VS_Dir, VS_NomeProva, VS_Linha, VS_File_Name: String;
   pc:Array[0..256] of char; {PChar array}
   arq: TextFile;
begin
   if MontarProva <> '' then
   begin
    if FileExists('C:\DataBase_ICEA\Ensino\word.cnf') = False then
    begin
       Showmessage('O arquivo de configuração do Word não existe...');
    end
    else
    begin
      AssignFile ( arq, 'C:\DataBase_ICEA\Ensino\word.cnf' );
      Reset ( arq );
      ReadLn ( arq, VS_Linha );
      CloseFile ( arq );

      VS_Dir := 'c:\Ensino\Provas\'+Funcoes.DePara( Trim(Funcoes.GetCodCurso), '/' , '_')+
                                                  Funcoes.DePara( Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString), ' ','_')+'_'+
                                                  DM.IBQuery_MontaTurma.FieldByName('Ano').AsString;

      if not DirectoryExists(VS_Dir) then
          ForceDirectories(VS_Dir);
      VS_Dir := VS_Dir+'\';

      VS_NomeProva:= Funcoes.DePara( Trim(Funcoes.GetCodCurso), '/','_')+
                     Funcoes.DePara( Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString), ' ','_')+'_'+
                     Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString;
      Form_Editor.Text1.Lines.SaveToFile(VS_Dir+VS_NomeProva+'.Doc');

      if VS_Linha = '' then
         MessageDlg('Não foi indicado o Editor no arquivo word.cnf no diretorio "C:\DataBase_ICEA\Ensino\word.cnf"...', mtInformation, [mbOk], 0)
      else
      begin       // --- Abertura do arquivo criado com o Word
         VS_File_Name:= VS_Dir+VS_NomeProva+'.Doc';
         VS_File_Name:= VS_Linha+' '+VS_File_Name;
         WinExec(StrPlCopy(pc, VS_File_Name,255),SW_Show); {Execute the program}
      end;
   end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o programa
//------------------------------------------------------------------------------

procedure TForm_MontaProva.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close
end;

//------------------------------------------------------------------------------
// Tratamento de montagem da Prova
//------------------------------------------------------------------------------

Function TForm_MontaProva.MontarProva: String;
var
   VS_Gabarito, VS_Curso: String;
begin
   if ComboBox_Gabarito.Visible = False then
      VS_Gabarito:= '1'
   else
      VS_Gabarito:= ComboBox_Gabarito.Text;

   if VS_Gabarito = '' then
       ShowMessage('Não foi selecionado o Gabarito que será montado a Prova, '#13+'SELECIONE O GABARITO')
   else
   begin
       //----
      //-Montagem da Prova

      if Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString <> '' then
      begin
         Funcoes.ExecutaQuery(IBQuery_Prova, 'Select IdCurso, IdTurma, faseAplicacao, ReferenciaAvaliacao CodMateria, Gabarito, NumeroQuestao, Questao, NumItem '+
                                             ' From GabaritoProva '+
                                             ' where IdCurso = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString+
                                             ' and IdTurma = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString+
                                             ' and faseAplicacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString+#39+
                                             ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                             ' and CodMateria = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString+#39+
                                             ' and Gabarito = '+VS_Gabarito+
                                             ' Order by NumeroQuestao'
                             );

         Label1.Caption:= 'Aguarde montando a PROVA..';
         Funcoes.SetRelDesempenho('Processando');

         Funcoes.GravaAcesso('Menu Principal - Montar Prova', 'Montar Prova: '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString);

         Form_Editor.Text1.Font.Size:= 11;
         Form_Editor.Text1.Font.Name:= 'Courier New';
         Form_Editor.Text1.lines.Clear;

         VI_Linha:= 60;
         VI_Pagina:= 0;

         IBQuery_Prova.First;
         While not IBQuery_Prova.Eof do
         begin
            VerificarQuebraPagina;
            IBQuery_Prova.Next;
         end;
         VerificarQuebraPagina;

         IBQuery_Prova.Last;

         While not IBQuery_Prova.Bof do
         begin
            JvDBRichEdit_MontaItem.SelectAll;
            JvDBRichEdit_MontaItem.CopyToClipboard ;

            Form_Editor.Text1.SelStart:= 0;  //5
            Form_Editor.Text1.PasteFromClipboard ;
            Update;
            Form_Editor.Text1.SelStart:= 0;  //5
            Funcoes.Trocar('#N', IBQuery_Prova.FieldByName('NumeroQuestao').AsString+')');
            Funcoes.Trocar(')) ', ') ');
            Form_Editor.Text1.Lines.Add('');
            if Quebra_Pagina[IBQuery_Prova.FieldByName('NumeroQuestao').AsInteger] = 1 then
               QuebraPagina;

            IBQuery_Prova.Prior;
         end;

         Form_Editor.Text1.SelStart:= 0;  //5
         Funcoes.Trocar('#N', IBQuery_Prova.FieldByName('NumeroQuestao').AsString);

         //--- Insere o cabecalho da prova
      end;

      Funcoes.TrataMensagem('select doc, Descricao from Documento where codigo = 1');

      Form_Editor.Text1.PasteFromClipboard ;

      VS_Curso:= Form_Cad_Prova.VS_CodCurso;
      While Length(VS_Curso) < 7 do
         VS_Curso:= VS_Curso+' ';

      Funcoes.Trocar('#Curso', VS_Curso);
      Funcoes.Trocar('#NomeCurso', Form_Cad_Prova.VS_DescCurso);
      Funcoes.Trocar('#Turma', DM.IBQuery_MontaTurma.FieldByName('Turma').AsString);
      Funcoes.Trocar('#REFE/_PROVA', Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodProva').AsString);
      Funcoes.Trocar('#9/99/9999', Funcoes_TrataData.FormatarData( Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('DATAAPLICACAO').AsString, 'yyyy'));
      Funcoes.Trocar('#G', FormatFloat('00',StrToInt(VS_Gabarito)));
      Funcoes.Trocar('#Observacao', Form_Cad_Prova.Table_Teste.FieldByName('OBSERVACAO').AsString);

   end;
   MontarProva:= VS_Gabarito;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento da Quebra de Pagina
//------------------------------------------------------------------------------

procedure TForm_MontaProva.QuebraPagina;
begin
   Form_Editor.Text1.Font.Size:= 11;
   Form_Editor.Text1.Font.Name:= 'Courier New';

   Form_Editor.Text1.SelStart:= 0;
   VI_Pagina:= VI_Pagina - 1;
   Form_Editor.Text1.SelStart:= 0;

   Funcoes.TrataMensagem('select doc, Descricao from Documento where codigo = 1000');
   Form_Editor.Text1.PasteFromClipboard ;
end;

//------------------------------------------------------------------------------
// Procedure Que Verifica se existe quebra de Pagina
//------------------------------------------------------------------------------

procedure TForm_MontaProva.VerificarQuebraPagina;
begin
   if IBTable_Prova.FieldByName('Possui_Imagem').AsString = 'S' then
      VI_Linha:= VI_Linha + IBTable_Prova.FieldByName('NLinhas').AsInteger+1
   else
      VI_Linha:= VI_Linha + JvDBRichEdit_MontaItem.Lines.count;

   if VI_Linha >= VI_TotalDeLinhas then
   begin
      VI_Pagina:= VI_Pagina+1;
      Quebra_Pagina[IBQuery_Prova.FieldByName('NumeroQuestao').AsInteger]:= 1;
      if IBTable_Prova.FieldByName('Possui_Imagem').AsString = 'S' then
         VI_Linha:= IBTable_Prova.FieldByName('NLinhas').AsInteger+1
      else
         VI_Linha:= JvDBRichEdit_MontaItem.Lines.count;
   end
   else
   begin
      Quebra_Pagina[IBQuery_Prova.FieldByName('NumeroQuestao').AsInteger]:= 0;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Cabecalho da Prova
//------------------------------------------------------------------------------

procedure TForm_MontaProva.MontarGabarito;
var
   Sender: TObject;
   VS_Comando: String;
   VI_NumeroItem: array[1..100] of integer;

   i, VI_Cont, VI_Questao, VI_Gabarito, VI_QtdQuestoes: Integer;
begin
   ExcluirGabarito;
   if Form_Cad_Prova.Table_Teste.FieldByName('N_gabaritos').AsInteger = 1 then   // Preserva o Gabarito de acordo com a Prova
   begin
      Form_Cad_Prova.Query_Item_Teste.First;
      While not Form_Cad_Prova.Query_Item_Teste.eof do
      begin
         IBTable_Gabarito.Append;
         IBTable_Gabarito.FieldByName('IdCurso').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString;
         IBTable_Gabarito.FieldByName('IdTurma').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString;
         IBTable_Gabarito.FieldByName('faseAplicacao').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString;
         IBTable_Gabarito.FieldByName('ReferenciaAvaliacao').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString;
         IBTable_Gabarito.FieldByName('CodMateria').AsString:= Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString;
         IBTable_Gabarito.FieldByName('Gabarito').AsInteger:= 1;
         IBTable_Gabarito.FieldByName('NumeroQuestao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('NumeroQuestao').AsString;
         IBTable_Gabarito.FieldByName('Questao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('NumeroQuestao').AsString;
         IBTable_Gabarito.FieldByName('NumItem').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('NumItem').AsString;
         IBTable_Gabarito.Post;
         Form_Cad_Prova.Query_Item_Teste.Next;
      end;
      JvTransparentButton_AbrirProvaEditorClick(Sender);
      close;
   end
   else
   begin
      VI_Gabarito:= 0;
      VI_QtdQuestoes:= Form_Cad_Prova.Table_Teste.FieldByName('TotalItens').AsInteger;

      while VI_Gabarito < Form_Cad_Prova.Table_Teste.FieldByName('N_gabaritos').AsInteger do
      begin
         VI_Cont:= 0;
         VI_Gabarito:= VI_Gabarito + 1;

         For i:= 1 to 100 do
            VI_NumeroItem[i]:= 0;

         Form_Cad_Prova.Query_Item_Teste.First;
         While not Form_Cad_Prova.Query_Item_Teste.eof do
         begin
            VI_Cont:= VI_Cont+1;
            VI_Questao:= 0;

            While VI_Questao = 0 do
            begin
               VI_Questao:= Random(VI_QtdQuestoes+10);
               if VI_Questao > VI_QtdQuestoes then
                   VI_Questao:= 0
               else
               begin
                  if VI_Cont = VI_QtdQuestoes then
                  begin
                     for i:= 1 to VI_QtdQuestoes do
                         if VI_NumeroItem[i] = 0 then
                             VI_questao:= i;
                  end
                  else
                  begin
                     if VI_NumeroItem[VI_Questao] = VI_Questao then
                          VI_questao:= 0;
                  end;
               end;
            end;

            VI_NumeroItem[VI_Questao]:= VI_Questao;

            VS_Comando:= 'Select count(1) as Qtd '+
                         'From GabaritoProva '+
                         ' where IdCurso = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString+
                         ' and IdTurma = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString+
                         ' and faseAplicacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString+#39+
                         ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                         ' and CodMateria = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString+#39+
                         ' and Gabarito = '+IntToStr(VI_Gabarito)+
                         ' and Questao = '+IntToStr(VI_Questao);
            if Funcoes.QtdRegistro(VS_Comando) = 0 then
            begin
               Funcoes.OpenQuery('Select NumItem '+
                                 'From ItemTeste '+
                                 ' where IdCurso = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString+
                                 ' and IdTurma = '+Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString+
                                 ' and faseAplicacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString+#39+
                                 ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                 ' and CodMateria = '+#39+Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString+#39+
                                 ' and NumeroQuestao = '+IntToStr(VI_Questao)
                                );

               IBTable_Gabarito.Append;
               IBTable_Gabarito.FieldByName('IdCurso').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('IdCurso').AsString;
               IBTable_Gabarito.FieldByName('IdTurma').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('IdTurma').AsString;
               IBTable_Gabarito.FieldByName('faseAplicacao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('faseAplicacao').AsString;
               IBTable_Gabarito.FieldByName('ReferenciaAvaliacao').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('ReferenciaAvaliacao').AsString;
               IBTable_Gabarito.FieldByName('CodMateria').AsString:= Form_Cad_Prova.Query_Item_Teste.FieldByName('CodMateria').AsString;
               IBTable_Gabarito.FieldByName('Gabarito').AsInteger:= VI_Gabarito;
               IBTable_Gabarito.FieldByName('NumeroQuestao').AsInteger:= VI_Cont;
               IBTable_Gabarito.FieldByName('Questao').AsInteger:= VI_Questao;
               IBTable_Gabarito.FieldByName('NumItem').AsString:= DM.IBQuery_Executa.FieldByName('NumItem').AsString;
               IBTable_Gabarito.Post;
               Form_Cad_Prova.Query_Item_Teste.Next;
            end;
         end;
      end;
   end;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Refazer Gabarito
//------------------------------------------------------------------------------

procedure TForm_MontaProva.JvTransparentButton_RefazerGabaritoClick( Sender: TObject);
var
   VI_Retorno: Integer;
begin
   VI_Retorno:= Application.MessageBox('Deseja mesmo refazer o Gabarito.... '+#13+
                                    'Confirma a opção ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
      MontarGabarito;

end;

//------------------------------------------------------------------------------
// Procedure para excluir gabarito anterior
//------------------------------------------------------------------------------

procedure TForm_MontaProva.ExcluirGabarito;
begin
   Funcoes.ExecusaoQuery( 'Delete From GabaritoProva '+
                          ' where IdCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                          ' and   IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                          ' and   FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                          ' and   ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                          ' and   CodMateria = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('CodMateria').AsString+#39
                        );
end;

end.
