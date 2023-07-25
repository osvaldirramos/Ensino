//------------------------------------------------------------------------------
//
// Tratamento das Informaçoes dos Cursos Executados
//
//------------------------------------------------------------------------------

unit ConsultaCursosAndamento;

interface

uses
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvShape, ComCtrls, ToolWin, Grids, DBGrids, JvRadioButton,
  JvCheckBox, JvToolEdit, JvRichEd, JvDBRichEd, JvCombobox, JvColorCombo, ComObj,
  XPMan, Menus, JvComponent, JvArrowBtn, Buttons, jpeg, JvGradient, Rotinas_TrataData,
  Controls, Classes, Windows, Messages, SysUtils, Variants, Graphics, Forms,
  ImgList, Rotinas, Rotinas_SUE, JvCaptionPanel, ShellApi, PsyRichEdit,
  JvScrollPanel, JvCtrls, JvSpeedButton, JvToolBar, JvTransBtn, JvLookOut;
type
  TForm_ConsultaCursosAndamento = class(TForm)
    Panel_CursosExecutados: TPanel;
    StringGrid_Executados: TStringGrid;
    IBQuery_TurmaExecutada: TIBQuery;
    DSQ_TurmaExecutada: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit_Especialidade: TMaskEdit;
    MaskEdit_Localidade: TMaskEdit;
    JvDateEdit_DataInicio: TJvDateEdit;
    JvDateEdit_DataTermino: TJvDateEdit;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape4: TJvShape;
    JvExpressButton_Pesquisar: TJvExpressButton;
    JvShape2: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;
    Label_SelecaoCurso: TLabel;
    ComboBox_Curso: TComboBox;
    ComboBox_Turma: TComboBox;
    Label4: TLabel;
    GroupBox_QtdCursos: TGroupBox;
    Label_QtdCursos: TLabel;
    CheckBox_VizualizarSomenteCursosPAEAT: TJvCheckBox;
    IBQuery_TurmaExecutadaIDCURSO: TSmallintField;
    IBQuery_TurmaExecutadaCODCURSO: TIBStringField;
    IBQuery_TurmaExecutadaIDTURMA: TIntegerField;
    IBQuery_TurmaExecutadaTURMA: TIBStringField;
    IBQuery_TurmaExecutadaANO: TIBStringField;
    IBQuery_TurmaExecutadaDATAINICIO: TDateTimeField;
    IBQuery_TurmaExecutadaDATATERMINO: TDateTimeField;
    IBQuery_TurmaExecutadaQDEALUNOS: TIntegerField;
    IBQuery_TurmaExecutadaCODSALA: TIBStringField;
    IBQuery_TurmaExecutadaCOORDENADOR: TIBStringField;
    IBQuery_TurmaExecutadaDESCRICAO: TIBStringField;
    JvCheckBox_CursosEAD: TJvCheckBox;
    Label_Ano: TLabel;
    MaskEdit_Ano: TMaskEdit;
    ProgressBar1: TProgressBar;
    JvCheckBox_Prosima: TJvCheckBox;
    JvCheckBox_Paels: TJvCheckBox;
    JvCheckBox_Presencial: TJvCheckBox;
    JvCheckBox_ACC: TJvCheckBox;
    JvCheckBox_APP: TJvCheckBox;
    JvCheckBox_TWR3: TJvCheckBox;
    JvCheckBox_TWRs: TJvCheckBox;
    JvCheckBox_TWR180: TJvCheckBox;

    procedure JvCheckBox_Paels_Prosima(Sender: TObject);
    procedure VerificarQtdInstrutor;
    procedure LimpaMatrizExecutados;
    procedure MontarCabecalho;

    procedure FormActivate(Sender: TObject);
    procedure StringGrid_ExecutadosDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure MaskEdit_CursoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDateEdit_DataTerminoKeyPress(Sender: TObject; var Key: Char);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvExpressButton_PesquisarClick(Sender: TObject);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
    procedure Pesquisa_KeyPress(Sender: TObject; var Key: Char);
    procedure JvCheckBox_ACCClick(Sender: TObject);
    procedure JvCheckBox_APPClick(Sender: TObject);
    procedure JvCheckBox_TWR3Click(Sender: TObject);
    procedure JvCheckBox_TWRsClick(Sender: TObject);
    procedure JvCheckBox_TWR180Click(Sender: TObject);
  private    { Private declarations }
     VI_NTurmas: Integer;
     VS_StatusTurma: String;
   VI_Instrutor, VI_Coordenador, VI_Tecnico, VI_Palestrante, VI_Preparador, VI_Sombra, VI_Supervisor, VI_InstAuxiliar, VI_CoordInstrutor, VI_Piloto: Integer;
  public    { Public declarations }
  end;

var
  Form_ConsultaCursosAndamento: TForm_ConsultaCursosAndamento;

