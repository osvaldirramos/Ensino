{
--------------------------------------------------------------------------------
   Regras para criar Prova automatica

    1 - O Numero de itens não deve ultrapassar a quantidade de itens calculados/selecionado (Total de questoes

--------------------------------------------------------------------------------
}

{
    ClientDataSet_Facil Disciplina: String(10)
    ClientDataSet_Facil Posicionar: String(10)
    ClientDataSet_Facil Materia: String(10)
    ClientDataSet_Facil Cor: String (1);
    ClientDataSet_Facil NQuestoes: Integer ;

    ClientDataSet_Facil Sel_F: String (1);
    ClientDataSet_Facil NumItem_F: String (15);
    ClientDataSet_Facil Conflito_F: String (15);
    ClientDataSet_Facil Objetivo_F: String (1);
    ClientDataSet_Facil NumQuestao_F: Integer ;

    ClientDataSet_Facil Sel_M: String (1);
    ClientDataSet_Facil NumItem_M: String (15);
    ClientDataSet_Facil Conflito_M: String (15);
    ClientDataSet_Facil Objetivo_M: String (1);
    ClientDataSet_Facil NumQuestao_M: Integer ;

    ClientDataSet_Facil Sel_D: String (1);
    ClientDataSet_Facil NumItem_D: String (15);
    ClientDataSet_Facil Conflito_D: String (15);
    ClientDataSet_Facil Objetivo_D: String (1);
    ClientDataSet_Facil NumQuestao_D: Integer ;
}

unit Monta_ProvaEletronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient, StdCtrls,
  ComCtrls, Mask, ImgList, JvGradientCaption, jpeg, IBQuery,
  IBCustomDataSet, IBTable, JvEdit, ToolWin, JvComponent, JvCaptionPanel,
  JvGradient, JvTransBtn, JvShape;

type
  TDBGrid = class(DBGrids.TDBGrid);   {Classe responsável por obter novas(membros protegidos) propriedades do DBGrid}
  TForm_MontarProvaEletronica = class(TForm)
    DSC_Facil: TDataSource;
    Table_Teste: TIBTable;
    Table_TesteIDCURSO: TSmallintField;
    Table_TesteIDTURMA: TIntegerField;
    Table_TesteFASEAPLICACAO: TIBStringField;
    Table_TesteREFERENCIAAVALIACAO: TIBStringField;
    Table_TesteCODMATERIA: TIBStringField;
    Table_TesteTOTALALUNOS: TSmallintField;
    Table_TesteTOTALITENS: TSmallintField;
    Table_TesteDURACAO: TIntegerField;
    Table_TesteTOTALIRREGULARIDADE: TSmallintField;
    Table_TesteTOTALANULADAS: TIntegerField;
    Table_TesteREFORMULADOS: TSmallintField;
    Table_TesteMANTIDO: TSmallintField;
    Table_TesteAPRESENTARNOTA: TIBStringField;
    Table_TesteOBSERVACAO: TIBStringField;
    Table_TesteN_GABARITOS: TIntegerField;
    Table_TesteDATAAPLICACAO: TDateTimeField;
    Table_TesteHAB_ELABORACAO: TIBStringField;
    DST_Teste: TDataSource;
    IBQuery_Abrangencia: TIBQuery;
    DSQ_Abrangencia: TDataSource;
    DSQ_IP_Item: TDataSource;
    IBQuery_NQuestoes: TIBQuery;
    DataSource2: TDataSource;
    IBQuery_NQuestoesOBJETIVO: TIBStringField;
    IBQuery_NQuestoesQTD: TIntegerField;
    Query_IP_Item: TIBQuery;
    Query_IP_ItemNUMITEM: TIntegerField;
    Query_IP_ItemIDCURSO: TSmallintField;
    Query_IP_ItemCODMATERIA: TIBStringField;
    Query_IP_ItemDISCIPLINA: TIBStringField;
    Query_IP_ItemUNIDADE: TIBStringField;
    Query_IP_ItemSUBUNIDADE: TIBStringField;
    Query_IP_ItemOBJETIVO: TIBStringField;
    Query_IP_ItemSERIE: TIBStringField;
    Query_IP_ItemTEMPORES: TIBStringField;
    Query_IP_ItemRESPOSTACORRETA: TIBStringField;
    Query_IP_ItemDESCENALT: TBlobField;
    Query_IP_ItemRECURSO: TIBStringField;
    Query_IP_ItemSTATUS: TIBStringField;
    IBQuery_AbrangenciaIDCURSO: TSmallintField;
    IBQuery_AbrangenciaIDTURMA: TIntegerField;
    IBQuery_AbrangenciaCODMATERIA: TIBStringField;
    ClientDataSet_Facil: TClientDataSet;
    ClientDataSet_FacilDisciplina: TStringField;
    ClientDataSet_FacilMateria: TStringField;
    ClientDataSet_FacilCor: TStringField;
    ClientDataSet_FacilNQuestoes: TIntegerField;
    ClientDataSet_FacilSel_F: TStringField;
    ClientDataSet_FacilNumItem_F: TStringField;
    ClientDataSet_FacilConflito_F: TStringField;
    ClientDataSet_FacilObjetivo_F: TStringField;
    ClientDataSet_FacilNumQuestao: TIntegerField;
    ClientDataSet_FacilSel_M: TStringField;
    ClientDataSet_FacilNumItem_M: TStringField;
    ClientDataSet_FacilConflito_M: TStringField;
    ClientDataSet_FacilObjetivo_M: TStringField;
    ClientDataSet_FacilNumQuestao_M: TIntegerField;
    ClientDataSet_FacilSel_D: TStringField;
    ClientDataSet_FacilNumItem_D: TStringField;
    ClientDataSet_FacilConflito_D: TStringField;
    ClientDataSet_FacilObjetivo_D: TStringField;
    ClientDataSet_FacilNumQuestao_D: TIntegerField;

    Table_TesteSTATUS_APLICACAO: TIBStringField;
    Table_TesteINICIO_APLICACAO: TDateTimeField;
    Table_TesteTERMINO_APLICACAO: TDateTimeField;
    Panel_TrataQuestoes: TPanel;
    JvGradient2: TJvGradient;
    Panel_Itens: TPanel;
    Panel_Cabecalho: TPanel;
    Shape15: TShape;
    JvGradient_Cabecalho: TJvGradient;
    Label10: TLabel;
    DBGrid_Questoes: TDBGrid;
    Panel_Facil: TPanel;
    JvGradient_Facil: TJvGradient;
    Label_Facil: TLabel;
    Panel_Medio: TPanel;
    JvGradient_Medio: TJvGradient;
    Label_Medio: TLabel;
    Panel_Dificel: TPanel;
    JvGradient_Dificel: TJvGradient;
    Label_Dificel: TLabel;
    Panel_Disciplina: TPanel;
    JvGradient1: TJvGradient;
    Shape4: TShape;
    ClientDataSet_FacilPosiciona_Cont: TStringField;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Panel_Selecionadas: TPanel;
    Panel_TotalQuestoesFaceis: TPanel;
    Panel_TotalQuestoesMedias: TPanel;
    Panel_TotalQuestoesDificeis: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    Label16: TLabel;
    Label_Total: TLabel;
    Label_TotalPor: TLabel;
    MaskEdit_Por_Faceis: TMaskEdit;
    MaskEdit_Por_Medias: TMaskEdit;
    MaskEdit_Por_Dificeis: TMaskEdit;
    MaskEdit_Especificadas: TMaskEdit;
    MaskEdit_Tot_Faceis: TMaskEdit;
    MaskEdit_Tot_Medias: TMaskEdit;
    MaskEdit_Tot_Dificeis: TMaskEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Edit_Escape: TEdit;
    Panel_Botoes_CabecalhoProva: TPanel;
    Label_DescricaoCurso: TLabel;
    Panel3: TPanel;
    JvShape6: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Ferramentas: TJvTransparentButton;
    JvGradient_Itens: TJvGradient;
    JvGradient3: TJvGradient;
    Shape7: TShape;
    Shape3: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Shape2: TShape;
    Label_Referencia_Prova: TLabel;
    Label_Data_Prova: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    Label_Curso: TLabel;
    Label8: TLabel;
    Label_Turma: TLabel;
    Image2: TImage;
    Panel_Treeviw: TPanel;
    JvGradientCaption6: TJvGradientCaption;
    JvGradientCaption1: TJvGradientCaption;
    Shape5: TShape;
    JvTransparentButton_MontarProva: TJvTransparentButton;
    ClientDataSet_Prova: TClientDataSet;
    JvGradientCaption2: TJvGradientCaption;
    ClientDataSet_ProvaNivel: TStringField;
    ClientDataSet_ProvaMateria: TStringField;
    ClientDataSet_ProvaNumItem: TStringField;
    ClientDataSet_ProvaRespostaCorreta: TStringField;
    DCDS_Prova: TDataSource;
    DBGrid2: TDBGrid;
    JvGradient4: TJvGradient;
    Panel4: TPanel;
    JvTransparentButton_HomogeneizarProva: TJvTransparentButton;

    Function GerarNumeroAleatorio: Integer;
    Function Randomico(VI_Limite: integer): String;
    Function Busca_RespostaCorreta(VS_NumItem: String): String;

    procedure MontarProva;
    procedure MostraProvaFinal;

    procedure ZerarSelecoes;
    procedure CarregarItens;
    procedure TratarQuantidadeDeQuestoes(MaskEdit_Por: TMaskEdit; VS_TipoQuestoes: String);
    procedure CalcularTotalItensSelecionado;
    procedure CalcularQuantidadeQuestoes;
    procedure AtualizarNQuestoesSelecionada(Item, VS_Opcao: String);
    procedure LimparLista;
    procedure Cadastro_ItensProva( VS_Disciplina, VS_Objetivo, VS_NQuestoes, VI_Cor: String);

    procedure Button_WindowsClick(Sender: TObject);
    procedure DBGrid_QuestoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_QuestoesCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit_Por_FaceisKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_Por_MediasKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_Por_DificeisKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_EspecificadasKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_Tot_FaceisKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_Tot_MediasKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_Tot_DificeisKeyPress(Sender: TObject; var Key: Char);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_MontarProvaClick(
      Sender: TObject);
    procedure JvTransparentButton_HomogeneizarProvaClick(Sender: TObject);

  private    { Private declarations }
      VI_Seq: array[1..70] of Integer;

     Cor: Array[1..400] of Integer;
     Disciplina: array[1..400] of String;
     Materia: array[1..400] of String;
     NumQuestoes: array[1..400] of String;

     Sel_F: Array[1..400] of String;
     NumItem_F: array[1..400] of String;
     Conflito_F: array[1..400] of String;
     Objetivo_F: array[1..400] of String;

     Sel_M: Array[1..400] of String;
     NumItem_M: array[1..400] of String;
     Conflito_M: array[1..400] of String;
     Objetivo_M: array[1..400] of String;

     Sel_D: Array[1..400] of String;
     NumItem_D: array[1..400] of String;
     Conflito_D: array[1..400] of String;
     Objetivo_D: array[1..400] of String;

     VI_Rodadas,  VI_NQuestoes, Cont_F, Cont_M, Cont_D: Integer;

  public    { Public declarations }
  end;

var
  Form_MontarProvaEletronica: TForm_MontarProvaEletronica;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento para
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.FormActivate(Sender: TObject);
begin
   VI_Rodadas:= 0;
   IBQuery_Abrangencia.Open;
   Query_IP_Item.Open;
   IBQuery_NQuestoes.Open;

   CalcularQuantidadeQuestoes;
   CarregarItens;
   JvTransparentButton_MontarProvaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para ferchar o programa
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar Janela e Retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.Button_WindowsClick(Sender: TObject);
begin
   Application.Terminate;
end;

//------------------------------------------------------------------------------
// Limpar matrizes
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.LimparLista;
var
   i: Integer;
begin
   for i:= 1 to 400 do
   begin
      Cor[i]:= 0;
      Disciplina[i]:= '';
      Materia[i]:= '';
      NumQuestoes[i]:= '';

      Sel_F[i]:= '';
      NumItem_F[i]:= '';
      Conflito_F[i]:= '';
      Objetivo_F[i]:= '';

      Sel_M[i]:= '';
      NumItem_M[i]:= '';
      Conflito_M[i]:= '';
      Objetivo_M[i]:= '';

      Sel_D[i]:= '';
      NumItem_D[i]:= '';
      Conflito_D[i]:= '';
      Objetivo_D[i]:= '';
   end;

   ClientDataSet_Facil.First;
   While Not ClientDataSet_Facil.Eof do
   begin
      ClientDataSet_Facil.Delete;
      ClientDataSet_Facil.Next;
   end;
end;

//------------------------------------------------------------------------------
//Procedure para tratamento para Carregar o item
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.CarregarItens;
var
   VI_Disc, Cont, VI_Cor: Integer;
   VS_Comando: String;
   VS_Disciplina, VS_Objetivo: String;
begin
   LimparLista;

   Panel_Selecionadas.Caption:= '0';

   VI_Cor:= 0;
   VS_Disciplina:= '';
   VS_Objetivo:= '';

   VI_Disc:= 0;
   Cont:= 0;

   IBQuery_Abrangencia.First;
   While not IBQuery_Abrangencia.Eof do
   begin
      Query_IP_Item.First;
      While Not Query_IP_Item.Eof do
      begin
         VI_Disc:= VI_Disc +1;   // Contador matriz

         if IBQuery_Abrangencia.FieldByName('CodMateria').AsString <> VS_Disciplina then
         begin
            Cont_F:= Cont;
            Cont_M:= Cont;
            Cont_D:= Cont;

            VI_Cor:= VI_Cor + 1;
            if VI_Cor > 2 then
               VI_Cor:= 1;

            VS_Disciplina:= IBQuery_Abrangencia.FieldByName('CodMateria').AsString;
            NumQuestoes[VI_Disc]:= '0';
            Disciplina[VI_Disc]:= VS_Disciplina;
         end;

         Cont:= Cont +1;   // Contador matriz
         Materia[Cont]:= VS_Disciplina;
         Cor[Cont]:= VI_Cor;

         // Pega o Indice de Facilidade da Prova

         VS_Comando:= 'Select avg(indicefacilidade) as Indice from indice_item '+
                      ' Where NumItem = '+Query_IP_Item.FieldByName('NumItem').AsString;
         DM.IBQuery_Executa.Close;
         DM.IBQuery_Executa.Sql.Clear;
         DM.IBQuery_Executa.Sql.Add(VS_Comando);
         DM.IBQuery_Executa.Open;

         if DM.IBQuery_Executa.FieldByName('Indice').AsFloat < 0.60 then        // Facil
         begin
            Cont_F:= Cont_F+1;
            Sel_F[Cont_F]:= '0';
            NumItem_F[Cont_F]:= Query_IP_Item.FieldByName('NumItem').AsString;
            Objetivo_F[Cont_F]:= Query_IP_Item.FieldByName('Objetivo').AsString;
            Conflito_F[Cont_F]:= '';
         end
         else
         begin
            if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.80 then     // Medio
            begin
               Cont_M:= Cont_M+1;
               Sel_M[Cont_M]:= '0';
               NumItem_M[Cont_M]:= Query_IP_Item.FieldByName('NumItem').AsString;
               Objetivo_M[Cont_M]:= Query_IP_Item.FieldByName('Objetivo').AsString;
               Conflito_M[Cont_M]:= '';
            end
            else                                                                // Dificel
            begin
               Cont_D:= Cont_D+1;
               Sel_D[Cont_D]:= '0';
               NumItem_D[Cont_D]:= Query_IP_Item.FieldByName('NumItem').AsString;
               Objetivo_D[Cont_D]:= Query_IP_Item.FieldByName('Objetivo').AsString;
               Conflito_D[Cont_M]:= '';
            end;
         end;

          Query_IP_Item.Next;
      end;
      IBQuery_Abrangencia.Next;
   end;
   Cadastro_ItensProva( VS_Disciplina, VS_Objetivo, '', IntToStr(VI_Cor) );
   ClientDataSet_Facil.First;

end;

//------------------------------------------------------------------------------
// Procedure para montar o Cadastro dos Itena para ser selecionado
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.Cadastro_ItensProva( VS_Disciplina, VS_Objetivo, VS_NQuestoes, VI_Cor: String);
var
   VI_Fim, VI_Cont: Integer;
   teste: string;
Begin
   VI_Fim:= Cont_F;
   if VI_Fim < Cont_M then
      VI_Fim:= Cont_M;

   if VI_Fim < Cont_D then
      VI_Fim:= Cont_D;

   for VI_Cont:= 1 to VI_Fim do
   begin
      if ((NumItem_F[VI_Cont] = '') and (NumItem_M[VI_Cont] = '') and (NumItem_D[VI_Cont] = '')) then
      begin
         // Não faz nada
      end
      else
      begin

         ClientDataSet_Facil.Append;
         ClientDataSet_Facil.FieldByName('Disciplina').AsString:= Disciplina[VI_Cont];
         ClientDataSet_Facil.FieldByName('Materia').AsString:= Materia[VI_Cont];
         ClientDataSet_Facil.FieldByName('NQuestoes').AsString:= NumQuestoes[VI_Cont];
         ClientDataSet_Facil.FieldByName('Cor').AsString:= intToStr(Cor[VI_Cont]);

         if VI_Cont <= Cont_F then
         begin
            ClientDataSet_Facil.FieldByName('Sel_F').AsString:= Sel_F[VI_Cont];
            ClientDataSet_Facil.FieldByName('NumItem_F').AsString:= NumItem_F[VI_Cont];
            ClientDataSet_Facil.FieldByName('Conflito_F').AsString:= Conflito_F[VI_Cont];
            ClientDataSet_Facil.FieldByName('Objetivo_F').AsString:= Objetivo_F[VI_Cont];
         end;

         if VI_Cont <= Cont_M then
         begin
            ClientDataSet_Facil.FieldByName('Sel_M').AsString:= Sel_M[VI_Cont];
            ClientDataSet_Facil.FieldByName('NumItem_M').AsString:= NumItem_M[VI_Cont];
            ClientDataSet_Facil.FieldByName('Conflito_M').AsString:= Conflito_M[VI_Cont];
            ClientDataSet_Facil.FieldByName('Objetivo_M').AsString:= Objetivo_M[VI_Cont];
         end;

         if VI_Cont <= Cont_D then
         begin
            ClientDataSet_Facil.FieldByName('Sel_D').AsString:= Sel_D[VI_Cont];
            ClientDataSet_Facil.FieldByName('NumItem_D').AsString:= NumItem_D[VI_Cont];
            ClientDataSet_Facil.FieldByName('Conflito_D').AsString:= Conflito_D[VI_Cont];
            ClientDataSet_Facil.FieldByName('Objetivo_D').AsString:= Objetivo_D[VI_Cont];
         end;
         ClientDataSet_Facil.Post;
      end;
   end;
end;

procedure TForm_MontarProvaEletronica.DBGrid_QuestoesDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Check: Integer;
   R: TRect;
   Bmp: TBitMap;


  function GetColsWidth: Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to Column.Index do
    begin
      Result := Result + TDBGrid(Sender).Columns.Items[I].Width;
    end;
    Result := Result + 10 + (Column.Index);
  end;
begin
   { Tratamento para Definir Cor diferente de acordo com a Disciplina}

   if (ClientDataSet_Facil.FieldByName('Cor').AsString = '1') then
     DBGrid_Questoes.Canvas.Brush.Color:= $00FFC6C6
   else
      if (ClientDataSet_Facil.FieldByName('Cor').AsString = '2') then
         DBGrid_Questoes.Canvas.Brush.Color:= $00FFEBD7
      else
         DBGrid_Questoes.Canvas.Brush.Color:= $00FFC6C6;

  if gdSelected in State then
    DBGrid_Questoes.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Questoes.Canvas.FillRect(Rect);
   DBGrid_Questoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);


   {Tratamento para o CheckBox}


   if Column.FieldName = 'Sel_F' then
   begin
      if Trim(ClientDataSet_Facil.FieldByName('Sel_F').AsString) <> '' then
      begin
         DBGrid_Questoes.Canvas.FillRect(Rect);
         Check := 0;

         if ClientDataSet_Facil.FieldByName('Sel_F').AsString = '1' then
            Check := DFCS_CHECKED;
         R:=Rect;
         InflateRect(R,1,1); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid_Questoes.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;
   end;

   if Column.FieldName = 'Sel_M' then
   begin
      if Trim(ClientDataSet_Facil.FieldByName('Sel_M').AsString) <> '' then
      begin
         DBGrid_Questoes.Canvas.FillRect(Rect);
         Check := 0;

         if ClientDataSet_Facil.FieldByName('Sel_M').AsString = '1' then
            Check := DFCS_CHECKED;
         R:=Rect;
         InflateRect(R,1,1); {Diminue o tamanho do CheckBox}
         DrawFrameControl(DBGrid_Questoes.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;
   end;

   if Column.FieldName = 'Sel_D' then
   begin
      if Trim(ClientDataSet_Facil.FieldByName('Sel_D').AsString) <> '' then
      begin
         DBGrid_Questoes.Canvas.FillRect(Rect);
         Check := 0;

         if ClientDataSet_Facil.FieldByName('Sel_D').AsString = '1' then
            Check := DFCS_CHECKED;
         R:=Rect;
         InflateRect(R,1,1); {Diminue o tamanho do CheckBox}
        DrawFrameControl(DBGrid_Questoes.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
      end;
   end;

end;

//------------------------------------------------------------------------------
// Tratamento quanto clica na celula
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.DBGrid_QuestoesCellClick(Column: TColumn);
var
   bmLocal : TBookmark;
   VS_Opcao: String;
begin
   if ((Column.Title.Caption = 'F') or (Column.Title.Caption = 'M') or (Column.Title.Caption = 'D')) then
   begin
      bmLocal:= ClientDataSet_Facil.GetBookMark;
      ClientDataSet_Facil.Edit;
      if Column.Title.Caption = 'F' then
      begin
         if Trim(ClientDataSet_Facil.FieldByName('Sel_F').AsString) <> '' then
         begin
            if ClientDataSet_Facil.FieldByName('Sel_F').AsString = '1' then
            begin
               ClientDataSet_Facil.FieldByName('Sel_F').AsString:= '0';
               VS_Opcao:= '-';
               Panel_TotalQuestoesFaceis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesFaceis.Caption)-1);
            end
            else
            begin
               ClientDataSet_Facil.FieldByName('Sel_F').AsString:= '1';
               VS_Opcao:= '+';
               Panel_TotalQuestoesFaceis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesFaceis.Caption)+1);
            end;
         end;

         if StrToInt(Panel_TotalQuestoesFaceis.Caption) > StrToInt(MaskEdit_Tot_Faceis.Text) then
         begin
            ShowMessage('Foi selecionado mais questões fáceis do que o número especificado para fáceis ...');
            Panel_TotalQuestoesFaceis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesFaceis.Caption)-1);
            ClientDataSet_Facil.FieldByName('Sel_F').AsString:= '0';
         end
         else
         begin
            AtualizarNQuestoesSelecionada(ClientDataSet_Facil.FieldByName('Materia').AsString, VS_Opcao );
         end;
      end
      else
      begin
         if Column.Title.Caption = 'M' then
         begin
            if Trim(ClientDataSet_Facil.FieldByName('Sel_M').AsString) <> '' then
            begin
               if ClientDataSet_Facil.FieldByName('Sel_M').AsString = '1'  Then
               begin
                  ClientDataSet_Facil.FieldByName('Sel_M').AsString:= '0';
                  VS_Opcao:= '-';
                  Panel_TotalQuestoesMedias.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesMedias.Caption)- 1);
               end
               else
               begin
                  ClientDataSet_Facil.FieldByName('Sel_M').AsString:= '1';
                  VS_Opcao:= '+';
                  Panel_TotalQuestoesMedias.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesMedias.Caption)+ 1);
               end;
            end;

            if StrToInt(Panel_TotalQuestoesMedias.Caption) > StrToInt(MaskEdit_Tot_Medias.Text) then
            begin
               ShowMessage('Foi selecionado mais questões médias do que o número especificado para médias...');
               Panel_TotalQuestoesMedias.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesMedias.Caption)-1);
               ClientDataSet_Facil.FieldByName('Sel_M').AsString:= '0';
            end
            else
            begin
               AtualizarNQuestoesSelecionada(ClientDataSet_Facil.FieldByName('Materia').AsString, VS_Opcao );
            end;
         end
         else
         begin
            if Column.Title.Caption = 'D' then
            begin
               if Trim(ClientDataSet_Facil.FieldByName('Sel_D').AsString) <> '' then
               begin
                  if ClientDataSet_Facil.FieldByName('Sel_D').AsString = '1' then
                  begin
                     ClientDataSet_Facil.FieldByName('Sel_D').AsString:= '0';
                     VS_Opcao:= '-';
                     Panel_TotalQuestoesDificeis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesDificeis.Caption)-1);
                  end
                  else
                  begin
                     ClientDataSet_Facil.FieldByName('Sel_D').AsString:= '1';
                     VS_Opcao:= '+';
                     Panel_TotalQuestoesDificeis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesDificeis.Caption)+1);
                  end;
               end;

               if StrToInt(Panel_TotalQuestoesDificeis.Caption) > StrToInt(MaskEdit_Tot_Dificeis.Text) then
               begin
                  ShowMessage('Foi selecionado mais questões dif;eceis do que o número especificado para difíceis...');
                  Panel_TotalQuestoesDificeis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesDificeis.Caption)-1);
                  ClientDataSet_Facil.FieldByName('Sel_D').AsString:= '0';
               end
               else
               begin
                  AtualizarNQuestoesSelecionada(ClientDataSet_Facil.FieldByName('Materia').AsString, VS_Opcao );
               end;
            end;
         end;
      end;
      ClientDataSet_Facil.Post;
      Column.Color:= ClYellow;
      ClientDataSet_Facil.GotoBookMark(bmLocal);
      ClientDataSet_Facil.FreeBookMark(bmLocal);
   end;
   Edit_Escape.SetFocus; // Não faz nada
