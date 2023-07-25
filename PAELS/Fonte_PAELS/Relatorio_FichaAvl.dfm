object Form_Relatorio_FichaAvl: TForm_Relatorio_FichaAvl
  Left = 311
  Top = 121
  Width = 1296
  Height = 1040
  Caption = 'PAELS --> Ficha de Avalia'#231#227'o'
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
  PixelsPerInch = 96
  TextHeight = 16
  object QuickRep1: TQuickRep
    Left = 4
    Top = 1
    Width = 1270
    Height = 1796
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = DM.IBTable_Cad_FichaAvl
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
      0.000000000000000000
      2970.000000000000000000
      110.243055555555600000
      2100.000000000000000000
      110.794270833333300000
      110.794270833333300000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Pixels
    Zoom = 160
    object QRSubDetail_Dados: TQRSubDetail
      Left = 67
      Top = 362
      Width = 1136
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRSubDetail_DadosBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.994791666666670000
        1878.541666666667000000)
      Master = Owner
      DataSet = DM.IBQuery_PR_Avaliacao
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText5: TQRDBText
        Left = 2
        Top = 1
        Width = 48
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          3.307291666666667000
          1.653645833333333000
          79.375000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.IBQuery_PR_Avaliacao
        DataField = 'ID_ITEM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText_Nome_Guerra: TQRDBText
        Left = 53
        Top = 1
        Width = 335
        Height = 24
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          88.194444444444440000
          2.204861111111111000
          553.420138888888900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.IBQuery_PR_Avaliacao
        DataField = 'AREA_AVALIACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 392
        Top = 1
        Width = 603
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          648.229166666666700000
          2.204861111111111000
          996.597222222222200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.IBQuery_PR_Avaliacao
        DataField = 'DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 8
      end
      object QRLabel_Otimo: TQRLabel
        Left = 996
        Top = 1
        Width = 25
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1647.031250000000000000
          2.204861111111111000
          41.892361111111110000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_Bom: TQRLabel
        Left = 1023
        Top = 0
        Width = 27
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1691.128472222222000000
          0.000000000000000000
          44.097222222222220000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'BOM'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_Regular: TQRLabel
        Left = 1051
        Top = 0
        Width = 24
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          1737.981770833333000000
          0.000000000000000000
          39.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'REGULAR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_NS: TQRLabel
        Left = 1077
        Top = 0
        Width = 24
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1781.527777777778000000
          0.000000000000000000
          39.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_NA: TQRLabel
        Left = 1104
        Top = 0
        Width = 26
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          1825.625000000000000000
          0.000000000000000000
          42.994791666666670000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 389
        Top = -1
        Width = 1
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.223958333333330000
          643.268229166666700000
          -1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape2: TQRShape
        Left = 50
        Top = 1
        Width = 1
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          82.682291666666670000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape3: TQRShape
        Left = 995
        Top = 1
        Width = 1
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1645.377604166667000000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape4: TQRShape
        Left = 1021
        Top = 1
        Width = 1
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1688.923611111111000000
          2.204861111111111000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRShape5: TQRShape
        Left = 1049
        Top = 1
        Width = 1
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1734.674479166667000000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape6: TQRShape
        Left = 1076
        Top = 1
        Width = 1
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1779.322916666667000000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape7: TQRShape
        Left = 1103
        Top = 1
        Width = 1
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1823.971354166667000000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
    end
    object QRBand_Cabecalho: TQRBand
      Left = 67
      Top = 67
      Width = 1136
      Height = 295
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AfterPrint = QRBand_CabecalhoAfterPrint
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
        487.825520833333300000
        1878.541666666667000000)
      BandType = rbTitle
      object QRShape8: TQRShape
        Left = 1023
        Top = 267
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1691.128472222222000000
          440.972222222222200000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRShape10: TQRShape
        Left = 995
        Top = 267
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1645.377604166667000000
          441.523437500000000000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape11: TQRShape
        Left = 1049
        Top = 267
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1735.225694444444000000
          440.972222222222200000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRShape12: TQRShape
        Left = 1103
        Top = 267
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1823.420138888889000000
          440.972222222222200000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRShape13: TQRShape
        Left = 388
        Top = 267
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          641.614583333333300000
          440.972222222222200000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRShape14: TQRShape
        Left = 50
        Top = 267
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          82.682291666666670000
          441.523437500000000000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRLabel4: TQRLabel
        Left = 1
        Top = 269
        Width = 47
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1.653645833333333000
          444.830729166666700000
          77.721354166666670000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ITEM'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 52
        Top = 269
        Width = 335
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          85.989583333333330000
          444.830729166666700000
          553.971354166666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #193'REA AVALIADA'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 389
        Top = 269
        Width = 605
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          643.268229166666700000
          444.830729166666700000
          1000.455729166667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ITENS A SEREM AVALIDOS'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape15: TQRShape
        Left = -1
        Top = 313
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          -1.653645833333333000
          517.591145833333300000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape16: TQRShape
        Left = 1076
        Top = 267
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1779.322916666667000000
          440.972222222222200000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRLabel8: TQRLabel
        Left = 997
        Top = 269
        Width = 25
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1648.684895833333000000
          444.830729166666700000
          41.341145833333330000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'O'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 1024
        Top = 269
        Width = 24
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1693.333333333333000000
          444.830729166666700000
          39.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'B'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 1050
        Top = 269
        Width = 25
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1736.328125000000000000
          444.830729166666700000
          41.341145833333330000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'R'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 1077
        Top = 269
        Width = 26
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1780.976562500000000000
          444.830729166666700000
          42.994791666666670000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NS'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 1104
        Top = 269
        Width = 29
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          444.500000000000000000
          47.625000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'NA'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape17: TQRShape
        Left = 0
        Top = 268
        Width = 1133
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.204861111111111000
          0.000000000000000000
          443.177083333333300000
          1874.131944444444000000)
        Shape = qrsHorLine
      end
      object QRLabel14: TQRLabel
        Left = 923
        Top = 210
        Width = 173
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1526.315104166667000000
          347.265625000000000000
          286.080729166666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Relat'#243'rio Emitido em:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRImage1: TQRImage
        Left = 923
        Top = 11
        Width = 175
        Height = 195
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          322.460937500000000000
          1526.315104166667000000
          18.190104166666670000
          289.388020833333300000)
        Picture.Data = {
          0B544A76474946496D616765011A000047494638396164007400F70000FFFFFF
          F7FFFFF9F8F7F7F7FFFFFF84EFF7FFF3FBB5E6F7FFFBF0EBDCF7FFF2EFFFECEF
          F7FFFF0AEFECECFFFF00F9FD25DEEFFFD4EFFFD6EEF7F3E5DEFFF70DE5E7E8FF
          F700E6E3DECEE8F7F7F305F6F010C7E6FFF1DFD3FFEF01C5E6F7EFEF21E6E0D3
          F0EF19BDE6F7E6EF26E2EF31DEDEDEBBE6FFE6DEC1E7DEADE8D6D0F4E602EAE6
          23B6DEF7D5E64BDED6D0DAE642DFE638C5E66BE6D6ADB5DCFFFACEBDEEE219AD
          DEF7ADDDFFD6D6CED5D6D6E0D6A2EFDE23D6E629A5DDFFADDED6EFDE10E1D684
          D6DE5ADFD691EDDE05E4DE26E6DC33E4D94FDFD673C5DF62D6CECEBDDE73E4D7
          42E1D65FA5D8F7B3E44ABDDE6BCECECEB4DF80D3CCC59CD6FF9CD6F79FD5EF94
          D6F793D6FFDBD626C5CBD2ADD68FB8CAD994D1EFA1D6A2E0C0BCC5C5C594CEF8
          FFB5A58CCDFF8CCDEF84CEFE84CEEF8CCEC5B6C1C77BCEFFD1CC0296CBBD9CD3
          5A87CCD29BC1FF9FC3E17BC5FE8CCE73E6ADA07DC5EF73C6FF73C5F77DC5E373
          C5EFB1C7276BC5FF6BC5F76BC5EFCBADA284C57B6BBDFF97B5CB6ABDF763BEFF
          F79C8C6ABDEE8CB5CEADADBD5ABDFF7FB5D052BEFF90BD4E73BD84A5A7B87FAA
          FFE2988C52B5FF5FB4EB73AED796A7BDBA9FA2B4B00273A9FF4AB5FF42B5FFCB
          948F81A5C842ADFFBD9C39B59C4A3AAFFF68A3D0E9866EA2969EDE8C529BA514
          6B9CFF31ADFF42ADBDCE898429ADFF67A0C5A2A100B88A9235A6F24EA0E129AC
          D68F91AD2AA5FF7394B55599CE7B9C4221A4FFA5849419A3FF429BDE46A09CFA
          734DCE7B73489AD69F94005690FF19A5E6269EF2E6735AB87D7B6897513A96D9
          8984A16B8CB53697CE109DFF109FF24A98843494E65A8CC1089DFF928E017391
          343194D91998EC089CF46B903EE66B4AA5777B848C10009CFF2397C1FB633A1A
          94DC917989CB6E473392A00994FF4688BDCE6761BD6B6B0094FF568C59FA5A34
          008FF4A56B5A0B8BE65A844A008BFF847D001088C52185A6637E340387DCB55D
          68297F8E6B6B8C427963737100DA4A315F6F19FF400F317377FB3E21686600F3
          3C13AD4A422C6563FF2F045F5601F72705FF1D00524F0349460000000021F904
          00070000002C00000000640074000008FF005D641A48B0A0C18308132A5CC8B0
          A143849A50389848B1A2C58B18336ADCC8B1A3478C356474B040B2A4C9932853
          AA5CC9B2A5CB9728438E8449B3A6CD9B3565920CC1A3A7CF9F40830A1D4AB4A8
          D1A3474794D4E9008EB76950A34A9D4AB5AAD5AB58B36AC5EA6DD55291161CF0
          F14616AABAA764D3969DA636ADD9706CD77A2B47176D59B7C992B9651BB7ADDF
          BE76D542F5EB95E40FB04D9F424597C69862AA8FA57A3B77E757646F80C468DE
          F4986CA31B110E1CD870A595626FB14CA85ECDFA06B1CBA957CF893CB8B085C3
          23134745A72C17396A7C77B3933CCD9ABB5CB9DC4DF5B60180F3D98389CD704E
          DD798042684555DF0E20C06BC968AA17FFF82ED936EEB04E77E732A74FDF3363
          D4D4C12577CA993775D66AFDEAA7AF9E32CB9299401D1EA74DC71D75A29055CA
          81D41D405E54116C87DD72E621961E54E34893CB3BCABC638E24432052CE37A7
          7853CB10692853CF3BFE9D92CD72023A47205B945477C52698C40880090A5257
          C026AD9422A490CB6DC2DD0CB47555D279BA0DF6CC291C42694E072292E84D36
          1640A98C24EF9CA2CC39300E88D60DD4DD500E59C96CB081188DB0B5A073054C
          43D79C494EE15C043D5817CB6515E676E1621B76D9611AC091E84C3977E4524F
          3DE6F4E35B923ACE384D84CE35729A5E77BDD99D093374DAE9219D1153807353
          68F71C9F4B5A185938CB2C0A653F9250FFE38DA1889AF38E3EFE2C0A5C9832A2
          7900759C457599A60792D15921D461F72B0011A06A98AA539DA38FA3F5F8A3CC
          1DD690384E2292F4B3A23FFDCC53953791FA0A6C6772115BC0BAEC4237588C05
          2453CE15E70ADB277AB44D93CD37E9D8BA2228D29C02CA29F5B4578F3BCA8D5B
          2E54940260E96073A021CA609A1650CA2C18639C8CB0B104E01C04800092A773
          577466DB10D056350E3BA034EA4F97F578AB8C3B605E45AE986C8D0CC0146796
          23AA731BBC56B19C739E296C780C02E0E06927A76C5538D464834F3CB9E0C30E
          3AEA687573AF6C55529DC43952B7418FD615D2C8D96893D7308313B2D5B49FF9
          52C50E2CF1D403CB377143B670CE4903FFC09937C41EF8B791CE1D40C6E16418
          080092B5958432DC5ACD030AAEA0A49337AF00B8EB4D32641E0848767DFB4D56
          E7008871E65CB154570A5A6FE3AB5538E53C29DF56398B76C0E7C27A530868A2
          453045B06CC5C6DAF0A625D3C36A094A35C56A0F2B49D2E3AE6BFD8B2470D13E
          4D5E798DFB1431C4C4B59C5F820D167EEE6BB9ED38627C9C0E7E5BF8D493F5FA
          F0C72FFFFCF4AFDF7A53CDECA2FFFEFCF31F75FF000CA0000748C0021A907FCD
          18C5F96612968F3880010E8CA0042798910592E40331C8A00637C8C10E7AF083
          200CA1084748C20C3C0F2C16680120FAC0C216BAF085308CA10C6748C31ADAB0
          867408C10967F2023CD8E187400CA210FF8748C4221AF188484CE211E950071D
          5A007A16E8A112A7A8443DE8418856BC2215B73844263A118A52E42217AF5806
          2E50810A4D48A31AD5488532D8418B629CA21749A2021486318E48D4831CAAC0
          0216F4400C57880004D4B401136C2002374003197AD0C72AC8018E782CE21C2D
          50471EFA309246E4421FC9D08859600602A3E24E0122F09A5950820C37104115
          DE88C92E36918E76BC642B835805114C811298224B25DAA08B36B461113308C5
          0C16110A316C2C2DC9A8C41544D00456CED20E4CFC002C2DF9CC3756C1036230
          4DBEFAD04B62CEA097A15844F224831A3278A099CF8CE6344972C748EAA10C1E
          988236C7B58945F81298BA18661F36A6FFBD5888C1036310442BE92007695232
          96ADD443134C60A9CB79030D0B68C0020A308088560002E3D4DE266660838116
          749D5194251E3D70850759C51BB3B8853CE481000084211FF2E0C431CBB71C6D
          98530E9124A8412BC94E9172510E182050DCC8D2BDA874631FF9A0C10402B10F
          79BCA26B78982764BCD1088042928A0455CA41A929463D8CC1039518EA341A31
          05DC41C50308E0803CF8010E0108003B2805C415AED0A6A18A62035CB8AA12E9
          6007ADF234A45D1DC3064C33D5424C010D841DCC060430017BECA31A6E9D505A
          5A818629C01532B330415EB9C857BF22948BF06CC526F829AC4DF4000D9EA48D
          2FEC610F2F5C8011F4A0C753C9190B32FF942A5F28D5AC5E97D85790B6538972
          F08028F0700350756613098A1B37F8C18F09B894B9C8D0680F6693A4586CC08D
          58EDED567BCA451154A2143DD804F71E44D3A904631DEB70431308B18E6ED0C2
          660F9D8249D9220A0CE0548EDAFDEB6F8F28081B44A015A298C36BF03007BDC0
          3738D3204631A432D3717DC693CB298407764B44BE9280241DF8AC12B9308559
          F4604295100319066C56F189A210C9E0C52CD8E288474CA314342A6B6A21B389
          1BEC6939576802858568610C6B388922E0A437C4F0066F109818DA40C315502C
          2C515CE196D3E0442F50610A5458E21271B8C46B620188C342B848AEB90C314C
          805D24F6D80219E62A1205C1023CD8B4FFA472C518310A2106A10EA6CB98288B
          2AC0510D4B74A21796B0052356979642F4E07349AA440FB471194A8860C740A4
          031D2E8CE61F1BB10C33C094A229518929C4A2B685E01E2506B362643EE21230
          1EC31692810703F78518642869920061ACE5F4800B7BA5749AB9BB66113CEC7A
          FE2443A72B210A4F4EE1069C2186274B51895C96631611484023EA42965934DB
          33364ED215287119517820D73E56B311C77003C51CA31AC7F00625CABAE472D0
          B912DA20460F4ADA0A13446003F39EC26205B00132A0410CBC13C3696A7C6361
          1123CCB99B02AECDAC6B4B0F510F2C685B34B8111D3288610A73100520F28286
          1E88E235E510C50D5A33F2D664942D35FF36A9EE6A0D953D89E2D10C2F89C385
          28071618B818E038C6F5E2B2EE1988E1357446B437EEDA831EDCE0E84537FA0D
          7A3085F09663398D281955363E98196C2016531843CC4932735AB23C18D1E0C5
          2548EB0D62CC210226884521364E1664DDE9065740031EE65E59138CAA00615D
          0E194A3C98C16C0202809F838E9748690B74FD877A1001F0B8810A68006339A6
          DC4001B84D96394040D8AF815F324E1981114B867305978CC85B318D0288019D
          46A4030C642EEE21CAC106FCC4852F50118CE5C87B73F412EA680191779B8538
          1673589D6436013C615122DBE49A8318B49EFAD573BDF542AC82C0A1A2625914
          55588010AABA0FD083B9E0C1985AA344FFF715938CEF549B9F6441258499530A
          40A0BEC2CE373CF481A8071BB46D1AAE982D83E58B169F1D2F16A5B615EA3605
          8F716228555698B20926503268510AE5B6092CB063AAC77ABC56442C903CC4A0
          0A8AA07201763AB3100B6C510826507C5A510E73A0396230031180067481751B
          D05083712328C5024B147F875773DFC10BE0C00AA4253EDEB0096F5067A3556D
          62C009CC300E43E5173D706380E31CA2D00A57B0016FE06A6C41608AD10365D6
          4536387F3F54063D1015BC200B90310D85504878B0270A3223F0900F7B5007A9
          807E68120B9B90196FA00D87001DA8611D265060E832072CE70D57B070F04781
          8055445C207509964B6941091B100042FF073113B20DF2C0010B000DF0D00EC0
          E00863C00212104A080002A9300D57B031E5800700000187F00AB2C00BACA00A
          A8F00AC47005C6721A68B04A92B48515384455308BC43048E3150B8D60201090
          79A771055FB60D5ED009FBC05629D00013700117500225E0026EA04D62B03A84
          B327C2700B9CD009AC600BC270083DF074C28207EFC763B85888445405B3910C
          64201A8724480110000570000500014B467AB83715E3700FFC900F135001D4D1
          0020E002A67017735009B1780353A017AF700BA46065A4800C87808883510836
          406113F87CB928444D301BC4700895407C24290A2669929B400985B0096C310B
          D3272C851007BD20512550015F200586FF600DD5C31621D33D689262B8900AB3
          A00AA9C00B7860916C710819798B84B85F40D40404920C80A082F638001ED31D
          F5381A80008228F592F4352A01500217C0588A900A49520885F08EB673000990
          00BDE39601C08292A1941AF9024DE95341F49168310DB3200A95D00880A07CCD
          E11C856034097605C2320B10501D1220073D5005B88507A25023DC0101CBE231
          26405E74294976C991852807A0494B68802E7EE164F5083C80985ADA3098CE21
          06A9953D7A370BF4A23411E03164500E46420973060092C2934B89784144079D
          297F3D9578F5D89840C4055E7952CF760505308B0F1556DE90279F5805C9D577
          54E18E35B201A1B69A48229BB7E90D53FF3003E4658E79790012E046C2799776
          60052CE001221044634080594155B3500EAD30727BB20902472F13B00575559F
          87A019731017C4207C0048169B7059C24206B668077250004D8001182008EBE9
          992DE04318B0981200477270035325197820748D506064480C11D00082305F27
          050884D6195CD91990917540540607C0052250A178D0022581023CC457C17500
          CC07442CF0653462A4A88188E8A26CE53586E2B31CA2B09C576103F7F5432270
          8F5A77A186E70024310276D05F00708F650671C5E70D6F707F6C7105C2071978
          905AF1830724081EBF262CCB110B34084456E00136904679A05D1670020C4012
          1A500779C005368046555A7FBD39742CFF3718A73454CEB995C5500CCE30A9CE
          E00CB350630160A492410C0D3915C9500850178188670310E0017AFA076C6042
          16900117A00125610678004F2C20A170349FB4C17F92E169B8350B1E13002030
          021F70073C300206104AA37952677A192176190E4A7F54700056C9057DA00624
          E10035B00035C0A516D00580C00512200107200202054422509E68FA83F44963
          57F90069C02814401DE3372EADD07DCB2106717A03556A073680019A24077DA0
          05D74A04035004DC1A057D20079669031D457F2C002A1CB3AE0DCA777DD77411
          F0001F32040F1000474709E4F83D1E071B124B5F30F7437220AE078001768007
          4870AD4600004CC0AD191A441090851CFFE6ACDCF679E1D5688B090006E00043
          C0280E4000D4216B7A47B10F05B10DFAA07AC005A2E101F7A5550E0004002004
          DCFA01724007638001A34205902402A1871AF62A19B17003898552C7737451E0
          044EB0066CEB043E70742690AE7E585D235B762690A8548001E2CA05AACAAA0C
          70020070021410AB7FC0051840057D04470A95ACC23207489B9FE3140EC3300C
          C060B9B490B99A6BB997BB93641184B87505BD7767A4FA4313CA02881AB0D75A
          030D00000DB0AD24A1053E2408C12501432402486A3CA13718650B57AFC0011C
          90022E30BC2E9002C24BBCC0FB0A68118BB30875529A0C33908554500012C089
          2BCBA361B10403E01C4BC0AD3D947801FF000122B0AFF5E7B87E37AF9D8A5AE3
          F00525D00050F0BEF01BBFECDB0052600D628BA6BC8B7030C902E56AB25C1B00
          36F0077500AB6141B5CE61B52491016C90076350068E6003E42A441EB0BB46D6
          A8B9130E8600020D90035F10BF3910BFEFEB8C7E100E4C0A19DAB0B39D9AB734
          57462250067DD00525410120401D2050B8B1EB4363200203700058540523CB16
          75865BCCE00239D0001DECC120CCBE159002CA8B5B8088BFDE4006BFF9435CA0
          3401F0683B7AAD45A000D451B0DC0A0374A0071E00014D2001438A781EA0B4E2
          5356B4110E670002150005155002470CC2219C03ED0B05D6305557D09B7EF76D
          42540696A9B274B0AAD76AC0D40104DCFF6A01B22A07B40B78AEB7019CEA0DDA
          300576C616AFD08C02500200C0C1F09B031FFCBE5FD000029003003001232C19
          DAD0C749920C2670C6340B0176D0074A10C3335C1DAF5A124880C30380016370
          554D5B6E97316462C068C591045010CA1C5CC7499CCC5FF0C129800BA7110B87
          16BA8357445430490EA0BDDCD1BD825A077F60AA76F09EC06C034819175D460C
          E1300829208D729CCC710CBF97E0075090C7D108050D500250300E21886CB835
          07254B7FFD3BCB5150120CA003072203814A124A00080A3B00102001D74C7F22
          60BE1C930C43CCC93509005020001CFDBE5B800D9F90059C9C0302D9D1029002
          231CA52CAA3B802C4422E001D845504EFFE40044B00007A20044C0AD839A0772
          1050361000FB0A441EE02E92E1C62EE05650E0BA4B6DC4EF9B05D7E009EFCBD4
          005001A65C02D1BC179251082A8B459C28AE38D507057DAD429034084C12BB0C
          A15C7B00FC4B441E506497C1092950CFEFABCCF19B04C7A00A3890CC1F0CCAF0
          BBD7FC0C1980605F43240810D05105300679C006048CADADCB200BB003DC9A01
          66D007E02A07D10ACBE6CA8051610DC8FC05A00DDA5020DAA30D0559100DBE90
          05A2DCC1A4FD052930083B19176FF0D2415473B55A00F199C5641D3A3AB0D016
          00C67420085C10001B9A85F46703D9360DE1E0072980C7EF5B021FECCE789C03
          5B200ED860D55070CF3509CF3990D5D1FF3105F14944145A06A83BCB303CB05C
          DC370A60B02581B082E00118E0080730C5412408D76429C0D0DC002000A30C00
          FABCDF5F2090177006D7800D086093CE21C7FEBDD40280035F8084DE50092630
          D1F46707034005635000769007AF44120C2003A1E31C845B12940D0863603B43
          1D447AB4017270063880D31FBCDFF5ECBAFD7D0184100CBE400305D0DFFFCDDF
          02398D86400CFF5406BBD5464DB02E0760058080BD616104DB1BE230BBC85EFA
          076340A5154E448270062EC0C9462C9036D9BA74ECD12500099EE0095E0000EC
          4BE338ADCF1E9D0338B005E708448250064A83012CC0055CF006631D16AC0BE5
          CED100925D12199A075AE455B41D698FFF90CCCE11E39DBCD48D9EE064AE085E
          20008A4EE99CBC005F7001AE9B045FF0087C854536F0D50510818070DE1E8ED0
          7E2EE2364C124F204B119AB2CE044D594EC4730CCFFA5CCFB72E8D67E0077B10
          095FA0DA7C5DD7CAFCC12EE00703FDA5633CEA00105078A006AC1A164C90EAD5
          0104BE6D0108FB4305605F0140055C50AE7430082EB0DAE23EDA470CDA599005
          BD9E05E5BEEEE3EE0286F0E9763006655C00DFC602006B06041C164580D3D2EE
          1C0360048B6C015AD007E30C4A18608F3448078FF0052E90040EFFF00E8F0312
          3FF1123FBC52E005C49BF11A9FF12000059E2EDC11DD040720CB7AD007F85E12
          D8AAE9FD4E1D0BC0DEED8D077F4005FDFF4AEF0065078F6008389FF33ABFF338
          3F083EFFF3401FF43EEF07445FF4A640ABD93E007B3ACB6A90EF0E400182BBF2
          D531012B10F04F40077F600729CB02CC47077990079216F6623FF6645FF6618F
          7859A4078230BDE784B81030067FF0C2CFFEF42820F5DC71011F10F02D500704
          8F013650AE4035BED54444B70A0012C0B05CFF0774B0E7614101A86EF7DB0102
          556F1223A0068040504014AE141AEF839F9C5CFF436C16BE4D200880C006C3D9
          F88F0FF9DB71012EDFDE7470497210005A27F2292B076E644591A47556809E05
          705F355706D9D7054E74AD2150F7AACF200DE0CD2601036A80077CC502292B02
          102008A33E00788EE1687F45B86FB2B1FF1EEF9609017CEB080370CD7F50FA4C
          7EAD2B70CBC7CF200A700410741248C00630DFC03630DFF40E001E7000F93FAE
          2220025460070041A5899C3163F450F1E0818A1D3B65008C8120A100860365EC
          D0C1534749060B1D3B3230D200C04892254D9E4499524708071E3B6A50C20650
          1F3B36245081E021C001411230700180218087033E25787024622817867A2050
          6C52C646993F19A3847069C10105200A527E051B16C412062D5D664062860EA0
          3F7A061EF0A0270097323B3140606167404E474D02B05868C7AD842676F200C2
          63460956970E1C14391156F264930A84D4309B1586163678D8CA012D420E1509
          36F01695A014038B8922185EFC83B88EDE9617593B3AD000640165DEBC2F30D1
          90F9EC8B2866ECE0F19C870E1D3B5446DB9053A649D4326F3022B763464B0B0D
          B6B5526002A2F778DE208C5070ECDDC2871651BA98A9731131A0997DE8E7B153
          874D97282D46A8FFCE88C8C82390B213804B0F400B3418018616908030C21660
          188131001DD38089010BE470B20B8028A22CE11424312BC7182002880B3A6491
          37054E38A208F4122C513DC7B62AE28813766BB147174110C208222810F1461B
          6F7480010A7630420810BCF2314AF21600410620985882881A34E0520515B8D4
          A00622966002081440E051CA940202003B}
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 193
        Width = 881
        Height = 76
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          125.677083333333300000
          0.000000000000000000
          319.704861111111100000
          1457.413194444444000000)
        Shape = qrsRectangle
      end
      object QRLabel17: TQRLabel
        Left = 8
        Top = 200
        Width = 82
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          13.229166666666670000
          330.729166666666700000
          135.598958333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'Exerc'#237'cio.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 233
        Width = 146
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.648437500000000000
          13.229166666666670000
          385.299479166666700000
          241.432291666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Data da Avalia'#231#227'o.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 648
        Top = 233
        Width = 66
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1071.562500000000000000
          385.299479166666700000
          109.140625000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'Tempo.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape27: TQRShape
        Left = 0
        Top = 0
        Width = 881
        Height = 193
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          319.704861111111100000
          0.000000000000000000
          0.000000000000000000
          1457.413194444444000000)
        Shape = qrsRectangle
      end
      object QRLabel_DescCurso: TQRLabel
        Left = 8
        Top = 61
        Width = 119
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.648437500000000000
          13.229166666666670000
          100.872395833333300000
          196.783854166666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Turma.............:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 8
        Top = 117
        Width = 104
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          13.229166666666670000
          193.476562500000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Avaliados(a).:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 146
        Top = 118
        Width = 155
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          241.432291666666700000
          195.130208333333300000
          256.315104166666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'NOMEINSTRUTOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 147
        Width = 147
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.648437500000000000
          13.229166666666670000
          243.085937500000000000
          243.085937500000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ATCO............:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 146
        Top = 146
        Width = 117
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          241.432291666666700000
          241.432291666666700000
          193.476562500000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'NOMEALUNO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 474
        Top = 233
        Width = 58
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          783.828125000000000000
          385.299479166666700000
          95.911458333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'SETOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 352
        Top = 233
        Width = 117
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.648437500000000000
          582.083333333333300000
          385.299479166666700000
          193.476562500000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Setor...............:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 146
        Top = 62
        Width = 67
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          241.432291666666700000
          102.526041666666700000
          110.794270833333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_MontaTurma
        DataField = 'TURMA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 87
        Width = 117
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.648437500000000000
          13.229166666666670000
          143.867187500000000000
          193.476562500000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'In'#237'cio..............:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 146
        Top = 87
        Width = 109
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          241.432291666666700000
          143.867187500000000000
          180.247395833333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_MontaTurma
        DataField = 'DATAINICIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 435
        Top = 87
        Width = 125
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.648437500000000000
          719.335937500000000000
          143.867187500000000000
          206.705729166666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T'#233'rmino...........:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 562
        Top = 87
        Width = 136
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          929.348958333333300000
          143.867187500000000000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_MontaTurma
        DataField = 'DATATERMINO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 235
        Top = 21
        Width = 425
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          388.606770833333300000
          34.726562500000000000
          702.799479166666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FICHA DE AVALIA'#199#195'O PR'#193'TICA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRSysData1: TQRSysData
        Left = 923
        Top = 235
        Width = 173
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1526.315104166667000000
          388.606770833333300000
          286.080729166666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 95
        Top = 200
        Width = 102
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          157.096354166666700000
          330.729166666666700000
          168.671875000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'EXERCICIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 159
        Top = 232
        Width = 98
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          262.929687500000000000
          383.645833333333300000
          162.057291666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'DATA_AVL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 718
        Top = 232
        Width = 147
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          1187.317708333333000000
          383.645833333333300000
          243.085937500000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'HORARIO_INICIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 776
        Top = 200
        Width = 91
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          1283.229166666667000000
          330.729166666666700000
          150.481770833333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Est'#225'giario'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand_Comentario: TQRBand
      Left = 67
      Top = 449
      Width = 1136
      Height = 1310
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
        2166.276041666667000000
        1878.541666666667000000)
      BandType = rbSummary
      object QRDBRichText1: TQRDBRichText
        Left = 20
        Top = 45
        Width = 1100
        Height = 948
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1567.656250000000000000
          33.072916666666670000
          74.414062500000000000
          1819.010416666667000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        DataField = 'PARECER'
        DataSet = DM.IBQuery_CadFichaAvl
      end
      object QRShape19: TQRShape
        Left = 1233
        Top = -2
        Width = 2
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          54.570312500000000000
          2038.945312500000000000
          -3.307291666666667000
          3.307291666666667000)
        Shape = qrsVertLine
      end
      object QRShape18: TQRShape
        Left = -1
        Top = 1
        Width = 2
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          51.026785714285710000
          -1.889880952380952000
          1.889880952380952000
          3.779761904761905000)
        Shape = qrsVertLine
      end
      object QRLabel18: TQRLabel
        Left = 8
        Top = 10
        Width = 166
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          13.229166666666670000
          16.536458333333330000
          274.505208333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Coment'#225'rio(s):'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRShape20: TQRShape
        Left = 16
        Top = 1040
        Width = 498
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          3.307291666666667000
          26.458333333333330000
          1719.791666666667000000
          823.515625000000000000)
        Shape = qrsHorLine
      end
      object QRShape26: TQRShape
        Left = 632
        Top = 1040
        Width = 499
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          3.307291666666667000
          1045.104166666667000000
          1719.791666666667000000
          825.169270833333300000)
        Shape = qrsHorLine
      end
      object QRLabel21: TQRLabel
        Left = 708
        Top = 1208
        Width = 398
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          38.033854166666670000
          1170.781250000000000000
          1997.604166666667000000
          658.151041666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CHEFE DO '#211'RG'#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape28: TQRShape
        Left = 704
        Top = 1200
        Width = 404
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          3.307291666666667000
          1164.166666666667000000
          1984.375000000000000000
          668.072916666666700000)
        Shape = qrsHorLine
      end
      object QRLabel22: TQRLabel
        Left = 708
        Top = 1230
        Width = 398
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          38.033854166666670000
          1170.781250000000000000
          2033.984375000000000000
          658.151041666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Coordenador'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 634
        Top = 1042
        Width = 495
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          1048.411458333333000000
          1723.098958333333000000
          818.554687500000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'NOMEINSTRUTOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 18
        Top = 1042
        Width = 495
        Height = 25
        Frame.Color = clGreen
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.341145833333330000
          29.765625000000000000
          1723.098958333333000000
          818.554687500000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.IBQuery_CadFichaAvl
        DataField = 'NOMEALUNO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 636
        Top = 1070
        Width = 493
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          38.033854166666670000
          1051.718750000000000000
          1769.401041666667000000
          815.247395833333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Instrutor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 20
        Top = 1070
        Width = 493
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          38.033854166666670000
          33.072916666666670000
          1769.401041666667000000
          815.247395833333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Aluno'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object QRGroup_Svc_Terceiro: TQRGroup
      Left = 67
      Top = 388
      Width = 1136
      Height = 31
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
        51.263020833333330000
        1878.541666666667000000)
      Expression = 'qryOrders.Terms'
      Master = QRSubDetail_Svc_Terceiro
      ReprintOnNewPage = False
    end
    object QRSubDetail_Svc_Terceiro: TQRSubDetail
      Left = 67
      Top = 419
      Width = 1136
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        49.609375000000000000
        1878.541666666667000000)
      Master = QuickRep1
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel23: TQRLabel
        Left = 8
        Top = 1
        Width = 976
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          13.229166666666670000
          2.204861111111111000
          1613.958333333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'O - '#211'timo / B = Bom / R - Regular / NS - N'#227'o Satisfat'#243'rio / NA -' +
          ' N'#227'o Avaliado                           TOTAL DE ITENS AVALIADOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape21: TQRShape
        Left = 1103
        Top = 1
        Width = 1
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          51.263020833333330000
          1823.971354166667000000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape22: TQRShape
        Left = 1076
        Top = 1
        Width = 1
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          51.263020833333330000
          1779.322916666667000000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape23: TQRShape
        Left = 1049
        Top = 1
        Width = 1
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          51.263020833333330000
          1734.674479166667000000
          1.653645833333333000
          1.653645833333333000)
        Shape = qrsVertLine
      end
      object QRShape24: TQRShape
        Left = 1021
        Top = 1
        Width = 1
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.711805555555560000
          1688.923611111111000000
          2.204861111111111000
          2.204861111111111000)
        Shape = qrsVertLine
      end
      object QRShape25: TQRShape
        Left = 994
        Top = 1
        Width = 2
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1643.723958333333000000
          1.653645833333333000
          3.307291666666667000)
        Shape = qrsVertLine
      end
      object QRLabel_TotOtimo: TQRLabel
        Left = 996
        Top = 1
        Width = 25
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1647.031250000000000000
          2.204861111111111000
          41.892361111111110000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_TotBom: TQRLabel
        Left = 1023
        Top = 1
        Width = 25
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          1691.128472222222000000
          2.204861111111111000
          41.892361111111110000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'BOM'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_TotRegular: TQRLabel
        Left = 1051
        Top = 1
        Width = 24
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          1737.430555555556000000
          2.204861111111111000
          39.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'REGULAR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_TotNS: TQRLabel
        Left = 1077
        Top = 1
        Width = 24
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          1781.527777777778000000
          2.204861111111111000
          39.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel_TotNA: TQRLabel
        Left = 1104
        Top = 1
        Width = 25
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1825.625000000000000000
          2.204861111111111000
          41.892361111111110000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object IBTable_Aluno: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDCURSO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'IDTURMA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDENTIDADE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMORDEM'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'POSTOGRADUACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'IDUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGOALUNO'
        DataType = ftInteger
      end
      item
        Name = 'NOTAFINAL'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'IDSUBUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATAMATRICULA'
        DataType = ftDateTime
      end
      item
        Name = 'MOTIVODESLIGAMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATADESLIGAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'IDANTIGUIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'REGISTRARVEICULO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INSTITUTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TIPO_ALUNO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 125
      end
      item
        Name = 'CHAMADA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RESTRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESTAGIARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'ALUNOTURMA_PK'
        Fields = 'IDCURSO;IDTURMA;IDENTIDADE'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ALUNOTURMA'
        Fields = 'IDENTIDADE'
      end
      item
        Name = 'ALUNOTURMA_IDX_IDANTIGUIDADE'
        Fields = 'IDANTIGUIDADE'
      end
      item
        Name = 'ALUNOTURMA_NUMORDEM_IDX'
        Fields = 'NUMORDEM'
      end
      item
        Name = 'FK_ALUNOTURMA_TURMA'
        Fields = 'IDCURSO;IDTURMA'
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;ID_ATCO'
    MasterSource = DM.DSQ_Cad_FichaAvl
    StoreDefs = True
    TableName = 'ALUNOTURMA'
    Left = 209
    Top = 14
    object IBTable_AlunoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_AlunoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_AlunoIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_AlunoNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 125
    end
    object IBTable_AlunoIDUNIDADE: TIBStringField
      FieldName = 'IDUNIDADE'
    end
    object IBTable_AlunoIDSUBUNIDADE: TIBStringField
      FieldName = 'IDSUBUNIDADE'
    end
    object IBTable_AlunoESTAGIARIO: TIBStringField
      FieldName = 'ESTAGIARIO'
      Size = 1
    end
  end
end
