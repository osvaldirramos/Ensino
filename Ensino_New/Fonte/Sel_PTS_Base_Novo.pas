//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGEW                                           //
//                                                                            //
// PROGRAMA                  : Cad_PTS_Base_Novo.pas                          //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da relação  //
//                            do PTS Base novo cadastrado.                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Ten Padilha                                    //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 06/10/2021                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Sel_PTS_Base_Novo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, ExtCtrls, DB, IBCustomDataSet, ComObj, 
  IBTable, JvRichEd, JvDBRichEd, ToolWin, Mask, JvToolEdit, JvDBCtrl, Rotinas_Validar,
  DBCtrls, DBGrids, Buttons, JvComponent, JvxCtrls, JvShape, IBQuery, Menus,
  JvCheckBox, Rotinas,Rotinas_SUE,Rotinas_TrataData, JvTransBtn, JvGradient,
  JvLookOut;

type
  TForm_Sel_PTS_Base_Novo = class(TForm)
    DST_PTS_Base_Principal: TDataSource;
    IBTable_PTS_base_Principal: TIBTable;
    DSQ_MontaCurso: TDataSource;
    Query_MontaCurso: TIBQuery;
    Panel_BotoesProva: TPanel;
    Panel_AreaTrabalho: TPanel;
    IBQuery_PTS_base_Semana: TIBQuery;
    DSQ_PTS_base_Semana: TDataSource;
    IBQuery_PTS_base_SemanaIDCURSO: TSmallintField;
    IBQuery_PTS_base_SemanaIDSEMANA: TIntegerField;
    IBQuery_PTS_base_SemanaDIA_SEMANA: TIBStringField;
    IBQuery_PTS_base_SemanaHORARIO: TIBStringField;
    IBQuery_PTS_base_SemanaLOCAL: TIBStringField;
    IBQuery_PTS_base_SemanaTRAB_ESCOLAR: TIBStringField;
    DST_PTS_base_Semana: TDataSource;
    StatusBar_Msg: TStatusBar;
    Panel_Botoes: TPanel;
    JvShape_Novo: TJvShape;
    JvTransparentButton_Novo: TJvTransparentButton;
    JvShape_Alterar: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape_Excluir: TJvShape;
    JvTransparentButton_Excluir: TJvTransparentButton;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvGradient_Curso: TJvGradient;
    Label1: TLabel;
    Label2: TLabel;
    Panel_Curso: TPanel;
    JvShape5: TJvShape;
    Label_Curso: TLabel;
    ComboBox_Curso: TComboBox;
    Panel_semana: TPanel;
    JvShape1: TJvShape;
    Label5: TLabel;
    Label_Semanas: TLabel;
    Label6: TLabel;
    ComboBox_Semana: TComboBox;
    DBEdit_Ano: TDBEdit;
    JvDBDateEdit_DataAtualizacao: TJvDBDateEdit;
    IBQuery_PTS_base_SemanaDISCIPLINA: TIBStringField;
    IBQuery_PTS_base_SemanaQTD_INSTRUTOR: TIntegerField;
    IBQuery_PTS_base_SemanaESPECIALIDADE: TIBStringField;
    IBTable_PTS_base_PrincipalIDCURSO: TSmallintField;
    IBTable_PTS_base_PrincipalRESPONSAVEL: TIBStringField;
    IBTable_PTS_base_PrincipalATUALIZACAO: TDateTimeField;
    IBTable_PTS_base_PrincipalANO: TIBStringField;
    IBTable_PTS_base_PrincipalMSG: TIBStringField;
    IBTable_PTS_base_PrincipalARQUIVO_QUADRO_PERFIL: TIBStringField;
    IBTable_PTS_base_SemanaIDCURSO: TSmallintField;
    IBTable_PTS_base_SemanaIDSEMANA: TIntegerField;
    IBTable_PTS_base_SemanaDIA_SEMANA: TIBStringField;
    IBTable_PTS_base_SemanaHORARIO: TIBStringField;
    IBTable_PTS_base_SemanaTRAB_ESCOLAR: TIBStringField;
    IBTable_PTS_base_SemanaLOCAL: TIBStringField;
    IBTable_PTS_base_SemanaDISCIPLINA: TIBStringField;
    IBTable_PTS_base_SemanaQTD_INSTRUTOR: TIntegerField;
    IBTable_PTS_base_SemanaESPECIALIDADE: TIBStringField;
    IBTable_PTS_base_Semana: TIBTable;
    JvGradient2: TJvGradient;
    JvShape2: TJvShape;
    JvShape_Excel: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_BROffice: TJvTransparentButton;
    Button1: TButton;
    DBNavigator_PTS_Semana: TDBNavigator;
    JvShape4: TJvShape;
    Panel_Principal: TPanel;
    Panel_Observacao: TPanel;
    Label3: TLabel;
    JvDBRichEdit_Observacao: TJvDBRichEdit;
    DBGrid_Quadro_PTS: TDBGrid;
    Panel_Opcao: TPanel;
    ComboBox_TrabalhoEscolar: TComboBox;
    Label_Informe: TLabel;
    JvTransparentButton_Inserir_TrabalhoEscolar: TJvTransparentButton;
    JvTransparentButton_Cancela_InsercaoDisciplina: TJvTransparentButton;
    PopupMenu_Disciplina: TPopupMenu;
    Inserir_o_DisciplinaSelecionado_em_todo_PTS: TMenuItem;
    InseriroDisciplinaSelecionadoemtodoPTS: TMenuItem;
    InseriroDiscipliaSelecionadoemnoTrabalhoEscolarselecionado1: TMenuItem;
    DBComboBox_Disciplina: TDBComboBox;
    Label4: TLabel;
    PopupMenu_ExcluiPTS: TPopupMenu;
    MenuItem_Excluir_o_instrutor_no_Trabalho_Escolar_selecionado: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItemExcluir_somente_para_o_horario_selecionado: TMenuItem;
    Label_InformeLocal: TLabel;
    ComboBox_Local: TComboBox;
    JvTransparentButton_Inserir_Local: TJvTransparentButton;
    JvTransparentButton_Cancela_InsercaoLocal: TJvTransparentButton;
    PopupMenu_Local: TPopupMenu;
    Inserir_o_Local_selecionado_em_todo_PTS: TMenuItem;
    InseriroLocalselecionadoemtodoPTS: TMenuItem;
    InseriroLocalselecionadoemnoTrabalhoEscolarselecionado: TMenuItem;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    IBTable1: TIBTable;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IntegerField2: TIntegerField;
    IBStringField6: TIBStringField;
    DataSource1: TDataSource;
    Button3: TButton;
    text_Arquivo: TRichEdit;
    JvShape6: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    Query_MontaCursoIDCURSO: TSmallintField;
    Query_MontaCursoCODCURSO: TIBStringField;
    Query_MontaCursoNOMECURSO: TIBStringField;
    Query_MontaCursoNUMEROSEMANAAULAS: TSmallintField;

    Procedure AlimentaComboBox_Local;
    procedure TratarSelecaoLocal(Opcao: String);

    procedure TratarExclusaoDoPTS(Opcao: String);
    procedure Tratar_DisciplinaSelecionava(Opcao: String);
    procedure Ver_PTSPrincipal;
    procedure MontaCurso(PS_Curso: String);
    procedure TratarBotoes(Status: Boolean);
    procedure TrataSemanas;
    Procedure TravaSelecaoCurso;

    procedure FormActivate(Sender: TObject);
    procedure ComboBox_SemanaChange(Sender: TObject);
    procedure ComboBox_CursoSelect(Sender: TObject);
    procedure ComboBox_CursoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure ComboBox_CursoClick(Sender: TObject);
    procedure DBGrid_Quadro_PTSDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvTransparentButton_NovoClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
    procedure JvTransparentButton_BROfficeClick(Sender: TObject);
    procedure InseriroDiscipliaSelecionadoemnoTrabalhoEscolarselecionado1Click(Sender: TObject);
    procedure InseriroDisciplinaSelecionadoemtodoPTSClick( Sender: TObject);
    procedure Inserir_o_DisciplinaSelecionado_em_todo_PTSClick(Sender: TObject);
    procedure JvTransparentButton_Cancela_InsercaoDisciplinaClick(Sender: TObject);
    procedure JvTransparentButton_Inserir_TrabalhoEscolarClick(Sender: TObject);
    procedure MenuItem_Excluir_o_instrutor_no_Trabalho_Escolar_selecionadoClick(Sender: TObject);
    procedure MenuItemExcluir_somente_para_o_horario_selecionadoClick(Sender: TObject);
    procedure Inserir_o_Local_selecionado_em_todo_PTSClick( Sender: TObject);
    procedure InseriroLocalselecionadoemtodoPTSClick(Sender: TObject);
    procedure InseriroLocalselecionadoemnoTrabalhoEscolarselecionadoClick(Sender: TObject);
    procedure JvTransparentButton_Inserir_LocalClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);


  private    { Private declarations }
     VI_Semanas: Real;
     VS_IdCurso, VS_CodCurso: String;
  public    { Public declarations }
     VI_SemanaAtual: Integer;
     VS_Opcao: String;
  end;

