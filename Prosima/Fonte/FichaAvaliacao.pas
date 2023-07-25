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
  XPMan, Menus, JvArrowBtn, JvLookOut, JvGradient, JvCaptionPanel, JvDBCtrl;

type
  TForm_FichaAvaliacao = class(TForm)
    DSQ_Sel_Avaliacao: TDataSource;
    Panel1: TPanel;
    DBEdit_termino: TDBEdit;
    DBEdit_Inicio: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox_Avaliacao: TGroupBox;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    Panel_Media: TPanel;
    IBTable_Rel_NS: TIBTable;
    Edit_Prosima: TEdit;
    IBTable_Rel_NSIDCURSO: TSmallintField;
    IBTable_Rel_NSIDTURMA: TIntegerField;
    IBTable_Rel_NSID_FICHA: TIntegerField;
    IBTable_Rel_NSID_ATCO: TIBStringField;
    IBTable_Rel_NSID_AVL: TIBStringField;
    IBTable_Rel_NSID_EXERCICIO: TIntegerField;
    IBTable_Rel_NSDESCRICAO: TIBStringField;
    JvCaptionPanel_AgendaPosCurso: TJvCaptionPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel_Rodape: TPanel;
    Label_TotalDeItensAvaliados: TLabel;
    Label12: TLabel;
    Panel_NA: TPanel;
    Panel_NS: TPanel;
    Panel_Bom: TPanel;
    Panel_Reg: TPanel;
    Panel_Otimo: TPanel;
    Panel3: TPanel;
    DBEdit_Id_Exercicio: TDBEdit;
    JvDBDateEdit_DataAvaliacao: TJvDBDateEdit;
    DBEdit_Local: TDBEdit;
    CheckBox_Estagiario: TCheckBox;
    Panel_TotalItensAvl: TPanel;
    Label15: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    ScrollBox1: TScrollBox;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    RichEdit_NS: TRichEdit;
    Memo_Regra: TMemo;
    Panel5: TPanel;
    JvGradient1: TJvGradient;
    Memo2: TMemo;
    ComboBox_Avaliador: TComboBox;
    JvDBRichEdit_Parecer: TDBMemo;
    Edit1: TEdit;
    DST_Cad_Ficha_Avl: TDataSource;
    JvGradient6: TJvGradient;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    SpeedButton_Finalizar: TSpeedButton;
    SpeedButton_AjudaNExercicio: TSpeedButton;
    Label10: TLabel;
    IBTable_Aluno: TIBTable;
    IBTable_AlunoIDCURSO: TSmallintField;
    IBTable_AlunoIDTURMA: TIntegerField;
    IBTable_AlunoIDENTIDADE: TIBStringField;
    IBTable_AlunoNOMECOMPLETO: TIBStringField;
    IBTable_AlunoIDUNIDADE: TIBStringField;
    IBTable_AlunoIDSUBUNIDADE: TIBStringField;
    IBTable_AlunoESTAGIARIO: TIBStringField;
    DST_AlunoTurma: TDataSource;

    procedure AtualizarInstrutor;
    procedure Grava_IdExercicio;
    procedure AlteraFichaAvaliacao;
    Procedure Analizar;
    procedure Processar;
    procedure Mostrar_Medias;

    procedure FormActivate(Sender: TObject);

    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton_FinalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit_Id_ExercicioEnter(Sender: TObject);
    procedure JvDBDateEdit_DataAvaliacaoEnter(Sender: TObject);
    procedure JvDBDateEdit_DataAvaliacaoExit(Sender: TObject);
    procedure DBEdit_Id_ExercicioExit(Sender: TObject);
    procedure DBEdit_Id_ExercicioKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox_EstagiarioClick(Sender: TObject);
    procedure ComboBox_AvaliadorEnter(Sender: TObject);
    procedure ComboBox_AvaliadorExit(Sender: TObject);
    procedure JvDBRichEdit_ParecerEnter(Sender: TObject);
    procedure JvDBRichEdit_ParecerExit(Sender: TObject);
    procedure SpeedButton_AjudaNExercicioClick(Sender: TObject);
    procedure IBTable_Rel_NSAfterDelete(DataSet: TDataSet);
    procedure IBTable_Rel_NSAfterEdit(DataSet: TDataSet);
    procedure IBTable_Rel_NSAfterInsert(DataSet: TDataSet);
  private    { Private declarations }
      VI_TotalReg, VI_OTIMO, VI_BOM, VI_REGULAR, VI_NS, VI_NA: Integer;
      VB_FichaVazia: Boolean;
      VS_Letra, VS_Id_Exercicio_old, VS_NS, VS_Msg: String;

      VB_AtualizaInstrutor: Boolean;
  public    { Public declarations }

  end;

