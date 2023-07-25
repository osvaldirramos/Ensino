
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
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, Mask, ExtCtrls, Rotinas, VerificaSenha,
  DB, IBCustomDataSet, IBQuery, IBTable, DBTables, jpeg, JvSpecialLabel,
  JvGradient, JvBlinkingLabel, JvBouncingLabel, JvLabel, JvAngleLabel,
  JvComponent, JvxCtrls, Menus, JvShape, XPMan, JvTransBtn;

type
  TForm_Abertura = class(TForm)
    JvGradient1: TJvGradient;
    JvShape1: TJvShape;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit_Senha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    Image_Brasao: TImage;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvTransparentButton_Iniciar: TJvTransparentButton;
    Label_Versao: TLabel;
    StatusBar1: TStatusBar;
    JvxLabel1: TJvxLabel;
    JvxLabel2: TJvxLabel;

    procedure Abertura(VS_Usuario: String; VS_Senha: String; VS_Acesso: String; PS_CodUsuario: String);
    procedure Usuario_Nao_Encontrado;
    procedure MaskEdit_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_IniciarClick(Sender: TObject);

  private    { Private declarations }
    VI_Tentativas: integer;
  public
    { Public declarations }
  end;

var
  Form_Abertura: TForm_Abertura;

implementation

uses Module, MenuPrincipal, AlterarSenha, Cad_Usuario;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormActivate(Sender: TObject);
var
   VS_Linha: String;
   ArqTexto: TextFile;
begin
   Funcoes.CabecalhoForm(Form_Abertura, 'Sistema de Gerenciamento do Ensino -  Abertura' );
   Label_Versao.Caption:= 'Versão '+Versao;
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
   begin
      JvxLabel1.Caption:= 'SISTEMA DE ACOMPANHAMENTO';
      JvxLabel2.Caption:= 'EDUCACIONAL';
   end;

   if not DirectoryExists('C:\DataBase_ICEA\Ensino') then
       ForceDirectories('C:\DataBase_ICEA\Ensino');

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\\Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\\Brasao_Ensino.jpg');

   if FileExists('C:\DataBase_ICEA\Ensino\AdmUsu.cnf') = True then
   begin
      AssignFile ( ArqTexto, 'C:\DataBase_ICEA\Ensino\AdmUsu.cnf' );
      Reset ( ArqTexto );
      ReadLn ( ArqTexto, VS_Linha );
      CloseFile ( ArqTexto );
      MaskEdit_Nome.Text:=  VS_Linha;
      MaskEdit_Senha.Text:= '';
      MaskEdit_Senha.SetFocus;
   end
   else
   begin
      MaskEdit_Nome.Text:= '';
      MaskEdit_Nome.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Sai do Sistema e retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_Abertura.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Continuar
//------------------------------------------------------------------------------

procedure TForm_Abertura.JvTransparentButton_IniciarClick(Sender: TObject);
var
   Status: Boolean;
   ArqTexto: TextFile;
begin
   //--- Grava o arquivo contendo o nome do usuário

   if FileExists('C:\DataBase_ICEA\Ensino\AdmUsu.cnf') then
       DeleteFile('C:\DataBase_ICEA\Ensino\AdmUsu.cnf');

   AssignFile ( ArqTexto, 'C:\DataBase_ICEA\Ensino\AdmUsu.cnf' );
   Rewrite ( ArqTexto );
   Writeln ( ArqTexto, MaskEdit_Nome.Text);
   CloseFile ( ArqTexto );

   if ((MaskEdit_Nome.Text = 'ENSINO') and (MaskEdit_Senha.Text = 'U2U6#ICEA')) then
   begin
      Application.CreateForm(TForm_Cad_Usuario, Form_Cad_Usuario);
      Form_Cad_Usuario.ShowModal;
      Form_Cad_Usuario.Free;
   end
   else
   begin
      Status:= Funcoes.Busca_Usuario(MaskEdit_Nome.Text, MaskEdit_Senha.Text);

      if Status = False then
         Usuario_Nao_Encontrado
      else
         Abertura(MaskEdit_Nome.Text, MaskEdit_Senha.Text, DM.Query_Usuario.FieldByName('Acesso').AsString, DM.Query_Usuario.FieldByName('IdCodigo').AsString);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento de verificacao do usuario e seu acesso
//------------------------------------------------------------------------------

procedure TForm_Abertura.Abertura(VS_Usuario: String; VS_Senha: String; VS_Acesso: String; PS_CodUsuario: String);
begin
   //--- Inicia o Menu Principal

   Funcoes.SetAbertura(False);
   Funcoes.SetCodUsuario(PS_CodUsuario);
   Funcoes.SetUsuario(VS_Usuario);
   Funcoes.SetSenha(VS_Senha);
   Funcoes.SetAcesso(VS_Acesso);

   //--- Verifica se a senha esta valida

   Form_Abertura.Left:= -3001;
   Application.CreateForm(TForm_MenuPrincipal,Form_MenuPrincipal);
   Form_MenuPrincipal.Show;
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
end;

//------------------------------------------------------------------------------
// Tratamento quando o usuario não foi encontrado
//------------------------------------------------------------------------------

procedure TForm_Abertura.Usuario_Nao_Encontrado;
begin
   MaskEdit_Nome.Text:= '';
   MaskEdit_Senha.Text:= '';
   VI_Tentativas:= VI_Tentativas + 1;
   if VI_Tentativas > 3 then
      Application.Terminate
   else
      MaskEdit_Nome.SetFocus;
end;

procedure TForm_Abertura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

end.

