object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Sintomas'
  ClientHeight = 413
  ClientWidth = 758
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 230
    Height = 413
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 42
      Width = 228
      Height = 370
      Align = alClient
      DataSource = DataSource2
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
          Visible = False
        end
        item
          Expanded = False
          Visible = True
        end>
    end
    object Panel9: TPanel
      Left = 1
      Top = 1
      Width = 228
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 224
        Height = 37
        Align = alClient
        Alignment = taCenter
        Caption = 'S'#237'ntomas de la enferemedad'
        Layout = tlCenter
        ExplicitWidth = 136
        ExplicitHeight = 13
      end
    end
  end
  object Panel2: TPanel
    Left = 498
    Top = 0
    Width = 260
    Height = 413
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 1
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 258
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'S'#237'ntomas Registrados'
      Layout = tlCenter
      ExplicitWidth = 103
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 14
      Width = 258
      Height = 357
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Visible = False
        end
        item
          Expanded = False
          Visible = True
        end>
    end
    object Panel8: TPanel
      Left = 1
      Top = 371
      Width = 258
      Height = 41
      Align = alBottom
      TabOrder = 1
      object Button4: TButton
        Left = 5
        Top = 6
        Width = 41
        Height = 25
        Cursor = crHandPoint
        Hint = 'Editar|Editar S'#237'ntoma|96'
        CustomHint = Form1.BalloonHint1
        ImageIndex = 94
        ImageMargins.Left = 10
        Images = Form1.ImageList1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 52
        Top = 6
        Width = 41
        Height = 25
        Cursor = crHandPoint
        Hint = 'Elimina|Eliminar S'#237'ntoma|96'
        CustomHint = Form1.BalloonHint1
        ImageIndex = 58
        ImageMargins.Left = 10
        Images = Form1.ImageList1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = Button5Click
      end
      object Edit2: TEdit
        Left = 99
        Top = 10
        Width = 113
        Height = 21
        TabOrder = 2
        TextHint = 'Buscar S'#237'ntoma'
      end
      object Button6: TButton
        Left = 218
        Top = 6
        Width = 30
        Height = 25
        Cursor = crHandPoint
        ImageIndex = 320
        ImageMargins.Left = 5
        ImageMargins.Top = 5
        ImageMargins.Bottom = 3
        Images = Form1.ImageList1
        TabOrder = 3
        OnClick = Button6Click
      end
    end
  end
  object Panel3: TPanel
    Left = 230
    Top = 0
    Width = 268
    Height = 413
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 266
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'S'#237'ntomas de la enferemedad'
      Layout = tlCenter
      ExplicitWidth = 136
    end
    object Panel4: TPanel
      Left = 1
      Top = 14
      Width = 266
      Height = 128
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label4: TLabel
        Left = 24
        Top = 32
        Width = 38
        Height = 13
        Caption = 'S'#237'ntoma'
      end
      object Button1: TButton
        Left = 24
        Top = 80
        Width = 97
        Height = 25
        Cursor = crHandPoint
        Caption = 'Ok'
        Enabled = False
        ImageIndex = 56
        ImageMargins.Left = 20
        Images = Form1.ImageList1
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 24
        Top = 53
        Width = 229
        Height = 21
        Hint = 'Nuevo S'#237'ntoma|Permite Agregar Nuevo s'#237'ntoma|56'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TextHint = 'Agregar nuevo S'#237'ntoma'
        OnChange = Edit1Change
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 224
      Width = 266
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object Button2: TButton
        Left = 100
        Top = 6
        Width = 60
        Height = 25
        Cursor = crHandPoint
        ImageIndex = 16
        ImageMargins.Left = 18
        Images = Form1.ImageList1
        TabOrder = 0
        OnClick = Button2Click
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 183
      Width = 266
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      object Button3: TButton
        Left = 100
        Top = 8
        Width = 60
        Height = 25
        Cursor = crHandPoint
        ImageIndex = 14
        ImageMargins.Left = 18
        Images = Form1.ImageList1
        TabOrder = 0
        OnClick = Button3Click
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 142
      Width = 266
      Height = 41
      Align = alTop
      Caption = 'Operaciones'
      TabOrder = 3
    end
    object Button7: TButton
      Left = 88
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      ImageIndex = 90
      Images = Form1.ImageList1
      TabOrder = 4
      OnClick = Button7Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQuerySintomas
    Left = 544
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = DM.FDQueryPivot
    Left = 80
    Top = 240
  end
end
