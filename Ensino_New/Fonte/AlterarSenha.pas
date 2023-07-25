unit AlterarSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ToolWin, ExtCtrls, JvShape, Rotinas, VerificaSenha,
  JvComponent, JvEnterTab, Buttons, JvTransBtn, JvGradient;

type
  TForm_AlterarSenha = class(TForm)
    JvGradient_Tela01: TJvGradient;
    JvShape_Retornar: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape_Windows: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    Label1: TLabel;
    Label2: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    MaskEdit_Senha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_GravaSenhaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AlterarSenha: TForm_AlterarSenha;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_AlterarSenha.FormActivate(Sender: TObject);
begin
   JvGradient_Tela01.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm( Form_AlterarSenha, ' Alterar Senha');

   MaskEdit_Nome.Text:= Funcoes.GetUsuario;
   MaskEdit_Senha.Text:= Funcoes.GetSenha;
   MaskEdit_Senha.SelectAll;
   MaskEdit_Senha.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

procedure TForm_AlterarSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_AlterarSenha.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_AlterarSenha.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento para gravacao da alteracao da senha
//------------------------------------------------------------------------------

procedure TForm_AlterarSenha.ToolButton_GravaSenhaClick(Sender: TObject);
begin
   Funcoes.ExecusaoQuery('Update Usuario set senha = '+#39+Funcoes.criptografar(MaskEdit_Senha.Text)+#39+', '+
                         '                   Atualizacao = '+#39+Funcoes.TratarData(DateToStr(Date))+#39+
                         ' where IdCodigo = '+#39+Funcoes.GetCodUsuario+#39
                        );
   Funcoes.SetSenha(MaskEdit_Senha.Text);
   JvTransparentButton_RetornarClick(Sender);
end;

end.
