//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Avaliacao.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da avaliacao.                                  //
//                                                                             //
// MODULOS CHAMADOS         :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/02/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Item_Prova;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas, JvDlg,
  JvEnterTab, JvGrdCpt, DB, IBCustomDataSet, IBTable,
  IBQuery, JvClock, DBGrids, JvDBRichEd, Mask, JvGradient, JvTransBtn,
  JvShape;

const
  RulerAdj = 4/3;
  GutterWid = 6;

type
  TForm_Cad_Item_Prova = class(TForm)
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    Panel_Editor: TPanel;
    ScrollBox_Campos: TScrollBox;
    ControlBar_Botoes: TControlBar;
    ToolBar2: TToolBar;
    JvFontComboBox: TJvFontComboBox;
    ComboBox_Tamanho: TComboBox;
    ToolButton13: TToolButton;
    ToolButton_AlinhamentoEsq: TToolButton;
    ToolButton_AlinhamentoCentralizar: TToolButton;
    ToolButton_AlinhamentoDir: TToolButton;
    ToolButton17: TToolButton;
    ToolButton_Fonte: TToolButton;
    ToolButton_Cor: TToolButton;
    ToolButton20: TToolButton;
    ToolButton_Negrito: TToolButton;
    ToolButton_Italic: TToolButton;
    ToolButton_Sublinhado: TToolButton;
    ToolBar3: TToolBar;
    ToolButton_Recortar: TToolButton;
    ToolButton_Copiar: TToolButton;
    ToolButton_Colar: TToolButton;
    ToolButton_Desfazer: TToolButton;
    Text1: TJvDBRichEdit;
    Panel1: TPanel;
    Ruler: TPanel;
    RulerLine: TBevel;
    RightInd: TLabel;
    Bevel1: TBevel;
    LeftInd: TLabel;
    FirstInd: TLabel;
    DST_ItemProva: TDataSource;
    DST_ItemDesc: TDataSource;
    Table_Item_C: TIBTable;
    Table_Item_CIDCURSO: TSmallintField;
    Table_Item_CIDTURMA: TIntegerField;
    Table_Item_CNUMITEM: TIntegerField;
    Table_Item_CCODMATERIA: TIBStringField;
    Table_Item_CDISCIPLINA: TIBStringField;
    Table_Item_CUNIDADE: TIBStringField;
    Table_Item_CSUBUNIDADE: TIBStringField;
    Table_Item_COBJETIVO: TIBStringField;
    Table_Item_CQUARENTENA: TDateTimeField;
    Table_Item_CSERIE: TIBStringField;
    Table_Item_CSTATUS: TIBStringField;
    Table_IndiceItem: TIBTable;
    Table_IndiceItemNUMITEM: TIntegerField;
    Table_IndiceItemDATAAVALIACAO: TDateTimeField;
    Table_IndiceItemINDICEFACILIDADE: TIBBCDField;
    Table_IndiceItemINDICEDIFERENCIACAO: TIBBCDField;
    Table_IndiceItemINDICEOBJETIVIDADE: TIBBCDField;
    Table_IndiceItemBRANCOS: TIntegerField;
    Table_IndiceItemTOTALALUNOS: TIntegerField;
    PopupMenu1: TPopupMenu;
    Colar1: TMenuItem;
    Panel2: TPanel;
    JvGradient1: TJvGradient;
    RichEdit1: TRichEdit;
    Panel3: TPanel;
    MainMenu1: TMainMenu;
    ToolButton1: TToolButton;
    ToolButton_InserirHora: TToolButton;
    Panel_Dados: TPanel;
    Label_Minuto: TLabel;
    SpeedButton_NLinhas: TSpeedButton;
    DBEdit_Disc: TDBEdit;
    DBEdit_Unid: TDBEdit;
    DBComboBox_objetivo: TDBComboBox;
    DBComboBox_Serie: TDBComboBox;
    DBComboBox_RespostaCorreta: TDBComboBox;
    DBEdit_TempoResposta: TDBEdit;
    DBComboBox_PossuiImagem: TDBComboBox;
    DBComboBox_Recurso: TDBComboBox;
    DBEdit_CodMateria: TDBEdit;
    DBComboBox_ResultadoProva: TDBComboBox;
    DBComboBox_PadraoItem: TDBComboBox;
    DBEdit_NLinha: TDBEdit;
    DBEdit_SubUni: TDBEdit;
    Memo_Msg: TMemo;
    Memo_Alerta: TMemo;
    JvGradient_01: TJvGradient;
    Label_Serie: TLabel;
    Label_Tempo_Resposta: TLabel;
    Label_Objetivo: TLabel;
    Label_Resposta_Correta: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label_Item_Em_Recurso: TLabel;
    Label6: TLabel;
    Label_ResultadoItem: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    JvShape_Gravar: TJvShape;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvGradient_02: TJvGradient;
    Panel_Historico: TPanel;
    Label5: TLabel;
    DBRichEdit_Observacao: TDBRichEdit;
    JvThumbImage1: TJvThumbImage;
    ToolButton_Padonizar: TToolButton;

    procedure NovoItem;
    procedure Alterar;

    procedure VerificaSerie(Sender: TObject);
    procedure TeclasBasicas( Sender: TObject; var Key: Char);

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_DesfazerClick(Sender: TObject);
    procedure ToolButton_CopiarClick(Sender: TObject);
    procedure ToolButton_ColarClick(Sender: TObject);
    procedure JvFontComboBoxClick(Sender: TObject);
    procedure ComboBox_TamanhoClick(Sender: TObject);
    procedure ToolButton_AlinhamentoEsqClick(Sender: TObject);
    procedure Text1SelectionChange(Sender: TObject);
    procedure ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
    procedure ToolButton_AlinhamentoDirClick(Sender: TObject);
    procedure ToolButton_FonteClick(Sender: TObject);
    procedure ToolButton_CorClick(Sender: TObject);
    procedure ToolButton_NegritoClick(Sender: TObject);
    procedure ToolButton_ItalicClick(Sender: TObject);
    procedure ToolButton_SublinhadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_RecortarClick(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure SpeedButton_NLinhasClick(Sender: TObject);
    procedure DBEdit_DiscKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_UnidKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_SubUniKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_objetivoKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_RespostaCorretaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NLinhaKeyPress(Sender: TObject; var Key: Char);
    procedure DBRichEdit_ObservacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBComboBox_SerieKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_PossuiImagemKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBEdit_TempoRespostaKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_RecursoKeyPress(Sender: TObject; var Key: Char);
    procedure Text1KeyPress(Sender: TObject; var Key: Char);
    procedure Text1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton_InserirHoraClick(Sender: TObject);
    procedure ToolButton_PadonizarClick(Sender: TObject);
  private    { Private declarations }
      bmLocal : TBookmark;
      Tam_Font, FDragOfs: Integer;
      FDragging: Boolean;
  public
      VI_NumItem: Integer;
  end;

var
  Form_Cad_Item_Prova: TForm_Cad_Item_Prova;
  Alterado: Boolean;
  NovoArquivo: Boolean;
  Fechar: Boolean;
  NomeArquivo: String;

implementation

uses Sel_ItemProva, Module, ImageWin, Cad_IndiceFacilidade, Frame_Sel_Curso;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo de criacao da Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.FormCreate(Sender: TObject);
var
   N: integer;
begin
  for N := 1 to 48 do
  Begin
    ComboBox_Tamanho.Items.Add(inttostr(N));
  end;
  if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAN' then
  begin
     ComboBox_Tamanho.Text := '11';
     Text1.Font.Name := 'Calibri';
     Text1.Font.Size := 11;
  end
  else
  begin
     ComboBox_Tamanho.Text := '11';
     Text1.Font.Name := 'Courier New';
     Text1.Font.Size := 11;
  end;

   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento quando ativar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.FormActivate(Sender: TObject);
begin
   Panel_Historico.Color:= Cor_Tela;
   JvGradient_01.StartColor:= Cor_Tela;
   JvGradient_02.StartColor:= Cor_Tela;

   Tam_Font:= 11;
   Form_Sel_ItemProva.IBTable_Item_Prova.Open;
   Form_Sel_ItemProva.IBTable_Item_Desc.Open;

   Funcoes.CabecalhoForm(Form_Cad_Item_Prova, 'Cadastro de Itens de Prova');

   Funcoes.SetCadCurso('ItemProva');

   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Item Prova');

   if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
      NovoItem
   else
      Alterar;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro do Item
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao novo Item
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.NovoItem;
var
   Sender: TObject;
begin
   //--- Tratamento do Item referente a Prova

   VI_NumItem:= Funcoes.Ctrl_Item;

    //---
   //--- Grava o numero do ultimo Item

   Form_Sel_ItemProva.IBTable_Item_Prova.Append;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'IdCurso').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'IdTurma').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'CodMateria').AsString:= Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'DISCIPLINA').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,1,2);
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'UNIDADE').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,3,2);
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'SUBUNIDADE').AsString:= Copy(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('CodMateria').AsString,5,2);
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'STATUS').AsString:= 'D';

   //--- Tratamento referente a Descricao do Item

   try
      Form_Sel_ItemProva.IBTable_Item_Desc.insert;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'RespostaCorreta').AsString:= '';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'TempoRes').AsString:= '02';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeAplic').AsInteger:= 0;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeIrregularidade').AsInteger:= 0;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeAnulada').AsInteger:= 0;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Recurso').AsString:= 'N';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Possui_Imagem').AsString:= 'N';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'PADRAO_PROVA').AsString:= 'MULTIPLA ESCOLHA';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'RESULTADO_PROVA').AsString:= 'POR NOTA';

   except
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'RespostaCorreta').AsString:= '';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'TempoRes').AsString:= '02';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeAplic').AsInteger:= 0;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeIrregularidade').AsInteger:= 0;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'QdeAnulada').AsInteger:= 0;
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Recurso').AsString:= 'N';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'Possui_Imagem').AsString:= 'N';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'PADRAO_PROVA').AsString:= 'MULTIPLA ESCOLHA';
      Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'RESULTADO_PROVA').AsString:= 'POR NOTA';
   end;
   Text1.Lines.Clear;

  Text1.SelectAll;
  LeftInd.Left:= 22;
  Text1.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Text1.Paragraph.FirstIndent;

   Text1.SelAttributes.Size := 11;
   FontDialog1.Font.Size := 11;
   Text1.SelAttributes.Name:= 'Courier New';
   Text1.SelStart:= 0;
   Text1.Lines.Insert(0, '#N - ');

   DBComboBox_objetivo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Altera Item
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.Alterar;
begin
   Form_Sel_ItemProva.IBTable_Item_Prova.Edit;
   Form_Sel_ItemProva.IBTable_Item_Desc.Edit;
   VI_NumItem:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('NumItem').AsInteger;
   Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'Status').AsString:= 'D';

   Text1.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de gravacao dos dados inseridos ou alterados Item
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.JvTransparentButton_GravaClick( Sender: TObject);
var
   VS_Comando: String;