end;


//------------------------------------------------------------------------------
//
// Tratamento para calcular a quantidade de questoes
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Rotina para calcular a quantidade de questoes
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.CalcularQuantidadeQuestoes;
begin
   Label_TotalPor.Caption:= FloatToStr(StrToFloat(MaskEdit_Por_Dificeis.Text)+StrToFloat(MaskEdit_Por_Medias.Text)+StrToFloat(MaskEdit_Por_Faceis.Text));
   if ((StrToFloat(Label_TotalPor.Caption) > 100) or (StrToFloat(Label_TotalPor.Caption) <= 0)) then
   begin
      if StrToFloat(Label_TotalPor.Caption) > 100 then
         ShowMessage('A quantidade máxima de questões não pode ser maior que 100% ...')
      else
         if StrToFloat(Label_TotalPor.Caption) <= 0 then
            ShowMessage('A quantidade mínima de questões não pode ser menor que 0% ...');
      MaskEdit_Por_Faceis.SetFocus;
   end
   else
   begin
      Label_TotalPor.Caption:= trim(Label_TotalPor.Caption)+' %';
      MaskEdit_Tot_Dificeis.Text:= IntToStr(Round((StrToFloat(MaskEdit_Por_Dificeis.Text)* StrToFloat(MaskEdit_Especificadas.Text))/100));
      MaskEdit_Tot_Medias.Text:= IntToStr(Round((StrToFloat(MaskEdit_Por_Medias.Text)* StrToFloat(MaskEdit_Especificadas.Text))/100));
      MaskEdit_Tot_Faceis.Text:= IntToStr(Round((StrToFloat(MaskEdit_Por_Faceis.Text)* StrToFloat(MaskEdit_Especificadas.Text))/100));

      CalcularTotalItensSelecionado;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da quantidade de questoes
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.TratarQuantidadeDeQuestoes(MaskEdit_Por: TMaskEdit; VS_TipoQuestoes: String);
begin
   if MaskEdit_Por.Text = '' then
   begin
      ShowMessage('Não foi fornecido o valor para as questões '+VS_TipoQuestoes+'...');
      MaskEdit_Por.SetFocus;
   end
   else
   begin
      if ((StrToInt(MaskEdit_Por.Text) > 100) or (StrToInt(MaskEdit_Por.Text) <= 0)) then
      begin
         if StrToInt(MaskEdit_Por.Text) > 100 then
            ShowMessage('A quantidade máxima de questões '+VS_TipoQuestoes+' não pode ser maior que 100% ...')
         else
            if StrToInt(MaskEdit_Por.Text) <= 0 then
               ShowMessage('A quantidade mínima de questões '+VS_TipoQuestoes+' não pode ser menor que 0% ...');
         MaskEdit_Por.Text:= '';
         MaskEdit_Por.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para tratar as questoes faceis
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.MaskEdit_EspecificadasKeyPress(Sender: TObject; var Key: Char);
begin
   if MaskEdit_Especificadas.Text = '' then
   begin
      ShowMessage('Não foi fornecido valor para as número de questões  ...');
      MaskEdit_Especificadas.SetFocus;
   end
   else
   begin
      if StrToInt(MaskEdit_Especificadas.Text) > 100 then
         ShowMessage('A quantidade máxima de questões não pode ser maior que 100 ...')
      else
         CalcularQuantidadeQuestoes;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para tratar as questoes faceis
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.MaskEdit_Por_FaceisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
   begin
      TratarQuantidadeDeQuestoes(MaskEdit_Por_Faceis, 'Fáceis');
      CalcularQuantidadeQuestoes;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para tratar as questoes Medias
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.MaskEdit_Por_MediasKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
   begin
      TratarQuantidadeDeQuestoes(MaskEdit_Por_Medias, 'Médias');
      CalcularQuantidadeQuestoes;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para tratar as questoes Medias
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.MaskEdit_Por_DificeisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
   begin
      TratarQuantidadeDeQuestoes(MaskEdit_Por_Dificeis, 'Difíceis');
      CalcularQuantidadeQuestoes;
   end;