implementation

uses Module, Editor_Texto;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando ativa a Form
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.FormActivate(Sender: TObject);
var
   Status_F, Status: Boolean;
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Funcoes.SetCadCurso('CadCurso');

      if Form_ConsultaCursosAndamento.Caption = 'Sistema de Gerenciamento do Ensino --> Estatística dos Cursos Executados' then
      begin
         VS_StatusTurma:= 'E';
         MaskEdit_Ano.Text:= Funcoes_TrataData.AnoAtual;
         Status:= True;
      end
      else
      begin
         VS_StatusTurma:= 'A';
         MaskEdit_Ano.Text:= '';
         Status:= False;
      end;

      if (DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') then
      begin
         Status_F:= False;
         Label_SelecaoCurso.Visible:= False;
         ComboBox_Curso.Visible:= False;
      end
      else
      begin
         Status_F:= True;
         Label_SelecaoCurso.Visible:= True;
         ComboBox_Curso.Visible:= True;
      end;

      CheckBox_VizualizarSomenteCursosPAEAT.Visible:= Status_F;
      JvCheckBox_CursosEAD.Visible:= Status_F;
      JvCheckBox_Prosima.Visible:= Status_F;
      JvCheckBox_Paels.Visible:= Status_F;
      JvCheckBox_Presencial.Visible:= Status_F;

      JvCheckBox_ACC.Visible:= False;
      JvCheckBox_APP.Visible:= False;
      JvCheckBox_TWR3.Visible:= False;
      JvCheckBox_TWRs.Visible:= False;
      JvCheckBox_TWR180.Visible:= False;

      Label_Ano.Visible:= Status;
      MaskEdit_Ano.Visible:= Status;

      Funcoes.OpenQuery( 'Select distinct CodCurso From turma t, Curso c '+
                         ' Where t.idCurso = c.IdCurso '+
                         ' and t.status = '#39+VS_StatusTurma+#39+
                         ' and (Participa_Estatistica is null or Participa_Estatistica  <> '+#39+'N'+#39+' )'+
                         ' Order By CodCurso '
                       );

      ComboBox_Curso.Items.Clear;
      ComboBox_Curso.Text:= '';
      ComboBox_Curso.Items.Add('');
      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_Curso.Items.Add(DM.IBQuery_Executa.FieldbyName('CodCurso').AsString);
         DM.IBQuery_Executa.Next;
      end;

      if (DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') then
         Funcoes.OpenQuery( 'Select distinct Turma From turma t, Curso c '+
                            ' Where t.idCurso = c.IdCurso '+
                            ' and t.IdCurso = 208'+
                            ' and t.status = '#39+VS_StatusTurma+#39+
                            ' and (Participa_Estatistica is null or Participa_Estatistica  <> '+#39+'N'+#39+' )'+
                            ' Order By Turma '
                          )
      else
         Funcoes.OpenQuery( 'Select distinct Turma From turma t, Curso c '+
                            ' Where t.idCurso = c.IdCurso '+
                            ' and t.status = '#39+VS_StatusTurma+#39+
                            ' and (Participa_Estatistica is null or Participa_Estatistica  <> '+#39+'N'+#39+' )'+
                            ' Order By Turma '
                          );

      ComboBox_Turma.Items.Clear;
      ComboBox_Turma.Text:= '';
      ComboBox_Turma.Items.Add('');
      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_Turma.Items.Add(DM.IBQuery_Executa.FieldbyName('Turma').AsString);
         DM.IBQuery_Executa.Next;
      end;

      //--- Tratamento da Grid de Cursos Executados

      LimpaMatrizExecutados;
      MontarCabecalho;

//      JvExpressButton_PesquisarClick(Sender);
   end;
end;

procedure TForm_ConsultaCursosAndamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_TurmaExecutada.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento quando pressiona o Botao fechar
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando pressiona o Botao Windows
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_ConsultaCursosAndamento.Pesquisa_KeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
      JvExpressButton_PesquisarClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Pesquisa de Cursos em andamento
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.JvExpressButton_PesquisarClick(Sender: TObject);
var
   VS_Where: String;
   VI_Linha, VI_Aer, VI_EB, VI_MB, VI_Civis, VI_Est, VI_Outros, VI_Homens, VI_Mulheres, VI_Deslig: Integer;

   VI_QtdAlunos, VI_TotCursos, VI_TotInst, VI_TotAlunos, VI_TotAer, VI_TotEB, VI_TotMB, VI_TotCivis, VI_TotEst, VI_TotOutros, VI_TotHomens, VI_TotMulheres, VI_TotDeslig: Integer;
   VI_TotInstrutor, VI_TotCoordenador, VI_TotTecnico, VI_TotPalestrante, VI_TotPreparador, VI_TotSombra, VI_TotSupervisor, VI_TotInstAuxiliar, VI_TotCoordInstrutor, VI_TotPiloto: Integer;
begin
   ProgressBar1.Visible:= true;
   LimpaMatrizExecutados;

   VS_Where:= ' Where t.idCurso = c.IdCurso '+
              ' and t.status = '#39+VS_StatusTurma+#39+
              ' and (t.Participa_Estatistica is null or t.Participa_Estatistica  <> '+#39+'N'+#39+' )';

   if ((DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') or (JvCheckBox_Paels.Checked = True)) then
      VS_Where:= VS_Where+' and c.IdCurso = 208 ';

   if JvCheckBox_Prosima.Checked = True then
      VS_Where:= VS_Where+' and c.IdCurso = 139 ';

   if CheckBox_VizualizarSomenteCursosPAEAT.Checked = True then
      VS_Where:= VS_Where+' and c.PAET = '+#39+'S'+#39;

   if JvCheckBox_CursosEAD.Checked = True then
      VS_Where:= VS_Where+' and (t.Modalidade = '+#39+'EAD'+#39+' or t.Modalidade = '+#39+'Semi'+#39+')';

   if JvCheckBox_Presencial.Checked = True then
      VS_Where:= VS_Where+' and t.Modalidade = '+#39+'Presencial'+#39;

   if Trim(MaskEdit_Ano.Text) <> '' then
     VS_Where:= VS_Where+' and ano = '+MaskEdit_Ano.Text;

   if Trim(ComboBox_Curso.Text) <> '' then
      VS_Where:= VS_Where+' and c.CodCurso Like '+#39+ComboBox_Curso.Text+'%'+#39;

   if Trim(ComboBox_Turma.Text) <> '' then
         VS_Where:= VS_Where+' And t.Turma Like '+#39+'%'+ComboBox_Turma.Text+'%'+#39;


   if JvCheckBox_ACC.Checked = True then
      VS_Where:= VS_Where+' and t.Turma Like '+#39+'%ACC%'+#39;

   if JvCheckBox_APP.Checked = True then
      VS_Where:= VS_Where+' and t.Turma Like '+#39+'%APP%'+#39;

   if JvCheckBox_TWR3.Checked = True then
      VS_Where:= VS_Where+' and t.Turma Like '+#39+'%TWR360%'+#39;

   if JvCheckBox_TWRs.Checked = True then
      VS_Where:= VS_Where+' and t.Turma Like '+#39+'%TWRSICAD%'+#39;

   if JvCheckBox_TWR180.Checked = True then
      VS_Where:= VS_Where+' and t.Turma Like '+#39+'%TWR180%'+#39;

   if (JvDateEdit_DataTermino.Text = '  /  /    ') then
       JvDateEdit_DataTermino.Text:= JvDateEdit_DataInicio.Text;

   if ((JvDateEdit_DataInicio.Text <> '  /  /    ')  and (JvDateEdit_DataTermino.Text <> '  /  /    ')) then
          VS_Where:= VS_Where+' and t.DataInicio between '+#39+Funcoes.Depara(JvDateEdit_DataInicio.Text,'/', '.')+' 00:00'+#39+' and '+#39+Funcoes.Depara(JvDateEdit_DataTermino.Text,'/', '.')+' 00:00'+#39;

   Funcoes.OpenQuery('Select count(1) Qtd From turma t, Curso c '+VS_Where);
   StringGrid_Executados.RowCount:= DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger+2;

    Label_QtdCursos.Caption:= '---';
    ProgressBar1.Max:=DM.IBQuery_Executa.FieldbyName('Qtd').AsInteger+2;
    show;
    update;

    //---
   //--- Select para pegar os Cursos

   Funcoes.ExecutaQuery(IBQuery_TurmaExecutada, 'Select c.IdCurso, c.CodCurso, t.idTurma, t.turma, t.ano, t.datainicio, t.datatermino, t.QtdBrasileiros+t.QtdEstrangeiros as QdeAlunos, t.CodSala, t.Coordenador, t.Descricao '+
                                                ' From turma t, Curso c '+VS_Where+' order by c.CodCurso, t.Status, t.ano, t.turma'
                        );

   //--- Apresentacao da Grid de Cursos Executados

   VI_Linha:= 1;

   VI_TotCursos:= 0;
   VI_TotAer:= 0;
   VI_TotEB:= 0;
   VI_TotMB:= 0;
   VI_TotCivis:= 0;
   VI_TotOutros:= 0;
   VI_TotEst:= 0;
   VI_TotHomens:= 0;
   VI_TotMulheres:= 0;
   VI_TotDeslig:= 0;
   VI_TotAlunos:= 0;
   VI_TotInstrutor:= 0;
   VI_TotCoordenador:= 0;
   VI_TotTecnico:= 0;
   VI_TotPalestrante:= 0;
   VI_TotPreparador:= 0;
   VI_TotSombra:= 0;
   VI_TotSupervisor:= 0;
   VI_TotInstAuxiliar:= 0;
   VI_TotCoordInstrutor:= 0;
   VI_TotPiloto:= 0;
   VI_QtdAlunos:= 0;

   IBQuery_TurmaExecutada.First;
   While not IBQuery_TurmaExecutada.eof do
   begin
      VI_Aer:= 0;
      VI_EB:= 0;
      VI_MB:= 0;
      VI_Civis:= 0;
      VI_Outros:= 0;
      VI_Est:= 0;
      VI_Homens:= 0;
      VI_Mulheres:= 0;
      VI_Deslig:= 0;

       //---
      //--- Verifica a Quantidade de Instrutores

      VerificarQtdInstrutor;

       //---
      //---- Verifica informacoes de Alunos

   if (DM.Query_Usuario.FieldByName('Secao').AsString <> 'PAEL') Then
      Funcoes.OpenQuery( 'Select Tipo_Aluno, Sexo, MotivoDesligamento'+
                         ' From Aluno_Turmas_View '+
                         ' Where IdCurso = '+IBQuery_TurmaExecutada.FieldbyName('IdCurso').AsString+
                         ' and IdTurma = '+IBQuery_TurmaExecutada.FieldbyName('IdTurma').AsString
                       )
   else
      Funcoes.OpenQuery( 'Select Tipo_Aluno, Sexo, MotivoDesligamento'+
                         ' From Aluno_Turmas_View '+
                         ' Where IdCurso = 208'+
                         ' and IdTurma = '+IBQuery_TurmaExecutada.FieldbyName('IdTurma').AsString
                       );

      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
        if Trim(DM.IBQuery_Executa.FieldByName('MotivoDesligamento').AsString) <> 'a' then
           VI_Deslig:= VI_Deslig + 1                                                        //--- Numero de Alunos Desligados
        else
        begin
           if Trim(DM.IBQuery_Executa.FieldByName('Tipo_Aluno').AsString) = 'MILITAR DA AERONÁUTICA' then
              VI_Aer:= VI_Aer + 1
           else
              if Trim(DM.IBQuery_Executa.FieldByName('Tipo_Aluno').AsString) = 'MILITAR DO EXÉRCITO' Then
                 VI_EB:= VI_EB + 1
              else
                 if Trim(DM.IBQuery_Executa.FieldByName('Tipo_Aluno').AsString) = 'MILITAR DA MARINHA' Then
                    VI_MB:= VI_MB + 1
                 else
                    if Trim(DM.IBQuery_Executa.FieldByName('Tipo_Aluno').AsString) = 'CIVIL' Then
                        VI_Civis:= VI_Civis + 1
                    else
                       if Trim(DM.IBQuery_Executa.FieldByName('Tipo_Aluno').AsString) = 'ESTRANGEIRO' Then
                           VI_Est:= VI_Est + 1
                       else
                           VI_Outros:= VI_Outros + 1;

            //--- Verifica Sexo

          if Trim(DM.IBQuery_Executa.FieldByName('Sexo').AsString) = 'M' then
             VI_Homens:= VI_Homens + 1
          else
             VI_Mulheres:= VI_Mulheres + 1;
        end;
        DM.IBQuery_Executa.Next;
      end;

      if IBQuery_TurmaExecutada.FieldbyName('QdeAlunos').AsInteger = 0 then
      begin
         Funcoes.ExecusaoQuery( 'Update turma set QTDBrasileiros = '+IntToStr((VI_Homens+VI_Mulheres)-VI_Est)+
                                ', QTDEstrangeiros = '+IntToStr(VI_Est)+
                                ' Where IdCurso = '+IBQuery_TurmaExecutada.FieldbyName('IdCurso').AsString+
                                ' and IdTurma = '+IBQuery_TurmaExecutada.FieldbyName('IdTurma').AsString
                              );
      end;

      VI_TotAer:= VI_TotAer + VI_Aer;
      VI_TotEB:= VI_TotEB + VI_EB;
      VI_TotMB:= VI_TotMB + VI_MB;
      VI_TotCivis:= VI_TotCivis + VI_Civis;
      VI_TotOutros:= VI_TotOutros + VI_Outros;
      VI_TotEst:= VI_TotEst + VI_Est;
      VI_TotHomens:= VI_TotHomens + VI_Homens;
      VI_TotMulheres:= VI_TotMulheres + VI_Mulheres;
      VI_TotDeslig:= VI_TotDeslig + VI_Deslig;

      VI_TotInstrutor:= VI_TotInstrutor + VI_Instrutor;
      VI_TotCoordenador:= VI_TotCoordenador + VI_Coordenador;
      VI_TotTecnico:= VI_TotTecnico + VI_Tecnico;
      VI_TotPalestrante:= VI_TotPalestrante + VI_Palestrante;
      VI_TotPreparador:= VI_TotPreparador + VI_Preparador;
      VI_TotSombra:= VI_TotSombra + VI_Sombra;
      VI_TotSupervisor:= VI_TotSupervisor + VI_Supervisor;
      VI_TotInstAuxiliar:= VI_TotInstAuxiliar + VI_InstAuxiliar;
      VI_TotCoordInstrutor:= VI_TotCoordInstrutor + VI_CoordInstrutor;
      VI_TotPiloto:= VI_TotPiloto + VI_Piloto;

      VI_QtdAlunos:= VI_Homens+VI_Mulheres;
      VI_TotAlunos:= VI_TotAlunos + VI_QtdAlunos;

      StringGrid_Executados.Cells[0,VI_Linha]:= IBQuery_TurmaExecutada.FieldbyName('CodCurso').AsString;
      StringGrid_Executados.Cells[1,VI_Linha]:= IBQuery_TurmaExecutada.FieldbyName('Turma').AsString;
      StringGrid_Executados.Cells[2,VI_Linha]:= IBQuery_TurmaExecutada.FieldbyName('DataInicio').AsString;
      StringGrid_Executados.Cells[3,VI_Linha]:= IBQuery_TurmaExecutada.FieldbyName('DataTermino').AsString;
      StringGrid_Executados.Cells[4,VI_Linha]:=  Funcoes.CentraStr(IntToStr(VI_QtdAlunos), 5);
      StringGrid_Executados.Cells[6,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Aer), 3);
      StringGrid_Executados.Cells[7,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_EB), 3);
      StringGrid_Executados.Cells[8,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_MB), 3);
      StringGrid_Executados.Cells[9,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Civis), 5);
      StringGrid_Executados.Cells[10,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Est), 4);
      StringGrid_Executados.Cells[11,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Outros), 5);
      StringGrid_Executados.Cells[13,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Homens), 6);
      StringGrid_Executados.Cells[14,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Mulheres), 7);
      StringGrid_Executados.Cells[16,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Deslig), 7);
      StringGrid_Executados.Cells[18,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Instrutor), 7);
      StringGrid_Executados.Cells[19,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Coordenador), 7);
      StringGrid_Executados.Cells[20,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Tecnico), 7);
      StringGrid_Executados.Cells[21,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Palestrante), 7);
      StringGrid_Executados.Cells[22,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Preparador), 7);
      StringGrid_Executados.Cells[23,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Sombra), 7);
      StringGrid_Executados.Cells[24,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Supervisor), 7);
      StringGrid_Executados.Cells[25,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_InstAuxiliar), 7);
      StringGrid_Executados.Cells[26,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_CoordInstrutor), 7);
      StringGrid_Executados.Cells[27,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_Piloto), 7);

      VI_TotCursos:= VI_TotCursos+1;
      VI_Linha:= VI_Linha+1;

      ProgressBar1.StepBy(1);
      Update;

      IBQuery_TurmaExecutada.Next;
   end;
   Label_QtdCursos.Caption:= IntToStr(VI_TotCursos);

   StringGrid_Executados.Cells[0,VI_Linha]:= 'TOTAL===========' ;
   StringGrid_Executados.Cells[1,VI_Linha]:= '-----------------------';
   StringGrid_Executados.Cells[2,VI_Linha]:= '------------------';
   StringGrid_Executados.Cells[3,VI_Linha]:= '--------------->';

   StringGrid_Executados.Cells[4,VI_Linha]:=  Funcoes.CentraStr(IntToStr(VI_TotAlunos), 6);
   StringGrid_Executados.Cells[6,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotAer), 6);
   StringGrid_Executados.Cells[7,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotEB), 6);
   StringGrid_Executados.Cells[8,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotMB), 6);
   StringGrid_Executados.Cells[9,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotCivis), 6);
   StringGrid_Executados.Cells[10,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotEst), 6);
   StringGrid_Executados.Cells[11,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotOutros), 6);
   StringGrid_Executados.Cells[13,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotHomens), 6);
   StringGrid_Executados.Cells[14,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotMulheres), 7);
   StringGrid_Executados.Cells[16,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotDeslig), 7);

   StringGrid_Executados.Cells[18,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotInstrutor), 7);
   StringGrid_Executados.Cells[19,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotCoordenador), 11);
   StringGrid_Executados.Cells[20,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotTecnico), 7);
   StringGrid_Executados.Cells[21,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotPalestrante), 7);
   StringGrid_Executados.Cells[22,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotPreparador), 7);
   StringGrid_Executados.Cells[23,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotSombra), 7);
   StringGrid_Executados.Cells[24,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotSupervisor), 7);
   StringGrid_Executados.Cells[25,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotInstAuxiliar), 7);
   StringGrid_Executados.Cells[26,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotCoordInstrutor), 7);
   StringGrid_Executados.Cells[27,VI_Linha]:= Funcoes.CentraStr(IntToStr(VI_TotPiloto), 7);
   VI_Linha:= VI_Linha+1;
   VI_NTurmas:= VI_Linha -1;
   ProgressBar1.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para passar o Curso Executado para o Excel
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.JvTransparentButton_ExcelClick(Sender: TObject);
var
   objExcel,Sheet: Variant;
   cTitulo : string;
   x:integer;
