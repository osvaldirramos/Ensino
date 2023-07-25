//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Sel_Disciplina.pas                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da Selecao  //
//                             das Disciplinas dos Cursos.                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 15/07/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Sel_MontaProsima;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvLookOut, JvCheckBox, JvTransBtn;

type
  TForm_Sel_Avaliacao = class(TForm)
    PageControl_CadTurma: TPageControl;
    TabSheet_Instrutor: TTabSheet;
    DBGrid_SelecionaInstrutor: TDBGrid;
    TabSheet_Aluno: TTabSheet;
    DBGrid_SelecionaAluno: TDBGrid;
    IBQuery_MontaTurma: TIBQuery;
    DSQ_MontaTurma: TDataSource;
    IBQuery_AlunoTurma: TIBQuery;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaNUMORDEM: TSmallintField;
    IBQuery_AlunoTurmaNOME: TIBStringField;
    IBQuery_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_AlunoTurmaNOMEGUERRA: TIBStringField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaSEXO: TIBStringField;
    IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField;
    IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField;
    IBQuery_AlunoTurmaULTIMAPROMOCAO: TDateTimeField;
    IBQuery_AlunoTurmaIDUNIDADE: TIBStringField;
    IBQuery_AlunoTurmaIDSUBUNIDADE: TIBStringField;
    IBQuery_AlunoTurmaSARAM: TIBStringField;
    IBQuery_AlunoTurmaDATAMATRICULA: TDateTimeField;
    IBQuery_AlunoTurmaDATADESLIGAMENTO: TDateTimeField;
    IBQuery_AlunoTurmaCPF: TIBStringField;
    DSQ_AlunoTurma: TDataSource;
    IBQuery_InstrutorTurma: TIBQuery;
    IBQuery_InstrutorTurmaIDCURSO: TSmallintField;
    IBQuery_InstrutorTurmaIDTURMA: TIntegerField;
    IBQuery_InstrutorTurmaCODIGOINSTRUTOR: TIntegerField;
    IBQuery_InstrutorTurmaNOME: TIBStringField;
    IBQuery_InstrutorTurmaNOMEGUERRA: TIBStringField;
    IBQuery_InstrutorTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_InstrutorTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_InstrutorTurmaIDENTIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaIDSUBUNIDADE: TIBStringField;
    IBQuery_InstrutorTurmaFUNCAO: TIBStringField;
    IBQuery_InstrutorTurmaDATACHEGADA: TDateTimeField;
    IBQuery_InstrutorTurmaDATASAIDA: TDateTimeField;
    IBQuery_InstrutorTurmaAPRESENTACAO: TDateTimeField;
    IBQuery_InstrutorTurmaFICHA: TIBStringField;
    IBQuery_InstrutorTurmaSARAM: TIBStringField;
    DSQ_InstrutorTurma: TDataSource;
    IBTable_Cad_FichaAvl: TIBTable;
    DST_Cad_FichaAvl: TDataSource;
    IBTable_PR_Avaliacao: TIBTable;
    DST_Cad_Avaliacao: TDataSource;
    IBTable_Cad_FichaAvlIDCURSO: TSmallintField;
    IBTable_Cad_FichaAvlIDTURMA: TIntegerField;
    IBTable_Cad_FichaAvlID_FICHA: TIntegerField;
    IBTable_Cad_FichaAvlID_ATCO: TIBStringField;
    IBTable_Cad_FichaAvlID_AVL: TIBStringField;
    IBTable_Cad_FichaAvlID_EXERCICIO: TIntegerField;
    IBTable_Cad_FichaAvlNOMECOMPLETO: TIBStringField;
    IBTable_Cad_FichaAvlDATA_AVL: TDateTimeField;
    IBTable_Cad_FichaAvlLOCAL: TIBStringField;
    IBTable_Cad_FichaAvlMEDIA: TIBBCDField;
    IBTable_Cad_FichaAvlPARECER: TBlobField;
    IBTable_Cad_FichaAvlNS: TIBStringField;
    IBQuery_Ficha_Avl: TIBQuery;
    IBQuery_Ficha_AvlID_FICHA: TIntegerField;
    IBQuery_Ficha_AvlDESCRICAO: TIBStringField;
    IBQuery_Ficha_AvlDATA: TDateTimeField;
    DSQ_Ficha_Avl: TDataSource;
    IBQuery_Ficha_Item_View: TIBQuery;
    IBQuery_Ficha_Item_ViewID_FICHA: TIntegerField;
    IBQuery_Ficha_Item_ViewID_ITEM: TIBStringField;
    IBQuery_Ficha_Item_ViewID_AVL: TIntegerField;
    IBQuery_Ficha_Item_ViewAREA_AVALIACAO: TIBStringField;
    IBQuery_Ficha_Item_ViewDESCRICAO: TIBStringField;
    DSQ_Ficha_Item_View: TDataSource;
    IBTable_FichaAvaliacao: TIBTable;
    JvCaptionPanel_FichasAvaliadas: TJvCaptionPanel;
    DBGrid_SelFicha: TDBGrid;
    IBTable_Cad_FichaAvlID_INSTRUTOR: TIBStringField;
    IBTable_PR_AvaliacaoIDCURSO: TSmallintField;
    IBTable_PR_AvaliacaoIDTURMA: TIntegerField;
    IBTable_PR_AvaliacaoID_FICHA: TIntegerField;
    IBTable_PR_AvaliacaoID_ATCO: TIBStringField;
    IBTable_PR_AvaliacaoID_AVL: TIBStringField;
    IBTable_PR_AvaliacaoID_EXERCICIO: TIntegerField;
    IBTable_PR_AvaliacaoID_ITEM: TIBStringField;
    IBTable_PR_AvaliacaoOTIMO: TIBStringField;
    IBTable_PR_AvaliacaoBOM: TIBStringField;
    IBTable_PR_AvaliacaoREGULAR: TIBStringField;
    IBTable_PR_AvaliacaoNS: TIBStringField;
    IBTable_PR_AvaliacaoNA: TIBStringField;
    IBTable_PR_AvaliacaoAREA_AVALIACAO: TIBStringField;
    IBTable_PR_AvaliacaoDESCRICAO: TIBStringField;
    DSQ_PR_Avaliacao: TDataSource;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoID_FICHA: TIntegerField;
    IBTable_FichaAvaliacaoID_ATCO: TIBStringField;
    IBTable_FichaAvaliacaoID_AVL: TIBStringField;
    IBTable_FichaAvaliacaoID_EXERCICIO: TIntegerField;
    IBTable_FichaAvaliacaoID_ITEM: TIBStringField;
    IBTable_FichaAvaliacaoOTIMO: TIBStringField;
    IBTable_FichaAvaliacaoBOM: TIBStringField;
    IBTable_FichaAvaliacaoREGULAR: TIBStringField;
    IBTable_FichaAvaliacaoNS: TIBStringField;
    IBTable_FichaAvaliacaoNA: TIBStringField;
    IBTable_FichaAvaliacaoAREA_AVALIACAO: TIBStringField;
    IBTable_FichaAvaliacaoDESCRICAO: TIBStringField;
    IBQuery_PR_Avaliacao: TIBQuery;
    IBQuery_PR_AvaliacaoAREA_AVALIACAO: TIBStringField;
    IBQuery_PR_AvaliacaoBOM: TIBStringField;
    IBQuery_PR_AvaliacaoDESCRICAO: TIBStringField;
    IBQuery_PR_AvaliacaoID_ATCO: TIBStringField;
    IBQuery_PR_AvaliacaoID_AVL: TIBStringField;
    IBQuery_PR_AvaliacaoID_EXERCICIO: TIntegerField;
    IBQuery_PR_AvaliacaoID_FICHA: TIntegerField;
    IBQuery_PR_AvaliacaoID_ITEM: TIBStringField;
    IBQuery_PR_AvaliacaoIDCURSO: TSmallintField;
    IBQuery_PR_AvaliacaoIDTURMA: TIntegerField;
    IBQuery_PR_AvaliacaoNA: TIBStringField;
    IBQuery_PR_AvaliacaoNS: TIBStringField;
    IBQuery_PR_AvaliacaoOTIMO: TIBStringField;
    IBQuery_PR_AvaliacaoREGULAR: TIBStringField;
    DataSource1: TDataSource;
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
    IBTable_instrutor: TIBTable;
    DST_Instrutor: TDataSource;
    IBTable_instrutorIDCURSO: TSmallintField;
    IBTable_instrutorIDTURMA: TIntegerField;
    IBTable_instrutorIDENTIDADE: TIBStringField;
    IBTable_instrutorCODIGOINSTRUTOR: TIntegerField;
    IBTable_instrutorFUNCAO: TIBStringField;
    IBTable_instrutorNOMECOMPLETO: TIBStringField;
    IBTable_Aluno: TIBTable;
    DST_AlunoTurma: TDataSource;
    IBTable_AlunoIDCURSO: TSmallintField;
    IBTable_AlunoIDTURMA: TIntegerField;
    IBTable_AlunoIDENTIDADE: TIBStringField;
    IBTable_AlunoNOMECOMPLETO: TIBStringField;
    IBTable_AlunoIDUNIDADE: TIBStringField;
    IBTable_AlunoIDSUBUNIDADE: TIBStringField;
    IBTable_Cad_FichaAvlFICHACOMPLETA: TIBStringField;
    IBTable_CadParecer: TIBTable;
    DST_CadParecer: TDataSource;
    IBTable_CadParecerIDCURSO: TSmallintField;
    IBTable_CadParecerIDTURMA: TIntegerField;
    IBTable_CadParecerID_FICHA: TIntegerField;
    IBTable_CadParecerID_ATCO: TIBStringField;
    IBTable_CadParecerID_AVL: TIBStringField;
    IBTable_CadParecerID_EXERCICIO: TIntegerField;
    IBTable_CadParecerPARECER: TBlobField;
    IBTable_Estagiario_: TIBTable;
    DST_Estagiario: TDataSource;
    IBTable_Estagiario_ID_ATCO: TIBStringField;
    IBTable_Estagiario_ESTAGIARIO: TIBStringField;
    StatusBar2: TStatusBar;
    Panel2: TPanel;
    MaskEdit_Exercicio: TMaskEdit;
    MaskEdit_NomeCompleto: TMaskEdit;
    IBQuery_CadFichaAvl: TIBQuery;
    IBQuery_CadFichaAvlIDCURSO: TSmallintField;
    IBQuery_CadFichaAvlIDTURMA: TIntegerField;
    IBQuery_CadFichaAvlID_FICHA: TIntegerField;
    IBQuery_CadFichaAvlID_ATCO: TIBStringField;
    IBQuery_CadFichaAvlID_EXERCICIO: TIntegerField;
    IBQuery_CadFichaAvlID_AVL: TIBStringField;
    IBQuery_CadFichaAvlID_INSTRUTOR: TIBStringField;
    IBQuery_CadFichaAvlDATA_AVL: TDateTimeField;
    IBQuery_CadFichaAvlFICHACOMPLETA: TIBStringField;
    IBQuery_CadFichaAvlLOCAL: TIBStringField;
    IBQuery_CadFichaAvlMEDIA: TIBBCDField;
    IBQuery_CadFichaAvlNOMECOMPLETO: TIBStringField;
    IBQuery_CadFichaAvlNS: TIBStringField;
    IBQuery_CadFichaAvlPARECER: TBlobField;
    DSQ_Cad_FichaAvl: TDataSource;
    IBTable_AlunoESTAGIARIO: TIBStringField;
    IBQuery_CadFichaAvlINSTRUTOR: TIBStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    JvCaptionPanel_RelFichaAvl: TJvCaptionPanel;
    Panel_Sel_FichaAvaliacao: TPanel;
    JvDBDateEdit_DataAvaliacao: TJvDBDateEdit;
    DBEdit_NomeCompleto: TDBEdit;
    DBEdit_NomeInstrutor: TDBEdit;
    DBEdit_Exercicio: TDBEdit;
    DBEdit_Local: TDBEdit;
    CheckBox_Estagiario: TCheckBox;
    StatusBar_msg1: TStatusBar;
    DBGrid_Fichas: TDBGrid;
    Panel1: TPanel;
    SpeedButton_InserirNovaFicha: TSpeedButton;
    SpeedButton_CancelaInsercao: TSpeedButton;
    Panel_Botoes_Principal: TPanel;
    JvGradient1: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Retonar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvGradient2: TJvGradient;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    Panel_Botoes_Carga: TPanel;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    Panel_Turma: TPanel;
    JvShape2: TJvShape;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Splitter2: TSplitter;
    Label11: TLabel;
    Label_data: TLabel;
    Label_Versao: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    ComboBox_Turma: TComboBox;
    Memo1: TMemo;
    JvCaptionPanel_Regras: TJvCaptionPanel;
    Memo_Regra: TMemo;

    procedure Monta_ComboTurma;
    procedure FormActivate(Sender: TObject);

    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_SelFichaDblClick(Sender: TObject);
    procedure DBGrid_SelFichaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox_EstagiarioClick(Sender: TObject);
    procedure IBQuery_AlunoTurmaAfterScroll(DataSet: TDataSet);
    procedure DBGrid_SelecionaInstrutorDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_SelecionaAlunoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBEdit_ExercicioEnter(Sender: TObject);
    procedure DBEdit_ExercicioExit(Sender: TObject);
    procedure SpeedButton_InserirNovaFichaClick(Sender: TObject);
    procedure SpeedButton_CancelaInsercaoClick(Sender: TObject);
    procedure MaskEdit_NomeCompletoChange(Sender: TObject);
    procedure IBTable_Cad_FichaAvlPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);

    procedure AfterDelete(DataSet: TDataSet);
    procedure AfterEdit(DataSet: TDataSet);
    procedure AfterInsert( DataSet: TDataSet);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_RetonarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);

  private    { Private declarations }
     VS_CodCurso: String;
     MS_Turma: Array[1..1000] of String;
  public    { Public declarations }
     VS_Opcao: String;
  end;
