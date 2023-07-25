//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Materia.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das Disciplinas dos Cursos.                    //
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

unit Cad_Disciplina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvTransBtn;

type
  TForm_Cad_Disciplina = class(TForm)
    DST_Materia: TDataSource;
    IBTable_Materia: TIBTable;
    IBTable_MateriaIDCURSO: TSmallintField;
    IBTable_MateriaCODMATERIA: TIBStringField;
    IBTable_MateriaNOMEMATERIA: TIBStringField;
    IBTable_MateriaNUMEROAULASTEORICAS: TSmallintField;
    IBTable_MateriaNUMEROAULASPRATICAS: TSmallintField;
    IBTable_MateriaFASE: TIBStringField;
    IBTable_MateriaIDTURMA: TIntegerField;
    IBTable_MateriaQTD_OBJETIVOS: TIntegerField;
    IBTable_MateriaESPECIALIDADE: TIBStringField;
    IBTable_MateriaATUALIZACAO: TDateTimeField;
    IBTable_MateriaANO: TIBStringField;
    JvGradient1: TJvGradient;
    Label_AnoRef: TLabel;
    Label_Atualiza: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label_Mat_Curso_1: TLabel;
    Label_Mat_Curso_2: TLabel;
    Label_Mat_Curso_5: TLabel;
    Label_Mat_Curso_4: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    DBEdit_Ano: TDBEdit;
    JvDBDateEdit_DataAtualizacao: TJvDBDateEdit;
    DBComboBox_Fase: TDBComboBox;
    DBEdit_NObjetivos: TDBEdit;
    DBEdit_NAulasPraticas: TDBEdit;
    DBEdit_NAulasTeoricas: TDBEdit;
    DBRichEdit_Descricao: TDBRichEdit;
    Edit_CodMateria: TDBEdit;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_ConfigurarImpressora: TJvTransparentButton;
    Memo_Msg02: TMemo;
    Memo1: TMemo;
    Label3: TLabel;

    procedure FormActivate(Sender: TObject);

    procedure Fechar;
    procedure Inserir;
    procedure Alterar;

    procedure IBTable_MateriaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure JvEdit_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_CodMateriaChange(Sender: TObject);
    procedure Edit_CodMateriaKeyPress(Sender: TObject; var Key: Char);
    procedure DBRichEdit_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NAulasTeoricasKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NAulasPraticasKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit_NObjetivosKeyPress(Sender: TObject; var Key: Char);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_ConfigurarImpressoraClick( Sender: TObject);

  private    { Private declarations }
      VS_CodMateriaOld: String;
  public    { Public declarations }
  end;
var
  Form_Cad_Disciplina: TForm_Cad_Disciplina;

implementation

uses Sel_Curso, Module, Sel_Disciplina;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.FormActivate(Sender: TObject);
var
   Status: Boolean;
begin
   IBTable_Materia.Open;

   if DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsInteger = 0 then
      Status:= True
   else
      Status:= False;

   Label_AnoRef.Visible:= Status;
   DBEdit_Ano.Visible:= Status;
   Label_Atualiza.Visible:= Status;
   JvDBDateEdit_DataAtualizacao.Visible:= Status;

   if Form_Sel_Disciplina.VS_Opcao = 'Inserção' then
      Inserir
   else
      Alterar;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Materia.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
//
// Tratamento Materia
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao nova materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.Inserir;
begin
   IBTable_Materia.Append;
   IBTable_Materia.FieldByName('IdCurso').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
   IBTable_Materia.FieldByName('IdTurma').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
   IBTable_Materia.FieldByName('CodMateria').AsString:= '';
   IBTable_Materia.FieldByName('NomeMateria').AsString:= '';
   IBTable_Materia.FieldByName('NumeroAulasTeoricas').AsInteger:= 0;
   IBTable_Materia.FieldByName('NumeroAulasPraticas').AsInteger:= 0;
   IBTable_Materia.FieldByName('Fase').AsString:= 'PRESENCIAL';
   Edit_CodMateria.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.Alterar;
begin
   IBTable_Materia.Edit;
   
   VS_CodMateriaOld:= IBTable_Materia.FieldByName('CodMateria').AsString;
   Edit_CodMateria.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.JvTransparentButton_GravaClick(Sender: TObject);
