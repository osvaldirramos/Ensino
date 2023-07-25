unit ImageWin;

interface

uses Windows, Classes, Graphics, Forms, Controls, Rotinas, JPeg,
  StdCtrls, ExtCtrls, Buttons, Spin, ComCtrls, Dialogs,
  JvBaseThumbnail, JvThumbImage, JvGrdCpt, FileCtrl, ToolWin, JvShape,
  JvComponent, JvTransBtn;

type
  TForm_SelFoto = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FileEdit: TEdit;
    FileListBox1: TFileListBox;
    FilterComboBox1: TFilterComboBox;
    Panel1: TPanel;
    Image1: TImage;
    StretchCheck: TCheckBox;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvShape1: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    procedure FileListBox1Click(Sender: TObject);
    procedure StretchCheckClick(Sender: TObject);
    procedure FileEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_FecharClick(
      Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
  private
  end;

var
  Form_SelFoto: TForm_SelFoto;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Form principal
//------------------------------------------------------------------------------

procedure TForm_SelFoto.FormActivate(Sender: TObject);
begin
   if DM.IBTable_Configuracao.FieldByName('Sigla').AsString = 'CIAAR' then
     Form_SelFoto.Caption:= 'SAE --> Seleção de Imagem';

   Funcoes.SetFoto('');
end;

//------------------------------------------------------------------------------
// Seleciona a foto
//------------------------------------------------------------------------------

procedure TForm_SelFoto.FileListBox1Click(Sender: TObject);
begin
   Image1.Picture.LoadFromFile(FileListBox1.Filename);
end;

//------------------------------------------------------------------------------
// Setagem para mostrar a foto por interira
//------------------------------------------------------------------------------

procedure TForm_SelFoto.StretchCheckClick(Sender: TObject);
begin
  Image1.Stretch := StretchCheck.Checked;
end;

//------------------------------------------------------------------------------
// Form principal
//------------------------------------------------------------------------------

procedure TForm_SelFoto.FileEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    FileListBox1.ApplyFilePath(FileEdit.Text);
    Key := #0;
  end;
end;

//------------------------------------------------------------------------------
// Retorna para janela anterior e retorna a foto
//------------------------------------------------------------------------------

procedure TForm_SelFoto.JvTransparentButton_RetornarClick(Sender: TObject);
begin
   if FileListBox1.Filename = '' then
      Funcoes.SetFoto('')
   else
      Funcoes.SetFoto(FileListBox1.Filename);
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para janela anterior e nao retorna a foto
//------------------------------------------------------------------------------

procedure TForm_SelFoto.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Funcoes.SetFoto('');
   Close;
end;

procedure TForm_SelFoto.FileListBox1DblClick(Sender: TObject);
begin
   JvTransparentButton_RetornarClick(Sender);
end;

procedure TForm_SelFoto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
