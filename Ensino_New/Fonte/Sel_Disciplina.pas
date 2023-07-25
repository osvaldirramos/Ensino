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

unit Sel_Disciplina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvLookOut, JvTransBtn;

type
  TForm_Sel_Disciplina = class(TForm)
    Panel_Treeviw: TPanel;
    DBGrid_Disciplina: TDBGrid;
    IBQuery_Materia: TIBQuery;
    DSQ_Materia: TDataSource;
    IBQuery_MateriaIDCURSO: TSmallintField;
    IBQuery_MateriaCODMATERIA: TIBStringField;
    IBQuery_MateriaNOMEMATERIA: TIBStringField;
    IBQuery_MateriaNUMEROAULASTEORICAS: TSmallintField;
    IBQuery_MateriaNUMEROAULASPRATICAS: TSmallintField;
    IBQuery_MateriaFASE: TIBStringField;
    IBQuery_MateriaIDTURMA: TIntegerField;
    IBQuery_MateriaESPECIALIDADE: TIBStringField;
    IBTable_Materia: TIBTable;
    IBTable_MateriaIDCURSO: TSmallintField;
    IBTable_MateriaIDTURMA: TIntegerField;
    IBTable_MateriaCODMATERIA: TIBStringField;
    IBTable_MateriaNOMEMATERIA: TIBStringField;
    IBTable_MateriaNUMEROAULASTEORICAS: TSmallintField;
    IBTable_MateriaNUMEROAULASPRATICAS: TSmallintField;
    IBTable_MateriaFASE: TIBStringField;
    IBTable_MateriaPERGUNTACHEFE: TIBStringField;
    IBTable_MateriaPERGUNTAALUNO: TIBStringField;
    DST_Materia: TDataSource;
    IBTable_MateriaESPECIALIDADE: TIBStringField;
    IBQuery_MateriaATUALIZACAO: TDateTimeField;
    IBQuery_MateriaANO: TIBStringField;
    IBTable_MateriaQTD_OBJETIVOS: TIntegerField;
    IBTable_MateriaATUALIZACAO: TDateTimeField;
    IBTable_MateriaANO: TIBStringField;
    IBQuery_RelacaoItensParaExcluir: TIBQuery;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvGradient_Menu: TJvGradient;
    StatusBar_Msg: TStatusBar;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_CodMateria: TJvEdit;
    JvEdit_Descricao: TJvEdit;
    Panel_Botoes_Instrutor: TPanel;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    JvShape1: TJvShape;
    DBNavigator1: TDBNavigator;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel_Frame_SelCurso: TPanel;
    Panel_TrataBase: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    DBEdit_Ano: TDBEdit;
    JvDBDateEdit_DataAtualizacao: TJvDBDateEdit;
    ToolButton1: TToolButton;

    procedure DefinirTurma(Cor : TColor; Status: boolean);
    procedure MontaDisciplina(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure SpeedButton_AtualizaTurmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvEdit_CodMateriaKeyPress(Sender: TObject; var Key: Char);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure IBQuery_MateriaAfterScroll(DataSet: TDataSet);

  private    { Private declarations }
  public    { Public declarations }
     VS_Opcao: String;
  end;
var
  Form_Sel_Disciplina: TForm_Sel_Disciplina;

implementation

uses Frame_Sel_Curso, Cad_Disciplina, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'CertidaoCurricular')) then
   begin
      JvGradient_Menu.StartColor:= Cor_Tela;

      Funcoes.CabecalhoForm( Form_Sel_Disciplina, ' Seleção de Disciplinas');

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Disciplina');    // Abre o perfil do usuario em relacao a agenda

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Sel_Disciplina.Panel_Frame_SelCurso;
      Frame_SelCurso.TrataCurso('Inserir Disciplina Base', 'Inserir Disciplina da turma Base para Turma selecionada');

      Funcoes.SetCadCurso('CadCurso');
      MontaDisciplina(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Materia.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Materia);
   Funcoes.TratarBotoes(IBQuery_Materia, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui);
end;


//------------------------------------------------------------------------------
// Procedure para tratar a selecao da Turma Base
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.DefinirTurma(Cor : TColor; Status: boolean);
begin
   DBGrid_Disciplina.Color:= Cor;
   JvEdit_CodMateria.Color:= Cor;
   JvEdit_Descricao.Color:= Cor;
end;

//------------------------------------------------------------------------------
// Atualiza Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.SpeedButton_AtualizaTurmaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Materia);
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da Metria pelo Codigo
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.MontaDisciplina;
var
   VS_Comando: String;

