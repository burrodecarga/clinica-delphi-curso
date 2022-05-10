object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'Enfermedades'
  ClientHeight = 437
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 440
    Height = 396
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 396
    Width = 770
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 301
      Top = 1
      Width = 80
      Height = 39
      Align = alLeft
      Caption = 'buscar'
      ImageIndex = 320
      Images = Form1.ImageList1
      Enabled = False
      HotImageIndex = 84
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
      ExplicitLeft = 409
    end
    object SpeedButton2: TSpeedButton
      Left = 201
      Top = 1
      Width = 100
      Height = 39
      Hint = 'Pacientes|Eliminar Paciente|58'
      Align = alLeft
      Caption = 'Eliminar'
      ImageIndex = 58
      Images = Form1.ImageList1
      Enabled = False
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 101
      Top = 1
      Width = 100
      Height = 39
      Hint = 'Pacientes|Editar Paciente|96'
      Align = alLeft
      Caption = 'Editar'
      ImageIndex = 96
      Images = Form1.ImageList1
      Enabled = False
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 1
      Top = 1
      Width = 100
      Height = 39
      Hint = 'Pacientes|Agregar Paciente|98'
      Align = alLeft
      Caption = 'Agregar'
      ImageIndex = 170
      Images = Form1.ImageList1
      Enabled = False
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
    object SpeedButton7: TSpeedButton
      Left = 514
      Top = 10
      Width = 79
      Height = 22
      Caption = 'Todos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
        77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
        07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      OnClick = SpeedButton7Click
    end
    object SpeedButton5: TSpeedButton
      Left = 689
      Top = 1
      Width = 80
      Height = 39
      Align = alRight
      Caption = 'cerrar'
      ImageIndex = 90
      Images = Form1.ImageList1
      HotImageIndex = 84
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton5Click
      ExplicitLeft = 409
    end
    object Edit5: TEdit
      Left = 387
      Top = 10
      Width = 121
      Height = 21
      Hint = 'Buscar|Buscar por Nombre o por C'#233'dula|320'
      TabOrder = 0
      TextHint = 'Buscar....'
    end
  end
  object Panel2: TPanel
    Left = 440
    Top = 0
    Width = 330
    Height = 396
    Align = alRight
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 1
      Top = 232
      Width = 328
      Height = 163
      Align = alBottom
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 328
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Caracter'#237'sticas'
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 1
      Top = 42
      Width = 328
      Height = 149
      Align = alClient
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 2
      OnChange = DBMemo1Change
    end
    object Panel4: TPanel
      Left = 1
      Top = 191
      Width = 328
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      Caption = 'S'#237'ntomas'
      TabOrder = 3
      object Button1: TButton
        Left = 240
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Agregar'
        ImageIndex = 142
        Images = Form1.ImageList1
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQueryEnfermedades
    Left = 216
    Top = 184
  end
  object DataSource2: TDataSource
    DataSet = DM.FDQueryPivot
    Left = 456
    Top = 296
  end
end
