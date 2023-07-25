object Form_ProcessarClassificacao: TForm_ProcessarClassificacao
  Left = 53
  Top = 103
  Width = 1257
  Height = 908
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
  object ToolBar_BotoesIniciais: TToolBar
    Left = 0
    Top = 0
    Width = 1241
    Height = 53
    ButtonHeight = 48
    ButtonWidth = 68
    Caption = 'ToolBar_BotoesIniciais'
    Color = 16577515
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
      Visible = False
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
    object ToolButton_Imprimir: TToolButton
      Left = 91
      Top = 2
      Hint = 'Possu'#237'as  as op'#231#245'es de relat'#243'rio.'
      Caption = 'Imprimir'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton_ImprimirClick
    end
    object ToolButton_Salvar: TToolButton
      Left = 159
      Top = 2
      Hint = 'Salva o arquivo'
      Caption = 'Salvar'
      ImageIndex = 31
      OnClick = ToolButton_SalvarClick
    end
    object ToolButton7: TToolButton
      Left = 227
      Top = 2
      Width = 10
      Caption = 'ToolButton7'
      ImageIndex = 43
      Style = tbsSeparator
    end
    object ToolButton_Retornar: TToolButton
      Left = 237
      Top = 2
      Hint = 'Retornar para Janela anterior.'
      Caption = 'Fechar'
      ImageIndex = 3
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 305
      Top = 2
      Hint = 'Sai do sistema e retorna para sistema operacional.'
      Caption = 'Windows'
      ImageIndex = 2
      OnClick = ToolButton_WindowsClick
    end
  end
  object Text1: TPsyRichEdit
    Left = 0
    Top = 53
    Width = 1241
    Height = 817
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      'teste'
      '')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object IBQuery_Cad_Avaliados: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = Form_MenuPrincipal.DSQ_TurmaAndamento
    SQL.Strings = (
      'Select *'
      'From Cad_Ficha_avl'
      'where IdCurso = :IdCurso'
      'and    IdTurma = :IdTurma'
      'Order By Id_Atco, Id_Exercicio')
    Left = 409
    Top = 342
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
    Left = 457
    Top = 342
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 294
    object Copiar1: TMenuItem
      Caption = 'Copiar'
    end
  end
  object IBQuery_FichaAvaliacao: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSQ_Cad_Avaliados
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
  object DataSource1: TDataSource
    DataSet = IBTable_FichaAvaliacao
    Left = 449
    Top = 425
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Word (*.DOC)|*.DOC|Rich Text Files (*.RTF)|*.RTF|Text Files (*.T' +
      'XT)|*.TXT'
    Left = 48
    Top = 224
  end
  object PrintDialog1: TPrintDialog
    Left = 104
    Top = 224
  end
  object IBQuery_RelacaoAlunosMedia: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * From cad_ficha_avl'
      'Order by IdTurma, Id_Atco, Id_Exercicio')
    Left = 222
    Top = 520
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
    Left = 256
    Top = 520
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
    MasterFields = 'IDCURSO;IDTURMA;ID_ATCO'
    MasterSource = DSQ_RelacaoAlunosMedia
    StoreDefs = True
    TableName = 'ALUNOTURMA'
    Left = 247
    Top = 554
    object IBTable_AlunoTurmaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_AlunoTurmaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_AlunoTurmaIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Required = True
    end
    object IBTable_AlunoTurmaNUMORDEM: TSmallintField
      FieldName = 'NUMORDEM'
    end
    object IBTable_AlunoTurmaCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
    object IBTable_AlunoTurmaNOTAFINAL: TIBBCDField
      FieldName = 'NOTAFINAL'
      Precision = 9
      Size = 2
    end
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
    Left = 219
    Top = 587
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
    Transaction = DM.IBTransaction_Ensino
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
    MasterFields = 'ID_ATCO'
    MasterSource = DSQ_RelacaoAlunosMedia
    StoreDefs = True
    TableName = 'PR_ESTAGIARIO'
    Left = 259
    Top = 587
    object IBTable_EstagiarioID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_EstagiarioESTAGIARIO: TIBStringField
      FieldName = 'ESTAGIARIO'
      Size = 1
    end
  end
  object IBQuery_RelacaoAlunos: TIBQuery
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * From cad_ficha_avl'
      'Order by IdTurma, Id_Atco, Id_Exercicio')
    Left = 222
    Top = 632
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
    Top = 632
  end
end
