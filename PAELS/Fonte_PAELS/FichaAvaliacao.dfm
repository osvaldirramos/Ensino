object Form_FichaAvaliacao: TForm_FichaAvaliacao
  Left = 63
  Top = 38
  HorzScrollBar.Style = ssFlat
  VertScrollBar.Style = ssFlat
  AutoScroll = False
  BorderIcons = []
  Caption = 
    'PAELS --> Preenchimento da Ficha de Avalia'#231#227'o Pr'#225'tica Circea 100' +
    '-52'
  ClientHeight = 683
  ClientWidth = 1436
  Color = 16772831
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
  PixelsPerInch = 96
  TextHeight = 13
  object JvGradient2: TJvGradient
    Left = 1350
    Top = 0
    Width = 86
    Height = 683
    Align = alClient
    Style = grVertical
    StartColor = 4227200
    EndColor = 16777190
  end
  object Panel_Principal: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 683
    Align = alLeft
    BevelOuter = bvNone
    Color = 16577515
    TabOrder = 0
    object Edit1: TEdit
      Left = 1048
      Top = 920
      Width = 121
      Height = 19
      TabOrder = 0
      Text = 'Edit1'
    end
    object Panel2: TPanel
      Left = 0
      Top = 125
      Width = 401
      Height = 113
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = 16772831
      TabOrder = 1
      object Label3: TLabel
        Left = 11
        Top = 7
        Width = 88
        Height = 15
        Caption = 'Exerc'#237'cio............:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 11
        Top = 45
        Width = 86
        Height = 15
        Caption = 'Data Avalia'#231#227'o.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 11
        Top = 70
        Width = 85
        Height = 15
        Caption = 'Setor..................:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 11
        Top = 92
        Width = 86
        Height = 15
        Caption = 'Tempo...............:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvShape1: TJvShape
        Left = 263
        Top = 48
        Width = 124
        Height = 60
        Brush.Color = 4975298
        Pen.Color = 33023
      end
      object JvTransparentButton_Finalizar: TJvTransparentButton
        Left = 264
        Top = 50
        Width = 122
        Height = 57
        Hint = 'Finaliza a Inser'#231#227'o/Altera'#231#227'o da Ficha de Avalia'#231#227'o'
        Caption = 'FINALIZAR'
        Color = 4975298
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        FrameStyle = fsDark
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000AAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD0F4E4A9E9
          CE81E0B77FDDB479DAB080DDB47ADAB087DFB9B1EAD4AAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA99E4C54FCD971DBD7A00AD
          5A00A44A009C4100994000974000943F009C4903AA6027BC7C67D0A4B3E7D1AA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1E8CA36C68900B45F00A94C00A44D00A6
          5707AC6407A9600CA7600CA76109A15D00A057009A4D0094400097430DAC6154
          CB99AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAA73DCAD00B76400AC4F00B05A0FB76D13BD730FB9
          6F07AF6600AA5F00A75900A65705A45C14A96418AA6718A766009C5100904000
          96431CB47196E4C2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAA4AD19600B15700AF5310C0761CC07A0CB76D00B35C00A7
          4D00A347009F44009A3F009A3F00993F00933F009344009D500FA9631DAC6A00
          9D5400863000A15476DDB0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAA46D19600B35900B35931C2811CC37D00B35C00AD5100AC4D00A9
          4A00A64400A44300A441009A3F009A3F00993D00973D00933C00903D009D5326
          AF7119A663008D3900A65973DCB0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAA63D9A600B35A00B66030CD8910BF7400AF5300AF5300A74D00A64D00AC
          4D00AC4D00AC4C00A74400A343009A3F009A3F00994000974000963F00903C00
          8D402AB17407A65F008C3900A05694E5C2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          8FE5BD00B96400B6613ACD8C11C27600B05700B05600B05600AF5300AD5100AD
          5100AC4D00A74700A14A00AA4D00A64400A341009C3F009A3F009A3F009A3F00
          9039008C3627B37608A65F00913D17B673AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          23C68300B65D27CA8621C68000B45D00B15700B05600B05600B05600B05600AD
          5100B05410B96F00A14D00A94A00A94C00A74600A343009D40009C3F00974000
          993F00933700964129B073009D5400974453D199AAAAAAAAAAAAAAAAAA87E1BC
          00B76311C27630CD8900BC6900B76000B75F00B15900B05700B15700B05400B1
          5A3ACD8FC0ECD95CC594009C4300A44A00AC4D00AA4900A74400A343009C3F00
          9A3F009A3F00943A009D5121AD6D00944404AD61AAE8CDAAAAAAAAAAAA36CD8D
          00B7632DCD8717C57A00B96300B76000B76000B65F00B35A00B35900B35D3CCD
          90CBF2E3FCFEFEE7F5ED23B071009D4000AC4D00AA4A00A94700A64700A14300
          9F40009A3F009A3F00973F0FAA6404A45D009F4964D3A3AAAAAAAAAAAA00BA6A
          0CC27430CE8A05BD6F00BA6600BC6600BC6A03BD6D00BC6C01BC6C4AD197C6F1
          E1FBFEFEFFFFFFFFFFFFBAE8D400A15900A14400AD5000AA4C00A74C00A94A00
          A14100A041009F46009A4000A4531BAF6C00994324BD7AAAAAAA81E1B900BA66
          23CB8333D08C1FC57D24C88127CA842CCB8627C68329C88466DCA7D1F4E5FCFE
          FCFFFFFFFFFFFFFFFFFFF9FEFB84D7B600A04F00A64C00AD5000AC4D00AC4D00
          A74900A64400A446009A3F00A14C19B16D00A05000AF60AFEAD14DD49A00BC6C
          50D79C5CDAA350D69A4DD3974CD39740D1933CD0905CD9A4D4F6E9FCFEFEFFFF
          FFE7FAF1E1F9F0FBFEFEFFFFFFE7F7F161C89A00A35100B05400AD5000A64D00
          AA4D00AA4A00A64300A14100A1490BB66C04A96000A75087E3BA40CE9137CD8F
          83E5BC76E1B460DCA45AD9A05AD9A049D99A43D19473DDAFE8FAF4FFFFFFF1FC
          FA81E1B963D9A3E7F6F1FFFFFFFEFEFED3F0E43ABC8300A95300AF5600AC5000
          AC4D00AC4D00AA4C00A94A00A44600B06107B46900A44977DFB15AD9A071E0AF
          96EAC879E3B66CDFAD6ADFAC5DDAA359DAA14DD39766DCA9DFF7EDFAFCFCAAE5
          CB40CB901FC57F81E5BAFAFEFCFFFFFFFCFEFCBCE7D31DB07000AF5C00B15D00
          B05700AC4F00AC4D00AC4D00AA4A00B15D11BA7000A94776DDB064D6A077E1B3
          9DECCB89E5BF73E0B36FDFAF6CDFAD6ADFAC5CD9A169DAA7C6F2E1BCF0DC53D6
          9C3CD09039CD8D29C684A9EDD1FCFFFEFFFFFFF6FCFB96DDBF13B06900B46100
          B15F00B05600AC4F00A44D00AC4D00B66108BC6D00A94776DDB05DDAA383E4B9
          AAECD190E7C381E4BA7FE3B971E0B170E0B069DDAC6CDFAC8FE8C273E0B04CD3
          9944D39443D19439CE8D46D396D3F5E9FFFFFFFFFFFFE9F7F170CDA408B46900
          B76600B15F00B15900AD4F00AD5001BA6A0FB96F00A94F71DDAF5DD7A37AE1B3
          B1EED69DEACB8DE8C284E5BD83E4BC7DE3B771E0B06CDFAD67DDAA5FDCA35CDA
          A157D79D50D69A46D3963CCE8F73E0B0E9FAF2FFFFFFFFFFFFD6F0E347C38C0F
          B16A07BD6D00B96300B05400AF5411BF7309BD6F00AF5480E0B986E3BA6CDCA9
          B6EED7AAEED394E9C690E8C58CE8C284E5BD81E4BC74E0B174E0B16CDFAC63DC
          A663DCA656DCA054D79D44D6974FD49A91E7C2F1FBF7FFFFFFFFFFFEB7E7D43A
          B98111BD7309BF7000B35900B15A19C07900B76600B660A0E8CBB3EDD659D6A0
          B4EED7B7F1DAA1EDCE99EACA93E9C591E9C58AE8C284E5BC7FE3B97AE3B670E0
          B06CDFAD66DDA95DDAA354DA9F54D69C5CD7A1B4EED7FAFEFBFFFFFFECFBF76A
          D4A61BC27A1DC37D00B76600BA6721C68000B15A18C277C6F2E0AAAAAA57D9A0
          9CE9C8C5F4E1B0EED6A6ECCE9DECCD97E9C891E9C58AE8C087E7BF83E4BC7AE1
          B677E1B46FE0AF66DDA964DDA75CDAA157D79D76DFB0D6F6E8F1FCF6ACEDD351
          D49A2DCA8426C68314BF7619C37C1BC37C00AF5750D199AAAAAAAAAAAA7FE1B6
          74DFB1CAF5E3C8F4E1B1EDD4AAECD09DECCD9CEACB94E9C691E9C58AE7C089E7
          BF81E4BA7AE1B679E1B66CDFAD66DDA95ADAA05FDAA38CE7BF9CEACA5DDAA440
          D0913DD09030CA8731CB8940CE9000B76700B66494E4C2AAAAAAAAAAAAB1EDD7
          59D7A0A9EDD1D6F7E9BCF1DCB4F0D7B1F0D7A9ECD09FECCD9CECCB96E9C68FE8
          C58AE7C081E4BA7FE3B97CE1B779E1B669DDAC64DDA760DCA45DD9A156D79F50
          D49943D19440D09360DCA63DD09000B05731CB89AAAAAAAAAAAAAAAAAAAAAAAA
          74DFB070DDADCAF4E3D6F7E9BAF2DCB6F1D9B4F0D7AAECD0A0EDCEA0EDCE9CEA
          CB96E9C88FE8C38CE8C27FE3B97FE3B979E1B66CDFAD6ADFAD63DCA75CDAA15C
          DAA151D49A6CDFAC87DCB41FC57D01BC6C93E5C2AAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAA5CD9A191E7C2D3F6E8D9F7ECCAF4E4B7F1DAB6F1D9B3F0D6AFEDD3A7ED
          D09CEACB99E9CA97E9C88DE8C38CE7C280E4BA80E3BA77E1B46FDFAF63DCA76A
          DDAC71E0B18FE7C25FDAA424C6816ADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAB1ECD354D49D9AE9C8DAF7EEDAF7ECCBF5E4BDF2DDB9F1DAB6F1D9B3EE
          D6A9EED1A3EDD09AEACB99EACA96E9C68DE8C389E7BF80E3BA80E3BA7AE3B783
          E4BC96EAC867DDAA44D0935AD7A1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAACE9D150D49C94E7C3D3F6EADCF7EDD9F7EACAF4E3BFF2DDB9F1
          DAB6F1D9B1EED4A6EDD0A4EDD09AEACA97EAC890E9C590E8C394E8C59DEDCD9A
          ECCB79E1B44CD4995DD9A4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAECD15CD7A176E0B1BDF1E0DDF9F0DCF7EED6F7EACAF5
          E3C0F2DFBFF2DDB3EED6B7F0D9A9EED3AAEED3AFEED4B1F0D6B1EED697E9C66F
          DFAF4FD49970DDAFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA76DFB163DAA78CE4BFBCF1DDD6F6EAD7F7
          EAD3F6E8D1F6E7CAF5E3D0F6E7C0F2DFC0F2DFBDF1DCAAEDD180E1B753D49D4F
          D49A91E5C0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0ECD681DFB666DCA770DDAD91E7
          C2A9EDD3B9F0DAB4F1D9BAF0DCA9EDD199E9C873DFAF54D69D56D7A084E3BABD
          F1DDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFECD383E4
          BA67DCA967DAA776D9AC71DFAF64DAA66FE0AF8FE7C2B6EED9AAAAAAAAAAAAAA
          AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TextAlign = ttaBottom
        OnClick = JvTransparentButton_FinalizarClick
      end
      object Label_Indicacao: TLabel
        Left = 62
        Top = 22
        Width = 299
        Height = 15
        Caption = 'O indicador de reavalia'#231#227'o dever'#225' ser separado pelo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label11: TLabel
        Left = 368
        Top = 16
        Width = 7
        Height = 24
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CheckBox_Estagiario: TCheckBox
        Tag = 316
        Left = 266
        Top = 2
        Width = 97
        Height = 17
        Caption = 'Est'#225'giario'
        Color = 16772831
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        OnClick = CheckBox_EstagiarioClick
      end
      object JvDBDateEdit_DataAvaliacao: TJvDBDateEdit
        Left = 107
        Top = 40
        Width = 118
        Height = 23
        DataField = 'DATA_AVL'
        DataSource = DM.DST_Cad_FichaAvl
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBComboBox_Setor: TDBComboBox
        Left = 109
        Top = 64
        Width = 148
        Height = 23
        BevelInner = bvSpace
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'SETOR'
        DataSource = DM.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 15
        Items.Strings = (
          'CONTROLE'
          'ASSISTENTE'
          'SUPERVISOR'
          'INSTRUTOR'
          'COORDENADOR OPERACIONAL')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit_Tempo: TDBEdit
        Left = 108
        Top = 88
        Width = 49
        Height = 22
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        Ctl3D = False
        DataField = 'HORARIO_INICIO'
        DataSource = DM.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object Edit_Exercicio: TEdit
        Left = 107
        Top = 1
        Width = 71
        Height = 22
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnKeyPress = Edit_ExercicioKeyPress
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 401
      Height = 125
      Align = alTop
      BevelOuter = bvNone
      Color = 16577515
      TabOrder = 2
      object Label8: TLabel
        Left = 5
        Top = 6
        Width = 72
        Height = 15
        Caption = 'Turma...........:'
        Color = 16577515
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 5
        Top = 30
        Width = 71
        Height = 15
        Caption = 'In'#237'cio.............:'
        Color = 16577515
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 5
        Top = 57
        Width = 73
        Height = 15
        Caption = 'Avaliador.......:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 5
        Top = 79
        Width = 67
        Height = 15
        Caption = 'ATCO...........:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 5
        Top = 103
        Width = 70
        Height = 15
        Caption = 'Org'#227'o...........:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 252
        Top = 30
        Width = 49
        Height = 15
        Caption = 'T'#233'rmino:'
        Color = 16577515
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object DBEdit_termino: TDBEdit
        Left = 304
        Top = 26
        Width = 93
        Height = 21
        Color = 6730751
        Ctl3D = False
        DataField = 'DATATERMINO'
        DataSource = DM.DSQ_MontaTurma
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit_Inicio: TDBEdit
        Left = 81
        Top = 26
        Width = 93
        Height = 21
        Color = 6730751
        Ctl3D = False
        DataField = 'DATAINICIO'
        DataSource = DM.DSQ_MontaTurma
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 81
        Top = 76
        Width = 316
        Height = 21
        Color = 6730751
        Ctl3D = False
        DataField = 'NOMECOMPLETO'
        DataSource = DST_AlunoTurma
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 81
        Top = 100
        Width = 316
        Height = 21
        Color = 6730751
        Ctl3D = False
        DataField = 'IDUNIDADE'
        DataSource = DST_AlunoTurma
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object ComboBox_Avaliador: TComboBox
        Left = 81
        Top = 50
        Width = 316
        Height = 23
        BevelInner = bvSpace
        BevelKind = bkFlat
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 15
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = ComboBox_AvaliadorEnter
        OnExit = ComboBox_AvaliadorExit
      end
      object DBEdit_Turma: TDBEdit
        Left = 81
        Top = 2
        Width = 316
        Height = 21
        Color = 6730751
        Ctl3D = False
        DataField = 'TURMA'
        DataSource = DM.DSQ_MontaTurma
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 238
      Width = 401
      Height = 445
      Align = alClient
      Caption = '< Observa'#231#227'o >'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Splitter1: TSplitter
        Left = 392
        Top = 18
        Width = 8
        Height = 426
        Align = alRight
      end
      object Splitter2: TSplitter
        Left = 1
        Top = 18
        Width = 8
        Height = 426
      end
      object RichEdit_NS: TRichEdit
        Left = 9
        Top = 18
        Width = 383
        Height = 426
        Align = alClient
        BorderStyle = bsNone
        Color = 16777190
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Justificar as NS(s) no '
          '"Editor de Coment'#225'rios" Abaixo:'
          '')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Memo_Regra: TMemo
        Left = 9
        Top = 18
        Width = 383
        Height = 426
        Align = alClient
        BorderStyle = bsNone
        Color = 16777190
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          'REGRAS PARA DEFINIR O EXERC'#205'CIO'
          ''
          'Primeira casa: Numero do  Exerc'#237'cio,'
          ''
          'Segunda Casa: Indicador de  Reavalia'#231#227'o.')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Panel_FichaDeAvaliacao: TPanel
    Left = 401
    Top = 0
    Width = 949
    Height = 683
    Align = alLeft
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 1
    object Panel_Rodape: TPanel
      Left = 0
      Top = 495
      Width = 947
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      BorderStyle = bsSingle
      Color = 15138815
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object Label_TotalDeItensAvaliados: TLabel
        Left = 513
        Top = 6
        Width = 157
        Height = 13
        Caption = 'TOTAL DE ITENS AVALIADOS: '
      end
      object Label12: TLabel
        Left = 8
        Top = 5
        Width = 290
        Height = 13
        Caption = 'REG. = Regular / NS = N'#227'o Satisfat'#243'rio / NA = N'#227'o Avaliado'
      end
      object Panel_NA: TPanel
        Left = 907
        Top = 0
        Width = 23
        Height = 26
        BevelOuter = bvLowered
        BorderStyle = bsSingle
        Caption = '0'
        Color = clWhite
        TabOrder = 0
      end
      object Panel_NS: TPanel
        Left = 882
        Top = 0
        Width = 25
        Height = 26
        BevelOuter = bvLowered
        BorderStyle = bsSingle
        Caption = '0'
        Color = clWhite
        TabOrder = 1
      end
      object Panel_Bom: TPanel
        Left = 808
        Top = 0
        Width = 39
        Height = 26
        BevelOuter = bvLowered
        BorderStyle = bsSingle
        Caption = '0'
        Color = clWhite
        TabOrder = 2
      end
      object Panel_Reg: TPanel
        Left = 846
        Top = 0
        Width = 38
        Height = 26
        BevelOuter = bvLowered
        BorderStyle = bsSingle
        Caption = '0'
        Color = clWhite
        TabOrder = 3
      end
      object Panel_Otimo: TPanel
        Left = 764
        Top = 0
        Width = 44
        Height = 26
        BevelOuter = bvLowered
        BorderStyle = bsSingle
        Caption = '0'
        Color = clWhite
        TabOrder = 4
      end
      object Panel_TotalItensAvl: TPanel
        Left = 679
        Top = 0
        Width = 52
        Height = 26
        BevelOuter = bvLowered
        BorderStyle = bsSingle
        Caption = '0'
        Color = 11060735
        TabOrder = 5
      end
    end
    object JvCaptionPanel_AgendaPosCurso: TJvCaptionPanel
      Left = 0
      Top = 523
      Width = 947
      Height = 158
      Align = alBottom
      Buttons = []
      BorderStyle = bsNone
      Caption = '   COMENT'#193'RIO'
      CaptionColor = 12046079
      CaptionPosition = dpTop
      CaptionFont.Charset = ANSI_CHARSET
      CaptionFont.Color = clBlue
      CaptionFont.Height = -13
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = [fsBold]
      OutlookLook = False
      TabOrder = 1
      object JvDBRichEdit_Parecer: TDBMemo
        Left = 1
        Top = 26
        Width = 945
        Height = 131
        Align = alClient
        Color = 14545407
        DataField = 'PARECER'
        DataSource = DM.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = JvDBRichEdit_ParecerEnter
        OnExit = JvDBRichEdit_ParecerExit
      end
    end
    object DBGrid_Ficha: TDBGrid
      Left = 0
      Top = 0
      Width = 946
      Height = 495
      Align = alLeft
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = DM.DSQ_PR_Avaliacao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid_FichaCellClick
      OnDrawColumnCell = DBGrid_FichaDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_ITEM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'ITEM'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AREA_AVALIACAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #193'REA AVALIADA'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 276
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'ITENS A SEREM AVALIADOS'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 450
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OTIMO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #211'TIMO'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 43
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'BOM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 38
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'REGULAR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'REG.'
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 37
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Color = 16311249
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 21
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
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
  object IBTable_Aluno: TIBTable
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
        Name = 'NUMORDEM'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'POSTOGRADUACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'IDUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGOALUNO'
        DataType = ftInteger
      end
      item
        Name = 'NOTAFINAL'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'IDSUBUNIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATAMATRICULA'
        DataType = ftDateTime
      end
      item
        Name = 'MOTIVODESLIGAMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATADESLIGAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'IDANTIGUIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'REGISTRARVEICULO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INSTITUTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TIPO_ALUNO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 125
      end
      item
        Name = 'CHAMADA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RESTRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESTAGIARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'ALUNOTURMA_PK'
        Fields = 'IDCURSO;IDTURMA;IDENTIDADE'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ALUNOTURMA'
        Fields = 'IDENTIDADE'
      end
      item
        Name = 'ALUNOTURMA_IDX_IDANTIGUIDADE'
        Fields = 'IDANTIGUIDADE'
      end
      item
        Name = 'ALUNOTURMA_NUMORDEM_IDX'
        Fields = 'NUMORDEM'
      end
      item
        Name = 'FK_ALUNOTURMA_TURMA'
        Fields = 'IDCURSO;IDTURMA'
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;ID_ATCO'
    MasterSource = DM.DSQ_Cad_FichaAvl
    StoreDefs = True
    TableName = 'ALUNOTURMA'
    Left = 289
    Top = 262
    object IBTable_AlunoIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_AlunoIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_AlunoIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_AlunoNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 125
    end
    object IBTable_AlunoIDUNIDADE: TIBStringField
      FieldName = 'IDUNIDADE'
    end
    object IBTable_AlunoIDSUBUNIDADE: TIBStringField
      FieldName = 'IDSUBUNIDADE'
    end
    object IBTable_AlunoESTAGIARIO: TIBStringField
      FieldName = 'ESTAGIARIO'
      Size = 1
    end
  end
  object DST_AlunoTurma: TDataSource
    DataSet = IBTable_Aluno
    Left = 321
    Top = 262
  end
end
