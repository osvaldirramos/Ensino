unit MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rotinas, Menus, ComCtrls, ToolWin, StdCtrls, jpeg, ExtCtrls,
  JvShape, JvGradient, JvComponent, JvLookOut, Grids, DBGrids, DBCtrls,
  Buttons, JvCaptionPanel, DB, IBCustomDataSet, IBQuery, IBTable, TeEngine,
  Series, TeeProcs, Chart, JvRichEd, JvDBRichEd, ComObj, JvxCtrls;

type
  TForm_MenuPrincipal = class(TForm)
    StatusBar: TStatusBar;
    Panel1: TPanel;
    JvGradient2: TJvGradient;
    JvShape2: TJvShape;
    Image_Brasao_ICEA: TImage;
    Label_Versao: TLabel;
    Version: TLabel;
    Label2: TLabel;
    Label_Data: TLabel;
    Panel2: TPanel;
    ToolBar_BotoesPrincipal: TToolBar;
    ToolButton_ModeloFicha: TToolButton;
    ToolButton_ContendoClassificacao: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_RelacaoComCodigoAcessoInstrutor: TToolButton;
    IBQuery_Cad_Avaliados: TIBQuery;
    IBQuery_Cad_AvaliadosIDCURSO: TSmallintField;
    IBQuery_Cad_AvaliadosIDTURMA: TIntegerField;
    IBQuery_Cad_AvaliadosID_FICHA: TIntegerField;
    IBQuery_Cad_AvaliadosID_ATCO: TIBStringField;
    IBQuery_Cad_AvaliadosID_AVL: TIBStringField;
    IBQuery_Cad_AvaliadosID_EXERCICIO: TIntegerField;
    IBQuery_Cad_AvaliadosID_INSTRUTOR: TIBStringField;
    IBQuery_Cad_AvaliadosNOMECOMPLETO: TIBStringField;
    IBQuery_Cad_AvaliadosDATA_AVL: TDateTimeField;
    IBQuery_Cad_AvaliadosLOCAL: TIBStringField;
    IBQuery_Cad_AvaliadosMEDIA: TIBBCDField;
    IBQuery_Cad_AvaliadosPARECER: TBlobField;
    IBQuery_Cad_AvaliadosNS: TIBStringField;
    IBQuery_Cad_AvaliadosFICHACOMPLETA: TIBStringField;
    DSQ_Cad_Avaliados: TDataSource;
    IBQuery_Total_Alunos_NS: TIBQuery;
    IBQuery_Total_Alunos_NSIDTURMA: TIntegerField;
    IBQuery_Total_Alunos_NSID_FICHA: TIntegerField;
    IBQuery_Total_Alunos_NSID_ATCO: TIBStringField;
    IBQuery_Total_Alunos_NSID_EXERCICIO: TIntegerField;
    IBQuery_Relacao_Alunos_NS__: TIBQuery;
    DSQ_Relacao_alunos_NS: TDataSource;
    IBQuery_Relacao_Alunos_NS__IDCURSO: TSmallintField;
    IBQuery_Relacao_Alunos_NS__CODCURSO: TIBStringField;
    IBQuery_Relacao_Alunos_NS__IDTURMA: TIntegerField;
    IBQuery_Relacao_Alunos_NS__TURMA: TIBStringField;
    IBQuery_Relacao_Alunos_NS__ID_FICHA: TIntegerField;
    IBQuery_Relacao_Alunos_NS__ID_ATCO: TIBStringField;
    IBQuery_Relacao_Alunos_NS__ID_EXERCICIO: TIntegerField;
    IBQuery_Relacao_Alunos_NS__ID_ITEM: TIBStringField;
    IBQuery_Relacao_Alunos_NS__ID_AVL: TIBStringField;
    IBQuery_Relacao_Alunos_NS__AREA_AVALIACAO: TIBStringField;
    IBQuery_Relacao_Alunos_NS__DESCRICAO: TIBStringField;
    IBQuery_Relacao_Alunos_NS__NOMECOMPLETO: TIBStringField;
    DataSource1: TDataSource;
    IBQuery_Instrutor_Avl__: TIBQuery;
    ToolButton_Relacao_dosAlunosComItensNaoSatisfatorio: TToolButton;
    ToolButton_Rel_MediaAlunos: TToolButton;
    IBQuery_RelacaoAlunosMedia: TIBQuery;
    DSQ_RelacaoAlunosMedia: TDataSource;
    ToolButton_Estatistica: TToolButton;
    ToolButton_GrauFinalTurma: TToolButton;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documentacao: TDataSource;
    Documento: TJvDBRichEdit;
    IBTable_AlunoTurma: TIBTable;
    IBTable_AlunoTurmaIDCURSO: TSmallintField;
    IBTable_AlunoTurmaIDTURMA: TIntegerField;
    IBTable_AlunoTurmaIDENTIDADE: TIBStringField;
    IBTable_AlunoTurmaNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBTable_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_RelacaoAlunos: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IntegerField3: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField5: TIBStringField;
    IBBCDField1: TIBBCDField;
    BlobField1: TBlobField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    DSQ_RelacaoAlunos: TDataSource;
    IBTable_Estagiario: TIBTable;
    IBTable_EstagiarioID_ATCO: TIBStringField;
    IBTable_EstagiarioESTAGIARIO: TIBStringField;
    IBTable_Instrutor: TIBTable;
    IBTable_InstrutorIDENTIDADE: TIBStringField;
    IBTable_InstrutorNOME: TIBStringField;
    IBTable_InstrutorNOMEGUERRA: TIBStringField;
    IBTable_InstrutorPOSTOGRADUACAO: TIBStringField;
    IBQuery_RelacaoAlunosMediaIDCURSO: TSmallintField;
    IBQuery_RelacaoAlunosMediaIDTURMA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_FICHA: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_ATCO: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_AVL: TIBStringField;
    IBQuery_RelacaoAlunosMediaID_EXERCICIO: TIntegerField;
    IBQuery_RelacaoAlunosMediaID_INSTRUTOR: TIBStringField;
    IBQuery_RelacaoAlunosMediaNOMECOMPLETO: TIBStringField;
    IBQuery_RelacaoAlunosMediaDATA_AVL: TDateTimeField;
    IBQuery_RelacaoAlunosMediaLOCAL: TIBStringField;
    IBQuery_RelacaoAlunosMediaMEDIA: TIBBCDField;
    IBQuery_RelacaoAlunosMediaPARECER: TBlobField;
    IBQuery_RelacaoAlunosMediaNS: TIBStringField;
    IBQuery_RelacaoAlunosMediaFICHACOMPLETA: TIBStringField;
    DST_Parecer: TDataSource;
    IBTable_Parecer: TIBTable;
    IBTable_ParecerIDCURSO: TSmallintField;
    IBTable_ParecerIDTURMA: TIntegerField;
    IBTable_ParecerID_FICHA: TIntegerField;
    IBTable_ParecerID_ATCO: TIBStringField;
    IBTable_ParecerID_AVL: TIBStringField;
    IBTable_ParecerID_EXERCICIO: TIntegerField;
    IBTable_ParecerPARECER: TBlobField;
    JvDBRichEdit_Parecer: TJvDBRichEdit;
    ToolButton_ControleGeralGraus_Excel: TToolButton;
    ToolButton_Relacao_dosAlunosComItensNaoSatisfatorioExcel: TToolButton;
    JvCaptionPanel_AgendaPosCurso: TJvCaptionPanel;
    BitBtn_AtualizaCursoAndamento: TBitBtn;
    DBNavigator_CursosAndamento: TDBNavigator;
    DBGrid_Turma: TDBGrid;
    Query_TurmaAndamento: TIBQuery;
    Query_TurmaAndamentoIDCURSO: TSmallintField;
    Query_TurmaAndamentoCODCURSO: TIBStringField;
    Query_TurmaAndamentoIDTURMA: TIntegerField;
    Query_TurmaAndamentoTURMA: TIBStringField;
    Query_TurmaAndamentoANO: TIBStringField;
    Query_TurmaAndamentoDATAINICIO: TDateTimeField;
    Query_TurmaAndamentoDATATERMINO: TDateTimeField;
    Query_TurmaAndamentoQDEALUNOS: TSmallintField;
    Query_TurmaAndamentoCODSALA: TIBStringField;
    Query_TurmaAndamentoCOORDENADOR: TIBStringField;
    DSQ_TurmaAndamento: TDataSource;
    ToolButton_Rel_FichaAvaliacao: TToolButton;
    ToolButton_Rel_NaoSatisfatorioPorTurma: TToolButton;
    IBQuery_RelacaoNSPorTurma__VerificarPosteriormente: TIBQuery;
    DSQ_RelacaoNSPorTurma: TDataSource;
    IBQuery_RelacaoNSPorTurma__VerificarPosteriormenteIDTURMA: TIntegerField;
    IBQuery_RelacaoNSPorTurma__VerificarPosteriormenteTURMA: TIBStringField;
    IBQuery_RelacaoNSPorTurma__VerificarPosteriormenteID_ATCO: TIBStringField;
    IBTable_AlunoTurmaNS: TIBTable;
    DataSource2: TDataSource;
    IBQuery_RelacaoNSPorTurma__VerificarPosteriormenteIDCURSO: TSmallintField;
    IBTable_AlunoTurmaNSIDCURSO: TSmallintField;
    IBTable_AlunoTurmaNSIDTURMA: TIntegerField;
    IBTable_AlunoTurmaNSNOTAFINAL: TIBBCDField;
    IBTable_AlunoTurmaNSNOMECOMPLETO: TIBStringField;
    IBTable_AlunoTurmaNSIDENTIDADE: TIBStringField;
    IBTable_EstagiarioNS_: TIBTable;
    DataSource3: TDataSource;
    IBTable_EstagiarioNS_ID_ATCO: TIBStringField;
    IBTable_EstagiarioNS_ESTAGIARIO: TIBStringField;
    ToolButton_EstatisticaExcel: TToolButton;
    ToolButton_EstatisticaProsima: TToolButton;
    JvxLabel1: TJvxLabel;
    Panel_Turma: TPanel;
    JvShape1: TJvShape;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    ComboBox_Turma: TComboBox;
    ComboBox_Area: TComboBox;
    ComboBox_Localidade: TComboBox;
    IBQuery_MontaTurma: TIBQuery;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_MontaTurmaSTATUS: TIBStringField;
    IBQuery_MontaTurmaDESCRICAO: TIBStringField;
    IBQuery_MontaTurmaCODSALA: TIBStringField;
    DST_MontaTurma: TDataSource;
    IBTable_AlunoTurmaNSNUMORDEM: TSmallintField;
    IBTable_AlunoTurmaNSESTAGIARIO: TIBStringField;
    IBTable_EstagiarioNS: TIBTable;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    DST_Estagiario: TDataSource;
    Label1: TLabel;
    ComboBox_Ano: TComboBox;

    Function TratarArea(PS_Area: String): String;

    procedure Monta_ComboTurma;
    procedure Calcula_GrauFinalTurma;
    procedure Trocar(Trocar: String; Por: String);
    procedure Resumo;
    procedure ImprimeNS;
    procedure ImprimeNS_Excel;

    procedure ToolButton_ModeloFichaClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_ContendoClassificacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton_RelacaoComCodigoAcessoInstrutorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn_AtualizaCursoAndamentoClick(Sender: TObject);
    procedure ToolButton_Relacao_dosAlunosComItensNaoSatisfatorioClick(Sender: TObject);
    procedure ToolButton_Rel_MediaAlunosClick(Sender: TObject);
    procedure ToolButton_EstatisticaClick(Sender: TObject);
    procedure ToolButton_GrauFinalTurmaClick(Sender: TObject);
    procedure ToolButton_ControleGeralGraus_ExcelClick(Sender: TObject);
    procedure ToolButton_Relacao_dosAlunosComItensNaoSatisfatorioExcelClick(Sender: TObject);
    procedure ToolButton_Rel_FichaAvaliacaoClick(Sender: TObject);
    procedure ToolButton_Rel_NaoSatisfatorioPorTurmaClick(Sender: TObject);
    procedure ToolButton_EstatisticaExcelClick(Sender: TObject);
    procedure VersionClick(Sender: TObject);
    procedure ToolButton_EstatisticaProsimaClick(Sender: TObject);
    procedure ComboBox_TurmaChange(Sender: TObject);
  private    { Private declarations }
      VS_Identidade, VS_Exericio: String;

   objExcel,Sheet : Variant;
   cTitulo : string;
   Linha : integer;

     MS_Turma: Array[1..1000] of String;
  public
    { Public declarations }
  end;

