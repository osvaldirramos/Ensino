object Form_Relatorio: TForm_Relatorio
  Left = 191
  Top = 165
  Width = 1208
  Height = 640
  Caption = 'Form_Relatorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar_BotoesIniciais: TToolBar
    Left = 0
    Top = 0
    Width = 1192
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
    object ToolButton_Imprimir: TToolButton
      Left = 15
      Top = 2
      Hint = 'Possu'#237'as  as op'#231#245'es de relat'#243'rio.'
      Caption = 'Imprimir'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton_ImprimirClick
    end
    object ToolButton_Salvar: TToolButton
      Left = 83
      Top = 2
      Hint = 'Salva o arquivo'
      Caption = 'Salvar'
      ImageIndex = 31
    end
    object ToolButton7: TToolButton
      Left = 151
      Top = 2
      Width = 10
      Caption = 'ToolButton7'
      ImageIndex = 43
      Style = tbsSeparator
    end
    object ToolButton_Retornar: TToolButton
      Left = 161
      Top = 2
      Hint = 'Retornar para Janela anterior.'
      Caption = 'Fechar'
      ImageIndex = 3
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 229
      Top = 2
      Hint = 'Sai do sistema e retorna para sistema operacional.'
      Caption = 'Windows'
      ImageIndex = 2
      OnClick = ToolButton_WindowsClick
    end
    object ToolButton1: TToolButton
      Left = 297
      Top = 2
      Width = 248
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Memo1: TMemo
      Left = 545
      Top = 2
      Width = 295
      Height = 48
      BevelInner = bvLowered
      Color = 5855743
      Ctl3D = False
      Lines.Strings = (
        'Informa'#231#227'o RESERVADA de acordo com a '
        'LEI N'#186' 12.527, DE 18 DE NOVEMBRO DE '
        '2011')
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel_Turma: TPanel
    Left = 0
    Top = 69
    Width = 854
    Height = 108
    BevelOuter = bvNone
    Color = 16577515
    TabOrder = 1
    object JvShape2: TJvShape
      Left = 3
      Top = 0
      Width = 848
      Height = 108
      Align = alClient
      Brush.Color = 16577515
      Pen.Color = 15314812
      Shape = stRoundRect
    end
    object Label3: TLabel
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
    object Splitter1: TSplitter
      Left = 0
      Top = 0
      Height = 108
    end
    object Splitter2: TSplitter
      Left = 851
      Top = 0
      Height = 108
      Align = alRight
    end
    object Label11: TLabel
      Left = 1064
      Top = 10
      Width = 48
      Height = 16
      Caption = 'Vers'#227'o: '
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label_data: TLabel
      Left = 1064
      Top = 26
      Width = 64
      Height = 16
      Caption = '13/12/2012'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label_Versao: TLabel
      Left = 1112
      Top = 10
      Width = 48
      Height = 16
      Caption = 'Vers'#227'o: '
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 42
      Width = 50
      Height = 18
      Caption = 'Area...:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 74
      Width = 90
      Height = 18
      Caption = 'Localidade..:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ComboBox_Turma: TComboBox
      Left = 72
      Top = 8
      Width = 673
      Height = 24
      BevelInner = bvSpace
      BevelKind = bkFlat
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox_TurmaChange
    end
    object ComboBox_Area: TComboBox
      Left = 72
      Top = 39
      Width = 145
      Height = 24
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = 'ComboBox_Area'
      Items.Strings = (
        'APP'
        'ACC'
        'TWR3'
        'CGNA'
        'COPM'
        'BD'
        'PIL')
    end
    object ComboBox_Localidade: TComboBox
      Left = 111
      Top = 69
      Width = 145
      Height = 24
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'APP'
        'ACC'
        'TWR3'
        'CGNA'
        'COPM'
        'BD'
        'PIL')
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 184
    Width = 936
    Height = 87
    BevelOuter = bvNone
    TabOrder = 2
    object JvShape1: TJvShape
      Left = 0
      Top = 0
      Width = 936
      Height = 87
      Align = alClient
      Brush.Color = 16577515
      Pen.Color = 15314812
      Shape = stRoundRect
    end
    object JvGroupHeader1: TJvGroupHeader
      Left = 2
      Top = 8
      Width = 932
      Height = 17
      Caption = 'Selecionar os Campos que far'#227'o parte do Relat'#243'rio'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object SpeedButton_Excel: TSpeedButton
      Left = 24
      Top = 56
      Width = 121
      Height = 22
      Caption = 'Excel'
      OnClick = SpeedButton_ExcelClick
    end
    object SpeedButton_Texto: TSpeedButton
      Left = 168
      Top = 56
      Width = 121
      Height = 22
      Caption = 'Texto'
      OnClick = SpeedButton_TextoClick
    end
    object CheckBox_instrutor: TCheckBox
      Left = 384
      Top = 32
      Width = 65
      Height = 17
      Caption = 'Instrutor'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox_Media: TCheckBox
      Left = 464
      Top = 32
      Width = 57
      Height = 17
      Caption = 'M'#233'dia'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox_Estagiario: TCheckBox
      Left = 552
      Top = 32
      Width = 73
      Height = 17
      Caption = 'Est'#225'giario'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox_PossuiNS: TCheckBox
      Left = 632
      Top = 32
      Width = 73
      Height = 17
      Caption = 'Possu'#237' NS'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox_Exercicios: TCheckBox
      Left = 728
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Exerc'#237'cios'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CheckBox_Localidade: TCheckBox
      Left = 280
      Top = 32
      Width = 85
      Height = 17
      Caption = 'Localidade'
      TabOrder = 5
    end
    object CheckBox_Area: TCheckBox
      Left = 200
      Top = 32
      Width = 49
      Height = 17
      Caption = 'Area'
      TabOrder = 6
    end
    object CheckBox_Turma: TCheckBox
      Left = 32
      Top = 32
      Width = 65
      Height = 17
      Caption = 'Turma'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object CheckBox_Periodo: TCheckBox
      Left = 120
      Top = 32
      Width = 65
      Height = 17
      Caption = 'Per'#237'odo'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
  end
  object RichEdit1: TRichEdit
    Left = 16
    Top = 288
    Width = 1169
    Height = 297
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object IBQuery_MontaTurma: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select IdCurso, IdTurma, Turma, Ano, DataInicio, DataTermino, Co' +
        'ordenador, Status, Descricao, CodSala '
      'From Turma where IdCurso = 139')
    Left = 142
    Top = 88
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
    Left = 136
    Top = 119
  end
  object IBQuery_AlunoTurma: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select Tu.IdCurso, Tu.IdTurma, Tu.Turma, Tu.Ano, Tu.DataInicio, ' +
        'Tu.DataTermino,'
      
        '       al.Identidade, al.NumOrdem, al.IdAntiguidade, al.PostoGra' +
        'duacao, al.MotivoDesligamento, al.CodigoAluno, al.NotaFinal, al.' +
        'nomeCompleto As Nome, al.quadroEsp'
      'From turma tu, Aluno_Turmas_Viewal'
      'Where Tu.IdCurso = 139'
      'and Tu.IdTurma = Al.idturma'
      'Order By tu.Turma')
    Left = 681
    Top = 121
    object IBQuery_AlunoTurmaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'TURMA.IDCURSO'
      Required = True
    end
    object IBQuery_AlunoTurmaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'TURMA.IDTURMA'
      Required = True
    end
    object IBQuery_AlunoTurmaTURMA: TIBStringField
      FieldName = 'TURMA'
      Origin = 'TURMA.TURMA'
      Size = 15
    end
    object IBQuery_AlunoTurmaANO: TIBStringField
      FieldName = 'ANO'
      Origin = 'TURMA.ANO'
      Required = True
      Size = 4
    end
    object IBQuery_AlunoTurmaDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'TURMA.DATAINICIO'
    end
    object IBQuery_AlunoTurmaDATATERMINO: TDateTimeField
      FieldName = 'DATATERMINO'
      Origin = 'TURMA.DATATERMINO'
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
      Precision = 9
      Size = 2
    end
    object IBQuery_AlunoTurmaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'ALUNOTURMA_VIEW.NOMECOMPLETO'
      Size = 125
    end
    object IBQuery_AlunoTurmaQUADROESP: TIBStringField
      FieldName = 'QUADROESP'
      Origin = 'ALUNOTURMA_VIEW.QUADROESP'
      Size = 16
    end
  end
  object DSQ_AlunoTurma: TDataSource
    DataSet = IBQuery_AlunoTurma
    Left = 680
    Top = 154
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
    Left = 726
    Top = 160
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
    Left = 760
    Top = 160
  end
  object IBTable_Instrutor: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDENTIDADE_OLD'
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
    Left = 731
    Top = 195
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
    Left = 729
    Top = 230
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
  object DSQ_Estagiario: TDataSource
    Left = 760
    Top = 232
  end
  object PrintDialog1: TPrintDialog
    Options = [poPageNums, poWarning]
    Left = 299
    Top = 110
  end
  object IBTable_Estagiario: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_ATCO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTAGIARIO'
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
    MasterSource = Form_Sel_Avaliacao.DST_Cad_FichaAvl
    StoreDefs = True
    TableName = 'PR_ESTAGIARIO'
    Left = 353
    Top = 190
    object IBTable_EstagiarioID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_EstagiarioESTAGIARIO: TIBStringField
      FieldName = 'ESTAGIARIO'
      Size = 1
    end
  end
  object DST_Estagiario: TDataSource
    DataSet = IBTable_Estagiario
    Left = 393
    Top = 193
  end
end
