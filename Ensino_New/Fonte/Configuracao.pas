//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                     //
//                                                                            //
// PROGRAMA                  : Cad_Pessoa.pas                                 //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das pessoas (Instrutores/Monitores/Alunos).    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/08/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Configuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent, JvxClock,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas, JvDlg,
  JvBalloonHint, JvEnterTab, JvGrdCpt, DB, IBCustomDataSet, IBTable,
  IBQuery, JvClock, DBGrids, JvDBRichEd, Mask, JvGradient, JvTransBtn,
  JvShape;
type
  TForm_Configuracao = class(TForm)
    Label49: TLabel;
    Label51: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit_Nome: TDBEdit;
    Edit_Descricao: TDBEdit;
    DBEdit_Endereco: TDBEdit;
    DBEdit_Numero: TDBEdit;
    DBEdit_Bairro: TDBEdit;
    DBEdit_Cidade: TDBEdit;
    DBEdit_Estado: TDBEdit;
    DBEdit_Cep: TDBEdit;
    DBEdit_Telefone: TDBEdit;
    DBEdit_Fax: TDBEdit;
    Label9: TLabel;
    DBEdit_Email: TDBEdit;
    LabelDivisao: TLabel;
    DBEdit_Divisao: TDBEdit;
    Panel_Botoes: TPanel;
    JvShape6: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape7: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo3: TMemo;
    Panel_BotoesProva: TPanel;
    JvGradient3: TJvGradient;
    JvShape_Gravar: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancel: TJvTransparentButton;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShapeModificarProva: TJvShape;
    JvTransparentButton_Altera: TJvTransparentButton;
    JvTransparentButton_Exclui: TJvTransparentButton;

    procedure Campos(Status: Boolean);

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_AlteraClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelClick(Sender: TObject);
  private    { Private declarations }
  public    { Public declarations }
  end;

var
  Form_Configuracao: TForm_Configuracao;

implementation

uses Module, ImageWin;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Configuracao.FormActivate(Sender: TObject);
begin
   Funcoes.CabecalhoForm(Form_Configuracao, 'Configuração');

   // Abertura das tabelas que serao utlizadas

   DM.IBTable_Configuracao.Open;

   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel);
   JvTransparentButton_Retornar.Enabled:= True;
   JvTransparentButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
//
// Tratamento dos dados
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Configuracao.Campos(Status: Boolean);
begin
   Edit_Nome.Enabled:= Status;
   Edit_Descricao.Enabled:= Status;
   DBEdit_Divisao.Enabled:= Status;
   DBEdit_Cidade.Enabled:= Status;
   DBEdit_Endereco.Enabled:= Status;
   DBEdit_Numero.Enabled:= Status;
   DBEdit_Bairro.Enabled:= Status;
   DBEdit_Estado.Enabled:= Status;
   DBEdit_Cep.Enabled:= Status;
   DBEdit_Telefone.Enabled:= Status;
   DBEdit_Fax.Enabled:= Status;
   DBEdit_Email.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera
//------------------------------------------------------------------------------

procedure TForm_Configuracao.JvTransparentButton_AlteraClick(Sender: TObject);
begin
   Campos(True);

   Funcoes.BotoesBasico( False, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel);
   JvTransparentButton_Retornar.Enabled:= False;
  JvTransparentButton_Windows.Enabled:= False;

   DM.IBTable_Configuracao.Edit;
   Edit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar
//------------------------------------------------------------------------------

procedure TForm_Configuracao.JvTransparentButton_GravaClick(Sender: TObject);
begin
   if Trim(Edit_Nome.Text) = '' then
   begin
      Showmessage('O Nome não pode ser branco...');
      Edit_Nome.SetFocus;
   end
   else
   begin
      if Trim(Edit_Descricao.Text) = '' then
      begin
         Showmessage('A descrição do nome do Instituto não pode ser branco...');
         Edit_Descricao.SetFocus;
      end
      else
      begin
         if Trim(DBEdit_Cidade.Text) = '' then
         begin
            Showmessage('A descrição do nome do Instituto não pode ser branco...');
            Edit_Descricao.SetFocus;
         end
         else
         begin
            begin
               Campos(False);
               Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel);
               JvTransparentButton_Retornar.Enabled:= True;
               JvTransparentButton_Windows.Enabled:= True;

               // Tratamento para pessoa

               DM.IBTable_Configuracao.Post;
               Funcoes.ExecutaTransacao;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela
//------------------------------------------------------------------------------

procedure TForm_Configuracao.JvTransparentButton_CancelClick(Sender: TObject);
begin
   if DM.IBTable_Configuracao.State in [dsInsert, dsEdit] then
   begin
      DM.IBTable_Configuracao.Cancel;
      Funcoes.ExecutaTransacao;
   end;
   Campos(False);
   Funcoes.BotoesBasico( True, JvTransparentButton_Inserir, JvTransparentButton_Altera, JvTransparentButton_Exclui, JvTransparentButton_Grava, JvTransparentButton_Cancel);
   JvTransparentButton_Retornar.Enabled:= True;
   JvTransparentButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Configuracao.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   DM.IBTable_Configuracao.Close;
   DM.IBTable_Configuracao.Open;
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Configuracao.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Configuracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;






end.
