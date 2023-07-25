//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Cad_Instrutores.PAS                            //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             de instrutores.                                //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 23/04/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Con_InstrutoresCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, ImgList, Rotinas, Rotinas_SUE, ShellApi, Variants,
  IBCustomDataSet, IBQuery, IBTable, JvToolEdit, JvComponent, JvArrow,ComObj,
  JvEdit, JvDBCtrl, JvCaptionPanel, JvGroupHeader, JvxCtrls, JvShape,
  JvEnterTab, JvTransBtn, JvGradient;

type
  TForm_Con_InstrutoresCurso = class(TForm)
    DSQ_InstrutorMateria: TDataSource;
    IBQuery_InstrutorMateria: TIBQuery;
    Panel2: TPanel;
    JvGroupHeader_Instrutor: TJvGroupHeader;
    IBQuery_InstrutorMateriaIDCURSO: TSmallintField;
    IBQuery_InstrutorMateriaIDENTIDADE: TIBStringField;
    IBQuery_InstrutorMateriaCODMATERIA: TIBStringField;
    IBQuery_InstrutorMateriaNOMEMATERIA: TIBStringField;
    IBQuery_InstrutorMateriaSTATUS: TIBStringField;
    IBQuery_InstrutorMateriaOBSERVACAO: TIBStringField;
    IBTable_Instrutor: TIBTable;
    IBTable_InstrutorIDENTIDADE: TIBStringField;
    IBTable_InstrutorCTP001: TIBStringField;
    IBTable_InstrutorCTP006: TIBStringField;
    IBTable_InstrutorCTP011: TIBStringField;
    IBTable_InstrutorCPI: TIBStringField;
    IBTable_InstrutorCTP500: TIBStringField;
    IBTable_InstrutorLICENCIATURA: TIBStringField;
    DST_instrutor: TDataSource;
    IBTable_InstrutorCurso: TIBTable;
    DST_InstrutorCurso: TDataSource;
    IBTable_InstrutorCursoIDCURSO: TSmallintField;
    IBTable_InstrutorCursoIDENTIDADE: TIBStringField;
    IBTable_InstrutorCursoSTATUS: TIBStringField;
    IBTable_InstrutorCursoOBSERVACAO: TBlobField;
    IBTable_InstrutorCursoMATERIAS: TBlobField;
    IBTable_InstrutorCursoRESERVADO: TBlobField;
    DBGrid_SelecionaInstrutor: TDBGrid;
    Panel1: TPanel;
    Panel_Disciplina: TPanel;
    Panel5: TPanel;
    Label_Carinha: TLabel;
    DBText_NomeCompleto: TDBText;
    GroupBox1: TGroupBox;
    DBGrid_Materia: TDBGrid;
    ToolBar_SelecaoAluno: TToolBar;
    ComboBox_Curso: TComboBox;
    JvEdit_NomeGuerra: TJvEdit;
    JvEdit_Identidade: TJvEdit;
    JvEdit_CPF: TJvEdit;
    JvEdit_PostoGrad: TJvEdit;
    JvEdit_Nome: TJvEdit;
    JvEdit_Unidade: TJvEdit;
    JvEdit_SubUnidade: TJvEdit;
    JvEdit_Status: TJvEdit;
    IBTable_InstrutorDESCLICENCIATURA: TIBStringField;
    Panel_Botoes: TPanel;
    Memo1: TMemo;
    Panel7: TPanel;
    JvShape2: TJvShape;
    JvTransparentButton_Observacao: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_Disciplinas: TJvTransparentButton;
    JvGradient4: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Label8: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    JvShape20: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;

   procedure MontaCurso(PS_Curso: String; Sender: TObject);
   procedure MostraInstrutor;

    procedure FormActivate(Sender: TObject);

    procedure JvEdit_PostoGradChange(Sender: TObject);
    procedure Label_BrancoClick(Sender: TObject);
    procedure Label_AtivoClick(Sender: TObject);
    procedure Label_EmAvaliacaoClick(Sender: TObject);
    procedure Label_AfastadoClick(Sender: TObject);
    procedure DBGrid_IntrutoresTitleClick(Column: TColumn);
    procedure MaskEdit_CursoExit(Sender: TObject);
    procedure ComboBox_CursoChange(Sender: TObject);
    procedure IBQuery_InstrutorMateriaAfterScroll(DataSet: TDataSet);
    procedure DBGrid_MateriaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBQuery_InstrutorAfterScroll(DataSet: TDataSet);
    procedure DBGrid_SelecionaInstrutorDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_DisciplinasClick(Sender: TObject);
    procedure JvTransparentButton_ObservacaoClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
  private    { Private declarations }
     VS_OrderByInstrutor, VS_SelStatus: String;
  public    { Public declarations }
     VS_Instrutor: String;
  end;
