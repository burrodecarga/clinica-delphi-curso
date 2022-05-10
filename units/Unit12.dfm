object Form12: TForm12
  Left = 0
  Top = 0
  Caption = 'Enfermedad'
  ClientHeight = 289
  ClientWidth = 447
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
  object Label1: TLabel
    Left = 10
    Top = 16
    Width = 58
    Height = 13
    Caption = 'Enfermedad'
  end
  object Label2: TLabel
    Left = 10
    Top = 64
    Width = 54
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object Edit1: TEdit
    Left = 10
    Top = 40
    Width = 351
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 10
    Top = 88
    Width = 429
    Height = 129
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 112
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    ImageIndex = 56
    Images = Form1.ImageList1
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Salir'
    ImageIndex = 90
    Images = Form1.ImageList1
    TabOrder = 3
    OnClick = Button2Click
  end
end
