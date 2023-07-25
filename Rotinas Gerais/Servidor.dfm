object Form_Servidor: TForm_Servidor
  Left = 192
  Top = 107
  Width = 863
  Height = 210
  Caption = 'Servidor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OpenDialog1: TOpenDialog
    Filter = 
      'Word (*.DOC)|*.DOC|Rich Text Files (*.RTF)|*.RTF|Text Files (*.T' +
      'XT)|*.TXT'
    Left = 56
    Top = 104
  end
end
