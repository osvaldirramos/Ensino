object Form_ColetaItensSTO: TForm_ColetaItensSTO
  Left = 51
  Top = 259
  Cursor = crHourGlass
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Ensino --> Rela'#231#227'o de Itens'
  ClientHeight = 632
  ClientWidth = 1434
  Color = clWindow
  Ctl3D = False
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
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Documento: TJvDBRichEdit
    Left = 496
    Top = 481
    Width = 896
    Height = 303
    DataField = 'DESCENALT'
    DataSource = DST_ItemDesc
    TabOrder = 0
    Visible = False
  end
  object Panel_Botoes: TPanel
    Left = 0
    Top = 0
    Width = 1434
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object JvGradient3: TJvGradient
      Left = 0
      Top = 0
      Width = 1434
      Height = 59
      Align = alClient
      Style = grVertical
      StartColor = 4227200
      EndColor = 16777190
      Steps = 59
    end
    object JvShape6: TJvShape
      Left = 334
      Top = 3
      Width = 73
      Height = 53
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Retornar: TJvTransparentButton
      Left = 335
      Top = 3
      Width = 71
      Height = 51
      Hint = 'Retorna para sele'#231#227'o da turma.'
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
    object JvShape8: TJvShape
      Left = 191
      Top = 3
      Width = 125
      Height = 52
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Carga: TJvTransparentButton
      Left = 190
      Top = 3
      Width = 127
      Height = 49
      Hint = 'Inicia a carga dos dados do aluno.'
      BorderWidth = 0
      Caption = 'Gerar arquivo'
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
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        000030313000B4B0AE00CF9F9E003E433E00000100000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000F0E0F005E685F00DFDE
        DF0060655E00A09E9E0087808000CFA09F00D1BCBE0087808000101210000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000020201E00A09E9E00DEDBDE00D1CFD000C0C3
        BF00B4B0AE008F8E8F00726C6D00504C4A000000000000000000DCBABC00E3B9
        BB004147400000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0060655E008F8E8F00D1CFD000C0C0BF00B4B0AE00B4B0
        AE00DFDEDF00A09E9E009F9C9E00A09E9E006F6B6C0028282500705F5A00705F
        5A00E3B6B8001F1F1D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0060655E00C0C0BF00B4B0AE00D1CDCF00EFEEEF00EFEE
        EF00C0C3BF00D1CFD000D1D3D000D1CFD0005E685F0090919000A09E9E00867F
        7F005C6E61001F1F1D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF005E685F00EFEEEF00FEFDFE00F1F4F100F0F0F000C0C0
        BF00CE6760008E717000A09E9E00827E7E00C0C0BF00D1D3D000DEDBDE006F6B
        6C00909190002F2F2F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0060655E00B4B0AE00FEFDFE00C0C3
        BF00CE676000705F5A00BF605F00F1F4F100DEDBDE0080504F00714E4E000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003030
        3000CE676000806D6F008C4D4D00E1E6E100F1F4F10080504F00CE6760000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003030
        3000CE676000806D6F00D38F8D00A09E9E00E1E6E10080504F00CE6760000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003030
        3000CE676000CE67600086515000785A58006F6B6C00714E4E00CE6760000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003030
        3000CE676000705F5A00A09E9E008E7170008A4F4E00CE676000CE6760000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003030
        3000CE676000806D6F00D1CFD000B4B0AE00B4B0AE009F9C9E00CE6760000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003030
        3000CE676000806D6F00B4B0AE00C0C0BF00C0C3BF0090919000CE6760000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003030
        3000D38F8D00D1D3D000E1E6E100EFEEEF00EFEEEF0090919000CE6760000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
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
      OnClick = JvTransparentButton_CargaClick
    end
    object JvShape1: TJvShape
      Left = 430
      Top = 3
      Width = 73
      Height = 53
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Windows: TJvTransparentButton
      Left = 431
      Top = 3
      Width = 71
      Height = 51
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
      OnClick = JvTransparentButton_WindowsClick
    end
  end
  object Panel_Treeviw: TPanel
    Left = 0
    Top = 59
    Width = 401
    Height = 573
    Align = alLeft
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16777190
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object DBGrid_Disciplina: TDBGrid
      Left = 0
      Top = 29
      Width = 393
      Height = 523
      Align = alLeft
      Color = 15921906
      Ctl3D = False
      DataSource = DSQ_Disciplina
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -16
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMEMATERIA'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 368
          Visible = True
        end>
    end
    object StatusBar_Msg: TStatusBar
      Left = 0
      Top = 552
      Width = 399
      Height = 19
      Panels = <>
      SimplePanel = True
      SimpleText = 'Selecine a Disciplina deseja.'
    end
    object ToolBar_SelecaoAluno: TToolBar
      Left = 0
      Top = 0
      Width = 399
      Height = 29
      ButtonHeight = 24
      Caption = 'ToolBar_Selecao'
      Color = 16577515
      ParentColor = False
      TabOrder = 2
      object JvEdit_Descricao: TJvEdit
        Left = 0
        Top = 2
        Width = 369
        Height = 24
        Hint = 'Realiza filtro pela Descri'#231#227'o.'
        Alignment = taCenter
        BevelInner = bvSpace
        BevelKind = bkFlat
        GroupIndex = -1
        MaxPixel.Font.Charset = DEFAULT_CHARSET
        MaxPixel.Font.Color = clWindowText
        MaxPixel.Font.Height = -13
        MaxPixel.Font.Name = 'MS Sans Serif'
        MaxPixel.Font.Style = []
        Modified = False
        SelStart = 0
        SelLength = 0
        AutoSelect = False
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        ParentShowHint = False
        PasswordChar = #0
        ReadOnly = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 401
    Top = 59
    Width = 1033
    Height = 573
    Align = alClient
    BevelOuter = bvNone
    Color = 16777190
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1033
      Height = 112
      Align = alTop
      BevelOuter = bvNone
      Color = 16777190
      TabOrder = 0
      object Label_Especialidade: TLabel
        Left = 8
        Top = 14
        Width = 91
        Height = 16
        Caption = 'Especialidade:'
      end
      object Label1: TLabel
        Left = 8
        Top = 38
        Width = 91
        Height = 16
        Caption = 'Destacamento:'
      end
      object Label2: TLabel
        Left = 8
        Top = 62
        Width = 71
        Height = 16
        Caption = 'Publica'#231#227'o:'
      end
      object Label_Historico: TLabel
        Left = 8
        Top = 86
        Width = 86
        Height = 16
        Caption = 'Hist'#243'rico..........:'
      end
      object Edit_Especialidade: TEdit
        Left = 104
        Top = 9
        Width = 257
        Height = 22
        TabOrder = 0
      end
      object Edit_Destacamento: TEdit
        Left = 104
        Top = 33
        Width = 257
        Height = 22
        TabOrder = 1
      end
      object Edit_Publicacao: TEdit
        Left = 104
        Top = 57
        Width = 257
        Height = 22
        TabOrder = 2
      end
      object Edit_Historico: TEdit
        Left = 104
        Top = 81
        Width = 257
        Height = 22
        TabOrder = 3
      end
    end
    object Text1: TPsyRichEdit
      Left = 244
      Top = 112
      Width = 783
      Height = 461
      Align = alLeft
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Courier New'
      Font.Style = []
      HideScrollBars = False
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      WantTabs = True
    end
    object Panel3: TPanel
      Left = 0
      Top = 112
      Width = 244
      Height = 461
      Align = alLeft
      Caption = 'Panel3'
      Color = 16777190
      TabOrder = 2
      object ToolBar_Pesquisar: TToolBar
        Left = 1
        Top = 1
        Width = 242
        Height = 26
        ButtonHeight = 21
        ButtonWidth = 8
        Caption = 'ToolBar_Selecao'
        Color = 16577515
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object JvEdit_NItem: TJvEdit
          Left = 0
          Top = 2
          Width = 77
          Height = 21
          Hint = 'Realiza filtro pelo n'#250'mero de identifica'#231#227'o do item.'
          Alignment = taCenter
          BevelInner = bvSpace
          BevelKind = bkFlat
          GroupIndex = -1
          MaxPixel.Font.Charset = DEFAULT_CHARSET
          MaxPixel.Font.Color = clWindowText
          MaxPixel.Font.Height = -13
          MaxPixel.Font.Name = 'MS Sans Serif'
          MaxPixel.Font.Style = []
          Modified = False
          SelStart = 0
          SelLength = 0
          AutoSelect = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 0
        end
        object JvEdit_Disc: TJvEdit
          Left = 77
          Top = 2
          Width = 41
          Height = 21
          Hint = 'Realiza filtro pela disciplina.'
          Alignment = taCenter
          BevelInner = bvSpace
          BevelKind = bkFlat
          GroupIndex = -1
          MaxPixel.Font.Charset = DEFAULT_CHARSET
          MaxPixel.Font.Color = clWindowText
          MaxPixel.Font.Height = -13
          MaxPixel.Font.Name = 'MS Sans Serif'
          MaxPixel.Font.Style = []
          Modified = False
          SelStart = 0
          SelLength = 0
          AutoSelect = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 1
        end
        object JvEdit_unid: TJvEdit
          Left = 118
          Top = 2
          Width = 35
          Height = 21
          Hint = 'Realiza filtro pela unidade.'
          Alignment = taCenter
          BevelInner = bvSpace
          BevelKind = bkFlat
          GroupIndex = -1
          MaxPixel.Font.Charset = DEFAULT_CHARSET
          MaxPixel.Font.Color = clWindowText
          MaxPixel.Font.Height = -13
          MaxPixel.Font.Name = 'MS Sans Serif'
          MaxPixel.Font.Style = []
          Modified = False
          SelStart = 0
          SelLength = 0
          AutoSelect = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 2
        end
        object JvEdit_SubUnid: TJvEdit
          Left = 153
          Top = 2
          Width = 58
          Height = 21
          Hint = 'Realiza filtro pela unidade.'
          Alignment = taCenter
          BevelInner = bvSpace
          BevelKind = bkFlat
          GroupIndex = -1
          MaxPixel.Font.Charset = DEFAULT_CHARSET
          MaxPixel.Font.Color = clWindowText
          MaxPixel.Font.Height = -13
          MaxPixel.Font.Name = 'MS Sans Serif'
          MaxPixel.Font.Style = []
          Modified = False
          SelStart = 0
          SelLength = 0
          AutoSelect = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 3
        end
      end
      object DBGrid_Item: TDBGrid
        Left = 1
        Top = 27
        Width = 237
        Height = 433
        Align = alLeft
        BorderStyle = bsNone
        Color = 9948159
        Ctl3D = False
        DataSource = DSQ_Item
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clRed
        TitleFont.Height = -12
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMITEM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Item'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 76
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DISCIPLINA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Disc.'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIDADE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 36
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SUBUNIDADE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'SubUnid.'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 58
            Visible = True
          end>
      end
    end
  end
  object IBQuery_Documento: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select doc, Descricao from Documento'
      'where codigo = 1'
      '')
    Left = 56
    Top = 17
    object IBQuery_DocumentoDOC: TIBStringField
      FieldName = 'DOC'
      Origin = 'DOCUMENTO.DOC'
      Required = True
      Size = 100
    end
    object IBQuery_DocumentoDESCRICAO: TBlobField
      FieldName = 'DESCRICAO'
      Origin = 'DOCUMENTO.DESCRICAO'
      Size = 8
    end
  end
  object DSQ_Documentacao: TDataSource
    DataSet = IBQuery_Documento
    Left = 88
    Top = 17
  end
  object IBQuery_Item: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_Disciplina
    SQL.Strings = (
      
        'select  IdCurso, IdTurma, NumItem, CodMateria, Disciplina, Unida' +
        'de, SubUnidade, Objetivo, Serie, Status'
      'From Item_Prova'
      'where idCurso = :idCurso'
      'and IdTurma= :IdTurma'
      'and codMateria = :codMateria'
      ' Order By disciplina,unidade,subunidade,objetivo,serie')
    Left = 128
    Top = 128
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
        DataType = ftString
        Name = 'CODMATERIA'
        ParamType = ptUnknown
        Size = 7
      end>
    object IBQuery_ItemIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ITEM.IDCURSO'
      Required = True
    end
    object IBQuery_ItemIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ITEM_PROVA.IDTURMA'
      Required = True
    end
    object IBQuery_ItemNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'ITEM.NUMITEM'
      Required = True
    end
    object IBQuery_ItemCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'ITEM.CODMATERIA'
      Required = True
      Size = 7
    end
    object IBQuery_ItemDISCIPLINA: TIBStringField
      FieldName = 'DISCIPLINA'
      Origin = 'ITEM.DISCIPLINA'
      Required = True
      Size = 2
    end
    object IBQuery_ItemUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'ITEM.UNIDADE'
      Required = True
      Size = 2
    end
    object IBQuery_ItemSUBUNIDADE: TIBStringField
      FieldName = 'SUBUNIDADE'
      Origin = 'ITEM.SUBUNIDADE'
      Required = True
      Size = 2
    end
    object IBQuery_ItemOBJETIVO: TIBStringField
      FieldName = 'OBJETIVO'
      Origin = 'ITEM.OBJETIVO'
      Required = True
      Size = 1
    end
    object IBQuery_ItemSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ITEM.SERIE'
      Required = True
      Size = 2
    end
    object IBQuery_ItemSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ITEM_PROVA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object DSQ_Item: TDataSource
    DataSet = IBQuery_Item
    Left = 159
    Top = 129
  end
  object IBTable_Item_Desc: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NUMITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RESPOSTACORRETA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QDEAPLIC'
        DataType = ftSmallint
      end
      item
        Name = 'QDEIRREGULARIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'QDEANULADA'
        DataType = ftSmallint
      end
      item
        Name = 'NLINHAS'
        DataType = ftSmallint
      end
      item
        Name = 'POSSUI_IMAGEM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RECURSO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TEMPORES'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DESCENALT'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'PK_ITEM_DESC'
        Fields = 'NUMITEM'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'NUMITEM'
    MasterFields = 'NUMITEM'
    MasterSource = DSQ_Item
    StoreDefs = True
    TableName = 'ITEM_DESC'
    Left = 200
    Top = 125
    object IBTable_Item_DescNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
    end
    object IBTable_Item_DescRESPOSTACORRETA: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Size = 1
    end
    object IBTable_Item_DescQDEAPLIC: TSmallintField
      FieldName = 'QDEAPLIC'
    end
    object IBTable_Item_DescQDEIRREGULARIDADE: TSmallintField
      FieldName = 'QDEIRREGULARIDADE'
    end
    object IBTable_Item_DescQDEANULADA: TSmallintField
      FieldName = 'QDEANULADA'
    end
    object IBTable_Item_DescPOSSUI_IMAGEM: TIBStringField
      FieldName = 'POSSUI_IMAGEM'
      Size = 1
    end
    object IBTable_Item_DescRECURSO: TIBStringField
      FieldName = 'RECURSO'
      Size = 1
    end
    object IBTable_Item_DescOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object IBTable_Item_DescDESCENALT: TBlobField
      FieldName = 'DESCENALT'
      Size = 8
    end
    object IBTable_Item_DescNLINHAS: TSmallintField
      FieldName = 'NLINHAS'
    end
    object IBTable_Item_DescTEMPORES: TIBStringField
      FieldName = 'TEMPORES'
      Size = 4
    end
  end
  object DST_ItemDesc: TDataSource
    DataSet = IBTable_Item_Desc
    Left = 236
    Top = 129
  end
  object IBQuery_Disciplina: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    AfterScroll = IBQuery_DisciplinaAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select IdCurso, IdTurma, CodMateria,  NomeMateria'
      'From MateriaCurso'
      'where idCurso = :idCurso'
      'and    IdTurma= :IdTurma'
      ' Order By NomeMateria')
    Left = 48
    Top = 72
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
    object IBQuery_DisciplinaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'MATERIACURSO.IDCURSO'
      Required = True
    end
    object IBQuery_DisciplinaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'MATERIACURSO.IDTURMA'
      Required = True
    end
    object IBQuery_DisciplinaCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'MATERIACURSO.CODMATERIA'
      Required = True
      Size = 6
    end
    object IBQuery_DisciplinaNOMEMATERIA: TIBStringField
      FieldName = 'NOMEMATERIA'
      Origin = 'MATERIACURSO.NOMEMATERIA'
      Size = 120
    end
  end
  object DSQ_Disciplina: TDataSource
    DataSet = IBQuery_Disciplina
    Left = 79
    Top = 73
  end
end
