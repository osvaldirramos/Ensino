object Form_Lixo: TForm_Lixo
  Left = 243
  Top = 125
  Width = 1037
  Height = 750
  Caption = 'Form_Lixo'
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
  object DBGrid2: TDBGrid
    Left = 176
    Top = 0
    Width = 657
    Height = 369
    DataSource = DSQ_Providencia
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 168
    Top = 384
    Width = 665
    Height = 313
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object IBQuery_Providencia: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = Form_Cad_Providencia.DSQ_Providencia
    SQL.Strings = (
      
        'Select distinct fp.IdCurso, fp.IdTurma, fs.IdSecao, fs.sigla, fs' +
        '.descricao || '#39' ('#39' ||fs.sigla || '#39')'#39' as descricao , fs.Grupo'
      'From  fp_secao fs, fp_Providencias fp'
      'where fp.idcurso = :IdCurso'
      'and fp.idturma = :IdTurma'
      'and  ( fs.IdSecao =  1)'
      'or     ( fs.IdSecao = 200 and fs.Grupo = fp.Grupo)'
      'or     ( fs.IdSecao = 300 and fs.Grupo = fp.Grupo)'
      'or     ( fs.IdSecao = 400 and fs.Grupo = fp.Grupo)'
      'or     ( fs.IdSecao = 500 and fs.Grupo = fp.Grupo)'
      'or     ( fs.IdSecao = 600 and fs.Grupo = fp.Grupo)'
      'or     ( fs.IdSecao = 700 and fs.Grupo = fp.Grupo)'
      'or     ( fs.IdSecao = 800 and fs.Grupo = fp.Grupo)'
      'or     ( fs.IdSecao = 900 and fs.Grupo = fp.Grupo)'
      'Order By fs.IdSecao')
    Left = 14
    Top = 25
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
    object IBQuery_ProvidenciaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'FP_PROVIDENCIAS.IDCURSO'
      Required = True
    end
    object IBQuery_ProvidenciaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'FP_PROVIDENCIAS.IDTURMA'
      Required = True
    end
    object IBQuery_ProvidenciaIDSECAO: TIntegerField
      FieldName = 'IDSECAO'
      Origin = 'FP_SECAO.IDSECAO'
      Required = True
    end
    object IBQuery_ProvidenciaSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = 'FP_SECAO.SIGLA'
      Size = 4
    end
    object IBQuery_ProvidenciaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'FP_SECAO.DESCRICAO'
      Size = 50
    end
    object IBQuery_ProvidenciaGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'FP_SECAO.GRUPO'
    end
  end
  object DSQ_Providencia: TDataSource
    DataSet = IBQuery_Providencia
    Left = 52
    Top = 26
  end
  object IBQuery_TratarProvidencias: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_Providencia
    SQL.Strings = (
      
        'Select distinct fp.IdCurso, fp.IdTurma, fs.IdSecao, fs.sigla, fs' +
        '.descricao || '#39' ('#39' ||fs.sigla || '#39')'#39' as descricao , fs.Grupo, fp' +
        '.rec_acao,  fp.exec_acao'
      'From  fp_secao fs, fp_Providencias fp'
      'Where fp.IdCurso = :IdCurso'
      'and     fp.IdTurma = :IdTurma'
      'and     fs.Grupo = :Grupo'
      
        'and ( fs.Grupo = fp.Grupo and  ( fs.IdSecao = fp.IdSecao and   f' +
        's.IdSecao <> :Grupo))'
      'Order By fs.IdSecao')
    Left = 38
    Top = 73
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
        Name = 'GRUPO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'Grupo'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = IBQuery_TratarProvidencias
    Left = 76
    Top = 74
  end
end
