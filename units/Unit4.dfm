object Form4: TForm4
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Diagnostico'
  ClientHeight = 324
  ClientWidth = 517
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
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 517
    Height = 89
    Margins.Top = 20
    Align = alTop
    TabOrder = 0
    OnChange = Edit1Change
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 130
    Width = 517
    Height = 149
    Margins.Top = 20
    Align = alTop
    Caption = 'Agregar a Vocabulario'
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 16
      Top = 81
      Width = 63
      Height = 13
      Caption = 'Nuevo Grupo'
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 91
      Height = 13
      Caption = 'Grupos registrados'
    end
    object Edit1: TEdit
      Left = 16
      Top = 100
      Width = 265
      Height = 21
      TabOrder = 0
      TextHint = 'Agregue grupo'
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 304
      Top = 100
      Width = 161
      Height = 25
      Caption = 'Agregar a Vocabulario'
      Enabled = False
      ImageIndex = 138
      Images = Form1.ImageList1
      TabOrder = 1
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 54
      Width = 265
      Height = 21
      TabOrder = 2
      Text = 'Grupo'
      OnSelect = ComboBox1Select
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 279
    Width = 517
    Height = 45
    Margins.Top = 20
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 40
      Top = 11
      Width = 98
      Height = 22
      Caption = 'Agregar'
      ImageIndex = 130
      Images = Form1.ImageList1
      Enabled = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 232
      Top = 11
      Width = 97
      Height = 22
      Caption = 'Salir'
      ImageIndex = 90
      Images = Form1.ImageList1
      OnClick = SpeedButton2Click
    end
    object CheckBox1: TCheckBox
      Left = 376
      Top = 14
      Width = 97
      Height = 17
      Caption = 'Diccionario'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 517
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Diagn'#243'stico'
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQueryDiccionario
    Left = 336
    Top = 52
  end
end
