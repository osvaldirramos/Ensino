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

unit MontarProvaAutomatica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient, StdCtrls,
  ComCtrls, Mask, ImgList, JvGradientCaption, jpeg, IBQuery,  Rotinas,
  IBCustomDataSet, IBTable, JvEdit, ToolWin, JvComponent, JvCaptionPanel,
  JvGradient, JvTransBtn, JvShape, JvLabel, JvBlinkingLabel;

Const
   Total_Tentativas= 5000;
   Total_Itens= 130;
type
  TDBGrid = class(DBGrids.TDBGrid);   {Classe responsável por obter novas(membros protegidos) propriedades do DBGrid}
  TForm_MontarProvaAutomatica = class(TForm)
    DSC_Facil: TDataSource;
    IBQuery_Abrangencia: TIBQuery;
    DSQ_Abrangencia: TDataSource;
    DSQ_IP_Item: TDataSource;
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
    ClientDataSet_FacilPosiciona_Cont: TStringField;
    ClientDataSet_Prova: TClientDataSet;
    ClientDataSet_ProvaNivel: TStringField;
    ClientDataSet_ProvaMateria: TStringField;
    ClientDataSet_ProvaNumItem: TStringField;
    ClientDataSet_ProvaRespostaCorreta: TStringField;
    DCDS_Prova: TDataSource;
    Panel_Principal: TPanel;
    Panel_Botoes_CabecalhoProva: TPanel;
    Label_DescricaoCurso: TLabel;
    JvGradient3: TJvGradient;
    Shape7: TShape;
    Shape3: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    Label_CodProva: TLabel;
    Label_Curso: TLabel;
    Label8: TLabel;
    Label_Turma: TLabel;
    Image_Brasao: TImage;
    Panel_TrataQuestoes: TPanel;
    Panel_Itens: TPanel;
    Panel_Cabecalho: TPanel;
    JvGradient_Cabecalho: TJvGradient;
    Label_DistribuicaoQuestoes: TLabel;
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
    DBGrid_Questoes: TDBGrid;
    Panel_Informacoes: TPanel;
    Edit_Escape: TEdit;
    Panel_InformacoesProva: TPanel;
    Splitter9: TSplitter;
    Panel_EstatisticaProva: TPanel;
    Label2: TLabel;
    JvTransparentButton_HomogeneizarProva: TJvTransparentButton;
    Panel_Selecionadas: TPanel;
    Panel_TotalQuestoesFaceis: TPanel;
    Panel_TotalQuestoesMedias: TPanel;
    Panel_TotalQuestoesDificeis: TPanel;
    JvGradientCaption2: TJvGradientCaption;
    Panel_EspecificacaoProva: TPanel;
    Label_Especificadas: TLabel;
    Label_QuestoesProva: TLabel;
    Label_Total_: TLabel;
    Label_TotalPor: TLabel;
    MaskEdit_Por_Faceis: TMaskEdit;
    MaskEdit_Por_Medias: TMaskEdit;
    MaskEdit_Por_Dificeis: TMaskEdit;
    MaskEdit_Especificadas: TMaskEdit;
    MaskEdit_Tot_Faceis: TMaskEdit;
    MaskEdit_Tot_Medias: TMaskEdit;
    MaskEdit_Tot_Dificeis: TMaskEdit;
    JvGradientCaption1: TJvGradientCaption;
    Panel_BancoQuestoes: TPanel;
    Label_Questoes_Banco: TLabel;
    Label_TotalItens: TLabel;
    Label_Banco: TLabel;
    JvGradientCaption3: TJvGradientCaption;
    MaskEdit_Total_Itens: TMaskEdit;
    MaskEdit_BD_Faceis: TMaskEdit;
    MaskEdit_BD_Medias: TMaskEdit;
    MaskEdit_BD_Dificeis: TMaskEdit;
    Panel_prova: TPanel;
    JvGradientCaption8: TJvGradientCaption;
    DBGrid4: TDBGrid;
    JvTransparentButton_MontarProva: TJvTransparentButton;
    Label1: TLabel;
    JvCaptionPanel_Ferramentas: TJvCaptionPanel;
    JvTransparentButton_Fecha_FerramentaAuxiliar: TJvTransparentButton;
    Panel11: TPanel;
    JvTransparentButton_FerramentaAplicarProvaEletronica: TJvTransparentButton;
    JvTransparentButton_Ferramenta_MontarProvaManual: TJvTransparentButton;
    Bevel2: TBevel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label_QtdItens: TLabel;
    Shape9: TShape;
    DBText_TotalItens: TDBText;
    Shape10: TShape;
    JvShape6: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_Ferramentas: TJvTransparentButton;
    Query_IP_ItemIDTURMA: TIntegerField;
    Query_IP_ItemPADRAO_PROVA: TIBStringField;
    JvGradient_Itens: TJvGradient;

    Function GerarNumeroAleatorio: Integer;
    Function Randomico(VI_Limite: integer): String;
    Function Busca_RespostaCorreta(VS_NumItem: String): String;

