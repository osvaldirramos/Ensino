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

unit Cad_Curso;

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
  TForm_Cad_Curso = class(TForm)
    DST_Curso: TDataSource;
    JvEnterAsTab2: TJvEnterAsTab;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    GroupBox_Avaliacao: TGroupBox;
    Label3: TLabel;
    Label46: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label_ValorCurso: TLabel;
    Edit_TotExaTeo: TDBEdit;
    Edit_TotExaPra: TDBEdit;
    DBEdit_DiasQuarentena: TDBEdit;
    DBEdit_NumeroIdealdeItens: TDBEdit;
    DBComboBox_PesoMP: TDBEdit;
    DBComboBox_SemMedia: TDBComboBox;
    DBEdit_ValorCusto: TDBEdit;
    GroupBox_CadCurso: TGroupBox;
    Label_Total_Exames_Praticos: TLabel;
    Label_Nome_Curso: TLabel;
    Label_Codigo_Curso: TLabel;
    Label39: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    Label_CursoPAEAT: TLabel;
    Label_COPM: TLabel;
    Edit_NomeCurso: TDBEdit;
    Edit_CodCurso: TDBEdit;
    DBEdit_NumeroSemanasAula: TDBEdit;
    DBRichEdit_Descricao: TDBRichEdit;
    DBComboBox_Paeat: TDBComboBox;
    DBComboBox_COPM: TDBComboBox;
    Memo3: TMemo;
    GroupBox_Planejamento: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit_Avaliacao: TDBEdit;
    DBEdit_Flexibilidade: TDBEdit;
    DBEdit_Instrucao: TDBEdit;
    DBEdit_Administracao: TDBEdit;
    Memo2: TMemo;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_DescValorCurso: TLabel;
    Label11: TLabel;

    procedure NovoCurso;
    procedure AlteraCurso;
    procedure Fechar;
    Function VerificarCodCurso: Boolean;

    procedure FormActivate(Sender: TObject);

    procedure IBTable_CursoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Edit_CodCursoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(
      Sender: TObject);
  private    { Private declarations }
     VS_IdCurso, VS_CodCurso_Old: String;
  public    { Public declarations }
  end;
var
  Form_Cad_Curso: TForm_Cad_Curso;

implementation

uses Module, Sel_Curso, MenuPrincipal;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.FormActivate(Sender: TObject);
var
   VB_StatusAv: Boolean;
begin
   Funcoes.CabecalhoForm( Form_Cad_Curso, ' Cadastro de Curso');

   if ((Funcoes.GetSecao  = 'ADMINISTRAÇÃO') or (Funcoes.GetSecao = 'AVALIAÇÃO')) then
      VB_StatusAv:= True
   else
      VB_StatusAv:= False;

   Edit_TotExaTeo.Visible:= VB_StatusAv;
   Edit_TotExaPra.Visible:= VB_StatusAv;
   Label46.Visible:= VB_StatusAv;
   GroupBox_Avaliacao.Visible:= VB_StatusAv;

   if (DM.IBTable_Configuracao.FieldByName('SIGLA').AsString <> 'ICEA') then
   begin
      Label_CursoPAEAT.Visible:= False;
      DBComboBox_Paeat.Visible:= False;
      DBComboBox_COPM.Visible:= False;
      Label_COPM.Visible:= False;
      Label_ValorCurso.Visible:= False;
      DBEdit_ValorCusto.Visible:= False;
      Label_DescValorCurso.Visible:= False;
   end
   else
   begin
      if (DM.Query_Usuario.FieldByName('Secao').AsString = 'EOM') Then
      begin
         DBComboBox_COPM.Visible:= False;
         Label_COPM.Visible:= False;
      end
      else
      begin
         DBComboBox_COPM.Visible:= True;
         Label_COPM.Visible:= True;
      end;
   end;

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Curso');    // Abre o perfil do usuario em relacao a agenda

   //--- Abre as tabelas existentes

   VS_CodCurso_Old:= Form_Sel_Curso.IBTable_Curso.FieldByName('CodCurso').AsString;
   Form_Sel_Curso.IBTable_Curso.Open;

   // Tratamento para desligar o acesso aos Campos

   if Form_Sel_Curso.VS_OpcaoCurso = 'Inserção' then
      NovoCurso
   else
      AlteraCurso;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Form_Sel_Curso.IBTable_Curso.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
