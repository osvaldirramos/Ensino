object Frame_SelCurso: TFrame_SelCurso
  Left = 0
  Top = 0
  Width = 443
  Height = 113
  Align = alTop
  AutoSize = True
  Ctl3D = False
  ParentCtl3D = False
  TabOrder = 0
  object Panel_SelCurso: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 113
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 0
    object JvGradient_Tela01: TJvGradient
      Left = 0
      Top = 0
      Width = 690
      Height = 111
      Align = alClient
      Style = grVertical
      StartColor = 4227200
      EndColor = 16777190
      Steps = 60
    end
    object Label_CodCurso: TLabel
      Left = 11
      Top = 5
      Width = 94
      Height = 17
      Caption = 'C'#243'digo Curso:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label_Turma: TLabel
      Left = 8
      Top = 33
      Width = 40
      Height = 16
      Caption = 'Turma:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label_Termino: TLabel
      Left = 240
      Top = 88
      Width = 50
      Height = 16
      Caption = 'T'#233'rmino:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label_Local1: TLabel
      Left = 408
      Top = 88
      Width = 43
      Height = 16
      Caption = 'Local..:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label_TerminoDist: TLabel
      Left = 240
      Top = 61
      Width = 50
      Height = 16
      Caption = 'T'#233'rmino:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label_Local2: TLabel
      Left = 408
      Top = 61
      Width = 43
      Height = 16
      Caption = 'Local..:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label_Inicio: TLabel
      Left = 84
      Top = 88
      Width = 34
      Height = 16
      Caption = 'Inicio:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label_Inicio_dist: TLabel
      Left = 84
      Top = 61
      Width = 34
      Height = 16
      Caption = 'Inicio:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object JvShape_Base: TJvShape
      Left = 487
      Top = 0
      Width = 177
      Height = 26
      Pen.Color = 33023
    end
    object JvExpressButton_Base: TJvExpressButton
      Left = 489
      Top = 1
      Width = 174
      Height = 24
      Hint = 'Inserir QGA Base na Turma selecionada'
      DragCursor = crHandPoint
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = JvExpressButton_BaseClick
      FillColor = clLime
      ButtonBorder = bbDark
      Caption = 'Inserir QGA Base'
      HighlightFont.Charset = ANSI_CHARSET
      HighlightFont.Color = clBlack
      HighlightFont.Height = -13
      HighlightFont.Name = 'Arial'
      HighlightFont.Style = []
      ImageIndex = 2
      ImageSize = isSmall
      ParentImageSize = False
      LargeImages = DM.ImageList_Principal
      Spacing = 3
      SmallImages = DM.ImageList_Principal
    end
    object JvShape_MostraTurma: TJvShape
      Left = 650
      Top = 28
      Width = 30
      Height = 26
      Pen.Color = 33023
    end
    object JvExpressButton_MostraTurma: TJvExpressButton
      Left = 651
      Top = 29
      Width = 28
      Height = 24
      Hint = 'Mostra informa'#231#245'es da Turma selecionada.'
      DragCursor = crHandPoint
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = JvExpressButton_MostraTurmaClick
      FillColor = 15000804
      ButtonBorder = bbDark
      HighlightFont.Charset = ANSI_CHARSET
      HighlightFont.Color = clBlack
      HighlightFont.Height = -13
      HighlightFont.Name = 'Arial'
      HighlightFont.Style = []
      ImageIndex = 4
      ImageSize = isSmall
      ParentImageSize = False
      LargeImages = DM.ImageList_Principal
      Spacing = 3
      SmallImages = DM.ImageList_Principal
    end
    object Label_SemiPresencial: TLabel
      Left = 12
      Top = 61
      Width = 58
      Height = 16
      Caption = 'Dist'#226'ncia'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label_Presencial: TLabel
      Left = 12
      Top = 88
      Width = 67
      Height = 16
      Caption = 'Presencial'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ComboBox_Curso: TComboBox
      Left = 110
      Top = 1
      Width = 145
      Height = 24
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Color = 11192063
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox_CursoChange
    end
    object ComboBox_Turma: TComboBox
      Left = 51
      Top = 29
      Width = 598
      Height = 24
      BevelInner = bvSpace
      BevelKind = bkFlat
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      OnChange = ComboBox_TurmaChange
      OnKeyPress = ComboBox_TurmaKeyPress
    end
    object DBEdit_Inicio: TDBEdit
      Left = 124
      Top = 84
      Width = 98
      Height = 23
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'DATAINICIO'
      DataSource = DM.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit_Termino: TDBEdit
      Left = 291
      Top = 84
      Width = 98
      Height = 23
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'DATATERMINO'
      DataSource = DM.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit_Local1: TDBEdit
      Left = 455
      Top = 84
      Width = 186
      Height = 23
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'LOCAL1'
      DataSource = DM.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit_InicioDist: TDBEdit
      Left = 124
      Top = 57
      Width = 98
      Height = 23
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'DATAINICIODIST'
      DataSource = DM.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit_TerminoDist: TDBEdit
      Left = 291
      Top = 57
      Width = 98
      Height = 23
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'DATATERMINODIST'
      DataSource = DM.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit_Local2: TDBEdit
      Left = 455
      Top = 57
      Width = 186
      Height = 23
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'LOCAL2'
      DataSource = DM.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object ProgressBar: TProgressBar
      Left = 4
      Top = 70
      Width = 681
      Height = 17
      TabOrder = 8
    end
  end
end
