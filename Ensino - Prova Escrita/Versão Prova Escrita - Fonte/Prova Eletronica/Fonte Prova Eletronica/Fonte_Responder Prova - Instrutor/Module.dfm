object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 480
  Top = 163
  Height = 483
  Width = 800
  object IBQuery_Executa: TIBQuery
    Database = IBDatabase_Ensino
    Transaction = IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    Left = 216
    Top = 312
  end
  object Query_Usuario: TIBQuery
    Database = IBDatabase_Ensino
    Transaction = IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * from ALUNOS_TURMA_VIEW')
    Left = 408
    Top = 24
  end
  object IBDatabase_Ensino: TIBDatabase
    DatabaseName = 'C:\DataBase_ICEA\Ensino\BD_Ensino.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=u2u6#icea')
    LoginPrompt = False
    IdleTimer = 2000000
    SQLDialect = 1
    TraceFlags = []
    Left = 80
    Top = 32
  end
  object IBTransaction_Ensino: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase_Ensino
    IdleTimer = 2000000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommitRetaining
    Left = 80
    Top = 96
  end
  object IBQuery_ExecSql: TIBQuery
    Database = IBDatabase_Ensino
    Transaction = IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    Left = 32
    Top = 320
  end
  object DSQ_usuario: TDataSource
    DataSet = Query_Usuario
    Left = 417
    Top = 80
  end
  object DSQ_Executa: TDataSource
    DataSet = IBQuery_Executa
    Left = 217
    Top = 368
  end
  object IBQuery_Executa_2: TIBQuery
    Database = IBDatabase_Ensino
    Transaction = IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    Left = 320
    Top = 312
  end
end
