//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Curso.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             de Curso.                                      //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 15/07/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Estatistica_Curso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, PsyRichEdit,
  JvTransBtn;

type
  TForm_Estatistica_Curso = class(TForm)
    DSQ_MontaCurso: TDataSource;
    Query_MontaCurso: TIBQuery;
    Query_MontaCursoIDCURSO: TSmallintField;
    Query_MontaCursoCODCURSO: TIBStringField;
    Query_MontaCursoNOMECURSO: TIBStringField;
    IBQuery_Disciplinas: TIBQuery;
    DSQ_QtdDisciplinas: TDataSource;
    JvCaptionPanel1: TJvCaptionPanel;
    DBNavigator1: TDBNavigator;
    ToolBar_SelecaoTurma: TToolBar;
    MaskEdit_CodCurso: TJvEdit;
    MaskEdit_NomeCurso: TJvEdit;
    DBGrid_Curso: TDBGrid;
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    DBGrid_Lista: TStringGrid;
    Query_MontaCursoNUMERO_IDEAL_ITENS: TIntegerField;
    Panel_Botoes: TPanel;
    JvGradient1: TJvGradient;
    JvShape9: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape_Copiar: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    Memo2: TMemo;

    procedure FormActivate(Sender: TObject);

    procedure MaskEdit_CodCursoChange(Sender: TObject);
    procedure DBGrid_CursoTitleClick(Column: TColumn);
    procedure Query_MontaCursoAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);

  private    { Private declarations }
     VS_ComandoCurso, OrderByCurso: String;
  public    { Public declarations }
  end;
var
  Form_Estatistica_Curso: TForm_Estatistica_Curso;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Curso.FormActivate(Sender: TObject);
begin
  if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_Estatistica_Curso.Caption:= 'SAE(SISTEMA DE ACOMPANHAMENTO EDUCACIONAL) --> Estatistica de Disciplinas e Itens por Curso';

   OrderByCurso:= 'CodCurso';

    MaskEdit_CodCursoChange(Sender);
end;


//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Curso.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Curso.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Atualiza a Lista de Cursos
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Curso.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_MontaCurso);
end;

//------------------------------------------------------------------------------
// Monta a relação de Cursos pelo Filtro
//------------------------------------------------------------------------------

procedure TForm_Estatistica_Curso.MaskEdit_CodCursoChange(Sender: TObject);
var
   VB_Where: Boolean;
begin
   VB_Where:= False;
   VS_ComandoCurso:= 'Select IdCurso, Codcurso, nomecurso, NUMERO_IDEAL_ITENS '+
                     'From curso';

   if Trim(MaskEdit_CodCurso.Text) <> '' then
   begin
      VS_ComandoCurso:= VS_ComandoCurso+' Where CodCurso Like '+#39+MaskEdit_CodCurso.Text+'%'+#39;
      VB_Where:= True;
   end;

   if Trim(MaskEdit_NomeCurso.Text) <> '' then
   begin
      if VB_Where = False then
         VS_ComandoCurso:= VS_ComandoCurso+' Where NomeCurso Like '+#39+MaskEdit_CodCurso.Text+'%'+#39
      else
         VS_ComandoCurso:= VS_ComandoCurso+' Where NomeCurso Like '+#39+MaskEdit_CodCurso.Text+'%'+#39;
   end;

   VS_ComandoCurso:= VS_ComandoCurso+' order by ';

   Funcoes.ExecutaQuery(Query_MontaCurso, VS_ComandoCurso + OrderByCurso);
end;

procedure TForm_Estatistica_Curso.DBGrid_CursoTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Cod. Curso' then
       OrderByCurso:= ' CodCurso'
   else
     if trim(column.Title.Caption) = 'Nome Curso' then
         OrderByCurso:= ' NomeCurso';
   Funcoes.ExecutaQuery(Query_MontaCurso, VS_ComandoCurso + OrderByCurso);

end;


procedure TForm_Estatistica_Curso.Query_MontaCursoAfterScroll(DataSet: TDataSet);
var
   VS_Comando: String;
   VI_Cont, VI_TamOpcaoVetor: Integer;
begin
   VS_Comando:= 'Select IdTurma from Turma where IdCurso = '+Query_MontaCurso.FieldByName('IdCurso').AsString;
   Funcoes.OpenQuery(VS_Comando);

   DM.IBQuery_Executa.First;

   VS_comando:= 'Select IdCurso, IdTurma, CodMateria,NomeMateria, NumeroAulasTeoricas, NumeroAulasPraticas From MateriaCurso Curso Where IdCurso = '+Query_MontaCurso.FieldByName('IdCurso').AsString+' and IdTurma = 0';
   Funcoes.ExecutaQuery(IBQuery_Disciplinas, VS_Comando+' order by CodMateria');

   //---
   //--- Tratamento do Cabecalho

   IBQuery_Disciplinas.Last;
   VI_TamOpcaoVetor:= IBQuery_Disciplinas.RecordCount+1;
   DBGrid_Lista.RowCount:= VI_TamOpcaoVetor;

   DBGrid_Lista.Cells[0,0]:= 'DISCIPLINA';
   DBGrid_Lista.Cells[1,0]:= 'DESCRIÇÃO';
   DBGrid_Lista.Cells[2,0]:= 'QTD ITENS';
   DBGrid_Lista.Cells[3,0]:= 'QTD IDEAL';
   VI_Cont:= 1;
   IBQuery_Disciplinas.First;

   While Not IBQuery_Disciplinas.Eof do
   begin
      VS_Comando:= 'select count(1) as Qtd ' +
                   ' From Item_Prova '+
                   ' where idCurso = '+IBQuery_Disciplinas.FieldByName('IdCurso').AsString+
                   ' and IdTurma = '+IBQuery_Disciplinas.FieldByName('IdTurma').AsString+
                   ' and codMateria = '+#39+IBQuery_Disciplinas.FieldByName('CodMateria').AsString+#39;
      Funcoes.OpenQuery(VS_Comando);



      DBGrid_Lista.Cells[0, VI_Cont]:= IBQuery_Disciplinas.FieldByName('CodMateria').AsString;
      DBGrid_Lista.Cells[1, VI_Cont]:= IBQuery_Disciplinas.FieldByName('NomeMateria').AsString;
      DBGrid_Lista.Cells[2, VI_Cont]:= FormatFloat('0000',DM.IBQuery_Executa.FieldByName('Qtd').AsInteger);
      DBGrid_Lista.Cells[3, VI_Cont]:= FormatFloat('000', Query_MontaCurso.FieldByName('NUMERO_IDEAL_ITENS').AsInteger*(IBQuery_Disciplinas.FieldByName('NumeroAulasTeoricas').AsInteger+IBQuery_Disciplinas.FieldByName('NumeroAulasPraticas').AsInteger));
      VI_Cont:= VI_Cont+1;
      IBQuery_Disciplinas.Next;
   end;
end;

procedure TForm_Estatistica_Curso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.

