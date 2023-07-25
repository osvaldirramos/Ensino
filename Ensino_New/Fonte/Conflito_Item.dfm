object Form_ConflitoItem: TForm_ConflitoItem
  Left = 286
  Top = 115
  Width = 1120
  Height = 640
  Caption = 'Tratamento de Conflito de Item'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1112
    Height = 209
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16577515
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel_Curso: TPanel
      Left = 0
      Top = 0
      Width = 344
      Height = 207
      Align = alLeft
      BevelOuter = bvNone
      Color = 16577515
      TabOrder = 0
      object Label1: TLabel
        Left = 48
        Top = 8
        Width = 82
        Height = 13
        Caption = 'Item Selecionado'
      end
      object Label2: TLabel
        Left = 48
        Top = 32
        Width = 78
        Height = 20
        Caption = 'Disciplina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label_Disciplina: TLabel
        Left = 48
        Top = 56
        Width = 67
        Height = 20
        Caption = 'Disciplina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 48
        Top = 88
        Width = 141
        Height = 20
        Caption = 'Item Selecionado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label_ItemSelecionado: TLabel
        Left = 48
        Top = 112
        Width = 124
        Height = 20
        Caption = 'Item Selecionado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object JvShape6: TJvShape
        Left = 175
        Top = 10
        Width = 73
        Height = 51
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Retornar: TJvTransparentButton
        Left = 176
        Top = 11
        Width = 71
        Height = 49
        Hint = 'Retornar para Janela anterior.'
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
      object JvShape7: TJvShape
        Left = 255
        Top = 10
        Width = 73
        Height = 51
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Windows: TJvTransparentButton
        Left = 256
        Top = 11
        Width = 71
        Height = 49
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
      object ToolBar3: TToolBar
        Left = 0
        Top = 133
        Width = 344
        Height = 31
        Align = alNone
        ButtonHeight = 24
        ButtonWidth = 8
        Caption = 'ToolBar_Selecao'
        Color = 16577515
        Ctl3D = True
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object MaskEdit_NItem: TJvEdit
          Left = 0
          Top = 2
          Width = 73
          Height = 24
          Hint = 'Realiza filtro pelo c'#243'digo do aluno.'
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
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          MaxLength = 10
          ParentShowHint = False
          PasswordChar = #0
          ReadOnly = False
          ShowHint = True
          TabOrder = 4
        end
        object MaskEdit_Disc: TJvEdit
          Left = 73
          Top = 2
          Width = 51
          Height = 24
          Hint = 'Realiza filtro pelo c'#243'digo do aluno.'
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
          CharCase = ecUpperCase
          MaxLength = 2
          ParentShowHint = False
          PasswordChar = #0
          ReadOnly = False
          ShowHint = True
          TabOrder = 5
        end
        object MaskEdit_Unid: TJvEdit
          Left = 124
          Top = 2
          Width = 46
          Height = 24
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
          CharCase = ecUpperCase
          MaxLength = 2
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 0
        end
        object MaskEdit_SubUnid: TJvEdit
          Left = 170
          Top = 2
          Width = 66
          Height = 24
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
          CharCase = ecUpperCase
          MaxLength = 2
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 1
        end
        object MaskEdit_Objetivo: TJvEdit
          Left = 236
          Top = 2
          Width = 51
          Height = 24
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
          CharCase = ecUpperCase
          MaxLength = 1
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 2
        end
        object MaskEdit_Serie: TJvEdit
          Left = 287
          Top = 2
          Width = 47
          Height = 24
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
          CharCase = ecUpperCase
          MaxLength = 2
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 3
        end
      end
    end
    object JvDBRichEdit1: TJvDBRichEdit
      Left = 344
      Top = 0
      Width = 766
      Height = 207
      DataField = 'DESCENALT'
      DataSource = Form_Sel_ItemProva.DST_ItemDesc
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      WantTabs = True
    end
  end
  object Panel_Treeviw: TPanel
    Left = 0
    Top = 209
    Width = 407
    Height = 400
    Align = alLeft
    Color = 16577515
    TabOrder = 1
    object JvCaptionPanel_Disciplina: TJvCaptionPanel
      Left = 1
      Top = 1
      Width = 405
      Height = 398
      Align = alClient
      Buttons = []
      Caption = '                                 [ Disciplina ]'
      CaptionPosition = dpTop
      CaptionFont.Charset = ANSI_CHARSET
      CaptionFont.Color = clWhite
      CaptionFont.Height = -13
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = [fsBold]
      OutlookLook = False
      TabOrder = 0
      object DBNavigator2: TDBNavigator
        Left = 32
        Top = 3
        Width = 100
        Height = 22
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
      object ToolBar2: TToolBar
        Left = 1
        Top = 26
        Width = 397
        Height = 29
        ButtonHeight = 21
        Caption = 'ToolBar_Selecao'
        Color = 16577515
        ParentColor = False
        TabOrder = 1
        object MaskEdit_Disciplina: TMaskEdit
          Left = 0
          Top = 2
          Width = 65
          Height = 21
          EditMask = '999999;0; '
          MaxLength = 6
          TabOrder = 1
        end
        object JvEdit_NomeMateria: TJvEdit
          Left = 65
          Top = 2
          Width = 320
          Height = 21
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
          MaxLength = 120
          ParentFont = False
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 0
        end
      end
      object DBGrid_Disciplina: TDBGrid
        Left = 1
        Top = 55
        Width = 397
        Height = 336
        Align = alClient
        Color = clCream
        Ctl3D = False
        DataSource = DSQ_MontaMateria
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clGray
        TitleFont.Height = -17
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = [fsItalic]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODMATERIA'
            Title.Alignment = taCenter
            Title.Caption = 'Disciplina'
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 61
            Visible = True
          end
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
            Visible = True
          end>
      end
    end
  end
  object Panel_Container: TPanel
    Left = 407
    Top = 209
    Width = 705
    Height = 400
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Panel_Funcoes: TPanel
      Left = 1
      Top = 1
      Width = 703
      Height = 398
      Align = alClient
      Color = 16577515
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object DBGrid_Item: TDBGrid
        Left = 1
        Top = 1
        Width = 110
        Height = 396
        Align = alLeft
        BorderStyle = bsNone
        Color = clCream
        Ctl3D = False
        DataSource = DSC_SelConflito
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clRed
        TitleFont.Height = -12
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = [fsBold]
        OnCellClick = DBGrid_ItemCellClick
        OnDrawColumnCell = DBGrid_ItemDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'status'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Color = 16311249
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = 16311249
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 22
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'numItem'
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
            Width = 72
            Visible = True
          end>
      end
      object JvDBRichEdit_Text: TJvDBRichEdit
        Left = 111
        Top = 1
        Width = 591
        Height = 396
        DataField = 'DESCENALT'
        DataSource = DST_MostraItemConflito
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        WantTabs = True
      end
    end
  end
  object Query_MontaMateria: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    AfterScroll = Query_MontaMateriaAfterScroll
    Active = True
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select IdCurso, IdTurma, CodMateria, NomeMateria,     NumeroAula' +
        'sTeoricas, NumeroAulasPraticas'
      'from MateriaCurso'
      'Order By CodMateria')
    Left = 24
    Top = 282
    object Query_MontaMateriaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'MATERIACURSO.IDCURSO'
      Required = True
    end
    object Query_MontaMateriaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'MATERIACURSO.IDTURMA'
      Required = True
    end
    object Query_MontaMateriaCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'MATERIACURSO.CODMATERIA'
      Required = True
      Size = 6
    end
    object Query_MontaMateriaNOMEMATERIA: TIBStringField
      FieldName = 'NOMEMATERIA'
      Origin = 'MATERIACURSO.NOMEMATERIA'
      Size = 120
    end
    object Query_MontaMateriaNUMEROAULASTEORICAS: TSmallintField
      FieldName = 'NUMEROAULASTEORICAS'
      Origin = 'MATERIACURSO.NUMEROAULASTEORICAS'
    end
    object Query_MontaMateriaNUMEROAULASPRATICAS: TSmallintField
      FieldName = 'NUMEROAULASPRATICAS'
      Origin = 'MATERIACURSO.NUMEROAULASPRATICAS'
    end
  end
  object IBQuery_Item: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_MontaMateria
    SQL.Strings = (
      
        'select  IdCurso, IdTurma, NumItem, CodMateria, Disciplina, Unida' +
        'de, SubUnidade, Objetivo, Serie, Status'
      'From Item_Prova'
      'where idCurso = :idCurso'
      'and IdTurma= :IdTurma'
      'and codMateria = :codMateria'
      ' Order By disciplina,unidade,subunidade,objetivo,serie')
    Left = 24
    Top = 320
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
      Origin = 'ITEM_PROVA.IDCURSO'
      Required = True
    end
    object IBQuery_ItemIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ITEM_PROVA.IDTURMA'
      Required = True
    end
    object IBQuery_ItemNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'ITEM_PROVA.NUMITEM'
      Required = True
    end
    object IBQuery_ItemCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'ITEM_PROVA.CODMATERIA'
      Required = True
      Size = 7
    end
    object IBQuery_ItemDISCIPLINA: TIBStringField
      FieldName = 'DISCIPLINA'
      Origin = 'ITEM_PROVA.DISCIPLINA'
      Required = True
      Size = 2
    end
    object IBQuery_ItemUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'ITEM_PROVA.UNIDADE'
      Size = 2
    end
    object IBQuery_ItemSUBUNIDADE: TIBStringField
      FieldName = 'SUBUNIDADE'
      Origin = 'ITEM_PROVA.SUBUNIDADE'
      Size = 2
    end
    object IBQuery_ItemOBJETIVO: TIBStringField
      FieldName = 'OBJETIVO'
      Origin = 'ITEM_PROVA.OBJETIVO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_ItemSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ITEM_PROVA.SERIE'
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
    Left = 63
    Top = 321
  end
  object DSQ_MontaMateria: TDataSource
    DataSet = Query_MontaMateria
    Left = 64
    Top = 283
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
    Left = 24
    Top = 389
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
    Left = 60
    Top = 385
  end
  object DSC_SelConflito: TDataSource
    DataSet = ClientDataSet_SelConflito
    Left = 237
    Top = 348
  end
  object IBTable_MostraItemConflito: TIBTable
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
    MasterSource = DSC_SelConflito
    StoreDefs = True
    TableName = 'ITEM_DESC'
    Left = 280
    Top = 317
    object IntegerField1: TIntegerField
      FieldName = 'NUMITEM'
    end
    object IBStringField1: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Size = 1
    end
    object SmallintField1: TSmallintField
      FieldName = 'QDEAPLIC'
    end
    object SmallintField2: TSmallintField
      FieldName = 'QDEIRREGULARIDADE'
    end
    object SmallintField3: TSmallintField
      FieldName = 'QDEANULADA'
    end
    object IBStringField2: TIBStringField
      FieldName = 'POSSUI_IMAGEM'
      Size = 1
    end
    object IBStringField3: TIBStringField
      FieldName = 'RECURSO'
      Size = 1
    end
    object IBStringField4: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object BlobField1: TBlobField
      FieldName = 'DESCENALT'
      Size = 8
    end
    object SmallintField4: TSmallintField
      FieldName = 'NLINHAS'
    end
    object IBStringField5: TIBStringField
      FieldName = 'TEMPORES'
      Size = 4
    end
  end
  object DST_MostraItemConflito: TDataSource
    DataSet = IBTable_MostraItemConflito
    Left = 284
    Top = 353
  end
  object IBTable_ItemConflito: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDTURMA'
        DataType = ftInteger
      end
      item
        Name = 'IDCURSO'
        DataType = ftSmallint
      end
      item
        Name = 'NUMITEM'
        DataType = ftInteger
      end
      item
        Name = 'NUMITEM_CONFLITO'
        DataType = ftInteger
      end
      item
        Name = 'CONFLITO'
        DataType = ftString
        Size = 1
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
    TableName = 'ITEM_CONFLITO'
    Left = 112
    Top = 333
    object IBTable_ItemConflitoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_ItemConflitoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_ItemConflitoNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
    end
    object IBTable_ItemConflitoNUMITEM_CONFLITO: TIntegerField
      FieldName = 'NUMITEM_CONFLITO'
    end
    object IBTable_ItemConflitoCONFLITO: TIBStringField
      FieldName = 'CONFLITO'
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = IBTable_ItemConflito
    Left = 148
    Top = 329
  end
  object ClientDataSet_SelConflito: TClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 241
    Top = 314
    Data = {
      740000009619E0BD010000001800000004000000000003000000740006737461
      7475730200030000000000076E756D4974656D04000100000000000A64697363
      69706C696E610100490000000100055749445448020002000A00076F626A6574
      766F01004900000001000557494454480200020005000000}
    object ClientDataSet_SelConflitostatus: TBooleanField
      FieldName = 'status'
    end
    object ClientDataSet_SelConflitonumItem: TIntegerField
      FieldName = 'numItem'
    end
    object ClientDataSet_SelConflitodisciplina: TStringField
      FieldName = 'disciplina'
      Size = 10
    end
    object ClientDataSet_SelConflitoobjetvo: TStringField
      FieldName = 'objetvo'
      Size = 5
    end
  end
  object IBTable1: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDTURMA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDCURSO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NUMITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMITEM_CONFLITO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CONFLITO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'PK_ITEM_CONFLITO'
        Fields = 'IDTURMA;IDCURSO;NUMITEM;NUMITEM_CONFLITO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ITEM_CONFLITO'
        Fields = 'IDTURMA;IDCURSO;NUMITEM'
      end>
    IndexFieldNames = 'NUMITEM'
    MasterFields = 'numItem'
    MasterSource = DSC_SelConflito
    StoreDefs = True
    TableName = 'ITEM_CONFLITO'
    Left = 272
    Top = 413
    object IBTable1IDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Required = True
    end
    object IBTable1IDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Required = True
    end
    object IBTable1NUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Required = True
    end
    object IBTable1NUMITEM_CONFLITO: TIntegerField
      FieldName = 'NUMITEM_CONFLITO'
      Required = True
    end
    object IBTable1CONFLITO: TIBStringField
      FieldName = 'CONFLITO'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 308
    Top = 417
  end
end
