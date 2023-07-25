//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Sel_Disciplina.pas                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da Selecao  //
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
// DATA                      : 03/09/2019                                     //
// AUTOR                     : Osvaldir                                       //
// MODULO ALTERADO           : JvTransparentButton_InserirNovaFichaClick      //
// MOTIVO                    : Permitir gerar o mesmo numero de exercicio para//
//                             instrutor diferente.                           //
//----------------------------------------------------------------------------//

unit Sel_Avaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvLookOut, JvCheckBox, JvTransBtn;

type
  TForm_Sel_Avaliacao = class(TForm)
    PageControl_CadTurma: TPageControl;
    TabSheet_Instrutor: TTabSheet;
    DBGrid_SelecionaInstrutor: TDBGrid;
    TabSheet_Aluno: TTabSheet;
    DBGrid_SelecionaAluno: TDBGrid;
    Panel_CadastroAvl: TPanel;
    JvCaptionPanel_Regras: TJvCaptionPanel;
    Memo_Regra: TMemo;
    JvGradient2: TJvGradient;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    JvDBDateEdit_DataAvaliacao: TJvDBDateEdit;
    DBEdit_NomeAluno: TDBEdit;
    DBEdit_NomeInstrutor: TDBEdit;
    DBEdit_Local: TDBEdit;
    CheckBox_Estagiario: TCheckBox;
    JvShape1: TJvShape;
    JvTransparentButton_InserirNovaFicha: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit_Tempo: TDBEdit;
    DBComboBox_Setor: TDBComboBox;
    JvEnterAsTab1: TJvEnterAsTab;
    StatusBar2: TStatusBar;
    Edit_Exercicio: TEdit;
    Label_Indicacao: TLabel;

    procedure Inserir;

    procedure FormActivate(Sender: TObject);

    procedure CheckBox_EstagiarioClick(Sender: TObject);
    procedure IBQuery_AlunoTurmaAfterScroll(DataSet: TDataSet);
    procedure DBGrid_SelecionaInstrutorDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_SelecionaAlunoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBEdit_ExercicioEnter(Sender: TObject);
    procedure DBEdit_ExercicioExit(Sender: TObject);
    procedure IBTable_Cad_FichaAvlPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);

    procedure AfterDelete(DataSet: TDataSet);
    procedure AfterEdit(DataSet: TDataSet);
    procedure AfterInsert( DataSet: TDataSet);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_InserirNovaFichaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_ExercicioKeyPress(Sender: TObject; var Key: Char);

  private    { Private declarations }

  public    { Public declarations }

  end;
var
  Form_Sel_Avaliacao: TForm_Sel_Avaliacao;

implementation

uses Login, Module, FichaAvaliacao, Sel_Fichas, Frame_Sel_Curso;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.FormActivate(Sender: TObject);
begin
   Form_Login.VS_Iniciar:= 'FICHA AVL';

   DM.IBQuery_InstrutorTurma.Open;
   DM.IBQuery_Ficha_Item_View.Open;
   DM.IBTable_Aluno.MasterSource:= DM.DSQ_AlunoTurma;

   Funcoes.TrataSetor(Frame_SelCurso.ComboBox_Turma.Text, DBComboBox_Setor);

//   JvCaptionPanel_Regras__.Visible:= False;
   JvDBDateEdit_DataAvaliacao.Date:= Date;
   PageControl_CadTurma.TabIndex:= 1;

   Inserir;
end;