procedure Tratar_Item;

    Procedure CriarProva(VS_Status_Aplicacao: String);
    procedure MontarProva;
    procedure MostraProvaFinal;

    procedure ZerarSelecoes;
    procedure CarregarItens;
    procedure TratarQuantidadeDeQuestoes(MaskEdit_Por: TMaskEdit; VS_TipoQuestoes: String);
    procedure CalcularTotalItensSelecionado;
    procedure CalcularQuantidadeQuestoes;
    procedure AtualizarNQuestoesSelecionada(Item, VS_Opcao: String);

    procedure LimparMatriz;
    procedure LimparLista;
    procedure Cadastro_ItensProva( VS_Disciplina, VS_Objetivo, VS_NQuestoes, VI_Cor: String);

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
    procedure JvTransparentButton_MontarProvaClick(Sender: TObject);
    procedure JvTransparentButton_HomogeneizarProvaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_Fecha_FerramentaAuxiliarClick(Sender: TObject);
    procedure JvTransparentButton_FerramentasClick(Sender: TObject);
    procedure JvTransparentButton_Ferramenta_MontarProvaManualClick(Sender: TObject);
    procedure JvTransparentButton_FerramentaAplicarProvaEletronicaClick(Sender: TObject);
    procedure MaskEdit_Por_FaceisExit(Sender: TObject);
    procedure MaskEdit_Tot_FaceisExit(Sender: TObject);
    procedure MaskEdit_Por_FaceisEnter(Sender: TObject);
    procedure MaskEdit_Tot_FaceisEnter(Sender: TObject);
    procedure MaskEdit_Por_MediasExit(Sender: TObject);
    procedure MaskEdit_Por_MediasEnter(Sender: TObject);

  private    { Private declarations }
     VI_Seq: array[1..60] of Integer;

     Cor: Array[1..Total_Itens] of Integer;
     Disciplina: array[1..Total_Itens] of String;
     Materia: array[1..Total_Itens] of String;
     NumQuestoes: array[1..Total_Itens] of String;

     Sel_F: Array[1..Total_Itens] of String;
     NumItem_F: array[1..Total_Itens] of String;
     Conflito_F: array[1..Total_Itens] of String;
     Objetivo_F: array[1..Total_Itens] of String;

     Sel_M: Array[1..Total_Itens] of String;
     NumItem_M: array[1..Total_Itens] of String;
     Conflito_M: array[1..Total_Itens] of String;
     Objetivo_M: array[1..Total_Itens] of String;

     Sel_D: Array[1..Total_Itens] of String;
     NumItem_D: array[1..Total_Itens] of String;
     Conflito_D: array[1..Total_Itens] of String;
     Objetivo_D: array[1..Total_Itens] of String;

     Cont_Tentativas, VI_Rodadas,  Cont_F, Cont_M, Cont_D: Integer;

   Qtd_F, Qtd_M, Qtd_D, VI_Disc, Cont, VI_Cor: Integer;
   VS_Comando, VS_Sel, VS_Disciplina, VS_Objetivo: String;

  public    { Public declarations }
  end;

var
  Form_MontarProvaAutomatica: TForm_MontarProvaAutomatica;

implementation

uses Module, Se_Prova, MontaProvaEletronica;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento para
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_ICEA.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_ICEA.jpg');


   JvCaptionPanel_Ferramentas.Visible:= False;
   Label_CodProva.Caption:= Funcoes.GetCodCurso;
   Label_Turma.Caption:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString;

   VI_Rodadas:= 0;

   VS_Comando:= 'Select distinct t.IdCurso, t.IdTurma, t.Materia as CodMateria '+
                ' From TesteAbrangencia t  '+
                ' Where t.idCurso = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdCurso').AsString+
                ' and   t.IdTurma = '+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('IdTurma').AsString+
                ' and   t.FaseAplicacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('FaseAplicacao').AsString+#39+
                ' and   t.ReferenciaAvaliacao = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                ' Order By t.CodMateria ';

   Funcoes.ExecutaQuery(IBQuery_Abrangencia, VS_Comando);

   if Form_Cad_Prova.IBQuery_MontaTeste.fieldByName('Tipo_Prova').AsString = 'MISTA' then
   begin
      VS_Comando:= 'Select NumItem, IdCurso, IdTurma, CodMateria, Disciplina, Unidade, SubUnidade, Objetivo, Serie, TempoRes, RespostaCorreta,  DescEnAlt, Status, Recurso, Padrao_Prova '+
                   ' From ITEMPROVA_VIEW '+
                   ' Where IdCurso      = :IdCurso '+
                   ' and   IdTurma      = :IdTurma '+
                   ' and   CodMateria   = :CodMateria '+
                   ' and   Status       =  '+#39+'D'+#39+
                   ' and   numitem not in (select numitem from itemteste where idcurso = :IdCurso and idturma = :IdTurma) '+
                   ' Order By Disciplina, Unidade, SubUnidade, Objetivo, Serie asc ';
   end
   else
   begin
      VS_Comando:= 'Select NumItem, IdCurso, IdTurma, CodMateria, Disciplina, Unidade, SubUnidade, Objetivo, Serie, TempoRes, RespostaCorreta,  DescEnAlt, Status, Recurso, Padrao_Prova '+
                   ' From ITEMPROVA_VIEW '+
                   ' Where IdCurso      = :IdCurso '+
                   ' and   IdTurma      = :IdTurma '+
                   ' and   CodMateria   = :CodMateria '+
                   ' and   Status       =  '+#39+'D'+#39+
                   ' and   Padrao_Prova = '+#39+Form_Cad_Prova.IBQuery_MontaTeste.fieldByName('Tipo_Prova').AsString+#39+
                   ' and   numitem not in (select numitem from itemteste where idcurso = :IdCurso and idturma = :IdTurma) '+
                   ' Order By Disciplina, Unidade, SubUnidade, Objetivo, Serie asc ';
   end;

   Funcoes.ExecutaQuery(Query_IP_Item, VS_Comando);

