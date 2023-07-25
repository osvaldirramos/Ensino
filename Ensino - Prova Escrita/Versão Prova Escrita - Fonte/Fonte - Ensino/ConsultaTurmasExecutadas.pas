//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : CadastroNota.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das notas dos alunos                           //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/03/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit ConsultaTurmasExecutadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, Rotinas, Rotinas_Sue,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, IBCustomDataSet, IBQuery, Rotinas_Validar,
  IBTable, Menus, JvGrdCpt, JvEdit, JvGradient,JvToolEdit, JvRichEd,
  JvDBRichEd, JvComponent, JvCaptionPanel, JvDBTreeView, JvItemsPanel,
  JvArrowBtn, TeEngine, Series, TeeProcs, Chart, DbChart, JvTypedEdit,
  JvDBLookupTreeView, JvxCtrls, JvShape, JvEnterTab, JvDBCtrl, PsyRichEdit,
  JvGroupHeader, JvTransBtn;

type
  TForm_ConsultaTurmasExecutadas = class(TForm)
    DSQ_MontaTurma: TDataSource;
    Query_MontaTurma: TIBQuery;
    Query_RelacaoAlunos: TIBQuery;
    DSQ_RelacaoAlunos: TDataSource;
    DST_Turma: TDataSource;
    IBTable_Turma: TIBTable;
    IBTable_TurmaIDCURSO: TSmallintField;
    IBTable_TurmaIDTURMA: TIntegerField;
    IBTable_TurmaTURMA: TIBStringField;
    IBTable_TurmaANO: TIBStringField;
    IBTable_TurmaDATAINICIO: TDateTimeField;
    IBTable_TurmaDATATERMINO: TDateTimeField;
    IBTable_TurmaDATAINICIODIST: TDateTimeField;
    IBTable_TurmaDATATERMINODIST: TDateTimeField;
    IBTable_TurmaRADIO: TIBStringField;
    IBTable_TurmaCOORDENADOR: TIBStringField;
    IBTable_TurmaDURACAO: TIntegerField;
    IBTable_TurmaSTATUS: TIBStringField;
    IBTable_TurmaCODSALA: TIBStringField;
    IBTable_TurmaMODALIDADE: TIBStringField;
    IBTable_TurmaCOD: TIntegerField;
    IBTable_TurmaCERTIFICADO: TIntegerField;
    IBTable_TurmaLOCAL1: TIBStringField;
    IBTable_TurmaQTDBRASILEIROS: TIntegerField;
    IBTable_TurmaQTDESTRANGEIROS: TIntegerField;
    IBTable_TurmaDESCRICAO: TIBStringField;
    Query_MontaTurmaIDCURSO: TSmallintField;
    Query_MontaTurmaIDTURMA: TIntegerField;
    Query_MontaTurmaCODCURSO: TIBStringField;
    Query_MontaTurmaTURMA: TIBStringField;
    Query_MontaTurmaANO: TIBStringField;
    Query_MontaTurmaDATAINICIO: TDateTimeField;
    Query_MontaTurmaDATATERMINO: TDateTimeField;
    Query_MontaTurmaQDEALUNOS: TIntegerField;
    Query_MontaTurmaCOORDENADOR: TIBStringField;
    JvCaptionPanel3: TJvCaptionPanel;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    MaskEdit_Turma: TJvEdit;
    MaskEdit_Ano: TJvEdit;
    JvDateEdit_Inicio: TJvDateEdit;
    JvDateEdit_Termino: TJvDateEdit;
    JvCaptionPanel4: TJvCaptionPanel;
    DBNavigator3: TDBNavigator;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_NomeAluno: TJvEdit;
    JvEdit_Media: TJvEdit;
    DBGrid_Alunos: TDBGrid;
    JvCaptionPanel2: TJvCaptionPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Documento: TJvDBRichEdit;
    GroupBox_DadosTurma: TGroupBox;
    Label38: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label_Modalidade: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label_DTD: TLabel;
    Label_DID: TLabel;
    Label11: TLabel;
    DBEdit_Turma: TDBEdit;
    DBEdit_OM: TDBEdit;
    DBEdit_Coordenador: TDBEdit;
    DBEdit_Radio: TDBEdit;
    JvDBDateEdit_DataInicio: TJvDBDateEdit;
    JvDBDateEdit_DataTermino: TJvDBDateEdit;
    JvDBDateEdit_DataTerminoDist: TJvDBDateEdit;
    JvDBDateEdit_DataInicioDist: TJvDBDateEdit;
    DBEdit_Ano: TDBEdit;
    DBComboBox_Modalidade: TDBComboBox;
    DBEdit_Descricao: TDBEdit;
    GroupBox_PrevisaoAlunos: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    DBEdit_QtdBrasileiros: TDBEdit;
    DBEdit_QtdEstrangeiros: TDBEdit;
    Panel_Botoes: TPanel;
    JvGradient2: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    Label_CodCurso: TLabel;
    Memo2: TMemo;
    ComboBox_Curso: TComboBox;
    DBNavigator2: TDBNavigator;
    JvShape2: TJvShape;
    JvGradient3: TJvGradient;
    JvShape_Ativar: TJvShape;
    JvTransparentButton_Ativar: TJvTransparentButton;
    Query_RelacaoAlunosIDCURSO: TSmallintField;
    Query_RelacaoAlunosIDTURMA: TIntegerField;
    Query_RelacaoAlunosNUMORDEM: TSmallintField;
    Query_RelacaoAlunosCODIGOALUNO: TIntegerField;
    Query_RelacaoAlunosNOTAFINAL: TIBBCDField;
    Query_RelacaoAlunosNOMECOMPLETO: TIBStringField;


    procedure MontaCurso(PS_Curso: String);
    procedure MontaTurma(Sender: TObject);
    procedure ExecutaQueryTurma;

    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ComboBox_CursoSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_AtivarClick(Sender: TObject);
  private    { Private declarations }
     VS_CodCurso, VS_IdCurso: String;
     VS_ComandoTurma, OrderByturma: String;
  public    { Public declarations }
     VB_SelecaoResponsavelAssinatura, VB_PossuiResposta: Boolean;
  end;