var
  Form_Sel_Avaliacao: TForm_Sel_Avaliacao;

implementation

uses Module, MenuPrincipal, FichaAvaliacao, Relatorio_FichaAvl, Login;


{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.FormActivate(Sender: TObject);
begin
   if Form_Login.VS_Iniciar = 'ABERTURA' then
   begin
JvCaptionPanel_FichasAvaliadas.Align:= alClient;
      Form_Login.VS_Iniciar:= 'FICHA AVL';
      Label_Versao.Caption:= Versao;
      Label_data.Caption:= Ultima_Atualizacao;

      JvCaptionPanel_Regras.Visible:= False;
      JvDBDateEdit_DataAvaliacao.Date:= Date;

      PageControl_CadTurma.Width:= 1150;
      JvCaptionPanel_RelFichaAvl.Visible:= False;
      PageControl_CadTurma.Visible:= False;


      IBQuery_CadFichaAvl.Close;
      IBQuery_InstrutorTurma.Close;
      IBQuery_PR_Avaliacao.Close;
      IBQuery_AlunoTurma.Close;
      IBQuery_Ficha_Avl.Close;
      IBQuery_Ficha_Item_View.Close;

      IBTable_PR_Avaliacao.Close;
      IBTable_Cad_FichaAvl.Close;
      IBTable_FichaAvaliacao.Close;
      IBTable_instrutor.Close;
      IBTable_Aluno.Close;

      IBQuery_CadFichaAvl.Open;
      IBQuery_PR_Avaliacao.Open;
      IBQuery_AlunoTurma.Open;
      IBQuery_InstrutorTurma.Open;
      IBQuery_Ficha_Avl.Open;
      IBQuery_Ficha_Item_View.Open;

      IBTable_PR_Avaliacao.Open;
      IBTable_Cad_FichaAvl.Open;
      IBTable_FichaAvaliacao.Open;
      IBTable_instrutor.Open;
      IBTable_Aluno.Open;

      VS_CodCurso:= '';
      VS_Opcao:= 'Consulta';

      //--- Tratamento da Selecao dos Cursos

      Monta_ComboTurma;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_RetonarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_CadFichaAvl);
