object DMManual: TDMManual
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 733
  Top = 168
  Height = 441
  Width = 961
  object IBDatabase_Manual: TIBDatabase
    Connected = True
    DatabaseName = 'C:\DataBase_ICEA\Ensino\Manual.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=u2u6#icea')
    LoginPrompt = False
    DefaultTransaction = IBTransaction_Manual
    IdleTimer = 2000000
    SQLDialect = 1
    TraceFlags = []
    Left = 80
    Top = 24
  end
  object IBTransaction_Manual: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase_Manual
    IdleTimer = 2000000
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 80
    Top = 80
  end
  object IBQuery_Manual: TIBQuery
    Database = IBDatabase_Manual
    Transaction = IBTransaction_Manual
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select Id_Indice, indice, descricao, Modulo'
      'From  MANUALUSUARIO'
      'Order By Id_Indice')
    Left = 216
    Top = 16
  end
  object DSQ_Manual: TDataSource
    DataSet = IBQuery_Manual
    Left = 224
    Top = 72
  end
end
