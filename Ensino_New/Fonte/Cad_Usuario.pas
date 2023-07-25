//------------------------------------------------------------------------------
// Descricao: Este modulo tem a funcao de tratar do cadastro dos usuarios do sistema
//
// Ultima atualiuzacao: 05/12/05
//
//------------------------------------------------------------------------------

unit Cad_Usuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, Mask, ComCtrls, Buttons, ExtCtrls, Rotinas,
  Grids, DBGrids, ImgList, IBTable, IBCustomDataSet, IBQuery, Variants,
  JvGrdCpt, JvComponent, JvDBLookupTreeView, ToolWin, JvEnterTab,
  JvTransBtn, JvShape, JvGradient;

type
  TForm_Cad_Usuario = class(TForm)
    IBQuery_Usuario: TIBQuery;
    DSQ_Usuario: TDataSource;
    IBTable_PerfilAcesso: TIBTable;
    DST_PerfilAcesso: TDataSource;
    IBQuery_UsuarioNOME: TIBStringField;
    IBQuery_UsuarioIDCODIGO: TIBStringField;
    IBTable_Usuario: TIBTable;
    DST_Usuario: TDataSource;
    IBTable_UsuarioIDCODIGO: TIBStringField;
    IBTable_UsuarioNOME: TIBStringField;
    IBTable_UsuarioSENHA: TIBStringField;
    IBTable_UsuarioACESSO: TIBStringField;
    IBTable_PerfilAcessoIDCODIGO: TIBStringField;
    IBTable_PerfilAcessoMODULO: TIBStringField;
    IBTable_PerfilAcessoPOSSUIACESSO: TIBStringField;
    IBTable_PerfilAcessoINSERIR: TIBStringField;
    IBTable_PerfilAcessoALTERAR: TIBStringField;
    IBTable_PerfilAcessoEXCLUIR: TIBStringField;
    IBTable_PerfilAcessoGRAVAACESSO: TIBStringField;
    IBTable_UsuarioSECAO: TIBStringField;
    Panel_Botoes: TPanel;
    JvShape4: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    IBQuery_UsuarioSENHA: TIBStringField;
    IBQuery_UsuarioACESSO: TIBStringField;
    IBQuery_UsuarioSECAO: TIBStringField;
    IBQuery_UsuarioATUALIZACAO: TDateTimeField;
    IBTable_UsuarioATUALIZACAO: TDateTimeField;
    IBQuery_PerfilAcesso: TIBQuery;
    DSQ_PerfilAcesso: TDataSource;
    IBQuery_PerfilAcessoIDCODIGO: TIBStringField;
    IBQuery_PerfilAcessoMODULO: TIBStringField;
    IBQuery_PerfilAcessoPOSSUIACESSO: TIBStringField;
    IBQuery_PerfilAcessoINSERIR: TIBStringField;
    IBQuery_PerfilAcessoALTERAR: TIBStringField;
    IBQuery_PerfilAcessoEXCLUIR: TIBStringField;
    IBQuery_PerfilAcessoGRAVAACESSO: TIBStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid_Nome: TDBGrid;
    PageControl_Opcoes: TPageControl;
    TabSheet_CadUsuario: TTabSheet;
    Label_Senha: TLabel;
    Label_Nome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel13: TBevel;
    Label4: TLabel;
    DBText2: TDBText;
    EditUSERNAME: TDBEdit;
    EditSENHA: TDBEdit;
    ComboBox_Acesso: TDBComboBox;
    RadioGroup_TipoAcesso: TRadioGroup;
    DBComboBox_Secao: TDBComboBox;
    Panel_BotoesProva: TPanel;
    JvGradient_Menu: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_GravaUsu: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_CancelarUsu: TJvTransparentButton;
    JvShape19: TJvShape;
    JvTransparentButton_InserirUsu: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_AlterarUsu: TJvTransparentButton;
    JvShape_ExcluirProva: TJvShape;
    JvTransparentButton_ExcluiUsu: TJvTransparentButton;
    JvShape9: TJvShape;
    JvTransparentButton_Copiar: TJvTransparentButton;
    TabSheet_CadPerfil: TTabSheet;
    DBGrid_PerfilAcesso: TDBGrid;
    Panel_PerfilAcesso: TPanel;
    DBText1: TDBText;
    DBRadioGroup_GravaAcesso: TDBRadioGroup;
    DBRadioGroup_PossuiAcesso: TDBRadioGroup;
    GroupBox1: TGroupBox;
    DBRadioGroup_Inserir: TDBRadioGroup;
    DBRadioGroup_Excluir: TDBRadioGroup;
    DBRadioGroup_Alterar: TDBRadioGroup;
    Panel_BotoesPerfil: TPanel;
    JvGradient_Menu_01: TJvGradient;
    JvShape1: TJvShape;
    JvTransparentButton_GravaPerfil: TJvTransparentButton;
    JvShape2: TJvShape;
    JvTransparentButton_CancelPerfil: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_AlterarPerfil: TJvTransparentButton;
    JvShape3: TJvShape;
    JvTransparentButton_SimParaTodos: TJvTransparentButton;
    JvShape8: TJvShape;
    JvTransparentButton_ExcluirPerfil: TJvTransparentButton;
    Edit_Nome: TEdit;
    Edit_Secao: TEdit;

    procedure TratarPerfil(Opcao: String);
    Procedure Containers(Status: Boolean);
    procedure Campos(Status: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure IBTable_UsuarioPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirUsuClick(Sender: TObject);
    procedure JvTransparentButton_AlterarUsuClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiUsuClick(Sender: TObject);
    procedure JvTransparentButton_GravaUsuClick(Sender: TObject);
    procedure JvTransparentButton_CancelarUsuClick(Sender: TObject);
    procedure JvTransparentButton_AlterarPerfilClick(Sender: TObject);
    procedure JvTransparentButton_GravaPerfilClick(Sender: TObject);
    procedure JvTransparentButton_CancelPerfilClick(Sender: TObject);
    procedure JvTransparentButton_SimParaTodosClick(Sender: TObject);
    procedure JvTransparentButton_ExcluirPerfilClick(Sender: TObject);
    procedure JvTransparentButton_CopiarClick(Sender: TObject);
    procedure DBGrid_PerfilAcessoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Edit_NomeChange(Sender: TObject);

  private    { private declarations }
  public    { public declarations }
     VS_Opcao_Usuario, VS_Opcao, VS_CPF, VS_Nome, VS_Senha, VS_Priv: String;
  end;

var
  Form_Cad_Usuario: TForm_Cad_Usuario;

implementation

uses Module;

{$R *.DFM}

//-----------------------------------------------------------------------
// Modulo Principal
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario.FormActivate(Sender: TObject);
begin
   JvGradient_Menu.StartColor:= Cor_Tela;
   JvGradient_Menu_01.StartColor:= Cor_Tela;

   Funcoes.CabecalhoForm( Form_Cad_Usuario, ' Cadastro de Usuários');

   Funcoes.SetAcesso('A');

   // Alimenta o Combo de selecao dos responsaveis

   Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select Sigla From FP_Secao Order By IdSecao' );
   DM.IBQuery_Executa.First;

   DBComboBox_Secao.Items.Clear;
   DBComboBox_Secao.Text:= '';
   DBComboBox_Secao.Items.Add('ADMINISTRAÇÃO');
   While not DM.IBQuery_Executa.Eof do
   begin
      DBComboBox_Secao.Items.Add(DM.IBQuery_Executa.FieldByName('Sigla').AsString);
      DM.IBQuery_Executa.Next;
   end;

   Containers(True);

   DBGrid_PerfilAcesso.Enabled:= True;
   Panel_PerfilAcesso.Enabled:= False;

    //--- Abre os arquivos

   IBQuery_Usuario.Open;
   IBTable_Usuario.Open;
   IBQuery_PerfilAcesso.Open;
   IBTable_PerfilAcesso.Open;

   //--- Seta valores iniciais

   PageControl_Opcoes.TabIndex:= 0;
   DBGrid_Nome.SetFocus;
end;

procedure TForm_Cad_Usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Usuario.Close;
   IBTable_Usuario.Close;
   IBTable_PerfilAcesso.Close;
   IBQuery_PerfilAcesso.Close;

   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento dos Containers
//------------------------------------------------------------------------------

Procedure TForm_Cad_Usuario.Containers(Status: Boolean);
begin
   DBGrid_Nome.Enabled:= Status;
   TabSheet_CadUsuario.Enabled:= Status;

   //--- Tratamento dos botoes

   JvTransparentButton_Windows.Enabled:= Status;
   JvTransparentButton_Retornar.Enabled:= Status;
   JvTransparentButton_Atualizar.Enabled:= Status;
   JvTransparentButton_Copiar.Enabled:= Status;

   Funcoes.BotoesBasico( Status, JvTransparentButton_InserirUsu, JvTransparentButton_AlterarUsu, JvTransparentButton_ExcluiUsu, JvTransparentButton_GravaUsu,JvTransparentButton_CancelarUsu);
   Funcoes.BotoesBasico( Status, JvTransparentButton_SimParaTodos, JvTransparentButton_AlterarPerfil, JvTransparentButton_ExcluirPerfil, JvTransparentButton_GravaPerfil,JvTransparentButton_CancelPerfil);

   DBGrid_PerfilAcesso.Enabled:= Status;
   if Status = True Then
      Status:= False
   else
      Status:= True;
   Panel_PerfilAcesso.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_InserirUsuClick(Sender: TObject);
begin
   VS_Opcao_Usuario:= 'Novo';
   Containers(False);
   JvTransparentButton_Copiar.Enabled:= False;
   JvTransparentButton_GravaPerfil.Enabled:= False;
   JvTransparentButton_CancelPerfil.Enabled:= False;

   TabSheet_CadUsuario.Enabled:= True;

   VS_Opcao:= 'Novo';
   Campos( True );

   RadioGroup_TipoAcesso.ItemIndex:= 0;
   IBTable_Usuario.Append;
   IBTable_Usuario.FieldByName('Nome').AsString:= '';
   IBTable_Usuario.FieldByName('Senha').AsString:= '123';
   IBTable_Usuario.FieldByName('Acesso').AsString:= 'U';
   EditUSERNAME.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_AlterarUsuClick(Sender: TObject);
begin
   VS_Opcao_Usuario:= 'Altera';
   Containers(False);
   JvTransparentButton_Copiar.Enabled:= False;
   JvTransparentButton_GravaPerfil.Enabled:= False;
   JvTransparentButton_CancelPerfil.Enabled:= False;
   TabSheet_CadUsuario.Enabled:= True;

   IBTable_Usuario.Edit;
   IBTable_Usuario.FieldByName('Senha').AsString:= Funcoes.Descriptografar(EditSENHA.Text);

   Campos( True );
   EditUSERNAME.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_ExcluiUsuClick(Sender: TObject);
begin
   Containers(False);
   JvTransparentButton_Copiar.Enabled:= False;
   JvTransparentButton_GravaUsu.Enabled:= False;
   JvTransparentButton_CancelarUsu.Enabled:= False;

   if MessageDlg('Confirma a exclusão ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.ExecutaQuery(DM.IBQuery_Executa, 'Delete from Usuario where IdCodigo = '+#39+IBQuery_Usuario.FieldByName('IdCodigo').AsString+#39);

      Funcoes.AtualizaQuery(IBQuery_Usuario);
   end;
   Containers(True);
   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_GravaUsuClick(Sender: TObject);
var
   VS_IdCodigo: String;
begin
   if DBComboBox_Secao.Text = '' then
   begin
      ShowMEssage('A Seção não pode ser branco...');
      DBComboBox_Secao.SetFocus;
   end
   else
   begin
      DBGrid_PerfilAcesso.Enabled:= True;
      Panel_PerfilAcesso.Enabled:= False;

      IBTable_Usuario.FieldByName('Senha').AsString:= Funcoes.criptografar(EditSENHA.Text);

      VS_IdCodigo:= IntToStr(Funcoes.QtdRegistro('Select count(1)+1 as Qtd From Usuario'))+Copy(IBTable_Usuario.FieldByName('Nome').AsString,1,5)+Copy(IBTable_Usuario.FieldByName('Senha').AsString,1,5);
//      VS_IdCodigo:= 'US'+Copy(EditUSERNAME.Text,1,5)+Copy(EditSENHA.Text,1,5);
      IBTable_Usuario.FieldByName('IdCodigo').AsString:= VS_IdCodigo;

      IBTable_Usuario.Post;
      Funcoes.ExecutaTransacao;

      if VS_Opcao_Usuario = 'Novo' then           // Grava o perfil de acesso do Usuario
      begin
         if ComboBox_Acesso.Text = 'C' then
            Funcoes.GravaPerfilAcesso(VS_IdCodigo, 'Restrito')
         else
            if RadioGroup_TipoAcesso.ItemIndex = 0 then
                Funcoes.GravaPerfilAcesso(VS_IdCodigo, 'Restrito')
             else
                Funcoes.GravaPerfilAcesso(VS_IdCodigo, 'Livre');
      end;

      Containers(True);

      Campos( False );
      IBQuery_Usuario.Close;
      IBQuery_Usuario.Open;

      //--- Posiciona na captacao que foi cadastrada

      if VS_Opcao_Usuario = 'Novo' then
         IBQuery_Usuario.Locate('IdCodigo', VarArrayOf([VS_IdCodigo]), [loPartialKey]);

      DBGrid_Nome.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_CancelarUsuClick(Sender: TObject);
begin
   DBGrid_PerfilAcesso.Enabled:= True;
   Panel_PerfilAcesso.Enabled:= False;
   Containers(True);

   Campos( False );
   IBTable_Usuario.Cancel;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_Usuario);
   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//-----------------------------------------------------------------------
// Tratamento do botao Windows
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//-----------------------------------------------------------------------
// Tratamento do botao de atualizacao da Lista de Usuarios
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Usuario);
end;