//   Query_IP_Item.Open;

   MaskEdit_Especificadas.Text:= DBText_TotalItens.Caption;
   CarregarItens;
   CalcularQuantidadeQuestoes;
//   JvTransparentButton_MontarProvaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o Sistema e retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para ferchar o programa
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Limpar matrizes
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.LimparMatriz;
var
   i: Integer;
begin
   for i:= 1 to Total_Itens do
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
end;

//------------------------------------------------------------------------------
// Limpar matrizes
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.LimparLista;
begin
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

procedure TForm_MontarProvaAutomatica.CarregarItens;
//var
//   Qtd_F, Qtd_M, Qtd_D, VI_Disc, Cont, VI_Cor: Integer;
//   VS_Comando, VS_Sel, VS_Disciplina, VS_Objetivo: String;
begin
   LimparLista;

   Panel_Selecionadas.Caption:= '0';
   MaskEdit_BD_Faceis.Text:= '0';
   MaskEdit_BD_Medias.Text:= '0';
   MaskEdit_BD_Dificeis.Text:= '0';

      Qtd_F:= 0;
      Qtd_M:= 0;
      Qtd_D:= 0;

   VI_Cor:= 0;
   VS_Disciplina:= '';
   VS_Objetivo:= '';


   IBQuery_Abrangencia.First;
   While not IBQuery_Abrangencia.Eof do
   begin
      VS_Disciplina:= '';

      VI_Disc:= 0;
      Cont:= 0;
      Cont_F:= 0;
      Cont_M:= 0;
      Cont_D:= 0;

      LimparMatriz;

      //--- Carrega o Item na lista de selecao

      Query_IP_Item.First;
      While Not Query_IP_Item.Eof do
      begin
         if Form_Cad_Prova.IBQuery_MontaTeste.FieldByName(' Tipo_Prova').AsString = 'Mista' Then
            Tratar_Item
         else
            if Form_Cad_Prova.IBQuery_MontaTeste.FieldByName(' Tipo_Prova').AsString = Query_IP_Item.FieldByName('Padrao_Pprova').AsString then
               Tratar_Item;

//-----
//---

         Query_IP_Item.Next;
      end;
      MaskEdit_BD_Faceis.Text:= IntToStr( StrToInt(MaskEdit_BD_Faceis.Text)+Cont_F );
      MaskEdit_BD_Medias.Text:= IntToStr( StrToInt(MaskEdit_BD_Medias.Text)+Cont_M );
      MaskEdit_BD_Dificeis.Text:= IntToStr( StrToInt(MaskEdit_BD_Dificeis.Text)+Cont_D );

      Cadastro_ItensProva( VS_Disciplina, VS_Objetivo, '', IntToStr(VI_Cor) );

      IBQuery_Abrangencia.Next;
   end;

   MaskEdit_Total_Itens.Text:= IntToStr( StrToInt(MaskEdit_BD_Faceis.Text)+StrToInt(MaskEdit_BD_Medias.Text)+StrToInt(MaskEdit_BD_Dificeis.Text));

   if StrToInt( MaskEdit_Total_Itens.Text ) = 0 then
   begin
      ShowMessage('Não possuí itens disponíveis: '+#13+#13+
                  'PRINCIPAIS CAUSAS: '+#13+#13+'No Cadastro de Itens de Prova'+#13+
                  'Verificar se existem itens cadastrados, '+#13+
                  'se tiver itens cadastrados verificar se estão disponíveis, '+#13+
                  'para disponibilizar existem duas maneiras a primeira através da revisão feita pelo instrutor, '+#13+
                  'ou feita pela avaliação atraves da opção "Ferramentas" "Disponibilizar todos os itens selecionados" ');
   end;

   if ( StrToInt(MaskEdit_BD_Faceis.Text)+StrToInt(MaskEdit_BD_Medias.Text)+StrToInt(MaskEdit_BD_Dificeis.Text)) < StrToInt (DBText_TotalItens.Caption) then
      MaskEdit_Especificadas.Text:= IntToStr( StrToInt(MaskEdit_BD_Faceis.Text)+StrToInt(MaskEdit_BD_Medias.Text)+StrToInt(MaskEdit_BD_Dificeis.Text));

   Panel_Selecionadas.Caption:= IntToStr(Qtd_F+Qtd_M+Qtd_D);
   Panel_TotalQuestoesFaceis.Caption:= IntToStr(Qtd_F);
   Panel_TotalQuestoesMedias.Caption:= IntToStr(Qtd_M);
   Panel_TotalQuestoesDificeis.Caption:= IntToStr(Qtd_D);

   ClientDataSet_Facil.First;

