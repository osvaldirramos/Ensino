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

unit Carga_Historico;

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
  TForm_Carga_Historico_ = class(TForm)
    DSQ_MontaTurma: TDataSource;
    IBQuery_MontaTurma: TIBQuery;
    Query_RelacaoAlunos: TIBQuery;
    DSQ_RelacaoAlunos: TDataSource;
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
    JvShape_Ativar: TJvShape;
    JvTransparentButton_Ativar: TJvTransparentButton;
    Query_RelacaoAlunosIDCURSO: TSmallintField;
    Query_RelacaoAlunosIDTURMA: TIntegerField;
    Query_RelacaoAlunosNUMORDEM: TSmallintField;
    Query_RelacaoAlunosCODIGOALUNO: TIntegerField;
    Query_RelacaoAlunosNOTAFINAL: TIBBCDField;
    Query_RelacaoAlunosNOMECOMPLETO: TIBStringField;
    IBTable_H_Curso: TIBTable;
    DataSource1: TDataSource;
    IBTable_H_Turma: TIBTable;
    DataSource2: TDataSource;
    IBTable_H_CursoIDCURSO: TSmallintField;
    IBTable_H_CursoCODCURSO: TIBStringField;
    IBTable_H_CursoNOMECURSO: TIBStringField;
    IBTable_H_CursoDESCRICAO: TIBStringField;
    IBTable_H_CursoTOTALEXAMESTEORICOS: TSmallintField;
    IBTable_H_CursoTOTALEXAMESPRATICOS: TSmallintField;
    IBTable_H_CursoNUMEROSEMANAAULAS: TSmallintField;
    IBTable_H_CursoPAET: TIBStringField;
    IBTable_H_CursoCOPM: TIBStringField;
    IBTable_H_CursoNAOIMPRIMIRDIPLOMA: TIBStringField;
    IBTable_H_TurmaIDCURSO: TSmallintField;
    IBTable_H_TurmaIDTURMA: TIntegerField;
    IBTable_H_TurmaTURMA: TIBStringField;
    IBTable_H_TurmaANO: TIBStringField;
    IBTable_H_TurmaDATAINICIO: TDateTimeField;
    IBTable_H_TurmaDATATERMINO: TDateTimeField;
    IBTable_H_TurmaDATAINICIODIST: TDateTimeField;
    IBTable_H_TurmaDATATERMINODIST: TDateTimeField;
    IBTable_H_TurmaRADIO: TIBStringField;
    IBTable_H_TurmaCOORDENADOR: TIBStringField;
    IBTable_H_TurmaDURACAO: TIntegerField;
    IBTable_H_TurmaSTATUS: TIBStringField;
    IBTable_H_TurmaMODALIDADE: TIBStringField;
    IBTable_H_TurmaCOD: TIntegerField;
    IBTable_H_TurmaCERTIFICADO: TIntegerField;
    IBTable_H_TurmaQTDBRASILEIROS: TIntegerField;
    IBTable_H_TurmaQTDESTRANGEIROS: TIntegerField;
    IBTable_H_TurmaDESCRICAO: TIBStringField;
    IBTable_H_TurmaPARTICIPA_ESTATISTICA: TIBStringField;
    IBTable_H_TurmaLOCAL2: TIBStringField;
    IBTable_H_TurmaADMINISTRATIVAS: TIntegerField;
    IBTable_H_TurmaINSTRUCAO: TIntegerField;
    IBTable_H_TurmaFLEXIBILIZACAO: TIntegerField;
    IBTable_H_TurmaAVALIACAO: TIntegerField;
    IBTable_H_TurmaLOCAL1: TIBStringField;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaDATAINICIODIST: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINODIST: TDateTimeField;
    IBQuery_MontaTurmaRADIO: TIBStringField;
    IBQuery_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_MontaTurmaDURACAO: TIntegerField;
    IBQuery_MontaTurmaSTATUS: TIBStringField;
    IBQuery_MontaTurmaCODSALA: TIBStringField;
    IBQuery_MontaTurmaMODALIDADE: TIBStringField;
    IBQuery_MontaTurmaCOD: TIntegerField;
    IBQuery_MontaTurmaCERTIFICADO: TIntegerField;
    IBQuery_MontaTurmaLOCAL1: TIBStringField;
    IBQuery_MontaTurmaQTDBRASILEIROS: TIntegerField;
    IBQuery_MontaTurmaQTDESTRANGEIROS: TIntegerField;
    IBQuery_MontaTurmaDESCRICAO: TIBStringField;
    IBQuery_MontaTurmaPARTICIPA_ESTATISTICA: TIBStringField;
    IBQuery_MontaTurmaLOCAL2: TIBStringField;
    IBQuery_MontaTurmaADMINISTRATIVAS: TIntegerField;
    IBQuery_MontaTurmaINSTRUCAO: TIntegerField;
    IBQuery_MontaTurmaFLEXIBILIZACAO: TIntegerField;
    IBQuery_MontaTurmaAVALIACAO: TIntegerField;

    Function Trata_Null(VS_String: String): String;

    procedure TratarCargaCurso(CodCurso: String);
    procedure TratarCargaTurma(IdCurso, IdTurma: String);
    procedure TratarAlunoTurma(IdCurso, IdTurma: String);


    procedure Executa_Query(VS_Comando: String);
    procedure ExecSql_Query(VS_Comando: String);
    Procedure ExecutaTransacao;

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
  end;

