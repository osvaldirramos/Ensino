//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGEW                                           //
//                                                                            //
// PROGRAMA                  : Sel_PTS_Novo.pas                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da relação  //
//                            do PTS Base novo cadastrado.                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Padilha                                    //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 06/10/2021                                     //
//                                                                            //
// OBSERVAÇÃO: O Status do instrutor pode se SELECIONADO,                     //
//                                           INDICADO                         //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Sel_PTS_Novo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, ExtCtrls, DB, IBCustomDataSet,
  ExportPack, IBQuery, Menus, IBTable, JvRichEd, JvDBRichEd, DBGrids,
  DBCtrls, JvTransBtn, Mask, JvToolEdit, JvDBCtrl, JvComponent, JvLookOut,
  Buttons, JvShape, JvGradient, ShellApi,
  ToolWin,  Rotinas_Validar, JvxCtrls, JvCheckBox, Rotinas, Rotinas_SUE, Rotinas_TrataData,
  JvEnterTab, JvCaptionPanel, QuickRpt, QRCtrls, ImgList;

type
  TForm_Sel_PTS_Novo = class(TForm)
    DST_PTS_Principal: TDataSource;
    IBTable_PTS_Principal: TIBTable;
    PopupMenu_Imprimir: TPopupMenu;
    Selecionado: TMenuItem;
    N1: TMenuItem;
    odos2: TMenuItem;
    Panel_BotoesProva: TPanel;
    Panel_AreaTrabalho: TPanel;
    IBQuery_PTS_Semana: TIBQuery;
    DSQ_PTS_Semana: TDataSource;
    IBTable_PTS_Semana: TIBTable;
    DST_PTS_Semana: TDataSource;
    StatusBar_Msg: TStatusBar;
    Panel_Botoes: TPanel;
    JvGradient_Botoes: TJvGradient;
    JvShape_Novo: TJvShape;
    JvTransparentButton_Novo: TJvTransparentButton;
    JvShape_Alterar: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape_Excluir: TJvShape;
    JvTransparentButton_Excluir: TJvTransparentButton;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape_PDF: TJvShape;
    JvTransparentButton_PDF: TJvTransparentButton;
    JvGradient_Menu: TJvGradient;
    Panel_Frame_SelCurso: TPanel;
    ComboBox_TipoTurma: TComboBox;
    JvShape_TipoTurma: TJvShape;
    IBTable_PTS_PrincipalIDCURSO: TSmallintField;
    IBTable_PTS_PrincipalIDTURMA: TIntegerField;
    IBTable_PTS_PrincipalIDPTS: TSmallintField;
    IBTable_PTS_PrincipalDATA: TDateTimeField;
    IBTable_PTS_PrincipalMSG: TIBStringField;
    IBTable_PTS_PrincipalCRIACAO: TDateTimeField;
    IBTable_PTS_PrincipalRESPONSAVEL: TIBStringField;
    Panel_semana: TPanel;
    JvShape1: TJvShape;
    Label5: TLabel;
    Label_Semanas: TLabel;
    Label6: TLabel;
    SpeedButton_Retorna: TSpeedButton;
    SpeedButton_Proximo: TSpeedButton;
    SpeedButton_Primeiro: TSpeedButton;
    SpeedButton_Ultimo: TSpeedButton;
    ComboBox_Semana: TComboBox;
    IBTable_PTS_base_Principal: TIBTable;
    DST_PTS_Base_Principal: TDataSource;
    IBTable_PTS_base_Semana: TIBTable;
    DST_PTS_base_Semana: TDataSource;
    Label2: TLabel;
    JvDBDateEdit_DataAtualizacao: TJvDBDateEdit;
    IBQuery_PTS_Indicacao: TIBQuery;
    DSQ_PTS_Indicacao: TDataSource;
    Panel1: TPanel;
    Panel_RelacaoInstrutores: TPanel;
    JvShape2: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    Panel3: TPanel;
    Label1: TLabel;
    JvDBRichEdit_Observacao: TJvDBRichEdit;
    IBTable_PTS_PrincipalARQUIVO_QUADRO_PERFIL: TIBStringField;
    IBTable_PTS_base_SemanaIDCURSO: TSmallintField;
    IBTable_PTS_base_SemanaIDSEMANA: TIntegerField;
    IBTable_PTS_base_SemanaDIA_SEMANA: TIBStringField;
    IBTable_PTS_base_SemanaHORARIO: TIBStringField;
    IBTable_PTS_base_SemanaTRAB_ESCOLAR: TIBStringField;
    IBTable_PTS_base_SemanaLOCAL: TIBStringField;
    IBTable_PTS_base_SemanaDISCIPLINA: TIBStringField;
    IBTable_PTS_base_SemanaQTD_INSTRUTOR: TIntegerField;
    IBTable_PTS_base_SemanaESPECIALIDADE: TIBStringField;
    IBTable_PTS_base_PrincipalIDCURSO: TSmallintField;
    IBTable_PTS_base_PrincipalRESPONSAVEL: TIBStringField;
    IBTable_PTS_base_PrincipalATUALIZACAO: TDateTimeField;
    IBTable_PTS_base_PrincipalANO: TIBStringField;
    IBTable_PTS_base_PrincipalMSG: TIBStringField;
    IBTable_PTS_base_PrincipalARQUIVO_QUADRO_PERFIL: TIBStringField;
    JvShape4: TJvShape;
    DBNavigator_PTS_Semana: TDBNavigator;
    IBTable_PTS_Relatorio: TIBTable;
    DataSource1: TDataSource;
    IBTable_PTS_RelatorioID: TIntegerField;
    IBTable_PTS_RelatorioDATA: TIBStringField;
    IBTable_PTS_RelatorioHORARIO: TIBStringField;
    IBTable_PTS_RelatorioDISCIPLINA: TIBStringField;
    IBTable_PTS_RelatorioTRAB_ESCOLAR: TIBStringField;
    IBTable_PTS_RelatorioLOCAL: TIBStringField;
    IBTable_PTS_RelatorioINSTRUTOR: TIBStringField;
    IBTable_PTS_RelatorioSEMANA: TIBStringField;
    PopupMenu_CadastrarInstrutor: TPopupMenu;
    CadastrarInstrutorParaTodosHorrios: TMenuItem;
    N2: TMenuItem;
    CadastrarSomenteParaoHorarioSelecionado: TMenuItem;
    PopupMenu_ExcluirInstrutor: TPopupMenu;
    MenuItem_Exclui_o_instrutor_de_todos_horarios: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem_Exclui_o_instrutor_somente_do_horario_selecionado: TMenuItem;
    IBQuery_PTS_IndicacaoIDCURSO: TSmallintField;
    IBQuery_PTS_IndicacaoIDPTS: TIntegerField;
    IBQuery_PTS_IndicacaoINSTRUTOR: TIBStringField;
    IBQuery_PTS_IndicacaoTRAB_ESCOLAR: TIBStringField;
    IBQuery_PTS_IndicacaoPOSTOGRADUACAO: TIBStringField;
    IBQuery_PTS_IndicacaoNOMEGUERRA: TIBStringField;
    IBQuery_PTS_IndicacaoIDUNIDADE: TIBStringField;
    IBQuery_PTS_IndicacaoSTATUS: TIBStringField;
    PopupMenu_Local: TPopupMenu;
    Inserir_o_Local_selecionado_em_todo_PTS: TMenuItem;
    InseriroLocalselecionadoemtodoPTS: TMenuItem;
    InseriroLocalselecionadoemnoTrabalhoEscolarselecionado: TMenuItem;
    DBGrid_Quadro_PTS: TDBGrid;
    N3: TMenuItem;
    Exclui_o_Instrutor_do_PTS: TMenuItem;
    IBQuery_PTS_IndicacaoIDTURMA: TIntegerField;
    Panel_Opcao: TPanel;
    Label_InformeLocal: TLabel;
    ComboBox_Local: TComboBox;
    JvTransparentButton_Inserir_Local: TJvTransparentButton;
    JvTransparentButton_Cancela_InsercaoLocal: TJvTransparentButton;
    PopupMenu_ExcluiPTS: TPopupMenu;
    MenuItem_Excluir_o_instrutor_no_Trabalho_Escolar_selecionado: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItemExcluir_somente_para_o_horario_selecionado: TMenuItem;
    IBQuery_PTS_IndicacaoIDINSTRUTOR: TIBStringField;
    PopupMenu_Horario: TPopupMenu;
    MenuItem_InserirHorarioNoHorarioSelecionado: TMenuItem;
    ComboBox_Horario: TComboBox;
    JvTransparentButton_InserirHorario: TJvTransparentButton;
    JvTransparentButton_CancelarHorario: TJvTransparentButton;
    Label_InformeHorario: TLabel;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    PopupMenu_PDF: TPopupMenu;
    MenuItem_PDF_Selecionado: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem_PDF_TodosApartirSelecionado: TMenuItem;
    ExportQR1: TExportQR;
    Panel2: TPanel;
    Label_Cadastro_Instruores: TLabel;
    DBGrid_Instrutor: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    JvTransparentButton_Cadastrar: TJvTransparentButton;
    Panel6: TPanel;
    JvTransparentButton_ExcluirInstrutor: TJvTransparentButton;
    IBQuery_PTS_IndicacaoINSERIR: TIBStringField;
    IBQuery_PTS_IndicacaoEXCLUIR: TIBStringField;
    Panel7: TPanel;
    Panel8: TPanel;
    IBQuery_PTS_SemanaIDCURSO: TSmallintField;
    IBQuery_PTS_SemanaIDTURMA: TIntegerField;
    IBQuery_PTS_SemanaIDPTS: TIntegerField;
    IBQuery_PTS_SemanaIDSEMANA: TIntegerField;
    IBQuery_PTS_SemanaDIA_SEMANA: TIBStringField;
    IBQuery_PTS_SemanaHORARIO: TIBStringField;
    IBQuery_PTS_SemanaTRAB_ESCOLAR: TIBStringField;
    IBQuery_PTS_SemanaLOCAL: TIBStringField;
    IBQuery_PTS_SemanaDATA: TIBStringField;
    IBQuery_PTS_SemanaDISCIPLINA: TIBStringField;
    IBTable_PTS_SemanaIDPTS: TIntegerField;
    IBTable_PTS_SemanaIDSEMANA: TIntegerField;
    IBTable_PTS_SemanaDIA_SEMANA: TIBStringField;
    IBTable_PTS_SemanaHORARIO: TIBStringField;
    IBTable_PTS_SemanaTRAB_ESCOLAR: TIBStringField;
    IBTable_PTS_SemanaLOCAL: TIBStringField;
    IBTable_PTS_SemanaDATA: TIBStringField;
    IBTable_PTS_SemanaDISCIPLINA: TIBStringField;
    IBTable_PTS_SemanaESPECIALIDADE: TIBStringField;
    IBTable_PTS_SemanaQTD_INSTRUTOR: TIntegerField;
    Label_Semana: TLabel;
    ComboBox_Dia_Semana: TComboBox;
    MaskEdit_Data: TMaskEdit;
    PopupMenu_Trabalho_Escolar: TPopupMenu;
    MenuItem_Trabalho_Escolar: TMenuItem;
    N4: TMenuItem;
    Excluir_PTS: TMenuItem;
    N5: TMenuItem;

    procedure ExcluirInstrutor(VS_Where: String);

    procedure TratarExclusaoDoPTS(Opcao: String);
    procedure TratarSelecaoLocal(Opcao: String);
    Procedure AlimentaComboBox_Local;
    procedure GravaRelatorio(VI_Id: Integer; DATA, HORARIO, DISCIPLINA, TRAB_ESCOLAR, LOCAL, INSTRUTOR, SEMANA : String);
    procedure Montar_PTS;

    Function AcharData: String;

    procedure TratarBotoes(Status: Boolean);
    procedure TrataSemanas;
    Procedure TravaSelecaoCurso;

    procedure FormActivate(Sender: TObject);
    procedure ComboBox_SemanaChange(Sender: TObject);
    procedure SpeedButton_RetornaClick(Sender: TObject);
    procedure SpeedButton_ProximoClick(Sender: TObject);
    procedure SpeedButton_PrimeiroClick(Sender: TObject);
    procedure SpeedButton_UltimoClick(Sender: TObject);
    procedure SelecionadoClick(Sender: TObject);
    procedure odos2Click(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure DBGrid_Quadro_PTSDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvTransparentButton_NovoClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JvExpressButton_PTSBaseClick(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure CadastrarInstrutorParaTodosHorriosClick(Sender: TObject);
    procedure CadastrarSomenteParaoHorarioSelecionadoClick(Sender: TObject);
    procedure MenuItem_Exclui_o_instrutor_de_todos_horariosClick(Sender: TObject);
    procedure MenuItem_Exclui_o_instrutor_somente_do_horario_selecionadoClick(Sender: TObject);
    procedure Inserir_o_Local_selecionado_em_todo_PTSClick(Sender: TObject);
    procedure InseriroLocalselecionadoemtodoPTSClick(Sender: TObject);
    procedure InseriroLocalselecionadoemnoTrabalhoEscolarselecionadoClick(Sender: TObject);
    procedure Exclui_o_Instrutor_do_PTSClick(Sender: TObject);
    procedure JvTransparentButton_Inserir_LocalClick(Sender: TObject);
    procedure JvTransparentButton_Cancela_InsercaoLocalClick(Sender: TObject);
    procedure MenuItem_Excluir_o_instrutor_no_Trabalho_Escolar_selecionadoClick(Sender: TObject);
    procedure MenuItemExcluir_somente_para_o_horario_selecionadoClick(Sender: TObject);
    procedure MenuItem_InserirHorarioNoHorarioSelecionadoClick(Sender: TObject);
    procedure JvTransparentButton_InserirHorarioClick(Sender: TObject);
    procedure JvTransparentButton_CancelarHorarioClick(Sender: TObject);
    procedure MenuItem_PDF_SelecionadoClick(Sender: TObject);
    procedure MenuItem_PDF_TodosApartirSelecionadoClick(Sender: TObject);
    procedure JvTransparentButton_CadastrarClick(Sender: TObject);
    procedure MenuItem_Trabalho_EscolarClick(Sender: TObject);
    procedure Excluir_PTSClick(Sender: TObject);
  private    { Private declarations }
//     VS_CodCurso: String;
  public    { Public declarations }
     VI_SemanaAtual: Integer;
     VS_Opcao: String;
  end;

var
  Form_Sel_PTS_Novo: TForm_Sel_PTS_Novo;

implementation

uses Module, Rel_PTSBase, Rel_ProgramaDeTrabalhoSemanal, Cad_PTS_Novo,
  Frame_Sel_Curso, Cad_PTS_Indicacao, PTS_Novo_Carga, Rel_PTS_Novo,
  MenuPrincipal, Sel_Disciplina;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento na criacao do Form
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.FormCreate(Sender: TObject);
begin
   SetWindowLong(Application.Handle,GWL_EXSTYLE,
   GetWindowLong(Application.Handle, GWL_EXSTYLE)
   or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
end;
                                                                     
//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'SelTurma')) then
   begin
      if Form_MenuPrincipal.VS_IdTurma = '0' then
      begin
         ShowMessage('NÃo foi selecionado a turma');
         close;
      end;

      Panel_Opcao.Visible:= False;

      JvGradient_Menu.StartColor:= Cor_Tela;
      JvGradient_Botoes.StartColor:= Cor_Tela;
      Form_Sel_PTS_Novo.Color:= Cor_Tela;

      VS_Opcao:= 'Consultar';

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - PTS');    // Abre o perfil do usuario em relacao a agenda
      Funcoes.CabecalhoForm( Form_Sel_PTS_Novo, ' PTS - Novo ( Plano de Trabalho Semanal )');

      Form_Sel_PTS_Novo.Left:= 10;
      Form_Sel_PTS_Novo.Top:= 33;

      TratarBotoes(True);

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Sel_PTS_Novo.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Inserir PTS Base', 'Inserir PTS da turma Base para Turma selecionada');

//      Frame_SelCurso := TFrame_SelCurso.Create(nil);
//      Frame_SelCurso.Parent := Form_Sel_PTS_Novo.Panel_Frame_SelCurso;
//      Frame_SelCurso.TrataCurso('Cadastro', ComboBox_TipoTurma.Text);

   Funcoes_SUE.AlimentaComboBox(ComboBox_Dia_Semana, 'Dia_Semana', 'PTS_DIA_SEMANA', '', 'id');
   Funcoes_SUE.AlimentaComboBox(ComboBox_Local, 'CodSala', 'SalaAula', '', 'CodSala');

//      AlimentaComboBox_Local;
      Funcoes.SetCadCurso('CadCurso');

      IBTable_PTS_Principal.Open;
      IBTable_PTS_Semana.Open;

      TrataSemanas;
   end;
end;


//------------------------------------------------------------------------------
// Tratamento do Botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_WindowsClick( Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para tratar o travamento da selecao do Curso
//------------------------------------------------------------------------------

Procedure TForm_Sel_PTS_Novo.TravaSelecaoCurso;
begin
   TratarBotoes(True);
   Label_Semanas.Caption:= '0';
   ComboBox_Semana.Text:= '0';
   SpeedButton_Primeiro.Enabled:= False;
   SpeedButton_Retorna.Enabled:= False;
   SpeedButton_Proximo.Enabled:= False;
   SpeedButton_Proximo.Enabled:= False;
   SpeedButton_Ultimo.Enabled:= False;

   Funcoes.TratarJvTransparentButton(JvTransparentButton_Novo, JvShape_Novo, False);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Alterar, JvShape_Alterar, False);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Excluir, JvShape_Excluir, False);

   ComboBox_Semana.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da semana
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.ComboBox_SemanaChange(Sender: TObject);
begin
   Label_Semana.Caption:= 'Semana: '+ComboBox_Semana.Text;
   Funcoes.ExecutaQuery(DM.IBQuery_Executa, ' select p.idCurso, p.IdTurma '+
                                                  ' From pts_principal p'+
                                                  ' Where p.idcurso = '+Form_MenuPrincipal.VS_IdCurso+
                                                  ' and   p.idturma = '+Form_MenuPrincipal.VS_IdTurma
                             );

   if DM.IBQuery_Executa.FieldByName('idCurso').AsString = '' then
         Funcoes.ExecutaQuery(IBQuery_PTS_Semana, ' select p.idCurso, p.IdTurma, 0 as IdPts, '+
                                                  ' 0 as idsemana, '+
                                                  ' Cast( '+#39+#39+' As Char(10)) as dia_semana, '+
                                                  ' Cast( '+#39+#39+' As Char(11)) as horario, '+
                                                  ' Cast( '+#39+#39+' As Char(7)) as trab_escolar, '+
                                                  ' Cast( '+#39+#39+' As Char(7)) as local, '+
                                                  ' Cast( '+#39+#39+' As Char(10)) as Data, '+
                                                  ' Cast( '+#39+#39+' As Char(6)) as Disciplina'+
                                                  ' From pts_principal p, pts_semana s '+
                                                  ' Where p.idcurso = '+Form_MenuPrincipal.VS_IdCurso+
                                                  ' and   p.idturma = '+Form_MenuPrincipal.VS_IdTurma
                             )
   else
         Funcoes.ExecutaQuery(IBQuery_PTS_Semana, ' select p.idCurso, p.IdTurma, s.IdPts, s.idsemana, s.dia_semana, s.horario, s.trab_escolar, s.local,  s.Data, s.Disciplina '+
                                                  ' From pts_principal p, pts_semana s '+
                                                  ' Where p.idcurso = '+Form_MenuPrincipal.VS_IdCurso+
                                                  ' and   p.idturma = '+Form_MenuPrincipal.VS_IdTurma+
                                                  ' and   p.IdPts = s.IdPts '+
                                                  ' and s.IdSemana = '+ComboBox_Semana.Text+
                                                  ' Order by s.IdSemana, s.dia_semana, s.horario '
                             );

   Funcoes.AtualizaQuery(IBQuery_PTS_Indicacao);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.TratarBotoes(Status: Boolean);
begin
   if Label_Semanas.Caption = '0' then
      Status:= False;

   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;

   if Funcoes.GetAcesso = 'A' then
   begin
      JvTransparentButton_Alterar.Enabled:= Status;
      JvTransparentButton_Novo.Enabled:= Status;
//      JvExpressButton_PTSBase.Enabled:= Status;
   end
   else
   begin
      if ((DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'S') or ( DM.Query_PerfilAcesso.FieldByName('Alterar').AsString = 'S')) then
      begin
         JvTransparentButton_Alterar.Enabled:= Status;
         JvTransparentButton_Novo.Enabled:= Status;
         JvTransparentButton_Excluir.Enabled:= Status;
//         JvExpressButton_PTSBase.Enabled:= Status;

         JvTransparentButton_Cadastrar.Enabled:= Status;
         JvTransparentButton_ExcluirInstrutor.Enabled:= Status;

      end
      else
      begin
         JvTransparentButton_Alterar.Enabled:= False;
         JvTransparentButton_Novo.Enabled:= False;
         JvTransparentButton_Excluir.Enabled:= False;
//         JvExpressButton_PTSBase.Enabled:= False;

         JvTransparentButton_Cadastrar.Enabled:= False;
         JvTransparentButton_ExcluirInstrutor.Enabled:= False;
      end;
   end;

   JvTransparentButton_PDF.Enabled:= Status;
   JvTransparentButton_Imprimir.Enabled:= Status;

end;


procedure TForm_Sel_PTS_Novo.SelecionadoClick(Sender: TObject);
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
      if (trim(ComboBox_Semana.Text) = '') then
      begin
         ShowMessage('Não foi selecionada semana...');
         ComboBox_Semana.SetFocus;
      end
      else
      begin
         Montar_PTS;
         Form_Rel_PTS_Novo.QuickRep1.Preview;
      end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar o relatorio com todos PTSs
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.odos2Click(Sender: TObject);
var
    VS_IdPTS: String;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      if IBTable_PTS_Principal.FieldByName('IDPTS').AsString = '' then
         VS_IdPTS:= ''
      else
         VS_IdPTS:= ' and s.IdPts =  '+IBTable_PTS_Principal.FieldByName('IDPTS').AsString;

      Funcoes.ExecutaQuery( IBQuery_PTS_Semana,'select p.idCurso, p.IdTurma, s.IdPts, s.idsemana, s.dia_semana, s.horario, s.trab_escolar, s.local,  s.Data, s.Disciplina, s.Especialidade, s.Qtd_Instrutor '+
                                               ' From pts_principal p, pts_semana s '+
                                               ' Where p.idcurso = '+DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString+
                                               ' and   p.idturma = '+DM.IBQuery_MontaTurma.FieldByName('idturma').AsString+
                                               ' and   p.IdPts = s.IdPts '+
                                               VS_IdPTS+
                                               ' Order by s.IdSemana, s.dia_semana, s.horario '
                          );

      Montar_PTS;
      Form_Rel_PTS_Novo.QuickRep1.Preview;
      ComboBox_SemanaChange(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar o PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.DBGrid_Quadro_PTSDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if VS_Opcao = 'Consultar' then
   begin
      if (IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString = 'FERIADO') then
         DBGrid_Quadro_PTS.Canvas.Brush.Color:= clRed
      else
      begin
         if IBQuery_PTS_Semana.FieldByName('Data').AsString <> '' then
            Funcoes.OpenQuery('Select * From Cad_Feriados where Data = '+#39+Funcoes.DePara(IBQuery_PTS_Semana.FieldByName('Data').AsString, '/', '.')+' 00:00'+#39)
         else
            Funcoes.OpenQuery('Select * From Cad_Feriados where Data = '+#39+'01.01.1970 00:00'+#39);

         if DM.IBQuery_Executa.FieldByName('Data').AsString <> '' then
            DBGrid_Quadro_PTS.Canvas.Brush.Color:= clRed
         else
            if ((IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString = '2º Feira') or
                (IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString = '4º Feira') or
                (IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString = '6º Feira')) then
               DBGrid_Quadro_PTS.Canvas.Brush.Color:= $00FFE8B7
            else
               DBGrid_Quadro_PTS.Canvas.Brush.Color:= clSilver;
      end;
      if gdSelected in State then
          DBGrid_Quadro_PTS.Canvas.Brush.Color := clHighlight;

      DBGrid_Quadro_PTS.Canvas.FillRect(Rect);
      DBGrid_Quadro_PTS.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar inserir PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_NovoClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   Form_Cad_PTS_Novo.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar Alterar PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_AlterarClick( Sender: TObject);
begin
   if IBQuery_PTS_Semana.FieldByName('IdPts').AsString = '' then
   begin
       ShowMessage('Não possuí PTS cadastrado...');
   end
   else
   begin
      VS_Opcao:= 'Alterar';
      Form_Cad_PTS_Novo.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Tratar Excusão do PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.TratarExclusaoDoPTS(Opcao: String);
var
   VI_Retorno: Integer;
   VS_Comando: String;
   Sender: TObject;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      VI_Retorno:= Application.MessageBox('Confirma a Exclusão do PTS(s) Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         VS_Comando:= '';

         if Opcao = 'Excluir o Trabalho Escolar selecionado' then
            VS_Comando:= VS_Comando +' Where IdPTS =  '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                                     ' and   Trab_Escolar = '+#39+IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39
         else
            if Opcao = 'Excluir somente para o horario selecionado' then
               VS_Comando:= VS_Comando +' Where IdPTS =  '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                                        ' and   IdSemana = '+#39+IBQuery_PTS_Semana.FieldByName('IdSemana').AsString+#39+
                                        ' and   Dia_Semana = '+#39+IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString+#39+
                                        ' and   Horario = '+#39+IBQuery_PTS_Semana.FieldByName('Horario').AsString+#39+
                                        ' and   Trab_Escolar = '+#39+IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39;

         if VS_Comando <> '' then
         begin
            Funcoes.ExecusaoQuery( 'delete  From  pts_semana '+VS_Comando );
            JvTransparentButton_AtualizarClick(Sender);
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Modulo para Excluir o instrutor no Trabalho Escolar selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.MenuItem_Excluir_o_instrutor_no_Trabalho_Escolar_selecionadoClick(Sender: TObject);
begin
   TratarExclusaoDoPTS('Excluir o instrutor no Trabalho Escolar selecionado' );
end;

//------------------------------------------------------------------------------
// Modulo para Excluir somente para o horario selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.MenuItemExcluir_somente_para_o_horario_selecionadoClick(Sender: TObject);
begin
   TratarExclusaoDoPTS('Excluir somente para o horario selecionado' );
end;


//------------------------------------------------------------------------------
// Monta as semanas para selecao
//--
// Trata as semanas referente ao Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.TrataSemanas;
var
   Div_semanas, Vi_Semanas: Real;
   VI_SemIni, VI_SemAtual, VI_SemanaAtual, i: Integer;

   Sender: TObject;
begin
   if DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString = '' then
   begin
      VI_SemIni:= 0;
      VI_SemAtual:= 0;
      Vi_Semanas:= 0;
   end
   else
   begin
      VI_SemIni:= Funcoes.SemanaAno(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsString);
      VI_SemAtual:= Funcoes.SemanaAno(DateToStr(Date));

      VI_SemanaAtual:= (VI_SemAtual - VI_SemIni)+1;

      if VI_SemanaAtual <= 0 then
         VI_SemanaAtual:= 1;


      Vi_Semanas:= DM.IBQuery_MontaTurma.FieldByName('DataTermino').AsDateTime - DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime;
      Div_semanas:= Vi_Semanas/7;
      VI_Semanas:= Round(Vi_Semanas/7);

      if Div_Semanas > VI_Semanas then
         Vi_Semanas:= Vi_Semanas+1;

      ComboBox_Semana.Items.Clear;
      if VI_SemanaAtual > VI_Semanas then
         VI_SemanaAtual:= StrToInt(FloatToStr(VI_Semanas));

      i:= 1;
      if ((ComboBox_TipoTurma.Text = 'Em Andamento') or (ComboBox_TipoTurma.Text = 'Default') or (ComboBox_TipoTurma.Text = 'Default-in')) then
         ComboBox_Semana.Text:= IntToStr(VI_SemanaAtual)
      else
         ComboBox_Semana.Text:= IntToStr(1);
//      JvxLabel_Semana.Caption:= 'Semana: '+trim(ComboBox_Semana.Text);

      While i <= VI_Semanas do
      begin
         ComboBox_Semana.Items.Add(IntToStr(i));
         i:= i+1;
      end;

      Label_Semanas.Caption:= IntToStr(i-1);
   end;

   ComboBox_SemanaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.SpeedButton_RetornaClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= IntToStr(StrToInt(ComboBox_Semana.Text)-1);
   if StrToInt(ComboBox_Semana.Text) < 1 then
      ComboBox_Semana.Text:= '1';

   ComboBox_SemanaChange(Sender);
end;

//------------------------------------------------------------------------------
//
// Tratamento dos botoes de controle da semana
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Botao Proximo
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.SpeedButton_ProximoClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= IntToStr(StrToInt(ComboBox_Semana.Text)+1);
   if StrToInt(ComboBox_Semana.Text) > StrToInt(Label_Semanas.Caption) then
      ComboBox_Semana.Text:= Label_Semanas.Caption;

   ComboBox_SemanaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Primeiro
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.SpeedButton_PrimeiroClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= '1';
   ComboBox_SemanaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Ultimo
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.SpeedButton_UltimoClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= Label_Semanas.Caption;
   ComboBox_SemanaChange(Sender);
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da inserção do PTS Base no PTS da turma atual
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvExpressButton_PTSBaseClick(Sender: TObject);
var
   VI_Retorno: Integer;

   VB_Status: Boolean;
begin
   VB_Status:= True;

   Funcoes.OpenQuery( ' Select count(1) as Qtd '+
                      ' From PTS_Principal '+
                      ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                      ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                    );

   if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      VI_Retorno:= Application.MessageBox('Já existe PTS inserido na turma selecionada'+#13+'Se for feita atualização os dados atuais serão perdidos.'+#13+
                                          'Deseja realmente atualizr a Turma com a Turma Base ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
         Funcoes.ExecusaoQuery( ' Delete From PTS_Principal '+
                                ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                              )
      else
         VB_Status:= False;
   end;

   if VB_Status then
   begin
      IBTable_PTS_base_Principal.Open;
      IBTable_PTS_base_Semana.Open;

      if IBTable_PTS_base_Principal.FieldByName('IdCurso').AsString = '' then
          ShowMessage('Não possuí PTS Base cadastrado...')
      else
      begin
         //--- Tratamento da carga do PTS - Principal

         Funcoes.ExecusaoQuery('Insert into PTS_Principal (IdCurso, IdTurma, Data, MSG, Criacao, Responsavel, Arquivo_Quadro_Perfil) '+
                               ' Values ('+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+', '+
                                           DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+', '+
                                           Aspas+Funcoes.TratarData(DateToStr(Date))+Aspas+', '+
                                           Aspas+IBTable_PTS_base_Principal.FieldByName('MSG').AsString+Aspas+', '+
                                           Aspas+Funcoes.TratarData(DateToStr(Date))+Aspas+', '+
                                           Aspas+Funcoes.GetUsuario+Aspas+', '+
                                           Aspas+IBTable_PTS_base_Principal.FieldByName('Arquivo_Quadro_Perfil').AsString+Aspas+
                                        ')'
                              );

         IBTable_PTS_Principal.Close;
         IBTable_PTS_Principal.Open;

         //--- Tratamento para pegar o IdPTS

         Funcoes.OpenQuery( ' select idCurso, IdTurma, IdPts '+
                            ' From PTS_Principal '+
                            ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                            ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString
                          );

         //--- Tratamento da carga do PTS - Semana

         IBTable_PTS_base_Semana.First;
         While not IBTable_PTS_base_Semana.Eof do
         begin
            IBTable_PTS_Semana.Append;
            IBTable_PTS_Semana.FieldByName('IDPTS').AsString:= DM.IBQuery_Executa.FieldByName('IDPTS').AsString;
            IBTable_PTS_Semana.FieldByName('IDSEMANA').AsString:= IBTable_PTS_base_Semana.FieldByName('IDSEMANA').AsString;
            IBTable_PTS_Semana.FieldByName('DATA').AsString:= AcharData;
            IBTable_PTS_Semana.FieldByName('DIA_SEMANA').AsString:= IBTable_PTS_base_Semana.FieldByName('DIA_SEMANA').AsString;
            IBTable_PTS_Semana.FieldByName('HORARIO').AsString:= IBTable_PTS_base_Semana.FieldByName('HORARIO').AsString;
            IBTable_PTS_Semana.FieldByName('TRAB_ESCOLAR').AsString:= IBTable_PTS_base_Semana.FieldByName('TRAB_ESCOLAR').AsString;
            IBTable_PTS_Semana.FieldByName('LOCAL').AsString:= IBTable_PTS_base_Semana.FieldByName('LOCAL').AsString;
            IBTable_PTS_Semana.FieldByName('DISCIPLINA').AsString:= IBTable_PTS_base_Semana.FieldByName('DISCIPLINA').AsString;
            IBTable_PTS_Semana.FieldByName('QTD_INSTRUTOR').AsString:= IBTable_PTS_base_Semana.FieldByName('QTD_INSTRUTOR').AsString;
            IBTable_PTS_Semana.FieldByName('ESPECIALIDADE').AsString:= IBTable_PTS_base_Semana.FieldByName('ESPECIALIDADE').AsString;
            IBTable_PTS_Semana.Post;

            IBTable_PTS_base_Semana.Next;
         end;

         Funcoes.ExecutaTransacao;

         IBTable_PTS_base_Principal.Open;
         IBTable_PTS_base_Semana.Open;

//         Funcoes.AtualizaQuery(IBQuery_PTS_Semana);
         ComboBox_SemanaChange(Sender);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da Caixa de Selecao de Disciplina
//------------------------------------------------------------------------------

Function TForm_Sel_PTS_Novo.AcharData: String;
var
   VI_Dia_Semana, VI_Semana: Integer;
begin
   if ComboBox_Semana.Text = '' then
       VI_Dia_Semana:= 0
   else
      VI_Dia_Semana:= StrToInt(Copy(IBTable_PTS_base_Semana.FieldByName('Dia_Semana').AsString,1,1))-2;      // 2ºFEIRA - O menos 2 em o objetivo de zerar a segunda feira

      //      VI_Dia_Semana:= StrToInt(Copy(DBComboBox_Dia_Semana.Text,1,1))-2;      // 2ºFEIRA - O menos 2 em o objetivo de zerar a segunda feira

   VI_Semana:= StrToInt(IBTable_PTS_base_Semana.FieldByName('IdSemana').AsString) - 1;
   VI_Semana:= VI_Semana*7 + VI_Dia_Semana;

   AcharData:= DateToStr(DM.IBQuery_MontaTurma.FieldByName('DataInicio').AsDateTime+VI_Semana);;
end;

//------------------------------------------------------------------------------
// Tratamento para Cadastrar Somente para o Todos Horario
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.CadastrarInstrutorParaTodosHorriosClick(Sender: TObject);
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      if VS_Opcao = 'Consultar' then
      begin
         VS_Opcao:= 'Cadastrar o instrutor no Trabalho Escolar selecionado';
         Form_Cad_PTS_Indicacao.ShowModal;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Cadastrar Somente para o Horario selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.CadastrarSomenteParaoHorarioSelecionadoClick(Sender: TObject);
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      if VS_Opcao = 'Consultar' then
      begin
         VS_Opcao:= 'Cadastrar somente para o horario selecionado';
         Form_Cad_PTS_Indicacao.ShowModal;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para atualizar as tabelas
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_PTS_Semana);
   Funcoes.AtualizaQuery(IBQuery_PTS_Indicacao);
end;

//------------------------------------------------------------------------------
// Tratamento para atualizar as tabelasda semana
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.GravaRelatorio(VI_Id: Integer; DATA, HORARIO, DISCIPLINA, TRAB_ESCOLAR, LOCAL, INSTRUTOR, SEMANA : String);
begin
   IBTable_PTS_Relatorio.Append;
   IBTable_PTS_Relatorio.FieldByName('ID').AsInteger:= VI_Id;
   IBTable_PTS_Relatorio.FieldByName('DATA').AsString:= DATA;
   IBTable_PTS_Relatorio.FieldByName('HORARIO').AsString:= HORARIO;
   IBTable_PTS_Relatorio.FieldByName('DISCIPLINA').AsString:= DISCIPLINA;
   IBTable_PTS_Relatorio.FieldByName('TRAB_ESCOLAR').AsString:= TRAB_ESCOLAR;
   IBTable_PTS_Relatorio.FieldByName('LOCAL').AsString:= LOCAL;
   IBTable_PTS_Relatorio.FieldByName('INSTRUTOR').AsString:= INSTRUTOR;
   IBTable_PTS_Relatorio.FieldByName('SEMANA').AsString:= SEMANA;
   IBTable_PTS_Relatorio.Post;

   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento para montar o relatorio do PTS  48
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.Montar_PTS;
var
   VI_Opcao, VI_Id, VI_Cont, Linha, x : Integer;
   VS_Data, VS_Semana, VS_Instrutor: String;
   bookmark : tbookmarkstr;
begin
   IBTable_PTS_Relatorio.Open;
   IBQuery_PTS_Indicacao.Close;
   IBQuery_PTS_Indicacao.Open;

   //---- Limpar a tabela de relatorio

   Funcoes.ExecusaoQuery( 'delete from PTS_Relatorio ' );

   //---- Inicia o processamento

   bookmark := IBQuery_PTS_Semana.Bookmark;
  //   IBQuery_PTS_Semana.DisableControls;

   IBQuery_PTS_Semana.Close;
   IBQuery_PTS_Semana.Open;

   IBQuery_PTS_Semana.First;

   VI_Cont:= 0;
   VI_Id:= 0;
   VI_Opcao:= 1;
   VS_Data:= IBQuery_PTS_Semana.FieldByName('data').AsString;
   VS_Semana:= '';
   VS_Semana:= IBQuery_PTS_Semana.FieldByName('IdSemana').AsString;
   While not IBQuery_PTS_Semana.eof do
   begin
      if VS_Semana <> IBQuery_PTS_Semana.FieldByName('IdSemana').AsString then
      begin
         VI_Opcao:= 1;
         VS_Semana:= IBQuery_PTS_Semana.FieldByName('IdSemana').AsString;
      end;

      IBQuery_PTS_Indicacao.First;
      VS_Instrutor:= IBQuery_PTS_Indicacao.FieldByName('Instrutor').AsString;
      IBQuery_PTS_Indicacao.Next;

      VI_Id:= VI_Id + 1;

      if VI_Opcao = 1 then   //--- Primeira linha não entra informacao semana
      begin
         if VI_Cont <> 0 then
         begin
            Linha:= (48-VI_Cont)+1;

            For x:= 1 to Linha do
            begin
               VI_Id:= VI_Id + 1;
               GravaRelatorio(VI_Id, '',
                                     '',
                                     '',
                                     '',
                                     '',
                                     '',
                                     ''
                             );
            end;
            VI_Cont:= 0;
         end;

         VI_Id:= VI_Id + 1;
         VI_Cont:= VI_Cont + 1;
         GravaRelatorio(VI_Id, 'Semana: '+IBQuery_PTS_Semana.FieldByName('IdSemana').AsString,
                               '',
                               '',
                               '',
                               '',
                               '',
                               'Semana'
                       );

//         VI_Id:= VI_Id + 1;
//         VI_Cont:= VI_Cont + 1;
//            GravaRelatorio(VI_Id, IBQuery_PTS_Semana.FieldByName('data').AsString,
//                               IBQuery_PTS_Semana.FieldByName('Horario').AsString,
//                               IBQuery_PTS_Semana.FieldByName('Disciplina').AsString,
//                               IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString,
//                               IBQuery_PTS_Semana.FieldByName('Local').AsString,
 //                              VS_Instrutor,
 //                              IBQuery_PTS_Semana.FieldByName('dia_Semana').AsString
 //                      );
         VI_Opcao:= 2;
      end
      else
      begin
         if VI_Opcao = 2 then   //--- Primeira linha não entra informacao semana
         begin
            VI_Cont:= VI_Cont + 1;
               GravaRelatorio(VI_Id, IBQuery_PTS_Semana.FieldByName('data').AsString,
                                  IBQuery_PTS_Semana.FieldByName('Horario').AsString,
                                  IBQuery_PTS_Semana.FieldByName('Disciplina').AsString,
                                  IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString,
                                  IBQuery_PTS_Semana.FieldByName('Local').AsString,
                                  VS_Instrutor,
                                  IBQuery_PTS_Semana.FieldByName('dia_Semana').AsString
                          );
            VI_Opcao:= 3;
         end
         else
         begin
            if VI_Opcao = 3 then   //--- Primeira linha não entra informacao semana
            begin
               VI_Cont:= VI_Cont + 1;
                  GravaRelatorio(VI_Id, IBQuery_PTS_Semana.FieldByName('dia_Semana').AsString,
//               GravaRelatorio(VI_Id, '111 ',
                                     IBQuery_PTS_Semana.FieldByName('Horario').AsString,
                                     IBQuery_PTS_Semana.FieldByName('Disciplina').AsString,
                                     IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString,
                                     IBQuery_PTS_Semana.FieldByName('Local').AsString,
                                     VS_Instrutor,
                                     IBQuery_PTS_Semana.FieldByName('dia_Semana').AsString
                             );
               VI_Opcao:= 4;
            end
            else
            begin
               VI_Cont:= VI_Cont + 1;
               GravaRelatorio(VI_Id, ' 222',
                                     IBQuery_PTS_Semana.FieldByName('Horario').AsString,
                                     IBQuery_PTS_Semana.FieldByName('Disciplina').AsString,
                                     IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString,
                                     IBQuery_PTS_Semana.FieldByName('Local').AsString,
                                     VS_Instrutor,
                                     IBQuery_PTS_Semana.FieldByName('dia_Semana').AsString
                             );
            end;
         end;
      end;

      While not IBQuery_PTS_Indicacao.Eof do
      begin
         VI_Id:= VI_Id + 1;
         GravaRelatorio(VI_Id, ' ',
                               '',
                               '',
                               '',
                               '',
                               IBQuery_PTS_Indicacao.FieldByName('Instrutor').AsString,
                              IBQuery_PTS_Semana.FieldByName('dia_Semana').AsString
                       );

         IBQuery_PTS_Indicacao.Next;
      end;

      if VS_Data <> IBQuery_PTS_Semana.FieldByName('data').AsString then
      begin
         VS_Data:= IBQuery_PTS_Semana.FieldByName('data').AsString;
         VI_Opcao:= 2;
      end;

      Funcoes.ExecutaTransacao;
      IBQuery_PTS_Semana.Next;
   end;

  IBQuery_PTS_Semana.Bookmark := bookmark;
end;

//------------------------------------------------------------------------------
// Tratamento da exclusão do instrutor de todos horários pelo Trabalho Escolar selecionado

procedure TForm_Sel_PTS_Novo.MenuItem_Exclui_o_instrutor_de_todos_horariosClick(Sender: TObject);
var
   VI_Retorno: Integer;
   VS_Msg: String;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin

      VS_Msg:= MenuItem_Exclui_o_instrutor_de_todos_horarios.Caption+ ' ?';
      VI_Retorno:= Application.MessageBox(PChar(VS_Msg ), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         if IBQuery_PTS_Indicacao.FieldByName('IdInstrutor').AsString <> '' then
             ExcluirInstrutor(' Where IdPTS =  '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                              ' and   Trab_Escolar = '+#39+IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39+
                              ' and   IdInstrutor  = '+#39+IBQuery_PTS_Indicacao.FieldByName('IdInstrutor').AsString+#39
                              );
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da exclusão somente para o horario selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.MenuItem_Exclui_o_instrutor_somente_do_horario_selecionadoClick(Sender: TObject);
var
   VI_Retorno: Integer;
   VS_Msg: String;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      VS_Msg:= MenuItem_Exclui_o_instrutor_somente_do_horario_selecionado.Caption+ ' ?';
      VI_Retorno:= Application.MessageBox(PChar(VS_Msg ), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         if IBQuery_PTS_Indicacao.FieldByName('IdInstrutor').AsString <> '' then
             ExcluirInstrutor(' Where IdPTS =  '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                              ' and   IdSemana = '+#39+IBQuery_PTS_Semana.FieldByName('IdSemana').AsString+#39+
                              ' and   Dia_Semana = '+#39+IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString+#39+
                              ' and   Horario = '+#39+IBQuery_PTS_Semana.FieldByName('Horario').AsString+#39+
                              ' and   Trab_Escolar = '+#39+IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39+
                              ' and   IdInstrutor = '+#39+IBQuery_PTS_Indicacao.FieldByName('IdInstrutor').AsString+#39
                              );
      end;
   end;
end;

//------------------------------------------------------------------------------
// Exclui o instrutor do PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.Exclui_o_Instrutor_do_PTSClick(Sender: TObject);
var
   VI_Retorno: Integer;
   VS_Msg: String;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      VS_Msg:= Exclui_o_Instrutor_do_PTS.Caption+ ' ?';
      VI_Retorno:= Application.MessageBox(PChar(VS_Msg ), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         if IBQuery_PTS_Indicacao.FieldByName('IdInstrutor').AsString <> '' then
             ExcluirInstrutor(' Where IdPTS =  '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                              ' and   IdInstrutor = '+#39+IBQuery_PTS_Indicacao.FieldByName('IdInstrutor').AsString+#39
                              );
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratar da seleção do Local
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.TratarSelecaoLocal(Opcao: String);
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      //--- Tratamento para nã mostrar as opcoes de horario

      Label_InformeHorario.Visible:= False;
      MaskEdit_Data.Visible:= False;
      ComboBox_Dia_Semana.Visible:= False;
      ComboBox_Horario.Visible:= False;
      JvTransparentButton_InserirHorario.Visible:= False;
      JvTransparentButton_CancelarHorario.Visible:= False;

      //--- Tratamento da disponibilizacao das opcoes de lOcal


      //--- Tratamento para nã mostrar as opcoes de horario

      Label_InformeLocal.Visible:= True;
      ComboBox_Local.Visible:= True;
      JvTransparentButton_Inserir_Local.Visible:= True;
      JvTransparentButton_Cancela_InsercaoLocal.Visible:= True;

      Label_InformeLocal.Left:= ComboBox_Local.Left;
      Label_InformeLocal.Caption:= Opcao;

      JvTransparentButton_Inserir_Local.Hint:= Opcao;
      ComboBox_Local.Text:= '';
      Panel_Opcao.Visible:= True;
   end;
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Novo.Inserir_o_Local_selecionado_em_todo_PTSClick(Sender: TObject);
//------------------------------------------------------------------------------

begin
   TratarSelecaoLocal('Inserir o Local selecionado em todo PTS' );
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Novo.InseriroLocalselecionadoemtodoPTSClick( Sender: TObject);
//------------------------------------------------------------------------------
begin
   TratarSelecaoLocal('Inserir o Local selecionado somente no horario selecionado');
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Novo.InseriroLocalselecionadoemnoTrabalhoEscolarselecionadoClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   TratarSelecaoLocal('Inserir o Local selecionado em no Trabalho Escolar selecionado');
end;

//------------------------------------------------------------------------------
// Procedure para tratar da gravacao da local
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_Inserir_LocalClick( Sender: TObject);
var
   VS_Opcao, VS_Comando: String;
begin
   VS_Opcao:= JvTransparentButton_Inserir_Local.Hint;
   if IBTable_PTS_Principal.FieldByName('IDPTS').AsString = '' then
      ShowMessage('Não possuí PTS para a turma selecionada...')
   else
   begin
      VS_Comando:= 'Update pts_semana set Local = '+#39+ComboBox_Local.Text+#39;

      if VS_Opcao = 'Inserir o Local selecionado em todo PTS' then
         VS_Comando:= VS_Comando +' Where IdPts =  '+IBTable_PTS_Principal.FieldByName('IDPTS').AsString
      else
         if VS_Opcao = 'Inserir o Local selecionado somente no horario selecionado' then
            VS_Comando:= VS_Comando +' Where IdPTS =  '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                                     ' and   IdSemana = '+#39+IBQuery_PTS_Semana.FieldByName('IdSemana').AsString+#39+
                                     ' and   Dia_Semana = '+#39+IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString+#39+
                                     ' and   Horario = '+#39+IBQuery_PTS_Semana.FieldByName('Horario').AsString+#39+
                                     ' and   Trab_Escolar = '+#39+IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39
         else
            VS_Comando:= VS_Comando +' Where IdPTS =  '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                                     ' and   Trab_Escolar = '+#39+IBQuery_PTS_Semana.FieldByName('Trab_Escolar').AsString+#39;


      Funcoes.ExecusaoQuery( VS_Comando );
      JvTransparentButton_AtualizarClick(Sender);
   end;
   Panel_Opcao.Visible:= False;
end;

procedure TForm_Sel_PTS_Novo.JvTransparentButton_Cancela_InsercaoLocalClick(Sender: TObject);
begin
   Panel_Opcao.Visible:= False;
end;


//------------------------------------------------------------------------------
// Descricao: Carrega o Combobox Local
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure TForm_Sel_PTS_Novo.AlimentaComboBox_Local;
begin
   Funcoes.OpenQuery('Select distinct CodSala From SalaAula order By CodSala');

   ComboBox_Local.Items.Clear;
   ComboBox_Local.Text:= '';
   ComboBox_Local.Items.Add('');
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Local.Items.Add(DM.IBQuery_Executa.FieldByName('CodSala').AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento ´para Tratar da troca do horario
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.MenuItem_InserirHorarioNoHorarioSelecionadoClick(Sender: TObject);
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
//      Opcao_PTS:= 'Alterar_Horario';

      MaskEdit_Data.Text:= IBQuery_PTS_Semana.FieldByName('Data').AsString;
      ComboBox_Dia_Semana.Text:= IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString;
      ComboBox_Horario.Text:= IBQuery_PTS_Semana.FieldByName('Horario').AsString;

      Funcoes.OpenQuery( ' Select horario '+
                         ' From pts_horario '+
                         ' Where horario not in ( select s.horario '+
                         '                        From pts_principal p, pts_semana s '+
                         '                        Where p.idcurso =  '+DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString+
                         '                        and   p.idturma = '+DM.IBQuery_MontaTurma.FieldByName('idturma').AsString+
                         '                        and   p.IdPts = s.IdPts '+
                         '                        and   idsemana = '+IBQuery_PTS_Semana.FieldByName('idsemana').AsString+
                         '                        and   s.dia_semana = '+#39+IBQuery_PTS_Semana.FieldByName('dia_semana').AsString+#39+
                         '                      )'+
                         ' Order by horario '
                       );

      ComboBox_Horario.Items.Clear;
      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.eof do
      begin
         ComboBox_Horario.Items.Add(DM.IBQuery_Executa.FieldByName('horario').AsString);
         DM.IBQuery_Executa.Next
      end;

      //--- Tratamento para não mostrar as opcoes de horario

      Label_InformeLocal.Visible:= False;
      ComboBox_Local.Visible:= False;
      JvTransparentButton_Inserir_Local.Visible:= False;
      JvTransparentButton_Cancela_InsercaoLocal.Visible:= False;

      //--- Tratamento da disponibilizacao das opcoes de Horario

      Label_InformeHorario.Visible:= True;
      MaskEdit_Data.Visible:= True;
      ComboBox_Dia_Semana.Visible:= True;
      ComboBox_Horario.Visible:= True;
      JvTransparentButton_InserirHorario.Visible:= True;
      JvTransparentButton_CancelarHorario.Visible:= True;

      Panel_Opcao.Visible:= True;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da alterarcao do horario
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_InserirHorarioClick(Sender: TObject);
var
   VS_Comando, VS_Virgula: String;
begin
  if Validar.Verificar_PTS_Ja_Cadastrado(IBQuery_PTS_Semana.FieldByName('IdPTS').AsString, IBQuery_PTS_Semana.FieldByName('IdSemana').AsString, IBQuery_PTS_Semana.FieldByName('Dia_Semana').AsString, ComboBox_Horario.Text) = True then
     ComboBox_Horario.SetFocus
  else
  begin
     VS_Virgula:= '';
     VS_Comando:= ' Update pts_semana set ';

     if MaskEdit_Data.Text <> '  /  /  ' then
     begin
        VS_Comando:=  VS_Comando + ' Data = '+#39+MaskEdit_Data.Text+#39;
        VS_Virgula:= ',';

     end;

     if ComboBox_Dia_Semana.Text <> '' then
     begin
        VS_Comando:=  VS_Comando +VS_Virgula+ ' Dia_Semana = '+#39+ComboBox_Dia_Semana.Text+#39;
        VS_Virgula:= ',';
     end;

     if ComboBox_Horario.Text <> '' then
     begin
        VS_Comando:=  VS_Comando +VS_Virgula+ ' horario = '+#39+ComboBox_Horario.Text+#39;
     end;

     VS_Comando:= VS_Comando+
                  ' Where IdPts = '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                  ' and   idsemana = '+IBQuery_PTS_Semana.FieldByName('idsemana').AsString+
                  ' and   dia_semana = '+#39+IBQuery_PTS_Semana.FieldByName('dia_semana').AsString+#39+
                  ' and   Horario = '+#39+IBQuery_PTS_Semana.FieldByName('Horario').AsString+#39;

{     VS_Comando:= ' Update pts_semana set horario = '+#39+ComboBox_Horario.Text+#39+
                  ' Where IdPts = '+IBQuery_PTS_Semana.FieldByName('IdPTS').AsString+
                  ' and   idsemana = '+IBQuery_PTS_Semana.FieldByName('idsemana').AsString+
                  ' and   dia_semana = '+#39+IBQuery_PTS_Semana.FieldByName('dia_semana').AsString+#39+
                  ' and   Horario = '+#39+IBQuery_PTS_Semana.FieldByName('Horario').AsString+#39;
}
     Funcoes.ExecusaoQuery( VS_Comando );
     JvTransparentButton_AtualizarClick(Sender);

     Panel_Opcao.Visible:= False;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento para cancelar a alterarcao do horario
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.JvTransparentButton_CancelarHorarioClick(Sender: TObject);
begin
   Panel_Opcao.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para montar o PTS em PDF do PTS selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.MenuItem_PDF_SelecionadoClick(Sender: TObject);
var
   VS_Pasta, VS_NomeArq: String;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
      if (trim(ComboBox_Semana.Text) = '') then
      begin
         ShowMessage('Não foi selecionada semana...');
         ComboBox_Semana.SetFocus;
      end
      else
      begin
         Montar_PTS;

         if not DirectoryExists('C:\Ensino\ArquivosPDF') then
             ForceDirectories('C:\Ensino\ArquivosPDF');

         VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_Semana_'+ComboBox_Semana.Text;
         VS_NomeArq:= 'REL_'+Funcoes.DePara(VS_NomeArq, '/', '_');

         VS_Pasta:= 'C:\Ensino\ArquivosPDF\'+VS_NomeArq;

         if not DirectoryExists(VS_Pasta) then
            ForceDirectories(VS_Pasta);

         VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

      //   Application.CreateForm(TForm_Rel_ControleDePresencaDeAlunos, Form_Rel_ControleDePresencaDeAlunos);

         Form_Rel_PTS_Novo.QuickRep1.Prepare;
         ExportQR1.Report := Form_Rel_PTS_Novo.QuickRep1;
         ExportQR1.ExportQRPDF( VS_NomeArq , False);
         ShellExecute(Handle, nil, PChar(VS_NomeArq+'.pdf') , nil, nil, SW_SHOWNORMAL);
      end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar o PTS em PDF do PTS apsrtir do selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.MenuItem_PDF_TodosApartirSelecionadoClick(Sender: TObject);
var
   VS_Pasta, VS_NomeArq: String;
    VS_IdPTS: String;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      if IBTable_PTS_Principal.FieldByName('IDPTS').AsString = '' then
         VS_IdPTS:= ''
      else
         VS_IdPTS:= ' and s.IdPts =  '+IBTable_PTS_Principal.FieldByName('IDPTS').AsString;

      Funcoes.ExecutaQuery( IBQuery_PTS_Semana,'select p.idCurso, p.IdTurma, s.IdPts, s.idsemana, s.dia_semana, s.horario, s.trab_escolar, s.local,  s.Data, s.Disciplina, s.Especialidade, s.Qtd_Instrutor '+
                                               ' From pts_principal p, pts_semana s '+
                                               ' Where p.idcurso = '+DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString+
                                               ' and   p.idturma = '+DM.IBQuery_MontaTurma.FieldByName('idturma').AsString+
                                               ' and   p.IdPts = s.IdPts '+
                                               VS_IdPTS+
                                               ' Order by s.IdSemana, s.dia_semana, s.horario '
                          );

      Montar_PTS;

      if not DirectoryExists('C:\Ensino\ArquivosPDF') then
          ForceDirectories('C:\Ensino\ArquivosPDF');

      VS_NomeArq:= Funcoes.GetCodCurso+'_'+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'_Semana_'+ComboBox_Semana.Text;
      VS_NomeArq:= 'REL_'+Funcoes.DePara(VS_NomeArq, '/', '_');

      VS_Pasta:= 'C:\Ensino\ArquivosPDF\'+VS_NomeArq;

      if not DirectoryExists(VS_Pasta) then
         ForceDirectories(VS_Pasta);

      VS_NomeArq:= VS_Pasta+'\'+VS_NomeArq;

      Form_Rel_PTS_Novo.QuickRep1.Prepare;
      ExportQR1.Report := Form_Rel_PTS_Novo.QuickRep1;
      ExportQR1.ExportQRPDF( VS_NomeArq , False);
      ShellExecute(Handle, nil, PChar(VS_NomeArq+'.pdf') , nil, nil, SW_SHOWNORMAL);

      ComboBox_SemanaChange(Sender);
   end;

end;

procedure TForm_Sel_PTS_Novo.JvTransparentButton_CadastrarClick(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
// Tratamento para excluir e registrar a quantidade de instrutores
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Novo.ExcluirInstrutor(VS_Where: String);
begin
   Funcoes.ExecusaoQuery( ' Delete From PTS_INDICACAO '+VS_Where);
end;
procedure TForm_Sel_PTS_Novo.MenuItem_Trabalho_EscolarClick(Sender: TObject);
begin
//   Opcao_PTS:= 'Inserir Feriado';

end;

procedure TForm_Sel_PTS_Novo.Excluir_PTSClick(Sender: TObject);
var
   VI_Retorno: Integer;
begin
   if IBQuery_PTS_Semana.FieldByName('IdPTS').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      VI_Retorno:= Application.MessageBox('Confirma a Exclusão do PTS(s) Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         IBTable_PTS_Principal.Delete;
         Funcoes.ExecutaTransacao;
         close;
      end;
   end;
end;

end.