var
  Form_ConsultaTurmasExecutadas: TForm_ConsultaTurmasExecutadas;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Consultas - Consulta Cursos Finalizados');    // Abre o perfil do usuario em relacao a agenda

      Funcoes.CabecalhoForm( Form_ConsultaTurmasExecutadas, 'Consulta de Turmas Executadas');

      if DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'S' then
         Funcoes.TratarJvTransparentButton(JvTransparentButton_Ativar, JvShape_Ativar, True)
      else
         Funcoes.TratarJvTransparentButton(JvTransparentButton_Ativar, JvShape_Ativar, False);

      VB_SelecaoResponsavelAssinatura:= False;
       //---
      //--- Abre as tabelas que serao utilizadas

      Query_MontaTurma.Open;
      Query_RelacaoAlunos.Open;
      IBTable_Turma.Open;

      OrderByturma:= ' ano desc';

      //--- Tratamento da Selecao dos Cursos

      Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
      MontaCurso(Funcoes.GetCodCurso);
      Funcoes.SetCadCurso('CadCurso');
   end;
end;

//------------------------------------------------------------------------------
// Tratamento pquando fechar a Form
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_MontaTurma.Close;
   Query_RelacaoAlunos.Close;
   IBTable_Turma.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.JvTransparentButton_FecharClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do curso atraves do ENTER
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.ComboBox_CursoSelect(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text);
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao do Curso
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.MontaCurso(PS_Curso: String);
var
   Sender: TObject;
begin
   if VS_CodCurso <> PS_Curso then
   begin
      if trim(PS_Curso) <> '' then
      begin
         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select IdCurso, CodCurso, NomeCurso '+
                                                  'From Curso '+
                                                  ' where codcurso = '+#39+PS_Curso+#39
                             );

         if Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;

            VS_IdCurso:= DM.IBQuery_Executa.FieldByNAme('IdCurso').AsString;
            VS_CodCurso:= ComboBox_Curso.Text;

            MontaTurma(Sender);
          end
          else
          begin
             Showmessage('Curso não Cadastrado.');
          end;
       end;
   end;
end;

//------------------------------------------------------------------------------
//
// Turma
//
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_MontaTurma);
end;

//------------------------------------------------------------------------------
// Monta a estrutura da turma
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.MontaTurma(Sender: TObject);
begin
   VS_ComandoTurma:= 'Select * '+
                     ' from turmas_Executada_View '+
                      ' Where IdCurso = '+#39+VS_IdCurso+#39;

   if Trim(MaskEdit_Turma.Text) <> '' then
       VS_ComandoTurma:= VS_ComandoTurma+' and Turma Like '+#39+'%'+MaskEdit_Turma.Text+'%'+#39;

   if Trim(MaskEdit_Ano.Text) <> '' then
       VS_ComandoTurma:= VS_ComandoTurma+' and ano like '+#39+MaskEdit_Ano.Text+'%'+#39;

   if JvDateEdit_Inicio.Text <> '  /  /    ' then
   begin
      if Validar.ValidarData(JvDateEdit_Inicio.Text) = True then
         VS_ComandoTurma:= VS_ComandoTurma+' and datainicio = '+#39+Funcoes.TratarData(JvDateEdit_Inicio.Text)+#39;
   end;

   if JvDateEdit_Termino.Text <> '  /  /    ' then
   begin
      if Validar.ValidarData(JvDateEdit_Termino.Text) = True then
         VS_ComandoTurma:= VS_ComandoTurma+' and datatermino = '+#39+Funcoes.TratarData(JvDateEdit_Termino.Text)+#39;
   end;

   VS_ComandoTurma:= VS_ComandoTurma+' order by ';

   ExecutaQueryTurma;
end;

//------------------------------------------------------------------------------
// Monta os dados da turma
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.ExecutaQueryTurma;
begin
   Funcoes.ExecutaQuery(Query_MontaTurma,VS_ComandoTurma + OrderByturma);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para ativar o Curso
//------------------------------------------------------------------------------

procedure TForm_ConsultaTurmasExecutadas.JvTransparentButton_AtivarClick(Sender: TObject);
begin
   Funcoes.ExecusaoQuery( 'Update turma set status = '+#39+'A'+#39+
                          ' where idcurso = '+Query_MontaTurma.FieldbyName('IdCurso').AsString+
                          ' and idturma = '+Query_MontaTurma.FieldbyName('IdTurma').AsString
                        );
   Funcoes.AtualizaQuery(Query_MontaTurma);
end;

procedure TForm_ConsultaTurmasExecutadas.DBGrid1TitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Turma' then
       OrderByturma:= 'Ano, Turma desc'
   else
     if trim(column.Title.Caption) = 'Ano' then
         OrderByturma:= 'Ano, Turma desc'
     else
        if trim(column.Title.Caption) = 'Ínicio' then
           OrderByturma:= 'Ano, DataInicio desc'
        else
           if trim(column.Title.Caption) = 'Término' then
              OrderByturma:= 'Ano, DataTermino desc'
           else
              if trim(column.Title.Caption) = 'Qde Alunos' then
                 OrderByturma:= 'Ano, QdeAlunos ';

   Funcoes.ExecutaQuery(Query_MontaTurma, VS_ComandoTurma + OrderByturma);
end;

end.
