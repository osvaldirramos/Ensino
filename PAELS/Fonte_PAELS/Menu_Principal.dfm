object Form_MenuPrincipal: TForm_MenuPrincipal
  Left = 90
  Top = 60
  Width = 1382
  Height = 750
  Caption = 'PAELS --> Menu Principal'
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Opcoes: TPanel
    Left = 0
    Top = 0
    Width = 256
    Height = 719
    Align = alLeft
    Color = 16775660
    TabOrder = 0
    object JvGradientCaption_MenuPrincipal: TJvGradientCaption
      Left = 1
      Top = 1
      Width = 254
      Height = 28
      GradientStartColor = 4227200
      GradientEndColor = 15512452
      GradientStyle = grHorizontal
      LabelCaption = 'Menu Principal'
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
    object JvExpress_EscolhaOpcoes: TJvExpress
      Left = 1
      Top = 29
      Width = 254
      Height = 668
      Align = alClient
      HighlightFont.Charset = DEFAULT_CHARSET
      HighlightFont.Color = clMaroon
      HighlightFont.Height = -11
      HighlightFont.Name = 'MS Sans Serif'
      HighlightFont.Style = []
      ParentImageSize = False
      ShowPressed = True
      Caption = 'Outlook'
      Color = 16775660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ButtonHeight = 26
      DesignSize = (
        250
        664)
      object JvExpressButton_Windows: TJvExpressButton
        Left = 0
        Top = 52
        Width = 250
        Height = 26
        Hint = 'Cadastro das Disciplinas.'
        Anchors = [akRight, akBottom]
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = JvExpressButton_WindowsClick
        FillColor = 16311249
        ButtonBorder = bbDark
        Caption = 'Retorna para Windows                                    '
        HighlightFont.Charset = ANSI_CHARSET
        HighlightFont.Color = clBlack
        HighlightFont.Height = -15
        HighlightFont.Name = 'Arial'
        HighlightFont.Style = []
        ImageIndex = 1
        ImageSize = isSmall
        ParentImageSize = False
        LargeImages = DM.ImageList_Ensino
        Spacing = 3
        SmallImages = DM.ImageList_Ensino
      end
      object JvExpressButton_Turma: TJvExpressButton
        Left = 0
        Top = 26
        Width = 250
        Height = 26
        Hint = 'Tratamento do cadastro do Turma / Aluno / Instrutor.'
        Anchors = [akRight, akBottom]
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = JvExpressButton_TurmaClick
        FillColor = 16311249
        ButtonBorder = bbDark
        Caption = 'Imprime a Ficha de Avalia'#231#227'o       '
        HighlightFont.Charset = ANSI_CHARSET
        HighlightFont.Color = clBlack
        HighlightFont.Height = -15
        HighlightFont.Name = 'Arial'
        HighlightFont.Style = []
        ImageIndex = 4
        ImageSize = isSmall
        ParentImageSize = False
        LargeImages = DM.ImageList_Ensino
        Spacing = 3
        SmallImages = DM.ImageList_Ensino
      end
      object JvExpressButton_RelacaoComCodigoDeAcesso: TJvExpressButton
        Left = 0
        Top = 0
        Width = 250
        Height = 26
        Hint = 'Cadastro do Corpo Docente'
        Anchors = [akRight, akBottom]
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = JvExpressButton_RelacaoComCodigoDeAcessoClick
        FillColor = 16311249
        ButtonBorder = bbDark
        Caption = 'Rela'#231#227'o com C'#243'digo de Acesso'
        HighlightFont.Charset = ANSI_CHARSET
        HighlightFont.Color = clBlack
        HighlightFont.Height = -15
        HighlightFont.Name = 'Arial'
        HighlightFont.Style = []
        ImageIndex = 2
        ImageSize = isSmall
        ParentImageSize = False
        LargeImages = DM.ImageList_Ensino
        Spacing = 3
        SmallImages = DM.ImageList_Ensino
      end
    end
    object StatusBar: TStatusBar
      Left = 1
      Top = 697
      Width = 254
      Height = 21
      Color = 16766640
      Panels = <>
      ParentShowHint = False
      ShowHint = True
      SimplePanel = True
      SimpleText = 'Selecione a op'#231#227'o desejada.'
    end
  end
  object Panel1: TPanel
    Left = 256
    Top = 0
    Width = 1118
    Height = 719
    Align = alClient
    Color = 16765348
    TabOrder = 1
    object Panel_Filtro: TPanel
      Left = 1
      Top = 1
      Width = 1116
      Height = 21
      Align = alTop
      BevelOuter = bvNone
      Color = 16765348
      TabOrder = 0
      object Edit_Turma: TEdit
        Left = 75
        Top = 0
        Width = 218
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 0
        OnChange = Edit_TurmaChange
      end
      object Edit_Ano: TEdit
        Left = 291
        Top = 0
        Width = 46
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 1
        OnChange = Edit_TurmaChange
      end
      object ComboBox_Status: TComboBox
        Left = 896
        Top = 0
        Width = 87
        Height = 20
        BevelInner = bvNone
        BevelOuter = bvNone
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 2
        Text = 'ANDAMENTO'
        OnChange = Edit_TurmaChange
        Items.Strings = (
          'ANDAMENTO'
          'EXECUTADAS'
          'PLANEJADAS')
      end
    end
    object DBGrid_Turma: TDBGrid
      Left = 1
      Top = 22
      Width = 984
      Height = 696
      Align = alLeft
      Color = 16444382
      DataSource = DM.DSQ_MontaTurma
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clTeal
      TitleFont.Height = -13
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = []
      OnDblClick = DBGrid_TurmaDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODCURSO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Curso'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TURMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Turma'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Ano'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAINICIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #205'nicio'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 88
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATATERMINO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'T'#233'rmino'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COORDENADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Coordenador'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 385
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end>
    end
  end
  object ImageList_SituacaoItem: TImageList
    Left = 641
    Top = 178
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFC1BC00FFC1BC00FFC1BB00FFC2BC00FFC6BE00FFC7BE00FFC9
      C100FFC1BC000000000000000000FFBEB9000000000000000000FFC0BB00FFC0
      BB00FFC0BB00FFC1BC00FFC1BC00FFC1BB00FFC2BC00FFC6BE00FFC7BE00FFC9
      C100FFC1BC00FFC0BB00FFC0BB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCBDB200F3B6AD00F3B7
      B200E6AFB300AE879800846C8C00736499007469B3006E6CD400685FBC003C34
      690074639200C4979C00FBC0B800FFBEB9000000000000000000F3B6AD00F3B7
      B200E6AFB300AE879800846C8C00736499007469B3006E6CD400685FBC003C34
      690074639200000000004CB12200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFC1BB009D7F9C00736291006458
      8C00635DA3006F6CCA007573CF00807199008E749500B37A9200DE849D00B966
      7A006E62AB005454A60093769000FFC1BB000000000000000000736291006458
      8C00635DA3006F6CCA007573CF00807199008E749500B37A9200DE849D00B966
      7A00000000004CB122004CB12200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFC1BD00C1856C00DE9D6F00FFBB
      7D00FFDA9000FFE19200FFEA9700D8AB7D00BA8B6E00C1837800CA7E8000A966
      6B00FFB3A200F79C9D008C556600FFC6BF00FFC1BD004CB1220000000000FFBB
      7D00FFDA9000FFE19200FFEA9700D8AB7D00BA8B6E00C1837800CA7E8000A966
      6B004CB122004CB122004CB12200FFC6BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFC1BC00F9A77800FFBA8500EEB0
      7D00A7835A00AE8C5F00B6996500B1986B00AE906A00D69D8300DF968B00F094
      9A00C4787C00F3979B00CB768100FFC4BE00FFC1BC004CB122004CB122000000
      0000A7835A00AE8C5F00B6996500B1986B00AE906A00D69D8300DF968B000000
      00004CB122004CB1220000000000FFC4BE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECB1AE00B9898000C68B
      6E00FFC88C00FFDD9600D6B5800093B5C900D0E3F600C48D7400C5887E00B37A
      7600A16A6F00A2727400E0A8A400FFBEB900FFC0BB00000000004CB122004CB1
      2200FFC88C00FFDD9600D6B5800093B5C900D0E3F600C48D7400000000004CB1
      22004CB1220000000000E0A8A400FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFC2BE00FFC6C100DFA8
      A300C2916800C49E6A00A28460008FB0C100D8E7F600A2787200DEA8A400FFC2
      BD00FFC3BD00FFC3BE00FFC3BE00FFBEB900FFC0BB00FFC2BE00000000004CB1
      220000000000C49E6A00A28460008FB0C100D8E7F600000000004CB122004CB1
      220000000000FFC3BE00FFC3BE00FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFC7C300FFC9C500FFC7C1007296A700CADEEC00F6B7B100FFC1BC000000
      0000000000000000000000000000FFBEB900FFC0BB00FFC0BB00FFC0BB000000
      00004CB1220000000000FFC7C1007296A700000000004CB122004CB122004CB1
      2200FFC0BB00FFC0BB00FFC0BB00FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFC8C200718FA000C2D8E600F8B8B300FFC1BC000000
      0000000000000000000000000000FFBEB900FFC0BB00FFC0BB00FFC0BB00FFC0
      BB004CB122004CB1220000000000000000004CB122004CB122004CB122000000
      0000FFC0BB00FFC0BB00FFC0BB00FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFC5C0008295A200B7D1E000FFC0BA00FFC1BB000000
      0000000000000000000000000000FFBEB900FFC0BB00FFC0BB00FFC0BB00FFC0
      BB00FFC0BB00000000004CB122004CB122004CB1220000000000FFC1BB00FFC0
      BB00FFC0BB00FFC0BB00FFC0BB00FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFC4BF007A8088007495A300D8A3A000FFC3BD00FFC2
      BD00000000000000000000000000FFBEB900FFC0BB00FFC0BB00FFC0BB00FFC0
      BB00FFC0BB00000000004CB122004CB122004CB1220000000000FFC3BD00FFC2
      BD00FFC0BB00FFC0BB00FFC0BB00FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFC2BD00F8B9B400A29395008FBBCA00A7CBD80062A3B600488597009F8F
      9200FFC2BD000000000000000000FFBEB900FFC0BB00FFC0BB00FFC0BB00FFC0
      BB004CB122004CB122004CB12200000000004CB122004CB122004CB122004CB1
      220000000000FFC0BB00FFC0BB00FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFC4BE00E2ADAA00778F9800ADC4D200C2D4E10099C1D00063A5B700667F
      8900FFC3BE000000000000000000FFBEB900FFC0BB00FFC0BB00FFC0BB000000
      00004CB122004CB1220000000000ADC4D200000000004CB122004CB122004CB1
      22004CB1220000000000FFC0BB00FFBEB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFC3BE00E4AEAB0095A2A7009BB6C3009BB5C300A6CBD50072A9B9008D8C
      9100FFC2BD000000000000000000FFBEB900FFC0BB00000000004CB122004CB1
      220000000000E4AEAB0095A2A7009BB6C3009BB5C300A6CBD500000000004CB1
      22004CB122004CB122004CB12200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFC1BD00FABCB700BC9D9D00BCD6DE00B5CFD7008BB5C1007C8C9300D9A9
      A500000000000000000000000000FFBEB900FFC0BB004CB122004CB122004CB1
      2200FFC1BD00FABCB700BC9D9D00BCD6DE00B5CFD7008BB5C1007C8C93000000
      00004CB122004CB122004CB12200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFC1BC00FCBCB700FBBDB800FFBEB900FFC1BC00FFC1
      BC00000000000000000000000000FFBEB900000000000000000000000000FFC0
      BB00FFC0BB00FFC0BB00FFC1BC00FCBCB700FBBDB800FFBEB900FFC1BC00FFC1
      BC00FFC0BB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F806C001FFFF00008000C005FFFF0000
      0000C009FFFF000000002000FFFF000000001012FFFF000080004024FFFF0000
      80002848FFFF0000F01E1480FFFF0000FC1E0310FFFF0000FC1E0440FFFF0000
      FC0E0440FFFF0000F0060108FFFF0000F0061284FFFF0000F0064821FFFF0000
      F00E0011FFFF0000FC0EE007FFFF000000000000000000000000000000000000
      000000000000}
  end
end
