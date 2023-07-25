unit Classificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rotinas, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, TeEngine,
  Series, StdCtrls, TeeProcs, Chart, ExtCtrls, JvComponent, JvCaptionPanel,
  ComCtrls, ToolWin, ComObj, Menus, DBCtrls, Mask, JvShape, Buttons,
  IBTable, JvRichEd, JvDBRichEd;

type
  TForm_Classificacao = class(TForm)
    JvCaptionPanel3: TJvCaptionPanel;
    Chart_Desempenho: TChart;
    Series1: TBarSeries;
    IBQuery_Cad_Avaliados: TIBQuery;
    DSQ_Cad_Avaliados: TDataSource;
    PopupMenu1: TPopupMenu;
    Copiar1: TMenuItem;
    IBQuery_Cad_AvaliadosIDCURSO: TSmallintField;
    IBQuery_Cad_AvaliadosIDTURMA: TIntegerField;
    IBQuery_Cad_AvaliadosID_FICHA: TIntegerField;
    IBQuery_Cad_AvaliadosID_ATCO: TIBStringField;
    IBQuery_Cad_AvaliadosID_AVL: TIBStringField;
    IBQuery_Cad_AvaliadosID_EXERCICIO: TIntegerField;
    IBQuery_Cad_AvaliadosID_INSTRUTOR: TIBStringField;
    IBQuery_Cad_AvaliadosNOMECOMPLETO: TIBStringField;
    IBQuery_Cad_AvaliadosDATA_AVL: TDateTimeField;
    IBQuery_Cad_AvaliadosLOCAL: TIBStringField;
    IBQuery_Cad_AvaliadosMEDIA: TIBBCDField;
    IBQuery_Cad_AvaliadosPARECER: TBlobField;
    IBQuery_Cad_AvaliadosNS: TIBStringField;
    IBQuery_MontaTurma: TIBQuery;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaCOORDENADOR: TIBStringField;
    IBQuery_MontaTurmaSTATUS: TIBStringField;
    IBQuery_MontaTurmaDESCRICAO: TIBStringField;
    IBQuery_MontaTurmaCODSALA: TIBStringField;
    DST_MontaTurma: TDataSource;
    Panel2: TPanel;
    Panel1: TPanel;
    Panel_Turma: TPanel;
    JvShape2: TJvShape;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    ComboBox_Turma: TComboBox;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_Windows: TToolButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    DBGrid_Fichas: TDBGrid;
    Panel4: TPanel;
    ComboBox_Id_Exercicio: TComboBox;
    Edit_nome: TEdit;
    GroupBox_NS: TGroupBox;
    GroupBox1: TGroupBox;
    Panel_Media: TButton;
    JvDBRichEdit_Parecer: TJvDBRichEdit;
    IBQuery_Cad_AvaliadosFICHACOMPLETA: TIBStringField;
    ToolButton_Ficha_Avl: TToolButton;
    IBQuery_FichaAvaliacao: TIBQuery;
    IBQuery_FichaAvaliacaoAREA_AVALIACAO: TIBStringField;
    IBQuery_FichaAvaliacaoBOM: TIBStringField;
    IBQuery_FichaAvaliacaoDESCRICAO: TIBStringField;
    IBQuery_FichaAvaliacaoID_ATCO: TIBStringField;
    IBQuery_FichaAvaliacaoID_AVL: TIBStringField;
    IBQuery_FichaAvaliacaoID_EXERCICIO: TIntegerField;
    IBQuery_FichaAvaliacaoID_FICHA: TIntegerField;
    IBQuery_FichaAvaliacaoID_ITEM: TIBStringField;
    IBQuery_FichaAvaliacaoIDCURSO: TSmallintField;
    IBQuery_FichaAvaliacaoIDTURMA: TIntegerField;
    IBQuery_FichaAvaliacaoNA: TIBStringField;
    IBQuery_FichaAvaliacaoNS: TIBStringField;
    IBQuery_FichaAvaliacaoOTIMO: TIBStringField;
    IBQuery_FichaAvaliacaoREGULAR: TIBStringField;
    DSQ_Avaliacao: TDataSource;
    IBTable_FichaAvaliacao: TIBTable;
    IBTable_FichaAvaliacaoIDCURSO: TSmallintField;
    IBTable_FichaAvaliacaoIDTURMA: TIntegerField;
    IBTable_FichaAvaliacaoID_FICHA: TIntegerField;
    IBTable_FichaAvaliacaoID_ATCO: TIBStringField;
    IBTable_FichaAvaliacaoID_AVL: TIBStringField;
    IBTable_FichaAvaliacaoID_EXERCICIO: TIntegerField;
    IBTable_FichaAvaliacaoID_ITEM: TIBStringField;
    IBTable_FichaAvaliacaoOTIMO: TIBStringField;
    IBTable_FichaAvaliacaoBOM: TIBStringField;
    IBTable_FichaAvaliacaoREGULAR: TIBStringField;
    IBTable_FichaAvaliacaoNS: TIBStringField;
    IBTable_FichaAvaliacaoNA: TIBStringField;
    IBTable_FichaAvaliacaoAREA_AVALIACAO: TIBStringField;
    IBTable_FichaAvaliacaoDESCRICAO: TIBStringField;
    DST_FichaAvaliacao: TDataSource;
    IBTable_Cad_FichaAvl: TIBTable;
    IBTable_Cad_FichaAvlIDCURSO: TSmallintField;
    IBTable_Cad_FichaAvlIDTURMA: TIntegerField;
    IBTable_Cad_FichaAvlID_FICHA: TIntegerField;
    IBTable_Cad_FichaAvlID_ATCO: TIBStringField;
    IBTable_Cad_FichaAvlID_AVL: TIBStringField;
    IBTable_Cad_FichaAvlID_EXERCICIO: TIntegerField;
    IBTable_Cad_FichaAvlNOMECOMPLETO: TIBStringField;
    IBTable_Cad_FichaAvlDATA_AVL: TDateTimeField;
    IBTable_Cad_FichaAvlLOCAL: TIBStringField;
    IBTable_Cad_FichaAvlMEDIA: TIBBCDField;
    IBTable_Cad_FichaAvlPARECER: TBlobField;
    IBTable_Cad_FichaAvlNS: TIBStringField;
    IBTable_Cad_FichaAvlID_INSTRUTOR: TIBStringField;
    IBTable_Cad_FichaAvlFICHACOMPLETA: TIBStringField;
    IBTable_Cad_Avaliacao: TIBTable;
    IBTable_Cad_AvaliacaoIDCURSO: TSmallintField;
    IBTable_Cad_AvaliacaoIDTURMA: TIntegerField;
    IBTable_Cad_AvaliacaoID_FICHA: TIntegerField;
    IBTable_Cad_AvaliacaoID_ATCO: TIBStringField;
    IBTable_Cad_AvaliacaoID_AVL: TIBStringField;
    IBTable_Cad_AvaliacaoID_EXERCICIO: TIntegerField;
    IBTable_Cad_AvaliacaoID_ITEM: TIBStringField;
    IBTable_Cad_AvaliacaoOTIMO: TIBStringField;
    IBTable_Cad_AvaliacaoBOM: TIBStringField;
    IBTable_Cad_AvaliacaoREGULAR: TIBStringField;
    IBTable_Cad_AvaliacaoNS: TIBStringField;
    IBTable_Cad_AvaliacaoNA: TIBStringField;
    IBTable_Cad_AvaliacaoAREA_AVALIACAO: TIBStringField;
    IBTable_Cad_AvaliacaoDESCRICAO: TIBStringField;
    DST_Cad_Avaliacao: TDataSource;
    DST_Cad_FichaAvl: TDataSource;
    IBTable_instrutor: TIBTable;
    IBTable_instrutorIDCURSO: TSmallintField;
    IBTable_instrutorIDTURMA: TIntegerField;
    IBTable_instrutorIDENTIDADE: TIBStringField;
    IBTable_instrutorCODIGOINSTRUTOR: TIntegerField;
    IBTable_instrutorFUNCAO: TIBStringField;
    IBTable_instrutorNOMECOMPLETO: TIBStringField;
    IBTable_Aluno: TIBTable;
    IBTable_AlunoIDCURSO: TSmallintField;
    IBTable_AlunoIDTURMA: TIntegerField;
    IBTable_AlunoIDENTIDADE: TIBStringField;
    IBTable_AlunoNOMECOMPLETO: TIBStringField;
    IBTable_AlunoIDUNIDADE: TIBStringField;
    IBTable_AlunoIDSUBUNIDADE: TIBStringField;
    DST_AlunoTurma: TDataSource;
    DST_Instrutor: TDataSource;
    RichEdit_NS: TRichEdit;
    PopupMenu_Relatorio: TPopupMenu;
    ResumodasNotasdosAlunos1: TMenuItem;
    IBTable_Cad_FichaAvlESTAGIARIO: TIBStringField;

    procedure Monta_ComboTurma;
    procedure Tratar_Grafico;

    procedure Processar;
    procedure Mostrar_Medias;

    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure ComboBox_Id_ExercicioChange(Sender: TObject);
    procedure DBGrid_FichasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure IBQuery_Cad_AvaliadosAfterScroll(DataSet: TDataSet);
    procedure ToolButton_Ficha_AvlClick(Sender: TObject);
  private    { Private declarations }
     VS_CodCurso: String;
     MS_Turma: Array[1..1000] of String;

      VI_TotalReg, VI_OTIMO, VI_BOM, VI_REGULAR, VI_NS, VI_NA: Integer;
  public
    { Public declarations }
  end;