var
  Form_FichaAvaliacao: TForm_FichaAvaliacao;

implementation

uses Module, Sel_MontaProsima;

const
ScreenWidth: LongInt = 1280; {I designed my form in 800x600 mode.}
ScreenHeight: LongInt = 1024;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
IBTable_Aluno.Open;
   VB_AtualizaInstrutor:= False;
   Memo_Regra.Visible:= False;

   if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State <> DSInsert) and (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State <> DSEdit )) then
      Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Edit;

   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      VS_Letra:= 'A';
      if Form_Sel_Avaliacao.VS_opcao = 'Inserir' then
      begin
         Form_FichaAvaliacao.Caption:= 'Inserindo uma Nova Ficha de Avaliação - Versão: '+Versao+' / '+Ultima_Atualizacao;
         GroupBox_Avaliacao.Enabled:= False;
         JvDBRichEdit_Parecer.Visible:= True;
      end
      else
      begin
         Form_FichaAvaliacao.Caption:= 'Alterando a Ficha de Avaliação selecionada - Versão: '+Versao+' / '+Ultima_Atualizacao;
         GroupBox_Avaliacao.Enabled:= True;

         if JvDBDateEdit_DataAvaliacao.Date >= StrToDate('27/09/2013') then
           JvDBRichEdit_Parecer.Visible:= True
         else
           JvDBRichEdit_Parecer.Visible:= False;
      end;

//      IBTable_CadParecer.Open;

      //---
      //--- Tratamento para carregar o Nome dos Instrutores no ComboBox

      ComboBox_Avaliador.Items.Clear;
      ComboBox_Avaliador.Text:=  Form_Sel_Avaliacao.IBTable_instrutor.FieldByName('NomeCompleto').AsString;
      Form_Sel_Avaliacao.IBQuery_InstrutorTurma.First;
      While not Form_Sel_Avaliacao.IBQuery_InstrutorTurma.Eof do
      begin
         ComboBox_Avaliador.Items.Add( Form_Sel_Avaliacao.IBQuery_InstrutorTurma.FieldByName('NomeCompleto').AsString);
         Form_Sel_Avaliacao.IBQuery_InstrutorTurma.Next;
      end;

       //---
      //--- Tratamento para demonstrar que o Aluno eh Estagiario

      if Form_Sel_Avaliacao.IBTable_Aluno.FieldByName('Estagiario').AsString = 'S' then
         CheckBox_Estagiario.State:= cbChecked
      else
         CheckBox_Estagiario.State:= cbUnchecked;

      RichEdit_NS.Visible:= False;
      JvCaptionPanel_AgendaPosCurso.Height:= 148;