var
  Form_Carga_Historico_: TForm_Carga_Historico_;

implementation

uses Module, Module_Historico_SGEW;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Ferramentas - Carga de turmas executadas para o Histórico');    // Abre o perfil do usuario em relacao a agenda

      Funcoes.CabecalhoForm( Form_Carga_Historico_, 'Carga de turmas executadas para o Histórico');

//      if DM.Query_PerfilAcesso.FieldByName('Inserir').AsString = 'S' then
         Funcoes.TratarJvTransparentButton(JvTransparentButton_Ativar, JvShape_Ativar, True);
//      else
//         Funcoes.TratarJvTransparentButton(JvTransparentButton_Ativar, JvShape_Ativar, False);

       //---
      //--- Abre as tabelas que serao utilizadas

      IBQuery_MontaTurma.Open;
      Query_RelacaoAlunos.Open;

      IBTable_H_Curso.Open;
      IBTable_H_Turma.Open;

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

procedure TForm_Carga_Historico_.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_MontaTurma.Close;
   Query_RelacaoAlunos.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.JvTransparentButton_FecharClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do curso atraves do ENTER
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.ComboBox_CursoSelect(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text);
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao do Curso
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.MontaCurso(PS_Curso: String);
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

procedure TForm_Carga_Historico_.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_MontaTurma);
end;

//------------------------------------------------------------------------------
// Monta a estrutura da turma
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.MontaTurma(Sender: TObject);
begin
   VS_ComandoTurma:= 'Select * '+
                     ' from Turma '+
                      ' Where IdCurso = '+#39+VS_IdCurso+#39+
                      ' and   Status = '+#39+'E'+#39
                      ;

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

procedure TForm_Carga_Historico_.ExecutaQueryTurma;
begin
   Funcoes.ExecutaQuery(IBQuery_MontaTurma,VS_ComandoTurma + OrderByturma);
end;

//------------------------------------------------------------------------------
// Tratamento para organizar o cabecalho
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.DBGrid1TitleClick(Column: TColumn);
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

   Funcoes.ExecutaQuery(IBQuery_MontaTurma, VS_ComandoTurma + OrderByturma);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para ativar o Curso
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.JvTransparentButton_AtivarClick(Sender: TObject);
var
   VS_IdCurso, VS_IdTurma: String;
