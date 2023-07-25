//------------------------------------------------------------------------------
// Descricao: Este modulo tem a funcao de tratar do cadastro das salas de aula
//
// Ultima atualiuzacao: 18/04/08
//
//------------------------------------------------------------------------------

unit Cad_SalaAula;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, Mask, ComCtrls, Buttons, ExtCtrls, Rotinas,
  Grids, DBGrids, ImgList, IBTable, IBCustomDataSet, IBQuery, Variants,
  JvGrdCpt, JvComponent, JvDBLookupTreeView, ToolWin, JvToolEdit, JvDBCtrl,
  JvGradient, JvTransBtn, JvShape;

type
  TForm_CadSalaAula = class(TForm)
    Panel1: TPanel;
    DBGrid_SalaAula: TDBGrid;
    IBQuery_SalaAula: TIBQuery;
    DSQ_SalaAula: TDataSource;
    IBTable_RecursoSalaAula: TIBTable;
    DST_Recursos: TDataSource;
    IBTable_SalaAula: TIBTable;
    DST_SalaAula: TDataSource;
    IBQuery_SalaAulaCODSALA: TIBStringField;
    IBTable_SalaAulaCODSALA: TIBStringField;
    IBTable_SalaAulaCAPACIDADE: TIntegerField;
    IBTable_SalaAulaOBSERVACAO: TIBStringField;
    IBTable_RecursoSalaAulaCODSALA: TIBStringField;
    IBTable_RecursoSalaAulaRECURSO: TIBStringField;
    IBTable_RecursoSalaAulaQUANTIDADE: TIntegerField;
    Panel2: TPanel;
    GroupBox_SalaAula: TGroupBox;
    DBComboBox_Situacao: TDBComboBox;
    DBEdit_CodSala: TDBEdit;
    DBEdit_Capacidade: TDBEdit;
    DBEdit_Observacao: TDBEdit;
    GroupBox_Recurso: TGroupBox;
    DBEdit_Recurso: TDBEdit;
    DBEdit_Quantidade: TDBEdit;
    DBGrid_Recurso: TDBGrid;
    IBTable_SalaAulaSITUACAO: TIBStringField;
    DBEdit_RecObs: TDBEdit;
    IBTable_RecursoSalaAulaOBSERVACAO: TIBStringField;
    GroupBox_Disponibilidades: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    JvDBDateEdit_DataInicio: TJvDBDateEdit;
    JvDBDateEdit_DataTermino: TJvDBDateEdit;
    IBTable_SalaAulaDATAINICIO: TDateTimeField;
    IBTable_SalaAulaDATATERMINO: TDateTimeField;
    Label_Senha: TLabel;
    Label_Nome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel3: TPanel;
    JvGradient1: TJvGradient;
    JvShape1: TJvShape;
    JvTransparentButton_GravaSala: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_CancelSala: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_NovaSala: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_AlteraSala: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_ExcluiSala: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_DisponibilizaSalaAula: TJvTransparentButton;
    Panel4: TPanel;
    JvGradient2: TJvGradient;
    JvShape10: TJvShape;
    JvTransparentButton_GravaRecurso: TJvTransparentButton;
    JvShape11: TJvShape;
    JvTransparentButton_CancelRecurso: TJvTransparentButton;
    JvShape12: TJvShape;
    JvTransparentButton_NovoRecurso: TJvTransparentButton;
    JvShape13: TJvShape;
    JvTransparentButton_AlteraRecurso: TJvTransparentButton;
    JvShape14: TJvShape;
    JvTransparentButton_ExcluiRecurso: TJvTransparentButton;

    Procedure Containers(Status: Boolean);
    procedure CamposRecurso(Status: Boolean);
    procedure CamposSala(Status: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_NovaSalaClick(Sender: TObject);
    procedure JvTransparentButton_AlteraSalaClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiSalaClick(Sender: TObject);
    procedure JvTransparentButton_GravaSalaClick(Sender: TObject);
    procedure JvTransparentButton_CancelSalaClick(Sender: TObject);
    procedure JvTransparentButton_DisponibilizaSalaAulaClick(
      Sender: TObject);
    procedure JvTransparentButton_NovoRecursoClick(Sender: TObject);
    procedure JvTransparentButton_AlteraRecursoClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiRecursoClick(Sender: TObject);
    procedure JvTransparentButton_GravaRecursoClick(Sender: TObject);
    procedure JvTransparentButton_CancelRecursoClick(Sender: TObject);
  private    { private declarations }
  public    { public declarations }
     VS_Opcao: String;
  end;

var
  Form_CadSalaAula: TForm_CadSalaAula;

implementation

uses Module;

{$R *.DFM}

//-----------------------------------------------------------------------
// Modulo Principal
//-----------------------------------------------------------------------

procedure TForm_CadSalaAula.FormActivate(Sender: TObject);
begin

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Gerência - Cadastro Sala Aula');    // Abre o perfil do usuario em relacao a agenda

   Containers(True);

   //--- Abre os arquivos

   IBQuery_SalaAula.Open;
   IBTable_SalaAula.Open;
   IBTable_RecursoSalaAula.Open;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento dos Containers
//------------------------------------------------------------------------------

Procedure TForm_CadSalaAula.Containers(Status: Boolean);
begin
   Panel_Botoes.Enabled:= Status;
   Funcoes.BotoesBasico( Status, JvTransparentButton_NovaSala, JvTransparentButton_AlteraSala, JvTransparentButton_ExcluiSala, JvTransparentButton_GravaSala, JvTransparentButton_CancelSala);
   Funcoes.BotoesBasico( Status, JvTransparentButton_NovoRecurso, JvTransparentButton_AlteraRecurso, JvTransparentButton_ExcluiRecurso, JvTransparentButton_GravaRecurso, JvTransparentButton_CancelRecurso);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_NovaSalaClick(Sender: TObject);
begin
   Containers(False);
   JvTransparentButton_GravaRecurso.Enabled:= False;
   JvTransparentButton_CancelRecurso.Enabled:= False;
   GroupBox_Recurso.Enabled:= False;

   VS_Opcao:= 'Novo';
   CamposSala( True );

   IBTable_SalaAula.Append;
   IBTable_SalaAula.FieldByName('CodSala').AsString:= '';
   IBTable_SalaAula.FieldByName('Capacidade').AsString:= '';
   IBTable_SalaAula.FieldByName('Situacao').AsString:= 'DISPONÍVEL';
   IBTable_SalaAula.FieldByName('Observacao').AsString:= '';

   DBEdit_CodSala.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_AlteraSalaClick(Sender: TObject);
begin
   VS_Opcao:= 'Altera';
   Containers(False);
   JvTransparentButton_GravaRecurso.Enabled:= False;
   JvTransparentButton_CancelRecurso.Enabled:= False;
   GroupBox_Recurso.Enabled:= False;
   DBEdit_CodSala.Enabled:= False;

   IBTable_SalaAula.Edit;

   CamposSala( True );
   DBEdit_Capacidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_ExcluiSalaClick(Sender: TObject);
begin
   if MessageDlg('Confirma a exclusão ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      //--- Exclui a Sala de Aula

      Funcoes.ExecusaoQuery('Delete from SalaAula where CodSala = '+#39+IBQuery_SalaAula.FieldByName('CodSala').AsString+#39);

      IBQuery_SalaAula.Close;
      IBQuery_SalaAula.Open;
   end;
   Containers(True);
   DBGrid_SalaAula.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_GravaSalaClick(Sender: TObject);
var
   VS_Codigo: String;
begin
   VS_Codigo:= IBTable_SalaAula.FieldByName('CodSala').AsString;
   IBTable_SalaAula.Post;
   DM.IBTransaction_Ensino.CommitRetaining;

   Containers(True);
   GroupBox_Recurso.Enabled:= True;

   CamposSala( False );
   IBQuery_SalaAula.Close;
   IBQuery_SalaAula.Open;

   //--- Posiciona na captacao que foi cadastrada

   if VS_Opcao = 'Novo' then
      IBQuery_SalaAula.Locate('CodSala', VarArrayOf([VS_Codigo]), [loPartialKey]);

   DBGrid_SalaAula.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_CancelSalaClick(Sender: TObject);
begin
   IBTable_SalaAula.Cancel;
   DM.IBTransaction_Ensino.CommitRetaining;

   Containers(True);
   GroupBox_Recurso.Enabled:= True;

   CamposSala( False );

   DBGrid_SalaAula.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//-----------------------------------------------------------------------
// Tratamento do botao Windows
//-----------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//-----------------------------------------------------------------------
// Tratamento dos campos da sala de aula
//-----------------------------------------------------------------------

procedure TForm_CadSalaAula.CamposSala(Status: Boolean);
begin
   DBComboBox_Situacao.Enabled:= Status;
   DBEdit_CodSala.Enabled:= Status;
   DBEdit_Capacidade.Enabled:= Status;
   DBEdit_Observacao.Enabled:= Status;
End;

//-----------------------------------------------------------------------
//
// Tratamento do Cadastro de Recursos
//
//-----------------------------------------------------------------------

//-----------------------------------------------------------------------
// Tratamento dos campos dos recursos da sala de aula
//-----------------------------------------------------------------------

procedure TForm_CadSalaAula.CamposRecurso(Status: Boolean);
begin
   DBEdit_Recurso.Enabled:= Status;
   DBEdit_Quantidade.Enabled:= Status;
   DBEdit_RecObs.Enabled:= Status;
End;

//-----------------------------------------------------------------------
// Tratamento do botao de insercao de Recurso
//-----------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_NovoRecursoClick(Sender: TObject);
begin
   Containers(False);
   JvTransparentButton_GravaSala.Enabled:= False;
   JvTransparentButton_CancelSala.Enabled:= False;
   GroupBox_SalaAula.Enabled:= False;

   VS_Opcao:= 'Novo';
   CamposRecurso( True );

   IBTable_RecursoSalaAula.Append;
   IBTable_RecursoSalaAula.FieldByName('Recurso').AsString:= '';
   IBTable_RecursoSalaAula.FieldByName('Quantidade').AsString:= '1';
   IBTable_RecursoSalaAula.FieldByName('Observacao').AsString:= '';

   DBEdit_Recurso.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_AlteraRecursoClick(Sender: TObject);
begin
   VS_Opcao:= 'Altera';
   Containers(False);
   JvTransparentButton_GravaSala.Enabled:= False;
   JvTransparentButton_CancelSala.Enabled:= False;
   GroupBox_SalaAula.Enabled:= False;

   IBTable_RecursoSalaAula.Edit;
   CamposRecurso( True );

   DBEdit_Recurso.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_ExcluiRecursoClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a turma selecionada '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      IBTable_RecursoSalaAula.Delete;
      DM.IBTransaction_Ensino.CommitRetaining;
   end;
   Containers(True);
   DBGrid_SalaAula.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_GravaRecursoClick( Sender: TObject);
begin
   IBTable_RecursoSalaAula.Post;
   DM.IBTransaction_Ensino.CommitRetaining;

   GroupBox_SalaAula.Enabled:= True;
   Containers(True);
   CamposRecurso( False );

   DBGrid_Recurso.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_CancelRecursoClick( Sender: TObject);
begin
   IBTable_RecursoSalaAula.Cancel;
   DM.IBTransaction_Ensino.CommitRetaining;

   Containers(True);
   GroupBox_SalaAula.Enabled:= True;
   CamposRecurso( False );

   DBGrid_Recurso.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para disponibilizar a Sala de Aula
//------------------------------------------------------------------------------

procedure TForm_CadSalaAula.JvTransparentButton_DisponibilizaSalaAulaClick(Sender: TObject);
begin
   IBTable_SalaAula.Edit;
   IBTable_SalaAula.FieldByName('Situacao').AsString:= 'DISPONÍVEL';   IBTable_SalaAula.FieldByName('DataInicio').AsString:= '';
   IBTable_SalaAula.FieldByName('DataInicio').AsString:= '';
   IBTable_SalaAula.FieldByName('DataTermino').AsString:= '';
   IBTable_SalaAula.FieldByName('Observacao').AsString:= '';
   IBTable_SalaAula.Post;
   DM.IBTransaction_Ensino.CommitRetaining;
end;

procedure TForm_CadSalaAula.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.