var
  Form_MenuPrincipal: TForm_MenuPrincipal;

implementation

uses MontaFicha, Sel_MontaProsima, Classificacao,
  Rel_RelatorioDoCadastroDeAlunosComCodigo, FichaAvaliacao, Module,
  Editor_Texto, Relatorio_Geral, GrauFinalCurso, ProcessarClassificacao,
  ProcessarClassificacaoExcel, Sel_Rel_FichaAvaliacao, Sel_Relatorios,
  CalcularMedia, Sel_Relatorios_Instrutores, Login;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.FormActivate(Sender: TObject);
var
   VS_Turma, VS_Localidade, VS_Area: String;
   Status: Boolean;
begin
   if Form_Login.VS_Iniciar = 'ABERTURA' then
   begin
      Form_Login.VS_Iniciar:= 'OK';
      ComboBox_Ano.Text:= Funcoes.AnoAtual;

      if  ((Form_Login.MaskEdit_Nome.Text = 'AVL') and (Form_Login.MaskEdit_Senha.Text = 'AVL#99')) then
         Status:= True
      else
         Status:= False;

      ToolButton_ModeloFicha.Visible:= Status;
      ToolButton_ContendoClassificacao.Visible:= Status;
      ToolButton_Rel_MediaAlunos.Visible:= Status;
      ToolButton_GrauFinalTurma .Visible:= Status;
      ToolButton_Relacao_dosAlunosComItensNaoSatisfatorio.Visible:= Status;
      ToolButton_Estatistica.Visible:= Status;
      ToolButton_ControleGeralGraus_Excel.Visible:= Status;
      ToolButton_Relacao_dosAlunosComItensNaoSatisfatorioExcel.Visible:= Status;
      ToolButton_Rel_NaoSatisfatorioPorTurma.Visible:= Status;
      ToolButton_EstatisticaExcel.Visible:= Status;
      ToolButton_EstatisticaProsima.Visible:= Status;

      Label_Versao.Caption:= Versao;
      Label_Data.Caption:= Ultima_Atualizacao;
      Query_TurmaAndamento.Open;

      Monta_ComboTurma;

      Funcoes.OpenQuery(DM.Query_Executa, 'Select Distinct Turma From Turma where IdCurso = '+Funcoes.GetIdCurso+' order by Turma');

      ComboBox_Area.Items.Clear;
      ComboBox_Area.Text:= '';
      VS_Area:= '';
      VS_Turma:= Copy(DM.Query_Executa.FieldByName('Turma').AsString, 8, 10);

      ComboBox_Localidade.Items.Clear;
      ComboBox_Localidade.Text:= '';
      VS_Localidade:= '';

      DM.Query_Executa.First;
      While not DM.Query_Executa.eof do
      begin
         if Copy(VS_Area,1,3) <> Copy(VS_Turma, 1, 3) then
         begin
            VS_Area:= TratarArea(VS_Turma);
            if VS_Area <> '' Then
               ComboBox_Area.Items.Add(VS_Area);
         end;

         if VS_Localidade <> Copy(VS_Turma, 5, 2) then
         begin
            if ((VS_Area <> 'TUR')and (VS_Area <> 'BDS') and (VS_Area <> 'GT ') and (VS_Area <> 'PIL') and (VS_Area <> 'TWR3') and (VS_Area <> 'TWRS') and (VS_Area <> 'COPM') and (VS_Area <> 'CGNA')) then
            begin
               VS_Localidade:= Copy(VS_Turma, 4, 2);
               ComboBox_Localidade.Items.Add(VS_Localidade);
            end;
         end;
         DM.Query_Executa.Next;
      end;

      ComboBox_TurmaChange(Sender);
   end;
