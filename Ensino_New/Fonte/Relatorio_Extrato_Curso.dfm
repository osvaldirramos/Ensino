object Form_RelatorioExtratoCurso: TForm_RelatorioExtratoCurso
  Left = 132
  Top = 100
  Width = 1156
  Height = 1048
  VertScrollBar.Position = 481
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
  PixelsPerInch = 96
  TextHeight = 16
  object QuickRep1: TQuickRep
    Left = 4
    Top = -471
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
      object Linha_05: TQRShape
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
      object Linha_04: TQRShape
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
      object Linha_03: TQRShape
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
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
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
      object Linha_01: TQRShape
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
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
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
    object QRBand_Sumario: TQRBand
      Left = 53
      Top = 233
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
        Top = 113
        Width = 583
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          635.000000000000000000
          213.556547619047600000
          1101.800595238095000000)
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
    object PageFooterBand1: TQRBand
      Left = 53
      Top = 185
      Width = 1032
      Height = 48
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = PageFooterBand1BeforePrint
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
        90.714285714285710000
        1950.357142857143000000)
      BandType = rbDetail
      object QRShape_02: TQRShape
        Left = 690
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
          1304.017857142857000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape_03: TQRShape
        Left = 774
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
          1462.767857142857000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape_04: TQRShape
        Left = 852
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
          1610.178571428571000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape_05: TQRShape
        Left = 935
        Top = 0
        Width = 4
        Height = 35
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1767.038690476190000000
          0.000000000000000000
          7.559523809523810000)
        Shape = qrsVertLine
      end
      object QRShape_01: TQRShape
        Left = 601
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
          1135.818452380952000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRRichText_Topico: TQRRichText
        Left = 1
        Top = 1
        Width = 1028
        Height = 331
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          625.550595238095200000
          1.889880952380952000
          1.889880952380952000
          1942.797619047619000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText_NObservado: TQRRichText
        Left = 602
        Top = 1
        Width = 86
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1137.708333333333000000
          1.889880952380952000
          162.529761904761900000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText_Abaixo: TQRRichText
        Left = 691
        Top = 1
        Width = 82
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1305.907738095238000000
          1.889880952380952000
          154.970238095238100000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText_Atingiu: TQRRichText
        Left = 775
        Top = 1
        Width = 77
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1464.657738095238000000
          1.889880952380952000
          145.520833333333300000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText_Acima: TQRRichText
        Left = 854
        Top = 1
        Width = 83
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1613.958333333333000000
          1.889880952380952000
          156.860119047619000000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object QRRichText_Media: TQRRichText
        Left = 938
        Top = 1
        Width = 90
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1772.708333333333000000
          1.889880952380952000
          170.089285714285700000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
  end
  object IBQuery_Rel_Topico: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From FAC_Relatorio'
      'order by  IdTopico')
    Left = 14
    Top = 12
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
end
