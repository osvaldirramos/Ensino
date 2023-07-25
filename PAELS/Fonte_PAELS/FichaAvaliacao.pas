//------------------------------------------------------------------------------
//
// Prosima
//
// Responsavel: Osvaldir D Ramos
// Data       : 01/11/2012
// Modulo     : Modulo responsavel pelo cadastramento das respostas da Ficha de
//              Avaliacao
//
//------------------------------------------------------------------------------

unit FichaAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvShape, ComCtrls, ToolWin, Grids, DBGrids, JvRadioButton,
  JvComponent, JvxCtrls, Buttons, JvColorCombo, JvRichEd, JvDBRichEd, Rotinas,
  JvCheckBox, JvToolEdit, JvCombobox, ComObj,
  XPMan, Menus, JvArrowBtn, JvLookOut, JvGradient, JvCaptionPanel, JvDBCtrl,
  JvTransBtn;

type
  TForm_FichaAvaliacao = class(TForm)
    Panel_Principal: TPanel;
    Edit1: TEdit;
    IBTable_Aluno: TIBTable;
    IBTable_AlunoIDCURSO: TSmallintField;
    IBTable_AlunoIDTURMA: TIntegerField;
    IBTable_AlunoIDENTIDADE: TIBStringField;
    IBTable_AlunoNOMECOMPLETO: TIBStringField;
    IBTable_AlunoIDUNIDADE: TIBStringField;
    IBTable_AlunoIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoESTAGIARIO: TIBStringField;
    DST_AlunoTurma: TDataSource;
    Panel2: TPanel;
    CheckBox_Estagiario: TCheckBox;
    Panel_FichaDeAvaliacao: TPanel;
    Panel_Rodape: TPanel;
    Label_TotalDeItensAvaliados: TLabel;
    Label12: TLabel;
    Panel_NA: TPanel;
    Panel_NS: TPanel;
    Panel_Bom: TPanel;
    Panel_Reg: TPanel;
    Panel_Otimo: TPanel;
    Panel_TotalItensAvl: TPanel;
    JvCaptionPanel_AgendaPosCurso: TJvCaptionPanel;
    JvDBRichEdit_Parecer: TDBMemo;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    JvDBDateEdit_DataAvaliacao: TJvDBDateEdit;
    DBComboBox_Setor: TDBComboBox;
    DBEdit_Tempo: TDBEdit;
    JvShape1: TJvShape;
    JvTransparentButton_Finalizar: TJvTransparentButton;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    DBEdit_termino: TDBEdit;
    DBEdit_Inicio: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    ComboBox_Avaliador: TComboBox;
    DBEdit_Turma: TDBEdit;
    GroupBox3: TGroupBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    RichEdit_NS: TRichEdit;
    Memo_Regra: TMemo;
    DBGrid_Ficha: TDBGrid;
    Edit_Exercicio: TEdit;
    Label_Indicacao: TLabel;
    Label11: TLabel;
    JvGradient2: TJvGradient;

   procedure ValidaFicha;
    procedure AtualizarInstrutor;
    procedure AlteraFichaAvaliacao;
    Procedure Analizar;
    procedure Processar;
    procedure Mostrar_Medias;

    procedure FormActivate(Sender: TObject);

    procedure DBGrid_FichaCellClick(Column: TColumn);
    procedure DBGrid_FichaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEdit_Id_ExercicioEnter(Sender: TObject);
    procedure JvDBDateEdit_DataAvaliacaoEnter(Sender: TObject);
    procedure JvDBDateEdit_DataAvaliacaoExit(Sender: TObject);
    procedure DBEdit_Id_ExercicioExit(Sender: TObject);
    procedure CheckBox_EstagiarioClick(Sender: TObject);
    procedure ComboBox_AvaliadorEnter(Sender: TObject);
    procedure ComboBox_AvaliadorExit(Sender: TObject);
    procedure JvDBRichEdit_ParecerEnter(Sender: TObject);
    procedure JvDBRichEdit_ParecerExit(Sender: TObject);
    procedure IBTable_Rel_NSAfterDelete(DataSet: TDataSet);
    procedure IBTable_Rel_NSAfterEdit(DataSet: TDataSet);
    procedure IBTable_Rel_NSAfterInsert(DataSet: TDataSet);
    procedure JvTransparentButton_FinalizarClick(Sender: TObject);
    procedure Edit_ExercicioKeyPress(Sender: TObject; var Key: Char);
  private    { Private declarations }
      VI_TotalReg, VI_OTIMO, VI_BOM, VI_REGULAR, VI_NS, VI_NA: Integer;
      VB_FichaVazia: Boolean;
      VS_Letra, VS_Exercicio_old, VS_Id_Exercicio_old, VS_NS, VS_Msg, VS_Media: String;

      VB_AtualizaInstrutor: Boolean;
  public    { Public declarations }

  end;