var
  Form_Sel_PTS_Base_Novo: TForm_Sel_PTS_Base_Novo;

implementation

uses Module, Rel_PTSBase, Rel_ProgramaDeTrabalhoSemanal, Cad_PTS_Base_Novo,
  PTS_Novo_Carga;

{$R *.dfm}


//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'SelTurma')) then
   begin
      Panel_Opcao.Visible:= False;

      JvGradient_Curso.StartColor:= Cor_Tela;

      Funcoes.SetCadCurso('CadCurso');

      Funcoes.CabecalhoForm( Form_Sel_PTS_Base_Novo, ' PTS - Base Novo ( Plano de Trabalho Semanal )');

      Form_Sel_PTS_Base_Novo.Left:= 10;
      Form_Sel_PTS_Base_Novo.Top:= 33;

      TratarBotoes(True);

      //--- Tratamento da Selecao dos Cursos

      IBTable_PTS_base_Principal.Open;
      IBTable_PTS_base_Semana.Open;

      Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
      AlimentaComboBox_Local;
      MontaCurso(Funcoes.GetCodCurso);

      Validar.ListaDisciplinas(DM.IBQuery_MontaTurma.FieldByName('idcurso').AsString, DM.IBQuery_MontaTurma.FieldByName('idturma').AsString, DBComboBox_Disciplina, ComboBox_TrabalhoEscolar);
