object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Medicinas'
  ClientHeight = 232
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 70
    Top = 16
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object Label2: TLabel
    Left = 70
    Top = 72
    Width = 59
    Height = 13
    Caption = 'Composici'#243'n'
  end
  object Label3: TLabel
    Left = 382
    Top = 13
    Width = 65
    Height = 13
    Caption = 'Presentaci'#243'n '
  end
  object Edit1: TEdit
    Left = 70
    Top = 32
    Width = 217
    Height = 21
    Hint = 'Medicina|Ingrese Nombre|170'
    CustomHint = Form1.BalloonHint1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = 'Ingrese Nombre'
  end
  object Edit2: TEdit
    Left = 70
    Top = 88
    Width = 523
    Height = 21
    Hint = 'Medicina|Ingrese Nombre|170'
    CustomHint = Form1.BalloonHint1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = 'Ingrese composici'#243'n'
  end
  object Button1: TButton
    Left = 214
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    ImageIndex = 56
    Images = Form1.ImageList1
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 336
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ImageIndex = 0
    Images = Form1.ImageList1
    TabOrder = 3
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 382
    Top = 32
    Width = 211
    Height = 21
    ItemIndex = 0
    Sorted = True
    TabOrder = 4
    Text = 'Aerosol'
    Items.Strings = (
      'Aerosol'
      'Ampolla'
      'C'#225'psulas'
      'Comprimidos'
      'Grajeas'
      'Jarabes'
      'Otro'
      'Soluci'#243'n'
      'Suspensiones')
  end
end
