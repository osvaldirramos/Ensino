object Form_MontarProvaAutomatica: TForm_MontarProvaAutomatica
  Left = 291
  Top = 67
  Width = 1269
  Height = 784
  Caption = 'Ensino --> Montagem da Prova Autom'#225'tica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Principal: TPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 746
    Align = alLeft
    BevelOuter = bvNone
    Color = 8355711
    TabOrder = 0
    object Panel_Botoes_CabecalhoProva: TPanel
      Left = 0
      Top = 0
      Width = 881
      Height = 110
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = 16775660
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label_DescricaoCurso: TLabel
        Left = 496
        Top = 88
        Width = 107
        Height = 13
        Caption = 'Label_DescricaoCurso'
        Visible = False
      end
      object JvGradient3: TJvGradient
        Left = 0
        Top = 0
        Width = 879
        Height = 108
        Align = alClient
        Style = grVertical
        StartColor = 8355711
        EndColor = 16710631
        Steps = 108
      end
      object Shape7: TShape
        Left = 4
        Top = 7
        Width = 600
        Height = 91
        Brush.Color = 16775660
        Shape = stRoundRect
      end
      object Shape3: TShape
        Left = 80
        Top = 68
        Width = 524
        Height = 1
      end
      object Label5: TLabel
        Left = 86
        Top = 73
        Width = 117
        Height = 17
        Caption = 'Referencia Prova:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 285
        Top = 73
        Width = 77
        Height = 17
        Caption = 'Data Prova:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Shape2: TShape
        Left = 283
        Top = 68
        Width = 1
        Height = 29
      end
      object Shape1: TShape
        Left = 80
        Top = 43
        Width = 524
        Height = 1
      end
      object Label_CodProva: TLabel
        Left = 138
        Top = 19
        Width = 47
        Height = 16
        Caption = 'ATM002'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label_Curso: TLabel
        Left = 87
        Top = 19
        Width = 50
        Height = 18
        Caption = 'Curso: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 87
        Top = 48
        Width = 50
        Height = 17
        Caption = 'Turma: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label_Turma: TLabel
        Left = 135
        Top = 50
        Width = 62
        Height = 15
        Caption = 'M. BICUDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Image_Brasao: TImage
        Left = 8
        Top = 16
        Width = 68
        Height = 73
        AutoSize = True
        Stretch = True
        Transparent = True
      end
      object DBText1: TDBText
        Left = 205
        Top = 74
        Width = 65
        Height = 17
        DataField = 'CODPROVA'
        DataSource = Form_Cad_Prova.DSQ_MontaTeste
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 365
        Top = 74
        Width = 104
        Height = 17
        DataField = 'DATAAPLICACAO'
        DataSource = Form_Cad_Prova.DSQ_MontaTeste
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label_QtdItens: TLabel
        Left = 486
        Top = 73
        Width = 63
        Height = 17
        Caption = 'Qtd Itens:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Shape9: TShape
        Left = 484
        Top = 68
        Width = 1
        Height = 29
      end
      object DBText_TotalItens: TDBText
        Left = 552
        Top = 74
        Width = 33
        Height = 17
        DataField = 'TOTALITENS'
        DataSource = Form_Cad_Prova.DSQ_MontaTeste
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Shape10: TShape
        Left = 79
        Top = 9
        Width = 1
        Height = 88
      end
      object JvShape6: TJvShape
        Left = 713
        Top = 28
        Width = 73
        Height = 52
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Fechar: TJvTransparentButton
        Left = 714
        Top = 29
        Width = 71
        Height = 50
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
        OnClick = JvTransparentButton_FecharClick
      end
      object JvShape7: TJvShape
        Left = 793
        Top = 28
        Width = 73
        Height = 52
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Windows: TJvTransparentButton
        Left = 794
        Top = 29
        Width = 71
        Height = 50
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
      object JvShape8: TJvShape
        Left = 610
        Top = 28
        Width = 88
        Height = 52
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_Ferramentas: TJvTransparentButton
        Left = 609
        Top = 30
        Width = 90
        Height = 49
        Hint = 'Ferramentas de aux'#237'lio'
        BorderWidth = 0
        Caption = 'Ferramentas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          5E050000424D5E05000000000000360000002800000014000000160000000100
          1800000000002805000000000000000000000000000000000000FEFEFEFAFAFA
          FDFDFDFDFDFDFFFFFFFEFEFEFEFEFEFBFBFCFFFFFFE7F0FDD0985FE5E9ECB19A
          8BC27E49DC9D59E3DAD1FFFFFFFEFEFEFEFEFEFCFCFCFEFEFEFCFCFCFEFEFEFE
          FEFEFFFFFFFFFFFFFDFDFDFFFFFFE0C19FDE7A00D7B08AFFC05CAA5C42E19335
          CAC3CCF4B155FEFFFFFFFEFEFEFEFEFEFFFEFFFFFFFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFDFEFEFFFFFFDA9640D37B00FAFFFFF0BC83DA7F00F8D899E2D0C5F9
          D395FFFFFFF6F8FBFDFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFEFDFE
          FFFFFFFAFFFFFAFCFE7B2900FAC869FFFFFFFFFFFFFFFFFFF4EEE9F4AA2BDF90
          34E38900FCFCE9FEFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFEFEFEFFFFF3BA7BF6
          950CEEB149EB8100F8F5DCFFFFFFFFFFFFFFFFFFFFFFFFF7F2ECFEFFF5E1E5FD
          E99D1DFCFFFFFDFDFDFEFEFEFEFEFEFFFFFEFEFDFEFEFFFFFA912EEDA93EFAFF
          FFFCFFFFFFFFFFFCFFFFE4AA57F8A82EFCFAE9FFFFFFF5F6FBDC9720FAFCEFFD
          FFFFFCFCFCFBFBFBFEFEFEFDFDFDFEFEFEF9FFFFF4A938F6AD2CF7BE5AFBF4E3
          FFFFFFE7C093FADC9FD1682AD78A0BFDFFFFF6D0AEF9DB9CFFFFFFFEFEFEFEFE
          FEFCFCFCFBFBFBFEFEFEFDFDFEFFFFFFFFFFFFFFFFF9964703EEAD45FFFFFFF2
          C18CFEF0C7D48A65DF7816FEFFFFF8FBFFF09D29F6CD79FBFEFEFEFEFEFEFEFE
          FDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFBFFFFBF4C00F2C56BFFFFFFFDFFFFF3A8
          38D97000F6D590FCFFFFFFFFFFFFFFFFD3965EFFEABEFFFFFFFFFFFEFEFEFEFE
          FFFFFFFFFFFFFFFFEBE1D1E36400F2CE8CFFFFFFFAFFFFFEFFFFFEFFFFFCFFFF
          FDFFFFFEFFFFE6A04CF4A81DE28600FFFFFFFFFEFEFEFFFFFFFFFFFCFFFFFEFF
          FEF5DDC9F3C580913D00F3AD52D5A972F78600F7E8C4FEFFFFFFFFFFFFFFFFF5
          EEEFF3A93EF7FFF1FAFFF3FDFEFFFEFEFEFFFFFFE2BB8FF7890DE28B13D55508
          D49744D6831DBB986FFFFFF6BA4D18E98E20FEFFFFE6A95DEB9E30FDFFFFF095
          2FFDFFFFFFFEFFFEFFFFFDFEFEFFFFFF957850AC5A00DCCDC6F1A232EAE6EAEC
          9A32E6954DFFEFC7B65213EDB261EEF2FFF19826EA6B13F0BF73CD8638FDE3BA
          FEFFFFFBFBFBFEFFFFD1A77AEDA84DC75200FFFEEDF9FFFFFFFFFFF1D5B9C8C2
          BADF7800BE6325ED8A1ADD8A22FBFFF4F4C38AF58A20FAF4D8FDFFFFFEFEFEFD
          FDFDE9D8C3A34200D2A774F5FDFFF2F9FFD56800D37501FFFFFFDB8426FCFFFF
          FDEBE9A96735914806EC9423EED6CDF9FFFFFDFFFFFFFEFEFEFEFEFEFEFEFAF9
          F7FFDAA3A24900EEB664E3CCB6CD8D4A500000FFF9CFE2BA91F4A53CC94E00DC
          9230F2A33DDA9D61CC7008ECAD56FDFFFFFEFDFEFFFFFFFFFFFFFDFFFFF9E3E0
          AC4200F5CC93FFFFFFE79D48F6B75BF8FFFFDCB17FD19248A03F07EE9E36E1DD
          EAFDE1B2D7A06CFFE8B1FAFFFFFEFEFFFFFFFFFFFFFFFFFFFFC26400DF8F1CC1
          9A73F0B867FFFFFFF6FFFFDFC5AFFFBD646C2700E2911FE1EBF0D47206841F00
          F6F2EFAE4B00FFE9BEFEFFFFFEFEFEFFFFFFFEFFFFEEDDC1E3AB5BB3844EB752
          00D1C4C4DB6800C7AD93D78218E7E5DEA14703EC972CE8DDD7FBCF8CD3A682FF
          DD92FCFDFFFEFFFFFEFEFEFEFEFEFEFEFEFCFFFFFFFFFF957144C77400C5720B
          F19D46EC9B34F4EFD6F4DFC6EC7000C2813AEAA03FCFAC91CB8029E49533FDFF
          FFFEFDFEFEFEFEFCFCFCFDFDFDFDFDFDFBFBFCFFFFFFFFFFEBFEF8DAFDFFFFFF
          FFFFFFFFFFFFFFFFFAE088D9982DAC5100D67200FAD392FAFDF6FEFEFFFEFEFE
          FEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFEFFFFFFFFFFFEFEFEFEFEFEFEFE
          FEFEFDFEFFFFFFFBFDFFFBFBF5FFFFFFFEFFFFFFFFFFFEFEFEFEFEFEFFFFFFFE
          FEFE}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaBottom
        OnClick = JvTransparentButton_FerramentasClick
      end
    end
    object Panel_TrataQuestoes: TPanel
      Left = 0
      Top = 110
      Width = 864
      Height = 636
      Align = alLeft
      BevelOuter = bvNone
      Color = 16775148
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object JvGradient_Itens: TJvGradient
        Left = 0
        Top = 0
        Width = 36
        Height = 636
        Align = alLeft
        Style = grVertical
        StartColor = 8355711
        EndColor = 16710631
        Steps = 133
      end
      object Panel_Itens: TPanel
        Left = 36
        Top = 0
        Width = 828
        Height = 636
        Align = alLeft
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Panel_Cabecalho: TPanel
          Left = 0
          Top = 0
          Width = 828
          Height = 51
          Align = alTop
          BevelOuter = bvNone
          Color = 16052155
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Baskerville Old Face'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 0
          object JvGradient_Cabecalho: TJvGradient
            Left = 0
            Top = 0
            Width = 828
            Height = 51
            Align = alClient
            StartColor = 8355711
            EndColor = 16710631
            Steps = 133
          end
          object Label_DistribuicaoQuestoes: TLabel
            Left = 656
            Top = 42
            Width = 223
            Height = 22
            Caption = 'Distribui'#231#227'o das Quest'#245'es'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Panel_Facil: TPanel
            Left = 176
            Top = 28
            Width = 211
            Height = 24
            BevelOuter = bvNone
            BorderStyle = bsSingle
            TabOrder = 0
            object JvGradient_Facil: TJvGradient
              Left = 0
              Top = 0
              Width = 209
              Height = 22
              Align = alClient
              Style = grVertical
              StartColor = clWhite
              EndColor = 5898073
              Steps = 10
            end
            object Label_Facil: TLabel
              Left = 82
              Top = 1
              Width = 34
              Height = 18
              Caption = 'F'#225'cil'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
          end
          object Panel_Medio: TPanel
            Left = 386
            Top = 28
            Width = 212
            Height = 24
            BevelOuter = bvNone
            BorderStyle = bsSingle
            TabOrder = 1
            object JvGradient_Medio: TJvGradient
              Left = 0
              Top = 0
              Width = 210
              Height = 22
              Align = alClient
              Style = grVertical
              StartColor = clWhite
              EndColor = 16761992
              Steps = 10
            end
            object Label_Medio: TLabel
              Left = 82
              Top = 1
              Width = 44
              Height = 18
              Caption = 'M'#233'dio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
          end
          object Panel_Dificel: TPanel
            Left = 597
            Top = 28
            Width = 212
            Height = 24
            BevelOuter = bvNone
            BorderStyle = bsSingle
            TabOrder = 2
            object JvGradient_Dificel: TJvGradient
              Left = 0
              Top = 0
              Width = 210
              Height = 22
              Align = alClient
              Style = grVertical
              StartColor = clWhite
              EndColor = 8235263
              Steps = 10
            end
            object Label_Dificel: TLabel
              Left = 82
              Top = 1
              Width = 44
              Height = 18
              Caption = 'Dificel'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
          end
          object Panel_Disciplina: TPanel
            Left = 0
            Top = 28
            Width = 177
            Height = 24
            BevelOuter = bvNone
            BorderStyle = bsSingle
            TabOrder = 3
            object JvGradient1: TJvGradient
              Left = 0
              Top = 0
              Width = 175
              Height = 22
              Align = alClient
              Style = grVertical
              StartColor = clWhite
              EndColor = 5151900
              Steps = 10
            end
            object Shape4: TShape
              Left = 80
              Top = 0
              Width = 1
              Height = 26
            end
          end
        end
        object DBGrid_Questoes: TDBGrid
          Left = 0
          Top = 51
          Width = 828
          Height = 585
          Align = alClient
          Ctl3D = False
          DataSource = DSC_Facil
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgColLines, dgTabs]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid_QuestoesCellClick
          OnDrawColumnCell = DBGrid_QuestoesDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'Disciplina'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Color = 5151900
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NQuestoes'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Quest'#245'es'
              Title.Color = 5151900
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 94
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Sel_F'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'F'
              Title.Color = 5898073
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 14
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumItem_F'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Id Item'
              Title.Color = 5898073
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Objetivo_F'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Obj'
              Title.Color = 5898073
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Conflito_F'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Conflito'
              Title.Color = 5898073
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sel_M'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'M'
              Title.Color = 16761992
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 14
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumItem_M'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Id Item'
              Title.Color = 16761992
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Objetivo_M'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Obj'
              Title.Color = 16761992
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Conflito_M'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Conflito M'
              Title.Color = 16761992
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sel_D'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'D'
              Title.Color = 8235263
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 14
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumItem_D'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Id Item'
              Title.Color = 8235263
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Objetivo_D'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Obj'
              Title.Color = 8235263
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Conflito_D'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Conflito D'
              Title.Color = 8235263
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 76
              Visible = True
            end>
        end
      end
    end
  end
  object Panel_Informacoes: TPanel
    Left = 881
    Top = 0
    Width = 372
    Height = 746
    Align = alClient
    Color = 16775660
    TabOrder = 1
    object Edit_Escape: TEdit
      Left = -144
      Top = 320
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit_Escape'
    end
    object Panel_InformacoesProva: TPanel
      Left = 1
      Top = 1
      Width = 370
      Height = 744
      Align = alClient
      Color = 16775660
      TabOrder = 1
      object Splitter9: TSplitter
        Left = 1
        Top = 394
        Width = 368
        Height = 4
        Cursor = crVSplit
        Align = alTop
      end
      object Panel_BancoQuestoes: TPanel
        Left = 1
        Top = 1
        Width = 368
        Height = 124
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = 15923199
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label_Questoes_Banco: TLabel
          Left = 12
          Top = 67
          Width = 251
          Height = 20
          Caption = 'Quest'#245'es - F'#225'ceis   M'#233'dias  Dif'#237'ceis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label_TotalItens: TLabel
          Left = 0
          Top = 38
          Width = 97
          Height = 20
          Caption = 'Total de Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label_Banco: TLabel
          Left = 11
          Top = 96
          Width = 60
          Height = 24
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object JvGradientCaption3: TJvGradientCaption
          Left = 0
          Top = 0
          Width = 366
          Height = 27
          GradientStartColor = 16697257
          GradientStyle = grHorizontal
          LabelCaption = 'Itens dispon'#237'veis no banco de quest'#245'es'
          LabelFont.Charset = ANSI_CHARSET
          LabelFont.Color = clBlack
          LabelFont.Height = -16
          LabelFont.Name = 'Arial'
          LabelFont.Style = []
          LabelAlignment = taLeftJustify
          Align = alTop
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          DoubleBuffered = False
          TabOrder = 0
        end
        object MaskEdit_Total_Itens: TMaskEdit
          Left = 112
          Top = 30
          Width = 38
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '30'
          OnKeyPress = MaskEdit_EspecificadasKeyPress
        end
        object MaskEdit_BD_Faceis: TMaskEdit
          Left = 95
          Top = 89
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '30'
          OnKeyPress = MaskEdit_Tot_FaceisKeyPress
        end
        object MaskEdit_BD_Medias: TMaskEdit
          Left = 155
          Top = 89
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '30'
          OnKeyPress = MaskEdit_Tot_MediasKeyPress
        end
        object MaskEdit_BD_Dificeis: TMaskEdit
          Left = 214
          Top = 89
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '30'
          OnKeyPress = MaskEdit_Tot_DificeisKeyPress
        end
      end
      object Panel_EspecificacaoProva: TPanel
        Left = 1
        Top = 125
        Width = 368
        Height = 153
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = 15791359
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Label_Especificadas: TLabel
          Left = 6
          Top = 38
          Width = 99
          Height = 20
          Caption = 'Especificadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label_QuestoesProva: TLabel
          Left = 12
          Top = 67
          Width = 251
          Height = 20
          Caption = 'Quest'#245'es - F'#225'ceis   M'#233'dias  Dif'#237'ceis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label_Total_: TLabel
          Left = 17
          Top = 124
          Width = 47
          Height = 24
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_TotalPor: TLabel
          Left = 17
          Top = 90
          Width = 56
          Height = 24
          Caption = '100 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object JvTransparentButton_MontarProva: TJvTransparentButton
          Left = 230
          Top = 33
          Width = 128
          Height = 24
          Hint = 'Inicia a montagem da prova autom'#225'tica'
          BorderWidth = 0
          Caption = 'Montar Prova   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          FrameStyle = fsDark
          Glyph.Data = {
            9A050000424D9A05000000000000360000002800000014000000170000000100
            1800000000006405000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFCFD2D196AA99A4B6A3BDCBC3D5DDD8D2CFD5C7C2C9C5C1C6C4C3
            C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC7E6CB0070021C89054D891D5F9A396BA35794C791B6E2BABEBEC3C8C7CA
            CFCBD0C9C4CBC6C2C6C3C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECDCE8AC2
            92008D0073A528F9A543CB8D239877077174006174005983144FA24167BF6986
            B082B1C9AFD4D4D7D0C5D0CBC3CCFFFFFFFFFFFFFFFFFFE0DDD9559E61008900
            CBBA6CFFD1A7FFD199FFD58FFFC36EF2AC50E49530B890239D8C1466931B3396
            232E911F3E973E83C17AFFFFFFFFFFFFD4D1D4C4CDC3348F3A279104E1C77FFF
            CEA2FBCA9DFDCD9DFDCE9FFED2A1FFD298F9B565F69C42FFB756F9D06CDEC984
            A7CE7A3A9D35FFFFFFFFFFFFE1D2DCA1B9A7118E15589620FDCE90FFCE96FFCD
            96FECC9AFECB9EFECAA1FCCC90E1B259BF9046F5C18CFCCC94FFDCD5F9F7D46E
            9C55FFFFFFCED0CDCAB9C391B19900900081A43AFFD19EFFCE97FFCC96FFCD97
            FFCD98FDCD9AFECB93EAA44EE0AB70F8DCC1EACB97FDF6C1D0E1AE8CAF72CBCB
            CBC9C8C6C2B9C274AC7C009200BFB66CFED1A4FCCD97FCCE99FCCE97FBCD97FC
            CE9BFDC795CE9F53E3D5AAFFFFFBE6D4B7FFF4D994BE88A5BDA3D5D5D5BEBABC
            BFBCC0419A4E16950AEED09EFBD4ABFFD2A8FFD0A6FFCFA5FFCFA3FFCC9FFFCE
            95EDC07ADDBC8EF0E0CBF4E7CDFDE9C772B066B8C6B8CECECECBCACDC8C8C227
            983E3D9725FFEABAFADAB2F9D7A0F5D196F3C78AF4C581F4C482F1C288F8C682
            F5C182ECBA83EAC18BCAC99980B87CD6DCD4C1C1C1C5C3C6CBD5C317A2337CA9
            59FFF3C9FDE3C0F5E0B9F2DBB2F1D6A8EEC999E9C18DE1B57BDCA76DD49C57DB
            A963FAD198A8BE859EC9A8FFFFFFC3C3C3C7C3C7A6C1A315AE32B0C68FFFECC9
            F9DBB9FCDAB5FAD8B3FDD9B3FEDCB7FDE1B7FCE6ADFCDDB4FBE0A8FFE4ABEDC7
            A58EB67BBBC4C1FFFFFFC3C3C3CBC4CA7BB28A2DB13AD9DDB6FCECD9EFD3C0FA
            D29AF1C68BEABD7FE0B071D6A564E0A25ED9A25CD09955FCE4B6E8D0B290BD8A
            FFFFFFFFFFFFC3C2C3CAC6C96DCE8858B254FAF2D9FEF5D5FCF8D8FBF1E6FEF1
            E2FFF4DFFFF4D7FAF1D2F7E8D1EDDDB4EBCDABF5E6C7C3C193A0B5A0FFFFFFFF
            FFFFC4C2C3C3C1C14CC46875BC72FFFFFAECD8B4EFD19EF1CB9BEFC995EEC48E
            EFC68AF1C889F0CF8AF4D3A0FEEBD1E7DEC5A5BD8BC1CFC5FFFFFFFFFFFFC3C1
            C3CCD3CC2BBC4EA2D09AFFFEFFF9F4E9FBF2E2FDEDCFF7E4C2F3DDB9E9CEA8E1
            C297DBB877CC9F6FF5DFC8D2CEAAA4BF87FFFFFFFFFFFFFFFFFFC4C1C3C6D3C8
            3DB964DAE7C3FFF6F6F7E8BEF6E8CCF0E8D1F6EDD5FBF0D6FDF5DAFCF7E0FCF5
            E0FAF7DCF7EDDBC3CAB0000000FFFFFFFFFFFFFFFFFFC7C2C69CBEA26CBE78F7
            F9EDF7E4D8EBDEA2E7C99CDFC987DAB976D8AB67DAA257D49C4FBB9149C5A56E
            F8E3C6B6BDACB8BDBCFFFFFFFFFFFFFFFFFFCCCACC80C09095CF97F5F8FBFFFC
            FAFFFFF8FFFFFFFFFFFFFFFFFFFFFFFDFFFFF4FFFDECFEF5DAFEF4DBE5D7BDBF
            C2ADFFFFFFFFFFFFFFFFFFFFFFFFC7D1CA8ED39DBAD7ACEBDAD0DACBC567AEB2
            53B3CF76BCD48AC7DC9BCFE0B7DBEBCEE6F4F9F6F5E4E5D0C8CAA6B6BDADFFFF
            FFFFFFFFFFFFFFFFFFFFB2B9B39AD8A994CB9AA1AD8E959D8F50ACAF5ADBEF33
            CDF017BAE205ACD4009FCB0F91B5C5D2B7C4D1ACDBE8C8C7CAC6FFFFFFFFFFFF
            FFFFFFFFFFFFC7CAC8C2D6C6D6D8C7BDE1D35996967FB7C2DBE6ECC6E1E1B4E4
            E59FDFE190D8DD91CFD4C8C3C0C4C5C4C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC2C2C2C3C0C2C1C0C2C8C6C7D6D4D9C6CED2C1C2C1C4BFBEC6BFBFC8C0BF
            C9C1C0C9C2C1C3C2C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TextAlign = ttaRight
          OnClick = JvTransparentButton_MontarProvaClick
        end
        object MaskEdit_Por_Faceis: TMaskEdit
          Left = 95
          Top = 88
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
          Text = '50'
          OnEnter = MaskEdit_Por_FaceisEnter
          OnExit = MaskEdit_Por_FaceisExit
          OnKeyPress = MaskEdit_Por_FaceisKeyPress
        end
        object MaskEdit_Por_Medias: TMaskEdit
          Left = 155
          Top = 88
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 1
          Text = '30'
          OnEnter = MaskEdit_Por_MediasEnter
          OnExit = MaskEdit_Por_MediasExit
          OnKeyPress = MaskEdit_Por_MediasKeyPress
        end
        object MaskEdit_Por_Dificeis: TMaskEdit
          Left = 214
          Top = 88
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 2
          Text = '20'
          OnKeyPress = MaskEdit_Por_DificeisKeyPress
        end
        object MaskEdit_Especificadas: TMaskEdit
          Left = 112
          Top = 30
          Width = 38
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 3
          Text = '30'
          OnKeyPress = MaskEdit_EspecificadasKeyPress
        end
        object MaskEdit_Tot_Faceis: TMaskEdit
          Left = 95
          Top = 120
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 4
          Text = '30'
          OnEnter = MaskEdit_Tot_FaceisEnter
          OnExit = MaskEdit_Tot_FaceisExit
          OnKeyPress = MaskEdit_Tot_FaceisKeyPress
        end
        object MaskEdit_Tot_Medias: TMaskEdit
          Left = 155
          Top = 120
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 5
          Text = '30'
          OnKeyPress = MaskEdit_Tot_MediasKeyPress
        end
        object MaskEdit_Tot_Dificeis: TMaskEdit
          Left = 214
          Top = 120
          Width = 36
          Height = 30
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 6723839
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 6
          Text = '30'
          OnKeyPress = MaskEdit_Tot_DificeisKeyPress
        end
        object JvGradientCaption1: TJvGradientCaption
          Left = 0
          Top = 0
          Width = 366
          Height = 27
          GradientStartColor = 16697257
          GradientStyle = grHorizontal
          LabelCaption = 'Especifica'#231#227'o da prova'
          LabelFont.Charset = ANSI_CHARSET
          LabelFont.Color = clBlack
          LabelFont.Height = -16
          LabelFont.Name = 'Arial'
          LabelFont.Style = []
          LabelAlignment = taLeftJustify
          Align = alTop
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          DoubleBuffered = False
          TabOrder = 7
        end
      end
      object Panel_EstatisticaProva: TPanel
        Left = 1
        Top = 278
        Width = 368
        Height = 116
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = 15265791
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object Label2: TLabel
          Left = 10
          Top = 38
          Width = 96
          Height = 20
          Caption = 'Selecionadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object JvTransparentButton_HomogeneizarProva: TJvTransparentButton
          Left = 230
          Top = 32
          Width = 123
          Height = 24
          Hint = 'Inicia a montagem da prova autom'#225'tica'
          BorderWidth = 0
          Caption = 'Homogeneizar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          FrameStyle = fsDark
          Glyph.Data = {
            AA030000424DAA03000000000000360000002800000011000000110000000100
            1800000000007403000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF6F6F69192924646462929294E4E4EA9AAAAFFFFFFFFFF
            FFFEFEFEFEFEFEFEFEFEFEFEFE00FDFDFDFAFBFBFFFFFFEDE9EA9F999B4A4141
            5A5050504A493E3B3A34353332312F1711108E8B8AFFFFFFFBFCFBF8FAF9FEFE
            FE00FDFDFDFFFFFFF0EEED8883847F797A817879675E5E413B3A423F3E3E3D3C
            6662618B86855A5655605E5DFFFFFFFDFEFDFEFEFE00FBFBFBF1F2F27A777884
            7F804943442F2A291B1716302C2B1713123531302F2A292E2526393332605C5B
            757372FFFFFFFDFDFD00FFFFFF595959726E6F443F403932340905050B08061A
            16160400001711101A1111231A1A170F0F0C0706312D2CA3A09FFFFFFF00C7C8
            C74041412B28282823242D26280B0A08000000201C1B3E36364E444450444448
            3C3D2F2424110708000000191413FFFFFF006F6A6E858385FBF9FAB2B0B0D9D8
            D77A7374656463D4DCDBF0FAF9AAAAA8473C3A322D2A858B88F2F2F1D7D7D60C
            1414C7C8C800868185FFFFFF736F70A8A5A4FFFFFF8F8684F7F0F0D4CFCE7E7A
            77FFF8F7BCB1B08A7E7AFFFFFF817777BCB0B2FFFFFF60616000B3B0B29B9A9B
            000000363331F6F2EE9B9C97FFFFFF452C2B6D5453918784EDE4E1CDC4BE9A97
            934A38373C2427170C0D30303000A2A1A1F5F2F235302D837B77FFFFFF78837C
            FFFFFF988F8B4D3F3CD7D8D2CCCBC5B1ABA2E8ECE349413D7C716FDADEDB5051
            51006F706EC5C3C0FFFFFFFFFFFFA89F9866625BFFFFFFFCFEF6FFFFFFFFF8F2
            6F595467514AEBE7E0FFFFFFFFFFFF737B74AAAAAB00C4C6C60000005A535066
            5751745C5582726BFFFFFF443E3673655E654844895E59885E56634941654E49
            4E3E3C2A2A26FFFFFF00FCFEFF5A5A5A2B2421745E57856058887970FFFFFF6D
            564D795A507D5F538060537F584E6F4F4A584541453C3B6E6A6BFFFFFF00FBFD
            FFCFD0D03B37343C2F29725953735C54745C53795A517D5F53765D4D71584A6E
            504B5F4742C7BAB7251F1DFEFEFCFFFFFF00FCFDFDFFFFFFC2C4C145413D2415
            1558413B71534D76564E6E53496251425F4F44645450D4C9C567625FDEDCDAFF
            FFFFFEFEFF00FBFCFCFAFEFCFFFFFFD1D4D475727323181922141342312E4B3A
            36483D3438322C2C292771706DF7F7F4FFFFFFFAFEFBFFFFFF00FBFBFAF5FCFB
            F4FDFCF7FFFFFDFFFFDDE2E57F80844A45473C3637443E3D7A7C7AD0D5D6FFFF
            FFFCFFFEFBFFFCF9FDF8FFFFFF00}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TextAlign = ttaRight
          OnClick = JvTransparentButton_HomogeneizarProvaClick
        end
        object Label1: TLabel
          Left = 12
          Top = 62
          Width = 251
          Height = 20
          Caption = 'Quest'#245'es - F'#225'ceis   M'#233'dias  Dif'#237'ceis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Panel_Selecionadas: TPanel
          Left = 112
          Top = 30
          Width = 42
          Height = 25
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = '0'
          Color = 6723839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel_TotalQuestoesFaceis: TPanel
          Left = 95
          Top = 82
          Width = 42
          Height = 25
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = '0'
          Color = 6723839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object Panel_TotalQuestoesMedias: TPanel
          Left = 155
          Top = 82
          Width = 42
          Height = 25
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = '0'
          Color = 6723839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object Panel_TotalQuestoesDificeis: TPanel
          Left = 214
          Top = 82
          Width = 42
          Height = 25
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = '0'
          Color = 6723839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object JvGradientCaption2: TJvGradientCaption
          Left = 0
          Top = 0
          Width = 366
          Height = 27
          GradientStartColor = 16697257
          GradientStyle = grHorizontal
          LabelCaption = 'Itens selecionados para prova'
          LabelFont.Charset = ANSI_CHARSET
          LabelFont.Color = clBlack
          LabelFont.Height = -16
          LabelFont.Name = 'Arial'
          LabelFont.Style = []
          LabelAlignment = taLeftJustify
          Align = alTop
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          DoubleBuffered = False
          TabOrder = 4
        end
      end
      object Panel_prova: TPanel
        Left = 1
        Top = 398
        Width = 368
        Height = 345
        Align = alClient
        Color = 16577515
        TabOrder = 3
        object JvGradientCaption8: TJvGradientCaption
          Left = 1
          Top = 1
          Width = 366
          Height = 28
          GradientStartColor = 16697257
          GradientStyle = grHorizontal
          LabelCaption = 'Prova'
          LabelFont.Charset = ANSI_CHARSET
          LabelFont.Color = clBlack
          LabelFont.Height = -16
          LabelFont.Name = 'Arial'
          LabelFont.Style = []
          LabelAlignment = taLeftJustify
          Align = alTop
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          DoubleBuffered = False
          TabOrder = 0
        end
        object DBGrid4: TDBGrid
          Left = 1
          Top = 29
          Width = 360
          Height = 315
          Align = alLeft
          Color = 11064319
          Ctl3D = False
          DataSource = DCDS_Prova
          Options = [dgEditing, dgTitles, dgColLines, dgTabs]
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Nivel'
              Title.Alignment = taCenter
              Title.Caption = 'N'#237'vel'
              Title.Color = 5220351
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -15
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 33
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Materia'
              Title.Alignment = taCenter
              Title.Caption = 'Disciplina'
              Title.Color = 5220351
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -15
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 69
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumItem'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' do Item'
              Title.Color = 5220351
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -15
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 103
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RespostaCorreta'
              Title.Alignment = taCenter
              Title.Caption = 'Resposta Correta'
              Title.Color = 5220351
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -15
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
    end
  end
  object JvCaptionPanel_Ferramentas: TJvCaptionPanel
    Left = 611
    Top = 82
    Width = 366
    Height = 99
    Buttons = []
    BorderStyle = bsNone
    Caption = 'Ferramentas'
    CaptionColor = 16697257
    CaptionPosition = dpTop
    CaptionFont.Charset = ANSI_CHARSET
    CaptionFont.Color = clBlack
    CaptionFont.Height = -16
    CaptionFont.Name = 'Arial'
    CaptionFont.Style = []
    Color = 16775660
    FlatButtons = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    OutlookLook = False
    ParentFont = False
    TabOrder = 2
    object JvTransparentButton_Fecha_FerramentaAuxiliar: TJvTransparentButton
      Left = 336
      Top = 5
      Width = 26
      Height = 16
      Hint = 'Fecha a Janela de Ferramenta Auxiliar.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        7A010000424D7A0100000000000036000000280000000B000000090000000100
        1800000000004401000000000000000000000000000000000000A39082665653
        665653665653A38F82E9D0B8A38F82665653665653665653A38F820000006656
        53D7D7D7D7D7D7D7D7D7665653A28E81665653D7D7D7D7D7D7D7D7D766565300
        0000A18D80665653D7D7D7D7D7D7D7D7D7665653D7D7D7D7D7D7D7D7D7665653
        A18D80000000E3CAB2A08C7F665653D7D7D7D7D7D7D7D7D7D7D7D7D7D7D76656
        53A08C7FE3CAB2000000E2C9B1E2C9B19F8C7F665653D7D7D7D7D7D7D7D7D766
        56539F8C7FE2C9B1E2C9B1000000F1DBC6A69488665653D7D7D7D7D7D7D7D7D7
        D7D7D7D7D7D7665653A69488F1DBC6000000A69488665653D7D7D7D7D7D7D7D7
        D7665653D7D7D7D7D7D7D7D7D7665653A69488000000665653D7D7D7D7D7D7D7
        D7D7665653A69488665653D7D7D7D7D7D7D7D7D7665653000000A69589665653
        665653665653A69589F1DCC7A69589665653665653665653A69589000000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_Fecha_FerramentaAuxiliarClick
    end
    object Panel11: TPanel
      Left = 1
      Top = 25
      Width = 364
      Height = 73
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = 16775660
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object JvTransparentButton_FerramentaAplicarProvaEletronica: TJvTransparentButton
        Left = 4
        Top = 40
        Width = 287
        Height = 24
        Hint = 'Inicia a montagem da Prova Manual'
        BorderWidth = 0
        Caption = 'Montar prova para aplica'#231'ao eletr'#244'nica '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          9A050000424D9A05000000000000360000002800000014000000170000000100
          1800000000006405000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFCFD2D196AA99A4B6A3BDCBC3D5DDD8D2CFD5C7C2C9C5C1C6C4C3
          C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC7E6CB0070021C89054D891D5F9A396BA35794C791B6E2BABEBEC3C8C7CA
          CFCBD0C9C4CBC6C2C6C3C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECDCE8AC2
          92008D0073A528F9A543CB8D239877077174006174005983144FA24167BF6986
          B082B1C9AFD4D4D7D0C5D0CBC3CCFFFFFFFFFFFFFFFFFFE0DDD9559E61008900
          CBBA6CFFD1A7FFD199FFD58FFFC36EF2AC50E49530B890239D8C1466931B3396
          232E911F3E973E83C17AFFFFFFFFFFFFD4D1D4C4CDC3348F3A279104E1C77FFF
          CEA2FBCA9DFDCD9DFDCE9FFED2A1FFD298F9B565F69C42FFB756F9D06CDEC984
          A7CE7A3A9D35FFFFFFFFFFFFE1D2DCA1B9A7118E15589620FDCE90FFCE96FFCD
          96FECC9AFECB9EFECAA1FCCC90E1B259BF9046F5C18CFCCC94FFDCD5F9F7D46E
          9C55FFFFFFCED0CDCAB9C391B19900900081A43AFFD19EFFCE97FFCC96FFCD97
          FFCD98FDCD9AFECB93EAA44EE0AB70F8DCC1EACB97FDF6C1D0E1AE8CAF72CBCB
          CBC9C8C6C2B9C274AC7C009200BFB66CFED1A4FCCD97FCCE99FCCE97FBCD97FC
          CE9BFDC795CE9F53E3D5AAFFFFFBE6D4B7FFF4D994BE88A5BDA3D5D5D5BEBABC
          BFBCC0419A4E16950AEED09EFBD4ABFFD2A8FFD0A6FFCFA5FFCFA3FFCC9FFFCE
          95EDC07ADDBC8EF0E0CBF4E7CDFDE9C772B066B8C6B8CECECECBCACDC8C8C227
          983E3D9725FFEABAFADAB2F9D7A0F5D196F3C78AF4C581F4C482F1C288F8C682
          F5C182ECBA83EAC18BCAC99980B87CD6DCD4C1C1C1C5C3C6CBD5C317A2337CA9
          59FFF3C9FDE3C0F5E0B9F2DBB2F1D6A8EEC999E9C18DE1B57BDCA76DD49C57DB
          A963FAD198A8BE859EC9A8FFFFFFC3C3C3C7C3C7A6C1A315AE32B0C68FFFECC9
          F9DBB9FCDAB5FAD8B3FDD9B3FEDCB7FDE1B7FCE6ADFCDDB4FBE0A8FFE4ABEDC7
          A58EB67BBBC4C1FFFFFFC3C3C3CBC4CA7BB28A2DB13AD9DDB6FCECD9EFD3C0FA
          D29AF1C68BEABD7FE0B071D6A564E0A25ED9A25CD09955FCE4B6E8D0B290BD8A
          FFFFFFFFFFFFC3C2C3CAC6C96DCE8858B254FAF2D9FEF5D5FCF8D8FBF1E6FEF1
          E2FFF4DFFFF4D7FAF1D2F7E8D1EDDDB4EBCDABF5E6C7C3C193A0B5A0FFFFFFFF
          FFFFC4C2C3C3C1C14CC46875BC72FFFFFAECD8B4EFD19EF1CB9BEFC995EEC48E
          EFC68AF1C889F0CF8AF4D3A0FEEBD1E7DEC5A5BD8BC1CFC5FFFFFFFFFFFFC3C1
          C3CCD3CC2BBC4EA2D09AFFFEFFF9F4E9FBF2E2FDEDCFF7E4C2F3DDB9E9CEA8E1
          C297DBB877CC9F6FF5DFC8D2CEAAA4BF87FFFFFFFFFFFFFFFFFFC4C1C3C6D3C8
          3DB964DAE7C3FFF6F6F7E8BEF6E8CCF0E8D1F6EDD5FBF0D6FDF5DAFCF7E0FCF5
          E0FAF7DCF7EDDBC3CAB0000000FFFFFFFFFFFFFFFFFFC7C2C69CBEA26CBE78F7
          F9EDF7E4D8EBDEA2E7C99CDFC987DAB976D8AB67DAA257D49C4FBB9149C5A56E
          F8E3C6B6BDACB8BDBCFFFFFFFFFFFFFFFFFFCCCACC80C09095CF97F5F8FBFFFC
          FAFFFFF8FFFFFFFFFFFFFFFFFFFFFFFDFFFFF4FFFDECFEF5DAFEF4DBE5D7BDBF
          C2ADFFFFFFFFFFFFFFFFFFFFFFFFC7D1CA8ED39DBAD7ACEBDAD0DACBC567AEB2
          53B3CF76BCD48AC7DC9BCFE0B7DBEBCEE6F4F9F6F5E4E5D0C8CAA6B6BDADFFFF
          FFFFFFFFFFFFFFFFFFFFB2B9B39AD8A994CB9AA1AD8E959D8F50ACAF5ADBEF33
          CDF017BAE205ACD4009FCB0F91B5C5D2B7C4D1ACDBE8C8C7CAC6FFFFFFFFFFFF
          FFFFFFFFFFFFC7CAC8C2D6C6D6D8C7BDE1D35996967FB7C2DBE6ECC6E1E1B4E4
          E59FDFE190D8DD91CFD4C8C3C0C4C5C4C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC2C2C2C3C0C2C1C0C2C8C6C7D6D4D9C6CED2C1C2C1C4BFBEC6BFBFC8C0BF
          C9C1C0C9C2C1C3C2C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaRight
        OnClick = JvTransparentButton_FerramentaAplicarProvaEletronicaClick
      end
      object JvTransparentButton_Ferramenta_MontarProvaManual: TJvTransparentButton
        Left = 4
        Top = 6
        Width = 345
        Height = 24
        Hint = 'Permite a montagem da prova para ser impressa'
        BorderWidth = 0
        Caption = 'Montar prova para aplica'#231#227'o impressa em papel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          96060000424D9606000000000000360000002800000016000000180000000100
          1800000000006006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9EEEEEED9D9
          D9C3C3C3B6B6B6EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E8E8E8D3D3D3BABABAAC
          ADADA4A5A5A1A3A4959799CECECEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5CECECEB8B8B8AAAAABA3A4A5
          9FA1A29E9FA0828282766760806453A0A0A1EFF0F0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFEAEAEAC3C3C3B1B1B1A4A4A59FA1A29497988E8C
          8C8A817B8572667B5E4D8D624AA372579B6D5281736AC9CBCCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFE9E9EAABADAE9C9FA1888A8B7F777381
          6C60946F5B9D7057825A443925184834289E7159A3755B896856A1A09FFBFCFC
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFD7D4D38176718066579C7059
          A6775DA5755B89624A432E232D2A2970717201000051392CA7795F9F71578578
          71DBDDDEFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF947B6DA67357AE7C
          62AB7D6287614B533D31423B39747676D0D1D1CECECE8586871C1A18735341B3
          8266856352B0B4B5F6F6F6FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFDDD6D1A6
          765DBB876B563E302F2623484344ADABACFBFAFAFFFFFFE9EAEAB6B5B5757677
          1D1510A77961AE7B61827F7CE2E3E4FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          ECEDED8B7E764839344F494B827C7DE4E2E2FFFFFFFFFFFFFFFFFFFFFFFFFBFA
          FAADA9A9585456402D23B18067977665AAADAEF9F9F9FFFFFFFFFFFF0000FFFF
          FFB1B0B05D57574F48496E6768BBB7B7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFCFCFCA9A5A5342D2D7A5949B4856C8D8681E2E4E4FFFFFFFFFFFF
          0000FFFFFFE3E3E36561618E8989EEEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          EFECECBBB5B5FFFFFFFFFFFFFFFFFF9F9D9E352C29BD886F937769BBBCBDFFFF
          FFFFFFFF0000FAFAFAD9D9D9F8F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFE2DFDF836B6AD8D2D2FFFFFFFFFFFFFFFFFFFFFFFFA5A3A5533B31B8866E95
          918EE8E9EAFFFFFF0000F9F9F9E3E3E3DFDFDFF3F3F3FFFFFFFFFFFFFFFFFFFF
          FFFFE1DEDE725D5E9F9392FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7473
          A1735D927B6FC7C9CBFEFEFE0000FFFFFFFFFFFFFDFDFDE0E0E0DDDDDDFAFAFA
          FFFFFFE8E5E5766160807372FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFECEEEF7B6861B4856E8F8F8EEDEDEE0000FFFFFFFFFFFFFFFFFFFFFFFFFAFA
          FAE0E0E0DDDDDD826E6E7B696AF1F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC0C3C3B98A75A1887DCED1D20000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF5F5F58C7878665050E1DEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA79187BE917CD8D7D60000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF897776715959C7C0BFBEA599F2ECEAFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF2F2F2DADADAA7A5A5757273413D3DA37966BBA59A0000FFFF
          FFFFFFFFFFFFFFFFFFFFBAACA8775D5BC7C1C1FFFFFFCDB8AFC89E8DF6F2F0FF
          FFFFEDEDEDC0C0C0969494625F5F4B46464D44445B5151736A6B9F8A80D2BBB1
          0000FFFFFFFFFFFFFFFFFFB2A4A47A5D5AAD9C9BFFFFFFFFFFFFF3F3F4D1A896
          9C837A7372744C47474F4747564D4D615757685D5D8D8383B1A6A6CECBCDFBFB
          FBFEFFFF0000FFFFFFFFFFFFBBAEAE755957958484E9E9E8FFFFFFFFFFFFFFFF
          FFDBD1CEB28D7E8C807D857C7C8A80809B8F8FBEB6B6ECE2E2FFF6F68F8586A2
          9EA1FFFFFFFFFFFF0000FFFFFFCFC9C8806260907D7DE0DDDDFFFFFFFFFFFFFF
          FFFFFFFFFFFBFCFDE1D2CBD3CCC8CBCACBD6D5D5D9D0D0E8DCDCC4B7B7A49494
          706262666163FFFFFFFFFFFF0000E6E0DF87686486706FEFEEEEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDBDB968787A094
          94ADA3A3AFA6A6A8A4A4FFFFFFFFFFFF0000F5F1EFBFAEAAEEEAEAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7
          C3C2D1CDCDE7E6E6F8F8F8FFFFFFFFFFFFFFFFFF0000D3DADDD4DBDFD5DCDFD2
          D8DBD2D8DBD2D8DBD2D8DBD2D8DBD2D8DBD2D8DBD2D8DBD2D8DBD2D8DBD2D8DB
          D3D9DCD1D8DCD4DBDED6DCE0D4DADED2D9DCD2D8DBD2D8DB0000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaRight
        OnClick = JvTransparentButton_Ferramenta_MontarProvaManualClick
      end
      object Bevel2: TBevel
        Left = -1
        Top = 35
        Width = 401
        Height = 2
      end
    end
  end
  object DSC_Facil: TDataSource
    DataSet = ClientDataSet_Facil
    Left = 664
    Top = 336
  end
  object IBQuery_Abrangencia: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select distinct t.IdCurso, t.IdTurma, t.Materia as CodMateria'
      '                 From TesteAbrangencia t'
      '                 Where  t.idCurso = 26'
      '                 and   t.IdTurma = 30'
      '                 and   t.FaseAplicacao = '#39'1'#39
      '                 and   t.ReferenciaAvaliacao = '#39'13T'#39
      '                 Order By t.CodMateria')
    Left = 80
    Top = 353
    object IBQuery_AbrangenciaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ITEMPROVA_VIEW.IDCURSO'
    end
    object IBQuery_AbrangenciaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ITEMPROVA_VIEW.IDTURMA'
    end
    object IBQuery_AbrangenciaCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'ITEMPROVA_VIEW.CODMATERIA'
      Size = 7
    end
  end
  object DSQ_Abrangencia: TDataSource
    DataSet = IBQuery_Abrangencia
    Left = 124
    Top = 351
  end
  object DSQ_IP_Item: TDataSource
    DataSet = Query_IP_Item
    Left = 126
    Top = 386
  end
  object Query_IP_Item: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DSQ_Abrangencia
    SQL.Strings = (
      
        'Select NumItem, IdCurso, IdTurma, CodMateria, Disciplina, Unidad' +
        'e, SubUnidade, Objetivo, Serie, TempoRes, RespostaCorreta,  Desc' +
        'EnAlt, Status, Recurso,   Padrao_Prova'
      'From ITEMPROVA_VIEW'
      'Where IdCurso   =:IdCurso'
      'and      IdTurma = :IdTurma'
      'and      CodMateria  =:CodMateria  '
      'and     Status = '#39'D'#39
      
        'and      numitem not in (select numitem from itemteste where idc' +
        'urso = :IdCurso and idturma = :IdTurma)'
      'Order By Disciplina, Unidade, SubUnidade, Objetivo, Serie asc')
    Left = 80
    Top = 394
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
        Size = 8
      end
      item
        DataType = ftSmallint
        Name = 'IdCurso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdTurma'
        ParamType = ptUnknown
      end>
    object Query_IP_ItemNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'ITEM.NUMITEM'
      Required = True
    end
    object Query_IP_ItemIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ITEM.IDCURSO'
      Required = True
    end
    object Query_IP_ItemIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ITEMPROVA_VIEW.IDTURMA'
    end
    object Query_IP_ItemCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'ITEM.CODMATERIA'
      Required = True
      Size = 7
    end
    object Query_IP_ItemDISCIPLINA: TIBStringField
      FieldName = 'DISCIPLINA'
      Origin = 'ITEM.DISCIPLINA'
      Required = True
      Size = 2
    end
    object Query_IP_ItemUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'ITEM.UNIDADE'
      Required = True
      Size = 2
    end
    object Query_IP_ItemSUBUNIDADE: TIBStringField
      FieldName = 'SUBUNIDADE'
      Origin = 'ITEM.SUBUNIDADE'
      Required = True
      Size = 2
    end
    object Query_IP_ItemOBJETIVO: TIBStringField
      FieldName = 'OBJETIVO'
      Origin = 'ITEM.OBJETIVO'
      Required = True
      Size = 1
    end
    object Query_IP_ItemSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ITEM.SERIE'
      Required = True
      Size = 2
    end
    object Query_IP_ItemTEMPORES: TIBStringField
      FieldName = 'TEMPORES'
      Origin = 'ITEM.TEMPORES'
      Required = True
      Size = 4
    end
    object Query_IP_ItemRESPOSTACORRETA: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Origin = 'ITEM.RESPOSTACORRETA'
      Required = True
      Size = 1
    end
    object Query_IP_ItemDESCENALT: TBlobField
      FieldName = 'DESCENALT'
      Origin = 'ITEM.DESCENALT'
      Size = 8
    end
    object Query_IP_ItemRECURSO: TIBStringField
      FieldName = 'RECURSO'
      Origin = 'ITEM.RECURSO'
      FixedChar = True
      Size = 1
    end
    object Query_IP_ItemSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ITEMPROVA_VIEW.STATUS'
      FixedChar = True
      Size = 1
    end
    object Query_IP_ItemPADRAO_PROVA: TIBStringField
      FieldName = 'PADRAO_PROVA'
      Origin = 'ITEMPROVA_VIEW.PADRAO_PROVA'
      Size = 16
    end
  end
  object ClientDataSet_Facil: TClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 665
    Top = 305
    Data = {
      1E0200009619E0BD0100000018000000130000000000030000001E020A446973
      6369706C696E610100490000000100055749445448020002000A00074D617465
      7269610100490000000100055749445448020002000A0003436F720100490000
      000100055749445448020002000100094E51756573746F657304000100000000
      000553656C5F460100490000000100055749445448020002000100094E756D49
      74656D5F460100490000000100055749445448020002000F000A436F6E666C69
      746F5F460100490000000100055749445448020002000F000A4F626A65746976
      6F5F4601004900000001000557494454480200020001000A4E756D5175657374
      616F04000100000000000553656C5F4D01004900000001000557494454480200
      02000100094E756D4974656D5F4D010049000000010005574944544802000200
      0F000A436F6E666C69746F5F4D0100490000000100055749445448020002000F
      000A4F626A657469766F5F4D0100490000000100055749445448020002000100
      0C4E756D5175657374616F5F4D04000100000000000553656C5F440100490000
      000100055749445448020002000100094E756D4974656D5F4401004900000001
      00055749445448020002000F000A436F6E666C69746F5F440100490000000100
      055749445448020002000F000A4F626A657469766F5F44010049000000010005
      57494454480200020001000C4E756D5175657374616F5F440400010000000000
      0000}
    object ClientDataSet_FacilDisciplina: TStringField
      DisplayWidth = 12
      FieldName = 'Disciplina'
      Size = 10
    end
    object ClientDataSet_FacilMateria: TStringField
      DisplayWidth = 12
      FieldName = 'Materia'
      Size = 10
    end
    object ClientDataSet_FacilCor: TStringField
      DisplayWidth = 3
      FieldName = 'Cor'
      Size = 1
    end
    object ClientDataSet_FacilNQuestoes: TIntegerField
      DisplayWidth = 12
      FieldName = 'NQuestoes'
    end
    object ClientDataSet_FacilSel_F: TStringField
      DisplayWidth = 6
      FieldName = 'Sel_F'
      Size = 1
    end
    object ClientDataSet_FacilNumItem_F: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem_F'
      Size = 15
    end
    object ClientDataSet_FacilConflito_F: TStringField
      DisplayWidth = 10
      FieldName = 'Conflito_F'
      Size = 15
    end
    object ClientDataSet_FacilObjetivo_F: TStringField
      DisplayWidth = 10
      FieldName = 'Objetivo_F'
      Size = 1
    end
    object ClientDataSet_FacilNumQuestao: TIntegerField
      DisplayWidth = 13
      FieldName = 'NumQuestao'
    end
    object ClientDataSet_FacilSel_M: TStringField
      DisplayWidth = 6
      FieldName = 'Sel_M'
      Size = 1
    end
    object ClientDataSet_FacilNumItem_M: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem_M'
      Size = 15
    end
    object ClientDataSet_FacilConflito_M: TStringField
      DisplayWidth = 18
      FieldName = 'Conflito_M'
      Size = 15
    end
    object ClientDataSet_FacilObjetivo_M: TStringField
      DisplayWidth = 11
      FieldName = 'Objetivo_M'
      Size = 1
    end
    object ClientDataSet_FacilNumQuestao_M: TIntegerField
      DisplayWidth = 16
      FieldName = 'NumQuestao_M'
    end
    object ClientDataSet_FacilSel_D: TStringField
      DisplayWidth = 6
      FieldName = 'Sel_D'
      Size = 1
    end
    object ClientDataSet_FacilNumItem_D: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem_D'
      Size = 15
    end
    object ClientDataSet_FacilConflito_D: TStringField
      DisplayWidth = 18
      FieldName = 'Conflito_D'
      Size = 15
    end
    object ClientDataSet_FacilObjetivo_D: TStringField
      DisplayWidth = 11
      FieldName = 'Objetivo_D'
      Size = 1
    end
    object ClientDataSet_FacilNumQuestao_D: TIntegerField
      DisplayWidth = 15
      FieldName = 'NumQuestao_D'
    end
    object ClientDataSet_FacilPosiciona_Cont: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Posiciona_Cont'
      Size = 10
      Calculated = True
    end
  end
  object ClientDataSet_Prova: TClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 720
    Top = 310
    Data = {
      900000009619E0BD0100000018000000040000000000030000009000054E6976
      656C0100490000000100055749445448020002000100074D6174657269610100
      490000000100055749445448020002000600074E756D4974656D010049000000
      0100055749445448020002000F000F526573706F737461436F72726574610100
      4900000001000557494454480200020001000000}
    object ClientDataSet_ProvaNivel: TStringField
      DisplayWidth = 6
      FieldName = 'Nivel'
      Size = 1
    end
    object ClientDataSet_ProvaMateria: TStringField
      DisplayWidth = 9
      FieldName = 'Materia'
      Size = 6
    end
    object ClientDataSet_ProvaNumItem: TStringField
      DisplayWidth = 18
      FieldName = 'NumItem'
      Size = 15
    end
    object ClientDataSet_ProvaRespostaCorreta: TStringField
      DisplayWidth = 16
      FieldName = 'RespostaCorreta'
      Size = 1
    end
  end
  object DCDS_Prova: TDataSource
    DataSet = ClientDataSet_Prova
    Left = 720
    Top = 342
  end
end
