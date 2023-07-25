//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Curso.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             de Curso.                                      //
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

unit Cad_Horarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvGroupHeader, JvAnimTitle, JvEnterTab,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage, JvTransBtn;

type
  TForm_Cad_Horarios = class(TForm)
    DSQ_MontaCurso: TDataSource;
    DBGrid_Curso: TDBGrid;
    IBTable_Horario: TIBTable;
    Panel_Botoes_Instrutor: TPanel;
    Panel1: TPanel;
    JvGradient_Menu: TJvGradient;
    JvShape1: TJvShape;
    JvShape3: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    DBNavigator2: TDBNavigator;
    IBTable_HorarioHORARIO: TIBStringField;

    procedure FormActivate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
  private    { Private declarations }

  public    { Public declarations }
  end;
var
  Form_Cad_Horarios: TForm_Cad_Horarios;

implementation

uses MenuPrincipal, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Horarios.FormActivate(Sender: TObject);
begin
   JvGradient_Menu.StartColor:= Cor_Tela;


   Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Menu Principal - Cadastro Curso');    // Abre o perfil do usuario em relacao a agenda
   IBTable_Horario.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Cad_Horarios.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_Horarios.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Atualiza a Lista de Cursos
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tratamento Quando fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Horarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Horario.Close;
   Action:= caFree;
end;


end.

