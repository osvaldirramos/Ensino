unit Menu_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rotinas, StdCtrls, Grids, DBGrids, DBCtrls, Buttons, JvComponent,
  JvCaptionPanel, JvGradientCaption, JvLookOut, ComCtrls, ExtCtrls, jpeg,
  ImgList;

type
  TForm_MenuPrincipal = class(TForm)
    Panel_Opcoes: TPanel;
    JvGradientCaption_MenuPrincipal: TJvGradientCaption;
    JvExpress_EscolhaOpcoes: TJvExpress;
    JvExpressButton_Windows: TJvExpressButton;
    JvExpressButton_Turma: TJvExpressButton;
    JvExpressButton_RelacaoComCodigoDeAcesso: TJvExpressButton;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Panel_Filtro: TPanel;
    Edit_Turma: TEdit;
    Edit_Ano: TEdit;
    ComboBox_Status: TComboBox;
    DBGrid_Turma: TDBGrid;
    ImageList_SituacaoItem: TImageList;
    procedure JvExpressButton_WindowsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit_TurmaChange(Sender: TObject);
    procedure JvExpressButton_RelacaoComCodigoDeAcessoClick(Sender: TObject);
    procedure JvExpressButton_TurmaClick(Sender: TObject);
    procedure DBGrid_TurmaDblClick(Sender: TObject);
  private
    { Private declarations }
  public     { Public declarations }
     VS_Opcao: String;
  end;

var
  Form_MenuPrincipal: TForm_MenuPrincipal;

implementation

uses Module, Rel_RelatorioDeCodigoAcesso, Sel_Rel_Fichas, Temporario;

{$R *.dfm}


procedure TForm_MenuPrincipal.FormActivate(Sender: TObject);
begin
  Edit_TurmaChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o Menu Principal
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.JvExpressButton_WindowsClick(Sender: TObject);
begin
   DM.IBQuery_MontaTurma.Close;
   Funcoes.Windows;
end;

procedure TForm_MenuPrincipal.Edit_TurmaChange(Sender: TObject);
var
   VS_Comando: String;
   Status: Boolean;
begin
   if ComboBox_Status.Text = 'PLANEJADAS' then
       Status:= False
   else
       Status:= True;

   JvExpressButton_RelacaoComCodigoDeAcesso.Visible:= Status;
   JvExpressButton_Turma.Visible:= Status;

//   VS_Comando:= 'Select IdCurso, IdTurma, Turma, CodCurso, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao, Status '+
//                                    ' From turmas_Todas_View'+
//                                    ' Where QdeAlunos > 0 '+
//                                    ' and   IdTurma <> 0 '+
//                                    ' and   IdCurso = '+Funcoes.GetIdCurso+
//                                    ' and   Status = '+#39+Copy(ComboBox_Status.Text,1,1)+#39;

   VS_Comando:= 'Select IdCurso, IdTurma, Turma, CodCurso, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao, Status '+
                                    ' From turmas_Todas_View'+
                                    ' Where IdTurma <> 0 '+
                                    ' and   IdCurso = '+Funcoes.GetIdCurso+
                                    ' and   Status = '+#39+Copy(ComboBox_Status.Text,1,1)+#39;

   if Edit_Turma.Text <> '' then
      VS_Comando:= VS_Comando+' and Turma Like '+#39+'%'+Edit_Turma.Text+'%'+#39;

   if Edit_Ano.Text <> '' then
      VS_Comando:= VS_Comando+' and Ano = '+Edit_Ano.Text;

   DM.IBQuery_MontaTurma.Close;
   DM.IBQuery_MontaTurma.Sql.Clear;
   DM.IBQuery_MontaTurma.Sql.Add( VS_Comando+' Order By Turma desc' );
   DM.IBQuery_MontaTurma.Open;
end;

procedure TForm_MenuPrincipal.JvExpressButton_RelacaoComCodigoDeAcessoClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select NomeCompleto, Nomeguerra, CodigoInstrutor as Codigo '+
                ' From INSTRUTOR_TURMAS_VIEW Where IdCurso = '+Funcoes.GetIdCurso+
                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                ' and (Funcao = '+#39+'INSTRUTOR'+#39+' or Funcao = '+#39+'COORDENADOR'+#39+')';

   Application.CreateForm(TForm_Rel_RelacaoComCodigo, Form_Rel_RelacaoComCodigo);
   Funcoes.ExecutaQuery(Form_Rel_RelacaoComCodigo.IBQuery_AlunoTurma, VS_Comando);
   Form_Rel_RelacaoComCodigo.QuickRep1.Preview;

end;

procedure TForm_MenuPrincipal.JvExpressButton_TurmaClick(Sender: TObject);
begin
   VS_Opcao:= 'MenuRel';
   Form_Sel_Rel_Fichas.ShowModal;
end;

procedure TForm_MenuPrincipal.DBGrid_TurmaDblClick(Sender: TObject);
begin
   JvExpressButton_TurmaClick(Sender);
end;

end.

