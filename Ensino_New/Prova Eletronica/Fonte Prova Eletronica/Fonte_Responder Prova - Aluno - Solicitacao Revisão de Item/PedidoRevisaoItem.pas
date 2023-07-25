//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Prova Eletronica                               //
//                                                                            //
// PROGRAMA                  : Prova.PAS                                      //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade tratar aplicacao da //
//                             Prova.                                         //
//                                                                            //
// INICIO DA ELABORACAO      : 04/11/2005                                     //
// GERENTE                   : TCel Souza          Gerente                    //
//                             Osvaldir            Desenvolvedor              //
//                             Ten Mansano         Colaborador                //
//                             So Roberto          Colaborador                //
//                             So Marcos Bicudo    Colaborador                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

// midaslib,

unit PedidoRevisaoItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBTable, IBCustomDataSet, IBQuery, StdCtrls, JvRichEd, Rotinas,
  JvDBRichEd, Buttons, DBCtrls, ExtCtrls, PsyRichEdit, jpeg, ComCtrls,
  Grids, DBGrids, JvGradientCaption, JvComponent, JvxClock, DBClient,
  JvTransBtn, JvPanel, JvBalloonHint, JvGradient, JvListBox,
  JvDriveCtrls, JvClock, Mask, JvTransLED, midaslib, JvToolEdit, JvCurrEdit,
  ToolWin, JvShape, ImgList;

const
  HookDemo = 'WINHOOK.dll';
const
  WM_HOOKCREATE = WM_USER + 300;

