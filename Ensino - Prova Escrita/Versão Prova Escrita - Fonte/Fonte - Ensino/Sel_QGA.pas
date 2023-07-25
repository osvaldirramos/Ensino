//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Avaliacao.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da avaliacao.                                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/02/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Sel_QGA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ImgList, DB, DBTables, StdCtrls, Mask,
  Buttons, ExtCtrls, Rotinas, Rotinas_SUE, Grids, DBGrids, DBCtrls, IBCustomDataSet,
  IBTable, IBQuery, JvRichEd, JvDBRichEd, JvMaskEdit, JvSpin, JvDBSpinEdit,
  JvDBCtrl, JvCombobox, JvColorCombo, ClipBrd, ValEdit, JvComponent,
  JvxClock, JvBaseThumbnail, JvThumbImage, JvDlg, JvBalloonHint, JvEnterTab,
  JvEdit, JvGradient, JvxCtrls, JvShape, JvLookOut, JvTransBtn;


type
  TForm_Sel_QGA = class(TForm)
    Panel_Selecao: TPanel;
    DBGrid_Avaliacao: TDBGrid;
    ToolBar_Pesquisar: TToolBar;
    JvEdit_RefAvaliacao: TJvEdit;
    JvEdit_MediaParcial: TJvEdit;
    JvEdit_Prova: TJvEdit;
    JvEdit_FaseAplicacao: TJvEdit;
    JvEdit_GP: TJvEdit;
    JvEdit_Peso: TJvEdit;
    IBQuery_MontaQGA: TIBQuery;
    IBQuery_MontaQGAIDCURSO: TSmallintField;
    IBQuery_MontaQGAFASEAPLICACAO: TIBStringField;
    IBQuery_MontaQGAREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_MontaQGACODMATERIA: TIBStringField;
    IBQuery_MontaQGAMEDIAPARCIAL: TIBStringField;
    IBQuery_MontaQGAPESOAPLICACAO: TSmallintField;
    IBQuery_MontaQGACODPROVA: TIBStringField;
    IBQuery_MontaQGAPESODISCIPLINA: TSmallintField;
    DSQ_MontaQGA: TDataSource;
    IBQuery_MontaQGAIDTURMA: TIntegerField;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvGradient3: TJvGradient;
    Panel_TrataQGA: TPanel;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    JvShape1: TJvShape;
    DBNavigator_Disciplina: TDBNavigator;
    IBQuery_MontaQGAORDEM: TIntegerField;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel_Frame_SelCurso: TPanel;
    IBQuery_MontaQGATIPO_PROVA: TIBStringField;

    procedure DefinirTurma(Cor : TColor; Status: boolean);
    procedure MontaQGA(Sender: TObject);
    
    procedure TratarProva(Sender: TObject; var Key: Char);
    procedure SomenteNumero(Sender: TObject;var Key: Char);

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure IBQuery_MontaQGAAfterScroll(DataSet: TDataSet);
  private    { Private declarations }
     VS_ComandoAvaliacao, VS_OrderBy, ReferenciaAvaliacao_Ant: String;

  public    { Public declarations }
     VS_IdCurso, VS_Opcao: String;
  end;

var
  Form_Sel_QGA: TForm_Sel_QGA;

implementation

uses Frame_Sel_Curso, Module, MenuPrincipal, Cad_GQA;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.FormActivate(Sender: TObject);
begin
   if (Funcoes.GetCadCurso = 'MenuPrincipal') then
   begin
      Funcoes.CabecalhoForm( Form_Sel_QGA, ' Seleção do Quadro Global de Avaliação');

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Quadro Global de Avaliação');    // Abre o perfil do usuario em relacao a agenda

      VS_OrderBy:= ' Order By FaseAplicacao, MediaParcial, PesoAplicacao';

      Frame_SelCurso := TFrame_SelCurso.Create(nil);
      Frame_SelCurso.Parent := Form_Sel_QGA.Panel_Frame_SelCurso;

      Frame_SelCurso.TrataCurso('Inserir QGA Base', 'Inserir QGA da turma Base para Turma selecionada');

      MontaQGA(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_MontaQGA.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Atualiza a Query de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_MontaQGA);
   Funcoes.TratarBotoes(IBQuery_MontaQGA, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui);
end;

//------------------------------------------------------------------------------
// Procedure para tratar a selecao da Turma Base
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.DefinirTurma(Cor : TColor; Status: boolean);
begin
   DBGrid_Avaliacao.Color:= Cor;
   JvEdit_RefAvaliacao.Color:= Cor;
   JvEdit_MediaParcial.Color:= Cor;
   JvEdit_Prova.Color:= Cor;
   JvEdit_FaseAplicacao.Color:= Cor;
   JvEdit_GP.Color:= Cor;
   JvEdit_Peso.Color:= Cor;
end;