//      TrataSemanas;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Carrega o Combobox Local
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure TForm_Sel_PTS_Base_Novo.AlimentaComboBox_Local;
begin
   Funcoes.OpenQuery('Select distinct CodSala From SalaAula order By CodSala');

   ComboBox_Local.Items.Clear;
   ComboBox_Local.Text:= '';
   ComboBox_Local.Items.Add('');
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Local.Items.Add(DM.IBQuery_Executa.FieldByName('CodSala').AsString);
      DM.IBQuery_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Rotina para verificar se o PTS principal esta cadastrado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.Ver_PTSPrincipal;
var
   Sender: TObject;
begin
   if Form_Sel_PTS_Base_Novo.IBTable_PTS_base_Principal.FieldByName('IdCurso').AsString = '' then
   begin
      IBTable_PTS_base_Principal.Open;
      IBTable_PTS_base_Principal.Append;
      IBTable_PTS_base_Principal.FieldByName('IdCurso').AsString:= Query_MontaCurso.FieldByNAme('IdCurso').AsString;
      IBTable_PTS_base_Principal.FieldByName('Responsavel').AsString:= Funcoes.GetUsuario;
      IBTable_PTS_base_Principal.FieldByName('Atualizacao').AsString:= DateToStr(Date);
      IBTable_PTS_base_Principal.FieldByName('Ano').AsString:= Funcoes_TrataData.AnoAtual;
      IBTable_PTS_base_Principal.Post;
      Funcoes.ExecutaTransacao;

      IBTable_PTS_base_Principal.Open;
      IBTable_PTS_base_Principal.Close;

      IBTable_PTS_base_Semana.Open;
      IBTable_PTS_base_Semana.Close;

      ComboBox_SemanaChange(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento Quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//    IBTable_PTS_base_Principal.Close;
//    Query_MontaCurso.Close;
//    Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_WindowsClick( Sender: TObject);
begin
    Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.MontaCurso(PS_Curso: String);
var
   VS_Comando: string;
begin
   if ((VS_CodCurso <> PS_Curso) or (Funcoes.GetCadCurso = 'MenuPrincipal') ) then
   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         VS_Comando:= 'Select IdCurso, CodCurso, NomeCurso, NumeroSemanaAulas '+
                      'From Curso '+
                      ' where codcurso = '+#39+PS_Curso+#39;
         Funcoes.ExecutaQuery(Query_MontaCurso, VS_Comando);

         if Trim(Query_MontaCurso.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= Query_MontaCurso.FieldByName('CodCurso').AsString;

            VS_IdCurso:= Query_MontaCurso.FieldByNAme('IdCurso').AsString;
            VS_CodCurso:= ComboBox_Curso.Text;
            VI_Semanas:= Query_MontaCurso.FieldByNAme('NumeroSemanaAulas').AsFloat;
            Funcoes.SetIdCurso(VS_IdCurso);

            Ver_PTSPrincipal;
            TratarBotoes(True);
            TrataSemanas;
         end
         else
         begin
            Showmessage('Curso não Cadastrado.');
            TravaSelecaoCurso;
         end;
      end
      else
      begin
         Showmessage('O Curso selecionado não pode ser branco.');
          TravaSelecaoCurso;
      end;

   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar o travamento da selecao do Curso
//------------------------------------------------------------------------------

Procedure TForm_Sel_PTS_Base_Novo.TravaSelecaoCurso;
begin
   VS_CodCurso:= 'Null';
   TratarBotoes(True);
   Label_Semanas.Caption:= '0';
   ComboBox_Semana.Text:= '0';

   Funcoes.TratarJvTransparentButton(JvTransparentButton_Novo, JvShape_Novo, False);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Alterar, JvShape_Alterar, False);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Excluir, JvShape_Excluir, False);

   ComboBox_Semana.Enabled:= False;
   ComboBox_Curso.SetFocus;