//-----------------------------------------------------------------------
// Tratamento do botões quando não for utilizado o botão de gravação
//-----------------------------------------------------------------------

procedure TForm_Cad_Usuario.Campos(Status: Boolean);
begin
   EditUSERNAME.Enabled:= Status;
   EditSENHA.Enabled:= Status;
End;

//------------------------------------------------------------------------------
// Procedure para alterar o perfil de acesso do usuario
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_AlterarPerfilClick(Sender: TObject);
begin
   Containers(False);
   JvTransparentButton_Copiar.Enabled:= False;
   JvTransparentButton_GravaUsu.Enabled:= False;
   JvTransparentButton_CancelarUsu.Enabled:= False;

   IBTable_PerfilAcesso.Edit;
end;

//------------------------------------------------------------------------------
// Grava o perfil do usuario
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_GravaPerfilClick(Sender: TObject);
begin
   IBTable_PerfilAcesso.Post;
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(IBQuery_PerfilAcesso);
   IBQuery_PerfilAcesso.Next;

   Containers(True);
   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Cancela a alteracao do perfil do usuario
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_CancelPerfilClick(Sender: TObject);
begin
   IBTable_PerfilAcesso.Cancel;
   Funcoes.ExecutaTransacao;

   Containers(True);
   DBGrid_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do erro ao cadastrar o usuário
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.IBTable_UsuarioPostError(DataSet: TDataSet;  E: EDatabaseError; var Action: TDataAction);
var
   Sender: TObject;