end;


//------------------------------------------------------------------------------
// Tratamento para Identificar a Area de Atuacao
//------------------------------------------------------------------------------

Function TForm_MenuPrincipal.TratarArea(PS_Area: String): String;
var
   VS_Area: String;
begin
   VS_Area:= Copy(PS_Area, 1, 3);
   if ((VS_Area <> 'TUR') and (VS_Area <> 'BDS') and (VS_Area <> 'GT ')) then
   begin
      if ((VS_Area = 'TWR') or (VS_Area = 'COP') or (VS_Area = 'CGN')) then
          VS_Area:= Copy(PS_Area, 1, 4);
   end
   else
   begin
      VS_Area:= '';
   end;

   TratarArea:= VS_Area;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Fechar o programa
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;


procedure TForm_MenuPrincipal.ToolButton_ControleGeralGraus_ExcelClick(Sender: TObject);
begin
   Form_ProcessarClassificacaoExcel.ShowModal;
end;

procedure TForm_MenuPrincipal.ToolButton_ModeloFichaClick(Sender: TObject);
begin
   Application.CreateForm(TForm_CriarModelo_Ficha, Form_CriarModelo_Ficha);
   Form_CriarModelo_Ficha.ShowModal;
end;


procedure TForm_MenuPrincipal.ToolButton_ContendoClassificacaoClick(Sender: TObject);
begin
   Form_Classificacao.ShowMOdal;
