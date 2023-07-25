//------------------------------------------------------------------------------
//
// Prosima
//
// Responsavel: Osvaldir D Ramos
// Data       : 01/11/2012
// Modulo     : Modulo responsavel pelo Cadastro e Montagem das Fichas de
//              Avaliacao
//
//------------------------------------------------------------------------------

unit MontaFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DBCtrls, JvToolEdit, JvDBCtrl, DB, IBCustomDataSet,
  IBTable, StdCtrls, Mask, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, Rotinas,
  JvGradient;

type
  TForm_CriarModelo_Ficha = class(TForm)
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Atualizar: TToolButton;
    ToolButton5: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    DBGrid_Fichas: TDBGrid;
    Panel1: TPanel;
    ToolBar11: TToolBar;
    SpeedButton_Novo: TToolButton;
    SpeedButton_Altera: TToolButton;
    SpeedButton_Exclui: TToolButton;
    ToolButton2: TToolButton;
    SpeedButton_Grava: TToolButton;
    SpeedButton_Cancel: TToolButton;
    IBTable_FichaAvl: TIBTable;
    DST_FichaAvl: TDataSource;
    IBQuery_Item_Area: TIBQuery;
    Panel_Campos: TPanel;
    JvDBDateEdit_Data: TJvDBDateEdit;
    DBEdit_Descricao: TDBEdit;
    DBGrid_Ficha: TDBGrid;
    IBTable_FichaAvlID_FICHA: TIntegerField;
    IBTable_FichaAvlDESCRICAO: TIBStringField;
    IBTable_FichaAvlDATA: TDateTimeField;
    Panel_Sel_area: TPanel;
    ToolBar1: TToolBar;
    ToolButton_InserirItem: TToolButton;
    ToolButton_ExcluirItem: TToolButton;
    ToolButton3: TToolButton;
    DBGrid2: TDBGrid;
    DSQ_Item_Area: TDataSource;
    ToolButton_FecharJanelaItem: TToolButton;
    ToolButton7: TToolButton;
    IBTable_Item_Avl: TIBTable;
    DST_Item_Area: TDataSource;
    IBTable_Ficha_Item: TIBTable;
    DataSource1: TDataSource;
    IBQuery_Item_AreaID_ITEM: TIBStringField;
    IBQuery_Item_AreaAREA_AVALIACAO: TIBStringField;
    IBTable_Item_AvlID_ITEM: TIBStringField;
    IBTable_Item_AvlID_AVL: TIntegerField;
    IBTable_Item_AvlDESCRICAO: TIBStringField;
    IBTable_Ficha_ItemID_FICHA: TIntegerField;
    IBTable_Ficha_ItemID_ITEM: TIBStringField;
    IBTable_Ficha_ItemID_AVL: TIntegerField;
    IBQuery_Ficha_Avl: TIBQuery;
    DSQ_Ficha_Avl: TDataSource;
    IBQuery_Ficha_AvlID_FICHA: TIntegerField;
    IBQuery_Ficha_AvlDESCRICAO: TIBStringField;
    IBQuery_Ficha_AvlDATA: TDateTimeField;
    IBQuery_Ficha_Item: TIBQuery;
    DSQ_Ficha_Item: TDataSource;
    IBQuery_Ficha_ItemID_FICHA: TIntegerField;
    IBQuery_Ficha_ItemID_ITEM: TIBStringField;
    IBQuery_Ficha_ItemID_AVL: TIntegerField;
    IBQuery_Ficha_ItemDESCRICAO: TIBStringField;
    ToolButton1: TToolButton;
    IBQuery_Ficha_ItemAREA_AVALIACAO: TIBStringField;
    JvGradient2: TJvGradient;
    Label_Nome: TLabel;
    Label_Senha: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;

    procedure Tratar_Campos(Status: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton_NovoClick(Sender: TObject);
//    procedure ToolButton_FecharJanelaItemClick(Sender: TObject);
    procedure SpeedButton_AlteraClick(Sender: TObject);
    procedure SpeedButton_ExcluiClick(Sender: TObject);
    procedure ToolButton_InserirItemClick(Sender: TObject);
    procedure ToolButton_ExcluirItemClick(Sender: TObject);
    procedure SpeedButton_GravaClick(Sender: TObject);
    procedure SpeedButton_CancelClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_AtualizarClick(Sender: TObject);
    procedure DBGrid_FichaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private        { Private declarations }
     VS_Opcao: String;
  public
    { Public declarations }
  end;

var
  Form_CriarModelo_Ficha: TForm_CriarModelo_Ficha;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando iniciada a Form
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.FormActivate(Sender: TObject);
begin
   IBQuery_Ficha_Avl.Open;
   IBQuery_Item_Area.Open;
   IBQuery_Ficha_Item.Open;

   IBTable_FichaAvl.Open;
   IBTable_Item_Avl.Open;
   IBTable_Ficha_Item.Open;

   Tratar_Campos(True);
   Panel_Sel_area.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.ToolButton_AtualizarClick( Sender: TObject);
begin
  Funcoes.AtualizaQuery(IBQuery_Ficha_Avl);
  Funcoes.AtualizaQuery(IBQuery_Ficha_Item);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Ficha_Avl.Close;
   IBQuery_Item_Area.Close;
   IBQuery_Ficha_Item.Close;

   IBTable_FichaAvl.Close;
   IBTable_Item_Avl.Close;
   IBTable_Ficha_Item.Close;

   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para Fechar o programa
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.ToolButton_WindowsClick(Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento dos Campos a serem preenchidos
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.Tratar_Campos(Status: Boolean);
begin
   ToolBar_BotoesIniciais.Enabled:= Status;
   SpeedButton_Novo.Enabled:= Status;
   SpeedButton_Altera.Enabled:= Status;
   SpeedButton_Exclui.Enabled:= Status;


   if Status = True then
      Status:= False
   else
      Status:= True;

   Panel_Campos.Enabled:= Status;
   SpeedButton_Grava.Enabled:= Status;
   SpeedButton_Cancel.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do Botal Inserir
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.SpeedButton_NovoClick(Sender: TObject);
begin
   IBQuery_Ficha_Item.Close;

   VS_Opcao:= 'Inserir';
   Tratar_Campos(False);

   IBTable_FichaAvl.Append;
   IBTable_FichaAvl.FieldByName('ID_FICHA').AsInteger:= Funcoes.MaiorCodigo('Id_Ficha', 'FICHA_AVL');
   IBTable_FichaAvl.FieldByName('Data').AsString:= DateToStr(date);
   DBEdit_Descricao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botal alterar
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.SpeedButton_AlteraClick(Sender: TObject);
begin
   VS_Opcao:= 'Alterar';
   IBTable_FichaAvl.Edit;
   Tratar_Campos(False);
   Panel_Sel_area.Visible:= True;
   DBEdit_Descricao.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Excluir
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.SpeedButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Id_Ficha, VS_Comando: String;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a Ficha de Avaliação selecionada '+#13+#13+'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_Retorno = IDYes then
   begin
      VS_Id_Ficha:= IBQuery_Ficha_Avl.FieldByName('Id_Ficha').AsString;

      VS_Comando:= 'Delete From  Ficha_Item Where Id_Ficha = '+VS_Id_Ficha;
      Funcoes.ExecSql(VS_comando);

      VS_Comando:= 'Delete From Cad_Ficha_Avl Where Id_Ficha = '+VS_Id_Ficha;
      Funcoes.ExecSqlProsima(VS_Comando);

      VS_Comando:= 'Delete From PR_Avaliacao Where Id_Ficha = '+VS_Id_Ficha;
      Funcoes.ExecSqlProsima(VS_Comando);

      IBTable_FichaAvl.Delete;
      Funcoes.ExecutaTransacao_Prosima;
      ToolButton_AtualizarClick( Sender );
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.SpeedButton_GravaClick(Sender: TObject);
begin
   if DBEdit_Descricao.Text = '' then
   begin
      ShowMessage('A Descrição não pode ser Branco...');
      DBEdit_Descricao.SetFocus;
   end
   else
   begin
      IBTable_FichaAvl.Post;
      Funcoes.ExecutaTransacao_Prosima;
      ToolButton_AtualizarClick( Sender);

      if VS_Opcao = 'Inserir' then
      begin
         Panel_Sel_area.Visible:= True;
         IBQuery_Ficha_Avl.Last;
      end;

      Panel_Sel_area.Visible:= False;
      Tratar_Campos(True);
      DBGrid_Fichas.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.SpeedButton_CancelClick(Sender: TObject);
begin
   IBTable_FichaAvl.Cancel;
   Funcoes.abortaTransacao_Prosima;
   Panel_Sel_area.Visible:= False;
   Tratar_Campos(True);
   ToolButton_AtualizarClick( Sender);
   DBGrid_Fichas.SetFocus;
end;


//------------------------------------------------------------------------------
//
// Tratamento da Insercao dos Itens na Ficha de Avaliacao
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Botao para Inserir o Item
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.ToolButton_InserirItemClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select count(1) as Qtd From Ficha_Item Where Id_Ficha = '+IBTable_FichaAvl.FieldByName('ID_FICHA').AsString+' and Id_Item = '+#39+IBQuery_Item_Area.FieldByName('Id_Item').AsString+#39;
   DM.Query_Executa.Close;
   DM.Query_Executa.Sql.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;

   if DM.Query_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      ShowMessage('O Item Selecionado já consta nesta Ficha de Avaliação...');
   end
   else
   begin
      IBTable_Item_Avl.First;
      While not IBTable_Item_Avl.Eof do
      begin
         IBTable_Ficha_Item.Append;
         IBTable_Ficha_Item.FieldByName('ID_FICHA').AsInteger:= IBTable_FichaAvl.FieldByName('ID_FICHA').AsInteger;
         IBTable_Ficha_Item.FieldByName('ID_ITEM').AsString:= IBTable_Item_Avl.FieldByName('ID_ITEM').AsString;
         IBTable_Ficha_Item.FieldByName('ID_AVL').AsInteger:= IBTable_Item_Avl.FieldByName('ID_AVL').AsInteger;
         IBTable_Ficha_Item.Post;
         Funcoes.ExecutaTransacao_Prosima;
         IBTable_Item_Avl.Next;
      end;
      Funcoes.AtualizaQuery(IBQuery_Ficha_Item);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botal para Excluir o Item
//------------------------------------------------------------------------------

procedure TForm_CriarModelo_Ficha.ToolButton_ExcluirItemClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Id_Ficha, VS_Id_Item, VS_Comando: String;
begin
   VI_Retorno:= Application.MessageBox('Essa exclusão eliminará o Item selecionado '+#13+#13+'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_Retorno = IDYes then
   begin
      VS_Id_Ficha:= IBQuery_Ficha_Avl.FieldByName('Id_Ficha').AsString;
      VS_Id_Item:= IBQuery_Item_Area.FieldByName('Id_Item').AsString;

      VS_Comando:= 'Delete From PR_Avaliacao Where Id_Ficha = '+VS_Id_Ficha+' and Id_Item = '+#39+VS_Id_Item+#39;
      Funcoes.ExecSqlProsima(VS_Comando);

      VS_Comando:= 'Delete From Ficha_Item Where Id_Ficha = '+VS_Id_Ficha+' and Id_Item = '+#39+VS_Id_Item+#39;
      Funcoes.ExecSqlProsima(VS_comando);
      Funcoes.AtualizaQuery(IBQuery_Ficha_Item);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botal para Excluir o Item
//------------------------------------------------------------------------------

//procedure TForm_CriarModelo_Ficha.ToolButton_FecharJanelaItemClick(Sender: TObject);
//begin
//   SpeedButton_GravaClick(Sender);
// end;

procedure TForm_CriarModelo_Ficha.DBGrid_FichaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   // Tratamento do zebrado

   if ((IBQuery_Ficha_Item.FieldByName('Id_Item').AsString = 'A' ) or
       (IBQuery_Ficha_Item.FieldByName('Id_Item').AsString = 'C') or
       (IBQuery_Ficha_Item.FieldByName('Id_Item').AsString = 'E') or
       (IBQuery_Ficha_Item.FieldByName('Id_Item').AsString = 'G') or
       (IBQuery_Ficha_Item.FieldByName('Id_Item').AsString = 'I') or
       (IBQuery_Ficha_Item.FieldByName('Id_Item').AsString = 'J')) then
   begin
      DBGrid_Ficha.Canvas.Brush.Color:= $0080FF80;
      DBGrid_Ficha.Canvas.Font.Color:= clBlack;
   end
   else
   begin
      DBGrid_Ficha.Canvas.Brush.Color:= clWhite;
      DBGrid_Ficha.Canvas.Font.Color:= clBlack;
   end;

   DBGrid_Ficha.Canvas.FillRect(Rect);
   DBGrid_Ficha.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_CriarModelo_Ficha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