end;

//------------------------------------------------------------------------------
// Tratamento do Combo de Selecao da Turma
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.ComboBox_TurmaChange(Sender: TObject);
var
   VI_IdTurma: Integer;
begin
   if Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-')) <> '' then
   begin
     VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
     if MS_Turma[VI_IdTurma] <> '-2' then
        Funcoes.ExecutaQuery(IBQuery_MontaTurma, 'Select IdCurso, IdTurma, Turma, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao, CodSala '+
                                                 ' from turma '+
                                                 ' Where IdCurso = '+Funcoes.GetIdCurso+
                                                 ' and IdTurma = '+MS_Turma[VI_IdTurma]
                            )
      else
        Funcoes.ExecutaQuery(IBQuery_MontaTurma, 'Select IdCurso, IdTurma, Turma, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao, CodSala '+
                                                 ' from turma '+
                                                 ' Where IdCurso = '+Funcoes.GetIdCurso+
                                                 ' and IdTurma = '+MS_Turma[1]
                            );
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.Monta_ComboTurma;
var
   VS_Opcao, VS_Comando :String;
   VI_Indice: Integer;
   Sender: TObject;
begin
   //--- Tratamento da Alimentacao do Combo de selecao da Turma

   VS_Comando:= 'Select * From Turma where IdCurso = '+Funcoes.GetIdCurso;

   if DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString <> '' then
   begin
      VS_Opcao:= ' and ';
      DM.IBQuery_Login_Instrutor.First;
      While not DM.IBQuery_Login_Instrutor.eof do
      begin
         if VS_Opcao = ' and ' then
         begin
            VS_Comando:= VS_Comando+' and ( IdTurma = '+DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString;
            VS_Opcao:= ' or ';
         end
         else
         begin
            VS_Comando:= VS_Comando+' or IdTurma = '+DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString;
         end;

         DM.IBQuery_Login_Instrutor.Next;
      end;
      VS_Comando:= VS_Comando+' )';
   end;

   VS_Comando:= VS_Comando+' and Status <> '+#39+'P'+#39+' Order By IdTurma desc';

   Funcoes.OpenQuery(IBQuery_MontaTurma,VS_Comando);
   IBQuery_MontaTurma.First;

   VI_Indice:= 1;

   While not IBQuery_MontaTurma.Eof do
   begin
     if ((Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'PIL') and
         (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,4) <> 'COPM') and
         (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'BDS')) then
         Break
     else
         IBQuery_MontaTurma.Next;
   end;

   ComboBox_Turma.Items.Clear;
   if Trim(IBQuery_MontaTurma.FieldByName('IdTurma').AsString) = '' then
   begin
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= '-2';
   end
   else
   begin
     if ((Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'PIL') and
         (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,4) <> 'COPM') and
         (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'BDS')) then
     begin
        ComboBox_Turma.Text:= IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+IBQuery_MontaTurma.FieldByName('Descricao').AsString;
        MS_Turma[VI_Indice]:= IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
     end;
   end;

   While not IBQuery_MontaTurma.Eof do
   begin
     if ((Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'PIL') and
         (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,4) <> 'COPM') and
         (Copy(IBQuery_MontaTurma.FieldByName('Turma').AsString,5,3) <> 'BDS')) then
      begin
         ComboBox_Turma.Items.Add( IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+IBQuery_MontaTurma.FieldByName('Descricao').AsString);
         VI_Indice:= VI_Indice + 1;
         MS_Turma[VI_Indice]:= IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end;
      IBQuery_MontaTurma.Next;
   end;
