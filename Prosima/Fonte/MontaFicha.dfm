object Form_CriarModelo_Ficha: TForm_CriarModelo_Ficha
  Left = 442
  Top = 153
  Width = 1170
  Height = 637
  Caption = 'Avl Prosima - Criar Ficha Avalia'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar_BotoesIniciais: TToolBar
    Left = 0
    Top = 0
    Width = 1154
    Height = 54
    ButtonHeight = 47
    ButtonWidth = 60
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
    TabOrder = 0
    object ToolButton_Atualizar: TToolButton
      Left = 15
      Top = 2
      Hint = 'Atualiza a rela'#231#227'o de usu'#225'rios'
      Caption = 'Atualizar'
      ImageIndex = 0
      OnClick = ToolButton_AtualizarClick
    end
    object ToolButton5: TToolButton
      Left = 75
      Top = 2
      Width = 13
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton_Retornar: TToolButton
      Left = 88
      Top = 2
      Hint = 'Retornar para Janela anterior.'
      Caption = 'Retornar'
      ImageIndex = 3
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton1: TToolButton
      Left = 148
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton_Windows: TToolButton
      Left = 156
      Top = 2
      Hint = 'Sai do sistema e retorna para sistema operacional.'
      Caption = 'Windows'
      ImageIndex = 2
      OnClick = ToolButton_WindowsClick
    end
  end
  object DBGrid_Fichas: TDBGrid
    Left = 0
    Top = 54
    Width = 444
    Height = 545
    Align = alLeft
    Color = clCream
    DataSource = DSQ_Ficha_Avl
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
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
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 343
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 444
    Top = 54
    Width = 710
    Height = 545
    Align = alClient
    Color = 16444382
    TabOrder = 2
    object ToolBar11: TToolBar
      Left = 1
      Top = 1
      Width = 708
      Height = 53
      ButtonHeight = 47
      ButtonWidth = 58
      Caption = 'ToolBar_BotoesIniciais'
      Color = 16766640
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      object SpeedButton_Novo: TToolButton
        Left = 15
        Top = 2
        Hint = 'Insere um novo usu'#225'rio.'
        Caption = 'Inserir'
        ImageIndex = 5
        OnClick = SpeedButton_NovoClick
      end
      object SpeedButton_Altera: TToolButton
        Left = 73
        Top = 2
        Hint = 'Permite alterar os dados do usu'#225'rio selecionado.'
        Caption = 'Alterar'
        ImageIndex = 4
        OnClick = SpeedButton_AlteraClick
      end
      object SpeedButton_Exclui: TToolButton
        Left = 131
        Top = 2
        Hint = 'Exclui o usu'#225'rio selecionado.'
        Caption = 'Excluir'
        ImageIndex = 6
        OnClick = SpeedButton_ExcluiClick
      end
      object ToolButton2: TToolButton
        Left = 189
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 33
        Style = tbsSeparator
      end
      object SpeedButton_Grava: TToolButton
        Left = 197
        Top = 2
        Hint = 'Grava o '
        Caption = 'Gravar'
        ImageIndex = 31
        OnClick = SpeedButton_GravaClick
      end
      object SpeedButton_Cancel: TToolButton
        Left = 255
        Top = 2
        Hint = 'Cancela a inclus'#227'o ou altera'#231#227'o.'
        Caption = 'Cancelar'
        ImageIndex = 32
        OnClick = SpeedButton_CancelClick
      end
    end
    object Panel_Campos: TPanel
      Left = 1
      Top = 54
      Width = 708
      Height = 100
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object JvGradient2: TJvGradient
        Left = 0
        Top = 0
        Width = 708
        Height = 100
        Align = alClient
        Style = grVertical
        StartColor = 16766640
        EndColor = 16777190
        Steps = 35
      end
      object Label_Nome: TLabel
        Left = 8
        Top = 12
        Width = 44
        Height = 19
        Caption = 'Data: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label_Senha: TLabel
        Left = 8
        Top = 46
        Width = 80
        Height = 19
        Caption = 'Descri'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText1: TDBText
        Left = 0
        Top = 80
        Width = 44
        Height = 19
        Color = 10485760
        DataField = 'ID_ITEM'
        DataSource = DSQ_Ficha_Item
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 46
        Top = 80
        Width = 235
        Height = 19
        Color = 10485760
        DataField = 'AREA_AVALIACAO'
        DataSource = DSQ_Ficha_Item
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 283
        Top = 80
        Width = 414
        Height = 19
        Color = 10485760
        DataField = 'DESCRICAO'
        DataSource = DSQ_Ficha_Item
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object JvDBDateEdit_Data: TJvDBDateEdit
        Left = 54
        Top = 8
        Width = 144
        Height = 23
        DataField = 'DATA'
        DataSource = DST_FichaAvl
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Weekends = [Sun, Sat]
      end
      object DBEdit_Descricao: TDBEdit
        Left = 92
        Top = 42
        Width = 557
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'DESCRICAO'
        DataSource = DST_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object DBGrid_Ficha: TDBGrid
      Left = 1
      Top = 154
      Width = 708
      Height = 390
      Align = alClient
      Color = clCream
      DataSource = DSQ_Ficha_Item
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid_FichaDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_ITEM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AREA_AVALIACAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #193'rea Avalia'#231#227'o'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 235
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 414
          Visible = True
        end>
    end
    object Panel_Sel_area: TPanel
      Left = 128
      Top = 216
      Width = 370
      Height = 277
      Color = 15379315
      TabOrder = 3
      object ToolBar1: TToolBar
        Left = 1
        Top = 1
        Width = 368
        Height = 53
        ButtonHeight = 47
        ButtonWidth = 47
        Caption = 'ToolBar_BotoesIniciais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Images = DM.ImageList_Ensino
        Indent = 15
        ParentFont = False
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = True
        TabOrder = 0
        object ToolButton_InserirItem: TToolButton
          Left = 15
          Top = 2
          Hint = 'Insere um novo usu'#225'rio.'
          Caption = 'Inserir'
          ImageIndex = 5
          OnClick = ToolButton_InserirItemClick
        end
        object ToolButton3: TToolButton
          Left = 62
          Top = 2
          Width = 3
          Caption = 'ToolButton3'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object ToolButton_ExcluirItem: TToolButton
          Left = 65
          Top = 2
          Hint = 'Exclui o usu'#225'rio selecionado.'
          Caption = 'Excluir'
          ImageIndex = 6
          OnClick = ToolButton_ExcluirItemClick
        end
        object ToolButton7: TToolButton
          Left = 112
          Top = 2
          Width = 49
          Caption = 'ToolButton7'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton_FecharJanelaItem: TToolButton
          Left = 161
          Top = 2
          Caption = 'Fechar'
          ImageIndex = 3
          Visible = False
        end
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 54
        Width = 368
        Height = 222
        Align = alClient
        Color = clCream
        DataSource = DSQ_Item_Area
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'ID_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AREA_AVALIACAO'
            Title.Alignment = taCenter
            Title.Caption = #193'rea de Avalia'#231#227'o'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
  end
  object IBTable_FichaAvl: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_FICHA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PK_FICHA_AVL'
        Fields = 'ID_FICHA'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'ID_FICHA'
    MasterFields = 'ID_FICHA'
    MasterSource = DSQ_Ficha_Avl
    StoreDefs = True
    TableName = 'FICHA_AVL'
    Left = 145
    Top = 262
    object IBTable_FichaAvlID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable_FichaAvlDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object IBTable_FichaAvlDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object DST_FichaAvl: TDataSource
    DataSet = IBTable_FichaAvl
    Left = 177
    Top = 262
  end
  object IBQuery_Item_Area: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Item_area'
      'Order By Id_Item')
    Left = 169
    Top = 390
    object IBQuery_Item_AreaID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Origin = 'ITEM_AREA.ID_ITEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQuery_Item_AreaAREA_AVALIACAO: TIBStringField
      FieldName = 'AREA_AVALIACAO'
      Origin = 'ITEM_AREA.AREA_AVALIACAO'
      Size = 50
    end
  end
  object DSQ_Item_Area: TDataSource
    DataSet = IBQuery_Item_Area
    Left = 201
    Top = 390
  end
  object IBTable_Item_Avl: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_ITEM'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_AVL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'PK_ITEM_AVL'
        Fields = 'ID_ITEM;ID_AVL'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ITEM_AVL'
        Fields = 'ID_ITEM'
      end>
    IndexFieldNames = 'ID_ITEM'
    MasterFields = 'ID_ITEM'
    MasterSource = DSQ_Item_Area
    StoreDefs = True
    TableName = 'ITEM_AVL'
    Left = 177
    Top = 430
    object IBTable_Item_AvlID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBTable_Item_AvlID_AVL: TIntegerField
      FieldName = 'ID_AVL'
      Required = True
    end
    object IBTable_Item_AvlDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DST_Item_Area: TDataSource
    DataSet = IBTable_Item_Avl
    Left = 209
    Top = 430
  end
  object IBTable_Ficha_Item: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_FICHA'
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
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_FICHA_ITEM'
        Fields = 'ID_FICHA;ID_ITEM;ID_AVL'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'FICHA_ITEM'
    Left = 145
    Top = 310
    object IBTable_Ficha_ItemID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable_Ficha_ItemID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Size = 1
    end
    object IBTable_Ficha_ItemID_AVL: TIntegerField
      FieldName = 'ID_AVL'
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTable_Ficha_Item
    Left = 177
    Top = 310
  end
  object IBQuery_Ficha_Avl: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From FICHA_AVL'
      'Order By Data')
    Left = 145
    Top = 214
    object IBQuery_Ficha_AvlID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
      Origin = 'FICHA_AVL.ID_FICHA'
      Required = True
    end
    object IBQuery_Ficha_AvlDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'FICHA_AVL.DESCRICAO'
      Size = 100
    end
    object IBQuery_Ficha_AvlDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'FICHA_AVL.DATA'
    end
  end
  object DSQ_Ficha_Avl: TDataSource
    DataSet = IBQuery_Ficha_Avl
    Left = 177
    Top = 214
  end
  object IBQuery_Ficha_Item: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSQ_Ficha_Avl
    SQL.Strings = (
      'Select ID_FICHA, ID_ITEM, ID_AVL, Area_Avaliacao,  Descricao'
      'From Ficha_Item_View'
      'Where Id_Ficha = :Id_Ficha'
      'Order By  ID_ITEM, ID_AVL'
      '')
    Left = 185
    Top = 478
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_FICHA'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQuery_Ficha_ItemID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
      Origin = 'FICHA_ITEM_VIEW.ID_FICHA'
    end
    object IBQuery_Ficha_ItemID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Origin = 'FICHA_ITEM_VIEW.ID_ITEM'
      FixedChar = True
      Size = 1
    end
    object IBQuery_Ficha_ItemID_AVL: TIntegerField
      FieldName = 'ID_AVL'
      Origin = 'FICHA_ITEM_VIEW.ID_AVL'
    end
    object IBQuery_Ficha_ItemDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'FICHA_ITEM_VIEW.DESCRICAO'
      Size = 60
    end
    object IBQuery_Ficha_ItemAREA_AVALIACAO: TIBStringField
      FieldName = 'AREA_AVALIACAO'
      Origin = 'FICHA_ITEM_VIEW.AREA_AVALIACAO'
      Size = 50
    end
  end
  object DSQ_Ficha_Item: TDataSource
    DataSet = IBQuery_Ficha_Item
    Left = 217
    Top = 478
  end
end