end;

procedure TForm_MenuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.Windows;
end;

procedure TForm_MenuPrincipal.ToolButton_RelacaoComCodigoAcessoInstrutorClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select NomeCompleto, Nomeguerra, CodigoInstrutor as Codigo '+
                ' From INSTRUTOR_TURMA_VIEW Where IdCurso = '+Funcoes.GetIdCurso+
                ' and IdTurma = '+Query_TurmaAndamento.FieldByName('IdTurma').AsString;

   Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
   Funcoes.ExecutaQuery(Form_Rel_RelacaoComCodigo.IBQuery_AlunoTurma, VS_Comando);
   Form_Rel_RelacaoComCodigo.QuickRep1.Preview;
end;

//-
procedure TForm_MenuPrincipal.BitBtn_AtualizaCursoAndamentoClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_TurmaAndamento);
end;

procedure TForm_MenuPrincipal.ToolButton_Relacao_dosAlunosComItensNaoSatisfatorioClick(Sender: TObject);
begin
   Resumo;
end;

//------------------------------------------------------------------------------
//--- Tratamento do Resumo
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Resumo;
var
   VS_Comando: String;
   VI_Cont: Integer;
begin
{   IBTable_Parecer.Open;
   VS_Comando:= 'Select count(1) as Qtd '+
                ' from TURMA '+
                ' Where IdCurso = '+Funcoes.GetIdCurso+
                ' and Status <> '+#39+'P'+#39;
   Funcoes.OpenQueryExecuta(VS_Comando);

   Form_RelatorioGeral.Text1.Lines.Clear;
   Form_RelatorioGeral.Text1.Lines.Add('Total de Turmas: '+DM.IBQuery_Executa_ensino.FieldByName('Qtd').AsString);
   Form_RelatorioGeral.Text1.Lines.Add('');

   VS_Comando:= 'Select count(1) as Qtd '+
               ' From CAD_FICHA_AVL ';
   Funcoes.OpenQueryExecuta(VS_Comando);
   Form_RelatorioGeral.Text1.Lines.Add('Nº Total de Fichas Avaliadas: '+DM.IBQuery_Executa_ensino.FieldByName('Qtd').AsString);

   VI_Cont:= 0;
   IBQuery_Total_Alunos_NS.Open;
   IBQuery_Total_Alunos_NS.First;
   While not IBQuery_Total_Alunos_NS.Eof do
   begin
      VI_Cont:= VI_Cont+1;
      IBQuery_Total_Alunos_NS.Next;
   end;
   IBQuery_Total_Alunos_NS.Close;

   Funcoes.OpenQueryExecuta(VS_Comando);
   Form_RelatorioGeral.Text1.Lines.Add('Total Alunos com Itens Não Satisfatorio: '+IntToStr(VI_Cont));
   Form_RelatorioGeral.Text1.Lines.Add('');
   Form_RelatorioGeral.Text1.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
   Form_RelatorioGeral.Text1.Lines.Add('');

    //----
   //--- Realacao dos Alunos NS

   if VI_Cont > 0 then
   begin
      VS_Identidade:= '';
      VS_Exericio:= '';
      Form_RelatorioGeral.Text1.Lines.Add('Relação de Alunos com Itens Não Satisfatórios: ');

      IBQuery_Instrutor_Avl.Open;
      IBQuery_Relacao_Alunos_NS.Open;
      IBQuery_Relacao_Alunos_NS.First;
      While not IBQuery_Relacao_Alunos_NS.Eof do
      begin
         ImprimeNS;
         IBQuery_Relacao_Alunos_NS.Next;
      end;
   end;

         ImprimeNS;
   IBQuery_Instrutor_Avl.Close;
   IBQuery_Relacao_Alunos_NS.Close;

   Form_RelatorioGeral.Text1.Lines.Add('');
   Form_RelatorioGeral.Text1.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');

   Form_RelatorioGeral.Text1.SelStart:= 0;  //5
   Form_RelatorioGeral.Show;
}
end;

