//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SUE                                            //
//                                                                            //
// PROGRAMA                  : Inicial.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade tratar da entrada   //
//                             Sistema.                                       //
//                                                                            //
// INICIO DA ELABORACAO      : 04/11/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Abertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, Mask, ExtCtrls, Rotinas,
  DB, IBCustomDataSet, IBQuery, IBTable, DBTables, jpeg, JvSpecialLabel,
  JvGradient, JvBlinkingLabel, JvBouncingLabel, JvLabel, JvAngleLabel,
  JvComponent, JvxCtrls, Menus, JvShape, XPMan, JvTransBtn;

type
  TForm_Abertura = class(TForm)
    JvGradient1: TJvGradient;
    StatusBar1: TStatusBar;
    JvTransparentButton_Iniciar: TJvTransparentButton;
    JvTransparentButton_Windows: TJvTransparentButton;
    Panel2: TPanel;
    Panel_Informacoes: TPanel;
    Label2: TLabel;
    MaskEdit_Senha: TMaskEdit;
    Label1: TLabel;
    MaskEdit_Nome: TMaskEdit;
    Label3: TLabel;
    ComboBox_Curso: TComboBox;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label_Versao: TLabel;
    Image_Brasao: TImage;
    Label4: TLabel;
    ComboBox_prova: TComboBox;
    Label8: TLabel;
    ComboBox_Turma: TComboBox;
    Label_Data: TLabel;

    Function  Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;

    procedure Abertura(VS_Usuario: String; VS_Senha: String; VS_Acesso: String; PS_CodUsuario: String);
    procedure Usuario_Nao_Encontrado;
    procedure MaskEdit_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_IniciarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure ComboBox_CursoExit(Sender: TObject);
    procedure ComboBox_TurmaExit(Sender: TObject);
    procedure ComboBox_provaExit(Sender: TObject);

  private    { Private declarations }
    VI_Tentativas: integer;
  public     { Public declarations }
     VS_NomeGuerra, VS_Instrutor, VS_Identidade, VS_Referenciaavaliacao, VS_CodProva, VS_IdCurso, VS_IdTurma, VS_Status_Aplicacao: String;
  end;

var
  Form_Abertura: TForm_Abertura;

implementation

uses Module, Sel_ItemProva;


