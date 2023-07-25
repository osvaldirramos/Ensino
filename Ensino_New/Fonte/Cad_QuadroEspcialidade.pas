//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_QuadroEspcialidade.PAS                     //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             de Quadro e especialidade.                     //
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

unit Cad_QuadroEspcialidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, ImgList, IBCustomDataSet, IBTable, Variants, 
  IBQuery, JvComponent, JvEnterTab, JvTransBtn, JvShape, JvGradient;

type
  TForm_Tab_QuadroEspecialidade = class(TForm)
    DST_Quadro: TDataSource;
    DSQ_Quadro: TDataSource;
    Query_Quadro: TIBQuery;
    Table_Quadro: TIBTable;
    Table_QuadroQUADRO: TIBStringField;
    Table_QuadroDESCRICAO: TIBStringField;
    Panel1: TPanel;
    Panel4: TPanel;
    Edit_Sigla: TEdit;
    DBGrid_SelQuadro: TDBGrid;
    Panel_CampoQuadro: TPanel;
    Label_Nome_Quadro: TLabel;
    Label_Codigo_Quadro: TLabel;
    Edit_NomeQuadro: TDBEdit;
    Edit_SiglaQuadro: TDBEdit;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvGradient1: TJvGradient;
    JvShape1: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Cancel: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_Altera: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;

    Procedure Containers(Status: Boolean);
    procedure FormActivate(Sender: TObject);

    procedure Limpar_Quadro;
    procedure Campos_Quadro(Status: Boolean);

    procedure oTable_QuadroPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Edit_SiglaChange(Sender: TObject);
    procedure Edit_SiglaQuadroExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlteraClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelClick(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
    VS_OpcaoQuadro: String;
  public
    { Public declarations }
  end;

var
  Form_Tab_QuadroEspecialidade: TForm_Tab_QuadroEspecialidade;

implementation

uses Module;

{$R *.DFM}


//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm( Form_Tab_QuadroEspecialidade, ' Cadastro de Quadro/Especialidade');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Tabelas Auxiliares - Quadro/Especialidade');    // Abre o perfil do usuario em relacao a agenda

   JvTransparentButton_Atualizar.Visible:= False;
   JvTransparentButton_Retornar.Visible:= True;
   JvTransparentButton_Windows.Visible:= True;

   Containers(True);

   // Abertura das tabelas que serao utlizadas

   Table_Quadro.Open;
   JvTransparentButton_AtualizarClick(Sender);

   Campos_Quadro(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Table_Quadro.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure desabiliatr os Containers
//------------------------------------------------------------------------------

Procedure TForm_Tab_QuadroEspecialidade.Containers(Status: Boolean);
begin
   JvTransparentButton_Atualizar.Visible:= Status;
   JvTransparentButton_Retornar.Visible:= Status;
   JvTransparentButton_Windows.Visible:= Status;
   DBGrid_SelQuadro.Enabled:= Status;

   Funcoes.BotoesBasico( Status, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);

   if Status = False then
   begin
      JvTransparentButton_Grava.Enabled:= Status;
      JvTransparentButton_Cancel.Enabled:= Status;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento Cadastro Quadro
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Limpa os campos
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.Limpar_Quadro;
begin
   Edit_SiglaQuadro.Text:= '';
   Edit_NomeQuadro.Text:= '';
end;

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.Campos_Quadro(Status: Boolean);
begin
   Edit_SiglaQuadro.Enabled:= Status;
   Edit_NomeQuadro.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento da saida do campos Sigla
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.Edit_SiglaQuadroExit(Sender: TObject);
begin
   Edit_NomeQuadro.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo Quadro
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_InserirClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Quadro/Especialidade', 'Inserir Quadro');
   VS_OpcaoQuadro:= 'Novo';

   Containers(False);
   Campos_Quadro(True);
   Limpar_Quadro;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);

   Table_Quadro.Append;

   Edit_SiglaQuadro.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera Quadro
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_AlteraClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Quadro/Especialidade', 'Alterar Quadro');
   VS_OpcaoQuadro:= 'Alterar';

   Containers(False);
   Campos_Quadro(True);
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);

   Table_Quadro.Edit;
   Edit_SiglaQuadro.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Quadro
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_ExcluiClick( Sender: TObject);
var
   VI_Retorno: integer;
begin
   Funcoes.BotoesNovo01( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   Containers(False);

   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Quadro '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Funcoes.GravaAcesso('Tabelas Auxiliares - Quadro/Especialidade', 'Excluir Quadro');

      Table_Quadro.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Limpar_Quadro;
      Containers(True);
      Edit_SiglaChange(Sender);
   end;
   Containers(True);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Quadro
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_GravaClick( Sender: TObject);
var
   VS_Quadro: string;
begin
   if trim(Edit_SiglaQuadro.Text) = '' then
   begin
      MessageDlg('A sigla não pode ser branco...',mtError, [mbOk],0);
      Edit_SiglaQuadro.SetFocus;
   end
   else
   begin
         Funcoes.GravaAcesso('Tabelas Auxiliares - Quadro/Especialidade', 'Gravar Quadro');

         Containers(True);
         Campos_Quadro(False);

         Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);

         VS_Quadro:= Table_Quadro.FieldByName('Quadro').AsString;
         Table_Quadro.Post;
         Funcoes.ExecutaTransacao;
         Funcoes.AtualizaQuery(Query_Quadro);

         if VS_OpcaoQuadro = 'Novo' then
         begin
            //--- Posiciona no quadro recem cadastrado

            Query_Quadro.Close;
            Query_Quadro.Open;

            Query_Quadro.Locate('Quadro', VarArrayOf([VS_Quadro]), [loPartialKey]);
         end;
         DBGrid_SelQuadro.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Curso
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_CancelClick( Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Quadro/Especialidade', 'Cancelar Quadro');
   Table_Quadro.Cancel;
   Funcoes.ExecutaTransacao;
   Containers(True);
   Campos_Quadro(False);

   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
end;

//------------------------------------------------------------------------------
// Tratamento Quando o quadro já foi cadastrada
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.oTable_QuadroPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          ShowMessage('Este Quadro já foi cadastrado...');
          Abort;
          Edit_SiglaQuadro.SetFocus;
       end;
end;

//------------------------------------------------------------------------------
// Selecao do Quadro pela sigla
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.Edit_SiglaChange(Sender: TObject);
var
   VS_Comando: String;
begin
   if Trim(Edit_Sigla.Text) = '' then
       VS_Comando:= 'Select Quadro From QuadroEsp order by Quadro '
   else
       VS_Comando:= 'Select Quadro From QuadroEsp Where Quadro like '+#39+Trim(Edit_Sigla.Text)+'%'+#39+' order by Quadro ';

   Funcoes.ExecutaQuery( Query_Quadro, VS_Comando);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao
//------------------------------------------------------------------------------

procedure TForm_Tab_QuadroEspecialidade.JvTransparentButton_AtualizarClick( Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Quadro);
end;

procedure TForm_Tab_QuadroEspecialidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Quadro.Close;
   Table_Quadro.Close;
   Action:= caFree;
end;

end.


