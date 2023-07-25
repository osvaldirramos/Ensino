object Form_Relatoio_De_Critica_Final_De_Curso: TForm_Relatoio_De_Critica_Final_De_Curso
  Left = 1592
  Top = -8
  Width = 1936
  Height = 1096
  Caption = 'Relat'#243'rio de Cr'#237'tica de Final de Curso'
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
    Width = 1111
    Height = 1572
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = Form_Hab_FAC.ClientDataSet_Relatorio
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
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 140
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object QRBand1: TQRBand
      Left = 53
      Top = 313
      Width = 1032
      Height = 1104
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2086.428571428571000000
        1950.357142857143000000)
      BandType = rbSummary
      object QRLabel_ResponsavelAssinatura: TQRLabel
        Left = 337
        Top = 156
        Width = 588
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          636.889880952381000000
          294.821428571428600000
          1111.250000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nome completo e assinatura do conferente'
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
      object QRLabel_Barra: TQRLabel
        Left = 335
        Top = 129
        Width = 588
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          633.110119047619000000
          243.794642857142900000
          1111.250000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '________________________________________________________________' +
          '_____________________'
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
      object QRImage_Docentes: TQRImage
        Left = 557
        Top = 331
        Width = 302
        Height = 302
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          570.744047619047600000
          1052.663690476190000000
          625.550595238095200000
          570.744047619047600000)
        Stretch = True
      end
      object QRImage_Avaliacao: TQRImage
        Left = 141
        Top = 660
        Width = 302
        Height = 302
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          570.744047619047600000
          266.473214285714300000
          1247.321428571429000000
          570.744047619047600000)
        Stretch = True
      end
      object QRImage_MaterialDidatico: TQRImage
        Left = 557
        Top = 660
        Width = 302
        Height = 302
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          570.744047619047600000
          1052.663690476190000000
          1247.321428571429000000
          570.744047619047600000)
        Stretch = True
      end
      object QRShape1: TQRShape
        Left = 304
        Top = 1019
        Width = 332
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          574.523809523809500000
          1925.788690476190000000
          627.440476190476200000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 304
        Top = 1019
        Width = 101
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          574.523809523809500000
          1925.788690476190000000
          190.877976190476200000)
        Brush.Color = clBlue
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 304
        Top = 1043
        Width = 332
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          574.523809523809500000
          1971.145833333333000000
          627.440476190476200000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 304
        Top = 1043
        Width = 101
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          574.523809523809500000
          1971.145833333333000000
          190.877976190476200000)
        Brush.Color = clYellow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 304
        Top = 1067
        Width = 332
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          574.523809523809500000
          2016.502976190476000000
          627.440476190476200000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 304
        Top = 1067
        Width = 101
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          574.523809523809500000
          2016.502976190476000000
          190.877976190476200000)
        Brush.Color = clRed
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 408
        Top = 1020
        Width = 221
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          771.071428571428600000
          1927.678571428571000000
          417.663690476190500000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Acima do Esperado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 408
        Top = 1044
        Width = 221
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          771.071428571428600000
          1973.035714285714000000
          417.663690476190500000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Esperado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 408
        Top = 1068
        Width = 221
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          771.071428571428600000
          2018.392857142857000000
          417.663690476190500000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Abaixo do Esperado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 304
        Top = 979
        Width = 332
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          574.523809523809500000
          1850.193452380952000000
          627.440476190476200000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ESCALA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRImage_Disciplina: TQRImage
        Left = 141
        Top = 331
        Width = 302
        Height = 302
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          570.744047619047600000
          266.473214285714300000
          625.550595238095200000
          570.744047619047600000)
        Stretch = True
      end
      object QRLabel6: TQRLabel
        Left = 240
        Top = 308
        Width = 94
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          453.571428571428600000
          582.083333333333300000
          177.648809523809500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DISCIPLINA'
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
      object QRLabel8: TQRLabel
        Left = 664
        Top = 308
        Width = 95
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1254.880952380952000000
          582.083333333333300000
          179.538690476190500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DOCENTES'
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
      object QRLabel9: TQRLabel
        Left = 240
        Top = 638
        Width = 105
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          453.571428571428600000
          1205.744047619048000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AVALIA'#199#195'O'
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
      object QRLabel10: TQRLabel
        Left = 640
        Top = 638
        Width = 164
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1209.523809523810000000
          1205.744047619048000000
          309.940476190476200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MATERIAL DID'#193'TICO'
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
      object QRLabel_DescricaoSecao: TQRLabel
        Left = 337
        Top = 180
        Width = 588
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          636.889880952381000000
          340.178571428571400000
          1111.250000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nome completo e assinatura do conferente'
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
    end
    object QRBand2: TQRBand
      Left = 53
      Top = 26
      Width = 1032
      Height = 167
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
        315.610119047619000000
        1950.357142857143000000)
      BandType = rbPageHeader
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
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 7
        Top = 18
        Width = 1018
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          13.229166666666670000
          34.017857142857140000
          1923.898809523810000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ANEXO K - RELAT'#211'RIO DE CR'#205'TICA FINAL DE CURSO'
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
      object QRShape6: TQRShape
        Left = 0
        Top = -20
        Width = 1
        Height = 394
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          744.613095238095200000
          0.000000000000000000
          -37.797619047619050000
          1.889880952380952000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 1030
        Top = 6
        Width = 1
        Height = 393
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          742.723214285714300000
          1946.577380952381000000
          11.339285714285710000
          1.889880952380952000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object TQRShape
        Left = 0
        Top = 52
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
          98.273809523809520000
          1944.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object TQRShape
        Left = 1
        Top = 53
        Width = 1029
        Height = 120
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          226.785714285714300000
          1.889880952380952000
          100.163690476190500000
          1944.687500000000000000)
        Brush.Color = 15000804
        Pen.Color = 15000804
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel_Curso: TQRLabel
        Left = 4
        Top = 58
        Width = 1021
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          7.559523809523810000
          109.613095238095200000
          1929.568452380952000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME DO CURSO:'
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
        Left = 4
        Top = 87
        Width = 239
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          7.559523809523810000
          164.419642857142900000
          451.681547619047600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Turma: '
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
      object QRLabel_Inicio: TQRLabel
        Left = 386
        Top = 87
        Width = 311
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          729.494047619047600000
          164.419642857142900000
          587.752976190476200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATA IN'#205'CIO:'
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
        Left = 382
        Top = 84
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          721.934523809523800000
          158.750000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object TQRShape
        Left = -1
        Top = 83
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
          156.860119047619000000
          1944.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 705
        Top = 83
        Width = 1
        Height = 31
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.586309523809520000
          1332.366071428571000000
          156.860119047619000000
          1.889880952380952000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 4
        Top = 117
        Width = 157
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          7.559523809523810000
          221.116071428571400000
          296.711309523809500000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LOCAL DO CURSO:'
        Color = 15000804
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
      object QRLabel_Termino: TQRLabel
        Left = 714
        Top = 87
        Width = 287
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1349.375000000000000000
          164.419642857142900000
          542.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATAT'#201'RMINO:'
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
      object QRDBText3: TQRDBText
        Left = 166
        Top = 116
        Width = 850
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          313.720238095238100000
          219.226190476190500000
          1606.398809523810000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 15000804
        DataSet = DM.IBTable_Configuracao
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object TQRShape
        Left = 0
        Top = 113
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
          213.556547619047600000
          1944.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object TQRShape
        Left = 0
        Top = 140
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
          264.583333333333300000
          1944.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 583
        Top = 141
        Width = 1
        Height = 31
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.586309523809520000
          1101.800595238095000000
          266.473214285714300000
          1.889880952380952000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 588
        Top = 145
        Width = 165
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1111.250000000000000000
          274.032738095238100000
          311.830357142857100000)
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
      object QRLabel_QuantidadeAlunos: TQRLabel
        Left = 4
        Top = 145
        Width = 493
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          7.559523809523810000
          274.032738095238100000
          931.711309523809500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QUANTIDADE DE ALUNOS'
        Color = 15000804
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
    end
    object PageFooterBand1: TQRBand
      Left = 53
      Top = 193
      Width = 1032
      Height = 120
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = PageFooterBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        226.785714285714300000
        1950.357142857143000000)
      BandType = rbDetail
      object QRLabel_Titutlo: TQRLabel
        Left = 2
        Top = 1
        Width = 1031
        Height = 22
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          3.779761904761905000
          1.889880952380952000
          1948.467261904762000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        BiDiMode = bdRightToLeftReadingOnly
        ParentBiDiMode = False
        Caption = 'QRLabel_Comantario'
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel_Comantario: TQRLabel
        Left = 2
        Top = 24
        Width = 1025
        Height = 96
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          181.428571428571400000
          3.779761904761905000
          45.357142857142860000
          1937.127976190476000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        BiDiMode = bdRightToLeftReadingOnly
        ParentBiDiMode = False
        Caption = 'QRLabel_Comantario'
        Color = clWhite
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
end