var
  Form_Con_InstrutoresCurso: TForm_Con_InstrutoresCurso;

implementation

uses Module, CadDisciplinaInstrutor, Cad_ObsInstrutorMateria,
  Cad_Instrutores;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Funcoes.CabecalhoForm( Form_Con_InstrutoresCurso, 'Cadastro de Instrutor por Curso');

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Instrutor - Consulta de Instrutores por Curso');

      if ((Funcoes.GetSecao  = 'ADMINISTRAÇÃO') or (Funcoes.GetSecao  = 'AVALIAÇÃO')) Then
         JvTransparentButton_Disciplinas.Visible:= True
      else
         JvTransparentButton_Disciplinas.Visible:= False;

      //--- Abre as tabelas existentes

      DM.IBQuery_Instrutor.Open;
      IBQuery_InstrutorMateria.Open;
      IBTable_Instrutor.Open;
      IBTable_InstrutorCurso.Open;

      VS_SelStatus:= '';
      VS_OrderByInstrutor:= ' nomeGuerra';

      //--- Tratamento da Selecao dos Cursos

      Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
      MontaCurso(Funcoes.GetCodCurso, Sender);

      Label_Carinha.Caption:= '';
      Label_Carinha.Color:=  clBtnFace;

      DBGrid_Materia.SetFocus;
   end;
end;

procedure TForm_Con_InstrutoresCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_InstrutorCurso.Close;
   IBTable_Instrutor.Close;
   DM.IBQuery_Instrutor.Close;
   IBQuery_InstrutorMateria.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Combox de Selecao de Curso
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.ComboBox_CursoChange(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text, Sender);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.MontaCurso(PS_Curso: String; Sender: TObject);
begin
   if Funcoes.MontaCurso(PS_Curso) then
      MostraInstrutor;
end;

//------------------------------------------------------------------------------
//
// Tratamento da selecao do Instrutor
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Chamada da Rotina de selecao do Instrutor
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvEdit_PostoGradChange(Sender: TObject);
begin
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Selecao do Status = Branco
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.Label_BrancoClick(Sender: TObject);
begin
   VS_SelStatus:= '';
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Selecao do Status = Ativo
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.Label_AtivoClick(Sender: TObject);
begin
   VS_SelStatus:= 'Ativo';
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Selecao do Status = Em Avaliação
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.Label_EmAvaliacaoClick(Sender: TObject);
begin
   VS_SelStatus:= 'Em Avaliação';
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Selecao do Status = Afastado
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.Label_AfastadoClick(Sender: TObject);
begin
   VS_SelStatus:= 'Afastado';
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao da Grid de Instrutor
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.DBGrid_IntrutoresTitleClick(Column: TColumn);
begin
   if trim(column.Title.Caption) = 'Posto Graduação' then
       VS_OrderByInstrutor:= ' It.Posto'
   else
     if trim(column.Title.Caption) = 'Nome Guerra' then
         VS_OrderByInstrutor:= ' It.NomeGuerra'
     else
        if trim(column.Title.Caption) = 'Curso' then
            VS_OrderByInstrutor:= ' C.CodCurso'
        else
           if trim(column.Title.Caption) = 'Identidade' then
               VS_OrderByInstrutor:= ' It.Identidade'
           else
              if trim(column.Title.Caption) = 'CPF' then
                  VS_OrderByInstrutor:= ' It.Cpf'
              else
                 if trim(column.Title.Caption) = 'Nome' then
                     VS_OrderByInstrutor:= ' It.nome'
                 else
                    if trim(column.Title.Caption) = 'Unidade' then
                        VS_OrderByInstrutor:= ' It.idunidade'
                    else
                       if trim(column.Title.Caption) = 'Sub Unidade' then
                           VS_OrderByInstrutor:= ' It.idunidade'
                       else
                          if trim(column.Title.Caption) = 'Status' then
                              VS_OrderByInstrutor:= ' It.Status';
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Chamada da Rotina de selecao do Instrutor
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.MostraInstrutor;
var
   VS_Where, VS_Comando: String;