end;

//------------------------------------------------------------------------------
// Procedure para montar o Cadastro dos Itena para ser selecionado
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.Cadastro_ItensProva( VS_Disciplina, VS_Objetivo, VS_NQuestoes, VI_Cor: String);
var
   VI_Fim, VI_Cont: Integer;
   VS_Materia: string;
Begin
   VI_Fim:= Cont_F;
   if VI_Fim < Cont_M then
      VI_Fim:= Cont_M;

   if VI_Fim < Cont_D then
      VI_Fim:= Cont_D;

   VS_Materia:= VS_Disciplina;

   for VI_Cont:= 1 to VI_Fim do
   begin
      if ((NumItem_F[VI_Cont] <> '') or (NumItem_M[VI_Cont] <> '') or (NumItem_D[VI_Cont] <> '')) then
      begin

         ClientDataSet_Facil.Append;

         ClientDataSet_Facil.FieldByName('Disciplina').AsString:= VS_Disciplina;
         ClientDataSet_Facil.FieldByName('Materia').AsString:= VS_Materia;
         ClientDataSet_Facil.FieldByName('NQuestoes').AsString:= VS_NQuestoes;
         ClientDataSet_Facil.FieldByName('Cor').AsString:= VI_Cor;
         VS_Disciplina:= '';

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

procedure TForm_MontarProvaAutomatica.DBGrid_QuestoesDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Check: Integer;
   R: TRect;
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

procedure TForm_MontarProvaAutomatica.DBGrid_QuestoesCellClick(Column: TColumn);
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

procedure TForm_MontarProvaAutomatica.CalcularQuantidadeQuestoes;
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

      if Panel_Selecionadas.Caption <> '0' then
      begin
         MaskEdit_Por_Faceis.Text:= ' -';
         MaskEdit_Por_Medias.Text:= ' -';
         MaskEdit_Por_Dificeis.Text:= ' -';

         MaskEdit_Especificadas.Text:= Panel_Selecionadas.Caption;
         MaskEdit_Tot_Faceis.Text:= Panel_TotalQuestoesFaceis.Caption;
         MaskEdit_Tot_Medias.Text:= Panel_TotalQuestoesMedias.Caption;
         MaskEdit_Tot_Dificeis.Text:= Panel_TotalQuestoesDificeis.Caption;
      end
      else
      begin
         MaskEdit_Tot_Dificeis.Text:= IntToStr(Round((StrToFloat(MaskEdit_Por_Dificeis.Text)* StrToFloat(MaskEdit_Especificadas.Text))/100));
         MaskEdit_Tot_Medias.Text:= IntToStr(Round((StrToFloat(MaskEdit_Por_Medias.Text)* StrToFloat(MaskEdit_Especificadas.Text))/100));
         MaskEdit_Tot_Faceis.Text:= IntToStr(Round((StrToFloat(MaskEdit_Por_Faceis.Text)* StrToFloat(MaskEdit_Especificadas.Text))/100));
      end;
      
      CalcularTotalItensSelecionado;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da quantidade de questoes
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.TratarQuantidadeDeQuestoes(MaskEdit_Por: TMaskEdit; VS_TipoQuestoes: String);
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

