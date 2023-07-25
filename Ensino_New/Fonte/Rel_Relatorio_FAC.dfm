object Form_Relatorio_FAC: TForm_Relatorio_FAC
  Left = 149
  Top = 45
  Width = 1187
  Height = 1048
  VertScrollBar.Position = 166
  Caption = 'Extrato Do Curso'
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
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object QuickRep1: TQuickRep
    Left = 4
    Top = -156
    Width = 1111
    Height = 1572
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = IBQuery_Topico
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
    Zoom = 140
    object QRBand2: TQRBand
      Left = 53
      Top = 26
      Width = 1032
      Height = 159
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
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
        300.491071428571400000
        1950.357142857143000000)
      BandType = rbTitle
      object TQRShape
        Left = 1
        Top = 72
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.204861111111111000
          2.204861111111111000
          136.701388888888900000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object TQRShape
        Left = 1
        Top = 2
        Width = 1029
        Height = 69
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          130.086805555555600000
          2.204861111111111000
          4.409722222222222000
          1944.687500000000000000)
        Brush.Color = 15000804
        Pen.Color = 15000804
        Shape = qrsRectangle
      end
      object QRLabel_Curso: TQRLabel
        Left = 5
        Top = 75
        Width = 1021
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          8.819444444444444000
          141.111111111111100000
          1929.253472222222000000)
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
        Left = 6
        Top = 103
        Width = 341
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          11.024305555555560000
          194.027777777777800000
          643.819444444444400000)
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
        Left = 386
        Top = 103
        Width = 310
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          729.809027777777800000
          194.027777777777800000
          586.493055555555600000)
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
        Left = 359
        Top = 100
        Width = 1
        Height = 29
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.121527777777780000
          679.097222222222200000
          189.618055555555600000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object TQRShape
        Left = 0
        Top = 99
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.204861111111111000
          0.000000000000000000
          187.413194444444400000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRShape12: TQRShape
        Left = 706
        Top = 99
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          57.326388888888890000
          1333.940972222222000000
          187.413194444444400000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRLabel5: TQRLabel
        Left = 7
        Top = 134
        Width = 166
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          13.229166666666670000
          253.559027777777800000
          313.090277777777800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Local de Realiza'#231#227'o:'
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
      object QRLabel_Termino: TQRLabel
        Left = 714
        Top = 103
        Width = 287
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1349.375000000000000000
          194.027777777777800000
          542.395833333333300000)
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
        Left = 176
        Top = 134
        Width = 655
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          333.375000000000000000
          254.000000000000000000
          1238.250000000000000000)
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
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.204861111111111000
          -2.204861111111111000
          244.739583333333300000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRLabel_NAlunos: TQRLabel
        Left = 843
        Top = 134
        Width = 175
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1594.114583333333000000
          253.559027777777800000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' de Alunos:'
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
      object QRShape21: TQRShape
        Left = 839
        Top = 130
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          1585.610119047619000000
          245.684523809523800000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRRichText_Cabecalho: TQRRichText
        Left = 0
        Top = 1
        Width = 1030
        Height = 71
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          134.181547619047600000
          0.000000000000000000
          1.889880952380952000
          1946.577380952381000000)
        Alignment = taCenter
        AutoStretch = False
        Color = 15000804
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
      end
    end
    object QRSubDetail_Quesitos: TQRSubDetail
      Left = 53
      Top = 185
      Width = 1032
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRSubDetail_QuesitosBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.035714285714290000
        1950.357142857143000000)
      Master = QuickRep1
      DataSet = IBQuery_Rel_Topico
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape2: TQRShape
        Left = 645
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
          1218.973214285714000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape3: TQRShape
        Left = 717
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
          1355.044642857143000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape4: TQRShape
        Left = 797
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
          1506.235119047619000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape5: TQRShape
        Left = 870
        Top = 0
        Width = 1
        Height = 34
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          64.255952380952380000
          1644.196428571429000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape8: TQRShape
        Left = 944
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
          1784.047619047619000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRDBText_NObservado: TQRDBText
        Left = 647
        Top = 1
        Width = 68
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.366071428571430000
          1222.752976190476000000
          1.889880952380952000
          128.511904761904800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_Rel_Topico
        DataField = 'NOBSERVADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText_Abaixo: TQRDBText
        Left = 720
        Top = 1
        Width = 77
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.366071428571430000
          1360.714285714286000000
          1.889880952380952000
          145.520833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_Rel_Topico
        DataField = 'ABAIXO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText_Atingiu: TQRDBText
        Left = 798
        Top = 1
        Width = 72
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.366071428571430000
          1508.125000000000000000
          1.889880952380952000
          136.071428571428600000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_Rel_Topico
        DataField = 'ATINGIU'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText_Acima: TQRDBText
        Left = 872
        Top = 1
        Width = 72
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.366071428571430000
          1647.976190476190000000
          1.889880952380952000
          136.071428571428600000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_Rel_Topico
        DataField = 'ACIMA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText_Media: TQRDBText
        Left = 946
        Top = 1
        Width = 84
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.366071428571430000
          1787.827380952381000000
          1.889880952380952000
          158.750000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_Rel_Topico
        DataField = 'MEDIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText_Topico: TQRDBText
        Left = 25
        Top = 1
        Width = 640
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.366071428571430000
          47.247023809523810000
          1.889880952380952000
          1209.523809523810000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery_Rel_Topico
        DataField = 'TOPICO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 53
      Top = 221
      Width = 1032
      Height = 338
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
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
        638.779761904761900000
        1950.357142857143000000)
      Master = Owner
      DataSet = Form_Hab_FAC.IBQuery_Comentario_FAC
      PrintBefore = False
      PrintIfEmpty = False
      object QRRichText1: TQRRichText
        Left = 10
        Top = 1
        Width = 1026
        Height = 336
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          635.000000000000000000
          18.898809523809520000
          1.889880952380952000
          1939.017857142857000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
      end
    end
    object QRBand1: TQRBand
      Left = 53
      Top = 1231
      Width = 1032
      Height = 56
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
        105.833333333333300000
        1950.357142857143000000)
      BandType = rbGroupHeader
    end
    object QRBand_Sumario: TQRBand
      Left = 53
      Top = 559
      Width = 1032
      Height = 672
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1270.000000000000000000
        1950.357142857143000000)
      BandType = rbSummary
      object QRLabel_ResponsavelAssinatura: TQRLabel
        Left = 336
        Top = 154
        Width = 583
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          635.000000000000000000
          291.041666666666700000
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
        Left = 336
        Top = 105
        Width = 583
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          635.000000000000000000
          198.437500000000000000
          1102.430555555556000000)
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
      object QRShape9: TQRShape
        Left = 19
        Top = 366
        Width = 292
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          35.277777777777780000
          692.326388888888900000
          551.215277777777800000)
        Shape = qrsRectangle
      end
      object QRShape16: TQRShape
        Left = 20
        Top = 369
        Width = 100
        Height = 26
        Frame.Color = clBlue
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.506944444444440000
          37.482638888888890000
          696.736111111111100000
          189.618055555555600000)
        Brush.Color = clBlue
        Pen.Color = clBlue
        Shape = qrsRectangle
      end
      object QRShape17: TQRShape
        Left = 19
        Top = 393
        Width = 292
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.506944444444440000
          35.277777777777780000
          743.038194444444400000
          551.215277777777800000)
        Shape = qrsRectangle
      end
      object QRShape18: TQRShape
        Left = 20
        Top = 393
        Width = 100
        Height = 26
        Frame.Color = clYellow
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.506944444444440000
          37.482638888888890000
          743.038194444444400000
          189.618055555555600000)
        Brush.Color = clYellow
        Pen.Color = clYellow
        Shape = qrsRectangle
      end
      object QRShape19: TQRShape
        Left = 19
        Top = 419
        Width = 292
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.711805555555560000
          35.277777777777780000
          791.545138888888900000
          551.215277777777800000)
        Shape = qrsRectangle
      end
      object QRShape24: TQRShape
        Left = 20
        Top = 420
        Width = 100
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.506944444444440000
          37.482638888888890000
          793.750000000000000000
          189.618055555555600000)
        Brush.Color = clRed
        Pen.Color = clRed
        Shape = qrsRectangle
      end
      object QRLabel1: TQRLabel
        Left = 124
        Top = 369
        Width = 182
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          233.715277777777800000
          696.736111111111100000
          343.958333333333300000)
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
        Left = 124
        Top = 394
        Width = 182
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          233.715277777777800000
          745.243055555555600000
          343.958333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Atingiu o Esperado'
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
        Left = 124
        Top = 420
        Width = 182
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          233.715277777777800000
          793.750000000000000000
          343.958333333333300000)
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
        Left = 19
        Top = 343
        Width = 292
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          35.277777777777780000
          648.229166666666700000
          551.215277777777800000)
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
        Left = 383
        Top = 278
        Width = 421
        Height = 377
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          712.170138888888900000
          723.194444444444400000
          524.756944444444400000
          795.954861111111100000)
        Stretch = True
      end
      object QRLabel_DescricaoSecao: TQRLabel
        Left = 336
        Top = 177
        Width = 583
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          635.000000000000000000
          335.138888888888900000
          1102.430555555556000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Se'#231#227'o'
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
        Left = 327
        Top = 231
        Width = 670
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          617.361111111111100000
          436.562500000000000000
          1265.590277777778000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'GR'#193'FICO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object IBQuery_Rel_Topico: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSQ_Topico
    SQL.Strings = (
      'Select *'
      'From relatorio_fac'
      'Where IdTopico = :IdTopico'
      '')
    Left = 14
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTOPICO'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQuery_Rel_TopicoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'RELATORIO_FAC.IDCURSO'
    end
    object IBQuery_Rel_TopicoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'RELATORIO_FAC.IDTURMA'
    end
    object IBQuery_Rel_TopicoIDTOPICO: TIntegerField
      FieldName = 'IDTOPICO'
      Origin = 'RELATORIO_FAC.IDTOPICO'
    end
    object IBQuery_Rel_TopicoTOPICO: TIBStringField
      FieldName = 'TOPICO'
      Origin = 'RELATORIO_FAC.TOPICO'
      Size = 200
    end
    object IBQuery_Rel_TopicoNOBSERVADO: TIBStringField
      FieldName = 'NOBSERVADO'
      Origin = 'RELATORIO_FAC.NOBSERVADO'
    end
    object IBQuery_Rel_TopicoABAIXO: TIBStringField
      FieldName = 'ABAIXO'
      Origin = 'RELATORIO_FAC.ABAIXO'
    end
    object IBQuery_Rel_TopicoATINGIU: TIBStringField
      FieldName = 'ATINGIU'
      Origin = 'RELATORIO_FAC.ATINGIU'
    end
    object IBQuery_Rel_TopicoACIMA: TIBStringField
      FieldName = 'ACIMA'
      Origin = 'RELATORIO_FAC.ACIMA'
    end
    object IBQuery_Rel_TopicoMEDIA: TIBStringField
      FieldName = 'MEDIA'
      Origin = 'RELATORIO_FAC.MEDIA'
    end
    object IBQuery_Rel_TopicoIDFICHA: TIntegerField
      FieldName = 'IDFICHA'
      Origin = 'RELATORIO_FAC.IDFICHA'
    end
  end
  object IBQuery_Topico: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select IdTopico'
      'From relatorio_fac'
      'order by  IdTopico')
    Left = 14
    Top = 65532
    object IBQuery_TopicoIDTOPICO: TIntegerField
      FieldName = 'IDTOPICO'
      Origin = 'RELATORIO_FAC.IDTOPICO'
    end
  end
  object DSQ_Topico: TDataSource
    DataSet = IBQuery_Topico
    Left = 16
    Top = 27
  end
  object DataSource1: TDataSource
    DataSet = IBQuery_Rel_Topico
    Left = 16
    Top = 91
  end
  object IBTable_Rel_Topico__: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDCURSO'
        DataType = ftSmallint
      end
      item
        Name = 'IDTURMA'
        DataType = ftInteger
      end
      item
        Name = 'IDFICHA'
        DataType = ftInteger
      end
      item
        Name = 'IDTOPICO'
        DataType = ftInteger
      end
      item
        Name = 'TOPICO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NOBSERVADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ABAIXO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ATINGIU'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ACIMA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MEDIA'
        DataType = ftString
        Size = 20
      end>
    Filter = 'Abaixo = '#39'Cab'#39
    Filtered = True
    IndexFieldNames = 'IDTOPICO'
    MasterFields = 'IDTOPICO'
    MasterSource = DSQ_Topico
    StoreDefs = True
    TableName = 'RELATORIO_FAC'
    Left = 54
    Top = 65532
    object IBTable_Rel_Topico__IDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_Rel_Topico__IDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_Rel_Topico__IDTOPICO: TIntegerField
      FieldName = 'IDTOPICO'
    end
    object IBTable_Rel_Topico__TOPICO: TIBStringField
      FieldName = 'TOPICO'
      Size = 200
    end
    object IBTable_Rel_Topico__NOBSERVADO: TIBStringField
      FieldName = 'NOBSERVADO'
    end
    object IBTable_Rel_Topico__ABAIXO: TIBStringField
      FieldName = 'ABAIXO'
    end
    object IBTable_Rel_Topico__ATINGIU: TIBStringField
      FieldName = 'ATINGIU'
    end
    object IBTable_Rel_Topico__ACIMA: TIBStringField
      FieldName = 'ACIMA'
    end
    object IBTable_Rel_Topico__MEDIA: TIBStringField
      FieldName = 'MEDIA'
    end
    object IBTable_Rel_Topico__IDFICHA: TIntegerField
      FieldName = 'IDFICHA'
    end
  end
end
