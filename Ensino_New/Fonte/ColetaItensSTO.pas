unit ColetaItensSTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBTable, IBQuery, Rotinas,
  StdCtrls, JvRichEd, JvDBRichEd, JvLabel, JvBlinkingLabel, JvGradient,
  JvEdit, ToolWin, Grids, DBGrids, JvComponent, JvTransBtn, ExtCtrls,
  JvShape, PsyRichEdit;

type
  TForm_ColetaItensSTO = class(TForm)
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
    DSQ_Item: TDataSource;
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
    Panel_Botoes: TPanel;
    JvGradient3: TJvGradient;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Carga: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    IBQuery_Disciplina: TIBQuery;
    DSQ_Disciplina: TDataSource;
    Panel_Treeviw: TPanel;
    DBGrid_Disciplina: TDBGrid;
    StatusBar_Msg: TStatusBar;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_Descricao: TJvEdit;
    IBQuery_DisciplinaIDCURSO: TSmallintField;
    IBQuery_DisciplinaIDTURMA: TIntegerField;
    IBQuery_DisciplinaCODMATERIA: TIBStringField;
    IBQuery_DisciplinaNOMEMATERIA: TIBStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Label_Especialidade: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label_Historico: TLabel;
    Edit_Especialidade: TEdit;
    Edit_Destacamento: TEdit;
    Edit_Publicacao: TEdit;
    Edit_Historico: TEdit;
    Text1: TPsyRichEdit;
    Panel3: TPanel;
    ToolBar_Pesquisar: TToolBar;
    JvEdit_NItem: TJvEdit;
    JvEdit_Disc: TJvEdit;
    JvEdit_unid: TJvEdit;
    JvEdit_SubUnid: TJvEdit;
    DBGrid_Item: TDBGrid;

    procedure VerificarDiretorio(Cabecalho, Campo: String; Edit: TEdit; IBQuery: TIBQuery);
    procedure CriarDiretorio(VS_Diretorio: String);

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_CargaClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure IBQuery_DisciplinaAfterScroll(DataSet: TDataSet);
  private    { Private declarations }
       Dir_Principal: String;

  public    { Public declarations }
  end;

var
  Form_ColetaItensSTO: TForm_ColetaItensSTO;

implementation

uses Editor_Texto, Module, Se_Prova;

{$R *.dfm}

//------------------------------------------------------------------------------
// Montagem da Prova
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   IBQuery_Item.Open;
   IBTable_Item_Desc.Open;

   Form_Editor.Text1.Lines.Clear;

   VS_Comando:= ' select IdCurso, IdTurma, CodMateria,  NomeMateria '+
                ' From MateriaCurso '+
                ' where idCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+' '+
                ' and IdTurma = 0'+' '+
                ' Order By NomeMateria ';

   IBQuery_Disciplina.Close;
   IBQuery_Disciplina.Sql.Clear;
   IBQuery_Disciplina.Sql.Add(VS_Comando);
   IBQuery_Disciplina.Open;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a janela
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para retornar
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.JvTransparentButton_WindowsClick(
  Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de coleta dos itens de acordo com a disciplina selecionada
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.JvTransparentButton_CargaClick( Sender: TObject);
var
   arq, Dir_old: String;
begin

   IBTable_Item_Desc.Open;

   Text1.Lines.Clear;

   While not IBQuery_Item.eof do
   begin
      Dir_Principal:= 'c:\Itens_Teste';
      CriarDiretorio( Dir_Principal );    //  verificar o diretorio de distribuiçao dos itens

      Documento.SelectAll;
      Documento.CopyToClipboard;

      Text1.SelStart:= 0;  //5

      VerificarDiretorio('   Especialidade: ', 'DISCIPLINA', Edit_Especialidade, IBQuery_Item);
//      Dir_old:= Dir_Principal;
      VerificarDiretorio('   Destacamento: ', 'Unidade', Edit_Destacamento, IBQuery_Item);
      VerificarDiretorio('   Publicacao: ', 'SubUnidade', Edit_Publicacao, IBQuery_Item);
//      Dir_Principal:= Dir_old;

      if Edit_Historico.Text = '' then
         Text1.Lines.Add( '   Histórico: '+IBTable_Item_Desc.FieldByName('observacao').AsString)
      else
         Text1.Lines.Add( '   Histórico: '+Edit_Historico.Text);


      Text1.Lines.Add( ' ');
      Text1.Lines.Add( '   Resposta Correta: '+IBTable_Item_Desc.FieldByName('RESPOSTACORRETA').AsString);
      Text1.Lines.Add( '___________________________________________________________________________');
      Text1.Lines.Add( ' ');

      Text1.PasteFromClipboard ;
      Text1.Lines.Add( '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      Text1.Lines.Add( ' ');
      IBQuery_Item.Next;
      Update;
   end;


   Text1.SelStart:= 0;
   Arq:= Dir_Principal+'\'+Edit_Publicacao.Text+'.txt';
   Text1.Lines.SaveToFile(arq);
   Form_Editor.Show;
end;


//------------------------------------------------------------------------------
//  Tratamento para criar o diretorio
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.VerificarDiretorio(Cabecalho, Campo: String; Edit: TEdit; IBQuery: TIBQuery);
begin
      if Edit.Text = '' then
      begin
         Dir_Principal:= Dir_Principal+'\'+IBQuery.FieldByName(Campo).AsString;
         CriarDiretorio(Dir_Principal);
         Text1.Lines.Add( Cabecalho+IBQuery.FieldByName(Campo).AsString);
      end
      else
      begin
         Dir_Principal:= Dir_Principal+'\'+Edit.Text;
         CriarDiretorio(Dir_Principal);
         Text1.Lines.Add( Cabecalho+Edit.Text);
      end;
end;

//------------------------------------------------------------------------------
//  Tratamento para criar o diretorio
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.CriarDiretorio(VS_Diretorio: String);
begin
   if not DirectoryExists(VS_Diretorio) then
       ForceDirectories(VS_Diretorio);
end;

//------------------------------------------------------------------------------
//  Tratamento Identificar a especialidade
//------------------------------------------------------------------------------

procedure TForm_ColetaItensSTO.IBQuery_DisciplinaAfterScroll(DataSet: TDataSet);
begin
    Edit_Especialidade.Text:= IBQuery_Disciplina.FieldByName('NomeMateria').AsString;
end;

end.
