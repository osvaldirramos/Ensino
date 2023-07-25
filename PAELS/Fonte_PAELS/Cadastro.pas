unit Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, JvComponent,   Rotinas, 
  JvTransBtn, JvShape, JvGradient;

type
  TForm_Cadastro = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_AlterarIT: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_ExcluiIT: TJvTransparentButton;
    Panel5: TPanel;
    Panel_Filtro: TPanel;
    Edit_Turma: TEdit;
    Edit_Ano: TEdit;
    ComboBox_Status: TComboBox;
    DBGrid_Turma: TDBGrid;
    procedure Edit_TurmaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cadastro: TForm_Cadastro;

implementation

uses Module;

{$R *.dfm}

procedure TForm_Cadastro.FormActivate(Sender: TObject);
begin
  Edit_TurmaChange(Sender);
end;

procedure TForm_Cadastro.Edit_TurmaChange(Sender: TObject);
var
   VS_Comando: String;
   Status: Boolean;
begin
   if ComboBox_Status.Text = 'PLANEJADAS' then
       Status:= False
   else
       Status:= True;

//   JvExpressButton_RelacaoComCodigoDeAcesso.Visible:= Status;
//   JvExpressButton_Turma.Visible:= Status;

   VS_Comando:= 'Select IdCurso, IdTurma, Turma, CodCurso, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao, Status '+
                                    ' From turmas_Todas_View'+
                                    ' Where QdeAlunos > 0 '+
                                    ' and   IdTurma <> 0 '+
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


end.
