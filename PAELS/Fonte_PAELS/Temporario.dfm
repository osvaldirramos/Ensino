object Form_Ajuste: TForm_Ajuste
  Left = 118
  Top = 115
  Width = 1488
  Height = 750
  Caption = 'Form_Ajuste'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 96
    Top = 80
    Width = 432
    Height = 577
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCURSO'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTURMA'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FICHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ATCO'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_INSTRUTOR'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_EXERCICIO'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SETOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_AVL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEDIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARECER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FICHACOMPLETA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_INICIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEALUNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEINSTRUTOR'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 568
    Top = 32
    Width = 857
    Height = 625
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCURSO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTURMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FICHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ATCO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_INSTRUTOR'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_EXERCICIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SETOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_AVL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTIMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGULAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA_AVALIACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 336
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object IBTable1: TIBTable
    Database = DM.IBDatabase_Paels
    Transaction = DM.IBTransaction_Paels
    Active = True
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
        Name = 'ID_INSTRUTOR'
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
        Name = 'SETOR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
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
        Name = 'HORARIO_INICIO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NOMEALUNO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'NOMEINSTRUTOR'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <
      item
        Name = 'PK_CAD_FICHA_AVL'
        Fields = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_INSTRUTOR;ID_EXERCICIO;SETOR'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'CAD_FICHA_AVL'
    Left = 56
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 56
    Top = 48
  end
  object IBTable2: TIBTable
    Database = DM.IBDatabase_Paels
    Transaction = DM.IBTransaction_Paels
    Active = True
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
        Name = 'ID_INSTRUTOR'
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
        Attributes = [faRequired]
        DataType = ftInteger
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
      end
      item
        Name = 'SETOR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'PK_PR_AVALIACAO'
        Fields = 
          'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_INSTRUTOR;ID_EXERCICIO;ID_IT' +
          'EM;ID_AVL'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_INSTRUTOR;ID_EXERCICIO'
    MasterFields = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_INSTRUTOR;ID_EXERCICIO'
    MasterSource = DataSource1
    StoreDefs = True
    TableName = 'PR_AVALIACAO'
    Left = 56
    Top = 120
    object IBTable2IDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable2IDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable2ID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable2ID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable2ID_INSTRUTOR: TIBStringField
      FieldName = 'ID_INSTRUTOR'
    end
    object IBTable2ID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
    end
    object IBTable2ID_ITEM: TIBStringField
      FieldName = 'ID_ITEM'
      Size = 1
    end
    object IBTable2ID_AVL: TIntegerField
      FieldName = 'ID_AVL'
    end
    object IBTable2OTIMO: TIBStringField
      FieldName = 'OTIMO'
      Size = 1
    end
    object IBTable2BOM: TIBStringField
      FieldName = 'BOM'
      Size = 1
    end
    object IBTable2REGULAR: TIBStringField
      FieldName = 'REGULAR'
      Size = 1
    end
    object IBTable2NS: TIBStringField
      FieldName = 'NS'
      Size = 1
    end
    object IBTable2NA: TIBStringField
      FieldName = 'NA'
      Size = 1
    end
    object IBTable2AREA_AVALIACAO: TIBStringField
      FieldName = 'AREA_AVALIACAO'
      Size = 50
    end
    object IBTable2DESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBTable2SETOR: TIBStringField
      FieldName = 'SETOR'
      Required = True
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = IBTable2
    Left = 56
    Top = 152
  end
end
