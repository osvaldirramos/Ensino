object Form_CalcularMedia: TForm_CalcularMedia
  Left = 230
  Top = 53
  Width = 1153
  Height = 859
  Caption = 'Calcular M'#233'dia'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 56
    Width = 657
    Height = 297
    DataSource = DSQ_AlunoTurma
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 376
    Width = 681
    Height = 177
    DataSource = DSQ_RelacaoAlunosMedia
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button_AnalizarAlunosSemMedia: TButton
    Left = 200
    Top = 16
    Width = 137
    Height = 25
    Caption = 'Analizar Alunos sem M'#233'dia'
    TabOrder = 3
    OnClick = Button_AnalizarAlunosSemMediaClick
  end
  object DBGrid3: TDBGrid
    Left = 16
    Top = 640
    Width = 641
    Height = 57
    DataSource = DST_Instrutor
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 16
    Top = 568
    Width = 641
    Height = 57
    DataSource = DST_Aluno
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 720
    Width = 240
    Height = 25
    DataSource = DST_Aluno
    TabOrder = 6
  end
  object DBGrid5: TDBGrid
    Left = 736
    Top = 56
    Width = 353
    Height = 529
    DataSource = DSQ_CadFichaAvl
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid6: TDBGrid
    Left = 728
    Top = 600
    Width = 353
    Height = 57
    DataSource = DataSource2
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid7: TDBGrid
    Left = 728
    Top = 664
    Width = 353
    Height = 57
    DataSource = DataSource3
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 840
    Top = 24
    Width = 145
    Height = 25
    Caption = 'Parecer-> CadFichaAvl'
    TabOrder = 10
    OnClick = Button2Click
  end
  object DBRichEdit1: TDBRichEdit
    Left = 728
    Top = 728
    Width = 377
    Height = 89
    DataField = 'PARECER'
    DataSource = DataSource3
    TabOrder = 11
  end
  object DBMemo1: TDBMemo
    Left = 488
    Top = 720
    Width = 185
    Height = 89
    DataField = 'PARECER'
    DataSource = DataSource3
    TabOrder = 12
  end
  object IBQuery_AlunoTurma: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select al.IdCurso, Al.IdTurma, al.Identidade, notafinal'
      'From  AlunoTurma_view  al'
      'Where Al.IdCurso = 139'
      'Order By Al.IdTurma')
    Left = 209
    Top = 105
    object IBQuery_AlunoTurmaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ALUNOTURMA_VIEW.IDCURSO'
    end
    object IBQuery_AlunoTurmaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ALUNOTURMA_VIEW.IDTURMA'
    end
    object IBQuery_AlunoTurmaIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Origin = 'ALUNOTURMA_VIEW.IDENTIDADE'
      FixedChar = True
    end
    object IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField
      FieldName = 'NOTAFINAL'
      Origin = 'ALUNOTURMA_VIEW.NOTAFINAL'
      DisplayFormat = '##.00'
      Precision = 9
      Size = 2
    end
  end
  object DSQ_AlunoTurma: TDataSource
    DataSet = IBQuery_AlunoTurma
    Left = 208
    Top = 138
  end
  object IBQuery_RelacaoAlunosMedia: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_AlunoTurma
    SQL.Strings = (
      'Select * From cad_ficha_avl'
      'Where IdCurso = :IdCurso'
      'and IdTurma = :IdTurma'
      'And Id_Atco = :Identidade'
      'Order by IdTurma, Id_Atco, Id_Exercicio')
    Left = 254
    Top = 144
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
        DataType = ftFixedChar
        Name = 'IDENTIDADE'
        ParamType = ptUnknown
        Size = 21
      end>
    object IBQuery_RelacaoAlunosMediaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'CAD_FICHA_AVL.IDCURSO'
      Required = True
    end
    object IBQuery_RelacaoAlunosMediaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'CAD_FICHA_AVL.IDTURMA'
      Required = True
    end
    object IBQuery_RelacaoAlunosMediaID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
      Origin = 'CAD_FICHA_AVL.ID_FICHA'
      Required = True
    end
    object IBQuery_RelacaoAlunosMediaID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
      Origin = 'CAD_FICHA_AVL.ID_ATCO'
      Required = True
      FixedChar = True
    end
    object IBQuery_RelacaoAlunosMediaID_AVL: TIBStringField
      FieldName = 'ID_AVL'
      Origin = 'CAD_FICHA_AVL.ID_AVL'
      Required = True
      FixedChar = True
    end
    object IBQuery_RelacaoAlunosMediaID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
      Origin = 'CAD_FICHA_AVL.ID_EXERCICIO'
      Required = True
    end
    object IBQuery_RelacaoAlunosMediaID_INSTRUTOR: TIBStringField
      FieldName = 'ID_INSTRUTOR'
      Origin = 'CAD_FICHA_AVL.ID_INSTRUTOR'
      Required = True
      FixedChar = True
    end
    object IBQuery_RelacaoAlunosMediaNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'CAD_FICHA_AVL.NOMECOMPLETO'
      Size = 120
    end
    object IBQuery_RelacaoAlunosMediaDATA_AVL: TDateTimeField
      FieldName = 'DATA_AVL'
      Origin = 'CAD_FICHA_AVL.DATA_AVL'
    end
    object IBQuery_RelacaoAlunosMediaLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'CAD_FICHA_AVL.LOCAL'
      Size = 50
    end
    object IBQuery_RelacaoAlunosMediaMEDIA: TIBBCDField
      FieldName = 'MEDIA'
      Origin = 'CAD_FICHA_AVL.MEDIA'
      Precision = 4
      Size = 2
    end
    object IBQuery_RelacaoAlunosMediaPARECER: TBlobField
      FieldName = 'PARECER'
      Origin = 'CAD_FICHA_AVL.PARECER'
      Size = 8
    end
    object IBQuery_RelacaoAlunosMediaNS: TIBStringField
      FieldName = 'NS'
      Origin = 'CAD_FICHA_AVL.NS'
      FixedChar = True
      Size = 1
    end
    object IBQuery_RelacaoAlunosMediaFICHACOMPLETA: TIBStringField
      FieldName = 'FICHACOMPLETA'
      Origin = 'CAD_FICHA_AVL.FICHACOMPLETA'
      FixedChar = True
      Size = 1
    end
  end
  object DSQ_RelacaoAlunosMedia: TDataSource
    DataSet = IBQuery_RelacaoAlunosMedia
    Left = 288
    Top = 144
  end
  object IBTable_instrutor: TIBTable
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
        Name = 'IDENTIDADE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGOINSTRUTOR'
        Attributes = [faRequired]
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
      end
      item
        Name = 'TIPO_INSTRUTOR'
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <
      item
        Name = 'FK_INSTRUTORTURMA'
        Fields = 'IDENTIDADE'
      end
      item
        Name = 'FK_INSTRUTORTURMA_TURMA'
        Fields = 'IDCURSO;IDTURMA'
      end
      item
        Name = 'INSTRUTORTURMA_PK'
        Fields = 'IDCURSO;IDTURMA;IDENTIDADE;CODIGOINSTRUTOR'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterSource = DSQ_AlunoTurma
    StoreDefs = True
    TableName = 'INSTRUTORTURMA'
    Left = 385
    Top = 118
    object IBTable_instrutorIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_instrutorIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_instrutorIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_instrutorFUNCAO: TIBStringField
      FieldName = 'FUNCAO'
      Size = 11
    end
    object IBTable_instrutorNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 125
    end
    object IBTable_instrutorCODIGOINSTRUTOR: TIntegerField
      FieldName = 'CODIGOINSTRUTOR'
      Required = True
    end
  end
  object DST_Instrutor: TDataSource
    DataSet = IBTable_instrutor
    Left = 417
    Top = 118
  end
  object IBTable_AlunoTurma: TIBTable
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
        Name = 'IDENTIDADE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMORDEM'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'POSTOGRADUACAO'
        Attributes = [faFixed]
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
        Attributes = [faFixed]
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
        Attributes = [faFixed]
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
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RESTRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESTAGIARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'ALUNOTURMA_PK'
        Fields = 'IDCURSO;IDTURMA;IDENTIDADE'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ALUNOTURMA'
        Fields = 'IDENTIDADE'
      end
      item
        Name = 'ALUNOTURMA_IDX_IDANTIGUIDADE'
        Fields = 'IDANTIGUIDADE'
      end
      item
        Name = 'ALUNOTURMA_NUMORDEM_IDX'
        Fields = 'NUMORDEM'
      end
      item
        Name = 'FK_ALUNOTURMA_TURMA'
        Fields = 'IDCURSO;IDTURMA'
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterSource = DSQ_AlunoTurma
    StoreDefs = True
    TableName = 'ALUNOTURMA'
    Left = 385
    Top = 158
    object SmallintField1: TSmallintField
      DisplayWidth = 12
      FieldName = 'IDCURSO'
    end
    object IntegerField1: TIntegerField
      DisplayWidth = 12
      FieldName = 'IDTURMA'
    end
    object IBStringField1: TIBStringField
      DisplayWidth = 24
      FieldName = 'IDENTIDADE'
    end
    object IBStringField3: TIBStringField
      DisplayWidth = 34
      FieldName = 'NOMECOMPLETO'
      Size = 125
    end
  end
  object DST_Aluno: TDataSource
    DataSet = IBTable_AlunoTurma
    Left = 417
    Top = 158
  end
  object IBQuery_CadFichaAvl: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * from Cad_Ficha_Avl'
      'Where Id_Exercicio <> '#39'997'#39
      'and      Id_Exercicio <> '#39'998'#39
      'and      Id_Exercicio <> '#39'999'#39)
    Left = 745
    Top = 73
    object IBQuery_CadFichaAvlIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'CAD_FICHA_AVL.IDCURSO'
      Required = True
    end
    object IBQuery_CadFichaAvlIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'CAD_FICHA_AVL.IDTURMA'
      Required = True
    end
    object IBQuery_CadFichaAvlID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
      Origin = 'CAD_FICHA_AVL.ID_FICHA'
      Required = True
    end
    object IBQuery_CadFichaAvlID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
      Origin = 'CAD_FICHA_AVL.ID_ATCO'
      Required = True
      FixedChar = True
    end
    object IBQuery_CadFichaAvlID_AVL: TIBStringField
      FieldName = 'ID_AVL'
      Origin = 'CAD_FICHA_AVL.ID_AVL'
      Required = True
      FixedChar = True
    end
    object IBQuery_CadFichaAvlID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
      Origin = 'CAD_FICHA_AVL.ID_EXERCICIO'
      Required = True
    end
    object IBQuery_CadFichaAvlID_INSTRUTOR: TIBStringField
      FieldName = 'ID_INSTRUTOR'
      Origin = 'CAD_FICHA_AVL.ID_INSTRUTOR'
      Required = True
      FixedChar = True
    end
    object IBQuery_CadFichaAvlNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'CAD_FICHA_AVL.NOMECOMPLETO'
      Size = 120
    end
    object IBQuery_CadFichaAvlDATA_AVL: TDateTimeField
      FieldName = 'DATA_AVL'
      Origin = 'CAD_FICHA_AVL.DATA_AVL'
    end
    object IBQuery_CadFichaAvlLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'CAD_FICHA_AVL.LOCAL'
      Size = 50
    end
    object IBQuery_CadFichaAvlMEDIA: TIBBCDField
      FieldName = 'MEDIA'
      Origin = 'CAD_FICHA_AVL.MEDIA'
      Precision = 4
      Size = 2
    end
    object IBQuery_CadFichaAvlPARECER: TBlobField
      FieldName = 'PARECER'
      Origin = 'CAD_FICHA_AVL.PARECER'
      Size = 8
    end
    object IBQuery_CadFichaAvlNS: TIBStringField
      FieldName = 'NS'
      Origin = 'CAD_FICHA_AVL.NS'
      FixedChar = True
      Size = 1
    end
    object IBQuery_CadFichaAvlFICHACOMPLETA: TIBStringField
      FieldName = 'FICHACOMPLETA'
      Origin = 'CAD_FICHA_AVL.FICHACOMPLETA'
      FixedChar = True
      Size = 1
    end
    object IBQuery_CadFichaAvlESTAGIARIO: TIBStringField
      FieldName = 'ESTAGIARIO'
      Origin = 'CAD_FICHA_AVL.ESTAGIARIO'
      FixedChar = True
      Size = 1
    end
  end
  object DSQ_CadFichaAvl: TDataSource
    DataSet = IBQuery_CadFichaAvl
    Left = 744
    Top = 106
  end
  object IBTable_CadFichaAvl: TIBTable
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
    IndexFieldNames = 
      'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO;ID_INSTRUTO' +
      'R'
    MasterFields = 
      'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO;ID_INSTRUTO' +
      'R'
    MasterSource = DSQ_CadFichaAvl
    StoreDefs = True
    TableName = 'CAD_FICHA_AVL'
    Left = 785
    Top = 70
    object IBTable_CadFichaAvlIDCURSO: TSmallintField
      DisplayWidth = 12
      FieldName = 'IDCURSO'
    end
    object IBTable_CadFichaAvlIDTURMA: TIntegerField
      DisplayWidth = 12
      FieldName = 'IDTURMA'
    end
    object IBTable_CadFichaAvlID_FICHA: TIntegerField
      DisplayWidth = 12
      FieldName = 'ID_FICHA'
    end
    object IBTable_CadFichaAvlID_ATCO: TIBStringField
      DisplayWidth = 24
      FieldName = 'ID_ATCO'
    end
    object IBTable_CadFichaAvlID_AVL: TIBStringField
      DisplayWidth = 24
      FieldName = 'ID_AVL'
    end
    object IBTable_CadFichaAvlID_EXERCICIO: TIntegerField
      DisplayWidth = 15
      FieldName = 'ID_EXERCICIO'
    end
    object IBTable_CadFichaAvlID_INSTRUTOR: TIBStringField
      DisplayWidth = 24
      FieldName = 'ID_INSTRUTOR'
    end
    object IBTable_CadFichaAvlNOMECOMPLETO: TIBStringField
      DisplayWidth = 144
      FieldName = 'NOMECOMPLETO'
      Size = 120
    end
    object IBTable_CadFichaAvlDATA_AVL: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DATA_AVL'
    end
    object IBTable_CadFichaAvlLOCAL: TIBStringField
      DisplayWidth = 60
      FieldName = 'LOCAL'
      Size = 50
    end
    object IBTable_CadFichaAvlMEDIA: TIBBCDField
      DisplayWidth = 7
      FieldName = 'MEDIA'
      Precision = 4
      Size = 2
    end
    object IBTable_CadFichaAvlPARECER: TBlobField
      DisplayWidth = 12
      FieldName = 'PARECER'
      Size = 8
    end
    object IBTable_CadFichaAvlNS: TIBStringField
      DisplayWidth = 3
      FieldName = 'NS'
      Size = 1
    end
    object IBTable_CadFichaAvlFICHACOMPLETA: TIBStringField
      DisplayWidth = 18
      FieldName = 'FICHACOMPLETA'
      Size = 1
    end
    object IBTable_CadFichaAvlESTAGIARIO: TIBStringField
      DisplayWidth = 13
      FieldName = 'ESTAGIARIO'
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = IBTable_CadFichaAvl
    Left = 785
    Top = 102
  end
  object IBTable_CadParecer: TIBTable
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
        Name = 'PARECER'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'PK_CAD_PARECER'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO'
    MasterFields = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO'
    MasterSource = DSQ_CadFichaAvl
    StoreDefs = True
    TableName = 'CAD_PARECER'
    Left = 817
    Top = 70
    object IBTable_CadParecerIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_CadParecerIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_CadParecerID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable_CadParecerID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_CadParecerID_AVL: TIBStringField
      FieldName = 'ID_AVL'
    end
    object IBTable_CadParecerID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
    end
    object IBTable_CadParecerPARECER: TBlobField
      FieldName = 'PARECER'
      Size = 8
    end
  end
  object DataSource3: TDataSource
    DataSet = IBTable_CadParecer
    Left = 817
    Top = 102
  end
end
