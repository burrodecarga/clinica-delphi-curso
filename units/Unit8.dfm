object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Laboratorios'
  ClientHeight = 505
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 983
    Height = 505
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 512
      Top = 155
      Width = 100
      Height = 13
      Caption = 'Resultados Normales'
    end
    object Label4: TLabel
      Left = 512
      Top = 306
      Width = 106
      Height = 13
      Caption = 'Resultados Anormales'
    end
    object Label5: TLabel
      Left = 792
      Top = -12
      Width = 100
      Height = 13
      Caption = 'Resultados Normales'
    end
    object Label6: TLabel
      Left = 512
      Top = 6
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Panel3: TPanel
      Left = 19
      Top = 16
      Width = 222
      Height = 113
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 9
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label2: TLabel
        Left = 16
        Top = 55
        Width = 33
        Height = 13
        Caption = 'Unidad'
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 28
        Width = 145
        Height = 21
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 74
        Width = 145
        Height = 21
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 272
      Top = 13
      Width = 212
      Height = 130
      BevelInner = bvLowered
      TabOrder = 1
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 208
        Height = 41
        Align = alTop
        Caption = 'Hombres'
        TabOrder = 0
      end
      object Panel6: TPanel
        Left = 2
        Top = 86
        Width = 208
        Height = 43
        Align = alTop
        TabOrder = 1
        object Panel7: TPanel
          Left = 8
          Top = 6
          Width = 49
          Height = 30
          Caption = 'min'
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 63
          Top = 9
          Width = 121
          Height = 21
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 43
        Width = 208
        Height = 43
        Align = alTop
        TabOrder = 2
        object Panel9: TPanel
          Left = 8
          Top = 6
          Width = 49
          Height = 30
          Caption = 'max'
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 63
          Top = 9
          Width = 121
          Height = 21
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object Panel10: TPanel
      Left = 272
      Top = 176
      Width = 212
      Height = 130
      BevelInner = bvLowered
      TabOrder = 2
      object Panel11: TPanel
        Left = 2
        Top = 2
        Width = 208
        Height = 41
        Align = alTop
        Caption = 'Mujeres'
        TabOrder = 0
      end
      object Panel12: TPanel
        Left = 2
        Top = 86
        Width = 208
        Height = 43
        Align = alTop
        TabOrder = 1
        object Panel13: TPanel
          Left = 8
          Top = 6
          Width = 49
          Height = 30
          Caption = 'min'
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 63
          Top = 9
          Width = 121
          Height = 21
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel14: TPanel
        Left = 2
        Top = 43
        Width = 208
        Height = 43
        Align = alTop
        TabOrder = 2
        object Panel15: TPanel
          Left = 8
          Top = 6
          Width = 49
          Height = 30
          Caption = 'max'
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 63
          Top = 9
          Width = 121
          Height = 21
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object Panel16: TPanel
      Left = 274
      Top = 328
      Width = 212
      Height = 130
      BevelInner = bvLowered
      TabOrder = 3
      object Panel17: TPanel
        Left = 2
        Top = 2
        Width = 208
        Height = 41
        Align = alTop
        Caption = 'Ni'#241'os'
        TabOrder = 0
      end
      object Panel18: TPanel
        Left = 2
        Top = 86
        Width = 208
        Height = 43
        Align = alTop
        TabOrder = 1
        object Panel19: TPanel
          Left = 8
          Top = 6
          Width = 49
          Height = 30
          Caption = 'min'
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 63
          Top = 9
          Width = 121
          Height = 21
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel20: TPanel
        Left = 2
        Top = 43
        Width = 208
        Height = 43
        Align = alTop
        TabOrder = 2
        object Panel21: TPanel
          Left = 8
          Top = 6
          Width = 49
          Height = 30
          Caption = 'max'
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 63
          Top = 9
          Width = 121
          Height = 21
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object DBMemo1: TDBMemo
      Left = 512
      Top = 174
      Width = 450
      Height = 133
      Color = 16777151
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 4
    end
    object DBMemo2: TDBMemo
      Left = 512
      Top = 330
      Width = 447
      Height = 133
      Color = 15448824
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBGrid1: TDBGrid
      Left = 19
      Top = 142
      Width = 222
      Height = 272
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 6
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
        end
        item
          Expanded = False
          Visible = False
        end
        item
          Expanded = False
          Visible = False
        end
        item
          Expanded = False
          Visible = False
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 19
      Top = 420
      Width = 224
      Height = 25
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 7
    end
    object Panel1: TPanel
      Left = 2
      Top = 469
      Width = 979
      Height = 34
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 8
      object Button1: TButton
        Left = 2
        Top = 2
        Width = 85
        Height = 30
        CustomHint = Form1.BalloonHint1
        Align = alLeft
        Caption = 'agregar'
        ImageIndex = 170
        ImageMargins.Left = 2
        Images = Form1.ImageList1
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 87
        Top = 2
        Width = 85
        Height = 30
        CustomHint = Form1.BalloonHint1
        Align = alLeft
        Caption = 'editar'
        ImageIndex = 94
        ImageMargins.Left = 3
        Images = Form1.ImageList1
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 172
        Top = 2
        Width = 85
        Height = 30
        CustomHint = Form1.BalloonHint1
        Align = alLeft
        Caption = 'eliminar'
        ImageIndex = 96
        Images = Form1.ImageList1
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 257
        Top = 2
        Width = 75
        Height = 30
        CustomHint = Form1.BalloonHint1
        Align = alLeft
        Caption = 'Cerrar'
        ImageIndex = 90
        Images = Form1.ImageList1
        TabOrder = 3
        OnClick = Button4Click
      end
    end
    object DBMemo3: TDBMemo
      Left = 512
      Top = 23
      Width = 450
      Height = 126
      Color = 13041606
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 9
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQueryLaboratorios
    Left = 128
    Top = 272
  end
end
