unit Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvEnterTab, JvTransBtn, JvShape, JvxCtrls;

type
  TForm_Login = class(TForm)
    StatusBar2: TStatusBar;
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    Image_Brasao: TImage;
    Label_Versao: TLabel;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvTransparentButton_Iniciar: TJvTransparentButton;
    JvxLabel1: TJvxLabel;
    JvShape1: TJvShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    JvxLabel3: TJvxLabel;
    JvxLabel4: TJvxLabel;
    MaskEdit_Senha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    ComboBox_Curso: TComboBox;
    Label_Data: TLabel;

    procedure IniciarMenuPrincipal(VI_Opcao: Integer);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure JvTransparentButton_IniciarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public      { Public declarations }
     VS_IdTurma, VS_Iniciar: String;
  end;

var
  Form_Login: TForm_Login;

implementation

uses Module, Sel_Fichas, Menu_Principal;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento do Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Login.FormActivate(Sender: TObject);
var
   VS_Linha: String;
   ArqTexto: TextFile;
begin
   Label_Versao.Caption:= 'Versão: '+Versao;
   Label_Data.Caption:= Ultima_Atualizacao;

   Funcoes.SetVideoAnterior;
   Funcoes.alteravideo(1208,1024);

   Form_Login.Caption:= 'PAELS - Login ';
   MaskEdit_Senha.Text:= '';

   //--- Monta a relação de Cursos Ativos

   Funcoes.OpenQueryEnsino( DM.IBQuery_ExecutaEnsino, 'Select CodCurso '+
                                                      ' From Curso '+
                                                      ' Where IdCurso = 208 '+
                                                      ' or  IdCurso = 139 '+
                                                      ' order by idCurso desc'
                          );

   ComboBox_Curso.Items.Clear;
   ComboBox_Curso.Text:= DM.IBQuery_ExecutaEnsino.FieldByName('CodCurso').AsString;
   While not DM.IBQuery_ExecutaEnsino.Eof do
   begin
      ComboBox_Curso.Items.Add(DM.IBQuery_ExecutaEnsino.FieldByName('CodCurso').AsString);
      DM.IBQuery_ExecutaEnsino.Next;
   end;


   if FileExists('C:\DataBase_ICEA\Ensino\AdmUsu.cnf') = True then
   begin
      AssignFile ( ArqTexto, 'C:\DataBase_ICEA\Ensino\AdmUsu.cnf' );
      Reset ( ArqTexto );
      ReadLn ( ArqTexto, VS_Linha );
      CloseFile ( ArqTexto );
      MaskEdit_Nome.Text:=  VS_Linha;
      MaskEdit_Senha.SetFocus;
   end
   else
   begin
      MaskEdit_Nome.Text:= '';
      MaskEdit_Nome.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Login.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao que inicia o Sistema
//------------------------------------------------------------------------------

procedure TForm_Login.JvTransparentButton_IniciarClick(Sender: TObject);
var
   VS_Identidade, VS_Comando: String;
   ArqTexto: TextFile;
