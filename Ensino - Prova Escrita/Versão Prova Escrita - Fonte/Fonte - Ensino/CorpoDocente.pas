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

unit CorpoDocente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, ImgList, Rotinas, Rotinas_SUE, ShellApi, Variants,
  IBCustomDataSet, IBQuery, IBTable, JvToolEdit, JvComponent, JvArrow,ComObj,
  JvEdit, JvDBCtrl, JvCaptionPanel, JvGroupHeader, JvxCtrls, JvShape,
  JvEnterTab, JvTransBtn, JvGradient;

type
  TForm_CorpoDocente = class(TForm)
    Panel2: TPanel;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_PostoGrad: TJvEdit;
    JvEdit_Nome: TJvEdit;
    DBGrid_SelecionaInstrutor: TDBGrid;
    JvEdit_CPF: TJvEdit;
    JvEdit_Identidade: TJvEdit;
    JvEdit_NomeGuerra: TJvEdit;
    JvEdit_SubUnidade: TJvEdit;
    JvEdit_Unidade: TJvEdit;
    ComboBox_Curso: TComboBox;
    IBTable_InstrutorCurso: TIBTable;
    IBTable_InstrutorCursoIDCURSO: TSmallintField;
    IBTable_InstrutorCursoIDENTIDADE: TIBStringField;
    IBTable_InstrutorCursoSTATUS: TIBStringField;
    IBTable_InstrutorCursoOBSERVACAO: TBlobField;
    IBTable_InstrutorCursoMATERIAS: TBlobField;
    IBTable_InstrutorCursoRESERVADO: TBlobField;
    DST_InstrutorCurso: TDataSource;
    Panel_Botoes: TPanel;
    Memo2: TMemo;
    JvGradient1: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Excel: TJvTransparentButton;
    ComboBox_Status: TComboBox;
    Label_QtdInstrutores: TLabel;

   procedure MontaCurso(PS_Curso: String; Sender: TObject);
   procedure MostraInstrutor;

    procedure FormActivate(Sender: TObject);

    procedure JvEdit_PostoGradChange(Sender: TObject);
    procedure DBGrid_SelecionaInstrutorTitleClick(Column: TColumn);
    procedure MaskEdit_CursoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_SelecionaInstrutorDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure JvTransparentButton_ExcelClick(Sender: TObject);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
     VS_OrderByInstrutor, VS_SelStatus: String;
  public    { Public declarations }
     VS_Instrutor: String;
  end;
var
  Form_CorpoDocente: TForm_CorpoDocente;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.FormActivate(Sender: TObject);
begin
   if Funcoes.GetCadCurso = 'MenuPrincipal' then
   begin
      Funcoes.CabecalhoForm( Form_CorpoDocente, 'Corpo Docente');

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Instrutor - Corpo Docente');

      //--- Abre as tabelas existentes

      IBTable_InstrutorCurso.Open;

      VS_SelStatus:= '';
      VS_OrderByInstrutor:= ' nomeGuerra';

      //--- Tratamento da Selecao dos Cursos

      Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
      ComboBox_Curso.Text:= '';
      MontaCurso(Funcoes.GetCodCurso, Sender);

      MostraInstrutor;
   end;
end;

procedure TForm_CorpoDocente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_InstrutorCurso.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.JvTransparentButton_FecharClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.MontaCurso(PS_Curso: String; Sender: TObject);
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

procedure TForm_CorpoDocente.JvEdit_PostoGradChange(Sender: TObject);
begin
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Seleciona o campo que fara a ordenacao da Grid de Instrutor
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.DBGrid_SelecionaInstrutorTitleClick(Column: TColumn);
begin
   if trim(column.Title.Caption) = 'Posto Graduação' then
       VS_OrderByInstrutor:= ' Posto'
   else
     if trim(column.Title.Caption) = 'Nome Guerra' then
         VS_OrderByInstrutor:= ' NomeGuerra'
     else
        if trim(column.Title.Caption) = 'Curso' then
            VS_OrderByInstrutor:= ' CodCurso'
        else
           if trim(column.Title.Caption) = 'Identidade' then
               VS_OrderByInstrutor:= ' Identidade'
           else
              if trim(column.Title.Caption) = 'CPF' then
                  VS_OrderByInstrutor:= ' Cpf'
              else
                 if trim(column.Title.Caption) = 'Nome' then
                     VS_OrderByInstrutor:= ' nome'
                 else
                    if trim(column.Title.Caption) = 'Unidade' then
                        VS_OrderByInstrutor:= ' idunidade'
                    else
                       if trim(column.Title.Caption) = 'Sub Unidade' then
                           VS_OrderByInstrutor:= ' Idunidade'
                       else
                          if trim(column.Title.Caption) = 'Status' then
                              VS_OrderByInstrutor:= ' Status';
   MostraInstrutor;
