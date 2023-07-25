unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Mask, ComCtrls, ToolWin, ExtCtrls, JvShape,
  JvComponent, JvxCtrls, JvGradient, Rotinas, JvEnterTab;

type
  TForm_Login = class(TForm)
    JvGradient1: TJvGradient;
    Image_Brasao: TImage;
    JvShape1: TJvShape;
    Label1: TLabel;
    Label2: TLabel;
    JvShape2: TJvShape;
    JvxLabel1: TJvxLabel;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_MenuPrincipal: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Windows: TToolButton;
    MaskEdit_Senha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    ComboBox_Curso: TComboBox;

    procedure IniciarMenuPrincipal(VI_Opcao: Integer);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_MenuPrincipalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_NomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public      { Public declarations }
     VS_Iniciar: String;
  end;

var
  Form_Login: TForm_Login;

implementation

uses MenuPrincipal, Module, Sel_MontaProsima;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento do Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Login.FormActivate(Sender: TObject);
var
   VS_Linha: String;
   ArqTexto: TextFile;
begin
   Funcoes.SetVideoAnterior;
   Funcoes.alteravideo(1208,1024);

   Form_Login.Caption:= 'Prosima - Login - Versão: '+Versao;
   MaskEdit_Senha.Text:= '';

   //--- Monta a relação de Cursos Ativos

   Funcoes.OpenQueryExecuta( 'Select CodCurso '+
                            ' From Curso '+
                            ' Where IdCurso = 208 '+
                            ' or  IdCurso = 139 '+
                            ' order by idCurso desc'
                          );

   ComboBox_Curso.Items.Clear;
   ComboBox_Curso.Text:= DM.IBQuery_Executa_ensino.FieldByName('CodCurso').AsString;
   While not DM.IBQuery_Executa_ensino.Eof do
   begin
      ComboBox_Curso.Items.Add(DM.IBQuery_Executa_ensino.FieldByName('CodCurso').AsString);
      DM.IBQuery_Executa_ensino.Next;
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

procedure TForm_Login.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao que inicia o Sistema
//------------------------------------------------------------------------------

procedure TForm_Login.ToolButton_MenuPrincipalClick(Sender: TObject);
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

      Funcoes.OpenQueryExecuta( 'Select IdCurso '+
                                ' From Curso '+
                                ' Where IdCurso = 208 '+
                                ' or  IdCurso = 139 '+
                                ' order by CodCurso'
                              );

      Funcoes.SetIdCurso(DM.IBQuery_Executa_ensino.FieldByName('IdCurso').AsString);

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
         begin
            IniciarMenuPrincipal( 1 );
         end
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
               ShowMessage('Usuário não cadastrado...');
               MaskEdit_Nome.Text:= '';
               MaskEdit_Senha.Text:= '';
               MaskEdit_Nome.SetFocus;
            end
            else
            begin
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
      Form_Sel_Avaliacao.ShowModal;
end;


//------------------------------------------------------------------------------
// Tratamento da Caixa de Edicao da Senha
//------------------------------------------------------------------------------

procedure TForm_Login.MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       ToolButton_MenuPrincipalClick(Sender);
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