begin
   cTitulo := 'Cadastro de Cursos Executados';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   // Preenchendo as Colunas
   Sheet.Range['A1'] := StringGrid_Executados.Cells[0,0];
   Sheet.Range['B1'] := StringGrid_Executados.Cells[1,0];
   Sheet.Range['C1'] := StringGrid_Executados.Cells[2,0];
   Sheet.Range['D1'] := StringGrid_Executados.Cells[3,0];
   Sheet.Range['E1'] := StringGrid_Executados.Cells[4,0];
   Sheet.Range['G1'] := StringGrid_Executados.Cells[6,0];
   Sheet.Range['H1'] := StringGrid_Executados.Cells[7,0];
   Sheet.Range['I1'] := StringGrid_Executados.Cells[8,0];
   Sheet.Range['J1'] := StringGrid_Executados.Cells[9,0];
   Sheet.Range['K1'] := StringGrid_Executados.Cells[10,0];
   Sheet.Range['L1'] := StringGrid_Executados.Cells[11,0];
   Sheet.Range['M1'] := StringGrid_Executados.Cells[13,0];
   Sheet.Range['N1'] := StringGrid_Executados.Cells[14,0];
   Sheet.Range['O1'] := StringGrid_Executados.Cells[16,0];
   Sheet.Range['P1'] := StringGrid_Executados.Cells[18,0];
   Sheet.Range['Q1'] := StringGrid_Executados.Cells[19,0];
   Sheet.Range['R1'] := StringGrid_Executados.Cells[20,0];
   Sheet.Range['S1'] := StringGrid_Executados.Cells[21,0];
   Sheet.Range['T1'] := StringGrid_Executados.Cells[22,0];
   Sheet.Range['U1'] := StringGrid_Executados.Cells[23,0];
   Sheet.Range['V1'] := StringGrid_Executados.Cells[24,0];
   Sheet.Range['W1'] := StringGrid_Executados.Cells[25,0];
   Sheet.Range['X1'] := StringGrid_Executados.Cells[26,0];
   Sheet.Range['Y1'] := StringGrid_Executados.Cells[27,0];
   Sheet.Range['Z1'] := StringGrid_Executados.Cells[28,0];
   // por aqui tu limparias a planilha

   For X := 0 to VI_NTurmas do
   begin
      Sheet.Cells[x+1,1]:= StringGrid_Executados.Cells[0,x];
      Sheet.Cells[x+1,2]:= StringGrid_Executados.Cells[1,x];
      if X = 0 then
      begin
         Sheet.Cells[x+1,3]:= StringGrid_Executados.Cells[2,x];
         Sheet.Cells[x+1,4]:= StringGrid_Executados.Cells[3,x];
      end
      else
      begin
         Sheet.Cells[x+1,3]:= #39+StringGrid_Executados.Cells[2,x];
         Sheet.Cells[x+1,4]:= #39+StringGrid_Executados.Cells[3,x];
      end;
      Sheet.Cells[x+1,5]:= StringGrid_Executados.Cells[4,x];
      Sheet.Cells[x+1,6]:= StringGrid_Executados.Cells[6,x];
      Sheet.Cells[x+1,7]:= StringGrid_Executados.Cells[7,x];
      Sheet.Cells[x+1,8]:= StringGrid_Executados.Cells[8,x];
      Sheet.Cells[x+1,9]:= StringGrid_Executados.Cells[9,x];
      Sheet.Cells[x+1,10]:= StringGrid_Executados.Cells[10,x];
      Sheet.Cells[x+1,11]:= StringGrid_Executados.Cells[11,x];
      Sheet.Cells[x+1,12]:= StringGrid_Executados.Cells[13,x];
      Sheet.Cells[x+1,13]:= StringGrid_Executados.Cells[14,x];
      Sheet.Cells[x+1,14]:= StringGrid_Executados.Cells[16,x];
      Sheet.Cells[x+1,15]:= StringGrid_Executados.Cells[17,x];
      Sheet.Cells[x+1,16]:= StringGrid_Executados.Cells[18,x];
      Sheet.Cells[x+1,17]:= StringGrid_Executados.Cells[19,x];
      Sheet.Cells[x+1,18]:= StringGrid_Executados.Cells[20,x];
      Sheet.Cells[x+1,19]:= StringGrid_Executados.Cells[21,x];
      Sheet.Cells[x+1,20]:= StringGrid_Executados.Cells[22,x];
      Sheet.Cells[x+1,21]:= StringGrid_Executados.Cells[23,x];
      Sheet.Cells[x+1,22]:= StringGrid_Executados.Cells[24,x];
      Sheet.Cells[x+1,23]:= StringGrid_Executados.Cells[25,x];
      Sheet.Cells[x+1,24]:= StringGrid_Executados.Cells[26,x];
      Sheet.Cells[x+1,25]:= StringGrid_Executados.Cells[27,x];
      Sheet.Cells[x+1,26]:= StringGrid_Executados.Cells[28,x];
      Sheet.Cells[x+1,27]:= StringGrid_Executados.Cells[29,x];
   end;
