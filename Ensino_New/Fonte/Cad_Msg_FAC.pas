//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Msg_FAC.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das mensagens das Fichas de Avaliação (FAC).   //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Marcela                                     //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 19/05/2020                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Msg_FAC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvTransBtn;

type
  TForm_Cad_FAC_Comentario = class(TForm)
    DBGrid_Item: TDBGrid;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    DBRichEdit_Comentario: TDBRichEdit;
    IBQuery_FAC_Comentario: TIBQuery;
    IBQuery_FAC_ComentarioIDCURSO: TSmallintField;
    IBQuery_FAC_ComentarioIDTURMA: TIntegerField;
    IBQuery_FAC_ComentarioIDAVALIACAO: TIntegerField;
    IBQuery_FAC_ComentarioIDAVALIADOR: TIBStringField;
    IBQuery_FAC_ComentarioTIPO: TIBStringField;
    IBQuery_FAC_ComentarioCOMENTARIO: TIBStringField;
    DSQ_FAC_Comentario: TDataSource;
    IBTable_FAC_Comentario: TIBTable;
    IBTable_FAC_ComentarioIDAVALIACAO: TIntegerField;
    IBTable_FAC_ComentarioIDAVALIADOR: TIBStringField;
    IBTable_FAC_ComentarioTIPO: TIBStringField;
    IBTable_FAC_ComentarioCOMENTARIO: TIBStringField;
    DST_FAC_Comentario: TDataSource;
    Panel2: TPanel;
    Label_Avl_Instrutor_: TLabel;
    Label_Avl_Disciplina: TLabel;
    DSQ_Avaliado: TDataSource;
    IBTable_Pessoa: TIBTable;
    DST_Pessoa: TDataSource;
    IBTable_Disciplina: TIBTable;
    DataSource1: TDataSource;
    IBTable_DisciplinaCODMATERIA: TIBStringField;
    IBTable_DisciplinaNOMEMATERIA: TIBStringField;
    IBQuery_Avaliado: TIBQuery;
    IBQuery_AvaliadoIDCURSO: TSmallintField;
    IBQuery_AvaliadoIDTURMA: TIntegerField;
    IBQuery_AvaliadoIDAVALIACAO: TIntegerField;
    IBQuery_AvaliadoIDENTIDADE: TIBStringField;
    IBQuery_AvaliadoDISCIPLINA: TIBStringField;
    IBTable_DisciplinaIDCURSO: TSmallintField;
    IBTable_DisciplinaIDTURMA: TIntegerField;
    IBTable_PessoaIDENTIDADE: TIBStringField;
    IBTable_PessoaNOME: TIBStringField;
    IBTable_PessoaNOMEGUERRA: TIBStringField;
    IBTable_PessoaPOSTOGRADUACAO: TIBStringField;
    IBQuery_FAC_ComentarioCABECALHO: TIBStringField;
    Panel1: TPanel;
    JvGradient2: TJvGradient;
    JvShape2: TJvShape;
    JvTransparentButton1: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    DBNavigator_FAC_Comentario: TDBNavigator;
    JvShape3: TJvShape;
    Edit_Avl_Instrutor: TEdit;
    Edit_Avl_Disciplina: TEdit;

    procedure FormActivate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBQuery_FAC_ComentarioAfterScroll(DataSet: TDataSet);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton1Click(Sender: TObject);
    procedure DBRichEdit_ComentarioClick(Sender: TObject);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);

  private    { Private declarations }

  public    { Public declarations }
  end;
var
  Form_Cad_FAC_Comentario: TForm_Cad_FAC_Comentario;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_FAC_Comentario.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select fa.idcurso, fa.idturma, fa.Cabecalho, fc.idavaliacao, fc.idavaliador,fc.tipo, fc.comentario '+
                ' From fac_avaliacao_view fa, fac_comentario fc '+
                ' Where fa.idavaliacao = fc.idavaliacao '+
                ' and fa.idCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                ' and fa.idTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                ' order by fa.Cabecalho, fc.tipo ';

      IBQuery_FAC_Comentario.Close;
      IBQuery_FAC_Comentario.Sql.Clear;
      IBQuery_FAC_Comentario.Sql.Add( VS_Comando );
      IBQuery_FAC_Comentario.Open;


//   IBQuery_FAC_Comentario.Open;
   IBQuery_Avaliado.Open;

   IBTable_Pessoa.Open;
   IBTable_Disciplina.Open;
   IBTable_FAC_Comentario.Open;
   DBGrid_Item.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_FAC_Comentario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_FAC_Comentario.Close;

   IBQuery_Avaliado.Close;
   IBTable_Pessoa.Close;
   IBTable_Disciplina.Close;
   IBTable_FAC_Comentario.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Fecha a Janela de Tratamento de comentarios
//------------------------------------------------------------------------------

procedure TForm_Cad_FAC_Comentario.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;


//------------------------------------------------------------------------------
//
// Tratamento do Comantario
//
//------------------------------------------------------------------------------

procedure TForm_Cad_FAC_Comentario.IBQuery_FAC_ComentarioAfterScroll(DataSet: TDataSet);
begin
   Edit_Avl_Instrutor.Text:= trim(IBTable_Pessoa.FieldByName('PostoGraduacao').AsString)+' '+trim(IBTable_Pessoa.FieldByName('NomeGuerra').AsString);
   Edit_Avl_Disciplina.Text:= trim(IBTable_Disciplina.FieldByName('CodMateria').AsString)+' '+trim(IBTable_Disciplina.FieldByName('NomeMateria').AsString);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_Cad_FAC_Comentario.JvTransparentButton1Click( Sender: TObject);
begin
   DBRichEdit_Comentario.SetFocus;

   DBRichEdit_Comentario.SelStart:= 0;  //5
   DBRichEdit_Comentario.SelectAll;
   DBRichEdit_Comentario.CopyToClipboard;
end;


procedure TForm_Cad_FAC_Comentario.DBRichEdit_ComentarioClick(Sender: TObject);
begin
   IBTable_FAC_Comentario.Edit;
end;

procedure TForm_Cad_FAC_Comentario.JvTransparentButton_GravarClick( Sender: TObject);
begin
   if ((IBTable_FAC_Comentario.State = DSInsert) or (IBTable_FAC_Comentario.State = DSEdit )) then
   begin
      IBTable_FAC_Comentario.Post;
      Funcoes.ExecutaTransacao;
   end;
end;

procedure TForm_Cad_FAC_Comentario.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if ((IBTable_FAC_Comentario.State = DSInsert) or (IBTable_FAC_Comentario.State = DSEdit )) then
   begin
      IBTable_FAC_Comentario.Cancel;
      Funcoes.ExecutaTransacao;
   end;
end;

end.