//      RichEdit_NS.Lines.Clear;
//   Funcoes.AtualizaQuery(Form_Sel_Avaliacao.IBQuery_FichaAvaliacao);
      Form_FichaAvaliacao.Width:= 1382;
      Edit_Prosima.Text:= Form_Sel_Avaliacao.ComboBox_Turma.Text;
      if (( copy(Edit_Prosima.Text,5,4) = 'TWR3') or ( copy(Edit_Prosima.Text,5,4) = 'TWRS')) then
          SpeedButton_AjudaNExercicio.Visible:= True
      else
          SpeedButton_AjudaNExercicio.Visible:= False;

      VS_Msg:= '' ;
      Panel_Media.Caption:= '0';

      if  Form_Sel_Avaliacao.VS_opcao = 'Alterar' then
      begin

         VS_Comando:= 'Select Descricao From Rel_NS Where IDCURSO = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                                               ' IDTURMA = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                                               ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                                               ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                                               ' ID_AVL = '+#39+Funcoes.InserirPos(Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_AVL').AsString, 20)+#39+' and '+
                                               ' ID_Exercicio = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString;
         Funcoes.OpenQueryExecutaProsima(VS_Comando);

         if Trim(DM.IBQuery_Prosima_Ensino.FieldByName('Descricao').AsString) <> '' then
         begin
            RichEdit_NS.Visible:= True;
            DM.IBQuery_Prosima_Ensino.First;
            While not DM.IBQuery_Prosima_Ensino.Eof do
            begin
               RichEdit_NS.Lines.Add('=> '+DM.IBQuery_Prosima_Ensino.FieldByName('Descricao').AsString);
               DM.IBQuery_Prosima_Ensino.Next;
            end;

            VS_Comando:= 'Delete From Rel_NS Where IDCURSO = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                         ' IDTURMA = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                         ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                         ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                         ' ID_AVL = '+#39+Funcoes.InserirPos(Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_AVL').AsString, 20)+#39+' and '+
                         ' ID_Exercicio = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString;
            Funcoes.ExecSqlProsima(VS_Comando);
         end;
      end;

      // Tratamento para inserir Parecer

{      if IBTable_CadParecer.FieldByName('IDCURSO').AsString = '' then
      begin
         IBTable_CadParecer.Append;

         IBTable_CadParecer.FieldByName('IDCURSO').AsString:= Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
         IBTable_CadParecer.FieldByName('IDTURMA').AsString:= Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
         IBTable_CadParecer.FieldByName('ID_ATCO').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString;
         IBTable_CadParecer.FieldByName('ID_FICHA').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString;
         IBTable_CadParecer.FieldByName('ID_AVL').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_AVL').AsString;
         IBTable_CadParecer.FieldByName('ID_EXERCICIO').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString;
         IBTable_CadParecer.FieldByName('Parecer').AsString:= '';
         IBTable_CadParecer.Post;
         Funcoes.ExecutaTransacao_Prosima;
      end;
}
      Processar;
      Mostrar_Medias;
      Memo2.SetFocus;
   end;
end;

procedure TForm_FichaAvaliacao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Check: Integer;
   R: TRect;
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      // Tratamento do zebrado

      if not odd(Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.RecNo) then
      begin
         DBGrid1.Canvas.Font.Color:= clBlack;
         DBGrid1.Canvas.Brush.Color:= $00EAFFEA;
      end
      else
      begin
         DBGrid1.Canvas.Font.Color:= clBlack;
         DBGrid1.Canvas.Brush.Color:= clWhite;
      end;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);


      //Desenha um checkbox no dbgrid
      if Column.FieldName = 'OTIMO' then
      begin
         DBGrid1.Canvas.FillRect(Rect);
         Check := 0;
         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('OTIMO').AsString = '1' then
            Check := DFCS_CHECKED;
         R:=Rect;
         InflateRect(R,1,1); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'BOM' then
      begin
         DBGrid1.Canvas.FillRect(Rect);
         Check := 0;
         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('BOM').AsString = '1' then
            Check := DFCS_CHECKED;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'REGULAR' then
      begin
         DBGrid1.Canvas.FillRect(Rect);
         Check := 0;
         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('REGULAR').AsString = '1' then
            Check := DFCS_CHECKED;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'NS' then
      begin
         DBGrid1.Canvas.FillRect(Rect);
         Check := 0;
         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('NS').AsString = '1' then
            Check := DFCS_CHECKED;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;

      if Column.FieldName = 'NA' then
      begin
         DBGrid1.Canvas.FillRect(Rect);
         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('NA').AsString = '1' then
            Check := DFCS_CHECKED
         else
           Check := 0;

         R:=Rect;
         InflateRect(R,0,0); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.DBGrid1CellClick(Column: TColumn);
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      if ((Column.FieldName = 'ID_ITEM') or (Column.FieldName = 'AREA_AVALIACAO') or (Column.FieldName = 'DESCRICAO')) then
      begin
        //
      end
      else
      begin
         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('OTIMO').AsString = '1' then
            VI_OTIMO:= VI_OTIMO-1;

         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('BOM').AsString = '1' then
            VI_BOM:= VI_BOM-1;

         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('REGULAR').AsString = '1' then
            VI_REGULAR:= VI_REGULAR-1;

         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('NS').AsString = '1' then
            VI_NS:= VI_NS-1;

         if Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FieldByName('NA').AsString = '1' then
            VI_NA:= VI_NA-1;

         Form_Sel_Avaliacao.IBTable_FichaAvaliacao.Edit;
         Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString:= '0';
         Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('BOM').AsString:= '0';
         Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString:= '0';
         Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NS').AsString:= '0';
         Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NA').AsString:= '0';

         if Column.FieldName = 'OTIMO' then
         begin
            Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString:= '1';
            VI_OTIMO:= VI_OTIMO+1;
         end;

         if Column.FieldName = 'BOM' then
         begin
            Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('BOM').AsString:= '1';
            VI_BOM:= VI_BOM+1;
         end;

         if Column.FieldName = 'REGULAR' then
         begin
            Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString:= '1';
            VI_REGULAR:= VI_REGULAR+1;
         end;

         if Column.FieldName = 'NS' then
         begin
            RichEdit_NS.Visible:= True;
            RichEdit_NS.Lines.Add('=> '+Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('ID_ITEM').AsString+
                                  ' - '+Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('Descricao').AsString);

            Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NS').AsString:= '1';
            VI_NS:= VI_NS+1;