//
// Tratamento Curso
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao novo Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.NovoCurso;
begin
   Funcoes.GravaAcesso('Menu Principal - Cadastro Curso', 'Inserir Curso');

   VS_IdCurso:= IntToStr(Funcoes.MaiorCodigo('IdCurso', 'Curso'));

   Form_Sel_Curso.IBTable_Curso.Append;
   Form_Sel_Curso.IBTable_Curso.FieldByName('IdCurso').AsString:= VS_IdCurso;
   Form_Sel_Curso.IBTable_Curso.FieldByName('TotalExamesTeoricos').AsInteger:= 0;
   Form_Sel_Curso.IBTable_Curso.FieldByName('TotalExamesPraticos').AsInteger:= 0;
   Form_Sel_Curso.IBTable_Curso.FieldByName('NumeroSemanaAulas').AsInteger:= 0;
   Form_Sel_Curso.IBTable_Curso.FieldByName( 'PesoMP').AsString:= 'N';
   Form_Sel_Curso.IBTable_Curso.FieldByName( 'QUARENTENA').AsInteger:= 0;
   Form_Sel_Curso.IBTable_Curso.FieldByName( 'NUMERO_IDEAL_ITENS').AsInteger:= 0;
   Form_Sel_Curso.IBTable_Curso.FieldByName( 'PAET').AsString:= 'S';
   Form_Sel_Curso.IBTable_Curso.FieldByName( 'COPM').AsString:= 'N';

   Edit_CodCurso.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.AlteraCurso;
begin
   Form_Sel_Curso.IBTable_Curso.Edit;
   VS_IdCurso:= Form_Sel_Curso.IBTable_Curso.FieldByName('IdCurso').AsString;
   Edit_NomeCurso.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.JvTransparentButton_GravaClick(Sender: TObject);

begin
   if VerificarCodCurso = True  then
      Edit_CodCurso.SetFocus
   else
   begin
      if (Form_Sel_Curso.IBTable_Curso.State = DSInsert) or (Form_Sel_Curso.IBTable_Curso.State = DSEdit ) then
      begin
         Funcoes.GravaAcesso('Menu Principal - Cadastro Curso', Form_Sel_Curso.VS_OpcaoCurso+' do Curso '+Form_Sel_Curso.IBQuery_MontaCurso.FieldByName('CodCurso').AsString+' - Usuario: '+Funcoes.GetUsuario);
         Form_Sel_Curso.IBTable_Curso.Post;
         Funcoes.ExecutaTransacao;

         if Form_Sel_Curso.VS_OpcaoCurso = 'Inserção' then
            Funcoes.ExecusaoQuery('insert into Turma (IdCurso, IdTurma, Turma, Ano, Status) Values ('+VS_IdCurso+', 0, '+#39+'TURMA'+#39+', '+#39+'BASE'+#39+', '+#39+'B'+#39+')');
      end;
      Fechar;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if (Form_Sel_Curso.IBTable_Curso.State = DSInsert) or (Form_Sel_Curso.IBTable_Curso.State = DSEdit ) then
   Begin
      Form_Sel_Curso.IBTable_Curso.Cancel;
      Funcoes.abortaTransacao;;
   end;
   Fechar;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Fechar;
begin
   if (DM.Query_Usuario.FieldByName('Secao').AsString = 'COPM') Then
      Funcoes_SUE.AlimentaComboBox(Form_MenuPrincipal.ComboBox_Curso, 'CodCurso', 'Curso', ' COPM = '+#39+'S'+#39, 'CodCurso')
   else
      Funcoes_SUE.AlimentaComboBox(Form_MenuPrincipal.ComboBox_Curso, 'CodCurso', 'Curso', '', 'CodCurso');
   Funcoes.AtualizaQuery(Form_Sel_Curso.IBQuery_MontaCurso);
   Close;
end;


//------------------------------------------------------------------------------
// Tratamento de Erro quando o curso for duplicado
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.IBTable_CursoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].Errorcode = 9729)) then
   begin
       MessageDlg('  O Curso já foi cadastrado...  ',mtError, [mbOk],0);
       Edit_CodCurso.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para verificação ao Sair do Campo CodCurso
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Edit_CodCursoExit(Sender: TObject);
begin
   if VerificarCodCurso = True then
      Edit_CodCurso.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento para Verificar se ja existe Curso cadastrado com o CodCurso fornecido
//------------------------------------------------------------------------------

Function TForm_Cad_Curso.VerificarCodCurso: Boolean;
var
   VB_Retorno: Boolean;
begin
   VB_Retorno:= False;

   if trim(Edit_CodCurso.Text) = '' then
   begin
      ShowMessage('O Código do Curso não pode ser branco...');
      VB_Retorno:= True;
   end
   else
   begin
      if Form_Sel_Curso.VS_OpcaoCurso = 'Inserção' then
      begin
         if Funcoes.QtdRegistro('Select count(1)as  Qtd from Curso where CodCurso = '+#39+Edit_CodCurso.Text+#39) > 0 then
         begin
            ShowMessage('Já existe Curso Cadastrado com o Código '+Edit_CodCurso.Text);
            VB_Retorno:= True;
         end
         else
         begin
            Funcoes.OpenQuery('Select count(1) as Qtd From Curso where CodCurso = '+#39+Edit_CodCurso.Text+#39+' and '+'IdCurso = '+VS_IdCurso );
            if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger > 0 then
            begin
               ShowMessage('Já existe Curso Cadastrado com o Código '+Edit_CodCurso.Text);
               VB_Retorno:= True;
            end;
         end;
      end;
   end;
   VerificarCodCurso:= VB_Retorno;
end;
end.

