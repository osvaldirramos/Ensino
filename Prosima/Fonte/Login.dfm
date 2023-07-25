object Form_Login: TForm_Login
  Left = 174
  Top = 150
  Width = 594
  Height = 393
  Caption = 'Prosima - Login - Vers'#227'o 1.08'
  Color = 16766640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JvGradient1: TJvGradient
    Left = 0
    Top = 54
    Width = 578
    Height = 282
    Align = alClient
    Style = grVertical
    StartColor = 16766640
    EndColor = 16777190
  end
  object Image_Brasao: TImage
    Left = 431
    Top = 176
    Width = 122
    Height = 137
    ParentShowHint = False
    ShowHint = False
    Stretch = True
  end
  object JvShape1: TJvShape
    Left = 54
    Top = 178
    Width = 336
    Height = 122
    Brush.Color = 15066597
    Pen.Color = clNavy
    Shape = stRoundRect
  end
  object Label1: TLabel
    Left = 68
    Top = 231
    Width = 74
    Height = 24
    Caption = 'Usu'#225'rio.:'
    Color = 15066597
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 68
    Top = 268
    Width = 75
    Height = 24
    Caption = 'Senha...:'
    Color = 15066597
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object JvShape2: TJvShape
    Left = 425
    Top = 170
    Width = 135
    Height = 151
    Pen.Color = clNavy
    Pen.Width = 2
    Shape = stRoundRect
  end
  object JvxLabel1: TJvxLabel
    Left = 19
    Top = 74
    Width = 486
    Height = 45
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sistema de Avalia'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    Layout = tlCenter
    ParentFont = False
    ShadowColor = clWhite
    ShadowSize = 2
    ShadowPos = spRightTop
    Transparent = True
  end
  object Label3: TLabel
    Left = 68
    Top = 196
    Width = 75
    Height = 24
    Caption = 'Curso....:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object ToolBar_BotoesIniciais: TToolBar
    Left = 0
    Top = 0
    Width = 578
    Height = 54
    ButtonHeight = 47
    ButtonWidth = 60
    Color = 16766640
    EdgeBorders = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Images = DM.ImageList_Ensino
    Indent = 15
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Transparent = False
    object ToolButton_MenuPrincipal: TToolButton
      Left = 15
      Top = 2
      Hint = 'Abre o Menu Principal.'
      Caption = 'Iniciar'
      ImageIndex = 64
      OnClick = ToolButton_MenuPrincipalClick
    end
    object ToolButton2: TToolButton
      Left = 75
      Top = 2
      Width = 18
      Caption = 'ToolButton2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton_Windows: TToolButton
      Left = 93
      Top = 2
      Hint = 'Sai do sistema e retorna para sistema operacional.'
      Caption = 'Windows'
      ImageIndex = 2
      OnClick = ToolButton_WindowsClick
    end
  end
  object MaskEdit_Senha: TMaskEdit
    Left = 177
    Top = 264
    Width = 194
    Height = 27
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 3
    OnKeyPress = MaskEdit_SenhaKeyPress
  end
  object MaskEdit_Nome: TMaskEdit
    Left = 175
    Top = 226
    Width = 194
    Height = 27
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 2
    Text = '   AGUARDE'
    OnKeyPress = MaskEdit_NomeKeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 336
    Width = 578
    Height = 19
    Color = 16777190
    Panels = <>
    SimplePanel = True
    SimpleText = 'Entre com o nome do Instrutor e seu C'#243'digo de Acesso'
  end
  object ComboBox_Curso: TComboBox
    Left = 176
    Top = 187
    Width = 153
    Height = 32
    BevelInner = bvSpace
    BevelKind = bkFlat
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 24
    ParentFont = False
    TabOrder = 1
  end
end
