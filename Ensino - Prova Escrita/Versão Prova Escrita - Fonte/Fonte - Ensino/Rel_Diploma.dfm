object Form_Rel_Diploma: TForm_Rel_Diploma
  Left = 254
  Top = 94
  Width = 1170
  Height = 813
  Caption = 'Diploma'
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
    Top = 0
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = Form_SelTurma.IBTable_Pessoa_IT
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      26.458333333333330000
      2100.000000000000000000
      26.458333333333330000
      2970.000000000000000000
      13.229166666666670000
      13.229166666666670000
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
    Units = Pixels
    Zoom = 100
    PrevFormStyle = fsMDIForm
    PreviewInitialState = wsMaximized
    object PageFooterBand1: TQRBand
      Left = 5
      Top = 10
      Width = 1113
      Height = 756
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
        2000.250000000000000000
        2944.812500000000000000)
      BandType = rbDetail
      object QRImage_Log01: TQRImage
        Left = 2
        Top = 4
        Width = 1103
        Height = 751
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1987.020833333333000000
          5.291666666666667000
          10.583333333333330000
          2918.354166666667000000)
        Stretch = True
      end
      object QRImage_Decea: TQRImage
        Left = 88
        Top = 73
        Width = 87
        Height = 99
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          261.937500000000000000
          232.833333333333300000
          193.145833333333300000
          230.187500000000000000)
        Stretch = True
      end
      object QRImage_Icea: TQRImage
        Left = 930
        Top = 73
        Width = 87
        Height = 99
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          261.937500000000000000
          2460.625000000000000000
          193.145833333333300000
          230.187500000000000000)
        Stretch = True
      end
      object QRImage_BrasaoUniao: TQRImage
        Left = 512
        Top = 57
        Width = 85
        Height = 84
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          222.250000000000000000
          1354.666666666667000000
          150.812500000000000000
          224.895833333333300000)
        Stretch = True
      end
      object QRLabel8: TQRLabel
        Left = 370
        Top = 151
        Width = 371
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          978.958333333333300000
          399.520833333333300000
          981.604166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MINIST'#201'RIO DA DEFESA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 370
        Top = 171
        Width = 371
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          978.958333333333300000
          452.437500000000000000
          981.604166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'COMANDO DA AERON'#193'UTICA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRLabel2: TQRLabel
        Left = 370
        Top = 193
        Width = 371
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          978.958333333333300000
          510.645833333333300000
          981.604166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'INSTITUTO DO CONTROLE DO ESPA'#199'O A'#201'REO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRImage_Assinatura: TQRImage
        Left = 752
        Top = 603
        Width = 322
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          1989.666666666667000000
          1595.437500000000000000
          851.958333333333300000)
        Picture.Data = {
          0A544A504547496D616765720D0000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108002C007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFC
          A3A56378BBC6F69E0F86212A4F7579744ADAD9DB26F9EE580C90A38181DD890A
          3B915CEBF86BC5FE3E977EA9AB0F0BE98D9C58695B64BB9578E25B86076F7E22
          50476735BD3A0DAE693E55DDFE8B77F97764B7D8D1F89FF1C7C1DF0574E8AEBC
          59E26D0FC3D0DC36D87EDF791C2D70DFDD8D58E5DBD94135C37FC35E9F13823C
          1DF0EFE23F8B016DA93FF647F64DABFF00B425BF680327FB481B23A66BB6F087
          C09F08F81B5A7D574ED06C17599976CBA9CE86E2FE61E8F7126E958727AB1EB5
          D4DC4A6DADDDD63790A02422E3737B0CF15D11AB84A6B4839BEF2765FF0080AD
          7FF2726D37BBB1E35278A7E3E78B25FF0041F08FC37F095AB1203EABAEDCEA57
          4A31C130C102479F61376EB50CDF087E396BEC3EDDF18BC37A3C7924A687E0A0
          AE06781BEE6EA607FEF815D6EA3E30F895797522E97E09F0EC16E0FC92EA9E22
          68A4619EA6386DE50323FDBAC5D43E27FC5CF0A2BDC6A1F0C741D6EC62F99C78
          7FC51E6DEB2FFB10DCDBC08C7DBCE19AF4633ADFF2E614A3E5784BFF004B72FC
          C9B2EADFE3FA1CBEADFB1C7C41F1107FB6FED13F13177F6B2B3D36CC2FD3CB80
          1FD6B9E9FF00E09C7E2291DDDBE3DFC55BC790AB1FB6DEEE0083918113478FEB
          DEBDE7E0FF00C68D13E37F86E6D43457BB8DECAE0D9DFD95EDB3DADE69B70A01
          686689C06470083E84306048209EB2A7FB7B31A0DD34D45AFEE417FEDA1EC29C
          B5DFE6CF91F52FF826FF008BD123361F162E25922E57FB460D5A607D73E4EAB1
          75FA5675E7EC3FF16341888D3B5BD03556424A91E31F13E8CC7FF26AED47E440
          AFB268AD1715665B4E7CCBD12FFD26CC9FAAD3EC7C5177E1FF008CDF0BD59B54
          B1F8D76966A06FBDF09F8A74DF16C50807EF35BDF5AC774E3DA24663E95DD7C1
          AF8B1F10BE22595E4FE08F88DE0EF883368EC916A3A1F89F40B9F0E6B163215C
          84B8D9978198608DF69CF6C8AF7AF899F17FC2DF067C3EFAAF8B3C43A3F8774F
          4E3CFD42ED20563FDD5DC46E6248000C924D78678674CBDFDA3FF6C6F097C4BF
          0FF872FBC39E16F086957D6171AEEA16ED6579E2D5B80822B78E0602536B1329
          943CC172FB762E0B31EA8E3A58AA32AB5A8C63149FBDCAACDA57516E57936F65
          CB34D5EF6B26250517CA9FF5FD791D7D87ED7CBE0BD5EDB4CF8A1E18D4BE1C5C
          DDCAB6F6FA95C4A979A15DC8C40554BE8FE58D989C2ADC2C4CC7800D7B324825
          40CA41079041CD53F11F8734FF0017E8577A5EAB656BA8E9B7F1341736B73109
          619E361865653C3023A835E4BF046D17E01FC5C9BE1545757B75A05C69326BDE
          1A17529964B0B78A78E1B8B30EC4B34713CF018F7125564DB921463C574E8E22
          9CA7463CB38ABB8DEE9AEAE37D535BB4DBBABBBAB58D6EE2ECF63D9E8A28AF34
          D0C9D07C349A7DFDD6A131696FEF5B2EEED9F2D3F8635F4503B0EA727A9AD6A4
          DC3763233D714B4E526DDD858282715CFF00C4AF8ADE1BF83BE1C6D5FC51AD69
          DA1E9C1D6259AEE61189646FBB1A03CBBB1E02282C4F001AF963C6FF000F3E29
          7ED25F146FB58F0ADDBB78375401221E35D2F50D36DEC6121772C16B0DE412CC
          495CE67B743F363CC238AF4F2FCB5622F3AD3F6705F69A766FB2E8DF5B5CCAA5
          4E5D22AECFAE75FF0012E9FE16D16E751D4AFAD2C2C2CE332CF717132C7142A0
          64B33120003DEBE6FF00D967F6A7F88BFB547C239F5DD0BC3B15A5B6B7ABEA32
          E91ACEAF11B6B2874A1792A58CA91A9F32E9E4B648A6C8D89FBD00BE41AF8B7F
          E0A97FF04E3D27E0E7C1AD1F6EA5E2DF1278ABE24F89EC3C336969E19B492D92
          C1652EF3CD0DA2C8E64290472950CE4EE2BB9F6839D397F62CF8ADE2DF8EDE12
          F0C7802C3F680F879F0E7C37E1AF34DB78A3C4F6DA8E9FA89591A38A06491EE6
          181C4712E220AE7132EE5855727EBF07C3B95BC32AD1C4A7CD76A538F2C528AD
          747252936DD9595B4D558E59D7AB7B72FF005F71FA07E089FC11FB30699ABB6B
          DE39D3A6D735FBD3A9EB1A8EAB7D0C33DF5C1448C111820222C691A2228C2AA0
          1C9C926B5FB65F85ADB48B9BED26C7C4FE22B4B35324F7565A4CB159C483EF39
          B99C4706D00124EFE8335F1F0F825FB507ECA5E0B8EFF47F0FFC3AF1B6B1E37D
          42286F8E916306917BE0D804646E8E660D6AFF002A7CD21880F364C90CA00AE7
          7E107EDD3E15BEF8FF00E23D0BF68EF1EBF827C31A45C4171E18F09F89E78AE5
          2F8C7126FB8BCBF819EDE62262CC96E590E4A929C2810B86E95753C4D39FB7E5
          D5F23BB695934A9A8F325D16AA364DE8AD77F5892B45AE5F5FF33EB2F84BFB5D
          78CBF6A25D44F80FC31E1DD1EDF4C9443752788F54905EDBEF50F1486D218C93
          1C88772379A15D790C6BB05F81DE3DF18DBB2F8ABE28EA504528C3DA78634E8B
          4A8F1E9E748669FDB2AEA6BE63FDA97F6EAF86DE00F89DE13F8D3E05D47C4DAB
          CDA3ECD33C5A9A6F85B5596CF56F0EBB12F33CC2DBC9DD66EDF68472E3E4F3D0
          13E6015E85AAFF00C1683E10D9DD2DB58D87C44D6AFA420476563E16B93792E7
          A110B859307D4AE3DF915CD5726CC9F2D4CBF06E316B6706DC5ADEEE69BF34D5
          B47DD32955A7F6E77F9FF91ED5E00FD907E1E7C3AD6A3D5ADBC3B6FA96BD18C7
          F6C6AF249A9EA47FEDE2E19E41F4040F6AF4B0315F3743FB7F788BC57A18B9F0
          A7ECF3F1C7579A5E218F52D3ACB4346C8EACD77728CA3DF61AE3F52F8BBFB55F
          C4991E293E12DE7C3EB02C47FC4B75AD1750BE65E3045C4D706343EBFE8EDEC7
          D7CB793E3711372C5D5845AD2F3A91BFA5B99CBF035F6B08E914FE49FF00C31F
          507C49F8ABE1DF841E1B9356F126AD69A4D8C6768799FE6958F4444196772780
          AA0927A0AF35F827A26B9F167E3AEA1F14F5BD26F3C3FA643A39F0FF008634DB
          D4F2EF4DB4932CF73773C7FF002C9A678ADC2C67E6558416C162A383F875E07F
          17F8275E8B5C9BE07EA3E20F1303CEB5E20F1B59DF5F4791CF96C41588751B62
          545F6AF64D07E22FC40BFBC097DF0E23B0849E641E218252A3E817FAD454C27D
          5A128D09464E4ACE5CF0DBAA8A527BED77AB5A596A119736B25F833D0E8AA70D
          FDCBC285EC644720165F310ED3E99CD15E058DAE5CC7345145219E75FB417ECE
          561F1E22D12F5756D53C35E28F0ADC3DE685AE69C636B8D3657431BFEEE5568A
          5475386475208C6304023C7FC77F1CFE29FC09FF00419FC5DF0EBE22EA19090D
          959F87351875494F41BD2D1EE5413FDE291AD7D27E32D1D7C43E10D56C1A7B9B
          55BEB39ADCCD6D27973421D0AEE46FE1619C83D8815F037C05FDA5B54F809A75
          CF82BC2BA1784F48D1B437FB3426DF4D114B2852CA1A42AC159CED193B7935F5
          193539D6A0DCD29C60ECA2D2EBAE92B3695FA2DEEDE8CC2A68F43D8BE1EFC72F
          DAA3E27C2D27FC29CF87FE0FB7E7CAB9F10789A62EFE8C2DE085DC0F67643EB8
          ACBD53E02FED6BF11758B97D77E2E7813C3DA6CC1952C7C37A5CD12460F0332C
          8BE7923D5664E9D2BD67E14F8F35FF0089F656F3DE6B17369E633068ED218154
          FF00DF48C7F235DD27C2BB0D46DC0D42F75AD4B0307CFD425556FAA46554FE55
          B57C6CB0951CE3469413ED0E7B7A7B46ECFD2C6718736976FE76FC8F92F5DFF8
          27969B693A5C7C45F89BE1ABFB86E09D5EC65D55E524E785D52F2E909F40B1E3
          DAAE3FECA5E1597C3371E1FD32D7E26F8F34BD563686E6C34CB3B1F0B6913C64
          60A48F041681A323A852F91D8D7D6FA17C37D03C3373E7D868DA6DACE7ACB1DB
          A090FD5B193F89ADBC565538AF192B734DCADB6D15FF0092AE65F2922961A0BA
          1F02780FFE08ABA5EA29AA699AD5C8F0F7C3BD5608E18BC1D1DE3EBEFA4A2821
          D2D6FEED77DB2CA36EF58D095C7EEDD3AD7DC3E03F873A17C30F0E5AE91E1ED2
          34FD1F4EB28921860B48162455500018039E0753CD6D515E6E679E6371F65899
          B696CBA7F9B7A6EDB6FAB35852843E1400628A28AF20D028A28A0028A28A00FF
          D9}
      end
      object QRImage_MarcaDagua: TQRImage
        Left = 275
        Top = 561
        Width = 89
        Height = 88
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          232.833333333333300000
          727.604166666666700000
          1484.312500000000000000
          235.479166666666700000)
      end
      object QRImage_Fundo: TQRImage
        Left = 295
        Top = 302
        Width = 502
        Height = 218
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          576.791666666666700000
          780.520833333333300000
          799.041666666666700000
          1328.208333333333000000)
        Stretch = True
      end
      object QRLabel4: TQRLabel
        Left = 370
        Top = 231
        Width = 371
        Height = 74
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          195.791666666666700000
          978.958333333333300000
          611.187500000000000000
          981.604166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Certificado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 48
      end
      object QRLabel_Conferido: TQRLabel
        Left = 465
        Top = 334
        Width = 175
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1230.312500000000000000
          883.708333333333300000
          463.020833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel_Conferido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRLabel_Nome: TQRLabel
        Left = 483
        Top = 364
        Width = 141
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1277.937500000000000000
          963.083333333333300000
          373.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel_Nome'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRLabel_Funcao: TQRLabel
        Left = 475
        Top = 394
        Width = 154
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1256.770833333333000000
          1042.458333333333000000
          407.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel_Funcao'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRLabel_Curso01: TQRLabel
        Left = 471
        Top = 425
        Width = 164
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1246.187500000000000000
          1124.479166666667000000
          433.916666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel_Curso01'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRLabel_Cidade: TQRLabel
        Left = 528
        Top = 522
        Width = 529
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1397.000000000000000000
          1381.125000000000000000
          1399.645833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cidade, data'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 14
      end
      object QRLabel_Certidao: TQRLabel
        Left = 272
        Top = 663
        Width = 97
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          719.666666666666700000
          1754.187500000000000000
          256.645833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Certidao'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRLabel_Curso02: TQRLabel
        Left = 471
        Top = 454
        Width = 164
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1246.187500000000000000
          1201.208333333333000000
          433.916666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel_Curso02'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRLabel_Curso03: TQRLabel
        Left = 471
        Top = 484
        Width = 164
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1246.187500000000000000
          1280.583333333333000000
          433.916666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel_Curso03'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRLabel3: TQRLabel
        Left = 597
        Top = 641
        Width = 425
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1579.562500000000000000
          1695.979166666667000000
          1124.479166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ROBSON LOUZADA DE LIMA FERRIRA Cel Av'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRLabel5: TQRLabel
        Left = 755
        Top = 665
        Width = 141
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1997.604166666667000000
          1759.479166666667000000
          373.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Diretor do ICEA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
    end
  end
  object IBTable_CertidaoAluno: TIBTable
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
        Name = 'ANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CERTIFICADO'
        DataType = ftInteger
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PK_CERTIDAOALUNO'
        Fields = 'IDCURSO;IDTURMA;IDENTIDADE'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterSource = Form_SelTurma.DSQ_AlunoTurma
    StoreDefs = True
    TableName = 'CERTIDAOALUNO'
    Left = 36
    Top = 32
    object IBTable_CertidaoAlunoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_CertidaoAlunoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_CertidaoAlunoIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_CertidaoAlunoANO: TIBStringField
      FieldName = 'ANO'
      Size = 4
    end
    object IBTable_CertidaoAlunoCERTIFICADO: TIntegerField
      FieldName = 'CERTIFICADO'
    end
  end
end
