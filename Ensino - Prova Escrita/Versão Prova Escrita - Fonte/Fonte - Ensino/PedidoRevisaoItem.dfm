object Form_PedidoRevisaoItem: TForm_PedidoRevisaoItem
  Left = 131
  Top = 105
  Width = 1300
  Height = 784
  Caption = 'Ensino --> Pedido de Revis'#227'o de Item'
  Color = 16577515
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_TratarProva: TPanel
    Left = 0
    Top = 110
    Width = 1284
    Height = 636
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16381397
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object JvDBRichEdit_MontaItem: TJvDBRichEdit
      Left = 1076
      Top = 364
      Width = 847
      Height = 226
      DataField = 'DESCENALT'
      DataSource = DSQ_PedidoRevisaoItem
      Color = clSilver
      TabOrder = 0
      Visible = False
    end
    object Panel_EditorProva: TPanel
      Left = 0
      Top = 0
      Width = 1282
      Height = 634
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 1
      object Panel_Ferramenta: TPanel
        Left = 1
        Top = 1
        Width = 222
        Height = 630
        Align = alLeft
        TabOrder = 0
        object Panel_TrataRespostaItens: TPanel
          Left = 1
          Top = 1
          Width = 220
          Height = 628
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 0
          object Panel_TrataQuestoes: TPanel
            Left = 0
            Top = 0
            Width = 218
            Height = 626
            Align = alClient
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
            object Panel_Itens: TPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 624
              Align = alClient
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 216
                Height = 92
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
                TabOrder = 0
                object Shape15: TShape
                  Left = -498
                  Top = -110
                  Width = 629
                  Height = 103
                  Brush.Color = 15722132
                  Pen.Color = 15722132
                end
                object JvGradient1: TJvGradient
                  Left = 0
                  Top = 0
                  Width = 216
                  Height = 92
                  Align = alClient
                  StartColor = 15722132
                  EndColor = 12615680
                  Steps = 133
                end
                object Label1: TLabel
                  Left = 3
                  Top = 76
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
                object Panel_EstatisticaItem: TPanel
                  Left = 5
                  Top = 2
                  Width = 161
                  Height = 65
                  BorderStyle = bsSingle
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object Shape13: TShape
                    Left = 1
                    Top = 1
                    Width = 157
                    Height = 21
                    Align = alTop
                    Brush.Color = clSkyBlue
                    Pen.Width = 0
                  end
                  object Label16: TLabel
                    Left = 41
                    Top = 3
                    Width = 72
                    Height = 15
                    Alignment = taCenter
                    Caption = 'ESTATISTICA'
                    Color = clSkyBlue
                    ParentColor = False
                  end
                  object DBGrid_Lista: TStringGrid
                    Left = 1
                    Top = 22
                    Width = 157
                    Height = 40
                    Align = alTop
                    Color = clInfoBk
                    Ctl3D = False
                    DefaultColWidth = 50
                    DefaultRowHeight = 18
                    FixedColor = clSkyBlue
                    FixedCols = 0
                    RowCount = 2
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentCtl3D = False
                    ParentFont = False
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ColWidths = (
                      26
                      28
                      27
                      30
                      38)
                    RowHeights = (
                      18
                      18)
                  end
                end
              end
              object DBGrid_Resultado: TDBGrid
                Left = 0
                Top = 92
                Width = 216
                Height = 532
                Align = alClient
                DataSource = DSQ_PedidoRevisaoItem
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
                ParentFont = False
                TabOrder = 1
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -21
                TitleFont.Name = 'Arial Narrow'
                TitleFont.Style = []
                OnCellClick = DBGrid_ResultadoCellClick
                OnDrawColumnCell = DBGrid_ResultadoDrawColumnCell
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'NUMEROQUESTAO'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = 'N Quest'#227'o'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -12
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Width = 63
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'RESPGABARITO'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = 'Resp Gab.'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -12
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Width = 65
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'RESPALUNO'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = 'Resp Aluno'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -12
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      object Panel_Prova: TPanel
        Left = 223
        Top = 1
        Width = 1056
        Height = 630
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Shape14: TShape
          Left = 0
          Top = 0
          Width = 1056
          Height = 10
          Align = alTop
          Pen.Color = clWhite
        end
        object Editor_Prova: TPsyRichEdit
          Left = 0
          Top = 10
          Width = 1056
          Height = 176
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Courier New'
          Font.Style = []
          HideScrollBars = False
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          WantTabs = True
        end
        object Panel_PedidoRevisao: TPanel
          Left = 0
          Top = 186
          Width = 1056
          Height = 444
          Align = alBottom
          TabOrder = 1
          object PageControl_ArgumentacaoChefeEAVA: TPageControl
            Left = 1
            Top = 1
            Width = 1054
            Height = 442
            ActivePage = TabSheet_ParecerChefeEAVA
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial Narrow'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TabSheet_ArgumentacaoAluno: TTabSheet
              Caption = 'Argumenta'#231#227'o Aluno:'
              object JvDBRichEdit_ParecerAluno: TJvDBRichEdit
                Left = 0
                Top = 0
                Width = 777
                Height = 407
                DataField = 'ARGUMENTACAO_ALUNO'
                DataSource = DST_PedidoRevisaoItem
                Align = alLeft
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Courier New'
                Font.Style = []
                MaxLength = 1500
                ParentCtl3D = False
                ParentFont = False
                PlainText = True
                ReadOnly = True
                TabOrder = 0
              end
              object Panel_Providencia: TPanel
                Left = 777
                Top = 0
                Width = 269
                Height = 407
                Align = alClient
                BorderStyle = bsSingle
                Color = 14803425
                TabOrder = 1
                object Panel3: TPanel
                  Left = 1
                  Top = 1
                  Width = 265
                  Height = 70
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Color = clWhite
                  TabOrder = 0
                  object Label2: TLabel
                    Left = 11
                    Top = 8
                    Width = 250
                    Height = 16
                    Caption = 'Solicito-vos que em rela'#231#227'o ao item'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label4: TLabel
                    Left = 12
                    Top = 25
                    Width = 253
                    Height = 16
                    Caption = 'selecionado seja tomado a seguinte'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label5: TLabel
                    Left = 15
                    Top = 41
                    Width = 87
                    Height = 16
                    Caption = 'provid'#234'ncia:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object CheckBox_AnularQuestaoAl: TCheckBox
                  Left = 16
                  Top = 93
                  Width = 161
                  Height = 17
                  Caption = 'Anular a quest'#227'o'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox_ModificarGabaritoAl: TCheckBox
                  Left = 16
                  Top = 128
                  Width = 289
                  Height = 17
                  Caption = 'Modificar gabarito para alternativa'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object CheckBox_AlternativaCorretaAl: TCheckBox
                  Left = 16
                  Top = 192
                  Width = 281
                  Height = 17
                  Caption = 'Considera como correta a(s) alternativa(s)'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object ToolBar_ModificarGabaritoAl: TToolBar
                  Left = 48
                  Top = 145
                  Width = 113
                  Height = 27
                  Align = alNone
                  ButtonHeight = 24
                  ButtonWidth = 27
                  Color = 16777202
                  DockSite = True
                  EdgeBorders = [ebLeft, ebRight, ebBottom]
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  Indent = 2
                  List = True
                  ParentColor = False
                  ParentFont = False
                  ShowCaptions = True
                  TabOrder = 4
                  object ToolButton_AlMA: TToolButton
                    Left = 2
                    Top = 2
                    Hint = 'Seleciona a alternativa "A"'
                    Caption = 'A '
                    ImageIndex = 34
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object ToolButton_AlMB: TToolButton
                    Left = 29
                    Top = 2
                    Hint = 'Seleciona a alternativa "B"'
                    Caption = 'B '
                    ImageIndex = 35
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object ToolButton_AlMC: TToolButton
                    Left = 56
                    Top = 2
                    Hint = 'Seleciona a alternativa "C"'
                    Caption = 'C '
                    ImageIndex = 8
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object ToolButton_AlMD: TToolButton
                    Left = 83
                    Top = 2
                    Hint = 'Seleciona a alternativa "D"'
                    Caption = 'D '
                    ImageIndex = 70
                    ParentShowHint = False
                    ShowHint = True
                  end
                end
                object ToolBar_AlternativaCorretaAl: TToolBar
                  Left = 48
                  Top = 210
                  Width = 113
                  Height = 27
                  Align = alNone
                  ButtonHeight = 24
                  ButtonWidth = 27
                  Color = 16777202
                  DockSite = True
                  EdgeBorders = [ebLeft, ebRight, ebBottom]
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  Indent = 2
                  List = True
                  ParentColor = False
                  ParentFont = False
                  ShowCaptions = True
                  TabOrder = 5
                  object ToolButton_AlCA: TToolButton
                    Left = 2
                    Top = 2
                    Hint = 'Seleciona a alternativa "A"'
                    Caption = 'A '
                    ImageIndex = 34
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object ToolButton_AlCB: TToolButton
                    Left = 29
                    Top = 2
                    Hint = 'Seleciona a alternativa "B"'
                    Caption = 'B '
                    ImageIndex = 35
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object ToolButton_AlCC: TToolButton
                    Left = 56
                    Top = 2
                    Hint = 'Seleciona a alternativa "C"'
                    Caption = 'C '
                    ImageIndex = 8
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object ToolButton_AlCD: TToolButton
                    Left = 83
                    Top = 2
                    Hint = 'Seleciona a alternativa "D"'
                    Caption = 'D '
                    ImageIndex = 70
                    ParentShowHint = False
                    ShowHint = True
                  end
                end
              end
            end
            object TabSheet1: TTabSheet
              Caption = 'Parecer do Docente'
              ImageIndex = 2
              object Panel4: TPanel
                Left = 777
                Top = 0
                Width = 269
                Height = 407
                Align = alClient
                BorderStyle = bsSingle
                Color = 14803425
                TabOrder = 0
                object Panel7: TPanel
                  Left = 1
                  Top = 1
                  Width = 265
                  Height = 59
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Color = clWhite
                  TabOrder = 0
                  object Label3: TLabel
                    Left = 11
                    Top = 4
                    Width = 250
                    Height = 16
                    Caption = 'Solicito-vos que em rela'#231#227'o ao item'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label6: TLabel
                    Left = 12
                    Top = 21
                    Width = 253
                    Height = 16
                    Caption = 'selecionado seja tomado a seguinte'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label7: TLabel
                    Left = 15
                    Top = 37
                    Width = 87
                    Height = 16
                    Caption = 'provid'#234'ncia:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object CheckBox_AnularQuestaoDo: TCheckBox
                  Left = 16
                  Top = 68
                  Width = 161
                  Height = 17
                  Caption = 'Anular a quest'#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = CheckBox_AnularQuestaoDoClick
                end
                object CheckBox_ModificarGabaritoDo: TCheckBox
                  Left = 16
                  Top = 106
                  Width = 289
                  Height = 17
                  Caption = 'Modificar gabarito para alternativa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnClick = CheckBox_ModificarGabaritoDoClick
                end
                object CheckBox_AlternativaCorretaDo: TCheckBox
                  Left = 16
                  Top = 154
                  Width = 281
                  Height = 17
                  Caption = 'Considera como correta a(s) alternativa(s)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox_AlternativaCorretaDoClick
                end
                object ToolBar_ModificarGabaritoDo: TToolBar
                  Left = 48
                  Top = 123
                  Width = 113
                  Height = 27
                  Align = alNone
                  ButtonHeight = 24
                  ButtonWidth = 27
                  Color = 14803425
                  DockSite = True
                  EdgeBorders = [ebLeft, ebRight, ebBottom]
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  Indent = 2
                  List = True
                  ParentColor = False
                  ParentFont = False
                  ShowCaptions = True
                  TabOrder = 4
                  object ToolButton_DoMA: TToolButton
                    Left = 2
                    Top = 2
                    Hint = 'Seleciona a alternativa "A"'
                    Caption = 'A '
                    ImageIndex = 34
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoMAClick
                  end
                  object ToolButton_DoMB: TToolButton
                    Left = 29
                    Top = 2
                    Hint = 'Seleciona a alternativa "B"'
                    Caption = 'B '
                    ImageIndex = 35
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoMBClick
                  end
                  object ToolButton_DoMC: TToolButton
                    Left = 56
                    Top = 2
                    Hint = 'Seleciona a alternativa "C"'
                    Caption = 'C '
                    ImageIndex = 8
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoMCClick
                  end
                  object ToolButton_DoMD: TToolButton
                    Left = 83
                    Top = 2
                    Hint = 'Seleciona a alternativa "D"'
                    Caption = 'D '
                    ImageIndex = 70
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoMDClick
                  end
                end
                object ToolBar_AlternativaCorretaDo: TToolBar
                  Left = 48
                  Top = 172
                  Width = 113
                  Height = 27
                  Align = alNone
                  ButtonHeight = 24
                  ButtonWidth = 27
                  Color = 14803425
                  DockSite = True
                  EdgeBorders = [ebLeft, ebRight, ebBottom]
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  Indent = 2
                  List = True
                  ParentColor = False
                  ParentFont = False
                  ShowCaptions = True
                  TabOrder = 5
                  object ToolButton_DoCA: TToolButton
                    Left = 2
                    Top = 2
                    Hint = 'Seleciona a alternativa "A"'
                    Caption = 'A '
                    ImageIndex = 34
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoCAClick
                  end
                  object ToolButton_DoCB: TToolButton
                    Left = 29
                    Top = 2
                    Hint = 'Seleciona a alternativa "B"'
                    Caption = 'B '
                    ImageIndex = 35
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoCBClick
                  end
                  object ToolButton_DoCC: TToolButton
                    Left = 56
                    Top = 2
                    Hint = 'Seleciona a alternativa "C"'
                    Caption = 'C '
                    ImageIndex = 8
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoCCClick
                  end
                  object ToolButton_DoCD: TToolButton
                    Left = 83
                    Top = 2
                    Hint = 'Seleciona a alternativa "D"'
                    Caption = 'D '
                    ImageIndex = 70
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_DoCDClick
                  end
                end
                object Panel8: TPanel
                  Left = 15
                  Top = 205
                  Width = 228
                  Height = 62
                  BevelOuter = bvNone
                  TabOrder = 6
                  object JvShape5: TJvShape
                    Left = 1
                    Top = 4
                    Width = 218
                    Height = 50
                    Brush.Color = 16378331
                    Pen.Color = 33023
                  end
                  object JvTransparentButton_GravaParecerDocente: TJvTransparentButton
                    Left = 3
                    Top = 5
                    Width = 215
                    Height = 48
                    Hint = 'Grava o paracer do Docente'
                    BorderWidth = 0
                    Caption = 'Grava Parecer Docente'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Arial'
                    Font.Style = []
                    FrameStyle = fsDark
                    Glyph.Data = {
                      52060000424D5206000000000000360000002800000016000000170000000100
                      1800000000001C06000000000000000000000000000000000000A47C63B88665
                      B08568AD886ABD885BB8875FA77C629C70629D726A9C7169A07164A3715E9E7A
                      5CAE8764BD8E64C58E5FC9905EC6915FC29061BB9067B49067E8CFAA00007A3D
                      0D94460A90480985490B6941005951156969418B7B6B9B8E8692988C8E8A788C
                      6E577B5B3467390D7530009E450CB2500EAF5008A95202A257088D4603AE713A
                      0000904B13A854129E520E8E5418987E56A3AC87B4D3B2AFD2BDA0C6BCA2C8C9
                      A9B8C7B6ADBCBEB5ABCAB7A6AB866E814926954D1EAB591EB45D15B25E12AB56
                      09B064290000814111914B177E491AAD8B6BBCA29AB3AB98B1D3AA73C08B509D
                      7490B5AEA5A6C49C93BEACADB7C3C7C9DCDFDDC4BEB2755E436B3A119E541FA5
                      54169F4E08AC642E0000703C146C3A16967B66ADA8A0A2A096ADBB9874BA6F40
                      C35E53D47761A87698AEAF98A0B6B9B4B6C9CDC9C6D4D1D8E5DDD4D2BF8B6D4B
                      773C0D994F1A8C490C97602F00005E320B875F3FC7BCB09BA3A5AEB1A08CB382
                      50B45C40D16040D0635CC07479A584A8B1A8C5C1B5D5D4CCCDD1D0C0C3C5C4BE
                      BAD4BDAC88604068360A7C450886602A00005F3108AD886CBDB7ABB9C9C49DB0
                      985A9E6C49C27337C46633C3634CC77A5AA06F9BAD94CDD0C7D3D6D6C8C6CFBA
                      B0BFAEA4B0B8AFB0BEB2A76A51376B3C008661240000763B1AB39C95A4A9A590
                      C3A053AD6B54B56F46B46834B65D2CB75839B85F54BA7460A277C6D4D2C9CED2
                      C1B9BDB4A1A5AAA9A89DB5ADB6C6BEA4978A673C05985E200000854E2EBCB4AC
                      8DA7994B99633DB75E4CB4644FA4613F9E5946AE5F52BB664CBB6848B26E83B2
                      9BB7C2B9AFA6A3B0A7A8ADB0B0B3BBB9C0C4C2D0CEC57F5C3092592400008B61
                      3E9BA6915183644CAF6932B0513FA858538F59728B5E6C8E5564AF633FB15542
                      BF654EA56C81A280AEB1A3A4AAABB0B3BBCBBBC4D2C6CCCDD4CEA38B6B89572D
                      000078552F738B6B5FA17445AF6543AB5E378E4D6F8A5AA47A5196703B6D9145
                      51B05A39AA534AB662589D619BBA9DB1BDB9BCB8C3D0BDCBCFC4CBCDD3D2BFB1
                      9D8357370000734D1F8DA0785A946659B678408C607BA17CAEA077A56734C781
                      4190742D759C574DA45F3EA74D4EB36560A375B0C4B4C3BDC0C3C1C8C7C5CBD2
                      CFD4CFC5BA8B644A000072400BB8B68C8BA78647845F6D9D8DE2D9CCBD95778E
                      642DBD7D3ABF6F328B72406099624BA45240AF5E49A86B7AA582C1CDBEB1BFBA
                      B8BDBFB7B1B9C0B7AD946F570000803E01998057C8C2B392A59ABFCBC5C9C3BB
                      BCA895805D38B37340C1733C9A6C3A6C7C475CA45E45A65D45AD6850A26987B3
                      8FB7C7B6ACAEAD9DA0A7ADA69B97705500009448077C5027CAABA4D6C4C7CFBF
                      BAA6B7ADA1AFA5B792849B5A3EA5794BB595608976434F885163B07242A45D40
                      AD654D995F95AB8DB9BAB49CA5AAAA9E8E9068490000974C17824A15987049E6
                      C3B1BAB2B29EA5A7A4AFB0D3D5D2B4AEA4918775A69179C7B69DABC8AF649672
                      5CA87044AB5F40A7584C925C8AA795ADA9AAB78F6C875B30000091441092551A
                      764715B18767BBB0A8A9A7A7C6CACEC3CFD6A4B2B7A7AFAEC7CAC2DFE1D4E7EE
                      E1AAC0AC60956E53AA6C39A55A3F9E5D44835F94A8959C6E3F8E5B2900009646
                      0F9753148B531B814C21A88D6FE1D1C1DCD5D5B9BDCA96A5B698AFB9B4D3D2CF
                      E7DFE6E0D8EBEBE294B29E569A7149A96C35975244965B5E88597E4D159F6831
                      000094410A974E0B8C4D0F8F4F1A7E4F17B79168F0D4C5C4B8BE9AA0ADA2B7C2
                      B7DBD9CEF1E6E5E8DEDEDFDAD7E8E184AF975D9F6E65AA675B974E4964207F46
                      08A06429000094420D974D0A904E10964E149B590F85480B9B6945BB9789BFAD
                      A9D1D1CBE0F0E0E7FBE7DAEED8DAE7D9DEE5DDE1EEDA96AB828191555D5E1767
                      52108A490C985D2400008C3C0D91490C8A48109249139C50079A53108F4C1B7F
                      47248E6046B6957CE5CFB4EFEACBE0EAC7D9D8BFDAC8B8B79F88856B44694914
                      7E4B128C4E1A813F09955E2700008D3F13924A138B4A17924A1C964B129A5014
                      974E16914B178845177F3F177D3F1D7E49277E5C2E7E502A8244277B38167F42
                      14884A168A411290421D8242118C582600006C2C11773C15713B15773A19783D
                      19743A127338117639127B3B127B38177933177630166E3111752E108130157D
                      2F167533146A300F6B2C136C2D1C5A260DB0855F0000}
                    ParentFont = False
                    ParentShowHint = False
                    ShowHint = True
                    TextAlign = ttaBottom
                    OnClick = JvTransparentButton_GravarSolicitacaoClick
                  end
                end
                object CheckBox_ManterGabaritoDo: TCheckBox
                  Left = 16
                  Top = 87
                  Width = 137
                  Height = 17
                  Caption = 'Manter Gabarito'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                  OnClick = CheckBox_ManterGabaritoChClick
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 0
                Width = 777
                Height = 407
                Align = alLeft
                TabOrder = 1
                object Panel12: TPanel
                  Left = 1
                  Top = 1
                  Width = 775
                  Height = 55
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Color = 15395583
                  TabOrder = 0
                  object Label13: TLabel
                    Left = 11
                    Top = 4
                    Width = 711
                    Height = 16
                    Caption = 
                      'Argumenta'#231#227'o do Docente: ( Fundamentar em documenta'#231#227'o escrita, ' +
                      'expor de modo claro e completo)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label10: TLabel
                    Left = 11
                    Top = 30
                    Width = 156
                    Height = 16
                    Caption = 'Instrutor Respons'#225'vel:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object JvTransparentButton_SelDocente: TJvTransparentButton
                    Left = 547
                    Top = 26
                    Width = 24
                    Height = 22
                    Hint = 
                      'Seleciona o Docente respons'#225'vel pela assinatura da solicita'#231#227'o d' +
                      'e revis'#227'o.'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Arial'
                    Font.Style = []
                    FrameStyle = fsDark
                    Glyph.Data = {
                      7E050000424D7E050000000000003600000028000000110000001A0000000100
                      1800000000004805000000000000000000000000000000000000D6D6D6989898
                      5959593333333A3C3E5D606465686D4F4D53514C54433C43524B51766F76B5B0
                      B6E8E7ECF7F9FBF5FAFAEDF1F200ACACAC7979795F5F5F5B5B5C808181A6A8AB
                      A5A6AA9D9BA1726E74655E67726B7477717A807C839B9A9FBCBEC1D2D7D7E2E7
                      E6006060603131313131313131315A5A5AB4B5B5B1B1B3C3C2C75B575D3B353E
                      463F4A4E49533B384130303547494B7E8382CBD0CE004949490D0D0D0C0C0C02
                      02021515154E4F4E4E4E4F6362661E1C2216141D27242F28263114141E07080E
                      0D10123F4543B4B9B6005757570E0E0E0909090203020808070505030B0C0B0C
                      0B0F07070E41414D3F3F4C1E1F2D0B0E190B0F160A0E102A2F2CA5ABA6006464
                      641111110808080405040809070605021112100201050D0E19787A8A4E516320
                      25360D1221090E180A0E122D312FA8AEA8008383832727271414140707070001
                      000303010A0B0A010308272B399096AB4F556E323951192032020614090E153E
                      4343BCC1BC00ABABAB585858373737040504040504080907060502181E286F77
                      8A9CA5C25A64844753722F364F14141E07080E5E6566C3C9C300CACACAADADAD
                      8484840707070707070001000303015D6577A3AECA96A4C9909FC97A8AB2606E
                      8F0B0E190B0F16A4ACAECED3CD00FEFEFEDBDBDB8A8A8A363636070A0B000509
                      020711323E567888AB7689B67D91C4354A7B050F360C122D485365B5BDC2F7FB
                      F800F1F1F1F8F8F8E8E8E8AEB0B05B5F6201071103041360709094AAD67892C8
                      708BC8415C973F578A8496BDCFDBEFF2FAFCFAFDFB00F8F8F8F8F8F8FAFAFAED
                      EEEFC8CDD286909F34415A667BA3708ABF5271B24F6FB75A79BF748FCCA5BAE8
                      D9E6FDEFF7FBEDEFF100FCFCFCFAFAFAFAFAFAFCFCFCE8EDF4D0DBEC90A3C566
                      7FB05E7CBA5174BE577BCC6689D86381C7758CC1B4C3E2EBF3FEF8FAFA00FAFA
                      FAFCFCFCFCFCFCFEFEFEFCFCFCDFEDFDCAE0F25572A94F71B84A71C5527CD560
                      87DD6C8DD97992CDA1B2D7DCE5F7EEF1F300FDFDFDFEFEFEFEFEFEFFFFFFFEFE
                      FECADBF3B6CEF05C7BB96B90DD719CE96E9AEF6690EA7497E9829CDC99ABD4CA
                      D3E9E3E6EA00FEFEFEFFFFFFFCFCFCFEFEFEFCFCFCA1B4DA6985BC6789CF678F
                      E26F9CF072A0F97BA6F78BAFF693AEE9A1B4DCC7D0E6E5E6ED00F9F9F9FEFEFE
                      FCFCFCF6F8FBD3DEF06880B84264AE587FD2547FD75F8EE96E9DF58DB7FCA4C9
                      FFA9C5F2ADBFE1C8D0E3F0F1F700FCFCFCFEFEFEFCFCFCF3F5F9C3CFE938549F
                      3056B62B53B24672CF6492E97AA7F699C2FCB1D5FFB9D5F7B9CBE5CBD4E1F9F9
                      FD00FCFCFCFEFEFEFCFCFCEDF0F8B1BEE4294699072D9700278D2D57B85C89E1
                      7CA7F59DC4FCB4D6FEBCD7F8BFD2EBD2DDEAF8FAFD00FCFCFCFCFCFCFEFEFEFC
                      FCFCA5B1D72945991437A3012790224AAE5882E077A0F38AAFF69EBFF6A4BFE8
                      A7BBD7C7D4E3F4F9FE00F3F3F3FEFEFEFFFFFFFEFEFE9FA9CF31499C01279022
                      4AAE224AAE597EDD7A9FF5789BE57D9CD98BA4D29DB0CFBECADFE4ECF700FAFA
                      FAFCFCFCFEFEFEFCFCFCA4ACD07487D612349C1C3FA41C3FA41C3FA46789DF68
                      87D3708CCB7A91C38C9EC2B1BED6CFD7E300FFFFFFFFFFFFFFFFFFF4F6FCC3CA
                      E8505FA41B308829419B29419B344EA92D489A4C66B0657CBB6072A56C7AA0AE
                      B8D0DFE6F200FFFFFFFFFFFFFFFFFFF8F9FCE3E8FCAEB9EC5D6BB141519B3A4E
                      993E549E5267B06074B7687AB4808EBEB0B8DDDDE3F9F0F4FD00FFFFFFFFFFFF
                      FFFFFFF7F8FAEFF2FFDCE3FDC3CDEF8E9ACF55639C54649F5A6BA658669F7480
                      B3AEB5DDDEE1F9F0F2FEF0F0FD00FEFEFEFFFFFFFEFEFEFCFCFDF9FAFFF3F6FF
                      EEF3FEDBE3F5C4CEE2C2CCE3C2CDE4C1CAE1CDD3E8E3E5F7F4F3FFFAF7FEFAF7
                      FE00}
                    ParentFont = False
                    ParentShowHint = False
                    ShowHint = True
                    TextAlign = ttaBottom
                    OnClick = JvTransparentButton_SelDocenteClick
                  end
                  object Label14: TLabel
                    Left = 616
                    Top = 30
                    Width = 38
                    Height = 16
                    Caption = 'Data:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBEdit_NomeDocente: TDBEdit
                    Left = 168
                    Top = 26
                    Width = 377
                    Height = 21
                    DataField = 'NOME_DOCENTE'
                    DataSource = DST_PedidoRevisaoItem
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object JvDBDate_DataDocente: TJvDBDateEdit
                    Left = 656
                    Top = 26
                    Width = 110
                    Height = 21
                    DataField = 'DATA_DOCENTE'
                    DataSource = DST_PedidoRevisaoItem
                    Ctl3D = False
                    DialogTitle = 'Selecione a Data'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = []
                    NumGlyphs = 2
                    ParentCtl3D = False
                    ParentFont = False
                    TabOrder = 1
                    Weekends = [Sun, Sat]
                    YearDigits = dyFour
                  end
                end
                object JvDBRichEdit_ParecerDocente: TJvDBRichEdit
                  Left = 1
                  Top = 56
                  Width = 775
                  Height = 350
                  DataField = 'ARGUMENTACAO_DOCENTE'
                  DataSource = DST_PedidoRevisaoItem
                  Align = alClient
                  Ctl3D = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -17
                  Font.Name = 'Courier New'
                  Font.Style = []
                  MaxLength = 1500
                  ParentCtl3D = False
                  ParentFont = False
                  PlainText = True
                  TabOrder = 1
                end
                object JvCaptionPanel_SelRelacaoDeDocente: TJvCaptionPanel
                  Left = 169
                  Top = 53
                  Width = 577
                  Height = 330
                  Buttons = []
                  Caption = 'Selecione o docente respons'#225'vel pela revis'#227'o'
                  CaptionColor = 16697257
                  CaptionPosition = dpTop
                  CaptionFont.Charset = ANSI_CHARSET
                  CaptionFont.Color = clBlack
                  CaptionFont.Height = -16
                  CaptionFont.Name = 'Arial'
                  CaptionFont.Style = []
                  Color = 14211288
                  FlatButtons = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  OutlookLook = False
                  ParentFont = False
                  TabOrder = 2
                  object JvTransparentButton5: TJvTransparentButton
                    Left = 655
                    Top = 5
                    Width = 26
                    Height = 16
                    Hint = 'Fecha a Janela de Impress'#227'o da Solicita'#231#227'o de Revis'#227'o do Item'
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
                    OnClick = JvTransparentButton_FecharImpressaoClick
                  end
                  object JvTransparentButton_FechaSelInstrutor: TJvTransparentButton
                    Left = 527
                    Top = 5
                    Width = 26
                    Height = 16
                    Hint = 
                      'Fecha a janela da sele'#231#227'o do docente respons'#225'vel pela solicita'#231#227 +
                      'o de Revis'#227'o do Item.'
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
                    OnClick = JvTransparentButton_FechaSelInstrutorClick
                  end
                  object JvGradientCaption1: TJvGradientCaption
                    Left = 1
                    Top = 25
                    Width = 559
                    Height = 8
                    GradientStartColor = 16697257
                    GradientEndColor = 16697257
                    GradientStyle = grHorizontal
                    LabelCaption = 'Put your text here ...'
                    LabelFont.Charset = DEFAULT_CHARSET
                    LabelFont.Color = clWhite
                    LabelFont.Height = -11
                    LabelFont.Name = 'MS Sans Serif'
                    LabelFont.Style = []
                    LabelAlignment = taLeftJustify
                    Align = alTop
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    DoubleBuffered = False
                    TabOrder = 0
                  end
                  object DBGrid_InstrutorResponsavelRevisao: TDBGrid
                    Left = 1
                    Top = 33
                    Width = 559
                    Height = 280
                    Align = alClient
                    DataSource = DSQ_InstrutorTurma
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
                    ParentFont = False
                    TabOrder = 1
                    TitleFont.Charset = ANSI_CHARSET
                    TitleFont.Color = clGray
                    TitleFont.Height = -17
                    TitleFont.Name = 'Times New Roman'
                    TitleFont.Style = [fsItalic]
                    OnCellClick = DBGrid_InstrutorResponsavelRevisaoCellClick
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'NOMEGUERRA'
                        Title.Alignment = taCenter
                        Title.Caption = 'Nome de Guerra'
                        Title.Color = 16311249
                        Title.Font.Charset = ANSI_CHARSET
                        Title.Font.Color = clNavy
                        Title.Font.Height = -13
                        Title.Font.Name = 'Arial'
                        Title.Font.Style = []
                        Width = 137
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOMECOMPLETO'
                        Title.Alignment = taCenter
                        Title.Caption = 'Nome  Completo'
                        Title.Color = 16311249
                        Title.Font.Charset = ANSI_CHARSET
                        Title.Font.Color = clNavy
                        Title.Font.Height = -13
                        Title.Font.Name = 'Arial'
                        Title.Font.Style = []
                        Width = 401
                        Visible = True
                      end>
                  end
                end
              end
            end
            object TabSheet_ParecerChefeEAVA: TTabSheet
              Caption = 'Parecer Chefe EAVA'
              ImageIndex = 2
              object Panel5: TPanel
                Left = 686
                Top = 0
                Width = 360
                Height = 407
                Align = alClient
                BorderStyle = bsSingle
                Color = 14803425
                TabOrder = 0
                object Panel6: TPanel
                  Left = 1
                  Top = 1
                  Width = 356
                  Height = 27
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Color = clWhite
                  TabOrder = 0
                  object Label8: TLabel
                    Left = 11
                    Top = 4
                    Width = 188
                    Height = 16
                    Caption = 'Parecer do Chefe da EAVA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object CheckBox_AnularQuestaoCh: TCheckBox
                  Left = 16
                  Top = 66
                  Width = 161
                  Height = 17
                  Caption = 'Anular a quest'#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = CheckBox_AnularQuestaoChClick
                end
                object CheckBox_ModificarGabaritoCh: TCheckBox
                  Left = 16
                  Top = 117
                  Width = 289
                  Height = 17
                  Caption = 'Modificar gabarito para alternativa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnClick = CheckBox_ModificarGabaritoChClick
                end
                object CheckBox_AlternativaCorretaCh: TCheckBox
                  Left = 16
                  Top = 173
                  Width = 281
                  Height = 17
                  Caption = 'Considera como correta a(s) alternativa(s)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox_AlternativaCorretaChClick
                end
                object ToolBar_ModificarGabaritoCh: TToolBar
                  Left = 48
                  Top = 134
                  Width = 113
                  Height = 27
                  Align = alNone
                  ButtonHeight = 24
                  ButtonWidth = 27
                  Color = 14803425
                  DockSite = True
                  EdgeBorders = [ebLeft, ebRight, ebBottom]
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  Indent = 2
                  List = True
                  ParentColor = False
                  ParentFont = False
                  ShowCaptions = True
                  TabOrder = 4
                  object ToolButton_ChMA: TToolButton
                    Left = 2
                    Top = 2
                    Hint = 'Seleciona a alternativa "A"'
                    Caption = 'A '
                    ImageIndex = 34
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChMAClick
                  end
                  object ToolButton_ChMB: TToolButton
                    Left = 29
                    Top = 2
                    Hint = 'Seleciona a alternativa "B"'
                    Caption = 'B '
                    ImageIndex = 35
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChMBClick
                  end
                  object ToolButton_ChMC: TToolButton
                    Left = 56
                    Top = 2
                    Hint = 'Seleciona a alternativa "C"'
                    Caption = 'C '
                    ImageIndex = 8
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChMCClick
                  end
                  object ToolButton_ChMD: TToolButton
                    Left = 83
                    Top = 2
                    Hint = 'Seleciona a alternativa "D"'
                    Caption = 'D '
                    ImageIndex = 70
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChMDClick
                  end
                end
                object ToolBar_AlternativaCorretaCh: TToolBar
                  Left = 48
                  Top = 191
                  Width = 113
                  Height = 27
                  Align = alNone
                  ButtonHeight = 24
                  ButtonWidth = 27
                  Color = 14803425
                  DockSite = True
                  EdgeBorders = [ebLeft, ebRight, ebBottom]
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  Indent = 2
                  List = True
                  ParentColor = False
                  ParentFont = False
                  ShowCaptions = True
                  TabOrder = 5
                  object ToolButton_ChCA: TToolButton
                    Left = 2
                    Top = 2
                    Hint = 'Seleciona a alternativa "A"'
                    Caption = 'A '
                    ImageIndex = 34
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChCAClick
                  end
                  object ToolButton_ChCB: TToolButton
                    Left = 29
                    Top = 2
                    Hint = 'Seleciona a alternativa "B"'
                    Caption = 'B '
                    ImageIndex = 35
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChCBClick
                  end
                  object ToolButton_ChCC: TToolButton
                    Left = 56
                    Top = 2
                    Hint = 'Seleciona a alternativa "C"'
                    Caption = 'C '
                    ImageIndex = 8
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChCCClick
                  end
                  object ToolButton_ChCD: TToolButton
                    Left = 83
                    Top = 2
                    Hint = 'Seleciona a alternativa "D"'
                    Caption = 'D '
                    ImageIndex = 70
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolButton_ChCDClick
                  end
                end
                object CheckBox_ManterGabaritoCh: TCheckBox
                  Left = 16
                  Top = 90
                  Width = 137
                  Height = 17
                  Caption = 'Manter Gabarito'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                  OnClick = CheckBox_ManterGabaritoChClick
                end
                object Panel2: TPanel
                  Left = 15
                  Top = 219
                  Width = 228
                  Height = 62
                  BevelOuter = bvNone
                  TabOrder = 7
                  object JvShape2: TJvShape
                    Left = 1
                    Top = 4
                    Width = 218
                    Height = 50
                    Brush.Color = 16378331
                    Pen.Color = 33023
                  end
                  object JvTransparentButton_GravaParecerChefeEAVA: TJvTransparentButton
                    Left = 3
                    Top = 5
                    Width = 215
                    Height = 48
                    Hint = 'Grava Parecer do Chefe da EAVA'
                    BorderWidth = 0
                    Caption = 'Grava Parecer Chefe EAVA'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Arial'
                    Font.Style = []
                    FrameStyle = fsDark
                    Glyph.Data = {
                      52060000424D5206000000000000360000002800000016000000170000000100
                      1800000000001C06000000000000000000000000000000000000A47C63B88665
                      B08568AD886ABD885BB8875FA77C629C70629D726A9C7169A07164A3715E9E7A
                      5CAE8764BD8E64C58E5FC9905EC6915FC29061BB9067B49067E8CFAA00007A3D
                      0D94460A90480985490B6941005951156969418B7B6B9B8E8692988C8E8A788C
                      6E577B5B3467390D7530009E450CB2500EAF5008A95202A257088D4603AE713A
                      0000904B13A854129E520E8E5418987E56A3AC87B4D3B2AFD2BDA0C6BCA2C8C9
                      A9B8C7B6ADBCBEB5ABCAB7A6AB866E814926954D1EAB591EB45D15B25E12AB56
                      09B064290000814111914B177E491AAD8B6BBCA29AB3AB98B1D3AA73C08B509D
                      7490B5AEA5A6C49C93BEACADB7C3C7C9DCDFDDC4BEB2755E436B3A119E541FA5
                      54169F4E08AC642E0000703C146C3A16967B66ADA8A0A2A096ADBB9874BA6F40
                      C35E53D47761A87698AEAF98A0B6B9B4B6C9CDC9C6D4D1D8E5DDD4D2BF8B6D4B
                      773C0D994F1A8C490C97602F00005E320B875F3FC7BCB09BA3A5AEB1A08CB382
                      50B45C40D16040D0635CC07479A584A8B1A8C5C1B5D5D4CCCDD1D0C0C3C5C4BE
                      BAD4BDAC88604068360A7C450886602A00005F3108AD886CBDB7ABB9C9C49DB0
                      985A9E6C49C27337C46633C3634CC77A5AA06F9BAD94CDD0C7D3D6D6C8C6CFBA
                      B0BFAEA4B0B8AFB0BEB2A76A51376B3C008661240000763B1AB39C95A4A9A590
                      C3A053AD6B54B56F46B46834B65D2CB75839B85F54BA7460A277C6D4D2C9CED2
                      C1B9BDB4A1A5AAA9A89DB5ADB6C6BEA4978A673C05985E200000854E2EBCB4AC
                      8DA7994B99633DB75E4CB4644FA4613F9E5946AE5F52BB664CBB6848B26E83B2
                      9BB7C2B9AFA6A3B0A7A8ADB0B0B3BBB9C0C4C2D0CEC57F5C3092592400008B61
                      3E9BA6915183644CAF6932B0513FA858538F59728B5E6C8E5564AF633FB15542
                      BF654EA56C81A280AEB1A3A4AAABB0B3BBCBBBC4D2C6CCCDD4CEA38B6B89572D
                      000078552F738B6B5FA17445AF6543AB5E378E4D6F8A5AA47A5196703B6D9145
                      51B05A39AA534AB662589D619BBA9DB1BDB9BCB8C3D0BDCBCFC4CBCDD3D2BFB1
                      9D8357370000734D1F8DA0785A946659B678408C607BA17CAEA077A56734C781
                      4190742D759C574DA45F3EA74D4EB36560A375B0C4B4C3BDC0C3C1C8C7C5CBD2
                      CFD4CFC5BA8B644A000072400BB8B68C8BA78647845F6D9D8DE2D9CCBD95778E
                      642DBD7D3ABF6F328B72406099624BA45240AF5E49A86B7AA582C1CDBEB1BFBA
                      B8BDBFB7B1B9C0B7AD946F570000803E01998057C8C2B392A59ABFCBC5C9C3BB
                      BCA895805D38B37340C1733C9A6C3A6C7C475CA45E45A65D45AD6850A26987B3
                      8FB7C7B6ACAEAD9DA0A7ADA69B97705500009448077C5027CAABA4D6C4C7CFBF
                      BAA6B7ADA1AFA5B792849B5A3EA5794BB595608976434F885163B07242A45D40
                      AD654D995F95AB8DB9BAB49CA5AAAA9E8E9068490000974C17824A15987049E6
                      C3B1BAB2B29EA5A7A4AFB0D3D5D2B4AEA4918775A69179C7B69DABC8AF649672
                      5CA87044AB5F40A7584C925C8AA795ADA9AAB78F6C875B30000091441092551A
                      764715B18767BBB0A8A9A7A7C6CACEC3CFD6A4B2B7A7AFAEC7CAC2DFE1D4E7EE
                      E1AAC0AC60956E53AA6C39A55A3F9E5D44835F94A8959C6E3F8E5B2900009646
                      0F9753148B531B814C21A88D6FE1D1C1DCD5D5B9BDCA96A5B698AFB9B4D3D2CF
                      E7DFE6E0D8EBEBE294B29E569A7149A96C35975244965B5E88597E4D159F6831
                      000094410A974E0B8C4D0F8F4F1A7E4F17B79168F0D4C5C4B8BE9AA0ADA2B7C2
                      B7DBD9CEF1E6E5E8DEDEDFDAD7E8E184AF975D9F6E65AA675B974E4964207F46
                      08A06429000094420D974D0A904E10964E149B590F85480B9B6945BB9789BFAD
                      A9D1D1CBE0F0E0E7FBE7DAEED8DAE7D9DEE5DDE1EEDA96AB828191555D5E1767
                      52108A490C985D2400008C3C0D91490C8A48109249139C50079A53108F4C1B7F
                      47248E6046B6957CE5CFB4EFEACBE0EAC7D9D8BFDAC8B8B79F88856B44694914
                      7E4B128C4E1A813F09955E2700008D3F13924A138B4A17924A1C964B129A5014
                      974E16914B178845177F3F177D3F1D7E49277E5C2E7E502A8244277B38167F42
                      14884A168A411290421D8242118C582600006C2C11773C15713B15773A19783D
                      19743A127338117639127B3B127B38177933177630166E3111752E108130157D
                      2F167533146A300F6B2C136C2D1C5A260DB0855F0000}
                    ParentFont = False
                    ParentShowHint = False
                    ShowHint = True
                    TextAlign = ttaBottom
                    OnClick = JvTransparentButton_GravaParecerChefeEAVAClick
                  end
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 686
                Height = 407
                Align = alLeft
                TabOrder = 1
                object JvDBRichEdit_ParecerChefeEAVA: TJvDBRichEdit
                  Left = 1
                  Top = 58
                  Width = 684
                  Height = 348
                  DataField = 'CONSIDERACAO_CHEFEEAVA'
                  DataSource = DST_PedidoRevisaoItem
                  Align = alClient
                  Ctl3D = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -17
                  Font.Name = 'Courier New'
                  Font.Style = []
                  MaxLength = 200
                  ParentCtl3D = False
                  ParentFont = False
                  PlainText = True
                  TabOrder = 0
                end
                object Panel10: TPanel
                  Left = 1
                  Top = 1
                  Width = 684
                  Height = 57
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Color = 15395583
                  TabOrder = 1
                  object Label12: TLabel
                    Left = 9
                    Top = 4
                    Width = 194
                    Height = 16
                    Caption = 'Considera'#231#245'es Chefe EAVA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label9: TLabel
                    Left = 11
                    Top = 30
                    Width = 89
                    Height = 16
                    Caption = 'Chefe EAVA:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object JvTransparentButton_SelChefeEAVA: TJvTransparentButton
                    Left = 483
                    Top = 24
                    Width = 24
                    Height = 22
                    Hint = 
                      'Seleciona o Chefe da EAVA respons'#225'vel pela assinatura da solicit' +
                      'a'#231#227'o'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Arial'
                    Font.Style = []
                    FrameStyle = fsDark
                    Glyph.Data = {
                      7E050000424D7E050000000000003600000028000000110000001A0000000100
                      1800000000004805000000000000000000000000000000000000D6D6D6989898
                      5959593333333A3C3E5D606465686D4F4D53514C54433C43524B51766F76B5B0
                      B6E8E7ECF7F9FBF5FAFAEDF1F200ACACAC7979795F5F5F5B5B5C808181A6A8AB
                      A5A6AA9D9BA1726E74655E67726B7477717A807C839B9A9FBCBEC1D2D7D7E2E7
                      E6006060603131313131313131315A5A5AB4B5B5B1B1B3C3C2C75B575D3B353E
                      463F4A4E49533B384130303547494B7E8382CBD0CE004949490D0D0D0C0C0C02
                      02021515154E4F4E4E4E4F6362661E1C2216141D27242F28263114141E07080E
                      0D10123F4543B4B9B6005757570E0E0E0909090203020808070505030B0C0B0C
                      0B0F07070E41414D3F3F4C1E1F2D0B0E190B0F160A0E102A2F2CA5ABA6006464
                      641111110808080405040809070605021112100201050D0E19787A8A4E516320
                      25360D1221090E180A0E122D312FA8AEA8008383832727271414140707070001
                      000303010A0B0A010308272B399096AB4F556E323951192032020614090E153E
                      4343BCC1BC00ABABAB585858373737040504040504080907060502181E286F77
                      8A9CA5C25A64844753722F364F14141E07080E5E6566C3C9C300CACACAADADAD
                      8484840707070707070001000303015D6577A3AECA96A4C9909FC97A8AB2606E
                      8F0B0E190B0F16A4ACAECED3CD00FEFEFEDBDBDB8A8A8A363636070A0B000509
                      020711323E567888AB7689B67D91C4354A7B050F360C122D485365B5BDC2F7FB
                      F800F1F1F1F8F8F8E8E8E8AEB0B05B5F6201071103041360709094AAD67892C8
                      708BC8415C973F578A8496BDCFDBEFF2FAFCFAFDFB00F8F8F8F8F8F8FAFAFAED
                      EEEFC8CDD286909F34415A667BA3708ABF5271B24F6FB75A79BF748FCCA5BAE8
                      D9E6FDEFF7FBEDEFF100FCFCFCFAFAFAFAFAFAFCFCFCE8EDF4D0DBEC90A3C566
                      7FB05E7CBA5174BE577BCC6689D86381C7758CC1B4C3E2EBF3FEF8FAFA00FAFA
                      FAFCFCFCFCFCFCFEFEFEFCFCFCDFEDFDCAE0F25572A94F71B84A71C5527CD560
                      87DD6C8DD97992CDA1B2D7DCE5F7EEF1F300FDFDFDFEFEFEFEFEFEFFFFFFFEFE
                      FECADBF3B6CEF05C7BB96B90DD719CE96E9AEF6690EA7497E9829CDC99ABD4CA
                      D3E9E3E6EA00FEFEFEFFFFFFFCFCFCFEFEFEFCFCFCA1B4DA6985BC6789CF678F
                      E26F9CF072A0F97BA6F78BAFF693AEE9A1B4DCC7D0E6E5E6ED00F9F9F9FEFEFE
                      FCFCFCF6F8FBD3DEF06880B84264AE587FD2547FD75F8EE96E9DF58DB7FCA4C9
                      FFA9C5F2ADBFE1C8D0E3F0F1F700FCFCFCFEFEFEFCFCFCF3F5F9C3CFE938549F
                      3056B62B53B24672CF6492E97AA7F699C2FCB1D5FFB9D5F7B9CBE5CBD4E1F9F9
                      FD00FCFCFCFEFEFEFCFCFCEDF0F8B1BEE4294699072D9700278D2D57B85C89E1
                      7CA7F59DC4FCB4D6FEBCD7F8BFD2EBD2DDEAF8FAFD00FCFCFCFCFCFCFEFEFEFC
                      FCFCA5B1D72945991437A3012790224AAE5882E077A0F38AAFF69EBFF6A4BFE8
                      A7BBD7C7D4E3F4F9FE00F3F3F3FEFEFEFFFFFFFEFEFE9FA9CF31499C01279022
                      4AAE224AAE597EDD7A9FF5789BE57D9CD98BA4D29DB0CFBECADFE4ECF700FAFA
                      FAFCFCFCFEFEFEFCFCFCA4ACD07487D612349C1C3FA41C3FA41C3FA46789DF68
                      87D3708CCB7A91C38C9EC2B1BED6CFD7E300FFFFFFFFFFFFFFFFFFF4F6FCC3CA
                      E8505FA41B308829419B29419B344EA92D489A4C66B0657CBB6072A56C7AA0AE
                      B8D0DFE6F200FFFFFFFFFFFFFFFFFFF8F9FCE3E8FCAEB9EC5D6BB141519B3A4E
                      993E549E5267B06074B7687AB4808EBEB0B8DDDDE3F9F0F4FD00FFFFFFFFFFFF
                      FFFFFFF7F8FAEFF2FFDCE3FDC3CDEF8E9ACF55639C54649F5A6BA658669F7480
                      B3AEB5DDDEE1F9F0F2FEF0F0FD00FEFEFEFFFFFFFEFEFEFCFCFDF9FAFFF3F6FF
                      EEF3FEDBE3F5C4CEE2C2CCE3C2CDE4C1CAE1CDD3E8E3E5F7F4F3FFFAF7FEFAF7
                      FE00}
                    ParentFont = False
                    ParentShowHint = False
                    ShowHint = True
                    TextAlign = ttaBottom
                    OnClick = JvTransparentButton_SelChefeEAVAClick
                  end
                  object Label15: TLabel
                    Left = 531
                    Top = 30
                    Width = 38
                    Height = 16
                    Caption = 'Data:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBEdit_ChefeEAVA: TDBEdit
                    Left = 104
                    Top = 24
                    Width = 377
                    Height = 21
                    DataField = 'NOME_CHEFE_EAVA'
                    DataSource = DST_PedidoRevisaoItem
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object JvDBDateEdit_ChefeEAVA: TJvDBDateEdit
                    Left = 572
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'DATA_CHEFE_EAVA'
                    DataSource = DST_PedidoRevisaoItem
                    Ctl3D = False
                    DialogTitle = 'Selecione a Data'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = []
                    NumGlyphs = 2
                    ParentCtl3D = False
                    ParentFont = False
                    TabOrder = 1
                    Weekends = [Sun, Sat]
                    YearDigits = dyFour
                  end
                end
                object JvCaptionPanel_SellecaoDoChefeEAVA: TJvCaptionPanel
                  Left = 105
                  Top = 49
                  Width = 495
                  Height = 247
                  Buttons = []
                  Caption = 'Selecione Responsavel da EAV ou Substituto'
                  CaptionColor = 16697257
                  CaptionPosition = dpTop
                  CaptionFont.Charset = ANSI_CHARSET
                  CaptionFont.Color = clBlack
                  CaptionFont.Height = -16
                  CaptionFont.Name = 'Arial'
                  CaptionFont.Style = []
                  Color = 14211288
                  FlatButtons = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  OutlookLook = False
                  ParentFont = False
                  TabOrder = 2
                  object JvTransparentButton7: TJvTransparentButton
                    Left = 655
                    Top = 5
                    Width = 26
                    Height = 16
                    Hint = 'Fecha a Janela de Impress'#227'o da Solicita'#231#227'o de Revis'#227'o do Item'
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
                    OnClick = JvTransparentButton_FecharImpressaoClick
                  end
                  object JvTransparentButton_FechaSelChefeEAVA: TJvTransparentButton
                    Left = 439
                    Top = 5
                    Width = 26
                    Height = 16
                    Hint = 
                      'Fecha a janela de sele'#231#227'o do Instrutor que assinar'#225' a Solicita'#231#227 +
                      'o de Revis'#227'o de Prova.'
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
                    OnClick = JvTransparentButton_FechaSelChefeEAVAClick
                  end
                  object JvGradientCaption3: TJvGradientCaption
                    Left = 1
                    Top = 25
                    Width = 477
                    Height = 8
                    GradientStartColor = 16697257
                    GradientEndColor = 16697257
                    GradientStyle = grHorizontal
                    LabelCaption = 'Put your text here ...'
                    LabelFont.Charset = DEFAULT_CHARSET
                    LabelFont.Color = clWhite
                    LabelFont.Height = -11
                    LabelFont.Name = 'MS Sans Serif'
                    LabelFont.Style = []
                    LabelAlignment = taLeftJustify
                    Align = alTop
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    DoubleBuffered = False
                    TabOrder = 0
                  end
                  object DBGrid_ChefeEAVA: TDBGrid
                    Left = 1
                    Top = 33
                    Width = 477
                    Height = 197
                    Align = alClient
                    DataSource = DSQ_ChefeAVL
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
                    ParentFont = False
                    TabOrder = 1
                    TitleFont.Charset = ANSI_CHARSET
                    TitleFont.Color = clGray
                    TitleFont.Height = -17
                    TitleFont.Name = 'Times New Roman'
                    TitleFont.Style = [fsItalic]
                    OnCellClick = DBGrid_ChefeEAVACellClick
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'SIGLA'
                        Title.Alignment = taCenter
                        Title.Caption = 'Sigla'
                        Title.Color = 16311249
                        Title.Font.Charset = ANSI_CHARSET
                        Title.Font.Color = clNavy
                        Title.Font.Height = -13
                        Title.Font.Name = 'Arial'
                        Title.Font.Style = []
                        Width = 49
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME'
                        Title.Alignment = taCenter
                        Title.Caption = 'N o m e'
                        Title.Color = 16311249
                        Title.Font.Charset = ANSI_CHARSET
                        Title.Font.Color = clNavy
                        Title.Font.Height = -13
                        Title.Font.Name = 'Arial'
                        Title.Font.Style = []
                        Width = 406
                        Visible = True
                      end>
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  object Panel_Botoes_CabecalhoProva: TPanel
    Left = 0
    Top = 0
    Width = 1284
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16775660
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object JvGradient3: TJvGradient
      Left = 0
      Top = 0
      Width = 1282
      Height = 108
      Align = alClient
      Style = grVertical
      StartColor = 12615680
      EndColor = 16777190
      Steps = 103
    end
    object Shape7: TShape
      Left = 92
      Top = 2
      Width = 629
      Height = 103
    end
    object Shape8: TShape
      Left = 92
      Top = 32
      Width = 628
      Height = 1
    end
    object Label_Prova: TLabel
      Left = 407
      Top = 33
      Width = 67
      Height = 22
      Alignment = taCenter
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
      Left = 524
      Top = 33
      Width = 189
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
      Left = 522
      Top = 33
      Width = 1
      Height = 45
    end
    object Label_Aluno_: TLabel
      Left = 95
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
      Left = 126
      Top = 33
      Width = 69
      Height = 22
      Alignment = taCenter
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
      Left = 223
      Top = 33
      Width = 136
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
      Left = 359
      Top = 33
      Width = 1
      Height = 46
    end
    object Shape11: TShape
      Left = 219
      Top = 33
      Width = 1
      Height = 45
    end
    object Shape12: TShape
      Left = 93
      Top = 77
      Width = 627
      Height = 1
    end
    object Image_Brasao: TImage
      Left = 7
      Top = 1
      Width = 81
      Height = 96
      Picture.Data = {
        07544269746D6170FE630000424DFE6300000000000036000000280000005200
        0000670000000100180000000000C8630000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFCFBFFFFFEFFFF
        FEFFFFFEFFFFFEFFFFFFFCFEFEFDFFFFFDFFFFF7FEFFEFFEFFE8FFFFDFFFFFDA
        FFFFD8FFFFD4FEFFD4FFFFD1FFFFD1FEFFD1FFFFD1FFFFD1FFFFD0FDFFD3FFFF
        D4FFFFD0FBFFD1FEFFD3FFFFD3FFFFD2FFFFCDFFFFD1FFFFD4FFFFD5FFFFDAFF
        FFE4FFFFEDFFFFF2FEFFF7FCFFFDFFFFFDFFFFFAFCFCFDFFFFFFFFFEFFFCFDFF
        FEFFFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFDFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFBFDFFFEFFFFFDFFFFFEFFFFFEFEFBFDFDF7FFFEF1
        FBFBF2FDFFF0FEFFE6F9FFD8F6FFC8FAFFB3FAFF92EFF872DBE960CFE94BBFE0
        45C0E043C4E53AC2E436C2E635C3E634C1E63BC4EA35BCE23BC0E640C5EA38C0
        E436C1E238C5E638C4E33FC6E242C3DC4BC8DD68D8EA95EDFDB6FAFFCEFBFFDE
        FBFFEAFEFFEFFCFEF4FCFBFCFFFDFFFEFDFFFFFCFDFFFEFBFFFEFDFFFFFDFFFF
        FDFFFFFDFFFFFDFFFFFDFFFFFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFFFFFEFFFFFEFFFEFAFFFFFEFFFBFFFFF2FEFEEBFFFFE2FFFFD5FCFFCBFCFF
        B5F2FF99E5FB70D2EA4FC3DA3FC8DE35CAE42EC7EC23C0EB18BCE61FC8EE1CC9
        EF14C4E91AC7ED19C4EA1BC1E823C8EF21C4EB1CC0EA20C8F11AC7EF10C3EA15
        C7F017C6F118C6F01CC7ED2AC6E93BC1DF52C0DA7CD2E8A7EDFEC0FDFFC9F9FF
        DDFEFFEDFFFFFAFFFFFCFFFDFAFFFEF6FFFCFBFFFFFDFFFFFDFFFFFDFFFFFDFF
        FFFDFFFFFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFCFEFFF6F9FDFAFDFF
        FBFCFFF8FCFDF2FBFEE5FBFFD7FEFFC0FBFF9DF0FF6FDAF543C1E332C1E62AC4
        ED1FC1EB1FC5EE1EC6EF1CC3EE22C8F121C7EC1EC1E127C5DD30C9DE36C9D93E
        C9D943CAD844C8D940C5D93DC5DF36C5E42CC2E624C1E81FC4EF13C0F20CC0F4
        08C1F311C6F421C8F32AC5EC34C3E33FC4E04FC9DF80E8F9AEFAFFCAFBFFE6FC
        FFF5FEFFF6FEFDF8FEFDF7FCFBF8FDFCF9FEFDF9FEFDFCFEFEFCFEFEFDFFFFFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFEFFFAFFFFF2FDFFE7FAFDDFFCFFD0FC
        FFB5F1FD91E0F369CEE744C0E230C3E91DC2E917C2E81EC4E929C6E736C5E43D
        C1D94FC7DA51C1CD56C1C84DB1B155AFA95CAEA14C958553958251907C559381
        4F9081569B9163AFAB5AACAD54ACB261C3CF56C6DD45C5E234C3E226C4E21FC3
        E619C2E71BC2E71FC5E825C4E630C0DC4DC7DF7EDDF0B1F2FFCDF8FFE0FAFFF0
        FFFFF3FBFBF7FCFBF8FDFCF9FEFDFBFDFDFBFDFDFCFEFEFDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFE
        FEFEFEFEFEFEFEFCFEFFF6F9FDE8FBFECDFCFFAFFAFF7DE5F24BC8DD33BEDF2A
        C2EB1BBFEE18C3F11CC7ED26C5DF45C8D563C9C873B7AC7DA48E72815B6E6E3E
        6F6634705E297D6027886327875B1C8F61219164218E652089642083611F7D5F
        1E80632681652975602C70674176846879A8926AC0B44DCACE35CBDC24C7E71C
        C6EF1EC6F51CC5F11DC8EE25C5E33DC6DC74DBEAB5F3FEDAF9FFEEFBFDF7FCFB
        F9FEFDF9FEFDF9FEFDF9FEFDFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFDFFFFFCFEFEFAFFFEF7FFFFEE
        FFFFDEFCFFC8FDFF91EAF856CDE230C1DB27C7E728CBF123C4EA30C6EA3CC4DE
        52C8D35DBBB65E9C845A7954636033816328986418A86411AC600DB96611BF62
        0DC15F07CF6910C96408C86608C26204C16604C06705BB6404BD6606BF6709B9
        620AAD5F12A065207D61255761324C816058AD9E5BC5C64BC4D43BC2DE2BC3E6
        17C7EC15CBEF1CC8E62FC2DC67D0E5A1E9FAC9FAFFDDFBFFEDFCFFF5FDFDF8FE
        FDFCFFFDFDFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFEFFFFFEFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFFFE
        FDFFFDFEFFFBFDFEFDFFFEF7FCFAFAFFFFF2FFFFE4FCFCD1FFFFA4F7FF66D7EB
        38C6E920C0EA1EC5F01EC3EA2BC4DF4AC7D66FC1C2729C8A7F855C7761278D63
        1CA0661AA86215B46312B96309BF6507C26607C46607C86608C96505CB6505CB
        6604C86503C86503C76604C76604C76604C76604C76604C56605C8670DC0660E
        B5640FA8651694641C7A5F1F726C3772876170A7946AC6C73EC5DB26C8EB16C2
        EC1AC4ED29C5E33EC6DE64D4E8A6F7FFD3FAFFEFFFFFF4FCFBFBFFF9FFFFF9FF
        FFF8FFFFFCFFFEFDFFFEFFFFFFFFFCFEFFFBFFFFFDFFFFFCFFFDFFFFFFFFFFFF
        0000FFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFDFEFEFEFCFEFFFAFCFD
        F7FCFBF5FEFBF0FEFCDBFAFBC9FFFF8AE1F14BC7DF2DC6E519C3ED20C9F529C1
        E443C4D769CACD5C9A88576543785E28A3671BB36005C46504CD6704CA6303CD
        6508CA6302CA6502CB6502CB6603CC6603CA6502CB6502CA6502CA6401CA6502
        CB6502CA6502CB6502CA6502CB6502CC6603C96300CD6502CC6100C86101C666
        08BA640AAA630C97681E695D235B765460A69F54C0CC3DC4E025C1E41CC9E91A
        C6E431CBE848C3DD9BEAFFCDFBFFE8FDFEF5FFF8F9FDF7FCFEF8FEFFFDFCFDFB
        FFFEFDFFFFFFFCFDFFFDFEFFFDFFFFFDFFFEFFFFFFFFFFFF0000FFFFFCFDFFFE
        FAFFFFFAFFFFFBFFFFFDFFFFFFFFFBFFFEFAF9FBFBFBFFFFF7FCFBF0FCFCE1FC
        F9C4FEFF75DAF339BFE724C2F015C0EE16C3EB35CAE463C7C770A48C6D6E4481
        61269B651EAB6512BD690AC46602C96500CC6500CC6100CE6301CC6401CB6502
        CD6502CB6502CD6502CB6502CC6401CA6401CC6401CA6401CD6502CB6502CD65
        02CB6502CD6502CB6600C86400CD6903CE6504C96202C66805C16905BC6400B2
        6203AA69148C60197365306E816082BBB35EC4D029C4DD18CCEF17C7EF26C6EE
        3AC0E28AEAFFC7FAFDE9FEFBF7FEFFF6FBFEF2FEFFF2FCFCFBFFFAFFFFFEFFFD
        FFFFFCFFFFFFFFFFFFFEFFFFFFFFFFFF0000FDFFFEFBFFFEFAFFFFF8FFFFF8FF
        FFFBFFFEFEFFFBFFFEFAFAFCFCF4FCFCECFBFDDEFFFFB8F6FC72D4E439C5EA21
        C3F31CC3F623C0E843C5D65DB8AF5C7D5A705F26A2621BBD6511C3660BC56605
        C36000C86400C96400CE6700CF6500CE6400CD6502CD6502CD6502CD6502CD65
        02CD6502CD6502CD6502CC6401CD6502CD6502CD6502CD6502CD6502CD6502CB
        6502C96500CB6701CE6504CB6403C56501C16400C96600CF6B05C56704BD680C
        AA6411926724645B2F5B816B60C4C638C5D81DC2E31AC4EE25C7F13DC3E585DC
        ECC8FCFFE0FCFFECFCFFEDFDFFEFFCFEFCFFFDFFFFFEFFFDFFFFFCFFFFFDFEFF
        FEFDFFFFFFFFFFFF0000FAFFFFFAFEFFFCFEFFFDFFFFFAFFFBFAFFFBFCFFFDFB
        FDFDF9FEFFE8FAFBD4FBFDAEF9FF54CDE02CC6E317C1EA17C1EB26BEE15CCAD6
        6B957C6A632C8C6019B56B19C1620BCC6407CC6302D06706C96206CF680CCA65
        03CB6600CA6500CA6500CA6401CB6502CB6502CB6502CB6502CB6502CB6502CB
        6502CA6401CB6502CB6502CB6502CB6502CB6502CB6502CB6502CB6403CB6201
        CC6100CD6502CC6704C96401CB6201CE6504CC6505C66202C26403B9680DAA66
        1986612361683D78B39F4BC1CC30C9E81CC1EC23C2EE3BC3E56CD4EBB5F9FFD9
        FFFFEBFEFFF6FCFFFFFCFEFFFDFFFFFDFFFFFEFFFFFFFCFFFFFCFFFFFEFFFFFF
        0000FDFEFFFCFEFFFEFDFFFFFFFEFDFFFBFBFFFBFAFFFEF5FDFDEEFEFDD9FFFF
        B2FAFF5FCFE125C4E017C9EC17C5E932C7E164CDD6669481786026AD6714C168
        0DC55F00D56708D76707D06301CF6605C86105CB6408C76200C96500CB6600CD
        6802CA6401CA6401CA6401CA6401CB6502CB6502CB6502CB6502CA6401CA6401
        CB6502CB6502CA6401CA6401CA6401CB6403CB6306CB6404CD6403CD6502CE66
        01CF6704D06405CE6105C95F00CE6706CC6500C86300C76507B4630E9962196B
        6230659D8A5CC7CF32C5E525C9F421C0EC36C0E46FD4E3BBFDFFE1FFFFF6FFFF
        FCFCFFFEFAFFFFFCFFFFFCFEFDFFF9FFFFFBFFFFFEFFFFFF0000FFFEFEFFFFFE
        FEFDFFFDFFFFFFFFFFFFFEFFF9FCFFEFFCFEDCFDF9BFFFFF65D5E934C8E61BC9
        ED14C3E434C8DE62C6C665805F7C5E23AB6212C56708C86503CD6704CA6303CA
        6303CC6704C96701C86602C96703CA6502CD6802CC6400CB6300CB6502CB6403
        CB6403CA6302CB6403CB6403CB6403CB6403CA6302CB6403CB6403CB6403CB64
        03CA6302CB6403CA6404C96108C86307CB6604CA6500CC6100CE6302CE6407CC
        6407CD6707C96402CC6603CA6401C96303C16107BA650F9D6016765C267B9A7F
        5AC5CC28BEDC28C5F128BFEB3BC1DF7FE3F5CAFAFFEBFFFFF2FEFFF2FAFFF7FB
        FFFAFCFDFEFEF8FFFFF8FFFFFEFFFFFF0000FFFEFEFFFFFEFFFFFFFFFEFFFFFD
        FFFFFCFFF8FBFFE3FCFFC9FFFF7BDBE837C5E420C6EF1AC4EE31C6E15FC2C057
        7C5A826221B86C19C26306C66000CF6A04C66200CC6705C86503C76501C66400
        C96701CA6600CD6403CE6504CC6401CE6603CC6504CC6504CC6504CB6403CB64
        03CB6403CB6403CB6403CB6403CB6403CC6504CC6504CB6403CB6403CB6403CB
        6404CE6609CA6306C86602CC6802D06503CF6403CD6306C96205C86404C66301
        CE6706CB6403CA6306CA6608C35F00C1660BB065177C5F2665947A60C4C837BE
        DE2AC4EF29C2E74ACBE6A0F0FBCBFAFEE3FDFFEEFCFFF6FDFFF9FEFDFEFDF9FF
        FFFBFFFFFEFFFFFF0000FFFEFFFFFEFFFFFFFEFFFFFEFFFDFFFFFDFFF4FCFBD7
        FDFF90E6F843C3E023C3ED1AC0EF2CC0EE5FC3D5647A5789651FAD660FBE6406
        C46809C16201C86600C86700C96701C86602C76501CA6502CD6502D16303D561
        08D5610ACB6005CB6407CD6606CD6403CC6302CA6100D06706CC6302CB6201CD
        6403CC6302CE6504D06706CA6100CC6302D16807CE6504CB6300CF6300D36A03
        C76400C66500D06706CE6405CA6106CE650ACC6508C55F00CC6505CD6609C563
        05C46302CB6603C76402C0650AAE65158D67276576545ABAC036C5E426C7ED26
        C2E549C7DF96EEFCDAFFFFECFBFEF7FFFEFBFFFEF9FCFAFFFFFFFFFFFFFFFFFF
        0000FDFCFFFDFEFFFEFFFDFFFEFAFFFCFEFAFEFFE4FFFFB2F3FC54C9E62DC1EB
        1FC3F22DC3EC52BED65C8980866226B7650CC7690AC56403C56609C36506C969
        05C66700C36501C76604C96604CB6604CB6403CE6405CE5B04CF5E07CF680BC4
        6302C86301C66100CB6604CD6805C96402C76200CB6604CD6805C96402C86300
        C76200C96401CB6604C66100C76200D16B08D06700CB6500CB6C04C76801CA65
        02C65F00CD6606C96202CB6505CB6707C76303C66504BE5E00C66706CC6704C8
        6400C66504C06306BE691389632358856B62CCD331C6E11EC4E92AC5E658D2EA
        B8F5FFE1FCFFF3FFFEF7FEF9FDFFFFFEFDFFFFFEFFFFFFFF0000FEFCFFFDFEFF
        FAFFFEF8FDFCFBFFFFE5FDFFBDFEFF6ED5E835C2E721C2EF23BFED4BC3D96A99
        8372632BA86215C5630BC56108C66209C35F06C76408C66406C26405BF6506BE
        6405CB6709C76305C46607C36504C86908C36501C56A01C26800C76B04C56801
        C56703C46700C06200C56801C66804C16400C46602C86B04C46602C46700C96B
        07C86B04C26400BC6000C46803BB6100BD6501C36904C76801C96600CB6600CC
        6701C46400C36603C46C08BA6200C66C07C26401C46100CA6908C56708C06608
        BF6507A765127664256A957450C4CB22C2E21CC5EB2FC4E680DCEFC9FDFFE6FF
        FBF2FCF6FBFCFFFEFCFFFFFEFFFFFFFF0000FCFBFFF9FCFFF9FEFDF5FDFCF4FF
        FFD2FCFF84E6F838C2DF22C4EE1FBFE93CC0DE5DAAA7626026A76C16BB6109C6
        6007BF6108C26814B46215AE6019AA5E16AC641CA7661CA56217AD6218AC6014
        A76114A86617A36112A96B179F6008A86A10A76512A76512AA6515AA6815A863
        13A66411AA6515AA6815A86313A86613A76212A96714A86313A4620FA96414AA
        6817A56615A26515A56517A56314A86411B06814AE6511AB630FAF6818A46112
        A36112A76615AA6817A56010AC6417B16618B3640DB96506C46605BC6406A766
        11706227599E8A4BCBD822C6E924C7EE4DC6E0A0EFFCD9FFFFEDFBF7F6F9FEFF
        FDFFFFFEFFFFFFFF0000F8FBFFF0F6FDF7FCFAF4FEF8E1F6F3BFFBFF48C8E51E
        C4EB14C6EF2DC3E175C9CE637655976719C6710DBE6503BF6709B6670CF0AF64
        F5CA97E1C19DE0C4A2E0C5A3DBC49EE3CAA2E5C8A1E2C59EE9CCA0E0C79DDBC6
        A0D9C6A1DAC7A1E0CCA3DCC59FE1CBA2E1C7A2DDC79EE4CAA5E1CBA2DEC49FDD
        C79EE2C8A3E0CAA1E1C7A2E3CDA4DFC5A0DFC9A0E1C7A2E0CAA1DAC99ED8C89E
        E0CAA6DEC6A2E0C9A3DBC6A0DBC8A2DBC8A2DAC4A1DDC4A2E5CBA7E0C6A1DDC7
        9EDCC59FDBC5A2E4C395FAC378AD6206C9690CCB6306C26205A166175D622F69
        B09C3DC7DD20C6EB2BC1E562D4EBC6FEFFE8FDFBF8FCFFFFFDFFFFFEFFFFFFFF
        0000FAFCFFF4F8FDF8FBF9EFFDF9D8FBFE8EDFEE2DC3E811C4F115C1E54FCCDA
        678E757F6327B1660ACB6B00BE6000BE6707B6690DC1873CFFF7CAC1B49AA09B
        8C9F9D929E9D8F9A9A8A9A9A889B9987A19D8A9D9B899DA09194988C9D9E9498
        978D9D9D919796889C9B8D9C9B8D9C9B8D9A998BA09F919E9D8F9C9B8D9E9D8F
        9C9B8D9D9C8E9A998BA09F9199988A9B9B8D979A8A9C9F8F97978B9A9A8E9A9C
        90979B8F919A8D979D929A9B929C9991A29E939E9B8D9FA18E999B85B2A995FF
        E8C3B8823BB5650CC76108CD5E02D26202BE670B91691E677E525CC3C531C7E5
        22C5EC37C4E593E2EFDAFFFFF1FCFFFEFDFFFFFEFFFFFFFF0000FFFDFFFEFCFC
        FCFDFBE7FCFEC0FBFF5BC2E227C5F313C0EE36C8E45AAFAB6C612FA96414BF65
        06C66200CE6907C76507BD630AB1661AA6743AFFF5D0BCB5A4A6AAA5D8DBD9D8
        DCD79EA69CB9C1B6D4D9D0BCC1B890988ECCD1C8D9D7D6ADA9A8979692DEE0DA
        D9DBD59698929A9C969B9D97959791999B959A9C96989A949698929C9E98999B
        959698929EA09AD8D8D2DFDCD8ACA9A5ADAEAAD8DCD6C9CDC7989F98B0B7B2D3
        D9D4C2BEBDA59E9BCFCCC8DBDCD2A5AE9AA3A084FEDEBBA26735B46215BE5C04
        D0660ECF6206D06000C46302B26B1372601F629A8751C6D523C3EB25C3EB5DC7
        DEBAF8FFE6FBFDFCFEFEFFFFFFFFFFFF0000FFFEFFFAF8F7FDFFFEDDFAFF97E8
        FF42C2EB15BEF123C8EF56C9D44D7A6090631FC26508C76402CC6603CC6302C9
        6202C7630ABA6110AE6822BA8B57FFEFD49F9D93D6DAD5F2F9F6C6CDC89EA5A0
        FAFFFEEBF2EF969D9ABDC2C0F7F5F5D9D6D8989898E1E4E2F6F9F7B3B6B49A9D
        9B9396949A9D9B9699979699979B9E9C969997969997999C9A989B99A6A9A7F9
        F9F9F9F4F6A19C9ED4D5D3F7FAF8D4D7D5929795E8EFECF4F9F8A8A3A4C2BDBC
        F7F5F4D9DAD09EA08AF8E6C1B9834EB66521C5630FD1670AC65D02CD6306D467
        05C86200BD680597681758623870BCB830C3E31DC4EF41C6E291E9F9DDFEFFFC
        FFFDFFFFFFFFFFFF0000FDFCFEFAFCFCF6FCFBD2FAFF63CBF02AC0EF15C7F62B
        C4DF70B7AD606032A86716C96703CA6401CB6502CA6600CA6502CE6707CA640B
        BE6211AB611FCBA275FCECCF9E9E8ED9DED5F6F6F0A9A8A4BFC2C0EEF4F3C9CE
        D18F9394EAEAEAF7F8F6A1A1A1D3D3D3F5F5F5D6D6D69797979898989C9C9C99
        99999B9B9B989898989898999999999999969696C9C9C9F8F8F8E1DFDFA4A2A1
        F9F7F6F8F7F3A09E9DC6C7C5F7FAF8CBCECCACAAA9FAF6F5E6E2E1A9A194ECD8
        B9BB915CAC6417C16409CB6403D06503CB6604CA6503CA6401C96500C16800AB
        680C89632370896D4AC7DB19C2E82ECBEC5FD2E7CDFAFEF9FFFDFEFEFEFFFFFF
        0000FAFFFFEEF7FAE8FDFFB3EEFD46C5EC1BC0F114C6EF3FC6D674957A866123
        B6670CCB6600CC6603CB6502CB6603CA6401CB6300CF6506CB630ABF6314A565
        25CFA777F2E0C3B1AA99E4E2D8EAECE69DA2A0D8DCDDF3F3F9ABACB0C6C8C8F6
        F9F7D0D0D0ACACACF4F4F4E9E9E99B9B9B9B9B9B979797989898969696999999
        9B9B9B9999999B9B9B9D9D9DD1D1D1FDFDFDB2B2B2BBBBBBFCFAF9D8D4D3ACA8
        A7FCF8F7EFF0EEA4A7A5ECEDE9F0EEE6B8B0A3E8D3B8AD8152A6621FBD670DC4
        6200CD6600CD6500CB6603CA6503CB6403C96401C66700BD6707AC64166E6135
        5CBABF2AC3E21AC2E43DC5E1B7F5FFEFFFFFFAFEFFFFFFFF0000F8FEFFE2F6FB
        D1FDFF84DAEC2EC1E716C4EE1BC6E65ACBCE6D6F45A76419C06607CA6500CB66
        03CB6604CD6606CB6102C96300CA6600C86301C7630AC06314AA5D1EBF8E60FE
        E9C9A7A894B4C0B4A2ACA69CA1A0C4BEC3AEA7AC949696B6BBBAB0B2B29B9A9C
        C2C1C3BFBEC099989A99989A9796989B9A9C99989A9C9B9D9A999B9695979897
        99969597B2B1B3C5C4C6949599B1B3B4BABABA9C9A99ACA7A6BEB9B89EA0A0A1
        A6A4B6BCB7ACA99AD9C8A7A37C48A86018BB610CC46407CB6806C96600CA6700
        CC6504CD6304CD6306CA6303CB6403C66307C66815825922659D9047C6D51DC5
        E42CC5E48CE1F1D8FDFFF3FFFFFFFFFF0000F2FEFFD9F9FFB7FBFF5BCAE025C4
        EA18C8ED2AC5DC66BFB6765F27BB6610C86705CB6400C96401CB6505CE6407CA
        6303CD6903C66500CE6A04CC6504CD6207C56616A55D1DBB9261D3CBAD9CA695
        AEB8B29B9FA0A7A0A3BBB2B5A5A5A5949998B7B9B9AAACAC9796989698989493
        959A9C9C98979996989899989A989A9A9897999597979C9B9D93959598979995
        97989D9EA2B3B4B8999B9C989799BBB8BAA2A0A0989A9BB0B4AFABAB9DC9BEA0
        C8A6719D621AB96008C76101CB6505C56000C76600CA6600CD6403CF6304CD63
        06CC6106CE6105CF6206CA60089E611D5A715168C8C828CAE623C9EC61CBE3C2
        FCFFE9FDFFFDFFFF0000EAFFFFC5F4FC97F3FF3FC4E01EC4EB21C7EA43C4D35B
        96828C641CC56704CC6701CE6400CD6200D06405CA6106CB6505C66500C56500
        CA6600C76200C96201C86509C26813A6631ED7BA8ECAC3AFE4E5E3D1D4D89994
        95D9D4D3DBDBDB989A9ACBCDCDDDE2E0979999969B999496969398969B9D9D94
        9997959797959A98979999959A989A9C9C939896979999999B9BD5D5D5D8D7D9
        98989EC9CCD1D7DBE0989DA0CACCCDE6E1D8C8BBA1CFAD7FA4631EB96611C365
        06D06B08CA6200CF6801CA6500CB6600CF6403CD6304CB6306CD6207D26006D2
        6005CD6201AD6311665E297FC0B030C8E117C4EC47C4E3A6F3FFDEFCFFFAFFFE
        0000DFFFFFAAE5EF7CE6FD34C5E516C3EB27C7E75EC7D0486A4C9E6918C86600
        CD6600D26601D06301D06504C96104CB6505CD6A02C96400D16906CD6403D06A
        07CC6705C56206B464178F622FF6E3C8BEBAB5DADEDFC3C1C09A9995EEEFED9F
        A1A19FA1A1E9EBEB9FA1A19A9C9C9698989395959A9C9C989A9A989A9A979999
        969898969898969898939595979999A1A2A0FFFDFCA5A3A3ACADB1F5F9FE9DA3
        AABABFC2EBE9E9C3B8AACBB5918B5F24B26417CB6A10C46000C76100CF6600CF
        6300CF6500CD6502CF6402CD6403CB6404CB6306D16206D36204D26803B5660B
        866422739B7F3AC4DA17C3ED37C3E77CDCF3D5FAFFF7FFFE0000D3FFFF99DEE8
        6CDDF72EC4E814C2EC2CC5E473C8CA4C5A36A56915C96700CE6400D16402CF67
        04CB6502C96401CB6502CA6200D16402D26002CF5D02C95F00CA6608C3660BAD
        5F12DBA974604523B9B1A4BABEB9B5B6B4989B99A0A7A4ACB3B0919092BDBABC
        A4A1A39E9B9D9A97999E9B9D9895979996989B989A9A97999A97999B989A9C99
        9B9B989A9C999BA4A2A2C4C0BF9D9B9AB0B0B0A6A8A99A9DA1B0AFB1BFB4B0B7
        A48F8E774AD4AA69AE6112C26008CC680ACD6403D16500D56602CF6304CD6304
        CF6402CD6502CA6503CA6503CD6403CD6502C56400B6670696651965785149C6
        D51EC6EF2EC4E862D0E8CDFBFFF2FFFF0000CDFFFF93E1EE62DDF925C2E911C5
        EF2DC4DF83C5C0666035A96512CE6903CE6302CD6201CD6805C66400CB6701CA
        6600CB6403D06607D46207D16206CF660BC05F07B86313A45B17DEA26E744823
        CAB49BC3BAADBDBAB6969898A8AFACA5AAA8989799B8B5B7A7A1A69B979C9E98
        9D989499A09A9F9C989D9B959A9A969B9E989D9C989D9D979C9B989A9E989DA4
        A1A3C3C1C09C9D9BA9AAA8AEB1AF989A9BBCB5B2CBB3A7C4A1879E7445E0AB6C
        AD641ABA6412C26109C96205D06504CE6203CC6407CB6306CF6402CD6500CA65
        02CA6502CC6603CB6701C86901BB6707A66514797B4D5AC9D120C2E528C4E75A
        D3EDC6FBFFECFFFF0000C6FFFF84D5EA4ED4F21CC5EA07C5EE33C9E179AA9C7A
        6031B36715CD6606CF6304CD6304C66503C56801CA6700C86600C46504C66608
        C56101C86404C8640BBB6212B36B2BDF9D689146187B360E6C3A16CAAB92BCAE
        A8C8C6C69E9F9DC9CAC8ABABAB9999999C999B99989A9B989A9B9A9C9895979C
        9B9DB3B0B2B4B3B59693959C9B9D9996989999999D9A9C989898989A9AA0A5A4
        CCD1CF999E9CBFC0BEB8ABA3E3BAA47B3E1E80340A954915DA9C60A3631CB362
        0DC36609C9660AC56004C76408C86404CE6400CE6500CB6600CB6603CC6802CC
        6802CB6603C56708B0620F72643060C0C02EC8E525C8E942C4E1B9F7FFE6FFFF
        0000C1FFFF6DC9E23DD0F011C7EB06C7EF37C8DD75957D8A5F26B96414CC6407
        CD6306CB6404C66503C76703CA6700CA6700C26403BF6304C46603C16304B95F
        0AC5752EE49E697B330988320889340C76340B673818DCC1B3D0C4C0CFCAC7A6
        A4A3E6E7E59A9A9A9797979999999A999B96959799989A989799BAB9BBBBBABC
        9A999B9595959B9B9B9B9B9B969696999B9B969899CFD1D29EA0A0B8B7B3D6CE
        C7BFA89866371B78320D92350E92360B824311E6AF72A86417B86811C05F08CA
        640BC66307C86404D06601CF6600CB6502CA6502C96500C96400CB6201C86307
        BA600B7D602760AFA635C6DC20C5E635C1E0A7EDFADFFFFF0000B5FFFF56BEDB
        26C6E806C6EB08C6F140C6D873836199601BBD630FCB6306CA6404C86503C864
        04CB6604CB6600CA6500C76500C86804C96402C1660BBA7225EBA8697F31028C
        350D96360E8D320B7E360E965E3BC79B84DBBEB0AB9F999997969E9F9D929593
        989B999598969698989D9F9F989A9A969898A2A4A4A1A3A39799999496969799
        999699979497959999999895979C97999F999AA69A94CBB4A4C8A68E71472474
        370F882D0895340E84360B904F1CE8B271A16015C66815CE620AC96303C96401
        CD6500CE6601CB6403CA6503CA6401CC6400D16303D06609C6640C8B60215E9C
        8C46C8D922C6E92EC3E592E0F0D5FFFF0000A7FFFF50C4E31BC2E706C7EF0EC6
        F44DC6D9787F54A86618C1620BCA6303C56402C66503CA6404CB6404CD6502CC
        6400CC6802C56501C56508BA6412D894518D49148C370A94380F8C340B86340B
        8D421CE7A3806F321274432DDDC3B7E8DDD99E9B979396949699979C9F9D9294
        94959797979999989A9A969898989A9A9698989A9C9C999C9A989B99999C9A98
        99979D9A9CA59D9EE3D0CDDDBDB26C3E26804D2CD6A57F81461F8A36138D2F0C
        89320A7F33039E632BDE9E5DB65E11CB670FCA6404CB6502CA6401CB6502CA64
        04CB6404CE6603D16604D16303CF6304C9640892601E5A88754FC6D520C4E729
        C2E781D8E8CEFFFF00009CFFFF49C4E41DC3EA0CC4F213C2F453C5D670713FAB
        660FC36306CC6302C56501C46603C86404CB6404D16303D06301CA6200C86A09
        B76712D58B43AC602B8534078C31048B3608763A0C9E643ACC7F5E8732128433
        0E77300F855341E0C1B8ADA59E9FA09C999A989798969FA09E9A9B999A9A9A95
        9595B9B9B9B8B8B89B9C9A969795989997979896979894979A98909593B2A9A5
        DAB2A67D402C8038167B30097B3615C986678B442381300D8E3509892F008A38
        09BD7038CA7F3AB76714C76709CE6603CA6503C86503CA6404CC6203CF6403D2
        6503CF6403C96201C6640695621C587F6955C5D21EC1E726C3EA78D4E5C8FFFF
        00009CFFFF41BDDB20C4EE0EC2F313BFF354C4D663612BAC6609C56403CC6400
        C56501C46603C86404CB6404D16303CF6403CB6407BD640CB57124D491548B38
        0B8A2F088E320985360B9D6639B780557E2C098C2D0C9037128537136A301395
        6D5AFAE4D8B3A79DA69991A69991A0938BAA9D95A69892A59791AFA19BB3A59F
        A49690AB9E96AC9F97AA9D95A99D93A2988EA69B93E9D1C56835217930148937
        0E8D370D8834117D2D0EECA5849147238931088F32059234098B3604E39D61A8
        6215C1650CCA6503C76303C86404CC6504CD6403D06202D16303CE6603CA6503
        C7660598651F59806A57C7D31DC3E627C8EE70D2E4C3FFFF0000A6FFFF49BED9
        23C5EF0FC3F714C1F957C7DB66602BB3690BC36501CA6500C86602C66503CA65
        03CB6403CD6403C86406C46613B16015FABC7C813F0A8F330892310D85310E79
        2F0DE49E797B300993360F8B2A0488320E7F3914A7744CB68E6B70482FD3AB98
        C9A18EC09885C59D8BC39B89C49B8CC79E8FC39A8BC09886C09886C29A88BC94
        81BD9582C49C89C49986DEAC9A97624DD8A2839B5D39762B0488320893310795
        360E82310BFFB4908634118C34109133088831008F4914E19B58BA6712C16506
        C46204C96303CC6603CE6601D16303D16303CE6301CB6502C465048E621B5081
        6B4DC7D319C4E423C7EA67CDDFBDFFFF0000A8FFFF50C4DD1DC1EB08C0F413C1
        F656C3D86E632FB26308C66602CD6600CA6502CA6503CB6403CB6403CB6403C3
        6309BB6618D185439F5C2580350792320A90300C7E3111EBA4838B401A88360D
        93330B91320B83320FC2815BAC75486C3A0C70350E7637157A3D1D773B1E723A
        21713C276C39256B39256C3A266B3A24703E286A3821724226724022763B2180
        3D2284381B80331277360FC2845CB66F4986330D9531079933098B330A8F4019
        CE84627B2F0B8D350C8C3608823405DD945AB66B1FB9670EC46105CC6203CB66
        00CB6600CE6302CF6403CE6301CD6704C665048E611851856D4CC8D218C5E620
        C6EB60C9DEB8FFFF0000A3FFFF48C3DF19C3EC08C4F415C2F459C3D4706031B6
        630DC86404CD6300D06503CE6504CC6603CC6504CB6403C1630AAC6417D59051
        8B37078D30098E2E0A8C3410C5805F98563381360886340591370E8A3410DF95
        73934F2A7C380B7F38068135018435048537097A330E6C31176C3925572A1C5D
        3425522F1B56311B572C175E321A5C3814663A157B35178935128D3106933708
        8B360981350BAD6841BC704C933315922E0C8F3004853304C6885F82451D7D2E
        078C350D8E35098B3A07F5B777A76316C7660CCD6000C96500C96701CC6504CD
        6304CB6403CB6403CA65039562195384684ECAD21BC4E91EC4ED59C6E2B1FFFF
        0000A1FFFF46C2E017C4EC06C5F216C3F15CC5D3706031B8620EC96505D06400
        D06202CE6504C86300C56200CD6707B95F0AAB6B24B9793F8A2E039534108931
        0D934521E9A4837D36118937088D3808853008C77752B0644080350E89370889
        33009236019133008B2F0089370DD69D7EBD9B8BA8A29B97A09D9FA6A19EA59E
        A4A79EADA997C3AE8EDBB089873D198A2D06983404932E009232048A33077B30
        09F4AA869D4A2B872C0D94350A8C3608702E05EBAD877F38127F2C069234098F
        3A08C58A52AF712BC5640DD36604C76501C46400CC6504CA6303CB6404CA6503
        CB650299621754846750C9D21BC4E91EC2EF56C5E5ADFFFF0000A3FFFF48C2E0
        17C4EC08C5F215C3F15CC5D3706031B8620EC76303CE6400CD6201CE6706C463
        01C46504CA6C0DB2600EE1A4668A4A1A8F320B90320E7A330EE09E7B92452487
        300E8F2F0794360B96471ECC82588430068D35079337049633019831049C3307
        9B3200872F00955F3CC2C0AE71B2BB64C2D93789A25DADC46CC4D575B2B4C3C2
        ADA275507F350B8E33069432049732059532068E3104893206823209D9957288
        401E8C310C8D2C088C3311BC6D4CB26E497E360C8D31008E34007D3C05D89753
        BD600BC96202C36100C96703CB6403CB6404CB6403CA6503CB65029763175484
        6850C9D31BC4EA1EC2EF56C5E5ADFFFF0000A5FFFF4AC2E01AC4EE08C5F215C3
        F15AC6D2706130B6630EC56403CF6500CC6302CB6604C26401BE6405B96408B3
        6518D7965F78300693340D8B2D0997532ECB8B68812F0C9034118E310A873008
        E79C7591471D8E3306983404962F009B3102982C029E3006A033008E34056C38
        14989A8775BDC55DBDD44F9DB45AA6BC61BBCC79B9BD9D9B8962321084350A93
        3305972F04983005902D0199370992320490390D8B4821CE8D67883410943311
        92300E7F2905F9BB937334088D31009234007C3300D48F50BA6110C66609C665
        03C86301C96202CD6304CB6403CA6503CB650297631754846850C9D31BC4EA1E
        C2EF56C5E5ADFFFF0000A6FFFF4CC1E01AC4EE06C5F213C4EF58C6D26F6130B6
        630DC56403CC6200CC6302C96604C46605BA6607B2650ED68B41BC703B893609
        9432088F330ACB845E8D47228C320F8F340F7F310CA9623CC9825C83330A912E
        02A033079B2E029B30049D3206972D009F33038E3509774424FFF5E0BBC6BEB7
        C6C2AEA8A1ADA69DA2B0A5CDD4C5FFF5DC834E2D862B06A032089F2F049A2F03
        993407902E0096300093340882330AD7906A762B048432098F3005893407BA83
        589A60369334089A340489390AC47A40B05E11C0660DC76507C96201CD6304CC
        6203CD6403CB6502CA650295631754846850C9D31DC3EC1EC2F156C5E5ADFFFF
        0000A6FFFF4CC0E11AC4EE07C6F314C5F058C7D16F622EB6630DC76605CA5F00
        CC6302C96505C36708B8650AB26917F2AC668835018B32069534088E3209CD84
        5E772E0892330C8D320B783913D299727E350F8931089831049C2D00A3350B9A
        2F039B31029730009932018B2F04975735B4856A795039582C1471371A6B3213
        5C3215744C2FB38464A05C3993300A9F2D059C2B039A2E049630059530039D36
        05963202872F06974A23CA87607934098C30018934046F380DDDA27A8E320793
        3004802900AE602BD88A43B5620DC26205D06706CD6304CD6403CD6502CB6502
        CA650294631753846850C9D31DC3EC1FC1F158C5E5ADFFFF0000A8FFFF4DC0E1
        1CC3EE09C6F312C6F056C7D16F622EB6630DC86706CF6402CC6302C96303C062
        03B15F06A46112DE9A578A37038F33088E2F0789300BDD936F7E300B902E0690
        360D89552DB5875E7C32089134079C34059F3304982C009C3203963000973402
        9633008E31008D360E822E0A8936108C3A1088370A8A3C0E7C3405853A0E8530
        0A91340D9A360C942A019D2F0D9B2E0E962E099A340A9832029632028E2F0386
        340BD39A736C31098A36068C340575320BEDAC868533098B32068F350C883502
        FFBA77B16513C36306CE6302CC6001D06504CF6402CD6500C866029463175384
        6850C9D31DC3EC1FC1F158C5E5ADFFFF0000A8FFFF4DC0E11CC3EE09C6F312C6
        EF56C8CF6F632DB6640BC56103D16604D06504CB6404C46406BC6711A66318C4
        81428C38048D3205872F07A3502AAE633D8030079B380C872E02A77049804C27
        803108892E018E33069032049834049832019834049132018E35038A35058730
        0490340B9031058F2F018F33028B32009035028D340291380C893109802D0789
        35128B311293371A8B32108C340F8B35078F37088C32097D2F0ABE8C68925F37
        8735068C3203833510BE7450AA5B328733098C2F08883204D69152A66112C161
        07D16605CF6304CF6403CF6402CD6500C8660292641753846850C9D31EC2EC1F
        C1F158C5E5ADFFFF0000A6FFFF4CC0E11CC3EE09C6F312C6EF56C8CF70622DB8
        640BC86406D06202CF6200CE6504C96507BD6610C5803ABC793C8D3500903405
        7F2F06B96E47994C1E893505943301933609C07A557431107F2E088432097A37
        107534088A39068E32009432028D30038234097A360B76350976310683320C8A
        320A8A2E0594370A8D2F018C37097632076D3611633218623019672F12FCC3A3
        844B2B72381571330A76340B7C36117233118B5C3DAC76538631039234068D35
        10A55330B1643D8232098F30098F3308EEAC71A56118BE6209CC6302D06405CF
        6403CF6500CD6500C8660292631953846850C9D31EC2EC21C1F158C4E6ADFFFF
        0000A6FFFF4CC0E11CC3EE09C6F312C6EF56C8CF70622DBA630BC76305D26404
        D26503CF6403C76003BA600CCF8946AE69308F34018F3205813610EEA9828335
        068C37058D3604812F05B474566C3117773719814829C1997DFFDEBD80390D8F
        38069333059E471BD59670C5936FC89973CD9971C4805DB16443B86744B1603B
        9D4A24873F17794820AE8B69A1806CA5847180583C9B7154FFDEC4805F455D37
        19FDD4B4D4A58A70422AE1BCA26E3D1D8534079636088B300B86320ECA825A84
        350C8B2A0492360BBF7E47A06019BE640BCC6302D06607CE6302CF6500CD6500
        CA650294631953846850C9D31EC2EC21C1F158C4E6ADFFFF0000A5FFFF4AC1E1
        1AC3EF09C5F512C6EF58C7CF72622DBA630DC96408CE6302CD6000D06503CF65
        06BF620DD48C4C8138049233078F2F0B763012F4B19288340A8E390B7734076D
        39158E6953A48778DDC3B3FFF6E7FFF9EFE4C7B97531148D340F8E32079F5027
        FFDCBB87694E5535186037176B33107336146A3215703A1C6C331463300F5832
        124E311252331A5B341E6837219C715EFFFAEEFAF1E4CCBCAFFFF6E9FFF5E9F2
        DBCCFFF2E0D0A98D84350E9A3B0F8A3209803108CD895E833A0E903008903207
        BE7E48A76824BF670DC86100CA6001CF6605CD6500CD6500CA65039562195384
        6850C9D31EC3EA21C1F158C4E6ADFFFF0000A3FFFF4AC1E11CC3EF09C5F514C6
        EF58C7CF72622DBA630DC76206CE6405CD6200CF6500CD6403C0600CE59D5D7D
        3402902E06902F0D753114F2B29385310788370A9D653CFFE4C4FFF3E0FFFAEE
        FFF7E9FFFAF0F8EFECFFF3ECDAA18882310E8D350D7E300BFFD3B85B402BF2DA
        C2FFEDD08E5B3AE3AE8DFFEDD4A9836B865C3FFFF0D3FFFBDEFFF9DCFFF3D6B9
        8E7369331AFFDBC5FFF1E2FFFCEEFFF7EAFCE1D3D2B2A5C5A697D8BFABFFE1C5
        8135118D320B85300886370EB06D407D32068D2E03933609B67542BB7E3CB862
        08CD6805CC6505CA6100CD6500CB6600CB640395611A53836950C9D31EC3EA21
        C2EF58C5E5ADFFFF0000A1FFFF4AC1E11CC3EF0BC5F516C6EF5AC7CF74622DBA
        630DC46007CC6505CC6603CA6500CB6300BD5E07E8A060823B0994350A8D2D09
        762F0EF4B49183350A8035076E37125D311261381F55301A5538234E36244C34
        28523423744B2A9D5F398D3412872E139F634DDCB4A1A088728F74596A3514A0
        694AC7A08A7E5D495C3417D9AE8D673F23583014DEB5956A3C1A6F3B1383522C
        563716583618642D0E7832147F32187631167F4E34FFF4D8A85F418D38188733
        0F7D2E07AF673D883A0F902F03943809B67441BF7F3EB66308CA6804CC6505CB
        6102CB6600CB6600CB640497611A53836950C9D31EC4E91FC2EF58C5E5ADFFFF
        0000A1FFFF4AC1E11EC2EF0DC5F517C5EF5CC7CF74622DBA620EC3620AC66202
        C56300C86500D16904C06209D58E4B7D36049134078B2E077B340FF5B48E7D31
        07823A12D19A7BE6BA9DFFEBCEFFFBE0FFFEE5FFFAE3FFF8E7FFFBE7FFF6D77B
        4925842D0D903215772F17F5C3AD72533AEED0B36A3716652F10F6CEBBE8C7B3
        6A4426AD8666AC846B7A4F34D9A4836A330E67330BD9AD88D4B896D5B2919C5E
        3A8533109132118E3314793617EEB294E8A78B7832157E31107E300BC87D5684
        3209943406933706BC7745AB6B2ABB680DC16100C86101D06607CB6600CB6600
        CD630499611A5483694EC9D31EC4E91FC2EF58C5E5ADFFFF0000A1FFFF4AC2E0
        1EC2EF0DC5F517C5EF5CC7CF74612EB8620EC1630AC46302C66602C56400D169
        04C1630ACC86439C582387300090380A7B330BFAB48F80300BB66B4BFFECD68F
        624D956B4EB48869E3B79AFFF4DCFFF7E5FFF8E7FFF8E45F321789351193340D
        823312753517906342CAA180C99B79926445A97E69C39C86977256705033DAC2
        A6D7B3959553307E3715653218F2D1BDFFFDEBFFFCE98D664A713113832B0D8B
        2E0F7E2D0C9C5C3AFFE5C66638197434117F340EE0926E822D078F2F01953A07
        B8713FA36120B7660BC26500CD6707CC6203CB6502CD6502CF63049B601A5483
        694EC9D31EC4E91FC3EE58C5E5ADFFFF0000A1FFFF4AC2E01EC2EF0DC5F517C5
        EF5CC7CF74612EB8630DC26508C36502C96905C46200CD6704BF630AC7803CB8
        733A8C36008E340582330AC277518E401C792F139D6151632F1FA97A5E683816
        7035157A4225B1886FD7B59EFFF7E0C390768834108E310A8335116F2F0C8754
        2C7649239664408C593966341D8E5F498961457D593B99775AE5B69682350E83
        330EA76F56FFF3E3FFFDEDFFFCEAD5BBA3BF9277A960448230117E33136D3415
        ECCEB1A5896B6F391887401BB6684489310C9233078F3603E29C66A5621DB565
        08C46602CC6504CC6302CD6502CD6403CF63049B601A5483694EC9D31DC4E91F
        C3EE58C5E5ADFFFF0000A1FFFF4AC1E11EC3EE0DC5F317C5EF5CC7CF76612DBA
        630BC16603C76801CA6502C76101C86406C16611A76114C07A378A3000953605
        8C2F08AF5935A9603A722F107F372B742F25B47B62713412802F0C8E36118830
        0B81310C8B4B28DA9875B057359A411FBF7856A56E47A87B5074441AA2643BB1
        6D48AF7153D69D83E2AD92E6B091E3A6868E47218932068A370AAD6D4AA67456
        A0725AB8937DFFF7DEEFD4BAF6C7ACFFD4B9BC8B716E4A329F8C77FDE6D06333
        17AE6E4BAB61378532058F3106923B09C88645A56616B7670AC26401CD6502D2
        6503CF6403CD6304CF620699601B54826B4EC8D41BC4EA1EC2EF56C5E5ADFFFF
        0000A1FFFF4AC1E11EC3EE0DC5F316C6EF5CC7CF76612DBA640AC26601C76600
        CB6403CD6508C66209BD630EB06717EAA25C8D360094340693300A862C0AD38D
        68703017843D3A6D2727965B48B4735487320C9330049B30049932058932068D
        38109335118B320D853C1675390F69360B7B471E72310B7633126C3215683318
        6634186C3313762F0A88360D8E320390360784360B762F097C3514723317976F
        53C3A1845B2C109D6D51FFDDC6F2D5C0BDB19FFFF5E25B361CDCA181863A108A
        33078C3209822E00FFBD76A86510BC6809C66503CC6401D06301CF6304CD6306
        CD630697611A54836950C9D31BC3EC1EC2F156C5E5ADFFFF0000A3FFFF4AC1E1
        1EC3EE0DC5F316C5F05CC6D174612EBA630BC46704C66400C86100CC6407C964
        08BB6109A85E0CE8A0588D3B018A2F028E2E0A8E3416CB876A662B1C8043515F
        2433612A23E0A3897D30098F3708963202932B009A3508902B00963202913201
        95390A8330038E491E985C3869311867351F5F351E59341A5D361A6A3C1AB779
        5184350A8F340790300290320494370A92310D9236137D2F0A79340D7E37157B
        3B1D622C15AA8773FFF7E3F7F0DC482E16E0AC8E832F0B9030088E360EA65424
        E9A15BB36610BD6304C76501CD6605CC6302CD6306CD6306CB64049763175484
        6750C9D21DC3EA1FC1F158C5E5ADFFFF0000A3FFFF4AC1E11EC3EE0DC5F316C5
        F05AC6D174612EB8640BBE6300CA6802CC6504CA6303C76305C2650ABB6B16E8
        9F55A3561E8C380E90300C8C3213C37E63632D266F3E5E5D2C4C642B29C28269
        9D58318032049535079D3408992E02A137089732009836009934009134038436
        08CD8D6AD8A690C39C8DAB907CC5AD97CBAD92D8AD8C85441D8331078A2C0198
        31049830019A3001992F06932D0397360A8831057E330CB67352904E355D2B14
        DBC7AEC1B49A775940B27C5E89310D913109863109BA6E3ABC6C25B45D07CA69
        08CB6502CA6503CA6404CB6306CB6306CA650395641654866450CAD01EC3EA21
        C1F158C5E5ADFFFF0000A3FFFF4AC1E11EC3EE0BC6F314C5F058C7D172612EB8
        630DC06503C96701C96201C86101CC6606C46508B7630AB1661ACE875582350E
        94350E8C300DA05D3EAA77755B3567754A7D763632752D0FE1A1827C34129332
        0C9F330A952B02942E039432029333009C3601953500833506FFC9A3F9C7B0E3
        C1B1FFF7E7FEF2E0DABCA3FFE6C6A7603B8C340C9A360C972E039F2F049C2F03
        9835099635099030028E370B703209CC906C7F32127B3315AE815F5F3A18EBBC
        9C6C2C0A8630068C32037D3204D28850B76016C26109CC6505CA6200C96604C9
        6505CA6306CA6306C8660294651453876252CACF20C3EA21C0F258C5E5ADFFFF
        0000A3FFFF4AC1E11EC3EE0BC6F314C5F058C6D2726130B8630DC06503C96703
        CC6504CC6302C96201C05F00C16A0EB06314EBAB747530058D31068D30097931
        0FE9B3AC624069724A746F26227D2D109D5C3DB77453832B0792310B98340A92
        3002943204953200942E009636008934047B350D6530157F5E4BFFF5E5FFF5E5
        462C146A3B1C9544218E2E069830059C2F039F2F059C31059331038E32038D35
        0784360BB97F55A1643C8834108938136F340C79471DCD8E688436118B32068A
        3203833C0AE69D61BC6013D26A11CA5F00CC6100CB6806C46302C86406CA6404
        C6660292651453876252CACF20C3EA23C0F258C5E5ADFFFF0000A3FFFF4AC1E1
        1EC3EE0BC6F312C6F056C6D2706130B6630EC26405C76200C96201D06706D169
        06C96604C5690AAF5F0ABB803BAD70388732028D310684330E8F503BA17E826C
        434B7C2C258227127B310FC887608948227830088D3709953303983001993102
        9B3804943400953605812F06935A3BBE9781D5BBAB786151C8B098A478598431
        0B9A3106A135069E30009C30019931029430008C31047E360C9E6037C5875E7A
        340C8C340C89350B713408EAAF828A3B108C3007902F098F3308B36931C47935
        C46313CC6106D36505D16604C66301C46302CA6404CA6404C666029265145386
        6452CAD020C2EC21C0F258C5E5ADFFFF0000A3FFFF4AC1E11EC3EE0BC6F312C6
        F056C6D2706130B6630EC46607C86300CB6403CF6704CB6300CB6502C56402B8
        650AA8681AC587478839068B340884300678310FCC9E8C8B584E79261E8C301D
        82320D803B10F1B891884B238134068D34029831049B31029A35019231009233
        08832F0B945638C5957DB58A7778503DFFE0C8D19F8186341198330C962E0099
        32019531019432048F30048531078C4922ECAD877C340C8232098E370F833409
        AB6A3DA765358D35069433078E300C8A3508FFB97BAF6115C3610DD06307D062
        02CA6200C96703CA6705CA6503CA6503C6660292641754846752C9D220C2EC21
        C0F258C5E5ADFFFF0000A3FFFF4AC1E11EC3EE0BC6F312C6F054C7D2706130B6
        630EC26306CA6503CB6403CD6502CD6500CB6600CA6502BF6507B56617DD9555
        873C0E82330A8837048134067B3920E8A49776271C8B352188320E8031068945
        20FFC29C88461D85370C9335079932019E360192300084320F7A31157330157E
        3E256F301B783722702E1577321784361F812D118F350C8D31008F3506863103
        83340B863B15DC8F6E88371489340E8B360E7F3009833B13D894698035078F34
        018E310085360DAA6232C87D38BA6712C05F05CD6508CD6403CB6502CD6903C9
        6500CB6502CA6503C6650492621A56836954C7D41EC2EC1FC1F158C5E5ADFFFF
        0000A3FFFF4AC1E11FC3EE0BC6F312C6F054C7D2706130B8620EC36306CB6403
        CB6403CD6502CD6500CB6600CB6502C66406BF610EBC6925E8A3717B37088737
        028D3909802E0F9A4E38B86E5C772B1485300A8D380B7E33078D481DCE8B649A
        552E85350C8B32068D30008C361278352C69323584514E8F5C5A6F373C662A30
        965C578B4E4A7133397633308135187F310382370980370BB9704AE09470923D
        1D852B0991330F832E087B360FC6855E995129802F029034038D3905833F10F4
        B47ABA6B1CBA6106C16103C96505C76101C76200CC6701CA6500CD6500CB6502
        C8640494611B56816C54C7D61DC3EC1EC2F156C5E5ADFFFF0000A3FFFF4AC0E3
        1FC3EE0BC6F312C6EF54C7D1706130B8620EC56206CB6403CB6404CB6403CB66
        00CB6600CD6502CD6304D1650DBF6115BF8141AE753D8739048D3506862A0783
        2F13BD7A5FAE6E4F86370E8C38088D3A03893904782E04CC8865CC8F6F854624
        79340D6B2A1B6D3F636A4D84BCACD5E9DCFF594181654C8AF1DEFFD2BCDF6D4E
        816B3F636B2D227A3912753D14DFA27AAB5F3B832C0A9135129436138C300D86
        3411D79973A3663E80310A8D350C8B3609863B07C8894FA76720B8640BC46504
        C66706C86706C76303C96402CD6801CE6700CD6600CB6502C8640495601D5880
        6E54C6D71DC2ED1CC2F156C5E5ADFFFF0000A3FFFF4AC0E31EC3EE0BC6F312C6
        EF54C7D1706130B8620EC56206CD6403CB6404CB6403CB6600CB6600CF6402D1
        6303D15F05C5630FA66318E9AF6E974B168932069635118A300E76330CD89B73
        B26D458134068836008B37038A350D823514854526CA9171C586645F29227A58
        877D6FB78C8ECE8A92D57575C96C6ABC9699D68E8CC78777BE7F5F8E6C392FD6
        9B74C68E6585441D7F2C069537138F320B862E09812F0CB96F4DB3724C7E3711
        89310C8A320A7E2F06985321DC9855B16617C16407CB6603C46603C36502C864
        04CB6604CB6600CC6500CD6600CB6502CA640495611B58816C52C6D71BC2ED1C
        C2F156C5E5ADFFFF0000A1FFFF4AC0E31EC3EE0BC6F312C6EF54C8CF70622EBA
        620EC76206CD6403CB6404CB6404CA6502CB6600CF6402CF6403CD6306C5630B
        B76611AA6018D78E5C83320D8E2B0B93320E8B3E0D723000D99B779D5E3C7F37
        0D87350B8F30098D2D0984310B813610A45C3AD49A8EDEC0DDE6DCFF7576B341
        498CC5CFFFD0DAFF404A8A6668A8E7DDFFE2C7E8BB8B798B4A1E83330A91370E
        91320792340989340780380EAF744DBE805A822E0A8E2E0A902F0B8D35107A35
        0DF0AE7BBD6822C2620ECA6404CB6600C36300C16300CB6505CC6505CA6401CC
        6701CB6600CB6502CB640497611A56826B52C7D61BC3EC1EC2F156C5E5ADFFFF
        0000A1FFFF4AC0E31EC3EE0DC6F212C7EE54C8CF72612EBA630DC76305CF6403
        CB6306CA6404C86602CA6600CF6402CF6403CB6102CA6608BF6409BB6918C77E
        42D487598B340C8D330A832E0086390876320FB97859C07A557E310A8B310E93
        321091360F85300A803515632C1D6B55677370979092C2A4ADDF616F9F5F6E9F
        9CA8DE9194CB7970A273587263311D7934098A300791320792360D903A109344
        1BC7825ABE875C75350C90330C972F0A8C310C7E2F06EFB07EAF6A2BC06314CD
        6409CF6403CD6502C66602C76703CD6606CD6304CA6302CE6805CB6502CB6502
        CB640397621954846850C9D31DC3EC1EC2F156C5E5ADFFFF0000A1FFFF4AC0E3
        1FC3EE0DC6F212C7EE54C8CF72622DBA630DC96205CF6403CB6306CA6404C865
        03CA6502CF6403D16303CF6403CC6705C46603BB6406B56714DA944EC1814B7A
        33078D330A91320A8B320D81300BA55B31FEB8908B44237E3013852B0C893212
        7930125D2E204F4556525875B0B6C9E3EAFE445373475579DEE6FFBAB9D9574E
        765D4059622B1E7B310F8B350B8832087C320E8F4B28EFA887833C1782390D85
        340792300891320A7E3A0DEBAF79AA6722B36512C36609CB6403CE6302CC6302
        C86602C96703CF6304CF6102C96202C96303CA6503CB6502CB66009763165485
        6550C9D21DC3EA1EC2F156C5E5ADFFFF0000A3FFFF4AC0E31EC4ED0BC6F212C6
        EF54C8CF70622DB8640BC96205D16303CB6404CA6404C86503C86503CF6403D1
        6303D16604C75F00C96701C66A05B65F00B36610CB8E4CC0804A86310492330C
        8F2F0B8B300B87320A85360FE39A7AD08769873414803011712F12FFEBDCFFF5
        FDE5E6F4F9F7F7F8F6F5E8EEF9E8EEFBF1F0F9F6EEF8F2E6FAFFE9F6EDB9AC75
        32137F320B8F4319F3AC87D48D6C792F0D80300B8937088B36048E36078A3808
        C98953AC6C2BB36310C26809C86902CC6700CF6403CE6203CA6502CB6701CD65
        02D16605CD6606CA6404CA6503CA6502CD65029963165385654ECAD01BC4EA1E
        C2EF56C5E5ADFFFF0000A5FFFF4AC2E01CC5EB09C7F011C5EF53C6D06D652AB4
        6609C96303D36303CD6403CA6503C86404C86404CF6304D16303CF6500CE6800
        CE6800CB6600CB6603BE6106B56518C8813EDC925C83360888300B8C2D0C9735
        138F2D0B8D2F0C9D4822D1865FC585629B6449724736775D57725F5A5D4A3D70
        604F524535695C4E71635757473B715E57795F53845D47A77656C48660D48C64
        86330D8B330B90340B90370B853401863E0886470DE6A868C67835BA6216CA64
        0BCD6502C86700CA6800CD6403CF6304CD6502CB6600C86700C86700CD6502CD
        6502CB6603CA6502CD63049861185385674DCBD019C5E91CC3EE56C6E4ADFFFF
        0000A3FFFF4AC2E01AC5EB09C7F213C3F257C5D16B642BB46609C96205D36204
        CF6304CB6404C86404C86503CB6403CD6502CA6500CE6601CE6500CD6400D369
        04CD6707BD6009B76416B96E2AFAB0789A4E1E85330A882D0894330F9A320D8E
        2F087E340A6F360F7D4E32E9C6B2FFFEEEFFFBECB49F8AFFFBE289765BFFFEE3
        FFF8E3AC9B88FFF6E4FFF9E3E2C5AA673E1E6F310D85360F8E310A9A350E8F2D
        038C3405863C06A6672AE3AA659D5C11B76010C8610BCD6102D06400CC6900C7
        6500CD6502CD6403CD6502CB6600C66700C86700CB6403CD6403C86602C86503
        CD63069860195484674ECAD019C6E71CC3EE56C6E4ADFFFF00009FFFFF48C2E0
        1EC4ED0FC5F318C1F45BC3D46F622EB4640DC56108D16107D16107CF6206C865
        03C46602C86700CA6700C56200CD6707CD6403CD6200CF6402CC6603C86202BF
        5E04C16615AB5D11E9A864B2763A7A3B0882340997310E912B0883340970350D
        906949FFF8E0FFFBE9FFFFEFABA18FFEF3DD7B6F57FFFCE6FFFDE99D9683FFFA
        E8FFF6E1FFF8DE7244257E320E8E2E0A982F0E98320F89320A823808CB8F54CD
        904CAC6214B9640EC86509CA6303CE6706C56000D36C0BC76000CB6600CB6600
        CA6700CA6600CB6502CB6403C86307C66406C86404CA6503CF62069A5F195684
        6752CAD01DC5E71EC3EE56C6E4ADFFFF0000A1FFFF4AC2E01EC4ED0FC5F316C2
        F25AC4D56F622EB3630CC56108CF6107D16206CF6304CA6503C66700C86700C8
        6700C76303CC6508CA6303CE6504C96300C76100CD6704CD6806C26204BD660E
        A86411C08339CC9251B5723B91380C90340B813305713408B18665AD9278A394
        819C94838B84719F968284796399907C9E9784807966A19381A5907BB5977C99
        6A4A7D310D8F340D8D30098B3206C97747DB9258B97532AD6518BE6612C46407
        C86301CA6401C86300CA6503C75F02CD6606CB6600CA6700CA6600CB6502CF64
        03CD6306C66307C46407C86404CA6503CD63069A5F1958836854C9D21EC3EA20
        C2F258C5E5ADFFFF0000AAFFFF4FC0E01BC4EA08C6F111C5EE56C7D16F632DB7
        630AC96205D16303CF6402CD6502CF6500CD6500CA6502CA6502CD6403CC6302
        C76101CB6707C96604C66301CA6804C56600C56902BD6200BD6507B8630DB565
        18C27733E7A467C9885182400B7737076C320F9F6E54E3BDABFFF9EAFFFAE8FF
        FDEAFFFFEAFFFFEFFFFEEDFFF7E7FFF8E5E5C3AC98705462321071360E7E4010
        D99D67D9985BC67734BB6317BB5F0EC5640DC55F06C86406C56403C66202D168
        07D06504CE6706CC6603CD6502CD6502CB6403CB6403CF6304CD6304C86406C6
        6406C86503CA6503CA630695601D56826B54C7D620C0F022C0F558C4E6ADFFFF
        0000ACFFFF4FC0E01BC4EA06C6F10FC6EE54C8CF6F642BB76409C76303CF6500
        CD6500CB6600CF6402CF6403CD6304CD6304D06400CF6500CB6502C96604CA64
        04CA6404C96703C46200C66500C66500CC6701C96505BF6108BD69179F5C11C0
        823BEEA865F5AD71B6724373340E68321385593C997557947554927654927654
        957657997355734728633311753E17B67B4DDD9F69E1A466AF742EA56315B660
        0CC9670FD26A0DCE6203CE6504C96201C56605C56402CC6302CE6301CB6600C6
        6200CB6502CB6403CB6403CD6403CF6304CD6304CA6404C86503C86700C86600
        C9650594611B56826B53C6D522C0EE24C0F558C4E6ADFFFF0000AAFFFF4DC2DF
        19C3EC06C5F213C4EF56C7D16D632DB2640AC36502CD6500CB6600CA6502CA64
        04CD6306D16107D36204D26500D26800D26902CC6401CD6102CF6304D16304D0
        6503CF6600D06700D36800CC6300CC6603C46406BE660CB6610BBC620DB96212
        D1853DE4A05FCA8B51D1965EAB7038B57840BD8048B1763EA9713AB67E47C68D
        55CF9155DE9A59C47732B96519B45C08BF660EC86B10C66202C86200CA6600C9
        6400CD6500CD6802C46200C86902CA6600CC6700CA6500CE6B03C86700C86600
        CB6502CD6502CF6403CF6402CF6402CB6600C86900C66A00C967019563175485
        6553C8CF24C3E925C1EF59C4E5ADFFFF0000A5FFFF4AC2DF17C2EE06C5F413C4
        EF58C7D16D632DB0640AC26502CB6600CA6600CA6503C86406CA6307D16107D3
        6204D06700CC6600D16702CE6302D06307D16408CC5F03D06405D06301D26600
        D36800D06400CD6300CA6401C76305CA6608CB6707C6670AB8640BB06411AC62
        14A86013B16317AE5E11B46215B46417AD6216A96114AE6618AF6415B56512BB
        640CC26306CD6707CE6504CF6403D16402D26705CA6600CA6600CA6500CC6802
        C96701C76500C76500CB6701CB6600C86400C66700C66700CB6502CF6403D163
        03D16303D16402CD6600CA6900C76B00C9670195631754856551C9CE1FC4E523
        C3ED58C6E4ADFFFF00009EFFFF3FBEDD18C6F503C4F611C2ED5FCDD36B6027B3
        660AC46803CB6800CC6504C96303C96408C96507C96300CC6704C76604C76605
        CD6508CE6308CB6408C96408C76408C96408CC6407CE6405D06504CE6504CB64
        04CA6306CB6207CC6407CB6604C76703C36506C06608BE670BBE660CC0670CC2
        670CC06308C16409C0650AC0650ABE650ABE6608BE6707C06804C56801C96701
        D06503D16304D16206CE6308CC6308C96507C76605C76604C96703CB6604CB66
        04CC6505CE6407CE6405CB6603CB6603CC6505CF6206D16107D46207D26405D0
        6504CA6500CD6A02CA6404935F195083684DCAD21BC7EB1DC4EF57C7E5ADFFFF
        00009DFFFF4AC6E815C1F102C1F315C7F04CC3CC56633596681AA06412A86411
        A96415A66215A76316A56314A86813A2650FA16414A26418A76318A76318A663
        18A56217A36217A46318A66217A96316A96316A76316A66215A66217AA6117AB
        6316A76514A56511A26312A36414A36414A46515A46514A46514A46410A46410
        A56413A66514A56413A36413A36511A36610A46711A66611AC6313AD6214AA61
        17A86018A96119A76318A26416A46515A86314AA6214A86215A86215AA6117AA
        6215A96414A96414AB6316AB6316AB6218AB6316AB6316AB6315AB6512A56010
        AC681D77612D41847542C9D90FC0E51AC4EE57C7E5ADFFFF0000A8FFFF4DBCE2
        1EC2EF0BC3F314C4ED40C6D82562484F61325C5F32625F33635F36605E356060
        325B5E2D616633575E2B5C5F325C5E345D60335D60325E6032615F2F635F2F61
        5E315F5F315D5E325D60335D60335C5F325D5F31625F326060325B6033596033
        5A5F325A5F325D5E325E60325E61305D61305A612E5A612E5B61305B61305D60
        325D5F315F5F2F5F5F315D5F315D5E32615E32615E315D5F315C5F315F5F315F
        5F315D5E325D5E32635D32645D325F5E325F5F315F5F315F5F31615E31615E31
        625F326060325B61305962305C5F315D5F316562355C5C2E5B62373861462185
        8A34C6E214C7EE1DC3EC57C7E5ADFFFF0000A9FEFF51C1E51EC0EA11C7F514C2
        F035CCE75EC8C27FCBB98CC9BF90C6BF90C7BE8EC8BD8CCABA8BCBB88CCBBB8A
        C8BA8BC7BC8AC8BC89CABB89CABA8CCAB88ECAB891C8B791C8B78BC8BA8AC8BA
        86C8BC87CABB89CABB8BCABA8BCBB88BCABA87C9BD85C9BE87C9BE89C9BD8BC9
        BD8BC9BB8BC9BB89CABA89CABA87CBBA87CBBA89CABA8BC9BB8CC9BB8EC9BB8E
        C9BB8BC8BE88C7BD8AC8BC8AC8BA86CAB988CAB78DC8B98EC9BA8BC8BA8BC8BA
        8FC7BC8FC7BC8BC8BA8BCABA8BCABA8BCABA8AC8BA8CC9BB8CC9BB8BCABA84CD
        B782CDB885CBBA88C9BA8FC9BE8AC6BB80C5B66FCDC945C7DE24C3E911C5EF23
        C6ED59C7E5ADFFFF0000A1FFFF49C1DF1FC4EB0AC2F011C2F519BDE73DCEDE44
        C7D14DC2D751BFD756C2D455C5D252C9D251CAD44FBFD158C5DA52C2D452C5D4
        50C6D250C6D252C6D152C6D153C5D252C4D151C3D44FC3D44FC3D44DC3D44EC6
        D24CC7D14CC8D04EC7D14EC2D351C2D64FC2D64DC3D44DC3D44DC3D44EC4D550
        C4D54EC2D350C2D351C3D451C3D452C3D351C4D352C3D34FC3D44CC3D84BC4D8
        4BC4D74BC5D54CC6D450C5D453C5D255C5D24FC4D34EC5D450C5D450C5D44EC5
        D44CC6D44CC6D44BC6D44AC5D34BC5D350C5D450C6D249C8D147C8D14AC4D44D
        C3D64FC0D457C9DA4AC5CF40C9D923C1E513C0EE12C9F51FBFE759C7E5ADFFFF
        00009CFFFF49C6E21CC2E90CC4F211C3F425C2EA28A1B141A3AB459FB0499EAE
        50A0AB51A2AA4AA5AC45A4AE409BB0459DB54B9FB14CA0AC4CA0AC4CA1AB4CA1
        AB4BA2AC4AA1AB4AA1AB4AA0AC4A9FAE4A9FAE48A1AC48A1AB47A2A947A2A948
        A2A94B9FAB4B9FAB4CA0AC4AA0AC4AA0AC4AA0AC4BA0AF4BA0AF4B9EAD4B9EAD
        4D9EAD4D9EAD4CA0AC4CA0AC4CA0AC4AA0AC47A0AE45A1AE45A1AE48A1AF4BA1
        AD4CA0AC4CA0AC4CA1AB4AA0AC48A1AB47A1AC47A2AB48A1AC49A2AD48A2AD48
        A2AD45A1AC45A1AC4AA0AC4AA1AB47A2A945A2AB45A1AC47A0AE4A9FAE4CA0AC
        4BA3A939A4B21FACCD1EC3EE11C5EF25C6EC59C7E5ADFFFF0000A1FFFF45BDDB
        20C5F00DC5F311C3EC49C7DF17353046331E48341B4A34184F36164E34164E33
        1E3E2E1E3B3833302C2748312251301C502F1B5030194F31184E33184C34184A
        34184C34184C33194E33194E33194E33195032195032194F32174D32174E3416
        52341754341755331655321853311A51301C51321D50311C50311A50311A5032
        195033185033185034165033185033185133185332185531195331194E33194C
        33194E321A4E33194C321A4C331951311A53311A53311A51311A5134194E3318
        50311A4F30195230185133184A33194B351952371C5032175331192E2F251763
        753AC1E11AC4ED1FC2E859C7E5ADFFFF0000A3FFFF4AC1E11DC4F008C3F015C8
        ED52C1D146362580300B84350A84340588360685320587330F722C0F784A395F
        2F1D7D32128C310A8D30098F30088F31068E33068935058935058A36068B3606
        8C34068C34068E32078E32079032078D32058B33048934048C34058E34059031
        059031068D30098B300B8B320D89320A8931088932068A33078A34068A340689
        33058B33058C34068A34068C34069132079032078A32098832088A32098A3209
        8933098A32098E320990310990310A8E32098F33088F33088A32098B31089230
        069132068D35078B36068E37058E340594350A602E173662694EC3DE1BC4EA1F
        C5EC57C8E3ACFFFF0000A4FFFF49C1DF1FC6F203BFEF14C9F053C6D543351E82
        32098832088D330A862E0687320C83330E6B290C875C4D6234237F35138D3106
        943208922C01962F029935059034019137019335009031009637068B2D009433
        079232049533059432049734089031068D34088C320990300C91310D8B300B8D
        340F88300B8D350D8E32099234098B2F048F360A8B32068E320991320A8C340B
        83380C83350A90340994320894350A92330892330B91320A8C2F088F320B8E31
        0A90330C8D350D8F340D9738118D2D058C300794360B942F029A340498320296
        32029534029536048F31036435163B646750C1DB16C3E919C6EC52C7E2AAFFFF
        0000A6FFFF4CBFE01EC5F005C2EF10C7EF4FC3D442361E8432088A2E038F2F07
        8C2E0A84320F6D2E0C5428107D60575432256A2C0E802E058E2E069A3108992E
        029930009530009733009834009733009B35049A3403973101983201952E0098
        3202912B008E32097D33097A37107C320E9346258031107C2D0C7A300C7A310B
        7F310C90421D7C330D7A330E7B340F7B33117B310F7F3816AF734F71360F8843
        1C85360F8A320D8D35107F310C7B320C7B2F0B8436127B2F0B80361277310C7B
        340F7B2F0B8537138F441D82300696380A9A32039529009D34039832008F2C00
        97390461310F375E6052C3DD1DC7F017C4EC52C7E2AAFFFF0000ACFEFF51BFE3
        20C4EE08C3EF0FC4F14DBFD63F35238233089839089733038E32097F38165A3D
        22433C2B5F5D5C473B375A311B78371887300E9936109B3308A037069C31009F
        35009A32009C34009E34009C32009D33009C34009A32009C3504953107803108
        EEC79BECD5A8B59571B68B6AD7A1836F371AFFD1B2A07455A07757D8B294D9BB
        9EDABDA275573EE2C4ABFDDEC5C1A086C19F82916F51D0B492EAC4A46B2F12CB
        8F72D5AF91BDA081F4CFB3966E52D6AB90BD9277C9A286CDA98B8E6A4CD6B18F
        D1AA84986239853205963406A33B0C9831009732009F3B0598340065310C3F69
        684BBFD81DC2ED1EC3EE56C7E2ACFFFF0000A9FDFF4FBEE420C4EE09C4F011C3
        F250C1DC3E3527792F0B7D2E058237107535135A311857554332423B58666C36
        3D40655C53563A29642D187A311585310D8A2C019F360A972B009930009B3501
        952F009633009135028D31009033028C2F028A320A73320BDDC699DBD2A7C7B1
        8D896749D8AB905F3217F5D2B8A4866B8E7156DBC4AAA8997FDED0B9C1AC97E3
        D0BBCEC0A9BFB096846D53674F33BFAD90DBC1A36F402593664BECD7BB766B4D
        EBDABF8B745AD0B299B99A81D0B59BC7B096887157D8C2A6A98D6EA278537735
        0C822E04852E028C31048D31029031009433006A361138646551C3E11DC0ED21
        C4F158C6E2ADFFFF0000A1FEFF4ABFE41CC3EF07C3F312C4F552C2E03D322A6B
        2E145A331D68524071685B4F544B5D706D526B6D7387925268744A6A70768F91
        5F635E6B554A63311D7C33178D2F0B9C34099A34049332008A35058035077435
        0971330B7B33117A3210702E0B6B3A1483663F806642683F1F95634777462C5E
        31168964487E5C3F714C3088654B7052397E5F467247327A513B5B4228634E32
        816749634425835D3F865A3B5C2D0E6236178064454C3918897556755D3F7954
        388E664A6C472B856248815C48704B3789654D5F371A6735116E341075371176
        320D7E330D86340A8F3603623210355F6450C1E21FC0F220C0F059C5E4AFFFFF
        00009EFFFF46C1E31BC4F006C2F311C3F44EC3E0322F2A613524675E5A7E8A8E
        556E722F4C51809B9F1C343A647681112B376895A257879348656E565C618C7C
        76572B1A7E2E1194310B9631048B2F00833608D1956BD2A580AF8666F6C3A9F5
        BFA6FFD3B4724B2BD2B392593517BE8B71A77158A07156C0987CF0CBAFA37E62
        A0755AA1795DD2B093ECC7ABAA745B66321BFCDBC1CCB496CFB395D8B4969460
        428C5437FFE3C4C8A181DABB9CE3CAAAB7A283917759FFDCC0633419BB90755D
        341BD7AD9AE6BEACCAA58FE6C1A5D9B393FFE1BEB78A69FFD6B7EEAE8F7A300C
        8A36065F351236636752C3E319BBEB22C3F059C6E2AFFFFF00009FFFFF45C3DC
        1BC5EF07C3F40EC5F146C4DC23322A5D473B67758148687F527387446170778A
        91222F3169707322303663838E5D808E2A40523C4B5B65757B776C64712E178D
        2F0C9533058F36047B3206CA936CD1AB8DFFE2C9BE9E87E8C8B1E2C4AB67482F
        D5B199582F18BE8D77A1725C926E56DFC1A6957356C9A2869B7154A78060FFE9
        C7644421C18E6E663116D3AE94DABFA5D1B69CD9B49A8D5139A76A50C296796F
        4D30F7D9BE72553AE3C8ADFADCC1F6CDB45B2D15C1937B562D14FFE3CFC1A28D
        FFE7CE65472AE1C6A4D3B5925B3414FFDEC2DDA086762F0E84370655300A3263
        654BC0DB1EC4EB20C5EC58C7E1ADFFFF0000A1FFFF46C1DB1EC5F009C5F50FC6
        F043C5DC1D342C67574B5F6A784C6177414D5F60636B877E7B4031287C6A5F3C
        2F277677756A6D75504A5B5D5D6D54666D81817B5E25108B34129031058F3302
        84350AA3623CA16B4D8152378F634B9A7158AE866AAE8166CB957CA86F56B479
        5FC89176C19276A37758895537B37C5DCB9272C89672875E37C3967084442176
        3312C58F7198694D9B6F52CB9577944A2E803318B87F609A6B4B8E5F40C49579
        86573B926246AE7359AD6E52CA8B6FA36B4EC292769F70548C5D3EC19371895E
        37A679536C3516C98A6ED68C727E2E0F8937085A34112E646548C2DA1EC5EA21
        C7EC58C7E1ADFFFF0000A3FFFF48C0DE21C4F10EC5F70EC3F046C5DE1E353063
        493B7C6769462E3069413C5C281B6B311B682E11783F206A341665331D5D2B1F
        663232633B4061555566574E79442F7E31108D31069432049032078D320B8E31
        108C311284320F81300D84340F84330E85310D85310D83320D82320D80320D81
        310C8A341088320E83300A7F30097C320880340A8C340C8F340F883410873611
        8635108B330E93320E94330D8C350D84330D83340D84340F84340F87330F8B31
        0E8F310E8C320F8C340F822F0983320C87350C8936098B35078D34088E330E91
        3211912E129330108D2F046239192A616446C3DF1CC5EB1FC6EB56C7E1ACFFFF
        0000A6FFFF4EC1E21EBFEB0ABFF013C8F63EC2E00B3135494037554846442B27
        5A3226612F1B65311A66311667381961321666361E5E2D1D643430512F30362B
        2D706A654A2F215B2F186C3314723210743110763012792F1577301573321371
        31126F32127131127231127131126D32126C3313703313723213743215723214
        6D31136932136C33146E32147531147630127131136F321272311273300F7730
        0F76320F7232106F300E6E310F6D32126F3212713112762E10762E10722F1071
        310F71301172311274341276341179330E7932107930147A3018792E18752D15
        73321344331E1B606A40C4E218C2EB1FC5EA55C6E0A7FFFF0000ABFFFF50BFDF
        23C3ED13CBF909BEEF33C2E8003A4B0E303616333A1B3136222D2A2F362F2E34
        2F2D332E28312E25312B25322A26322C2B3033222B3418313B142E3525343727
        32302A352D2D352A3533293533282C35282A37292C36262B3626293628293529
        2E35282E35282E35282D36293034292E34292D352B2A352D26352D26352D2D35
        2E31332D34312C3331292F352A2D36293135293136272F36272E38272C37272C
        37272D37272E372A2D372A2D36293434283434262C36262C36292E322C30322C
        31342B2F352A2C35282C34292C322D2C312F2E2F2B32342E3135290E332F0364
        7836C4E71FCCF420C1E761CFE7ABFFFF0000ACFFFF54C0E220C0EA0DC5F50DC2
        F425C2EE4DBDDB6CC2D86ABDD277C5D675BFCB7AC2CC78C3D172BFCF72BED174
        C0D273C3CE75C4CF79C0CE7BC3D56FBED36EBFD472BED178C4D672C0D074C3CE
        7BC2CC7BC3CB72C6CC6FC5CB72C4C971C2C971C4CC71C3CE76C3CC78C3CC76C3
        CC76C3CC77C2CB76C0CC74C2CF70C2CE6AC2D06CC1D073C1D178C1CF7AC1CF7A
        C2CE75C1CD74C3CC76C3CC74C4CB71C5CB71C5CA73C4CB73C4CB73C3CA74C3CC
        74C3CC74C3CC78C3CC75C3CA73C4CB71C4CC74C2CF76C1D176C1CF74C3CE71C3
        CE6FC3CF6EC0D170BFD273C2CF74C3CC74C4CB69CAD840C4E221BFE70EBCEA28
        C7ED5BC5DDB1FFFF0000A7FCFF4EBDE526C7F40AC1F312C6FA16C3F525C5ED2A
        C3E82DC2EA33C4EA36C4E730C3E325C5E526C6E82CC2EA31C4EC2BC1E52EC5E7
        2FC1E42DC2E42BC5E82AC6E92CC6E927BFE22FC4E62FC5E430C6E430C6E42EC8
        E52EC7E62EC5E72DC4E62EC4E830C4E834C4E734C4E730C6E530C6E52FC5E431
        C4E432C4E72EC4E828C4E728C4E72BC6E72DC6E732C5E533C6E62FC3E72DC3E7
        2DC3E72CC5E629C6E72AC6E42EC5E72EC5E72CC4E72CC4E72FC3E72FC3E72CC4
        E72AC5E62CC5E62CC5E62BC6E72CC5E62FC5E42DC5E429C7E527C6E829C3EC2A
        C3EA27C2E32CC8E525C3E120C3E41AC4EE13C3F20FC4F623C0EB62C7E0B8FFFF
        0000AEFBFF60C1E52FBBE425C4F020BBE923C0EC21C6ED1DC2E921C1EB22BFEA
        23C1E920C3EA12BFE51AC7EF1CBFEC21BFED1FC3ED20C3EA23C3EB26C6EE1BC1
        E81DC6EC19C2E821C7EE22C3E921C3E61FC3E61CC2E51DC3E81DC2E920C2EC20
        C1ED21C0EC21C0EC24C0EB23C1E922C3E920C4E71EC4E720C3E922C2EA22C2EA
        1FC4EB1EC4EB1DC3EA1DC4E91FC3E61FC2E820C2EC1EC2EC1EC2EC1EC4ED1BC4
        EA1BC4EA20C3EA23C3EB1FC3EE1FC3EE22C1ED20C1ED1BC3EC1AC2EB1DC2E91D
        C2E91CC3E81CC3E81DC3E81DC3E81AC3E818C2EB1CC0ED1CC1EC1DC5E71EC7E7
        1CC8EC18C0E91DC1EC22C3F01EBFEC37C0E768C2DABDFFFF0000C5FFFF74BFD5
        59BDD94FBFDD56C1DD50BCDB44BFDB47C3E14CC2DF4DC2DF4CC2DF4EC4E14BC0
        DD4FC3E24DBDE14CBEE24CC1DE4DC2DD51C0E04DBBDD4ABCE04AC0E34AC1E148
        C0DD50C3DE4FC3DC4DC3DC4CC1DC4BC1DE4BC0DF4DC0E14EC1E24DC0E14DC1E0
        4CC1DE4FC2DD4DC3DC4DC4DD4BC5DD49C5DD4CC3DD4EC3E052C2E053C3E14EC3
        E04CC3DD4BC2DB4BC2DB4BC1DE4BC1DE4BC1DE4AC3DD48C3DD48C1DB4EC1DC51
        C2DD4FC0E04DC1E04DC1E04BC0DF47C2DE47C2DE4CC1DC4DC0DB4DC2DF4CC2DF
        4AC3DD4AC3DD4AC3DD4AC2DF4CC0E14DC1E04DC3D64CC2D54CC1E04BBFE24EBF
        E051C0E04DBCDC60C3DF7CC5D9BEFCFF0000CBFFFFC3FFFFB1FFFFA9FFFFB1FF
        FFADFFFF9FFFFF9CFFFFA1FFFFA3FFFFA0FFFFA1FFFFA8FFFFA8FFFFA8FFFFA6
        FFFFA5FFFFA6FFFFAAFFFFAAFFFFA6FFFFA1FEFFA3FFFFA3FFFFA6FFFFA8FFFF
        A6FFFFA5FFFFA5FFFFA3FFFFA5FFFFA4FFFFA5FFFFA3FFFFA5FFFFA5FFFFA6FF
        FFA5FFFF9FFFFF9FFFFFA1FFFFA5FFFFACFFFFACFFFFA6FFFFA5FFFFA3FFFFA3
        FFFFA5FFFFA5FFFFA3FFFFA3FFFFA1FFFFA2FFFFA7FFFFAAFFFFA8FFFFA6FFFF
        A6FFFFA3FFFF9FFFFF9FFFFFA6FFFFA8FFFFA8FFFFA6FFFFA1FFFF9FFFFFA2FF
        FFA2FFFFA6FFFFA8FFFFA9FFFFAAFFFFA3FFFFA5FFFFA8FFFFA9FFFFACFFFFB2
        FFFFBFFFFFC6FFFF0000}
      Stretch = True
    end
    object Label_Versao: TLabel
      Left = 17
      Top = 96
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
    object DBText1: TDBText
      Left = 160
      Top = 79
      Width = 537
      Height = 21
      Color = clWhite
      DataField = 'NOMECOMPLETO'
      DataSource = DST_AlunoTurma
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 96
      Top = 55
      Width = 121
      Height = 21
      Color = clWhite
      DataField = 'CODCURSO'
      DataSource = DSQ_Curso
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 223
      Top = 55
      Width = 133
      Height = 21
      Color = clWhite
      DataField = 'TURMA'
      DataSource = DSQ_Curso
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBText_Prova: TDBText
      Left = 384
      Top = 55
      Width = 121
      Height = 21
      Alignment = taCenter
      Color = clWhite
      DataField = 'CODPROVA'
      DataSource = DSQ_teste
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBText_DataProva: TDBText
      Left = 527
      Top = 55
      Width = 189
      Height = 21
      Alignment = taCenter
      Color = clWhite
      DataField = 'DATAAPLICACAO'
      DataSource = DSQ_teste
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 97
      Top = 7
      Width = 620
      Height = 21
      Alignment = taCenter
      Color = clWhite
      DataField = 'NOME'
      DataSource = DM.DST_Configuracao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Panel_Botoes: TPanel
      Left = 752
      Top = 19
      Width = 457
      Height = 62
      BevelOuter = bvNone
      TabOrder = 0
      object JvShape_EncerrarProva: TJvShape
        Left = 1
        Top = 4
        Width = 219
        Height = 53
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_ImprimirSolicitacao: TJvTransparentButton
        Left = 2
        Top = 3
        Width = 217
        Height = 53
        Hint = 
          'Imprime a Solicita'#231#227'o de Revis'#227'o para ser enviando para instruto' +
          'r.'
        BorderWidth = 0
        Caption = 'Imprimir Solicita'#231#227'o'
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
        OnClick = JvTransparentButton_ImprimirSolicitacaoClick
      end
      object JvShape1: TJvShape
        Left = 233
        Top = 4
        Width = 219
        Height = 53
        Brush.Color = 16378331
        Pen.Color = 33023
      end
      object JvTransparentButton_EnerrarSolicitacao: TJvTransparentButton
        Left = 234
        Top = 3
        Width = 217
        Height = 53
        Hint = 'Encerra a solicita'#231#227'o de revis'#227'o Prova'
        BorderWidth = 0
        Caption = 'Encerrar Solicita'#231#227'o de Revis'#227'o'
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
        OnClick = JvTransparentButton_EnerrarSolicitacaoClick
      end
    end
  end
  object JvCaptionPanel_SelRelatorioSolicitacao: TJvCaptionPanel
    Left = 723
    Top = 106
    Width = 382
    Height = 247
    Buttons = []
    Caption = 'Relat'#243'rio de Pedido de Revis'#227'o'
    CaptionColor = 16697257
    CaptionPosition = dpTop
    CaptionFont.Charset = ANSI_CHARSET
    CaptionFont.Color = clBlack
    CaptionFont.Height = -16
    CaptionFont.Name = 'Arial'
    CaptionFont.Style = []
    Color = 14211288
    FlatButtons = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    OutlookLook = False
    ParentFont = False
    TabOrder = 2
    object JvShape3: TJvShape
      Left = 40
      Top = 44
      Width = 219
      Height = 51
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_Imprimir: TJvTransparentButton
      Left = 41
      Top = 45
      Width = 217
      Height = 51
      Hint = 'Imprime a Solicita'#231#227'o de Revis'#227'o do Item selecionado'
      BorderWidth = 0
      Caption = 'Imprimir Solicita'#231#227'o'
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
    object JvShape6: TJvShape
      Left = 40
      Top = 103
      Width = 219
      Height = 51
      Brush.Color = 16378331
      Pen.Color = 33023
    end
    object JvTransparentButton_SolPDF: TJvTransparentButton
      Left = 41
      Top = 104
      Width = 217
      Height = 51
      Hint = 'Gera a Solicita'#231#227'o em PDF na pasta c:\Solicitacoes'
      BorderWidth = 0
      Caption = 'Solicita'#231#227'o em PDF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      FrameStyle = fsDark
      Glyph.Data = {
        56080000424D560800000000000036000000280000001A0000001A0000000100
        1800000000002008000000000000000000000000000000000000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3E1E1E1CFCFCF6565655B5B5B6E6E6E5959596565
        6565656565656565656565656565656565656565656565656565656565656565
        65656363638080800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C323232354
        54555756575656575453555C5C5C525351525351525352525252525253525253
        5252545252535253525253525253505254503334323D3E3D0000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3282829D2D1D5929095D0CDD57F7D85C9CACC8187
        7D757D71D0D4CD90929088888ABBB9C08C88907A777DAAA9A9A8A9A181867588
        8F798A8F824546450000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3282729C1
        BFC44F4C555E5A66423D4BA4A4AB6B726A60685DA9B1A7474B468E8F908F8C94
        48414FB5AEBC79747D8B8A88525547B1B7A083887A4747460000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3201F21D6D5D98380897A7681726E7CAFAAB96B68
        776C6C72ADB0AE5C5F5586898096939449404EB3A7BF716280746681BDB1C74F
        47538F8C914746470000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31F1F20E0
        DFE398969D4B4752A19DA9A69FB47C7493473F5CBDB9CB908F95868886B2B4AC
        4E4F48767370ACA8AAA8A1AA827889A398AD8D87944746480000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C31F1F1FD9D8DBADABB2433F4AB9B5C1746D87A094
        C2695C8DC3B9E0D6D2EADBDDE4D1D8CC49563AD6E2C0DFE9CBE4E9D7E2E1DDD4
        CED88C87914746480000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31F1F1FE2
        E1E3DBD9E0D3D0DAD6D2DEA39BBD7869AD8578BAC8C2EEE1E3F7CBD5D8D9E6DC
        C5D3C5D7E5D6D4DFD3D5DCD4DAE0D9ECEFEB8688864747460000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3242423D6D5D7D9D8DDD5D2DAE8E4EFD1CCE9A49C
        D66B65A2B5B4E8C7CAF3D2DAF6C8D2EAD0DBF0D0D9EED2DAEED2D6ECCBCCE4BE
        BED78887944646480000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31F201FDF
        DEE0DEDDE1DEDCE2DEDBE4DADCE8CFD9EDA4ADD25E619C8383CF9D9BE39D9CE3
        A8ABEAACB1EC9DA0D59796D1746CB48B7BCE867DA546464C0000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C31F201FDFDFDFDEDDE0DEDDE1DEDCE3D8DDE4CAD8
        E3C8D6F1818ABC7F83CC9B9BE39290E36564C26969BF6E6CBC726EB8847EC7B2
        A7ED837EA246464B0000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31F201FDF
        DFDFDEDDDFDEDDE1DEDCE2DBDFE4D5E2E9C9D6E9B2B9E3757ABAA9ABF18686D6
        6F6FC9BABBF6BBBCF5BFC1F1C8C9F0C3C4E48D8D9E4646480000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C31F201FDFDFDFDEDDDFDEDDE1DEDCE2DCDFDED2DD
        D4DEE6F0D1D1FBA6A2E6726FBE807FCBBEC3F5CAD7F3D5E5EAD5E4DDDDE8DFE0
        E5E08385834747460000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31F201FDF
        DFDFDEDDDEDEDDE0DEDDE2E0E0DEDEE2D7DADBE2D7D3F6C9C0F2665FA4A4A2DA
        D0D5F8CEDAE5D3E1D6D7E2D0D9DECEE0DED68D8B884747460000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C31F201FDEDFDFDDDEDEDCDDDFDCDEE0DEE0DFE0E0
        DCDCD8DFE1D9F6C6BEF1746EAAB5B4E2D3D4F3D4D7E4DDE0DFDEDEDEE0D9DFE6
        DBE28E878B4746470000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31F1F22D4
        D9D8DCE1E1D7DFE0D5E2DFCEDAD9D5DCE7D7D8E5D8D6F2C5C1F35C5EA9A8B2DF
        D6D9F1DADADEDEE2DBDADBECE3DFF9D7D0DB8D898A403F3F0000E8E5F0CFD1E0
        D2DBE5CFDBE5D0D8E6CFD1E719193D66639053537C585D81565F845A648F545B
        915659855D5E8C494B9E353F95414F8F4F52718C8B8CD8DCD0D8DEE8C6C9E4E6
        E2EB93908F4C4B4B00009391AF0B0845161263100F630C0C5F0E0B6E0F077F11
        097E130D771110640F0C711311790B0C750D0C691110610B0F660B0F6E0B0E66
        01022B7C7982E2E5DAD6E0D6D7DFDDE7E1DF8A84834C4A4A0000989AB61D147F
        2B1BBE261ECA4444C74B43DA210DD32610D64A41C59499DB8D90DD2C31B64452
        BF4A4CCA1F15BE1917CB1112CA1E1BBD04043F7C7C85DEDFDAD1DACFDAE4D7EF
        EAE0948D8843424100009095BA1D12951905D61709E44E52DB4D4DE11105DC1A
        08E26161E26F80BF3C47AE95A5E84A62B85E65E31A0BDD190AF8190BFA1A0CDD
        030147757884E8EBEADCE7E1C7D4CCD7D5CA928E873C3C3B00009797BB1B0F97
        1B04E1180EE94D5ED6B2C5F8ABB4F62B27DA565BD45D70B6242DA6B6C1F55970
        D0B4BFF8B0ACF60B01E20B01F41809E303014F7F8396C3CDCB79898A61707864
        666D43424467676700009897B71F138C1D03DA1607E55964E07E8FE0575FD37C
        70EE6860E88D90D76764C87F7CE25D62D5898BDE6861D54D3BEE1908F7180CDB
        04024F787E917E8A92131645130D6021156D140D3A96959D00009D9BAE1F156E
        2D13CA1F0DD43336BC626DC3575BB62815CB3F2BC37064C76E61C72819B64033
        C47269C2766CBC624EE11E0BDB271CC605043DB9C1CE7F879F16117A2917C22A
        15AA4B4385D4D1DB000098979704032106034C04025703032E040A1902051C05
        034704014B06044205034D05035105035607052D07061906043F030147050433
        00040DD4DBDB8385AC1811882C22BF1F1D63DDE3F1C3C3C30000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C31D2E1CADB2BDB9BBCEBCC0D1ADB0CDB9B9DFBAB8
        D8C5CCC3CADCB0AFC2BAB0C6CBAFC5C5BCC6BABFBFB97A7A9619176B1B1D66D3
        E6FFC3C3C3C3C3C30000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C373717262
        5C655D5B586064595A635E5B5F615B605C616854626D535D675A596063595968
        615D616B5F5A61605D5C6071CBDAEEC3C3C3C3C3C3C3C3C30000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TextAlign = ttaBottom
      OnClick = JvTransparentButton_SolPDFClick
    end
    object Label11: TLabel
      Left = 43
      Top = 186
      Width = 151
      Height = 13
      Caption = 'Fornecer  nome do arquivo PDF'
    end
    object JvTransparentButton_FecharImpressao: TJvTransparentButton
      Left = 335
      Top = 5
      Width = 26
      Height = 16
      Hint = 'Fecha a Janela de Impress'#227'o da Solicita'#231#227'o de Revis'#227'o do Item'
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
      OnClick = JvTransparentButton_FecharImpressaoClick
    end
    object JvGradientCaption2: TJvGradientCaption
      Left = 1
      Top = 25
      Width = 364
      Height = 8
      GradientStartColor = 16697257
      GradientEndColor = 16697257
      GradientStyle = grHorizontal
      LabelCaption = 'Put your text here ...'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      LabelAlignment = taLeftJustify
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      DoubleBuffered = False
      TabOrder = 0
    end
    object Edit_NomeDoArquivo: TEdit
      Left = 40
      Top = 168
      Width = 217
      Height = 19
      TabOrder = 1
    end
  end
  object IBQuery_PedidoRevisaoItem: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    AfterScroll = IBQuery_PedidoRevisaoItemAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select Pr.IdCurso, Pr.IdTurma, Pr.FaseAplicacao, Pr.ReferenciaAv' +
        'aliacao, Pr.CodMateria, Pr.Identidade,'
      
        '       Pr.NumItem, Pr.NumeroQuestao, Pr.RespGabarito, Pr.RespAlu' +
        'no, Pr.DataPedido, Id.DescEnAlt, Pr.Nome_Chefe_EAVA'
      'From TestePedidoRevisaoItem Pr, Item_Desc Id'
      'where Pr.IdCurso = 64'
      'and Pr.IdTurma = 17'
      'and Pr.faseAplicacao = '#39'1'#39
      'and Pr.ReferenciaAvaliacao = '#39'01T'#39
      'and Pr.CodMateria = '#39'010000'#39
      'and Pr.Identidade = '#39'519333'#39
      'and Pr.NumItem = Id.NumItem')
    Left = 192
    Top = 200
    object IBQuery_PedidoRevisaoItemIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'TESTEPEDIDOREVISAOITEM.IDCURSO'
      Required = True
    end
    object IBQuery_PedidoRevisaoItemIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'TESTEPEDIDOREVISAOITEM.IDTURMA'
      Required = True
    end
    object IBQuery_PedidoRevisaoItemFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Origin = 'TESTEPEDIDOREVISAOITEM.FASEAPLICACAO'
      Required = True
      Size = 1
    end
    object IBQuery_PedidoRevisaoItemREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Origin = 'TESTEPEDIDOREVISAOITEM.REFERENCIAAVALIACAO'
      Required = True
      Size = 3
    end
    object IBQuery_PedidoRevisaoItemCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'TESTEPEDIDOREVISAOITEM.CODMATERIA'
      Required = True
      Size = 6
    end
    object IBQuery_PedidoRevisaoItemIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Origin = 'TESTEPEDIDOREVISAOITEM.IDENTIDADE'
      Required = True
      FixedChar = True
    end
    object IBQuery_PedidoRevisaoItemNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Origin = 'TESTEPEDIDOREVISAOITEM.NUMITEM'
      Required = True
    end
    object IBQuery_PedidoRevisaoItemNUMEROQUESTAO: TSmallintField
      FieldName = 'NUMEROQUESTAO'
      Origin = 'TESTEPEDIDOREVISAOITEM.NUMEROQUESTAO'
      Required = True
    end
    object IBQuery_PedidoRevisaoItemRESPGABARITO: TIBStringField
      FieldName = 'RESPGABARITO'
      Origin = 'TESTEPEDIDOREVISAOITEM.RESPGABARITO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_PedidoRevisaoItemRESPALUNO: TIBStringField
      FieldName = 'RESPALUNO'
      Origin = 'TESTEPEDIDOREVISAOITEM.RESPALUNO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_PedidoRevisaoItemDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
      Origin = 'TESTEPEDIDOREVISAOITEM.DATAPEDIDO'
    end
    object IBQuery_PedidoRevisaoItemDESCENALT: TBlobField
      FieldName = 'DESCENALT'
      Origin = 'ITEM_DESC.DESCENALT'
      Size = 8
    end
    object IBQuery_PedidoRevisaoItemNOME_CHEFE_EAVA: TIBStringField
      FieldName = 'NOME_CHEFE_EAVA'
      Origin = 'TESTEPEDIDOREVISAOITEM.NOME_CHEFE_EAVA'
      Size = 125
    end
  end
  object DSQ_PedidoRevisaoItem: TDataSource
    DataSet = IBQuery_PedidoRevisaoItem
    Left = 223
    Top = 201
  end
  object IBTable_PedidoRevisaoItem: TIBTable
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
        Name = 'IDENTIDADE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMEROQUESTAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'RESPGABARITO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RESPALUNO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAPEDIDO'
        DataType = ftDateTime
      end
      item
        Name = 'ARGUMENTACAO_ALUNO'
        DataType = ftString
        Size = 1500
      end
      item
        Name = 'ARGUMENTACAO_DOCENTE'
        DataType = ftString
        Size = 1500
      end
      item
        Name = 'PROVIDENCIA_ALUNO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PROVIDENCIA_DOCENTE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PROVIDENCIA_EAVA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CONSIDERACAO_CHEFEEAVA'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NOME_DOCENTE'
        DataType = ftString
        Size = 125
      end
      item
        Name = 'DATA_DOCENTE'
        DataType = ftDateTime
      end
      item
        Name = 'NOME_CHEFE_EAVA'
        DataType = ftString
        Size = 125
      end
      item
        Name = 'DATA_CHEFE_EAVA'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PK_TESTEPEDIDOREVISAOITEM'
        Fields = 
          'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;IDE' +
          'NTIDADE;NUMITEM'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TESTEPEDIDOREVISAOITEM'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
      end>
    IndexFieldNames = 
      'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;IDE' +
      'NTIDADE;NUMITEM;NUMEROQUESTAO'
    MasterFields = 
      'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;IDE' +
      'NTIDADE;NUMITEM;NUMEROQUESTAO'
    MasterSource = DSQ_PedidoRevisaoItem
    StoreDefs = True
    TableName = 'TESTEPEDIDOREVISAOITEM'
    Left = 256
    Top = 200
    object IBTable_PedidoRevisaoItemIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Required = True
    end
    object IBTable_PedidoRevisaoItemIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Required = True
    end
    object IBTable_PedidoRevisaoItemFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Required = True
      Size = 1
    end
    object IBTable_PedidoRevisaoItemREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Required = True
      Size = 3
    end
    object IBTable_PedidoRevisaoItemCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Required = True
      Size = 6
    end
    object IBTable_PedidoRevisaoItemIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Required = True
      FixedChar = True
    end
    object IBTable_PedidoRevisaoItemNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
      Required = True
    end
    object IBTable_PedidoRevisaoItemNUMEROQUESTAO: TSmallintField
      FieldName = 'NUMEROQUESTAO'
      Required = True
    end
    object IBTable_PedidoRevisaoItemRESPGABARITO: TIBStringField
      FieldName = 'RESPGABARITO'
      FixedChar = True
      Size = 1
    end
    object IBTable_PedidoRevisaoItemRESPALUNO: TIBStringField
      FieldName = 'RESPALUNO'
      FixedChar = True
      Size = 1
    end
    object IBTable_PedidoRevisaoItemDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
    end
    object IBTable_PedidoRevisaoItemARGUMENTACAO_ALUNO: TIBStringField
      FieldName = 'ARGUMENTACAO_ALUNO'
      Size = 1500
    end
    object IBTable_PedidoRevisaoItemARGUMENTACAO_DOCENTE: TIBStringField
      FieldName = 'ARGUMENTACAO_DOCENTE'
      Size = 1500
    end
    object IBTable_PedidoRevisaoItemPROVIDENCIA_ALUNO: TIBStringField
      FieldName = 'PROVIDENCIA_ALUNO'
      Size = 50
    end
    object IBTable_PedidoRevisaoItemPROVIDENCIA_DOCENTE: TIBStringField
      FieldName = 'PROVIDENCIA_DOCENTE'
      Size = 50
    end
    object IBTable_PedidoRevisaoItemPROVIDENCIA_EAVA: TIBStringField
      FieldName = 'PROVIDENCIA_EAVA'
      Size = 50
    end
    object IBTable_PedidoRevisaoItemCONSIDERACAO_CHEFEEAVA: TIBStringField
      FieldName = 'CONSIDERACAO_CHEFEEAVA'
      Size = 200
    end
    object IBTable_PedidoRevisaoItemNOME_DOCENTE: TIBStringField
      FieldName = 'NOME_DOCENTE'
      Size = 125
    end
    object IBTable_PedidoRevisaoItemDATA_DOCENTE: TDateTimeField
      FieldName = 'DATA_DOCENTE'
    end
    object IBTable_PedidoRevisaoItemNOME_CHEFE_EAVA: TIBStringField
      FieldName = 'NOME_CHEFE_EAVA'
      Size = 125
    end
    object IBTable_PedidoRevisaoItemDATA_CHEFE_EAVA: TDateTimeField
      FieldName = 'DATA_CHEFE_EAVA'
    end
  end
  object DST_PedidoRevisaoItem: TDataSource
    DataSet = IBTable_PedidoRevisaoItem
    Left = 286
    Top = 201
  end
  object IBTable_AlunoTurma: TIBTable
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
    MasterFields = 'IDCURSO;IDTURMA;IDENTIDADE'
    MasterSource = DSQ_PedidoRevisaoItem
    StoreDefs = True
    TableName = 'ALUNOTURMA'
    Left = 192
    Top = 248
    object IBTable_AlunoTurmaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object IBTable_AlunoTurmaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object IBTable_AlunoTurmaIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
    end
    object IBTable_AlunoTurmaNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 125
    end
    object IBTable_AlunoTurmaCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
  end
  object DST_AlunoTurma: TDataSource
    DataSet = IBTable_AlunoTurma
    Left = 222
    Top = 249
  end
  object IBQuery_Curso: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select CodCurso, Turma '
      'From Turmas_Em_Andamento_View'
      'where IdCurso = 64'
      'and     IdTurma = 17'
      '')
    Left = 192
    Top = 280
    object IBQuery_CursoCODCURSO: TIBStringField
      FieldName = 'CODCURSO'
      Origin = 'TURMA_ANDAMENTO_VIEW.CODCURSO'
      Size = 10
    end
    object IBQuery_CursoTURMA: TIBStringField
      FieldName = 'TURMA'
      Origin = 'TURMA_ANDAMENTO_VIEW.TURMA'
      Size = 15
    end
  end
  object DSQ_Curso: TDataSource
    DataSet = IBQuery_Curso
    Left = 223
    Top = 281
  end
  object IBQuery_Teste: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select DataAplicacao, CodProva'
      ' From Testes_View'
      'where IdCurso = 64'
      'and     IdTurma = 17'
      '')
    Left = 192
    Top = 312
    object IBQuery_TesteDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
      Origin = 'TESTE_VIEW.DATAAPLICACAO'
    end
    object IBQuery_TesteCODPROVA: TIBStringField
      FieldName = 'CODPROVA'
      Origin = 'TESTE_VIEW.CODPROVA'
      Size = 4
    end
  end
  object DSQ_teste: TDataSource
    DataSet = IBQuery_Teste
    Left = 223
    Top = 313
  end
  object ExportQR1: TExportQR
    PixelFormat = pf8bit
    Left = 698
    Top = 34
  end
  object DSQ_ChefeAVL: TDataSource
    DataSet = Query_ChefeAVL
    Left = 480
    Top = 232
  end
  object Query_ChefeAVL: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select  c.Sigla, trim(c.PostoGraduacao)||'#39' '#39'||c.nome as Nome'
      'from cargo_view c'
      '')
    Left = 448
    Top = 234
    object Query_ChefeAVLSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = 'CARGO_VIEW.SIGLA'
      Size = 5
    end
    object Query_ChefeAVLNOME: TIBStringField
      FieldName = 'NOME'
      Size = 126
    end
  end
  object IBQuery_InstrutorTurma: TIBQuery
    Database = DM.IBDatabase_Ensino
    Transaction = DM.IBTransaction_Ensino
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSQ_PedidoRevisaoItem
    SQL.Strings = (
      'Select IdCurso, IdTurma,  NomeGuerra, NomeCompleto'
      'From Instrutor_Turma_View '
      'Where IdCurso = :IdCurso'
      'and   IdTurma = :IdTurma')
    Left = 446
    Top = 272
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
    object IBQuery_InstrutorTurmaIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'INSTRUTOR_TURMA_VIEW.IDCURSO'
    end
    object IBQuery_InstrutorTurmaIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'INSTRUTOR_TURMA_VIEW.IDTURMA'
    end
    object IBQuery_InstrutorTurmaNOMEGUERRA: TIBStringField
      FieldName = 'NOMEGUERRA'
      Origin = 'INSTRUTOR_TURMA_VIEW.NOMEGUERRA'
    end
    object IBQuery_InstrutorTurmaNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'INSTRUTOR_TURMA_VIEW.NOMECOMPLETO'
      Size = 125
    end
  end
  object DSQ_InstrutorTurma: TDataSource
    DataSet = IBQuery_InstrutorTurma
    Left = 480
    Top = 271
  end
  object Table_ItemTeste: TIBTable
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
        Name = 'NUMITEM'
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
        Name = 'MATERIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NUMEROQUESTAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'QUESTAOANULADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUESTAOIRREGULAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAB'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAD'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALTERNATIVACORRETAE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INDICEFACILIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'REVISAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'ITEMTESTE_PK'
        Fields = 
          'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA;NUM' +
          'EROQUESTAO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ITEMTESTE'
        Fields = 'IDCURSO;IDTURMA;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMATERIA'
      end>
    IndexFieldNames = 
      'IDCURSO;IDTURMA;NUMITEM;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMAT' +
      'ERIA'
    MasterFields = 
      'IDCURSO;IDTURMA;NUMITEM;FASEAPLICACAO;REFERENCIAAVALIACAO;CODMAT' +
      'ERIA'
    MasterSource = DSQ_PedidoRevisaoItem
    StoreDefs = True
    TableName = 'ITEMTESTE'
    Left = 224
    Top = 158
    object Table_ItemTesteIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
    end
    object Table_ItemTesteIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
    end
    object Table_ItemTesteNUMITEM: TIntegerField
      FieldName = 'NUMITEM'
    end
    object Table_ItemTesteFASEAPLICACAO: TIBStringField
      FieldName = 'FASEAPLICACAO'
      Size = 1
    end
    object Table_ItemTesteREFERENCIAAVALIACAO: TIBStringField
      FieldName = 'REFERENCIAAVALIACAO'
      Size = 3
    end
    object Table_ItemTesteCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Size = 6
    end
    object Table_ItemTesteMATERIA: TIBStringField
      FieldName = 'MATERIA'
      Size = 6
    end
    object Table_ItemTesteNUMEROQUESTAO: TSmallintField
      FieldName = 'NUMEROQUESTAO'
    end
    object Table_ItemTesteQUESTAOANULADA: TIBStringField
      FieldName = 'QUESTAOANULADA'
      Size = 1
    end
    object Table_ItemTesteQUESTAOIRREGULAR: TIBStringField
      FieldName = 'QUESTAOIRREGULAR'
      Size = 1
    end
    object Table_ItemTesteALTERNATIVACORRETAA: TIBStringField
      FieldName = 'ALTERNATIVACORRETAA'
      Size = 1
    end
    object Table_ItemTesteALTERNATIVACORRETAB: TIBStringField
      FieldName = 'ALTERNATIVACORRETAB'
      Size = 1
    end
    object Table_ItemTesteALTERNATIVACORRETAC: TIBStringField
      FieldName = 'ALTERNATIVACORRETAC'
      Size = 1
    end
    object Table_ItemTesteALTERNATIVACORRETAD: TIBStringField
      FieldName = 'ALTERNATIVACORRETAD'
      Size = 1
    end
    object Table_ItemTesteINDICEFACILIDADE: TIBStringField
      FieldName = 'INDICEFACILIDADE'
      Size = 1
    end
  end
end