type
  TForm_PedidoRevisaoItem = class(TForm)
    IBQuery_PedidoRevisaoItem: TIBQuery;
    DSQ_PedidoRevisaoItem: TDataSource;
    Panel_TratarProva: TPanel;
    Panel_Botoes_CabecalhoProva: TPanel;
    JvDBRichEdit_MontaItem: TJvDBRichEdit;
    Panel_EditorProva: TPanel;
    Panel_Ferramenta: TPanel;
    Label_Instrutor: TLabel;
    JvGradient3: TJvGradient;
    Shape7: TShape;
    Shape8: TShape;
    Label_Prova: TLabel;
    Label_DataProva: TLabel;
    Shape9: TShape;
    Label_Aluno: TLabel;
    Label_Curso_: TLabel;
    Label_Turma_: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Image_Brasao: TImage;
    IBTable_PedidoRevisaoItem: TIBTable;
    DST_PedidoRevisaoItem: TDataSource;
    Label_Curso: TLabel;
    Label_Turma: TLabel;
    Label_Referencia_Prova: TLabel;
    Label_Data_Prova: TLabel;
    Label_Instituto: TLabel;
    Label_Versao: TLabel;
    Panel1: TPanel;
    Shape15: TShape;
    JvGradient1: TJvGradient;
    Label1: TLabel;
    Panel_Prova: TPanel;
    Editor_Prova: TPsyRichEdit;
    DBGrid_Resultado: TDBGrid;
    Panel_PedidoRevisao: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Text1: TJvDBRichEdit;
    IBTable_PedidoRevisaoItemIDCURSO: TSmallintField;
    IBTable_PedidoRevisaoItemIDTURMA: TIntegerField;
    IBTable_PedidoRevisaoItemFASEAPLICACAO: TIBStringField;
    IBTable_PedidoRevisaoItemREFERENCIAAVALIACAO: TIBStringField;
    IBTable_PedidoRevisaoItemCODMATERIA: TIBStringField;
    IBTable_PedidoRevisaoItemIDENTIDADE: TIBStringField;
    IBTable_PedidoRevisaoItemNUMITEM: TIntegerField;
    IBTable_PedidoRevisaoItemNUMEROQUESTAO: TSmallintField;
    IBTable_PedidoRevisaoItemRESPGABARITO: TIBStringField;
    IBTable_PedidoRevisaoItemRESPALUNO: TIBStringField;
    IBTable_PedidoRevisaoItemDATAPEDIDO: TDateTimeField;
    Panel_Providencia: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    CheckBox_AnularQuestao: TCheckBox;
    CheckBox_ModificarGabarito: TCheckBox;
    CheckBox_AlternativaCorreta: TCheckBox;
    ToolBar_ModificarGabarito: TToolBar;
    ToolButton_MA: TToolButton;
    ToolButton_MB: TToolButton;
    ToolButton_MC: TToolButton;
    ToolButton_MD: TToolButton;
    ToolBar_AlternativaCorreta: TToolBar;
    ToolButton_CA: TToolButton;
    ToolButton_CB: TToolButton;
    ToolButton_CC: TToolButton;
    ToolButton_CD: TToolButton;
    IBQuery_PedidoRevisaoItemIDCURSO: TSmallintField;
    IBQuery_PedidoRevisaoItemIDTURMA: TIntegerField;
    IBQuery_PedidoRevisaoItemFASEAPLICACAO: TIBStringField;
    IBQuery_PedidoRevisaoItemREFERENCIAAVALIACAO: TIBStringField;
    IBQuery_PedidoRevisaoItemCODMATERIA: TIBStringField;
    IBQuery_PedidoRevisaoItemIDENTIDADE: TIBStringField;
    IBQuery_PedidoRevisaoItemNUMITEM: TIntegerField;
    IBQuery_PedidoRevisaoItemNUMEROQUESTAO: TSmallintField;
    IBQuery_PedidoRevisaoItemRESPGABARITO: TIBStringField;
    IBQuery_PedidoRevisaoItemRESPALUNO: TIBStringField;
    IBQuery_PedidoRevisaoItemDATAPEDIDO: TDateTimeField;
    IBQuery_PedidoRevisaoItemDESCENALT: TBlobField;
    Label5: TLabel;
    Panel_Botoes: TPanel;
    JvShape5: TJvShape;
    JvTransparentButton_GravarSolicitacao: TJvTransparentButton;
    JvShape_EncerrarProva: TJvShape;
    JvTransparentButton_EncerrarProva: TJvTransparentButton;
    IBTable_PedidoRevisaoItemARGUMENTACAO_ALUNO: TIBStringField;
    IBTable_PedidoRevisaoItemPROVIDENCIA_ALUNO: TIBStringField;
    JvShape1: TJvShape;
    JvTransparentButton_ExcluiSolicitacao: TJvTransparentButton;
    JvClock_Tempo: TJvClock;

    Function SetScreenResolution(Width, Height: integer): Longint;  // tamanho da tela

    procedure TratarSolicitacao;
    procedure LimparProvidencia;
    procedure LimparOpcoes( ToolButton_A, ToolButton_B, ToolButton_C, ToolButton_D: TToolButton);
    procedure MostraItemDaProva(VS_NumeroQuestao: String);
    procedure Trocar(Trocar: String; Por: String);

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_ResultadoCellClick(Column: TColumn);
    procedure JvTransparentButton_EncerrarProvaClick(Sender: TObject);
    procedure CheckBox_AnularQuestaoClick(Sender: TObject);
    procedure CheckBox_ModificarGabaritoClick(Sender: TObject);
    procedure CheckBox_AlternativaCorretaClick(Sender: TObject);
    procedure ToolButton_MAClick(Sender: TObject);
    procedure ToolButton_MBClick(Sender: TObject);
    procedure ToolButton_MCClick(Sender: TObject);
    procedure ToolButton_MDClick(Sender: TObject);
    procedure ToolButton_CAClick(Sender: TObject);
    procedure ToolButton_CBClick(Sender: TObject);
    procedure ToolButton_CCClick(Sender: TObject);
    procedure ToolButton_CDClick(Sender: TObject);
    procedure JvTransparentButton_GravarSolicitacaoClick(Sender: TObject);
    procedure DBGrid_ResultadoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure JvTransparentButton_ExcluiSolicitacaoClick(Sender: TObject);

  private   { Private declarations }
     oldwidth, OldHeight, Auxwidth, Auxheight:integer ;
     VB_recurso,  Fecha_Sistama: Boolean;
     VS_NumeroQuestao_old: String;

  public
    { Public declarations }
  end;
var
  Form_PedidoRevisaoItem: TForm_PedidoRevisaoItem;


implementation

uses Module;

{$R *.dfm}


//------------------------------------------------------------------------------
// Função para desabilitar alt+f4
//------------------------------------------------------------------------------

Function StatusTecla (Key: integer): boolean;
begin
   Result := Odd (GetKeyState (Key)); //Result := se a tecla for pressionada
