//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_Pais.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             dos postos e graduacoes.                       //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/08/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_PostoGraduacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtCtrls, ToolWin, Menus, ImgList, DBTables, DB, rOTINAS,
  IBCustomDataSet, IBQuery, IBTable, JvComponent, JvEnterTab, JvTransBtn,
  JvShape, JvGradient;

type
  TForm_Tab_PostoGraduacao = class(TForm)
    Panel_Grid: TPanel;
    DBGrid_Campos: TDBGrid;
    ToolBar1: TToolBar;
    DST_Cadastro: TDataSource;
    DSQ_Consulta: TDataSource;
    Edit_PostoGraduacao: TEdit;
    Table_Cadastro: TIBTable;
    Query_Consulta: TIBQuery;
    Table_CadastroIDANTIGUIDADE: TSmallintField;
    Table_CadastroPOSTOGRADUACAO: TIBStringField;
    Edit_Descricao: TEdit;
    Table_CadastroDESCRICAO: TIBStringField;
    Table_CadastroORIGEM: TIBStringField;
    Panel_Entrada_Dados: TPanel;
    DBEdit_PostoGraduacao: TDBEdit;
    DBEdit_Antiguidade: TDBEdit;
    DBEdit_Descricao: TDBEdit;
    DBComboBox_Origem: TDBComboBox;
    Label_Unidade: TLabel;
    Label_Nome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Table_CadastroGRUPO: TSmallintField;
    Query_ConsultaIDANTIGUIDADE: TSmallintField;
    Query_ConsultaGRUPO: TSmallintField;
    Query_ConsultaPOSTOGRADUACAO: TIBStringField;
    Query_ConsultaDESCRICAO: TIBStringField;
    Query_ConsultaORIGEM: TIBStringField;
    MaskEdit_Grupo: TMaskEdit;
    Label3: TLabel;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancel: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Altera: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Patentes: TJvTransparentButton;

    procedure Campos(Status: Boolean);
    procedure ExecutaQuery;
    procedure TrataBotoes(Status: Boolean);

    procedure DBGrid_CamposTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_SelecaoClick(Sender: TObject);
    procedure oTable_CadastroPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure Edit_PostoGraduacaoChange(Sender: TObject);
    procedure Edit_AntiguidadeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlteraClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelClick(Sender: TObject);
    procedure JvTransparentButton_PatentesClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
  private    { Private declarations }
      VS_Opcao, VS_Comando, VS_OrderBy: String;
  public
    { Public declarations }
  end;

var
  Form_Tab_PostoGraduacao: TForm_Tab_PostoGraduacao;

implementation

uses Module, Divisas;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.FormActivate(Sender: TObject);
begin
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_Tab_PostoGraduacao.Caption:= 'SAE --> Cadastro de Posto/Graduação';

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Tabelas Auxiliares - Posto/Graduação');    // Abre o perfil do usuario em relacao a agenda

   // Abertura das tabelas que serao utlizadas

   VS_OrderBy:= 'Grupo';
   MaskEdit_Grupo.Text:= '';
   Edit_PostoGraduacao.Text:= '';
   ExecutaQuery;
   Table_Cadastro.Open;

   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel);
   TrataBotoes(True);
end;

procedure TForm_Tab_PostoGraduacao.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   Query_Consulta.Close;
   Table_Cadastro.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes basicos
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.TrataBotoes(Status: Boolean);
begin
   JvTransparentButton_Atualizar.Visible:= Status;
   JvTransparentButton_Retornar.Visible:= Status;
   JvTransparentButton_Windows.Visible:= Status;
   JvTransparentButton_Patentes.Visible:= Status;
end;

//------------------------------------------------------------------------------
// Executa a query
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.ExecutaQuery;
var
   VB_Where: Boolean;