begin
   if ((Copy(Text1.Text,1,2) <> '#N')) then
   begin
      Showmessage('Os dois primeiros caracteres devem ser "#N, Voce deverá inserir o #N no inicio da primeira linha...');
      Text1.SetFocus;
   end
   else
   begin
      if DBEdit_Disc.Text = '' then
      begin
         Showmessage('A disciplina não pode ser branco...');
         DBEdit_Disc.SetFocus;
      end
      else
      begin
         if DBEdit_Unid.Text = '' then
         begin
            Showmessage('A unidade não pode ser branco...');
            DBEdit_Unid.SetFocus;
         end
         else
         begin
            if DBEdit_SubUni.Text = '' then
            begin
               Showmessage('A Subunidade não pode ser branco...');
               DBEdit_SubUni.SetFocus;
            end
            else
            begin
               if DBComboBox_objetivo.Text = '' then
               begin
                  Showmessage('Objetivo não pode ser branco...');
                  DBComboBox_objetivo.SetFocus;
               end
               else
               begin
                  if DBComboBox_Serie.Text = '' then
                  begin
                     Showmessage('A série não pode ser branco...');
                     DBComboBox_Serie.SetFocus;
                  end
                  else
                  begin
                     if DBEdit_TempoResposta.Text = '' then
                     begin
                        Showmessage('O tempo de resposta não pode ser branco...');
                        DBEdit_TempoResposta.SetFocus;
                     end
                     else
                     begin
                        if DBComboBox_RespostaCorreta.Text = '' then
                        begin
                           Showmessage('A resposta correta não pode ser branco...');
                           DBComboBox_RespostaCorreta.SetFocus;
                        end
                        else
                        begin
                           if ((DBEdit_NLinha.Text = '') and ( DBComboBox_PossuiImagem.Text = 'S')) then
                           begin
                              Showmessage('Número de linha da questão não pode ser branco...');
                              DBEdit_NLinha.SetFocus;
                           end
                           else
                           begin
                              if (DBEdit_NLinha.Text = '')  then
                                  Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NLinhas').AsInteger:= Text1.Lines.count;

                              if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
                              begin
                                 if ((Form_Sel_ItemProva.IBTable_Item_Desc.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Desc.State = DSEdit )) then
                                    Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NumItem').AsInteger:= VI_NumItem;

                                 if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
                                    Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
                              End;

                              if ((Form_Sel_ItemProva.IBTable_Item_Desc.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Desc.State = DSEdit )) then
                                 Form_Sel_ItemProva.IBTable_Item_Desc.Post;

                              Funcoes.ExecutaTransacao;

                              if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
                              begin
                                 Table_Item_C.Open;
                                 if Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString = '' then
                                    Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString:= DBComboBox_Serie.Text;
                                 Form_Sel_ItemProva.IBTable_Item_Prova.Post;
                                 Funcoes.ExecutaTransacao;

                                 Funcoes.ExecutaQuery( DM.IBQuery_ExecutaBase, 'Select * from Turma '+
                                                                               ' where IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+
                                                                               ' and IdTurma = 0'+
                                                                               ' or (Status = '+#39+'A'+#39+' and IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+')'
                                                     );

                                 DM.IBQuery_ExecutaBase.First;

                                 While not DM.IBQuery_ExecutaBase.Eof do
                                 begin
                                     if DM.IBQuery_ExecutaBase.FieldByName('IdTurma').AsString <> Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString then
                                     begin
                                        VS_Comando:= 'Select count(1) as Qtd '+
                                                     ' From Item_Prova '+
                                                     ' Where IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+
                                                     ' and IdTurma = '+DM.IBQuery_ExecutaBase.FieldByName('IdTurma').AsString+
                                                     ' and NumItem = '+ IntToStr(VI_NumItem);
                                        if Funcoes.QtdRegistro(VS_Comando) = 0 then
                                        begin
                                           Table_Item_C.Append;
                                           Table_Item_C.FieldByName('IDCURSO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString;
                                           Table_Item_C.FieldByName('IdTurma').AsString:= DM.IBQuery_ExecutaBase.FieldByName('IdTurma').AsString;
                                           Table_Item_C.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
                                           Table_Item_C.FieldByName('CODMATERIA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('CODMATERIA').AsString;
                                           Table_Item_C.FieldByName('DISCIPLINA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('DISCIPLINA').AsString;
                                           Table_Item_C.FieldByName('UNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('UNIDADE').AsString;
                                           Table_Item_C.FieldByName('SUBUNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('SUBUNIDADE').AsString;
                                           Table_Item_C.FieldByName('OBJETIVO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('OBJETIVO').AsString;
                                           Table_Item_C.FieldByName('QUARENTENA').AsString:= '';
                                           Table_Item_C.FieldByName('Serie').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString;
                                           Table_Item_C.FieldByName('Status').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Status').AsString;
                                           Table_Item_C.Post;
                                           Funcoes.ExecutaTransacao;
                                        end;
                                     end;
                                     DM.IBQuery_ExecutaBase.Next;
                                  end;

                                 Funcoes.ExecutaQuery(DM.IBQuery_ExecutaBase, 'Select * from Turma Where IdCurso = '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString+' and Status = '+#39+'A'+#39);

                                 DM.IBQuery_ExecutaBase.First;
                                 While not DM.IBQuery_ExecutaBase.Eof do
                                 begin
                                    if DM.IBQuery_ExecutaBase.FieldByName('IDTurma').AsString <> Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'IdTurma').AsString then
                                    begin
                                       if Funcoes.QtdRegistro('Select count(1) as Qtd from Item_Prova '+
                                                              ' Where IdCurso = '+DM.IBQuery_ExecutaBase.FieldByName('IDCURSO').AsString+
                                                              ' and IdTurma = '+DM.IBQuery_ExecutaBase.FieldByName('IDTurma').AsString+
                                                              ' and NumItem = '+INtToStr(VI_NumItem)) = 0 then
                                       begin
                                          Table_Item_C.Append;
                                          Table_Item_C.FieldByName('IDCURSO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('IDCURSO').AsString;
                                          Table_Item_C.FieldByName('IdTurma').AsInteger:= DM.IBQuery_ExecutaBase.FieldByName('IDTurma').AsInteger;
                                          Table_Item_C.FieldByName( 'NumItem').AsInteger:= VI_NumItem;
                                          Table_Item_C.FieldByName('CODMATERIA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('CODMATERIA').AsString;
                                          Table_Item_C.FieldByName('DISCIPLINA').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('DISCIPLINA').AsString;
                                          Table_Item_C.FieldByName('UNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('UNIDADE').AsString;
                                          Table_Item_C.FieldByName('SUBUNIDADE').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('SUBUNIDADE').AsString;
                                          Table_Item_C.FieldByName('OBJETIVO').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('OBJETIVO').AsString;
                                          Table_Item_C.FieldByName('QUARENTENA').AsString:= '';
                                          Table_Item_C.FieldByName('Serie').AsString:= Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName('Serie').AsString;
                                          Table_Item_C.FieldByName('Status').AsString:= 'D';
                                          Table_Item_C.Post;
                                          Funcoes.ExecutaTransacao;
                                       end;
                                    end;
                                    DM.IBQuery_ExecutaBase.Next;
                                 end;
                              end;
                              DM.IBQuery_ExecutaBase.Close;

                              // Verifica se e Insercao de Item se for solicita o Indice de Facilidade

                              if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
                              begin
                                 Application.CreateForm(TForm_Item_IndiceFacilidade, Form_Item_IndiceFacilidade);
                                 Funcoes.SetNumItem(IntToStr(VI_NumItem));
                                 Form_Item_IndiceFacilidade.ShowModal;
                              end;

                              Funcoes.Historico_Item( IntToStr(VI_NumItem), Form_Sel_ItemProva.VS_Opcao);

                              //--- Grava o Responsavel que Inseriu ou Alterou o Item

                              Funcoes.GravaAcesso('Menu Principal - Cadastro Item Prova', Form_Sel_ItemProva.VS_Opcao+' do Item '+Form_Sel_ItemProva.IBTable_Item_Prova.FieldByName( 'NumItem').AsString+' do Curso '+Frame_SelCurso.ComboBox_Curso.Text+' - Usuario: '+Funcoes.GetUsuario);
                              Close;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;

end;


//------------------------------------------------------------------------------
// Tratamento do botao cancela Item
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.JvTransparentButton_CancelarClick( Sender: TObject);
begin
   if ((Form_Sel_ItemProva.IBTable_Item_Desc.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Desc.State = DSEdit )) then
      Form_Sel_ItemProva.IBTable_Item_Desc.Cancel;

   if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert) or (Form_Sel_ItemProva.IBTable_Item_Prova.State = DSEdit )) then
      Form_Sel_ItemProva.IBTable_Item_Prova.Cancel;

   Funcoes.abortaTransacao;

   if Form_Sel_ItemProva.VS_Opcao = 'Inserção' then
      Funcoes.ExecusaoQuery('Delete from Item_Ctrl Where NumItem = '+IntToStr(VI_NumItem));
   Close;
end;


procedure TForm_Cad_Item_Prova.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Table_Item_C.Close;
   Table_IndiceItem.Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Undo
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_DesfazerClick(Sender: TObject);
begin
  Text1.Undo;
  if Text1.HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Copiar
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_CopiarClick(Sender: TObject);
begin
   Text1.CopyToClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Colar
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_ColarClick(Sender: TObject);
begin
   Text1.PasteFromClipboard;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da fonte de letra
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.JvFontComboBoxClick(Sender: TObject);
begin
  Text1.SelAttributes.Name := JvFontComboBox.FontName;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do tamanho da fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ComboBox_TamanhoClick(Sender: TObject);
begin
  text1.SelAttributes.Size := StrToInt(ComboBox_Tamanho.Items[ComboBox_Tamanho.ItemIndex]);
  FontDialog1.Font.Size := StrToInt(ComboBox_Tamanho.Items[ComboBox_Tamanho.itemindex]);
  text1.SetFocus;
end;

procedure TForm_Cad_Item_Prova.Text1SelectionChange(Sender: TObject);
begin
   ToolButton_Copiar.Enabled := Text1.SelLength > 0;
   ToolButton_Recortar.Enabled := Text1.SelLength > 0;
   ToolButton_Colar.Enabled := Clipboard.HasFormat(CF_TEXT);
   ToolButton_Negrito.Down := (fsBold in text1.SelAttributes.Style);
   ToolButton_Italic.Down := (fsItalic in text1.SelAttributes.Style);
   ToolButton_Sublinhado.Down := (fsUnderline in text1.SelAttributes.Style);
   case text1.Paragraph.Alignment of
      paLeftJustify:
          begin
             ToolButton_AlinhamentoEsq.Down := true;
             ToolButton_AlinhamentoCentralizar.Down := False;
             ToolButton_AlinhamentoDir.Down := false;
          end;
      paCenter:
          begin
             ToolButton_AlinhamentoCentralizar.Down := true;
             ToolButton_AlinhamentoDir.Down := false;
             ToolButton_AlinhamentoEsq.Down := false;
          end;
      paRightJustify:
          begin
             ToolButton_AlinhamentoDir.Down := true;
             ToolButton_AlinhamentoCentralizar.Down := false;
             ToolButton_AlinhamentoEsq.Down := false;
          end;
   end;
   JvFontComboBox.FontName:= text1.SelAttributes.Name;
   ComboBox_Tamanho.Text := inttostr(text1.SelAttributes.size);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para esquerda
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_AlinhamentoEsqClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paLeftJustify;
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para ajustar para centralizar
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_AlinhamentoCentralizarClick(Sender: TObject);
begin
  Text1.Paragraph.Alignment := paCenter;
  Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do bota para ajustar para direita
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_AlinhamentoDirClick(Sender: TObject);
begin
   Text1.Paragraph.Alignment := paRightJustify;
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar fonte
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_FonteClick(Sender: TObject);
begin
  FontDialog1.Execute;
  Text1.SelAttributes.Color := FontDialog1.Font.Color;
  Text1.SelAttributes.Name := FontDialog1.Font.Name;
  Text1.SelAttributes.Size := FontDialog1.Font.Size;
  Text1.SelAttributes.Style := FontDialog1.Font.Style;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da cor
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_CorClick(Sender: TObject);
begin
   ColorDialog1.Execute ;
   Text1.SelAttributes.Color := ColorDialog1.Color;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da negrito
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_NegritoClick(Sender: TObject);
begin
   if    (text1.SelAttributes.Style = [fsbold]) or
         (text1.SelAttributes.Style = [fsbold, fsitalic]) or
         (text1.SelAttributes.Style = [fsbold, fsunderline]) or
         (text1.SelAttributes.Style = [fsbold, fsitalic, fsunderline]) then
      text1.SelAttributes.Style := text1.SelAttributes.Style - [fsbold]
   else
      text1.SelAttributes.Style := text1.SelAttributes.Style + [fsbold];
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da Italico
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_ItalicClick(Sender: TObject);
begin
   if (text1.SelAttributes.Style = [fsitalic]) or
      (text1.SelAttributes.Style = [fsitalic, fsbold]) or
      (text1.SelAttributes.Style = [fsitalic, fsunderline]) or
      (text1.SelAttributes.Style = [fsitalic, fsbold, fsunderline]) then
   text1.SelAttributes.Style := text1.SelAttributes.Style - [fsitalic]
   else
   text1.SelAttributes.Style := text1.SelAttributes.Style + [fsitalic];
   Text1SelectionChange(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao para tratar da sublinhado
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_SublinhadoClick(Sender: TObject);
begin
    if (text1.SelAttributes.Style = [fsunderline]) or
       (text1.SelAttributes.Style = [fsunderline, fsitalic]) or
       (text1.SelAttributes.Style = [fsunderline, fsbold]) or
       (text1.SelAttributes.Style = [fsunderline, fsitalic, fsbold]) then
    text1.SelAttributes.Style := text1.SelAttributes.Style - [fsunderline]
    else
    text1.SelAttributes.Style := text1.SelAttributes.Style + [fsunderline];
    Text1SelectionChange(Sender);
end;

procedure TForm_Cad_Item_Prova.ToolButton_RecortarClick(Sender: TObject);
begin
  Text1.CutToClipboard;
end;

//------------------------------------------------------------------------------
// Tratao tamanho da regua
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.Width;
end;

procedure TForm_Cad_Item_Prova.FirstIndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_Item_Prova.FirstIndMouseMove(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Cad_Item_Prova.FirstIndMouseUp(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Text1.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TForm_Cad_Item_Prova.LeftIndMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_Item_Prova.LeftIndMouseMove(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Cad_Item_Prova.LeftIndMouseUp(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Text1.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Text1.Paragraph.FirstIndent;
  Text1SelectionChange(Sender);
end;

procedure TForm_Cad_Item_Prova.RightIndMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TForm_Cad_Item_Prova.RightIndMouseMove(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
     TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs
end;

procedure TForm_Cad_Item_Prova.RightIndMouseUp(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if RightInd.Left > RulerLine.Width then
    RightInd.Left := RulerLine.Width-16;

  FDragging := False;
  Text1.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  Text1SelectionChange(Sender);
end;


//------------------------------------------------------------------------------
// Tratamento od botao de leitura do numero de linhas do Item
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.SpeedButton_NLinhasClick(Sender: TObject);
begin
   Form_Sel_ItemProva.IBTable_Item_Desc.FieldByName( 'NLinhas').AsInteger:= Text1.Lines.count;
end;


//------------------------------------------------------------------------------
// Tratamento das teclas Basicas
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.TeclasBasicas( Sender: TObject; var Key: Char);
begin
   if key = #20 then
       Text1.SetFocus;
end;

//------------------------------------------------------------------------------
// Permite buscar o Item pelo Numero
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.VerificaSerie(Sender: TObject);
begin
   if ((Form_Sel_ItemProva.IBTable_Item_Prova.State = DSInsert)) then
      if ((DBEdit_CodMateria.Text <> '') and (DBEdit_Disc.Text <> '') and (DBEdit_Unid.Text <> '') and (DBEdit_SubUni.Text <> '') and (DBComboBox_objetivo.Text <> '')) then
         DBComboBox_Serie.Text:= Funcoes.VerificaSerie(Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdCurso').AsString,
                                                       Form_Sel_ItemProva.Query_MontaMateria.FieldByName('IdTurma').AsString,
                                                       DBEdit_CodMateria.Text,
                                                       DBEdit_Disc.Text,
                                                       DBEdit_Unid.Text,
                                                       DBEdit_SubUni.Text,
                                                       DBComboBox_objetivo.Text);
end;

procedure TForm_Cad_Item_Prova.DBEdit_DiscKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_Unid.SetFocus;
end;

procedure TForm_Cad_Item_Prova.DBEdit_UnidKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_SubUni.SetFocus;
end;

procedure TForm_Cad_Item_Prova.DBEdit_SubUniKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_SubUni.SetFocus;

end;

procedure TForm_Cad_Item_Prova.DBComboBox_objetivoKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_RespostaCorreta.SetFocus;
end;

procedure TForm_Cad_Item_Prova.DBComboBox_RespostaCorretaKeyPress( Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
end;

procedure TForm_Cad_Item_Prova.DBEdit_NLinhaKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBRichEdit_Observacao.SetFocus;

end;

procedure TForm_Cad_Item_Prova.DBRichEdit_ObservacaoKeyPress( Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      Text1.SetFocus;
end;

procedure TForm_Cad_Item_Prova.DBComboBox_SerieKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBEdit_TempoResposta.SetFocus;
end;

procedure TForm_Cad_Item_Prova.DBComboBox_PossuiImagemKeyPress( Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_Serie.SetFocus;
end;

procedure TForm_Cad_Item_Prova.DBEdit_TempoRespostaKeyPress( Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBComboBox_Recurso.SetFocus;

end;

procedure TForm_Cad_Item_Prova.DBComboBox_RecursoKeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
   if key = #13 then
      DBRichEdit_Observacao.SetFocus;
end;

procedure TForm_Cad_Item_Prova.Text1KeyPress(Sender: TObject; var Key: Char);
begin
   TeclasBasicas( Sender, Key);
end;

procedure TForm_Cad_Item_Prova.Text1KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = vk_F3 then
    Text1.FindNext;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para selecionar imagem
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton1Click(Sender: TObject);
var
  MyFormat : Word;
  AData: THandle;
  APalette:HPalette;
begin
   Application.CreateForm(TForm_SelFoto, Form_SelFoto);
   Form_SelFoto.ShowModal;
   if Funcoes.GetFoto <> '' then
   begin
      JvThumbImage1.LoadFromFile( Funcoes.GetFoto);
      JvThumbImage1.Picture.Graphic.SaveToClipboardFormat(MyFormat,AData,APalette);
      ClipBoard.SetAsHandle(MyFormat,AData);
      Text1.PasteFromClipboard;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para inserir Hora
//------------------------------------------------------------------------------

procedure TForm_Cad_Item_Prova.ToolButton_InserirHoraClick( Sender: TObject);
begin
  Text1.SelText := FormatDateTime('hh "Horas e " mm " Minutos"', Now);
end;

procedure TForm_Cad_Item_Prova.ToolButton_PadonizarClick(Sender: TObject);
begin
  Text1.SelectAll;

  Text1.SelAttributes.Size:= Tam_Font;
  FontDialog1.Font.Size:= Tam_Font;
  Text1.SelAttributes.Name:= 'Calibri';

  FDragging := False;
  Text1.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Text1.Paragraph.FirstIndent;
  Text1SelectionChange(Sender);
end;

end.
