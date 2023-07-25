object Form_Rel_EAC: TForm_Rel_EAC
  Left = 114
  Top = 0
  Width = 1247
  Height = 728
  Caption = 'Ensino -->Extrato de Avalia'#231#227'o de Curso - EA'
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
    Left = -4
    Top = 2
    Width = 1111
    Height = 1572
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = IBQuery_Providencia
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
    OnStartPage = QuickRep1StartPage
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
    Zoom = 140
    object QRBand2: TQRBand
      Left = 53
      Top = 26
      Width = 1032
      Height = 285
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
        538.616071428571400000
        1950.357142857143000000)
      BandType = rbPageHeader
      object QRDBText12: TQRDBText
        Left = 136
        Top = 38
        Width = 889
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.586309523809520000
          257.023809523809500000
          71.815476190476190000
          1680.104166666667000000)
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
        Top = 3
        Width = 1029
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
        Top = 106
        Width = 1029
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
        Left = 7
        Top = 108
        Width = 1018
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          13.229166666666670000
          204.107142857142900000
          1923.898809523810000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EXTRATO DE AVALIA'#199#195'O DE CURSO - EAC'
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
      object QRShape4: TQRShape
        Left = 132
        Top = 4
        Width = 1
        Height = 102
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333300000
          248.708333333333300000
          7.937500000000000000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 6
        Width = 1
        Height = 294
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          555.625000000000000000
          0.000000000000000000
          11.339285714285710000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape7: TQRShape
        Left = 1030
        Top = 6
        Width = 1
        Height = 440
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          830.791666666666700000
          1947.333333333333000000
          10.583333333333330000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRImage_Log01: TQRImage
        Left = 25
        Top = 6
        Width = 88
        Height = 98
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          185.208333333333300000
          47.625000000000000000
          10.583333333333330000
          166.687500000000000000)
        Stretch = True
      end
      object TQRShape
        Left = 0
        Top = 129
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1.889880952380952000
          0.000000000000000000
          243.794642857142900000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object TQRShape
        Left = 0
        Top = 237
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1.889880952380952000
          0.000000000000000000
          447.901785714285700000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRShape8: TQRShape
        Left = 294
        Top = 129
        Width = 1
        Height = 109
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          205.997023809523800000
          555.625000000000000000
          243.794642857142900000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape9: TQRShape
        Left = 736
        Top = 129
        Width = 1
        Height = 110
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          207.886904761904800000
          1390.952380952381000000
          243.794642857142900000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRLabel_Curso: TQRLabel
        Left = 1
        Top = 238
        Width = 835
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1.889880952380952000
          449.791666666666700000
          1578.050595238095000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CURSO:'
        Color = clWhite
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
        Left = 837
        Top = 238
        Width = 193
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1581.830357142857000000
          449.791666666666700000
          364.747023809523800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Turma: '
        Color = clWhite
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
      object TQRShape
        Left = -1
        Top = 260
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1.889880952380952000
          -1.889880952380952000
          491.369047619047600000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRLabel_Periodo: TQRLabel
        Left = 1
        Top = 262
        Width = 835
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1.889880952380952000
          495.148809523809500000
          1578.050595238095000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Per'#237'odo:'
        Color = clWhite
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
      object QRLabel8: TQRLabel
        Left = 4
        Top = 134
        Width = 287
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          7.559523809523810000
          253.244047619047600000
          542.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Elaborado por: '
        Color = clWhite
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
      object QRLabel_ElaboradoPorNome: TQRLabel
        Left = 4
        Top = 156
        Width = 287
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          7.559523809523810000
          294.821428571428600000
          542.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Encarregado da Avalia'#231#227'o de Cursos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_AprovadoPorNome: TQRLabel
        Left = 743
        Top = 156
        Width = 287
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          1404.181547619048000000
          294.821428571428600000
          542.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Chefe da Subdivis'#227'o de Avalia'#231#227'o de Cursos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 743
        Top = 134
        Width = 287
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          1404.181547619048000000
          253.244047619047600000
          542.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Aprovado por: '
        Color = clWhite
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
      object QRSysData1: TQRSysData
        Left = 837
        Top = 262
        Width = 193
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1581.830357142857000000
          495.148809523809500000
          364.747023809523800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Data: '
        Transparent = False
        FontSize = 9
      end
      object TQRShape
        Left = -1
        Top = 285
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1.889880952380952000
          -1.889880952380952000
          538.616071428571400000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRShape3: TQRShape
        Left = 836
        Top = 238
        Width = 1
        Height = 46
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          86.934523809523810000
          1579.940476190476000000
          449.791666666666700000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRLabel_Versao: TQRLabel
        Left = 295
        Top = 161
        Width = 438
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          557.514880952381000000
          304.270833333333300000
          827.767857142857100000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Versao SQG'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_dataAtualizacao_SGQ: TQRLabel
        Left = 295
        Top = 184
        Width = 438
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          557.514880952381000000
          347.738095238095200000
          827.767857142857100000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Data Atualiza'#231#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 53
      Top = 311
      Width = 1032
      Height = 46
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
        86.934523809523810000
        1950.357142857143000000)
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 0
        Top = 2
        Width = 1029
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          0.000000000000000000
          3.779761904761905000
          1944.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 15000804
        DataSet = IBQuery_Providencia
        DataField = 'DESCRICAO'
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
    object QRSubDetail1: TQRSubDetail
      Left = 53
      Top = 357
      Width = 1032
      Height = 579
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        1094.241071428571000000
        1950.357142857143000000)
      Master = Owner
      DataSet = IBQuery_TratarProvidencias
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText_Comentario: TQRDBText
        Left = 4
        Top = 46
        Width = 1018
        Height = 250
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          472.470238095238100000
          7.559523809523810000
          86.934523809523810000
          1923.898809523810000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_TratarProvidencias
        DataField = 'REC_ACAO'
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
      object QRLabel4: TQRLabel
        Left = 4
        Top = 299
        Width = 287
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          7.559523809523810000
          565.074404761904800000
          542.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'A'#231#227'o Executada:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 4
        Top = 323
        Width = 1018
        Height = 250
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          472.470238095238100000
          7.559523809523810000
          610.431547619047600000
          1923.898809523810000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_TratarProvidencias
        DataField = 'EXEC_ACAO'
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
      object QRDBText3: TQRDBText
        Left = 0
        Top = 1
        Width = 1030
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          0.000000000000000000
          1.889880952380952000
          1946.577380952381000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 15000804
        DataSet = IBQuery_TratarProvidencias
        DataField = 'DESCRICAO'
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
      object QRLabel_AcaoRecomendada: TQRLabel
        Left = 4
        Top = 22
        Width = 287
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          7.559523809523810000
          41.577380952380950000
          542.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'A'#231#227'o Recomendada:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand4: TQRBand
      Left = 53
      Top = 936
      Width = 1032
      Height = 263
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
        497.038690476190500000
        1950.357142857143000000)
      BandType = rbSummary
      object QRImage: TQRImage
        Left = 108
        Top = 2
        Width = 811
        Height = 258
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          487.589285714285700000
          204.107142857142900000
          3.779761904761905000
          1532.693452380952000000)
        Stretch = True
      end
    end
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
      'and  ( fs.IdSecao = 200 and fs.Grupo = fp.Grupo)'
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
    Left = 14
    Top = 65
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
end
