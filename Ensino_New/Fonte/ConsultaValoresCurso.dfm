object Form_AlunosPorInstituicao: TForm_AlunosPorInstituicao
  Left = 338
  Top = 86
  Width = 1077
  Height = 640
  Caption = 'Form_AlunosPorInstituicao'
  Color = 16577515
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid_Executados: TStringGrid
    Left = 0
    Top = 142
    Width = 1069
    Height = 467
    Align = alClient
    Color = clInfoBk
    ColCount = 8
    Ctl3D = False
    DefaultColWidth = 196
    DefaultRowHeight = 20
    FixedColor = clSkyBlue
    FixedCols = 0
    RowCount = 1000
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ColWidths = (
      337
      85
      142
      80
      78
      84
      141
      87)
  end
  object Panel1: TPanel
    Left = 0
    Top = 122
    Width = 1069
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 649
      Top = 0
      Width = 78
      Height = 20
      Align = alLeft
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clSkyBlue
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 338
      Height = 20
      Align = alLeft
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clSkyBlue
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 727
      Top = 0
      Width = 316
      Height = 20
      Align = alLeft
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'ALUNOS x DIAS '#218'TEIS DE:'
      Color = clSkyBlue
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 338
      Top = 0
      Width = 311
      Height = 20
      Align = alLeft
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'DIAS '#218'TEIS DE:'
      Color = clSkyBlue
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 1069
    Height = 122
    Align = alTop
    TabOrder = 2
    object JvGradient_Tela01: TJvGradient
      Left = 1
      Top = 1
      Width = 1067
      Height = 120
      Align = alClient
      Style = grVertical
      StartColor = 4227200
      EndColor = clGray
      Steps = 91
    end
    object JvShape2: TJvShape
      Left = 336
      Top = 5
      Width = 115
      Height = 50
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Assinatura: TJvTransparentButton
      Left = 335
      Top = 5
      Width = 112
      Height = 50
      Hint = 'Abre a janela de sele'#231#227'o dos respons'#225'veis pela assinatura'
      BorderWidth = 0
      Caption = 'Assinatura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00999999002F2D
        2900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00343E69001219
        420066666600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00746E82000D3166007CBC
        C40019194A005F5D5900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00B8B4B6000411550066AFAF0083C0
        BA0089C4D2001819530058576200D6D5CC00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF002F2D5E0029708C0086C3BE00E7F9
        FA0085C5C30084C6CD003C658D0014214E005B616900DED6CE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF007D7B93000F366C0073BBB000C9E0E000C5FF
        FF00FFFFFF0085C5C30073BBB00073ACB9003A7C9100021B48006E657800D6D5
        CC00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A19E9E000A1B5C005AA8A400A2D9D800F5EDED00B3AC
        AC00F1E2E200FFFFFF0099CCCC005DB2AF0079B6B10048909A002D5581001D25
        52006E657800CCCCCC00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00322E3F003A7C91005DB2AF00CCFFFF00FFFFFF00A19E
        9E000C6161008C8D8D00CCCCCC00A4F4F4004599980066C3C1005CABA2005997
        A1002A4E7E001D255200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF005899960062A9A600ABEEEF009B8BAE00B0B2B500FFFF
        FF00B7F0EF0000B3B300183C3C0070858500DFFFFF00C5FFFF0098ECED006AC1
        BF005CABA2005B97A000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0045999800ADD2D200F9E8E5005B5D7400A1A1B100807F
        9900F5EEF50098ECED000B010000580000007CBCC400CCFFFF00CCFFFF00CCFF
        FF0083E3E70045999800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0066AFAF00DEF2F200ABA5A80084849E00ADADAA007D7B
        93008E869D00A6AAB500768F8A00C8370800800000008CB5B500CCFFFF00CCFF
        FF00BDCFCF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A1D0D000B1CACA00BEB6BB00B0B2B5008484
        9E0078919B0029708C00DFFFFF00ABCBC4009F2C0000660000006EB3B700B6E1
        E100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A1D0D000C9E4E400CCCCCC0073A3
        9C004A81950083E3E700C5FFFF00C5FFFF00ACC9C100C0330400660000009BAA
        AD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0096C2C200D8D7D7008CB5
        B5009CBAB600B7F0EF00C1FFFF00C1FFFF00C1FFFF0088A19B00B12E06007900
        0300BABCBF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D8D7D700FF00
        FF00FF00FF00BBC4C40099CCCC00B5E7E700BDCFCF00FF00FF00DDCEC700AF38
        1000660B0800B3BEC100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B0B2B500FF00FF00FF00FF00FF00FF00D4B9
        AC0066000000BB9EA300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_AssinaturaClick
    end
    object JvShape6: TJvShape
      Left = 8
      Top = 5
      Width = 115
      Height = 50
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Retornar: TJvTransparentButton
      Left = 7
      Top = 7
      Width = 112
      Height = 50
      Hint = 'Retorna para janela de montagem da prova.'
      BorderWidth = 0
      Caption = 'Retornar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C4C4C400CCCC
        CC00C9C9C900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00C1C1C100D4D3D300A2A09F003E39
        37005C595700D3D3D300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00C6C6C600C5C5C500C0BEBD0023212100182022002F5E
        710047687B00605D5B00C9C9C900FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00C1C1C100D6D6D6008D8B8B005754520000040A00375D6C0041819C003E7B
        940055788D00534F4D00CACACA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C1C1
        C100C9C8C8001E171400212627002753660042839B005890AE00528DA8003C7D
        960054768B00615C5A00E1E1E100CECECE00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D1D1
        D000040404003D6E82004684A00046809A00548AA5004574950037627E00376B
        83006385980000000000000000002F2F2F00CECECE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E1010004A8DAA005286A500497896004E7E99004677970038648000366B
        84006F8B9800000000000808080038383800CECECE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E101000538EAB004A79990037658200427288004477950039627E003769
        82006E8B9800000000000808080038383800CECECE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E1010004F8CA800497A98003A6784003D72880045769500327892002F7C
        9100708FA400000000000808080038383800CECECE00CDCDCD00C7C7C700FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E1011004B8AA300467995003B688600376A82003558720018A0AC0022AE
        BD00718A9F0000000000080808003A3A3A00EAEAEB002A2B2C0078787800CCCC
        CC00C4C4C400C1C1C100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000F1011004387A3003C718D0037627E003A738A005D8AAA003AA8BC002494
        A500718CA100000000000B0B0B0035353700434141004C453D0036373900A6A6
        A7009B9B9C00B4B4B400C1C1C100FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000F11110041849E0045769000467790005591AC0044739300385D7A003866
        7F006F90A400000000000D100F00010300007C705A007B6B5C0026211D001E19
        150001000000696A6A00C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E1010004F8CA9004F80A0003F6F8D004B7B96004777970038648000366B
        83006E90A4000400000002010400B1A17E00A997760093866C00897968007B6D
        5E003C3730006C6D6E00C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E101000538DAB004B7A9A0038668300407186004477940038648000366B
        83006E90A300040000001E1720000F0D0900A5947400A1907000746A5200776B
        5100433A270065666800C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E1010004D8BA600477997003A6784003B72890043789700396481003569
        82006E90A300040000001D161D002223250043413B0094846400191C21007678
        7A006E6F7000A5A5A500C2C2C200FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E1011004A8AA400457996003B68860038688000335F7600346279003B78
        91006F91A600030000001A1A1A003B3B3B00DBDBDD000E0E0E0065656500D2D2
        D200C7C7C700C2C2C200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000F1011004386A100396A840036607B003B6F86003B778F004F87A0006FA6
        C1005F7481000E100A001A1A1A0036363600D0D0D000CFCFCF00C9C9C900FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000F11120043819B003A708700386F8600427F980075A5BF007799AE004B4D
        5A00222821001E271E00181F180036363600CECECE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
        D0000E1011003F7F99004D859E006C9DB6007C97AB00474B520025201D002B2B
        29002F272E00322A32001F211F0036353600CECECE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D1D0
        D000020406007DB6D400728FA2004D575E002F2C2B002D2C2B00313131003131
        310031313100313231002A272A0032323200CECECE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C3C3
        C300AEAEAE00070809000F0E0E000A0907000E0E0D000E0E0E000E0E0E000E0E
        0E000E0E0E000F0F0F000808080043434300CCCCCC00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00C3C3C300D1D0D000D1D1D100D2D2D200D2D2D200D2D2D200D2D2D200D2D2
        D200D2D2D200D2D2D200D2D2D200CCCCCC00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_RetornarClick
    end
    object JvShape1: TJvShape
      Left = 128
      Top = 5
      Width = 115
      Height = 50
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Windows: TJvTransparentButton
      Left = 128
      Top = 7
      Width = 112
      Height = 50
      Hint = 'Sai do Sistema e retorna para o Windows.'
      BorderWidth = 0
      Caption = 'Windows'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BB46
        0900BD3E0300B6490D00B24D0D00AD480C00AA470A00A8490C00AE4A0B00B549
        0800AF470300A94A0200A8500400AC540900AA521500AD541A00AE591C00A359
        1B0099551E009B561E00A2551E00AB551900B5541100FF00FF00C0470700AB4F
        1400AD4A1200B4471100B8450D00AA370500AA410000AF460000B04C0600A853
        1400BD590C00BD630F00A76211009C591400AA480F00B33B0600B63C0100BB47
        0400C0450A00B9430D00B3460E00B1490F00B14E0F00FF00FF00C1420400B54E
        1400B8471100B7460F00B0480F00B8511600BA590B00CC671300D0782500C386
        3100DB8D2B00E3912A00D38B2B00CA833500D0753A00D36F3900B35418009F44
        0100AE460A00B7481100B7471100B74C1000B8501200FF00FF00C7400400B447
        0E00B9440E00A2320300A1461300D0772C00D2761800DF7F1D00E68D2300EB9E
        1E00FAA51900FCA81300F5A10F00EB971B00E78C2800D9842C00D48C3900C079
        2F009C410E00A3330300B9440E00B7460B00BA4C0F00FF00FF00C63C0100AD40
        0700AD3B0300A73A0C00C9713A00CE7D2600D77D1300E78A1A00FB931900FF9B
        0600FFA20100FFA70000FCA50000F49D0900F1971200EB931300D3871500D691
        3900CC733E00A73A0C00AD3B0300B03E0600B1430800FF00FF00C53B0100A240
        0500A2380000D8773900D7843500CD7E1D00DF7D0A00EE890D00F28E0D00E88E
        0A00CE921300C0971C00BE971F00BE8C2100D2851500ED8D0A00E8890100CE7A
        0D00D6833200D8783900A2380000A83F0500AB420400FF00FF00C4410500943F
        0200B95F2000D7872D00C77A0E00CF7C1700E27A0200F4850600D3830E009C94
        430083AF7B007ABE9B0078B8A20085A79C00AF936800D07B1D00F4850500D878
        0000C6760600D7882F00B95E20009B3E0200A2410400FF00FF00BC3D0200984C
        0B00CE7E3C00B9721800BD6F0600C8770C00D8710000E67A0000BB811F0098D6
        B00067E7EA0042E0F70037D1F70044C1EE0090BABF00AD7B3E00DE710300DE73
        0A00BF6E0300B9731900CE7E3C009F4B0B009B400100FF00FF00BA3E0200A65D
        1A00C87A3700A95F1100BC691300D0861400DA7B0500EA8F1800AF8A32008AD2
        B8006AF2FF003BE4FD0033E6FF0024CFFA0069CED700928B5700C4670D00D063
        1400BB631000A9601100C77A3700AD5C1A009D430300FF00FF00BA3E0300BA6E
        2B00BD6E2A00A64D0400C3631800D99C2800E4952000F7B94800C5AE580085AA
        8E00A2FFFF0071F1F60054EDF30030E5F9004EE1E2007AA07200A2581000C358
        1F00BF571400A7520500BD6E2A00C16D2B009C410000FF00FF00BA3E0300C776
        3100B05E1700AD4B0000C35F0600DBAB3200ECAE3B00F7D16800EDDF92008E8F
        6B00CFF6EF00C8FFFD0095F2EE0059EBF3005CEBF2008EC2A300945A1B00B44E
        1300C2540000AE500000B05E1700CC753100A2430300FF00FF00C0440700C277
        33009B4F1400A0460600B4590C00E4B33100F0BC4800F8D78600FFF7BE00B5A0
        7100C4CEB4009EB09D0073947F004E99870053A18F008EA08200915B2700A04D
        0D00B04F0700A44A08009B4F1400C8763300A5480600FF00FF00C1450600BB73
        3200954A150091370400AB4E0D00F9BF5900FFCE7600FFF3BB00FFFFF700AD9D
        70005F5D3F009DAD9300A8CFAF008AD2AA0067B69000709068007F5D2900954A
        0900A2400300963C070094491400C1733200A3470400FF00FF00BE460600BC76
        3500904714008A3A0300A15115008F644A0090755D008D907B004D6C51003058
        3A0097AB9400D6FFE70099F6D00071ECBD005FDAA3007ACB90007F834500833C
        0200A44C0F008A3D060090461400C1743500AC510D00FF00FF00BC450500BD77
        3B0092491A006A2D0000784312009496BD005D7D9E0039808E0052B9B2007DE7
        DE0052827800B3F1DC0078EECB005EE4B80058D9980059BD7400739254007841
        1000723600006B31000092491A00C2733800AA541300FF00FF00B9430300B871
        38009C5125007D370100824A22007E98DE006FACEB0066C9F60065DFF6006BD9
        E600406D71008ECEC1006FE7CB0055D7AE0051CC8C004BB268006B995F007045
        1E007E3C0B007E3B09009C512500BC6E3500A7511100FF00FF00BA440500B16A
        3200AD6235008A3A0A00864627007D88D100769FEA006CAFF80068BDF70078C9
        F1006D8FA30084B5B3008AE0D00078CFB30076C591006AB2750082A979008D6E
        4F00833E15008C3D1000AD623500B5672F00A9531300FF00FF00B7400200A75C
        2300B86A3E0095451700844829009287BA008C96D400869EEF0085AAF90088B8
        EE008CA6C00092ABB20098B7B3007B9184007582600076895D008C9672009A81
        660080431E0096461C00B86A3D00AA592100A7501000FF00FF00BA4202009B4C
        1000B6623400AB5E310085512D00988BA0008F92B2008F9DDA008FA2E8009AAC
        DB009CA6C10081818C00796B6A008A6A62008C635500785A4300745F45007B5C
        3F00804A2200AD603500B66234009E4A0F00A74C0C00FF00FF00BA4001009C49
        0A00A54E1C00B3602F00BE755100B3AFC00095949F008291AE009199C100A18E
        AF0096859E008F83880096867B009C7F700096756A00916D60008C624C009357
        3500A0592D00B7663600A54E1C009F460900AB4D0C00FF00FF00B94102009D46
        06009B3F0B009B541E00AE5A2B00C09C8E00B9A1A100A7999F00A69AA500A78D
        9D00A992A200A2939100A08E7A00A387710094746D009C736E00A2665100AD5E
        3500AB6933009C5420009B3F0B00A1440400A9480500FF00FF00B64001009C41
        00009F4108008F440E0094420E009B542000B3724F00BB8D8300C9B2AD00B4A7
        A900B3A1A600B29D9800B59C8900B6968000A9867800A2776700AC6F5100B464
        3600A25B24008D400A009E3F0800A0400100A4430200FF00FF00B7400100A043
        0200A24103009D3E09009B3D0800913C040098501D00A6714E00CEB09B00C6B9
        AB00CCB6A800CDAB9B00C79C8900B48A7100A8805F00A67B5200B57E4F00A55C
        290097390600A13C0800A33D0700A2420200A5430500FF00FF00}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_WindowsClick
    end
    object Label2: TLabel
      Left = 95
      Top = 80
      Width = 55
      Height = 17
      Caption = '   M'#234's.:  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 285
      Top = 80
      Width = 106
      Height = 17
      Caption = '     Localidade.:  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object JvShape3: TJvShape
      Left = 640
      Top = 61
      Width = 115
      Height = 50
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton1: TJvTransparentButton
      Left = 639
      Top = 61
      Width = 112
      Height = 50
      Hint = 'Refaz os Calculos de ALUNOS x DIAS '#218'TEIS'
      BorderWidth = 0
      Caption = 'Calcular   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F1F1F1F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F6FCF6F9FFF8FFDCFAF08FF9D591F3D2ADF3DDB6F4
        E1A3F4DA86F3D2A4F4DBFEF6FAFFF5FCF6F5F6F6F6F6F6F6F6F6F6F6F6F6F6F7
        F7F7F6F6F6FFFFFFFFFFFFFFFFFFFFFEFFFFFFFFCDFDEB47F5A87CF6B69FF7C9
        88FBCF70FDD46FFCDC78FCD597FAD099F6C65BF6AD6FF8C4FFFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6F6F6FFFFFFFEFEFEFFFEFEFFFEFF5DF5B06CEF997E
        F2B11DF7A117F8AA23FAB629FCC12CFDC828FCC220FAB712F9AC44F6AC96F1B1
        36F192D1FBEAFFFEFFFEFDFEFFFFFEFFFFFFF6F6F6FFFFFFFFFEFEFFFEFF32F2
        8D8BEB9923FC981DFFAD2CFFB930FFC232FFCC34FFD433FFD734FFD531FFCD32
        FFC52BFFBB10FFA467F09F48EB82B5FADCFFFDFFFEFDFEFFFFFFF6F6F6FFFFFF
        FFFFFF3EF18B81E78E0FF88419C262046211066D19066E1B076F1D056E1C056F
        1C066E1E07701C066E1B056916118F3C1BFF9C43EE8D3DE874CFFBE8FFFEFFFF
        FFFFF6F6F6FFFEFF8BF5BB61E4730DF07623F98914B454004E00025900005800
        005B00005900015800005B00005800025600005700097C2525FF9C16F1814FEA
        8320E865FFFEFFFFFFFFF7F6F7FFFFFF26E3562DEC7119EF7420F88313B65100
        3C0026FA9A24F2960039001FD7822FFFC6003F0014A74E32FFC6004B00097F24
        26FF9720EF800CF17360E4735EF29BFFFFFFFFF7FF7EF5A850E0610BED6519ED
        6F1EF77E13B54E0049000A86280A83270053000A7B210E8C33004E00109F4129
        FFA9004C00097D2322FF911CED781AED7222EB6926E052FFFFFFFFF7FF30E65B
        2EE55F16EC6018EC6A1BF47911B44B005400004F00004E00005F00005000004A
        00005600109E3E25FFA0004C00097D2121FF881AED7219ED6D0CED643CDE52A7
        FAC5EFF4F322DF3F13EA5416E85C17ED6218F37015BB490453001DE9771BE274
        00480019CA6123FF930042000EA23B26FFA0004D00077C1F1CFF801AEC6C18EC
        6513EB5D37E1535DEE87C2F3D125DB380BE94F14E95617EA5C17F16616BF480F
        6C0C17B14214AC3F0A6706109D3514B046005000087D1C10B749005400077C1E
        1DFE7817EA6518EA5E12E95725E2503BE961AEF0C021D93408E9460DE74917EA
        561AF0601BC5491E8520137B161177131884200A6B0A005C00086D0C00530000
        3D00005A00087C1C1FFF6E1AEB5D10E8530FE84F1FE3492CE54DB4F1C319D728
        02E53C50F7705CFB785DFF7C45D35B1B8B214BE66D48DF66127D173FCD5A53EE
        7501620327A4395DFF85004F0019802164FF875AFC7860FC7B13E74A1AE0402A
        E349D4F4DB0CD71E0CE63A6EFC8660F87E62FB824DD966249C2F4DDC684AD765
        1B8F2442C7574FDD6B086F0E289F3556E1730050001B80226DFF905FF67F6AFA
        8428ED5519DD343CE559FFF6FF09D81902DF2B76FA8C6DF78872FC8C56DF6E2D
        B23E31B3402EAE3C2EAF3E259E301C91251E92290F7B180367050059001D7E24
        7BFF986EF7887DF99215E94515D52576F18BFFF8FF35E4460BD62056F1717EF8
        937CF99560E27555DA686AEA8461DF7659D86F53CC6850C05E4DBB5C50BF5F50
        BD6160D975186D1C88FFA279F8927DF59600E12600D10BD1FCD9FFF6FEB6F8C0
        01CE0504E2279BFAAD8AFA9D6AE97F5FE37452DE6739C94C2AAB38188D220169
        06004F000051000048006AD77A1A711E96FFAD99FAA92FEA4F0DD9220BDC1CFF
        FFFFF6F6F6FFFFFF12DC1F07D3153DEA56ADFAB973F08769EB7F6DFC864EE164
        3CC04E279D2F107917065B07035C0300540079DD891C721FB1FFBF79F18B00E0
        1700CC00AFF5B7FFFFFFF6F6F6FFFFFFEBFCEC00CD0000D90E5EEC7297FAA759
        F6717CF28F77EA8B79E88B76E58871E08474DE836CD57B6DD07834993C2C782B
        A9FFB800E11008CE0D32E43EFFFFFFFFFFFFF6F6F6FFFEFFFFFEFFAEF5B200CA
        0000D80634E6448FFCA478EE8D6BE37D63D9745ECE6B56C46351B95B4CAE5649
        A5515C9F622FAF3A00E91202CD0807D90EFFFFFFFFFFFFFFFFFFF6F6F6FFFFFF
        FEFEFFFFFFFFACF5AE00CC0000CF020ADF147FEF87CDFAD0DDFDE5DEFFE4DFFF
        E6E2FFE8DAFFE0A0FBA829EE3700E30E00C80011DB15FFFFFFFFFEFFFEFFFEFF
        FFFFF6F6F6FFFFFFFFFEFEFEFEFEFFFEFFE8FBE707D70700C80000D20000DB00
        0DDF1524E32926E22B14E11E00DD0300D70000CB0000CB0065E968FFFFFFFFFE
        FFFEFEFEFFFFFFFFFFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
        F5AC29DA2700CC0000CA0000CA0000CA0000CA0000CA0000D10060E761F3FEF2
        FFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F8F8F8F8F8F8F8F8F8F8F8
        F8F8F8F8F8F8F8FFF9FFFFFBFFFEF7FDC6F2C6A7EDA9A0EDA0B2EFB1DEF4E0FF
        FAFFFFF9FFFAF8FBF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = ToolButton_RecalcularClick
    end
    object JvShape4: TJvShape
      Left = 512
      Top = 61
      Width = 115
      Height = 50
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton2: TJvTransparentButton
      Left = 511
      Top = 61
      Width = 112
      Height = 50
      Hint = 'Pesquisa de os Curso de Acordo com o Aluno.'
      BorderWidth = 0
      Caption = 'Pesquisar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        D6050000424DD605000000000000360000002800000017000000140000000100
        180000000000A005000000000000000000000000000000000000DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDDDDDDA7A7A7A1A1A1DBDBDB00
        0000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBCBCBCB9292926A6A
        6A6262629D9D9D000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBB6B6B6
        8C8C8C6262625858586161618E8E8E000000DBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBA8A8A8898989696969696969727272848484D9D9D9000000DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBD4D4D49D9D9D8787877676767878788383839E9E9EEBEBEBDBDBDB00
        0000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBCCCCCCC7C7C7CDCDCDDCDCDC
        DBDBDBDBDBDBDBDBDBBDBDBD8C8C8C8181818282828888888F8F8FBBBBBBDBDB
        DBDBDBDBDBDBDB000000DBDBDBDBDBDBDBDBDBDDDDDDADADAD9A9A9A8182826E
        6F6E6B6C6B737474979698C9C9C99999997171717676768787878F8F8F999999
        D1D1D1DBDBDBDBDBDBDBDBDBDBDBDB000000DBDBDBDBDBDBDBDBDB9090906E6E
        6E4D4D4C7170689290819291817C796F4A49454E4D4E57565756565671717185
        85859F9F9FE5E5E5DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DBDBDBE1E1E1
        8486855F605F737169D2CEBAE9E4CCE7E3CAE7E3C8E4E0C4D8D3BB8684763E3E
        3D5554556F6F6FA3A3A3DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00
        0000DBDBDBA1A1A16666667C7873E7E4CFEEE9D3ECE8CFEAE6CDE9E5CAE8E4C8
        E5E3C6E1DDC2928F7D3E3C3C9B9B9BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDB000000E9E9E9747474696767DAD6C8F1EDD9F0EDD9F4EFDAF3
        EFD8F2EED6EFEBD2EBE7CEE7E3CAD8D4BB5F5E547C7D7DFBFBFBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000D3D3D36D6D6D94948FF4F0E0F7F3
        E0FAF6E4F9F3E1F8F2E0F7F1DDF5F0DBF4F0D8F0ECD2E6E4C79793804B4A49F6
        F6F6DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000C9C9C9737373
        BAB8AFF8F4E5FBF7E8F9F6E7FAF6E5F8F4E2F7F3E0F6F2DFF6F2DDF5F0DAF1EC
        D4B1AC98464443E8E8E8DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00
        0000D2D2D27B7C7BC5C3B9FCF7EAFCF9EAFAF7E8FBF7E6FBF7E5F9F5E3F8F4E1
        F8F3DEF7F2DDF4F0D8B2AE984C4B49E8E8E8DBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDB000000E8E8E8878786BCBAB3FCF9E9FDF9EBFBF8EAFBF8E9F9
        F6E7F9F7E6F8F6E4F9F5E3F7F2E0F1ECD8A29D8D585656DBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DBDBDBA7A7A7A3A29EF8F6EAFCF9
        ECFCF9ECFBF8EAFBF8E9FAF7E6FAF8E6FAF6E4F9F5E3DAD7C4827F738A8A8ADB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DBDBDBE1E1E1
        999898D0CEC5FCFAECFDFBECFDFAECFCF9EBFCF9EBFAF7E9FAF7E8EAE8D7A7A6
        956B6A66D7D7D7DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00
        0000DBDBDBDBDBDBCECFCE9D9D9AD3D0C5F8F5E7FCF9EBFDFAECFBF8EAF7F4E6
        E2DFCFAFAD9E7B7B73ABAAABDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDB000000DBDBDBDBDBDBDBDBDBD1D1D1A6A4A3BAB8B0D0CEC2D7
        D4C7D4CFC4C2BEB1A4A09681817DB1B2B2DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000DBDBDBDBDBDBDBDBDBDBDBDBE9EC
        EACDCCCDC3C3C2BFC0BEB9B8B6AEADACB4B4B4DFE0E1DBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB000000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_AssinaturaClick
    end
    object JvShape8: TJvShape
      Left = 7
      Top = 60
      Width = 81
      Height = 51
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Imprimir: TJvTransparentButton
      Left = 6
      Top = 62
      Width = 83
      Height = 48
      Hint = 'Imprime relat'#243'rio'
      Caption = 'Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C6C6C600CECECE00CECECE00FF00FF00FF00FF00CECECE00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6C600C6C6
        C600CECECE00CECECE008C8C8C0094949400CECECE00CECECE0094949400CECE
        CE00C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CECECE00ADADAD00C6C6
        C6005A5A5A00737373001010100021212100A5A5A5008C8C8C005A5A5A004A4A
        4A00CECECE00C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00CECECE00A5A5A500393939006B6B
        6B00424242004A4A4A00424242004A4A4A00292929004A4A4A00FFFFFF00B5B5
        B5004A4A4A00CECECE00C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00CECECE00BDBDBD0008080800EFEFEF001818
        18009C9C9C003939390042424200CECECE0018181800FFFFFF00F7F7F700F7F7
        F700B5B5B50042424200D6D6D600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00CECECE00A5A5A500181818008C8C8C00F7F7F7005A5A
        5A008C8C8C00A5A5A50031313100CECECE005A5A5A00E7E7E700FFFFFF00FFFF
        FF00FFFFFF00BDBDBD0052525200D6D6D600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C6C6C600ADADAD0029292900848484007B7B7B00E7E7E7005252
        5200EFEFEF0084848400FFFFFF005A5A5A00D6D6D600FFFFFF00F7F7F700FFFF
        FF00CECECE00FFFFFF00ADADAD0084848400FF00FF00FF00FF00FF00FF00FF00
        FF00C6C6C600BDBDBD00212121008C8C8C008C8C8C00848484007B7B7B001818
        180073737300FFFFFF005A5A5A00CECECE00BDBDBD00CECECE00F7F7F700BDBD
        BD00FFFFFF00FFFFFF007B7B7B00A5A5A500FF00FF00FF00FF00FF00FF00FF00
        FF00C6C6C600B5B5B500313131008C8C8C00848484009C9C9C00FFFFFF004242
        420021212100636363007B7B7B00FFFFFF00D6D6D600C6C6C600CECECE00F7F7
        F700FFFFFF0073737300ADADAD00CECECE00FF00FF00FF00FF00FF00FF00FF00
        FF00C6C6C600B5B5B500313131008C8C8C0073737300D6D6D600D6D6D600B5B5
        B50042424200000000000000000094949400FFFFFF00D6D6D600C6C6C600E7E7
        E7008484840029292900A5A5A500CECECE00FF00FF00FF00FF00FF00FF00FF00
        FF00C6C6C600B5B5B5003131310084848400C6C6C600FFFFFF00B5B5B5009C9C
        9C00BDBDBD006363630000000000000000008C8C8C00CECECE00CECECE005A5A
        5A00393939003939390073737300BDBDBD00FF00FF00FF00FF00FF00FF00FF00
        FF00C6C6C600B5B5B50018181800CECECE00FFFFFF00DEDEDE00E7E7E700BDBD
        BD00A5A5A500BDBDBD004A4A4A00000000000000000084848400424242004A4A
        4A00D6D6D60031313100BDBDBD00C6C6C600FF00FF00FF00FF00FF00FF00FF00
        FF00C6C6C600C6C6C60008080800ADA5A500F7EFEF00E7E7E700E7E7E700EFEF
        EF00BDBDBD009C9C9C00BDBDBD005252520000000000000000004A4A4A00E7E7
        E70029292900C6C6C600C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D6D6D6005A5A5A005A73730063A5A500FFF7F700E7E7E700E7E7
        E700E7E7E700C6C6C600A5A5A500B5B5B5005252520029292900D6D6D6001818
        1800C6C6C600C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C6C6C600ADADAD004A4242007B9C9C0073B5B500FFF7F700E7E7
        E700DEDEDE00E7E7E700BDBDBD00A5A5A500FF00FF00181818006B6B6B003939
        3900D6D6D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00CECECE00B5B5B5005A5252007B9C9C0063A5A500FFEF
        EF00E7E7E700E7E7E700E7E7E700CECECE0031313100C6C6C6006B6B6B007373
        7300CECECE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00CECECE00ADADAD005A525200739494006BAD
        AD00F7EFEF00E7E7E700DEDEDE00E7E7E700ADADAD005A5A5A0031313100DEDE
        DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00CECECE00A5A5A500635A5A00739C
        9C0073ADAD00FFEFEF00E7E7E700E7E7E700FFFFFF0042424200ADADAD00C6C6
        C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CECECE00ADADAD00635A
        5A0052737300739C9C00FFFFFF00F7F7F70052525200ADADAD00CECECE00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CECECE00A5A5
        A500ADA5A500393939006B6B6B005A5A5A00ADADAD00CECECE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_ImprimirClick
    end
    object Memo2: TMemo
      Left = 602
      Top = 7
      Width = 245
      Height = 32
      BevelInner = bvLowered
      Color = 5855743
      Ctl3D = False
      Lines.Strings = (
        'Informa'#231#227'o RESERVADA de acordo com a '
        'LEI N'#186' 12.527, DE 18 DE NOVEMBRO DE 2011')
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object ComboBox_Mes: TComboBox
      Left = 140
      Top = 77
      Width = 145
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      Text = 'Janeiro'
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'ABril'
        'Maio'
        'Junho'
        'Julho'
        'agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object MaskEdit_Localidade: TMaskEdit
      Left = 374
      Top = 77
      Width = 122
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object IBQuery_Turma: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select Distinct a.IdCurso, a.IdTurma, t.CodCurso, t.Turma, t.Ano' +
        ', t.DataInicio, t.DataTermino '
      'from AlunoTurma a, Turmas_View t')
    Left = 699
    Top = 138
  end
  object PopupMenu_Pesquisa: TPopupMenu
    Left = 248
    Top = 228
    object Ano1: TMenuItem
      Caption = 'Por Ano'
      Hint = 'Permite Pesquisa por Ano'
    end
    object Curso1: TMenuItem
      Caption = 'Por Curso'
      Hint = 'Pesquisa por Curso'
    end
    object PorEspecialidade1: TMenuItem
      Caption = 'Por Especialidade'
      Hint = 'Pesquisa por Especialidade'
    end
    object PorLocalidade1: TMenuItem
      Caption = 'Por Localidade'
    end
  end
end