begin
   if ComboBox_Curso.Text = '' then
   begin
      Showmessage( ' Não foi selecionado o curso...');
      ComboBox_Curso.SetFocus;
   end
   else
   begin

      //--- Verificar o Id do Curso selecionado

      Funcoes.OpenQueryEnsino( DM.IBQuery_ExecutaEnsino, 'Select IdCurso From Curso Where CodCurso = '+#39+ComboBox_Curso.Text+#39 );

      Funcoes.SetCodCurso(ComboBox_Curso.Text);
      Funcoes.SetIdCurso(DM.IBQuery_ExecutaEnsino.FieldByName('IdCurso').AsString);

      //--- Grava o arquivo contendo o nome do usuário

      if FileExists('C:\DataBase_ICEA\Ensino\AdmUsu.cnf') then
         DeleteFile('C:\DataBase_ICEA\Ensino\AdmUsu.cnf');

      AssignFile ( ArqTexto, 'C:\DataBase_ICEA\Ensino\AdmUsu.cnf' );
      Rewrite ( ArqTexto );
      Writeln ( ArqTexto, MaskEdit_Nome.Text);
      CloseFile ( ArqTexto );

      if ((MaskEdit_Nome.Text = 'AVL') and (MaskEdit_Senha.Text = 'AVL#99')) then
      begin
         IniciarMenuPrincipal( 1 );
      end
      else
      begin
         if ((MaskEdit_Nome.Text = 'ENSINO') and (MaskEdit_Senha.Text = 'ENSINO#99')) then
            IniciarMenuPrincipal( 1 )
         else
         begin
            VS_Comando:= ' Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA '+
                         ' From INSTRUTOR_TURMAS_VIEW '+
                         ' Where NomeGuerra = '+#39+MaskEdit_Nome.Text+#39+
                         ' and Senha = '+#39+MaskEdit_Senha.Text+#39;

            DM.IBQuery_Login_Instrutor.Close;
            DM.IBQuery_Login_Instrutor.Sql.Clear;
            DM.IBQuery_Login_Instrutor.Sql.Add(VS_Comando);
            DM.IBQuery_Login_Instrutor.Open;

            if DM.IBQuery_Login_Instrutor.FieldByName('IdCurso').AsString = '' Then
            begin
               VS_Comando:= ' Select IdCodigo, Nome, Senha, Secao '+
                            ' From Usuario '+
                            ' Where Nome = '+#39+MaskEdit_Nome.Text+#39+
                            ' and Senha = '+#39+Funcoes.criptografar(MaskEdit_Senha.Text)+#39;

               DM.IBQuery_Usuario.Close;
               DM.IBQuery_Usuario.Sql.Clear;
               DM.IBQuery_Usuario.Sql.Add(VS_Comando);
               DM.IBQuery_Usuario.Open;

               if DM.IBQuery_Usuario.FieldByName('Nome').AsString = '' Then
               begin
                  ShowMessage('Usuário não cadastrado...');
                  MaskEdit_Nome.Text:= '';
                  MaskEdit_Senha.Text:= '';
                  MaskEdit_Nome.SetFocus;
               end
               else
               begin
                   IniciarMenuPrincipal( 1 );
               end;
            end
            else
            begin
               VS_IdTurma:=  DM.IBQuery_Login_Instrutor.FieldByName('IdTurma').AsString;
               VS_Identidade:= DM.IBQuery_Login_Instrutor.FieldByName('Identidade').AsString;
               VS_Comando:= ' Select IDCURSO, IDTURMA, NOME, NOMEGUERRA, IDENTIDADE, FUNCAO, SENHA '+
                            ' From INSTRUTOR_TURMAS_VIEW '+
                            ' Where NomeGuerra = '+#39+MaskEdit_Nome.Text+#39+
                         ' and Identidade = '+#39+trim(VS_Identidade)+#39+
                         ' and IdCurso = '+Funcoes.GetIdCurso;

               DM.IBQuery_Login_Instrutor.Close;
               DM.IBQuery_Login_Instrutor.Sql.Clear;
               DM.IBQuery_Login_Instrutor.Sql.Add(VS_Comando);
               DM.IBQuery_Login_Instrutor.Open;

               DM.IBQuery_Login_Instrutor.Locate('IdTurma', VarArrayOf([VS_IdTurma]), [loPartialKey]);

               IniciarMenuPrincipal( 2 );
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Procedure responsavel pela iniciacao do Menu Principal
//------------------------------------------------------------------------------

procedure TForm_Login.IniciarMenuPrincipal(VI_Opcao: Integer);
begin
   VS_Iniciar:= 'ABERTURA';
   Form_Login.Left:= -3001;
   if VI_Opcao = 1 then
      Form_MenuPrincipal.Show
   else
      Form_Sel_Fichas.ShowModal;
end;


//------------------------------------------------------------------------------
// Tratamento da Caixa de Edicao da Senha
//------------------------------------------------------------------------------

procedure TForm_Login.MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       JvTransparentButton_IniciarClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da Caixa de Edicao do Nome
//------------------------------------------------------------------------------

procedure TForm_Login.MaskEdit_NomeKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      MaskEdit_Senha.SetFocus;
end;


end.
