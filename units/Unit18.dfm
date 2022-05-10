object Form18: TForm18
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Formulario de Registro'
  ClientHeight = 321
  ClientWidth = 386
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
  object Button1: TButton
    Left = 40
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Terminar'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 40
    Top = 24
    Width = 305
    Height = 105
    Caption = 'N'#250'mero de M'#225'quina'
    TabOrder = 1
    object Edit1: TEdit
      Left = 18
      Top = 44
      Width = 199
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 40
    Top = 160
    Width = 305
    Height = 78
    Caption = 'Instrucciones'
    TabOrder = 2
    object Label1: TLabel
      Left = 14
      Top = 26
      Width = 259
      Height = 13
      Caption = 'Debe copiar lel n'#250'mero de m'#225'quiina y debe enviarlo a:'
      WordWrap = True
    end
    object Label2: TLabel
      Left = -61
      Top = 84
      Width = 158
      Height = 14
      Alignment = taCenter
      Caption = 'edwinhenriquezh@gmail.com'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
  object Button2: TButton
    Left = 270
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 3
    Visible = False
    OnClick = Button2Click
  end
end
