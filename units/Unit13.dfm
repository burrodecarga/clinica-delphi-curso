object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Tratamiento'
  ClientHeight = 355
  ClientWidth = 692
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 355
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 335
      Height = 312
      Align = alClient
      DataSource = DataSource1
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
        end
        item
          Expanded = False
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 313
      Width = 335
      Height = 41
      Align = alBottom
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 1
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
      end
      object Edit5: TEdit
        Left = 98
        Top = 10
        Width = 121
        Height = 21
        Hint = 'Buscar|Buscar por Nombre o por C'#233'dula|320'
        TabOrder = 0
        TextHint = 'Buscar....'
      end
    end
    object Panel6: TPanel
      Left = 99
      Top = 90
      Width = 216
      Height = 211
      Caption = 'Panel6'
      TabOrder = 2
      Visible = False
      object DBGrid2: TDBGrid
        Left = 1
        Top = 38
        Width = 214
        Height = 148
        Align = alBottom
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            ReadOnly = True
            Visible = False
          end
          item
            Expanded = False
            Visible = True
          end>
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 214
        Height = 37
        Align = alClient
        BevelInner = bvLowered
        Caption = 'R'#233'cipe de medicinas'
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 1
        Top = 186
        Width = 214
        Height = 24
        Cursor = crHandPoint
        Align = alBottom
        BevelInner = bvLowered
        Caption = 'Pulse para eliminar'
        TabOrder = 2
        OnClick = Panel8Click
        OnMouseEnter = Panel8MouseEnter
      end
    end
  end
  object Panel3: TPanel
    Left = 337
    Top = 0
    Width = 355
    Height = 355
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 169
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label2: TLabel
      Left = 16
      Top = 53
      Width = 25
      Height = 13
      Caption = 'Dosis'
    end
    object Label3: TLabel
      Left = 16
      Top = 109
      Width = 52
      Height = 13
      Caption = 'Frecuencia'
    end
    object Panel4: TPanel
      Left = 1
      Top = 313
      Width = 353
      Height = 41
      Align = alBottom
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 0
      object SpeedButton3: TSpeedButton
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
      end
      object SpeedButton4: TSpeedButton
        Left = 1
        Top = 1
        Width = 80
        Height = 39
        Align = alLeft
        Caption = 'Ok'
        ImageIndex = 94
        Images = Form1.ImageList1
        Enabled = False
        HotImageIndex = 68
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton4Click
        ExplicitLeft = 409
      end
      object SpeedButton5: TSpeedButton
        Left = 272
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
      object CheckBox1: TCheckBox
        Left = 104
        Top = 16
        Width = 97
        Height = 17
        Caption = 'R'#233'cipe'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 353
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      ParentBackground = False
      TabOrder = 1
      object DBText1: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 12
        Width = 343
        Height = 17
        Margins.Top = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        DataSource = DataSource1
        ExplicitLeft = 120
        ExplicitTop = 8
        ExplicitWidth = 65
      end
    end
    object Edit1: TEdit
      Left = 16
      Top = 72
      Width = 305
      Height = 21
      TabOrder = 2
      TextHint = 'Ingrese Dosis'
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 16
      Top = 128
      Width = 305
      Height = 21
      TabOrder = 3
      TextHint = 'Ingrese frecuencia de dosis'
      OnChange = Edit1Change
    end
    object Memo1: TMemo
      Left = 16
      Top = 188
      Width = 305
      Height = 110
      Hint = 'Observaciones'
      Lines.Strings = (
        '')
      TabOrder = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQueryMedicinas
    Left = 144
    Top = 40
  end
  object DataSource2: TDataSource
    DataSet = DM.FDQueryTratamientos
    Left = 136
    Top = 136
  end
end
