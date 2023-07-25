//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : ImprimirDiploma.PAS                            //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da impressao//
//                             do Diploma (Aluno/Instrutor).                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 01/06/2008                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Relatorio_Geral;

interface

uses
{  ActnList, ImgList, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ComCtrls, ToolWin, Mask, JvToolEdit, StdCtrls,
  Rotinas, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, ExtCtrls, JvComponent,
  JvEnterTab, JvRichEd, JvDBRichEd, PsyRichEdit, Menus, JvxClock, JvCombobox, ClipBrd,
  JvColorCombo, DBCtrls, RichPrint, RichPreview, ExtDlgs, JvBaseThumbnail, JvThumbImage,
  JvxCtrls, JvGradient, IBTable, JvCaptionPanel;
}
  Printers, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, JvRichEd, JvDBRichEd, StdCtrls,
  PsyRichEdit, Rotinas, ComCtrls, ToolWin, Menus, DBCtrls, ExtCtrls,  
  RichPrint, IBTable, JvGradient;

type
  TForm_RelatorioGeral = class(TForm)
    JvDBRichEdit_Diploma: TJvDBRichEdit;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ScrollBox1: TScrollBox;
    Text1: TPsyRichEdit;
    ToolButton_Imprimir: TToolButton;
    ToolButton7: TToolButton;
    PrintDialog1: TPrintDialog;
    ToolButton_Salvar: TToolButton;
    SaveDialog1: TSaveDialog;

    procedure Trocar(Trocar: String; Por: String);
    procedure SalvarComo1Click(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure SetFileName(const FileName: String);

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_SalvarClick(Sender: TObject);
  private    { Private declarations }
    FFileName: string;
  public
    { Public declarations }
  end;

var
  Form_RelatorioGeral: TForm_RelatorioGeral;

implementation

resourcestring
  sSaveChanges = 'Salvar arquivo %s?';
  sOverWrite = 'Substituir arquivo %s';
  sUntitled = 'Sem nome';
  sModified = 'Modificado';
  sColRowInfo = 'Linha: %3d   Coluna: %3d';

{$R *.dfm}

//------------------------------------------------------------------------------
// Form Principal
//------------------------------------------------------------------------------

procedure TForm_RelatorioGeral.FormActivate(Sender: TObject);
begin
   FFileName:= '';
end;

//------------------------------------------------------------------------------
// Substitui a Palavra da variavel Trocar pela variavel por do texto
//------------------------------------------------------------------------------

procedure TForm_RelatorioGeral.Trocar(Trocar: String; Por: String);
var
   Posicao: Integer;
begin
  Posicao := Text1.FindText(Trocar, 0, Length(Text1.Text), []);
  if Posicao > 0 then
  begin
    Text1.SelStart := Posicao;
    Text1.SelLength := Length(Trocar);
    Text1.SelText := Por;
  end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_RelatorioGeral.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_RelatorioGeral.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento da opcao de impressao do registro selecionado
//------------------------------------------------------------------------------

procedure TForm_RelatorioGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento para Imprimir o Relatorio
//------------------------------------------------------------------------------

procedure TForm_RelatorioGeral.ToolButton_ImprimirClick(Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      Text1.Print('');
end;

procedure TForm_RelatorioGeral.ToolButton_SalvarClick(Sender: TObject);
begin
  if ((FFileName = sUntitled) or (FFileName = '' )) then
    FileSaveAs(Sender)
  else
  begin
    Text1.Lines.SaveToFile(FFileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_RelatorioGeral.SalvarComo1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName+'.Doc') then
      if MessageDlg(Format(sOverWrite, [SaveDialog1.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Text1.Lines.SaveToFile(SaveDialog1.FileName+'.Doc');
    SetFileName(SaveDialog1.FileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_RelatorioGeral.FileSaveAs(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName+'.Doc') then
      if MessageDlg(Format(sOverWrite, [SaveDialog1.FileName+'.Doc']),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Text1.Lines.SaveToFile(SaveDialog1.FileName+'.Doc');
    SetFileName(SaveDialog1.FileName+'.Doc');
    Text1.Modified := False;
  end;
end;

procedure TForm_RelatorioGeral.SetFileName(const FileName: String);
begin
  //Nome do Arquivo Doc
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

end.