var
  Form_Classificacao: TForm_Classificacao;

implementation

uses Module, Rel_FichaAvaliacao, Sel_MontaProsima;

{$R *.dfm}

procedure TForm_Classificacao.FormActivate(Sender: TObject);
begin
   VS_CodCurso:= '';
   //--- Tratamento da Selecao dos Cursos

   Monta_ComboTurma;
   IBQuery_Cad_Avaliados.Open;
//   IBTable_Parecer.Open;
   IBTable_Cad_FichaAvl.Open;
   IBTable_instrutor.Open;
   IBTable_Cad_Avaliacao.Open;
   IBTable_Aluno.Open;
   IBQuery_FichaAvaliacao.Open;
   IBTable_FichaAvaliacao.Open;

   Tratar_Grafico;
end;

//------------------------------------------------------------------------------
// Tratamento do Grafico
//------------------------------------------------------------------------------

procedure TForm_Classificacao.Tratar_Grafico;
var
   VR_SomaMedia, VR_Cont: Real;
   VS_Valor: String;
   bmLocal : TBookmark;
begin
   bmLocal:= IBQuery_Cad_Avaliados.GetBookMark;
   VR_SomaMedia:= 0;
   VR_Cont:= 0;

   Series1.Clear;
   IBQuery_Cad_Avaliados.Open;
   IBQuery_Cad_Avaliados.First;
   While not IBQuery_Cad_Avaliados.Eof do
   begin
      if Trim(IBQuery_Cad_Avaliados.FieldByName('Media').AsString) <> '' then
      begin
         begin
            VR_SomaMedia:= VR_SomaMedia +IBQuery_Cad_Avaliados.FieldByName('Media').AsFloat;
            VR_Cont:= VR_Cont+1;

            VS_Valor:= Trim(Funcoes.DePara(IBQuery_Cad_Avaliados.FieldByName('Media').AsString,'.',','));
            VS_Valor:= Trim(Funcoes.DePara(IBQuery_Cad_Avaliados.FieldByName('Media').AsString,'/','0'));
            Series1.AddY(StrToCurrDef( FormatFloat('#0.00',StrToFloat(VS_Valor)), 0), FormatFloat('000', 111),clRed)
         end;
      end;
      IBQuery_Cad_Avaliados.Next;
   end;
   if VR_SomaMedia > 0 then
   begin
      VR_SomaMedia:= VR_SomaMedia / VR_Cont;
      Panel_Media.Caption:= 'Média da Turma -> '+FormatFloat('#0.00',VR_SomaMedia)
   end
   else
   begin
      Panel_Media.Caption:= 'Média da Turma -> ';
   end;
   IBQuery_Cad_Avaliados.GotoBookMark(bmLocal);
   IBQuery_Cad_Avaliados.FreeBookMark(bmLocal);
