object Form_PTS_Novo_Carga: TForm_PTS_Novo_Carga
  Left = 566
  Top = 137
  Width = 1224
  Height = 694
  Caption = 'PTS_Novo_Carga'
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
  object Label1: TLabel
    Left = 64
    Top = 8
    Width = 92
    Height = 24
    Caption = 'PTS-BASE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 64
    Top = 36
    Width = 160
    Height = 24
    Caption = 'PTS-BASE- NOVO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 760
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Processa'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ScrollBox_PTS: TScrollBox
    Left = 0
    Top = 392
    Width = 1216
    Height = 956
    BevelInner = bvNone
    Color = 16577515
    ParentColor = False
    TabOrder = 1
    object Panel_QuaFeira: TPanel
      Left = 0
      Top = 380
      Width = 1212
      Height = 190
      Align = alTop
      Color = 16577515
      TabOrder = 0
      object Panel_4: TPanel
        Left = 1
        Top = 1
        Width = 144
        Height = 188
        Align = alLeft
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label_Quarta: TLabel
          Left = 26
          Top = 59
          Width = 84
          Height = 19
          Caption = 'Quarta Feira'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel5: TPanel
        Left = 145
        Top = 1
        Width = 1066
        Height = 188
        Align = alClient
        Caption = 'Panel8'
        Color = 16577515
        TabOrder = 1
        object Panel_2_4: TPanel
          Left = 1
          Top = 94
          Width = 1064
          Height = 93
          Align = alTop
          Color = 16577515
          TabOrder = 1
          object JvDBRichEdit_Hor_6: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_02_04'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Quarta_2: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_02_04'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_6: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_02_04'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_6: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_02_04'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
        object Panel_1_4: TPanel
          Left = 1
          Top = 1
          Width = 1064
          Height = 93
          Align = alTop
          Color = 16577515
          TabOrder = 0
          object JvDBRichEdit_Hor_5: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_01_04'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Quarta_1: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_01_04'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_5: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_01_04'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_5: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_01_04'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
      end
    end
    object Panel_SexFeira: TPanel
      Left = 0
      Top = 760
      Width = 1212
      Height = 190
      Align = alTop
      Color = 16577515
      TabOrder = 1
      object Panel_6: TPanel
        Left = 1
        Top = 1
        Width = 144
        Height = 188
        Align = alLeft
        Color = clSilver
        TabOrder = 0
        object Label_Sexta: TLabel
          Left = 26
          Top = 59
          Width = 76
          Height = 19
          Caption = 'Sexta Feira'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel14: TPanel
        Left = 145
        Top = 1
        Width = 1066
        Height = 188
        Align = alClient
        Caption = 'Panel8'
        Color = 16577515
        TabOrder = 1
        object Panel_2_6: TPanel
          Left = 1
          Top = 94
          Width = 1064
          Height = 93
          Align = alTop
          Color = 16577515
          TabOrder = 1
          object JvDBRichEdit_Hor_10: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_02_06'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Sexta_2: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_02_06'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_10: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_02_06'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_10: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_02_06'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
        object Panel_1_6: TPanel
          Left = 1
          Top = 1
          Width = 1064
          Height = 93
          Align = alTop
          Color = 16577515
          TabOrder = 0
          object JvDBRichEdit_Hor_9: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_01_06'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Sexta_1: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_01_06'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_9: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_01_06'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_9: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_01_06'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
      end
    end
    object Panel_QuiFeira: TPanel
      Left = 0
      Top = 570
      Width = 1212
      Height = 190
      Align = alTop
      Color = 16577515
      TabOrder = 2
      object Panel_5: TPanel
        Left = 1
        Top = 1
        Width = 144
        Height = 188
        Align = alLeft
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label_Quinta: TLabel
          Left = 26
          Top = 59
          Width = 84
          Height = 19
          Caption = 'Quinta Feira'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel19: TPanel
        Left = 145
        Top = 1
        Width = 1066
        Height = 188
        Align = alClient
        Caption = 'Panel8'
        Color = 16577515
        TabOrder = 1
        object Panel_2_5: TPanel
          Left = 1
          Top = 94
          Width = 1064
          Height = 93
          Align = alTop
          Color = 16577515
          TabOrder = 1
          object JvDBRichEdit_Hor_8: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_02_05'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Quinta_2: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_02_05'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_8: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_02_05'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_8: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_02_05'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
        object Panel_1_5: TPanel
          Left = 1
          Top = 1
          Width = 1064
          Height = 93
          Align = alTop
          Caption = 'Panel9'
          Color = 16577515
          TabOrder = 0
          object JvDBRichEdit_Hor_7: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_01_05'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Quinta_1: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_01_05'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_7: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_01_05'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_7: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_01_05'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
      end
    end
    object Panel_TerFeira: TPanel
      Left = 0
      Top = 190
      Width = 1212
      Height = 190
      Align = alTop
      Color = 16577515
      TabOrder = 3
      object Panel24: TPanel
        Left = 145
        Top = 1
        Width = 1066
        Height = 188
        Align = alClient
        Caption = 'Panel8'
        Color = 16577515
        TabOrder = 0
        object Panel_2_3: TPanel
          Left = 1
          Top = 93
          Width = 1064
          Height = 93
          Align = alTop
          Color = 16577515
          TabOrder = 1
          object JvDBRichEdit_Hor_4: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_02_03'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Terca_2: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_02_03'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_4: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_02_03'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_4: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_02_03'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
        object Panel_1_3: TPanel
          Left = 1
          Top = 1
          Width = 1064
          Height = 92
          Align = alTop
          Color = 16577515
          TabOrder = 0
          object JvDBRichEdit_Hor_3: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 90
            DataField = 'HORARIO_01_03'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Terca_1: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 90
            DataField = 'TRAB_ESCOLAR_01_03'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_3: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 90
            DataField = 'EQUIPE_01_03'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_3: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 90
            DataField = 'LOCAL_01_03'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
      end
      object Panel_3: TPanel
        Left = 1
        Top = 1
        Width = 144
        Height = 188
        Align = alLeft
        Color = clSilver
        TabOrder = 1
        object Label_Terca: TLabel
          Left = 26
          Top = 59
          Width = 76
          Height = 19
          Caption = 'Ter'#231'a Feira'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object Panel_SegFeira: TPanel
      Left = 0
      Top = 0
      Width = 1212
      Height = 190
      Align = alTop
      Color = 16577515
      TabOrder = 4
      object Panel_22: TPanel
        Left = 145
        Top = 1
        Width = 1066
        Height = 188
        Align = alClient
        Caption = 'Panel_22'
        Color = 16577515
        TabOrder = 0
        object Panel_2_2: TPanel
          Left = 1
          Top = 94
          Width = 1064
          Height = 93
          Align = alTop
          Caption = 'Panel_2_2'
          Color = 16577515
          TabOrder = 1
          object JvDBRichEdit_Hor_2: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_02_02'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
          object JvDBRichEdit_Segunda_2: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_02_02'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Doc_2: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_02_02'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Loc_2: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_02_02'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
        end
        object Panel_1_2: TPanel
          Left = 1
          Top = 1
          Width = 1064
          Height = 93
          Align = alTop
          Caption = 'Panel9'
          Color = 16577515
          TabOrder = 0
          object JvDBRichEdit_Loc_1: TJvDBRichEdit
            Left = 896
            Top = 1
            Width = 174
            Height = 91
            DataField = 'LOCAL_01_02'
            DataSource = DST_PTS
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 3
          end
          object JvDBRichEdit_Doc_1: TJvDBRichEdit
            Left = 685
            Top = 1
            Width = 211
            Height = 91
            DataField = 'EQUIPE_01_02'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 2
          end
          object JvDBRichEdit_Segunda_1: TJvDBRichEdit
            Left = 122
            Top = 1
            Width = 563
            Height = 91
            DataField = 'TRAB_ESCOLAR_01_02'
            DataSource = DST_PTS
            Align = alLeft
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 1
          end
          object JvDBRichEdit_Hor_1: TJvDBRichEdit
            Left = 1
            Top = 1
            Width = 121
            Height = 91
            DataField = 'HORARIO_01_02'
            DataSource = DST_PTS
            Align = alLeft
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            PlainText = True
            TabOrder = 0
          end
        end
      end
      object Panel_2: TPanel
        Left = 1
        Top = 1
        Width = 144
        Height = 188
        Align = alLeft
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label_Segunda: TLabel
          Left = 26
          Top = 59
          Width = 95
          Height = 19
          Caption = 'Segunda Feira'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 176
    Top = 8
    Width = 240
    Height = 25
    DataSource = DST_PTS_Base_Principal
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 360
    Width = 1153
    Height = 97
    DataSource = DST_PTS_base_Semana
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 64
    Width = 465
    Height = 89
    DataSource = DST_PTS_Base_Principal
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCURSO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPONSAVEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATUALIZACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSG'
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 160
    Width = 529
    Height = 177
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCURSO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCURSO'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 544
    Top = 9
    Width = 105
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Button2: TButton
    Left = 672
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 7
    OnClick = Button2Click
  end
  object DBGrid4: TDBGrid
    Left = 600
    Top = 64
    Width = 529
    Height = 289
    DataSource = DST_PTS
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCURSO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEMANA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATUALIZACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSG'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA_SEMANA_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_01_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_02_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_01_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_02_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_01_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_02_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_01_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_02_02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA_SEMANA_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_01_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_02_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_01_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_02_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_01_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_02_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_01_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_02_03'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA_SEMANA_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_01_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_02_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_01_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_02_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_01_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_02_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_01_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_02_04'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA_SEMANA_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_01_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_02_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_01_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_02_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_01_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_02_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_01_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_02_05'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA_SEMANA_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_01_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_02_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_01_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAB_ESCOLAR_02_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_01_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQUIPE_02_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_01_06'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL_02_06'
        Visible = True
      end>
  end
  object Button3: TButton
    Left = 848
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 440
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Carga Geral'
    TabOrder = 10
    OnClick = Button4Click
  end
  object IBTable_PTS_base_Principal: TIBTable
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
        Name = 'RESPONSAVEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ATUALIZACAO'
        DataType = ftDateTime
      end
      item
        Name = 'ANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'MSG'
        DataType = ftString
        Size = 400
      end
      item
        Name = 'ARQUIVO_QUADRO_PERFIL'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'PK_PTS_BASE_PRINCIPAL'
        Fields = 'IDCURSO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_PTS_BASE_PRINCIPAL'
        Fields = 'IDCURSO'
      end>
    StoreDefs = True
    TableName = 'PTS_BASE_PRINCIPAL'
    Left = 635
    Top = 242
    object IBTable_PTS_base_PrincipalIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Required = True
    end
    object IBTable_PTS_base_PrincipalRESPONSAVEL: TIBStringField
      FieldName = 'RESPONSAVEL'
      Size = 15
    end
    object IBTable_PTS_base_PrincipalATUALIZACAO: TDateTimeField
      FieldName = 'ATUALIZACAO'
    end
    object IBTable_PTS_base_PrincipalANO: TIBStringField
      FieldName = 'ANO'
      Size = 4
    end
    object IBTable_PTS_base_PrincipalMSG: TIBStringField
      FieldName = 'MSG'
      Size = 400
    end
    object IBTable_PTS_base_PrincipalARQUIVO_QUADRO_PERFIL: TIBStringField
      FieldName = 'ARQUIVO_QUADRO_PERFIL'
      Size = 200
    end
  end
  object DST_PTS_Base_Principal: TDataSource
    DataSet = IBTable_PTS_base_Principal
    Left = 634
    Top = 270
  end
  object IBTable_PTS_base: TIBTable
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
        Name = 'SEMANA'
        DataType = ftSmallint
      end
      item
        Name = 'DATA_02'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DIA_SEMANA_02'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'HORARIO_01_02'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'HORARIO_02_02'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'TRAB_ESCOLAR_01_02'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'TRAB_ESCOLAR_02_02'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'EQUIPE_01_02'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EQUIPE_02_02'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_01_02'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_02_02'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATA_03'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DIA_SEMANA_03'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'HORARIO_01_03'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'HORARIO_02_03'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'TRAB_ESCOLAR_01_03'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'TRAB_ESCOLAR_02_03'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'EQUIPE_01_03'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EQUIPE_02_03'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_01_03'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_02_03'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATA_04'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DIA_SEMANA_04'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'HORARIO_01_04'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'HORARIO_02_04'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'TRAB_ESCOLAR_01_04'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'TRAB_ESCOLAR_02_04'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'EQUIPE_01_04'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EQUIPE_02_04'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_01_04'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_02_04'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATA_05'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DIA_SEMANA_05'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'HORARIO_01_05'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'HORARIO_02_05'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'TRAB_ESCOLAR_01_05'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'TRAB_ESCOLAR_02_05'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'EQUIPE_01_05'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EQUIPE_02_05'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_01_05'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_02_05'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATA_06'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DIA_SEMANA_06'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'HORARIO_01_06'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'HORARIO_02_06'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'TRAB_ESCOLAR_01_06'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'TRAB_ESCOLAR_02_06'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'EQUIPE_01_06'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EQUIPE_02_06'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_01_06'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCAL_02_06'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ATUALIZACAO'
        DataType = ftDateTime
      end
      item
        Name = 'ANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'MSG'
        DataType = ftString
        Size = 400
      end>
    StoreDefs = True
    TableName = 'PTS_BASE'
    Left = 547
    Top = 154
    object IBTable_PTS_baseIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_PTS_baseSEMANA: TSmallintField
      FieldName = 'SEMANA'
    end
    object IBTable_PTS_baseDATA_02: TIBStringField
      FieldName = 'DATA_02'
      Size = 8
    end
    object IBTable_PTS_baseDIA_SEMANA_02: TIBStringField
      FieldName = 'DIA_SEMANA_02'
      Size = 10
    end
    object IBTable_PTS_baseHORARIO_01_02: TIBStringField
      FieldName = 'HORARIO_01_02'
      Size = 70
    end
    object IBTable_PTS_baseHORARIO_02_02: TIBStringField
      FieldName = 'HORARIO_02_02'
      Size = 70
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_01_02: TIBStringField
      FieldName = 'TRAB_ESCOLAR_01_02'
      Size = 300
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_02_02: TIBStringField
      FieldName = 'TRAB_ESCOLAR_02_02'
      Size = 300
    end
    object IBTable_PTS_baseEQUIPE_01_02: TIBStringField
      FieldName = 'EQUIPE_01_02'
      Size = 60
    end
    object IBTable_PTS_baseEQUIPE_02_02: TIBStringField
      FieldName = 'EQUIPE_02_02'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_01_02: TIBStringField
      FieldName = 'LOCAL_01_02'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_02_02: TIBStringField
      FieldName = 'LOCAL_02_02'
      Size = 60
    end
    object IBTable_PTS_baseDATA_03: TIBStringField
      FieldName = 'DATA_03'
      Size = 8
    end
    object IBTable_PTS_baseDIA_SEMANA_03: TIBStringField
      FieldName = 'DIA_SEMANA_03'
      Size = 10
    end
    object IBTable_PTS_baseHORARIO_01_03: TIBStringField
      FieldName = 'HORARIO_01_03'
      Size = 70
    end
    object IBTable_PTS_baseHORARIO_02_03: TIBStringField
      FieldName = 'HORARIO_02_03'
      Size = 70
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_01_03: TIBStringField
      FieldName = 'TRAB_ESCOLAR_01_03'
      Size = 300
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_02_03: TIBStringField
      FieldName = 'TRAB_ESCOLAR_02_03'
      Size = 300
    end
    object IBTable_PTS_baseEQUIPE_01_03: TIBStringField
      FieldName = 'EQUIPE_01_03'
      Size = 60
    end
    object IBTable_PTS_baseEQUIPE_02_03: TIBStringField
      FieldName = 'EQUIPE_02_03'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_01_03: TIBStringField
      FieldName = 'LOCAL_01_03'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_02_03: TIBStringField
      FieldName = 'LOCAL_02_03'
      Size = 60
    end
    object IBTable_PTS_baseDATA_04: TIBStringField
      FieldName = 'DATA_04'
      Size = 8
    end
    object IBTable_PTS_baseDIA_SEMANA_04: TIBStringField
      FieldName = 'DIA_SEMANA_04'
      Size = 10
    end
    object IBTable_PTS_baseHORARIO_01_04: TIBStringField
      FieldName = 'HORARIO_01_04'
      Size = 70
    end
    object IBTable_PTS_baseHORARIO_02_04: TIBStringField
      FieldName = 'HORARIO_02_04'
      Size = 70
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_01_04: TIBStringField
      FieldName = 'TRAB_ESCOLAR_01_04'
      Size = 300
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_02_04: TIBStringField
      FieldName = 'TRAB_ESCOLAR_02_04'
      Size = 300
    end
    object IBTable_PTS_baseEQUIPE_01_04: TIBStringField
      FieldName = 'EQUIPE_01_04'
      Size = 60
    end
    object IBTable_PTS_baseEQUIPE_02_04: TIBStringField
      FieldName = 'EQUIPE_02_04'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_01_04: TIBStringField
      FieldName = 'LOCAL_01_04'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_02_04: TIBStringField
      FieldName = 'LOCAL_02_04'
      Size = 60
    end
    object IBTable_PTS_baseDATA_05: TIBStringField
      FieldName = 'DATA_05'
      Size = 8
    end
    object IBTable_PTS_baseDIA_SEMANA_05: TIBStringField
      FieldName = 'DIA_SEMANA_05'
      Size = 10
    end
    object IBTable_PTS_baseHORARIO_01_05: TIBStringField
      FieldName = 'HORARIO_01_05'
      Size = 70
    end
    object IBTable_PTS_baseHORARIO_02_05: TIBStringField
      FieldName = 'HORARIO_02_05'
      Size = 70
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_01_05: TIBStringField
      FieldName = 'TRAB_ESCOLAR_01_05'
      Size = 300
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_02_05: TIBStringField
      FieldName = 'TRAB_ESCOLAR_02_05'
      Size = 300
    end
    object IBTable_PTS_baseEQUIPE_01_05: TIBStringField
      FieldName = 'EQUIPE_01_05'
      Size = 60
    end
    object IBTable_PTS_baseEQUIPE_02_05: TIBStringField
      FieldName = 'EQUIPE_02_05'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_01_05: TIBStringField
      FieldName = 'LOCAL_01_05'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_02_05: TIBStringField
      FieldName = 'LOCAL_02_05'
      Size = 60
    end
    object IBTable_PTS_baseDATA_06: TIBStringField
      FieldName = 'DATA_06'
      Size = 8
    end
    object IBTable_PTS_baseDIA_SEMANA_06: TIBStringField
      FieldName = 'DIA_SEMANA_06'
      Size = 10
    end
    object IBTable_PTS_baseHORARIO_01_06: TIBStringField
      FieldName = 'HORARIO_01_06'
      Size = 70
    end
    object IBTable_PTS_baseHORARIO_02_06: TIBStringField
      FieldName = 'HORARIO_02_06'
      Size = 70
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_01_06: TIBStringField
      FieldName = 'TRAB_ESCOLAR_01_06'
      Size = 300
    end
    object IBTable_PTS_baseTRAB_ESCOLAR_02_06: TIBStringField
      FieldName = 'TRAB_ESCOLAR_02_06'
      Size = 300
    end
    object IBTable_PTS_baseEQUIPE_01_06: TIBStringField
      FieldName = 'EQUIPE_01_06'
      Size = 60
    end
    object IBTable_PTS_baseEQUIPE_02_06: TIBStringField
      FieldName = 'EQUIPE_02_06'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_01_06: TIBStringField
      FieldName = 'LOCAL_01_06'
      Size = 60
    end
    object IBTable_PTS_baseLOCAL_02_06: TIBStringField
      FieldName = 'LOCAL_02_06'
      Size = 60
    end
    object IBTable_PTS_baseATUALIZACAO: TDateTimeField
      FieldName = 'ATUALIZACAO'
    end
    object IBTable_PTS_baseANO: TIBStringField
      FieldName = 'ANO'
      Size = 4
    end
    object IBTable_PTS_baseMSG: TIBStringField
      FieldName = 'MSG'
      Size = 400
    end
  end
  object DST_PTS: TDataSource
    DataSet = IBTable_PTS_base
    Left = 546
    Top = 182
  end
  object IBTable_PTS_base_Semana: TIBTable
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
        Name = 'IDSEMANA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DIA_SEMANA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'HORARIO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'TRAB_ESCOLAR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DISCIPLINA'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'QTD_INSTRUTOR'
        DataType = ftInteger
      end
      item
        Name = 'ESPECIALIDADE'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'FK_PTS_BASE_SEMANA'
        Fields = 'IDCURSO'
      end
      item
        Name = 'PK_PTS_BASE_SEMANA'
        Fields = 'IDCURSO;IDSEMANA;DIA_SEMANA;HORARIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDCURSO'
    MasterFields = 'IDCURSO'
    MasterSource = DST_PTS_Base_Principal
    StoreDefs = True
    TableName = 'PTS_BASE_SEMANA'
    Left = 691
    Top = 442
  end
  object DST_PTS_base_Semana: TDataSource
    DataSet = IBTable_PTS_base_Semana
    Left = 690
    Top = 470
  end
  object DataSource1: TDataSource
    DataSet = IBQuery_PTS_base
    Left = 314
    Top = 190
  end
  object IBQuery_PTS_base: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = DST_PTS_Base_Principal
    SQL.Strings = (
      'select distinct idcurso, codcurso'
      'from PTS_Base p, curso c'
      'where p.idcurso = c.idcurso'
      'and   p.idcurso not in (select idcurso from pts_base_principal)'
      'order by idcurso'
      '')
    Left = 315
    Top = 154
    object IBQuery_PTS_baseIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'CURSO.IDCURSO'
      Required = True
    end
    object IBQuery_PTS_baseCODCURSO: TIBStringField
      FieldName = 'CODCURSO'
      Origin = 'CURSO.CODCURSO'
      Required = True
      Size = 10
    end
  end
end
