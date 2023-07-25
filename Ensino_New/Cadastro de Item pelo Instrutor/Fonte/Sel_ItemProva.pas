//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Sel_ItemProva.PAS                              //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da Seleção  //
//                             dos Itens da Prova.                            //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          :                                                //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/06/2012                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Sel_ItemProva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas,Rotinas_SUE, JvDlg,
  JvGrdCpt, DB, IBCustomDataSet, IBTable, Variants,
  IBQuery, JvClock, DBGrids, JvDBRichEd, Mask, JvGradient, TeEngine,
  Series, TeeProcs, Chart, DbChart, PsyRichEdit, JvEnterTab, JvEdit,
  JvCaptionPanel, JvShape, JvxClock, JvxCtrls, JvTransBtn, jpeg;

type
  TForm_Sel_ItemProva = class(TForm)
    Query_MontaMateria: TIBQuery;
    DSQ_MontaMateria: TDataSource;
    Query_ItemNUMITEM: TIntegerField;
    Query_ItemIDCURSO: TSmallintField;
    Query_ItemCODMATERIA: TIBStringField;
    Query_ItemDISCIPLINA: TIBStringField;
    Query_ItemUNIDADE: TIBStringField;
    Query_ItemSUBUNIDADE: TIBStringField;
    Query_ItemOBJETIVO: TIBStringField;
    Query_ItemSERIE: TIBStringField;
    DSQ_Item: TDataSource;
    Panel_Area: TPanel;
    Panel_Container: TPanel;
    DBGrid_Item: TDBGrid;
    Query_Item: TIBQuery;
    Panel_Funcoes: TPanel;
    Query_ItemIDTURMA: TIntegerField;
    Query_ItemSTATUS: TIBStringField;
    ImageList_SituacaoItem: TImageList;
    JvCaptionPanel_Disciplina: TJvCaptionPanel;
    DBNavigator2: TDBNavigator;
    ToolBar2: TToolBar;
    JvEdit_Materia: TJvEdit;
    JvEdit_NomeMateria: TJvEdit;
    DBGrid_Materia: TDBGrid;
    StatusBar1: TStatusBar;
    Panel_Botoes_Cadastro: TPanel;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Novo: TJvTransparentButton;
    JvShape_Revisar_Item: TJvShape;
    JvTransparentButton_Revisar: TJvTransparentButton;
    JvShape_Excluir_Item_: TJvShape;
    JvTransparentButton_Excluir_: TJvTransparentButton;
    Query_Item_Historico: TIBQuery;
    Query_Item_HistoricoDATA: TDateTimeField;
    Query_Item_HistoricoID: TIntegerField;
    Query_Item_HistoricoATIVIDADE: TIBStringField;
    Query_Item_HistoricoUSUARIO: TIBStringField;
    DST_ItemHistorico: TDataSource;
    Panel_Botoes_Principal: TPanel;
    JvShape_Atualizar: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel1: TPanel;
    Shape7: TShape;
    Label_DescricaoCurso: TJvxLabel;
    Panel_Selecao_Item: TPanel;
    MaskEdit_Disc: TJvEdit;
    MaskEdit_Unid: TJvEdit;
    MaskEdit_SubUnid: TJvEdit;
    MaskEdit_Objetivo: TJvEdit;
    MaskEdit_Serie: TJvEdit;
    DBNavigator1: TDBNavigator;
    JvxLabel_CodCurso: TJvxLabel;
    JvxLabel_Usuario: TJvxLabel;
    IBQuery_EstetisticaItens: TIBQuery;
    IBQuery_EstetisticaItensNUMITEM: TIntegerField;
    ImageList_EstatisticaItem: TImageList;
    IBQuery_IndiceItem: TIBQuery;
    IBQuery_IndiceItemNUMITEM: TIntegerField;
    IBQuery_IndiceItemDATAAVALIACAO: TDateTimeField;
    IBQuery_IndiceItemINDICEFACILIDADE: TIBBCDField;
    IBQuery_IndiceItemINDICEDIFERENCIACAO: TIBBCDField;
    IBQuery_IndiceItemINDICEOBJETIVIDADE: TIBBCDField;
    IBQuery_IndiceItemBRANCOS: TIntegerField;
    IBQuery_IndiceItemTOTALALUNOS: TIntegerField;
    Query_MontaMateriaIDCURSO: TSmallintField;
    Query_MontaMateriaIDTURMA: TIntegerField;
    Query_MontaMateriaCODMATERIA: TIBStringField;
    Query_MontaMateriaNOMEMATERIA: TIBStringField;
    Query_MontaMateriaNUMEROAULASTEORICAS: TSmallintField;
    Query_MontaMateriaNUMEROAULASPRATICAS: TSmallintField;
    JvEdit_NItem: TJvEdit;
    JvShape1: TJvShape;
    JvTransparentButton_Alterar_Senha: TJvTransparentButton;
    Panel_Informacoes_Iten: TPanel;
    JvCaptionPanel_HistoricoItem: TJvCaptionPanel;
    DBGrid_Historico: TDBGrid;
    JvCaptionPanel_EstatisticaItem_: TJvCaptionPanel;
    JvGradient1: TJvGradient;
    Image_Facill: TImage;
    LabelResultado: TLabel;
    Image_Medio: TImage;
    Image_Dificel: TImage;
    GroupBox_NItens_: TGroupBox;
    Label_QtdItens: TLabel;
    GroupBox_NumeroItensIdeal: TGroupBox;
    Label_NItensIdeal: TLabel;
    GroupBox1: TGroupBox;
    Label_Facil: TLabel;
    Label_Medio: TLabel;
    Label_Dificil: TLabel;
    Chart1: TChart;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Label_Versao: TLabel;
    JvCaptionPanel_Alerta: TJvCaptionPanel;
    Panel3: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    JvShape2: TJvShape;
    JvTransparentButton1: TJvTransparentButton;

    Function ItemEmProva(VS_IdCurso, VS_IdTurma, VS_NumItem, VS_Opcao: String): Boolean;

    procedure EstatisticaItens;
    Procedure TratarNumeroKeyPress(Sender: TObject;var Key: Char);
    procedure MontaCurso;
    procedure Containers(status: Boolean);

    procedure LimparConsulta;
    procedure MontaMateria(Sender: TObject);
    procedure MontaItem(Sender: TObject);
    procedure Finalizar;

    procedure FormActivate(Sender: TObject);
    procedure MaskEdit_ResCorretaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_ItemTitleClick(Column: TColumn);
    procedure DBGrid_MateriaTitleClick(Column: TColumn);
    procedure SpeedButton_AtualizaMateriaClick(Sender: TObject);
    procedure SpeedButton_AtualizaCadItensClick(Sender: TObject);
    procedure Query_MontaMateriaAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_MateriaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvTransparentButton_NovoClick(Sender: TObject);
    procedure JvTransparentButton_RevisarClick(Sender: TObject);
    procedure JvTransparentButton_Excluir_Click(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure IBQuery_IndiceItemAfterScroll(DataSet: TDataSet);
    procedure JvTransparentButton_Alterar_SenhaClick(Sender: TObject);
    procedure JvTransparentButton1Click(Sender: TObject);
  private
    VS_OrderByMateria, VS_OrderByItem: String;
    bmLocal : TBookmark;

  public
    VS_Opcao: string;
  end;

var
  Form_Sel_ItemProva: TForm_Sel_ItemProva;

implementation

uses Abertura, Module, Cad_ItemProva, AlterarSenha;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando ativar a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal')) then
   begin
      JvCaptionPanel_Alerta.Visible:= True;
      Label_Versao.Caption:= Versao;
      VS_OrderByMateria:= ' Order By m.CodMateria ';
      VS_OrderByItem:= ' Objetivo, Serie';

      Funcoes.SetCadCurso('ItemProva');

      VS_Opcao:= 'Consulta';

      //--- Abre as tabelas existentes

      MontaCurso;
      MontaMateria(Sender);

      IBQuery_EstetisticaItens.Open;
      Query_Item_Historico.Open;
      IBQuery_IndiceItem.Open;
      Query_Item.Open;
      MontaItem(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento quando a Form é fechada
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   Query_MontaMateria.Close;
   Query_Item.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento das Areas de Trabalho botao de atualizcao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.Containers(status: Boolean);
begin
   JvCaptionPanel_Disciplina.Enabled:= status;
   Panel_Container.Enabled:= status;
end;

//------------------------------------------------------------------------------
// Tratamento dO botao de atualizacao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_AtualizaClick( Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_MontaMateria);
   Funcoes.AtualizaQuery(Query_Item);
end;

//------------------------------------------------------------------------------
//
// Tratamento da Selecao do Curso
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MontaCurso;
begin
   Funcoes.OpenQuery( 'Select IdCurso, CodCurso, NomeCurso, Numero_Ideal_Itens '+
                         'From Curso '+
                         ' where Idcurso = '+Form_Abertura.VS_IdCurso
                       );
   Funcoes.SetNumItenIdel(DM.IBQuery_Executa.FieldByName('Numero_Ideal_Itens').AsInteger);
   JvxLabel_CodCurso.Caption:=    'Código Curso   : '+DM.IBQuery_Executa.FieldByNAme('CodCurso').AsString;
   Label_DescricaoCurso.Caption:= 'Descrição Curso: '+DM.IBQuery_Executa.FieldByNAme('NomeCurso').AsString;
   JvxLabel_Usuario.Caption:=     'Usuário        : '+Form_Abertura.VS_Instrutor;

   Funcoes.SetIdCurso(DM.IBQuery_Executa.FieldByNAme('IdCurso').AsString);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MontaMateria(Sender: TObject);
var
   VS_Comando: string;
begin
   //--- Monta query de selecao de Materia

   VS_Comando:= 'select i.IdCurso, m.IdTurma, i.Identidade, m.CodMateria, m.NomeMateria, m.NumeroAulasTeoricas, m.NumeroAulasPraticas '+
                ' From InstrutorMateria i, MateriaCurso m '+
                ' Where i.IdCurso = m.IdCurso '+
                ' and   i.CodMateria = m.CodMateria '+
                ' and   i.IdCurso = '+Form_Abertura.VS_IdCurso+
                ' and   m.IdCurso = '+Form_Abertura.VS_IdCurso+
                ' and   m.IdTurma = '+Form_Abertura.VS_IdTurma+
                ' and   i.Identidade = '+#39+Form_Abertura.VS_Identidade+#39;

   if trim(JvEdit_Materia.Text) <> '' then
      VS_Comando:= VS_Comando+' and CodMateria like '+#39+JvEdit_Materia.Text+'%'+#39;

   if trim(JvEdit_NomeMateria.Text) <> '' then
      VS_Comando:= VS_Comando+' and NomeMateria like '+#39+JvEdit_NomeMateria.Text+'%'+#39;

   Funcoes.ExecutaQuery(Query_MontaMateria, VS_Comando+VS_OrderByMateria);
end;

//------------------------------------------------------------------------------
// Tratamento da Ordenacao do Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.DBGrid_MateriaTitleClick(Column: TColumn);
var
   Sender: TObject;
begin
   if column.Title.Caption = 'Disciplina' then
       VS_OrderByMateria:= ' order by m.CodMateria'
   else
     if trim(column.Title.Caption) = 'Descrição' then
         VS_OrderByMateria:= ' order by m.NomeMateria';
   MontaMateria(Sender);
end;

//------------------------------------------------------------------------------
// Atualiza o Cadastro de Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.SpeedButton_AtualizaMateriaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_MontaMateria);
end;

//------------------------------------------------------------------------------
// Atualiza O Cadastro dos Itens
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.SpeedButton_AtualizaCadItensClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Item);
end;

//------------------------------------------------------------------------------
// Executa a pesquisa
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MontaItem(Sender: TObject);
var
   VS_Comando: String;
begin
   if Query_MontaMateria.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage('O Instrutor Selecionado não possuí Disciplina Cadastrada...'+#13+#13+'Verifique junto ao responsável na Avaliação...');
      Query_Item.Close;
      Application.Terminate;
   end
   else
   begin
      VS_Comando:= 'select distinct IdCurso, IdTurma, NumItem, CodMateria, Disciplina, Unidade, SubUnidade, Objetivo, Serie, Status '+
                  ' From Item_Prova  '+
                  ' where idCurso =  :IdCurso '+
                  ' and IdTurma = :IdTurma '+
                  ' and codMateria = :CodMateria '+
                  ' and Status <> '+#39+Excluido+#39;

      if trim(JvEdit_NItem.Text) <> '' then
         VS_Comando:= VS_Comando+' and NumItem = '+trim(JvEdit_NItem.Text);

      if trim(MaskEdit_Disc.Text) <> '' then
         VS_Comando:= VS_Comando+' and Disciplina Like '+#39+trim(UpperCase(MaskEdit_Disc.Text))+'%'+#39;

      if trim(MaskEdit_Unid.Text) <> '' then
         VS_Comando:= VS_Comando+' and Unidade Like '+#39+trim(UpperCase(MaskEdit_Unid.Text))+'%'+#39;

      if trim(MaskEdit_SubUnid.Text) <> '' then
         VS_Comando:= VS_Comando+' and SubUnidade Like '+#39+trim(UpperCase(MaskEdit_SubUnid.Text))+'%'+#39;

      if trim(MaskEdit_Objetivo.Text) <> '' then
         VS_Comando:= VS_Comando+' and Objetivo Like '+#39+trim(UpperCase(MaskEdit_Objetivo.Text))+'%'+#39;

      if trim(MaskEdit_Serie.Text) <> '' then
         VS_Comando:= VS_Comando+' and Serie Like '+#39+trim(UpperCase(MaskEdit_Serie.Text))+'%'+#39;

      Funcoes.ExecutaQuery( Query_Item, VS_Comando+' Order by '+VS_OrderByItem);
      Containers(True);
   end;
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.DBGrid_ItemTitleClick(Column: TColumn);
var
   Sender: TObject;
begin
   if column.Title.Caption = 'Nº Item' then
       VS_OrderByItem:= 'NumItem'
   else
     if trim(column.Title.Caption) = 'Disciplina' then
         VS_OrderByItem:= 'Disciplina'
     else
        if trim(column.Title.Caption) = 'Unidade' then
            VS_OrderByItem:= 'Unidade'
        else
           if trim(column.Title.Caption) = 'SubUnidade' then
              VS_OrderByItem:= 'SubUnidade'
           else
              if trim(column.Title.Caption) = 'Objetivo' then
                  VS_OrderByItem:= 'Objetivo'
              else
                 if trim(column.Title.Caption) = 'Série, Objetivo' then
                    VS_OrderByItem:= 'Serie'
                 else
                    if trim(column.Title.Caption) = 'Status' then
                       VS_OrderByItem:= 'Status, Objetivo, Serie';
   MontaItem(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para limpar a a consulta dos itens
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.LimparConsulta;
begin
   MaskEdit_Disc.Text:= '';
   MaskEdit_Unid.Text:= '';
   MaskEdit_SubUnid.Text:= '';
   MaskEdit_Objetivo.Text:= '';
   MaskEdit_Serie.Text:= '';
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_NovoClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserção';
   Application.CreateForm(TForm_Cad_ItemProva, Form_Cad_ItemProva);
   Form_Cad_ItemProva.ShowModal;
   JvTransparentButton_AtualizaClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Alterar
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_RevisarClick(Sender: TObject);
begin
   bmLocal:= Query_Item.GetBookMark;
   VS_Opcao:= 'Alteração';
   Application.CreateForm(TForm_Cad_ItemProva, Form_Cad_ItemProva);
   Form_Cad_ItemProva.ShowModal;
   JvTransparentButton_AtualizaClick(Sender);
   Query_Item.GotoBookMark(bmLocal);
   Query_Item.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Item
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_Excluir_Click(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Msg: String;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão do Item selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      bmLocal:= Query_Item.GetBookMark;

       //----
      //-- Tratamento para verificar se o Item pertence a mais de um Curso

      Funcoes.OpenQuery('Select count(1) as Qtd '+
                        ' From Curso c, Item_Prova i'+
                        ' where i.IdCurso = c.IdCurso '+
                        ' and   i.NumItem = '+Query_Item.FieldByName('NumItem').AsString
                       );
      if DM.IBQuery_Executa.FieldByName('Qtd').Asinteger = 1 then
      begin
         Funcoes.Grava_Exclusao_Item(Form_Abertura.VS_NomeGuerra, Query_Item.FieldByName('NumItem').AsString);
         Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+Excluido+#39+
                                ' Where IdCurso = '+Form_Abertura.VS_IdCurso+
                                ' and  NumItem  = '+Query_Item.FieldByName('NumItem').AsString
                              );
         Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Form_Abertura.VS_IdCurso+' and IdTurma = 0 and NumItem = '+Query_Item.FieldByName('NumItem').AsString);
      end
      else
      begin    // Tratamento quando o o item pertence  a mais de um curso
         Funcoes.OpenQuery('Select Distinct c.CodCurso,  i.CodMateria '+
                           ' From Curso c, Item_Prova i'+
                           ' where i.IdCurso = c.IdCurso '+
                           ' and   i.NumItem = '+Query_Item.FieldByName('NumItem').AsString
                          );

         if DM.IBQuery_Executa.FieldByName('CodCurso').AsString <> '' then
         begin
            VS_Msg:= ''+#13+#13;
            DM.IBQuery_Executa.First;
            While not DM.IBQuery_Executa.Eof do
            begin
               VS_Msg:= VS_Msg+DM.IBQuery_Executa.FieldByName('CodCurso').AsString+' - '+DM.IBQuery_Executa.FieldByName('CodMateria').AsString+#13;
               DM.IBQuery_Executa.Next;
            end;

            VS_Msg:= 'O Item pertence aos Cursos na disciplina: '+VS_Msg+#13+#13+' excluir o item de todos os Cursos ';
            VI_Retorno:= Application.MessageBox(PChar(VS_msg), 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

            Funcoes.Grava_Exclusao_Item(Form_Abertura.VS_NomeGuerra, Query_Item.FieldByName('NumItem').AsString);
            if VI_Retorno = IDYes then
            begin
               Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+Excluido+#39+
                                      ' Where NumItem  = '+Query_Item.FieldByName('NumItem').AsString
                                     );
               Funcoes.ExecusaoQuery('Delete from Item_Prova where IdTurma = 0 and NumItem = '+Query_Item.FieldByName('NumItem').AsString);
            end
            else
            begin
               Funcoes.ExecusaoQuery( ' Update Item_Prova set Status = '+#39+Excluido+#39+
                                      ' Where IdCurso = '+Form_Abertura.VS_IdCurso+
                                      ' and  NumItem  = '+Query_Item.FieldByName('NumItem').AsString
                                     );
               Funcoes.ExecusaoQuery('Delete from Item_Prova where IdCurso = '+Form_Abertura.VS_IdCurso+' and IdTurma = 0 and NumItem = '+Query_Item.FieldByName('NumItem').AsString);
            end;
         end;
      end;

      Funcoes.AtualizaQuery(Query_Item);
      Query_Item.GotoBookMark(bmLocal);
      Query_Item.FreeBookMark(bmLocal);
      Finalizar;
   end;
end;

//------------------------------------------------------------------------------
// Finaliza Inclusão. alteração e exclusao
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.Finalizar;
var
   Status: Boolean;
begin
   Status:= False;
   if Query_Item.RecordCount > 0 then
      Status:= True;

   JvTransparentButton_Revisar.Enabled:= Status;
//   JvTransparentButton_Excluir.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao da Disciplina mostrando a qtd de itens que a disciplina possui
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.Query_MontaMateriaAfterScroll(DataSet: TDataSet);
begin
      if Query_Item.FieldByName('IdCurso').AsString = '' then
      begin
         Image_Facill.Visible:= False;
         Image_Medio.Visible:= False;
         Image_Dificel.Visible:= False;
         LabelResultado.Caption:= '';
      End;

      if ((copy(Query_MontaMateria.FieldByName('CodMateria').AsString,5,2) = '00') and (Query_Item.FieldByName('IdCurso').AsString = '')) then
      begin
         Panel_Informacoes_Iten.Visible:= False;
      end
      else
      begin
         Panel_Informacoes_Iten.Visible:= True;

         Funcoes.OpenQuery( 'select count(1) as Qtd ' +
                            ' From Item_Prova '+
                            ' where idCurso = '+Query_MontaMateria.FieldByName('IdCurso').AsString+
                            ' and IdTurma = '+Query_MontaMateria.FieldByName('IdTurma').AsString+
                            ' and codMateria = '+#39+Query_MontaMateria.FieldByName('CodMateria').AsString+#39+
                            ' and Status <> '+#39+'E'+#39
                          );
         Label_QtdItens.Caption:= FormatFloat('###0',DM.IBQuery_Executa.FieldByName('Qtd').AsInteger);
         Label_NItensIdeal.Caption:= IntToStr( Funcoes.GetNumItenIdel*(Query_MontaMateria.FieldByName('NumeroAulasTeoricas').AsInteger+Query_MontaMateria.FieldByName('NumeroAulasPraticas').AsInteger));
         if StrToInt(Label_QtdItens.Caption) < StrToInt(Label_NItensIdeal.Caption) then
            Label_QtdItens.Color:= clRed
         else
            Label_QtdItens.Color:= $00FCF3EB;

         series6.Clear;
         series7.Clear;

         series6.Add(StrToInt(Label_QtdItens.Caption), FormatFloat('000', StrToInt(Label_QtdItens.Caption)), clTeeColor);
         series7.Add(StrToInt(Label_NItensIdeal.Caption), FormatFloat('000', StrToInt(Label_NItensIdeal.Caption)), clTeeColor);
      end;
      EstatisticaItens;
      Finalizar;
end;

//------------------------------------------------------------------------------
// Tratamento para calcular a quantidade de itens faceis, medios e dificeis
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.EstatisticaItens;
var
   VI_Facil, VI_Medio, VI_Dificiel: Integer;
begin
   VI_Facil:= 0;
   VI_Medio:= 0;
   VI_Dificiel:= 0;

   Funcoes.ExecutaQuery( IBQuery_EstetisticaItens, 'select NumItem ' +
                                                  ' From Item_Prova '+
                                                  ' where idCurso = '+Query_MontaMateria.FieldByName('IdCurso').AsString+
                                                  ' and IdTurma = '+Query_MontaMateria.FieldByName('IdTurma').AsString+
                                                  ' and codMateria = '+#39+Query_MontaMateria.FieldByName('CodMateria').AsString+#39
                        );

   IBQuery_EstetisticaItens.First;
   While not IBQuery_EstetisticaItens.Eof do
   begin
      Funcoes.OpenQuery('Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+IBQuery_EstetisticaItens.FieldByName('NumItem').AsString);

      if DM.IBQuery_Executa.FieldByName('Indice').AsString <> '' then
      begin

      if DM.IBQuery_Executa.FieldByName('Indice').AsFloat >= 0.80 then
         VI_Facil:= VI_Facil + 1
      else
         if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.60 then
            VI_Medio:= VI_Medio + 1
         else
            VI_Dificiel:= VI_Dificiel + 1;
      end;
      IBQuery_EstetisticaItens.Next;
   end;
    Label_Facil.Caption:= 'Total de Itens Faceis: '+IntToStr( VI_Facil);
    Label_Medio.Caption:= 'Total de Itens Medios: '+IntToStr( VI_Medio);
    Label_Dificil.Caption:= 'Total de Itens Dificeis: '+IntToStr( VI_Dificiel);
end;

procedure TForm_Sel_ItemProva.DBGrid_MateriaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   Funcoes.CorDBGrid(DBGrid_Materia, Rect, DataCol, Column, State );
end;

procedure TForm_Sel_ItemProva.DBGrid_ItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  Icon: TBitmap;
begin
  Icon := TBitmap.Create;
  if (Column.FieldName = 'STATUS') then
  begin
    with DBGrid_Item.Canvas do
    begin
      Brush.Color := clSilver;
      FillRect(Rect);
      if ((Query_Item.FieldByName('Status').AsString = 'D' ) or (Query_Item.FieldByName('Status').AsString = 'I' )) then
         ImageList_SituacaoItem.GetBitmap(0, Icon)
      else
         ImageList_SituacaoItem.GetBitmap(1, Icon);
      Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
    end;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento para permitir somente numero
//------------------------------------------------------------------------------

Procedure TForm_Sel_ItemProva.TratarNumeroKeyPress(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento para permitir somente letras
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.MaskEdit_ResCorretaKeyPress(Sender: TObject;var Key: Char);
begin
   if not (key in['A'..'D', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento para tratar da estatistica do Item
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.IBQuery_IndiceItemAfterScroll( DataSet: TDataSet);
begin
   Image_Facill.Visible:= False;
   Image_Medio.Visible:= False;
   Image_Dificel.Visible:= False;
   LabelResultado.Caption:= '';
   if Query_Item.FieldByName('IdCurso').AsString <> '' then
   begin
      Funcoes.OpenQuery('Select avg(indicefacilidade) as Indice from indice_item Where NumItem = '+Form_Sel_ItemProva.Query_Item.FieldByName('NumItem').AsString);

      if DM.IBQuery_Executa.FieldByName('Indice').AsFloat >= 0.80 then
      begin
         Image_Facill.Visible:= True;
         LabelResultado.Caption:= 'Estatística do Item selecionado: Fácil';
      end
      else
      begin
         if DM.IBQuery_Executa.FieldByName('Indice').AsFloat > 0.60 then
         begin
            Image_Medio.Visible:= True;
            LabelResultado.Caption:= 'Estatística do Item selecionado: Médio ';
         end
         else
         begin
            Image_Dificel.Visible:= True;
            LabelResultado.Caption:= 'Estatística do Item selecionado: Dificel ';
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de alteracao da senha
//------------------------------------------------------------------------------

procedure TForm_Sel_ItemProva.JvTransparentButton_Alterar_SenhaClick(Sender: TObject);
begin
    Form_AlterarSenha.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento para verificar se o item pertence a uma prova de uma turma ativa
//------------------------------------------------------------------------------

Function TForm_Sel_ItemProva.ItemEmProva(VS_IdCurso, VS_IdTurma, VS_NumItem, VS_Opcao: String): Boolean;
var
   VS_Msg, VS_Retorno, tmp: String;
   VB_Retorno: Boolean;
begin
   VB_Retorno:= true;
   Funcoes.OpenQuery('select t.idcurso, t.idturma, i.numitem, t.Status '+
                     ' From turma t, itemteste i '+
                     ' where  i.numitem = '+VS_NumItem+
                     ' and    t.IdCurso = i.IdCurso '+
                     ' and    t.idTurma = i.IdTurma '+
                     ' and    t.Status = '+#39+'A'+#39);
   if DM.IBQuery_Executa.FieldByNAme('idcurso').AsString <> '' then
   begin
      VB_Retorno:= False;
      ShowMessage('O Item '+VS_NumItem+' foi encontra-se em prova aplicada, não sendo permitido sua '+VS_Opcao+
                  ' preencha o registro de solicitação que a EAVA irá atender assim que possível...');
   end;
end;

procedure TForm_Sel_ItemProva.JvTransparentButton1Click(Sender: TObject);
begin
   JvCaptionPanel_Alerta.Visible:= False;
end;


end.