end;

procedure TForm_Classificacao.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_Classificacao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Classificacao.Copiar1Click(Sender: TObject);
begin
  Chart_Desempenho.CopyToClipboardBitmap;
end;

//------------------------------------------------------------------------------
// Tratamento do Combo de Selecao da Turma
//------------------------------------------------------------------------------

procedure TForm_Classificacao.ComboBox_TurmaChange(Sender: TObject);
var
   VS_Comando, VS_Turma: String;
   VI_IdTurma: Integer;
begin
   VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-'));

   if VS_Turma <> '' then
   begin
      VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
      VS_Comando:= 'Select IdCurso, IdTurma, Turma, Ano, DataInicio, DataTermino, Coordenador, Status, Descricao, CodSala '+
                   ' from turma '+
                   ' Where IdCurso = '+Funcoes.GetIdCurso+
                   ' and IdTurma = '+MS_Turma[VI_IdTurma];
      Funcoes.ExecutaQuery(IBQuery_MontaTurma, VS_Comando);
      Tratar_Grafico;
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_Classificacao.Monta_ComboTurma;
var
   VS_Comando :String;
   VI_Indice: Integer;
begin
   //--- Tratamento da Alimentacao do Combo de selecao da Turma

   VS_Comando:= 'Select * From Turma where IdCurso = '+Funcoes.GetIdCurso+' and Status <> '+#39+'P'+#39+' Order By Turma';
   IBQuery_MontaTurma.Close;
   IBQuery_MontaTurma.Sql.Clear;
   IBQuery_MontaTurma.Sql.Add(VS_Comando);
   IBQuery_MontaTurma.Open;
   IBQuery_MontaTurma.First;

   VI_Indice:= 1;

   ComboBox_Turma.Items.Clear;
   if Trim(IBQuery_MontaTurma.FieldByName('IdTurma').AsString) = '' then
   begin
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= '-2';
   end
   else
   begin
      ComboBox_Turma.Text:= IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+IBQuery_MontaTurma.FieldByName('Descricao').AsString;
      MS_Turma[VI_Indice]:= IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
   end;

   While not IBQuery_MontaTurma.Eof do
   begin
      if IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger > 0 then
      begin
         ComboBox_Turma.Items.Add( IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+IBQuery_MontaTurma.FieldByName('Descricao').AsString);
         VI_Indice:= VI_Indice + 1;
         MS_Turma[VI_Indice]:= IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
      end;
      IBQuery_MontaTurma.Next;
   end;
   IBQuery_MontaTurma.First;