end;


//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//------------------------------------------------------------------------------
// Tratamento da Tecla
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
   If StatusTecla (VK_LMENU) And (Key = VK_F4)  And (Key = VK_TAB) Then //Se esc e Alt+f4 for apertada
      Fecha_Sistama := False;                    //variavel fecha vai desabilitar
end;

//------------------------------------------------------------------------------
// Tratamento Quando inicia a Form
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.FormActivate(Sender: TObject);
begin
   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Brasao_Ensino.jpg');

   Label_Versao.Caption:= Versao;
   Fecha_Sistama:= False;
   VB_recurso:= False;

    //--- Ajuste do Video
   // Alterando tamanha da tela e guardando tamanho da tela do usuario p/ restaurar  22/11/2012

   EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
   begin
      if (Screen.Width =1600) and (Screen.Height = 1200) then
      begin
        // tela que se quer
        Auxwidth := 1600;
        Auxheight:= 1200;
     end
     else
     begin
        // captacao da tela antiga
        OldWidth := Screen.Width;
        OldHeight := Screen.Height;
        Auxwidth:=oldwidth;
        Auxheight:=OldHeight;

        SetScreenResolution(1600, 1200);  // ajuste da tela para a medida do programa
     end;
   end;

    //---
   //--- Seleciona os itens que foram marcados para revisao

   LimparProvidencia;

   Funcoes.ExecutaQuery( IBQuery_PedidoRevisaoItem, ' Select Pr.IdCurso, Pr.IdTurma, Pr.FaseAplicacao, Pr.ReferenciaAvaliacao, Pr.CodMateria, Pr.Identidade, '+
                                                    '        Pr.NumItem, Pr.NumeroQuestao, Pr.RespGabarito, Pr.RespAluno, Pr.DataPedido, Id.DescEnAlt '+
                                                    ' From TestePedidoRevisaoItem Pr, Item_Desc Id '+
                                                    ' where Pr.IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                                                    ' and   Pr.IdTurma = '+DM.Query_Usuario.FieldByName('IdTurma').AsString+
                                                    ' and   Pr.faseAplicacao = '+#39+DM.Query_Usuario.FieldByName('FaseAplicacao').AsString+#39+
                                                    ' and   Pr.ReferenciaAvaliacao = '+#39+DM.Query_Usuario.FieldByName('referenciaavaliacao').AsString+#39+
                                                    ' and   Pr.CodMateria = '+#39+DM.Query_Usuario.FieldByName('CodMateria').AsString+#39+
                                                    ' and   Pr.Identidade = '+#39+DM.Query_Usuario.FieldByName('Identidade').AsString+#39+
                                                    ' and   Pr.NumItem = Id.NumItem '+
                                                    ' Order By Pr.NumeroQuestao'
                       );

   IBTable_PedidoRevisaoItem.Open;
   MostraItemDaProva( IBQuery_PedidoRevisaoItem.FieldByName('NUMEROQUESTAO').AsString);
   TratarSolicitacao;

    //---
   // Pega o Nome do Curso e o Codigo da Turma

   Funcoes.OpenQuery( 'Select CodCurso, Turma '+
                      ' From Turma_Em_Andamento_View '+
                      ' Where IdCurso = '+DM.Query_Usuario.FieldByName('IdCurso').AsString+
                      ' and   Idturma = '+DM.Query_Usuario.FieldByName('Idturma').AsString
                     );

   Label_Curso.Caption:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;
   Label_Turma.Caption:= DM.IBQuery_Executa.FieldByName('Turma').AsString;

   Label_Aluno.Caption:= 'Aluno: '+DM.Query_Usuario.FieldByName('NomeCompleto').AsString;
   Label_Referencia_Prova.Caption:= DM.Query_Usuario.FieldByName('CodProva').AsString;
   Label_Data_Prova.Caption:= DM.Query_Usuario.FieldByName('DataAplicacao').AsString;
end;