//------------------------------------------------------------------------------
//--- Imprime a relacao dos Não Satisfatorios
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ImprimeNS;
begin
{   if ((VS_Identidade <> IBQuery_Relacao_Alunos_NS.FieldByName('ID_ATCO').AsString) or
       (VS_Exericio <> IBQuery_Relacao_Alunos_NS.FieldByName('ID_EXERCICIO').AsString)) Then
   begin
     if Trim(IBTable_Parecer.FieldByName('Parecer').AsString) <> '' then
      begin
         Form_RelatorioGeral.Text1.Lines.Add('');
         Form_RelatorioGeral.Text1.Lines.Add('Comentário: ');
         Form_RelatorioGeral.Text1.Lines.Add('');
         JvDBRichEdit_Parecer.SelectAll;
         JvDBRichEdit_Parecer.CopyToClipboard ;
         Form_RelatorioGeral.Text1.PasteFromClipboard ;
      end;

      Form_RelatorioGeral.Text1.Lines.Add('');
      VS_Identidade:= IBQuery_Relacao_Alunos_NS.FieldByName('ID_ATCO').AsString;
      VS_Exericio:= IBQuery_Relacao_Alunos_NS.FieldByName('ID_EXERCICIO').AsString;

      Form_RelatorioGeral.Text1.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
      Form_RelatorioGeral.Text1.Lines.Add('Aluno(a)  : '+IBQuery_Relacao_Alunos_NS.FieldByName('NomeCompleto').AsString);
      Form_RelatorioGeral.Text1.Lines.Add('Turma     : '+IBQuery_Relacao_Alunos_NS.FieldByName('Turma').AsString);
      Form_RelatorioGeral.Text1.Lines.Add('Exercicio : '+IBQuery_Relacao_Alunos_NS.FieldByName('Id_Exercicio').AsString);
      Form_RelatorioGeral.Text1.Lines.Add('Instrutor : '+Trim(IBQuery_Instrutor_Avl.FieldByName('PostoGraduacao').AsString)+' '+Trim(IBQuery_Instrutor_Avl.FieldByName('Nome').AsString));
      Form_RelatorioGeral.Text1.Lines.Add('');
   end;
   Form_RelatorioGeral.Text1.Lines.Add('       -> '+IBQuery_Relacao_Alunos_NS.FieldByName('Id_Item').AsString+' - '+
                             IBQuery_Relacao_Alunos_NS.FieldByName('Area_Avaliacao').AsString+' - '+
                             IBQuery_Relacao_Alunos_NS.FieldByName('Descricao').AsString);
//   Form_RelatorioGeral.Text1.Lines.Add(' ');
}
end;

//------------------------------------------------------------------------------
// Tratamento do Relatorio contendo a relação dos Alunos com a Media
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ToolButton_Rel_MediaAlunosClick(Sender: TObject);
begin
    Form_ProcessarClassificacao.Show;
end;

//------------------------------------------------------------------------------
// Tratamento para demonstrar a Situação Atual da Digitacao
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ToolButton_EstatisticaClick(Sender: TObject);
var
   VS_Comando: String;
   bm_Avl : TBookmark;
begin
   Form_RelatorioGeral.Text1.Clear;
   Form_RelatorioGeral.Text1.Font.Size:= 12;
   Form_RelatorioGeral.Text1.Font.Name:= 'Times New Roman';

   Form_RelatorioGeral.Text1.Lines.Add('          *** RELAÇÃO DAS TURMAS COM A QUANTIDADE DE FICHAS AVALIADAS ***');

//   Chart_Desempenho.CopyToClipboardBitmap;
   Form_RelatorioGeral.Text1.PasteFromClipboard;

   bm_Avl:= Query_TurmaAndamento.GetBookMark;
   Query_TurmaAndamento.First;
   While not Query_TurmaAndamento.Eof do
   begin
      VS_Comando:= 'Select count(1) as Qtd '+
                   ' From Cad_Ficha_avl '+
                   ' where IdCurso = '+Query_TurmaAndamento.FieldByName('IdCurso').AsString+
                   ' and   IdTurma = '+Query_TurmaAndamento.FieldByName('IdTurma').AsString;
      Funcoes.OpenQueryExecuta(VS_Comando);

      Form_RelatorioGeral.Text1.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
      Form_RelatorioGeral.Text1.Lines.Add('Turma          : '+Query_TurmaAndamento.FieldByName('IdTurma').AsString+' - '+Query_TurmaAndamento.FieldByName('Turma').AsString);
      Form_RelatorioGeral.Text1.Lines.Add('Qtd de Aluno(s): '+Query_TurmaAndamento.FieldByName('QdeAlunos').AsString);
      Form_RelatorioGeral.Text1.Lines.Add('Qtd de Fichas Avaliadas: '+DM.IBQuery_Executa_ensino.FieldByName('Qtd').AsString);

      Query_TurmaAndamento.Next;
   end;
   Query_TurmaAndamento.GotoBookmark(bm_Avl);
   Query_TurmaAndamento.FreeBookMark(bm_Avl);

   Form_RelatorioGeral.Text1.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
   Form_RelatorioGeral.Text1.SelStart:= 0;  //5
   Form_RelatorioGeral.Show;
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o Grau Final da Turma
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ToolButton_GrauFinalTurmaClick(Sender: TObject);
begin
   Calcula_GrauFinalTurma;

   Funcoes.SetRelDesempenho('Iniciado');
   Application.CreateForm(TForm_GrauFinalCurso, Form_GrauFinalCurso);
   Form_GrauFinalCurso.ShowModal;