end;



procedure TForm_Classificacao.ComboBox_Id_ExercicioChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select * '+
                ' From Cad_Ficha_avl '+
                ' where IdCurso = :IdCurso '+
                ' and   IdTurma = :IdTurma ';

   if ComboBox_Id_Exercicio.Text <> '' then
      VS_Comando:=  VS_Comando+' and   Id_Exercicio = '+ComboBox_Id_Exercicio.Text;

   if Edit_nome.Text <> '' Then
      VS_Comando:=  VS_Comando+' and NomeCompleto like '+#39+'%'+Edit_nome.Text+'%'+#39;


   VS_Comando:= VS_Comando+' Order By NomeCompleto, Id_Exercicio';

   IBQuery_Cad_Avaliados.Close;
   IBQuery_Cad_Avaliados.SQL.Clear;
   IBQuery_Cad_Avaliados.SQL.Add(VS_Comando);
   IBQuery_Cad_Avaliados.Open;

   Tratar_Grafico;
end;


procedure TForm_Classificacao.DBGrid_FichasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBQuery_Cad_Avaliados.FieldByName('NS').AsString = 'S' then
     DBGrid_Fichas.Canvas.Font.Color:= clRed
   else
   begin
//      DBGrid_Fichas.Canvas.Font.Color:= clBlack;
//
      if IBQuery_Cad_Avaliados.FieldByName('FICHACOMPLETA').AsString = 'S' then
         DBGrid_Fichas.Canvas.Font.Color:= clBlue
      else
         DBGrid_Fichas.Canvas.Font.Color:= clBlack;
   end;

  if gdSelected in State then
    DBGrid_Fichas.Canvas.Brush.Color := $008E4F15;

   DBGrid_Fichas.Canvas.FillRect(Rect);
   DBGrid_Fichas.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;


procedure TForm_Classificacao.IBQuery_Cad_AvaliadosAfterScroll( DataSet: TDataSet);
var
   VI_Cont: Integer;
