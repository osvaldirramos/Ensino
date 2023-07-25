//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Utilizacao.PAS                                 //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da utilizacao dos acessos realizado no sistema.//
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/04/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Utilizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask,
  ToolWin, Grids, DBGrids, Buttons, ExtCtrls, Rotinas, DBTables, JvToolEdit,
  Menus, IBTable, JvComponent, JvxCtrls, JvShape, JvTransBtn;

type
  TForm_ControleAcesso = class(TForm)
    DSQ_Acesso: TDataSource;
    Query_Acesso: TIBQuery;
    ToolBar1: TToolBar;
    ComboBox_Usuario: TComboBox;
    JvDateEdit_Data: TJvDateEdit;
    MaskEdit_Hora: TMaskEdit;
    MaskEdit_Evento: TMaskEdit;
    DBGrid_Agenda_Adv: TDBGrid;
    Panel_Botoes: TPanel;
    JvShape9: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape10: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;

    procedure ExecutaQuery;
    procedure Localizar(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure DBGrid_Agenda_AdvTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
     VS_Comando, VS_OrderBy: String;
  public
    { Public declarations }
  end;

var
  Form_ControleAcesso: TForm_ControleAcesso;

implementation

uses Module;


{$R *.dfm}

procedure TForm_ControleAcesso.FormActivate(Sender: TObject);
begin
  Funcoes.CabecalhoForm( Form_ControleAcesso, ' Utilização do Sistema');

   // Alimenta o comboBox de usuario

   Funcoes.OpenQuery('Select Nome from usuario order by nome' );

   ComboBox_Usuario.Items.Clear;
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.eof do
   begin
      ComboBox_Usuario.Items.Add(DM.IBQuery_Executa.FieldByName('Nome').AsString);
      DM.IBQuery_Executa.Next;
   end;

   // Tratamento para setar o acesso do usuario

   VS_OrderBy:= 'a.Data, a.hora';

   Localizar(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao locaclizar
//------------------------------------------------------------------------------

procedure TForm_ControleAcesso.Localizar(Sender: TObject);
begin
   VS_Comando:= 'Select u.nome, a.data, a.hora, a.IdModulo, a.atividade From Acesso a, Usuario u Where u.IdCodigo = a.IdCodigo ';

   if trim(ComboBox_Usuario.Text) <> '' then
      VS_Comando:= VS_Comando+' and U.Nome = '+#39+trim(ComboBox_Usuario.Text)+#39;

   if JvDateEdit_Data.Text <> '  /  /    ' then
      VS_Comando:= VS_Comando+' and Data = '+#39+Funcoes.TratarData(JvDateEdit_Data.Text)+#39;

   if MaskEdit_Hora.Text <> '  :  ' then
      VS_Comando:= VS_Comando+' and Hora = '+#39+MaskEdit_Hora.Text+#39;

   if trim(MaskEdit_Evento.Text) <> '' then
      VS_Comando:= VS_Comando+' and Atividade Like '+#39+'%'+trim(MaskEdit_Evento.Text)+'%'+#39;

   ExecutaQuery;
end;

//------------------------------------------------------------------------------
// Executa a query
//------------------------------------------------------------------------------

procedure TForm_ControleAcesso.ExecutaQuery;
begin
   Query_Acesso.Close;
   Query_Acesso.SQL.Clear;
   Query_Acesso.SQL.Add(VS_Comando+' Order by '+VS_OrderBy);
   Query_Acesso.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_ControleAcesso.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botao localizar
//------------------------------------------------------------------------------

procedure TForm_ControleAcesso.DBGrid_Agenda_AdvTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Usuário' then
       VS_OrderBy:= 'u.Nome, a.Data, a.hora'
   else
      if column.Title.Caption = 'Data' then
         VS_OrderBy:= 'a.Data, a.hora'
      else
        if trim(column.Title.Caption) = 'Hora' then
           VS_OrderBy:= 'a.Hora, a.data'
        else
           if trim(column.Title.Caption) = 'Atividade' then
               VS_OrderBy:= 'a.Atividade, a.data, a.hora';

   ExecutaQuery;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Windows
//------------------------------------------------------------------------------

procedure TForm_ControleAcesso.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_ControleAcesso.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(Query_Acesso);
end;

procedure TForm_ControleAcesso.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_ControleAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Acesso.Close;
   Action:= caFree;
end;

end.
