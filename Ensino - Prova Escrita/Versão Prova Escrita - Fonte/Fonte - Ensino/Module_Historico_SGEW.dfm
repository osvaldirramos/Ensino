object DM_Historico_SGEW: TDM_Historico_SGEW
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 493
  Top = 125
  Height = 366
  Width = 539
  object IBDatabase_Historico_SGEW: TIBDatabase
    Connected = True
    DatabaseName = 'C:\DataBase_ICEA\Ensino\BD_Historico_SGEW.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=u2u6#icea')
    LoginPrompt = False
    DefaultTransaction = IBTransaction_Historico_SGEW
    IdleTimer = 2000000
    SQLDialect = 1
    TraceFlags = []
    Left = 80
    Top = 24
  end
  object IBTransaction_Historico_SGEW: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase_Historico_SGEW
    IdleTimer = 2000000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saRollback
    Left = 72
    Top = 80
  end
  object IBQuery_Executa: TIBQuery
    Database = IBDatabase_Historico_SGEW
    Transaction = IBTransaction_Historico_SGEW
    BufferChunks = 1000
    CachedUpdates = False
    Left = 40
    Top = 144
  end
end