begin
   VS_Where:= '';
   VS_Comando:=  'Select C.CodCurso, It.IdCurso, It.nome, It.NomeGuerra, It.Identidade, It.Cpf, It.Posto, It.idunidade, It.idsubunidade, It.Status,It.CTP001, It.CTP006, It.CTP011, It.CPI, It.CTP500, It.LICENCIATURA, It.DESCLICENCIATURA, It.CG015, It.NENHUM '+
                 ' From Corpo_Docente_VIEW It, Curso C '+
                 ' where It.IdCurso = C.IdCurso ';

   if ComboBox_Curso.Text <> '' then
      VS_Where:= VS_Where+' and C.CodCurso = '+#39+ComboBox_Curso.Text+#39;

   if JvEdit_NomeGuerra.Text <> '' then
      VS_Where:= VS_Where+' and It.NomeGuerra like '+#39+'%'+JvEdit_NomeGuerra.Text+'%'+#39;

   if JvEdit_Identidade.Text <> '' then
      VS_Where:= VS_Where+' and It.Identidade like '+#39+JvEdit_Identidade.Text+'%'+#39;

   if JvEdit_CPF.Text <> '' then
      VS_Where:= VS_Where+' and It.CPF like '+#39+JvEdit_CPF.Text+'%'+#39;

   if JvEdit_PostoGrad.Text <> '' then
      VS_Where:= VS_Where+' and Upper(It.Posto) like '+#39+JvEdit_PostoGrad.Text+'%'+#39;

   if JvEdit_Nome.Text <> '' then
      VS_Where:= VS_Where+' and It.Nome like '+#39+'%'+JvEdit_Nome.Text+'%'+#39;

   if JvEdit_Unidade.Text <> '' then
      VS_Where:= VS_Where+' and It.IdUnidade like '+#39+JvEdit_Unidade.Text+'%'+#39;

   if JvEdit_SubUnidade.Text <> '' then
      VS_Where:= VS_Where+' and It.SubUnidade like '+#39+JvEdit_SubUnidade.Text+'%'+#39;

   if JvEdit_Status.Text <> '' then
      VS_Where:= VS_Where+' and It.Status like '+#39+JvEdit_Status.Text+'%'+#39;

   VS_Comando:= VS_Comando+VS_Where+' Order By '+VS_OrderByInstrutor;
   Funcoes.ExecutaQuery(DM.IBQuery_Instrutor, VS_Comando );

    //---
   //--- Contabiliza quantidade de Instrutores

   VS_Comando:=  'Select count(1)as Qtd '+
                 ' From Corpo_Docente_VIEW It, Curso C '+
                 ' where It.IdCurso = C.IdCurso ';
   VS_Comando:= VS_Comando+VS_Where;

   JvGroupHeader_Instrutor.Caption:= '< Instrutor - '+IntToStr(Funcoes.QtdRegistro(VS_Comando))+' >';
