object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'Vocabulario'
  ClientHeight = 459
  ClientWidth = 731
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
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 0
    Width = 731
    Height = 384
    Align = alClient
    AllowDelete = False
    AllowInsert = False
    DataSource = DataSource1
    PanelHeight = 76
    PanelWidth = 714
    TabOrder = 0
    RowCount = 5
    object DBText1: TDBText
      Left = 32
      Top = 5
      Width = 65
      Height = 17
      DataSource = DataSource1
    end
    object DBMemo1: TDBMemo
      AlignWithMargins = True
      Left = 256
      Top = 10
      Width = 448
      Height = 56
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alRight
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 32
      Top = 24
      Width = 80
      Height = 17
      Caption = 'Seleccionar'
      DataSource = DataSource1
      TabOrder = 1
      OnClick = DBCheckBox1Click
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 48
      Width = 211
      Height = 21
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 2
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 384
    Width = 731
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbRefresh, nbApplyUpdates]
    Align = alBottom
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 409
    Width = 731
    Height = 50
    Align = alBottom
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 306
      Top = 1
      Width = 80
      Height = 48
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
      ExplicitHeight = 39
    end
    object SpeedButton3: TSpeedButton
      Left = 101
      Top = 1
      Width = 100
      Height = 48
      Hint = 'Pacientes|Editar Paciente|96'
      Align = alLeft
      Caption = 'Salir'
      ImageIndex = 90
      Images = Form1.ImageList1
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
      ExplicitHeight = 39
    end
    object SpeedButton4: TSpeedButton
      Left = 1
      Top = 1
      Width = 100
      Height = 48
      Hint = 'Pacientes|Agregar Paciente|98'
      Align = alLeft
      Caption = 'Agregar'
      ImageIndex = 98
      Enabled = False
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
      ExplicitHeight = 39
    end
    object SpeedButton2: TSpeedButton
      Left = 201
      Top = 1
      Width = 105
      Height = 48
      Align = alLeft
      Caption = 'seleccionados'
      ImageIndex = 264
      Images = Form1.ImageList1
      Enabled = False
      HotImageIndex = 84
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object Edit5: TEdit
      Left = 571
      Top = 14
      Width = 121
      Height = 21
      Hint = 'Buscar|Buscar por Nombre o por C'#233'dula|320'
      TabOrder = 0
      TextHint = 'Buscar....'
      OnChange = Edit5Change
    end
    object CheckBox1: TCheckBox
      Left = 408
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Notificar'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQueryDiccionario
    Left = 296
    Top = 216
  end
end