//------------------------------------------------------------------------------
//--- Tratamento do Botao para cadastrar uma nova Ficha
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.Inserir;
begin
   Form_Sel_Fichas.VS_opcao:= 'Inserir';

   if DM.IBTable_Aluno.FieldByName('Estagiario').AsString = 'S' then
       CheckBox_Estagiario.State:= cbChecked
   else
       CheckBox_Estagiario.State:= cbUnchecked;

   Edit_Exercicio.Text:= '';
   DM.IBTable_Cad_FichaAvl.Append;
   DM.IBTable_Cad_FichaAvl.FieldByName('Id_Exercicio').AsString:= '';
   DM.IBTable_Cad_FichaAvl.FieldByName('Setor').AsString:= '';
   DM.IBTable_Cad_FichaAvl.FieldByName('Data_avl').AsString:= DateToStr(Date);
   DM.IBTable_Cad_FichaAvl.FieldByName('Local').AsString:= Funcoes.GetLocalAvl;
   DM.IBTable_Cad_FichaAvl.FieldByName('HORARIO_INICIO').AsString:= '01:00';
   Edit_Exercicio.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_InserirNovaFichaClick(Sender: TObject);
var
   VS_Exercicio, VS_Where, VS_Comando, VS_NA: String;
   VB_Montar_FichaAvl: Boolean;
   VI_Cont: Integer;