end;

procedure TForm_MontarProvaEletronica.MaskEdit_Tot_FaceisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
       CalcularTotalItensSelecionado;
end;

procedure TForm_MontarProvaEletronica.MaskEdit_Tot_MediasKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
       CalcularTotalItensSelecionado;
end;

procedure TForm_MontarProvaEletronica.MaskEdit_Tot_DificeisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
       CalcularTotalItensSelecionado;
end;


//------------------------------------------------------------------------------
//
// Tratamento para Montar a Prova Automaticamente
//
//------------------------------------------------------------------------------


procedure TForm_MontarProvaEletronica.MontarProva;
var
   VI_SelItem, VI_Cont, VI_Tentativa: Integer;
   Qtd_Letras, Qtd_A, Qtd_B, Qtd_C, Qtd_D: Integer;
   VB_Grava: boolean;
   VS_RespostaCorreta: String;
begin
   ZerarSelecoes;

   Qtd_Letras:= StrToInt(MaskEdit_Tot_Faceis.Text) div 4;
   Qtd_A:= Qtd_Letras;
   Qtd_B:= Qtd_Letras;
   Qtd_C:= Qtd_Letras;
   Qtd_D:= StrToInt(MaskEdit_Tot_Faceis.Text)-(Qtd_Letras*3);

   VI_Tentativa:= 150;
   VI_Cont:= 0;
   While VI_Cont < StrToInt(MaskEdit_Tot_Faceis.Text) do
   begin
      VB_Grava:= False;
      VI_SelItem:= StrToInt(Randomico(400));
      ClientDataSet_Facil.Locate('NumItem_F', NumItem_F[VI_SelItem], []);

      //--- Tratamento para selecao de itens faceis

      if  ClientDataSet_Facil.FieldByName('NumItem_F').AsString <> '' then
      begin
         if ((Trim(ClientDataSet_Facil.FieldByName('Sel_F').AsString) <> '1')) then
         begin
           VS_RespostaCorreta:= Busca_RespostaCorreta(ClientDataSet_Facil.FieldByName('NumItem_F').AsString);

           if ((Qtd_A > 0 ) and ( VS_RespostaCorreta = 'A')) then
           begin
              if VI_Tentativa = 0 then
              begin
                 VI_Tentativa:= 150;
                 Qtd_D:= Qtd_D + Qtd_A;
                 Qtd_A:= 0;
              end
              else
              begin
                 Qtd_A:= Qtd_A-1;
                 VB_Grava:= True;
              end;
           end
           else
           begin
              if ((Qtd_B > 0 ) and ( VS_RespostaCorreta = 'B')) then
              begin
                 if VI_Tentativa = 0 then
                 begin
                    VI_Tentativa:= 150;
                    Qtd_D:= Qtd_D + Qtd_B;
                    Qtd_B:= 0;
                 end
                 else
                 begin
                    Qtd_B:= Qtd_B-1;
                    VB_Grava:= True;
                 end;
              end
              else
              begin
                 if ((Qtd_C > 0 ) and ( VS_RespostaCorreta = 'C')) then
                 begin
                    if VI_Tentativa = 0 then
                    begin
                       VI_Tentativa:= 150;
                       Qtd_D:= Qtd_D + Qtd_C;
                       Qtd_C:= 0;
                    end
                    else
                    begin
                       Qtd_C:= Qtd_C-1;
                       VB_Grava:= True;
                    end;
                 end
                 else
                 begin
                    if ((Qtd_D > 0 ) and ( VS_RespostaCorreta = 'D')) then
                    begin
                       if VI_Tentativa = 0 then
                       begin
                          Qtd_D:= 0;
                          VB_Grava:= False;
                       end
                       else
                       begin
                          Qtd_D:= Qtd_D-1;
                          VB_Grava:= True;
                       end;
                    end;
                 end;
              end;
           end;
        end;

        VI_Tentativa:= VI_Tentativa-1;
        if VB_Grava = True then
        begin
           VI_Cont:= VI_Cont+1;
           Sel_F[VI_SelItem]:= '1';

           ClientDataSet_Facil.Edit;
           ClientDataSet_Facil.FieldByName('Sel_F').AsString:= '1';
           AtualizarNQuestoesSelecionada(ClientDataSet_Facil.FieldByName('Materia').AsString, '+');
           ClientDataSet_Facil.Post;
           Panel_TotalQuestoesFaceis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesFaceis.Caption)+1);
        end;
      end;
   end;

   //-------- Tratamento da selecao das questoes Medias

   Qtd_Letras:= StrToInt(MaskEdit_Tot_Medias.Text) div 4;
   Qtd_A:= Qtd_Letras;
   Qtd_B:= Qtd_Letras;
   Qtd_C:= Qtd_Letras;
   Qtd_D:= StrToInt(MaskEdit_Tot_Medias.Text)-(Qtd_Letras*3);

   VI_Tentativa:= 150;
   VI_Cont:= 0;
   While VI_Cont < StrToInt(MaskEdit_Tot_Medias.Text) do
   begin
      VB_Grava:= False;
      VI_SelItem:= StrToInt(Randomico(400));
      ClientDataSet_Facil.Locate('NumItem_M', NumItem_M[VI_SelItem], []);

      if  ClientDataSet_Facil.FieldByName('NumItem_M').AsString <> '' then
      begin
         if ((Trim(ClientDataSet_Facil.FieldByName('Sel_M').AsString) <> '1')) then
         begin
           VS_RespostaCorreta:= Busca_RespostaCorreta(ClientDataSet_Facil.FieldByName('NumItem_M').AsString);

           if ((Qtd_A > 0 ) and ( VS_RespostaCorreta = 'A')) then
           begin
              if VI_Tentativa = 0 then
              begin
                 VI_Tentativa:= 150;
                 Qtd_D:= Qtd_D + Qtd_A;
                 Qtd_A:= 0;
              end
              else
              begin
                 Qtd_A:= Qtd_A-1;
                 VB_Grava:= True;
              end;
           end
           else
           begin
              if ((Qtd_B > 0 ) and ( VS_RespostaCorreta = 'B')) then
              begin
                 if VI_Tentativa = 0 then
                 begin
                    VI_Tentativa:= 150;
                    Qtd_D:= Qtd_D + Qtd_B;
                    Qtd_B:= 0;
                 end
                 else
                 begin
                    Qtd_B:= Qtd_B-1;
                    VB_Grava:= True;
                 end;
              end
              else
              begin
                 if ((Qtd_C > 0 ) and ( VS_RespostaCorreta = 'C')) then
                 begin
                    if VI_Tentativa = 0 then
                    begin
                       VI_Tentativa:= 150;
                       Qtd_D:= Qtd_D + Qtd_C;
                       Qtd_C:= 0;
                    end
                    else
                    begin
                       Qtd_C:= Qtd_C-1;
                       VB_Grava:= True;
                    end;
                 end
                 else
                 begin
                    if ((Qtd_D > 0 ) and ( VS_RespostaCorreta = 'D')) then
                    begin
                       if VI_Tentativa = 0 then
                       begin
                          Qtd_D:= 0;
                          VB_Grava:= False;
                       end
                       else
                       begin
                          Qtd_D:= Qtd_D-1;
                          VB_Grava:= True;
                       end;
                    end;
                 end;
              end;
           end;
        end;

        VI_Tentativa:= VI_Tentativa-1;
        if VB_Grava = True then
        begin
           VI_Cont:= VI_Cont+1;
           Sel_F[VI_SelItem]:= '1';

           ClientDataSet_Facil.Edit;
           ClientDataSet_Facil.FieldByName('Sel_M').AsString:= '1';
           AtualizarNQuestoesSelecionada(ClientDataSet_Facil.FieldByName('Materia').AsString, '+');
           ClientDataSet_Facil.Post;
           Panel_TotalQuestoesMedias.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesMedias.Caption)+1);
        end;
      end;
   end;

   //-------- Tratamento da selecao das questoes Dificeis