//------------------------------------------------------------------------------
// Tratamento para Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_EncerrarProvaClick( Sender: TObject);
begin
  if (IBTable_PedidoRevisaoItem.State = DSInsert) and (IBTable_PedidoRevisaoItem.State = DSEdit ) then
      JvTransparentButton_GravarSolicitacaoClick(Sender);

   if VB_recurso = True then
   begin
      Funcoes.ExecusaoQuery( 'Update Teste set Status_Aplicacao = '#39+'RECURSO'+#39+
                             ' where idcurso = '+IBQuery_PedidoRevisaoItem.FieldByName('IdCurso').AsString+
                             ' and idTurma = '+IBQuery_PedidoRevisaoItem.FieldByName('IdTurma').AsString+
                             ' and FaseAplicacao = '+#39+IBQuery_PedidoRevisaoItem.FieldByName( 'FaseAplicacao').AsString+#39+
                             ' and ReferenciaAvaliacao = '+#39+IBQuery_PedidoRevisaoItem.FieldByName( 'ReferenciaAvaliacao').AsString+#39+
                             ' and CodMateria = '+#39+IBQuery_PedidoRevisaoItem.FieldByName( 'CodMateria').AsString+#39
                            );
   end;

   IBQuery_PedidoRevisaoItem.Close;
   IBTable_PedidoRevisaoItem.Close;
   Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'F_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
   Application.Terminate;
end;

//------------------------------------------------------------------------------
// Regula tamanho de tela
//------------------------------------------------------------------------------

Function TForm_PedidoRevisaoItem.SetScreenResolution(Width, Height: integer): Longint;
var
   DeviceMode: TDeviceMode;
begin
   with DeviceMode do
   begin
      dmSize := SizeOf(TDeviceMode);
      dmPelsWidth := Width;
      dmPelsHeight := Height;
      dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    end;
   Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

//------------------------------------------------------------------------------
// Mostra o Iten da Prova
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.MostraItemDaProva(VS_NumeroQuestao: String);
begin
   Editor_Prova.Lines.Clear;
   VS_NumeroQuestao_old:= VS_NumeroQuestao;

   JvDBRichEdit_MontaItem.SelectAll;
   JvDBRichEdit_MontaItem.CopyToClipboard ;

   Editor_Prova.ReadOnly:= False;
   Editor_Prova.SelStart:= 0;
   Editor_Prova.PasteFromClipboard ;
   Editor_Prova.SelStart:= 0;
   Trocar('#N', VS_NumeroQuestao);
   Editor_Prova.ReadOnly:= True;
   Update;
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel do texto
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Editor_Prova.FindText(Trocar, 0, Length(Editor_Prova.Text), []);
  if Posicao >= 0 then
  begin
    Editor_Prova.SelStart := Posicao;
    Editor_Prova.SelLength := Length(Trocar);
    Editor_Prova.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar o item
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.DBGrid_ResultadoCellClick(Column: TColumn);
var
   Sender: TObject;
begin
   if Column.FieldName = 'NUMEROQUESTAO' then
   begin
      if VS_NumeroQuestao_old <> Column.Field.Text then
      begin
         if (IBTable_PedidoRevisaoItem.State = DSInsert) and (IBTable_PedidoRevisaoItem.State = DSEdit ) then
            JvTransparentButton_GravarSolicitacaoClick(Sender);

         LimparProvidencia;
         LimparOpcoes( ToolButton_MA, ToolButton_MB, ToolButton_MC, ToolButton_MD);
         LimparOpcoes( ToolButton_CA, ToolButton_CB, ToolButton_CC, ToolButton_CD);
         MostraItemDaProva( Column.Field.Text);
         TratarSolicitacao;
         if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
             IBTable_PedidoRevisaoItem.Edit;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Limpa as Repostas
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.TratarSolicitacao;
var
   VS_Opcao: String;
   i: Integer;