end;

//------------------------------------------------------------------------------
// tratamento para mostra a carinha do instrutor
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.IBQuery_InstrutorMateriaAfterScroll(DataSet: TDataSet);
begin
   Label_Carinha.Visible:= True;
   if Trim(IBQuery_InstrutorMateria.FieldByName('Status').AsString) = 'Ativo' then
   begin
      Label_Carinha.Caption:= 'J';
      Label_Carinha.Color:=  clBlue;
   end
   else
   begin
      if Trim(IBQuery_InstrutorMateria.FieldByName('Status').AsString) = 'Em Avaliação' then
      begin
         Label_Carinha.Caption:= 'K';
         Label_Carinha.Color:=  clOlive;
      end
      else
      begin
        if Trim(IBQuery_InstrutorMateria.FieldByName('Status').AsString) = 'Afastado' then
        begin
           Label_Carinha.Caption:= 'L';
           Label_Carinha.Color:=  clRed;
        end
        else
        begin
           Label_Carinha.Visible:= False;
        end;
      end;
   end;
end;

//------------------------------------------------------------------------------
//
// Materia que o instrutor ministra
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Inserir Materia para o instrutor
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvTransparentButton_DisciplinasClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cad_DisciplinaInstrutor, Form_Cad_DisciplinaInstrutor);
   Form_Cad_DisciplinaInstrutor.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Alterar materia instrutor
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvTransparentButton_ObservacaoClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Cad_ObsInstrutorMateria, Form_Cad_ObsInstrutorMateria);
   Form_Cad_ObsInstrutorMateria.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento para Mostrar o Instrutor
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.DBGrid_MateriaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   JvTransparentButton_Alterar.Enabled:= True;

   if (Trim(IBQuery_InstrutorMateria.FieldByName('Status').AsString) = 'Ativo') then
      DBGrid_Materia.Canvas.Font.Color:= clBlue
   else
      if Trim(IBQuery_InstrutorMateria.FieldByName('Status').AsString) = 'Em Avaliação' then
         DBGrid_Materia.Canvas.Font.Color:= clOlive
      else
         if (Trim(IBQuery_InstrutorMateria.FieldByName('Status').AsString) = 'Afastado') then
            DBGrid_Materia.Canvas.Font.Color:= clRed;
            
  if gdSelected in State then
    DBGrid_Materia.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Materia.Canvas.FillRect(Rect);
   DBGrid_Materia.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Con_InstrutoresCurso.MaskEdit_CursoExit(Sender: TObject);
begin
   MontaCurso(Funcoes.GetCodCurso, Sender);
end;


//------------------------------------------------------------------------------
// Procedure para fazer alteração dos dados do Instrutor selecionado
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   VS_Instrutor:= 'Alterar';
   Application.CreateForm(TForm_Cad_Instrutor, Form_Cad_Instrutor);
   Funcoes.CabecalhoForm( Form_Cad_Instrutor, 'Cadastro de Instrutores Por Curso');
   Form_Cad_Instrutor.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para atualizacao da relaçao de Instrutores
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(DM.IBQuery_Instrutor);
end;

procedure TForm_Con_InstrutoresCurso.IBQuery_InstrutorAfterScroll(
  DataSet: TDataSet);
begin
   Label_Carinha.Visible:= True;
   if Trim(DM.IBQuery_Instrutor.FieldByName('Status').AsString) = 'Ativo' then
   begin
      Label_Carinha.Caption:= 'J';
      Label_Carinha.Color:=  clBlue;
   end
   else
   begin
      if Trim(DM.IBQuery_Instrutor.FieldByName('Status').AsString) = 'Em Avaliação' then
      begin
         Label_Carinha.Caption:= 'K';
         Label_Carinha.Color:=  clOlive;
      end
      else
      begin
        if Trim(DM.IBQuery_Instrutor.FieldByName('Status').AsString) = 'Afastado' then
        begin
           Label_Carinha.Caption:= 'L';
           Label_Carinha.Color:=  clRed;
        end
        else
        begin
           Label_Carinha.Visible:= False;
        end;
      end;
   end;