//  IBQuery_MontaTurma.First;
  ComboBox_TurmaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.SpeedButton_InserirNovaFichaClick(Sender: TObject);
var
   VS_NA: String;
   VB_Montar_FichaAvl: Boolean;
   VI_Cont: Integer;
begin
   if IBQuery_AlunoTurma.FieldByName('Identidade').AsString = '' then
      ShowMessage('Não possuí aluno Cadastrado...')
   else
   begin
      if IBQuery_InstrutorTurma.FieldByName('Identidade').AsString = '' then
      Begin
         ShowMessage('Não possuí Instrutor Cadastrado...');
      end
      else
      begin
         if DBEdit_Exercicio.Text = '' then
         begin
            ShowMessage('O número do Execicico não pode ser branco...');
            DBEdit_Exercicio.SetFocus;
         end
         else
         begin
            if Trim(Funcoes.DePara(JvDBDateEdit_DataAvaliacao.Text,'/', '')) = '' then
            begin
               ShowMessage('A Data da Avaliação não pode ser branca...')
            end
            else
            begin
               if DBEdit_Local.Text = '' then
               begin
                  ShowMessage('O Local da Avaliação não pode ser branca...')
               end
               else
               begin

                Funcoes.OpenQueryProsima( DM.IBQuery_ExecutaProsima, 'Select count(1) as Qtd From Cad_Ficha_Avl '+
                                                                     ' Where IDCURSO = '+IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+
                                                                     ' and IDTURMA = '+IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+
                                                                     ' and ID_ATCO = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+
                                                                     ' and ID_FICHA = '+IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString+
                                                                     ' and ID_AVL = '+#39+IBQuery_Ficha_Item_View.FieldByName('ID_AVL').AsString+#39+
                                                                     ' and Id_EXERCICIO = '+DBEdit_Exercicio.Text
                                        );

                if DM.IBQuery_ExecutaProsima.FieldByName('Qtd').AsInteger > 0 then
                begin
                    ShowMessage('Já existe Ficha de Avaliação Cadastrada...')
                end
                else
                begin
                    Funcoes.OpenQueryProsima( DM.IBQuery_ExecutaProsima, 'Select count(1) as Qtd From Pessoa Where identidade = '+#39+IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39);

                    if DM.IBQuery_ExecutaProsima.FieldByName('Qtd').AsInteger = 0 then
                        Funcoes.ExecSqlProsima( 'Insert into pessoa (Identidade, Nome) Values ('+#39+IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39+', '+#39+IBQuery_InstrutorTurma.FieldByName('Nome').AsString+#39+')');

                    DM.VS_Exercicio:= DBEdit_Exercicio.Text;
                    DM.VS_data:= IBTable_Cad_FichaAvl.FieldByName('Data_avl').AsString;

                     //--- Cadastra o Cabecalho da Ficha de Avaliacao

                     IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString:= IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
                     IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString:= IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
                     IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString:= IBQuery_AlunoTurma.FieldByName('Identidade').AsString;
                     IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString:= IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString;
                     IBTable_Cad_FichaAvl.FieldByName('ID_AVL').AsString:= IBQuery_Ficha_Item_View.FieldByName('ID_AVL').AsString;
                     IBTable_Cad_FichaAvl.FieldByName('ID_INSTRUTOR').AsString:= IBQuery_InstrutorTurma.FieldByName('Identidade').AsString;
                     IBTable_Cad_FichaAvl.FieldByName('Id_EXERCICIO').AsString:= DBEdit_Exercicio.Text;
                     IBTable_Cad_FichaAvl.FieldByName('NOMECOMPLETO').AsString:= IBQuery_AlunoTurma.FieldByName('NOMECOMPLETO').AsString;
                     IBTable_Cad_FichaAvl.FieldByName('FICHACOMPLETA').AsString:= 'N';

                     VB_Montar_FichaAvl:= False;

                     While VB_Montar_FichaAvl = False do
                     begin
                        //--- Verifica se a Ficha já foi Cadastrada

                        Funcoes.ExecSqlProsima( 'Delete From PR_Avaliacao '+
                                                ' Where IDCURSO = '+IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+
                                                ' and IDTURMA = '+IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+
                                                ' and ID_FICHA = '+IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString+
                                                ' and ID_ATCO = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+
                                                ' and Id_EXERCICIO = '+DBEdit_Exercicio.Text
                                              );

                       Funcoes.ExecSqlProsima( 'Delete From Rel_NS Where IDCURSO = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+
                                               ' and IDTURMA = '+IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+
                                               ' and ID_FICHA = '+IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString+
                                               ' and ID_ATCO = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+
                                               ' and Id_EXERCICIO = '+DBEdit_Exercicio.Text
                                              );

                        //-- Cadastra a Ficha de Avaliacao

                        VI_Cont:= 1;
                        IBQuery_Ficha_Item_View.First;
                        While not IBQuery_Ficha_Item_View.Eof do
                        begin
                           if IBQuery_Ficha_Item_View.FieldByName('ID_ITEM').AsString = 'J' then
                           begin
                              if (( copy(ComboBox_Turma.Text,5,4) = 'TWR3') or (copy(ComboBox_Turma.Text,5,4) = 'TWRS')) then
                                 VS_NA:= '1'
                              else
                                 VS_NA:= '0';
                           end
                           else
                              VS_NA:= '0';

                           Funcoes.ExecSqlProsima('Insert Into PR_Avaliacao (IDCURSO, IDTURMA, ID_FICHA, ID_ATCO, Id_EXERCICIO, ID_Item, ID_AVL, Otimo, Bom, Regular, NS, NA, Area_Avaliacao, Descricao) '+
                                                  ' Values ('+IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+', '+
                                                          IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+', '+
                                                          IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString+', '+
                                                          #39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+', '+
                                                          DBEdit_Exercicio.Text+', '+
                                                          #39+IBQuery_Ficha_Item_View.FieldByName('ID_ITEM').AsString+#39+', '+
                                                          #39+IBQuery_Ficha_Item_View.FieldByName('ID_AVL').AsString+#39+', '+
                                                          #39+'0'+#39+', '+
                                                          #39+'0'+#39+', '+
                                                          #39+'0'+#39+', '+
                                                          #39+'0'+#39+', '+
                                                          #39+VS_NA+#39+', '+
                                                          #39+IBQuery_Ficha_Item_View.FieldByName('AREA_AVALIACAO').AsString+#39+', '+
                                                          #39+IBQuery_Ficha_Item_View.FieldByName('DESCRICAO').AsString+#39+
                                                       ') '
                                                 );
                           IBQuery_Ficha_Item_View.Next;
                           Funcoes.ExecutaTransacao_Prosima;
                           VI_Cont:= VI_Cont + 1;
                        end;

                        /// verifica se  esta faltando item

                        if VI_Cont < 51 then
                        begin
                           Funcoes.OpenQueryExecuta('Select count(1) as Qtd From PR_Avaliacao '+
                                                    ' Where IDCURSO = '+IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+
                                                    ' and IDTURMA = '+IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+
                                                    ' and ID_FICHA = '+IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString+
                                                    ' and ID_ATCO = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+
                                                    ' and Id_EXERCICIO = '+DBEdit_Exercicio.Text
                                                   );
                           if DM.IBQuery_Executa_ensino.FieldByName('Qtd').AsInteger = 51 then
                              VB_Montar_FichaAvl:= True;
                        end
                        else
                        begin
                           VB_Montar_FichaAvl:= True;
                        end;
                     end;
                     PageControl_CadTurma.Visible:= False;
                     JvCaptionPanel_RelFichaAvl.Visible:= False;
                     JvCaptionPanel_FichasAvaliadas.Visible:= True;

                     Funcoes.AtualizaQuery(IBQuery_PR_Avaliacao);
                     Panel_Turma.Enabled:= True;
                     Panel_Botoes_Principal.Enabled:= True;

                     Form_FichaAvaliacao.ShowMOdal;
                     Panel_Botoes_Principal.Enabled:= True;
                     Panel_Botoes_Carga.Visible:= True;
                  end;
               end;
            end
         end
      end;
   end;
end;

procedure TForm_Sel_Avaliacao.SpeedButton_CancelaInsercaoClick(Sender: TObject);
begin
   IBTable_Cad_FichaAvl.Cancel;
   Funcoes.abortaTransacao_Prosima;

   PageControl_CadTurma.Visible:= False;
   JvCaptionPanel_RelFichaAvl.Visible:= False;
   JvCaptionPanel_FichasAvaliadas.Visible:= True;
   Panel_Botoes_Carga.Visible:= True;
   Panel_Turma.Enabled:= True;
   Panel_Botoes_Principal.Enabled:= True;
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao para cadastrar uma nova Ficha
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_InserirClick(Sender: TObject);
begin
   if Trim(IBQuery_AlunoTurma.FieldByName('IdCurso').AsString) = '' then
   begin
      ShowMessage('A Turma Selecionada não possuí Aluno Cadastrado...'+#13+'Favor entrar em contato com o Responsável para Cadastrar os Alunos.');
   end
   else
   begin
      if Trim(IBQuery_InstrutorTurma.FieldByName('IdCurso').AsString) = '' then
      begin
         ShowMessage('A Turma Selecionada não possuí Coordenador nem Instrutor Cadastrado...'+#13+'Favor entrar em contato com o Responsável para Cadastrar os Coordenador / Instrutores.');
      end
      else
      begin
         Funcoes.AtualizaQuery(IBQuery_AlunoTurma);
         Funcoes.AtualizaQuery(IBQuery_InstrutorTurma);

         if IBTable_Aluno.FieldByName('Estagiario').AsString = 'S' then
            CheckBox_Estagiario.State:= cbChecked
         else
            CheckBox_Estagiario.State:= cbUnchecked;

         Panel_Turma.Enabled:= False;
         Panel_Botoes_Carga.Visible:= False;
         Panel_Botoes_Principal.Enabled:= False;

         Application.CreateForm(TForm_FichaAvaliacao, Form_FichaAvaliacao);

         VS_Opcao:= 'Inserir';
         JvCaptionPanel_FichasAvaliadas.Visible:= False;
         PageControl_CadTurma.Visible:= True;
         JvCaptionPanel_RelFichaAvl.Visible:= True;
         IBTable_Cad_FichaAvl.Append;
         IBTable_Cad_FichaAvl.FieldByName('Data_avl').AsString:= DM.VS_data;
         IBTable_Cad_FichaAvl.FieldByName('Local').AsString:= 'ICEA';
         DBEdit_Exercicio.Text:= DM.VS_Exercicio;
         DBEdit_Exercicio.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para alterar a Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   if IBTable_Cad_FichaAvl.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage('Não possui Exercicio para Corrigir...');
   end
   else
   begin
      VS_Opcao:= 'Alterar';
      Application.CreateForm(TForm_FichaAvaliacao, Form_FichaAvaliacao);
      Form_FichaAvaliacao.ShowMOdal;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Exclui a Ficha de Avaliacao Selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno, VI_Cont, VI_Tam: Integer;

   VS_Retorno, VS_IdAvl: String;
begin
   if IBTable_Cad_FichaAvl.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage('Não possui Exercicio para Excluir...');
   end
   else
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Arquivo selecionada '+#13+#13+'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         VS_IdAvl:= Funcoes.InserirPos(IBTable_Cad_FichaAvl.FieldByName('ID_AVL').AsString, 20);
         VI_Tam:= 20-Length(VS_IdAvl);
         VS_Retorno:= Trim(VS_IdAvl);
         For VI_Cont:= 1 to VI_Tam do
         begin
            VS_IdAvl:= VS_IdAvl+' ';
         end;

         Funcoes.ExecSqlProsima( 'Delete From PR_Avaliacao Where IDCURSO = '+IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                                         ' IDTURMA = '+IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                                         ' ID_ATCO = '+#39+IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                                         ' ID_FICHA = '+IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                                         ' ID_Exercicio = '+IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString
                               );

         Funcoes.ExecSqlProsima( 'Delete From Cad_Parecer Where IDCURSO = '+IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                                         ' IDTURMA = '+IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                                         ' ID_ATCO = '+#39+IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                                         ' ID_FICHA = '+IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                                         ' ID_Exercicio = '+IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString
                               );

         Funcoes.ExecSqlProsima( 'Delete From Rel_NS Where IDCURSO = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                                         ' IDTURMA = '+IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                                         ' ID_ATCO = '+#39+IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                                         ' ID_FICHA = '+IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                                         ' ID_Exercicio = '+IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString
                               );

         IBTable_Cad_FichaAvl.Delete;
         Funcoes.ExecutaTransacao_Prosima;
         Funcoes.AtualizaQuery(IBQuery_CadFichaAvl);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Duplo Click
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBGrid_SelFichaDblClick(Sender: TObject);
begin
   JvTransparentButton_AlterarClick(Sender);
end;


//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBGrid_SelFichaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If Odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      DBGrid_SelFicha.Canvas.Brush.Color:= clWhite
   else
      DBGrid_SelFicha.Canvas.Brush.Color:= $00EFEFEF;

   // Testa se o registro da linha atual está selecionado
   If gdSelected in State Then
   Begin
      // Cor de fundo do registro selecionado
      DBGrid_SelFicha.Canvas.Brush.Color:= clNavy;
      // Cor do texto para o registro selecionado
      DBGrid_SelFicha.Canvas.Font.Color:= clYellow;
   End
   Else   // Cor do texto para registros não selecionados
      DBGrid_SelFicha.Canvas.Font.Color:= clBlack;

   // Tratamento do zebrado

   if IBQuery_CadFichaAvl.FieldByName('FICHACOMPLETA').AsString = 'N' then
     DBGrid_SelFicha.Canvas.Font.Color:= clRed
   else
      DBGrid_SelFicha.Font.Color:= clBlack;

  if gdSelected in State then
    DBGrid_SelFicha.Canvas.Brush.Color := $008E4F15;

  DBGrid_SelFicha.Canvas.FillRect(Rect);
  DBGrid_SelFicha.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
end;

//------------------------------------------------------------------------------
// Tratamento Quando Click no Check de Estagiario
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.CheckBox_EstagiarioClick(Sender: TObject);
var
   x: string;
begin
   IBTable_Aluno.Edit;

   x:= IBTable_Aluno.FieldByName('IdCurso').AsString;
   x:= IBTable_Aluno.FieldByName('IdTurma').AsString;

   if CheckBox_Estagiario.State = cbChecked then
      IBTable_Aluno.FieldByName('Estagiario').AsString:= 'S'
   else
      IBTable_Aluno.FieldByName('Estagiario').AsString:= 'N';
   IBTable_Aluno.Post;
   Funcoes.ExecutaTransacao_Prosima;
end;

//------------------------------------------------------------------------------
// Tratamento para Identificar se o Aluno é Estagiario
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.IBQuery_AlunoTurmaAfterScroll(  DataSet: TDataSet);
begin
   if IBTable_Aluno.FieldByName('Estagiario').AsString = 'S' then
      CheckBox_Estagiario.State:= cbChecked
   else
      CheckBox_Estagiario.State:= cbUnchecked;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBGrid_SelecionaAlunoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If Odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      DBGrid_SelecionaAluno.Canvas.Brush.Color:= clWhite             // Cor para linhas ímpares
   else
      DBGrid_SelecionaAluno.Canvas.Brush.Color:= $00EFEFEF;        // Cor para linhas pares

   // Testa se o registro da linha atual está selecionado

   If gdSelected in State Then
   Begin
      DBGrid_SelecionaAluno.Canvas.Brush.Color:= clNavy;          // Cor de fundo do registro selecionado
      DBGrid_SelecionaAluno.Canvas.Font.Color:= clYellow;        // Cor do texto para o registro selecionado
   End
   Else
      DBGrid_SelecionaAluno.Canvas.Font.Color:= clBlack;       // Cor do texto para registros não selecionados

   DBGrid_SelecionaAluno.Canvas.FillRect(Rect);   // Desenha o retângulo da célula
   DBGrid_SelecionaAluno.Canvas.TextRect(Rect, Rect.Left + 2,   // Apresenta o texto da célula
   Rect.Top, Column.Field.DisplayText);
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBGrid_SelecionaInstrutorDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If Odd(DBGrid_SelecionaInstrutor.DataSource.DataSet.RecNo) then
   begin      // Cor para linhas ímpares
      DBGrid_SelecionaInstrutor.Canvas.Brush.Color:= clWhite;
   end
   else
   begin      // Cor para linhas pares
      DBGrid_SelecionaInstrutor.Canvas.Brush.Color:= $00EFEFEF;
   end;

   // Testa se o registro da linha atual está selecionado
   If gdSelected in State Then
   Begin
      // Cor de fundo do registro selecionado
      DBGrid_SelecionaInstrutor.Canvas.Brush.Color:= clNavy;
      // Cor do texto para o registro selecionado
      DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clYellow;
   End
   Else   // Cor do texto para registros não selecionados
      DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clBlack;

   DBGrid_SelecionaInstrutor.Canvas.FillRect(Rect);
   DBGrid_SelecionaInstrutor.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, Column.Field.DisplayText);

end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBEdit_ExercicioEnter(Sender: TObject);
begin
   if  ((copy(ComboBox_Turma.Text,5,4) = 'TWR3' ) or (copy(ComboBox_Turma.Text,5,4) = 'TWRS')) then
      JvCaptionPanel_Regras.Visible:= True;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBEdit_ExercicioExit(Sender: TObject);
begin
   JvCaptionPanel_Regras.Visible:= False;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.MaskEdit_NomeCompletoChange(Sender: TObject);
var
    VS_Comando: String;
begin
   VS_Comando:= ' Select f.IdCurso, f.IdTurma, f.Id_Ficha, f.Id_ATCO, f.ID_Exercicio, f.Id_AVL, f.Id_Instrutor, p.nome as Instrutor, f.Data_Avl,  f.FichaCompleta, f.Local, f.Media, f.NomeCompleto, f.NS, f.Parecer ' +
                ' From CAD_FICHA_AVL f, pessoa p '+
                ' Where f.IdCurso = :IdCurso '+
                ' and f.IdTurma = :IdTurma '+
                ' and f.id_instrutor = p.identidade ';

   if Trim(MaskEdit_Exercicio.Text) <> '' then
      VS_Comando:= VS_Comando+'  and f.Id_Exercicio = '+trim(MaskEdit_Exercicio.Text);

   if Trim(MaskEdit_NomeCompleto.Text) <> '' then
      VS_Comando:= VS_Comando+'  and f.NomeCompleto Like '+#39+'%'+trim(MaskEdit_NomeCompleto.Text)+'%'+#39;

   VS_Comando:= VS_Comando+' Order By f.NomeCompleto, f.Id_Exercicio ';

   IBQuery_CadFichaAvl.Close;
   IBQuery_CadFichaAvl.SQL.Clear;
   IBQuery_CadFichaAvl.Sql.Add(VS_Comando);
   IBQuery_CadFichaAvl.Open;
end;

procedure TForm_Sel_Avaliacao.IBTable_Cad_FichaAvlPostError( DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
     if (E as EDBEngineError).Errors[0].Errorcode = 9729 then
     begin
        MessageDlg('  O Curso já foi cadastrado...  ',mtError, [mbOk],0);
        Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Cancel;
        Funcoes.ExecutaTransacao_Prosima;
        Close;
     end;
end;

procedure TForm_Sel_Avaliacao.AfterDelete(DataSet: TDataSet);
begin
   DM.IBTransaction_Prosima.CommitRetaining;
end;

procedure TForm_Sel_Avaliacao.AfterEdit(DataSet: TDataSet);
begin
   DM.IBTransaction_Prosima.CommitRetaining;
end;

procedure TForm_Sel_Avaliacao.AfterInsert( DataSet: TDataSet);
begin
   DM.IBTransaction_Prosima.CommitRetaining;
end;
end.