var
  Form_FichaAvaliacao: TForm_FichaAvaliacao;

implementation

uses Module, Sel_Avaliacao, Sel_Fichas, Frame_Sel_Curso;

const
ScreenWidth: LongInt = 1280; {I designed my form in 800x600 mode.}
ScreenHeight: LongInt = 1024;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.FormActivate(Sender: TObject);
var
   bm_Instrutor : TBookmark;
begin
   DM.IBQuery_PR_Avaliacao.Open;
   DM.IBTable_PR_Avaliacao.Open;
   IBTable_Aluno.Open;

   VB_AtualizaInstrutor:= False;
   Memo_Regra.Visible:= False;

   if ((DM.IBTable_Cad_FichaAvl.State <> DSInsert) and (DM.IBTable_Cad_FichaAvl.State <> DSEdit )) then
      DM.IBTable_Cad_FichaAvl.Edit;


   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      VS_Letra:= 'A';
      JvDBRichEdit_Parecer.Visible:= True;
      if Form_Sel_Fichas.VS_opcao = 'Inserir' then
         Form_FichaAvaliacao.Caption:= 'PAELS --> Inserindo uma Nova Ficha de Avaliação - Versão: '+Versao+' / '+Ultima_Atualizacao
      else
         Form_FichaAvaliacao.Caption:= 'PAELS --> Alterando a Ficha de Avaliação selecionada - Versão: '+Versao+' / '+Ultima_Atualizacao;


      Funcoes.TrataSetor(Frame_SelCurso.ComboBox_Turma.Text, DBComboBox_Setor);

       //---
      //--- Tratamento para carregar o Nome dos Instrutores no ComboBox

      bm_Instrutor:= DM.IBQuery_InstrutorTurma.GetBookMark;
      DM.IBQuery_InstrutorTurma.Open;
      ComboBox_Avaliador.Items.Clear;
      ComboBox_Avaliador.Text:=  DM.IBQuery_CadFichaAvl.FieldByName('NomeInstrutor').AsString;
      DM.IBQuery_InstrutorTurma.First;
      While not DM.IBQuery_InstrutorTurma.Eof do
      begin
         ComboBox_Avaliador.Items.Add( DM.IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString);
         DM.IBQuery_InstrutorTurma.Next;
      end;
      DM.IBQuery_InstrutorTurma.GotoBookmark(bm_Instrutor);
      DM.IBQuery_InstrutorTurma.FreeBookMark(bm_Instrutor);

       //---
      //--- Tratamento para demonstrar que o Aluno eh Estagiario

      if IBTable_Aluno.FieldByName('Estagiario').AsString = 'S' then
         CheckBox_Estagiario.State:= cbChecked
      else
         CheckBox_Estagiario.State:= cbUnchecked;

      RichEdit_NS.Visible:= False;
      JvCaptionPanel_AgendaPosCurso.Height:= 148;

      Form_FichaAvaliacao.Width:= 1382;

      Edit_Exercicio.Text:= DM.IBTable_Cad_FichaAvl.FieldByName('Exercicio').AsString;
      VS_Exercicio_old:= DM.IBTable_Cad_FichaAvl.FieldByName('Exercicio').AsString;
      VS_Id_Exercicio_old:= DM.IBTable_Cad_FichaAvl.FieldByName('Id_Exercicio').AsString;
      VS_Msg:= '' ;
      VS_Media:= '0';

      if  Form_Sel_Fichas.VS_opcao = 'Alterar' then
      begin

         Funcoes.OpenQueryProsima(DM.IBQuery_OpenProsima, 'Select Descricao From Rel_NS Where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                                          ' IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                                          ' ID_FICHA = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                                          ' ID_ATCO = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                                          ' ID_INSTRUTOR = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('ID_INSTRUTOR').AsString+#39+' and '+
                                                          ' ID_Exercicio = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString+' and '+
                                                          ' Setor = '+#39+copy(DM.IBTable_Cad_FichaAvl.FieldByName('Setor').AsString,1,10)+#39
                                 );

         if Trim(DM.IBQuery_OpenProsima.FieldByName('Descricao').AsString) <> '' then
         begin
            RichEdit_NS.Visible:= True;
            DM.IBQuery_OpenProsima.First;
            While not DM.IBQuery_OpenProsima.Eof do
            begin
               RichEdit_NS.Lines.Add('=> '+DM.IBQuery_OpenProsima.FieldByName('Descricao').AsString);
               DM.IBQuery_OpenProsima.Next;
            end;

            Funcoes.ExecSqlProsima('Delete From Rel_NS Where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                   ' IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                   ' ID_ATCO = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                   ' ID_FICHA = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                   ' ID_INSTRUTOR = '+#39+DM.IBTable_Cad_FichaAvl.FieldByName('ID_INSTRUTOR').AsString+#39+' and '+
                                   ' ID_Exercicio = '+DM.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString+' and '+
                                   ' Setor = '+#39+copy(DM.IBTable_Cad_FichaAvl.FieldByName('Setor').AsString,1,10)+#39
                                  );
         end;
      end;

      Processar;
      Mostrar_Medias;
      DBEdit5.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da grid que mostra as fichas de avaliacao
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.DBGrid_FichaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Check: Integer;
   R: TRect;
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      // Tratamento do zebrado

      if not odd(DM.IBQuery_PR_Avaliacao.RecNo) then
      begin
         DBGrid_Ficha.Canvas.Font.Color:= clBlack;
         DBGrid_Ficha.Canvas.Brush.Color:= $00EAFFEA;
      end
      else
      begin
         DBGrid_Ficha.Canvas.Font.Color:= clBlack;
         DBGrid_Ficha.Canvas.Brush.Color:= clWhite;
      end;
      DBGrid_Ficha.Canvas.FillRect(Rect);
      DBGrid_Ficha.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);


      //Desenha um checkbox no dbgrid
      if Column.FieldName = 'OTIMO' then
      begin
         DBGrid_Ficha.Canvas.FillRect(Rect);
         Check := 0;
         if DM.IBQuery_PR_Avaliacao.FieldByName('OTIMO').AsString = '1' then
            Check := DFCS_CHECKED;
         R:=Rect;
         InflateRect(R,1,1); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid_Ficha.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'BOM' then
      begin
         DBGrid_Ficha.Canvas.FillRect(Rect);
         Check := 0;
         if DM.IBQuery_PR_Avaliacao.FieldByName('BOM').AsString = '1' then
            Check := DFCS_CHECKED;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid_Ficha.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'REGULAR' then
      begin
         DBGrid_Ficha.Canvas.FillRect(Rect);
         Check := 0;
         if DM.IBQuery_PR_Avaliacao.FieldByName('REGULAR').AsString = '1' then
            Check := DFCS_CHECKED;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid_Ficha.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'NS' then
      begin
         DBGrid_Ficha.Canvas.FillRect(Rect);
         Check := 0;
         if DM.IBQuery_PR_Avaliacao.FieldByName('NS').AsString = '1' then
            Check := DFCS_CHECKED;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid_Ficha.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'NA' then
      begin
         DBGrid_Ficha.Canvas.FillRect(Rect);
         if DM.IBQuery_PR_Avaliacao.FieldByName('NA').AsString = '1' then
            Check := DFCS_CHECKED
         else
           Check := 0;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid_Ficha.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.DBGrid_FichaCellClick(Column: TColumn);
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      if ((Column.FieldName = 'ID_ITEM') or (Column.FieldName = 'AREA_AVALIACAO') or (Column.FieldName = 'DESCRICAO')) then
      begin
        //
      end
      else
      begin
         if DM.IBQuery_PR_Avaliacao.FieldByName('OTIMO').AsString = '1' then
            VI_OTIMO:= VI_OTIMO-1;

         if DM.IBQuery_PR_Avaliacao.FieldByName('BOM').AsString = '1' then
            VI_BOM:= VI_BOM-1;

         if DM.IBQuery_PR_Avaliacao.FieldByName('REGULAR').AsString = '1' then
            VI_REGULAR:= VI_REGULAR-1;

         if DM.IBQuery_PR_Avaliacao.FieldByName('NS').AsString = '1' then
            VI_NS:= VI_NS-1;

         if DM.IBQuery_PR_Avaliacao.FieldByName('NA').AsString = '1' then
            VI_NA:= VI_NA-1;

         DM.IBTable_PR_Avaliacao.Edit;
         DM.IBTable_PR_Avaliacao.FieldByName('OTIMO').AsString:= '0';
         DM.IBTable_PR_Avaliacao.FieldByName('BOM').AsString:= '0';
         DM.IBTable_PR_Avaliacao.FieldByName('REGULAR').AsString:= '0';
         DM.IBTable_PR_Avaliacao.FieldByName('NS').AsString:= '0';
         DM.IBTable_PR_Avaliacao.FieldByName('NA').AsString:= '0';

         if Column.FieldName = 'OTIMO' then
         begin
            DM.IBTable_PR_Avaliacao.FieldByName('OTIMO').AsString:= '1';
            VI_OTIMO:= VI_OTIMO+1;
         end;

         if Column.FieldName = 'BOM' then
         begin
            DM.IBTable_PR_Avaliacao.FieldByName('BOM').AsString:= '1';
            VI_BOM:= VI_BOM+1;
         end;

         if Column.FieldName = 'REGULAR' then
         begin
            DM.IBTable_PR_Avaliacao.FieldByName('REGULAR').AsString:= '1';
            VI_REGULAR:= VI_REGULAR+1;
         end;

         if Column.FieldName = 'NS' then
         begin
            RichEdit_NS.Visible:= True;
            RichEdit_NS.Lines.Add('=> '+DM.IBTable_PR_Avaliacao.FieldByName('ID_ITEM').AsString+
                                  ' - '+DM.IBTable_PR_Avaliacao.FieldByName('Descricao').AsString);

            DM.IBTable_PR_Avaliacao.FieldByName('NS').AsString:= '1';
            VI_NS:= VI_NS+1;
            JvDBRichEdit_Parecer.Lines.Text:= JvDBRichEdit_Parecer.Lines.Text+
                                              '=> '+DM.IBTable_PR_Avaliacao.FieldByName('ID_ITEM').AsString+
                                              '- '+DM.IBTable_PR_Avaliacao.FieldByName('Descricao').AsString+#13;
         end;

         if Column.FieldName = 'NA' then
         begin
            DM.IBTable_PR_Avaliacao.FieldByName('NA').AsString:= '1';
            VI_NA:= VI_NA+1;
         end;

         DM.IBTable_PR_Avaliacao.Post;
         Funcoes.ExecutaTransacao_Prosima;

         Funcoes.AtualizaQuery(DM.IBQuery_PR_Avaliacao);
         Mostrar_Medias;
         if Column.FieldName <> 'NA' then
         begin
            DBGrid_Ficha.SelectedIndex := 0; // Primeiro indique qual coluna do grid voce quer se posicionar.
            DBGrid_Ficha.SetFocus; // depois de um setfocus que o foco ira direto para a coluna posicionada.
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.Processar;
var
   bm_Avl : TBookmark;
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      VI_OTIMO:= 0;
      VI_BOM:= 0;
      VI_REGULAR:= 0;
      VI_NS:= 0;
      VI_NA:= 0;
      VI_TotalReg:= 0;

      bm_Avl:= DM.IBQuery_PR_Avaliacao.GetBookMark;
      DM.IBQuery_PR_Avaliacao.First;
      While not DM.IBQuery_PR_Avaliacao.Eof do
      begin
         if DM.IBTable_PR_Avaliacao.FieldByName('OTIMO').AsString = '1' then
         begin
            VI_OTIMO:= VI_OTIMO+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if DM.IBTable_PR_Avaliacao.FieldByName('BOM').AsString = '1' then
         begin
            VI_BOM:= VI_BOM+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if DM.IBTable_PR_Avaliacao.FieldByName('REGULAR').AsString = '1' then
         begin
            VI_REGULAR:= VI_REGULAR+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if DM.IBTable_PR_Avaliacao.FieldByName('NS').AsString = '1' then
         begin
            VI_NS:= VI_NS+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if DM.IBTable_PR_Avaliacao.FieldByName('NA').AsString = '1' then
            VI_NA:= VI_NA+1;

         DM.IBQuery_PR_Avaliacao.Next;
      end;
      DM.IBQuery_PR_Avaliacao.GotoBookmark(bm_Avl);
      DM.IBQuery_PR_Avaliacao.FreeBookMark(bm_Avl);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Tratar as Medias
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.Mostrar_Medias;
var
  VR_Media: Real;
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      Panel_Otimo.Caption:= IntToStr(VI_OTIMO);
      Panel_Bom.Caption:= IntToStr(VI_BOM);
      Panel_Reg.Caption:= IntToStr(VI_REGULAR);
      Panel_NS.Caption:= IntToStr(VI_NS);
      Panel_NA.Caption:= IntToStr(VI_NA);
      Panel_TotalItensAvl.Caption:= IntToStr(VI_OTIMO+VI_BOM+VI_REGULAR+VI_NS+VI_NA);

      VR_Media:= (VI_OTIMO*4)+(VI_BOM*2)+(VI_REGULAR);
      if VI_TotalReg > 0 then
         VR_Media:= VR_Media/VI_TotalReg;

      VS_Media:= FormatFloat('#0.00', VR_Media);
   end;
