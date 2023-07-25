object Form_FichaAvaliacao: TForm_FichaAvaliacao
  Left = 1700
  Top = 89
  HorzScrollBar.Style = ssFlat
  VertScrollBar.Style = ssFlat
  AutoScroll = False
  BorderIcons = []
  Caption = 'Ficha de Avalia'#231#227'o Pr'#225'tica'
  ClientHeight = 1002
  ClientWidth = 1280
  Color = 16577515
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 125
    Align = alTop
    Color = 16577515
    TabOrder = 0
    object JvGradient6: TJvGradient
      Left = 1
      Top = 1
      Width = 1278
      Height = 123
      Align = alClient
      Style = grVertical
      StartColor = 16766640
      EndColor = 16777190
      Steps = 35
    end
    object Label8: TLabel
      Left = 16
      Top = 6
      Width = 91
      Height = 17
      Caption = 'Prosima........:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 16
      Top = 30
      Width = 89
      Height = 17
      Caption = 'In'#237'cio.............:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 16
      Top = 57
      Width = 90
      Height = 17
      Caption = 'Avaliador.......:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 79
      Width = 88
      Height = 17
      Caption = 'ATCO...........:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 103
      Width = 89
      Height = 17
      Caption = 'Org'#227'o...........:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object SpeedButton_Finalizar: TSpeedButton
      Left = 990
      Top = 24
      Width = 135
      Height = 65
      Hint = 'Finaliza a Inser'#231#227'o/Altera'#231#227'o da Ficha de Avalia'#231#227'o'
      Caption = 'FINALIZAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
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
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton_FinalizarClick
    end
    object Label10: TLabel
      Left = 423
      Top = 30
      Width = 58
      Height = 17
      Caption = 'T'#233'rmino:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object DBEdit_termino: TDBEdit
      Left = 491
      Top = 26
      Width = 93
      Height = 23
      Color = 6730751
      Ctl3D = False
      DataField = 'DATATERMINO'
      DataSource = Form_Sel_Avaliacao.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit_Inicio: TDBEdit
      Left = 108
      Top = 26
      Width = 93
      Height = 23
      Color = 6730751
      Ctl3D = False
      DataField = 'DATAINICIO'
      DataSource = Form_Sel_Avaliacao.DSQ_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 108
      Top = 76
      Width = 476
      Height = 23
      Ctl3D = False
      DataField = 'NOMECOMPLETO'
      DataSource = DST_AlunoTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object GroupBox_Avaliacao: TGroupBox
      Left = 612
      Top = 4
      Width = 344
      Height = 118
      Caption = '< Avalia'#231#227'o >'
      Color = 16766640
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      object Label15: TLabel
        Left = 11
        Top = 46
        Width = 84
        Height = 17
        Caption = 'EXERCICIO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 9
        Top = 69
        Width = 40
        Height = 17
        Caption = 'DATA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 9
        Top = 97
        Width = 52
        Height = 17
        Caption = 'LOCAL:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object SpeedButton_AjudaNExercicio: TSpeedButton
        Left = 160
        Top = 40
        Width = 23
        Height = 22
        Hint = 'Ajuda para definir o n'#250'mero do Exerc'#237'cio'
        Flat = True
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
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00999999005959
          540041413E0041413E0041413E0041413E0041413E0066666600AEAEA500FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094948D00C5C5DE00D6D6
          F300D6D6F300D6D6F300D6D6F300D6D6F300AEAEC5004A4A49005C5B57009494
          8D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00AEAEBF00D6D6F300F9F8F900E2E2
          E3009FA2D4009496D300BCBDDF00F3F3EA00F1F1F200D6D6F30074747D005959
          540099999900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00DFE0F200FFFBF6008184CE001619
          B6003C42B700999AD8002327BE002528B9009FA2D400FFFBF600D6D6F3006666
          660060605B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00D6D6F300FFFBF600595BC6000E12BB001418
          C5009495C100FF00FF006F74D8001115C0000C10B5008184CE00FFFBF600D6D6
          F300484845007F7E7800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00D0D1E900F9F8F9008E90D7000E12BB003333CC00292D
          CC003A42CE00686BD700272AC8002C30CB002C30CB001118B800BCBDDF00E5E5
          FA008D8D9C0051514E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00D6D6F300F9F8F9003339C400272AC8003333CC002327
          CC006A6EC900DEDFF700383BCF002327CC003333CC001921BD005154C600FFFB
          F600C5C5DE0041413E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00D6D6F300D6D6F3001F23C4003333CC003333CC002125
          CC00686DC100FF00FF009094E7001115C0002C30CB002C30CB002C30CB00F1F1
          F200D6D6F30041413E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00D6D6F300C9CAF2002327CC003333CC003333CC002C30
          CB001F23C400A7A8CE00FF00FF007A7EDF001B1FC6002C30CB002C30CB00EEEE
          F500D6D6EF0043434000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00D6D6EF00E5E5FA003337DA003337DA00272AC800272A
          C8001B1FC6001115C000C5C5DE00FF00FF004043CF002125CC00383BCF00F9F8
          F900CFCFEE0059595400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00D6D6EF00FF00FF006B71F4002A33E1006E72C700E4E2
          EF005154D6000117BC007F81D600FF00FF00666BD9001519D000767BE100FF00
          FF00BEBFD7008E8E8700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00D0D1E900EEEEF500DBDBFF004848FF005C62DD00FFF7
          ED00FF00FF009FA1E600FFFBF600FDFDF2003C40DF00363AE500EDEEFF00DFE0
          F2008C8C9500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00D6D6EF00FF00FF00D5CDFE007B71FF008686
          EB00DFE0F200F3F3EA00DFE0F200787BF5004E52FD00CCCCFF00FF00FF00CFCF
          EE00A7A69E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00D6D6EF00FF00FF00FF00FF00DCC4
          FF00BAA8FD00A898FB009999FF00AFA6FF00FAF6FF00FF00FF00D6D6EF00A6A5
          A300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D6D6EF00E4E2EF00F9F8
          F900FF00FF00FF00FF00FF00FF00FF00FF00DFE0F200CFCFEE00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CFCF
          EE00CFCFEE00CFCFEE00CFCFEE00CFCFEE00FF00FF00FF00FF00FF00FF00FF00
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
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton_AjudaNExercicioClick
      end
      object DBEdit_Id_Exercicio: TDBEdit
        Left = 102
        Top = 42
        Width = 53
        Height = 22
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        Ctl3D = False
        DataField = 'ID_EXERCICIO'
        DataSource = Form_Sel_Avaliacao.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = DBEdit_Id_ExercicioEnter
        OnExit = DBEdit_Id_ExercicioExit
        OnKeyPress = DBEdit_Id_ExercicioKeyPress
      end
      object JvDBDateEdit_DataAvaliacao: TJvDBDateEdit
        Left = 60
        Top = 66
        Width = 121
        Height = 23
        DataField = 'DATA_AVL'
        DataSource = Form_Sel_Avaliacao.DST_Cad_FichaAvl
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = JvDBDateEdit_DataAvaliacaoEnter
        OnExit = JvDBDateEdit_DataAvaliacaoExit
      end
      object DBEdit_Local: TDBEdit
        Left = 65
        Top = 92
        Width = 270
        Height = 22
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        Ctl3D = False
        DataField = 'LOCAL'
        DataSource = Form_Sel_Avaliacao.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object CheckBox_Estagiario: TCheckBox
        Left = 12
        Top = 19
        Width = 97
        Height = 17
        Caption = 'Est'#225'giario'
        Color = 16766640
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox_EstagiarioClick
      end
    end
    object DBEdit5: TDBEdit
      Left = 108
      Top = 100
      Width = 150
      Height = 23
      Ctl3D = False
      DataField = 'IDUNIDADE'
      DataSource = Form_Sel_Avaliacao.DST_AlunoTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object GroupBox2: TGroupBox
      Left = 1152
      Top = 127
      Width = 99
      Height = 60
      Caption = '< M'#233'dia >'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      object Panel_Media: TPanel
        Left = 6
        Top = 23
        Width = 80
        Height = 30
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = '0'
        Color = 65408
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object Edit_Prosima: TEdit
      Left = 108
      Top = 2
      Width = 476
      Height = 23
      Color = 6730751
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      Text = 'Edit_Prosima'
    end
    object ComboBox_Avaliador: TComboBox
      Left = 108
      Top = 50
      Width = 476
      Height = 25
      BevelInner = bvSpace
      BevelKind = bkFlat
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      OnEnter = ComboBox_AvaliadorEnter
      OnExit = ComboBox_AvaliadorExit
    end
    object Edit1: TEdit
      Left = 1048
      Top = 920
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'Edit1'
    end
  end
  object JvCaptionPanel_AgendaPosCurso: TJvCaptionPanel
    Left = 0
    Top = 844
    Width = 1280
    Height = 158
    Align = alBottom
    Buttons = []
    Caption = '                                        Coment'#225'rio'
    CaptionColor = clNavy
    CaptionPosition = dpTop
    CaptionFont.Charset = ANSI_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = [fsBold]
    OutlookLook = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 25
      Width = 1264
      Height = 118
      Align = alClient
      TabOrder = 0
    end
    object JvDBRichEdit_Parecer: TDBMemo
      Left = 1
      Top = 25
      Width = 1264
      Height = 118
      Align = alClient
      Color = 11854078
      DataField = 'PARECER'
      DataSource = Form_Sel_Avaliacao.DST_Cad_FichaAvl
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = JvDBRichEdit_ParecerEnter
      OnExit = JvDBRichEdit_ParecerExit
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 125
    Width = 1280
    Height = 719
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 946
      Height = 689
      Align = alLeft
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = DSQ_Sel_Avaliacao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
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
          Width = 257
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
          Width = 439
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
    object Panel_Rodape: TPanel
      Left = 1
      Top = 690
      Width = 1278
      Height = 28
      Align = alBottom
      BevelOuter = bvLowered
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Label_TotalDeItensAvaliados: TLabel
        Left = 488
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
        Left = 882
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
        Left = 857
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
        Left = 783
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
        Left = 821
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
        Left = 739
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
        Left = 654
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
    object ScrollBox1: TScrollBox
      Left = 947
      Top = 1
      Width = 280
      Height = 689
      Align = alLeft
      TabOrder = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 274
        Height = 685
        Align = alLeft
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 1
          Top = 73
          Width = 272
          Height = 611
          Align = alClient
          Caption = '< Observa'#231#227'o >'
          Color = 16777190
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object RichEdit_NS: TRichEdit
            Left = 1
            Top = 18
            Width = 270
            Height = 592
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
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
            Left = 1
            Top = 18
            Width = 270
            Height = 592
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
              'Segunda Casa: Indicador da Posi'#231#227'o '
              'Avaliada de acordo com a tabela 1,'
              ''
              'Terceira Casa: Indicador de  Reava-'
              'lia'#231#227'o.'
              ''
              'Quarta Casa: Letra do Exerc'#237'cio de'
              'acordo com a tabela 2, particular-'
              'idade Gale'#227'o'
              '       '
              '  +----------------+  +---------+'
              '  |Tabela 1        |  |Tabela 2 |'
              '  +----------------+  +---------+'
              '  | 1 - Torre      |  | 1 - A   |'
              '  | 2 - Assistente |  | 2 - B   |'
              '  | 3 - Solo       |  | 3 - A/B |'
              '  | 4 - Supervisor |  |         |'
              '  | 5 - Ambienta'#231#227'o|  |         |'
              '  +----------------+  +---------+'
              '                     ')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 272
          Height = 72
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object JvGradient1: TJvGradient
            Left = 0
            Top = 0
            Width = 272
            Height = 72
            Align = alClient
            Style = grVertical
            StartColor = 16766640
            EndColor = 16777190
            Steps = 35
          end
          object Memo2: TMemo
            Left = 6
            Top = 16
            Width = 259
            Height = 41
            Color = 12910532
            Ctl3D = False
            Lines.Strings = (
              'A fim de n'#227'o ter perdas, ao sair pressionar '
              'o bot'#227'o    "FINALIZAR"')
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object DSQ_Sel_Avaliacao: TDataSource
    DataSet = Form_Sel_Avaliacao.IBQuery_PR_Avaliacao
    Left = 289
    Top = 190
  end
  object IBTable_Rel_NS: TIBTable
    Database = DM.IBDatabase_Prosima
    Transaction = DM.IBTransaction_Prosima
    AfterDelete = IBTable_Rel_NSAfterDelete
    AfterEdit = IBTable_Rel_NSAfterEdit
    AfterInsert = IBTable_Rel_NSAfterInsert
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
        Name = 'ID_FICHA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_ATCO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_AVL'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_EXERCICIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <
      item
        Name = 'PK_REL_NS'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO'
    MasterFields = 'IDCURSO;IDTURMA;ID_FICHA;ID_ATCO;ID_AVL;ID_EXERCICIO'
    MasterSource = Form_Sel_Avaliacao.DST_Cad_FichaAvl
    StoreDefs = True
    TableName = 'REL_NS'
    Left = 289
    Top = 222
    object IBTable_Rel_NSIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_Rel_NSIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_Rel_NSID_FICHA: TIntegerField
      FieldName = 'ID_FICHA'
    end
    object IBTable_Rel_NSID_ATCO: TIBStringField
      FieldName = 'ID_ATCO'
    end
    object IBTable_Rel_NSID_AVL: TIBStringField
      FieldName = 'ID_AVL'
    end
    object IBTable_Rel_NSID_EXERCICIO: TIntegerField
      FieldName = 'ID_EXERCICIO'
    end
    object IBTable_Rel_NSDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 500
    end
  end
  object DST_Cad_Ficha_Avl: TDataSource
    DataSet = Form_Sel_Avaliacao.IBTable_Cad_FichaAvl
    Left = 345
    Top = 222
  end
  object IBTable_Aluno: TIBTable
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDCURSO'
        DataType = ftSmallint
      end
      item
        Name = 'IDTURMA'
        DataType = ftInteger
      end
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMORDEM'
        DataType = ftSmallint
      end
      item
        Name = 'POSTOGRADUACAO'
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
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'PK_CAD_FICHA_AVL'
        Fields = 'IDCURSO;IDTURMA;ID_ATCO;ID_FICHA;ID_AVL;ID_EXERCICIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterFields = 'IDCURSO;IDTURMA;ID_ATCO'
    MasterSource = Form_Sel_Avaliacao.DSQ_Cad_FichaAvl
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
