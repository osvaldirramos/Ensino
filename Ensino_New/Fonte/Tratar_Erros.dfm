object Form_Tratar_Erros: TForm_Tratar_Erros
  Left = 2061
  Top = 46
  Width = 1088
  Height = 750
  Caption = 'Form_Tratar_Erros'
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
    DataSource = DST_Gabarito_SVD
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 56
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Abrir Tabelas'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object IBTable_Gabarito_Local: TIBTable
    Database = DM.IBDatabase_Local
    Transaction = DM.IBTransaction_Local
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
        Name = 'NUMITEM'
        DataType = ftInteger
      end
      item
        Name = 'FASEAPLICACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REFERENCIAAVALIACAO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CODMATERIA'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'MATERIA'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NUMEROQUESTAO'
        DataType = ftSmallint
      end
      item
        Name = 'QUESTAOANULADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUESTAOIRREGULAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAB'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAD'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INDICEFACILIDADE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'REVISAO'
        DataType = ftString
        Size = 1
      end>
    Filter = 'idcurso = 200'
    Filtered = True
    IndexDefs = <
      item
        Name = 'ITEMTESTE_PK'
        Fields = 
          'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;NUM' +
          'EROQUESTAO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ITEMTESTE'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
      end>
    StoreDefs = True
    TableName = 'ITEMTESTE'
    Left = 315
    Top = 8
    object IBTable_Gabarito_LocalIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_Gabarito_LocalIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_Gabarito_LocalNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
    end
    object IBTable_Gabarito_LocalFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Size = 1
    end
    object IBTable_Gabarito_LocalREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Size = 3
    end
    object IBTable_Gabarito_LocalCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Size = 6
    end
    object IBTable_Gabarito_LocalMATERIA: TIBStringField
      FieldName = 'MATERIA'
      Size = 6
    end
    object IBTable_Gabarito_LocalNUMEROQUESTAO: TSmallintField
      FieldName = 'NUMEROQUESTAO'
    end
    object IBTable_Gabarito_LocalQUESTAOANULADA: TIBStringField
      FieldName = 'QUESTAOANULADA'
      Size = 1
    end
    object IBTable_Gabarito_LocalQUESTAOIRREGULAR: TIBStringField
      FieldName = 'QUESTAOIRREGULAR'
      Size = 1
    end
    object IBTable_Gabarito_LocalALTERNATIVACORRETAA: TIBStringField
      FieldName = 'ALTERNATIVACORRETAA'
      Size = 1
    end
    object IBTable_Gabarito_LocalALTERNATIVACORRETAB: TIBStringField
      FieldName = 'ALTERNATIVACORRETAB'
      Size = 1
    end
    object IBTable_Gabarito_LocalALTERNATIVACORRETAC: TIBStringField
      FieldName = 'ALTERNATIVACORRETAC'
      Size = 1
    end
    object IBTable_Gabarito_LocalALTERNATIVACORRETAD: TIBStringField
      FieldName = 'ALTERNATIVACORRETAD'
      Size = 1
    end
    object IBTable_Gabarito_LocalALTERNATIVACORRETAE: TIBStringField
      FieldName = 'ALTERNATIVACORRETAE'
      Size = 1
    end
    object IBTable_Gabarito_LocalINDICEFACILIDADE: TIBStringField
      FieldName = 'INDICEFACILIDADE'
      Size = 1
    end
    object IBTable_Gabarito_LocalUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object IBTable_Gabarito_LocalREVISAO: TIBStringField
      FieldName = 'REVISAO'
      Size = 1
    end
  end
  object DST_Gabarito: TDataSource
    DataSet = IBTable_Gabarito_Local
    Left = 312
    Top = 47
  end
  object IBTable_Gabarito_Svd: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
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
        Name = 'NUMITEM'
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
        Name = 'MATERIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NUMEROQUESTAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'QUESTAOANULADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUESTAOIRREGULAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAB'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAD'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INDICEFACILIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'REVISAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    Filter = 'idcurso = 200'
    Filtered = True
    IndexDefs = <
      item
        Name = 'ITEMTESTE_PK'
        Fields = 
          'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;NUM' +
          'EROQUESTAO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ITEMTESTE'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
      end>
    StoreDefs = True
    TableName = 'ITEMTESTE'
    Left = 467
    Top = 8
    object IBTable_Gabarito_SvdIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_Gabarito_SvdIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_Gabarito_SvdNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
    end
    object IBTable_Gabarito_SvdFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Size = 1
    end
    object IBTable_Gabarito_SvdREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Size = 3
    end
    object IBTable_Gabarito_SvdCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Size = 6
    end
    object IBTable_Gabarito_SvdMATERIA: TIBStringField
      FieldName = 'MATERIA'
      Size = 6
    end
    object IBTable_Gabarito_SvdNUMEROQUESTAO: TSmallintField
      FieldName = 'NUMEROQUESTAO'
    end
    object IBTable_Gabarito_SvdQUESTAOANULADA: TIBStringField
      FieldName = 'QUESTAOANULADA'
      Size = 1
    end
    object IBTable_Gabarito_SvdQUESTAOIRREGULAR: TIBStringField
      FieldName = 'QUESTAOIRREGULAR'
      Size = 1
    end
    object IBTable_Gabarito_SvdALTERNATIVACORRETAA: TIBStringField
      FieldName = 'ALTERNATIVACORRETAA'
      Size = 1
    end
    object IBTable_Gabarito_SvdALTERNATIVACORRETAB: TIBStringField
      FieldName = 'ALTERNATIVACORRETAB'
      Size = 1
    end
    object IBTable_Gabarito_SvdALTERNATIVACORRETAC: TIBStringField
      FieldName = 'ALTERNATIVACORRETAC'
      Size = 1
    end
    object IBTable_Gabarito_SvdALTERNATIVACORRETAD: TIBStringField
      FieldName = 'ALTERNATIVACORRETAD'
      Size = 1
    end
    object IBTable_Gabarito_SvdALTERNATIVACORRETAE: TIBStringField
      FieldName = 'ALTERNATIVACORRETAE'
      Size = 1
    end
    object IBTable_Gabarito_SvdINDICEFACILIDADE: TIBStringField
      FieldName = 'INDICEFACILIDADE'
      Size = 1
    end
    object IBTable_Gabarito_SvdUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object IBTable_Gabarito_SvdREVISAO: TIBStringField
      FieldName = 'REVISAO'
      Size = 1
    end
  end
  object DST_Gabarito_SVD: TDataSource
    DataSet = IBTable_Gabarito_Svd
    Left = 464
    Top = 47
  end
end