begin
   VS_Comando:= ' Select * '+
                ' From MateriaCurso '+
                ' Where IdCurso = :IdCurso '+
                ' and IdTurma = :IdTurma';

   if  trim(JvEdit_CodMateria.Text) <> '' then
      VS_Comando:= VS_Comando + ' and CodMateria like '+#39+JvEdit_CodMateria.Text+'%'+#39;

   if  trim(JvEdit_Descricao.Text) <> '' then
      VS_Comando:= VS_Comando + ' and NomeMateria like '+#39+JvEdit_Descricao.Text+'%'+#39;

   Funcoes.ExecutaQuery( IBQuery_Materia, VS_Comando+ ' Order by CodMateria ');
   Funcoes.TratarBotoes(IBQuery_Materia, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui);
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro da Disciplina
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao Inserir Disciplina
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.JvTransparentButton_InserirClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserção';
   Application.CreateForm(TForm_Cad_Disciplina, Form_Cad_Disciplina);
   Form_Cad_Disciplina.ShowModal;
   JvTransparentButton_AtualizaClick( Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Alterar Disciplina
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   VS_Opcao:= 'Alteração';
   Application.CreateForm(TForm_Cad_Disciplina, Form_Cad_Disciplina);
   Form_Cad_Disciplina.ShowModal;
   JvTransparentButton_AtualizaClick( Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.JvTransparentButton_ExcluiClick( Sender: TObject);
var
   VI_Retorno: Integer;
   VS_Msg: String;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão da(s) Disciplina(s) Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_Retorno = IDYes then
   begin
      VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from Item_Prova where idcurso = '+IBQuery_Materia.FieldByName('IdCurso').AsString+
                                       ' and IdTurma = '+IBQuery_Materia.FieldByName('IdTurma').AsString+
                                       ' and codmateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39);

      if VI_retorno > 0 then
      begin
         if IBQuery_Materia.FieldByName('IdTurma').AsString = '0' then   // Turma Base
         begin
            VS_Msg:= 'A disciplina '+IBQuery_Materia.FieldByName('CodMateria').AsString+' - '+IBQuery_Materia.FieldByName('NomeMateria').AsString+#13+
                     ' A Turma Base possuí '+IntToStr(VI_retorno)+' Itens na Disciplina selecionada no Cadastro de Item de Prova...'+#13+#13+#13+'Confirma a Exclusão da Disciplina ...';
            if  Application.MessageBox(PChar(VS_Msg), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
               VI_Retorno:= 0;
         end
         else
         begin
            VS_Msg:= 'A disciplina '+IBQuery_Materia.FieldByName('CodMateria').AsString+' - '+IBQuery_Materia.FieldByName('NomeMateria').AsString+#13+
                     ' A Turma '+DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+#13+' possuí '+IntToStr(VI_retorno)+' Itens na Disciplina selecionada no Cadastro de Item de Prova...'+#13+#13+#13+'ENTRAR EM CONTATO COM A AVALIAÇÃO PARA APAGAR PRIMEIRO OS ITENS CADASTRADOS...';
            ShowMessage(VS_Msg);
         end;
      end;

      if VI_Retorno = 0 then
      begin
         Funcoes.GravaAcesso('Menu Principal - Cadastro Disciplina', 'Exclusão da Disciplina '+IBQuery_Materia.FieldByName('CodMateria').AsString+'do Curso '+Funcoes.GetCodCurso+' - Usuario: '+Funcoes.GetUsuario);
         Funcoes.ExecusaoQuery('Delete from MateriaCurso where IdCurso = '+IBQuery_Materia.FieldByName('IdCurso').AsString+' and IdTurma = '+IBQuery_Materia.FieldByName('IdTurma').AsString+' and CodMateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39);

         ///----- Verifica se existe turma em andamento

         VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd From Turma where IdCurso = '+IBQuery_Materia.FieldByName('IdCurso').AsString+' and Status = '+#39+'A'+#39);

         if VI_retorno = 0 then
         begin
            Funcoes.ExecutaQuery( IBQuery_RelacaoItensParaExcluir, 'Select NumItem from Item_Prova where IdCurso = '+IBQuery_Materia.FieldByName('IdCurso').AsString+' and idturma = 0 and CodMateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39);
            IBQuery_RelacaoItensParaExcluir.First;
            While not IBQuery_RelacaoItensParaExcluir.Eof do
            begin
               Funcoes.ExecusaoQuery('Delete from Item_Desc where NumItem = '+IBQuery_RelacaoItensParaExcluir.FieldByName('NumItem').AsString);
               IBQuery_RelacaoItensParaExcluir.Next;
            end;
         end;
         Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+IBQuery_Materia.FieldByName('IdCurso').AsString+' and idturma = 0 and CodMateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39);
      end;
      JvTransparentButton_AtualizaClick( Sender);
   end;
end;

procedure TForm_Sel_Disciplina.JvEdit_CodMateriaKeyPress(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento quando muda de curso ou de turma
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.IBQuery_MateriaAfterScroll( DataSet: TDataSet);
begin
   if IBQuery_Materia.FieldByName('IdTurma').AsInteger = 0 then
      DefinirTurma($00FEC0B8, False)
   else
      DefinirTurma($00F2F2F2, True);
end;

end.

