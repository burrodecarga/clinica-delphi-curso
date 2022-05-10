object Form19: TForm19
  Left = 0
  Top = 0
  Caption = 'Estilos'
  ClientHeight = 600
  ClientWidth = 786
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
    Left = 520
    Top = 200
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object SpeedButton1: TSpeedButton
    Left = 432
    Top = 248
    Width = 23
    Height = 22
  end
  object SpeedButton2: TSpeedButton
    Left = 432
    Top = 296
    Width = 177
    Height = 22
  end
  object SpeedButton3: TSpeedButton
    Left = 424
    Top = 51
    Width = 111
    Height = 22
    Caption = 'Cerrar'
    ImageIndex = 90
    Images = Form1.ImageList1
    OnClick = SpeedButton3Click
  end
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 217
    Height = 600
    Align = alLeft
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object Button1: TButton
    Left = 256
    Top = 48
    Width = 99
    Height = 25
    Caption = 'Reset'
    ImageIndex = 48
    Images = Form1.ImageList1
    TabOrder = 1
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 272
    Top = 128
    Width = 441
    Height = 41
    Caption = 'Panel1'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 280
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 392
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
  end
  object ListBox2: TListBox
    Left = 272
    Top = 248
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 272
    Top = 368
    Width = 320
    Height = 120
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
