//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Sel_Disciplina.pas                             //
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

unit Con_InstrutoresMateria;

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
  JvxClock, JvGroupHeader, JvTransBtn;

type
  TForm_Con_InstrutoresMateria = class(TForm)
    Panel_Treeviw: TPanel;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_Descricao: TJvEdit;
    DBGrid_Disciplina: TDBGrid;
    IBQuery_Materia: TIBQuery;
    DSQ_Materia: TDataSource;
    IBQuery_MateriaIDCURSO: TSmallintField;
    IBQuery_MateriaCODMATERIA: TIBStringField;
    JvEdit_CodMateria: TJvEdit;
    IBQuery_MateriaNOMEMATERIA: TIBStringField;
    Panel2: TPanel;
    DBGrid_Intrutores: TDBGrid;
    IBQuery_Instrutor: TIBQuery;
    DSQ_Instrutor: TDataSource;
    IBQuery_InstrutorIDENTIDADE: TIBStringField;
    IBQuery_InstrutorPOSTOGRADUACAO: TIBStringField;
    IBQuery_InstrutorNOMEGUERRA: TIBStringField;
    Panel_Botoes: TPanel;
    JvGradient1: TJvGradient;
    JvShape8: TJvShape;
    JvTransparentButton_Atualiza: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape2: TJvShape;
    Label1: TLabel;
    ComboBox_Curso: TComboBox;
    Memo1: TMemo;
    Panel7: TPanel;
    JvShape1: TJvShape;
    JvTransparentButton_Observacao: TJvTransparentButton;

    procedure MontaCurso(PS_Curso: String; Sender: TObject);
    procedure MontaDisciplina(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure JvEdit_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton_AtualizaTurmaClick(Sender: TObject);
    procedure ComboBox_CursoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizaClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_ObservacaoClick(Sender: TObject);

  private    { Private declarations }
      VS_IdCurso, VS_CodCurso: String;
  public    { Public declarations }
     VS_Opcao: String;
  end;
var
  Form_Con_InstrutoresMateria: TForm_Con_InstrutoresMateria;

implementation

uses Module, Cad_Instrutores, Sel_Turma;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'CertidaoCurricular')) then
   begin
      Funcoes.CabecalhoForm( Form_Con_InstrutoresMateria, ' Seleção de Instrutor');

      Funcoes.SetCadCurso('CadCurso');

      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Instrutor - Consulta Instrutor por Matéria');    // Abre o perfil do usuario em relacao a agenda

      //--- Tratamento da Selecao dos Cursos

      Funcoes_Sue.AlimentaCurso(ComboBox_Curso);
      MontaCurso(Funcoes.GetCodCurso, Sender);
   end;
end;

procedure TForm_Con_InstrutoresMateria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Instrutor.Close;
   IBQuery_Materia.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Combox de Selecao de Curso
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.ComboBox_CursoChange(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text, Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.JvTransparentButton_AtualizaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Materia);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.MontaCurso(PS_Curso: String; Sender: TObject);
begin
   if VS_CodCurso <> PS_Curso then
   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Select IdCurso, CodCurso, NomeCurso From Curso where codcurso = '+#39+PS_Curso+#39);

         if Trim(DM.IBQuery_Executa.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= DM.IBQuery_Executa.FieldByName('CodCurso').AsString;

            VS_IdCurso:= DM.IBQuery_Executa.FieldByNAme('IdCurso').AsString;
            VS_CodCurso:= ComboBox_Curso.Text;

            MontaDisciplina(Sender);
          end
          else
          begin
             Showmessage('Curso não Cadastrado.');
          end;
       end;
   end;
end;

//------------------------------------------------------------------------------
// Atualiza Materia
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.SpeedButton_AtualizaTurmaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Materia);
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da Metria pelo Codigo
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.MontaDisciplina;
var
   VS_Comando: String;
begin
   VS_Comando:= ' Select Distinct IdCurso, CodMateria, NomeMateria From Materiacurso Where IdCurso = '+VS_IdCurso;

   if  trim(JvEdit_CodMateria.Text) <> '' then
      VS_Comando:= VS_Comando + ' and CodMateria like '+#39+JvEdit_CodMateria.Text+'%'+#39;

   if  trim(JvEdit_Descricao.Text) <> '' then
      VS_Comando:= VS_Comando + ' and NomeMateria like '+#39+JvEdit_Descricao.Text+'%'+#39;

   VS_Comando:= VS_Comando + ' Order by CodMateria ';

   Funcoes.ExecutaQuery( IBQuery_Materia, VS_Comando);
   IBQuery_Instrutor.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do Filtro que permite entrar somente com numero no Cod Materia
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.JvEdit_DescricaoKeyPress(Sender: TObject;var Key: Char);
begin
   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro da Disciplina
//
//------------------------------------------------------------------------------

procedure TForm_Con_InstrutoresMateria.JvTransparentButton_ObservacaoClick( Sender: TObject);
begin
   if IBQuery_Instrutor.FieldByName('Identidade').AsString = '' then
   begin
       ShowMessage(' O Instrutor não possuí Disciplina cadastrada...')
   end
   else
   begin
      Form_SelTurma.VS_Instrutor:= 'Consulta';
      Funcoes.ExecutaQuery(DM.IBQuery_Instrutor, 'Select C.CodCurso, It.IdCurso, It.nome, It.NomeGuerra, It.Identidade, It.Cpf, It.Posto, It.idunidade, It.idsubunidade, It.Status,It.CTP001, It.CTP006, It.CTP011, It.CPI, It.CTP500, It.LICENCIATURA, It.DESCLICENCIATURA, It.CG015, It.NENHUM '+
                                                 ' From Corpo_Docente_VIEW It, Curso C '+
                                                 ' where It.IdCurso = C.IdCurso '+
                                                 ' and   It.IdCurso = '+IBQuery_Materia.FieldByName('IdCurso').AsString+
                                                 ' and   It.Identidade = '+#39+IBQuery_Instrutor.FieldByName('Identidade').AsString+#39
                          );

      Application.CreateForm(TForm_Cad_Instrutor, Form_Cad_Instrutor);
      Funcoes.CabecalhoForm( Form_Cad_Instrutor, 'Consulta do Instrutor Por Matéria');
      Form_Cad_Instrutor.ShowModal;
   end;
end;

end.

