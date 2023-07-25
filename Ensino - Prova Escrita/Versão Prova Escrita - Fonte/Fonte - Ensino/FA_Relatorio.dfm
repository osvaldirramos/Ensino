object Form1: TForm1
  Left = 192
  Top = 125
  Width = 1088
  Height = 750
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 177
    Width = 1072
    Height = 534
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C000000CB6E0000313700000100000005000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1072
    Height = 177
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 248
      Top = 56
      Width = 107
      Height = 25
      Caption = 'Criar arq html'
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 440
      Top = 48
      Width = 185
      Height = 89
      Lines.Strings = (
        'Teste de aplicacaoa Web  Memo 1')
      TabOrder = 1
    end
    object Button2: TButton
      Left = 248
      Top = 96
      Width = 107
      Height = 25
      Caption = 'Imprimir arq html'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 248
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Teste Ensino'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
end