end;

//------------------------------------------------------------------------------
// Limpa Matriz
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.LimpaMatrizExecutados;
var
   L, I: Integer;
begin
    for I:= 0 to 26 do
       for L:= 1 to 100 do
          StringGrid_Executados.Cells[I,L]:= ' ';
end;

//------------------------------------------------------------------------------
// Monta o Cabecalho
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.MontarCabecalho;
begin
   StringGrid_Executados.Cells[0,0]:= '   Curso';
   StringGrid_Executados.Cells[1,0]:= '   Turma';
   StringGrid_Executados.Cells[2,0]:= '    Início';
   StringGrid_Executados.Cells[3,0]:= '   Término';
   StringGrid_Executados.Cells[4,0]:= '  Alunos';
   StringGrid_Executados.Cells[5,0]:= ' ';
   StringGrid_Executados.Cells[6,0]:= ' Aer';
   StringGrid_Executados.Cells[7,0]:= ' EB';
   StringGrid_Executados.Cells[8,0]:= ' MB';
   StringGrid_Executados.Cells[9,0]:= ' Civis';
   StringGrid_Executados.Cells[10,0]:= ' Est.';
   StringGrid_Executados.Cells[11,0]:= ' Outros';
   StringGrid_Executados.Cells[12,0]:= ' ';
   StringGrid_Executados.Cells[13,0]:= ' Homens';
   StringGrid_Executados.Cells[14,0]:= ' Mulheres';
   StringGrid_Executados.Cells[15,0]:= ' ';
   StringGrid_Executados.Cells[16,0]:= ' Deslig.';
   StringGrid_Executados.Cells[17,0]:= ' ';
   StringGrid_Executados.Cells[18,0]:= ' Instrutor';
   StringGrid_Executados.Cells[19,0]:= ' Coordenador';
   StringGrid_Executados.Cells[20,0]:= ' Técnico';
   StringGrid_Executados.Cells[21,0]:= ' Palestrante';
   StringGrid_Executados.Cells[22,0]:= ' Preparador';
   StringGrid_Executados.Cells[23,0]:= ' Sombra';
   StringGrid_Executados.Cells[24,0]:= ' Supervisor';
   StringGrid_Executados.Cells[25,0]:= ' Inst. Auxiliar';
   StringGrid_Executados.Cells[26,0]:= ' Coord. Instrutor';
   StringGrid_Executados.Cells[27,0]:= ' Piloto';