//   Randomize;
   Qtd_Letras:= StrToInt(MaskEdit_Tot_Dificeis.Text) div 4;
   Qtd_A:= Qtd_Letras;
   Qtd_B:= Qtd_Letras;
   Qtd_C:= Qtd_Letras;
   Qtd_D:= StrToInt(MaskEdit_Tot_Dificeis.Text)-(Qtd_Letras*3);

   VI_Tentativa:= 150;
   VI_Cont:= 0;
   While VI_Cont < StrToInt(MaskEdit_Tot_Dificeis.Text) do
   begin
      VB_Grava:= False;
      VI_SelItem:= StrToInt(Randomico(400));
      ClientDataSet_Facil.Locate('NumItem_D', NumItem_D[VI_SelItem], []);

      if  ClientDataSet_Facil.FieldByName('NumItem_D').AsString <> '' then
      begin
         if ((Trim(ClientDataSet_Facil.FieldByName('Sel_D').AsString) <> '1')) then
         begin
           VS_RespostaCorreta:= Busca_RespostaCorreta(ClientDataSet_Facil.FieldByName('NumItem_D').AsString);

           if ((Qtd_A > 0 ) and ( VS_RespostaCorreta = 'A')) then
           begin
              if VI_Tentativa = 0 then
              begin
                 VI_Tentativa:= 150;
                 Qtd_D:= Qtd_D + Qtd_A;
                 Qtd_A:= 0;
              end
              else
              begin
                 Qtd_A:= Qtd_A-1;
                 VB_Grava:= True;
              end;
           end
           else
           begin
              if ((Qtd_B > 0 ) and ( VS_RespostaCorreta = 'B')) then
              begin
                 if VI_Tentativa = 0 then
                 begin
                    VI_Tentativa:= 150;
                    Qtd_D:= Qtd_D + Qtd_B;
                    Qtd_B:= 0;
                 end
                 else
                 begin
                    Qtd_B:= Qtd_B-1;
                    VB_Grava:= True;
                 end;
              end
              else
              begin
                 if ((Qtd_C > 0 ) and ( VS_RespostaCorreta = 'C')) then
                 begin
                    if VI_Tentativa = 0 then
                    begin
                       VI_Tentativa:= 150;
                       Qtd_D:= Qtd_D + Qtd_C;
                       Qtd_C:= 0;
                    end
                    else
                    begin
                       Qtd_C:= Qtd_C-1;
                       VB_Grava:= True;
                    end;
                 end
                 else
                 begin
                    if ((Qtd_D > 0 ) and ( VS_RespostaCorreta = 'D')) then
                    begin
                       if VI_Tentativa = 0 then
                       begin
                          Qtd_D:= 0;
                          VB_Grava:= False;
                       end
                       else
                       begin
                          Qtd_D:= Qtd_D-1;
                          VB_Grava:= True;
                       end;
                    end;
                 end;
              end;
           end;
        end;

        VI_Tentativa:= VI_Tentativa-1;
        if VB_Grava = True then
        begin
           VI_Cont:= VI_Cont+1;
           Sel_F[VI_SelItem]:= '1';

           ClientDataSet_Facil.Edit;
           ClientDataSet_Facil.FieldByName('Sel_D').AsString:= '1';
           AtualizarNQuestoesSelecionada(ClientDataSet_Facil.FieldByName('Materia').AsString, '+');
           ClientDataSet_Facil.Post;
           Panel_TotalQuestoesDificeis.Caption:= IntToStr(StrToInt(Panel_TotalQuestoesDificeis.Caption)+1);
        end;
      end;
   end;

   ClientDataSet_Facil.First;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de gerar numeros aleatorio