//------------------------------------------------------------------------------
//
// Tratamento da Selecao da QGA
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Execusao da Query de tratamento da avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.MontaQGA(Sender: TObject);
begin
   VS_ComandoAvaliacao:= 'Select IdCurso, IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, MediaParcial, PesoAplicacao, CodProva, PesoDisciplina, Ordem '+
                         ' from Avaliacao ' +
                         ' where IdCurso = :IdCurso'+
                         ' and   IdTurma = :IdTurma';

   if trim(JvEdit_RefAvaliacao.Text) <> '' then
       VS_ComandoAvaliacao:= VS_ComandoAvaliacao+' and ReferenciaAvaliacao Like '+#39+JvEdit_RefAvaliacao.Text+'%'+#39;

   if trim(JvEdit_Prova.Text) <> '' then
       VS_ComandoAvaliacao:= VS_ComandoAvaliacao+' and CodProva Like '+#39+JvEdit_Prova.Text+'%'+#39;

   if trim(JvEdit_MediaParcial.Text) <> '' then
       VS_ComandoAvaliacao:= VS_ComandoAvaliacao+' and MediaParcial Like '+#39+JvEdit_MediaParcial.Text+'%'+#39;

   if trim(JvEdit_FaseAplicacao.Text) <> '' then
       VS_ComandoAvaliacao:= VS_ComandoAvaliacao+' and FaseAplicacao Like '+#39+JvEdit_FaseAplicacao.Text+'%'+#39;

   if trim(JvEdit_GP.Text) <> '' then
       VS_ComandoAvaliacao:= VS_ComandoAvaliacao+' and PesoAplicacao = '+JvEdit_GP.Text;

   if trim(JvEdit_Peso.Text) <> '' then
       VS_ComandoAvaliacao:= VS_ComandoAvaliacao+' and PesoDisciplina = '+JvEdit_Peso.Text;

   Funcoes.ExecutaQuery( IBQuery_MontaQGA, VS_ComandoAvaliacao+VS_OrderBy);
   Funcoes.TratarBotoes(IBQuery_MontaQGA, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui);
end;

//------------------------------------------------------------------------------
//
// Tratamento Avaliacao - 22/02/2006
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao nova Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.JvTransparentButton_InserirClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   Application.CreateForm(TForm_Cad_QGA, Form_Cad_QGA);
   Form_Cad_QGA.ShowModal;
   JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Altera Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   VS_Opcao:= 'Alterar';
   Application.CreateForm(TForm_Cad_QGA, Form_Cad_QGA);
   Form_Cad_QGA.ShowModal;
   JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Avaliacao
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: Integer;
   VS_Msg, VS_Where: String;
begin
   VS_Where:= ' where idcurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
              ' and   IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
              ' and FaseAplicacao = '+#39+IBQuery_MontaQGA.FieldByName('FaseAplicacao').AsString+#39+
              ' and ReferenciaAvaliacao = '+#39+IBQuery_MontaQGA.FieldByName('ReferenciaAvaliacao').AsString+#39+
              ' and CodMateria = '+#39+IBQuery_MontaQGA.FieldByName('CodMateria').AsString+#39;

   if Funcoes.QtdRegistro('Select count(1) as Qtd from Teste '+VS_Where) > 0 then
   begin
      VS_Msg:= 'Exclui';
      VI_Retorno:= Application.MessageBox('ATENÇÃO... '+#13+#13+'Este QGA possui Prova cadastrada... '+#13+#13+'Tem certeza que deseja exluir...'+#13+#13+'Essa exclusão eliminará o QGA selecionado '+#13+'Confirma a exclusão do registro ?',
                                       'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   end
   else
   begin
      VS_Msg:= '';
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o QGA selecionado '+#13+'Confirma a exclusão do registro ?',
                                       'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   end;

   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Menu Principal - Quadro Global de Avaliação', 'Excluir QGA - '+ReferenciaAvaliacao_Ant);

      Funcoes.ExecusaoQuery('Delete from Avaliacao '+VS_Where);

      if VS_Msg <> '' then
      begin
         Funcoes.ExecusaoQuery('Delete from ResultadoExame '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from RespostaAluno '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from Teste '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from TesteAplicacao '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from TestePedidoRevisaoItem '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from ItemTeste '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from ItemTesteManual '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from TesteAbrangencia '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from Abrangencia_Prova '+VS_Where);
         Funcoes.ExecusaoQuery('Delete from GabaritoProva '+VS_Where);
      end;
      JvTransparentButton_AtualizaClick(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento que obriga a entrar somente com numero na referencia
//------------------------------------------------------------------------------

procedure TForm_Sel_QGA.TratarProva(Sender: TObject; var Key: Char);
begin
   Key:= Upcase(Key);
   if not (key in['0'..'9', 'P','T', chr(8)]) then
       key:= #0;
end;

procedure TForm_Sel_QGA.SomenteNumero(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

procedure TForm_Sel_QGA.IBQuery_MontaQGAAfterScroll(DataSet: TDataSet);
begin
   if DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger = 0 then
      DefinirTurma($00FEC0B8, False)
   else
      DefinirTurma($00F2F2F2, True);
end;

End.

