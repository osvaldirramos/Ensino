object Form_PreviewRel: TForm_PreviewRel
  Left = 163
  Top = 104
  Width = 1022
  Height = 784
  Caption = 'Ensino --> Preview'
  Color = 16577515
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
  object ScrollBox1: TScrollBox
    Left = 250
    Top = 0
    Width = 756
    Height = 745
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object JvGradient1: TJvGradient
      Left = 724
      Top = 0
      Width = 30
      Height = 743
      Align = alClient
      Style = grVertical
      StartColor = 16771255
      EndColor = 16710631
      Steps = 103
    end
    object JvxRichEdit_Vizu: TPsyRichEdit
      Left = 0
      Top = 0
      Width = 724
      Height = 743
      Align = alLeft
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Courier New'
      Font.Style = []
      HideScrollBars = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      WantTabs = True
    end
  end
  object Panel_Botoes: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 745
    Align = alLeft
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object JvGradient3: TJvGradient
      Left = 0
      Top = 0
      Width = 248
      Height = 743
      Align = alClient
      Style = grVertical
      StartColor = 16771255
      EndColor = 16710631
      Steps = 103
    end
    object JvShape_Imprimir: TJvShape
      Left = 11
      Top = 203
      Width = 222
      Height = 52
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Imprimir: TJvTransparentButton
      Left = 13
      Top = 204
      Width = 220
      Height = 52
      Hint = 'Imprime o Relat'#243'rio'
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
    object JvShape1: TJvShape
      Left = 11
      Top = 261
      Width = 222
      Height = 52
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_ConfigurarImpressora: TJvTransparentButton
      Left = 13
      Top = 262
      Width = 220
      Height = 52
      Hint = 'Permite Configurar a Impressora'
      Caption = 'Configurar Impressora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        6E070000424D6E0700000000000036000000280000001C000000160000000100
        1800000000003807000000000000000000000000000000000000FFFFFFFCFCFC
        F5F5F5FAFAFADFDFDFC7C7C7CDCDCDF1F1F1FCFCFCFCFCFCFDFDFDFCFCFCFEFE
        FEFEFEFEFBFBFBFFFFFFFFFFFFF9F9F9FAFAFAFFFFFFF9F9F9FCFCFCFEFEFEFD
        FDFDFEFEFEFEFEFEFDFDFDFEFEFEFBFBFBFDFDFDFDFDFDBABABA6F6F6F4E4E4E
        4747479C9C9CF9F9F9FBFBFBFBFBFBFEFEFEF7F7F7FCFCFCFEFEFEE8E8E8E8E7
        E8F2F2F2FCFCFCFDFDFDFFFFFFFFFFFFFBFBFBF9FAFAFBFBFBFDFDFDFEFEFEFE
        FEFEFAFAFAFDFDFDD4D4D46E6E6E747474828282575757444444BBBBBBFDFDFD
        FDFDFDFAFAFBFFFDFFFCFBFCBEBDBEB6B6B6BABABAAAAAABBDBDBECECFCFDDDE
        DEECECECF8F8F8FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFF9F9F9FEFEFEB1B1B17A
        7A7A8484846F6F6F7979793C3C3C707070EDEDEDFFFFFCFFFFF9F8FFF4A6BDA9
        90A599E1EDEDFAFAFBFFF7FBF5ECF5CBC8CFB0B5B4B8C1C0B3BCBBBAC0BFCFD1
        D1EEEDEDFBF8F9FFFFFFF9F9F9FDFDFDBBBBBB7F7F7FA0A0A0D0D0D08282826D
        6D6D3737378A8A8A77756F5E604E395134749A7BE2FBF4F3FEFFF0DFFCC5A3DF
        D3BCECE9EFFFE2FFFFE2FFFFCFE4E2C6D5D4CBD1D0B9B9B9BDB7B8E8E3E4F8F8
        F8FFFFFFBEBEBE646464B2B2B2E8E8E88F8F8F8C8C8C4A4A4A0B0A0A120D1500
        0006726C77FAF8FEFFF5FFFFDEFF9E5FB15A238842348B72A1D67FDDF4A2DCE0
        EBFFFCF7FFFFFBFFFFF0F1F1C9C4C5DDD6D7FCFCFCC9C9C95B5B5B5858587F7F
        7F9090908E8E8E9E9E9E8A8A8A1B1B1A0C0615766687FFF7FFFFFBEBFCEDCEE0
        B2A0874C5397718CA0AAD04F95B740B8D290D4DAE5F6F3F1FEFDD9DFDEB8B9B9
        E1DEDFFEFDFDC9C9C96464646969695A5A5A3C3C3C9D9D9DA2A2A2A0A0A0A5A5
        A66A6B691B1723BEB2CBD9D5D1EAE9BFC4BA7A836D2BA48857826F5828333102
        1D2762B5C4C8FAFEF4FFFFACB8B72C31309A9A9AFFFFFFFCFAFBAEAEAE5C5C5C
        7878785353531D1D1D565656ACACAC9D9D9DA9A9A999999949454D3E3744686C
        6973806A73806183886B9F97877C6D6C4D42497A7D87A8B6BDB8C8C96976741C
        2624000504949494FEFEFEFBF9FAADADAD5E5E5E6B6B6B545454222222222222
        828282B3B3B3A3A3A3AFB0AF88838A2A202F3F414A546267495C624C5C644B4F
        5F5E52676C54697D5D6F684753332A2D07100E181C1C0B0F0E6D6D6DFDFCFCFE
        FEFEABABAB5F5F5F6E6E6E5555551D1D1D0D0D0D232323979797B1B1B1ACACAB
        AFABAC685E622826263A403B37443B49584E5E6960686A656C66627766646751
        501C15161B1F1F1C1E1E161616454646E8E7E7FFFFFF8D8D8D6D6D6D76767643
        43433434345A5A5A404040626262BCBCBCAFAFB0B7B7AFB2B2A0858174625C55
        554E4A1F1B17181A122931242A3422333D28333C2920231B1515151A1A191818
        182D2D2DE2E3E3FEFEFE7E7E7E5959593C3C3C1E1E1E8D8D8DFFFFFFFFFFFFDB
        DBDB878787BBBBBCB5B9AFB6BEA8C0C0B6C8BAC3CDB8CDA18EA72D2436181A20
        323934313C2F1D291821221C2925262421211D1C1C262626D7D8D8FEFEFE3D3D
        3D272727171717232323A8A8A8CECECEC1C1C1C5C5C5727272C9C9C9B8BBBFB3
        B9C3B5B6C2B4B0BBB7B2B7C7C9C698A1963841366769668276828D778E978995
        8E898A8986867E7C7C5E5E5ED6D8D8FFFFFF4545451212121919191616164B4B
        4B4545454646467878789A9A9ABFBEBEC2C1C6B9BBC4B6B7BFC4C4C8C4C5C4B5
        B8B2C5CCC2585E563A3A386259614F40503F383E3F3D3D3332323D3D3D908F8F
        F7F7F7FEFEFEBEBEBE6B6B6B6969695D5D5D4D4D4D686868A9A9A9ABABABAAAA
        AAC8C8C8C0BFBFCACAC9C9C9C8959595717071C6C6C7C7C7C886868634343450
        50505A5B5A686968656665797979B1B1B1EBEBEBFEFEFEFEFEFEFCFCFCFCFCFC
        FEFEFEF8F8F8FBFBFBF5F5F5F5F5F5C2C2C2AAAAAACECECEC7C7C7BABABA8282
        823D3D3D3D3D3D8E8E8ED3D4D3888888505050ADADADD9D9D9F9F9F9F8F8F8FF
        FFFFFFFFFFFCFCFCFCFCFCFEFEFEFCFCFCFDFDFDFCFCFCFFFFFFF9F9F9F8F8F8
        FFFFFFDFDFDFA7A7A7CCCCCCD4D4D4A7A7A72D2D2D6868689696964D4D4DCBCB
        CB828282A3A3A3FFFFFFFFFFFFFCFCFCFAFAFAFBFBFBFDFDFDFCFCFCFDFDFDFE
        FEFEFCFCFCFDFDFDFBFBFBFCFCFCFBFBFBFCFCFCFDFDFDE8E8E8A9A9A9CFCFCF
        CBCBCBD7D7D7727272484848BBBBBB7171715E5E5E939393DBDBDBFBFBFBFCFC
        FCFBFBFBFDFDFDFDFDFDFAFAFAFCFCFCFCFCFCFEFEFEFCFCFCFEFEFEFCFCFCFD
        FDFDFDFDFDFDFDFDF8F8F8FFFFFFC8C8C8B3B3B3C0C0C0D1D1D1D7D7D7535353
        797979C3C3C3999999DFDFDFFEFEFEFBFBFBFDFDFDFDFDFDFCFCFCFDFDFDFEFE
        FEFDFDFDFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFEFEFEFE
        FEFEF9F9F9D1D1D1B0B0B0A3A3A3B6B6B69696969E9E9EF4F4F4FFFFFFFBFBFB
        FDFDFDFEFEFEFDFDFDFDFDFDFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFCFCFCF2F2F2D6
        D6D6D9D9D9E0E0E0F0F0F0FDFDFDFBFBFBFEFEFEFEFEFEFFFFFFFCFCFCFDFDFD
        FEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFE}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_ConfigurarImpressoraClick
    end
    object JvShape2: TJvShape
      Left = 11
      Top = 322
      Width = 222
      Height = 52
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Retornar: TJvTransparentButton
      Left = 13
      Top = 323
      Width = 220
      Height = 52
      Hint = 'Retornar para Janela anterior.'
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
    object JvShape3: TJvShape
      Left = 11
      Top = 378
      Width = 222
      Height = 52
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Windows: TJvTransparentButton
      Left = 13
      Top = 379
      Width = 220
      Height = 52
      Hint = 'Sai do sistema e retorna para sistema operacional.'
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
    object DBNavigator: TDBNavigator
      Left = 9
      Top = 148
      Width = 224
      Height = 45
      DataSource = Form_Sel_ItemProva.DSQ_Item
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        'Posiciona no Primeiro Registro'
        'Retorna Registro'
        'Pr'#243'ximo Registro'
        #218'ltimo Registro'
        '')
      TabOrder = 0
      OnClick = DBNavigatorClick
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 312
    Top = 128
  end
  object RichPrinter1: TRichPrinter
    CompressPreview = False
    MarginTop = 5.000000000000000000
    MarginBottom = 5.926666666666692000
    MarginLeft = 8.000000000000000000
    MarginRight = 8.000000000000000000
    LogoTop = -10.000000000000000000
    LogoWidth = 25.000000000000000000
    LogoHeight = 20.000000000000000000
    Header = '{$TITLE}'
    HeaderFormat = '>75'
    Footer = 'P'#225'gina {$PAGE}'
    FooterFormat = '>200'
    Font_HeaderFooter.Charset = DEFAULT_CHARSET
    Font_HeaderFooter.Color = clWindowText
    Font_HeaderFooter.Height = -11
    Font_HeaderFooter.Name = 'Verdana'
    Font_HeaderFooter.Style = [fsBold]
    BorderOffset = 2.000000000000000000
    Options_Dialog = []
    Left = 312
    Top = 96
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 312
    Top = 160
  end
end
