object Form_pts_dia_semana: TForm_pts_dia_semana
  Left = 192
  Top = 117
  Width = 928
  Height = 480
  Caption = 'Form_pts_dia_semana'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 184
    Top = 32
    Width = 209
    Height = 193
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 208
    Top = 264
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object Button1: TButton
    Left = 456
    Top = 152
    Width = 75
    Height = 25
    Caption = 'inSERIR'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBEdit1: TDBEdit
    Left = 200
    Top = 8
    Width = 57
    Height = 21
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 272
    Top = 8
    Width = 121
    Height = 21
    DataSource = DataSource1
    TabOrder = 4
  end
  object Button2: TButton
    Left = 464
    Top = 192
    Width = 75
    Height = 25
    Caption = 'gRAVAR'
    TabOrder = 5
    OnClick = Button2Click
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 96
    Top = 48
  end
  object IBTable1: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DIA_SEMANA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'PK_DIA_SEMANA'
        Fields = 'ID'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'PTS_DIA_SEMANA'
    Left = 96
    Top = 8
    object IBTable1ID: TIntegerField
      FieldName = 'ID'
    end
    object IBTable1DIA_SEMANA: TIBStringField
      FieldName = 'DIA_SEMANA'
      Size = 10
    end
  end
end