// Data     :
//
// Atualizado em: 19/09/2005
// Descricao    : Criacao da rotina
//------------------------------------------------------------------------------

Function TForm_MontarProvaEletronica.Randomico(VI_Limite: integer): String;
var
   Resultado: integer;
begin
   Resultado:= 0;

   While Resultado = 0 do
      Resultado:= Random(VI_Limite);

   Randomico:= formatfloat('000',Resultado);
end;

//------------------------------------------------------------------------------
// Tratamento para mostrar o numero de itens selecionado por disciplina
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.AtualizarNQuestoesSelecionada(Item, VS_Opcao: String);
begin
   if ((Trim(ClientDataSet_Facil.FieldByName('Sel_F').AsString) = '') and
       (Trim(ClientDataSet_Facil.FieldByName('Sel_M').AsString) = '') and
       (Trim(ClientDataSet_Facil.FieldByName('Sel_D').AsString) = '')) then
   begin
       // Não faz nada
   end
   else
   begin
      ClientDataSet_Facil.First;
      ClientDataSet_Facil.Locate('Disciplina', Item, []);
      ClientDataSet_Facil.Edit;
      if VS_Opcao = '+' then
         ClientDataSet_Facil.FieldByName('NQuestoes').AsInteger:= ClientDataSet_Facil.FieldByName('NQuestoes').AsInteger+1
      else
         ClientDataSet_Facil.FieldByName('NQuestoes').AsInteger:= ClientDataSet_Facil.FieldByName('NQuestoes').AsInteger-1;