//            IBTable_CadParecer.Edit;
            JvDBRichEdit_Parecer.Lines.Text:= JvDBRichEdit_Parecer.Lines.Text+
                                              '=> '+Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('ID_ITEM').AsString+
                                              '- '+Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('Descricao').AsString+#13;
//            IBTable_CadParecer.Post;
//            Funcoes.ExecutaTransacao_Prosima;
         end;

         if Column.FieldName = 'NA' then
         begin
            Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NA').AsString:= '1';
            VI_NA:= VI_NA+1;
         end;

         Form_Sel_Avaliacao.IBTable_FichaAvaliacao.Post;
         Funcoes.ExecutaTransacao_Prosima;

         Funcoes.AtualizaQuery(Form_Sel_Avaliacao.IBQuery_PR_Avaliacao);
         Mostrar_Medias;
         if Column.FieldName <> 'NA' then
         begin
            Dbgrid1.SelectedIndex := 0; // Primeiro indique qual coluna do grid voce quer se posicionar.
            Dbgrid1.SetFocus; // depois de um setfocus que o foco ira direto para a coluna posicionada.
         end;
      end;
   end;
//   Processar;
end;

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.Processar;
var
   bm_Avl : TBookmark;
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      VI_OTIMO:= 0;
      VI_BOM:= 0;
      VI_REGULAR:= 0;
      VI_NS:= 0;
      VI_NA:= 0;
      VI_TotalReg:= 0;

      bm_Avl:= Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.GetBookMark;
      Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.First;
      While not Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.Eof do
      begin
         if Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString = '1' then
         begin
            VI_OTIMO:= VI_OTIMO+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('BOM').AsString = '1' then
         begin
            VI_BOM:= VI_BOM+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString = '1' then
         begin
            VI_REGULAR:= VI_REGULAR+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NS').AsString = '1' then
         begin
            VI_NS:= VI_NS+1;
            VI_TotalReg:= VI_TotalReg + 1;
         end;

         if Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NA').AsString = '1' then
            VI_NA:= VI_NA+1;

         Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.Next;
      end;
      Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.GotoBookmark(bm_Avl);
      Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FreeBookMark(bm_Avl);
   end;
//    Mostrar_Medias;
end;

//------------------------------------------------------------------------------
// Tratamento Tratar as Medias
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.Mostrar_Medias;
var
  VR_Media: Real;
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
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

      Panel_Media.Caption:= FormatFloat('#0.00', VR_Media);
   end;
