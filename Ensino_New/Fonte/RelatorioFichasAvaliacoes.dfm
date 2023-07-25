object Form_RelatorioFichasAvaliacoes: TForm_RelatorioFichasAvaliacoes
  Left = 1513
  Top = 32
  Width = 1179
  Height = 1048
  VertScrollBar.Position = 465
  Caption = 'Relat'#243'rio das Fichas de Avalia'#231#227'o'
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
  Position = poScreenCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object QuickRep1: TQuickRep
    Left = -4
    Top = -423
    Width = 1111
    Height = 1572
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = IBQuery_Rel_Topico
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
      40.000000000000000000
      2970.000000000000000000
      40.000000000000000000
      2100.000000000000000000
      40.000000000000000000
      40.000000000000000000
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
    object QRBand_Cabec: TQRBand
      Left = 21
      Top = 21
      Width = 1069
      Height = 160
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        302.380952380952400000
        2020.282738095238000000)
      BandType = rbTitle
      object TQRShape
        Left = 1
        Top = 73
        Width = 1064
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          2.645833333333333000
          137.583333333333300000
          2010.833333333333000000)
        Shape = qrsHorLine
      end
      object QRLabel_Curso: TQRLabel
        Left = 3
        Top = 77
        Width = 1060
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          6.614583333333333000
          145.520833333333300000
          2004.218750000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME DO CURSO:'
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
        Left = 5
        Top = 103
        Width = 186
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          9.921875000000000000
          195.130208333333300000
          350.572916666666700000)
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
      object QRLabel_Inicio: TQRLabel
        Left = 200
        Top = 103
        Width = 154
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          377.031250000000000000
          195.130208333333300000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATA IN'#205'CIO:'
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
      object QRShape10: TQRShape
        Left = 193
        Top = 101
        Width = 1
        Height = 29
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          54.806547619047620000
          364.747023809523800000
          190.877976190476200000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object TQRShape
        Left = 0
        Top = 99
        Width = 1065
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          187.854166666666700000
          2013.479166666667000000)
        Shape = qrsHorLine
      end
      object QRShape12: TQRShape
        Left = 358
        Top = 100
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          676.577380952381000000
          188.988095238095200000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRLabel5: TQRLabel
        Left = 5
        Top = 131
        Width = 147
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375000000000000
          9.921875000000000000
          248.046875000000000000
          277.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Local de Realiza'#231#227'o:'
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
      object QRLabel_Termino: TQRLabel
        Left = 364
        Top = 103
        Width = 154
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          687.916666666666700000
          195.130208333333300000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATAT'#201'RMINO:'
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
      object QRDBText2: TQRDBText
        Left = 158
        Top = 131
        Width = 656
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375000000000000
          297.656250000000000000
          248.046875000000000000
          1240.234375000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
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
        Left = -1
        Top = 129
        Width = 1067
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          243.416666666666700000
          2016.125000000000000000)
        Shape = qrsHorLine
      end
      object QRLabel_NAlunos: TQRLabel
        Left = 843
        Top = 131
        Width = 175
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375000000000000
          1594.114583333333000000
          248.046875000000000000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' de Alunos:'
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
      object QRShape21: TQRShape
        Left = 840
        Top = 131
        Width = 5
        Height = 29
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          54.806547619047620000
          1587.500000000000000000
          247.574404761904800000
          9.449404761904762000)
        Shape = qrsVertLine
      end
      object QRShape1: TQRShape
        Left = 524
        Top = 100
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          990.297619047619000000
          188.988095238095200000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRLabel_CargaHoraria: TQRLabel
        Left = 528
        Top = 103
        Width = 249
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          998.802083333333300000
          195.130208333333300000
          469.635416666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Carga Horaria da Disciplina: '
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
      object QRShape2: TQRShape
        Left = 783
        Top = 100
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          1479.776785714286000000
          188.988095238095200000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRLabel_Tecnica: TQRLabel
        Left = 788
        Top = 103
        Width = 266
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1488.281250000000000000
          195.130208333333300000
          502.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T'#233'cnica'
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
        Left = 1
        Top = 1
        Width = 1064
        Height = 71
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          134.937500000000000000
          2.645833333333333000
          2.645833333333333000
          2010.833333333333000000)
        Brush.Color = 15000804
        Pen.Color = 15000804
        Shape = qrsRectangle
      end
      object QRRichText_Cabecalho: TQRRichText
        Left = 1
        Top = 1
        Width = 1067
        Height = 71
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          134.937500000000000000
          2.645833333333333000
          2.645833333333333000
          2016.125000000000000000)
        Alignment = taCenter
        AutoStretch = True
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object QRBand_Ficha: TQRBand
      Left = 21
      Top = 181
      Width = 1069
      Height = 364
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRBand_FichaBeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        687.916666666666700000
        2020.282738095238000000)
      BandType = rbDetail
      object QRShape_02: TQRShape
        Left = 686
        Top = 0
        Width = 1
        Height = 35
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1296.458333333333000000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape_03: TQRShape
        Left = 778
        Top = 0
        Width = 1
        Height = 35
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1470.327380952381000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape_04: TQRShape
        Left = 872
        Top = 0
        Width = 1
        Height = 34
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1648.354166666667000000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape_05: TQRShape
        Left = 962
        Top = 0
        Width = 1
        Height = 35
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1817.687500000000000000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape_01: TQRShape
        Left = 602
        Top = 0
        Width = 2
        Height = 35
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1137.708333333333000000
          0.000000000000000000
          4.409722222222222000)
        Shape = qrsVertLine
      end
      object QRMemo_Abaixo: TQRMemo
        Left = 690
        Top = 0
        Width = 88
        Height = 334
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          631.220238095238100000
          1304.017857142857000000
          0.000000000000000000
          166.309523809523800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'ABAIXO DO ESPERADO')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRMemo_Atingiu: TQRMemo
        Left = 781
        Top = 0
        Width = 91
        Height = 336
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          635.000000000000000000
          1475.997023809524000000
          0.000000000000000000
          171.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'ATINGIU O ESPERADO')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRMemo_Acima: TQRMemo
        Left = 875
        Top = 0
        Width = 86
        Height = 336
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          635.000000000000000000
          1653.645833333333000000
          0.000000000000000000
          162.057291666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'ACIMA DO ESPERADO')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRMemo_Media: TQRMemo
        Left = 964
        Top = 0
        Width = 102
        Height = 336
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          635.000000000000000000
          1822.317708333333000000
          0.000000000000000000
          191.822916666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 16775673
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'M'#201'DIA PONDERADA')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRMemo_NObservado: TQRMemo
        Left = 605
        Top = 0
        Width = 80
        Height = 336
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          635.000000000000000000
          1143.377976190476000000
          0.000000000000000000
          151.190476190476200000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'N'#195'O AVALIADO')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRMemo_Topico: TQRMemo
        Left = 2
        Top = 0
        Width = 600
        Height = 336
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          635.000000000000000000
          3.779761904761905000
          0.000000000000000000
          1133.928571428571000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = 16382457
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
    end
    object QRBand_Sumario: TQRBand
      Left = 21
      Top = 545
      Width = 1069
      Height = 804
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
        1519.464285714286000000
        2020.282738095238000000)
      BandType = rbSummary
      object QRLabel_Versao_Sgq: TQRLabel
        Left = 2
        Top = 778
        Width = 1063
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          3.779761904761905000
          1470.327380952381000000
          2008.943452380952000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '   Local de Realiza'#231#227'o:'
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
      object QRImage_Grafico_Indicador: TQRImage
        Left = 19
        Top = 299
        Width = 1027
        Height = 245
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          463.020833333333300000
          35.277777777777780000
          564.444444444444400000
          1940.277777777778000000)
        Stretch = True
      end
      object QRLabel_ResponsavelAssinatura: TQRLabel
        Left = 450
        Top = 672
        Width = 583
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          851.076388888888900000
          1270.000000000000000000
          1102.430555555556000000)
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
        Left = 450
        Top = 651
        Width = 583
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          849.973958333333300000
          1230.312500000000000000
          1101.328125000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '________________________________________________________________' +
          '_________'
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
        Left = 450
        Top = 700
        Width = 583
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          851.076388888888900000
          1322.916666666667000000
          1102.430555555556000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao do PostoGraduacao'
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
      object QRRichText_Leganda: TQRRichText
        Left = 9
        Top = 605
        Width = 256
        Height = 80
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          151.190476190476200000
          17.008928571428570000
          1143.377976190476000000
          483.809523809523800000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Legenda (M'#233'dia aritm'#233'tica):'
          '1 - Abaixo do esperado'
          '2 - Esperado'
          '3 - Acima do esperado ')
      end
      object QRImage_Grafico_Desempenho: TQRImage
        Left = 19
        Top = 19
        Width = 1029
        Height = 271
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          511.527777777777800000
          35.277777777777780000
          35.277777777777780000
          1944.687500000000000000)
        Stretch = True
      end
      object QRImage_Log01: TQRImage
        Left = 495
        Top = 649
        Width = 459
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          152.135416666666700000
          935.963541666666700000
          1227.005208333333000000
          866.510416666666700000)
      end
    end
  end
  object IBQuery_Rel_Topico: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From FAC_Relatorio'
      'order by  IdTopico')
    Left = 6
    Top = 17
    object IBQuery_Rel_TopicoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'REL_FAC.IDCURSO'
    end
    object IBQuery_Rel_TopicoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'REL_FAC.IDTURMA'
    end
    object IBQuery_Rel_TopicoIDFICHA: TIntegerField
      FieldName = 'IDFICHA'
      Origin = 'REL_FAC.IDFICHA'
    end
    object IBQuery_Rel_TopicoIDTOPICO: TIntegerField
      FieldName = 'IDTOPICO'
      Origin = 'REL_FAC.IDTOPICO'
    end
    object IBQuery_Rel_TopicoTOPICO: TIBStringField
      FieldName = 'TOPICO'
      Origin = 'REL_FAC.TOPICO'
      Size = 2500
    end
    object IBQuery_Rel_TopicoNOBSERVADO: TIBStringField
      FieldName = 'NOBSERVADO'
      Origin = 'REL_FAC.NOBSERVADO'
    end
    object IBQuery_Rel_TopicoABAIXO: TIBStringField
      FieldName = 'ABAIXO'
      Origin = 'REL_FAC.ABAIXO'
    end
    object IBQuery_Rel_TopicoATINGIU: TIBStringField
      FieldName = 'ATINGIU'
      Origin = 'REL_FAC.ATINGIU'
    end
    object IBQuery_Rel_TopicoACIMA: TIBStringField
      FieldName = 'ACIMA'
      Origin = 'REL_FAC.ACIMA'
    end
    object IBQuery_Rel_TopicoMEDIA: TIBStringField
      FieldName = 'MEDIA'
      Origin = 'REL_FAC.MEDIA'
    end
    object IBQuery_Rel_TopicoCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'FAC_RELATORIO.COMENTARIO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_Rel_TopicoDESTAQUE: TIBStringField
      FieldName = 'DESTAQUE'
      Origin = 'FAC_RELATORIO.DESTAQUE'
      Size = 1
    end
  end
  object IBQuery_Versao_SGQ: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Versao, data'
      'From Versao_sgq')
    Left = 6
    Top = 57
    object IBQuery_Versao_SGQVERSAO: TIBStringField
      FieldName = 'VERSAO'
      Origin = 'VERSAO_SGQ.VERSAO'
      Required = True
      Size = 10
    end
    object IBQuery_Versao_SGQDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'VERSAO_SGQ.DATA'
    end
  end
end
