object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Im'#225'genes'
  ClientHeight = 428
  ClientWidth = 774
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
    Left = 456
    Top = 56
    Width = 54
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object SpeedButton5: TSpeedButton
    Left = 711
    Top = 16
    Width = 32
    Height = 22
    Hint = 'Uso de Vocabulario|Pulse para agregar vocabulario|56'
    CustomHint = Form1.BalloonHint1
    ImageIndex = 142
    Images = Form1.ImageList1
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton5Click
  end
  object Edit1: TEdit
    Left = 456
    Top = 16
    Width = 249
    Height = 21
    TabOrder = 0
    TextHint = 'Tipo de Imagen'
    OnChange = Edit1Change
  end
  object Memo1: TMemo
    Left = 456
    Top = 80
    Width = 287
    Height = 249
    TabOrder = 1
    OnChange = Memo1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 428
    Align = alLeft
    TabOrder = 2
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 426
      Height = 426
      Align = alClient
      Center = True
      Proportional = True
      ExplicitWidth = 398
      ExplicitHeight = 398
    end
  end
  object Panel2: TPanel
    Left = 456
    Top = 371
    Width = 287
    Height = 41
    BevelInner = bvLowered
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 8
      Width = 129
      Height = 22
      Caption = 'guardar'
      ImageIndex = 130
      Images = Form1.ImageList1
      Enabled = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 152
      Top = 8
      Width = 129
      Height = 22
      Caption = 'cerrar'
      ImageIndex = 0
      Images = Form1.ImageList1
      OnClick = SpeedButton2Click
    end
  end
  object Panel3: TPanel
    Left = 456
    Top = 332
    Width = 287
    Height = 41
    BevelInner = bvLowered
    TabOrder = 4
    object SpeedButton3: TSpeedButton
      Left = 8
      Top = 8
      Width = 129
      Height = 22
      Caption = 'cargar imagen'
      ImageIndex = 148
      Images = Form1.ImageList1
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 152
      Top = 8
      Width = 129
      Height = 22
      Caption = 'Nueva Imagen'
      ImageIndex = 314
      Images = Form1.ImageList1
      Enabled = False
      OnClick = SpeedButton4Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = 'jpg'
    Filter = 
      'All (*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.ti' +
      'ff)|*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tif' +
      'f|GIF Image (*.gif)|*.gif|JPEG Image File (*.jpg)|*.jpg|JPEG Ima' +
      'ge File (*.jpeg)|*.jpeg|Portable Network Graphics (*.png)|*.png|' +
      'Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.' +
      'emf)|*.emf|Metafiles (*.wmf)|*.wmf|TIFF Images (*.tif)|*.tif|TIF' +
      'F Images (*.tiff)|*.tiff|imagenes|*.gif;*.jpg;*.jpeg;*.png;*.bmp' +
      ';*.ico;*.emf;*.wmf;*.tif;*.tiff'
    FilterIndex = 12
    Left = 160
    Top = 168
  end
end