begin
   if DM.IBQuery_AlunoTurma.FieldByName('Identidade').AsString = '' then
      ShowMessage('Não possuí aluno Cadastrado...')
   else
   begin
      if DM.IBQuery_InstrutorTurma.FieldByName('Identidade').AsString = '' then
         ShowMessage('Não possuí Instrutor Cadastrado...')
      else
      begin
         if Edit_Exercicio.Text = '' then
         begin
            ShowMessage('O número do Execicico não pode ser branco...');
            Edit_Exercicio.SetFocus;
         end
         else
         begin
            if Trim(Funcoes.DePara(JvDBDateEdit_DataAvaliacao.Text,'/', '')) = '' then
            begin
               ShowMessage('A Data da Avaliação não pode ser branca...');
               JvDBDateEdit_DataAvaliacao.SetFocus;
            end
            else
            begin
               if DBComboBox_Setor.Text = '' then
               begin
                  ShowMessage('O Setor da Avaliação não pode ser branco...');
                  DBComboBox_Setor.SetFocus;
               end
               else
               begin
                  if DBEdit_Tempo.Text = '  :  ' then
                  begin
                     ShowMessage('O Tempo da Avaliação não pode ser branco...');
                     DBEdit_Tempo.SetFocus;
                  end
                  else
                  begin
                     if DBEdit_Local.Text = '' then
                     begin
                        ShowMessage('O Local da Avaliação não pode ser branca...');
                        DBEdit_Local.SetFocus;
                     end
                     else
                     begin
                        if DM.IBQuery_AlunoTurma.FieldByName('Identidade').AsString = DM.IBQuery_InstrutorTurma.FieldByName('Identidade').AsString  then
                           ShowMessage('O instrutor não pode avaliar ele mesmo...')
                        else
                        begin
                           VS_Exercicio:= Funcoes.TratarExercicio(Edit_Exercicio.Text);

                           VS_Where:= ' Where IDCURSO = '+DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+
                                      ' and   IDTURMA = '+DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+
                                      ' and   ID_ATCO = '+#39+DM.IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+
                                      ' and   ID_FICHA = '+DM.IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString+
                                      ' and   ID_Instrutor = '+#39+DM.IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39+
                                      ' and   Id_EXERCICIO = '+VS_Exercicio+
                                      ' and   Setor = '+#39+copy(DBComboBox_Setor.Text,1,10)+#39;

                           Funcoes.OpenQueryProsima( DM.IBQuery_ExecutaProsima, 'Select count(1) as Qtd From Cad_Ficha_Avl '+VS_Where );

                           if DM.IBQuery_ExecutaProsima.FieldByName('Qtd').AsInteger > 0 then
                               ShowMessage('Já existe Ficha de Avaliação Cadastrada...')
                           else
                           begin
                              VS_Comando:= ' Select IdCurso, IdTurma, Id_Ficha, Id_ATCO, ID_Exercicio, Exercicio,  Id_Instrutor, NomeInstrutor, Data_Avl, FichaCompleta, Local, Media, NomeAluno, NS, Parecer, Setor, Horario_Inicio ' +
                                           ' From CAD_FICHA_AVL  '+
                                            VS_Where+
                                           ' Order By NomeAluno, Exercicio, setor  ';

                              //--- Cadastra o Cabecalho da Ficha de Avaliacao

                              if ((DM.IBTable_Cad_FichaAvl.State <> DSInsert) and (DM.IBTable_Cad_FichaAvl.State <> DSEdit )) then
                                 DM.IBTable_Cad_FichaAvl.Append;

                              DM.IBTable_Cad_FichaAvl.FieldByName('IDCURSO').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString;
                              DM.IBTable_Cad_FichaAvl.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString;
                              DM.IBTable_Cad_FichaAvl.FieldByName('ID_ATCO').AsString:= DM.IBQuery_AlunoTurma.FieldByName('Identidade').AsString;
                              DM.IBTable_Cad_FichaAvl.FieldByName('ID_INSTRUTOR').AsString:= DM.IBQuery_InstrutorTurma.FieldByName('Identidade').AsString;
                              DM.IBTable_Cad_FichaAvl.FieldByName('ID_FICHA').AsString:= DM.IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString;
                              DM.IBTable_Cad_FichaAvl.FieldByName('EXERCICIO').AsString:= Edit_Exercicio.Text;
                              DM.IBTable_Cad_FichaAvl.FieldByName('ID_EXERCICIO').AsString:= VS_Exercicio;
                              DM.IBTable_Cad_FichaAvl.FieldByName('FICHACOMPLETA').AsString:= 'N';
                              DM.IBTable_Cad_FichaAvl.FieldByName('NOMEALUNO').AsString:= DM.IBQuery_AlunoTurma.FieldByName('NOMECOMPLETO').AsString;
                              DM.IBTable_Cad_FichaAvl.FieldByName('NOMEINSTRUTOR').AsString:= DM.IBQuery_InstrutorTurma.FieldByName('NOMECOMPLETO').AsString;
                              DM.IBTable_Cad_FichaAvl.FieldByName('SETOR').AsString:= DBComboBox_Setor.Text;

                              if ((DM.IBTable_Cad_FichaAvl.State = DSInsert) or (DM.IBTable_Cad_FichaAvl.State = DSEdit )) then
                                 DM.IBTable_Cad_FichaAvl.Post;
                              Funcoes.ExecutaTransacao_Prosima;

                              VB_Montar_FichaAvl:= False;

                              While VB_Montar_FichaAvl = False do
                              begin
                                 Funcoes.ExecSqlProsima( 'Delete From PR_Avaliacao '+VS_Where);   //--- Elimina a Ficha de Avaliacoes se já foi Cadastrada

                                 Funcoes.ExecSqlProsima( 'Delete From Rel_NS '+VS_Where);        //--- Elimina a Ficha de NS se já foi Cadastrada

                                 VI_Cont:= 1;
                                 DM.IBQuery_Ficha_Item_View.First;
                                 While not DM.IBQuery_Ficha_Item_View.Eof do
                                 begin
                                    if DM.IBQuery_Ficha_Item_View.FieldByName('ID_ITEM').AsString = 'J' then
                                    begin
                                       if (( copy(Frame_SelCurso.ComboBox_Turma.Text,5,3) = 'TWR')) then
                                          VS_NA:= '1'
                                       else
                                          VS_NA:= '0';
                                    end
                                    else
                                    VS_NA:= '0';

                                    Funcoes.ExecSqlProsima('Insert Into PR_Avaliacao (IDCURSO, IDTURMA, ID_FICHA, ID_ATCO, Id_Instrutor, Id_Exercicio, Setor, ID_Item, ID_Avl, Otimo, Bom, Regular, NS, NA, Area_Avaliacao, Descricao) '+
                                                           ' Values ('+DM.IBQuery_MontaTurma.FieldByName('IDCURSO').AsString+', '+
                                                                       DM.IBQuery_MontaTurma.FieldByName('IDTURMA').AsString+', '+
                                                                       DM.IBQuery_Ficha_Item_View.FieldByName('ID_FICHA').AsString+', '+
                                                                       #39+DM.IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39+', '+
                                                                       #39+DM.IBQuery_InstrutorTurma.FieldByName('Identidade').AsString+#39+', '+
                                                                       VS_Exercicio+', '+
                                                                       #39+DBComboBox_Setor.Text+#39+', '+
                                                                       #39+DM.IBQuery_Ficha_Item_View.FieldByName('ID_ITEM').AsString+#39+', '+
                                                                       DM.IBQuery_Ficha_Item_View.FieldByName('ID_Avl').AsString+', '+
                                                                       #39+'0'+#39+', '+
                                                                       #39+'0'+#39+', '+
                                                                       #39+'0'+#39+', '+
                                                                       #39+'0'+#39+', '+
                                                                       #39+VS_NA+#39+', '+
                                                                       #39+DM.IBQuery_Ficha_Item_View.FieldByName('AREA_AVALIACAO').AsString+#39+', '+
                                                                       #39+DM.IBQuery_Ficha_Item_View.FieldByName('DESCRICAO').AsString+#39+
                                                                   ') '
                                                          );
                                    DM.IBQuery_Ficha_Item_View.Next;
                                    Funcoes.ExecutaTransacao_Prosima;
                                    VI_Cont:= VI_Cont + 1;
                                 end;

                                 // verifica se  esta faltando item

                                 if VI_Cont < 51 then
                                 begin
                                    Funcoes.OpenQueryProsima( DM.IBQuery_OpenProsima, 'Select count(1) as Qtd From PR_Avaliacao '+VS_Where );
                                    if DM.IBQuery_OpenProsima.FieldByName('Qtd').AsInteger = 51 then
                                       VB_Montar_FichaAvl:= True;
                                 end
                                 else
                                    VB_Montar_FichaAvl:= True;
                              end;

                              DM.IBQuery_CadFichaAvl.Close;
                              DM.IBQuery_CadFichaAvl.Sql.Clear;
                              DM.IBQuery_CadFichaAvl.Sql.Add(VS_Comando);
                              DM.IBQuery_CadFichaAvl.Open;

                              Funcoes.AtualizaQuery(DM.IBQuery_PR_Avaliacao);
                              Form_FichaAvaliacao.ShowModal;
                              Inserir;
                           end;
                        end;
                    end;
                 end
               end;
            end;
         end
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   DM.IBTable_Cad_FichaAvl.Cancel;
   Funcoes.abortaTransacao_Prosima;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento Quando Click no Check de Estagiario
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.CheckBox_EstagiarioClick(Sender: TObject);
begin
   DM.IBTable_Aluno.Edit;

   if CheckBox_Estagiario.State = cbChecked then
      DM.IBTable_Aluno.FieldByName('Estagiario').AsString:= 'S'
   else
      DM.IBTable_Aluno.FieldByName('Estagiario').AsString:= 'N';
   DM.IBTable_Aluno.Post;
   Funcoes.ExecutaTransacao_Prosima;