begin
   if ((E is EDBEngineError) and ((E as EDBEngineError).Errors[0].Errorcode = 9729)) then
     begin
        MessageDlg('  O Usuário já foi cadastrado...  ',mtError, [mbOk],0);
        JvTransparentButton_CancelarUsuClick(Sender);
     end;
end;

//------------------------------------------------------------------------------
// Tratamento do cadastro do perfil do usuário
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.TratarPerfil(Opcao: String);
var
   Sender: TObject;
begin
   IBTable_PerfilAcesso.Edit;
   IBTable_PerfilAcesso.FieldByName('PossuiAcesso').AsString:= Opcao;
   IBTable_PerfilAcesso.FieldByName('GRAVAACESSO').AsString:= Opcao;
   IBTable_PerfilAcesso.FieldByName('INSERIR').AsString:= Opcao;
   IBTable_PerfilAcesso.FieldByName('ALTERAR').AsString:= Opcao;
   IBTable_PerfilAcesso.FieldByName('EXCLUIR').AsString:= Opcao;
   JvTransparentButton_GravaPerfilClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Sim para Todos
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_SimParaTodosClick(Sender: TObject);
begin
   TratarPerfil('S');
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Não para Todos
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_ExcluirPerfilClick(Sender: TObject);
begin
   TratarPerfil('N');
