unit Conflito_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, JvRichEd, Rotinas,
  JvDBRichEd, JvLookOut, JvShape, Grids, DBGrids, JvEdit, Mask,
  JvComponent, JvCaptionPanel, JvxCtrls, ToolWin, DB, IBTable,
  IBCustomDataSet, IBQuery, DBClient, JvTransBtn;

const
   Conflito = '#¥§©®Ø†‡Ö@ø£¤€ª«µ»<=>?^~¢±';
type
  TForm_ConflitoItem = class(TForm)
    Panel2: TPanel;
    Panel_Curso: TPanel;
    Panel_Treeviw: TPanel;
    JvCaptionPanel_Disciplina: TJvCaptionPanel;
    DBNavigator2: TDBNavigator;
    ToolBar2: TToolBar;
    MaskEdit_Disciplina: TMaskEdit;
    JvEdit_NomeMateria: TJvEdit;
    DBGrid_Disciplina: TDBGrid;
    Panel_Container: TPanel;
    Panel_Funcoes: TPanel;
    DBGrid_Item: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label_Disciplina: TLabel;
    Label3: TLabel;
    Label_ItemSelecionado: TLabel;
    JvDBRichEdit1: TJvDBRichEdit;
    Query_MontaMateria: TIBQuery;
    Query_MontaMateriaIDCURSO: TSmallintField;
    Query_MontaMateriaIDTURMA: TIntegerField;
    Query_MontaMateriaCODMATERIA: TIBStringField;
    Query_MontaMateriaNOMEMATERIA: TIBStringField;
    Query_MontaMateriaNUMEROAULASTEORICAS: TSmallintField;
    Query_MontaMateriaNUMEROAULASPRATICAS: TSmallintField;
    IBQuery_Item: TIBQuery;
    DSQ_Item: TDataSource;
    DSQ_MontaMateria: TDataSource;
    IBTable_Item_Desc: TIBTable;
    IBTable_Item_DescNUMITEM: TIntegerField;
    IBTable_Item_DescRESPOSTACORRETA: TIBStringField;
    IBTable_Item_DescQDEAPLIC: TSmallintField;
    IBTable_Item_DescQDEIRREGULARIDADE: TSmallintField;
    IBTable_Item_DescQDEANULADA: TSmallintField;
    IBTable_Item_DescPOSSUI_IMAGEM: TIBStringField;
    IBTable_Item_DescRECURSO: TIBStringField;
    IBTable_Item_DescOBSERVACAO: TIBStringField;
    IBTable_Item_DescDESCENALT: TBlobField;
    IBTable_Item_DescNLINHAS: TSmallintField;
    IBTable_Item_DescTEMPORES: TIBStringField;
    DST_ItemDesc: TDataSource;
    DSC_SelConflito: TDataSource;
    IBTable_MostraItemConflito: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    BlobField1: TBlobField;
    SmallintField4: TSmallintField;
    IBStringField5: TIBStringField;
    DST_MostraItemConflito: TDataSource;
    JvDBRichEdit_Text: TJvDBRichEdit;
    IBTable_ItemConflito: TIBTable;
    DataSource2: TDataSource;
    IBTable_ItemConflitoIDTURMA: TIntegerField;
    IBTable_ItemConflitoIDCURSO: TSmallintField;
    IBTable_ItemConflitoNUMITEM: TIntegerField;
    IBTable_ItemConflitoNUMITEM_CONFLITO: TIntegerField;
    IBTable_ItemConflitoCONFLITO: TIBStringField;
    ToolBar3: TToolBar;
    MaskEdit_NItem: TJvEdit;
    MaskEdit_Disc: TJvEdit;
    MaskEdit_Unid: TJvEdit;
    MaskEdit_SubUnid: TJvEdit;
    MaskEdit_Objetivo: TJvEdit;
    MaskEdit_Serie: TJvEdit;
    IBQuery_ItemIDCURSO: TSmallintField;
    IBQuery_ItemIDTURMA: TIntegerField;
    IBQuery_ItemNUMITEM: TIntegerField;
    IBQuery_ItemCODMATERIA: TIBStringField;
    IBQuery_ItemDISCIPLINA: TIBStringField;
    IBQuery_ItemUNIDADE: TIBStringField;
    IBQuery_ItemSUBUNIDADE: TIBStringField;
    IBQuery_ItemOBJETIVO: TIBStringField;
    IBQuery_ItemSERIE: TIBStringField;
    IBQuery_ItemSTATUS: TIBStringField;
    ClientDataSet_SelConflito: TClientDataSet;
    ClientDataSet_SelConflitostatus: TBooleanField;
    ClientDataSet_SelConflitonumItem: TIntegerField;
    ClientDataSet_SelConflitodisciplina: TStringField;
    ClientDataSet_SelConflitoobjetvo: TStringField;
    IBTable1: TIBTable;
    DataSource1: TDataSource;
    IBTable1IDTURMA: TIntegerField;
    IBTable1IDCURSO: TSmallintField;
    IBTable1NUMITEM: TIntegerField;
    IBTable1NUMITEM_CONFLITO: TIntegerField;
    IBTable1CONFLITO: TIBStringField;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;

    procedure SelecaoDisciplinas;
    procedure CargaDosItemsParaSelecao;

    procedure FormActivate(Sender: TObject);
    procedure Query_MontaMateriaAfterScroll(DataSet: TDataSet);
    procedure DBGrid_ItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_ItemCellClick(Column: TColumn);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ConflitoItem: TForm_ConflitoItem;

