object Form_Prova: TForm_Prova
  Left = 63
  Top = 132
  Width = 2301
  Height = 984
  BorderIcons = []
  Caption = 'Modulo de Aplica'#231#227'o de Prova'
  Color = 15722132
  Ctl3D = False
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_EditorProva: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 943
    Align = alLeft
    AutoSize = True
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 0
    object Documento: TJvDBRichEdit
      Left = 47
      Top = 0
      Width = 22
      Height = 941
      DataField = 'DESCRICAO'
      DataSource = DSQ_Documentacao
      Align = alLeft
      BorderStyle = bsNone
      TabOrder = 0
      Visible = False
    end
    object Panel_Prova: TPanel
      Left = 69
      Top = 0
      Width = 894
      Height = 941
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 1
      object Editor_Prova: TPsyRichEdit
        Left = 0
        Top = 110
        Width = 892
        Height = 829
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = []
        HideScrollBars = False
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        WantTabs = True
        OnKeyDown = Editor_ProvaKeyDown
        OnKeyPress = Editor_ProvaKeyPress
      end
      object Panel_Botoes_CabecalhoProva: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 110
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = 15722132
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Panel_TratarBotao_FecharPrograma: TPanel
          Left = 0
          Top = 0
          Width = 135
          Height = 108
          Align = alLeft
          BevelOuter = bvNone
          Color = 15722132
          TabOrder = 0
          object JvShape_FecharPrograma: TJvShape
            Left = 1
            Top = 32
            Width = 130
            Height = 48
            Brush.Color = 16378331
            Pen.Color = 33023
          end
          object JvTransparentButton_FecharPrograma_: TJvTransparentButton
            Left = 3
            Top = 33
            Width = 128
            Height = 48
            Hint = 
              'Somente em caso de necessitar fechar a m'#225'quina. "Informar o inst' +
              'rutor antes de sair da m'#225'quina"'
            BorderWidth = 0
            Caption = 'Fechar Programa'
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
            OnClick = JvTransparentButton_FecharPrograma_Click
          end
          object Label3: TLabel
            Left = 4
            Top = 88
            Width = 44
            Height = 16
            Caption = 'Fonte:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Memo_MsgFecharPrograma: TMemo
            Left = 0
            Top = -2
            Width = 136
            Height = 33
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 15722132
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              'Caso  necesssite '
              'mudar de computador')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object ComboBox_Fonte: TComboBox
            Left = 53
            Top = 85
            Width = 46
            Height = 21
            BevelInner = bvSpace
            BevelKind = bkFlat
            ItemHeight = 13
            MaxLength = 2
            TabOrder = 1
            Text = '11'
            OnChange = ComboBox_FonteChange
            Items.Strings = (
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18')
          end
        end
        object Panel3: TPanel
          Left = 135
          Top = 0
          Width = 809
          Height = 108
          Align = alLeft
          BevelOuter = bvNone
          Color = 15722132
          TabOrder = 1
          object Shape7: TShape
            Left = 84
            Top = 2
            Width = 668
            Height = 103
          end
          object Shape8: TShape
            Left = 85
            Top = 32
            Width = 664
            Height = 1
          end
          object Label_Prova: TLabel
            Left = 446
            Top = 33
            Width = 93
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'PROVA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_DataProva: TLabel
            Left = 574
            Top = 33
            Width = 152
            Height = 24
            Alignment = taCenter
            AutoSize = False
            Caption = 'DATA DA PROVA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Shape9: TShape
            Left = 558
            Top = 33
            Width = 1
            Height = 45
          end
          object Label_Aluno: TLabel
            Left = 98
            Top = 80
            Width = 58
            Height = 22
            Caption = 'Aluno: '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_Curso_: TLabel
            Left = 87
            Top = 33
            Width = 169
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'CURSO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_Turma_: TLabel
            Left = 267
            Top = 33
            Width = 144
            Height = 24
            Alignment = taCenter
            AutoSize = False
            Caption = 'TURMA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Shape10: TShape
            Left = 427
            Top = 33
            Width = 1
            Height = 46
          end
          object Shape11: TShape
            Left = 256
            Top = 33
            Width = 1
            Height = 45
          end
          object Shape12: TShape
            Left = 86
            Top = 77
            Width = 664
            Height = 1
          end
          object Image_Brasao: TImage
            Left = 6
            Top = 14
            Width = 69
            Height = 74
            Picture.Data = {
              0A544A504547496D616765B4140000FFD8FFE000104A46494600010101006000
              600000FFDB004300020101020101020202020202020203050303030303060404
              0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
              0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108004B004403012200021101031101
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
              E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FAD2
              F3F6E4F107C3FF00DA17E06FC1BD274FF05590F1E7C3CB4D561BDBDD256677BF
              5B30CB080303F79E5903DCD37E347EDABF1CBE01789A5B2F117877E0C2DB1D3F
              54D4ADAF2CE33309D74FB74B8994A101907972210E72B86073835F047FC165FC
              58BE14F8CFF01AEE0D4FFB3352D3FE18E8B776B3C73F953DB4C9B1A391082086
              5650411DC7A66B6BF652FF0082B947E3B6D4F4BF8F57FE16F1DC7A5685A83E97
              A95FE83A74D793B1B76478A762638E4DD1058955501911551CB0515F6BE17F86
              D4F19C0D95E7D0C2C2BF3D37ED14AEE6E5ED269493BF5564D791ED6361253728
              6C7DF3E37FDAA3E34FC1DFD9C7C53F127C77A47C1FD0EC7C3B629729656769F6
              D9AE669042D1C058607CE274395C8C9F6AF3FF0016FF00C14CFE2B7873F637F8
              5FF192DFC2DF0EB55B3F8AFADAE83A4E8B6FA437DB96E5DA458C124ED259A2C7
              1D370F4AFCB9FDA67FE0A2FE3DFDAEA282C7C5FE34B16F0D595C0B8B3D0F4F82
              0B3D3E19467F7EC8B9796639259A4918671B428550BF51F88BF6D5F87FF0F3FE
              093DFB214565E2BF0DEB3E2BF865F116D7C45AA787E0BF8DAFADE1B792EA43BE
              3CE57208193DDC57E972F0830782A1879E33054E756A5469C60A568C3924D46F
              7EB24AEFE5739E519C609BDD9FA2FF0010BE297C5AF027853C476B0EAFF01755
              F89FE10F0F8F136AFE0782D825F5BD9905B7066603385382C02B1C0E03035C8F
              84FF006DED57FE196FE1B7C54F1B7C41F80BF0D745F89F6C6E349835DD1E48DE
              475277C608386655009C63B57C99FB6D7837F63CFDA43E28FC50FDA1BC49FB40
              E9BAA68DE2EF0EC571A2F84748B958F5D87574851156447DC1E3CA01E5B28009
              24B7CA0D7B07ECB5FB71F86B4BFF00826CFC00F0D784BF691F815F0D3C59E1BD
              2997C4167E2DD397597C976DB1A2096330B2924939E411D057C7E238072EFECF
              A7569612F52538A9DE94A3C9783728A7695D2924AFCBF37739E5565CAACCB9FB
              2AFF00C14FBE217ED85FB605F7C28F06E97F0BEFA0B192FA4FF84922D28C9A74
              F6B6ED817498C12927CA57A7DE1E958FF1D7FE0ADBF11FF672FDB66F3E0C788F
              C23E019EF74BD76C74C96F60D2B6C7756D74B14D1CF1727868E75E3F8595C1E7
              35E23FB08FC7CF81BFB2D681FB5678D3E247C52D375BD5FC4FAC5CF85F4E7F07
              5C456BAB6AF6B24A65B8BFD3E26CF951C8F3A6CE48510B0EDCD3FF00829A7C79
              F837FB527ED07FB2CFC59F869E30D2B51BCD620D37C3FAEE9373751FF6C69FE4
              5C2CB68D768A70241E6DCC6E477D9DB15EC63F813238E3B11463975B0EA8CD29
              72492F6AA9F3F35FCF55B257F33AE9CD3AA93D9FE67D17FB5FFC79F14F82FF00
              6A0F1A697A26A72E93A6DA5DC222B7B302189736B0331DAA3192C4927BE68AE3
              7F6DF72BFB5DF8F792337B6FFF00A476F457F06E412955CB6855A8DB6E116FD6
              C8F62A24A6D58EE3E3A7C70F167C37D37E1969DA1EAD1D95949E01D227688D8D
              B4FF0039B68816DD2C6EDD3B640F6AE13FE1AB3E22364B7882D4007AFF0063D8
              91FF00A271EFD38AD0FDAAB26E7E17927207C3BD1F3FF80D1D7995BDCE91A6C5
              36A3E20D4A2D1FC3FA76D92F6F1A554DA188548919B0BE648C42AE78E727806B
              FBA7C0AE00E15C5787996E3B1F9750A93941B94A54A12937CF2DDB4DB6CFE21F
              1033EE22A9C6389CB72EC55557A8A318C6724B54AD657B2477973FB5978F349D
              0EEB55D47C5DA568FA35910971A8DFE9B610DBC4C7909B8C3F34879F9141638E
              954FE03FEDE37DFB40FC58B0F0CE85E27F10DDC5A8A4BE46B11F836CA3D3EEA4
              8D7798626680BBB9505BEEF404D785F8FED5BE2DEA365A178FF45F0CF85B5BF0
              C99B52F0EDCCB6AF71A0B5919497D42579F99A2B7B7F2E05B05532CD72C2594B
              1735E77E12F0F78DFC25F1BEDFC61AAEB1ABDFD9F8375B68ECB4ED6F4596F6F2
              6630C8638A7D3A26105B3B40CCE2369060282170A33F7B5FC3EE13A942AF2E59
              8784D26E29D2A7ABE9EF72B4EEF7DADB35A1FBE709787F8A8D082CCF30AD56B4
              ADFF002F2A72C6FD14549395BD55FC8FB87F6A6FDA4FC4FF00B2D69FA3DD6A5A
              D789F509F589E4896DAC3C2566F7291C71F98F31492D6326350CB92A72323A8A
              E3BE1EFEDCBAE7C64B396E3C21E3AD2BC40F6D1EFB8B31A158C1A85B28FBC5ED
              DA1DC547728580EF5F3BFEDDBF1D5FF68EF891E1ED5AD757D67E1BDEE956EF6D
              A68F125B5D457576C76799E66A6AEFB94360223A2AC6842E70335E357BAFDEC5
              E37B4D3FC79249E12F19DA949F48F1AD99F2AE6DC93FBA92EA487E5BAB6661C5
              CAFEF506496750541C39E17F0E57CB6956C665587555DEF1F674E56B36BA455D
              5AD7B3BF933D7CFBC3C75284A8E1B1F5A1516D28CEA25F384A72DBAEA7E8045F
              B567C4090074F10DA9CF42346B0008EC7884718F4ABDE1AFDA87C7F71E2DD223
              935FB729717D04726347B14628D22823222C8E33F9FAF35E0DF06FE2DDF7C5AD
              335AB1F11D95B68FF117C1B2883C47690AAA43A929202EA1104C221624095107
              964B24A9849362F79E14603C69A110412752B6E7B9FDEAD75671E19F07BCAB13
              28E55878CA34E7FF002EA1A3517669F2FCD33F94B34CC38B325CF2396E3B1956
              EA51FF009792B4936B55AEA9F63AFF00DB6CFF00C65BF8F32327ED96FDFF00E9
              CADE8A4FDB654B7ED6BE3B3DCDDDBE7FF00ADE8AFF00333875B595E1D2FE48FE
              48FEF79D4F79DE3734FF006ABC8B9F85E0820FFC2BBD1F8231FF002ED1D7CD9F
              B41F8974FD3EEBC1FA46A50BCFA4C76DA8F8B3518D71B585BE2D6D7770C31E67
              9A4020FCC78F6FB73C55F042CFE2F78CBC1FA3EA13EA56D7DA67C2CB192CE1B3
              F2F7DCDE4302A9B7C3F24EF52A40E460F4AF8D7C59F19FC61F043E35F8475AF0
              85FDB595CF883C0FAAE90E9736497705E4D6B7735DAC1246F8CE44CA48E0E47B
              57FA03E03632389F0E72EC261DDE71A6EEAFCAB59D4D9AF46AFD19FCDB90E5DE
              C7C53C4636BC534B9DC13EEA315E7DF43CAFF659F1A78FF50F0C789FC45AB69D
              2EB3E03D26F62D4FCCF1238B4D2ECB5179F226B6D52E7E5B5BB8C12EA22F35E4
              2141898138D097C653FC7DF11DFEA537843C67E25F845F0E6CEF3559345D0B51
              1A7DF6B2F29F2AEF5ABABE2419257B8D8269516571B951102E76FA27C36FF82B
              B78B3E2E7C2AF16683F137C0BE10F1CE8D69A5895D6C165B2BFB6819846F716D
              03BC968CF017590078C1C64EEC03517EC6FAEF81FE187812EFC75E19F86FE3CF
              DA1FC41F0FA097C3FA0E929A33C563A4C1753BDF7F68EA9046CEE64F3256857C
              B578CF91B832B1057F4ACCEA6368D3AF89AD8450AA9A8C6D2BC2CD5AEE49C796
              4FAC9D9A4FAD8FE8084A2AB5EAA693FE5DFBDD7FC3A3CFBE2E7ECF7A87ED01E1
              4BDF17F847F67AF8C3F0AEC749B49F58D42EB5592EF55D1EEED5215C0866B98A
              0789C85CAAAA3AC84F2C38AC9BCFD8D3C6FADFECADA4F8974AD5BC0BE30F006A
              13ADC7876FC6B30DA6A36539263BBB36B7B978CDBAAB00650E4C4A42B2B1DDCF
              BD7ED01FB74FED2BFB67FC39F0DDB7C55F877A9F85BC05F0EB5D4F156BBACC7A
              14FA4DACC2D65135B4065B82AAAE1879215198BF980ECDCB5E55E09F8FBF0875
              1F8331D95F7C3DF12EBB7FE05B3FB4CFADB6B2DA55A5C9BCBF69A7896DA21BF9
              2FB21567DCC50BB6D5056B5C06639DAC153A9878424E33565092AB15169D9BA8
              E576DBB75D9FC2CAA727ED12ACDDAFADACDFE8775FB3F4BE0CF82BE09B4B9F15
              7F60F8C3C636D15B78564F13E93792C96960EF2F9769A3433E025FDDAC33C8D7
              2E81A18ADE0B45DC5C06AEFBC356ADA6F8F748B67E5EDF568623E84ACE06467B
              7D6BC1BE27FC5FF0F7ED15E07F821A57857C2FA97869749F184FA4DADB5D6A4F
              7E64537D25FCB22C927CEF205BB81659090AEC515555635AFB0BC13F08ED3C4D
              E05D43C70CDAB99ED7C5AB6565E4425ED24DB2C4C03100E371918125976ED52A
              1F26B8F30C44B059362AB63AF19D58CD38B77E57669256D12B2E9B7ADDBFE73F
              1A328588CDB2FAB415E7795EFA3E58CA36BFDECC3FDB5BE6FDAD3C7782C31796
              FF00FA456F4558FDAF74AB8F12FED61F10A5D3A337115B6A50DBC857042C8B65
              6DB973DC8CD15FE5EF0EC1FF0065E1F47F047F247F4E4A4AE7D03FB58457BF04
              FE34D86B714973651683AEDD69976B6F34902FD8AFA53756B9F2C83E5AC842E0
              71F295008E0FC93FB777C04BF6F13EB3A6F84EDDA0D77C3BABB78B3C1C925B94
              1312375CE9C011F3ED6DF0909F2B1842F5381FA8BFF0508F80B6FE3FF03CFAE1
              B196FAD05A369FAEC3082F2B5913B84E83BC90BFCE30338DDDB35F0CE99A4DDF
              C42D36C3E18789AF4378AECA6FED0D07C4124AC60D42D488C45711C9BCB4B2BA
              80ACADB997E4DA6358829FEBAF04388E9E535AA70E621D9D272953ED2A33939E
              8BABA7372524B5E595D6C7F3F71FE071781CCA97116016B74FCB992E5945F653
              8DACFBA3F2D7C46EFE11D4ADFE24F828345E1DBA9D8CB0CA9F683A04EEBFBED3
              6F54F58981758DD8012C7C6438603F513FE0947FF04E2F16FC2AF01DDFC5EB19
              E6F855E20F1E5BA2E99A6B6890EA97BA3E96C159879B71830ACD215711E0BAA7
              9618926B9AF86BFB25FC2DF0DFED5F75E30F8C520D07C43A14C926A9A1C1216D
              3BC6B720F9D05D5E471A94DCAC048E010B3B61CA2BEE67FB7B5EFDB97E18E8F6
              A6FAE3537D4E596259524B6B3BABA8E63B198AB18C36D2CE53861F2AC6A3AE2B
              F5BF12389B1D8DC2ACB30145CE325EFCACE4A4B750BED256D6FA3B3B68EE7DF6
              57C6580CCF0F09C26A127BC64D4651E8D34DF47D4F0CFDAABF60BF197EDA3FB1
              C5DF86F46F8856BE3082CA58F55F0E5BEA3E18B5B7413C72B0748278D83C32B2
              F9A809F97270DC723F1F757D0B54F17F8866F873A1E8979E12D3FC31772CBACC
              3AD1315CDADC447CB9AF3546000431F2123C6D5076A6E67C9FDC6F827FB5FF00
              C2BF09F83AD7C3C9A8DE5F1B2DDE54F26897D0C720693CD21F746A0282CE8D9C
              6430C57817FC1477E0A7C0CFDB03C4106B969E2DD46DBC4F0CB145ABE91A4CEE
              ABE398E2045AC33C8148373196D826019B6E40C36D65F23C2DCEB1791C6394D7
              C23850FB16859537A2D968D7AECF5D8EFC5F1260303CD3C4565D6DAA6DFA2EAC
              F883F658F0841AEF8961F1D6996F751F83BC076B37873C182E10F9BAC5F312D7
              57FB3A972F3177C67697822C931E07E88787468BE19F0B7C2CF0BC57F692E89E
              1DB093C7FACB47B65D96E1A472F24E061C4B7630AB852BE46181282B8CF877F0
              B2D3E03DAE8DE22F172E9BA1EAB1C11D97853C23A6DBCAD73690EE28122B7475
              640A7CC5F9DF723BB48CC5F24EB7C3CF833AB7ED2DF16F52F85D68F6EFA97896
              FA3F107C57D62CA265B5D26D81260D2A26CB6259154EEDCCECC5A57624B66BE6
              FC75E3883CBFFB1F012E6C457BC21677B269A94DF9538B93E6FB537CAB4773F2
              EE1FA58AE26E2079BE2E0E14295AC9EF18A7749FF7A724AEBA23E92FF826B7EC
              C9A2FC4EFD9EAEFC77E39F0FDBEA3AC7C44D76F3C4709BB077436B3145810608
              F94A461F9EF21ED8A2BEC1D0B45B3F0EE8967A7D95BC76D65610A5BDBC5180A9
              1468A155401D00000A2BF18C064585C2E1A9E1A11BA82496DD158FD82AE32A4A
              6E57DDF765A200C9C62BE1EFDB4FFE09CF79A8A5C6B1E09B09F59D165BA6D45B
              C3D04DF66BCD12E58EF6BAD326C8F28B3E58C5F777138E0ED1F72E071C74A080
              01C015BE3F2DA78AE5949B8CE0EF1945DA517DD35B7EBD4C5A8B83A738A9465A
              34D5D35E67E33681F13EFBC07737FE17F18688BE3CB34BCB8B8B9D3F54C59EB6
              B3C928691A782E098259B2A545D4404C80908E0702536BF056FEE2F4B5CFC4AF
              87B2062D6A6E50DDA21CA6D8DF747D7FD61CF9BD15327731AFD57F8CBFB35780
              BF684D34DA78D3C29A3F88238F2237B98713439EE92AE1D0FBAB035F951FF051
              EF80FE1CFD9B3E2E5E689E095D7343D2A2B58675B75D7AFE750ED18663996663
              C93D338AF6287897C4B924796AD48D58E9ADDC24FD6D7837E7CB767C4E37C2CC
              9B309DE9AE5B6B669497C9E924BCAE666A5A3FC3B1697D71078C3C4FE294805A
              496F616F005B8973362EE12763A9748C1D8CB8562D9E83075757F8AFE1CF8405
              2E3C1DE1CD2BC2E1125B7B9D67C5375201790C88449B3F79F68621BCB31858E2
              78FCB3F3B6FC8F96FC19E23D5B59D4668AE35BD79E3F225385D4EE1070848FBA
              E38C81C77AFDB0F809FF0004D8F81DF0966B7D6F48F87BA54FAD0092ADFEAD71
              71AC5D2314539592EE495979E400401DAB7ADE2D712E6F0F6141C69A4B56DCA4
              F6B7C3EEC5F7D53D598613C22C9B03355AADE6DF95B6ECDDDAF933E1DF80BF00
              3E2DFED6DAF9D73C3E9AB69D26A4AB05DFC4BF145A8B79E1B50AA3C9D2AC401E
              5A94C00E4727966639C7E8DFECA9FB2DF863F63FF83B67E0EF0BADCCD024D2DE
              5F6A178564BFD5EEE56DD25CDCC800F3243C2827A22228F95401E95028542A00
              0A8700018007A53F03D057CE6132C54EBCB195E6EA569DB9A72776D2D92E8A2B
              A25648FBBA34E9D1A4A861E2A105D17E6FBBF363114E300E31453E8AF4DC10D3
              67FFD9}
            Stretch = True
          end
          object Label_Curso: TLabel
            Left = 87
            Top = 54
            Width = 169
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Curso  '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_Turma: TLabel
            Left = 259
            Top = 54
            Width = 165
            Height = 21
            Alignment = taCenter
            AutoSize = False
            Caption = 'Turma '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_Referencia_Prova: TLabel
            Left = 446
            Top = 54
            Width = 93
            Height = 23
            Alignment = taCenter
            AutoSize = False
            Caption = 'Referencia_Prova'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_Data_Prova: TLabel
            Left = 574
            Top = 54
            Width = 152
            Height = 24
            Alignment = taCenter
            AutoSize = False
            Caption = 'Data_Prova'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_Instituto: TLabel
            Left = 139
            Top = 7
            Width = 437
            Height = 22
            Caption = 'INSTITUTO DE CONTROLE DO ESPA'#199'O A'#201'REO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label_Versao: TLabel
            Left = 9
            Top = 88
            Width = 60
            Height = 13
            Caption = 'Vers'#227'o: 1.10'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object JvClock_Tempo: TJvClock
            Left = 10
            Top = 1
            Width = 65
            Height = 13
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = []
            OnTime = JvClock_TempoTime
          end
        end
      end
    end
    object Panel_Ajuste2: TPanel
      Left = 0
      Top = 0
      Width = 47
      Height = 941
      Align = alLeft
      BevelOuter = bvNone
      Color = 15722132
      TabOrder = 2
    end
  end
  object Panel_Ferramenta: TPanel
    Left = 965
    Top = 0
    Width = 1318
    Height = 943
    Align = alClient
    TabOrder = 1
    object Panel_TrataRespostaItens: TPanel
      Left = 1
      Top = 71
      Width = 168
      Height = 871
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Panel_TrataQuestoes: TPanel
        Left = 0
        Top = 0
        Width = 167
        Height = 871
        Align = alLeft
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = 16775148
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object JvGradient_Itens: TJvGradient
          Left = 0
          Top = 0
          Width = 31
          Height = 869
          Align = alLeft
          Style = grVertical
          StartColor = 15722132
          EndColor = 12615680
          Steps = 133
        end
        object JvGradient2: TJvGradient
          Left = 165
          Top = 0
          Width = 0
          Height = 869
          Align = alLeft
          Style = grVertical
          StartColor = 15722132
          EndColor = 12615680
          Steps = 133
        end
        object Panel_Itens: TPanel
          Left = 31
          Top = 0
          Width = 134
          Height = 869
          Align = alLeft
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object DBGrid_Itens: TDBGrid
            Left = 0
            Top = 23
            Width = 150
            Height = 846
            Align = alLeft
            Color = clWhite
            Ctl3D = False
            DataSource = DSC_ItemProva
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgColLines, dgRowLines, dgTabs]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid_ItensCellClick
            OnDrawColumnCell = DBGrid_ItensDrawColumnCell
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Item1'
                Width = 43
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Item2'
                Width = 43
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Item3'
                Width = 43
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 134
            Height = 23
            Align = alTop
            BevelOuter = bvNone
            Caption = 'ITENS'
            Color = 16052155
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Baskerville Old Face'
            Font.Style = [fsItalic]
            ParentFont = False
            TabOrder = 1
            object Shape15: TShape
              Left = -495
              Top = -80
              Width = 629
              Height = 103
              Brush.Color = 15722132
              Pen.Color = 15722132
            end
            object JvGradient1: TJvGradient
              Left = 0
              Top = 0
              Width = 134
              Height = 23
              Align = alClient
              StartColor = 15722132
              EndColor = 12615680
              Steps = 133
            end
            object Label1: TLabel
              Left = 16
              Top = 2
              Width = 108
              Height = 17
              Caption = 'Selecione o Item'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
          end
        end
        object Panel_BotoesSelecaoItens: TPanel
          Left = 0
          Top = 22
          Width = 31
          Height = 97
          BevelOuter = bvNone
          Color = 16777202
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object JvShape1: TJvShape
            Left = 0
            Top = 0
            Width = 31
            Height = 97
            Align = alClient
            Brush.Color = 16378331
            Pen.Color = 33023
          end
          object BitBtn_D: TBitBtn
            Left = 3
            Top = 73
            Width = 25
            Height = 20
            Cursor = crHandPoint
            Hint = 'Seleciona a alternativa "D" como a correta.'
            Caption = 'D'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = BitBtn_DClick
          end
          object BitBtn_C: TBitBtn
            Left = 3
            Top = 49
            Width = 25
            Height = 20
            Cursor = crHandPoint
            Hint = 'Seleciona a alternativa "C" como a correta.'
            Caption = 'C'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BitBtn_CClick
          end
          object BitBtn_B: TBitBtn
            Left = 3
            Top = 26
            Width = 25
            Height = 20
            Cursor = crHandPoint
            Hint = 'Seleciona a alternativa "B" como a correta.'
            Caption = 'B'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn_BClick
          end
          object BitBtn_A: TBitBtn
            Left = 3
            Top = 4
            Width = 25
            Height = 20
            Cursor = crHandPoint
            Hint = 'Seleciona a alternativa "A" como a correta.'
            Caption = 'A'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = BitBtn_AClick
          end
        end
      end
    end
    object Panel_Resultados: TPanel
      Left = 185
      Top = 71
      Width = 1132
      Height = 871
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 1
      object Panel_Calculadora: TPanel
        Left = 0
        Top = 0
        Width = 1130
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        Color = 15722132
        TabOrder = 0
        object Label_Calculadora: TLabel
          Left = 9
          Top = 5
          Width = 71
          Height = 17
          Alignment = taCenter
          Caption = 'Calculadora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Baskerville Old Face'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = True
        end
        object Memo_Aviso_: TMemo
          Left = 413
          Top = 0
          Width = 299
          Height = 44
          Align = alLeft
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 9225983
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            'O pedido de revis'#227'o n'#227'o poder'#225' ser feito '
            'posterior a este momento.')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object Memo_MsgRevisao: TMemo
          Left = 0
          Top = 0
          Width = 323
          Height = 44
          Align = alLeft
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            'Para selecionar o item para ser revisado'
            'o aluno dever'#225' pressionar o bot'#227'o "Revisar"')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object Panel_Calc: TPanel
          Left = 323
          Top = 0
          Width = 90
          Height = 44
          Align = alLeft
          BevelOuter = bvNone
          Color = 15722132
          TabOrder = 2
          object JvCalcEdit_Calculadora: TJvCalcEdit
            Left = 4
            Top = 23
            Width = 81
            Height = 19
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object PsyRichEdit_Resposta: TPsyRichEdit
        Left = 311
        Top = 44
        Width = 819
        Height = 825
        Align = alClient
        Color = 14543103
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        HideScrollBars = False
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        Visible = False
        WantTabs = True
      end
      object DBGrid_Resultado: TDBGrid
        Left = 43
        Top = 44
        Width = 268
        Height = 825
        Align = alLeft
        BorderStyle = bsNone
        DataSource = DSC_Resultado
        Enabled = False
        Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid_ResultadoDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumQuestao'
            Title.Alignment = taCenter
            Title.Caption = 'Item Fiscal'
            Title.Color = 16758042
            Width = 56
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Item'
            Title.Alignment = taCenter
            Title.Caption = 'Item Aluno'
            Title.Color = 16758042
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Resp'
            Title.Alignment = taCenter
            Title.Color = 16758042
            Width = 38
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Correta'
            Title.Alignment = taCenter
            Title.Color = 16758042
            Width = 40
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Erro'
            Title.Alignment = taCenter
            Title.Color = 16758042
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Revisao'
            Title.Alignment = taCenter
            Title.Caption = 'Revis'#227'o'
            Title.Color = 16758042
            Width = 45
            Visible = True
          end>
      end
      object Panel_BotaoProva: TPanel
        Left = 0
        Top = 44
        Width = 43
        Height = 825
        Align = alLeft
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 3
        object JvGradient7: TJvGradient
          Left = 0
          Top = 0
          Width = 41
          Height = 823
          Align = alLeft
          Style = grVertical
          StartColor = 15722132
          EndColor = 12615680
          Steps = 93
        end
        object Shape16: TShape
          Left = -1
          Top = -1
          Width = 44
          Height = 19
          Brush.Color = 16758042
        end
        object JvButton_MarcarParaRevisao: TJvButton
          Left = 0
          Top = 17
          Width = 44
          Height = 18
          Hint = 'Marca a quest'#227'o para ser solicitado revis'#227'o '
          Caption = 'Revisar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = JvButton_MarcarParaRevisaoClick
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
    end
    object Panel2: TPanel
      Left = 169
      Top = 71
      Width = 16
      Height = 871
      Align = alLeft
      BevelOuter = bvNone
      Color = 15722132
      TabOrder = 2
    end
    object Panel_Botoes: TPanel
      Left = 1
      Top = 1
      Width = 1316
      Height = 70
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object JvShape_VisualizarProva: TJvShape
        Left = 1
        Top = 2
        Width = 155
        Height = 53
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_VisualizarProva: TJvTransparentButton
        Left = 3
        Top = 3
        Width = 152
        Height = 53
        Hint = 'Permite a visualiza'#231#227'o completa da prova.'
        BorderWidth = 0
        Caption = 'Visualizar Prova Inteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
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
        TextAlign = ttaBottom
        OnClick = JvTransparentButton_VisualizarProvaClick
      end
      object JvShape_EncerrarProva: TJvShape
        Left = 173
        Top = 2
        Width = 154
        Height = 53
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_EncerrarProva: TJvTransparentButton
        Left = 174
        Top = 3
        Width = 152
        Height = 53
        Hint = 'Encerra a Prova'
        BorderWidth = 0
        Caption = 'Encerrar a Prova'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          06080000424D060800000000000036000000280000001A000000190000000100
          180000000000D007000000000000000000000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3E9
          E9E9E0E0E2D5D6DAC2C0C9B2B2BCAEADB9B7B7C0CCCBD3DEDEE0E8E8E8F1F1F1
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C3C3C3C3C1C1C1ADADACA1A1A18D8D925C5D6E3D3D583735563636583737
          5836365637375547455F70707E9B9A9FACA9AABBBABAD4D4D4C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C3B9B8B9A9A8A9A1A2A46E6F7E3F
          3D5A3A3A5E3B3C643F3F68403F69403F693F3F683E3E663C3B6439385B494962
          8B8C95A5A5A5B0B0B0C9C9C9C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C3C3C3C3BCBBBD6564783B3A603E3D6743426D4545734847764A49794A49
          7949487848477643467341416E3E3D663D3C5D90919AC4C4C4C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C3C3C3C38788973C3B6142416C46
          46744A4B7A4D4D7F4F4F82525085525086515085504E834E4D7F4C4B7B474774
          41416B434265C5C6CDC3C3C3C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C3C3C3C33F3F6242436D626182A8A8BD59598754568C55578E5859915859
          9258599156568F5254896E6E93A3A6B94E4F7942406D64657FC3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C36C6C8842416B484978AFB0C5FD
          FCFCCFCEDC6261955E609D62629F63629F64639F5E5F9C76749FECEBF1FBFCFD
          7C7BA247487841416ABABAC7C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C344446B494977505184616093CFD0E1FDFDFDD1D0E07572A47575AD7476
          AD7273A98485ADECEDF3FAFBFCA5A7C357578C4F5082494A79716E90C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3A6A5BA4847754E508254558D5C5C976E
          6FA3D5D5E5FCFDFDD7D7E38C8DB38D8EBA9997B9EFEFF4FCFBFDB1B0CC64649F
          5B5B9653558B4D4E81504E7AC3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          8282A04C4D7F53548C5B5C976464A27072A98888B5DFE0ECFCFDFDDDDFE7AEAF
          C3F2F2F5FCFBFCC2C4D77D7EAE6E6DA762629F5959955353894F4D7DCDCEDBC3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C372739951528659589261609D6E6EA983
          82B49796C2ADACCCE8E9F0FFFFFFFEFEFEFDFDFDD5D5E3A4A4C79190BC7F7EB2
          6B6AA45E5F9B57588F504F83B8B9CDC3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          74739D56548D5D5B976768A37A7CB08F90BCA3A4C9B8BAD5CCCBD8FDFCFDFEFF
          FFF3F3F4C4C4D5B2B4D09D9FC38A8AB87676AC6363A05A5A95545289B6B7CBC3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C37A7AA3575892605F9D706FA98684B698
          98C0AEAFCEC2C3D4F4F7F8FDFDFDFAFAFBFDFDFDE9E9EEBCBBD1A7A7CC9192BD
          7E7EB2696AA55C5C9854538ABEBDD3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          9091B558599463629F7675AD8A89B89D9DC3B7B5CCF3F5F8FDFDFDF2F2F6EDEE
          F2F5F7F8FDFEFDE5E6EDABAAC79696C08383B46E70A85D5E9958578ED1D2E2C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3B7B7D15A5A956465A17979AE8A8BB8A8
          A7C2F4F4F7FCFDFEEAEAF0E7E7EFE9EAF1E6E6EEF1F1F6FCFEFDE3E2EA9897BA
          8485B57274A95E5F9A656598C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C365669C6464A17978AE9B9ABCEFF0F6FBFCFDDBDCE8D2D2E4DCDCEADFDF
          EDDBDBE8D0CFE1E8E9EFFEFEFDDCDCE68888B37271A95D5D998E8EB5C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C39091BA62629E7474ABC1C1D6FB
          FCFECFCFE1B5B7D2C5C4DDCDCCE1D0CFE3C9CBDFC0C1DAB4B5D0E2E2EBF9F9FD
          9B9BC06E6CA664649DCCCBDFC3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C3C3C3C37474A86E6DA68686B4A9AAC8A09FC5ACACCCB9B8D5BFBFD8C0C2
          D9BCBDD6B4B4D1A7A8CB9E9EC4A2A4C67C7CAF6C6CA69697BCC3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C3C3C3C3B3B2CE7979AD7D7EB18D
          8DB99D9AC2A8A7C9B3B3D1B8B9D3B9BBD4B6B7D2AEAECDA3A4C79897C18C8CBB
          8282B3918FBAC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3ACADC98C8DBB908FBB9C9CC2AAA9CBB4B4D2BBBBD5BDBC
          D6B7B8D3AEADCDA3A4C79A9BC19595BF9A9AC0C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C2D8A1
          A1C5A5A6CCAEAECEB7B7D5BEBDD8BFBED8BAB9D4B0B0CFA6A8C9A1A3C6AAACCA
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3BEBED7BFC1D6C2C3DAC1C2
          DABEBFD8B9BAD5BBBBD5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C30000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C30000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaBottom
        OnClick = JvTransparentButton_EncerrarProvaClick
      end
      object Label_Rede: TLabel
        Left = 1
        Top = 57
        Width = 29
        Height = 13
        Caption = 'Rede:'
      end
      object Label_BD: TLabel
        Left = 175
        Top = 57
        Width = 42
        Height = 13
        Caption = 'Servidor:'
      end
      object Panel_Tempo: TPanel
        Left = 340
        Top = 3
        Width = 114
        Height = 54
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object Shape13: TShape
          Left = 0
          Top = 0
          Width = 114
          Height = 54
          Align = alClient
          Visible = False
        end
        object Label2: TLabel
          Left = 3
          Top = 4
          Width = 110
          Height = 17
          Caption = 'Tempo de Prova '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label_TempoProva: TLabel
          Left = 7
          Top = 33
          Width = 98
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = '00:00:00'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Visible = False
        end
      end
    end
  end
  object JvDBRichEdit_MontaItem: TJvDBRichEdit
    Left = 67
    Top = 776
    Width = 774
    Height = 125
    DataField = 'DESCENALT'
    DataSource = DSQ_GabaritoProva
    Color = clSilver
    TabOrder = 2
    Visible = False
  end
  object Query_GabaritoProva: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select GP.NumeroQuestao, GP.NumItem, GP.Questao, ID.DescEnAlt, I' +
        'd.RespostaCorreta, GP.Gabarito'
      'From GabaritoProva GP,  Item_Desc ID'
      'Where GP.IdCurso = 7'
      'and GP.Idturma = 38'
      'and GP.ReferenciaAvaliacao = '#39'02T'#39
      'and GP.NumItem = ID.NumItem'
      'Order By GP.Questao')
    Left = 192
    Top = 248
    object Query_GabaritoProvaNUMEROQUESTAO: TIntegerField
      FieldName = 'NUMEROQUESTAO'
      Origin = 'GABARITOPROVA.NUMEROQUESTAO'
      Required = True
    end
    object Query_GabaritoProvaNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'GABARITOPROVA.NUMITEM'
    end
    object Query_GabaritoProvaQUESTAO: TIntegerField
      FieldName = 'QUESTAO'
      Origin = 'GABARITOPROVA.QUESTAO'
    end
    object Query_GabaritoProvaDESCENALT: TBlobField
      FieldName = 'DESCENALT'
      Origin = 'ITEM_DESC.DESCENALT'
      Size = 8
    end
    object Query_GabaritoProvaRESPOSTACORRETA: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Origin = 'ITEM_DESC.RESPOSTACORRETA'
      FixedChar = True
      Size = 1
    end
    object Query_GabaritoProvaGABARITO: TIntegerField
      FieldName = 'GABARITO'
      Origin = 'GABARITOPROVA.GABARITO'
      Required = True
    end
  end
  object DSQ_GabaritoProva: TDataSource
    DataSet = Query_GabaritoProva
    Left = 223
    Top = 249
  end
  object DSC_ItemProva: TDataSource
    DataSet = ClientDataSet_ItemProva
    Left = 1117
    Top = 229
  end
  object ClientDataSet_ItemProva: TClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 1088
    Top = 229
    Data = {
      DD0000009619E0BD010000001800000009000000000003000000DD0005497465
      6D3104000100000000000453656C310100490000000100055749445448020002
      0001000552657370310100490000000100055749445448020002000100054974
      656D3204000100000000000453656C3201004900000001000557494454480200
      0200010005526573703201004900000001000557494454480200020001000549
      74656D3304000100000000000453656C33010049000000010005574944544802
      0002000100055265737033010049000000010005574944544802000200010000
      00}
    object ClientDataSet_ItemProvaItem1: TIntegerField
      FieldName = 'Item1'
    end
    object ClientDataSet_ItemProvaSel1: TStringField
      FieldName = 'Sel1'
      Size = 1
    end
    object ClientDataSet_ItemProvaResp1: TStringField
      FieldName = 'Resp1'
      Size = 1
    end
    object ClientDataSet_ItemProvaItem2: TIntegerField
      FieldName = 'Item2'
    end
    object ClientDataSet_ItemProvaSel2: TStringField
      FieldName = 'Sel2'
      Size = 1
    end
    object ClientDataSet_ItemProvaResp2: TStringField
      FieldName = 'Resp2'
      Size = 1
    end
    object ClientDataSet_ItemProvaItem3: TIntegerField
      FieldName = 'Item3'
    end
    object ClientDataSet_ItemProvaSel3: TStringField
      FieldName = 'Sel3'
      Size = 1
    end
    object ClientDataSet_ItemProvaResp3: TStringField
      FieldName = 'Resp3'
      Size = 1
    end
  end
  object DSQ_Documentacao: TDataSource
    DataSet = IBQuery_Documento
    Left = 599
    Top = 217
  end
  object IBQuery_Documento: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select doc, Descricao from Documento'
      'where codigo = 37'
      '')
    Left = 568
    Top = 217
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
  object Table_Teste: TIBTable
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
        Size = 6
      end
      item
        Name = 'DATAAPLICACAO'
        DataType = ftDateTime
      end
      item
        Name = 'TOTALALUNOS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TOTALITENS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DURACAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOTALIRREGULARIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'TOTALANULADAS'
        DataType = ftInteger
      end
      item
        Name = 'REFORMULADOS'
        DataType = ftSmallint
      end
      item
        Name = 'MANTIDO'
        DataType = ftSmallint
      end
      item
        Name = 'APRESENTARNOTA'
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
        Name = 'N_GABARITOS'
        DataType = ftInteger
      end
      item
        Name = 'HAB_ELABORACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'STATUS_APLICACAO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'INICIO_APLICACAO'
        DataType = ftDateTime
      end
      item
        Name = 'TERMINO_APLICACAO'
        DataType = ftDateTime
      end
      item
        Name = 'NUMITEM_REVISAO'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'TESTE_TESTEID_PK'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
        Options = [ixUnique]
      end>
    IndexFieldNames = 
      'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;DAT' +
      'AAPLICACAO'
    MasterFields = 
      'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;DAT' +
      'AAPLICACAO'
    MasterSource = DM.DSQ_Usuario
    StoreDefs = True
    TableName = 'TESTE'
    Left = 200
    Top = 296
    object Table_TesteIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Required = True
    end
    object Table_TesteIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Required = True
    end
    object Table_TesteFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Required = True
      Size = 1
    end
    object Table_TesteREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Required = True
      Size = 3
    end
    object Table_TesteCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Required = True
      Size = 6
    end
    object Table_TesteDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object Table_TesteTOTALALUNOS: TSmallintField
      FieldName = 'TOTALALUNOS'
      Required = True
    end
    object Table_TesteTOTALITENS: TSmallintField
      FieldName = 'TOTALITENS'
      Required = True
    end
    object Table_TesteDURACAO: TIntegerField
      FieldName = 'DURACAO'
      Required = True
    end
    object Table_TesteTOTALIRREGULARIDADE: TSmallintField
      FieldName = 'TOTALIRREGULARIDADE'
    end
    object Table_TesteTOTALANULADAS: TIntegerField
      FieldName = 'TOTALANULADAS'
    end
    object Table_TesteREFORMULADOS: TSmallintField
      FieldName = 'REFORMULADOS'
    end
    object Table_TesteMANTIDO: TSmallintField
      FieldName = 'MANTIDO'
    end
    object Table_TesteAPRESENTARNOTA: TIBStringField
      FieldName = 'APRESENTARNOTA'
      FixedChar = True
      Size = 1
    end
    object Table_TesteOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object Table_TesteN_GABARITOS: TIntegerField
      FieldName = 'N_GABARITOS'
    end
    object Table_TesteSTATUS_APLICACAO: TIBStringField
      FieldName = 'STATUS_APLICACAO'
      Size = 12
    end
    object Table_TesteINICIO_APLICACAO: TDateTimeField
      FieldName = 'INICIO_APLICACAO'
    end
    object Table_TesteTERMINO_APLICACAO: TDateTimeField
      FieldName = 'TERMINO_APLICACAO'
    end
    object Table_TesteNUMITEM_REVISAO: TSmallintField
      FieldName = 'NUMITEM_REVISAO'
    end
  end
  object DST_Teste: TDataSource
    DataSet = Table_Teste
    Left = 230
    Top = 297
  end
  object IBQuery_RespostaAluno_: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select GP.NumeroQuestao, GP.NumItem, GP.Questao, ID.DescEnAlt, I' +
        'd.RespostaCorreta, GP.Gabarito'
      'From GabaritoProva GP,  Item_Desc ID'
      'Where GP.IdCurso = 7'
      'and GP.Idturma = 38'
      'and GP.ReferenciaAvaliacao = '#39'02T'#39
      'and GP.NumItem = ID.NumItem'
      'Order By GP.Questao')
    Left = 200
    Top = 336
    object IntegerField1: TIntegerField
      FieldName = 'NUMEROQUESTAO'
      Origin = 'GABARITOPROVA.NUMEROQUESTAO'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'GABARITOPROVA.NUMITEM'
    end
    object IntegerField3: TIntegerField
      FieldName = 'QUESTAO'
      Origin = 'GABARITOPROVA.QUESTAO'
    end
    object BlobField1: TBlobField
      FieldName = 'DESCENALT'
      Origin = 'ITEM_DESC.DESCENALT'
      Size = 8
    end
    object IBStringField1: TIBStringField
      FieldName = 'RESPOSTACORRETA'
      Origin = 'ITEM_DESC.RESPOSTACORRETA'
      FixedChar = True
      Size = 1
    end
    object IntegerField4: TIntegerField
      FieldName = 'GABARITO'
      Origin = 'GABARITOPROVA.GABARITO'
      Required = True
    end
  end
  object DSC_Resultado: TDataSource
    DataSet = ClientDataSet_resultado
    Left = 1379
    Top = 246
  end
  object ImageList1: TImageList
    Left = 1339
    Top = 296
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFECEA00EDEAE600FDF7
      F200F3F0EB00F2F3EA00FAFCF000F0F3E300FCFFEF00F8FDEE00EDF2E900F4F6
      F000F7F4EC00F4F4EE00E2EDEA00D5E6E30000000000E6EDF000F1EDE800F7F5
      EA00F1F8E900EAF5E500F3FAED00F0F7EA00F2FCEC00F0FDEF00E8F6EB00ECF4
      ED00FBF5EE00F9F6EE00DCE7E400D8EBE8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFF3E700DFEBDF008D897E00847A
      70008A827B00847C7500857F7400878174007C7669008380720087857B007B79
      6F00847C6F00A29F9100E0EADE00DDEEE100E1F1F000DCE6E0008E887B00887E
      6D0089807600867E77008A7B78008C7B780084767000857E7500868678007C7E
      6B00817B6800A0A08E00DAEEE100D0EEE3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9EADC00D1DCCC005C574800C6BA
      AE00C2B8B100C5BCB800BBB3AC00C4BCB500C6BFB600C3BEB500B6B3AB00C9C4
      BB00AAA19300615C4D00F0F7E800E1EEDE00D7EAE100CFD9CD005E574600CBBC
      AC00C2B7AF00C6BBB700C3B4B100CCBBB800CCBDBA00C6BAB400BDB7AA00C9C5
      B300ABA18F0064625000E1F2E400D4F0E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7F5E900CFD8CB006F695E00FFFF
      F900FFFFFE00FFFEFE00FFFFFF00FFFFFE00FFFDFC00FFFFFE00FFFFFE00FFFC
      F800F1E8DF007D776A00E7EBDF00E0EADD00E3F6E500CED8C800766D5F00FFFE
      F500FFFFFB00FBFFF900FBFFF800FAFFF400FAFCF600FFFFFC00FFFEF900FFFE
      FA00FAE6E10081716B00E5E9E300DDEAE2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1ECE200D0D6CB006B645B00FAEF
      EB00F7F2F300FCFBFD00F7F6F800F6F8F800F9FBFC00F1F3F400F7F9FA00FBF9
      F800E2DAD300746D6400E9EDE200E0EADE00DFF2DF00CCD6C5006E645A00F5EC
      E200EFFCEE00EAFFEF0088AE8A0087AC8600EDFFED00E8F6EA00F5F8F600FFFC
      FD00E8D3D5007D6B6A00EBEBE500E0E8E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAF7EF00CBD3C900716B6400F4E9
      E500FFFBFC00FAF7F900FFFEFE00FEFCFB00FFFDFD00FFFFFF00FBFAFC00FFFF
      FE00E3DBD4006F685F00EAEFE600E1ECE200E4F7E600CED8CB0072686100EAE9
      DB00E7FFE80096D39B002A782B002E792D0098CC9700E9FFE900EDFAF200FFFE
      FF00E8DFDC0071696200E7ECE300E1ECE2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEEDE500D4DDD30067615A00ECE1
      DD00F4EEEF00F9F4F500FDF9F800FFFEFD00FFFEFD00FBF9F800FCFCFC00FFFE
      FD00E6DED70075706700E3E8DF00E2EDE500DFF0E500D0D9CF006D635C00EBEB
      DB00BADBB600346F350058A3570054A3520031722D00B0E0B000EAFFF100F8FF
      FB00E2DDD40076726700E1E9DE00DFEDE1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2F2E700CED7CD0067615A00E5DB
      D400EAE5E400EFEAEB00FDF9F800FCF8F700FEFCFB00FFFEFD00FBFBFB00FFFF
      FE00E7DDD600746D6400E3E8DF00E2EDE300E0EEEA00D3DAD3006A615700E0D9
      C800D9DFC80081967600C8E8C500CEFCCD004D8E49003A7D3A00B5E4BD00EEFF
      EE00E5E1CF007A716400E2E8DD00DDEDE2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3F1E500D6DED3005F5A5100DDD3
      CC00E1DCDB00E5E3E300E7E5E500F7F5F400F9F7F700FDFDFD00FCFCFC00FFFC
      F800E8DFD6007A746900E2E6DB00E3EDE100E4EFED00D5D9D30068615200DDD0
      C000EEE5DB00EAE8DE00E8EEE300E6FFE500BEF1BF00468147004C7D5100DEF9
      D800E8E3CE007E736500E1E7DC00DEEDE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0EDDF00D6DDD00068625700D9D0
      C700D8D4D300D6D5D700E4E3E500E5E7E700EFF1F200F6F8F800FAFCFC00FFFF
      FC00E9E0D70071695C00EAECE000E5EEE100DCEAE600D5DAD1006E645300D7C6
      B900D3C7C700E2DBDE00DFE0DC00DAE5DB00EAFFF200B0CDB60067866500E0F3
      D200E8E3CE0072695B00E4ECE100DCEDE2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6F6E500D2DCCC0068625500C4BB
      B100CFCAC700D6D4D400D6D4D400E2E0DF00E7E5E500F0F1EF00F3F4F200FFFF
      FC00DBD1C70078706300EDF0E100E0EADA00E1F2E700D3DCCF0070645200D0BD
      AE00D4C6C700D8CDD000D4D0CB00DFE0D700E0E4DF00F2FAEF00F5FFE800FFFF
      EA00E7DECA00786F6100E4EADF00DDEAE2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBEEDD00D1DCCC0065625300D1C8
      BB00D5CDC600E1D8D500E9E0DC00ECE4DD00F4EBE700FDF7F200FFF9F400FFFF
      F900F3E7DB00746D5E00ECF2E100E1EDDB00DCF3DD00CEDAC6006A614D00CFBD
      AC00D4C6BA00DBCFC500E5D8CA00E8DBCB00EFE6D200F9F3DC00F7F5DD00FFFD
      E600F3E2CD007F6F5F00F0EDE500E5E9E4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0F6EA00D1DFD30047453A00635A
      51006B625E006C65620070686100766F6600756D66007B756E0075716C008882
      7D0070665C00716B6000E5EDE200DDEBDF00DBF5E300D1E1D00051493C006B5B
      4F0070675A0071695C00766B5D007D7060007C715D007E7561007D786900877F
      72007A6B5B007B6E6000ECE9E400E3E8E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0E5E600D7E5E400CBCCCA00C6C1
      C000C2C0C000C4C4C400B7B6B200BEBFB600BDBDB700BABCB600BCBFBD00B9B7
      B600C2BBB800D8D4D300D7DFDF00E0EDEF00CFE9E900D6E8E700CCC7C800C6BE
      BE00BFC0BE00BFC3BE00B8BAB400BFBFB900BFBFB900BCBDB900B6BCBB00B9BE
      BD00BEBBB600D2CFCA00DDE5E400DEECEB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5EBF100DCEAF000E8E9ED00F7F2
      F400EDEEF200EAEEEF00F0F4EF00EFF3ED00F0F7F000EDF3EE00EDF3F200F4F6
      F700F5F0F100EDEAEC00E0E8EF00D8E5ED00CDE9F000D5E7EE00EDECF500F4F0
      F600E9EEF100E6F0F000E8F0EF00EAF0EF00EDF2F300E9F2F600E5F1F700E6F2
      F600EFF1F100EAEFED00DBE9E800D4E8E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000008000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ClientDataSet_resultado: TClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 1340
    Top = 247
    Data = {
      CC0000009619E0BD010000001800000007000000000003000000CC0004497465
      6D01004900000001000557494454480200020003000A4E756D5175657374616F
      0100490000000100055749445448020002000300045265737001004900000001
      0005574944544802000200010007436F72726574610100490000000100055749
      445448020002000100044572726F010049000000010005574944544802000200
      0100075265766973616F0100490000000100055749445448020002000100074E
      756D4974656D04000100000000000000}
    object ClientDataSet_resultadoItem: TStringField
      FieldName = 'Item'
      Size = 3
    end
    object ClientDataSet_resultadoNumQuestao: TStringField
      FieldName = 'NumQuestao'
      Size = 3
    end
    object ClientDataSet_resultadoResp: TStringField
      FieldName = 'Resp'
      Size = 1
    end
    object ClientDataSet_resultadoCorreta: TStringField
      FieldName = 'Correta'
      Size = 1
    end
    object ClientDataSet_resultadoErro: TStringField
      FieldName = 'Erro'
      Size = 1
    end
    object ClientDataSet_resultadoRevisao: TStringField
      FieldName = 'Revisao'
      Size = 1
    end
    object ClientDataSet_resultadoNumItem: TIntegerField
      FieldName = 'NumItem'
    end
  end
end