end;


//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

Procedure TForm_FichaAvaliacao.Analizar;
var
   bm_Avl : TBookmark;
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      VB_FichaVazia:= False;
      VS_NS:= '';

      VS_Msg:= '' ;
      bm_Avl:= Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.GetBookMark;
      Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.First;
      While not Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.Eof do
      begin
         if (( Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString = '0' ) and
             ( Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('BOM').AsString = '0' ) and
             ( Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString = '0' ) and
             ( Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NS').AsString = '0' ) and
             ( Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NA').AsString = '0' ))then
         begin
            VS_Msg:= VS_Msg+Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('Id_Item').AsString+'- '+
                            Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('Descricao').AsString+#13 ;
            VB_FichaVazia:= True;
         end
         else
         begin
            if Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('NS').AsString = '1' then
            begin
               VS_NS:= VS_NS+'=> '+Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('Id_Item').AsString+'- '+
                                 Form_Sel_Avaliacao.IBTable_FichaAvaliacao.FieldByName('Descricao').AsString+#13;
            end;
         end;
         Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.Next;
      end;
      Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.GotoBookmark(bm_Avl);
      Form_Sel_Avaliacao.IBQuery_PR_Avaliacao.FreeBookMark(bm_Avl);

      if VS_NS <> '' then
      begin
         IBTable_Rel_NS.Open;
         if IBTable_Rel_NS.FieldByName('IDCURSO').AsString = '' then
            IBTable_Rel_NS.Append
         else
            IBTable_Rel_NS.Edit;

         IBTable_Rel_NS.FieldByName('IDCURSO').AsString:= Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
         IBTable_Rel_NS.FieldByName('IDTURMA').AsString:= Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
         IBTable_Rel_NS.FieldByName('ID_ATCO').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString;
         IBTable_Rel_NS.FieldByName('ID_FICHA').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString;
         IBTable_Rel_NS.FieldByName('ID_AVL').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_AVL').AsString;
         IBTable_Rel_NS.FieldByName('ID_EXERCICIO').AsString:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString;
         IBTable_Rel_NS.FieldByName('DESCRICAO').AsString:= VS_NS;
         IBTable_Rel_NS.Post;
         Funcoes.ExecutaTransacao_Prosima;
         IBTable_Rel_NS.Close;
      end;

      Mostrar_Medias;
   end;
end;


//------------------------------------------------------------------------------
//--- Tratamento do Botao de Finalizacao do Cadastro da Ficha
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.SpeedButton_FinalizarClick(Sender: TObject);
var
   VS_Comando: String;
begin
   try
      if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
      begin
         Grava_IdExercicio;
         if VB_AtualizaInstrutor = True then
              AtualizarInstrutor;

         Processar;
         Analizar;
//   Mostrar_Medias;

         if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State <> DSInsert) and (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State <> DSEdit )) then
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Edit;

         if VB_FichaVazia = True then
         begin
            if Form_Sel_Avaliacao.VS_opcao = 'Inserir' then
            begin
               VS_Comando:= 'Update Cad_Ficha_Avl Set FICHACOMPLETA = '+#39+'N'+#39+
                            ' Where IDCURSO = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+' and '+
                            ' IDTURMA = '+Form_Sel_Avaliacao.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+' and '+
                            ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                            ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                            ' ID_AVL = '+#39+Funcoes.InserirPos(Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_AVL').AsString, 20)+#39+' and '+
                            ' ID_Exercicio = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString;
               Funcoes.ExecSqlProsima(VS_Comando);
            end
            else
            begin
               Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('FICHACOMPLETA').AsString:= 'N';
            end;

            VS_Msg:= VS_Msg+#13+'Faltando responder questionário...';
            ShowMessage(VS_Msg);
         end
         else
         begin
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('FICHACOMPLETA').AsString:= 'S';
         end;

         if VS_NS <> '' then
         begin
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('NS').AsString:= 'S';
         end;

         if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSInsert) or (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSEdit )) then
            //
         else
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Edit;

         if Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('Media').AsString <> '' then
         begin
