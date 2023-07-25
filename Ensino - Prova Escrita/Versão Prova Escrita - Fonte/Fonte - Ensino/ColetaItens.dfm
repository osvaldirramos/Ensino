object Form_ColetaItens: TForm_ColetaItens
  Left = 383
  Top = 462
  Cursor = crHourGlass
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Ensino --> Rela'#231#227'o de Itens'
  ClientHeight = 94
  ClientWidth = 671
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000FFF
    FFFFFFF8BBBBBBB8FFFFFFFFFF000FFFFFFFFBBBB77887BBBBFFFFFFFF000FFF
    FFFBBB8888FF88888BB8FFFFFF000FFFFFBB7E888EEEEE88887BBFFFFF000FFF
    FBBEFE777788888778FEBBFFFF000FFFBBE88E88888788888E8FEB8FFF000FF8
    BEFEE86F88F78FF8E8E8F7BFFF000FFB788E8EC788878886CC8E88BBFF000F8B
    E8E8ECEC8888887CECE8EE8BFF000FBB88EECECC688888CCCECEE88BFF000FB7
    8E8CEECEC87786CECE6C8887BF000FB88EECECECC883FCC6ECECEEF8BF0008B8
    8EECECECCECCCECCECCCEE88BF0008BE8EECCC8EEF8CCCE88E8CE888BF0008BE
    E8688F8CEC8F8CE8888CE8E7BF0008BEE8E7C88CE77E88E8876E68E8BF0008BE
    EEE66CEEECCCC6CEEEECEEE8BF0008BEEE867CE8C8EE88C6ECC88EE8BF0008BE
    EE8C68EEEE88EECECECC8EE8BF0008BEEEE8EEECEE776EECEEC8EEE8BF0008BE
    EEEE8ECECC787CCEECE8EEE8BF0008BEEEEE8ECCEC898EECCE8EEEE8BF0008BE
    EEEEEE8CCC888CCC88EEEEE8BF0008BEEEEEEEE88E8F8E88EEEEEEE8BF0008BE
    8888888888E8E888888888E8BF0008B7777777777777777777777777BF0008BC
    CCC3CCCC88C8FEC88FCFCE86BF0008BCC63336CC88EF6FCFEECFFFE6BF0008BC
    6336336C888FCCCF88C88FC7BF0008BC3666663C88CFFFCF88CCF8C6BF0008B6
    666666666666666666666667BF0008BBBBBBBBBBBBBBBBBBBBBBBBBBBF008000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    000380000003800000038000000380000003800000038000000380000003}
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object JvGradient3: TJvGradient
    Left = 0
    Top = 0
    Width = 671
    Height = 94
    Align = alClient
    Style = grMount
    StartColor = clYellow
    EndColor = clWhite
    Steps = 59
  end
  object JvBlinkingLabel1: TJvBlinkingLabel
    Left = 6
    Top = 28
    Width = 649
    Height = 37
    AutoSize = False
    Caption = 'Aguarde enquanto monta a rela'#231#227'o de Itens'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Ravie'
    Font.Style = []
    ParentFont = False
    Transparent = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object Documento: TJvDBRichEdit
    Left = 16
    Top = 137
    Width = 896
    Height = 303
    DataField = 'DESCENALT'
    DataSource = DST_ItemDesc
    TabOrder = 0
    Visible = False
  end
  object IBQuery_Documento: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select doc, Descricao from Documento'
      'where codigo = 1'
      '')
    Left = 56
    Top = 17
    object IBQuery_DocumentoDOC: TIBStringField
      FieldName = 'DOC'
      Origin = 'DOCUMENTO.DOC'
      Required = True
      Size = 100
    end
    object IBQuery_DocumentoDESCRICAO: TBlobField
      FieldName = 'DESCRICAO'
      Origin = 'DOCUMENTO.DESCRICAO'
      Size = 8
    end
  end
  object DSQ_Documentacao: TDataSource
    DataSet = IBQuery_Documento
    Left = 88
    Top = 17
  end
  object IBQuery_Item: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'select  IdCurso, IdTurma, NumItem, CodMateria, Disciplina, Unida' +
        'de, SubUnidade, Objetivo, Serie, Status'
      'From Item_Prova'
      'where idCurso = :idCurso'
      'and IdTurma= :IdTurma'
      'and codMateria = :codMateria'
      ' Order By disciplina,unidade,subunidade,objetivo,serie')
    Left = 128
    Top = 16
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
        Size = 7
      end>
    object IBQuery_ItemIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ITEM.IDCURSO'
      Required = True
    end
    object IBQuery_ItemIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ITEM_PROVA.IDTURMA'
      Required = True
    end
    object IBQuery_ItemNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'ITEM.NUMITEM'
      Required = True
    end
    object IBQuery_ItemCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'ITEM.CODMATERIA'
      Required = True
      Size = 7
    end
    object IBQuery_ItemDISCIPLINA: TIBStringField
      FieldName = 'DISCIPLINA'
      Origin = 'ITEM.DISCIPLINA'
      Required = True
      Size = 2
    end
    object IBQuery_ItemUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'ITEM.UNIDADE'
      Required = True
      Size = 2
    end
    object IBQuery_ItemSUBUNIDADE: TIBStringField
      FieldName = 'SUBUNIDADE'
      Origin = 'ITEM.SUBUNIDADE'
      Required = True
      Size = 2
    end
    object IBQuery_ItemOBJETIVO: TIBStringField
      FieldName = 'OBJETIVO'
      Origin = 'ITEM.OBJETIVO'
      Required = True
      Size = 1
    end
    object IBQuery_ItemSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ITEM.SERIE'
      Required = True
      Size = 2
    end
    object IBQuery_ItemSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ITEM_PROVA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery_Item
    Left = 159
    Top = 17
  end
  object IBTable_Item_Desc: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NUMITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RESPOSTACORRETA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QDEAPLIC'
        DataType = ftSmallint
      end
      item
        Name = 'QDEIRREGULARIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'QDEANULADA'
        DataType = ftSmallint
      end
      item
        Name = 'NLINHAS'
        DataType = ftSmallint
      end
      item
        Name = 'POSSUI_IMAGEM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RECURSO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TEMPORES'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DESCENALT'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'PK_ITEM_DESC'
        Fields = 'NUMITEM'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'NUMITEM'
    MasterFields = 'NUMITEM'
    MasterSource = DataSource1
    StoreDefs = True
    TableName = 'ITEM_DESC'
    Left = 232
    Top = 13
    object IBTable_Item_DescNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
    end
    object IBTable_Item_DescRESPOSTACORRETA: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Size = 1
    end
    object IBTable_Item_DescQDEAPLIC: TSmallintField
      FieldName = 'QDEAPLIC'
    end
    object IBTable_Item_DescQDEIRREGULARIDADE: TSmallintField
      FieldName = 'QDEIRREGULARIDADE'
    end
    object IBTable_Item_DescQDEANULADA: TSmallintField
      FieldName = 'QDEANULADA'
    end
    object IBTable_Item_DescPOSSUI_IMAGEM: TIBStringField
      FieldName = 'POSSUI_IMAGEM'
      Size = 1
    end
    object IBTable_Item_DescRECURSO: TIBStringField
      FieldName = 'RECURSO'
      Size = 1
    end
    object IBTable_Item_DescOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object IBTable_Item_DescDESCENALT: TBlobField
      FieldName = 'DESCENALT'
      Size = 8
    end
    object IBTable_Item_DescNLINHAS: TSmallintField
      FieldName = 'NLINHAS'
    end
    object IBTable_Item_DescTEMPORES: TIBStringField
      FieldName = 'TEMPORES'
      Size = 4
    end
  end
  object DST_ItemDesc: TDataSource
    DataSet = IBTable_Item_Desc
    Left = 260
    Top = 17
  end
end
