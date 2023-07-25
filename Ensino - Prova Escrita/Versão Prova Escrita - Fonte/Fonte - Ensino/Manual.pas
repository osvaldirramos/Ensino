unit Manual;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs, midaslib,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Module, IBQuery, ToolWin, ShellApi, Variants, JvColorCombo,
  JvRichEd, JvDBRichEd, JvCheckBox, JvToolEdit, JvCombobox, ComObj, XPMan, Menus,
  JvArrowBtn, JvLookOut, JvTransBtn, JvGradient, JvShape, JvComponent,
  Rotinas, DBClient, IBCustomDataSet, IBTable;

type
  TForm_ManualUsuario = class(TForm)
    Panel1: TPanel;
    Panel_Opcoes: TPanel;
    DBGrid_Providencia: TDBGrid;
    PopupMenu1: TPopupMenu;
    Inserir1: TMenuItem;
    Alterar1: TMenuItem;
    Gravar1: TMenuItem;
    Cancelar1: TMenuItem;
    Panel_CadManual: TPanel;
    Label1: TLabel;
    DBEdit_Id_Indice: TDBEdit;
    Label2: TLabel;
    DBEdit_Descricao: TDBEdit;
    JvDBRichEdit_Text: TJvDBRichEdit;
    DSC_Manual: TDataSource;
    IBTable_Manual: TIBTable;
    IBTable_ManualINDICE: TIBStringField;
    IBTable_ManualDESCRICAO: TIBStringField;
    IBTable_ManualCONTEUDO: TBlobField;
    DST_Manual: TDataSource;
    IBTable_ManualMODULO: TIBStringField;
    Label3: TLabel;
    DBEdit_modulo: TDBEdit;
    IBTable_ManualID_INDICE: TSmallintField;
    Label4: TLabel;
    DBEdit_Indice: TDBEdit;
    ClientDataSet_Manual: TClientDataSet;
    ClientDataSet_ManualId_Indice: TIntegerField;
    ClientDataSet_ManualIndice: TStringField;
    ClientDataSet_ManualDescricao: TStringField;
    JvGradient2: TJvGradient;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;

    procedure GravaIndice;
    procedure TratarIndice;
    procedure LimparLista;

    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure Inserir1Click(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Gravar1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ManualUsuario: TForm_ManualUsuario;

implementation

uses DM_Manual;


{$R *.dfm}

procedure TForm_ManualUsuario.FormActivate(Sender: TObject);
begin
   IBTable_Manual.Close;
   Panel_CadManual.Visible:= False;
   DMManual.IBQuery_Manual.Open;
   LimparLista;
   TratarIndice;
   IBTable_Manual.Open;
end;

procedure TForm_ManualUsuario.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   IBTable_Manual.Close;
   DMManual.IBQuery_Manual.Close;
   Close;
end;

procedure TForm_ManualUsuario.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   IBTable_Manual.Close;
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Montar o indice do Manual
//------------------------------------------------------------------------------

procedure TForm_ManualUsuario.TratarIndice;
begin
   ClientDataSet_Manual.Active:= True;

   DMManual.IBQuery_Manual.First;
   While not DMManual.IBQuery_Manual.Eof do
   begin
       if DMManual.IBQuery_Manual.FieldByName('Modulo').AsString = 'Geral' then
          GravaIndice
       else
       begin
          Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, DMManual.IBQuery_Manual.FieldByName('Modulo').AsString);
          if DM.Query_PerfilAcesso.FieldByName('PossuiAcesso').AsString = 'S' then
              GravaIndice;
       end;
      DMManual.IBQuery_Manual.Next;
   end;
with ClientDataSet_Manual.IndexDefs.AddIndexDef do
begin 
  Name := 'Id_Indicedx';
  Fields := 'Id_Indice';
//  Options := [ixAscending, ixCaseInsensitive];
end;
ClientDataSet_Manual.IndexName := 'Id_Indicedx';

   ClientDataSet_Manual.First;
   Update;
end;

//------------------------------------------------------------------------------
// Grava o indice do Manual
//------------------------------------------------------------------------------

procedure TForm_ManualUsuario.GravaIndice;
begin
   ClientDataSet_Manual.Append;
   ClientDataSet_Manual.FieldByName('Id_Indice').AsInteger:= DMManual.IBQuery_Manual.FieldByName('Id_Indice').AsInteger;
   ClientDataSet_Manual.FieldByName('Indice').AsString:= DMManual.IBQuery_Manual.FieldByName('Indice').AsString;
   ClientDataSet_Manual.FieldByName('Descricao').AsString:= DMManual.IBQuery_Manual.FieldByName('Descricao').AsString;
   ClientDataSet_Manual.Post;
end;

//------------------------------------------------------------------------------
// Tratamento para inserir um novo indice no manual
//------------------------------------------------------------------------------

procedure TForm_ManualUsuario.Inserir1Click(Sender: TObject);
begin
   Panel_CadManual.Visible:= True;
   JvDBRichEdit_Text.ReadOnly:= False;
   IBTable_Manual.Append;
   DBEdit_Indice.SetFocus;
end;

procedure TForm_ManualUsuario.Alterar1Click(Sender: TObject);
begin
   Panel_CadManual.Visible:= True;
   JvDBRichEdit_Text.ReadOnly:= False;
   IBTable_Manual.Edit;
   JvDBRichEdit_Text.SetFocus;
end;

procedure TForm_ManualUsuario.Gravar1Click(Sender: TObject);
begin
   IBTable_Manual.Post;

   if not DMManual.IBTransaction_Manual.Active then
       DMManual.IBTransaction_Manual.Active := True;

   DMManual.IBTransaction_Manual.CommitRetaining;


//   DMManual.IBQuery_Manual.Close;
//   DMManual.IBQuery_Manual.Open;

//   LimparLista;
//   TratarIndice;

   Panel_CadManual.Visible:= False;
   JvDBRichEdit_Text.ReadOnly:= True;
   DBGrid_Providencia.SetFocus;
end;

procedure TForm_ManualUsuario.Cancelar1Click(Sender: TObject);
begin
   IBTable_Manual.Cancel;

   if not DMManual.IBTransaction_Manual.Active then
       DMManual.IBTransaction_Manual.Active := True;

   DMManual.IBTransaction_Manual.RollbackRetaining;

   Panel_CadManual.Visible:= False;
   JvDBRichEdit_Text.ReadOnly:= True;

//   DMManual.IBQuery_Manual.Close;
//   DMManual.IBQuery_Manual.Open;

//   LimparLista;
//   TratarIndice;

   DBGrid_Providencia.SetFocus;
end;

//------------------------------------------------------------------------------
// Limpa o Indice
//------------------------------------------------------------------------------

procedure TForm_ManualUsuario.LimparLista;
begin
   ClientDataSet_Manual.First;
   While Not ClientDataSet_Manual.Eof do
      ClientDataSet_Manual.Delete;
end;

end.