end;

procedure TForm_ConsultaCursosAndamento.StringGrid_ExecutadosDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
const
   LM = 10; {margem esquerda de cada célula}
   TM = 5; {margem superior de cada célula}
begin
   if ARow > 0 then
   begin
      if Funcoes.TestaParaPar(ARow) then
      begin
         StringGrid_Executados.Canvas.Brush.Color := clInfoBk;
         StringGrid_Executados.Canvas.Font.Color := clBlack;
      end
      else
      begin
         StringGrid_Executados.Canvas.Brush.Color := clWhite;
         StringGrid_Executados.Canvas.Font.Color := clBlack;
      end;
      StringGrid_Executados.Canvas.TextRect(Rect, Rect.Left + LM, Rect.Top + TM, StringGrid_Executados.Cells[Acol,Arow]);
   end;
end;

procedure TForm_ConsultaCursosAndamento.MaskEdit_CursoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      JvExpressButton_PesquisarClick( Sender);
end;

procedure TForm_ConsultaCursosAndamento.JvDateEdit_DataTerminoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      JvExpressButton_PesquisarClick( Sender);
end;

//------------------------------------------------------------------------------
// Rotina para retornar o numero de instrutores de acordo com a funcao
//------------------------------------------------------------------------------

Procedure TForm_ConsultaCursosAndamento.VerificarQtdInstrutor;
begin
   VI_Instrutor:= 0;
   VI_Coordenador:= 0;
   VI_Tecnico:= 0;
   VI_Palestrante:= 0;
   VI_Preparador:= 0;
   VI_Sombra:= 0;
   VI_Supervisor:= 0;
   VI_InstAuxiliar:= 0;
   VI_CoordInstrutor:= 0;
   VI_Piloto:= 0;

   if (DM.Query_Usuario.FieldByName('Secao').AsString = 'PAEL') Then
      Funcoes.OpenQuery('Select Funcao '+
                        ' From InstrutorTurma '+
                        ' Where IdCurso = 208'+
                        ' and IdTurma = '+IBQuery_TurmaExecutada.FieldbyName('IdTurma').AsString
                       )
   else
      Funcoes.OpenQuery('Select Funcao '+
                        ' From InstrutorTurma '+
                        ' Where IdCurso = '+IBQuery_TurmaExecutada.FieldbyName('IdCurso').AsString+
                        ' and IdTurma = '+IBQuery_TurmaExecutada.FieldbyName('IdTurma').AsString
                       );

   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.Eof do
   begin
   if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'INSTRUTOR' then
      VI_Instrutor:= VI_Instrutor+1
   else
      if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'COORDENADOR' then
         VI_Coordenador:= VI_Coordenador+1
      else
         if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'TÉCNICO' then
            VI_Tecnico:= VI_Tecnico+1
         else
            if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'PALESTRANTE' then
               VI_Palestrante:= VI_Palestrante+1
            else
               if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'PREPARADOR' then
                  VI_Preparador:= VI_Preparador+1
               else
                  if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'SOMBRA' then
                     VI_Sombra:= VI_Sombra+1
                  else
                     if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'SUPERVISOR' then
                        VI_Supervisor:= VI_Supervisor+1
                     else
                        if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'INSTRUTOR AUXILIAR' then
                           VI_InstAuxiliar:= VI_InstAuxiliar+1
                        else
                           if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'COORDENADOR INSTRUTOR' then
                              VI_CoordInstrutor:= VI_CoordInstrutor+1
                           else
                              if DM.IBQuery_Executa.FieldbyName('Funcao').AsString = 'SUPERVISOR' then
                                  VI_Piloto:= VI_Piloto+1;
   DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para permitir pesquisa quando for curso PAELs /Prosima
