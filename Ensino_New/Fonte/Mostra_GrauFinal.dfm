object Form_Mostra_GrauFinal: TForm_Mostra_GrauFinal
  Left = 31
  Top = 103
  Width = 1386
  Height = 788
  Caption = 
    'Ensino -> Sistema de Gerenciamento do Ensino --> Mostra o Grau F' +
    'inal do Aluno'
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
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 402
    Top = 64
    Width = 28
    Height = 28
  end
  object JvShape1: TJvShape
    Left = 0
    Top = 395
    Width = 1378
    Height = 362
    Align = alClient
    Brush.Color = 16577515
    Pen.Color = 15314812
    Shape = stRoundRect
  end
  object JvCaptionPanel_RelacaoAlunos: TJvCaptionPanel
    Left = 0
    Top = 122
    Width = 1378
    Height = 273
    Align = alTop
    Buttons = []
    BorderStyle = bsNone
    Caption = '                                 [ Aluno ]'
    CaptionPosition = dpTop
    CaptionFont.Charset = ANSI_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = [fsBold]
    Color = 16577515
    OutlookLook = False
    TabOrder = 0
    object DBNavigator2: TDBNavigator
      Left = 32
      Top = 3
      Width = 100
      Height = 22
      DataSource = DSQ_RelacaoAlunos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        'Posiciona no primeiro registro'
        'Posiciona no proximo registro'
        'Posiciona no registro anterior'
        'Posiciona no '#250'ltimo registro'
        '')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object DBGrid_Alunos: TDBGrid
      Left = 1
      Top = 26
      Width = 736
      Height = 246
      Align = alLeft
      Color = clCream
      Ctl3D = False
      DataSource = DSQ_RelacaoAlunos
      Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid_AlunosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGOALUNO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Aluno'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 426
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEGUERRA'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Guerra'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clLime
          Expanded = False
          FieldName = 'NOTAFINAL'
          Title.Alignment = taCenter
          Title.Caption = 'M'#233'dia Final'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = True
        end>
    end
    object Panel_Mostra_Media: TPanel
      Left = 737
      Top = 26
      Width = 640
      Height = 246
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Chart_MediasAlunos: TChart
        Left = 1
        Top = 26
        Width = 638
        Height = 219
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Gradient.EndColor = clWhite
        Gradient.StartColor = 16777088
        Gradient.Visible = True
        MarginLeft = 2
        MarginTop = 3
        Title.Color = 8454143
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -17
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold, fsItalic]
        Title.Frame.Visible = True
        Title.Text.Strings = (
          'Gr'#225'fico para demonstrar as M'#233'dias dos Aluno')
        Title.Visible = False
        Chart3DPercent = 10
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.AxisValuesFormat = '#0.##'
        LeftAxis.ExactDateTime = False
        LeftAxis.Maximum = 10.000000000000000000
        LeftAxis.Title.Caption = 'M'#233'dias'
        Legend.LegendStyle = lsValues
        Legend.ShadowSize = 1
        Legend.Visible = False
        Align = alClient
        BevelWidth = 0
        TabOrder = 0
        OnDblClick = Chart_MediasAlunosDblClick
        object Series1: TBarSeries
          Marks.ArrowLength = 6
          Marks.Frame.Color = clRed
          Marks.Frame.Style = psDashDotDot
          Marks.Frame.SmallDots = True
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          ShowInLegend = False
          ValueFormat = '#0.##'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Panel_Media: TPanel
        Left = 1
        Top = 1
        Width = 638
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel_Media'
        TabOrder = 1
      end
    end
  end
  object JvCaptionPanel_BuscaPorPessoa: TJvCaptionPanel
    Left = 0
    Top = 395
    Width = 1378
    Height = 362
    Align = alClient
    Buttons = []
    BorderStyle = bsNone
    Caption = 'Rela'#231#227'o de Notas'
    CaptionPosition = dpTop
    CaptionFont.Charset = ANSI_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = [fsBold]
    Color = 16577515
    OutlookLook = False
    TabOrder = 1
    object DBGrid_Prova: TDBGrid
      Left = 1
      Top = 26
      Width = 132
      Height = 335
      Align = alLeft
      Color = 16777179
      Ctl3D = False
      DataSource = DSQ_ResultadoExame
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clTeal
      TitleFont.Height = -13
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid_ProvaDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODPROVA'
          Title.Alignment = taCenter
          Title.Caption = 'Prova'
          Title.Color = 15845027
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOTA'
          Title.Alignment = taCenter
          Title.Caption = 'Nota'
          Title.Color = 15845027
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end>
    end
    object Chart_ProvassAlunos: TChart
      Left = 133
      Top = 26
      Width = 1244
      Height = 335
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = clWhite
      Gradient.StartColor = 16777088
      Gradient.Visible = True
      MarginLeft = 2
      MarginTop = 3
      Title.Color = 8454143
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -17
      Title.Font.Name = 'Times New Roman'
      Title.Font.Style = [fsBold, fsItalic]
      Title.Frame.Visible = True
      Title.Text.Strings = (
        'Gr'#225'fico para demonstrar as M'#233'dias dos Aluno')
      Title.Visible = False
      Chart3DPercent = 5
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.AxisValuesFormat = '#0.##'
      LeftAxis.ExactDateTime = False
      LeftAxis.Maximum = 10.000000000000000000
      LeftAxis.Title.Caption = 'M'#233'dias'
      Legend.LegendStyle = lsValues
      Legend.ShadowSize = 1
      Legend.Visible = False
      Align = alClient
      BevelWidth = 0
      TabOrder = 1
      object BarSeries_Provas: TBarSeries
        Marks.ArrowLength = 6
        Marks.Frame.Color = clRed
        Marks.Frame.Style = psDashDotDot
        Marks.Frame.SmallDots = True
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clRed
        ShowInLegend = False
        ValueFormat = '#0.##'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
  end
  object Panel_Botoes_CabecalhoProva: TPanel
    Left = 0
    Top = 0
    Width = 1378
    Height = 122
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16775660
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object JvGradient_Tela01: TJvGradient
      Left = 0
      Top = 0
      Width = 1376
      Height = 120
      Align = alClient
      Style = grVertical
      StartColor = 4227200
      EndColor = 16777190
      Steps = 101
    end
    object JvShape5: TJvShape
      Left = 721
      Top = 36
      Width = 73
      Height = 53
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Atualiza: TJvTransparentButton
      Left = 722
      Top = 37
      Width = 71
      Height = 53
      Hint = 'Atualiza a rela'#231#227'o de provas e notas dos alunos'
      BorderWidth = 0
      Caption = 'Atualizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        EE070000424DEE070000000000003600000028000000190000001A0000000100
        180000000000B807000000000000000000000000000000000000FEFEFFFCFBFD
        F8FBFBF8FEFCF4FAF6F5FAF6EBF4ECDFECE1D6E6D8CDE2D0C6DBC8C4DAC7C5DA
        C8C3D9C6C9DECCCEE2D0D4E5D7CCE4D7C0DBC9AECCB2BCDCC5EBF4EEFEFDFFFD
        FDFDFDFFFC00FFFDFEFEFDFEFAFDFDF5FAF7DCE6DEBFD3C1B3CBB7ABC6AEA5C5
        A99EC2A29CC1A09ABF9F9BC1A099C29F90BB968BBA918FBF9999BC9F8FB6967F
        B28C9EBFA1CDDFD2FAFCFBFEFDFDFCFCFA00FEFDFFFBFAFCFDFFFFF5F9F8D8E2
        DBC0D4C2B6CFB8B7D6BBC3DEC8D2E3D5DCECDEE0ECE1D9E6DAC3D8C6A3C3A78D
        B99385B99299B5938ABC8D48B37076B784BBD4C0EFF7F1FFFBFDFDFCFC00FCFA
        FBFAF8FAF1F8F5EAF1ECDDEDDCCDE6CFCAD9D3CDE2D2D5EBCFC5E3C4ADDCB599
        D7A895D29F95C69895C39AAACDA9B5D4BCC3D3C077DAA318C6634CB564D8E6D8
        F6F6F7FAFDFBFEFEFD00F1F5F2CEE4D7C0DFCFBEDCC8BED4C3BACFC4BDDEC579
        CB8831B84E11AE3400AA2800B12400B32200AA200FAA352CAE4D54B46E9DC99D
        45CD8013C24E1C962DE0F4E2FFF9FFF0FBF5FCFDFB00EFF7EFC3DFC4B4CFB8A9
        C8AFC0D6C399CDA72FBE5500A21F02AC2507BE2A0CC6370EC63A0FC43708C532
        00B92A00AE2400A51D0A981D16A93611AB3000991E9AD9A7FEFFFEF4FAF8FDFD
        FD00F8F9F7EFF2E7CDDDC7C2DAC391DAA81CB44407992000A42505B33305C43B
        03D04603D74D04D14807C94102C13A02AF2802A61E029E1C00951913A02500AC
        195CC46FFFFDFEFCFBFDFEFCFD00FAFAFCEFF3F5E2EDE5BBF2CC37B05A18AB3F
        2ABD4D17B83A09CF440EDD5108DC4B03D64004D03B05C7320AC0320FA72C0A96
        1F08941F029B2109A62802B8242DC44EECF3E9FFFDFEF9FAFA00FFFEFEF7FDFC
        FFFAFFB9E9C520AD434CC16433C76745D6732EE46E01D95104C64516BF4518BA
        4200B52800AF1E06A224019F1E02A61E03B02802BC3205C03A05CD40B7E9C6FE
        FFFEF6F8F800FDFDFEF5F9F7FDFCFDF5FCF95FCC843BBC5584DA9551E2895CD9
        7F83D89AB0E7BCDFEEDDDBEDD8A3DDAF3EA753009312009311009D1B00AE2A06
        BE390CCC4719D85877DA9DFEFDFEFAFAFE00FCFDFFF9FAF6FCFBF6FEFFFFD3F7
        DA3EA8545ACD787DD797D6EFD9FFFEFEFDFFFFF3F8FFF6F9FDFFF4FFD2F7E42E
        B34D2BA64533B55039C45E41D77043DE7942E78356E589E9F2EFFEFEFE00FCFB
        FEFEFBFCFDFCF7F7FAF9FFFFFFB9DEC994CFA0F3FAF2FFFAFFFDF6FDF7F3F3F6
        FDF8F4FBF1FFFBFD9BE5BD26C25669CC8184D99B75E09974E89C70E99758EE92
        3FDB71C0E5CEFCFFFF00FCFDFDF6FCFCF8FBFBFCFBFBF7FCFAFFFFFFFFFFFFFF
        FFFFF3F8F9E1F6E9F7FDFDFDFCFAFFFCFCEAF3E838CF7333CE699FDFAC9AE4AF
        84E0A478DD9868C98376D28F85D49DDCF5E3FFFCFE00FDFDFEFAF9FDFDFAFEFF
        FBFEFFFFFFF4F3F4CAEACB8EE09B50BA5D30BE61ACE4BEFFFEFBFBFFFFD0DED4
        159C4378DE92BDDDC6ABDBB4C3DCBBC6E3CADAF1E7F8FBFBFFFFFFFFF7FFFAF8
        FE00FEFDFEFFFCFCE5F5E6B9E3C177CE8D35C65D15B34301AB2E07B22F08C857
        A7DCB6FCFEFFF6F8F9FEFCFCBCEBC9D8EACFE9EAECFCFFFFFFFFFFFFFDFFFFFC
        FFFEFBFDFBFAFAF9FEFBF9FFFD00F4FDF485D69E30B65A06BB3F00BF3400C037
        02BF3A0CB3380FB54036D47FE7F5EAF1FAFDF1F7F2F8FBF7FDF8FFFFFFFFFDFF
        FFACD7B656A467D4FADEFEFAFCFBFCFBF4FAFDFAFBFCFEFAFA00FEFDFB59CC86
        0BCB4D0DCF4E05CE4607C94408BE3809B43505A4337ED896FFFFFFFFF5FFFCFC
        FEFFF6FDFFFEFFE5F8EC8BC99A0E8B2200850059BD75F8FEF8FDFDF8F8FAFBFC
        FDFCFCFDFA00FFFFFFB8E9C93DCC6D23D46103D04700CF4200C53502B42B019C
        2038A84CA0D3AADAF4DEE7FAEADAEDE39CDBB136B451009618079721058E1C02
        851986D296FAFEFEF8FAFBFFFBFBFEFCFB00FDFEFEECF5E870D19155DD8731DE
        6708D04800C43606BB3303AD2700AE2300A82A17AD3A24B7430FAF3000A72500
        AA2502AB2404A01E0A911E00881340A55AEFF9F8FEFBFDFDFBFBFCFCFB00F7FD
        FEFDFFF9A5E4BB81E1A465E98A2CD86100BB3603BA310BA72C08AB3102BC2F02
        BE2E07B92D05BE2D02BD2E03B42E05AE350EA42C0894170391279DE3B3F8FEFC
        FCFCFDFAFBFBF8FDFB00FDFDFDF9FEFCD5F0DFA2E5B683E7A374E39B38C7620B
        AA2908A22803B02E04C43505CD3C06D14506D94C08D0410FBF3910B035049113
        03952289E1AAFBFFFEFEFEFEFDFDFEFEFEFEFEFEFF00FEFEFEFFFEFCF0FAF3B4
        E2C0B5F0C586DCA65BC37039BA5303A42B03AB2801C13604CE4808D65305DC51
        08DC4B06C53D00A41A19A52DA6E5B8FFFFFFFDF9FEFEFEFEFEFEFEFFFFFFFFFF
        FF00FDFEFDFEFCFCFFFFFECEE8DAE0F3D95EE18B1EB95989CF9746B25207AF29
        00B82700BF2900C43300C93801BC3128BF4362D67DD8F7E0FFFFFFEAFBF9FDFD
        F8FEFEFFFDFEFDFEFEFEFEFEFE00FEFEFDFBFAF8FAFCFCE7F5F2C2E3CC23DD79
        8BF4B6FFFBFFE1F0E1BEE4C59BDAA87FD1937BD0918BD69BB2E5BBE8F5E6FFFD
        FFFFFEFFF8FBF8F4F8F9FBFDFDFEFFFEFEFEFEFFFFFFFFFFFF00FEFDFFFDFAFD
        F3F9F8FCFEFF95D1AE36C475E9FDF0F6FCFDFFFCFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFEFCFEFDFFFEFEFFFEFFFEFFFFFFFEFEFEFFFFFF
        FFFFFFFFFF00FEFCFEFEFCFEF8FAFAF8FDFDE6F7EBDAF2DFFEF8FBFBF7FCF9FB
        FBFCFDFCFBFDFCFCFDFCFCFDFCFCFEFDFCFEFDFDFEFDFEFFFEFFFEFFFEFFFFFE
        FFFEFFFEFEFEFFFFFFFFFEFFFFFFFFFFFF00}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_AtualizaClick
    end
    object JvShape_retornar: TJvShape
      Left = 825
      Top = 37
      Width = 73
      Height = 53
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Retornar: TJvTransparentButton
      Left = 826
      Top = 38
      Width = 71
      Height = 51
      Hint = 'Retornar para Menu Principal'
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
    object JvShape10: TJvShape
      Left = 905
      Top = 37
      Width = 73
      Height = 53
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Windows: TJvTransparentButton
      Left = 906
      Top = 38
      Width = 71
      Height = 51
      Hint = 'Sai do sistema e retorna para sistema operacional.'
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
    object Memo1: TMemo
      Left = 1149
      Top = 18
      Width = 268
      Height = 35
      BevelInner = bvLowered
      Color = 9211135
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'Informa'#231#227'o RESERVADA de acordo com a '
        'LEI N'#186' 12.527, DE 18 DE NOVEMBRO DE 2011')
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object Panel_Frame_SelCurso: TPanel
      Left = 8
      Top = 2
      Width = 693
      Height = 115
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object Query_RelacaoAlunos: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    AfterScroll = Query_RelacaoAlunosAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DM.DSQ_MontaTurma
    SQL.Strings = (
      
        'Select al.IdCurso, al.IdTurma, al.NumOrdem, al.codigoaluno, al.n' +
        'otaFinal, al.nome, al.nomeguerra, al.MotivoDesligamento, al.iden' +
        'tidade'
      'From Aluno_Turmas_View al'
      'Where al.idCurso = :IdCurso'
      'and      al.IdTurma = :IdTurma'
      'Order By al.NotaFinal desc, al.IdAntiguidade')
    Left = 102
    Top = 249
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
    object Query_RelacaoAlunosIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Required = True
    end
    object Query_RelacaoAlunosIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Required = True
    end
    object Query_RelacaoAlunosNUMORDEM: TSmallintField
      Alignment = taCenter
      FieldName = 'NUMORDEM'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object Query_RelacaoAlunosCODIGOALUNO: TIntegerField
      Alignment = taCenter
      FieldName = 'CODIGOALUNO'
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object Query_RelacaoAlunosNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'ALUNOTURMA_VIEW.NOME'
      Size = 100
    end
    object Query_RelacaoAlunosNOMEGUERRA: TIBStringField
      FieldName = 'NOMEGUERRA'
      Required = True
    end
    object Query_RelacaoAlunosNOTAFINAL: TIBBCDField
      Alignment = taCenter
      FieldName = 'NOTAFINAL'
      Origin = 'ALUNOTURMA.NOTAFINAL'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
      Precision = 9
      Size = 2
    end
    object Query_RelacaoAlunosMOTIVODESLIGAMENTO: TIBStringField
      FieldName = 'MOTIVODESLIGAMENTO'
      Origin = 'ALUNOTURMA.MOTIVODESLIGAMENTO'
      FixedChar = True
      Size = 1
    end
    object Query_RelacaoAlunosIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Origin = 'ALUNOTURMA.IDENTIDADE'
      Required = True
      FixedChar = True
    end
  end
  object DSQ_RelacaoAlunos: TDataSource
    DataSet = Query_RelacaoAlunos
    Left = 136
    Top = 247
  end
  object IBQuery_ResultadoExame: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_RelacaoAlunos
    SQL.Strings = (
      
        'Select idCurso, IdTurma, ReferenciaAvaliacao, CodMateria, CodPro' +
        'va, Nota'
      'from Nota_Aluno_View'
      'where idCurso = :idCurso'
      'and    IdTurma = :IdTurma'
      'and Identidade = :Identidade'
      'Order By  ReferenciaAvaliacao'
      ''
      '')
    Left = 462
    Top = 273
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
        DataType = ftFixedChar
        Name = 'IDENTIDADE'
        ParamType = ptUnknown
        Size = 21
      end>
    object IBQuery_ResultadoExameIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'NOTA_ALUNO_VIEW.IDCURSO'
    end
    object IBQuery_ResultadoExameIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'NOTA_ALUNO_VIEW.IDTURMA'
    end
    object IBQuery_ResultadoExameREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Origin = 'NOTA_ALUNO_VIEW.REFERENCIAAVALIACAO'
      Size = 3
    end
    object IBQuery_ResultadoExameCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'NOTA_ALUNO_VIEW.CODMATERIA'
      Size = 6
    end
    object IBQuery_ResultadoExameCODPROVA: TIBStringField
      FieldName = 'CODPROVA'
      Origin = 'NOTAALUNO_VIEW.CODPROVA'
      Size = 4
    end
    object IBQuery_ResultadoExameNOTA: TIBBCDField
      FieldName = 'NOTA'
      Origin = 'NOTAALUNO_VIEW.NOTA'
      DisplayFormat = '#0.00'
      Precision = 9
      Size = 2
    end
  end
  object DSQ_ResultadoExame: TDataSource
    DataSet = IBQuery_ResultadoExame
    Left = 496
    Top = 279
  end
  object IBTable_QGA: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    Active = True
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
        Name = 'FASEAPLICACAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REFERENCIAAVALIACAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CODMATERIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'CODPROVA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'PESOAPLICACAO'
        DataType = ftSmallint
      end
      item
        Name = 'PESODISCIPLINA'
        DataType = ftSmallint
      end
      item
        Name = 'MEDIAPARCIAL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MEDIAMINIMA'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'MEDIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ORDEM'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_PROVA'
        DataType = ftString
        Size = 27
      end
      item
        Name = 'RESULTADO'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'AVALIACAO_PK'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
        Options = [ixUnique]
      end
      item
        Name = 'FK_AVALIACAO'
        Fields = 'IDCURSO;IDTURMA'
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;REFERENCIAAVALIACAO;CODMATERIA'
    MasterFields = 'IDCURSO;IDTURMA;REFERENCIAAVALIACAO;CODMATERIA'
    MasterSource = DSQ_ResultadoExame
    StoreDefs = True
    TableName = 'AVALIACAO'
    Left = 465
    Top = 310
    object IBTable_QGAIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_QGAIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_QGAFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Size = 1
    end
    object IBTable_QGAREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Size = 3
    end
    object IBTable_QGACODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Size = 7
    end
    object IBTable_QGACODPROVA: TIBStringField
      FieldName = 'CODPROVA'
      Size = 4
    end
    object IBTable_QGAMEDIAMINIMA: TIBBCDField
      FieldName = 'MEDIAMINIMA'
      Precision = 9
      Size = 2
    end
  end
end