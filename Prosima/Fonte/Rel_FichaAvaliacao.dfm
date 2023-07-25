object Form_Rel_FichaAvaliacao: TForm_Rel_FichaAvaliacao
  Left = 295
  Top = 96
  Width = 1288
  Height = 988
  BorderIcons = []
  Caption = 'Relat'#243'rio Ficha de Avalia'#231#227'o Pr'#225'tica'
  Color = 16577515
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JvGradient1: TJvGradient
    Left = 987
    Top = 133
    Width = 285
    Height = 567
    Align = alClient
    Style = grVertical
    StartColor = 16766640
    EndColor = 16777190
    Steps = 35
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 133
    Width = 987
    Height = 567
    Align = alLeft
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = DST_Cad_ATCO
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_ITEM'
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
        Title.Alignment = taCenter
        Title.Caption = #211'TIMO'
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BOM'
        Title.Alignment = taCenter
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REGULAR'
        Title.Alignment = taCenter
        Title.Caption = 'REG.'
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NS'
        Title.Alignment = taCenter
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NA'
        Title.Alignment = taCenter
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1272
    Height = 133
    Align = alTop
    Color = 16577515
    TabOrder = 1
    object JvGradient2: TJvGradient
      Left = 1
      Top = 1
      Width = 1270
      Height = 131
      Align = alClient
      Style = grVertical
      StartColor = 16766640
      EndColor = 16777190
      Steps = 35
    end
    object Label8: TLabel
      Left = 16
      Top = 9
      Width = 87
      Height = 18
      Caption = 'Prosima......:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 16
      Top = 35
      Width = 87
      Height = 18
      Caption = 'In'#237'cio............:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 16
      Top = 64
      Width = 82
      Height = 17
      Caption = 'Avaliador.....:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 87
      Width = 80
      Height = 17
      Caption = 'ATCO.........:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 15
      Top = 112
      Width = 83
      Height = 17
      Caption = 'ORG'#195'O......:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 312
      Top = 35
      Width = 61
      Height = 18
      Caption = 'T'#233'rmino:'
      Color = 16577515
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 320
      Top = 112
      Width = 56
      Height = 17
      Caption = 'SETOR:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object SpeedButton_Finalizar: TSpeedButton
      Left = 920
      Top = 8
      Width = 99
      Height = 49
      Caption = 'Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
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
      Layout = blGlyphTop
      ParentFont = False
      OnClick = SpeedButton_FinalizarClick
    end
    object DBEdit_termino: TDBEdit
      Left = 380
      Top = 31
      Width = 93
      Height = 24
      Ctl3D = False
      DataField = 'DATATERMINO'
      DataSource = Form_Classificacao.DST_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit_Inicio: TDBEdit
      Left = 108
      Top = 31
      Width = 93
      Height = 24
      Ctl3D = False
      DataField = 'DATAINICIO'
      DataSource = Form_Classificacao.DST_MontaTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 108
      Top = 57
      Width = 500
      Height = 24
      Ctl3D = False
      DataField = 'NOMECOMPLETO'
      DataSource = Form_Classificacao.DST_Instrutor
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 108
      Top = 83
      Width = 500
      Height = 24
      Ctl3D = False
      DataField = 'NOMECOMPLETO'
      DataSource = Form_Classificacao.DST_AlunoTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 616
      Top = 15
      Width = 301
      Height = 100
      Caption = '< Avalia'#231#227'o >'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label7: TLabel
        Left = 9
        Top = 44
        Width = 40
        Height = 17
        Caption = 'DATA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 9
        Top = 76
        Width = 52
        Height = 17
        Caption = 'LOCAL:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 11
        Top = 18
        Width = 90
        Height = 18
        Caption = 'EXERCICIO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit_DataAval: TDBEdit
        Left = 65
        Top = 41
        Width = 93
        Height = 24
        Ctl3D = False
        DataField = 'DATA_AVL'
        DataSource = Form_Classificacao.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit8: TDBEdit
        Left = 64
        Top = 70
        Width = 233
        Height = 24
        Ctl3D = False
        DataField = 'LOCAL'
        DataSource = Form_Classificacao.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit_Exercicio: TDBEdit
        Left = 108
        Top = 14
        Width = 53
        Height = 22
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        Ctl3D = False
        DataField = 'ID_EXERCICIO'
        DataSource = Form_Classificacao.DST_Cad_FichaAvl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object DBEdit5: TDBEdit
      Left = 108
      Top = 109
      Width = 150
      Height = 24
      Ctl3D = False
      DataField = 'IDUNIDADE'
      DataSource = Form_Classificacao.DST_AlunoTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 380
      Top = 109
      Width = 148
      Height = 24
      Ctl3D = False
      DataField = 'IDSUBUNIDADE'
      DataSource = Form_Classificacao.DST_AlunoTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object GroupBox2: TGroupBox
      Left = 920
      Top = 71
      Width = 99
      Height = 60
      Caption = '< M'#233'dia >'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
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
      Top = 5
      Width = 500
      Height = 24
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      Text = 'Edit_Prosima'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 700
    Width = 1272
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Label11: TLabel
      Left = 575
      Top = 8
      Width = 151
      Height = 13
      Caption = 'TOTAL DE ITENS AVALIADOS'
    end
    object Label12: TLabel
      Left = 8
      Top = 9
      Width = 290
      Height = 13
      Caption = 'REG. = Regular / NS = N'#227'o Satisfat'#243'rio / NA = N'#227'o Avaliado'
    end
    object Panel_NA: TPanel
      Left = 920
      Top = 0
      Width = 46
      Height = 26
      BevelOuter = bvLowered
      BorderStyle = bsSingle
      Caption = '0'
      Color = clWhite
      TabOrder = 0
    end
    object Panel_NS: TPanel
      Left = 873
      Top = 0
      Width = 48
      Height = 26
      BevelOuter = bvLowered
      BorderStyle = bsSingle
      Caption = '0'
      Color = clWhite
      TabOrder = 1
    end
    object Panel_Bom: TPanel
      Left = 782
      Top = 0
      Width = 47
      Height = 26
      BevelOuter = bvLowered
      BorderStyle = bsSingle
      Caption = '0'
      Color = clWhite
      TabOrder = 2
    end
    object Panel_Reg: TPanel
      Left = 828
      Top = 0
      Width = 46
      Height = 26
      BevelOuter = bvLowered
      BorderStyle = bsSingle
      Caption = '0'
      Color = clWhite
      TabOrder = 3
    end
    object Panel_Otimo: TPanel
      Left = 737
      Top = 0
      Width = 46
      Height = 26
      BevelOuter = bvLowered
      BorderStyle = bsSingle
      Caption = '0'
      Color = clWhite
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 728
    Width = 1272
    Height = 222
    Align = alBottom
    TabOrder = 3
    object ToolBar_EditorAndamentoTurma: TToolBar
      Left = 1
      Top = 1
      Width = 1270
      Height = 38
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 30
      ButtonWidth = 31
      Color = 14803425
      EdgeBorders = [ebBottom]
      Images = DM.ImageList_Ensino
      Indent = 10
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      object Label13: TLabel
        Left = 10
        Top = 2
        Width = 180
        Height = 30
        Align = alTop
        Caption = '               COMENT'#193'RIOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object JvDBRichEdit_Parecer: TJvDBRichEdit
      Left = 1
      Top = 39
      Width = 1270
      Height = 182
      DataField = 'PARECER'
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WantTabs = True
    end
  end
  object DST_Cad_ATCO: TDataSource
    DataSet = Form_Classificacao.IBQuery_FichaAvaliacao
    Left = 281
    Top = 270
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 480
  end
  object ColorDialog1: TColorDialog
    Left = 512
  end
end
