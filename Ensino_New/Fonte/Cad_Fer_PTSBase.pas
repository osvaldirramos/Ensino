//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_PTS.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             do PTS.                                        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 31/07/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Fer_PTSBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, JvRichEd, JvDBRichEd, ToolWin, Mask, JvToolEdit, JvDBCtrl,
  DBCtrls, DBGrids, Buttons, JvComponent, JvxCtrls, JvShape, IBQuery, Menus,
  JvCheckBox, Rotinas,Rotinas_SUE,Rotinas_TrataData, JvTransBtn, JvGradient,
  JvLookOut;

//Const
//   Periodo_Manha= '08:00/08:45'+#13+'08:55/09:40'+#13+'09:50/10:35'+#13+'10:45/11:30';
//   Periodo_Tarde= '13:00/13:45'+#13+'13:55/14:40'+#13+'14:50/15:35'+#13+'15:45/16:30';
type
  TForm_Cad_PTSBase = class(TForm)
    DST_PTS: TDataSource;
    Panel_AreaTrabalho: TPanel;
    Panel1: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel_SelecaoCurso: TPanel;
    Panel28: TPanel;
    JvDBRichEdit_Msg: TJvDBRichEdit;
    Panel_Curso: TPanel;
    JvShape5: TJvShape;
    Label_Curso: TLabel;
    ComboBox_Curso: TComboBox;
    IBTable_PTS_base: TIBTable;
    IBTable_PTS_baseIDCURSO: TSmallintField;
    IBTable_PTS_baseSEMANA: TSmallintField;
    IBTable_PTS_baseDATA_02: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_02: TIBStringField;
    IBTable_PTS_baseHORARIO_01_02: TIBStringField;
    IBTable_PTS_baseHORARIO_02_02: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_02: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_02: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_02: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_02: TIBStringField;
    IBTable_PTS_baseLOCAL_01_02: TIBStringField;
    IBTable_PTS_baseLOCAL_02_02: TIBStringField;
    IBTable_PTS_baseDATA_03: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_03: TIBStringField;
    IBTable_PTS_baseHORARIO_01_03: TIBStringField;
    IBTable_PTS_baseHORARIO_02_03: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_03: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_03: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_03: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_03: TIBStringField;
    IBTable_PTS_baseLOCAL_01_03: TIBStringField;
    IBTable_PTS_baseLOCAL_02_03: TIBStringField;
    IBTable_PTS_baseDATA_04: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_04: TIBStringField;
    IBTable_PTS_baseHORARIO_01_04: TIBStringField;
    IBTable_PTS_baseHORARIO_02_04: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_04: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_04: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_04: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_04: TIBStringField;
    IBTable_PTS_baseLOCAL_01_04: TIBStringField;
    IBTable_PTS_baseLOCAL_02_04: TIBStringField;
    IBTable_PTS_baseDATA_05: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_05: TIBStringField;
    IBTable_PTS_baseHORARIO_01_05: TIBStringField;
    IBTable_PTS_baseHORARIO_02_05: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_05: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_05: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_05: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_05: TIBStringField;
    IBTable_PTS_baseLOCAL_01_05: TIBStringField;
    IBTable_PTS_baseLOCAL_02_05: TIBStringField;
    IBTable_PTS_baseDATA_06: TIBStringField;
    IBTable_PTS_baseDIA_SEMANA_06: TIBStringField;
    IBTable_PTS_baseHORARIO_01_06: TIBStringField;
    IBTable_PTS_baseHORARIO_02_06: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_01_06: TIBStringField;
    IBTable_PTS_baseTRAB_ESCOLAR_02_06: TIBStringField;
    IBTable_PTS_baseEQUIPE_01_06: TIBStringField;
    IBTable_PTS_baseEQUIPE_02_06: TIBStringField;
    IBTable_PTS_baseLOCAL_01_06: TIBStringField;
    IBTable_PTS_baseLOCAL_02_06: TIBStringField;
    ComboBox_Equipe: TComboBox;
    Panel_semana: TPanel;
    JvShape1: TJvShape;
    Label5: TLabel;
    Label_Semanas: TLabel;
    ComboBox_Semana: TComboBox;
    Label6: TLabel;
    DSQ_MontaCurso: TDataSource;
    Query_MontaCurso: TIBQuery;
    Query_MontaCursoIDCURSO: TSmallintField;
    Query_MontaCursoCODCURSO: TIBStringField;
    Query_MontaCursoNOMECURSO: TIBStringField;
    Panel34: TPanel;
    ScrollBox_PTS: TScrollBox;
    Panel_QuaFeira: TPanel;
    Panel_4: TPanel;
    Label_Quarta: TLabel;
    Panel5: TPanel;
    Panel_2_4: TPanel;
    JvDBRichEdit_Hor_6: TJvDBRichEdit;
    JvDBRichEdit_Quarta_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_6: TJvDBRichEdit;
    JvDBRichEdit_Loc_6: TJvDBRichEdit;
    Panel_1_4: TPanel;
    JvDBRichEdit_Hor_5: TJvDBRichEdit;
    JvDBRichEdit_Quarta_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_5: TJvDBRichEdit;
    JvDBRichEdit_Loc_5: TJvDBRichEdit;
    Panel_SexFeira: TPanel;
    Panel_6: TPanel;
    Label_Sexta: TLabel;
    Panel14: TPanel;
    Panel_2_6: TPanel;
    JvDBRichEdit_Hor_10: TJvDBRichEdit;
    JvDBRichEdit_Sexta_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_10: TJvDBRichEdit;
    JvDBRichEdit_Loc_10: TJvDBRichEdit;
    Panel_1_6: TPanel;
    JvDBRichEdit_Hor_9: TJvDBRichEdit;
    JvDBRichEdit_Sexta_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_9: TJvDBRichEdit;
    JvDBRichEdit_Loc_9: TJvDBRichEdit;
    Panel_QuiFeira: TPanel;
    Panel_5: TPanel;
    Label_Quinta: TLabel;
    Panel19: TPanel;
    Panel_2_5: TPanel;
    JvDBRichEdit_Hor_8: TJvDBRichEdit;
    JvDBRichEdit_Quinta_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_8: TJvDBRichEdit;
    JvDBRichEdit_Loc_8: TJvDBRichEdit;
    Panel_1_5: TPanel;
    JvDBRichEdit_Hor_7: TJvDBRichEdit;
    JvDBRichEdit_Quinta_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_7: TJvDBRichEdit;
    JvDBRichEdit_Loc_7: TJvDBRichEdit;
    Panel_TerFeira: TPanel;
    Panel24: TPanel;
    Panel_2_3: TPanel;
    JvDBRichEdit_Hor_4: TJvDBRichEdit;
    JvDBRichEdit_Terca_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_4: TJvDBRichEdit;
    JvDBRichEdit_Loc_4: TJvDBRichEdit;
    Panel_1_3: TPanel;
    JvDBRichEdit_Hor_3: TJvDBRichEdit;
    JvDBRichEdit_Terca_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_3: TJvDBRichEdit;
    JvDBRichEdit_Loc_3: TJvDBRichEdit;
    Panel_3: TPanel;
    Label_Terca: TLabel;
    Panel_SegFeira: TPanel;
    Panel_22: TPanel;
    Panel_2_2: TPanel;
    JvDBRichEdit_Hor_2: TJvDBRichEdit;
    JvDBRichEdit_Segunda_2: TJvDBRichEdit;
    JvDBRichEdit_Doc_2: TJvDBRichEdit;
    JvDBRichEdit_Loc_2: TJvDBRichEdit;
    Panel_1_2: TPanel;
    JvDBRichEdit_Loc_1: TJvDBRichEdit;
    JvDBRichEdit_Doc_1: TJvDBRichEdit;
    JvDBRichEdit_Segunda_1: TJvDBRichEdit;
    JvDBRichEdit_Hor_1: TJvDBRichEdit;
    Panel_2: TPanel;
    Label_Segunda: TLabel;
    SpeedButton_Retorna: TSpeedButton;
    SpeedButton_Proximo: TSpeedButton;
    SpeedButton_Primeiro: TSpeedButton;
    SpeedButton_Ultimo: TSpeedButton;
    Query_MontaCursoNUMEROSEMANAAULAS: TSmallintField;
    Panel_Cabecalho: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel13: TPanel;
    ComboBox_disciplinas: TComboBox;
    PopupMenu_Imprimir: TPopupMenu;
    Selecionado: TMenuItem;
    N1: TMenuItem;
    odos2: TMenuItem;
    IBTable_PTS_baseATUALIZACAO: TDateTimeField;
    IBTable_PTS_baseANO: TIBStringField;
    Label1: TLabel;
    DBEdit_Ano: TDBEdit;
    JvDBDateEdit_DataAtualizacao: TJvDBDateEdit;
    Label2: TLabel;
    IBTable_PTS_baseMSG: TIBStringField;
    Panel_BotoesProva: TPanel;
    JvGradient_Menu: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape_NovoPTS: TJvShape;
    JvTransparentButton_NovoPTS: TJvTransparentButton;
    JvCheckBox_Vizualizar: TJvCheckBox;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape_Imprimir: TJvShape;
    JvTransparentButton_Imprimir: TJvTransparentButton;
    JvExpressButton_AtualizarrHora: TJvExpressButton;

    procedure TratarCampos(Status: Boolean);
    procedure MontaCurso(PS_Curso: String);
    procedure TratarBotoes(Status: Boolean);
    procedure TrataSemanas;
    Procedure ListaDisciplinas;
    Procedure TratarCaixaDisciplinas(PI_Opcao, PI_Top: Integer);
    Procedure TratarCaixaInstrutor(PI_Opcao, PI_Top: Integer);
    Procedure TravaSelecaoCurso;

    procedure FormActivate(Sender: TObject);
    procedure ComboBox_SemanaChange(Sender: TObject);
    procedure ComboBox_CursoChange(Sender: TObject);
    procedure ComboBox_disciplinasClick(Sender: TObject);
    procedure JvDBRichEdit_MsgKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_EquipeClick(Sender: TObject);
    procedure ComboBox_EquipeKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox_EquipeExit(Sender: TObject);
    procedure SpeedButton_RetornaClick(Sender: TObject);
    procedure SpeedButton_ProximoClick(Sender: TObject);
    procedure SpeedButton_PrimeiroClick(Sender: TObject);
    procedure SpeedButton_UltimoClick(Sender: TObject);
    procedure ComboBox_CursoSelect(Sender: TObject);
    procedure ComboBox_CursoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDBRichEdit_Segunda_1Click(Sender: TObject);
    procedure JvDBRichEdit_Segunda_2Click(Sender: TObject);
    procedure JvDBRichEdit_Terca_1Click(Sender: TObject);
    procedure JvDBRichEdit_Terca_2Click(Sender: TObject);
    procedure JvDBRichEdit_Quarta_1Click(Sender: TObject);
    procedure JvDBRichEdit_Quarta_2Click(Sender: TObject);
    procedure JvDBRichEdit_Quinta_1Click(Sender: TObject);
    procedure JvDBRichEdit_Quinta_2Click(Sender: TObject);
    procedure JvDBRichEdit_Sexta_1Click(Sender: TObject);
    procedure JvDBRichEdit_Sexta_2Click(Sender: TObject);
    procedure SelecionadoClick(Sender: TObject);
    procedure odos2Click(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_NovoPTSClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure ComboBox_CursoClick(Sender: TObject);
    procedure JvExpressButton_AtualizarrHoraClick(Sender: TObject);
  private    { Private declarations }
     VS_Coordenador, VS_Msg, VS_Opcao: String;
     VI_Semanas: Real;
      VS_IdCurso, VS_CodCurso: String;
  public    { Public declarations }
     VI_SemanaAtual, VI_Opcao: Integer;
  end;

var
  Form_Cad_PTSBase: TForm_Cad_PTSBase;

implementation

uses Module, Rel_PTSBase, Rel_ProgramaDeTrabalhoSemanal;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.FormActivate(Sender: TObject);
begin
   JvGradient_Menu.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm( Form_Cad_PTSBase, ' PTS - Base ( Plano de Trabalho Semanal )');

   JvExpressButton_AtualizarrHora.Visible:= False;
   TratarCampos(False);
   TratarBotoes(True);
   ComboBox_Equipe.Visible:= False;

   IBTable_PTS_base.Open;
   //--- Tratamento da Selecao dos Cursos

   Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
   MontaCurso(Funcoes.GetCodCurso);
   TrataSemanas;
   ComboBox_disciplinas.Visible:= False;

   IBTable_PTS_base.Filter:= 'Semana = '+ComboBox_Semana.Text;
   IBTable_PTS_base.Filtered:= True;

end;

//------------------------------------------------------------------------------
// Tratamento do Botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento Quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    IBTable_PTS_base.Close;
    Query_MontaCurso.Close;
    Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.JvTransparentButton_WindowsClick( Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do curso atraves do ENTER
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.ComboBox_CursoChange(Sender: TObject);
begin
//   MontaCurso(ComboBox_Curso.Text);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.MontaCurso(PS_Curso: String);
var
   VS_Comando: string;
begin
   if ((VS_CodCurso <> PS_Curso) or (Funcoes.GetCadCurso = 'MenuPrincipal') ) then
   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         VS_Comando:= 'Select IdCurso, CodCurso, NomeCurso, NumeroSemanaAulas '+
                      'From Curso '+
                      ' where codcurso = '+#39+PS_Curso+#39;
         Funcoes.ExecutaQuery(Query_MontaCurso, VS_Comando);

         if Trim(Query_MontaCurso.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= Query_MontaCurso.FieldByName('CodCurso').AsString;

            VS_IdCurso:= Query_MontaCurso.FieldByNAme('IdCurso').AsString;
            VS_CodCurso:= ComboBox_Curso.Text;
            VI_Semanas:= Query_MontaCurso.FieldByNAme('NumeroSemanaAulas').AsFloat;
            Funcoes.SetIdCurso(VS_IdCurso);

            TratarCampos(False);
            TratarBotoes(True);
            ListaDisciplinas;
            TrataSemanas;
         end
         else
         begin
            Showmessage('Curso não Cadastrado.');
            TravaSelecaoCurso;
         end;
      end
      else
      begin
         Showmessage('O Curso selecionado não pode ser branco.');
          TravaSelecaoCurso;
      end;

   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar o travamento da selecao do Curso
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTSBase.TravaSelecaoCurso;
begin
   VS_CodCurso:= 'Null';
   TratarCampos(False);
   TratarBotoes(True);
   Label_Semanas.Caption:= '0';
   ComboBox_Semana.Text:= '0';
   SpeedButton_Primeiro.Enabled:= False;
   SpeedButton_Retorna.Enabled:= False;
   SpeedButton_Proximo.Enabled:= False;
   SpeedButton_Proximo.Enabled:= False;
   SpeedButton_Ultimo.Enabled:= False;
   funcoes.TratarJvTransparentButton(JvTransparentButton_NovoPTS, JvShape_NovoPTS, False);
   ComboBox_Semana.Enabled:= False;
   ComboBox_Curso.SetFocus;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Monta as semanas para selecao
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.TrataSemanas;
var
   i: Integer;
   Sender: TObject;
begin
    //--
   // Trata da semana referente ao Curso

   ComboBox_Semana.Items.Clear;
   i:= 1;
   ComboBox_Semana.Text:= '1';
   While i <= VI_Semanas do
   begin
      ComboBox_Semana.Items.Add(IntToStr(i));
      i:= i+1;
   end;
   Label_Semanas.Caption:= IntToStr(i-1);
   ComboBox_SemanaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da semana
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.ComboBox_SemanaChange(Sender: TObject);
begin
   IBTable_PTS_base.Filter:= 'Semana = '+ComboBox_Semana.Text;
   IBTable_PTS_base.Filtered:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.TratarBotoes(Status: Boolean);
begin
   ComboBox_Curso.Enabled:= Status;
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Imprimir, JvShape_Imprimir, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Retornar, JvShape_Retornar, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Windows, JvShape_Windows, Status);
   SpeedButton_Primeiro.Enabled:= Status;
   SpeedButton_Retorna.Enabled:= Status;
   SpeedButton_Proximo.Enabled:= Status;
   SpeedButton_Proximo.Enabled:= Status;
   SpeedButton_Ultimo.Enabled:= Status;

   Funcoes.TratarJvTransparentButton(JvTransparentButton_NovoPTS, JvShape_NovoPTS, Status);
   ComboBox_Semana.Enabled:= Status;
   
   if Label_Semanas.Caption = '0' then
      Status:= False;


   if Status = True then
      Status:= False
   else
      if Label_Semanas.Caption = '0' then
         Status:= False
      else
         Status:= True;

   Funcoes.TratarJvTransparentButton(JvTransparentButton_Gravar, JvShape_Gravar, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Cancelar, JvShape_Cancelar, Status);

end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.TratarCampos(Status: Boolean);
var
   Cor : TColor;
begin
   DBEdit_Ano.Enabled:= Status;
   JvDBDateEdit_DataAtualizacao.Enabled:= Status;
   JvDBRichEdit_Segunda_1.Enabled:= Status;
   JvDBRichEdit_Segunda_2.Enabled:= Status;
   JvDBRichEdit_Terca_1.Enabled:= Status;
   JvDBRichEdit_Terca_2.Enabled:= Status;
   JvDBRichEdit_Quarta_1.Enabled:= Status;
   JvDBRichEdit_Quarta_2.Enabled:= Status;
   JvDBRichEdit_Quinta_1.Enabled:= Status;
   JvDBRichEdit_Quinta_2.Enabled:= Status;
   JvDBRichEdit_Sexta_1.Enabled:= Status;
   JvDBRichEdit_Sexta_2.Enabled:= Status;
   JvDBRichEdit_Hor_1.Enabled:= Status;
   JvDBRichEdit_Hor_2.Enabled:= Status;
   JvDBRichEdit_Hor_3.Enabled:= Status;
   JvDBRichEdit_Hor_4.Enabled:= Status;
   JvDBRichEdit_Hor_5.Enabled:= Status;
   JvDBRichEdit_Hor_6.Enabled:= Status;
   JvDBRichEdit_Hor_7.Enabled:= Status;
   JvDBRichEdit_Hor_8.Enabled:= Status;
   JvDBRichEdit_Hor_9.Enabled:= Status;
   JvDBRichEdit_Hor_10.Enabled:= Status;
   JvDBRichEdit_Doc_1.Enabled:= Status;
   JvDBRichEdit_Doc_2.Enabled:= Status;
   JvDBRichEdit_Doc_3.Enabled:= Status;
   JvDBRichEdit_Doc_4.Enabled:= Status;
   JvDBRichEdit_Doc_5.Enabled:= Status;
   JvDBRichEdit_Doc_6.Enabled:= Status;
   JvDBRichEdit_Doc_7.Enabled:= Status;
   JvDBRichEdit_Doc_8.Enabled:= Status;
   JvDBRichEdit_Doc_9.Enabled:= Status;
   JvDBRichEdit_Doc_10.Enabled:= Status;
   JvDBRichEdit_Loc_1.Enabled:= Status;
   JvDBRichEdit_Loc_2.Enabled:= Status;
   JvDBRichEdit_Loc_3.Enabled:= Status;
   JvDBRichEdit_Loc_4.Enabled:= Status;
   JvDBRichEdit_Loc_5.Enabled:= Status;
   JvDBRichEdit_Loc_6.Enabled:= Status;
   JvDBRichEdit_Loc_7.Enabled:= Status;
   JvDBRichEdit_Loc_8.Enabled:= Status;
   JvDBRichEdit_Loc_9.Enabled:= Status;
   JvDBRichEdit_Loc_10.Enabled:= Status;
   JvDBRichEdit_Msg.Enabled:= Status;

   //--- Tratar cor

   if Status = False then
      Cor:= clWhite
   else
      Cor:= $0091C8FF;

   JvDBRichEdit_Segunda_1.Color:= Cor;
   JvDBRichEdit_Segunda_2.Color:= Cor;
   JvDBRichEdit_Terca_1.Color:= Cor;
   JvDBRichEdit_Terca_2.Color:= Cor;
   JvDBRichEdit_Quarta_1.Color:= Cor;
   JvDBRichEdit_Quarta_2.Color:= Cor;
   JvDBRichEdit_Quinta_1.Color:= Cor;
   JvDBRichEdit_Quinta_2.Color:= Cor;
   JvDBRichEdit_Sexta_1.Color:= Cor;
   JvDBRichEdit_Sexta_2.Color:= Cor;
   JvDBRichEdit_Hor_1.Color:= Cor;
   JvDBRichEdit_Hor_2.Color:= Cor;
   JvDBRichEdit_Hor_3.Color:= Cor;
   JvDBRichEdit_Hor_4.Color:= Cor;
   JvDBRichEdit_Hor_5.Color:= Cor;
   JvDBRichEdit_Hor_6.Color:= Cor;
   JvDBRichEdit_Hor_7.Color:= Cor;
   JvDBRichEdit_Hor_8.Color:= Cor;
   JvDBRichEdit_Hor_9.Color:= Cor;
   JvDBRichEdit_Hor_10.Color:= Cor;
   JvDBRichEdit_Doc_1.Color:= Cor;
   JvDBRichEdit_Doc_2.Color:= Cor;
   JvDBRichEdit_Doc_3.Color:= Cor;
   JvDBRichEdit_Doc_4.Color:= Cor;
   JvDBRichEdit_Doc_5.Color:= Cor;
   JvDBRichEdit_Doc_6.Color:= Cor;
   JvDBRichEdit_Doc_7.Color:= Cor;
   JvDBRichEdit_Doc_8.Color:= Cor;
   JvDBRichEdit_Doc_9.Color:= Cor;
   JvDBRichEdit_Doc_10.Color:= Cor;
   JvDBRichEdit_Loc_1.Color:= Cor;
   JvDBRichEdit_Loc_2.Color:= Cor;
   JvDBRichEdit_Loc_3.Color:= Cor;
   JvDBRichEdit_Loc_4.Color:= Cor;
   JvDBRichEdit_Loc_5.Color:= Cor;
   JvDBRichEdit_Loc_6.Color:= Cor;
   JvDBRichEdit_Loc_7.Color:= Cor;
   JvDBRichEdit_Loc_8.Color:= Cor;
   JvDBRichEdit_Loc_9.Color:= Cor;
   JvDBRichEdit_Loc_10.Color:= Cor;
   JvDBRichEdit_Msg.Color:= Cor;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para atualizar a hora de acordo com a nova npa
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.JvExpressButton_AtualizarrHoraClick(Sender: TObject);
begin
    IBTable_PTS_base.FieldByName('Horario_01_02').AsString:= Periodo_Manha;
    IBTable_PTS_base.FieldByName('Horario_02_02').AsString:= Periodo_Tarde;
    IBTable_PTS_base.FieldByName('Horario_01_03').AsString:= Periodo_Manha;
    IBTable_PTS_base.FieldByName('Horario_02_03').AsString:= Periodo_Tarde;
    IBTable_PTS_base.FieldByName('Horario_01_04').AsString:= Periodo_Manha;
    IBTable_PTS_base.FieldByName('Horario_02_04').AsString:= Periodo_Tarde;
    IBTable_PTS_base.FieldByName('Horario_01_05').AsString:= Periodo_Manha;
    IBTable_PTS_base.FieldByName('Horario_02_05').AsString:= Periodo_Tarde;
    IBTable_PTS_base.FieldByName('Horario_01_06').AsString:= Periodo_Manha;
    IBTable_PTS_base.FieldByName('Horario_02_06').AsString:= Periodo_Tarde;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.JvTransparentButton_NovoPTSClick(Sender: TObject);
var
   VS_Sala, VS_Comando: String;
begin
   if trim(ComboBox_Curso.Text) = '' then
   begin
       ShowMessage('Não foi selecionado o Curso que irá compor o PTS-Base...');
   end
   else
   begin
      ComboBox_disciplinas.Visible:= True;

      JvExpressButton_AtualizarrHora.Visible:= True;
      TratarCampos(True);
      TratarBotoes(False);
      VS_Comando:= 'Select count(1) Qtd from PTS_Base where idCurso = '+VS_IdCurso+
                   ' and Semana = '+ComboBox_Semana.Text;
      if Funcoes.QtdRegistro(VS_Comando) = 0 then
      begin
         VS_Opcao:= 'Inserção';

          //----
         //--- Tratamento da seleção do Coordenador

         VS_Msg:= '';
         JvDBRichEdit_Msg.Lines.Add('Coordenador: ');

          //----
         //--- Tratamento da Sala

         VS_Sala:= '';

         IBTable_PTS_base.Insert;
         IBTable_PTS_base.FieldByName('IdCurso').AsString:= VS_IdCurso;
         IBTable_PTS_base.FieldByName('Semana').AsString:=  ComboBox_Semana.Text;

         IBTable_PTS_base.FieldByName('Dia_Semana_02').AsString:= '2º Feira';
         IBTable_PTS_base.FieldByName('Dia_Semana_03').AsString:= '3º Feira';
         IBTable_PTS_base.FieldByName('Dia_Semana_04').AsString:= '4º Feira';
         IBTable_PTS_base.FieldByName('Dia_Semana_05').AsString:= '5º Feira';
         IBTable_PTS_base.FieldByName('Dia_Semana_06').AsString:= '6º Feira';

         IBTable_PTS_base.FieldByName('Horario_01_02').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_02').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_03').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_03').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_04').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_04').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_05').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_05').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_06').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_06').AsString:= Periodo_Tarde;

         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_02').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_02').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_03').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_03').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_04').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_04').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_05').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_05').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_06').AsString:= '';
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_06').AsString:= '';

         IBTable_PTS_base.FieldByName('Local_01_02').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_02_02').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_01_03').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_02_03').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_01_04').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_02_04').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_01_05').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_02_05').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_01_06').AsString:= #13+#13+VS_Sala;
         IBTable_PTS_base.FieldByName('Local_02_06').AsString:= #13+#13+VS_Sala;
      end
      else
      begin
         VS_Opcao:= 'Alteração';
         IBTable_PTS_base.Edit;

         IBTable_PTS_base.FieldByName('Horario_01_02').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_02').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_03').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_03').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_04').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_04').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_05').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_05').AsString:= Periodo_Tarde;
         IBTable_PTS_base.FieldByName('Horario_01_06').AsString:= Periodo_Manha;
         IBTable_PTS_base.FieldByName('Horario_02_06').AsString:= Periodo_Tarde;
         
         VS_Msg:= IBTable_PTS_base.FieldByName('MSG').AsString;
      end;

     Funcoes.TratarJvTransparentButton(JvTransparentButton_Gravar, JvShape_Gravar, True);
     Funcoes.TratarJvTransparentButton(JvTransparentButton_Cancelar, JvShape_Cancelar, True);

      if trim(IBTable_PTS_base.FieldByName('Ano').AsString) = '' Then
         IBTable_PTS_base.FieldByName('Ano').AsString:= Funcoes_TrataData.AnoAtual;
      IBTable_PTS_base.FieldByName('Atualizacao').AsString:= DateToStr(Date);
      JvDBRichEdit_Segunda_1.SetFocus;
   end;
