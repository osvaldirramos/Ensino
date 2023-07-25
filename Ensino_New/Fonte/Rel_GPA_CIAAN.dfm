object Form_Rel_GPA_CIAAN: TForm_Rel_GPA_CIAAN
  Left = 236
  Top = 136
  Width = 825
  Height = 784
  Caption = 'Ensino --> Gabarito da Prova Aplicada - GPA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000FFF
    FFFFFFF8BBBBBBB8FFFFFFFFFF000FFFFFFFFBBBB77887BBBBFFFFFFFF000FFF
    FFFBBB8888FF88888BB8FFFFFF000FFFFFBB7E888EEEEE88887BBFFFFF000FFF
    FBBEFE777788888778FEBBFFFF000FFFBBE88E88888788888E8FEB8FFF000FF8
    BEFEE86F88F78FF8E8E8F7BFFF000FFB788E8EC788878886CC8E88BBFF000F8B
    E8E8ECEC8888887CECE8EE8BFF000FBB88EECECC688888CCCECEE88BFF000FB7
    8E8CEECEC87786CECE6C8887BF000FB88EECECECC883FCC6ECECEEF8BF0008B8
    8EECECECCECCCECCECCCEE88BF0008BE8EECCC8EEF8CCCE88E8CE888BF0008BE
    E8688F8CEC8F8CE8888CE8E7BF0008BEE8E7C88CE77E88E8876E68E8BF0008BE
    EEE66CEEECCCC6CEEEECEEE8BF0008BEEE867CE8C8EE88C6ECC88EE8BF0008BE
    EE8C68EEEE88EECECECC8EE8BF0008BEEEE8EEECEE776EECEEC8EEE8BF0008BE
    EEEE8ECECC787CCEECE8EEE8BF0008BEEEEE8ECCEC898EECCE8EEEE8BF0008BE
    EEEEEE8CCC888CCC88EEEEE8BF0008BEEEEEEEE88E8F8E88EEEEEEE8BF0008BE
    8888888888E8E888888888E8BF0008B7777777777777777777777777BF0008BC
    CCC3CCCC88C8FEC88FCFCE86BF0008BCC63336CC88EF6FCFEECFFFE6BF0008BC
    6336336C888FCCCF88C88FC7BF0008BC3666663C88CFFFCF88CCF8C6BF0008B6
    666666666666666666666667BF0008BBBBBBBBBBBBBBBBBBBBBBBBBBBF008000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    000380000003800000038000000380000003800000038000000380000003}
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object QuickRep1: TQuickRep
    Left = 4
    Top = 10
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = IBQuery_MontaGabarito
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand2: TQRBand
      Left = 38
      Top = 19
      Width = 737
      Height = 178
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        470.958333333333300000
        1949.979166666667000000)
      BandType = rbPageHeader
      object QRDBText12: TQRDBText
        Left = 91
        Top = 27
        Width = 643
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          240.770833333333300000
          71.437500000000000000
          1701.270833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.IBTable_Configuracao
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object TQRShape
        Left = 0
        Top = 2
        Width = 735
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          5.291666666666667000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object TQRShape
        Left = 0
        Top = 76
        Width = 735
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          201.083333333333300000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRLabel7: TQRLabel
        Left = 5
        Top = 85
        Width = 727
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          13.229166666666670000
          224.895833333333300000
          1923.520833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FORMUL'#193'RIO GABARITO DA PROVA APLICADA - GPA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object TQRShape
        Left = 0
        Top = 155
        Width = 735
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          410.104166666666700000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRShape4: TQRShape
        Left = 88
        Top = 3
        Width = 1
        Height = 73
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333300000
          232.833333333333300000
          7.937500000000000000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 4
        Width = 1
        Height = 264
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          698.500000000000000000
          0.000000000000000000
          10.583333333333330000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape7: TQRShape
        Left = 736
        Top = 4
        Width = 1
        Height = 265
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          701.145833333333300000
          1947.333333333333000000
          10.583333333333330000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRImage_Log01: TQRImage
        Left = 13
        Top = 4
        Width = 63
        Height = 70
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          185.208333333333300000
          34.395833333333330000
          10.583333333333330000
          166.687500000000000000)
        Stretch = True
      end
      object TQRShape
        Left = 0
        Top = 105
        Width = 735
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          277.812500000000000000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object TQRShape
        Left = 1
        Top = 107
        Width = 735
        Height = 48
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          127.000000000000000000
          2.645833333333333000
          283.104166666666700000
          1944.687500000000000000)
        Brush.Color = 15000804
        Pen.Color = 15000804
        Shape = qrsRectangle
      end
      object QRLabel_DescCurso: TQRLabel
        Left = 3
        Top = 109
        Width = 726
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          7.937500000000000000
          288.395833333333300000
          1920.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CURSO:'
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_Turma: TQRLabel
        Left = 3
        Top = 134
        Width = 132
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          7.937500000000000000
          354.541666666666700000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TURMA:'
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_NItens: TQRLabel
        Left = 139
        Top = 135
        Width = 94
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          367.770833333333300000
          357.187500000000000000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' DE ITENS:'
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_Instrumento_Avaliacao: TQRLabel
        Left = 242
        Top = 134
        Width = 207
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          640.291666666666700000
          354.541666666666700000
          547.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'INSTRUMENTO DE AVALIA'#199#195'O:'
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_Data_Avaliacao: TQRLabel
        Left = 452
        Top = 135
        Width = 189
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1195.916666666667000000
          357.187500000000000000
          500.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATA DA AVALIA'#199#195'O:'
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape10: TQRShape
        Left = 136
        Top = 131
        Width = 1
        Height = 24
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333300000
          346.604166666666700000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape11: TQRShape
        Left = 238
        Top = 131
        Width = 1
        Height = 24
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          629.708333333333300000
          346.604166666666700000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object TQRShape
        Left = -1
        Top = 131
        Width = 735
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          346.604166666666700000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRShape12: TQRShape
        Left = 450
        Top = 131
        Width = 1
        Height = 24
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1190.625000000000000000
          346.604166666666700000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object TQRShape
        Left = 1
        Top = 157
        Width = 735
        Height = 20
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
          415.395833333333300000
          1944.687500000000000000)
        Brush.Color = 15724527
        Pen.Color = 15000804
        Shape = qrsRectangle
      end
      object QRLabel5: TQRLabel
        Left = 2
        Top = 159
        Width = 79
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          5.291666666666667000
          420.687500000000000000
          209.020833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' QUEST'#195'O'
        Color = 15724527
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 84
        Top = 159
        Width = 140
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          222.250000000000000000
          420.687500000000000000
          370.416666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ALTERNATIVA CORRETA'
        Color = 15724527
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRShape13: TQRShape
        Left = 647
        Top = 131
        Width = 1
        Height = 24
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1711.854166666667000000
          346.604166666666700000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRLabel_gabarito: TQRLabel
        Left = 649
        Top = 135
        Width = 80
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1717.145833333333000000
          357.187500000000000000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'GABARITO:'
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 197
      Width = 737
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        1949.979166666667000000)
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 2
        Top = 3
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          7.937500000000000000
          209.020833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_MontaGabarito
        DataField = 'QUESTAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 84
        Top = 3
        Width = 140
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          222.250000000000000000
          7.937500000000000000
          370.416666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_MontaGabarito
        DataField = 'RESPOSTACORRETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
  end
  object IBQuery_MontaGabarito: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select  IdCurso, IdTurma, 0 as Questao, 0 numitem,  NumeroQuesta' +
        'o, RespostaCorreta, Gabarito, '#39#39' as Historico '
      'From ItemTesteManual')
    Left = 8
    Top = 19
    object IBQuery_MontaGabaritoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'GABARITOPROVA.IDCURSO'
      Required = True
    end
    object IBQuery_MontaGabaritoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'GABARITOPROVA.IDTURMA'
      Required = True
    end
    object IBQuery_MontaGabaritoQUESTAO: TIntegerField
      FieldName = 'QUESTAO'
      Origin = 'GABARITOPROVA.QUESTAO'
    end
    object IBQuery_MontaGabaritoNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'GABARITOPROVA.NUMITEM'
    end
    object IBQuery_MontaGabaritoNUMEROQUESTAO: TIntegerField
      FieldName = 'NUMEROQUESTAO'
      Origin = 'GABARITOPROVA.NUMEROQUESTAO'
      Required = True
    end
    object IBQuery_MontaGabaritoGABARITO: TIntegerField
      FieldName = 'GABARITO'
      Origin = 'GABARITOPROVA.GABARITO'
      Required = True
    end
    object IBQuery_MontaGabaritoRESPOSTACORRETA: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Origin = 'ITEM_DESC.RESPOSTACORRETA'
      FixedChar = True
      Size = 1
    end
    object IBQuery_MontaGabaritoHISTORICO: TIBStringField
      FieldName = 'HISTORICO'
      Required = True
      FixedChar = True
      Size = 200
    end
  end
  object DSQ_MontaGabarito: TDataSource
    DataSet = IBQuery_MontaGabarito
    Left = 40
    Top = 17
  end
  object IBTable_ItemProva: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'IDTURMA;IDCURSO;NUMITEM'
    MasterFields = 'IDTURMA;IDCURSO;NUMITEM'
    MasterSource = DSQ_MontaGabarito
    TableName = 'ITEM_PROVA'
    Left = 12
    Top = 58
    object IBTable_ItemProvaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_ItemProvaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_ItemProvaNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
    end
    object IBTable_ItemProvaCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Size = 7
    end
    object IBTable_ItemProvaDISCIPLINA: TIBStringField
      FieldName = 'DISCIPLINA'
      Size = 2
    end
    object IBTable_ItemProvaUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object IBTable_ItemProvaSUBUNIDADE: TIBStringField
      FieldName = 'SUBUNIDADE'
      Size = 2
    end
    object IBTable_ItemProvaOBJETIVO: TIBStringField
      FieldName = 'OBJETIVO'
      Size = 1
    end
    object IBTable_ItemProvaQUARENTENA: TDateTimeField
      FieldName = 'QUARENTENA'
    end
    object IBTable_ItemProvaSERIE: TIBStringField
      FieldName = 'SERIE'
      Size = 2
    end
  end
end