//            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Cancel;
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Post;
            Funcoes.ExecutaTransacao_Prosima;
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Edit;
         end;

         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('Media').AsString:= Panel_Media.Caption;

   try
         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
   except
         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Cancel;
         Funcoes.ExecutaTransacao_Prosima;

         if Form_Sel_Avaliacao.VS_opcao = 'Inserir' then
         begin
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Close;
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Open;
         end;

         Form_Sel_Avaliacao.VS_opcao:= 'Consulta';

         Funcoes.AtualizaQuery(Form_Sel_Avaliacao.IBQuery_PR_Avaliacao);
         Funcoes.AtualizaQuery(Form_Sel_Avaliacao.IBQuery_CadFichaAvl);
         Close;
   end;

         Funcoes.ExecutaTransacao_Prosima;

         if Form_Sel_Avaliacao.VS_opcao = 'Inserir' then
         begin
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Close;
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Open;
         end;

         Form_Sel_Avaliacao.VS_opcao:= 'Consulta';

         Funcoes.AtualizaQuery(Form_Sel_Avaliacao.IBQuery_PR_Avaliacao);
         Funcoes.AtualizaQuery(Form_Sel_Avaliacao.IBQuery_CadFichaAvl);
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
// Tratamento para Desmontar a Form quando for fechada
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Comentario
//
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.JvDBRichEdit_ParecerEnter(Sender: TObject);
begin
   if Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      JvCaptionPanel_AgendaPosCurso.Height:= 545;
      if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSInsert) or (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSEdit )) then
         //
      else
         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Edit;
   end;
end;

procedure TForm_FichaAvaliacao.JvDBRichEdit_ParecerExit(Sender: TObject);
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      JvCaptionPanel_AgendaPosCurso.Height:= 148;
      if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSInsert) or (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSEdit )) then
      begin
         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Edit;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento que permite altera a Ficha de Avaliacao
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.AlteraFichaAvaliacao;
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State <> DSInsert) and (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State <> DSEdit )) then
         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Edit;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento quando ativa o DBEdit_IdExercicio
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.DBEdit_Id_ExercicioEnter(Sender: TObject);
begin
   if  ((copy(Edit_Prosima.Text,5,4) = 'TWR3') or (copy(Edit_Prosima.Text,5,4) = 'TWRS')) then
       Memo_Regra.Visible:= True;

   AlteraFichaAvaliacao;
   VS_Id_Exercicio_old:= Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString;
end;

procedure TForm_FichaAvaliacao.JvDBDateEdit_DataAvaliacaoEnter( Sender: TObject);
begin
   AlteraFichaAvaliacao;
end;


procedure TForm_FichaAvaliacao.JvDBDateEdit_DataAvaliacaoExit(Sender: TObject);
begin
   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSInsert) or (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSEdit )) then
      begin
         Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
      end;
  end;
end;

procedure TForm_FichaAvaliacao.DBEdit_Id_ExercicioExit(Sender: TObject);
begin
   Memo_Regra.Visible:= False;

   if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
      Grava_IdExercicio;
end;

procedure TForm_FichaAvaliacao.DBEdit_Id_ExercicioKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
   begin
      if  Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
         Grava_IdExercicio;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para Gravar a mudanca do numero do Exercicio
//------------------------------------------------------------------------------

procedure TForm_FichaAvaliacao.Grava_IdExercicio;
var
   VS_comando: String;
