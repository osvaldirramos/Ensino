object Form_Rel_FichaDeViagem: TForm_Rel_FichaDeViagem
  Left = 313
  Top = 295
  Width = 992
  Height = 577
  Caption = 
    'Ensino --> Apresenta'#231#227'o de Alunos Para Finais de Semana e Feriad' +
    'os'
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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object QuickRep1: TQuickRep
    Left = 4
    Top = 2
    Width = 952
    Height = 1347
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = Form_SelTurma.IBQuery_AlunoTurma
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
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      120.000000000000000000
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
    Zoom = 120
    object QRBand2: TQRBand
      Left = 54
      Top = 45
      Width = 875
      Height = 267
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
        588.697916666666700000
        1929.253472222222000000)
      BandType = rbColumnHeader
      object QRLabel5: TQRLabel
        Left = 4
        Top = 90
        Width = 868
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          61.736111111111110000
          8.819444444444444000
          198.437500000000000000
          1913.819444444444000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Apresenta'#231#227'o de Alunos Para Finais de Semana e Feriados'
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
      object TQRShape
        Left = 4
        Top = 209
        Width = 870
        Height = 3
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          6.614583333333333000
          8.268229166666667000
          461.367187500000000000
          1918.229166666667000000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
      object QRLabel_Subdivisao: TQRLabel
        Left = 4
        Top = 52
        Width = 868
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.350694444444440000
          8.819444444444444000
          114.652777777777800000
          1913.819444444444000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Subdivis'#227'o de Aplica'#231#227'o de Cursos'
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
      object TQRShape
        Left = 4
        Top = 263
        Width = 875
        Height = 5
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          11.575520833333330000
          8.268229166666667000
          578.776041666666700000
          1928.151041666667000000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
      object QRLabel8: TQRLabel
        Left = 3
        Top = 212
        Width = 315
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          57.150000000000000000
          6.350000000000000000
          467.783333333333400000
          694.266666666666600000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ALUNO'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel1: TQRLabel
        Left = 319
        Top = 212
        Width = 312
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          57.150000000000000000
          702.733333333333400000
          467.783333333333400000
          687.916666666666600000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DESTINO'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel_Semana: TQRLabel
        Left = 270
        Top = 158
        Width = 299
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          595.312500000000000000
          348.368055555555600000
          659.253472222222200000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Semana de 23/06/08 a 29/06/08'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 11
      end
      object QRLabel10: TQRLabel
        Left = 632
        Top = 212
        Width = 125
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          57.150000000000000000
          1392.766666666667000000
          467.783333333333400000
          275.166666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATA'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel23: TQRLabel
        Left = 757
        Top = 212
        Width = 115
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          114.300000000000000000
          1670.050000000000000000
          467.783333333333400000
          254.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RUBRICA'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape2: TQRShape
        Left = 630
        Top = 212
        Width = 3
        Height = 75
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          165.364583333333300000
          1389.062500000000000000
          466.328125000000000000
          6.614583333333333000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRLabel13: TQRLabel
        Left = 697
        Top = 238
        Width = 60
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          57.150000000000000000
          1536.700000000000000000
          524.933333333333400000
          131.233333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Retorno'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape30: TQRShape
        Left = 873
        Top = 211
        Width = 3
        Height = 75
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          165.100000000000000000
          1924.050000000000000000
          465.666666666666700000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape9: TQRShape
        Left = 756
        Top = 211
        Width = 3
        Height = 75
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          165.100000000000000000
          1667.933333333333000000
          465.666666666666700000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRLabel4: TQRLabel
        Left = 633
        Top = 238
        Width = 61
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          57.150000000000000000
          1394.883333333333000000
          524.933333333333400000
          135.466666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Sa'#237'da'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape3: TQRShape
        Left = 694
        Top = 238
        Width = 3
        Height = 27
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          59.531250000000000000
          1529.622395833333000000
          525.859375000000000000
          6.614583333333333000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape4: TQRShape
        Left = 318
        Top = 212
        Width = 3
        Height = 75
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          165.364583333333300000
          701.145833333333300000
          466.328125000000000000
          6.614583333333333000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRLabel2: TQRLabel
        Left = 3
        Top = 239
        Width = 120
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          6.350000000000000000
          527.050000000000000000
          264.583333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Posto/Grad.'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel3: TQRLabel
        Left = 125
        Top = 239
        Width = 193
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          275.166666666666700000
          527.050000000000000000
          425.450000000000100000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nome de Guerra'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel7: TQRLabel
        Left = 321
        Top = 240
        Width = 309
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          706.966666666666800000
          529.166666666666600000
          681.566666666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fone/Endere'#231'o/Contato'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object TQRShape
        Left = 4
        Top = 237
        Width = 755
        Height = 3
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          6.614583333333333000
          8.268229166666667000
          522.552083333333300000
          1665.221354166667000000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
      object QRShape1: TQRShape
        Left = 123
        Top = 239
        Width = 3
        Height = 34
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333320000
          270.933333333333300000
          527.050000000000000000
          6.350000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape24: TQRShape
        Left = 1
        Top = 210
        Width = 3
        Height = 105
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          230.716666666666700000
          2.116666666666667000
          463.550000000000100000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRLabel_Instituto: TQRLabel
        Left = 4
        Top = 21
        Width = 868
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.350694444444440000
          8.819444444444444000
          46.302083333333330000
          1913.819444444444000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Instituto'
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
      object QRShape6: TQRShape
        Left = 7
        Top = 138
        Width = 221
        Height = 59
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          130.638020833333300000
          14.882812500000000000
          304.270833333333300000
          487.825520833333300000)
        Pen.Width = 3
        Shape = qrsRectangle
      end
      object QRLabel_CodCurso: TQRLabel
        Left = 12
        Top = 142
        Width = 214
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          26.458333333333330000
          313.090277777777800000
          471.840277777777800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CodCurso'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel_CodTurma: TQRLabel
        Left = 12
        Top = 166
        Width = 214
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          26.458333333333330000
          366.006944444444400000
          471.840277777777800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '99/9999'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object QRBand1: TQRBand
      Left = 54
      Top = 312
      Width = 875
      Height = 71
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
        156.545138888888900000
        1929.253472222222000000)
      BandType = rbDetail
      object QRShape5: TQRShape
        Left = 1
        Top = 1
        Width = 3
        Height = 70
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          154.516666666666700000
          2.116666666666667000
          2.116666666666667000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape7: TQRShape
        Left = 123
        Top = -1
        Width = 3
        Height = 71
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          156.633333333333300000
          270.933333333333300000
          -2.116666666666667000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape11: TQRShape
        Left = 318
        Top = -4
        Width = 3
        Height = 74
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          163.710937500000000000
          701.145833333333300000
          -8.268229166666667000
          6.614583333333333000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object TQRShape
        Left = 4
        Top = 68
        Width = 870
        Height = 3
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          6.614583333333333000
          8.268229166666667000
          150.481770833333300000
          1918.229166666667000000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
      object QRShape35: TQRShape
        Left = 630
        Top = -4
        Width = 3
        Height = 74
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          163.710937500000000000
          1389.062500000000000000
          -8.268229166666667000
          6.614583333333333000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape38: TQRShape
        Left = 694
        Top = -4
        Width = 3
        Height = 74
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          162.983333333333300000
          1530.350000000000000000
          -8.466666666666668000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape40: TQRShape
        Left = 756
        Top = -4
        Width = 3
        Height = 73
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          160.866666666666700000
          1667.933333333333000000
          -8.466666666666668000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRShape46: TQRShape
        Left = 873
        Top = -4
        Width = 3
        Height = 73
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          160.866666666666700000
          1924.050000000000000000
          -8.466666666666668000
          6.000000000000000000)
        Pen.Width = 3
        Shape = qrsVertLine
      end
      object QRDBText3: TQRDBText
        Left = 5
        Top = 24
        Width = 115
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          10.583333333333330000
          52.916666666666660000
          254.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Form_SelTurma.IBQuery_AlunoTurma
        DataField = 'POSTOGRADUACAO'
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
      object QRDBText4: TQRDBText
        Left = 126
        Top = 23
        Width = 190
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          277.283333333333300000
          50.800000000000000000
          419.099999999999900000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Form_SelTurma.IBQuery_AlunoTurma
        DataField = 'NOMEGUERRA'
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
      object TQRShape
        Left = 319
        Top = 23
        Width = 312
        Height = 3
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          6.000000000000000000
          702.733333333333400000
          50.800000000000000000
          687.916666666666600000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
      object TQRShape
        Left = 319
        Top = 46
        Width = 312
        Height = 3
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          6.000000000000000000
          702.733333333333400000
          101.600000000000000000
          687.916666666666600000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
    end
  end
end