end;

procedure TForm_Con_InstrutoresCurso.DBGrid_SelecionaInstrutorDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Trim(DM.IBQuery_Instrutor.FieldByName('Status').AsString) = 'Ativo' then
     DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clBlue
   else
      if Trim(DM.IBQuery_Instrutor.FieldByName('Status').AsString) = 'Em Avaliação' then
         DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clOlive
      else
         DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clRed;

  if gdSelected in State then
    DBGrid_SelecionaInstrutor.Canvas.Brush.Color := clSkyBlue;

   DBGrid_SelecionaInstrutor.Canvas.FillRect(Rect);
   DBGrid_SelecionaInstrutor.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
//funcao para exportar para openoffice o DBGrid
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresCurso.JvTransparentButton_ExcelClick(Sender: TObject);
var
   OpenDesktop, Calc, Sheets, Sheet, wProperties : Variant;
   Connect, OpenOffice : Variant;
   i : Integer; // Coluna
   j : Integer; // Linha
begin
   //o segredo de pegar a dbgrid inteira é ir para primeira linha e coluna do DBGrid
   DM.IBQuery_Instrutor.First;
   DBGrid_SelecionaInstrutor.SelectedField := DBGrid_SelecionaInstrutor.Columns[0].Field;
   DBGrid_SelecionaInstrutor.SelectedIndex:=0;
   DBGrid_SelecionaInstrutor.SetFocus;

   Screen.Cursor := crSQLWait;
   //aGrid.DataSource.DataSet.Open;
   //aGrid.DataSource.DataSet.Last;

   DBGrid_SelecionaInstrutor.SelectedRows.CurrentRowSelected := True;

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

   // Calc.ConvertFromUrl(calc);

   // Cria linha de cabeçalho
   i := 0;
   while i <= DBGrid_SelecionaInstrutor.FieldCount - 1 do
   begin
      Sheet.getCellByPosition(i,0).setString(DBGrid_SelecionaInstrutor.Columns.Items[i].Title.Caption); //aqui resolvi pegar o titulo do DBGrid
      i := i + 1;
   end;

   // Preenche a planilha
   //j := 1;
   DM.IBQuery_Instrutor.First;
   i := 2;

   while not DM.IBQuery_Instrutor.Eof do
   begin
      Sheet.getCellByPosition(0,i).SetString(DM.IBQuery_Instrutor.FieldByName('CodCurso').AsString);
      Sheet.getCellByPosition(1,i).SetString(DM.IBQuery_Instrutor.FieldByName('NomeGuerra').AsString);
      Sheet.getCellByPosition(2,i).SetString(DM.IBQuery_Instrutor.FieldByName('Identidade').AsString);
      Sheet.getCellByPosition(3,i).SetString(DM.IBQuery_Instrutor.FieldByName('CPF').AsString);
      Sheet.getCellByPosition(4,i).SetString(DM.IBQuery_Instrutor.FieldByName('Posto').AsString);
      Sheet.getCellByPosition(5,i).SetString(DM.IBQuery_Instrutor.FieldByName('Nome').AsString);


      Sheet.getCellByPosition(6,i).SetString(DM.IBQuery_Instrutor.FieldByName('Unidade').AsString);
      Sheet.getCellByPosition(7,i).SetString(DM.IBQuery_Instrutor.FieldByName('SubUnidade').AsString);
      Sheet.getCellByPosition(8,i).SetString(DM.IBQuery_Instrutor.FieldByName('Status').AsString);

      i:= i + 1;
      DM.IBQuery_Instrutor.Next;
   end;
   Screen.Cursor := crDefault;

end;
end.