end;

//------------------------------------------------------------------------------
// Monta as semanas para selecao
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.TrataSemanas;
var
   i: Integer;
   Sender: TObject;
begin
    //--
   // Trata da semana referente ao Curso

   ComboBox_Semana.Items.Clear;
   i:= 1;
   ComboBox_Semana.Text:= '1';
   While i <= VI_Semanas do
   begin
      ComboBox_Semana.Items.Add(IntToStr(i));
      i:= i+1;
   end;
   Label_Semanas.Caption:= IntToStr(i-1);
   ComboBox_SemanaChange(Sender);

end;

//------------------------------------------------------------------------------
// Tratamento da selecao da semana
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.ComboBox_SemanaChange(Sender: TObject);
begin
   Funcoes.ExecutaQuery(IBQuery_PTS_base_Semana, 'Select p.idcurso, p.idsemana, d.dia_semana, p.horario, p.disciplina, p.trab_escolar, p.local, p.QTD_Instrutor, p.Especialidade '+
                                                 ' From PTS_Base_Semana p, PTS_dia_Semana d '+
                                                 ' where  p.dia_semana = d.dia_semana '+
                                                 ' and idcurso =  '+VS_IdCurso+
                                                 ' and IdSemana = '+ComboBox_Semana.Text+
                                                 ' Order by p.IdSemana, d.id, p.horario   ');
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para inserir um novo PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.TratarBotoes(Status: Boolean);
begin
   ComboBox_Curso.Enabled:= Status;
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Excel, JvShape_Excel, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Retornar, JvShape_Retornar, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Windows, JvShape_Windows, Status);

   Funcoes.TratarJvTransparentButton(JvTransparentButton_Novo, JvShape_Novo, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Alterar, JvShape_Alterar, Status);
   Funcoes.TratarJvTransparentButton(JvTransparentButton_Excluir, JvShape_Excluir, Status);
   ComboBox_Semana.Enabled:= Status;
end;


procedure TForm_Sel_PTS_Base_Novo.ComboBox_CursoSelect(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text);
end;

procedure TForm_Sel_PTS_Base_Novo.ComboBox_CursoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      MontaCurso(ComboBox_Curso.Text)
   else
      ComboBox_Curso.Style:= csDropDownList;
end;


procedure TForm_Sel_PTS_Base_Novo.ComboBox_CursoClick(Sender: TObject);
begin
 ComboBox_Curso.Style:= csDropDownList;
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar o PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.DBGrid_Quadro_PTSDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if ((IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString = '2º Feira') or
       (IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString = '4º Feira') or
       (IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString = '6º Feira')) then
   begin
      DBGrid_Quadro_PTS.Canvas.Brush.Color:= $00FFE8B7;
   end
   else
   begin
      DBGrid_Quadro_PTS.Canvas.Brush.Color:= clSilver;
   end;

  if gdSelected in State then
    DBGrid_Quadro_PTS.Canvas.Brush.Color := $00C08000;  // clSkyBlue;

   DBGrid_Quadro_PTS.Canvas.FillRect(Rect);
   DBGrid_Quadro_PTS.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar inserir PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_NovoClick(Sender: TObject);
begin
   if trim(ComboBox_Curso.Text) = '' then
   begin
       ShowMessage('Não foi selecionado o Curso que irá compor o PTS-Base...');
   end
   else
   begin
      IBQuery_PTS_base_Semana.Last;
      VS_Opcao:= 'Inserir';
      Form_Cad_PTS_Base_Novo.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar Alterar PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_AlterarClick( Sender: TObject);
begin
   if IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString = '' then
       ShowMessage('O Curso selecionada não possuí PTS Base Cadastrado...')
   else
   begin
      if trim(ComboBox_Curso.Text) = '' then
      begin
         ShowMessage('Não foi selecionado o Curso que irá compor o PTS-Base...');
      end
      else
      begin
         VS_Opcao:= 'Alterar';
         Form_Cad_PTS_Base_Novo.ShowModal;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para apresentar Alterar PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_ExcluirClick( Sender: TObject);
var
   VI_Retorno: Integer;