end;


//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

Procedure TForm_FichaAvaliacao.Analizar;
var
   bm_Avl : TBookmark;
   VI_Cont: Integer;
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      VS_Letra:= copy(DM.IBTable_PR_Avaliacao.FieldByName('Descricao').AsString,1,1);
      VB_FichaVazia:= False;
      VS_NS:= '';

      VI_Cont:= 0;
      VS_Msg:= '' ;
      bm_Avl:= DM.IBQuery_PR_Avaliacao.GetBookMark;
      DM.IBQuery_PR_Avaliacao.First;
      While not DM.IBQuery_PR_Avaliacao.Eof do
      begin
         if (( DM.IBTable_PR_Avaliacao.FieldByName('OTIMO').AsString = '0' ) and
             ( DM.IBTable_PR_Avaliacao.FieldByName('BOM').AsString = '0' ) and
             ( DM.IBTable_PR_Avaliacao.FieldByName('REGULAR').AsString = '0' ) and
             ( DM.IBTable_PR_Avaliacao.FieldByName('NS').AsString = '0' ) and
             ( DM.IBTable_PR_Avaliacao.FieldByName('NA').AsString = '0' ))then
         begin
            VI_Cont:= VI_Cont+1;
            if VI_Cont > 20 then
            begin
               VS_Msg:= '';
               Break;
            end;

            VS_Msg:= VS_Msg+DM.IBTable_PR_Avaliacao.FieldByName('Id_Item').AsString+'- '+DM.IBTable_PR_Avaliacao.FieldByName('Descricao').AsString+#13 ;
            VB_FichaVazia:= True;
         end
         else
         begin
            if DM.IBTable_PR_Avaliacao.FieldByName('NS').AsString = '1' then
            begin
               VS_NS:= VS_NS+'=> '+DM.IBTable_PR_Avaliacao.FieldByName('Id_Item').AsString+'- '+
                                 DM.IBTable_PR_Avaliacao.FieldByName('Descricao').AsString+#13;
            end;
         end;
         DM.IBQuery_PR_Avaliacao.Next;
      end;
      DM.IBQuery_PR_Avaliacao.GotoBookmark(bm_Avl);
      DM.IBQuery_PR_Avaliacao.FreeBookMark(bm_Avl);

      if VS_NS <> '' then
      begin
         DM.IBTable_Rel_NS.Open;
         if DM.IBTable_Rel_NS.FieldByName('IDCURSO').AsString = '' then
            DM.IBTable_Rel_NS.Append
         else
            DM.IBTable_Rel_NS.Edit;

         DM.IBTable_Rel_NS.FieldByName('IDCURSO').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
         DM.IBTable_Rel_NS.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
         DM.IBTable_Rel_NS.FieldByName('ID_ATCO').AsString:= DM.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString;
         DM.IBTable_Rel_NS.FieldByName('ID_FICHA').AsString:= DM.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString;
         DM.IBTable_Rel_NS.FieldByName('ID_INSTRUTOR').AsString:= DM.IBTable_Cad_FichaAvl.FieldByName('ID_INSTRUTOR').AsString;
         DM.IBTable_Rel_NS.FieldByName('ID_EXERCICIO').AsString:= DM.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString;
         DM.IBTable_Rel_NS.FieldByName('SETOR').AsString:= DM.IBTable_Cad_FichaAvl.FieldByName('SETOR').AsString;
         DM.IBTable_Rel_NS.FieldByName('DESCRICAO').AsString:= VS_NS;
         DM.IBTable_Rel_NS.Post;
         Funcoes.ExecutaTransacao_Prosima;
         DM.IBTable_Rel_NS.Close;
      end;

      Mostrar_Medias;
   end;
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao de Finalizacao do Cadastro da Ficha
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.JvTransparentButton_FinalizarClick(Sender: TObject);
var
   VS_EncerrarFicha: String;
   VI_Retorno: Integer;
