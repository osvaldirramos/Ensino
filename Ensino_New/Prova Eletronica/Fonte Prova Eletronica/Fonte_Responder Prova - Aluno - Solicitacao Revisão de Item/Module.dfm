object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 351
  Top = 250
  Height = 331
  Width = 411
  object IBQuery_Executa: TIBQuery
    Database = IBDatabase_Ensino
    Transaction = IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    Left = 56
    Top = 184
  end
  object Query_Usuario: TIBQuery
    Database = IBDatabase_Ensino
    Transaction = IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * from ALUNOS_TURMA_VIEW')
    Left = 312
    Top = 32
  end
  object IBDatabase_Ensino: TIBDatabase
    Connected = True
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
    Active = True
    DefaultDatabase = IBDatabase_Ensino
    IdleTimer = 2000000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 80
    Top = 80
  end
  object IBQuery_ExecSql: TIBQuery
    Database = IBDatabase_Ensino
    Transaction = IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 184
  end
  object DSQ_Usuario: TDataSource
    DataSet = Query_Usuario
    Left = 312
    Top = 104
  end
  object Timer_DisponibilidadeMaquina: TTimer
    OnTimer = Timer_DisponibilidadeMaquinaTimer
    Left = 296
    Top = 232
  end
end
