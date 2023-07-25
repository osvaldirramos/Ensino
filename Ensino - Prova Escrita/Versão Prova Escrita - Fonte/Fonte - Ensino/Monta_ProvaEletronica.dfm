object Form_MontarProvaEletronica: TForm_MontarProvaEletronica
  Left = 251
  Top = 120
  Width = 1314
  Height = 1044
  Caption = 'Monta prova eletronica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JvGradient4: TJvGradient
    Left = 1241
    Top = 110
    Width = 32
    Height = 896
    Align = alLeft
    Style = grVertical
    StartColor = 15722132
    EndColor = 12615680
    Steps = 133
  end
  object Panel_TrataQuestoes: TPanel
    Left = 0
    Top = 110
    Width = 864
    Height = 896
    Align = alLeft
    BevelOuter = bvNone
    Color = 16775148
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object JvGradient2: TJvGradient
      Left = 860
      Top = 0
      Width = 0
      Height = 896
      Align = alLeft
      Style = grVertical
      StartColor = 15722132
      EndColor = 12615680
      Steps = 133
    end
    object JvGradient_Itens: TJvGradient
      Left = 0
      Top = 0
      Width = 32
      Height = 896
      Align = alLeft
      Style = grVertical
      StartColor = 15722132
      EndColor = 12615680
      Steps = 133
    end
    object Panel_Itens: TPanel
      Left = 32
      Top = 0
      Width = 828
      Height = 896
      Align = alLeft
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Panel_Cabecalho: TPanel
        Left = 0
        Top = 0
        Width = 828
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        Color = 16052155
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Baskerville Old Face'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 0
        object Shape15: TShape
          Left = -495
          Top = -80
          Width = 629
          Height = 103
          Brush.Color = 15722132
          Pen.Color = 15722132
        end
        object JvGradient_Cabecalho: TJvGradient
          Left = 0
          Top = 0
          Width = 828
          Height = 51
          Align = alClient
          StartColor = 15722132
          EndColor = 12615680
          Steps = 133
        end
        object Label10: TLabel
          Left = 0
          Top = 2
          Width = 223
          Height = 22
          Caption = 'Distribui'#231#227'o das Quest'#245'es'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Panel_Facil: TPanel
          Left = 176
          Top = 28
          Width = 211
          Height = 24
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 0
          object JvGradient_Facil: TJvGradient
            Left = 0
            Top = 0
            Width = 209
            Height = 22
            Align = alClient
            Style = grVertical
            StartColor = clWhite
            EndColor = 5898073
            Steps = 10
          end
          object Label_Facil: TLabel
            Left = 82
            Top = 1
            Width = 34
            Height = 18
            Caption = 'F'#225'cil'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
        end
        object Panel_Medio: TPanel
          Left = 386
          Top = 28
          Width = 212
          Height = 24
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 1
          object JvGradient_Medio: TJvGradient
            Left = 0
            Top = 0
            Width = 210
            Height = 22
            Align = alClient
            Style = grVertical
            StartColor = clWhite
            EndColor = 16761992
            Steps = 10
          end
          object Label_Medio: TLabel
            Left = 82
            Top = 1
            Width = 44
            Height = 18
            Caption = 'M'#233'dio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
        end
        object Panel_Dificel: TPanel
          Left = 597
          Top = 28
          Width = 212
          Height = 24
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 2
          object JvGradient_Dificel: TJvGradient
            Left = 0
            Top = 0
            Width = 210
            Height = 22
            Align = alClient
            Style = grVertical
            StartColor = clWhite
            EndColor = 8235263
            Steps = 10
          end
          object Label_Dificel: TLabel
            Left = 82
            Top = 1
            Width = 44
            Height = 18
            Caption = 'Dificel'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
        end
        object Panel_Disciplina: TPanel
          Left = 0
          Top = 28
          Width = 177
          Height = 24
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 3
          object JvGradient1: TJvGradient
            Left = 0
            Top = 0
            Width = 175
            Height = 22
            Align = alClient
            Style = grVertical
            StartColor = clWhite
            EndColor = 5151900
            Steps = 10
          end
          object Shape4: TShape
            Left = 80
            Top = 0
            Width = 1
            Height = 26
          end
        end
      end
      object DBGrid_Questoes: TDBGrid
        Left = 0
        Top = 51
        Width = 828
        Height = 845
        Align = alClient
        Ctl3D = False
        DataSource = DSC_Facil
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColLines, dgTabs]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid_QuestoesCellClick
        OnDrawColumnCell = DBGrid_QuestoesDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Disciplina'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Color = 5151900
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NQuestoes'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Quest'#245'es'
            Title.Color = 5151900
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 94
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Sel_F'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'F'
            Title.Color = 5898073
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 14
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumItem_F'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Id Item'
            Title.Color = 5898073
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Objetivo_F'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Obj'
            Title.Color = 5898073
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Conflito_F'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Conflito'
            Title.Color = 5898073
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sel_M'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'M'
            Title.Color = 16761992
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 14
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumItem_M'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Id Item'
            Title.Color = 16761992
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Objetivo_M'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Obj'
            Title.Color = 16761992
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Conflito_M'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Conflito M'
            Title.Color = 16761992
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sel_D'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'D'
            Title.Color = 8235263
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 14
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumItem_D'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Id Item'
            Title.Color = 8235263
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Objetivo_D'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Obj'
            Title.Color = 8235263
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Conflito_D'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Conflito D'
            Title.Color = 8235263
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 76
            Visible = True
          end>
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 1256
    Top = 104
    Width = 1041
    Height = 809
    DataSource = DSC_Facil
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'Disciplina'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Materia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NQuestoes'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sel_F'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumItem_F'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumQuestao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sel_M'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumItem_M'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumQuestao_M'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sel_D'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumItem_D'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumQuestao_D'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Posiciona_Cont'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 864
    Top = 110
    Width = 377
    Height = 896
    Align = alLeft
    Color = 16775660
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Width = 375
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter2: TSplitter
      Left = 1
      Top = 156
      Width = 375
      Height = 4
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter3: TSplitter
      Left = 1
      Top = 304
      Width = 375
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter4: TSplitter
      Left = 1
      Top = 309
      Width = 375
      Height = 7
      Cursor = crVSplit
      Align = alTop
    end
    object Panel2: TPanel
      Left = 1
      Top = 160
      Width = 375
      Height = 144
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label2: TLabel
        Left = 10
        Top = 38
        Width = 96
        Height = 20
        Caption = 'Selecionadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 65
        Width = 120
        Height = 20
        Caption = 'Quest'#245'es Faceis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 93
        Width = 124
        Height = 20
        Caption = 'Quest'#245'es M'#233'dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 117
        Width = 124
        Height = 20
        Caption = 'Quest'#245'es Dif'#237'ceis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel_Selecionadas: TPanel
        Left = 152
        Top = 30
        Width = 42
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = '0'
        Color = 6723839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel_TotalQuestoesFaceis: TPanel
        Left = 152
        Top = 57
        Width = 42
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = '0'
        Color = 6723839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Panel_TotalQuestoesMedias: TPanel
        Left = 152
        Top = 85
        Width = 42
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = '0'
        Color = 6723839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Panel_TotalQuestoesDificeis: TPanel
        Left = 152
        Top = 113
        Width = 42
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = '0'
        Color = 6723839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object JvGradientCaption2: TJvGradientCaption
        Left = 0
        Top = 0
        Width = 373
        Height = 27
        GradientStartColor = 16697257
        GradientStyle = grHorizontal
        LabelCaption = 'Estatistica da Prova'
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clBlack
        LabelFont.Height = -16
        LabelFont.Name = 'Arial'
        LabelFont.Style = []
        LabelAlignment = taLeftJustify
        Align = alTop
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        DoubleBuffered = False
        TabOrder = 4
      end
    end
    object Panel13: TPanel
      Left = 1
      Top = 4
      Width = 375
      Height = 152
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 99
        Height = 20
        Caption = 'Especificadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 10
        Top = 65
        Width = 254
        Height = 20
        Caption = 'Quest'#245'es    F'#225'ceis   M'#233'dias  Dif'#237'ceis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label_Total: TLabel
        Left = 16
        Top = 123
        Width = 47
        Height = 24
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label_TotalPor: TLabel
        Left = 16
        Top = 93
        Width = 56
        Height = 24
        Caption = '100 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape5: TShape
        Left = -106
        Top = 63
        Width = 479
        Height = 1
      end
      object JvTransparentButton_MontarProva: TJvTransparentButton
        Left = 241
        Top = 34
        Width = 128
        Height = 24
        Hint = 'Inicia a montagem da prova autom'#225'tica'
        BorderWidth = 0
        Caption = 'Montar Prova   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          9A050000424D9A05000000000000360000002800000014000000170000000100
          1800000000006405000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFCFD2D196AA99A4B6A3BDCBC3D5DDD8D2CFD5C7C2C9C5C1C6C4C3
          C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC7E6CB0070021C89054D891D5F9A396BA35794C791B6E2BABEBEC3C8C7CA
          CFCBD0C9C4CBC6C2C6C3C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECDCE8AC2
          92008D0073A528F9A543CB8D239877077174006174005983144FA24167BF6986
          B082B1C9AFD4D4D7D0C5D0CBC3CCFFFFFFFFFFFFFFFFFFE0DDD9559E61008900
          CBBA6CFFD1A7FFD199FFD58FFFC36EF2AC50E49530B890239D8C1466931B3396
          232E911F3E973E83C17AFFFFFFFFFFFFD4D1D4C4CDC3348F3A279104E1C77FFF
          CEA2FBCA9DFDCD9DFDCE9FFED2A1FFD298F9B565F69C42FFB756F9D06CDEC984
          A7CE7A3A9D35FFFFFFFFFFFFE1D2DCA1B9A7118E15589620FDCE90FFCE96FFCD
          96FECC9AFECB9EFECAA1FCCC90E1B259BF9046F5C18CFCCC94FFDCD5F9F7D46E
          9C55FFFFFFCED0CDCAB9C391B19900900081A43AFFD19EFFCE97FFCC96FFCD97
          FFCD98FDCD9AFECB93EAA44EE0AB70F8DCC1EACB97FDF6C1D0E1AE8CAF72CBCB
          CBC9C8C6C2B9C274AC7C009200BFB66CFED1A4FCCD97FCCE99FCCE97FBCD97FC
          CE9BFDC795CE9F53E3D5AAFFFFFBE6D4B7FFF4D994BE88A5BDA3D5D5D5BEBABC
          BFBCC0419A4E16950AEED09EFBD4ABFFD2A8FFD0A6FFCFA5FFCFA3FFCC9FFFCE
          95EDC07ADDBC8EF0E0CBF4E7CDFDE9C772B066B8C6B8CECECECBCACDC8C8C227
          983E3D9725FFEABAFADAB2F9D7A0F5D196F3C78AF4C581F4C482F1C288F8C682
          F5C182ECBA83EAC18BCAC99980B87CD6DCD4C1C1C1C5C3C6CBD5C317A2337CA9
          59FFF3C9FDE3C0F5E0B9F2DBB2F1D6A8EEC999E9C18DE1B57BDCA76DD49C57DB
          A963FAD198A8BE859EC9A8FFFFFFC3C3C3C7C3C7A6C1A315AE32B0C68FFFECC9
          F9DBB9FCDAB5FAD8B3FDD9B3FEDCB7FDE1B7FCE6ADFCDDB4FBE0A8FFE4ABEDC7
          A58EB67BBBC4C1FFFFFFC3C3C3CBC4CA7BB28A2DB13AD9DDB6FCECD9EFD3C0FA
          D29AF1C68BEABD7FE0B071D6A564E0A25ED9A25CD09955FCE4B6E8D0B290BD8A
          FFFFFFFFFFFFC3C2C3CAC6C96DCE8858B254FAF2D9FEF5D5FCF8D8FBF1E6FEF1
          E2FFF4DFFFF4D7FAF1D2F7E8D1EDDDB4EBCDABF5E6C7C3C193A0B5A0FFFFFFFF
          FFFFC4C2C3C3C1C14CC46875BC72FFFFFAECD8B4EFD19EF1CB9BEFC995EEC48E
          EFC68AF1C889F0CF8AF4D3A0FEEBD1E7DEC5A5BD8BC1CFC5FFFFFFFFFFFFC3C1
          C3CCD3CC2BBC4EA2D09AFFFEFFF9F4E9FBF2E2FDEDCFF7E4C2F3DDB9E9CEA8E1
          C297DBB877CC9F6FF5DFC8D2CEAAA4BF87FFFFFFFFFFFFFFFFFFC4C1C3C6D3C8
          3DB964DAE7C3FFF6F6F7E8BEF6E8CCF0E8D1F6EDD5FBF0D6FDF5DAFCF7E0FCF5
          E0FAF7DCF7EDDBC3CAB0000000FFFFFFFFFFFFFFFFFFC7C2C69CBEA26CBE78F7
          F9EDF7E4D8EBDEA2E7C99CDFC987DAB976D8AB67DAA257D49C4FBB9149C5A56E
          F8E3C6B6BDACB8BDBCFFFFFFFFFFFFFFFFFFCCCACC80C09095CF97F5F8FBFFFC
          FAFFFFF8FFFFFFFFFFFFFFFFFFFFFFFDFFFFF4FFFDECFEF5DAFEF4DBE5D7BDBF
          C2ADFFFFFFFFFFFFFFFFFFFFFFFFC7D1CA8ED39DBAD7ACEBDAD0DACBC567AEB2
          53B3CF76BCD48AC7DC9BCFE0B7DBEBCEE6F4F9F6F5E4E5D0C8CAA6B6BDADFFFF
          FFFFFFFFFFFFFFFFFFFFB2B9B39AD8A994CB9AA1AD8E959D8F50ACAF5ADBEF33
          CDF017BAE205ACD4009FCB0F91B5C5D2B7C4D1ACDBE8C8C7CAC6FFFFFFFFFFFF
          FFFFFFFFFFFFC7CAC8C2D6C6D6D8C7BDE1D35996967FB7C2DBE6ECC6E1E1B4E4
          E59FDFE190D8DD91CFD4C8C3C0C4C5C4C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC2C2C2C3C0C2C1C0C2C8C6C7D6D4D9C6CED2C1C2C1C4BFBEC6BFBFC8C0BF
          C9C1C0C9C2C1C3C2C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaRight
        OnClick = JvTransparentButton_MontarProvaClick
      end
      object MaskEdit_Por_Faceis: TMaskEdit
        Left = 98
        Top = 86
        Width = 31
        Height = 30
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 6723839
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        Text = '50'
        OnKeyPress = MaskEdit_Por_FaceisKeyPress
      end
      object MaskEdit_Por_Medias: TMaskEdit
        Left = 154
        Top = 86
        Width = 31
        Height = 30
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 6723839
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 1
        Text = '30'
        OnKeyPress = MaskEdit_Por_MediasKeyPress
      end
      object MaskEdit_Por_Dificeis: TMaskEdit
        Left = 216
        Top = 86
        Width = 31
        Height = 30
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 6723839
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 2
        Text = '20'
        OnKeyPress = MaskEdit_Por_DificeisKeyPress
      end
      object MaskEdit_Especificadas: TMaskEdit
        Left = 112
        Top = 32
        Width = 38
        Height = 30
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 6723839
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 3
        Text = '30'
        OnKeyPress = MaskEdit_EspecificadasKeyPress
      end
      object MaskEdit_Tot_Faceis: TMaskEdit
        Left = 98
        Top = 116
        Width = 31
        Height = 30
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 6723839
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 4
        Text = '30'
        OnKeyPress = MaskEdit_Tot_FaceisKeyPress
      end
      object MaskEdit_Tot_Medias: TMaskEdit
        Left = 154
        Top = 116
        Width = 31
        Height = 30
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 6723839
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 5
        Text = '30'
        OnKeyPress = MaskEdit_Tot_MediasKeyPress
      end
      object MaskEdit_Tot_Dificeis: TMaskEdit
        Left = 216
        Top = 116
        Width = 31
        Height = 30
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 6723839
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 6
        Text = '30'
        OnKeyPress = MaskEdit_Tot_DificeisKeyPress
      end
      object JvGradientCaption1: TJvGradientCaption
        Left = 0
        Top = 0
        Width = 373
        Height = 27
        GradientStartColor = 16697257
        GradientStyle = grHorizontal
        LabelCaption = 'Especifica'#231#227'o da Prova'
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clBlack
        LabelFont.Height = -16
        LabelFont.Name = 'Arial'
        LabelFont.Style = []
        LabelAlignment = taLeftJustify
        Align = alTop
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        DoubleBuffered = False
        TabOrder = 7
      end
    end
    object Edit_Escape: TEdit
      Left = -144
      Top = 320
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit_Escape'
    end
    object Panel_Treeviw: TPanel
      Left = 1
      Top = 316
      Width = 375
      Height = 579
      Align = alClient
      Color = 16577515
      TabOrder = 3
      object JvGradientCaption6: TJvGradientCaption
        Left = 1
        Top = 1
        Width = 373
        Height = 32
        GradientStartColor = 16697257
        GradientStyle = grHorizontal
        LabelCaption = 'Prova'
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clBlack
        LabelFont.Height = -16
        LabelFont.Name = 'Arial'
        LabelFont.Style = []
        LabelAlignment = taLeftJustify
        Align = alTop
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        DoubleBuffered = False
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 33
        Width = 360
        Height = 545
        Align = alLeft
        Color = 11064319
        Ctl3D = False
        DataSource = DCDS_Prova
        Options = [dgEditing, dgTitles, dgColLines, dgTabs]
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Nivel'
            Title.Alignment = taCenter
            Title.Caption = 'N'#237'vel'
            Title.Color = 5220351
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 33
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Materia'
            Title.Alignment = taCenter
            Title.Caption = 'Disciplina'
            Title.Color = 5220351
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumItem'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' do Item'
            Title.Color = 5220351
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'RespostaCorreta'
            Title.Alignment = taCenter
            Title.Caption = 'Resposta Correta'
            Title.Color = 5220351
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 232
        Top = 3
        Width = 135
        Height = 29
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object JvTransparentButton_HomogeneizarProva: TJvTransparentButton
          Left = 1
          Top = 0
          Width = 129
          Height = 24
          Hint = 'Inicia a montagem da prova autom'#225'tica'
          BorderWidth = 0
          Caption = 'Homogeneizar'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          FrameStyle = fsDark
          Glyph.Data = {
            9A050000424D9A05000000000000360000002800000014000000170000000100
            1800000000006405000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFCFD2D196AA99A4B6A3BDCBC3D5DDD8D2CFD5C7C2C9C5C1C6C4C3
            C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC7E6CB0070021C89054D891D5F9A396BA35794C791B6E2BABEBEC3C8C7CA
            CFCBD0C9C4CBC6C2C6C3C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECDCE8AC2
            92008D0073A528F9A543CB8D239877077174006174005983144FA24167BF6986
            B082B1C9AFD4D4D7D0C5D0CBC3CCFFFFFFFFFFFFFFFFFFE0DDD9559E61008900
            CBBA6CFFD1A7FFD199FFD58FFFC36EF2AC50E49530B890239D8C1466931B3396
            232E911F3E973E83C17AFFFFFFFFFFFFD4D1D4C4CDC3348F3A279104E1C77FFF
            CEA2FBCA9DFDCD9DFDCE9FFED2A1FFD298F9B565F69C42FFB756F9D06CDEC984
            A7CE7A3A9D35FFFFFFFFFFFFE1D2DCA1B9A7118E15589620FDCE90FFCE96FFCD
            96FECC9AFECB9EFECAA1FCCC90E1B259BF9046F5C18CFCCC94FFDCD5F9F7D46E
            9C55FFFFFFCED0CDCAB9C391B19900900081A43AFFD19EFFCE97FFCC96FFCD97
            FFCD98FDCD9AFECB93EAA44EE0AB70F8DCC1EACB97FDF6C1D0E1AE8CAF72CBCB
            CBC9C8C6C2B9C274AC7C009200BFB66CFED1A4FCCD97FCCE99FCCE97FBCD97FC
            CE9BFDC795CE9F53E3D5AAFFFFFBE6D4B7FFF4D994BE88A5BDA3D5D5D5BEBABC
            BFBCC0419A4E16950AEED09EFBD4ABFFD2A8FFD0A6FFCFA5FFCFA3FFCC9FFFCE
            95EDC07ADDBC8EF0E0CBF4E7CDFDE9C772B066B8C6B8CECECECBCACDC8C8C227
            983E3D9725FFEABAFADAB2F9D7A0F5D196F3C78AF4C581F4C482F1C288F8C682
            F5C182ECBA83EAC18BCAC99980B87CD6DCD4C1C1C1C5C3C6CBD5C317A2337CA9
            59FFF3C9FDE3C0F5E0B9F2DBB2F1D6A8EEC999E9C18DE1B57BDCA76DD49C57DB
            A963FAD198A8BE859EC9A8FFFFFFC3C3C3C7C3C7A6C1A315AE32B0C68FFFECC9
            F9DBB9FCDAB5FAD8B3FDD9B3FEDCB7FDE1B7FCE6ADFCDDB4FBE0A8FFE4ABEDC7
            A58EB67BBBC4C1FFFFFFC3C3C3CBC4CA7BB28A2DB13AD9DDB6FCECD9EFD3C0FA
            D29AF1C68BEABD7FE0B071D6A564E0A25ED9A25CD09955FCE4B6E8D0B290BD8A
            FFFFFFFFFFFFC3C2C3CAC6C96DCE8858B254FAF2D9FEF5D5FCF8D8FBF1E6FEF1
            E2FFF4DFFFF4D7FAF1D2F7E8D1EDDDB4EBCDABF5E6C7C3C193A0B5A0FFFFFFFF
            FFFFC4C2C3C3C1C14CC46875BC72FFFFFAECD8B4EFD19EF1CB9BEFC995EEC48E
            EFC68AF1C889F0CF8AF4D3A0FEEBD1E7DEC5A5BD8BC1CFC5FFFFFFFFFFFFC3C1
            C3CCD3CC2BBC4EA2D09AFFFEFFF9F4E9FBF2E2FDEDCFF7E4C2F3DDB9E9CEA8E1
            C297DBB877CC9F6FF5DFC8D2CEAAA4BF87FFFFFFFFFFFFFFFFFFC4C1C3C6D3C8
            3DB964DAE7C3FFF6F6F7E8BEF6E8CCF0E8D1F6EDD5FBF0D6FDF5DAFCF7E0FCF5
            E0FAF7DCF7EDDBC3CAB0000000FFFFFFFFFFFFFFFFFFC7C2C69CBEA26CBE78F7
            F9EDF7E4D8EBDEA2E7C99CDFC987DAB976D8AB67DAA257D49C4FBB9149C5A56E
            F8E3C6B6BDACB8BDBCFFFFFFFFFFFFFFFFFFCCCACC80C09095CF97F5F8FBFFFC
            FAFFFFF8FFFFFFFFFFFFFFFFFFFFFFFDFFFFF4FFFDECFEF5DAFEF4DBE5D7BDBF
            C2ADFFFFFFFFFFFFFFFFFFFFFFFFC7D1CA8ED39DBAD7ACEBDAD0DACBC567AEB2
            53B3CF76BCD48AC7DC9BCFE0B7DBEBCEE6F4F9F6F5E4E5D0C8CAA6B6BDADFFFF
            FFFFFFFFFFFFFFFFFFFFB2B9B39AD8A994CB9AA1AD8E959D8F50ACAF5ADBEF33
            CDF017BAE205ACD4009FCB0F91B5C5D2B7C4D1ACDBE8C8C7CAC6FFFFFFFFFFFF
            FFFFFFFFFFFFC7CAC8C2D6C6D6D8C7BDE1D35996967FB7C2DBE6ECC6E1E1B4E4
            E59FDFE190D8DD91CFD4C8C3C0C4C5C4C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC2C2C2C3C0C2C1C0C2C8C6C7D6D4D9C6CED2C1C2C1C4BFBEC6BFBFC8C0BF
            C9C1C0C9C2C1C3C2C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TextAlign = ttaRight
          OnClick = JvTransparentButton_HomogeneizarProvaClick
        end
      end
    end
  end
  object Panel_Botoes_CabecalhoProva: TPanel
    Left = 0
    Top = 0
    Width = 1298
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16775660
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object Label_DescricaoCurso: TLabel
      Left = 496
      Top = 88
      Width = 107
      Height = 13
      Caption = 'Label_DescricaoCurso'
      Visible = False
    end
    object JvGradient3: TJvGradient
      Left = 0
      Top = 0
      Width = 1296
      Height = 108
      Align = alClient
      Style = grVertical
      StartColor = 15722132
      EndColor = 12615680
      Steps = 108
    end
    object Shape7: TShape
      Left = 4
      Top = 7
      Width = 580
      Height = 91
      Brush.Color = 16775660
      Shape = stRoundRect
    end
    object Shape3: TShape
      Left = 103
      Top = 72
      Width = 479
      Height = 1
    end
    object Label5: TLabel
      Left = 109
      Top = 48
      Width = 223
      Height = 24
      Caption = 'REFERENCIA DA PROVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 376
      Top = 48
      Width = 153
      Height = 24
      Caption = 'DATA DA PROVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 338
      Top = 8
      Width = 1
      Height = 88
    end
    object Label_Referencia_Prova: TLabel
      Left = 347
      Top = 72
      Width = 209
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'PD-02'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label_Data_Prova: TLabel
      Left = 106
      Top = 72
      Width = 230
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = '29/02/2016'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape1: TShape
      Left = 103
      Top = 47
      Width = 479
      Height = 1
    end
    object Label7: TLabel
      Left = 169
      Top = 16
      Width = 71
      Height = 24
      Caption = 'ATM002'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label_Curso: TLabel
      Left = 110
      Top = 16
      Width = 60
      Height = 24
      Caption = 'Curso: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 343
      Top = 17
      Width = 65
      Height = 24
      Caption = 'Turma: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label_Turma: TLabel
      Left = 409
      Top = 16
      Width = 96
      Height = 24
      Caption = 'M. BICUDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Image2: TImage
      Left = 8
      Top = 10
      Width = 84
      Height = 86
      Picture.Data = {
        0A544A504547496D6167657A4E0000FFD8FFE000104A46494600010101006000
        600000FFE1005A4578696600004D4D002A000000080005030100050000000100
        00004A0303000100000001000000005110000100000001010000005111000400
        00000100000EC3511200040000000100000EC300000000000186A00000B18FFF
        DB00430002010102010102020202020202020305030303030306040403050706
        07070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E
        0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0CFFC0001108005702C403012200021101031101FFC4001F
        0000010501010101010100000000000000000102030405060708090A0BFFC400
        B5100002010303020403050504040000017D0102030004110512213141061351
        6107227114328191A1082342B1C11552D1F02433627282090A161718191A2526
        2728292A3435363738393A434445464748494A535455565758595A6364656667
        68696A737475767778797A838485868788898A92939495969798999AA2A3A4A5
        A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DA
        E1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101
        010101010000000000000102030405060708090A0BFFC400B511000201020404
        0304070504040001027700010203110405213106124151076171132232810814
        4291A1B1C109233352F0156272D10A162434E125F11718191A262728292A3536
        3738393A434445464748494A535455565758595A636465666768696A73747576
        7778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2
        B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7
        E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDA4A28AF993
        F6F7FDA3EF7F672934ABEB4B1B8D49B539E48193FB5EEECD2254891F216270A4
        92C792335D39A63B1B4AB61B0796E16589AF89A9ECE14E32841B7C93A8DB9549
        460928D393D5EAEC96A7C3E271784C2616B63B1D53D9D2A51E694ACE564E518A
        D2376F5923E9BA2BF36BFE1E73AE3DC5C471786E4B836A42C863F126A8402718
        EAE382580CFA9C75A2FBFE0A6FAFE973DA4575E17B8B77BF4692D83F88F541E7
        AAA962CBF3F2B85383D09EF5E7E1F1BC4D5F0B1C6D1CAE32A72B5A4B1B80D79A
        FCA97FB45EEDA6946D76D356BA3C9ADC5591D2AF2C2D4AB554E37BA787ADA5B5
        6FE0D9269B7B5B5BD8FD25A2BE19F86DFB51FC44F8AFF0ABC5DE32D23C3164DA
        2F826312EA6D378BF528E55050BFC8BBCEEE01F4AF45F8652FC68F89DE05D275
        E4F0EF873448FC411F9BA4D9EAFE39D46DAF3535C6E0638F71EA3900907041C6
        0D7A38DC271B60F9BEB3923872BE577C5E0B495B9AD6F6FBF2EBE9AEC3C0F156
        458DE4785AF39A9C7995A855B38F372DEFCBB7369E6F447D43457C8DF063E21F
        C51F8DBF0E351F15DA693E19D0F48D2B51934BBB7D6FC71A9593413C7B372B65
        885E5C0E4F5E2B83F17FED97E33F0A7C638FC0D1E89A56B9ACCD736F690CBA4F
        8CB51BAB5B8927085024824C1E5C03E8411DAB6A19671DD6AF530D4B21939D3B
        F3258AC1FBB6B5EFFBFE975F798E238CF872850A78AAD899C6152CA2DD1ABEF5
        EF6B7BB777B3FB8FBD68AF857F68EFDABBE217ECB5F109BC33E29F0B5B8D40DA
        A5E2496BE2BD4E48258DF201562E09C1520F1C115F5BFECFFADB78A7E1268BAC
        3ADC249ACDAC37CF1CB7935D794D2448C555E5666DA3D381DF1926BCEAD8DCFF
        00038AC150CEF2B961E9E314DD2A9EDB0F5632E48A9356A5526D68F46D58F472
        FCEF29CC2AE230D81AEE55685B9E32A73838DDDBED25D4ECE8AF02FDB63E35F8
        9BC21E36F83BF0EBC25A9BF87356F8BFE299747B8F1025BC33CFA358DB69F757
        D70F6CB3A3C06E9C5BAC719992441BD98C726DDB5C2FC76F147C58F8090FC34F
        85D6DF156EFC41E23F8BFE3A7D1EC7C65A8787B4F8755F0FE911584F7F721A38
        A35B2B8BCC5AC91C529B44880990BC5218CB49EDFB6D5AB3D1A8F4D5B71B25AF
        F796AECB47ADD58F5FEACEC9B6B58B975D22B9AEF6FEE3D15DEDA6A7D6F457E7
        47ED9BFB557C65FD95747F8B3F0CAC7E25DFEADE22D374DF08788BC29E36BCD1
        74C6D5ACED755F10AE93776F770C76D1D8CCE8D1C8D13A5B27C92E1B2E81DACF
        873F6D8F8B5E2AFDB23F657D022F16347E1DF1368965A6F8EF4B4D2ECD9757D7
        24D2F5A9EE7F7861F361F2A5D36121216407CD208C60116222DC53D2F251D7BB
        5AFC93B45BEED5AF1F78D5E02A724E69A7CB1726AFAD959AB776E2F992E893E6
        B3D1FE87515F15FEC93FB71F8BFE277ED6BACC3AFEAB6D77F0CBE2CA6BD3FC2D
        1F678216B61E1EBF1A7DE20645DF30BB575BC532B36C589C2E14815E35FB10FF
        00C1487E2FFC56F047ECB3A678CFC45049E2AF1B788AF4788AE23D3ED23FF849
        B479B45D4AFAC6E36244160D9716CF01F282333E9EE4FCB261B0FAFD3F63EDEC
        EDCB1979FBD271B59FDA4E2EEB7B26D5D266AF29ACA73A77578B927DBDD8F336
        B4D574BFF3687E9CD15F9B5FB397ED87F167E1AFECEBFB317C63F1AFC4DF10FC
        45D2BE33DF3E85E28F0FEA3A3E8F6F1D849358DE5D5BDD69C6C6CEDA6468E4B1
        D8EB3C93C6D1CEE4EC65571D2687FB4CFC63F06FEC67F0DFF69ED6BE21CFACD8
        78DB52D0EFB58F009D1F4F4D16C347D62FA0B68E1B2992DD2F85E5BC7750379B
        3DD491C8D1CA0C603A797D2AAA75254FF964A12ECA5269453F5BDEEAE92BDDA7
        A1854C14E093BA7CC9C979A5CD7B69D1C6DADB56AD7D6DFA03457CBDFB5EF8C7
        C73ABFEDC1F033E1A786BE23789BE1E683E33D1FC4BA8EB13E8363A4DC5E5D3D
        8AE9C6DD43EA1677688A3ED12E76A0277727815E3577FB677C67F88DFB2FE8BF
        0EBC2DE22B1B7FDA1751F88FE20F8716BE214D26DCC1A82E806EE7B8D48DBC81
        A0066B7B5B78A508A5165BC7F2C478445C658C8460EA493495FA745354DBD3A2
        6D37D6DAA4ECEDA432EA92B59AD6DD76BC2535D3F962F6EB65D4FD06A2BCCBF6
        76FDA9B40F8F7FB247863E303491695A06B7E1C4F10DF0DFE62E92AB0F997513
        37193032CA8C7D6235F1B7C2FF00F82817C597FD917E3E6A3E2ED5E1B1F1D7FC
        2AF93E34FC3D9FEC56A92E99A36A16776F69686111EC94D94F6A033CC1D9C5C2
        07DD83558BC4C70EEA467AB826DDB5D949D9776D466D74B424DB5A5E30780AB8
        9E5E4D39A4A3ADD6ADC6377A6CA528A7D5392D19FA2D457E72FC46FDAC3C6DE0
        4FF8268789FE23683F17BE3AEABE2912785229AF7C57F0D6DB497D27EDBA95AC
        37474C81F42B55BDDF14D2A8212EC0C45B70CC0BD1D23FE0A0BF10F4EF087C5F
        9BC07E37F15FC47F0ED87893C35F0E7C3DE29F881E14B6D12FB40F15EA37E6D2
        FED66B286CEC24922B3866B498896D91BCD668CB32F234A95546A4A95AF24F96
        CADAB7CB6B6B6B3728C537657695F52696127529C6B2768B57BBBE8BADF4E893
        6D2BBB26EDA1FA51457C15FB5D7ED07F15FF0060C7F14F86DFE26EB3F1017C4B
        F09FC59E2AF0F6B7AE691A545AAF87B59D1ADA29738B3B5B7B596D644B846092
        40EEB24472EE8FB564FD96BF6FCF1B78AFE397C30D0FC7FAEDB69F6FA67C29D7
        359F1FDBA5A40239351D3E7D2CC7A96E081A349ACAEBED6224608A976011941B
        7258CA4E4E37D936DF64BDADDF7B2F6525B6EE3DF4D1E5B5FD9C6A257E6764BA
        B6FD9D97CFDA2FBA5D95FEDCD03C77A278AF58D634ED2F59D2B52D43C3B72B67
        AADB5ADDC734DA64ED124AB14E8A4989CC5246E15C0255D5B1820D6AD7E6CFC1
        0FDB5FE22F863F645FDA2750D6A5D2B40F1D6A7F0EEE7E3CF8266B5D2ACADA4B
        7D3F55B4BB9218E58522D97135ADCDA8DF34E1E497ED09E61620D7B4BFC66F88
        1F133F69DF843E00B7F1DEB3E18D37C73F07AFBC4DA8DE695A7E9AF78BA94575
        A4AA5CC66EAD668D484B89D7618CC644A4ECCAA95AA759CA4A9B8BE6B2BAED2E
        5A8E4BFEDD74A717FDEB2BBD5A55F04E179F32E5BBB3D764E9D9EDD6356125E5
        7D364FEBDA2BF347C33FB45FC69F08FEC6DAF7C48BCF8D7E32F116B569F18A3F
        87F0DAEA3A2F87D2CE3D3E3F1943A5349B6DF4D89CCF25A064662E5419599111
        8215F7BFD957C57F14FF006CAD2E5F8AD63F14AFFC1DA347E37D574CB2F06AE8
        3A75EE913E8FA76A53D814BA67856FD6F665B7924F352EA38E3778FF0070CA8C
        B2143111AAA2E0B4924FD138D395DFCAA45D95DEFA684623073A3CDCED7BADAE
        BAB4EA2B2D3BD396AECB6D753EB3A2BE311FB6E78C2DFF00E0A3525AC9A9DBB7
        C0E97C4EDF0796DDEDE18CC1E2A5D2D756FB589B6F9CD93E6587945B66F0AC00
        6DC6BECEABA3563569AAB0D9FF00926BEF8B8C97F764AF66EC6788A13A33F673
        DED7FC5A7F7494A2FCE2FD428A28AD0C028A28A0028A28A0028A28A0028A28A0
        028A28A00F01F891F127E24EB9FB4AF8FF00C39E1EF885F097E19782FE1B781B
        43F166ABAB78C3C2975AC0637F77AE452BBCD1EAD6115BC10C7A4A312E1B3E6B
        92CA140ABFA2786BE3378975AD134DD3BF697FD99350D47C4DA59D7348B5B6F8
        657D2CFAAE9E0A66F2DD17C505A5B71E6C7FBD4053F789CFCC33E3DFB717FC81
        BF6F1FFB36DD03FF0047F8DABE43F127C38F88B65F10ADFE0C7826DF5B9BC49A
        3FECB7E259FC113C25BCDBED3B537D32E21B4824C7FAC865FB659C68BCAC70DB
        F396DD5E355C554F6D5609FC2AFEBFBBAD3B75EB4D74D9C9F447D46170146542
        8CE495E6ECFCBDFA51BF4D3F78EFAEF6E976BF407E1578A7E20FC77F116B3A3F
        81FF006B8FD923C65AB78714BEAD65A1F802E751B9D2D43142678E1F15334403
        02B970390475AA0BF14FC5ADF08A4F8803F6CAFD8E4F80E2BEFECB7F120F044D
        FD90977C7FA39BAFF84AFC912F23E4DDBB91C5795EBFF167E177ED33E30FD8DB
        48FD9D6EF44D4B5FF8652CD73ADDB686ABE7F813C363449EDEF6C35354C9B169
        6636D08B7B80AEF2C5C0CC6587E7B41E1E8BFE1D0537C3F169FE8971E019BE34
        3AF95FBA7D9A3DC6825BD322E5617CFF007C83F7B9A2788A91551F35D41A4BFB
        DAB6E496BEEF2C65D5DA5169BB26CD30F82A15254E2E167349FF0085BD1465B6
        BCCE37D17BB25A5DA47EAC7887E30F89FC23F1422F03EADFB687EC69A678D279
        E0B68F40BBF05CB06A924B38430462D9BC56252F20910A285CB075C6722BD5FF
        00E19BFF00699FFA2D5F02FF00F0CEEABFFCD357C95FB1F7ED1B6BF07BFE0A7F
        FB41E8D7DF1CBE06FC37B5D73C45E1212786FC616AADAE78941F0FD826DD3E53
        AA5A88D989F2C136D71F3B0E0FDD3FAAB5A4AAD4508CB9B7B3FBD27F85FBFAA4
        634F0D465AF22D97F5FD2F9B3E5FFF00866FFDA67FE8B57C0BFF00C33BAAFF00
        F34D47FC337FED33FF0045ABE05FFE19DD57FF009A6AFA828ACBEB153B9AFD4E
        87F2A3E5FF00F866FF00DA67FE8B57C0BFFC33BAAFFF0034D47FC337FED33FF4
        5ABE05FF00E19DD57FF9A6AFA828A3EB153B87D4E87F2A3E5FFF00866FFDA67F
        E8B57C0BFF00C33BAAFF00F34D47FC337FED33FF0045ABE05FFE19DD57FF009A
        6AFA828A3EB153B87D4E87F2A3E5FF00F866FF00DA67FE8B57C0BFFC33BAAFFF
        0034D47FC337FED33FF45ABE05FF00E19DD57FF9A6AFA828A3EB153B87D4E87F
        2A3E5FFF00866FFDA67FE8B57C0BFF00C33BAAFF00F34D47FC337FED33FF0045
        ABE05FFE19DD57FF009A6AFA828A3EB153B87D4E87F2A3E5FF00F866FF00DA67
        FE8B57C0BFFC33BAAFFF0034D47FC337FED33FF45ABE05FF00E19DD57FF9A6AF
        A828A3EB153B87D4E87F2A3E5FFF00866FFDA67FE8B57C0BFF00C33BAAFF00F3
        4D47FC337FED33FF0045ABE05FFE19DD57FF009A6AFA828A3EB153B87D4E87F2
        A3E5FF00F866FF00DA67FE8B57C0BFFC33BAAFFF0034D47FC337FED33FF45ABE
        05FF00E19DD57FF9A6AFA828A3EB153B87D4E87F2A3E5FFF00866FFDA67FE8B5
        7C0BFF00C33BAAFF00F34D47FC337FED33FF0045ABE05FFE19DD57FF009A6AFA
        828A3EB153B87D4E87F2A3E5FF00F866FF00DA67FE8B57C0BFFC33BAAFFF0034
        D47FC337FED33FF45ABE05FF00E19DD57FF9A6AFA828A3EB153B87D4E87F2A3E
        5FFF00866FFDA67FE8B57C0BFF00C33BAAFF00F34D47FC337FED33FF0045ABE0
        5FFE19DD57FF009A6AFA828A3EB153B87D4E87F2A3E5FF00F866FF00DA67FE8B
        57C0BFFC33BAAFFF0034D47FC337FED33FF45ABE05FF00E19DD57FF9A6AFA828
        A3EB153B87D4E87F2A3E5FFF00866FFDA67FE8B57C0BFF00C33BAAFF00F34D47
        FC337FED33FF0045ABE05FFE19DD57FF009A6AFA828A3EB153B87D4E87F2A3E5
        FF00F866FF00DA67FE8B57C0BFFC33BAAFFF0034D47FC337FED33FF45ABE05FF
        00E19DD57FF9A6AFA828A3EB153B87D4E87F2A3E5FFF00866FFDA67FE8B57C0B
        FF00C33BAAFF00F34D47FC337FED33FF0045ABE05FFE19DD57FF009A6AFA828A
        3EB153B87D4E87F2A3E5FF00F866FF00DA67FE8B57C0BFFC33BAAFFF0034D47F
        C337FED33FF45ABE05FF00E19DD57FF9A6AFA828A3EB153B87D4E87F2A3E5FFF
        00866FFDA67FE8B57C0BFF00C33BAAFF00F34D47FC337FED33FF0045ABE05FFE
        19DD57FF009A6AFA828A3EB153B87D4E87F2A3E5FF00F866FF00DA67FE8B57C0
        BFFC33BAAFFF0034D5C47C7DB5FDA1BF65EF09687E2BD6FE247C19F1568D378C
        7C33E1EBFD32CBE19EA5A55D4F6FAAEBB61A5C8D15CBEBD70B1491A5E1914B43
        20263008C1C8FB5EBE75FF0082A57FC9AC693FF653BE1E7FEA6DA1D5471152EB
        522A60E8A8B6A28ECA8A28AF60F970A28A2800AF877FE0B0322A69DE130CC066
        FEE3AF7FDC455F715788FED47AC5CE8F3DABDBBA233DC904B449264794BFDE07
        1F8578D88CD31397710E478DC2528D5A90C569194DD38BBE1B12B59A8546AC9D
        F484AF6B697BAF2389F2EA78FE1FCC307566E11953576973356AB4DECE51BEDD
        D1F93A9A85CE837A6E21BA5B88269009E2B99BCB448CB424ED6E0020C298DDF2
        E4B67B110DE7DBFC4DE26B4D5750D49D22B2B74B5B7B082466B74891582062DC
        B637161C0C1638E38AFD0CFF0084DF533C19E03FF6E907FF001148FE3AD4E38D
        DDAE200B1A9766369000AA06492767000E49ED5F7D85E14A3433E59D53C930E9
        4671AB0A2B1D5FD942BC6527ED943EA56E67CDA2B72C6CDA5EF33F26AD8CCC6A
        654F2D96632BB8CA9CAA7D5E9FB49526A2BD9B97B6BDB4D5FC4F44DE878F7ECA
        1F1F3C21F0F7F62FF8E3E17D675B82C75EF15DAAC7A55AB472335E3792CB8055
        4A8E48FBC4575FF1E7E35FC30FDB12FF00E19EBD71F1125F87EBE0BD392C355D
        3AE2CAE3EDE9B4AB192C9E1578CB12B852CCA400A48C82B5B917ED07A30D774D
        D3A5F1768CF73AADC456D0AD95A457C15A470A0B3448554024679271DABD2FE2
        4684DF0BFC157FAF6A3E2CB46B3D3E233385D09D1DC0CF037C2A0138C0048C9C
        0EA457DE6373DE228662B1D2CB69D3AD564E516B17537942349A8A965CD34D25
        BDDA7B3B6871E599542AE56F054F12AAE1E8C14669D25A28CE5553938E2A2D34
        DBDAC9ADD5F53C9BF650FDABFC01F0EBF636F15F836E75FF000C2EBBA8F88E6B
        DB1B6F17E8F717D67716C4C1B64B84815C6F2A8C7009C381C91CD711FB397C4D
        F873E07FDB5EFF00E2078C3C41E154D234185B51B083C39A5DCC3677B78D1054
        8EDA07405027CC4EFDA37E3048248F47D17E3B58F89D603A5F89F43BE92E9B64
        5008A08AE9DBD3C9740E4FD01FAD6B49E34D56276479A257424106CE1041F4FB
        94EAE6FC434678C53CB69C1E2B9B9EF8CA89AE6B2972DF2EBAD15B5BEEFADAD8
        D2A342B53C138E254E3857170B51BA6E3771BDB1367672BF9D974B9E4FFB6DFC
        73F863FB447C0CF0D6A5E1FF00116B72F8C3C3FA8DFACF6BAFDA88AFEEED2EEE
        24B8C6E84BC3B62770106F07603DF83F707ECA6777ECE9E0C39CE747B4FF00D1
        095F3B1F1BEA8411E7C3CFFD3A41FF00C457D47F076E1EEFE1DE992CA7749242
        8CC400A09DA3B0E07E15F8BF88F9A6675735C8B058BC342953A73C54A2E35E55
        9DE74EEE36786A0A314EED6B27ADAD63F46E04C15378AC7660EA734E74E945DA
        9F22F71D94BF8B52EDA493DB6BEE63FED0FF00B3968DFB47787347B6D46F756D
        0F58F0C6AD06BDE1FD7B49785352D06FE20E8B3C2668E585B74524B13C734524
        5224AEAC8DC6383D73F600D23C65F0C868BE23F883F14BC49E23B7F1143E2CD3
        BC5F7FAB40758D1752846C866B38A3B74B0B7448CB46608ED04322C927991C86
        472DD27ED21FB4FF00FC33E78FBE12E87FD87FDAFF00F0B47C54FE19F3FED9F6
        7FECCDBA75E5EF9FB7CB6F37FE3D366CCA7FACDDBBE5DA7C2BF655FF0082BF59
        7ED45E01F817AB41E069F46BFF008BDE27BFF0C6A5A7CBAB79ADE1996DF4DB8D
        4A2903F90A2E566B64B671811E05D0E49420C53F6339CE30DD4A29EFA49B872B
        5D9DF93DE5B5A3AAB2B7E95C98954E33FB3CADADBE14A774FCACA7EEBD1DDE9E
        F6BDEEB5FF0004C9F07F8D3C13E30B0F1478ABC79E2AF1178F6FF46BED73C55A
        85CD926AD74BA4DDC775636C8905AC76905BC6F190521B74DDE6CACC4C8E64A4
        9FFE097FE055F16C7AED96BDE37D2F55B6F17EAFE34B4B8B5BDB60D6377A8D84
        F64F0C5BE06C410A5CCB244A72CB236599D7E4AA7F03FF006F1F177ED17F1BBC
        6BA0F84FE1B6897FE16F066BFAD784EF7567F1A451EA5A4EA9A7A911FF0068E9
        C6DF7DB5ADD4CAE914B04B752850B23C0A1885E0EFBFE0A6FF00153C2BE17FDA
        0B5BD7FE0EFC3FB6D3FF00675B6B93AEFF0067FC48BCBB9F51B88F498B538A3B
        657D162531BA4F146D248C850EF211C280D854961654B9A6BDD70E7D9A5CB68F
        BDB7651F3DBBEBBC638D854F6717EF73726E9BE67CD1E5DFFC4ADB69E48EC7E1
        9FFC11BBE067C143F09EF7C17E1B8BC25E26F8493C735AF89B49B2B1B6D6FC44
        059CB69347A9DCADBEEB94B8499DA5E1097C1528062AE781BFE093FF000CBE1F
        6ABF01B50B1BDF1636A3FB3CD9DEE9FE1FB992F212FA941750490B25F05842CB
        B04B2346631195676E48665399E24FDB83E3058FED33E09F875A67C26F86D7A3
        E216877DE24D1F51BAF8917B6C52CACDACC4A2E225D124F2E63F6D8F6A23C8A7
        6BE645E3334FFF00052F683E0CDFF8B4F82416B1F8C03E147D93FB6387FF0089
        D2697F6FDFE471F7BCDF276F6DBE67F1574CE14A53E492F7A4DFDEA4A93F4F7A
        7C9D16AFA733308CF12A1CC9E8925BA7A38CAA2F5BC62E5F25D6C68FECE3FF00
        04C1F0E7ECF2BF0FECE6F881F127C75E1DF852933784341F114BA58D3F44B892
        2920FB50167636D2DC4CB0CD3C686E6495504EEC143ED7597C1BFF0004C3F07F
        83E7F0F697FF00096FC40D4FE1D783B5B5F10F87BC03797966740D1AF2399A78
        0A325B2DF4B1412B978A09EEA585084C26238C267F83BF6D0F8B1AAFED89AF7C
        2AD6FE18FC33D1ED3C27A358789B59D722F88D7B70B06977771750AC9142DA34
        6249D059CACD13C91A72A3CDE49195E15FF8298EBFA87803C23F1475AF8610E8
        BF037C79AC5A697A4F888788CCDAD5B417B722DAC351BDD35AD52282CE791A2F
        992F259116E22668F971194EA529CA3523BB7A3FEF73F2A6EFF6B9E368B96B78
        BE5F85D8AD1C4A528CF64B5575B38B9595BA72C9B6A3A5A5AFC5AFAA7ED17FB1
        CC1F1FFE2C781FC7367E3EF1D7C3FF00157802D752B2D3AFBC38BA5CBE6437E2
        DC4E92C77F65751B7FC7B47B4AAA9196E4E46386B6FF008245FC18D43C45E10B
        EF1568B37C45B7F07699A9DAC3A778BE2B5D66C751D4352BD4BDBFD6AE639A13
        E66A13CC9CBA9589158AC71200A17A5FDA6BF6AAF187C2AFDA1FE19FC33F03F8
        27C33E2BD77E2358EB1A80B8D7BC533E8567A7C7A70B42E0B436178F233FDA86
        00450367539E3CBBC3DFF0544F14FC57D77E17F86BC0DF0BF44B9F1AF8DDBC4D
        65AE699E25F17C9A4DBF86350D02E20B6BDB6F3EDEC2ECDCAB4B313148238F74
        6118AA17289109D16E318EAEF26B47D3994DAF2BDEEF6BB5D5C4B70C57B36EF6
        8D9755DAF1BEBBD93B5F5B5D6D73D1746FF826E7827C2DFB16F8DBE0268DAD78
        BF44F0178D25D536C763736D15C6816BA85C3CF7163627C8F2E3B606495155D2
        46549586E27691CE78ABFE08E3F032F753BDB9F09F86A1F85A357F066B1E04D5
        A1F055958E9516B5A76A5146921BA02DD8CB344624922909C87CEEF301DB5EA3
        F1F7F6987FD98BF67387C65E2DD1127F10CF2E9FA543A06897C6ED6FB56BDB88
        AD60B382E258E1DC86799479D2471E103394046DAE27C7FF00B65F8E7F675F84
        DE2EF117C54F85B65A5DDE913D85978760F0A78AD35DB6F175EDF4E2DADECA07
        9EDACE78A7FB43C6AFE6DB88C248AEB23E24542AC68BE65257B2E47A377F7795
        46EB77CB2B28ABB7CDA2BC95D51A98ABC65095AEDC96A96AE49B959ECB9A29DD
        E8B95EA945D96FBFE09DF178AFE055CFC39F16FC5BF8A9E33F0C349A4496716A
        31E856D2E97FD9B790DD40227B3D3202C19ADE247F3BCC2501DA51896AB9F113
        FE09BBF0F3E2778EBE2B6B5A94DE238ADFE3369BA6DA78934AB3BD4B6B292F34
        E39B2D561D9189A1BF8808C09564DA7CA8C942C371E3BE247FC145FC53FB3958
        F8C2C3E297C35D1F41F15691E02D5FC7DE1FB7D0FC58FAB695E23834C8C35D59
        7DAE5B2B6960BA42F092BF67913CB943ABB156455F863FF0529D4FE3E6A7F0DF
        48F04780F4DB9D7BE22F80751F17A5BEB7E22974DB7D2AFAC2FAD2CAEF4C9A48
        ECE773E5CD7132F9CB19C9B6E23C3EE5A94A954934F56EEDEEDB6D4EFAEEDDA9
        4BCD382EBCA2853C4D3A6A51F762AD6D9256706BD3E38F959BE9CC747A87FC13
        6BC3FE35D27C67FF0009C78F3E237C43D7FC65E0FBCF021D7F5A9F4E86F746D2
        6ED489E1B48ECECEDED51DDB6BB4AF03C8C638C333222A0C1F8C3FF0484F86BF
        187C53AA6B72EB9E3BD0354D6FE1B37C2DBF9F48BFB788DDE96CF117998496EE
        05D3470A42645014C7C6CC8565E1ECBFE0AA1F12E1FD963C67F15353F83BE06B
        6D37C2FE296F05DB595AFC45BAB89EFB524D7A2D1A42E5B47458AD848EF28907
        98E55141894B1DBD7F8D7FE0A5DAB7C04F10FC52F0BFC4CF00E9769E39F87767
        A15CD9697E0FF133EBD6FE219B5AB892D6C2CE39EE2CEC9A1B97B88C06478B0B
        1BAC819972066E7869C53B26A4B456F8AF193B25D5CA3564EC9372E77A36CDA9
        C31B06F96EB91D9EAB46A505ABE894A9C15DE8B952D123A3D2FF00E093BF02BC
        25F126DFC45E16F0368FE088A5F0B6A9E0CD6B48F0DD85B697A778AB4BD41224
        9A1BF58A212CACBE529491644752CC4B3646373F667FD8474AFD9C7C6B67E22B
        8F1CFC41F887ACE8DE188BC1BA2DCF8AAE2C647D134A491246B78BEC96B6FE63
        4AF0DB9926B8F3666FB3C7FBC1F36EE37C61FF000505F14FC086F17693F14BE1
        C68FE1DF15695E00D67E20787E1D0FC54FABE95E22834B83CCBAB1FB54B656D2
        C17485A1257ECF227973075772AC83A4F8F5FB70DDFC1FFD82F48F8D163E12B7
        D66FB5BB5D026B7D0A7D5DACE259355B9B4B7547BA582421633760961092C13E
        E8CF1B4674D3738EEACB4D7594AA457CDCBDA2D36BC93B296BCD28621C234A5B
        4AF6BF5E58D393F959D36FBDA3BB8E8F9FFE09C9E089FE015F7C396D57C57FD8
        9A878E8FC419271736FF006B5BF3AD0D67CA0DE4ECF23ED2A136942FE5F1BF77
        CF5369DFB03E97E1BF88379A8E83F10BE27F85FC29A9F895FC5B7DE0BD1752B5
        B1D1AEF51924134EE668ED86A11C334E3CD92DE2BC481D99C18F648E8DE91F09
        75FF001DEA7E16BCB8F881E1BF09786B568666F22D7C3DE24B8D72DE5842290E
        D34F6366C8E5B70D8236000077924A8F99BF673FF82A6788BE237863E0E78B3C
        7FF0DFC3FE08F017C7233DA787F57D37C6326B1369D7A96F2DD450EA104B616A
        B024D0DB5CED921967C491AAB2AABEF10BD8526A3A479547C924D25157DB5F67
        14937BC63A5D22AD89AD194BE24F9AFB6B6E6949A5BFDA93BAE927AD9B3557FE
        08AFF03D3C1F1C4348B8FF0084EE3F15FF00C2683E23FD974FFF0084C8EA5FDA
        9FDA5E67DBBECDF73CCFDD6CD9B7C91B71BBE7AFAD2BE49F09FF00C14BFC41A9
        7C3FF097C51D6BE1845A37C0DF1D6AF69A6695E221E23336B56B05EDC8B6B0D4
        6FB4D36A915BD9CF23C3F325E4B222DC42CD1F2E23EFBF69DFDAB3C63F0A3F68
        4F869F0D7C0DE08F0D78BB5EF88B61AC6A2B3EBBE299F42B4B08F4E168581686
        C2F1E467FB50C0D8A06CEA73C69070A708C22AC9BB2566ACD4536AD6BAB452D1
        A56B5B722AC2B55A9294DDDEADBBADB99DDDEF67EF37B3EBA68CF78A2BE6EFDA
        83F6DDF15FECF7E21F855E0BB3F03784B5AF89FF00146D3519ED34ABEF1A3693
        A3B4F616F14B3595B5FBD93BDC5CC8F3C490235B44AE37BBB4217073FE257EDB
        BF142C7F685D3BE1AF833E0F681AB78964F86D6FF10F52B5F11F8E4E8D2D8192
        EE6B56D354DB58DEC32CE92438F33CD58896386DA03199E269C536DE89B5B3DE
        2A5295BBD9464DDB6B2BEEAEA383ACD2696E93DD6CE5182EBA5E52495F7D7B3B
        7D43457C81F107FE0AF9E1AF07FECF3F04FE2459F862FB51D1FE2BC09AC6A70C
        97AB04FE13D162F25751D464508FE78B492E605645DA1C333070179F4AF8BBFB
        5778A6DBE3CEA7F0CBE16F82345F1CF8BBC39E1F83C4BAE7F6DF8924F0FE9F63
        05CCD3436B6E93476776D25D4AD6F330431A46A89969412AA6EA558C24E2F74D
        C74D754AEED6BDEC93D569A357BA694C70D55C54ED64D5EEECB4BA5ADED6D5A5
        67AEABA347BAD15F3B7893F6C9F1C6B9F1674CF879E03F85D61A9F8F20F0BDB7
        8ABC5165E27F152E9165E158AE5DE282CE4BAB3B6BF135DC924571848D0C7B20
        67F3705037A17ECA5FB4969BFB567C1EB6F155969D7FA05D457D77A3EAFA46A2
        D18BAD1751B3B87B6BAB595918A1292C6D86070CA55B80D4FDA47DED7E1BDFE4
        DC5B4FAA4D59B5749DAEF55789519C526D6F6FC57324FB36B549D9B576B667A3
        D73DE02F8ABA1FC4DBCF10C1A2DD5C5DB785F559744D45DECA78228EF220A658
        E37911566085B633445D55D5D090E8EABF337C2BFF0082B069DF14FF00667F8E
        3F10A0F074F693FC22D32EFC49A7E9726A79FF00849F44FB2CD73A76A2B30871
        02DD8B6B85D9B6431185B25EB98D13E3578C7F62CFD96BE237C6AD47E15F83C5
        FF00C4AF10E91E238AC6CFE235DDF9D4AEF56B8B2D3D16791F47816CE2B785AD
        554451CE5C44DB897CC8F9C7111752DD3962F677E69C9282F9A53BADD3493B6C
        FA25829C6166BDE72696AAD68C6F27F2E6834F669DD5F75F70D15F1C7C69FF00
        829CF8C7F6735F8ABA0F8BBE18F855FE20FC348FC3170BA7E89E379EFB47D421
        D7750FB0C1E65F49A6432DBCB1B86768CDABE536152777CBE87F137F6B5F1F7C
        0EF037876DFC55F0F3C293FC4BF1EF8963F0D784FC37E1EF18CFA8596A0ED0B4
        EF71737B3E9D6CF6D0C31437124A52DA62A912ED0ECE10386229CE3CF17757B7
        CEE9597777695975F4644F075A12E49AB3B37BAD92E66DF656D6EF4B1F42515E
        37FB3E7ED45AB7C43F8B9E2CF86DE39F0A5A782FE21F846CACF5892D2C3586D5
        F4BD574EBB69521BBB3BA782DA5915658268A4592DE32922606F56573EC95BF4
        52E8F5FEBF26B74EE9EA8E69271938BDD7FC3FE2ACD3EA9A6B4679BFECDFFF00
        2930F8D5FF0064C7C09FFA75F1857D415F2FFECDFF00F2930F8D5FF64C7C09FF
        00A75F1857D415E2623F88CFAAC1FF00023E8145145627485145140051451400
        5145140051451400514514005145140051451400514514005145140051451400
        5145140051451400514514005145140051451400514514005145140051451400
        57CEBFF054AFF9358D27FECA77C3CFFD4DB43AFA2ABE75FF0082A57FC9AC693F
        F653BE1E7FEA6DA1D543E24454F81FA1D9514515EF1F1C1451450015E11FB5AF
        DFB3FF00AFA3FF00A256BDDEBC23F6B5FBF67FF5F47FF44AD7CEE69FF23CC93F
        EC2BFF0075F1073E69FF00228C6FFD7B5FFA7299E33040F753A45182F24876A8
        E9935E6FFB4649AA78CF461E1AF0D99668A6914DC950A916AA03A6D01DB070AE
        4BEC181B223231236E2FFED09E2ABDF0AFC2FB9FB03C914FAADC45A609633892
        3126E76DA7B6E489D4FB39AF1BF87FE3AB9F0F78FEDB4C8A3B9D67498229A193
        49937CD1DDED85C98E345CEC6272A193A67272320FF5DF0CE02A7B78E2A31527
        153924F65C9CBABD776E5EE6DAC64EEAC9AFE68E21C5D2FAACE8549B8A94A107
        6BDDF3F3DF9747A4547DFEB694559DDA789A4DBC9A85BA2691A042534A92392F
        2F659FCC796453F744995455620ED441B9BD4F5AF42F89FE37BDF19FC33D22CD
        74382C05CAB4522CEED1D87860B4FBD60D38B4A4C504C177CBF68DE4BE36B28C
        0AB5FDBBE15F0D6BA9E251A447AED8E8903345A3EA31A477B0EA0ED91FDA1852
        6E63191B1908401402A87E52B6FF00B6FDAEA17D676BAEFC30F875A869701F2A
        3B55D2915EDA3624B08B208072CC40C63249EE6BBB89785E79EE6F81CD61414D
        E0E5CEAEDA926DC656579A4F5845FBD1E5B6D7B2674707F1C4786721CCB22788
        7059847925649C5C54670BE94DB5A5495DC64A57F8AC9B479ADED8D86B7A849A
        6EAD609E14D790E16508D159C8C7A096339F2B3DA44F979C95C7CC3DCBE00FC5
        A93C6D04DE19D69441E29D091A307764EA31C5F2B8272733C607CC7277A82DD4
        127CAFC2DF0D7C41E38D63C4BE1DB6D3E7D760D0EC5EE15A5991A7D2ED93E64B
        946E730FCCBBD53218480819DB8D2F84F6969E0BF891A0DD788A38EFB5385155
        ECECA76B59348B75077DD5CCB1E0ACD1C79C4672780241FC27EBB3DC2E1B1B85
        9D193E69C5734527769B574D5DDD464B75276B5ACF63F3DC8EB627098B85651E
        584DF2C9C959349D9A7656728BD54A2AEF5525B9F4157D6BF04493F0C749C924
        FD9D3FF4015F2445ACDAF88AD21D46C770B3D4614BA8410015591038040E8406
        C63B57D6BF0398B7C30D24FA4083FF001D15FC63E294251CEF2652566A75D7FE
        5167F5070049358A71774E31FF00D291E7FF00B5AFECDBAEFC79F89BF03F5AD2
        2EF49B6B5F869E347F11EA69792C8924F6EDA55FD984842A30693CCBA8CE18A0
        DA18EEC800FCD5FB3FFF00C125FC7BF067C5BFB266ACDE24F0A14F83765716FE
        37B2825B868B54992C6FADACAE2C98C20B3AFDBE6493CD58F2823E498C2D7DC7
        F153E28685F04FE1B6BBE2FF00146A0BA5787BC37652EA3A8DDB46F2F91046A5
        9D8220677381C2A2B331C000920572F6FF00B5CFC3BBB8FE17491F8922787E34
        217F06CC2D2E3CAD631666F76EFD9B60736E19D56731B3156500B82A38214A9C
        2A3945EAE5193FF159C63A79D9D9756AEB55A7E8FF0059AEE8F225EEF24A3B7D
        9D652D7CB9AEDF45BE87CFB69FB0E7C46F117FC141BC33F17754D2BE13F84EEB
        C3DA86A0BAAF8B3C1FA8EA367ACF8EF4692DDA2B4D2F52D39A1F21846C2D1DA6
        92EEE086B28FCB48836D4B7F133F600F1978CFE16FED97A1DAEA7E194BBFDA21
        A53E1C796E2711D96ED02D74D1F6C221253F7D03B7EEC4BF2153D72A3DD3C41F
        B5FF00C3AF0A9F8A1FDA1E2216E3E0D5BC173E30736372C9A52CD682EE30AC23
        22E1CC055B64064705D5480CCAA66BDFDAC3E1F587803E1DF8A64F1146741F8A
        F7FA7E97E15BB8ED2791755B9BE81EE2D63DAA85A2DF146ED994205DB862AD81
        59FD5E8CE97B04EE9C7937DD5471B5BCE6E2AD6F89DDA4DB6DDBC4E26351576A
        CE2D4B6DBD9A6FEE8A936EFB46CB48A4970B71FB2B78866FDAF7E0CFC4017BA3
        7F63FC3BF03EB1E19D4A132CBF6A9EE6F1B4C313C2BE5ED68C0B2977166561B9
        30A7276F925C7FC13DBE22CBE2ED43C17E67811BE125FF00C684F8B835AFED4B
        C5D7E2885E26A8DA57D83ECC60626F90C42EBED8B881B77905C6D3F57EB7F1B3
        C31E1DF8C5A07802F753F27C5BE28D3AF356D32C3ECD2B7DA6DAD1E04B893CC0
        A635D8D7308DACC19B7FCA0E1B191F097F6ABF87BF1CBC37E30D67C31E29B0D4
        34AF00EAD7BA2F882EE4592D61D2EE6CD03DC076995018D118379CB98997255C
        8048DDBA6EA2AEDEAB9A5BE9FC55524FD235547C935CAF46D3C613AD1A6E8A8E
        8D456DFF004EDC23F374DBB77BDD6A935C6699FB2C6A927EDCFF0011BE236A53
        E973F84FC6DE02D27C249691CD28BE12DB5D6A32CECE360558D92F230ACAE5B2
        1F217009F17F0E7EC0FF0016F52FD9EBC09FB3F789750F87EDF093C05AAE98E7
        C49677F7726BFE20D2B4BBB8EE6CAC5F4F36A90DA4AC60B68E5B94BC9722272B
        1032FEEFE88F81FF00B6E7C37F8FDE3A4F0FF87357D60EAD269E359B48755F0D
        6A5A42EAF61BD54DE58B5EDBC31DF5B82F1E65B76923C4B112D8910B7897FC13
        07FE116D0F4BF899ABE9377F0BA0D2BC2F711F86358BBF0D4DABC30D9DED84B7
        B73771CABA93154863FB72B09E1256E657BBBA77DD71E5C594234E0E3CBF0ABC
        B7D1F2D473BBEEA3393EB65771774EC6D29D59427297C578C6D6D7582868FA37
        08AE97764D59A4D769FB577C08F899E22FDAC7E10FC51F877A678175E3F0FB4B
        D7F4DBFD33C47E22BBD13CFF00ED11622378A682C2F33B3ECAFB8322FDE5C1EB
        8F9EBC57FF000494F165CF89FE1A789F54F06FC0FF008C1A8D8EA9E31F1378D3
        40F185ECF6BA3CFAA6BF756B700DA33E9D7C654B5109856496247708AF88CB98
        D3EB1F82FF00B7BFC2CF8FFE2CD3744F0DEBFA936A1AEDA497FA2FF6A787B52D
        1E0F11DB4614C93E9D35E5BC515FC6AAC8E5ED5A5508E8F9DACA4FB0D5470D0F
        76A2E9CD67E526DC97669CBD5A6B46AC43C6D68A749AB6D75B6A9349F74D293E
        C9A7AA67837ED13FB2C6ABFB43FEC8FA0F85EDADFC35E00F197846EB46F10787
        ADF4D91EF745D1352D2AE21B9B5B646F26DDDAD330880B2C3132C6E4AA65421E
        5BE377ECF3F19FF6C1F83DE24D1FC66DF0C3E1FEA5A7EA1A56BBE098B43BDBEF
        108B2D534EBB8EF23B8BDBA9A1B312C324B1246604B505537B79AECCAA9E87F1
        93F6F1F85FF017C6D7DE1DF11EBBAA0D5347B18F53D5D74BF0EEA5AC41E1FB49
        37ECB9D426B3B7962B08488E46125D3C4BB2377CED5623A3B5FDA7BC09A878E6
        F7C376DE22B6BCD5B4FF000CC1E32952DA296785B4899E548AED26453148AED0
        C9808ECC42838C15254DD27CD3E6B26DCB7DA515ACBD62A17D6F6E4BDAF16C54
        DD78F2C542F656DB78C9AB2F46E6979F3DB6959FCD3FB40FEC43F16FF6D08BC5
        9AE78F17E1D78535CB7F869E21F03F84746D175BBDD5AC96F75881239F50BBBD
        96CADA4540218635812DE4DA3CC7DEEC551753E067FC13CBC57F073F6F9F0DFC
        4E5D77429BC1B63F0DDFC3D7BA5234A2EA0D6E46D39279E0FDDEC6B6922D3A16
        3B9918485CEC3BC91E82FF00F0536F83F3DE787ADB4DD4FC67E24B9F14F86ACF
        C61A743E1DF00F8835C91F49BB675B7BA916CECA530ABB46E02CBB1C15E54715
        BDF1F3F6F3F855FB30F88AD74AF1BF896E749BB9ECE2D4A7F2B45BFBE8748B39
        6E16DA3BABF96DE1923B0B7799BCB59AEDA28CB2B80C763EDBA74E9D2AAAA474
        95DC7D5FEF79A3EB79CDB5D1A5A2E54954EB62674BD84936AC9DADD1FB3B3FBA
        10B3EBCCF56E6DBF04F14FFC1343C5BE2CFF00827C78F3E0FDE5DF836F352F17
        FC4BBAF170FB4CB349A749A74DE295D5CC136602C6436A1A364D8C8643B7715F
        9EB2EEBFE0917A8F80D3E35784BE1ACFE07F05FC38F1C788344F895E0EB78ACD
        965F0AF8B34F9A396489ADE38D51F4C99ADE16118947921A448E251835EF9E3B
        FF00828AFC31F86DF19D7E1EEAA3E240F17CC6736D6369F0D3C4B7CB7F1C0F1A
        4D35BCB0583C571046D2C41A689DE31E6265BE619F0CF887F19BE1C7833FE0A3
        D2F88B50BCF03476BA0788EDECF5BF11C7A4788B1A1DD1D0E4B0860BED52146D
        145C996F5228E1BA92216B14D33A879F503E5F353A54A2A9C693DEC934F5F754
        231B777170835DA493EAD1D2B11886AABA9A5B9A6D5B4BC9B934EFB2929493FE
        EB68E83E31FEC65F163F6BCBEF15788BE2027C3CF0AEB56BF0CBC4BE05F08E8D
        A1EB579AB59ADF6B36CB14DA85DDECB676B22A011431AC096F26D5F31F7BB154
        5C5F8BBFB20FC70FDA07FE09D0FF00043C43E13F8356373A3D87872D2C675F1A
        6A1A958EB834DBDB29A78EE91F4788DBC72C36AC06D13F326D2B8CB57D0179FB
        747C3CB6F8E9AB7C37824F1AEABE2CD06F6D34FD523D27C0BAEEA763A64F7514
        7342B717B6F66F6B0868A58DCB3CAAA8A4962A01C3BC65FB777C2BF007C72B4F
        873AB78967B7F145DEA167A3E1347BE9B4EB6BFBC4692D2CA7BF485ACEDEEA74
        5DD1C134C92B8642AA43A6EDA34E934B91E9371B6DAB5294E36EEF9AA376D9DD
        2B5AC8E775B109AE68BBD3E67B3F7538C62EFD972C23AEFA377BB6C77EC93F09
        AF3E117C2FD474193E15FC27F8436CF7B25C5BE8FE00D45AEF4D9CBC68AD7127
        FC4BAC024C4A852044F95453BFF847CD1FB387FC13A7E29B7C16F80FF0ABE2B5
        A7C34B4F027C0FBB3ACBDDF87FC457FAA5FF0089EF62B4BBB5B68CC3358DAA59
        C4BF6E96667124EE5A18D142EE322FDE5456B2A51949B92BDD4535D3DDBF2FDD
        77E5E5639E9E2AA423CB076DF5EBEF2B3FBD69DFAA77D4F897C35FB05FC5DBFF
        00D9E3C0DFB3EF89350F87E7E11F81354D2D9FC49677F7526BFE21D274BBC8EE
        ACAC1F4F36A90DA4AC6DED925B94BC9722272B1832FEEFA8FF008282FEC43AE7
        ED37FB427C23F18DA7807E107C51D0BC0361AE5A6A3E1AF8817D25AD9DCC97C2
        C8433C78D3AF90B47F66933BA352370C1EB8FACA8A73839F2F3B6DA6E577AB6D
        C795B77EEBB595F5DDB6DC71328C9B8A4AEAD65A2B5EFD3CFF000B2D924BE52F
        DB1FF651F197ED27FB3DF863C0B27C28FD9F7C4BE175D21ED353F08EB7AB6A16
        56DE1EBB58045693E93A9DBD933A2C08658C05B38242AC364910051B90F0D7FC
        128357F17FC67F05EB3F153C6BE20F19699A07C18B0F879ABDF69FE32D6F44D5
        B5FD522BE9E7B89EE1ECE685AE2DA48E6C62699CB364B267E73F6E5150E841CD
        CE4AF777D755F0CE3D77D272DEEF6D6D149358CAAA92A517656B69A3F8A12F96
        B08ED65BF56D9F17FC66FF008257EB1F1B7E35F89CDBF8E6E3E197C2EB7F85D1
        7C2EF0BE89E11B5D3E490E9F70647D4A3BA8EF6C66486362B671C66D5D64296E
        09923200AF37D6B4FF008B1FF04D1BAF867E2F94FC37F1F7C4DF8AFA1F86BE13
        788F46BBF15C9A54579AB59CF25BD96B96AEF6CD737A9B2EC8BAB68ADCCC80AC
        884C6926DFD18A2A7EAF6D6326BDE4DF56F59B92FF00B7BDA54D7ECB9732B348
        D163A4FDDA914E36B5B65A2825F73A707E7CB6774DA3E5EBFF00D9EBE337C33F
        DA113E2C7850FC32F18F8A3C5BE10B1F0DF8D749D4AFAFBC35A74D75652CD2DB
        DF58CA906A32C6A3ED5711B5BC8A77298DBCD0CA431A1FEC69E3FF0084FF00F0
        4F0F889E00F09F897C3F77F17BE20A6B9A9DCEBB7693586971EAFABCF2CB7134
        6A8B349145089D84402B3130C64E0B311F50D14EA61A9CE13A725A49497FDBB2
        7CD28A7BD9CB5EFA249A492514F1B56138544F58B8BF5705CB16FCD474E9BBBD
        DB6CFCFCF16FFC121FE21783AC758D23C19F1466F16E81E23F81FA8FC21B9B7F
        180B4B03A608E1C68D25BAE9BA7C61E289E5BA491A7DF2AA4D90D291B6AD6A1F
        F04CBF1278B7F61CF10FC20B7F83FF00B3A7C3097599FC3525EDD78635496EAD
        BC51FD9DA8DB5C5C35FC6346B5F99A18A509BBCEDCD3B2B1404B1FBE68AAF631
        72727ADDA6FCDA9CAA2BFF00DBD3937DF4BDEC1F5CA8A3157F86F67EB1843D3E
        18452ED6D2C7E7A7C5AFF8240F88BC3DF0D7F682F86DF0A74BF85563F0A3E2EE
        B9E1EF1A697E1ED48C9611697AB5A5F5B49A959B886CE551A7DC416CA6350184
        2ECD1AC22325ABD1EF7F61EF15B7C3BF055FF83FE1B7C0FF00831E31F855E33F
        F84B3C3FA0F85F549A7F0E6B625B37B3BC8AEE48F4BB46B7927B799D04A96D3B
        218A26F9C0295F6251530C3C611E58B7BA77EA9C79797D6DCB1493BA696A9DDD
        DD4C7549BBCB5F897AA926A5FF00815DB6D59DDBB35A5BC1FF00678FD9FBC691
        7ED21E32F8C5F12DBC3363E29F11E8961E16D3343F0F5F4FA858E87A6DA4B713
        9DD793416CF7334D717324849B78C46AA883760BB7BC5145745FDD51E8B45F9F
        E2DB7EACE4949CA4E4F77FA2497DC925F23CDFF66FFF0094987C6AFF00B263E0
        4FFD3AF8C2BEA0AF97FF0066FF00F94987C6AFFB263E04FF00D3AF8C2BEA0AF1
        311FC467D560FF00811F40A28A2B13A428A28A0028A28A0028A28A0028A28A00
        28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
        28A28A0028A28A0028A28A0028A28A0028A28A0028A28A002BE75FF82A57FC9A
        C693FF00653BE1E7FEA6DA1D7D155F3AFF00C152BFE4D6349FFB29DF0F3FF536
        D0EAA1F1222A7C0FD0ECA8A28AF78F8E0A28A2800AF1DF8FFE1693C6BE2FD0F4
        949440FA85FF009292329600984638EF5EC55E77FB42E9B2E9D61A66B9020946
        97711DCC819495C29659011919F91909008FAD7C7F14E2D60F199563A6F9634F
        174D36F64EAC2A50837D2DED2AC16BDCAAB4556C0E2A9357BD3BDBBA8CA3397F
        E4B167C81FB486B769F09B4DB49AFF004CB2F11C5A2F89A357B4B91882EF6DBD
        E20241078CF38208E95C17847F680F02D8D8EA5E1C93E1A7FC2316FAE5B1179A
        95ADCFDA6FADE20BE7294CC51C8233B54B08E45CA67861F29F68FDB1BE11CBF1
        1EC6FE3B14633EB3145A9E968CAB0ACD70A406888CE1090645009EAEBC90727E
        47835E9228B4DD49150EB3E1E8DACAFECEE4153736CA760241C6708ED13A8F98
        280D8C0623FB838330F84C7E56B9AEEA27ADA728D9EF16D27CBF15D26D3B4B4E
        87F24717E2B1B96E6AD42CA9BDAF08CAEAF69A4DA72BB859D9495E3AF53A7F87
        3E16F0EEA5AE6976BAAF8C2C747D1FC273DE6AD7977644BDCDCA2989E3FB1865
        1BA770022EF036152CC30083DADBFEDD7A57C34F005A7857E14F80F4DF0F4D6A
        9F668F5ED47CAD4357BDEDE6B8F2C012B724FCCE32780318ACFF00D8EFE14DD7
        89BE3A5BF88BC356D71AAF86FC3C86EF518A775856347461F619DA446495645D
        CADB15832124EC3D3E9DF09FC39BBD134BF18D958F84B43B7D4FC5534F269BA8
        58C96F0DE6831C916C10C0ED6E42A8E7E61B0E0F241CB57C1F885C49936038A7
        0B47178178A728B8CEA7B58D38D057734AAC34954E76EE95A6A2B5E549DE5F6F
        C0795F1462F86AAD2CBB13F56A2EA3928AA6EA7B46A2A0A54E6EEA0D24E3CD1E
        46DEF276B47E6DF847F153C27E12F0CDBE9CFE20F1747E22F1559DB691A94DE1
        AB389AE60B546126C59E5C36E66DAAC91FDE0982C3A570FF0012BE22784755F0
        05E59787E2D7ACB52BBBCB669FED8D0C9F6985227322B34689B409986325FCC2
        A1884C0CF2DA315F05C338413CDE299A4934F8AD16070FA6B13E5BB30201698F
        28AAB9DB9249DD8034F4CF005CF8DB5ED23C19A4C41AE6CFCC9B54B82A144121
        204C598FF0428A178243306DB9DCB9FD97FB0F2EA78C599D46DB8FBCA4DA4924
        AEDE89271B28C55EFA6ABBBFC89F11E69532F794D3B253B45C126DB77F755EEE
        D3BB94A56B5BAAE8BE9FFD99FE1F5D78BBE14D803730DB1D3B468AED8CB9C329
        4055463D88E6BEBAF812DBBE16E927919814F3D7EE8AF20F87DA60F097C1CD62
        EAC10AB6BCD1E87A4AE483B6350806318276F3D415DB9AF73F87DA70D1BC2F6D
        66A085B455841ECDB540CFE791F857F0B78A7C474B15C6B95E023ACE4F1356CB
        78C234E306DF64E7514537A371691FD69C0593BC2E59527DA108B7DDB93E5FFC
        9637F468F9DFFE0A876BE3EF881E17F863F0EFC01E129BC5371E32F1C69D77AE
        9BA9EE6C346B7D274C7FED39A2BDBE86DE7FB2ACF2DADBC0A4C6C5CC8CAAAC78
        1F3DF83BE107C51D0BF63DF1F787758F87977A6F8D7F670F8B0BF10FC09A7E8F
        1DDEA3A76AFA6B5D8D53EC3A7DDBDBC2F7A3ECD79A958958E20C088D0A02428F
        D26A2BA161ED294D3D5BE657D6D24E9B8B5E8E9A767DE5DD9F6AB1AF9234EDA2
        D1F9A7ED134FD6351A7E8BB23F387C5DF0C3E286BDFB35F82F4DD03E1F6A9A87
        8BFF0068FF008C2FF103C5F65ACC775A359691A35ADCFF00684163A9DCA5BCF2
        5896B4B0D2AD31246CC5CCA8159B35C649E1CF89BF0B7E11783BC23E30F863E2
        9B3B7F835FB4E59F88ADE2F09689AAF89AC62F0D5DDBEA3A824B672C366B35E4
        36B2DEC96CCC90031948D0AA92AB5FAA3452A58654A49C1E9170693D6DC8E972
        AE9A25492FFB7A4D5AE5D4CC6552328CE3F129A76D2EE6AAA93ECBF8AF4B5BDD
        8F647C03FB62FC6DF145D7ED0DE0DF8CFF000D3E1FFC54F118F0AFC2CF1C5A69
        F11F02EB16377FDAF24BA40B181EDAE6DA39D4C92A165DC837A452B2E42311E2
        96DFB0D7C7AF05F813C65F065FC0BA2E8F07C5EF80ABE184D5340D72EF5BB2BD
        F1268E8C164D4AEA6B1B68AC64D421BD9A3F98BA31840129DB95FD69A2B37828
        F2CA17D1A927B3F8BDABBABAE8EAB7D57BB1BABAB970CD270719462AE9C5F5D7
        97D9D93FFC16BFF0292D133E388BFE0A8B65E3DFD9C7E21CFF00087E1DFC54F1
        178BFE1B786EEEDAF2CAD7C2577045E1FF0012431471C7A1BACCAB2DC5DC73CA
        9BD2D12748E38D9DDD15A367F99743FD893E3BFC3EF08F8BFE0E4DE08D2342B6
        F8BDF013FE1151AC78775BBDD76CEE3C49A4C4E8B3EA573259DAA59497D0DF4C
        84132237900077DB81FA67F093E06F873E0845AE8D021D53CEF136A6DAC6A975
        A96AF79AB5DDE5C986284334F772CB2EC58A08A348C3048D23554551C575D5A5
        4C3BADCD3ACFDE9C6D2B6D7719A7CB7BBB2751DAF7BF2C5BD55C8A38E8E1B961
        868FBB195D5F7B295371E6B5BF935B5BE292564EC7C457BE23D53F6C5F893FB3
        3D8786BE1D7C42F04CBF0B35E5F1378AAE7C41E17BCD0EDFC39143A4DD599D32
        19AE228A3BD69A6B958F364F345E5C2CECDB4C7BFEB3BDD5FC709F172CACADFC
        3DE1597C0725A17BBD624F10DC47ABC37187C471D80B268648C9118321BC4203
        B1D87680FD5515D3777727BCA4E4FB36D25A5EED2492B2BF4BB6EEEFC3292B46
        296918A8AEE926E5E577793D6DB3DB447C15E3DF8ABE29FF00827E7C59FDA1F5
        3D47E0EFC48F8B517C51F1258F883446F0AF87EEF599355B06D32D2C27B3636F
        0CC90C96AF01611DDBC11CB14C4C4CCCAD1D78F7ECA1E16F117EC9DE01F00F88
        FC47E1AF1EF89F4FF157ECD967E15825F0B786AFFC46F61AD5A5DDDCCDA45C25
        9C72C96D2AA5EC512B4CB1C21A0990BA1888AFD56A2B81E022E1ECE526D5947D
        22A9CE9A5EAA351BBBBBE6B3775A1E9C3369465CCA0B5777BEB2E784EFE5EF41
        5D2D2CDA56D1AFCB0F857F05BC65FB26FC7EF85F69E27D5FE3B780A2F0FF00EC
        FDE15F0CDFEA3F0F7E1FBF8B6DAEF53B5BABC6B9D3E695349D4A35F2B70398FC
        B2C1810C4115EABFF05306F10F85BE3E597C4CF847A5FC6CD0FE3668BE1782DB
        44974BF065D6BDE0FF008856A6EDE65D0F548E10C6D19246907DA2E1ACDE15BB
        675964D988FEFAA2BAAA41CDA6DD9A94E49ADD73B9C9EF7EB36BAA6B4926A4EF
        CB1C5DA4E5CB7BC61169ECF91412BAD37E44F7BA7AC5A6935F31FC46F04F8975
        8FF82A07C09F12C9A16A2DA5E99F0FBC536BAADFDBDB492D869F753CFA334703
        CE06C567F2A5D81882C236201DA71F3E6ABE1FF147C3DFD893E3E7ECE575F0D3
        C79E26F891E3BD67C556FA0DE41E1BBB9F44F10C7ADDDDC4F6BAA4DAB089AC6D
        BC84BA0655B99D2656B32155898B77E8FD153EC168BA5A69AF29CFDA34BB6BA2
        DF4BE97B34431928EB6D53835FE28439137DD59B6D69ADB5B5D3FCEEFD9FBC37
        E20FD9FBFE0A17F15E3F11F89FE3FE8F65A9EB1E168ECD741F87173AC7877C66
        20D0AC2DA696E750FEC8BB6850CC8F1BB25E41B0062594A971A5F1EE2F16FC2D
        FF008288CDE2DF839A4FC65D27C65E29F11687A4F8CBC3FA8F84AE351F0178E7
        4BF2E3B793578F5188341A75C5ADAB7DF69E291DEC511AD9C485A4FBFE8AB507
        7A726F585BE6B4BAF476B35B59BB24ECD4BC4E93515A495BD3B3F93D53DEE96B
        BA6514515A1CA145145001451450014514500145145001451450014514500145
        1450079BFECDFF00F2930F8D5FF64C7C09FF00A75F1857D415F2FF00ECDFFF00
        2930F8D5FF0064C7C09FFA75F1857D415E2E23F88CFABC1FF023E81451456274
        8514514005145140051451400514514005145140051451400514514005145140
        0514514005145140051451400514514005145140051451400514514005145140
        0514514005145140057CEBFF00054AFF009358D27FECA77C3CFF00D4DB43AFA2
        ABE75FF82A57FC9AC693FF00653BE1E7FEA6DA1D543E24454F81FA1D9514515E
        F1F1C145145001599E2DD11359D1E60E3CC44465950F468D8618FD4707E9B8F6
        AD3A547689D5958AB29C820E083EB5F2FC6BC2D87E24C93139262A4E31AD1B29
        2DE124D4A135B6B09A8C979A47660318F0B888D74AF6E9DD3D1AF9A6D1F31F8F
        B47361E15B8D1AF0DAC175E1B6492C653FBB6BBB562C30A33F33EE2A588031B0
        6739C8F9E3E337C15BAF156B71F89FC26AD078BD24513DAC6836EA858EC32007
        8126D621D5BE5917777C86FBDFE2378106BF6A9736F2C9673DA4C2EA29E2504D
        9CA320480631B792083C73E846DF25F1AE91AB6B3E3AB29F5996D74092DED841
        06A96708115D4A7E4CC87F84156270DD31807918F5BC26F1BB1384C6FF00AAFC
        475214737A69AB49DA9E2E364955A4AD692A8D5EA528B73A72E6B2B24CFCFB8D
        BC3EA1898AC4D352961A4D59C57BD4ECFACAFEECA0B48C9FBB256BBD5A377E01
        FC009FF67CF84D078761D2B4EB8BAF9AE352B859990DCDC3C5E748BE5AE06D48
        D4A85ECACA3AD57F8696BAC3FC7EF1B6852A417FFD86B616D0C52CC563867923
        919CA32F3C950A7D4BE3BD73DA97C36F1D59889ECF53875482E066092DEEA126
        5F9957014FF165D38E7971D6B213C33E3A875348CDA5F457576AE0178E253208
        D0BB8C918CAAE491D457D362B87B1B8CAD3C556C45394E6DCA4DC9DDB7ABBAE5
        D3F0B7A687D660F8B32FC0D08E129616AC6108A8C528AB24AC95BDED74D3ADEF
        E77384FDBD3F65CF12E89E306F1BF84348B74BEF11DC7F66EAA9658792D270A3
        F7E8ED8F284AA46E7EB820E4066ACEFD9FBE047FC223A7C1A169509BAD735308
        DAA5E2AF9A382328A5727C88C9CE47DF2371EC07ADAE87AFAF81FF00B66F3C51
        A7DA457968D35A407CB796E81072854A8C7A71BBE6603D71D5F843C2B7FE2AF0
        7E9FA3A5A49A2680C229248507FA76A4E1470C579DB92DC9F9D81E401C57A5C5
        3E3050E0CE19851E24C4C1538BE4872F34AAD56BE1A508594AACA2ECA318E8B4
        E77151E63E05F04E0F39CFA5986574A6A7517338C92518B7F14934DA873EF293
        D7F954B9AC27C39F8569A7F8D5A4B759CDA69EB1C714724EAF1CF7663F9E5182
        54000ED3CF04374C607B7AC2B690456E8DBD2DD7606C6379C925BA0EAC49E7A6
        71DAA8786BC3F6FE1AD262B7820481A34F2F6A1051106308303B1193C9C9C75C
        0357EBF0CE0CCAB33CC334C471BF10A70C562A10853A4F7C361E37942937D6A4
        9B752B3D17B47CAB48A6FF00569D3C3E070B1CAF05F045B94A4BED4DEED7925E
        EC7C95C28A28AFD34E00A28A2800A28A2800A28A2800A28A2800A28A2800A28A
        2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A
        2800A28A2800A28A2803CDFF0066FF00F94987C6AFFB263E04FF00D3AF8C2BEA
        0AF957E287EC77E0CF8B5F1326F18DFDD7C40D1FC4775A65B68D7377E18F1FEB
        DE19FB65A5B4B7335BC73269D79024BE5C97972559D59879CE33838AC8FF0086
        0BF077FD0DBFB407FE1F2F1AFF00F2D6BCFAB849CA6E49AD4F6F0F99528538C1
        A7A7A7F99F60D15F1F7FC305F83BFE86DFDA03FF000F978D7FF96B47FC305F83
        BFE86DFDA03FF0F978D7FF0096B59FD4AA7746DFDAD47B3FC3FCCFB068AF8FBF
        E182FC1DFF00436FED01FF0087CBC6BFFCB5A3FE182FC1DFF436FED01FF87CBC
        6BFF00CB5A3EA553BA0FED6A3D9FE1FE67D83457C7DFF0C17E0EFF00A1B7F680
        FF00C3E5E35FFE5AD1FF000C17E0EFFA1B7F680FFC3E5E35FF00E5AD1F52A9DD
        07F6B51ECFF0FF0033EC1A2BE3EFF860BF077FD0DBFB407FE1F2F1AFFF002D68
        FF00860BF077FD0DBFB407FE1F2F1AFF00F2D68FA954EE83FB5A8F67F87F99F6
        0D15F1F7FC305F83BFE86DFDA03FF0F978D7FF0096B47FC305F83BFE86DFDA03
        FF000F978D7FF96B47D4AA7741FDAD47B3FC3FCCFB068AF8FBFE182FC1DFF436
        FED01FF87CBC6BFF00CB5A3FE182FC1DFF00436FED01FF0087CBC6BFFCB5A3EA
        553BA0FED6A3D9FE1FE67D83457C7DFF000C17E0EFFA1B7F680FFC3E5E35FF00
        E5AD1FF0C17E0EFF00A1B7F680FF00C3E5E35FFE5AD1F52A9DD07F6B51ECFF00
        0FF33EC1A2BE3EFF00860BF077FD0DBFB407FE1F2F1AFF00F2D68FF860BF077F
        D0DBFB407FE1F2F1AFFF002D68FA954EE83FB5A8F67F87F99F60D15F1F7FC305
        F83BFE86DFDA03FF000F978D7FF96B47FC305F83BFE86DFDA03FF0F978D7FF00
        96B47D4AA7741FDAD47B3FC3FCCFB068AF8FBFE182FC1DFF00436FED01FF0087
        CBC6BFFCB5A3FE182FC1DFF436FED01FF87CBC6BFF00CB5A3EA553BA0FED6A3D
        9FE1FE67D83457C7DFF0C17E0EFF00A1B7F680FF00C3E5E35FFE5AD1FF000C17
        E0EFFA1B7F680FFC3E5E35FF00E5AD1F52A9DD07F6B51ECFF0FF0033EC1A2BE3
        EFF860BF077FD0DBFB407FE1F2F1AFFF002D68FF00860BF077FD0DBFB407FE1F
        2F1AFF00F2D68FA954EE83FB5A8F67F87F99F60D15F1F7FC305F83BFE86DFDA0
        3FF0F978D7FF0096B47FC305F83BFE86DFDA03FF000F978D7FF96B47D4AA7741
        FDAD47B3FC3FCCFB068AF8FBFE182FC1DFF436FED01FF87CBC6BFF00CB5A3FE1
        82FC1DFF00436FED01FF0087CBC6BFFCB5A3EA553BA0FED6A3D9FE1FE67D8345
        7C7DFF000C17E0EFFA1B7F680FFC3E5E35FF00E5AD1FF0C17E0EFF00A1B7F680
        FF00C3E5E35FFE5AD1F52A9DD07F6B51ECFF000FF33EC1A2BE3EFF00860BF077
        FD0DBFB407FE1F2F1AFF00F2D68FF860BF077FD0DBFB407FE1F2F1AFFF002D68
        FA954EE83FB5A8F67F87F99F60D15F1F7FC305F83BFE86DFDA03FF000F978D7F
        F96B47FC305F83BFE86DFDA03FF0F978D7FF0096B47D4AA7741FDAD47B3FC3FC
        CFB068AF8FBFE182FC1DFF00436FED01FF0087CBC6BFFCB5A3FE182FC1DFF436
        FED01FF87CBC6BFF00CB5A3EA553BA0FED6A3D9FE1FE67D83457C7DFF0C17E0E
        FF00A1B7F680FF00C3E5E35FFE5AD1FF000C17E0EFFA1B7F680FFC3E5E35FF00
        E5AD1F52A9DD07F6B51ECFF0FF0033EC1AF9D7FE0A95FF0026B1A4FF00D94EF8
        79FF00A9B6875C47FC305F83BFE86DFDA03FF0F978D7FF0096B4C3FF0004FEF0
        05D6A3A5DC6A1AAFC60D79347D4ECB59B6B3D6FE2DF8AF56B0377677315DDAC9
        25ADCEA32412F97710C520591197746A707154B0734D3BA2679AD2716ACFF0FF
        0033DB28A28AF48F0028A28A0028A28A007472B44DB95995B04641C1C1183FA5
        67EA1E1AB1D4ADA78A4B78F6DC7DE0146D1EC17EEE09ED8FCA8A2BC1CFF85F27
        CF28AC3E71858578AD573C54B95F78B6AF1976945A6BA33AB0D8DAF8777A1371
        BEF67A3F55B3F99CB27C03D092E4CCB00B790306536AF25BE082083847033900
        FE02B43FE1575B326D6BED54AFA7DBEE0638233FEB3D091EF9A28AF0A1E1DE5B
        08A853C4632315B259863D25E492C4A49792490BEB2AEDFB2A777BFEEA96BFF9
        2107877E09E85E1BBB5920B3863D9D1913F7A07B33EEC7E02BAAB1B38F4D2E61
        5D8CE305B396C6082327900E7A74A28AE8CABC3EE1FCBF19FDA54B0FCF88FF00
        9FB5653AF59792AB5A552A25E4A563496615FD97B0835187F2C528C7EE8A4BF0
        24A28A2BECCE20A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2803FFD9}
      Transparent = True
    end
    object Panel3: TPanel
      Left = 640
      Top = 19
      Width = 297
      Height = 62
      BevelOuter = bvNone
      TabOrder = 0
      object JvShape6: TJvShape
        Left = 113
        Top = 4
        Width = 73
        Height = 52
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Fechar: TJvTransparentButton
        Left = 114
        Top = 5
        Width = 71
        Height = 50
        Hint = 'Retornar para Menu Principal'
        Caption = 'Retornar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C4C4C400CCCC
          CC00C9C9C900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00C1C1C100D4D3D300A2A09F003E39
          37005C595700D3D3D300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C600C5C5C500C0BEBD0023212100182022002F5E
          710047687B00605D5B00C9C9C900FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00C1C1C100D6D6D6008D8B8B005754520000040A00375D6C0041819C003E7B
          940055788D00534F4D00CACACA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C1C1
          C100C9C8C8001E171400212627002753660042839B005890AE00528DA8003C7D
          960054768B00615C5A00E1E1E100CECECE00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D1D1
          D000040404003D6E82004684A00046809A00548AA5004574950037627E00376B
          83006385980000000000000000002F2F2F00CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004A8DAA005286A500497896004E7E99004677970038648000366B
          84006F8B9800000000000808080038383800CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E101000538EAB004A79990037658200427288004477950039627E003769
          82006E8B9800000000000808080038383800CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004F8CA800497A98003A6784003D72880045769500327892002F7C
          9100708FA400000000000808080038383800CECECE00CDCDCD00C7C7C700FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1011004B8AA300467995003B688600376A82003558720018A0AC0022AE
          BD00718A9F0000000000080808003A3A3A00EAEAEB002A2B2C0078787800CCCC
          CC00C4C4C400C1C1C100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F1011004387A3003C718D0037627E003A738A005D8AAA003AA8BC002494
          A500718CA100000000000B0B0B0035353700434141004C453D0036373900A6A6
          A7009B9B9C00B4B4B400C1C1C100FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F11110041849E0045769000467790005591AC0044739300385D7A003866
          7F006F90A400000000000D100F00010300007C705A007B6B5C0026211D001E19
          150001000000696A6A00C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004F8CA9004F80A0003F6F8D004B7B96004777970038648000366B
          83006E90A4000400000002010400B1A17E00A997760093866C00897968007B6D
          5E003C3730006C6D6E00C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E101000538DAB004B7A9A0038668300407186004477940038648000366B
          83006E90A300040000001E1720000F0D0900A5947400A1907000746A5200776B
          5100433A270065666800C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004D8BA600477997003A6784003B72890043789700396481003569
          82006E90A300040000001D161D002223250043413B0094846400191C21007678
          7A006E6F7000A5A5A500C2C2C200FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1011004A8AA400457996003B68860038688000335F7600346279003B78
          91006F91A600030000001A1A1A003B3B3B00DBDBDD000E0E0E0065656500D2D2
          D200C7C7C700C2C2C200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F1011004386A100396A840036607B003B6F86003B778F004F87A0006FA6
          C1005F7481000E100A001A1A1A0036363600D0D0D000CFCFCF00C9C9C900FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F11120043819B003A708700386F8600427F980075A5BF007799AE004B4D
          5A00222821001E271E00181F180036363600CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1011003F7F99004D859E006C9DB6007C97AB00474B520025201D002B2B
          29002F272E00322A32001F211F0036353600CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D1D0
          D000020406007DB6D400728FA2004D575E002F2C2B002D2C2B00313131003131
          310031313100313231002A272A0032323200CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C3C3
          C300AEAEAE00070809000F0E0E000A0907000E0E0D000E0E0E000E0E0E000E0E
          0E000E0E0E000F0F0F000808080043434300CCCCCC00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00C3C3C300D1D0D000D1D1D100D2D2D200D2D2D200D2D2D200D2D2D200D2D2
          D200D2D2D200D2D2D200D2D2D200CCCCCC00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaBottom
        OnClick = JvTransparentButton_FecharClick
      end
      object JvShape7: TJvShape
        Left = 193
        Top = 4
        Width = 73
        Height = 52
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Windows: TJvTransparentButton
        Left = 194
        Top = 5
        Width = 71
        Height = 50
        Hint = 'Sai do sistema e retorna para sistema operacional.'
        Caption = 'Windows'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BB46
          0900BD3E0300B6490D00B24D0D00AD480C00AA470A00A8490C00AE4A0B00B549
          0800AF470300A94A0200A8500400AC540900AA521500AD541A00AE591C00A359
          1B0099551E009B561E00A2551E00AB551900B5541100FF00FF00C0470700AB4F
          1400AD4A1200B4471100B8450D00AA370500AA410000AF460000B04C0600A853
          1400BD590C00BD630F00A76211009C591400AA480F00B33B0600B63C0100BB47
          0400C0450A00B9430D00B3460E00B1490F00B14E0F00FF00FF00C1420400B54E
          1400B8471100B7460F00B0480F00B8511600BA590B00CC671300D0782500C386
          3100DB8D2B00E3912A00D38B2B00CA833500D0753A00D36F3900B35418009F44
          0100AE460A00B7481100B7471100B74C1000B8501200FF00FF00C7400400B447
          0E00B9440E00A2320300A1461300D0772C00D2761800DF7F1D00E68D2300EB9E
          1E00FAA51900FCA81300F5A10F00EB971B00E78C2800D9842C00D48C3900C079
          2F009C410E00A3330300B9440E00B7460B00BA4C0F00FF00FF00C63C0100AD40
          0700AD3B0300A73A0C00C9713A00CE7D2600D77D1300E78A1A00FB931900FF9B
          0600FFA20100FFA70000FCA50000F49D0900F1971200EB931300D3871500D691
          3900CC733E00A73A0C00AD3B0300B03E0600B1430800FF00FF00C53B0100A240
          0500A2380000D8773900D7843500CD7E1D00DF7D0A00EE890D00F28E0D00E88E
          0A00CE921300C0971C00BE971F00BE8C2100D2851500ED8D0A00E8890100CE7A
          0D00D6833200D8783900A2380000A83F0500AB420400FF00FF00C4410500943F
          0200B95F2000D7872D00C77A0E00CF7C1700E27A0200F4850600D3830E009C94
          430083AF7B007ABE9B0078B8A20085A79C00AF936800D07B1D00F4850500D878
          0000C6760600D7882F00B95E20009B3E0200A2410400FF00FF00BC3D0200984C
          0B00CE7E3C00B9721800BD6F0600C8770C00D8710000E67A0000BB811F0098D6
          B00067E7EA0042E0F70037D1F70044C1EE0090BABF00AD7B3E00DE710300DE73
          0A00BF6E0300B9731900CE7E3C009F4B0B009B400100FF00FF00BA3E0200A65D
          1A00C87A3700A95F1100BC691300D0861400DA7B0500EA8F1800AF8A32008AD2
          B8006AF2FF003BE4FD0033E6FF0024CFFA0069CED700928B5700C4670D00D063
          1400BB631000A9601100C77A3700AD5C1A009D430300FF00FF00BA3E0300BA6E
          2B00BD6E2A00A64D0400C3631800D99C2800E4952000F7B94800C5AE580085AA
          8E00A2FFFF0071F1F60054EDF30030E5F9004EE1E2007AA07200A2581000C358
          1F00BF571400A7520500BD6E2A00C16D2B009C410000FF00FF00BA3E0300C776
          3100B05E1700AD4B0000C35F0600DBAB3200ECAE3B00F7D16800EDDF92008E8F
          6B00CFF6EF00C8FFFD0095F2EE0059EBF3005CEBF2008EC2A300945A1B00B44E
          1300C2540000AE500000B05E1700CC753100A2430300FF00FF00C0440700C277
          33009B4F1400A0460600B4590C00E4B33100F0BC4800F8D78600FFF7BE00B5A0
          7100C4CEB4009EB09D0073947F004E99870053A18F008EA08200915B2700A04D
          0D00B04F0700A44A08009B4F1400C8763300A5480600FF00FF00C1450600BB73
          3200954A150091370400AB4E0D00F9BF5900FFCE7600FFF3BB00FFFFF700AD9D
          70005F5D3F009DAD9300A8CFAF008AD2AA0067B69000709068007F5D2900954A
          0900A2400300963C070094491400C1733200A3470400FF00FF00BE460600BC76
          3500904714008A3A0300A15115008F644A0090755D008D907B004D6C51003058
          3A0097AB9400D6FFE70099F6D00071ECBD005FDAA3007ACB90007F834500833C
          0200A44C0F008A3D060090461400C1743500AC510D00FF00FF00BC450500BD77
          3B0092491A006A2D0000784312009496BD005D7D9E0039808E0052B9B2007DE7
          DE0052827800B3F1DC0078EECB005EE4B80058D9980059BD7400739254007841
          1000723600006B31000092491A00C2733800AA541300FF00FF00B9430300B871
          38009C5125007D370100824A22007E98DE006FACEB0066C9F60065DFF6006BD9
          E600406D71008ECEC1006FE7CB0055D7AE0051CC8C004BB268006B995F007045
          1E007E3C0B007E3B09009C512500BC6E3500A7511100FF00FF00BA440500B16A
          3200AD6235008A3A0A00864627007D88D100769FEA006CAFF80068BDF70078C9
          F1006D8FA30084B5B3008AE0D00078CFB30076C591006AB2750082A979008D6E
          4F00833E15008C3D1000AD623500B5672F00A9531300FF00FF00B7400200A75C
          2300B86A3E0095451700844829009287BA008C96D400869EEF0085AAF90088B8
          EE008CA6C00092ABB20098B7B3007B9184007582600076895D008C9672009A81
          660080431E0096461C00B86A3D00AA592100A7501000FF00FF00BA4202009B4C
          1000B6623400AB5E310085512D00988BA0008F92B2008F9DDA008FA2E8009AAC
          DB009CA6C10081818C00796B6A008A6A62008C635500785A4300745F45007B5C
          3F00804A2200AD603500B66234009E4A0F00A74C0C00FF00FF00BA4001009C49
          0A00A54E1C00B3602F00BE755100B3AFC00095949F008291AE009199C100A18E
          AF0096859E008F83880096867B009C7F700096756A00916D60008C624C009357
          3500A0592D00B7663600A54E1C009F460900AB4D0C00FF00FF00B94102009D46
          06009B3F0B009B541E00AE5A2B00C09C8E00B9A1A100A7999F00A69AA500A78D
          9D00A992A200A2939100A08E7A00A387710094746D009C736E00A2665100AD5E
          3500AB6933009C5420009B3F0B00A1440400A9480500FF00FF00B64001009C41
          00009F4108008F440E0094420E009B542000B3724F00BB8D8300C9B2AD00B4A7
          A900B3A1A600B29D9800B59C8900B6968000A9867800A2776700AC6F5100B464
          3600A25B24008D400A009E3F0800A0400100A4430200FF00FF00B7400100A043
          0200A24103009D3E09009B3D0800913C040098501D00A6714E00CEB09B00C6B9
          AB00CCB6A800CDAB9B00C79C8900B48A7100A8805F00A67B5200B57E4F00A55C
          290097390600A13C0800A33D0700A2420200A5430500FF00FF00}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaBottom
      end
      object JvShape8: TJvShape
        Left = 10
        Top = 4
        Width = 88
        Height = 52
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Ferramentas: TJvTransparentButton
        Left = 9
        Top = 6
        Width = 90
        Height = 49
        Hint = 'Ferramentas de aux'#237'lio'
        Caption = 'Ferramentas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          5E050000424D5E05000000000000360000002800000014000000160000000100
          1800000000002805000000000000000000000000000000000000FEFEFEFAFAFA
          FDFDFDFDFDFDFFFFFFFEFEFEFEFEFEFBFBFCFFFFFFE7F0FDD0985FE5E9ECB19A
          8BC27E49DC9D59E3DAD1FFFFFFFEFEFEFEFEFEFCFCFCFEFEFEFCFCFCFEFEFEFE
          FEFEFFFFFFFFFFFFFDFDFDFFFFFFE0C19FDE7A00D7B08AFFC05CAA5C42E19335
          CAC3CCF4B155FEFFFFFFFEFEFEFEFEFEFFFEFFFFFFFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFDFEFEFFFFFFDA9640D37B00FAFFFFF0BC83DA7F00F8D899E2D0C5F9
          D395FFFFFFF6F8FBFDFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFEFDFE
          FFFFFFFAFFFFFAFCFE7B2900FAC869FFFFFFFFFFFFFFFFFFF4EEE9F4AA2BDF90
          34E38900FCFCE9FEFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFEFEFEFFFFF3BA7BF6
          950CEEB149EB8100F8F5DCFFFFFFFFFFFFFFFFFFFFFFFFF7F2ECFEFFF5E1E5FD
          E99D1DFCFFFFFDFDFDFEFEFEFEFEFEFFFFFEFEFDFEFEFFFFFA912EEDA93EFAFF
          FFFCFFFFFFFFFFFCFFFFE4AA57F8A82EFCFAE9FFFFFFF5F6FBDC9720FAFCEFFD
          FFFFFCFCFCFBFBFBFEFEFEFDFDFDFEFEFEF9FFFFF4A938F6AD2CF7BE5AFBF4E3
          FFFFFFE7C093FADC9FD1682AD78A0BFDFFFFF6D0AEF9DB9CFFFFFFFEFEFEFEFE
          FEFCFCFCFBFBFBFEFEFEFDFDFEFFFFFFFFFFFFFFFFF9964703EEAD45FFFFFFF2
          C18CFEF0C7D48A65DF7816FEFFFFF8FBFFF09D29F6CD79FBFEFEFEFEFEFEFEFE
          FDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFBFFFFBF4C00F2C56BFFFFFFFDFFFFF3A8
          38D97000F6D590FCFFFFFFFFFFFFFFFFD3965EFFEABEFFFFFFFFFFFEFEFEFEFE
          FFFFFFFFFFFFFFFFEBE1D1E36400F2CE8CFFFFFFFAFFFFFEFFFFFEFFFFFCFFFF
          FDFFFFFEFFFFE6A04CF4A81DE28600FFFFFFFFFEFEFEFFFFFFFFFFFCFFFFFEFF
          FEF5DDC9F3C580913D00F3AD52D5A972F78600F7E8C4FEFFFFFFFFFFFFFFFFF5
          EEEFF3A93EF7FFF1FAFFF3FDFEFFFEFEFEFFFFFFE2BB8FF7890DE28B13D55508
          D49744D6831DBB986FFFFFF6BA4D18E98E20FEFFFFE6A95DEB9E30FDFFFFF095
          2FFDFFFFFFFEFFFEFFFFFDFEFEFFFFFF957850AC5A00DCCDC6F1A232EAE6EAEC
          9A32E6954DFFEFC7B65213EDB261EEF2FFF19826EA6B13F0BF73CD8638FDE3BA
          FEFFFFFBFBFBFEFFFFD1A77AEDA84DC75200FFFEEDF9FFFFFFFFFFF1D5B9C8C2
          BADF7800BE6325ED8A1ADD8A22FBFFF4F4C38AF58A20FAF4D8FDFFFFFEFEFEFD
          FDFDE9D8C3A34200D2A774F5FDFFF2F9FFD56800D37501FFFFFFDB8426FCFFFF
          FDEBE9A96735914806EC9423EED6CDF9FFFFFDFFFFFFFEFEFEFEFEFEFEFEFAF9
          F7FFDAA3A24900EEB664E3CCB6CD8D4A500000FFF9CFE2BA91F4A53CC94E00DC
          9230F2A33DDA9D61CC7008ECAD56FDFFFFFEFDFEFFFFFFFFFFFFFDFFFFF9E3E0
          AC4200F5CC93FFFFFFE79D48F6B75BF8FFFFDCB17FD19248A03F07EE9E36E1DD
          EAFDE1B2D7A06CFFE8B1FAFFFFFEFEFFFFFFFFFFFFFFFFFFFFC26400DF8F1CC1
          9A73F0B867FFFFFFF6FFFFDFC5AFFFBD646C2700E2911FE1EBF0D47206841F00
          F6F2EFAE4B00FFE9BEFEFFFFFEFEFEFFFFFFFEFFFFEEDDC1E3AB5BB3844EB752
          00D1C4C4DB6800C7AD93D78218E7E5DEA14703EC972CE8DDD7FBCF8CD3A682FF
          DD92FCFDFFFEFFFFFEFEFEFEFEFEFEFEFEFCFFFFFFFFFF957144C77400C5720B
          F19D46EC9B34F4EFD6F4DFC6EC7000C2813AEAA03FCFAC91CB8029E49533FDFF
          FFFEFDFEFEFEFEFCFCFCFDFDFDFDFDFDFBFBFCFFFFFFFFFFEBFEF8DAFDFFFFFF
          FFFFFFFFFFFFFFFFFAE088D9982DAC5100D67200FAD392FAFDF6FEFEFFFEFEFE
          FEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFEFFFFFFFFFFFEFEFEFEFEFEFEFE
          FEFEFDFEFFFFFFFBFDFFFBFBF5FFFFFFFEFFFFFFFFFFFEFEFEFEFEFEFFFFFFFE
          FEFE}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaBottom
      end
    end
  end
  object DSC_Facil: TDataSource
    DataSet = ClientDataSet_Facil
    Left = 664
    Top = 336
  end
  object Table_Teste: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDCURSO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'IDTURMA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FASEAPLICACAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REFERENCIAAVALIACAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CODMATERIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DATAAPLICACAO'
        DataType = ftDateTime
      end
      item
        Name = 'TOTALALUNOS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TOTALITENS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DURACAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOTALIRREGULARIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'TOTALANULADAS'
        DataType = ftInteger
      end
      item
        Name = 'REFORMULADOS'
        DataType = ftSmallint
      end
      item
        Name = 'MANTIDO'
        DataType = ftSmallint
      end
      item
        Name = 'APRESENTARNOTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'N_GABARITOS'
        DataType = ftInteger
      end
      item
        Name = 'HAB_ELABORACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'STATUS_APLICACAO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'INICIO_APLICACAO'
        DataType = ftDateTime
      end
      item
        Name = 'TERMINO_APLICACAO'
        DataType = ftDateTime
      end>
    Filter = 'idCurso = 57 '
    Filtered = True
    IndexDefs = <
      item
        Name = 'TESTE_TESTEID_PK'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TESTE'
    Left = 81
    Top = 302
    object Table_TesteIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Required = True
    end
    object Table_TesteIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Required = True
    end
    object Table_TesteFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Required = True
      Size = 1
    end
    object Table_TesteREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Required = True
      EditMask = '99'#186'c;0; '
      Size = 3
    end
    object Table_TesteCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Required = True
      Size = 6
    end
    object Table_TesteTOTALALUNOS: TSmallintField
      FieldName = 'TOTALALUNOS'
      Required = True
      DisplayFormat = '###'
      EditFormat = '###'
    end
    object Table_TesteTOTALITENS: TSmallintField
      FieldName = 'TOTALITENS'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object Table_TesteDURACAO: TIntegerField
      FieldName = 'DURACAO'
      Required = True
      DisplayFormat = '00:00'
      EditFormat = '00:00'
    end
    object Table_TesteTOTALIRREGULARIDADE: TSmallintField
      FieldName = 'TOTALIRREGULARIDADE'
    end
    object Table_TesteTOTALANULADAS: TIntegerField
      FieldName = 'TOTALANULADAS'
    end
    object Table_TesteREFORMULADOS: TSmallintField
      FieldName = 'REFORMULADOS'
    end
    object Table_TesteMANTIDO: TSmallintField
      FieldName = 'MANTIDO'
    end
    object Table_TesteAPRESENTARNOTA: TIBStringField
      FieldName = 'APRESENTARNOTA'
      Size = 1
    end
    object Table_TesteOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object Table_TesteN_GABARITOS: TIntegerField
      FieldName = 'N_GABARITOS'
    end
    object Table_TesteDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object Table_TesteHAB_ELABORACAO: TIBStringField
      FieldName = 'HAB_ELABORACAO'
      Size = 1
    end
    object Table_TesteSTATUS_APLICACAO: TIBStringField
      FieldName = 'STATUS_APLICACAO'
      Size = 12
    end
    object Table_TesteINICIO_APLICACAO: TDateTimeField
      FieldName = 'INICIO_APLICACAO'
    end
    object Table_TesteTERMINO_APLICACAO: TDateTimeField
      FieldName = 'TERMINO_APLICACAO'
    end
  end
  object DST_Teste: TDataSource
    DataSet = Table_Teste
    Left = 111
    Top = 306
  end
  object IBQuery_Abrangencia: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DST_Teste
    SQL.Strings = (
      'Select distinct IdCurso, IdTurma, CodMateria'
      'From TesteAbrangencia t, ITEMPROVA_VIEW i'
      'Where t.idCurso = i.idCurso'
      'and   t.IdTurma = i.IdTurma'
      'and   t.idCurso = 57'
      'and   t.IdTurma = 15'
      'and t.FaseAplicacao = '#39'1'#39
      'and t.ReferenciaAvaliacao = '#39'01T'#39
      'Order By CodMateria'
      '')
    Left = 80
    Top = 353
    object IBQuery_AbrangenciaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ITEMPROVA_VIEW.IDCURSO'
    end
    object IBQuery_AbrangenciaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ITEMPROVA_VIEW.IDTURMA'
    end
    object IBQuery_AbrangenciaCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'ITEMPROVA_VIEW.CODMATERIA'
      Size = 7
    end
  end
  object DSQ_Abrangencia: TDataSource
    DataSet = IBQuery_Abrangencia
    Left = 124
    Top = 351
  end
  object DSQ_IP_Item: TDataSource
    DataSet = Query_IP_Item
    Left = 126
    Top = 386
  end
  object IBQuery_NQuestoes: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_Abrangencia
    SQL.Strings = (
      'Select Objetivo, count(1) as Qtd'
      'From ITEMPROVA_VIEW'
      'Where    IdCurso   =:IdCurso'
      'and        IdTurma = :IdTurma'
      'and         CodMateria  =:CodMateria'
      'Group by Objetivo'
      'Order By Objetivo')
    Left = 80
    Top = 474
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'IDCURSO'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'IDTURMA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'CodMateria'
        ParamType = ptUnknown
      end>
    object IBQuery_NQuestoesOBJETIVO: TIBStringField
      FieldName = 'OBJETIVO'
      Origin = 'ITEMPROVA_VIEW.OBJETIVO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_NQuestoesQTD: TIntegerField
      FieldName = 'QTD'
      Required = True
    end
  end
  object DataSource2: TDataSource
    DataSet = IBQuery_NQuestoes
    Left = 110
    Top = 474
  end
  object Query_IP_Item: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_Abrangencia
    SQL.Strings = (
      
        'Select NumItem, IdCurso, IdTurma, CodMateria, Disciplina, Unidad' +
        'e, SubUnidade, Objetivo, Serie, TempoRes, RespostaCorreta,  Desc' +
        'EnAlt, Status, Recurso'
      'From ITEMPROVA_VIEW'
      'Where    IdCurso   =:IdCurso'
      'and        IdTurma = :IdTurma'
      'and         CodMateria  =:CodMateria  '
      'Order By Disciplina, Unidade, SubUnidade, Objetivo, Serie asc')
    Left = 80
    Top = 394
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'IDCURSO'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'IDTURMA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CODMATERIA'
        ParamType = ptUnknown
        Size = 8
      end>
    object Query_IP_ItemNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'ITEM.NUMITEM'
      Required = True
    end
    object Query_IP_ItemIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ITEM.IDCURSO'
      Required = True
    end
    object Query_IP_ItemCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'ITEM.CODMATERIA'
      Required = True
      Size = 7
    end
    object Query_IP_ItemDISCIPLINA: TIBStringField
      FieldName = 'DISCIPLINA'
      Origin = 'ITEM.DISCIPLINA'
      Required = True
      Size = 2
    end
    object Query_IP_ItemUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'ITEM.UNIDADE'
      Required = True
      Size = 2
    end
    object Query_IP_ItemSUBUNIDADE: TIBStringField
      FieldName = 'SUBUNIDADE'
      Origin = 'ITEM.SUBUNIDADE'
      Required = True
      Size = 2
    end
    object Query_IP_ItemOBJETIVO: TIBStringField
      FieldName = 'OBJETIVO'
      Origin = 'ITEM.OBJETIVO'
      Required = True
      Size = 1
    end
    object Query_IP_ItemSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ITEM.SERIE'
      Required = True
      Size = 2
    end
    object Query_IP_ItemTEMPORES: TIBStringField
      FieldName = 'TEMPORES'
      Origin = 'ITEM.TEMPORES'
      Required = True
      Size = 4
    end
    object Query_IP_ItemRESPOSTACORRETA: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Origin = 'ITEM.RESPOSTACORRETA'
      Required = True
      Size = 1
    end
    object Query_IP_ItemDESCENALT: TBlobField
      FieldName = 'DESCENALT'
      Origin = 'ITEM.DESCENALT'
      Size = 8
    end
    object Query_IP_ItemRECURSO: TIBStringField
      FieldName = 'RECURSO'
      Origin = 'ITEM.RECURSO'
      FixedChar = True
      Size = 1
    end
    object Query_IP_ItemSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ITEMPROVA_VIEW.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object ClientDataSet_Facil: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 665
    Top = 305
    Data = {
      1E0200009619E0BD0100000018000000130000000000030000001E020A446973
      6369706C696E610100490000000100055749445448020002000A00074D617465
      7269610100490000000100055749445448020002000A0003436F720100490000
      000100055749445448020002000100094E51756573746F657304000100000000
      000553656C5F460100490000000100055749445448020002000100094E756D49
      74656D5F460100490000000100055749445448020002000F000A436F6E666C69
      746F5F460100490000000100055749445448020002000F000A4F626A65746976
      6F5F4601004900000001000557494454480200020001000A4E756D5175657374
      616F04000100000000000553656C5F4D01004900000001000557494454480200
      02000100094E756D4974656D5F4D010049000000010005574944544802000200
      0F000A436F6E666C69746F5F4D0100490000000100055749445448020002000F
      000A4F626A657469766F5F4D0100490000000100055749445448020002000100
      0C4E756D5175657374616F5F4D04000100000000000553656C5F440100490000
      000100055749445448020002000100094E756D4974656D5F4401004900000001
      00055749445448020002000F000A436F6E666C69746F5F440100490000000100
      055749445448020002000F000A4F626A657469766F5F44010049000000010005
      57494454480200020001000C4E756D5175657374616F5F440400010000000000
      0000}
    object ClientDataSet_FacilDisciplina: TStringField
      DisplayWidth = 12
      FieldName = 'Disciplina'
      Size = 10
    end
    object ClientDataSet_FacilMateria: TStringField
      DisplayWidth = 12
      FieldName = 'Materia'
      Size = 10
    end
    object ClientDataSet_FacilCor: TStringField
      DisplayWidth = 3
      FieldName = 'Cor'
      Size = 1
    end
    object ClientDataSet_FacilNQuestoes: TIntegerField
      DisplayWidth = 12
      FieldName = 'NQuestoes'
    end
    object ClientDataSet_FacilSel_F: TStringField
      DisplayWidth = 6
      FieldName = 'Sel_F'
      Size = 1
    end
    object ClientDataSet_FacilNumItem_F: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem_F'
      Size = 15
    end
    object ClientDataSet_FacilConflito_F: TStringField
      DisplayWidth = 10
      FieldName = 'Conflito_F'
      Size = 15
    end
    object ClientDataSet_FacilObjetivo_F: TStringField
      DisplayWidth = 10
      FieldName = 'Objetivo_F'
      Size = 1
    end
    object ClientDataSet_FacilNumQuestao: TIntegerField
      DisplayWidth = 13
      FieldName = 'NumQuestao'
    end
    object ClientDataSet_FacilSel_M: TStringField
      DisplayWidth = 6
      FieldName = 'Sel_M'
      Size = 1
    end
    object ClientDataSet_FacilNumItem_M: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem_M'
      Size = 15
    end
    object ClientDataSet_FacilConflito_M: TStringField
      DisplayWidth = 18
      FieldName = 'Conflito_M'
      Size = 15
    end
    object ClientDataSet_FacilObjetivo_M: TStringField
      DisplayWidth = 11
      FieldName = 'Objetivo_M'
      Size = 1
    end
    object ClientDataSet_FacilNumQuestao_M: TIntegerField
      DisplayWidth = 16
      FieldName = 'NumQuestao_M'
    end
    object ClientDataSet_FacilSel_D: TStringField
      DisplayWidth = 6
      FieldName = 'Sel_D'
      Size = 1
    end
    object ClientDataSet_FacilNumItem_D: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem_D'
      Size = 15
    end
    object ClientDataSet_FacilConflito_D: TStringField
      DisplayWidth = 18
      FieldName = 'Conflito_D'
      Size = 15
    end
    object ClientDataSet_FacilObjetivo_D: TStringField
      DisplayWidth = 11
      FieldName = 'Objetivo_D'
      Size = 1
    end
    object ClientDataSet_FacilNumQuestao_D: TIntegerField
      DisplayWidth = 15
      FieldName = 'NumQuestao_D'
    end
    object ClientDataSet_FacilPosiciona_Cont: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Posiciona_Cont'
      Size = 10
      Calculated = True
    end
  end
  object ClientDataSet_Prova: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 310
    Data = {
      900000009619E0BD0100000018000000040000000000030000009000054E6976
      656C0100490000000100055749445448020002000100074D6174657269610100
      490000000100055749445448020002000600074E756D4974656D010049000000
      0100055749445448020002000F000F526573706F737461436F72726574610100
      4900000001000557494454480200020001000000}
    object ClientDataSet_ProvaNivel: TStringField
      DisplayWidth = 6
      FieldName = 'Nivel'
      Size = 1
    end
    object ClientDataSet_ProvaMateria: TStringField
      DisplayWidth = 9
      FieldName = 'Materia'
      Size = 6
    end
    object ClientDataSet_ProvaNumItem: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem'
      Size = 15
    end
    object ClientDataSet_ProvaRespostaCorreta: TStringField
      DisplayWidth = 16
      FieldName = 'RespostaCorreta'
      Size = 1
    end
  end
  object DCDS_Prova: TDataSource
    DataSet = ClientDataSet_Prova
    Left = 720
    Top = 342
  end
end