begin
   VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 1, 16);

   if VS_Opcao = 'Anular a questão' then
      CheckBox_AnularQuestao.State:= cbchecked
   else
   begin
      VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 1, 35);
      if VS_Opcao = 'Modificar gabarito para alternativa' then
      begin
         CheckBox_ModificarGabarito.State:= cbchecked;
         ToolBar_ModificarGabarito.Enabled:= True;
         LimparOpcoes( ToolButton_MA, ToolButton_MB, ToolButton_MC, ToolButton_MD);

         VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 37, 1);
         if VS_Opcao = 'A' then
              ToolButton_MA.Down:= True
         else
            if VS_Opcao = 'B' then
                ToolButton_MB.Down:= True
            else
               if VS_Opcao = 'C' then
                  ToolButton_MC.Down:= True
               else
                  ToolButton_MD.Down:= True
      end
      else
      begin
         VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 1, 42);
         if VS_Opcao = 'Considera como correta a(s) alternativa(s)' then
         begin
            CheckBox_AlternativaCorreta.State:= cbchecked;
            ToolBar_AlternativaCorreta.Enabled:= True;
            LimparOpcoes( ToolButton_CA, ToolButton_CB, ToolButton_CC, ToolButton_CD);

            for i := 1 to 4 do
            begin
               Case i of
                 1 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 44, 1);
                 2 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 46, 1);
                 3 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 48, 1);
                 4 : VS_Opcao:= Copy(IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString, 50, 1);
               end;

               if VS_Opcao = 'A' then
                   ToolButton_CA.Down:= True
               else
                  if VS_Opcao = 'B' then
                      ToolButton_CB.Down:= True
                  else
                     if VS_Opcao = 'C' then
                        ToolButton_CC.Down:= True
                     else
                        if VS_Opcao = 'D' then
                           ToolButton_CD.Down:= True
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Limpa as Opcoes
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.LimparOpcoes( ToolButton_A, ToolButton_B, ToolButton_C, ToolButton_D: TToolButton);
begin
   ToolButton_A.Down:= False;
   ToolButton_B.Down:= False;
   ToolButton_C.Down:= False;
   ToolButton_D.Down:= False;
end;

//------------------------------------------------------------------------------
// Limpa Providencias
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.LimparProvidencia;
begin
   CheckBox_AnularQuestao.State:= cbUnchecked;
   CheckBox_ModificarGabarito.State:= cbUnchecked;
   ToolBar_ModificarGabarito.Enabled:= False;
   CheckBox_AlternativaCorreta.State:= cbUnchecked;
   ToolBar_AlternativaCorreta.Enabled:= False;
end;


//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Anular Questao
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_AnularQuestaoClick(Sender: TObject);
begin
   if CheckBox_AnularQuestao.State = cbchecked then
   begin
      CheckBox_ModificarGabarito.State:= cbUnchecked;
      ToolBar_ModificarGabarito.Enabled:= False;
      CheckBox_AlternativaCorreta.State:= cbUnchecked;
      ToolBar_AlternativaCorreta.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar a opcao Modificar Gabarito
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.CheckBox_ModificarGabaritoClick(Sender: TObject);
begin
   if CheckBox_ModificarGabarito.State = cbchecked then
   begin
      ToolBar_ModificarGabarito.Enabled:= True;
      CheckBox_AnularQuestao.State:= cbUnchecked;
      CheckBox_AlternativaCorreta.State:= cbUnchecked;
      ToolBar_AlternativaCorreta.Enabled:= False;
   end
   else
   begin
      ToolBar_ModificarGabarito.Enabled:= False;
      LimparOpcoes( ToolButton_MA, ToolButton_MB, ToolButton_MC, ToolButton_MD);
   end;
end;

procedure TForm_PedidoRevisaoItem.CheckBox_AlternativaCorretaClick(Sender: TObject);
begin
   if CheckBox_AlternativaCorreta.State = cbchecked then
   begin
      ToolBar_AlternativaCorreta.Enabled:= True;
      CheckBox_AnularQuestao.State:= cbUnchecked;
      CheckBox_ModificarGabarito.State:= cbUnchecked;
      ToolBar_ModificarGabarito.Enabled:= False;
   end
   else
   begin
      LimparOpcoes( ToolButton_CA, ToolButton_CB, ToolButton_CC, ToolButton_CD);
      ToolBar_AlternativaCorreta.Enabled:= False;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_MAClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_MA, ToolButton_MB, ToolButton_MC, ToolButton_MD);
   ToolButton_MA.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MB
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_MBClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_MA, ToolButton_MB, ToolButton_MC, ToolButton_MD);
   ToolButton_MB.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MC
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_MCClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_MA, ToolButton_MB, ToolButton_MC, ToolButton_MD);
   ToolButton_MC.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_MD
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_MDClick(Sender: TObject);
begin
   LimparOpcoes( ToolButton_MA, ToolButton_MB, ToolButton_MC, ToolButton_MD);
   ToolButton_MD.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CA
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_CAClick(Sender: TObject);
begin
   ToolButton_CA.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CB
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_CBClick(Sender: TObject);
begin
   ToolButton_CB.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CC
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_CCClick(Sender: TObject);
begin
   ToolButton_CC.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento quando selecionado o botao  ToolButton_CD
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.ToolButton_CDClick(Sender: TObject);
begin
   ToolButton_CD.Down:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Gravar a Solicitacao
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_GravarSolicitacaoClick(Sender: TObject);
var
   VS_Opcao: String;