begin
   if  IBTable_Materia.FieldByName('CodMateria').AsString = '' then
   begin
      Showmessage('O código da disciplina não pode ser branco...');
      Edit_CodMateria.SetFocus;
   end
   else
   begin
      Funcoes.GravaAcesso('Menu Principal - Cadastro Disciplina', Form_Sel_Disciplina.VS_Opcao+' Disciplina '+IBTable_Materia.FieldByName('CodMateria').AsString+' - Usuario: '+Funcoes.GetUsuario);

      if ((IBTable_Materia.State = DSInsert) or (IBTable_Materia.State = DSEdit )) then
         IBTable_Materia.Post;

      //---
      // Verifica se existe Item na Disciplina Alterada

      if Form_Sel_Disciplina.VS_Opcao = 'Alteração' then
      begin
         if IBTable_Materia.FieldByName('CodMateria').AsString <> VS_CodMateriaOld then
         begin
            Funcoes.ExecusaoQuery('Update Item_Prova set CodMateria = '+#39+IBTable_Materia.FieldByName('CodMateria').AsString+#39+', '+
                                  '                Disciplina = '+#39+Copy(IBTable_Materia.FieldByName('CodMateria').AsString,1,2)+#39+', '+
                                  '                Unidade = '+#39+Copy(IBTable_Materia.FieldByName('CodMateria').AsString,3,2)+#39+
                                  ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                  ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                  ' and CodMateria = '+#39+VS_CodMateriaOld+#39
                                 );

            Funcoes.ExecusaoQuery('Update ItemTeste set Materia = '+#39+IBTable_Materia.FieldByName('CodMateria').AsString+#39+
                                  ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                  ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                  ' and Materia = '+#39+VS_CodMateriaOld+#39
                                 );

            Funcoes.ExecusaoQuery('Update FA_Avaliacao set Disciplina = '+#39+IBTable_Materia.FieldByName('CodMateria').AsString+#39+
                                  ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                  ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                  ' and Disciplina = '+#39+VS_CodMateriaOld+#39
                                 );

            Funcoes.ExecusaoQuery('Update FA_Relacao set Disciplina = '+#39+IBTable_Materia.FieldByName('CodMateria').AsString+#39+
                                  ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                  ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                  ' and Disciplina = '+#39+VS_CodMateriaOld+#39
                                 );

            Funcoes.ExecusaoQuery('Update FA_Resposta set Disciplina = '+#39+IBTable_Materia.FieldByName('CodMateria').AsString+#39+
                                  ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                  ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                  ' and Disciplina = '+#39+VS_CodMateriaOld+#39
                                 );

            Funcoes.ExecusaoQuery('Update FA_Comentario set Disciplina = '+#39+IBTable_Materia.FieldByName('CodMateria').AsString+#39+
                                  ' Where IdCurso = '+DM.IBQuery_MontaTurma.FieldByName('IdCurso').AsString+
                                  ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString+
                                  ' and Disciplina = '+#39+VS_CodMateriaOld+#39
                                 );
         end
      end;

      if Form_Sel_Disciplina.VS_Opcao = 'Inserção' then
      begin
         Funcoes.AtualizaQuery(Form_Sel_Disciplina.IBQuery_Materia);
         Inserir;
      end
      else
         Fechar;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.JvTransparentButton_ConfigurarImpressoraClick(Sender: TObject);
begin
   if ((IBTable_Materia.State = DSInsert) or (IBTable_Materia.State = DSEdit )) then
      IBTable_Materia.Cancel;

   Fechar;
end;

//------------------------------------------------------------------------------
// Fecha a Janela de Tratamento da Disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.Fechar;
begin
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(Form_Sel_Disciplina.IBQuery_Materia);
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro na entrada da materia do Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.IBTable_MateriaPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
     if (E as EDBEngineError).Errors[0].Errorcode = 9729 then
     begin
        MessageDlg('  Disciplina já foi cadastrada...  ',mtError, [mbOk],0);
        Edit_CodMateria.SetFocus;
     end;
end;

//------------------------------------------------------------------------------
// Tratamento do Filtro que permite entrar somente com numero no Cod Materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.JvEdit_DescricaoKeyPress(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

procedure TForm_Cad_Disciplina.Edit_CodMateriaChange(Sender: TObject);
begin
   if copy(Edit_CodMateria.Text,3,4) = '0000' then
      DBRichEdit_Descricao.Width:= 585
   else
      DBRichEdit_Descricao.Width:= 576;
end;

procedure TForm_Cad_Disciplina.Edit_CodMateriaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
       DBRichEdit_Descricao.SetFocus;
end;

procedure TForm_Cad_Disciplina.DBRichEdit_DescricaoKeyPress( Sender: TObject; var Key: Char);
begin
   if key = #13 then
       DBEdit_NAulasTeoricas.SetFocus;
end;

procedure TForm_Cad_Disciplina.DBEdit_NAulasTeoricasKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
       DBEdit_NAulasPraticas.SetFocus;
end;

procedure TForm_Cad_Disciplina.DBEdit_NAulasPraticasKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
       DBEdit_NObjetivos.SetFocus;
end;

procedure TForm_Cad_Disciplina.DBEdit_NObjetivosKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
       DBComboBox_Fase.SetFocus;
end;

end.