begin
   VB_Where:= False;
   VS_Comando:= 'Select Grupo, IdAntiguidade, PostoGraduacao, Descricao, Origem From Antiguidade ';

   if trim(MaskEdit_Grupo.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' Where Upper(Grupo) = '+MaskEdit_Grupo.Text;
      VB_Where:= true;
   end;

   if trim(Edit_PostoGraduacao.Text) <> '' then
   begin
      if VB_Where = False  then
         VS_Comando:= VS_Comando+' Where Upper(PostoGraduacao) Like '+#39+'%'+trim(UpperCase(Edit_PostoGraduacao.Text))+'%'+#39
      else
         VS_Comando:= VS_Comando+' and Upper(PostoGraduacao) Like '+#39+'%'+trim(UpperCase(Edit_PostoGraduacao.Text))+'%'+#39;
      VB_Where:= true;
   end;

   if trim(Edit_Descricao.Text) <> '' then
   begin
      if VB_Where = False  then
         VS_Comando:= VS_Comando+' Where Upper(Descricao) Like '+#39+'%'+trim(UpperCase(Edit_Descricao.Text))+'%'+#39
      else
         VS_Comando:= VS_Comando+' and Upper(Descricao) Like '+#39+'%'+trim(UpperCase(Edit_Descricao.Text))+'%'+#39;
   end;

   Funcoes.ExecutaQuery( Query_Consulta, VS_Comando+' Order by '+VS_OrderBy);
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.DBGrid_CamposTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Grupo (Antiguidade)' then
       VS_OrderBy:= 'Grupo'
   else
     if trim(column.Title.Caption) = 'Posto / Graduação' then
         VS_OrderBy:= 'PostoGraduacao'
     else
        if trim(column.Title.Caption) = 'Descrição' then
            VS_OrderBy:= 'Descricao'
        else
           if trim(column.Title.Caption) = 'Origem' then
               VS_OrderBy:= 'Origem, Grupo';

   ExecutaQuery;
end;

//------------------------------------------------------------------------------
//
// Tratamento dos dados
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.Campos(Status: Boolean);
begin
   Panel_Entrada_Dados.Enabled:= Status;
   DBEdit_Antiguidade.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao novo Cargo
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_InserirClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Posto/Graduação', 'Inserir');

   VS_Opcao:= 'NOVO';
   Campos(True);
   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   TrataBotoes(False);

   Table_Cadastro.Append;
   Table_Cadastro.FieldByName('IdAntiguidade').AsInteger:= Funcoes.MaiorCodigo('IdAntiguidade', 'Antiguidade');
   DBEdit_PostoGraduacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_AlteraClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Posto/Graduação', 'Alterar');

   VS_Opcao:= 'ALTERAR';
   Campos(True);
   Panel_Grid.Enabled:= False;
   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   TrataBotoes(False);
   Table_Cadastro.Edit;
   DBEdit_PostoGraduacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_IdAntiguidade, VI_Ultimo: integer;
   VI_Retorno: integer;
begin
   Funcoes.BotoesNovo01( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   TrataBotoes(False);
   Panel_Grid.Enabled:= False;

   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o posto/graduação '+#13+
                                    'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      VS_OrderBy:= 'IdAntiguidade';

      Funcoes.GravaAcesso('Tabelas Auxiliares - Posto/Graduação', 'Excluir');

      VI_IdAntiguidade:= Table_Cadastro.FieldByName('IdAntiguidade').AsInteger+1;

      Table_Cadastro.Delete;    // Exclui o arquivo
      Funcoes.ExecutaTransacao;
      Funcoes.AtualizaQuery( Query_Consulta );

      Query_Consulta.Last;
      VI_Ultimo:= Table_Cadastro.FieldByName('IdAntiguidade').AsInteger;

      While VI_IdAntiguidade <= VI_Ultimo do
      begin
         //--- Posiciona no posto/graduacao

         VS_Comando:= 'Select * from antiguidade where IdAntiguidade = '+IntToStr(VI_IdAntiguidade);
         ExecutaQuery;

         if Query_Consulta.Recordcount > 0 then
         begin
            Table_Cadastro.Edit;
            Table_Cadastro.FieldByName('IDAntiguidade').AsInteger:= VI_IdAntiguidade-1;
            Table_Cadastro.Post;
            Funcoes.ExecutaTransacao;
         end;
         VI_IdAntiguidade:= VI_IdAntiguidade+1;
      end;
   end;

   VS_Comando:= 'Select * from antiguidade';
   ExecutaQuery;
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   TrataBotoes(True);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_GravaClick( Sender: TObject);
var
   VS_Antiguidade: String;
begin
   VS_Antiguidade:= Table_Cadastro.FieldByName('IdAntiguidade').AsString;
   Table_Cadastro.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.GravaAcesso('Tabelas Auxiliares - Posto/Graduação', 'Gravar');

   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava,JvTransparentButton_Cancel);
   TrataBotoes(True);
   Panel_Grid.Enabled:= True;

   Funcoes.AtualizaQuery( Query_Consulta );
   Query_Consulta.Locate('IdAntiguidade', VarArrayOf([VS_Antiguidade]), [loPartialKey]);
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_CancelClick(Sender: TObject);
begin
   Funcoes.GravaAcesso('Tabelas Auxiliares - Posto/Graduação', 'Cancelar');
   Campos(False);
   Table_Cadastro.Cancel;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery( Query_Consulta );

   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel);
   TrataBotoes(True);
   Panel_Grid.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Funcoes.SetPostoGraduacao('');
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao que retorna o IdAntiguidade
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.ToolButton_SelecaoClick(Sender: TObject);
begin
   if trim(Query_Consulta.FieldByName('PostoGraduacao').AsString) = '' then
   begin
      ShowMessage('O Posto/Graduação não pode ser branco...');
      Edit_PostoGraduacao.SetFocus;
   end
   else
   begin
      Funcoes.SetPostoGraduacao(Query_Consulta.FieldByName('PostoGraduacao').AsString);
      Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Quando o posto/graduacao já foi cadastrado
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.oTable_CadastroPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         ShowMessage('Este posto/graduação já foi cadastrado...');
         Abort;
         DBEdit_Antiguidade.SetFocus;
      end;
end;

//------------------------------------------------------------------------------
// Tratamento da busca pelo codigo de antiguidade
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.Edit_AntiguidadeChange(Sender: TObject);
begin
   ExecutaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento da busca pelo Posto / Graduacao
//------------------------------------------------------------------------------

procedure TForm_Tab_PostoGraduacao.Edit_PostoGraduacaoChange( Sender: TObject);
begin
   ExecutaQuery;
end;

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_AtualizarClick( Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Consulta);
end;

procedure TForm_Tab_PostoGraduacao.JvTransparentButton_PatentesClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Divisas, Form_Divisas);
   Form_Divisas.ShowModal;
end;



end.
