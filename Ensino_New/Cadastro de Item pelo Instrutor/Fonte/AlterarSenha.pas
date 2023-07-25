unit AlterarSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ToolWin, ExtCtrls, JvShape, Rotinas,
  JvComponent, JvEnterTab, JvGradient, JvTransBtn;

type
  TForm_AlterarSenha = class(TForm)
    JvEnterAsTab1: TJvEnterAsTab;
    Panel_Botoes: TPanel;
    JvShape10: TJvShape;
    JvTransparentButton_Gravar: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvGradient1: TJvGradient;
    JvShape1: TJvShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit_Senha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    MaskEdit_VerSenha: TMaskEdit;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_GravarClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
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

procedure TForm_AlterarSenha.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para gravacao da alteracao da senha
//------------------------------------------------------------------------------

procedure TForm_AlterarSenha.JvTransparentButton_GravarClick(Sender: TObject);
begin
   if MaskEdit_Senha.Text = MaskEdit_VerSenha.Text then
   begin
      Funcoes.ExecusaoQuery('Update InstrutorTurma set senha = '+#39+MaskEdit_Senha.Text+#39+', '+
                            '                     Atualizacao = '+#39+Funcoes.TratarData(DateToStr(Date))+#39+
                            ' Where IdCurso = '+Funcoes.GetIdCurso+
                            ' and IdTurma = '+Funcoes.GetIdTurma+
                            ' and Identidade = '+#39+Funcoes.GetIdentidade+#39
                           );
      Funcoes.SetSenha(MaskEdit_Senha.Text);
      Close;
   end
   else
   begin
      ShowMessage('A senha fornecida não é igual confirmação, entrar novamente...');
      MaskEdit_Senha.SetFocus;
      MaskEdit_Senha.SelectAll;
   end;
end;

end.