implementation

uses Sel_ItemProva, Turma_Zero, Module;

{$R *.dfm}

procedure TForm_ConflitoItem.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   Label_Disciplina.Caption:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString+' - '+
                              Form_Sel_ItemProva.Query_MontaMateria.FieldByName('NomeMateria').AsString;

   Label_ItemSelecionado.Caption:= Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString+' - '+
                                   Form_Sel_ItemProva.Query_Item.FieldByName('Disciplina').AsString+' - '+
                                   Form_Sel_ItemProva.Query_Item.FieldByName('Unidade').AsString+' - '+
                                   Form_Sel_ItemProva.Query_Item.FieldByName('SubUnidade').AsString+' - '+
                                   Form_Sel_ItemProva.Query_Item.FieldByName('Objetivo').AsString+' - '+
                                   Form_Sel_ItemProva.Query_Item.FieldByName('Serie').AsString+' - '+
                                   Form_Sel_ItemProva.Query_Item.FieldByName('Objetivo').AsString;


   //--- Encontrar o Cararcter de Conflito

   VS_Comando:= 'Select distinct Conflito '+
                ' From Item_Conflito '+
                ' Where IdCurso = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString+
                ' and   IdTurma = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString+
                ' and   IdTurma = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString;

   Query_MontaMateria.Open;
   IBQuery_Item.Open;

   IBTable_ItemConflito.Open;

   IBTable_MostraItemConflito.Open;

//  ClientDataSet_RelacaoProdutos.ClearData;
//  ClientDataSet_RelacaoProdutos.CreateDataSet;

   SelecaoDisciplinas;
   CargaDosItemsParaSelecao;
end;



procedure TForm_ConflitoItem.SelecaoDisciplinas;
var
   VS_Conflito, VS_Comando: String;
begin
   VS_Comando:= 'Select Conflito '+
                ' From MateriaCurso '+
                ' Where IdCurso = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString+
                ' and   IdTurma = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString+
                ' and   NumItem = '+Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString;
   Funcoes.OpenQuery(VS_Comando);

   if DM.IBQuery_Executa.FieldByName('Conflito').AsString <> '' then
      VS_Conflito:= DM.IBQuery_Executa.FieldByName('Conflito').AsString
   else
   begin
      VS_Comando:= 'Select count(1) as Qtd '+
                   ' From MateriaCurso '+
                   ' Where IdCurso = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString+
                   ' and   IdTurma = '+Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString;
      Funcoes.OpenQuery(VS_Comando);

   end;


   Query_MontaMateria.Close;
   Query_MontaMateria.Sql.Clear;
   Query_MontaMateria.Sql.Add(VS_Comando);
   Query_MontaMateria.Open;

   Query_MontaMateria.locate('CodMateria',Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,[] )
end;

procedure TForm_ConflitoItem.Query_MontaMateriaAfterScroll( DataSet: TDataSet);
begin
   CargaDosItemsParaSelecao;
end;


procedure TForm_ConflitoItem.CargaDosItemsParaSelecao;
begin

   if IBQuery_Item.Active = true then
   begin
      ClientDataSet_SelConflito.First;
      While not ClientDataSet_SelConflito.Eof do
      begin
         ClientDataSet_SelConflito.Delete;
         ClientDataSet_SelConflito.Next;
      end;


      IBQuery_Item.First;
      While not IBQuery_Item.Eof do
      begin
         if IBQuery_Item.FieldByName('NumItem').AsString <> Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString then
         begin
            ClientDataSet_SelConflito.Append;
            ClientDataSet_SelConflito.FieldByName('Status').AsBoolean:= False;
            ClientDataSet_SelConflito.FieldByName('NumItem').AsString:= IBQuery_Item.FieldByName('NumItem').AsString;
            ClientDataSet_SelConflito.FieldByName('Disciplina').AsString:= IBQuery_Item.FieldByName('CodMateria').AsString;
            ClientDataSet_SelConflito.FieldByName('objetvo').AsString:= IBQuery_Item.FieldByName('Objetivo').AsString;
            ClientDataSet_SelConflito.Post;
         end;

         IBQuery_Item.Next;
      end;
      ClientDataSet_SelConflito.First;
   end;

end;

procedure TForm_ConflitoItem.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_ConflitoItem.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;


procedure TForm_ConflitoItem.DBGrid_ItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   Check: Integer;
   R: TRect;
begin
   if Column.FieldName = 'status' then
   begin
      DBGrid_Item.Canvas.FillRect(Rect);
      Check := 0;

      if ClientDataSet_SelConflito.FieldByName('STATUS').AsBoolean = True then
         Check := DFCS_CHECKED;
      R:=Rect;
      InflateRect(R,1,1); {Diminue o tamanho do CheckBox}
      DrawFrameControl(DBGrid_Item.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;

end;

procedure TForm_ConflitoItem.DBGrid_ItemCellClick(Column: TColumn);
begin
   ClientDataSet_SelConflito.Edit;
   if Column.Title.Caption = 'status' then
      if ClientDataSet_SelConflito.FieldByName('STATUS').AsString = '' then
         ClientDataSet_SelConflito.FieldByName('STATUS').AsBoolean:= False
      else
         if ClientDataSet_SelConflito.FieldByName('STATUS').AsBoolean = True then
            ClientDataSet_SelConflito.FieldByName('STATUS').AsBoolean:= False
         else
            ClientDataSet_SelConflito.FieldByName('STATUS').AsBoolean:= True;
   ClientDataSet_SelConflito.Post;

end;
end.
