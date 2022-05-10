object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Laboratorio'
  ClientHeight = 549
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  object Label2: TLabel
    Left = 240
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Prueba'
  end
  object Label3: TLabel
    Left = 560
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Unidades'
  end
  object Label4: TLabel
    Left = 97
    Top = 72
    Width = 104
    Height = 13
    Caption = 'Valores para hombres'
  end
  object Label5: TLabel
    Left = 48
    Top = 104
    Width = 36
    Height = 13
    Caption = 'M'#225'ximo'
  end
  object Label6: TLabel
    Left = 48
    Top = 131
    Width = 32
    Height = 13
    Caption = 'M'#237'nimo'
  end
  object Label7: TLabel
    Left = 326
    Top = 72
    Width = 101
    Height = 13
    Caption = 'Valores para Mujeres'
  end
  object Label8: TLabel
    Left = 279
    Top = 104
    Width = 36
    Height = 13
    Caption = 'M'#225'ximo'
  end
  object Label9: TLabel
    Left = 279
    Top = 131
    Width = 32
    Height = 13
    Caption = 'M'#237'nimo'
  end
  object Label10: TLabel
    Left = 565
    Top = 72
    Width = 89
    Height = 13
    Caption = 'Valores para Ni'#241'os'
  end
  object Label11: TLabel
    Left = 516
    Top = 104
    Width = 36
    Height = 13
    Caption = 'M'#225'ximo'
  end
  object Label12: TLabel
    Left = 516
    Top = 131
    Width = 32
    Height = 13
    Caption = 'M'#237'nimo'
  end
  object Label13: TLabel
    Left = 48
    Top = 176
    Width = 60
    Height = 13
    Caption = 'Observacion'
  end
  object Label14: TLabel
    Left = 48
    Top = 288
    Width = 100
    Height = 13
    Caption = 'Resultados Normales'
  end
  object Label15: TLabel
    Left = 48
    Top = 401
    Width = 106
    Height = 13
    Caption = 'Resultados Anormales'
  end
  object Bevel1: TBevel
    Left = 40
    Top = 64
    Width = 201
    Height = 106
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 271
    Top = 64
    Width = 201
    Height = 106
    Shape = bsFrame
  end
  object Bevel3: TBevel
    Left = 504
    Top = 64
    Width = 201
    Height = 106
    Shape = bsFrame
  end
  object Edit1: TEdit
    Left = 48
    Top = 27
    Width = 153
    Height = 21
    TabOrder = 0
    TextHint = 'Ingrese Grupo'
  end
  object Edit2: TEdit
    Left = 240
    Top = 27
    Width = 241
    Height = 21
    TabOrder = 1
    TextHint = 'Ingrese Prueba'
  end
  object Edit3: TEdit
    Left = 552
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 2
    TextHint = 'Ingrese Unidades'
  end
  object Edit4: TEdit
    Left = 97
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
    TextHint = 'M'#225'ximo Hombres'
  end
  object Edit5: TEdit
    Left = 97
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0'
    TextHint = 'M'#237'nimo Hpmbres'
  end
  object Edit6: TEdit
    Left = 328
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
    TextHint = 'M'#225'ximo Mujeres'
  end
  object Edit7: TEdit
    Left = 328
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
    TextHint = 'M'#225'ximo Mujeres'
  end
  object Edit8: TEdit
    Left = 565
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
    TextHint = 'M'#225'ximo Ni'#241'os'
  end
  object Edit9: TEdit
    Left = 565
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0'
    TextHint = 'M'#225'ximo Ni'#241'os'
  end
  object Memo1: TMemo
    Left = 48
    Top = 195
    Width = 638
    Height = 80
    TabOrder = 9
  end
  object Memo2: TMemo
    Left = 48
    Top = 307
    Width = 638
    Height = 80
    TabOrder = 10
  end
  object Memo3: TMemo
    Left = 48
    Top = 420
    Width = 638
    Height = 80
    TabOrder = 11
  end
  object Button1: TButton
    Left = 203
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Images = Form1.ImageList1
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 451
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 13
    OnClick = Button2Click
  end
  object KeysOnForm1: TKeysOnForm
    CloseOnEscape = False
    EnterAsTab = True
    PriorControlOnALTLeft = False
    NextControlOnALTRight = False
    Left = 152
    Top = 136
  end
end