end;


//------------------------------------------------------------------------------
// Modulo Responsavel por Gerar a Media dos Alunos
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Calcula_GrauFinalTurma;
var
   VS_Aluno, VS_Calc_Media, VS_Id_Atco, VS_Comando: String;
   VR_Media, VR_Cont: Real;
begin
   IBTable_AlunoTurma.Open;

   VS_Comando:= 'Select * From cad_ficha_avl '+
                ' Where IdCurso = '+Funcoes.GetIdCurso+
                ' and   IdTurma = '+Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                ' Order by IdTurma, Id_Atco, Id_Exercicio';

   IBQuery_RelacaoAlunosMedia.Close;
   IBQuery_RelacaoAlunosMedia.SQL.Clear;
   IBQuery_RelacaoAlunosMedia.Sql.Add(VS_Comando);
   IBQuery_RelacaoAlunosMedia.Open;

   VS_Id_Atco:= '';

   While not IBQuery_RelacaoAlunosMedia.Eof do
   begin
      if IBQuery_RelacaoAlunosMedia.FieldbyName('ID_ATCO').AsString <> VS_ID_ATCO then
      begin
         if VS_Id_Atco <> '' then
         begin
            VS_Calc_Media:= FormatFloat('#0.00', VR_Media/VR_Cont);
            VS_Comando:= 'Update AlunoTurma Set NotaFinal = '+Funcoes.DePara(VS_Calc_Media,',','.')+
                         ' Where IdCurso = '+Funcoes.GetIdCurso+
                         ' and   IdTurma = '+Query_TurmaAndamento.FieldByName('IdTurma').AsString+
                         ' and   Identidade = '+VS_ID_ATCO;

            Funcoes.ExecSql(VS_Comando);
         end
         else
         begin
         end;

         VR_Cont:= 1;
         VS_Id_Atco:= IBQuery_RelacaoAlunosMedia.FieldbyName('ID_ATCO').AsString;
         VS_Aluno:= IBQuery_RelacaoAlunosMedia.FieldbyName('NomeCompleto').AsString;
         VR_Media:= IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat;
      end
      else
      begin
         VR_Media:= VR_Media+IBQuery_RelacaoAlunosMedia.FieldbyName('Media').AsFloat;
         VR_Cont:= VR_Cont+1
      end;
      IBQuery_RelacaoAlunosMedia.Next;
   end;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel do texto
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Form_RelatorioGeral.Text1.FindText(Trocar, 0, Length(Form_RelatorioGeral.Text1.Text), []);
  if Posicao >= 0 then
  begin
    Form_RelatorioGeral.Text1.SelStart := Posicao;
    Form_RelatorioGeral.Text1.SelLength := Length(Trocar);
    Form_RelatorioGeral.Text1.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento da Relacao dos NS em Excel
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ToolButton_Relacao_dosAlunosComItensNaoSatisfatorioExcelClick(Sender: TObject);
var
   VS_Comando: String;
   VI_Cont: Integer;
begin
{   IBTable_Parecer.Open;
   VS_Comando:= 'Select count(1) as Qtd '+
                ' from TURMA '+
                ' Where IdCurso = '+Funcoes.GetIdCurso+
                ' and Status <> '+#39+'P'+#39;
   Funcoes.OpenQueryExecuta(VS_Comando);

   // Cria uma instancia para utilizar o Excel

//   cTitulo := 'Relação dos Alunos com Avaliações Não Satisfatórias';
   cTitulo := 'Relação dos Alunos NS';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

    //---
   //   Tratamento do Cabecalho do Relatorio

   // Preenchendo as Colunas
   Sheet.Range['A1'] := 'INSTITUTO DE CONTROLE DO ESPAÇO AÉREO';
   Sheet.Range['A2'] := 'DIVISÃO DE ENSINO';
   Sheet.Range['A3'] := 'SUBDIVISÃO DE AVALIAÇÃO';
   Sheet.Range['A5'] := 'RELAÇÃO DE ALUNOS COM NS';
   Sheet.Range['A7'] := 'Elaborado em: '+DateToStr(Date);

   Sheet.Range['A9'] := 'Total de Turmas: '+DM.IBQuery_Executa_ensino.FieldByName('Qtd').AsString;

   VS_Comando:= 'Select count(1) as Qtd '+
               ' From CAD_FICHA_AVL ';
   Funcoes.OpenQueryExecuta(VS_Comando);
   Sheet.Range['A10'] := 'Nº Total de Fichas Avaliadas: '+DM.IBQuery_Executa_ensino.FieldByName('Qtd').AsString;

   VS_Comando:= 'Select count(1) as Qtd '+
               ' From alunoturma Where IdCurso = '+Funcoes.GetIdCurso;
   Funcoes.OpenQueryExecuta(VS_Comando);
   Sheet.Range['A11'] := 'Nº Total de Alunos Prosima: '+DM.IBQuery_Executa_ensino.FieldByName('Qtd').AsString;

   VI_Cont:= 0;
   IBQuery_RelacaoNSPorTurma.Open;
   IBQuery_RelacaoNSPorTurma.First;
   While not IBQuery_RelacaoNSPorTurma.Eof do
   begin
      VI_Cont:= VI_Cont+1;
      IBQuery_RelacaoNSPorTurma.Next;
   end;

   Sheet.Range['B12'] := 'Total Alunos com Itens Não Satisfatorio: '+IntToStr(VI_Cont);


//   VI_Cont:= 0;
//   IBQuery_Total_Alunos_NS.Open;
//   IBQuery_Total_Alunos_NS.First;
//   While not IBQuery_Total_Alunos_NS.Eof do
//   begin
//      VI_Cont:= VI_Cont+1;
//      IBQuery_Total_Alunos_NS.Next;
//   end;
//   IBQuery_Total_Alunos_NS.Close;

//   Funcoes.OpenQueryExecuta(VS_Comando);
//   Sheet.Range['A12'] := 'Total Alunos com Itens Não Satisfatorio: '+IntToStr(VI_Cont);

    //----
   //--- Realacao dos Alunos NS

   if VI_Cont > 0 then
   begin
      VS_Identidade:= '';
      VS_Exericio:= '';
      Sheet.Range['A14'] := 'Relação de Alunos com Itens Não Satisfatórios: ';

      Linha:= 16;
      IBQuery_Instrutor_Avl.Open;
      IBQuery_Relacao_Alunos_NS.Open;
      IBQuery_Relacao_Alunos_NS.First;
      While not IBQuery_Relacao_Alunos_NS.Eof do
      begin
         ImprimeNS_Excel;
         IBQuery_Relacao_Alunos_NS.Next;
      end;
   end;

   ImprimeNS_Excel;
   Sheet.Columns.AutoFit;
}
end;