end;

//------------------------------------------------------------------------------
// Tratamento para duplicar o usuario
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.JvTransparentButton_CopiarClick(Sender: TObject);
var
   VS_IdCodigo: String;
begin
   if IBTable_Usuario.FieldByName('Nome').AsString = '' then
   begin
      ShowMessage('Não possuí usuário cadastrado...');
      DBGrid_Nome.SetFocus;
   end
   else
   begin
       Funcoes.ExecutaQuery( DM.IBQuery_Executa,' select nome From usuario Where Nome = '+#39+'USUARIO'+#39 );
       if DM.IBQuery_Executa.FieldByName('Nome').AsString <> '' then
       begin
          ShowMessage('Para fazer copia do usuário selecionado, deverá primeiro renomear o usuário "USUARIO" para seu nome difinitivo...');
          IBQuery_Usuario.Locate('Nome', VarArrayOf(['USUARIO']), [loPartialKey]);
          DBGrid_Nome.SetFocus;
       end
       else
       begin
          VS_IdCodigo:= 'USUSUAR123  ';

          IBTable_Usuario.Append;
          IBTable_Usuario.FieldByName('IdCodigo').AsString:= VS_IdCodigo;
          IBTable_Usuario.FieldByName('Nome').AsString:= 'USUARIO';
          IBTable_Usuario.FieldByName('Senha').AsString:= '456';
          IBTable_Usuario.FieldByName('Acesso').AsString:= IBQuery_Usuario.FieldByName('Acesso').AsString;
          IBTable_Usuario.FieldByName('Secao').AsString:= IBQuery_Usuario.FieldByName('Secao').AsString;
          IBTable_Usuario.FieldByName('Atualizacao').AsString:= DateToStr(Date);
          IBTable_Usuario.Post;
          Funcoes.ExecutaTransacao;

          IBQuery_PerfilAcesso.First;
          While not IBQuery_PerfilAcesso.eof do
          begin
             IBTable_PerfilAcesso.Append;
             IBTable_PerfilAcesso.FieldByName('IdCodigo').AsString:= VS_IdCodigo;
             IBTable_PerfilAcesso.FieldByName('Modulo').AsString:= IBQuery_PerfilAcesso.FieldByName('Modulo').AsString;
             IBTable_PerfilAcesso.FieldByName('PossuiAcesso').AsString:= IBQuery_PerfilAcesso.FieldByName('PossuiAcesso').AsString;
             IBTable_PerfilAcesso.FieldByName('Inserir').AsString:= IBQuery_PerfilAcesso.FieldByName('Inserir').AsString;
             IBTable_PerfilAcesso.FieldByName('Alterar').AsString:= IBQuery_PerfilAcesso.FieldByName('Alterar').AsString;
             IBTable_PerfilAcesso.FieldByName('Excluir').AsString:= IBQuery_PerfilAcesso.FieldByName('Excluir').AsString;
             IBTable_PerfilAcesso.FieldByName('GravaAcesso').AsString:= IBQuery_PerfilAcesso.FieldByName('GravaAcesso').AsString;
             IBTable_PerfilAcesso.Post;
             IBQuery_PerfilAcesso.Next;
          end;
          Funcoes.ExecutaTransacao;
          Funcoes.AtualizaQuery(IBQuery_Usuario);
          Funcoes.AtualizaQuery(IBQuery_PerfilAcesso);

          ShowMessage('Copia realizada com sucesso, favor renomear o usuário "USUARIO" para seu nome difinitivo...');
          IBQuery_Usuario.Locate('Nome', VarArrayOf(['USUARIO']), [loPartialKey]);
          DBGrid_Nome.SetFocus;
       end;
   end;
end;

procedure TForm_Cad_Usuario.DBGrid_PerfilAcessoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Trim(IBQuery_PerfilAcesso.FieldByName('PossuiAcesso').AsString) = 'S' then
      DBGrid_PerfilAcesso.Canvas.Font.Color:= clRed
   else
      DBGrid_PerfilAcesso.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
    DBGrid_PerfilAcesso.Canvas.Brush.Color := clSkyBlue;

   DBGrid_PerfilAcesso.Canvas.FillRect(Rect);
   DBGrid_PerfilAcesso.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TForm_Cad_Usuario.Edit_NomeChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select * from USUARIO ';

   if Edit_Nome.Text <> '' then
      VS_Comando:= VS_Comando+' Where nome like '+#39+'%'+Edit_Nome.Text+'%'+#39;

   if Edit_Secao.Text <> '' then
      if Edit_Nome.Text <> '' then
         VS_Comando:= VS_Comando+' and secao like '+#39+'%'+Edit_secao.Text+'%'+#39
      else
         VS_Comando:= VS_Comando+' Where secao like '+#39+'%'+Edit_secao.Text+'%'+#39;


   Funcoes.ExecutaQuery(IBQuery_Usuario, VS_Comando +' Order by nome');

end;

end.