end;

//------------------------------------------------------------------------------
// Tratamento para Identificar se o Aluno é Estagiario
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.IBQuery_AlunoTurmaAfterScroll(  DataSet: TDataSet);
begin
   if DM.IBTable_Aluno.FieldByName('Estagiario').AsString = 'S' then
      CheckBox_Estagiario.State:= cbChecked
   else
      CheckBox_Estagiario.State:= cbUnchecked;
end;

//------------------------------------------------------------------------------
// Tratamento da Grid do Aluno
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBGrid_SelecionaAlunoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If Odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      DBGrid_SelecionaAluno.Canvas.Brush.Color:= clWhite             // Cor para linhas ímpares
   else
      DBGrid_SelecionaAluno.Canvas.Brush.Color:= $00EFEFEF;        // Cor para linhas pares

   // Testa se o registro da linha atual está selecionado

   If gdSelected in State Then
   Begin
      DBGrid_SelecionaAluno.Canvas.Brush.Color:= clNavy;          // Cor de fundo do registro selecionado
      DBGrid_SelecionaAluno.Canvas.Font.Color:= clYellow;        // Cor do texto para o registro selecionado
   End
   Else
      DBGrid_SelecionaAluno.Canvas.Font.Color:= clBlack;       // Cor do texto para registros não selecionados

   DBGrid_SelecionaAluno.Canvas.FillRect(Rect);   // Desenha o retângulo da célula
   DBGrid_SelecionaAluno.Canvas.TextRect(Rect, Rect.Left + 2,   // Apresenta o texto da célula
   Rect.Top, Column.Field.DisplayText);