procedure TForm_MontarProvaAutomatica.MaskEdit_EspecificadasKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      if MaskEdit_Especificadas.Text = '' then
      begin
         ShowMessage('Não foi fornecido valor para as número de questões  ...');
         MaskEdit_Especificadas.SetFocus;
      end
      else
      begin

         if StrToInt(MaskEdit_Especificadas.Text) = StrToInt(DBText_TotalItens.Caption) then
            ShowMessage('A quantidade máxima de questões não pode ser maior que '+DBText_TotalItens.Caption+'...')
         else
            CalcularQuantidadeQuestoes;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para tratar as questoes faceis
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.MaskEdit_Por_FaceisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
   begin
      TratarQuantidadeDeQuestoes(MaskEdit_Por_Faceis, 'Fáceis');
      CalcularQuantidadeQuestoes;
   end;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Por_FaceisExit(Sender: TObject);
begin
      TratarQuantidadeDeQuestoes(MaskEdit_Por_Faceis, 'Fáceis');
      CalcularQuantidadeQuestoes;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Por_FaceisEnter(Sender: TObject);
begin
  MaskEdit_Por_Faceis.SelectAll;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para tratar as questoes Medias
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.MaskEdit_Por_MediasKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
   begin
      TratarQuantidadeDeQuestoes(MaskEdit_Por_Medias, 'Médias');
      CalcularQuantidadeQuestoes;
   end;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Por_MediasExit(Sender: TObject);
begin
   TratarQuantidadeDeQuestoes(MaskEdit_Por_Medias, 'Médias');
   CalcularQuantidadeQuestoes;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Por_MediasEnter(Sender: TObject);
begin
   MaskEdit_Por_Medias.SelectAll;
end;

//------------------------------------------------------------------------------
// Tratamento da chamada para tratar as questoes Medias
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.MaskEdit_Por_DificeisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
   begin
      TratarQuantidadeDeQuestoes(MaskEdit_Por_Dificeis, 'Difíceis');
      CalcularQuantidadeQuestoes;
   end;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Tot_FaceisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
       CalcularTotalItensSelecionado;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Tot_FaceisExit(Sender: TObject);
begin
   CalcularTotalItensSelecionado;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Tot_FaceisEnter(Sender: TObject);
begin
   MaskEdit_Tot_Faceis.SelectAll;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Tot_MediasKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
       CalcularTotalItensSelecionado;
end;

procedure TForm_MontarProvaAutomatica.MaskEdit_Tot_DificeisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
       CalcularTotalItensSelecionado;
end;

//------------------------------------------------------------------------------
//
// Tratamento para Montar a Prova Automaticamente
//
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.MontarProva;
var
   VI_SelItem, VI_Cont, VI_Tentativa: Integer;
   Qtd_Letras, Qtd_A, Qtd_B, Qtd_C, Qtd_D: Integer;
   VB_Grava: boolean;
   VS_Msg, VS_RespostaCorreta: String;
