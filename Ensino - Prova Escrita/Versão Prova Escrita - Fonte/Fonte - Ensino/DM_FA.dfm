object DM_FA: TDM_FA
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 468
  Top = 246
  Height = 278
  Width = 324
  object IBDatabase_FA: TIBDatabase
    Connected = True
    DatabaseName = 'C:\DataBase_ICEA\Ensino\Planejamento.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=u2u6#icea')
    LoginPrompt = False
    IdleTimer = 2000000
    SQLDialect = 1
    TraceFlags = []
    Left = 80
    Top = 24
  end
  object IBTransaction_FA: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase_FA
    IdleTimer = 2000000
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 80
    Top = 80
  end
  object Query_Executa: TIBQuery
    Database = IBDatabase_FA
    Transaction = IBTransaction_FA
    BufferChunks = 1000
    CachedUpdates = False
    Left = 192
    Top = 40
  end
  object IBQuery_ExecSql: TIBQuery
    Database = IBDatabase_FA
    Transaction = IBTransaction_FA
    BufferChunks = 1000
    CachedUpdates = False
    Left = 200
    Top = 120
  end
end
