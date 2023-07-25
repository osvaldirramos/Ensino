unit ColetaItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBTable, IBQuery, Rotinas,
  StdCtrls, JvRichEd, JvDBRichEd, JvLabel, JvBlinkingLabel, JvGradient;

type
  TForm_ColetaItens = class(TForm)
    Documento: TJvDBRichEdit;
    IBQuery_Documento: TIBQuery;
    IBQuery_DocumentoDOC: TIBStringField;
    IBQuery_DocumentoDESCRICAO: TBlobField;
    DSQ_Documentacao: TDataSource;
    IBQuery_Item: TIBQuery;
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
    DataSource1: TDataSource;
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
    JvGradient3: TJvGradient;
    JvBlinkingLabel1: TJvBlinkingLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ColetaItens: TForm_ColetaItens;

implementation

uses Editor_Texto, Module, Se_Prova;

{$R *.dfm}

//------------------------------------------------------------------------------
// Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_ColetaItens.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   IBTable_Item_Desc.Open;

   Form_Editor.Text1.Lines.Clear;

   VS_Comando:= ' select  IdCurso, IdTurma, NumItem, CodMateria, Disciplina, Unidade, SubUnidade, Objetivo, Serie, Status '+
                ' From Item_Prova '+
                ' where idCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' '+
                ' and IdTurma = 0'+' '+
                '  Order By disciplina,unidade,subunidade,objetivo,serie ';

   IBQuery_Item.Close;
   IBQuery_Item.Sql.Clear;
   IBQuery_Item.Sql.Add(VS_Comando);
   IBQuery_Item.Open;

   While not IBQuery_Item.eof do
   begin
      Documento.SelectAll;
      Documento.CopyToClipboard;

      Form_Editor.Text1.SelStart:= 0;  //5
      Form_Editor.Text1.Lines.Add( 'Disciplina: '+IBQuery_Item.FieldByName('DISCIPLINA').AsString+
                                   '   Unidade: '+IBQuery_Item.FieldByName('UNIDADE').AsString+
                                   '   Sub-Unidade: '+IBQuery_Item.FieldByName('SUBUNIDADE').AsString+
                                   '   Objetivo: '+IBQuery_Item.FieldByName('OBJETIVO').AsString+
                                   '   Serie: '+IBQuery_Item.FieldByName('SERIE').AsString+
                                   '   Resposta Correta: '+IBTable_Item_Desc.FieldByName('RESPOSTACORRETA').AsString
                                  );

      Form_Editor.Text1.PasteFromClipboard ;
      IBQuery_Item.Next;
      Update;
   end;

   Form_Editor.Text1.SelStart:= 0;
   Form_Editor.Show;
   close;
end;

procedure TForm_ColetaItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
