//----------------------------------------------------------------------------
//
// NOME DO PROJETO           : SGEW
//
// PROGRAMA                  : Sel_ResponsavelAssinaturaRelatorio.pas
//
// DESCRICAO                 : Este modulo tem a funcao de tratar do janela de
//                             seleção do responsável pela assinatura de rela-
//                             torio quando este não for o responsável.
//
// MODULOS CHAMADOS          :
//
// EQUIPE DO DESENVOLVIMENTO :
//          Gerente          :
//          (Analista)       : Osvaldir Donizetti Ramos
//          (Programador(es)): Osvaldir Donizetti Ramos
//
// INICIO DA ELABORACAO      : 07/05/2007
//
//----------------------------------------------------------------------------
//                           DETALHES DE ALTERACAO
//----------------------------------------------------------------------------
// DATA                      :
// AUTOR                     :
// MODULO ALTERADO           :
// MOTIVO                    :
//----------------------------------------------------------------------------

unit Sel_ResponsavelAssinaturaRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Grids, DBGrids, ComCtrls,
  ToolWin, ImgList, StdCtrls, Menus, Rotinas, JvGradient, JvComponent,
  JvTransBtn, ExtCtrls, JvShape;

type
  TForm_Sel_ResponsavelAssinaturaRelatorio = class(TForm)
    DBGrid_CoordenadorCurso: TDBGrid;
    Panel_Botoes: TPanel;
    JvGradient_Menu: TJvGradient;
    JvShape9: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    Memo2: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Sel_ResponsavelAssinaturaRelatorio: TForm_Sel_ResponsavelAssinaturaRelatorio;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_ResponsavelAssinaturaRelatorio.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Funcoes.SetRespAssinatura(DM.IBQuery_Cargo.FieldByName('IdCargo').AsInteger);
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para  Janela Anterior
//------------------------------------------------------------------------------

procedure TForm_Sel_ResponsavelAssinaturaRelatorio.FormActivate(Sender: TObject);
begin
   JvGradient_Menu.StartColor:= Cor_Tela;
   Funcoes.CabecalhoForm( Form_Sel_ResponsavelAssinaturaRelatorio, ' Responsável pela assinatura do Relatório');
end;

procedure TForm_Sel_ResponsavelAssinaturaRelatorio.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;



end.