begin
   if IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString = '' then
       ShowMessage('O Curso selecionada não possuí PTS Base Cadastrado...')
   else
   begin
      VI_Retorno:= Application.MessageBox('Confirma a Exclusão do PTS(s) Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         if IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString = '' then
            IBTable_PTS_base_Principal.Delete
         else
            IBTable_PTS_base_Semana.Delete;

         Funcoes.ExecutaTransacao;
         Funcoes.AtualizaQuery(IBQuery_PTS_base_Semana);
      end;
   end;
end;


procedure TForm_Sel_PTS_Base_Novo.Button1Click(Sender: TObject);
begin
    Application.CreateForm(TForm_PTS_Novo_Carga, Form_PTS_Novo_Carga);
    Form_PTS_Novo_Carga.ShowModal;
    Form_PTS_Novo_Carga.Free;
    Funcoes.TrimAppMemorySize;
end;

//------------------------------------------------------------------------------
// Monta a planilha do PTS em Excel
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_ExcelClick( Sender: TObject);
var
   objExcel, Sheet: Variant;
   cTitulo : string;
   i : integer;
begin
   if IBQuery_PTS_base_Semana.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'O Curso selecionada não possuí PTS Base Cadastrado...')
   else
   begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de PTS Base.';

      try
         objExcel := CreateOleObject('Excel.Application');
      except
         objExcel := CreateOleObject('scalc.Application');
      end;
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo o Cabwecalho do Curso
      Sheet.Range['A1'] := 'Código do Curso: '+Query_MontaCurso.FieldByName('CodCurso').AsString+ ' - '+Query_MontaCurso.FieldByName('NomeCurso').AsString ;
      Sheet.Range['B2'] := 'Semana: '+ComboBox_Semana.Text;

      // Preenche o cabecalho

      Sheet.Range['A3'] := 'SEMANA';
      Sheet.Range['B3'] := 'HORÁRIO';
      Sheet.Range['C3'] := 'DISCIPLINA';
      Sheet.Range['D3'] := 'TRABAÇHO ESCCOLAR';
      Sheet.Range['E3'] := 'LOCAL';

      // por aqui tu limparias a planilha

      i:= 4;
      IBQuery_PTS_base_Semana.First;
      while not IBQuery_PTS_base_Semana.eof do
      begin
         Sheet.Cells[i,1] := IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString;
         Sheet.Cells[i,2] := IBQuery_PTS_base_Semana.FieldByName('Horario').AsString;
         Sheet.Cells[i,3] := IBQuery_PTS_base_Semana.FieldByName('Disciplina').AsString;
         Sheet.Cells[i,4] := IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString;
         Sheet.Cells[i,5] := IBQuery_PTS_base_Semana.FieldByName('Local').AsString;
         i:= i+1;
         IBQuery_PTS_base_Semana.Next;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Monta a planilha do PTS em BROffice
//------------------------------------------------------------------------------

Procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_BROfficeClick( Sender: TObject);
var
   OpenDesktop, Calc, Sheets, Sheet, wProperties : Variant;
   Connect, OpenOffice : Variant;
   i : Integer; // Linha
begin
   if IBQuery_PTS_base_Semana.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'O Curso selecionada não possuí PTS Base Cadastrado...')
   else
   begin
      Screen.Cursor := crSQLWait;

      // Cria o link OLE com o OpenOffice
      if VarIsEmpty(OpenOffice) then
         OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
      Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

      // Inicia o Calc
      OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
      wProperties := VarArrayCreate([0, - 1], varVariant);
      Calc := OpenDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, wProperties);
      sheets := Calc.Sheets;
      Sheet := Sheets.getByIndex(0);

      // Cria linha de cabeçalho
      i := 0;

      // Preenchendo o Cabecalho do Curso
      Sheet.getCellByPosition(0,i).SetString('Código do Curso: '+Query_MontaCurso.FieldByName('CodCurso').AsString+ ' - '+Query_MontaCurso.FieldByName('NomeCurso').AsString );

      i:= i + 2;
      Sheet.getCellByPosition(0,i).SetString('Semana: '+ComboBox_Semana.Text);

      // Preenche o cabecalho

      i:= i + 1;
      Sheet.getCellByPosition(0,i).SetString('SEMANA');
      Sheet.getCellByPosition(1,i).SetString('HORÁRIO');
      Sheet.getCellByPosition(2,i).SetString('DISCIPLINA');
      Sheet.getCellByPosition(3,i).SetString('TRABALHO ESCOLAR');
      Sheet.getCellByPosition(4,i).SetString('LOCAL');

      IBQuery_PTS_base_Semana.First;
      while not IBQuery_PTS_base_Semana.eof do
      begin

         i:= i+1;
         Sheet.getCellByPosition(0,i).SetString(IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString);
         Sheet.getCellByPosition(1,i).SetString(IBQuery_PTS_base_Semana.FieldByName('Horario').AsString);
         Sheet.getCellByPosition(2,i).SetString(IBQuery_PTS_base_Semana.FieldByName('Disciplina').AsString);
         Sheet.getCellByPosition(3,i).SetString(IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString);
         Sheet.getCellByPosition(4,i).SetString(IBQuery_PTS_base_Semana.FieldByName('Local').AsString);
         IBQuery_PTS_base_Semana.Next;
      end;
   end;
   Screen.Cursor := crDefault;