{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormActivate(Sender: TObject);
begin
   VS_IdCurso:= '';
   VS_IdTurma:= '';
   Label_Versao.Caption:= Versao;
   Label_Data.Caption:= Ultima_Atualizacao;

   ComboBox_Curso.Items.Clear;
   ComboBox_Turma.Items.Clear;
   ComboBox_prova.Items.Clear;

   //--- Monta a rela��o de Cursos Ativos

   //--- Monta a rela��o de Cursos Ativos

   Funcoes.OpenQuery('Select Distinct tu.IdCurso, tu.CodCurso '+
                     ' From TURMAS_EM_ANDAMENTO_VIEW tu, Teste te '+
                     ' Where tu.IdCurso = te.IdCurso '+
                     ' and te.Status_Aplicacao is not null '+
                     ' and (te.Status_Aplicacao = '+#39+'STAND BY'+#39+' or te.Status_Aplicacao = '+#39+'STANDY BY'+#39+')'+
                     ' order by tu.CodCurso'
                    );

   ComboBox_Curso.Text:= '';
   While not DM.IBQuery_Executa.Eof do
   begin
      ComboBox_Curso.Items.Add(DM.IBQuery_Executa.FieldByName('CodCurso').AsString);
      DM.IBQuery_Executa.Next;
   end;

   //--- Tratamento para verificar se
   if not DirectoryExists('C:\DataBase_ICEA\Ensino') then
       ForceDirectories('C:\DataBase_ICEA\Ensino');

   if FileExists('C:\DataBase_ICEA\Ensino\Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Brasao_Ensino.jpg');

   MaskEdit_Nome.Text:= '';
   ComboBox_Curso.SetFocus;
end;

//------------------------------------------------------------------------------
// Sai do Sistema e retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_Abertura.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Application.Terminate;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Continuar
//------------------------------------------------------------------------------

procedure TForm_Abertura.JvTransparentButton_IniciarClick(Sender: TObject);
begin
  if Busca_Usuario(MaskEdit_Nome.Text, MaskEdit_Senha.Text) = False then
      Usuario_Nao_Encontrado
   else
      Abertura(MaskEdit_Nome.Text, MaskEdit_Senha.Text, '', '');
end;

//------------------------------------------------------------------------------
// Tratamento de verificacao do usuario e seu acesso
//------------------------------------------------------------------------------

procedure TForm_Abertura.Abertura(VS_Usuario: String; VS_Senha: String; VS_Acesso: String; PS_CodUsuario: String);
begin
   //--- Monta query de selecao de Materia

   Funcoes.OpenQuery('select i.IdCurso, m.IdTurma, i.Identidade, m.CodMateria, m.NomeMateria, m.NumeroAulasTeoricas, m.NumeroAulasPraticas '+
                     ' From InstrutorMateria i, MateriaCurso m '+
                     ' Where i.IdCurso = m.IdCurso '+
                     ' and   i.CodMateria = m.CodMateria '+
                     ' and   IdCurso = '+#39+VS_IdCurso+#39+
                     ' and   IdTurma = '+#39+VS_IdTurma+#39+
                     ' and   Identidade = '+#39+VS_Identidade+#39
                    );

   if DM.IBQuery_Executa.FieldByName('IdCurso').AsString = '' then
   begin
      ShowMessage(#13+'Verifique junto a se��o de avalia��o se os itens da prova est�o dispon�veis para serem revisados'+#13+'e se foi montado a abrangencia da prova...');
      MaskEdit_Nome.SetFocus;
   end
   else
   begin
      Form_Abertura.Left:= -3001;
      if ((VS_Status_Aplicacao = 'STAND BY') or (VS_Status_Aplicacao = 'STANDY BY')) then
      begin
         Funcoes.SetUsuario(VS_Usuario);
         Funcoes.SetCadCurso('MenuPrincipal');
         Application.CreateForm(TForm_Sel_ItemProva, Form_Sel_ItemProva);
         Form_Sel_ItemProva.ShowModal;
         Form_Sel_ItemProva.Free;
      end
      else
      begin
         ShowMessage('Prova n�o dispon�vel...');
         MaskEdit_Nome.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando eh pressionado a tecla ENTER no campo nome
//------------------------------------------------------------------------------

procedure TForm_Abertura.MaskEdit_NomeKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      MaskEdit_Senha.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando eh pressionado a tecla ENTER no campo senha
//------------------------------------------------------------------------------

procedure TForm_Abertura.MaskEdit_SenhaKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      JvTransparentButton_IniciarClick(Sender);

   if not (key in['0'..'9', chr(8)]) then
       key:= #0;
end;

//------------------------------------------------------------------------------
// Tratamento quando o usuario n�o foi encontrado
//------------------------------------------------------------------------------

procedure TForm_Abertura.Usuario_Nao_Encontrado;
begin
   MaskEdit_Nome.Text:= '';
   MaskEdit_Senha.Text:= '';
   VI_Tentativas:= VI_Tentativas + 1;
   if VI_Tentativas > 3 then
      Application.Terminate;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a janela de abertura
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

//------------------------------------------------------------------------------
// Descricao: Verifica se o usuario consta na lista de usuarios
// Data     :
//
// Atualizado em: 12/04/2005
// Descricao    : Auterado as mensagens.
//------------------------------------------------------------------------------

Function TForm_Abertura.Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
Var
   Status: Boolean;
begin
   Status:= False;

   if Trim(ComboBox_Curso.Text) = '' then
   begin
      MessageDlg('Para logar o sistema necessita selecionar o Curso...',mtError, [mbOk],0);
      ComboBox_Curso.SetFocus;
   end
   else
   begin
      if Trim(ComboBox_Turma.Text) = '' then
      begin
         MessageDlg('Para logar o sistema necessita selecionar a Turma...',mtError, [mbOk],0);
         ComboBox_Turma.SetFocus;
      end
      else
      begin
         if Trim(ComboBox_prova.Text) = '' then
         begin
            MessageDlg('Para logar o sistema necessita selecionar a Prova...',mtError, [mbOk],0);
            ComboBox_prova.SetFocus;
         end
         else
         begin
            if Trim(VS_Usuario) = '' then
            begin
               MessageDlg('Para logar o sistema o nome de guerra do instrutor n�o pode ser branco...',mtError, [mbOk],0);
               MaskEdit_Nome.SetFocus;
            end
            else
            begin
               if Trim(VS_Senha) = '' then
               begin
                  MessageDlg('Para logar o sistema a senha do instrutor n�o pode ser branco...',mtError, [mbOk],0);
                  MaskEdit_Senha.SetFocus;
               end
               else
               begin
                  if ((VS_Referenciaavaliacao = '') or (VS_CodProva = '')) then
                  begin
                     MessageDlg('Verifique se as informa��es inseridas est�o corretas...',mtError, [mbOk],0);
                     MaskEdit_Nome.SetFocus;
                  end
                  else
                  begin
                     Funcoes.OpenQuery( 'select a.idcurso, a.idturma, t.FaseAplicacao, t.referenciaavaliacao, t.CodProva,t.DataAplicacao, t.CodMateria, t.status_aplicacao,' +
                                        ' a.Identidade, a.nomeguerra, a.NomeCompleto, a.CodigoInstrutor '+
                                        ' From Instrutor_Turmas_View a, testes_view t'+
                                        ' where a.idcurso = t.idcurso '+
                                        ' and   a.idturma = t.idturma '+
                                        ' and   a.IdCurso = '+VS_IdCurso+
                                        ' and   a.idturma  = '+VS_IdTurma+
                                        ' and   t.IdCurso = '+VS_IdCurso+
                                        ' and   t.idturma = '+VS_IdTurma+
                                        ' and   t.Referenciaavaliacao  = '+#39+VS_Referenciaavaliacao+#39+
                                        ' and   t.CodProva  = '+#39+VS_CodProva+#39+
                                        ' and   a.NomeGuerra = '+#39+VS_Usuario+#39+
                                        ' and   a.CodigoInstrutor = '+VS_Senha
                                       );

                     if DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString = '' then
                     begin
                        MessageDlg('Verifique se as informa��es inseridas est�o corretas...',mtError, [mbOk],0);
                        MaskEdit_Nome.SetFocus;
                     end
                     else
                     begin
                        VS_NomeGuerra:= DM.IBQuery_Executa.FieldByName('NomeGuerra').AsString;
                        VS_Instrutor:= DM.IBQuery_Executa.FieldByName('NomeCompleto').AsString;
                        VS_Identidade:= DM.IBQuery_Executa.FieldByName('Identidade').AsString;
                        Status:= True;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;

   Busca_Usuario:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de turmas ativas para o curso
//------------------------------------------------------------------------------

procedure TForm_Abertura.ComboBox_CursoExit(Sender: TObject);
begin
   if trim(ComboBox_Curso.Text) <> '' then
   begin
      ComboBox_Turma.Items.Clear;
      Funcoes.OpenQuery('Select IdCurso, IdTurma, Turma From Turmas_Em_Andamento_View '+
                        ' Where CodCurso = '+#39+ComboBox_Curso.Text+#39+' and Status = '+#39+'A'+#39+' order by Turma');

      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_Turma.Items.Add(DM.IBQuery_Executa.FieldByName('Turma').AsString);
         DM.IBQuery_Executa.Next;
      end;
     ComboBox_Turma.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar a lista de provas ativas para o curso
//------------------------------------------------------------------------------

procedure TForm_Abertura.ComboBox_TurmaExit(Sender: TObject);
begin
   if trim(ComboBox_Turma.Text) <> '' then
   begin
      Funcoes.OpenQuery('Select IdCurso, IdTurma '+
                        ' From Turmas_Em_Andamento_View '+
                        ' Where CodCurso = '+#39+ComboBox_Curso.Text+#39+
                        ' and   turma = '+#39+ComboBox_Turma.Text+#39+
                        ' and   Status = '+#39+'A'+#39);

      VS_IdCurso:= DM.IBQuery_Executa.FieldByName('IdCurso').AsString;
      VS_IdTurma:= DM.IBQuery_Executa.FieldByName('IdTurma').AsString;
      ComboBox_prova.Items.Clear;

      Funcoes.OpenQuery('select idcurso, idturma, CodProva ' +
                        ' From  Testes_view t'+
                        ' where IdCurso = '+VS_IdCurso+
                        ' and   idturma  = '+VS_IdTurma+
                        ' and  (status_aplicacao = '+#39+'STAND BY'+#39+' or status_aplicacao = '+#39+'STANDY BY'+#39+')'+
                        ' order by CodProva '
                       );

      DM.IBQuery_Executa.First;
      While not DM.IBQuery_Executa.Eof do
      begin
         ComboBox_prova.Items.Add(DM.IBQuery_Executa.FieldByName('CodProva').AsString);
         DM.IBQuery_Executa.Next;
      end;
      ComboBox_prova.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para montar as informacoes da prova selecionada
//------------------------------------------------------------------------------

procedure TForm_Abertura.ComboBox_provaExit(Sender: TObject);
begin
   if ((ComboBox_Curso.Text <> '') and (ComboBox_Turma.Text <> '')) then
   begin
      if DM.IBQuery_Executa.FieldByName('IdCurso').AsString <> '' then
      begin
         Funcoes.OpenQuery('select idcurso, idturma, FaseAplicacao, referenciaavaliacao, CodProva, DataAplicacao, CodMateria, status_aplicacao ' +
                           ' From testes_view '+
                           ' where IdCurso = '+VS_IdCurso+
                           ' and   idturma  = '+VS_IdTurma+
                           ' and   CodProva  = '+#39+ComboBox_prova.Text+#39
                          );

         VS_Referenciaavaliacao:= DM.IBQuery_Executa.FieldByName('referenciaavaliacao').AsString;
         VS_CodProva:= DM.IBQuery_Executa.FieldByName('CodProva').AsString;
         VS_Status_Aplicacao:= DM.IBQuery_Executa.FieldByName('status_aplicacao').AsString;
      end;
   end;
end;

end.

