object DM_Historico_APAC: TDM_Historico_APAC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 481
  Top = 168
  Height = 383
  Width = 401
  object IBDatabase_Historico: TIBDatabase
    DatabaseName = 'C:\DataBase_ICEA\Ensino\BD_Historico_Ensino.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=u2u6#icea'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    IdleTimer = 2000000
    SQLDialect = 1
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 48
    Top = 32
  end
  object IBTransaction_Historico: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase_Historico
    IdleTimer = 2000000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saRollback
    Left = 48
    Top = 80
  end
  object IBQuery_Executa: TIBQuery
    Database = IBDatabase_Historico
    Transaction = IBTransaction_Historico
    BufferChunks = 1000
    CachedUpdates = False
    Left = 40
    Top = 144
  end
end