end;

//------------------------------------------------------------------------------
// Chamada da Rotina de selecao do Instrutor
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.MostraInstrutor;
var
   VS_Condicao, VS_Comando: String;
begin
   VS_Condicao:= ' Where ';
   VS_Comando:=  'Select IdCurso, CodCurso, nome, NomeGuerra, Identidade, Cpf, Posto, idunidade, idsubunidade, Status, CTP001, CTP006, CTP011, CPI, CTP500, LICENCIATURA, DESCLICENCIATURA, CG015, NENHUM '+
                ' From Instrutor_view ';

   if ComboBox_Curso.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' CodCurso = '+#39+ComboBox_Curso.Text+#39;
      VS_Condicao:= ' and ';
   end;

   if JvEdit_NomeGuerra.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' (NomeGuerra like '+#39+'%'+JvEdit_NomeGuerra.Text+'%'+#39;
      VS_Comando:= VS_Comando+Funcoes.TratarConsultaComAcento('NomeGuerra', 'Like', JvEdit_NomeGuerra.Text+'%')+')';
      VS_Condicao:= ' and ';
   end;

   if JvEdit_Identidade.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' Identidade like '+#39+JvEdit_Identidade.Text+'%'+#39;
      VS_Condicao:= ' and ';
   end;

   if JvEdit_CPF.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' CPF like '+#39+JvEdit_CPF.Text+'%'+#39;
      VS_Condicao:= ' and ';
   end;

   if JvEdit_PostoGrad.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' Upper(Posto) like '+#39+JvEdit_PostoGrad.Text+'%'+#39;
      VS_Condicao:= ' and ';
   end;

   if JvEdit_Nome.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' (Nome like '+#39+'%'+JvEdit_Nome.Text+'%'+#39;
      VS_Comando:= VS_Comando+Funcoes.TratarConsultaComAcento('Nome', 'Like', JvEdit_Nome.Text+'%')+')';
      VS_Condicao:= ' and ';
   end;

   if JvEdit_Unidade.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' IdUnidade like '+#39+JvEdit_Unidade.Text+'%'+#39;
      VS_Condicao:= ' and ';
   end;

   if JvEdit_SubUnidade.Text <> '' then
   begin
      VS_Comando:= VS_Comando+VS_Condicao+' SubUnidade like '+#39+JvEdit_SubUnidade.Text+'%'+#39;
      VS_Condicao:= ' and ';
   end;

   if ComboBox_Status.Text <> '' then
      VS_Comando:= VS_Comando+VS_Condicao+' Status = '+#39+ComboBox_Status.Text+#39;

   Funcoes.ExecutaQuery(DM.IBQuery_Instrutor, VS_Comando+' Order By '+VS_OrderByInstrutor );
   Label_QtdInstrutores.Caption:= '< Instrutor - '+Funcoes.TotalRegistros( DM.IBQuery_Instrutor)+' >';
end;

//------------------------------------------------------------------------------
//
// Materia que o instrutor ministra
//
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.MaskEdit_CursoExit(Sender: TObject);
begin
   MontaCurso(Funcoes.GetCodCurso, Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao para atualizacao da relaçao de Instrutores
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.JvTransparentButton_AtualizaClick( Sender: TObject);
begin
   Funcoes.AtualizaQuery(DM.IBQuery_Instrutor);
end;

//------------------------------------------------------------------------------
// Tratamento para destacar o Instrutor
//------------------------------------------------------------------------------

procedure TForm_CorpoDocente.DBGrid_SelecionaInstrutorDrawColumnCell(
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

//funcao para exportar para openoffice o DBGrid
procedure TForm_CorpoDocente.JvTransparentButton_ExcelClick(Sender: TObject);
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
end;
end.