begin
   ZerarSelecoes;

   VS_Msg:= '';
   Qtd_Letras:= StrToInt(MaskEdit_Tot_Faceis.Text) div 4;
   Qtd_A:= Qtd_Letras;
   Qtd_B:= Qtd_Letras;
   Qtd_C:= Qtd_Letras;
   Qtd_D:= StrToInt(MaskEdit_Tot_Faceis.Text)-(Qtd_Letras*3);

   VI_Tentativa:= 150;
   Cont_Tentativas:= 0;
   VI_Cont:= 0;
   While VI_Cont < StrToInt(MaskEdit_Tot_Faceis.Text) do
   begin
      if Cont_Tentativas > Total_Tentativas then
         VI_Cont:= Total_Tentativas;
      Cont_Tentativas:= Cont_Tentativas+1;

      VB_Grava:= False;
      VI_SelItem:= StrToInt(Randomico(Total_Itens));
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
           Update;
        end;
      end;
   end;
   Update;

   if Cont_Tentativas > Total_Tentativas then
       VS_Msg:= 'Não Possuí itens fáceis suficiente para montar as questões fáceis...'+#13;

   //-------- Tratamento da selecao das questoes Medias

   Cont_Tentativas:= 0;
   Qtd_Letras:= StrToInt(MaskEdit_Tot_Medias.Text) div 4;
   Qtd_A:= Qtd_Letras;
   Qtd_B:= Qtd_Letras;
   Qtd_C:= Qtd_Letras;
   Qtd_D:= StrToInt(MaskEdit_Tot_Medias.Text)-(Qtd_Letras*3);

   VI_Tentativa:= 150;
   VI_Cont:= 0;
   While VI_Cont < StrToInt(MaskEdit_Tot_Medias.Text) do
   begin
      if Cont_Tentativas > Total_Tentativas then
         VI_Cont:= Total_Tentativas;
      Cont_Tentativas:= Cont_Tentativas+1;

      VB_Grava:= False;
      VI_SelItem:= StrToInt(Randomico(Total_Itens));
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
   Update;
   if Cont_Tentativas > Total_Tentativas then
       VS_Msg:= VS_Msg+'Não Possuí itens médios suficiente para montar as questões médias...'+#13;

   //-------- Tratamento da selecao das questoes Dificeis

   Qtd_Letras:= StrToInt(MaskEdit_Tot_Dificeis.Text) div 4;
   Qtd_A:= Qtd_Letras;
   Qtd_B:= Qtd_Letras;
   Qtd_C:= Qtd_Letras;
   Qtd_D:= StrToInt(MaskEdit_Tot_Dificeis.Text)-(Qtd_Letras*3);

   VI_Tentativa:= 150;
   VI_Cont:= 0;
   While VI_Cont < StrToInt(MaskEdit_Tot_Dificeis.Text) do
   begin
      if Cont_Tentativas > Total_Tentativas then
         VI_Cont:= Total_Tentativas;
      Cont_Tentativas:= Cont_Tentativas+1;

      VB_Grava:= False;
      VI_SelItem:= StrToInt(Randomico(Total_Itens));
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

   if Cont_Tentativas > Total_Tentativas then
       VS_Msg:= VS_Msg+'Não Possuí itens dificeis suficiente para montar as questões dificeis na prova...'+#13;

   if VS_Msg <> '' then
       ShowMessage('De acordo com as regras para montar a prova: '+#13+#13+VS_Msg+#13+#13+'Será necessário definir as questões faltantes na mão...');

   ClientDataSet_Facil.First;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de gerar numeros aleatorio
// Data     :
//
// Atualizado em: 19/09/2005
// Descricao    : Criacao da rotina
//------------------------------------------------------------------------------

Function TForm_MontarProvaAutomatica.Randomico(VI_Limite: integer): String;
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

procedure TForm_MontarProvaAutomatica.AtualizarNQuestoesSelecionada(Item, VS_Opcao: String);
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

procedure TForm_MontarProvaAutomatica.ZerarSelecoes;
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

procedure TForm_MontarProvaAutomatica.MostraProvaFinal;
var
   Nivel: array[1..60] of String;           // String 1
   Materia: array[1..60] of String;         // String 6
   NumItem: array[1..60] of String;         // String (15);
   RespostaCorreta: array[1..60] of String; // String 1

   VS_RespostaCorreta: String;

   i, VI_Total, x, Prova, VI_Cont: Integer;
begin
   for i := 1 to 60 do
   begin
       VI_Seq[i]:= 0;
       Nivel[i]:= '';
       Materia[i]:= '';
       NumItem[i]:= '';
       RespostaCorreta[i]:= '';
   end;

   ClientDataSet_Prova.Active:= True;
   ClientDataSet_Prova.First;
   While not ClientDataSet_Prova.eof do
   begin
      ClientDataSet_Prova.Delete;
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

   For i:= 1 to 60 do
   begin
      if trim(Materia[i]) <> '' then
      begin
         ClientDataSet_Prova.Append;
         ClientDataSet_Prova.FieldByName('Nivel').AsString:= Nivel[i];
         ClientDataSet_Prova.FieldByName('Materia').AsString:= Materia[i];
         ClientDataSet_Prova.FieldByName('NumItem').AsString:= NumItem[i];
         ClientDataSet_Prova.FieldByName('RespostaCorreta').AsString:= RespostaCorreta[i];
         ClientDataSet_Prova.Post;
      end;
   end;

   ClientDataSet_Facil.First;
   ClientDataSet_Prova.First;
end;

//------------------------------------------------------------------------------
// Tratamento para gerar numero aleatorio para montar a prova
//------------------------------------------------------------------------------

Function TForm_MontarProvaAutomatica.GerarNumeroAleatorio: Integer;
var
   VB_NSorteado: Boolean;
   i, x, Prova, VI_Cont: Integer;
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
// Busca a resposta Correta do item selecionado
//------------------------------------------------------------------------------

Function TForm_MontarProvaAutomatica.Busca_RespostaCorreta(VS_NumItem: String): String;
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

procedure TForm_MontarProvaAutomatica.CalcularTotalItensSelecionado;
begin
   MaskEdit_Especificadas.Text:= FloatToStr(StrToFloat(MaskEdit_Tot_Dificeis.Text)+StrToFloat(MaskEdit_Tot_Medias.Text)+StrToFloat(MaskEdit_Tot_Faceis.Text));
end;

procedure TForm_MontarProvaAutomatica.JvTransparentButton_MontarProvaClick(Sender: TObject);
begin
   if StrToInt(MaskEdit_Especificadas.Text) > StrToInt(DBText_TotalItens.Caption) then
      ShowMessage('O total de itens especificado ('+MaskEdit_Especificadas.Text+' ) é maior que o definido na prova ('+DBText_TotalItens.Caption+' )....')
   else
      if StrToInt(MaskEdit_Especificadas.Text) < StrToInt(DBText_TotalItens.Caption) then
         ShowMessage('O total de itens especificado ('+MaskEdit_Especificadas.Text+' ) é menor que o definido na prova ('+DBText_TotalItens.Caption+' )....')
      else
         if StrToInt(MaskEdit_Especificadas.Text) > StrToInt(MaskEdit_Total_Itens.Text) then
            ShowMessage('O total de itens especificados para montar a prova é maior que o número de disponíveis no banco....')
         else
            if StrToInt(MaskEdit_Tot_Faceis.Text) > StrToInt(MaskEdit_BD_Faceis.Text) then
               ShowMessage('O número de Itens Fáceis especificados para montar a prova é maior que o número de disponíveis no banco....')
            else
               if StrToInt(MaskEdit_Tot_Medias.Text) > StrToInt(MaskEdit_BD_Medias.Text) then
                  ShowMessage('O número de Itens médios especificados para montar a prova é maior que o número de disponíveis no banco....')
               else
                  if StrToInt(MaskEdit_Tot_Dificeis.Text) > StrToInt(MaskEdit_BD_Dificeis.Text) then
                     ShowMessage('O número de Itens Dificeis especificados para montar a prova é maior que o número de disponíveis no banco....')
                  else
                   begin
                     if StrToInt(MaskEdit_Total_Itens.Text) = 0 then
                        ShowMessage('Não possuí item para montar aprova....')
                     else
                     begin
                        MontarProva;
                        if Panel_Selecionadas.Caption = MaskEdit_Especificadas.Text then
                           MostraProvaFinal;
                     end;
                  end;
end;

procedure TForm_MontarProvaAutomatica.JvTransparentButton_HomogeneizarProvaClick(Sender: TObject);
begin
   if StrToInt(MaskEdit_Total_Itens.Text) = 0 then
      ShowMessage('Não possuí item para montar aprova....')
   else
      if StrToInt(Panel_Selecionadas.Caption) > StrToInt(DBText_TotalItens.Caption) then
         ShowMessage('O total de itens selcionados ('+Panel_Selecionadas.Caption+' ) é maior que o definido na prova ('+DBText_TotalItens.Caption+' )....')
      else
         if StrToInt(Panel_Selecionadas.Caption) < StrToInt(DBText_TotalItens.Caption) then
            ShowMessage('O total de itens selcionados ('+Panel_Selecionadas.Caption+' ) é menor que o definido na prova ('+DBText_TotalItens.Caption+' )....')
         else
            MostraProvaFinal;
end;

//------------------------------------------------------------------------------
//
// --- Tratamento das ferramentas para montagem da prova
//
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.JvTransparentButton_Fecha_FerramentaAuxiliarClick(Sender: TObject);
begin
   JvCaptionPanel_Ferramentas.Visible:= False;
end;

procedure TForm_MontarProvaAutomatica.JvTransparentButton_FerramentasClick(Sender: TObject);
begin
   JvCaptionPanel_Ferramentas.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para criar a prova
//------------------------------------------------------------------------------

Procedure TForm_MontarProvaAutomatica.CriarProva(VS_Status_Aplicacao: String);
var
   VI_Questao: Integer;
begin
   Funcoes.ExecusaoQuery(' Delete from ItemTeste Where IdCurso = '+Form_Cad_Prova.Table_Teste.FieldByName('IdCurso').AsString+
                                        ' and IdTurma = '+Form_Cad_Prova.Table_Teste.FieldByName('IdTurma').AsString+
                                        ' and FaseAplicacao = '+#39+Form_Cad_Prova.Table_Teste.FieldByName('FaseAplicacao').AsString+#39+
                                        ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                        ' and CodMateria = '+#39+Form_Cad_Prova.Table_Teste.FieldByName('CodMateria').AsString+#39
                        );

   VI_Questao:= 0;

   ClientDataSet_Prova.First;
   While not ClientDataSet_Prova.Eof do
   begin
      VI_Questao:= VI_Questao+1;
      Funcoes.ExecusaoQuery('Insert into ItemTeste ( IdCurso,IdTurma, FaseAplicacao, ReferenciaAvaliacao, CodMateria, Materia, numItem, NumeroQuestao) '+
                               ' Values   ( '+Form_Cad_Prova.Table_Teste.FieldByName('IdCurso').AsString+
                                         ', '+Form_Cad_Prova.Table_Teste.FieldByName('IdTurma').AsString+
                                      ', '+#39+Form_Cad_Prova.Table_Teste.FieldByName('FaseAplicacao').AsString+#39+
                                      ', '+#39+Form_Cad_Prova.Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                                      ', '+#39+Form_Cad_Prova.Table_Teste.FieldByName('CodMateria').AsString+#39+
                                      ', '+#39+Form_Cad_Prova.IBQuery_Abrangencia.FieldByName('Materia').AsString+#39+
                                      ', '+ClientDataSet_Prova.FieldByName('NumItem').AsString+
                                      ', '+IntToStr(VI_Questao)+')'
                           );
      ClientDataSet_Prova.Next;
   end;

   Form_Cad_Prova.Table_Teste.Edit;
   Form_Cad_Prova.Table_Teste.FieldByName('TOTALITENS').AsInteger:= VI_Questao;
   Form_Cad_Prova.Table_Teste.FieldByName('Status_Aplicacao').AsString:= VS_Status_Aplicacao;
   Form_Cad_Prova.Table_Teste.Post;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de criar a prova em papel
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.JvTransparentButton_Ferramenta_MontarProvaManualClick(Sender: TObject);
begin
   CriarProva('EM PAPEL');
   JvTransparentButton_FecharClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de criar eletronica
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.JvTransparentButton_FerramentaAplicarProvaEletronicaClick(Sender: TObject);
begin
   CriarProva('STANDY BY');

   Application.CreateForm(TForm_MontaProvaEletronica, Form_MontaProvaEletronica);
   Form_MontaProvaEletronica.ShowModal;
   Form_MontaProvaEletronica.Free;
   Funcoes.TrimAppMemorySize;
   JvTransparentButton_FecharClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da do item de acordo com a lista que sera apresentada
//------------------------------------------------------------------------------

procedure TForm_MontarProvaAutomatica.Tratar_Item;
begin
         //VS_Comando:= ' Select count(1) as Qtd from ItemTeste '+
         //             ' Where IdCurso = '+Form_Cad_Prova.Table_Teste.FieldByName('IdCurso').AsString+
         //             ' and IdTurma = '+Form_Cad_Prova.Table_Teste.FieldByName('IdTurma').AsString+
         //             ' and ReferenciaAvaliacao <> '+#39+Form_Cad_Prova.Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
         //             ' and NumItem = '+Query_IP_Item.FieldByName('NumItem').AsString;
         //
         //Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);
        // if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then
         //begin

            VI_Disc:= VI_Disc +1;   // Contador matriz

            if IBQuery_Abrangencia.FieldByName('CodMateria').AsString <> VS_Disciplina then
            begin
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

            // Seta o item selecionado quando este pertence a prova

            VS_Comando:= ' Select count(1) as Qtd from ItemTeste '+
                         ' Where IdCurso = '+Form_Cad_Prova.Table_Teste.FieldByName('IdCurso').AsString+
                         ' and IdTurma = '+Form_Cad_Prova.Table_Teste.FieldByName('IdTurma').AsString+
                         ' and ReferenciaAvaliacao = '+#39+Form_Cad_Prova.Table_Teste.FieldByName('ReferenciaAvaliacao').AsString+#39+
                         ' and NumItem = '+Query_IP_Item.FieldByName('NumItem').AsString;

            Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);
            if DM.IBQuery_Executa.FieldByName('Qtd').AsInteger = 0 then
               VS_Sel:= '0'
            else
               VS_Sel:= '1';

            // Pega o Indice de Facilidade da Prova

            VS_Comando:= 'Select avg(indicefacilidade) as Indice from indice_item '+
                      ' Where NumItem = '+Query_IP_Item.FieldByName('NumItem').AsString;
            Funcoes.ExecutaQuery(DM.IBQuery_Executa, VS_Comando);

            if DM.IBQuery_Executa.FieldByName('Indice').AsFloat < 0.60 then        // Facil
            begin
               if VS_Sel = '1' then
                   Qtd_F:= Qtd_F + 1;

               Cont_F:= Cont_F+1;
               Sel_F[Cont_F]:= VS_Sel;
               NumItem_F[Cont_F]:= Query_IP_Item.FieldByName('NumItem').AsString;
               Objetivo_F[Cont_F]:= Query_IP_Item.FieldByName('Objetivo').AsString;
               Conflito_F[Cont_F]:= '';
            end
            else
            begin
               if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.80 then     // Medio
               begin
                  if VS_Sel = '1' then
                     Qtd_M:= Qtd_M + 1;

                  Cont_M:= Cont_M+1;
                  Sel_M[Cont_M]:= VS_Sel;
                  NumItem_M[Cont_M]:= Query_IP_Item.FieldByName('NumItem').AsString;
                  Objetivo_M[Cont_M]:= Query_IP_Item.FieldByName('Objetivo').AsString;
                  Conflito_M[Cont_M]:= '';
               end
               else                                                                // Dificel
               begin
                  if VS_Sel = '1' then
                     Qtd_D:= Qtd_D + 1;

                  Cont_D:= Cont_D+1;
                  Sel_D[Cont_D]:= VS_Sel;
                  NumItem_D[Cont_D]:= Query_IP_Item.FieldByName('NumItem').AsString;
                  Objetivo_D[Cont_D]:= Query_IP_Item.FieldByName('Objetivo').AsString;
                  Conflito_D[Cont_M]:= '';
               end;
            end;
         //end;
end;

end.
