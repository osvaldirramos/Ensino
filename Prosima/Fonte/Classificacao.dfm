object Form_Classificacao: TForm_Classificacao
  Left = 242
  Top = 99
  Width = 1280
  Height = 982
  Caption = 'Classifica'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JvCaptionPanel3: TJvCaptionPanel
    Left = 0
    Top = 581
    Width = 1264
    Height = 363
    Align = alBottom
    Buttons = []
    Caption = 'Gr'#225'fico para demonstrar as M'#233'dias dos Alunos'
    CaptionPosition = dpTop
    CaptionFont.Charset = ANSI_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = [fsBold]
    OutlookLook = False
    TabOrder = 0
    object Chart_Desempenho: TChart
      Left = 1
      Top = 25
      Width = 1248
      Height = 323
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = clWhite
      Gradient.StartColor = 16777088
      Gradient.Visible = True
      MarginLeft = 2
      MarginTop = 3
      Title.Color = 8454143
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -17
      Title.Font.Name = 'Times New Roman'
      Title.Font.Style = [fsBold, fsItalic]
      Title.Frame.Visible = True
      Title.Text.Strings = (
        'Gr'#225'fico para demonstrar as M'#233'dias')
      Chart3DPercent = 10
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.AxisValuesFormat = '#0.##'
      LeftAxis.ExactDateTime = False
      LeftAxis.Maximum = 4.000000000000000000
      LeftAxis.Title.Caption = 'M'#233'dias'
      Legend.LegendStyle = lsValues
      Legend.ShadowSize = 1
      Legend.Visible = False
      Align = alClient
      BevelWidth = 0
      PopupMenu = PopupMenu1
      TabOrder = 0
      object Panel_Media: TButton
        Left = 111
        Top = 5
        Width = 177
        Height = 25
        Caption = 'Panel_Media'
        TabOrder = 0
      end
      object Series1: TBarSeries
        Marks.ArrowLength = 6
        Marks.Frame.Color = clRed
        Marks.Frame.Style = psDashDotDot
        Marks.Frame.SmallDots = True
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clRed
        ShowInLegend = False
        ValueFormat = '#0.##'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 581
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 581
      Height = 579
      Align = alLeft
      TabOrder = 0
      object Panel_Turma: TPanel
        Left = 1
        Top = 55
        Width = 579
        Height = 124
        Align = alTop
        BevelOuter = bvNone
        Color = 16577515
        TabOrder = 0
        object JvShape2: TJvShape
          Left = 3
          Top = 0
          Width = 573
          Height = 124
          Align = alClient
          Brush.Color = 16577515
          Pen.Color = 15314812
          Shape = stRoundRect
        end
        object Label2: TLabel
          Left = 16
          Top = 10
          Width = 47
          Height = 18
          Caption = 'Turma:'
          Color = 16577515
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 17
          Top = 49
          Width = 39
          Height = 18
          Caption = 'In'#237'cio:'
          Color = 16577515
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 209
          Top = 49
          Width = 61
          Height = 18
          Caption = 'T'#233'rmino:'
          Color = 16577515
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Splitter1: TSplitter
          Left = 0
          Top = 0
          Height = 124
        end
        object Splitter2: TSplitter
          Left = 576
          Top = 0
          Height = 124
          Align = alRight
        end
        object Label11: TLabel
          Left = 406
          Top = 39
          Width = 73
          Height = 16
          Caption = 'Vers'#227'o: 1.01'
          Color = 16577515
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label12: TLabel
          Left = 406
          Top = 55
          Width = 63
          Height = 16
          Caption = '20/11/2012'
          Color = 16577515
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label1: TLabel
          Left = 17
          Top = 79
          Width = 100
          Height = 18
          Caption = 'Coordenador.:'
          Color = 16577515
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBEdit3: TDBEdit
          Left = 272
          Top = 44
          Width = 121
          Height = 24
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataField = 'DATATERMINO'
          DataSource = DST_MontaTurma
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 61
          Top = 44
          Width = 120
          Height = 24
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'DATAINICIO'
          DataSource = DST_MontaTurma
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object ComboBox_Turma: TComboBox
          Left = 72
          Top = 8
          Width = 393
          Height = 21
          BevelInner = bvSpace
          BevelKind = bkFlat
          ItemHeight = 13
          TabOrder = 2
          OnChange = ComboBox_TurmaChange
        end
        object DBEdit1: TDBEdit
          Left = 120
          Top = 74
          Width = 353
          Height = 24
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataField = 'DATATERMINO'
          DataSource = DST_MontaTurma
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object ToolBar_BotoesIniciais: TToolBar
        Left = 1
        Top = 1
        Width = 579
        Height = 54
        ButtonHeight = 47
        ButtonWidth = 116
        Caption = 'ToolBar_BotoesIniciais'
        Color = 16577515
        EdgeBorders = [ebTop, ebBottom]
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
        TabOrder = 1
        object ToolButton2: TToolButton
          Left = 15
          Top = 2
          Caption = 'Imprimir'
          ImageIndex = 1
          Visible = False
        end
        object ToolButton_Ficha_Avl: TToolButton
          Left = 131
          Top = 2
          Caption = 'Ficha de Avalia'#231#227'o'
          ImageIndex = 42
          OnClick = ToolButton_Ficha_AvlClick
        end
        object ToolButton4: TToolButton
          Left = 247
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object ToolButton_Retornar: TToolButton
          Left = 255
          Top = 2
          Hint = 'Retornar para Janela anterior.'
          Caption = 'Retornar'
          ImageIndex = 3
          OnClick = ToolButton_RetornarClick
        end
        object ToolButton1: TToolButton
          Left = 371
          Top = 2
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton_Windows: TToolButton
          Left = 379
          Top = 2
          Hint = 'Sai do sistema e retorna para sistema operacional.'
          Caption = 'Windows'
          ImageIndex = 2
          OnClick = ToolButton_WindowsClick
        end
      end
      object GroupBox_NS: TGroupBox
        Left = 1
        Top = 437
        Width = 579
        Height = 141
        Align = alBottom
        Caption = '< NS >'
        TabOrder = 2
        object RichEdit_NS: TRichEdit
          Left = 2
          Top = 15
          Width = 575
          Height = 124
          Align = alClient
          Lines.Strings = (
            'RichEdit_NS')
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 179
        Width = 579
        Height = 258
        Align = alClient
        Caption = '< COMENT'#193'RIO >'
        TabOrder = 3
        object JvDBRichEdit_Parecer: TJvDBRichEdit
          Left = 2
          Top = 15
          Width = 575
          Height = 241
          DataField = 'PARECER'
          DataSource = DST_Cad_FichaAvl
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          WantTabs = True
        end
      end
    end
    object Panel3: TPanel
      Left = 582
      Top = 1
      Width = 681
      Height = 579
      Align = alClient
      Caption = 'Panel3'
      TabOrder = 1
      object DBGrid_Fichas: TDBGrid
        Left = 1
        Top = 22
        Width = 679
        Height = 556
        Align = alClient
        Color = clCream
        Ctl3D = False
        DataSource = DSQ_Cad_Avaliados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -18
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = [fsBold, fsItalic]
        OnDrawColumnCell = DBGrid_FichasDrawColumnCell
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ID_ATCO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 78
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'MEDIA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'M'#233'dia'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_EXERCICIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Exercicio'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMECOMPLETO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Nome Completo'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 451
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 679
        Height = 21
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvNone
        Color = 16577515
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object ComboBox_Id_Exercicio: TComboBox
          Left = 117
          Top = 0
          Width = 58
          Height = 21
          BevelInner = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = ComboBox_Id_ExercicioChange
          Items.Strings = (
            ''
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
        end
        object Edit_nome: TEdit
          Left = 174
          Top = 0
          Width = 467
          Height = 19
          CharCase = ecUpperCase
          MaxLength = 120
          TabOrder = 1
          OnChange = ComboBox_Id_ExercicioChange
        end
      end
    end
  end
  object IBQuery_Cad_Avaliados: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    AfterScroll = IBQuery_Cad_AvaliadosAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DST_MontaTurma
    SQL.Strings = (
      'Select *'
      'From Cad_Ficha_avl'
      'where IdCurso = :IdCurso'
      'and    IdTurma = :IdTurma'
      'Order By Id_Atco, Id_Exercicio')
    Left = 169
    Top = 238
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
      end>
    object IBQuery_Cad_AvaliadosIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'CAD_FICHA_AVL.IDCURSO'
      Required = True
    end
    object IBQuery_Cad_AvaliadosIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'CAD_FICHA_AVL.IDTURMA'
      Required = True
    end
    object IBQuery_Cad_AvaliadosID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
      Origin = 'CAD_FICHA_AVL.ID_FICHA'
      Required = True
    end
    object IBQuery_Cad_AvaliadosID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
      Origin = 'CAD_FICHA_AVL.ID_ATCO'
      Required = True
      FixedChar = True
    end
    object IBQuery_Cad_AvaliadosID_AVL: TIBStringField
      FieldName = 'ID_AVL'
      Origin = 'CAD_FICHA_AVL.ID_AVL'
      Required = True
      FixedChar = True
    end
    object IBQuery_Cad_AvaliadosID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
      Origin = 'CAD_FICHA_AVL.ID_EXERCICIO'
      Required = True
    end
    object IBQuery_Cad_AvaliadosID_INSTRUTOR: TIBStringField
      FieldName = 'ID_INSTRUTOR'
      Origin = 'CAD_FICHA_AVL.ID_INSTRUTOR'
      Required = True
      FixedChar = True
    end
    object IBQuery_Cad_AvaliadosNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'CAD_FICHA_AVL.NOMECOMPLETO'
      Size = 120
    end
    object IBQuery_Cad_AvaliadosDATA_AVL: TDateTimeField
      FieldName = 'DATA_AVL'
      Origin = 'CAD_FICHA_AVL.DATA_AVL'
    end
    object IBQuery_Cad_AvaliadosLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'CAD_FICHA_AVL.LOCAL'
      Size = 50
    end
    object IBQuery_Cad_AvaliadosMEDIA: TIBBCDField
      FieldName = 'MEDIA'
      Origin = 'CAD_FICHA_AVL.MEDIA'
      DisplayFormat = '#.00'
      EditFormat = '#.00'
      Precision = 4
      Size = 2
    end
    object IBQuery_Cad_AvaliadosPARECER: TBlobField
      FieldName = 'PARECER'
      Origin = 'CAD_FICHA_AVL.PARECER'
      Size = 8
    end
    object IBQuery_Cad_AvaliadosNS: TIBStringField
      FieldName = 'NS'
      Origin = 'CAD_FICHA_AVL.NS'
      FixedChar = True
      Size = 1
    end
    object IBQuery_Cad_AvaliadosFICHACOMPLETA: TIBStringField
      FieldName = 'FICHACOMPLETA'
      Origin = 'CAD_FICHA_AVL.FICHACOMPLETA'
      FixedChar = True
      Size = 1
    end
  end
  object DSQ_Cad_Avaliados: TDataSource
    DataSet = IBQuery_Cad_Avaliados
    Left = 177
    Top = 270
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 294
    object Copiar1: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar1Click
    end
  end
  object IBQuery_MontaTurma: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select IdCurso, CodCurso, idTurma, Turma, ano, datainicio, datat' +
        'ermino, qdealunos, CodSala, Coordenador'
      'from TURMA_Todos_VIEW '
      'Where IdCurso = 139'
      'and     Ano <> '#39'BASE'#39
      'order by Turma desc')
    Left = 110
    Top = 240
    object IBQuery_MontaTurmaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'TURMA.IDCURSO'
      Required = True
    end
    object IBQuery_MontaTurmaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'TURMA.IDTURMA'
      Required = True
    end
    object IBQuery_MontaTurmaTURMA: TIBStringField
      FieldName = 'TURMA'
      Origin = 'TURMA.TURMA'
      Size = 15
    end
    object IBQuery_MontaTurmaANO: TIBStringField
      FieldName = 'ANO'
      Origin = 'TURMA.ANO'
      Required = True
      Size = 4
    end
    object IBQuery_MontaTurmaDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'TURMA.DATAINICIO'
    end
    object IBQuery_MontaTurmaDATATERMINO: TDateTimeField
      FieldName = 'DATATERMINO'
      Origin = 'TURMA.DATATERMINO'
    end
    object IBQuery_MontaTurmaCOORDENADOR: TIBStringField
      FieldName = 'COORDENADOR'
      Origin = 'TURMA.COORDENADOR'
      Size = 40
    end
    object IBQuery_MontaTurmaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TURMA.STATUS'
      FixedChar = True
      Size = 1
    end
    object IBQuery_MontaTurmaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TURMA.DESCRICAO'
      Size = 300
    end
    object IBQuery_MontaTurmaCODSALA: TIBStringField
      FieldName = 'CODSALA'
      Origin = 'TURMA.CODSALA'
      Size = 10
    end
  end
  object DST_MontaTurma: TDataSource
    DataSet = IBQuery_MontaTurma
    Left = 104
    Top = 271
  end
  object IBQuery_FichaAvaliacao: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DST_Cad_FichaAvl
    SQL.Strings = (
      
        'select  AREA_AVALIACAO, BOM, DESCRICAO, ID_ATCO, ID_AVL, ID_EXER' +
        'CICIO, ID_FICHA, ID_ITEM, IDCURSO, IDTURMA, NA, NS, OTIMO, REGUL' +
        'AR'
      'From PR_Avaliacao'
      'Where IDCURSO = :IDCURSO'
      'and      IDTURMA = :IDTURMA'
      'and      ID_FICHA = :ID_FICHA'
      'and      ID_ATCO = :ID_ATCO'
      'and      ID_EXERCICIO = :ID_EXERCICIO'
      
        'Order By IDCURSO, IDTURMA, ID_FICHA, ID_ATCO, ID_EXERCICIO, ID_I' +
        'TEM, Id_AVL')
    Left = 409
    Top = 384
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
        DataType = ftInteger
        Name = 'ID_FICHA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'ID_ATCO'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftInteger
        Name = 'ID_EXERCICIO'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQuery_FichaAvaliacaoAREA_AVALIACAO: TIBStringField
      FieldName = 'AREA_AVALIACAO'
      Origin = 'AVALIACAO.AREA_AVALIACAO'
      Size = 50
    end
    object IBQuery_FichaAvaliacaoBOM: TIBStringField
      FieldName = 'BOM'
      Origin = 'AVALIACAO.BOM'
      FixedChar = True
      Size = 1
    end
    object IBQuery_FichaAvaliacaoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'AVALIACAO.DESCRICAO'
      Size = 60
    end
    object IBQuery_FichaAvaliacaoID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
      Origin = 'AVALIACAO.ID_ATCO'
      Required = True
      FixedChar = True
    end
    object IBQuery_FichaAvaliacaoID_AVL: TIBStringField
      FieldName = 'ID_AVL'
      Origin = 'AVALIACAO.ID_AVL'
      Required = True
      FixedChar = True
    end
    object IBQuery_FichaAvaliacaoID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
      Origin = 'AVALIACAO.ID_EXERCICIO'
      Required = True
    end
    object IBQuery_FichaAvaliacaoID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
      Origin = 'AVALIACAO.ID_FICHA'
      Required = True
    end
    object IBQuery_FichaAvaliacaoID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Origin = 'AVALIACAO.ID_ITEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQuery_FichaAvaliacaoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'AVALIACAO.IDCURSO'
      Required = True
    end
    object IBQuery_FichaAvaliacaoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'AVALIACAO.IDTURMA'
      Required = True
    end
    object IBQuery_FichaAvaliacaoNA: TIBStringField
      FieldName = 'NA'
      Origin = 'AVALIACAO.NA'
      FixedChar = True
      Size = 1
    end
    object IBQuery_FichaAvaliacaoNS: TIBStringField
      FieldName = 'NS'
      Origin = 'AVALIACAO.NS'
      FixedChar = True
      Size = 1
    end
    object IBQuery_FichaAvaliacaoOTIMO: TIBStringField
      FieldName = 'OTIMO'
      Origin = 'AVALIACAO.OTIMO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_FichaAvaliacaoREGULAR: TIBStringField
      FieldName = 'REGULAR'
      Origin = 'AVALIACAO.REGULAR'
      FixedChar = True
      Size = 1
    end
  end
  object DSQ_Avaliacao: TDataSource
    DataSet = IBQuery_FichaAvaliacao
    Left = 449
    Top = 382
  end
  object IBTable_FichaAvaliacao: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
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
        Name = 'ID_FICHA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_ATCO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_EXERCICIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_ITEM'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_AVL'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OTIMO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BOM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REGULAR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AREA_AVALIACAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'PK_PR_AVALIACAO'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_ITEM;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO;ID_ITEM'
    MasterFields = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO;ID_ITEM'
    MasterSource = DSQ_Avaliacao
    StoreDefs = True
    TableName = 'PR_AVALIACAO'
    Left = 409
    Top = 422
    object IBTable_FichaAvaliacaoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Required = True
    end
    object IBTable_FichaAvaliacaoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Required = True
    end
    object IBTable_FichaAvaliacaoID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
      Required = True
    end
    object IBTable_FichaAvaliacaoID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
      Required = True
      FixedChar = True
    end
    object IBTable_FichaAvaliacaoID_AVL: TIBStringField
      FieldName = 'ID_AVL'
      Required = True
      FixedChar = True
    end
    object IBTable_FichaAvaliacaoID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
      Required = True
    end
    object IBTable_FichaAvaliacaoID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBTable_FichaAvaliacaoOTIMO: TIBStringField
      FieldName = 'OTIMO'
      FixedChar = True
      Size = 1
    end
    object IBTable_FichaAvaliacaoBOM: TIBStringField
      FieldName = 'BOM'
      FixedChar = True
      Size = 1
    end
    object IBTable_FichaAvaliacaoREGULAR: TIBStringField
      FieldName = 'REGULAR'
      FixedChar = True
      Size = 1
    end
    object IBTable_FichaAvaliacaoNS: TIBStringField
      FieldName = 'NS'
      FixedChar = True
      Size = 1
    end
    object IBTable_FichaAvaliacaoNA: TIBStringField
      FieldName = 'NA'
      FixedChar = True
      Size = 1
    end
    object IBTable_FichaAvaliacaoAREA_AVALIACAO: TIBStringField
      FieldName = 'AREA_AVALIACAO'
      Size = 50
    end
    object IBTable_FichaAvaliacaoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DST_FichaAvaliacao: TDataSource
    DataSet = IBTable_FichaAvaliacao
    Left = 449
    Top = 425
  end
  object IBTable_Cad_FichaAvl: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
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
        Name = 'ID_FICHA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_ATCO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_AVL'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_EXERCICIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_INSTRUTOR'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'DATA_AVL'
        DataType = ftDateTime
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MEDIA'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'PARECER'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'NS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FICHACOMPLETA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTAGIARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'PK_CAD_FICHA_AVL'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end
      item
        Name = 'CAD_FICHA_AVL_IDX1'
        Fields = 
          'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO;ID_INSTRUTO' +
          'R'
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO'
    MasterFields = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO'
    MasterSource = DSQ_Cad_Avaliados
    StoreDefs = True
    TableName = 'CAD_FICHA_AVL'
    Left = 401
    Top = 302
    object IBTable_Cad_FichaAvlIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_Cad_FichaAvlIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_Cad_FichaAvlID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable_Cad_FichaAvlID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_Cad_FichaAvlID_AVL: TIBStringField
      FieldName = 'ID_AVL'
    end
    object IBTable_Cad_FichaAvlID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
    end
    object IBTable_Cad_FichaAvlNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 120
    end
    object IBTable_Cad_FichaAvlDATA_AVL: TDateTimeField
      FieldName = 'DATA_AVL'
    end
    object IBTable_Cad_FichaAvlLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Size = 50
    end
    object IBTable_Cad_FichaAvlMEDIA: TIBBCDField
      FieldName = 'MEDIA'
      Precision = 4
      Size = 2
    end
    object IBTable_Cad_FichaAvlPARECER: TBlobField
      FieldName = 'PARECER'
      Size = 8
    end
    object IBTable_Cad_FichaAvlNS: TIBStringField
      FieldName = 'NS'
      Size = 1
    end
    object IBTable_Cad_FichaAvlID_INSTRUTOR: TIBStringField
      FieldName = 'ID_INSTRUTOR'
    end
    object IBTable_Cad_FichaAvlFICHACOMPLETA: TIBStringField
      FieldName = 'FICHACOMPLETA'
      Size = 1
    end
    object IBTable_Cad_FichaAvlESTAGIARIO: TIBStringField
      FieldName = 'ESTAGIARIO'
      Size = 1
    end
  end
  object IBTable_Cad_Avaliacao: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDCURSO'
        DataType = ftSmallint
      end
      item
        Name = 'IDTURMA'
        DataType = ftInteger
      end
      item
        Name = 'ID_FICHA'
        DataType = ftInteger
      end
      item
        Name = 'ID_ATCO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_EXERCICIO'
        DataType = ftInteger
      end
      item
        Name = 'ID_ITEM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_AVL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OTIMO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BOM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REGULAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AREA_AVALIACAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'PK_PR_AVALIACAO'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_ITEM;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    MasterSource = DSQ_Avaliacao
    StoreDefs = True
    TableName = 'PR_AVALIACAO'
    Left = 401
    Top = 334
    object IBTable_Cad_AvaliacaoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_Cad_AvaliacaoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_Cad_AvaliacaoID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable_Cad_AvaliacaoID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_Cad_AvaliacaoID_AVL: TIBStringField
      FieldName = 'ID_AVL'
    end
    object IBTable_Cad_AvaliacaoID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
    end
    object IBTable_Cad_AvaliacaoID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Size = 1
    end
    object IBTable_Cad_AvaliacaoOTIMO: TIBStringField
      FieldName = 'OTIMO'
      Size = 1
    end
    object IBTable_Cad_AvaliacaoBOM: TIBStringField
      FieldName = 'BOM'
      Size = 1
    end
    object IBTable_Cad_AvaliacaoREGULAR: TIBStringField
      FieldName = 'REGULAR'
      Size = 1
    end
    object IBTable_Cad_AvaliacaoNS: TIBStringField
      FieldName = 'NS'
      Size = 1
    end
    object IBTable_Cad_AvaliacaoNA: TIBStringField
      FieldName = 'NA'
      Size = 1
    end
    object IBTable_Cad_AvaliacaoAREA_AVALIACAO: TIBStringField
      FieldName = 'AREA_AVALIACAO'
      Size = 50
    end
    object IBTable_Cad_AvaliacaoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DST_Cad_Avaliacao: TDataSource
    DataSet = IBTable_Cad_Avaliacao
    Left = 433
    Top = 334
  end
  object DST_Cad_FichaAvl: TDataSource
    DataSet = IBTable_Cad_FichaAvl
    Left = 433
    Top = 302
  end
  object IBTable_instrutor: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDCURSO'
        DataType = ftSmallint
      end
      item
        Name = 'IDTURMA'
        DataType = ftInteger
      end
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGOINSTRUTOR'
        DataType = ftInteger
      end
      item
        Name = 'DATACHEGADA'
        DataType = ftDateTime
      end
      item
        Name = 'DATASAIDA'
        DataType = ftDateTime
      end
      item
        Name = 'FUNCAO'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'INSTITUTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'APRESENTACAO'
        DataType = ftDateTime
      end
      item
        Name = 'IDUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDSUBUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 125
      end
      item
        Name = 'FICHA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDANTIGUIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ATUALIZACAO'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PK_CAD_FICHA_AVL'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;ID_INSTRUTOR'
    MasterSource = DST_Cad_FichaAvl
    StoreDefs = True
    TableName = 'INSTRUTORTURMA'
    Left = 497
    Top = 302
    object IBTable_instrutorIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_instrutorIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_instrutorIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_instrutorCODIGOINSTRUTOR: TIntegerField
      FieldName = 'CODIGOINSTRUTOR'
    end
    object IBTable_instrutorFUNCAO: TIBStringField
      FieldName = 'FUNCAO'
      Size = 11
    end
    object IBTable_instrutorNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 125
    end
  end
  object IBTable_Aluno: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDCURSO'
        DataType = ftSmallint
      end
      item
        Name = 'IDTURMA'
        DataType = ftInteger
      end
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMORDEM'
        DataType = ftSmallint
      end
      item
        Name = 'POSTOGRADUACAO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'IDUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGOALUNO'
        DataType = ftInteger
      end
      item
        Name = 'NOTAFINAL'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'IDSUBUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATAMATRICULA'
        DataType = ftDateTime
      end
      item
        Name = 'MOTIVODESLIGAMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATADESLIGAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'IDANTIGUIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'REGISTRARVEICULO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INSTITUTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TIPO_ALUNO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 125
      end
      item
        Name = 'CHAMADA'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'PK_CAD_FICHA_AVL'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;ID_ATCO'
    MasterSource = DST_Cad_FichaAvl
    StoreDefs = True
    TableName = 'ALUNOTURMA'
    Left = 497
    Top = 334
    object IBTable_AlunoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_AlunoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_AlunoIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_AlunoNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 125
    end
    object IBTable_AlunoIDUNIDADE: TIBStringField
      FieldName = 'IDUNIDADE'
    end
    object IBTable_AlunoIDSUBUNIDADE: TIBStringField
      FieldName = 'IDSUBUNIDADE'
    end
  end
  object DST_AlunoTurma: TDataSource
    DataSet = IBTable_Aluno
    Left = 529
    Top = 334
  end
  object DST_Instrutor: TDataSource
    DataSet = IBTable_instrutor
    Left = 529
    Top = 302
  end
  object PopupMenu_Relatorio: TPopupMenu
    Left = 18
    Top = 260
    object ResumodasNotasdosAlunos1: TMenuItem
      Caption = 'Resumo das Notas dos Alunos'
    end
  end
end