end;

//------------------------------------------------------------------------------
// Tratamento da Grid do Instrutor
//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBGrid_SelecionaInstrutorDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If Odd(DBGrid_SelecionaInstrutor.DataSource.DataSet.RecNo) then
      DBGrid_SelecionaInstrutor.Canvas.Brush.Color:= clWhite      // Cor para linhas ímpares
   else
      DBGrid_SelecionaInstrutor.Canvas.Brush.Color:= $00EFEFEF;    // Cor para linhas pares

   // Testa se o registro da linha atual está selecionado
   If gdSelected in State Then
   Begin
      DBGrid_SelecionaInstrutor.Canvas.Brush.Color:= clNavy;       // Cor de fundo do registro selecionado
      DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clYellow;      // Cor do texto para o registro selecionado
   End
   Else   // Cor do texto para registros não selecionados
      DBGrid_SelecionaInstrutor.Canvas.Font.Color:= clBlack;

   DBGrid_SelecionaInstrutor.Canvas.FillRect(Rect);
   DBGrid_SelecionaInstrutor.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBEdit_ExercicioEnter(Sender: TObject);
begin
   if  ((copy(Frame_SelCurso.ComboBox_Turma.Text,5,3) = 'TWR' )) then
      JvCaptionPanel_Regras.Visible:= True;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

procedure TForm_Sel_Avaliacao.DBEdit_ExercicioExit(Sender: TObject);
begin
   JvCaptionPanel_Regras.Visible:= False;
end;

procedure TForm_Sel_Avaliacao.IBTable_Cad_FichaAvlPostError( DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
     if (E as EDBEngineError).Errors[0].Errorcode = 9729 then
     begin
        MessageDlg('  Ficha já cadastrada...  ',mtError, [mbOk],0);
        DM.IBTable_Cad_FichaAvl.Cancel;
        Funcoes.ExecutaTransacao_Prosima;
        Close;
     end;
end;

procedure TForm_Sel_Avaliacao.AfterDelete(DataSet: TDataSet);
begin
   DM.IBTransaction_Paels.CommitRetaining;
end;

procedure TForm_Sel_Avaliacao.AfterEdit(DataSet: TDataSet);
begin
   DM.IBTransaction_Paels.CommitRetaining;
end;

procedure TForm_Sel_Avaliacao.AfterInsert( DataSet: TDataSet);
begin
   DM.IBTransaction_Paels.CommitRetaining;
end;

procedure TForm_Sel_Avaliacao.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   DM.IBQuery_AlunoTurma.Close;
   DM.IBQuery_InstrutorTurma.Close;
   DM.IBTable_Aluno.Close;
   DM.IBQuery_Ficha_Item_View.Close;
end;

procedure TForm_Sel_Avaliacao.Edit_ExercicioKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['0'..'9', chr(8), '-']) then
       key:= #0;
end;

end.