//------------------------------------------------------------------------------
//--- Imprime a relacao dos Não Satisfatorios
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ImprimeNS_Excel;
begin
{   if ((VS_Identidade <> IBQuery_Relacao_Alunos_NS.FieldByName('ID_ATCO').AsString) or
       (VS_Exericio <> IBQuery_Relacao_Alunos_NS.FieldByName('ID_EXERCICIO').AsString)) Then
   begin
     Linha:= Linha + 1;
//     if Trim(IBTable_Parecer.FieldByName('Parecer').AsString) <> '' then
//      begin
//         Sheet.Cells[Linha,1] := 'Comentário: ';
//         Linha:= Linha + 1;

//         Sheet.Cells[Linha,1] := IBTable_Parecer.FieldByName('Parecer').Value;
//         Linha:= Linha + 1;
//      end;

      VS_Identidade:= IBQuery_Relacao_Alunos_NS.FieldByName('ID_ATCO').AsString;
      VS_Exericio:= IBQuery_Relacao_Alunos_NS.FieldByName('ID_EXERCICIO').AsString;

      Sheet.Cells[Linha,1] := '-----------------------------------------------------------------------------------------------------------------------------------------------------------';
      Linha:= Linha + 1;
      Sheet.Cells[Linha,1] := 'Aluno(a)  : '+IBQuery_Relacao_Alunos_NS.FieldByName('NomeCompleto').AsString;
      Linha:= Linha + 1;
      Sheet.Cells[Linha,1] := 'Turma     : '+IBQuery_Relacao_Alunos_NS.FieldByName('Turma').AsString;
      Linha:= Linha + 1;
      Sheet.Cells[Linha,1] := 'Instrutor : '+Trim(IBQuery_Instrutor_Avl.FieldByName('PostoGraduacao').AsString)+' '+Trim(IBQuery_Instrutor_Avl.FieldByName('Nome').AsString);
      Linha:= Linha + 1;
      Sheet.Cells[Linha,1] := 'Exercício : '+IBQuery_Relacao_Alunos_NS.FieldByName('Id_Exercicio').AsString;
      Linha:= Linha + 1;
   end;
   Sheet.Cells[Linha,1]:= '       -> '+IBQuery_Relacao_Alunos_NS.FieldByName('Id_Item').AsString+' - '+
                          IBQuery_Relacao_Alunos_NS.FieldByName('Area_Avaliacao').AsString+' - '+
                          IBQuery_Relacao_Alunos_NS.FieldByName('Descricao').AsString;
   Linha:= Linha + 1;
}
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o Relatorio da Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ToolButton_Rel_FichaAvaliacaoClick(Sender: TObject);
begin
   Funcoes.SetStarte('Não');
   Form_Sel_Rel_FichaAvaliacao.ShowModal;
end;

procedure TForm_MenuPrincipal.ToolButton_Rel_NaoSatisfatorioPorTurmaClick( Sender: TObject);
var
   VI_Linha, VI_Cont: Integer;