//------------------------------------------------------------------------------

procedure TForm_ConsultaCursosAndamento.JvCheckBox_Paels_Prosima(Sender: TObject);
var
   Status: Boolean;
begin
   if ((JvCheckBox_Paels.Checked = True) or (JvCheckBox_Prosima.Checked = True)) then
      Status:= True
   else
   begin
      Status:= False;
      JvCheckBox_ACC.Checked:= False;
      JvCheckBox_APP.Checked:= False;
      JvCheckBox_TWR3.Checked:= False;
      JvCheckBox_TWRs.Checked:= False;
      JvCheckBox_TWR180.Checked:= False;
   end;


   JvCheckBox_ACC.Visible:= Status;
   JvCheckBox_APP.Visible:= Status;
   JvCheckBox_TWR3.Visible:= Status;
   JvCheckBox_TWRs.Visible:= Status;
   JvCheckBox_TWR180.Visible:= Status;

end;


procedure TForm_ConsultaCursosAndamento.JvCheckBox_ACCClick(Sender: TObject);
begin
   JvCheckBox_APP.Checked:= False;
   JvCheckBox_TWR3.Checked:= False;
   JvCheckBox_TWRs.Checked:= False;
   JvCheckBox_TWR180.Checked:= False;
end;

procedure TForm_ConsultaCursosAndamento.JvCheckBox_APPClick(Sender: TObject);
begin
   JvCheckBox_ACC.Checked:= False;
   JvCheckBox_TWR3.Checked:= False;
   JvCheckBox_TWRs.Checked:= False;
   JvCheckBox_TWR180.Checked:= False;
end;

procedure TForm_ConsultaCursosAndamento.JvCheckBox_TWR3Click( Sender: TObject);
begin
   JvCheckBox_ACC.Checked:= False;
   JvCheckBox_APP.Checked:= False;
   JvCheckBox_TWRs.Checked:= False;
   JvCheckBox_TWR180.Checked:= False;
end;

procedure TForm_ConsultaCursosAndamento.JvCheckBox_TWRsClick(Sender: TObject);
begin
   JvCheckBox_ACC.Checked:= False;
   JvCheckBox_APP.Checked:= False;
   JvCheckBox_TWR3.Checked:= False;
   JvCheckBox_TWR180.Checked:= False;
end;

procedure TForm_ConsultaCursosAndamento.JvCheckBox_TWR180Click(Sender: TObject);
begin
   JvCheckBox_ACC.Checked:= False;
   JvCheckBox_APP.Checked:= False;
   JvCheckBox_TWR3.Checked:= False;
   JvCheckBox_TWRs.Checked:= False;
end;

end.