//      ClientDataSet_Facil.Post;

      //--- Tratamento do totalizador de itens
      if VS_Opcao = '+' then
         Panel_Selecionadas.Caption:= IntToStr(StrToInt(Panel_Selecionadas.Caption)+1)
      else
         Panel_Selecionadas.Caption:= IntToStr(StrToInt(Panel_Selecionadas.Caption)-1);
   end;
end;

//------------------------------------------------------------------------------
// Limpar matrizes
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.ZerarSelecoes;
begin

   VI_Rodadas:= VI_Rodadas+1;

   if VI_Rodadas > 1 then
   begin
      Panel_Selecionadas.Caption:= '0';
      Panel_TotalQuestoesFaceis.Caption:= '0';
      Panel_TotalQuestoesMedias.Caption:= '0';
      Panel_TotalQuestoesDificeis.Caption:= '0';

      ClientDataSet_Facil.First;
      While Not ClientDataSet_Facil.Eof do
      begin
         ClientDataSet_Facil.Edit;

         if Trim(ClientDataSet_Facil.FieldByName('NQuestoes').AsString) <> '' then
            ClientDataSet_Facil.FieldByName('NQuestoes').AsInteger:= 0;

         if Trim(ClientDataSet_Facil.FieldByName('Sel_F').AsString) <> '' then
            ClientDataSet_Facil.FieldByName('Sel_F').AsString:= '0';

         if Trim(ClientDataSet_Facil.FieldByName('Sel_M').AsString) <> '' then
            ClientDataSet_Facil.FieldByName('Sel_M').AsString:= '0';

         if Trim(ClientDataSet_Facil.FieldByName('Sel_D').AsString) <> '' then
            ClientDataSet_Facil.FieldByName('Sel_D').AsString:= '0';
         ClientDataSet_Facil.Post;
         ClientDataSet_Facil.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar o gabarito final da prova
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.MostraProvaFinal;
var
   Nivel: array[1..70] of String;           // String 1
   Materia: array[1..70] of String;         // String 6
   NumItem: array[1..70] of String;         // String (15);
   RespostaCorreta: array[1..70] of String; // String 1

   VS_RespostaCorreta: String;

   i, VI_Total, x, Prova, VI_Cont: Integer;