begin
   VS_EncerrarFicha:= 'Sim';
   ValidaFicha;
   Analizar;

   if VB_FichaVazia = True then
   begin
      if ((DM.IBTable_Cad_FichaAvl.State <> DSInsert) and (DM.IBTable_Cad_FichaAvl.State <> DSEdit )) then
          DM.IBTable_Cad_FichaAvl.Edit;

      VS_Msg:= VS_Msg+#13+'Faltando responder questionário, deseja realmente encerrar a inserção da Ficha ?';
      VI_Retorno:= Application.MessageBox(PChar(VS_Msg) , 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
         //
      else
         VS_EncerrarFicha:= 'Não';
   end;

   try
      if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
      begin
         if ((DM.IBTable_Cad_FichaAvl.State = DSInsert) or (DM.IBTable_Cad_FichaAvl.State = DSEdit )) then
         begin
            DM.IBTable_Cad_FichaAvl.FieldByName('ID_Exercicio').AsString:= Funcoes.TratarExercicio(Edit_Exercicio.Text);
            DM.IBTable_Cad_FichaAvl.FieldByName('Exercicio').AsString:= Edit_Exercicio.Text;
         end;


         if VB_AtualizaInstrutor = True then
              AtualizarInstrutor;

         Processar;

         if ((DM.IBTable_Cad_FichaAvl.State <> DSInsert) and (DM.IBTable_Cad_FichaAvl.State <> DSEdit )) then
             DM.IBTable_Cad_FichaAvl.Edit;


         if VB_FichaVazia = True then
            DM.IBTable_Cad_FichaAvl.FieldByName('FICHACOMPLETA').AsString:= 'N'
         else
            DM.IBTable_Cad_FichaAvl.FieldByName('FICHACOMPLETA').AsString:= 'S';
      end;

      if VS_EncerrarFicha = 'Sim' then
      begin
         if VS_NS <> '' then
            DM.IBTable_Cad_FichaAvl.FieldByName('NS').AsString:= 'S'
         else
            DM.IBTable_Cad_FichaAvl.FieldByName('NS').AsString:= 'N';

         DM.IBTable_Cad_FichaAvl.FieldByName('Media').AsString:= VS_Media;
         DM.IBTable_Cad_FichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
      end;
   try
      if VS_EncerrarFicha = 'Sim' then
      begin
         if ((DM.IBTable_Cad_FichaAvl.State = DSInsert) and (DM.IBTable_Cad_FichaAvl.State = DSEdit )) then
         begin
            DM.IBTable_Cad_FichaAvl.Post;
            Funcoes.ExecutaTransacao_Prosima;
         end;
      end;
   except
         DM.IBTable_Cad_FichaAvl.Post;
         if VS_EncerrarFicha = 'Sim' then
         begin
            Funcoes.ExecutaTransacao_Prosima;
            Form_Sel_Fichas.VS_opcao:= 'Consulta';

            Funcoes.AtualizaQuery(DM.IBQuery_CadFichaAvl);
            Close;
         end;
   end;
         if VS_EncerrarFicha = 'Sim' then
         begin
            Funcoes.ExecutaTransacao_Prosima;
            Form_Sel_Fichas.VS_opcao:= 'Consulta';

            Funcoes.AtualizaQuery(DM.IBQuery_CadFichaAvl);

            DM.IBTable_PR_Avaliacao.Close;
            DM.IBQuery_PR_Avaliacao.Close;
            IBTable_Aluno.Close;
            Close;
         end;
   except
      on EConvertError do
      begin
         ShowMessage ('       Erro no Preenchimnto da Ficha!       ');
         Close;
      end;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Comentario
//
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.JvDBRichEdit_ParecerEnter(Sender: TObject);
begin
   if Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      JvCaptionPanel_AgendaPosCurso.Height:= 545;
      if ((DM.IBTable_Cad_FichaAvl.State <> DSInsert) and (DM.IBTable_Cad_FichaAvl.State <> DSEdit )) then
         DM.IBTable_Cad_FichaAvl.Edit;
   end;
end;

procedure TForm_FichaAvaliacao.JvDBRichEdit_ParecerExit(Sender: TObject);
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      JvCaptionPanel_AgendaPosCurso.Height:= 148;
      if ((DM.IBTable_Cad_FichaAvl.State = DSInsert) or (DM.IBTable_Cad_FichaAvl.State = DSEdit )) then
      begin
         DM.IBTable_Cad_FichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
         DM.IBTable_Cad_FichaAvl.Edit;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento que permite altera a Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.AlteraFichaAvaliacao;
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      if ((DM.IBTable_Cad_FichaAvl.State <> DSInsert) and (DM.IBTable_Cad_FichaAvl.State <> DSEdit )) then
         DM.IBTable_Cad_FichaAvl.Edit;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento quando ativa o DBEdit_IdExercicio
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.DBEdit_Id_ExercicioEnter(Sender: TObject);
begin
   if  ((copy(DM.IBQuery_MontaTurma.FieldByName('TURMA').AsString,5,3) = 'TWR')) then
       Memo_Regra.Visible:= True;

   AlteraFichaAvaliacao;
end;

procedure TForm_FichaAvaliacao.JvDBDateEdit_DataAvaliacaoEnter( Sender: TObject);
begin
   AlteraFichaAvaliacao;
end;


procedure TForm_FichaAvaliacao.JvDBDateEdit_DataAvaliacaoExit(Sender: TObject);
begin
   if  Form_Sel_Fichas.VS_opcao <> 'Consulta' then
   begin
      if ((DM.IBTable_Cad_FichaAvl.State = DSInsert) or (DM.IBTable_Cad_FichaAvl.State = DSEdit )) then
      begin
         DM.IBTable_Cad_FichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
      end;
  end;
end;

procedure TForm_FichaAvaliacao.DBEdit_Id_ExercicioExit(Sender: TObject);
begin
   Memo_Regra.Visible:= False;
end;

//------------------------------------------------------------------------------
//--- Tratamento para  verificar se o aluno e estagiario
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.CheckBox_EstagiarioClick(Sender: TObject);
begin
   IBTable_Aluno.Edit;

   if CheckBox_Estagiario.State = cbChecked then
      IBTable_Aluno.FieldByName('Estagiario').AsString:= 'S'
   else
      IBTable_Aluno.FieldByName('Estagiario').AsString:= 'N';
   IBTable_Aluno.Post;
   Funcoes.ExecutaTransacao_Prosima;
end;

//------------------------------------------------------------------------------
//--- Tratamento para Alterar o Nome do Instrutor
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.ComboBox_AvaliadorEnter(Sender: TObject);
begin
    AlteraFichaAvaliacao;
   VB_AtualizaInstrutor:= True;
end;

procedure TForm_FichaAvaliacao.ComboBox_AvaliadorExit(Sender: TObject);
begin
   AtualizarInstrutor;
end;

procedure TForm_FichaAvaliacao.AtualizarInstrutor;
begin
   Funcoes.OpenQueryEnsino(DM.IBQuery_ExecutaEnsino, 'Select IdCurso, IdTurma, NomeCompleto, Identidade '+
                                                     ' From Instrutor_Turma_View '+
                                                     ' Where IDCURSO = '+DM.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString+' and '+
                                                     ' IDTURMA = '+DM.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString+' and '+
                                                     ' NomeCompleto = '+#39+ComboBox_Avaliador.Text+#39
                          );

   DM.IBTable_Cad_FichaAvl.FieldByName('NomeInstrutor').AsString:= DM.IBQuery_ExecutaEnsino.FieldByName('NomeCompleto').AsString;
   DM.IBTable_Cad_FichaAvl.FieldByName('Id_Instrutor').AsString:= DM.IBQuery_ExecutaEnsino.FieldByName('Identidade').AsString;
   DM.IBTable_Cad_FichaAvl.Post;
   Funcoes.ExecutaTransacao_Prosima;
   VB_AtualizaInstrutor:= False;
end;

procedure TForm_FichaAvaliacao.IBTable_Rel_NSAfterDelete(DataSet: TDataSet);
begin
   DM.IBTransaction_Paels.CommitRetaining;
end;

procedure TForm_FichaAvaliacao.IBTable_Rel_NSAfterEdit(DataSet: TDataSet);
begin
   DM.IBTransaction_Paels.CommitRetaining;
end;

procedure TForm_FichaAvaliacao.IBTable_Rel_NSAfterInsert(DataSet: TDataSet);
begin
   DM.IBTransaction_Paels.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Tratamento para verificar erro na gravacao da ficha
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.ValidaFicha;
begin
   if ComboBox_Avaliador.Text = '' then
   begin
      ShowMessage('Não possuí Instrutor Cadastrado...');
      ComboBox_Avaliador.SetFocus;
   end
   else
   begin
      if Edit_Exercicio.Text = '' then
      begin
         ShowMessage('O número do Execicico não pode ser branco...');
         Edit_Exercicio.SetFocus;
      end
      else
      begin
         if Trim(Funcoes.DePara(JvDBDateEdit_DataAvaliacao.Text,'/', '')) = '' then
         begin
            ShowMessage('A Data da Avaliação não pode ser branca...');
            JvDBDateEdit_DataAvaliacao.SetFocus;
         end
         else
         begin
            if DBComboBox_Setor.Text = '' then
            begin
               ShowMessage('O Setor da Avaliação não pode ser branco...');
               DBComboBox_Setor.SetFocus;
            end
            else
            begin
               if DBEdit_Tempo.Text = '  :  ' then
               begin
                  ShowMessage('O Tempo da Avaliação não pode ser branco...');
                  DBEdit_Tempo.SetFocus;
               end;
            end;
         end;
      end;
   end;
end;

procedure TForm_FichaAvaliacao.Edit_ExercicioKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['0'..'9', '-', chr(8)]) then
       key:= #0;
end;

end.
