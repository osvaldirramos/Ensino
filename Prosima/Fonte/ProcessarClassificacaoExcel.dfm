object Form_ProcessarClassificacaoExcel: TForm_ProcessarClassificacaoExcel
  Left = 313
  Top = 296
  Width = 453
  Height = 287
  Caption = 'Classifica'#231#227'o Excel'
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
  object JvGradient2: TJvGradient
    Left = 0
    Top = 53
    Width = 437
    Height = 196
    Align = alClient
    Style = grVertical
    StartColor = 16766640
    EndColor = 16777190
    Steps = 35
  end
  object ToolBar_BotoesIniciais: TToolBar
    Left = 0
    Top = 0
    Width = 437
    Height = 53
    ButtonHeight = 48
    ButtonWidth = 68
    Caption = 'ToolBar_BotoesIniciais'
    Color = 16766640
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
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
    object ToolButton1: TToolButton
      Left = 15
      Top = 2
      Caption = 'Excel'
      ImageIndex = 7
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton_Retornar: TToolButton
      Left = 91
      Top = 2
      Hint = 'Retornar para Janela anterior.'
      Caption = 'Fechar'
      ImageIndex = 3
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 159
      Top = 2
      Hint = 'Sai do sistema e retorna para sistema operacional.'
      Caption = 'Windows'
      ImageIndex = 2
      OnClick = ToolButton_WindowsClick
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Word (*.DOC)|*.DOC|Rich Text Files (*.RTF)|*.RTF|Text Files (*.T' +
      'XT)|*.TXT'
    Left = 40
    Top = 448
  end
  object PrintDialog1: TPrintDialog
    Left = 96
    Top = 448
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
    Left = 102
    Top = 112
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
    Left = 136
    Top = 112
  end
  object IBTable_Instrutor: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDENTIDADE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDENTIDADE_OLD'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NOMEGUERRA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'POSTOGRADUACAO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ULTIMAPROMOCAO'
        DataType = ftDateTime
      end
      item
        Name = 'SEXO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATA_NASCIMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'NOMEPAIS'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'CPF_CIC'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'SARAM'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QUADRO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ESPECIALIDADE'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ORGAOEMISSOR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ESTADO_CIVIL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NATURALIDADE_CIDADE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NATURALIDADE_UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NOME_PAI'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_MAE'
        DataType = ftString
        Size = 50
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
        Name = 'QUADROESP'
        DataType = ftString
        Size = 16
      end>
    IndexDefs = <
      item
        Name = 'PESSOA_PK'
        Fields = 'IDENTIDADE'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_IDX_ANTIGUIDADE'
        Fields = 'POSTOGRADUACAO;ULTIMAPROMOCAO'
      end
      item
        Name = 'PESSOA_IDX_NOME'
        Fields = 'NOME'
      end
      item
        Name = 'PESSOA_NOMEGUERRA_IDX'
        Fields = 'NOMEGUERRA'
      end>
    IndexFieldNames = 'IDENTIDADE'
    MasterFields = 'ID_INSTRUTOR'
    MasterSource = DSQ_RelacaoAlunosMedia
    StoreDefs = True
    TableName = 'PESSOA'
    Left = 107
    Top = 147
    object IBTable_InstrutorIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_InstrutorNOME: TIBStringField
      FieldName = 'NOME'
      Size = 100
    end
    object IBTable_InstrutorNOMEGUERRA: TIBStringField
      FieldName = 'NOMEGUERRA'
    end
    object IBTable_InstrutorPOSTOGRADUACAO: TIBStringField
      FieldName = 'POSTOGRADUACAO'
      Size = 25
    end
  end
  object IBTable_Estagiario: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_ATCO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTAGIARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'PK_PR_ESTAGIARIO'
        Fields = 'ID_ATCO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'ID_ATCO'
    MasterFields = 'IDENTIDADE'
    MasterSource = DSQ_AlunoTurma
    StoreDefs = True
    TableName = 'PR_ESTAGIARIO'
    Left = 107
    Top = 179
    object IBTable_EstagiarioID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_EstagiarioESTAGIARIO: TIBStringField
      FieldName = 'ESTAGIARIO'
      Size = 1
    end
  end
  object IBQuery_RelacaoAlunos: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * From cad_ficha_avl'
      'Order by IdTurma, Id_Atco, Id_Exercicio')
    Left = 222
    Top = 672
    object SmallintField1: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'CAD_FICHA_AVL.IDCURSO'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'CAD_FICHA_AVL.IDTURMA'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_FICHA'
      Origin = 'CAD_FICHA_AVL.ID_FICHA'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'ID_ATCO'
      Origin = 'CAD_FICHA_AVL.ID_ATCO'
      Required = True
      FixedChar = True
    end
    object IBStringField2: TIBStringField
      FieldName = 'ID_AVL'
      Origin = 'CAD_FICHA_AVL.ID_AVL'
      Required = True
      FixedChar = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_EXERCICIO'
      Origin = 'CAD_FICHA_AVL.ID_EXERCICIO'
      Required = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'ID_INSTRUTOR'
      Origin = 'CAD_FICHA_AVL.ID_INSTRUTOR'
      Required = True
      FixedChar = True
    end
    object IBStringField4: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'CAD_FICHA_AVL.NOMECOMPLETO'
      Size = 120
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATA_AVL'
      Origin = 'CAD_FICHA_AVL.DATA_AVL'
    end
    object IBStringField5: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'CAD_FICHA_AVL.LOCAL'
      Size = 50
    end
    object IBBCDField1: TIBBCDField
      FieldName = 'MEDIA'
      Origin = 'CAD_FICHA_AVL.MEDIA'
      Precision = 4
      Size = 2
    end
    object BlobField1: TBlobField
      FieldName = 'PARECER'
      Origin = 'CAD_FICHA_AVL.PARECER'
      Size = 8
    end
    object IBStringField6: TIBStringField
      FieldName = 'NS'
      Origin = 'CAD_FICHA_AVL.NS'
      FixedChar = True
      Size = 1
    end
    object IBStringField7: TIBStringField
      FieldName = 'FICHACOMPLETA'
      Origin = 'CAD_FICHA_AVL.FICHACOMPLETA'
      FixedChar = True
      Size = 1
    end
  end
  object DSQ_RelacaoAlunos: TDataSource
    DataSet = IBQuery_RelacaoAlunos
    Left = 256
    Top = 672
  end
  object IBQuery_AlunoTurma: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select al.IdCurso, al.IdTurma, al.Identidade, al.NumOrdem, al.Id' +
        'Antiguidade, al.PostoGraduacao, al.MotivoDesligamento, al.Codigo' +
        'Aluno, al.NotaFinal, al.nome, al.quadroEsp '
      'From Aluno_Turmas_View al '
      'Where al.IdCurso = 139 '
      '')
    Left = 57
    Top = 73
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
    object IBQuery_AlunoTurmaNUMORDEM: TSmallintField
      FieldName = 'NUMORDEM'
      Origin = 'ALUNOTURMA_VIEW.NUMORDEM'
    end
    object IBQuery_AlunoTurmaIDANTIGUIDADE: TSmallintField
      FieldName = 'IDANTIGUIDADE'
      Origin = 'ALUNOTURMA_VIEW.IDANTIGUIDADE'
    end
    object IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField
      FieldName = 'POSTOGRADUACAO'
      Origin = 'ALUNOTURMA_VIEW.POSTOGRADUACAO'
      FixedChar = True
      Size = 25
    end
    object IBQuery_AlunoTurmaMOTIVODESLIGAMENTO: TIBStringField
      FieldName = 'MOTIVODESLIGAMENTO'
      Origin = 'ALUNOTURMA_VIEW.MOTIVODESLIGAMENTO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
      Origin = 'ALUNOTURMA_VIEW.CODIGOALUNO'
    end
    object IBQuery_AlunoTurmaNOTAFINAL: TIBBCDField
      FieldName = 'NOTAFINAL'
      Origin = 'ALUNOTURMA_VIEW.NOTAFINAL'
      DisplayFormat = '#0.00'
      Precision = 9
      Size = 2
    end
    object IBQuery_AlunoTurmaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'ALUNOTURMA_VIEW.NOME'
      Size = 100
    end
    object IBQuery_AlunoTurmaQUADROESP: TIBStringField
      FieldName = 'QUADROESP'
      Origin = 'ALUNOTURMA_VIEW.QUADROESP'
      Size = 16
    end
  end
  object DSQ_AlunoTurma: TDataSource
    DataSet = IBQuery_AlunoTurma
    Left = 56
    Top = 106
  end
  object DSQ_Estagiario: TDataSource
    DataSet = IBTable_Estagiario
    Left = 136
    Top = 216
  end
  object IBTable_Rel_NS: TIBTable
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
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <
      item
        Name = 'PK_REL_NS'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;ID_ATCO'
    MasterFields = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterSource = DSQ_AlunoTurma
    StoreDefs = True
    TableName = 'REL_NS'
    Left = 105
    Top = 214
    object IBTable_Rel_NSIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_Rel_NSIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_Rel_NSID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable_Rel_NSID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_Rel_NSID_AVL: TIBStringField
      FieldName = 'ID_AVL'
    end
    object IBTable_Rel_NSID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
    end
    object IBTable_Rel_NSDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 500
    end
  end
end