begin
   ClientDataSet_Prova.Active:= True;
   ClientDataSet_Prova.First;
   While not ClientDataSet_Prova.eof do
   begin
      ClientDataSet_Prova.Delete;
      ClientDataSet_Prova.Next;
   end;

   //--- Trata
   VI_Cont:= 1;
   VI_Total:= 0;
   Randomize;

   ClientDataSet_Facil.First;
   While not ClientDataSet_Facil.eof do
   begin
      if ((ClientDataSet_Facil.FieldByName('Sel_F').AsString = '1') or
         (ClientDataSet_Facil.FieldByName('Sel_M').AsString = '1') or
         (ClientDataSet_Facil.FieldByName('Sel_D').AsString = '1')) then
      begin
         if ClientDataSet_Facil.FieldByName('Sel_F').AsString = '1' then
         begin
            Prova:= GerarNumeroAleatorio;
            VI_Total:= VI_Total + 1;
            VI_Seq[VI_Cont]:= Prova;
            VI_Cont:= VI_Cont+1;

            VS_RespostaCorreta:= Busca_RespostaCorreta(ClientDataSet_Facil.FieldByName('NumItem_F').AsString);
            NIvel[Prova]:= 'F';
            Materia[Prova]:= ClientDataSet_Facil.FieldByName('Materia').AsString;
            NumItem[Prova]:= ClientDataSet_Facil.FieldByName('NumItem_F').AsString;
            RespostaCorreta[Prova]:= VS_RespostaCorreta;
         end;

         if ClientDataSet_Facil.FieldByName('Sel_M').AsString = '1' then
         begin
            Prova:= GerarNumeroAleatorio;
            VI_Total:= VI_Total + 1;
            VI_Seq[VI_Cont]:= Prova;
            VI_Cont:= VI_Cont+1;

            VS_RespostaCorreta:= Busca_RespostaCorreta(ClientDataSet_Facil.FieldByName('NumItem_M').AsString);
            NIvel[Prova]:= 'M';
            Materia[Prova]:= ClientDataSet_Facil.FieldByName('Materia').AsString;
            NumItem[Prova]:= ClientDataSet_Facil.FieldByName('NumItem_M').AsString;
            RespostaCorreta[Prova]:= VS_RespostaCorreta;
         end;

         if ClientDataSet_Facil.FieldByName('Sel_D').AsString = '1' then
         begin
            Prova:= GerarNumeroAleatorio;
            VI_Total:= VI_Total + 1;
            VI_Seq[VI_Cont]:= Prova;
            VI_Cont:= VI_Cont+1;

            VS_RespostaCorreta:= Busca_RespostaCorreta(ClientDataSet_Facil.FieldByName('NumItem_D').AsString);
            NIvel[Prova]:= 'D';
            Materia[Prova]:= ClientDataSet_Facil.FieldByName('Materia').AsString;
            NumItem[Prova]:= ClientDataSet_Facil.FieldByName('NumItem_D').AsString;
            RespostaCorreta[Prova]:= VS_RespostaCorreta;
         end;
      end;
      ClientDataSet_Facil.Next;
   end;



   For i:= 1 to VI_Total do
   begin
      ClientDataSet_Prova.Append;
      ClientDataSet_Prova.FieldByName('Nivel').AsString:= Nivel[i];
      ClientDataSet_Prova.FieldByName('Materia').AsString:= Materia[i];
      ClientDataSet_Prova.FieldByName('NumItem').AsString:= NumItem[i];
      ClientDataSet_Prova.FieldByName('RespostaCorreta').AsString:= RespostaCorreta[i];
      ClientDataSet_Prova.Post;

   end;