end;



//------------------------------------------------------------------------------
// Tratar da seleção do Local
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.Tratar_DisciplinaSelecionava(Opcao: String);
begin
   if IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString = '' then
       ShowMessage('O Curso selecionada não possuí PTS Base Cadastrado...')
   else
   begin
      Label_Informe.Left:= ComboBox_TrabalhoEscolar.Left;
      Label_Informe.Caption:= Opcao;

      JvTransparentButton_Inserir_TrabalhoEscolar.Hint:= Opcao;
      ComboBox_TrabalhoEscolar.Text:= IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString;  //=> '';
      Panel_Opcao.Visible:= True;
   end;
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Base_Novo.InseriroDiscipliaSelecionadoemnoTrabalhoEscolarselecionado1Click( Sender: TObject);
//------------------------------------------------------------------------------
begin
   Tratar_DisciplinaSelecionava( InseriroDiscipliaSelecionadoemnoTrabalhoEscolarselecionado1.Caption );
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Base_Novo.InseriroDisciplinaSelecionadoemtodoPTSClick( Sender: TObject);
//------------------------------------------------------------------------------
begin
   Tratar_DisciplinaSelecionava( InseriroDisciplinaSelecionadoemtodoPTS.Caption );
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Base_Novo.Inserir_o_DisciplinaSelecionado_em_todo_PTSClick( Sender: TObject);
//------------------------------------------------------------------------------
begin
   Tratar_DisciplinaSelecionava( Inserir_o_DisciplinaSelecionado_em_todo_PTS.Caption );
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_Cancela_InsercaoDisciplinaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   Panel_Opcao.Visible:= False;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da gravacao da local
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_Inserir_TrabalhoEscolarClick(Sender: TObject);
var
   VS_Comando,  VS_Local, VS_Disciplina, VS_Trab_Escolar: String;
begin
   if IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString = '' then
       ShowMessage('O Curso selecionada não possuí PTS Base Cadastrado...')
   else
   begin
      if ((Copy(ComboBox_TrabalhoEscolar.Text,1,6) = '------') or (trim(ComboBox_TrabalhoEscolar.text) = '')) then
      begin
          ShowMessage('Somente referencia, não permitido a seleção...');
          ComboBox_TrabalhoEscolar.SetFocus;
      end
      else
      begin
         VS_Disciplina:= '';
         VS_Trab_Escolar:= ComboBox_TrabalhoEscolar.Text;
         VS_Local:= '';

         if ((ComboBox_TrabalhoEscolar.Text = 'ABERTURA DO CURSO') or (ComboBox_TrabalhoEscolar.Text = 'CERIMÔNIA DE ABERTURA DO CURSO') or
             (ComboBox_TrabalhoEscolar.Text = 'ENCERRAMENTO DO CURSO') or (ComboBox_TrabalhoEscolar.Text = 'CERIMÔNIA DE ENCERRAMENTO DO CURSO') or
             (ComboBox_TrabalhoEscolar.Text = 'À DISPOSIÇÃO DO ENSINO')) then
         begin
            VS_Local:= ', LOCAL = '+#39+'AUDITÓRIO'+#39;
         end
         else
         begin
            if ((ComboBox_TrabalhoEscolar.Text = 'FERIADO')) then
            begin
               VS_Local:= ', LOCAL = '+#39+''+#39;
            end
            else
            begin
               if ((ComboBox_TrabalhoEscolar.Text <> 'AVALIAÇÃO') and
                   (copy(ComboBox_TrabalhoEscolar.Text, 1, 13) <> 'PROVA TEÓRICA') and
                   (copy(ComboBox_TrabalhoEscolar.Text, 1, 13) <> 'PROVA PRÁTICA') and
                   (ComboBox_TrabalhoEscolar.Text <> 'PROVA DIAGNÓSTICA') and
                   (ComboBox_TrabalhoEscolar.Text <> 'DISCUSSÃO DA AVALIAÇÃO PRÁTICA') and
                   (ComboBox_TrabalhoEscolar.Text <> 'DISCUSSÃO DA AVALIAÇÃO TEÓRICA') and
                   (ComboBox_TrabalhoEscolar.Text <> 'CRÍTICA DO CURSO')) then
               begin
                  VS_Disciplina:= copy(ComboBox_TrabalhoEscolar.Text,1, 6);
                  VS_Trab_Escolar:= copy(ComboBox_TrabalhoEscolar.Text,10, Length(ComboBox_TrabalhoEscolar.Text)-9);
               end
            end;
         end;

         VS_Comando:= 'Update pts_base_semana set TRAB_ESCOLAR = '+#39+VS_Trab_Escolar+#39+
                                                ', DISCIPLINA = '+#39+VS_Disciplina+#39+
                                                  VS_Local;

         if Panel_Opcao.Caption = 'Inserir a Disciplina selecionada em todo PTS' then
            VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString
         else
            if Panel_Opcao.Caption = 'Inserir a Disciplina selecionada somente no horario selecionado' then
               VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString+
                                        ' and   IdSemana = '+#39+IBQuery_PTS_base_Semana.FieldByName('IdSemana').AsString+#39+
                                        ' and   Dia_Semana = '+#39+IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString+#39+
                                        ' and   Horario = '+#39+IBQuery_PTS_base_Semana.FieldByName('Horario').AsString+#39+
                                        ' and   Trab_Escolar = '+#39+IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString+#39
            else
               VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString+
                                        ' and   Trab_Escolar = '+#39+IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString+#39;


         Funcoes.ExecusaoQuery( VS_Comando );
         Funcoes.AtualizaQuery(IBQuery_PTS_base_Semana);
      end;
   end;
   Panel_Opcao.Visible:= False;
