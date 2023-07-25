object Form_Cad_ATCO: TForm_Cad_ATCO
  Left = 232
  Top = 206
  Width = 693
  Height = 371
  Caption = 'Cadastro ATCO'
  Color = 16577515
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 294
    Width = 685
    Height = 50
    Align = alBottom
    ButtonHeight = 47
    ButtonWidth = 67
    Caption = 'ToolBar1'
    EdgeBorders = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Images = DM.ImageList_Ensino
    Indent = 15
    ParentFont = False
    ShowCaptions = True
    TabOrder = 0
    object Memo1: TMemo
      Left = 15
      Top = 2
      Width = 487
      Height = 47
      BorderStyle = bsNone
      Color = 16577515
      Lines.Strings = (
        'Pressione ALT+G para Gravar'
        'Pressione ALT+C para Cancelar')
      TabOrder = 0
    end
    object ToolButton_Gravar: TToolButton
      Left = 502
      Top = 2
      Caption = '&Gravar'
      ImageIndex = 9
      OnClick = ToolButton_GravarClick
    end
    object ToolButton1: TToolButton
      Left = 569
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 33
      Style = tbsSeparator
    end
    object ToolButton_Cancelar: TToolButton
      Left = 577
      Top = 2
      Caption = '&Cancelar'
      ImageIndex = 10
    end
  end
  object GroupBox_Procedencia: TGroupBox
    Left = 23
    Top = 182
    Width = 649
    Height = 95
    Caption = ' Proced'#234'ncia ( Org'#227'o / Setor ) '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label10: TLabel
      Left = 16
      Top = 28
      Width = 57
      Height = 17
      Caption = 'Org'#227'o..::'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 62
      Width = 54
      Height = 17
      Caption = 'Setor...::'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox_Unidade: TDBComboBox
      Left = 76
      Top = 23
      Width = 223
      Height = 25
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'IDUNIDADE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object ComboBox_SubUnidade: TDBComboBox
      Left = 76
      Top = 55
      Width = 223
      Height = 25
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'IDSUBUNIDADE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox_NomeCargo: TGroupBox
    Left = 23
    Top = 15
    Width = 649
    Height = 154
    Caption = ' Dados Pessoais  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label5: TLabel
      Left = 16
      Top = 84
      Width = 118
      Height = 17
      Caption = 'Posto/Gradua'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 117
      Width = 110
      Height = 17
      Caption = 'Nome Completo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 151
      Height = 19
      Caption = 'C'#243'digo Identifica'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 54
      Width = 116
      Height = 19
      Caption = 'CPF................:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object DBComboBox_PostoGraduacao: TDBComboBox
      Left = 150
      Top = 78
      Width = 219
      Height = 25
      BevelInner = bvSpace
      BevelKind = bkFlat
      Ctl3D = False
      DataField = 'POSTOGRADUACAO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      Items.Strings = (
        'Presencial'
        'EAD')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit_NomeCompleto: TDBEdit
      Left = 150
      Top = 112
      Width = 484
      Height = 23
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'NOME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 174
      Top = 17
      Width = 93
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'ID_ATCO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit_CPF: TDBEdit
      Left = 148
      Top = 50
      Width = 153
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'CPF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
  end
end