end;

//------------------------------------------------------------------------------
// Tratamento para gerar numero aleatorio para montar a prova
//------------------------------------------------------------------------------

Function TForm_MontarProvaEletronica.GerarNumeroAleatorio: Integer;
var
   VB_NSorteado: Boolean;
   i, VI_Total, x, Prova, VI_Cont: Integer;
begin
   Prova:= 0;
   VB_NSorteado:= True;
   While VB_NSorteado = True do
   begin
      VB_NSorteado:= False;
      Prova:= Random(StrToInt(MaskEdit_Especificadas.Text)+1);

      if Prova <= 0 then
         VB_NSorteado:= True;

      for x:= 1 to VI_Cont do
      begin
         if Prova = VI_Seq[x] then
         begin
            VB_NSorteado:= True;
            break;
         end;
      end;
   end;
   GerarNumeroAleatorio:= Prova;
end;

//------------------------------------------------------------------------------
// Limpar matrizes
//------------------------------------------------------------------------------

Function TForm_MontarProvaEletronica.Busca_RespostaCorreta(VS_NumItem: String): String;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.Sql.Clear;
   DM.IBQuery_Executa.Sql.Add('Select RespostaCorreta from Item_Desc where NumItem = '+VS_NumItem);
   DM.IBQuery_Executa.Open;
   Busca_RespostaCorreta:= DM.IBQuery_Executa.FieldByName('RespostaCorreta').AsString;
end;

//------------------------------------------------------------------------------
// Tratamento mostrar o numero total de itens
//------------------------------------------------------------------------------

procedure TForm_MontarProvaEletronica.CalcularTotalItensSelecionado;
begin
   Label_Total.Caption:= 'Total '+FloatToStr(StrToFloat(MaskEdit_Tot_Dificeis.Text)+StrToFloat(MaskEdit_Tot_Medias.Text)+StrToFloat(MaskEdit_Tot_Faceis.Text));
end;

procedure TForm_MontarProvaEletronica.JvTransparentButton_MontarProvaClick(Sender: TObject);
begin
   MontarProva;
   MostraProvaFinal;
end;

procedure TForm_MontarProvaEletronica.JvTransparentButton_HomogeneizarProvaClick(Sender: TObject);
begin
   MostraProvaFinal;
end;

end.