begin
   if CheckBox_AnularQuestao.State = cbchecked then
      VS_Opcao:= 'Anular a questão'
   else
   begin
      if CheckBox_ModificarGabarito.State = cbchecked then
      begin
           VS_Opcao:= 'Modificar gabarito para alternativa';
           if ToolButton_MA.Down = True then
               VS_Opcao:= VS_Opcao+' A'
           else
              if ToolButton_MB.Down = True then
                  VS_Opcao:= VS_Opcao+' B'
              else
                 if ToolButton_MC.Down = True then
                     VS_Opcao:= VS_Opcao+' C'
                 else
                    if ToolButton_MD.Down = True then
                       VS_Opcao:= VS_Opcao+' D';

           if VS_Opcao = 'Modificar gabarito para alternativa' then
           begin
              ShowMessage('Não selecionado nenhuma alternativa como correta...');
              VS_Opcao:= '';
           end;
      end
      else
      begin
         if CheckBox_AlternativaCorreta.State = cbchecked then
         begin
           VS_Opcao:= 'Considera como correta a(s) alternativa(s)';
           if ToolButton_CA.Down = True then
               VS_Opcao:= VS_Opcao+' A';

           if ToolButton_CB.Down = True then
               VS_Opcao:= VS_Opcao+' B';

           if ToolButton_CC.Down = True then
               VS_Opcao:= VS_Opcao+' C';

           if ToolButton_CD.Down = True then
               VS_Opcao:= VS_Opcao+' D';

           if VS_Opcao = 'Considera como correta a(s) alternativa(s)' then
           begin
              ShowMessage('Não selecionado nenhuma alternativa como correta...');
              VS_Opcao:= '';
           end;
         end
         else
         begin
            ShowMessage('Não foi selecionado nenhuma providencia em relação ao item selecionado...');
            VS_Opcao:= '';
         end;
      end;
   end;

   if VS_Opcao <> '' then
   begin
      if (IBTable_PedidoRevisaoItem.State <> DSInsert) and (IBTable_PedidoRevisaoItem.State<> DSEdit ) then
          IBTable_PedidoRevisaoItem.Edit;

      IBTable_PedidoRevisaoItem.FieldByName('Providencia_Aluno').AsString:= VS_Opcao;
      IBTable_PedidoRevisaoItem.Post;
      Funcoes.ExecutaTransacao;
      VB_recurso:= True;
   end;

   Funcoes.CapturaTelaJpg.SaveToFile( Diretorio_Imagens+'F_'+FormatDateTime('yymmdd.hhnnss',now)+'.jpg');
   ShowMessage('Solicitação envianda com sucesso...');
end;

//------------------------------------------------------------------------------
// Tratamento do botao de exclusão da Solicitacao selecionada
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.JvTransparentButton_ExcluiSolicitacaoClick(Sender: TObject);
begin
   if  Application.MessageBox('Confirma a exclusão do Item selecionado...', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion) = IDYes then
   begin
      IBTable_PedidoRevisaoItem.Delete;
      Funcoes.ExecutaTransacao;
      IBQuery_PedidoRevisaoItem.Close;
      IBQuery_PedidoRevisaoItem.Open;
      ShowMessage('Exclusão realizada com sucesso...');
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para colocar o item selecionado em modo Edit
//------------------------------------------------------------------------------

procedure TForm_PedidoRevisaoItem.DBGrid_ResultadoDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
   MostraItemDaProva( IBQuery_PedidoRevisaoItem.FieldByName('NUMEROQUESTAO').AsString);
   TratarSolicitacao;
   IBTable_PedidoRevisaoItem.Edit;
end;


end.
