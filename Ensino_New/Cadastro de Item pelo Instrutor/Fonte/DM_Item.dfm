object DMItem: TDMItem
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 627
  Top = 257
  Height = 251
  Width = 452
  object IBDatabase_ItemProva: TIBDatabase
    DatabaseName = 'C:\DataBase_ICEA\Ensino\Execucao.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=u2u6#icea')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 64
    Top = 32
  end
  object IBTransaction_ItemProva: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase_ItemProva
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 64
    Top = 80
  end
  object IBQuery_ExecSql: TIBQuery
    Database = IBDatabase_ItemProva
    Transaction = IBTransaction_ItemProva
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Item_Historico')
    Left = 64
    Top = 152
  end
end
