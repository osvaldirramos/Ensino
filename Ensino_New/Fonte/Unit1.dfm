object Form1: TForm1
  Left = 275
  Top = 388
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
  object DBGrid1: TDBGrid
    Left = 16
    Top = 88
    Width = 1041
    Height = 305
    DataSource = DST_Gabarito
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 32
    Top = 424
    Width = 1009
    Height = 257
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object IBTable_Gabarito: TIBTable
    Database = DM.IBDatabase_Local
    Transaction = DM.IBTransaction_Local
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
        Name = 'GABARITO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMEROQUESTAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMITEM'
        DataType = ftInteger
      end
      item
        Name = 'QUESTAO'
        DataType = ftInteger
      end>
    Filter = 'idcurso = 200'
    Filtered = True
    IndexDefs = <
      item
        Name = 'PK_GABARITOPROVA'
        Fields = 
          'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;GAB' +
          'ARITO;NUMEROQUESTAO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_GABARITOPROVA'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
      end>
    StoreDefs = True
    TableName = 'GABARITOPROVA'
    Left = 315
    Top = 8
  end
  object DST_Gabarito: TDataSource
    DataSet = IBTable_Gabarito
    Left = 312
    Top = 47
  end
  object IBTable1: TIBTable
    Database = DM.IBDatabase_Local
    Transaction = DM.IBTransaction_Local
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
        Name = 'GABARITO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMEROQUESTAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMITEM'
        DataType = ftInteger
      end
      item
        Name = 'QUESTAO'
        DataType = ftInteger
      end>
    Filter = 'idcurso = 200'
    Filtered = True
    IndexDefs = <
      item
        Name = 'PK_GABARITOPROVA'
        Fields = 
          'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;GAB' +
          'ARITO;NUMEROQUESTAO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_GABARITOPROVA'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
      end>
    StoreDefs = True
    TableName = 'GABARITOPROVA'
    Left = 467
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 464
    Top = 47
  end
end
