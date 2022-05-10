object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Datos generales del paciente'
  ClientHeight = 561
  ClientWidth = 936
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 936
    Height = 561
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Entrevista'
      object GroupBox1: TGroupBox
        Left = 24
        Top = 16
        Width = 249
        Height = 113
        Caption = 'Datos de Paciente'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 98
          Height = 13
          Caption = 'Nombre del paciente'
        end
        object Label2: TLabel
          Left = 16
          Top = 48
          Width = 85
          Height = 13
          Caption = 'Edad del paciente'
        end
        object Label3: TLabel
          Left = 16
          Top = 72
          Width = 24
          Height = 13
          Caption = 'Sexo'
        end
      end
      object GroupBox2: TGroupBox
        Left = 279
        Top = 0
        Width = 618
        Height = 186
        Caption = 'Informaci'#243'n de Consulta'
        TabOrder = 1
        object Label4: TLabel
          Left = 10
          Top = 78
          Width = 80
          Height = 13
          Caption = 'Tipo de Consulta'
        end
        object DatePicker1: TDatePicker
          Left = 10
          Top = 32
          Width = 169
          Date = 44672.000000000000000000
          DateFormat = 'd/M/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          TabOrder = 0
        end
        object Edit1: TEdit
          Left = 10
          Top = 93
          Width = 169
          Height = 21
          Enabled = False
          TabOrder = 1
          TextHint = 'Motivo de la consulta'
          OnChange = Edit1Change
        end
        object Button1: TButton
          Left = 16
          Top = 142
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Caption = 'Continuar'
          Enabled = False
          ImageIndex = 142
          Images = Form1.ImageList1
          TabOrder = 2
          OnClick = Button1Click
        end
        object RadioGroup1: TRadioGroup
          Left = 376
          Top = 24
          Width = 217
          Height = 105
          Caption = 'Tipo de Consulta'
          Columns = 2
          Items.Strings = (
            'Primera Vez'
            'Consulta'
            'Seguimiento'
            'Control'
            'Otro'
            'cancelar')
          TabOrder = 3
          OnClick = RadioGroup1Click
        end
        object Button4: TButton
          Left = 384
          Top = 142
          Width = 75
          Height = 25
          Caption = 'Salir'
          ImageIndex = 38
          Images = Form1.ImageList1
          TabOrder = 4
          OnClick = Button4Click
        end
      end
      object GroupBox3: TGroupBox
        Left = 24
        Top = 143
        Width = 185
        Height = 378
        Caption = 'S'#237'ntomas'
        TabOrder = 2
        object SpeedButton1: TSpeedButton
          Left = 147
          Top = 20
          Width = 23
          Height = 22
          Cursor = crHandPoint
          ImageIndex = 170
          Images = Form1.ImageList1
          Enabled = False
          OnClick = SpeedButton1Click
        end
        object ListBox1: TListBox
          Left = 11
          Top = 56
          Width = 158
          Height = 217
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 279
        Top = 192
        Width = 618
        Height = 322
        Caption = 'Diagn'#243'stico y tratamiento'
        Enabled = False
        TabOrder = 3
        object SpeedButton2: TSpeedButton
          Left = 16
          Top = 32
          Width = 105
          Height = 22
          Cursor = crHandPoint
          Caption = 'Diagnosticar'
          ImageIndex = 160
          Images = Form1.ImageList1
          Enabled = False
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 127
          Top = 32
          Width = 105
          Height = 22
          Cursor = crHandPoint
          Caption = 'Tratamiento'
          ImageIndex = 48
          Images = Form1.ImageList1
          Enabled = False
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 272
          Top = 32
          Width = 129
          Height = 22
          Caption = 'Usar Vocabulario'
          ImageIndex = 240
          Images = Form1.ImageList1
          Enabled = False
          OnClick = SpeedButton4Click
        end
        object SpeedButton5: TSpeedButton
          Left = 416
          Top = 32
          Width = 129
          Height = 22
          Caption = 'Agregar Imagen'
          ImageIndex = 154
          Images = Form1.ImageList1
          Enabled = False
          OnClick = SpeedButton5Click
        end
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 16
          Top = 60
          Width = 561
          Height = 117
          AllowDelete = False
          AllowInsert = False
          DataSource = DataSource1
          PanelHeight = 117
          PanelWidth = 544
          TabOrder = 0
          RowCount = 1
          object DBMemo1: TDBMemo
            Left = 16
            Top = 16
            Width = 497
            Height = 89
            DataSource = DataSource1
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object DBCtrlGrid2: TDBCtrlGrid
          Left = 16
          Top = 192
          Width = 561
          Height = 85
          Margins.Bottom = 10
          AllowDelete = False
          AllowInsert = False
          DataSource = DataSource2
          PanelHeight = 85
          PanelWidth = 544
          TabOrder = 1
          RowCount = 1
          object DBEdit1: TDBEdit
            AlignWithMargins = True
            Left = 16
            Top = 10
            Width = 305
            Height = 21
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 5
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            AlignWithMargins = True
            Left = 16
            Top = 35
            Width = 265
            Height = 21
            Margins.Left = 10
            Margins.Top = 5
            Margins.Right = 10
            Margins.Bottom = 5
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            AlignWithMargins = True
            Left = 16
            Top = 58
            Width = 265
            Height = 21
            Margins.Left = 10
            Margins.Top = 5
            Margins.Right = 10
            Margins.Bottom = 5
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 2
          end
          object DBMemo2: TDBMemo
            AlignWithMargins = True
            Left = 349
            Top = 10
            Width = 185
            Height = 65
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alRight
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 3
          end
        end
        object Button3: TButton
          Left = 40
          Top = 288
          Width = 139
          Height = 25
          Cursor = crHandPoint
          Caption = 'Finalizar entrevista'
          Enabled = False
          ImageIndex = 130
          Images = Form1.ImageList1
          TabOrder = 2
          Visible = False
          OnClick = Button3Click
        end
        object Button2: TButton
          Left = 256
          Top = 288
          Width = 120
          Height = 25
          Cursor = crHandPoint
          Caption = 'Cancelar'
          ImageIndex = 256
          Images = Form1.ImageList1
          TabOrder = 3
          Visible = False
          OnClick = Button2Click
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.FDQueryComentarios
    Left = 467
    Top = 323
  end
  object DataSource2: TDataSource
    DataSet = DM.FDQueryTratamientos
    Left = 259
    Top = 375
  end
end