end;

procedure TForm_Cad_PTSBase.JvTransparentButton_GravarClick(Sender: TObject);
begin
   IBTable_PTS_base.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.GravaAcesso('Ferramentas - PTS - Base', VS_Opcao+' PTS Base do Curso '+ComboBox_Curso.Text+' Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+'/'+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - Usuario: '+Funcoes.GetUsuario);
   ComboBox_disciplinas.Visible:= False;
   JvExpressButton_AtualizarrHora.Visible:= False;
   TratarCampos(False);
   TratarBotoes(True);
end;

procedure TForm_Cad_PTSBase.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   IBTable_PTS_base.Cancel;
   Funcoes.ExecutaTransacao;
   ComboBox_disciplinas.Visible:= False;
   JvExpressButton_AtualizarrHora.Visible:= False;
   TratarCampos(False);
   TratarBotoes(True);
end;

//------------------------------------------------------------------------------
// Tratamento da Caixa de Selecao de Disciplina
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTSBase.ListaDisciplinas;
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select NomeMateria From MateriaCurso where IdCurso = '+VS_IdCurso+' and IdTurma = 0';
   Funcoes.OpenQuery(VS_Comando);
   DM.IBQuery_Executa.First;
   ComboBox_disciplinas.Items.Clear;
   ComboBox_disciplinas.Text:= DM.IBQuery_Executa.FieldByName('NomeMateria').AsString;
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_disciplinas.Items.Add(DM.IBQuery_Executa.FieldByName('NomeMateria').AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Da Caixa de Selecao
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTSBase.TratarCaixaDisciplinas(PI_Opcao, PI_Top: Integer);
Begin
   VI_Opcao:= PI_Opcao;
end;


procedure TForm_Cad_PTSBase.JvDBRichEdit_Segunda_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 1, Panel_SegFeira.Top+3 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Segunda_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 2, Panel_SegFeira.Top+95 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Terca_1Click(Sender: TObject);
begin
    TratarCaixaDisciplinas( 3, Panel_TerFeira.Top+3 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Terca_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 4, Panel_TerFeira.Top+95 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Quarta_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 5, Panel_QuaFeira.Top+3 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Quarta_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 6, Panel_QuaFeira.Top+95 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Quinta_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 7, Panel_QuiFeira.Top+3 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Quinta_2Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 8, Panel_QuiFeira.Top+95 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Sexta_1Click(Sender: TObject);
begin
   TratarCaixaDisciplinas( 9, Panel_SexFeira.Top+3 );
end;

procedure TForm_Cad_PTSBase.JvDBRichEdit_Sexta_2Click(Sender: TObject);
begin
     TratarCaixaDisciplinas( 10, Panel_SexFeira.Top+95 );
end;

//------------------------------------------------------------------------------
//- Selecao da Disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.ComboBox_disciplinasClick(Sender: TObject);
begin
   if VI_Opcao = 1 then
      IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_02').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_02').AsString+ComboBox_disciplinas.Text+#13
   else
      if VI_Opcao = 2 then
         IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_02').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_02').AsString+ComboBox_disciplinas.Text+#13
      else
         if VI_Opcao = 3 then
            IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_03').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_03').AsString+ComboBox_disciplinas.Text+#13
         else
            if VI_Opcao = 4 then
               IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_03').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_03').AsString+ComboBox_disciplinas.Text+#13
            else
               if VI_Opcao = 5 then
                  IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_04').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_04').AsString+ComboBox_disciplinas.Text+#13
               else
                  if VI_Opcao = 6 then
                     IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_04').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_04').AsString+ComboBox_disciplinas.Text+#13
                  else
                     if VI_Opcao = 7 then
                        IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_05').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_05').AsString+ComboBox_disciplinas.Text+#13
                     else
                        if VI_Opcao = 8 then
                           IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_05').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_05').AsString+ComboBox_disciplinas.Text+#13
                        else
                           if VI_Opcao = 9 then
                              IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_06').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_01_06').AsString+ComboBox_disciplinas.Text+#13
                           else
                              if VI_Opcao = 10 then
                                 IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_06').AsString:= IBTable_PTS_base.FieldByName('TRAB_ESCOLAR_02_06').AsString+ComboBox_disciplinas.Text+#13
