//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Prova.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da montagem da prova.                          //
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

unit Fer_AvisoCoordenador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, Rotinas, Rotinas_SUE,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, IBCustomDataSet, IBTable,
  IBQuery, JvToolEdit, JvDBCtrl, JvRichEd, JvDBRichEd, JvComponent, 
  JvCaptionPanel, Menus, JvEdit, JvGradient, JvxCtrls, JvShape, JvEnterTab,
  JvTransBtn;

type
  TForm_FC_AvisoCoordenador = class(TForm)
    Panel_Treeviw: TPanel;
    GroupBox_Turma: TGroupBox;
    DBGrid_Msg: TDBGrid;
    DST_MontaMsg: TDataSource;
    IBTable_MontaMsg: TIBTable;
    Panel5: TPanel;
    IBTable_MontaMsgIDCURSO: TSmallintField;
    IBTable_MontaMsgIDTURMA: TIntegerField;
    IBTable_MontaMsgID_FCMSG: TSmallintField;
    IBTable_MontaMsgDATA: TDateTimeField;
    IBTable_MontaMsgUSUARIO: TIBStringField;
    IBTable_MontaMsgMSG: TIBStringField;
    IBTable_MontaMsgVISTO: TIBStringField;
    Label39: TLabel;
    DBRichEdit_Descricao: TDBRichEdit;
    Panel_Frame_SelCurso: TPanel;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;

    procedure Botoes_Inciais(Status: Boolean; JvTransparentButton_Retornar, JvTransparentButton_Windows: TJvTransparentButton);
    procedure Campos_Msg(Status: Boolean);
    Procedure Containers(Status: Boolean);

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
  private    { Private declarations }

  public    { public declarations }
  end;
var
  Form_FC_AvisoCoordenador: TForm_FC_AvisoCoordenador;

implementation

uses Sel_Curso, Module, Frame_Sel_Curso;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_FC_AvisoCoordenador, ' Aviso para o Coordenador');

   Funcoes.SetCadCurso('CadProva');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Ferramentas - Mensagens e alertas para Coordenador');    // Abre o perfil do usuario em relacao a agenda

   //--- Fecha e abre os arquivos para fazer atualização dos dados

   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   IBTable_MontaMsg.Open;

   Frame_SelCurso := TFrame_SelCurso.Create(nil);
   Frame_SelCurso.Parent := Form_FC_AvisoCoordenador.Panel_Frame_SelCurso;
   Frame_SelCurso.TrataCurso('Cadastro', 'Em Andamento');

end;

procedure TForm_FC_AvisoCoordenador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_MontaMsg.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure parar tratar dos Containers
//------------------------------------------------------------------------------

Procedure TForm_FC_AvisoCoordenador.Containers(Status: Boolean);
begin
   Panel_Treeviw.Enabled:= Status;
   Funcoes.BotoesBasico( Status, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);
   Botoes_Inciais(Status, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Panel_Frame_SelCurso.Enabled:= Status;

end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro da Mensagem
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.Campos_Msg(Status: Boolean);
begin
   DBRichEdit_Descricao.Enabled:= Status;
end;


//------------------------------------------------------------------------------
// Tratamento do botao para cadastrar uma nova mensagem
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.JvTransparentButton_InserirClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Ferramentas - Mensagens e alertas para Coordenador', 'Inserir Msg para Coordenador'+fUNCOES.GetCodCurso);

   Campos_Msg(True);
   Containers(False);
   Botoes_Inciais(True, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);

   IBTable_MontaMsg.Append;
   IBTable_MontaMsg.FieldByName('IdCurso').AsInteger:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsInteger;
   IBTable_MontaMsg.FieldByName('IdTurma').AsInteger:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger;
   IBTable_MontaMsg.FieldByName('Id_FcMsg').AsInteger:= Funcoes.MaiorCodigoComRestricao('Id_FcMsg', 'IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString, 'FC_MSG');
   IBTable_MontaMsg.FieldByName('Data').AsString:= DateToStr(Date);
   IBTable_MontaMsg.FieldByName('Usuario').AsString:= DM.Query_Usuario.FieldByName('Nome').AsString;
   IBTable_MontaMsg.FieldByName('Visto').AsString:= '0';
   DBRichEdit_Descricao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Msg
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Ferramentas - Mensagens e alertas para Coordenador', 'Alterar Msg do Coordenador '+Funcoes.GetCodCurso);
   Campos_Msg(True);
   Containers(False);
   Botoes_Inciais(True, JvTransparentButton_Retornar, JvTransparentButton_Windows);
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);

   IBTable_MontaMsg.Edit;
   DBRichEdit_Descricao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui a Msg
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.JvTransparentButton_ExcluiClick( Sender: TObject);
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Aviso/Alerta '+#13+
                                          'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Ferramentas - Mensagens e alertas para Coordenador', 'Excluiro Msg do Coordenador '+Funcoes.GetCodCurso);

      IBTable_MontaMsg.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Msg
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.JvTransparentButton_GravaClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Ferramentas - Mensagens e alertas para Coordenador', 'Gravar a Msg Inserida ou alterada do Coordenador '+Funcoes.GetCodCurso);
   Campos_Msg(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);

   IBTable_MontaMsg.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Msg
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Ferramentas - Mensagens e alertas para Coordenador', 'Cancelar a Msg Inserida ou alterada do Coordenador '+Funcoes.GetCodCurso);
   Campos_Msg(False);
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Alterar, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancelar);

   IBTable_MontaMsg.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento dos botoes de incializacao do sistema
//------------------------------------------------------------------------------

procedure TForm_FC_AvisoCoordenador.Botoes_Inciais(Status: Boolean; JvTransparentButton_Retornar, JvTransparentButton_Windows: TJvTransparentButton);
begin
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Windows.Enabled:= Status;
end;

end.