end;

//------------------------------------------------------------------------------
// Modulo para Excluir o instrutor no Trabalho Escolar selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.MenuItem_Excluir_o_instrutor_no_Trabalho_Escolar_selecionadoClick( Sender: TObject);
begin
   TratarExclusaoDoPTS('Excluir o instrutor no Trabalho Escolar selecionado' );
end;

//------------------------------------------------------------------------------
// Modulo para Excluir somente para o horario selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.MenuItemExcluir_somente_para_o_horario_selecionadoClick( Sender: TObject);
begin
   TratarExclusaoDoPTS('Excluir somente para o horario selecionado' );
end;


//------------------------------------------------------------------------------
// Tratar Excusão do PTS
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.TratarExclusaoDoPTS(Opcao: String);
var
   VI_Retorno: Integer;
   VS_Comando: String;
   Sender: TObject;
begin
   if IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      VI_Retorno:= Application.MessageBox('Confirma a Exclusão do PTS(s) Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         VS_Comando:= '';

         if Opcao = 'Excluir o Trabalho Escolar selecionado' then
            VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString+
                                     ' and   Trab_Escolar = '+#39+IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString+#39
         else
            if Opcao = 'Excluir somente para o horario selecionado' then
               VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString+
                                        ' and   IdSemana = '+#39+IBQuery_PTS_base_Semana.FieldByName('IdSemana').AsString+#39+
                                        ' and   Dia_Semana = '+#39+IBQuery_PTS_base_Semana.FieldByName('Dia_Semana').AsString+#39+
                                        ' and   Horario = '+#39+IBQuery_PTS_base_Semana.FieldByName('Horario').AsString+#39+
                                        ' and   Trab_Escolar = '+#39+IBQuery_PTS_base_Semana.FieldByName('Trab_Escolar').AsString+#39;

         if VS_Comando <> '' then
         begin
            Funcoes.ExecusaoQuery(  'delete  From  pts_Base_semana '+VS_Comando );
            Funcoes.AtualizaQuery(IBQuery_PTS_base_Semana);
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Base_Novo.Inserir_o_Local_selecionado_em_todo_PTSClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   TratarSelecaoLocal('Inserir o Local selecionado em todo PTS' );
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Base_Novo.InseriroLocalselecionadoemtodoPTSClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
   TratarSelecaoLocal('Inserir o Local selecionado somente no horario selecionado');
end;

//------------------------------------------------------------------------------
procedure TForm_Sel_PTS_Base_Novo.InseriroLocalselecionadoemnoTrabalhoEscolarselecionadoClick( Sender: TObject);
begin
   TratarSelecaoLocal('Inserir o Local selecionado em no Trabalho Escolar selecionado');
end;

//------------------------------------------------------------------------------
// Tratar da seleção do Local
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.TratarSelecaoLocal(Opcao: String);
begin
   if IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString = '' then
       ShowMessage('Não possuí PTS cadastrado...')
   else
   begin
      //--- Tratamento da disponibilizacao das opcoes de local

      //--- Tratamento para não mostrar as opcoes de horario

      Label_InformeLocal.Visible:= True;
      ComboBox_Local.Visible:= True;
      JvTransparentButton_Inserir_Local.Visible:= True;
      JvTransparentButton_Cancela_InsercaoLocal.Visible:= True;

      Label_InformeLocal.Left:= ComboBox_Local.Left;
      Label_InformeLocal.Caption:= Opcao;

      JvTransparentButton_Inserir_Local.Hint:= Opcao;
      ComboBox_Local.Text:= '';
      Panel_Opcao.Visible:= True;
   end;
end;


//------------------------------------------------------------------------------
// Procedure para tratar da gravacao da local
//------------------------------------------------------------------------------

procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_Inserir_LocalClick(Sender: TObject);
var
   VS_Opcao, VS_Comando: String;
begin
   VS_Opcao:= JvTransparentButton_Inserir_Local.Hint;
   if IBTable_PTS_Base_Principal.FieldByName('IdCurso').AsString = '' then
      ShowMessage('Não possuí PTS para a turma selecionada...')
   else
   begin
      VS_Comando:= 'Update pts_base_semana set Local = '+#39+ComboBox_Local.Text+#39;

      if VS_Opcao = 'Inserir o Local selecionado em todo PTS' then
         VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString
      else
         if VS_Opcao = 'Inserir o Local selecionado somente no horario selecionado' then
            VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString+
                                     ' and   IdSemana = '+#39+IBQuery_PTS_Base_Semana.FieldByName('IdSemana').AsString+#39+
                                     ' and   Dia_Semana = '+#39+IBQuery_PTS_Base_Semana.FieldByName('Dia_Semana').AsString+#39+
                                     ' and   Horario = '+#39+IBQuery_PTS_Base_Semana.FieldByName('Horario').AsString+#39+
                                     ' and   Trab_Escolar = '+#39+IBQuery_PTS_Base_Semana.FieldByName('Trab_Escolar').AsString+#39
         else
            VS_Comando:= VS_Comando +' Where IdCurso =  '+IBQuery_PTS_base_Semana.FieldByName('IdCurso').AsString+
                                     ' and   Trab_Escolar = '+#39+IBQuery_PTS_Base_Semana.FieldByName('Trab_Escolar').AsString+#39;


      Funcoes.ExecusaoQuery( VS_Comando );
      Funcoes.AtualizaQuery(IBQuery_PTS_Base_Semana);
   end;
   Panel_Opcao.Visible:= False;
end;

procedure TForm_Sel_PTS_Base_Novo.Button2Click(Sender: TObject);
var
   i, nlin, VI_ContReg, VI_Cont: integer;
    Linha: String;
begin
   nlin:=text_Arquivo.Lines.Count;
   nlin:= nlin-1;
   VI_ContReg:= 0;
   While VI_ContReg <= nlin do
   begin
      Linha:= trim(text_Arquivo.lines[VI_ContReg]);
      Funcoes.ExecusaoQuery( Linha );

      VI_ContReg:= VI_ContReg+1;
   end;
   Funcoes.ExecutaTransacao;

{   dm.IBDatabase_Local.Connected:= true;
   dm.IBTransaction_Local.Active:= true;

   IBTable1.Open;
   IBTable1.First;
   While not IBTable1.Eof do
   begin
      IBTable_PTS_base_Semana.Append;
      IBTable_PTS_base_Semana.FieldByName('IDCURSO').AsString:= IBTable1.FieldByName('IDCURSO').AsString;
      IBTable_PTS_base_Semana.FieldByName('IDSEMANA').AsString:= IBTable1.FieldByName('IDSEMANA').AsString;
      IBTable_PTS_base_Semana.FieldByName('DIA_SEMANA').AsString:= IBTable1.FieldByName('DIA_SEMANA').AsString;
      IBTable_PTS_base_Semana.FieldByName('HORARIO').AsString:= IBTable1.FieldByName('HORARIO').AsString;
      IBTable_PTS_base_Semana.FieldByName('TRAB_ESCOLAR').AsString:= IBTable1.FieldByName('TRAB_ESCOLAR').AsString;
      IBTable_PTS_base_Semana.FieldByName('LOCAL').AsString:= IBTable1.FieldByName('LOCAL').AsString;
      IBTable_PTS_base_Semana.FieldByName('DISCIPLINA').AsString:= IBTable1.FieldByName('DISCIPLINA').AsString;
      IBTable_PTS_base_Semana.FieldByName('QTD_INSTRUTOR').AsString:= IBTable1.FieldByName('QTD_INSTRUTOR').AsString;
      IBTable_PTS_base_Semana.FieldByName('ESPECIALIDADE').AsString:= IBTable1.FieldByName('ESPECIALIDADE').AsString;

     IBTable_PTS_base_Semana.Post;

      IBTable1.Next;
   end;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_PTS_base_Semana);
   }
end;

procedure TForm_Sel_PTS_Base_Novo.Button3Click(Sender: TObject);
begin
   IF OPENDIALOG1.EXECUTE THEN
   BEGIN
//      Label_NomeArquivo.Caption:= OPENDIALOG1.FILENAME;
      Text_Arquivo.Lines.LoadFromFile(OPENDIALOG1.FILENAME);
//      JvTransparentButton_Carga.Enabled:= True;
   END;
end;


procedure TForm_Sel_PTS_Base_Novo.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_PTS_base_Semana);
end;

end.
