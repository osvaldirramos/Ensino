unit CadDisciplinaInstrutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, DBCtrls, Grids, DBGrids,
  JvComponent, JvCaptionPanel, Buttons, ExtCtrls, StdCtrls, ComCtrls, Rotinas,
  ToolWin, Mask, JvTransBtn, JvShape;

type
  TForm_Cad_DisciplinaInstrutor = class(TForm)
    GroupBox5: TGroupBox;
    Panel_TesteAbrangencia: TPanel;
    Panel4: TPanel;
    SpeedButton_Cadastra: TSpeedButton;
    SpeedButton_Excluir: TSpeedButton;
    JvCaptionPanel1: TJvCaptionPanel;
    DBGrid_Materia: TDBGrid;
    DBNavigator2: TDBNavigator;
    JvCaptionPanel2: TJvCaptionPanel;
    DBGrid_Abrangencia: TDBGrid;
    IBQuery_Materia: TIBQuery;
    IBQuery_MateriaIDCURSO: TSmallintField;
    IBQuery_MateriaCODMATERIA: TIBStringField;
    IBQuery_MateriaNOMEMATERIA: TIBStringField;
    DSQ_Materia: TDataSource;
    DST_InstrutorMateria: TDataSource;
    IBTable_InstrutorMateria: TIBTable;
    IBTable_InstrutorMateriaIDCURSO: TSmallintField;
    IBTable_InstrutorMateriaCODMATERIA: TIBStringField;
    IBTable_InstrutorMateriaIDENTIDADE: TIBStringField;
    IBTable_InstrutorMateriaOBSERVACAO: TIBStringField;
    IBTable_InstrutorMateriaSTATUS: TIBStringField;
    ToolBar1: TToolBar;
    Edit_DescDisciplina: TEdit;
    MaskEdit_CodMateria: TMaskEdit;
    Panel_BotoesPrincipal: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    Memo1: TMemo;

    procedure TrataSelDisciplina(Sender: TObject);

    procedure SpeedButton_CadastraClick(Sender: TObject);
    procedure SpeedButton_ExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid_MateriaTitleClick(Column: TColumn);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
  private    { Private declarations }
      VS_ComandoMateria, VS_OrderByMateria: String;
  public
    { Public declarations }
  end;

var
  Form_Cad_DisciplinaInstrutor: TForm_Cad_DisciplinaInstrutor;

implementation

uses Con_InstrutoresCurso, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_DisciplinaInstrutor.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_Cad_DisciplinaInstrutor, 'Cadastro de Disciplina por Instrutor');

   VS_OrderByMateria:= ' Order by NomeMateria ';
   TrataSelDisciplina(Sender);

   IBTable_InstrutorMateria.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir Disciplina para o Instrutor
//------------------------------------------------------------------------------

procedure TForm_Cad_DisciplinaInstrutor.SpeedButton_CadastraClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if IBQuery_Materia.FieldByName('CodMateria').AsString = '' then
   begin
      ShowMessage(' Não foi selecionado Disciplina...');
   end
   else
   begin
      VS_Comando:= 'Select count(1) Qtd from InstrutorMateria where IdCurso = '+DM.IBQuery_Instrutor.FieldByName('IdCurso').AsString+
                   ' and Identidade = '+#39+DM.IBQuery_Instrutor.FieldByName('Identidade').AsString+#39+
                   ' and CodMateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39;
      if Funcoes.QtdRegistro(VS_Comando) > 0 then
          ShowMessage(' A Disciplina '+Trim(IBQuery_Materia.FieldByName('CodMateria').AsString)+' - '+Trim(IBQuery_Materia.FieldByName('NomeMateria').AsString)+#13+#13+' já foi cadastrada...   ')
      else
      begin
         IBTable_InstrutorMateria.Append;
         IBTable_InstrutorMateria.FieldByName('IdCurso').AsString:= DM.IBQuery_Instrutor.FieldByName('IdCurso').AsString;
         IBTable_InstrutorMateria.FieldByName('Identidade').AsString:= DM.IBQuery_Instrutor.FieldByName('Identidade').AsString;
         IBTable_InstrutorMateria.FieldByName('CodMateria').AsString:= IBQuery_Materia.FieldByName('CodMateria').AsString;
         IBTable_InstrutorMateria.FieldByName('Status').AsString:= 'Ativo';
         IBTable_InstrutorMateria.FieldByName('Observacao').AsString:= '';
         IBTable_InstrutorMateria.Post;
         Funcoes.ExecutaTransacao;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Excluir Disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_DisciplinaInstrutor.SpeedButton_ExcluirClick(Sender: TObject);
begin
   if IBTable_InstrutorMateria.FieldByName('CodMateria').AsString = '' then
   begin
      ShowMessage(' Não foi selecionado Disciplina...');
   end
   else
   begin
      IBTable_InstrutorMateria.Delete;
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Fechar
//------------------------------------------------------------------------------

procedure TForm_Cad_DisciplinaInstrutor.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_DisciplinaInstrutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.AtualizaQuery( Form_Con_InstrutoresCurso.IBQuery_InstrutorMateria );
   IBTable_InstrutorMateria.Close;
   IBQuery_Materia.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para Filtrar relacao das Disciplinas da Turma
//------------------------------------------------------------------------------

procedure TForm_Cad_DisciplinaInstrutor.TrataSelDisciplina(Sender: TObject);
begin
   VS_ComandoMateria:= ' Select Distinct IdCurso, CodMateria, NomeMateria '+
                ' From MateriaCurso '+
                ' Where IdCurso = '+DM.IBQuery_Instrutor.FieldByName('IdCurso').AsString+
                ' and IdTurma = 0';

   if trim(MaskEdit_CodMateria.Text) <> '' then
      VS_ComandoMateria:= VS_ComandoMateria+ ' and CodMateria like '+#39+MaskEdit_CodMateria.Text+'%'+#39;

   if trim(Edit_DescDisciplina.Text) <> '' then
      VS_ComandoMateria:= VS_ComandoMateria+ ' and NomeMateria like '+#39+Edit_DescDisciplina.Text+'%'+#39;

   Funcoes.ExecutaQuery(IBQuery_Materia, VS_ComandoMateria +VS_OrderByMateria);
end;

//------------------------------------------------------------------------------
// Tratamento do para Classificar as Disciplinas de acordo com cabecalho
//------------------------------------------------------------------------------

procedure TForm_Cad_DisciplinaInstrutor.DBGrid_MateriaTitleClick(  Column: TColumn);
begin
   VS_OrderByMateria:= ' ';

   if (column.Title.Caption = 'Disciplina' ) then
       VS_OrderByMateria:= ' order by CodMateria '
   else
     if trim(column.Title.Caption) = 'Descrição' then
         VS_OrderByMateria:= ' order by NomeMateria';

   Funcoes.ExecutaQuery(IBQuery_Materia, VS_ComandoMateria +VS_OrderByMateria);
end;

end.
