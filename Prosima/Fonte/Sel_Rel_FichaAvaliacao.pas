//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Sel_Disciplina.pas                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da Selecao  //
//                             das Disciplinas dos Cursos.                    //
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

unit Sel_Rel_FichaAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvLookOut, JvCheckBox;

type
  TForm_Sel_Rel_FichaAvaliacao = class(TForm)
    ToolBar1: TToolBar;
    ToolButton_ImprimeFichaAvaliacao: TToolButton;
    ToolButton_Fechar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton6: TToolButton;
    Panel_Turma: TPanel;
    JvShape2: TJvShape;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Memo1: TMemo;
    Label11: TLabel;
    Label_data: TLabel;
    Label_Versao: TLabel;
    StatusBar2: TStatusBar;
    PopupMenu_Imprimir: TPopupMenu;
    Selecionado: TMenuItem;
    N1: TMenuItem;
    odos2: TMenuItem;
    ToolButton1: TToolButton;
    JvCheckBox_Vizualizar: TJvCheckBox;
    ToolButton2: TToolButton;
    IBQuery_CadFichaAvl: TIBQuery;
    IBQuery_CadFichaAvlIDCURSO: TSmallintField;
    IBQuery_CadFichaAvlIDTURMA: TIntegerField;
    IBQuery_CadFichaAvlID_FICHA: TIntegerField;
    IBQuery_CadFichaAvlID_ATCO: TIBStringField;
    IBQuery_CadFichaAvlID_EXERCICIO: TIntegerField;
    IBQuery_CadFichaAvlID_AVL: TIBStringField;
    IBQuery_CadFichaAvlID_INSTRUTOR: TIBStringField;
    IBQuery_CadFichaAvlDATA_AVL: TDateTimeField;
    IBQuery_CadFichaAvlFICHACOMPLETA: TIBStringField;
    IBQuery_CadFichaAvlLOCAL: TIBStringField;
    IBQuery_CadFichaAvlMEDIA: TIBBCDField;
    IBQuery_CadFichaAvlNOMECOMPLETO: TIBStringField;
    IBQuery_CadFichaAvlNS: TIBStringField;
    IBQuery_CadFichaAvlPARECER: TBlobField;
    DSQ_Cad_FichaAvl: TDataSource;
    DBEdit_Turma: TDBEdit;
    IBTable_CadFichaAvl: TIBTable;
    IBTable_CadFichaAvlIDCURSO: TSmallintField;
    IBTable_CadFichaAvlIDTURMA: TIntegerField;
    IBTable_CadFichaAvlTURMA: TIBStringField;
    IBTable_CadFichaAvlANO: TIBStringField;
    Panel2: TPanel;
    JvCaptionPanel1: TJvCaptionPanel;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    MaskEdit_Exercicio: TMaskEdit;
    MaskEdit_NomeCompleto: TMaskEdit;
    JvCaptionPanel2: TJvCaptionPanel;
    DBGrid4: TDBGrid;

    procedure FormActivate(Sender: TObject);

    procedure ToolButton_FecharClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MaskEdit_ExercicioChange(Sender: TObject);
    procedure SelecionadoClick(Sender: TObject);
    procedure odos2Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);

  private    { Private declarations }
     VS_CodCurso: String;
  public    { Public declarations }
     VS_Opcao: String;
  end;
var
  Form_Sel_Rel_FichaAvaliacao: TForm_Sel_Rel_FichaAvaliacao;

implementation

uses Module, Relatorio_FichaAvl, MenuPrincipal;


{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_FichaAvaliacao.FormActivate(Sender: TObject);
begin
   if Funcoes.GetStarte = 'Não' then
   begin
      IBTable_CadFichaAvl.Open;

      Funcoes.SetStarte('Sim');

      Label_Versao.Caption:= Versao;
      Label_data.Caption:= Ultima_Atualizacao;

      VS_CodCurso:= '';
      VS_Opcao:= 'Consulta';

      //--- Tratamento da Selecao dos Cursos
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_FichaAvaliacao.ToolButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_FichaAvaliacao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento Para Imprimessao da Ficha Selecionada
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_FichaAvaliacao.SelecionadoClick(Sender: TObject);
begin
   if JvCheckBox_Vizualizar.Checked = True then
      Form_Relatorio_FichaAvl.QuickRep1.Preview
   else
      Form_Relatorio_FichaAvl.QuickRep1.Print;
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir todos as Fichas
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_FichaAvaliacao.odos2Click(Sender: TObject);
begin
//   IBQuery_CadFichaAvl.First;
   While not IBQuery_CadFichaAvl.eof do
   begin
      SelecionadoClick(Sender);
      IBQuery_CadFichaAvl.Next;
   end;
end;


//------------------------------------------------------------------------------
// Atualiza Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_FichaAvaliacao.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   // Tratamento do zebrado

   if IBQuery_CadFichaAvl.FieldByName('FICHACOMPLETA').AsString = 'S' then
     DBGrid2.Canvas.Font.Color:= clBlack
   else
      DBGrid2.Canvas.Font.Color:= clRed;

  if gdSelected in State then
    DBGrid2.Canvas.Brush.Color := $008E4F15;

   DBGrid2.Canvas.FillRect(Rect);
   DBGrid2.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
end;

//------------------------------------------------------------------------------
// Tratamento para Selecionar Aluno Atraves do Exercicio e Nome
//------------------------------------------------------------------------------

procedure TForm_Sel_Rel_FichaAvaliacao.MaskEdit_ExercicioChange( Sender: TObject);
var
    VS_Comando: String;
begin
   VS_Comando:= ' Select IdCurso, IdTurma, Id_Ficha, Id_ATCO, ID_Exercicio, Id_AVL, Id_Instrutor, Data_Avl,  FichaCompleta,  Local, Media, NomeCompleto, NS, Parecer ' +
                ' From CAD_FICHA_AVL '+
                ' Where IdCurso = :IdCurso '+
                ' and IdTurma = :IdTurma ';

   if Trim(MaskEdit_Exercicio.Text) <> '' then
      VS_Comando:= VS_Comando+'  and Id_Exercicio = '+trim(MaskEdit_Exercicio.Text);

   if Trim(MaskEdit_NomeCompleto.Text) <> '' then
      VS_Comando:= VS_Comando+'  and NomeCompleto Like '+#39+'%'+trim(MaskEdit_NomeCompleto.Text)+'%'+#39;

   VS_Comando:= VS_Comando+' Order By NomeCompleto, Id_Exercicio ';

   IBQuery_CadFichaAvl.Close;
   IBQuery_CadFichaAvl.SQL.Clear;
   IBQuery_CadFichaAvl.Sql.Add(VS_Comando);
   IBQuery_CadFichaAvl.Open;
end;


procedure TForm_Sel_Rel_FichaAvaliacao.DBGrid2DblClick(Sender: TObject);
begin
   SelecionadoClick(Sender);
end;

end.