begin
   if Trim(IBQuery_Cad_Avaliados.FieldByName('IDCURSO').AsString) <> '' then
   begin
      if ((Trim(IBQuery_Cad_Avaliados.FieldbyName('Media').AsString) = '') or
          (Trim(IBQuery_Cad_Avaliados.FieldbyName('Media').AsString) = '0')) then
      begin
         Processar;
      end;

      RichEdit_NS.Lines.Clear;
      if IBQuery_Cad_Avaliados.FieldByName('NS').AsString = 'S' then
      begin
         VI_Cont:= 0;
         IBQuery_FichaAvaliacao.First;
         While not IBQuery_FichaAvaliacao.Eof do
         begin
            if IBQuery_FichaAvaliacao.FieldByName('NS').AsString = '1' then
            begin
               RichEdit_NS.Lines.Add( IBQuery_FichaAvaliacao.FieldByName('Id_Item').AsString+' - '+IBQuery_FichaAvaliacao.FieldByName('Descricao').AsString);
               VI_Cont:= VI_Cont+1;
            end;
            IBQuery_FichaAvaliacao.Next;
         end;
         GroupBox_NS.Caption:= '< NS - Quantidade: '+Trim(IntToStr(VI_Cont))+' > ';
         GroupBox_NS.Visible:= True;
      end
      else
          GroupBox_NS.Visible:= false;
   end;
end;

procedure TForm_Classificacao.ToolButton_Ficha_AvlClick(Sender: TObject);
begin
   Form_Rel_FichaAvaliacao.ShowMOdal;
end;

//------------------------------------------------------------------------------
//
// Tratamento para Calcular a Media quando esta não foi Calculada
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento quando Clicar na Grid
//------------------------------------------------------------------------------

procedure TForm_Classificacao.Processar;
var
   bm_Avl : TBookmark;
begin
   VI_OTIMO:= 0;
   VI_BOM:= 0;
   VI_REGULAR:= 0;
   VI_NS:= 0;
   VI_NA:= 0;
   VI_TotalReg:= 0;

   Form_Classificacao.IBQuery_FichaAvaliacao.Open;
   bm_Avl:= Form_Classificacao.IBQuery_FichaAvaliacao.GetBookMark;
   Form_Classificacao.IBQuery_FichaAvaliacao.First;
   While not Form_Classificacao.IBQuery_FichaAvaliacao.Eof do
   begin
      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('OTIMO').AsString = '1' then
      begin
         VI_OTIMO:= VI_OTIMO+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('BOM').AsString = '1' then
      begin
         VI_BOM:= VI_BOM+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('REGULAR').AsString = '1' then
      begin
         VI_REGULAR:= VI_REGULAR+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('NS').AsString = '1' then
      begin
         VI_NS:= VI_NS+1;
         VI_TotalReg:= VI_TotalReg + 1;
      end;

      if Form_Classificacao.IBTable_FichaAvaliacao.FieldByName('NA').AsString = '1' then
         VI_NA:= VI_NA+1;

      Form_Classificacao.IBQuery_FichaAvaliacao.Next;
   end;

   Form_Classificacao.IBQuery_FichaAvaliacao.Close;
   Form_Classificacao.IBQuery_FichaAvaliacao.Open;

   Form_Classificacao.IBQuery_FichaAvaliacao.GotoBookmark(bm_Avl);
   Form_Classificacao.IBQuery_FichaAvaliacao.FreeBookMark(bm_Avl);

    Mostrar_Medias;
end;

//------------------------------------------------------------------------------
// Tratamento Tratar as Medias
//------------------------------------------------------------------------------

procedure TForm_Classificacao.Mostrar_Medias;
var
  VR_Media: Real;
  VS_Media, VS_Comando: String;
begin
   VR_Media:= (VI_OTIMO*4)+(VI_BOM*2)+(VI_REGULAR);
   if VI_TotalReg > 0 then
      VR_Media:= VR_Media/VI_TotalReg;

   VS_Media:= FormatFloat('#0.00', VR_Media);

   VS_Comando:= 'Update Cad_Ficha_Avl Set Media = '+Funcoes.DePara(VS_Media, ',','.')+
                ' Where IDCURSO = '+IBQuery_Cad_Avaliados.FieldByName('IDCURSO').AsString+' and '+
                ' IDTURMA = '+IBQuery_Cad_Avaliados.FieldByName('IDTURMA').AsString+' and '+
                ' ID_ATCO = '+#39+IBQuery_Cad_Avaliados.FieldByName('ID_ATCO').AsString+#39+' and '+
                ' ID_FICHA = '+IBQuery_Cad_Avaliados.FieldByName('ID_FICHA').AsString+' and '+
                ' ID_AVL = '+#39+IBQuery_Cad_Avaliados.FieldByName('ID_AVL').AsString+#39+' and '+
                ' ID_Exercicio = '+IBQuery_Cad_Avaliados.FieldByName('ID_EXERCICIO').AsString;
   Funcoes.ExecSqlProsima(VS_Comando);
end;

end.