begin
   if Form_Sel_Avaliacao.VS_opcao <> 'Consulta' then
   begin
      if VS_Id_Exercicio_old <> '' then
      begin
         if VS_Id_Exercicio_old <> DBEdit_Id_Exercicio.Text then
         begin
            if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSInsert) or (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSEdit )) then
            begin
               VS_Comando:= 'Update PR_Avaliacao Set ID_Exercicio = '+DBEdit_Id_Exercicio.Text+
                            ' Where IDCURSO = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString+' and '+
                            ' IDTURMA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString+' and '+
                            ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                            ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                            ' ID_Exercicio = '+VS_Id_Exercicio_old;
               Funcoes.ExecSqlProsima(VS_Comando);

               VS_Comando:= 'Select count(1)As Qtd From Cad_Parecer '+
                            ' Where IDCURSO = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString+' and '+
                            ' IDTURMA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString+' and '+
                            ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                            ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                            ' ID_Exercicio = '+VS_Id_Exercicio_old;

               Funcoes.OpenQueryExecutaProsima(VS_Comando);

               if DM.IBQuery_Prosima_Ensino.FieldByName('Qtd').AsInteger > 0 then
               begin
                  VS_Comando:= 'Update Cad_Parecer Set ID_Exercicio = '+DBEdit_Id_Exercicio.Text+
                               ' Where IDCURSO = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString+' and '+
                               ' IDTURMA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString+' and '+
                               ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                               ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                               ' ID_Exercicio = '+VS_Id_Exercicio_old;
                  Funcoes.ExecSqlProsima(VS_Comando);
               end;

               VS_Comando:= 'Select count(1)As Qtd From Rel_NS '+
                            ' Where IDCURSO = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString+' and '+
                            ' IDTURMA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString+' and '+
                            ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                            ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                            ' ID_Exercicio = '+VS_Id_Exercicio_old;

               Funcoes.OpenQueryExecutaProsima(VS_Comando);

               if DM.IBQuery_Prosima_Ensino.FieldByName('Qtd').AsInteger > 0 then
               begin
                  VS_Comando:= 'Update Rel_NS Set ID_Exercicio = '+DBEdit_Id_Exercicio.Text+
                               ' Where IDCURSO = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString+' and '+
                               ' IDTURMA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString+' and '+
                               ' ID_ATCO = '+#39+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString+#39+' and '+
                               ' ID_FICHA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString+' and '+
                               ' ID_Exercicio = '+VS_Id_Exercicio_old;
                  Funcoes.ExecSqlProsima(VS_Comando);
               end;
            end;
         end;
         if ((Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSInsert) or (Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.State = DSEdit )) then
            Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Post;
         Funcoes.ExecutaTransacao_Prosima;
      end;
  end;
end;

procedure TForm_FichaAvaliacao.CheckBox_EstagiarioClick(Sender: TObject);
begin
   Form_Sel_Avaliacao.IBTable_Aluno.Edit;

   if CheckBox_Estagiario.State = cbChecked then
      Form_Sel_Avaliacao.IBTable_Aluno.FieldByName('Estagiario').AsString:= 'S'
   else
      Form_Sel_Avaliacao.IBTable_Aluno.FieldByName('Estagiario').AsString:= 'N';
   Form_Sel_Avaliacao.IBTable_Aluno.Post;
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
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select IdCurso, IdTurma, nomeCompleto, Identidade '+
                ' From Instrutor_Turma_View '+
                ' Where IDCURSO = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString+' and '+
                ' IDTURMA = '+Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString+' and '+
                ' NomeCompleto = '+#39+ComboBox_Avaliador.Text+#39;
   Funcoes.OpenQueryExecuta(VS_Comando);
   Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.FieldByName('Id_Instrutor').AsString:= DM.IBQuery_Executa_ensino.FieldByName('Identidade').AsString;
   Form_Sel_Avaliacao.IBTable_Cad_FichaAvl.Post;
   Funcoes.ExecutaTransacao_Prosima;
   VB_AtualizaInstrutor:= False;
end;

procedure TForm_FichaAvaliacao.SpeedButton_AjudaNExercicioClick( Sender: TObject);
begin
   DBEdit_Id_Exercicio.SetFocus;
end;

procedure TForm_FichaAvaliacao.IBTable_Rel_NSAfterDelete(DataSet: TDataSet);
begin
   DM.IBTransaction_Prosima.CommitRetaining;
end;

procedure TForm_FichaAvaliacao.IBTable_Rel_NSAfterEdit(DataSet: TDataSet);
begin
   DM.IBTransaction_Prosima.CommitRetaining;
end;

procedure TForm_FichaAvaliacao.IBTable_Rel_NSAfterInsert(DataSet: TDataSet);
begin
   DM.IBTransaction_Prosima.CommitRetaining;
end;

end.