end;


//------------------------------------------------------------------------------
//
// Tratamento da Selecao do Instrutor
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento Da Caixa de Selecao
//------------------------------------------------------------------------------

Procedure TForm_Cad_PTSBase.TratarCaixaInstrutor(PI_Opcao, PI_Top: Integer);
Begin
   VI_Opcao:= PI_Opcao;
end;


procedure TForm_Cad_PTSBase.JvDBRichEdit_MsgKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #4 then
       ComboBox_Equipe.Visible:= True;

   if key = #3 then
//      JvDBRichEdit_Msg.Text:= JvDBRichEdit_Msg.Text+#13+'Coordenador: '+(Query_MontaTurma.FieldByName('Coordenador').AsString);
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao da Equipe
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.ComboBox_EquipeClick(Sender: TObject);
begin
   if VS_Msg = '' then
      VS_Msg:= 'Equipe: '+ComboBox_Equipe.Text+' / '
   else
      VS_Msg:=  VS_Msg+ ComboBox_Equipe.Text+' / ';

   JvDBRichEdit_Msg.Lines.Clear;
   JvDBRichEdit_Msg.Lines.Add(VS_Msg+#13+VS_Coordenador);
   IBTable_PTS_base.FieldByName('MSG').AsString:= VS_Msg+#13+VS_Coordenador;
end;

procedure TForm_Cad_PTSBase.ComboBox_EquipeKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #4 then
       ComboBox_Equipe.Visible:= False
end;

procedure TForm_Cad_PTSBase.ComboBox_EquipeExit(Sender: TObject);
begin
   ComboBox_Equipe.Visible:= False
end;


//------------------------------------------------------------------------------
// Tratamento do Botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_PTSBase.SpeedButton_RetornaClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= IntToStr(StrToInt(ComboBox_Semana.Text)-1);
   if StrToInt(ComboBox_Semana.Text) < 1 then
      ComboBox_Semana.Text:= '1';

   ComboBox_SemanaChange(Sender);
end;

procedure TForm_Cad_PTSBase.SpeedButton_ProximoClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= IntToStr(StrToInt(ComboBox_Semana.Text)+1);
   if StrToInt(ComboBox_Semana.Text) > StrToInt(Label_Semanas.Caption) then
      ComboBox_Semana.Text:= Label_Semanas.Caption;

   ComboBox_SemanaChange(Sender);

end;

procedure TForm_Cad_PTSBase.SpeedButton_PrimeiroClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= '1';
   ComboBox_SemanaChange(Sender);
end;

procedure TForm_Cad_PTSBase.SpeedButton_UltimoClick(Sender: TObject);
begin
   ComboBox_Semana.Text:= Label_Semanas.Caption;
   ComboBox_SemanaChange(Sender);
end;

procedure TForm_Cad_PTSBase.ComboBox_CursoSelect(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text);
end;

procedure TForm_Cad_PTSBase.ComboBox_CursoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      MontaCurso(ComboBox_Curso.Text)
   else
      ComboBox_Curso.Style:= csDropDownList;
end;


procedure TForm_Cad_PTSBase.SelecionadoClick(Sender: TObject);
begin
   if (trim(ComboBox_Semana.Text) = '') then
   begin
      ShowMessage('Não foi selecionada semana...');
      ComboBox_Semana.SetFocus;
   end
   else
   begin
      VI_SemanaAtual:=  StrToInt(ComboBox_Semana.Text);
      Application.CreateForm(TForm_Rel_PTSBase, Form_Rel_PTSBase);

      if JvCheckBox_Vizualizar.Checked = True then
         Form_Rel_PTSBase.QuickRep1.Preview
      else
         Form_Rel_PTSBase.QuickRep1.Print;

      Form_Rel_PTSBase.Free;
   end;

end;

procedure TForm_Cad_PTSBase.odos2Click(Sender: TObject);
var
   UltimaSemana: Integer;
begin
   if (trim(ComboBox_Semana.Text) = '') then
   begin
      ShowMessage('Não foi selecionada semana...');
      ComboBox_Semana.SetFocus;
   end
   else
   begin
      UltimaSemana:= StrToInt(Label_Semanas.Caption);
      VI_SemanaAtual:=  StrToInt(ComboBox_Semana.Text);
      While VI_SemanaAtual <= UltimaSemana do
      begin
         if JvCheckBox_Vizualizar.Checked = True then
            Form_Rel_PTSBase.QuickRep1.Preview
         else
            Form_Rel_PTSBase.QuickRep1.Print;
         VI_SemanaAtual:= VI_SemanaAtual+1;
      end;
   end;
end;
procedure TForm_Cad_PTSBase.ComboBox_CursoClick(Sender: TObject);
begin
 ComboBox_Curso.Style:= csDropDownList;
end;



end.
