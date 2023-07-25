//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Curso.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             de Curso.                                      //
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

unit Sel_Curso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvTransBtn;

type
  TForm_Sel_Curso = class(TForm)
    DSQ_MontaCurso: TDataSource;
    IBQuery_MontaCurso: TIBQuery;
    IBQuery_MontaCursoIDCURSO: TSmallintField;
    IBQuery_MontaCursoCODCURSO: TIBStringField;
    ToolBar_SelecaoTurma: TToolBar;
    MaskEdit_CodCurso: TJvEdit;
    MaskEdit_NomeCurso: TJvEdit;
    DBGrid_Curso: TDBGrid;
    IBQuery_MontaCursoNOMECURSO: TIBStringField;
    IBTable_Curso: TIBTable;
    IBTable_CursoIDCURSO: TSmallintField;
    IBTable_CursoCODCURSO: TIBStringField;
    IBTable_CursoNOMECURSO: TIBStringField;
    IBTable_CursoDESCRICAO: TIBStringField;
    IBTable_CursoTIPO: TIBStringField;
    IBTable_CursoTOTALEXAMESTEORICOS: TSmallintField;
    IBTable_CursoTOTALEXAMESPRATICOS: TSmallintField;
    IBTable_CursoNUMEROSEMANAAULAS: TSmallintField;
    IBTable_CursoPESOMP: TIBStringField;
    IBTable_CursoGRAVA_APC: TIBStringField;
    IBTable_CursoQUARENTENA: TIntegerField;
    IBTable_CursoNUMERO_IDEAL_ITENS: TIntegerField;
    IBTable_CursoSEM_MEDIA: TIBStringField;
    IBTable_CursoVALOR: TFloatField;
    IBTable_CursoPAET: TIBStringField;
    Panel_Botoes_Instrutor: TPanel;
    Panel1: TPanel;
    IBTable_CursoCOPM: TIBStringField;
    IBTable_CursoADMINISTRATIVAS: TIntegerField;
    IBTable_CursoINSTRUCAO: TIntegerField;
    IBTable_CursoFLEXIBILIZACAO: TIntegerField;
    IBTable_CursoAVALIACAO: TIntegerField;
    IBTable_CursoNAOIMPRIMIRDIPLOMA: TIBStringField;
    IBTable_CursoCURSO_EAD: TIBStringField;
    JvGradient_Menu: TJvGradient;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Excluir: TJvTransparentButton;
    JvShape1: TJvShape;
    JvShape2: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    DBNavigator2: TDBNavigator;

    procedure MontaCurso(Sender: TObject);

    procedure FormActivate(Sender: TObject);

    procedure DBGrid_CursoTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluirClick(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
  private    { Private declarations }
     VS_ComandoCurso, OrderByCurso: String;

  public    { Public declarations }
     VS_OpcaoCurso: String;
  end;
var
  Form_Sel_Curso: TForm_Sel_Curso;

implementation

uses Cad_Curso, MenuPrincipal, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.FormActivate(Sender: TObject);
begin
   JvGradient_Menu.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm( Form_Sel_Curso, ' Cadastro de Curso');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Curso');    // Abre o perfil do usuario em relacao a agenda

   //--- Abre as tabelas existentes

   OrderByCurso:= 'CodCurso';
   MontaCurso(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Atualiza a Lista de Cursos
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_MontaCurso);
   Funcoes.TratarBotoes(IBQuery_MontaCurso, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Excluir);
end;

//------------------------------------------------------------------------------
// Tratamento Quando fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_MontaCurso.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
//
// Tratamento Curso
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao Inserir Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.JvTransparentButton_InserirClick(Sender: TObject);
begin
   VS_OpcaoCurso:= 'Inserção';
   Application.CreateForm(TForm_Cad_Curso, Form_Cad_Curso);{Carrega form na memória}
   Form_Cad_Curso.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Inserir Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   VS_OpcaoCurso:= 'Alteração';
   Application.CreateForm(TForm_Cad_Curso, Form_Cad_Curso);
   Form_Cad_Curso.ShowModal;
   Form_Cad_Curso.Free;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.JvTransparentButton_ExcluirClick(Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from Turma where idcurso = '+IBQuery_MontaCurso.FieldByName('IdCurso').AsString+' and IdTurma <> 0');

   if VI_retorno > 0 then
      Showmessage('O Curso selecionado possuí "Turma"'+#13+#13+'Para excluir o Curso deverá primeiro excluir a "Turma"...')
   else
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Curso '+#13+
                                          'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
      begin
         Funcoes.GravaAcesso('Menu Principal - Cadastro Curso', 'Exclução do Curso '+IBQuery_MontaCurso.FieldByName('CodCurso').AsString+' - Usuario: '+Funcoes.GetUsuario);
         Funcoes.ExecusaoQuery( 'Delete from Curso where IdCurso = '+IBQuery_MontaCurso.FieldByName('IdCurso').AsString);
         Funcoes_SUE.AlimentaComboBox(Form_MenuPrincipal.ComboBox_Curso, 'CodCurso', 'Curso', '', 'CodCurso');
         JvTransparentButton_AtualizarClick(Sender);
      end;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento dos Relatorios
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Monta a relação de Cursos pelo Filtro
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.MontaCurso(Sender: TObject);
var
   VS_Where: String;
begin
   VS_Where:= ' Where ';
   VS_ComandoCurso:= 'Select IdCurso, Codcurso, nomecurso '+
                     'From curso';

   if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EOM') Then
   begin
      VS_ComandoCurso:= VS_ComandoCurso+VS_Where+' COPM = '+#39+'S'+#39;
      VS_Where:= ' and ';
   end;

   if Trim(MaskEdit_CodCurso.Text) <> '' then
   begin
      VS_ComandoCurso:= VS_ComandoCurso+VS_Where+' CodCurso Like '+#39+MaskEdit_CodCurso.Text+'%'+#39;
      VS_Where:= ' and ';
   end;

   if Trim(MaskEdit_NomeCurso.Text) <> '' then
      VS_ComandoCurso:= VS_ComandoCurso+VS_Where+' NomeCurso Like '+#39+MaskEdit_CodCurso.Text+'%'+#39;

   VS_ComandoCurso:= VS_ComandoCurso+' order by ';

   Funcoes.ExecutaQuery(IBQuery_MontaCurso, VS_ComandoCurso + OrderByCurso);
   Funcoes.TratarBotoes(IBQuery_MontaCurso, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Excluir);
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao da Grid de Turma
//------------------------------------------------------------------------------

procedure TForm_Sel_Curso.DBGrid_CursoTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Cod. Curso' then
       OrderByCurso:= ' CodCurso'
   else
     if trim(column.Title.Caption) = 'Nome Curso' then
         OrderByCurso:= ' NomeCurso';
   Funcoes.ExecutaQuery(IBQuery_MontaCurso, VS_ComandoCurso + OrderByCurso);
   Funcoes.TratarBotoes(IBQuery_MontaCurso, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Excluir);
end;

end.