begin
{   IBTable_EstagiarioNS.Open;
   IBTable_AlunoTurmaNS.Open;
   // Cria uma instancia para utilizar o Excel

//   cTitulo := 'Relação dos Alunos com Avaliações Não Satisfatórias';
   cTitulo := 'Relação dos Alunos NS';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

    //---
   //   Tratamento do Cabecalho do Relatorio

   // Preenchendo as Colunas
   Sheet.Range['B1'] := 'INSTITUTO DE CONTROLE DO ESPAÇO AÉREO';
   Sheet.Range['B2'] := 'DIVISÃO DE ENSINO';
   Sheet.Range['B3'] := 'SUBDIVISÃO DE AVALIAÇÃO';
   Sheet.Range['B5'] := 'RELAÇÃO DE ALUNOS NÃO SATISFATÓRIOS POR TURMA';
   Sheet.Range['B7'] := 'Elaborado em: '+DateToStr(Date);

   VI_Cont:= 0;
   IBQuery_RelacaoNSPorTurma.Open;
   IBQuery_RelacaoNSPorTurma.First;
   While not IBQuery_RelacaoNSPorTurma.Eof do
   begin
      VI_Cont:= VI_Cont+1;
      IBQuery_RelacaoNSPorTurma.Next;
   end;

   Sheet.Range['B12'] := 'Total Alunos com Itens Não Satisfatorio: '+IntToStr(VI_Cont);

    //----
   //--- Realacao dos Alunos NS

   Sheet.Range['A16'] := 'TURMA';
   Sheet.Range['B16'] := 'ALUNO';
//   Sheet.Range['C16'] := 'MÉDIA';
   Sheet.Range['C16'] := 'ESTÁGIARIO';

   VI_Linha:= 18;

   IBQuery_RelacaoNSPorTurma.First;
   While not IBQuery_RelacaoNSPorTurma.Eof do
   begin
      Sheet.Cells[VI_Linha,1] := IBQuery_RelacaoNSPorTurma.FieldByName('Turma').AsString;
      Sheet.Cells[VI_Linha,2] := IBTable_AlunoTurmaNS.FieldByName('NomeCompleto').AsString;
//      Sheet.Cells[VI_Linha,3] := IBTable_AlunoTurmaNS.FieldByName('NotaFinal').AsString;
      if IBTable_EstagiarioNS.FieldByName('Estagiario').AsString = 'S' then
         Sheet.Cells[VI_Linha,3] := 'Sim'
      else
         Sheet.Cells[VI_Linha,3] := 'Não';
      VI_Linha:= VI_Linha+1;
      IBQuery_RelacaoNSPorTurma.Next;
   end;
   Sheet.Columns.AutoFit;
}
end;

procedure TForm_MenuPrincipal.ToolButton_EstatisticaExcelClick(Sender: TObject);
begin
   Form_Relatorio.ShowMOdal;
end;

procedure TForm_MenuPrincipal.VersionClick(Sender: TObject);
begin
   Form_CalcularMedia.ShowModal;
end;

procedure TForm_MenuPrincipal.ToolButton_EstatisticaProsimaClick( Sender: TObject);
begin
   Form_Relatorio_Instrutores.ShowModal;
end;

//------------------------------------------------------------------------------
//--- Tratamento para filtrar a relacao de turmas
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ComboBox_TurmaChange(Sender: TObject);
var
   VS_Comando, VS_Turma: String;
   VI_IdTurma: Integer;
begin
   VS_Comando:= 'Select IdCurso, CodCurso, idTurma, Turma, ano, datainicio, datatermino, qdealunos, CodSala, Coordenador '+
                ' from TURMA_TODAS_VIEW  '+
                ' Where IdCurso = '+Funcoes.GetIdCurso+
                ' and   IdTurma <> 0';
//                ' and   qdealunos > 0';

   if trim(ComboBox_Ano.Text) <> '' then
         VS_Comando:= VS_Comando+' and Ano = '+trim(ComboBox_Ano.Text);

   if trim(ComboBox_Turma.Text) <> '' then
   begin
      VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-'));

      if VS_Turma <> '' then
      begin
         VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
         VS_Comando:= VS_Comando+' and IdTurma = '+MS_Turma[VI_IdTurma]
      end
   end
   else
      if ((trim(ComboBox_Area.Text) <> '') or (Trim(ComboBox_Localidade.Text) <> '')) then
         VS_Comando:= VS_Comando+' and Turma Like '+#39+'%'+trim(ComboBox_Area.Text)+Trim(ComboBox_Localidade.Text)+'%'+#39;

   VS_Comando:= VS_Comando+' order by Ano desc, Turma desc, IdTurma desc ';

   Query_TurmaAndamento.Close;
   Query_TurmaAndamento.SQL.Clear;
   Query_TurmaAndamento.SQL.Add(VS_Comando);
   Query_TurmaAndamento.Open;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.Monta_ComboTurma;
var
   VS_Comando :String;
   VI_Indice: Integer;
begin
   //--- Tratamento da Alimentacao do Combo de selecao da Turma

   VS_Comando:= 'Select * From Turma where IdCurso = '+Funcoes.GetIdCurso+' and Status <> '+#39+'P'+#39+' and Status <> '+#39+'B'+#39+' Order By Turma desc';
   Funcoes.OpenQuery(IBQuery_MontaTurma,VS_Comando);
   IBQuery_MontaTurma.First;

   VI_Indice:= 1;

   ComboBox_Turma.Items.Clear;
   ComboBox_Turma.Text:= '';
   MS_Turma[VI_Indice]:= '-2';

   While not IBQuery_MontaTurma.Eof do
   begin
      if ((Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,1,4) <> 'COPM') and
          (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'BDS') and
          (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,1,5) <> 'REDIM') and
          (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,1,3) <> 'PIL') and
          (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,1,2) <> 'GT') and
          (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,1,5) <> 'REDIM') and
          (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,1,4) <> 'CGNA')) then
      begin
         ComboBox_Turma.Items.Add( IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+IBQuery_MontaTurma.FieldByName('Descricao').AsString);
         VI_Indice:= VI_Indice + 1;
         MS_Turma[VI_Indice]:= IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end;
      IBQuery_MontaTurma.Next;
   end;
   IBQuery_MontaTurma.First;
end;
end.