begin
   VS_IdCurso:= IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
   VS_IdTurma:= IBQuery_MontaTurma.FieldByName('IdTurma').AsString;

   TratarCargaCurso(ComboBox_Curso.Text);
   TratarCargaTurma(VS_IdCurso, VS_IdTurma);
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro da Turma no Historico
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.TratarAlunoTurma(IdCurso, IdTurma: String);
begin
   Executa_Query( 'Select IdCurso From Turma Where IdCurso = '+IdCurso+' and   IdTurma = '+IdTurma );

   if DM_Historico_SGEW.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
   begin
      IBTable_H_Turma.Append;
      IBTable_H_Turma.FieldByName('IDCURSO').AsString:= IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
      IBTable_H_Turma.FieldByName('IDTURMA').AsString:= IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
      IBTable_H_Turma.FieldByName('TURMA').AsString:= IBQuery_MontaTurma.FieldByName('TURMA').AsString;
      IBTable_H_Turma.FieldByName('ANO').AsString:= IBQuery_MontaTurma.FieldByName('ANO').AsString;
      IBTable_H_Turma.FieldByName('DATAINICIO').AsString:= IBQuery_MontaTurma.FieldByName('DATAINICIO').AsString;
      IBTable_H_Turma.FieldByName('DATATERMINO').AsString:= IBQuery_MontaTurma.FieldByName('DATATERMINO').AsString;
      IBTable_H_Turma.FieldByName('DATAINICIODIST').AsString:= IBQuery_MontaTurma.FieldByName('DATAINICIODIST').AsString;
      IBTable_H_Turma.FieldByName('DATATERMINODIST').AsString:= IBQuery_MontaTurma.FieldByName('DATATERMINODIST').AsString;
      IBTable_H_Turma.FieldByName('RADIO').AsString:= IBQuery_MontaTurma.FieldByName('RADIO').AsString;
      IBTable_H_Turma.FieldByName('COORDENADOR').AsString:= IBQuery_MontaTurma.FieldByName('COORDENADOR').AsString;
      IBTable_H_Turma.FieldByName('DURACAO').AsString:= IBQuery_MontaTurma.FieldByName('DURACAO').AsString;
      IBTable_H_Turma.FieldByName('STATUS').AsString:= IBQuery_MontaTurma.FieldByName('STATUS').AsString;
      IBTable_H_Turma.FieldByName('MODALIDADE').AsString:= IBQuery_MontaTurma.FieldByName('MODALIDADE').AsString;
      IBTable_H_Turma.FieldByName('COD').AsString:= IBQuery_MontaTurma.FieldByName('COD').AsString;
      IBTable_H_Turma.FieldByName('CERTIFICADO').AsString:= IBQuery_MontaTurma.FieldByName('CERTIFICADO').AsString;
      IBTable_H_Turma.FieldByName('QTDBRASILEIROS').AsString:= IBQuery_MontaTurma.FieldByName('QTDBRASILEIROS').AsString;
      IBTable_H_Turma.FieldByName('QTDESTRANGEIROS').AsString:= IBQuery_MontaTurma.FieldByName('QTDESTRANGEIROS').AsString;
      IBTable_H_Turma.FieldByName('DESCRICAO').AsString:= IBQuery_MontaTurma.FieldByName('DESCRICAO').AsString;
      IBTable_H_Turma.FieldByName('PARTICIPA_ESTATISTICA').AsString:= IBQuery_MontaTurma.FieldByName('PARTICIPA_ESTATISTICA').AsString;
      IBTable_H_Turma.FieldByName('LOCAL2').AsString:= IBQuery_MontaTurma.FieldByName('LOCAL2').AsString;
      IBTable_H_Turma.FieldByName('ADMINISTRATIVAS').AsString:= IBQuery_MontaTurma.FieldByName('ADMINISTRATIVAS').AsString;
      IBTable_H_Turma.FieldByName('INSTRUCAO').AsString:= IBQuery_MontaTurma.FieldByName('INSTRUCAO').AsString;
      IBTable_H_Turma.FieldByName('FLEXIBILIZACAO').AsString:= IBQuery_MontaTurma.FieldByName('FLEXIBILIZACAO').AsString;
      IBTable_H_Turma.FieldByName('AVALIACAO').AsString:= IBQuery_MontaTurma.FieldByName('AVALIACAO').AsString;
      IBTable_H_Turma.FieldByName('LOCAL1').AsString:= IBQuery_MontaTurma.FieldByName('LOCAL1').AsString;
      IBTable_H_Turma.Post;
      ExecutaTransacao;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro da Turma no Historico
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.TratarCargaTurma(IdCurso, IdTurma: String);
begin
   Executa_Query( 'Select IdCurso From Turma Where IdCurso = '+IdCurso+' and   IdTurma = '+IdTurma );

   if DM_Historico_SGEW.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
   begin
      IBTable_H_Turma.Append;
      IBTable_H_Turma.FieldByName('IDCURSO').AsString:= IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
      IBTable_H_Turma.FieldByName('IDTURMA').AsString:= IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
      IBTable_H_Turma.FieldByName('TURMA').AsString:= IBQuery_MontaTurma.FieldByName('TURMA').AsString;
      IBTable_H_Turma.FieldByName('ANO').AsString:= IBQuery_MontaTurma.FieldByName('ANO').AsString;
      IBTable_H_Turma.FieldByName('DATAINICIO').AsString:= IBQuery_MontaTurma.FieldByName('DATAINICIO').AsString;
      IBTable_H_Turma.FieldByName('DATATERMINO').AsString:= IBQuery_MontaTurma.FieldByName('DATATERMINO').AsString;
      IBTable_H_Turma.FieldByName('DATAINICIODIST').AsString:= IBQuery_MontaTurma.FieldByName('DATAINICIODIST').AsString;
      IBTable_H_Turma.FieldByName('DATATERMINODIST').AsString:= IBQuery_MontaTurma.FieldByName('DATATERMINODIST').AsString;
      IBTable_H_Turma.FieldByName('RADIO').AsString:= IBQuery_MontaTurma.FieldByName('RADIO').AsString;
      IBTable_H_Turma.FieldByName('COORDENADOR').AsString:= IBQuery_MontaTurma.FieldByName('COORDENADOR').AsString;
      IBTable_H_Turma.FieldByName('DURACAO').AsString:= IBQuery_MontaTurma.FieldByName('DURACAO').AsString;
      IBTable_H_Turma.FieldByName('STATUS').AsString:= IBQuery_MontaTurma.FieldByName('STATUS').AsString;
      IBTable_H_Turma.FieldByName('MODALIDADE').AsString:= IBQuery_MontaTurma.FieldByName('MODALIDADE').AsString;
      IBTable_H_Turma.FieldByName('COD').AsString:= IBQuery_MontaTurma.FieldByName('COD').AsString;
      IBTable_H_Turma.FieldByName('CERTIFICADO').AsString:= IBQuery_MontaTurma.FieldByName('CERTIFICADO').AsString;
      IBTable_H_Turma.FieldByName('QTDBRASILEIROS').AsString:= IBQuery_MontaTurma.FieldByName('QTDBRASILEIROS').AsString;
      IBTable_H_Turma.FieldByName('QTDESTRANGEIROS').AsString:= IBQuery_MontaTurma.FieldByName('QTDESTRANGEIROS').AsString;
      IBTable_H_Turma.FieldByName('DESCRICAO').AsString:= IBQuery_MontaTurma.FieldByName('DESCRICAO').AsString;
      IBTable_H_Turma.FieldByName('PARTICIPA_ESTATISTICA').AsString:= IBQuery_MontaTurma.FieldByName('PARTICIPA_ESTATISTICA').AsString;
      IBTable_H_Turma.FieldByName('LOCAL2').AsString:= IBQuery_MontaTurma.FieldByName('LOCAL2').AsString;
      IBTable_H_Turma.FieldByName('ADMINISTRATIVAS').AsString:= IBQuery_MontaTurma.FieldByName('ADMINISTRATIVAS').AsString;
      IBTable_H_Turma.FieldByName('INSTRUCAO').AsString:= IBQuery_MontaTurma.FieldByName('INSTRUCAO').AsString;
      IBTable_H_Turma.FieldByName('FLEXIBILIZACAO').AsString:= IBQuery_MontaTurma.FieldByName('FLEXIBILIZACAO').AsString;
      IBTable_H_Turma.FieldByName('AVALIACAO').AsString:= IBQuery_MontaTurma.FieldByName('AVALIACAO').AsString;
      IBTable_H_Turma.FieldByName('LOCAL1').AsString:= IBQuery_MontaTurma.FieldByName('LOCAL1').AsString;
      IBTable_H_Turma.Post;
      ExecutaTransacao;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro do Curso no Historico
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.TratarCargaCurso(CodCurso: String);
begin
   //--- Verificar se o curso existe

  Executa_Query('Select * From Curso Where CodCurso = '+#39+CodCurso+#39);

  if DM_Historico_SGEW.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
  begin
     Funcoes.ExecutaQuery( DM.IBQuery_Executa, 'Select IdCurso, CodCurso, NomeCurso, Descricao, TotalExamesTeoricos, TotalExamesPraticos, NumeroSemanaAulas, PAET, COPM, NaoImprimirDiploma '+
                                               ' From Curso '+
                                               ' Where CodCurso = '+#39+CodCurso+#39
                         );


     if DM.IBQuery_Executa.FieldByName('IdCurso').AsString <> '' then
     begin
       IBTable_H_Curso.Open;
       IBTable_H_Curso.Append;
       IBTable_H_Curso.FieldByName('IDCURSO').AsString:= DM.IBQuery_Executa.FieldByName('IDCURSO').AsString;
       IBTable_H_Curso.FieldByName('CODCURSO').AsString:= DM.IBQuery_Executa.FieldByName('CODCURSO').AsString;
       IBTable_H_Curso.FieldByName('NOMECURSO').AsString:= DM.IBQuery_Executa.FieldByName('NOMECURSO').AsString;
       IBTable_H_Curso.FieldByName('DESCRICAO').AsString:= DM.IBQuery_Executa.FieldByName('DESCRICAO').AsString;
       IBTable_H_Curso.FieldByName('TOTALEXAMESTEORICOS').AsString:= DM.IBQuery_Executa.FieldByName('TOTALEXAMESTEORICOS').AsString;
       IBTable_H_Curso.FieldByName('TOTALEXAMESPRATICOS').AsString:= DM.IBQuery_Executa.FieldByName('TOTALEXAMESPRATICOS').AsString;
       IBTable_H_Curso.FieldByName('NUMEROSEMANAAULAS').AsString:= DM.IBQuery_Executa.FieldByName('NUMEROSEMANAAULAS').AsString;
       IBTable_H_Curso.FieldByName('PAET').AsString:= DM.IBQuery_Executa.FieldByName('PAET').AsString;
       IBTable_H_Curso.FieldByName('COPM').AsString:= DM.IBQuery_Executa.FieldByName('COPM').AsString;
       IBTable_H_Curso.FieldByName('NAOIMPRIMIRDIPLOMA').AsString:= DM.IBQuery_Executa.FieldByName('NAOIMPRIMIRDIPLOMA').AsString;
       IBTable_H_Curso.Post;
       ExecutaTransacao;

     end;
  end;
end;



//------------------------------------------------------------------------------
// Tratamento do Execução da Query
//------------------------------------------------------------------------------

Function TForm_Carga_Historico_.Trata_Null(VS_String: String): String;
var
   Retorno: String;
begin
   Retorno:= 'Null';
   if VS_String <> '' then
      Retorno:= VS_String;

   Trata_Null:= Retorno;
end;

//------------------------------------------------------------------------------
// Tratamento do Executa Query
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.Executa_Query(VS_Comando: String);
begin
   DM_Historico_SGEW.IBQuery_Executa.Close;
   DM_Historico_SGEW.IBQuery_Executa.Sql.Clear;
   DM_Historico_SGEW.IBQuery_Executa.Sql.Add(VS_Comando);
   DM_Historico_SGEW.IBQuery_Executa.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do Executa Query
//------------------------------------------------------------------------------

procedure TForm_Carga_Historico_.ExecSql_Query(VS_Comando: String);
begin
   DM_Historico_SGEW.IBQuery_Executa.Close;
   DM_Historico_SGEW.IBQuery_Executa.Sql.Clear;
   DM_Historico_SGEW.IBQuery_Executa.Sql.Add(VS_Comando);
   DM_Historico_SGEW.IBQuery_Executa.ExecSql;

   ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure TForm_Carga_Historico_.ExecutaTransacao;
begin
   if not DM_Historico_SGEW.IBTransaction_Historico_SGEW.Active then
       DM_Historico_SGEW.IBTransaction_Historico_SGEW.Active := True;

   DM_Historico_SGEW.IBTransaction_Historico_SGEW.CommitRetaining;
end;

end.
