object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Informe de entrevista'
  ClientHeight = 431
  ClientWidth = 822
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
  object Bevel1: TBevel
    Left = 536
    Top = 8
    Width = 233
    Height = 353
  end
  object Bevel2: TBevel
    Left = 256
    Top = 8
    Width = 274
    Height = 353
  end
  object Bevel3: TBevel
    Left = 8
    Top = 8
    Width = 242
    Height = 353
  end
  object Bevel4: TBevel
    Left = 80
    Top = 376
    Width = 353
    Height = 47
  end
  object Button1: TButton
    Left = 56
    Top = 16
    Width = 153
    Height = 25
    Caption = 'Elaborar Informe'
    ImageIndex = 86
    Images = Form1.ImageList1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 56
    Top = 64
    Width = 153
    Height = 25
    Caption = 'Enviar correo'
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 563
    Top = 24
    Width = 185
    Height = 105
    Caption = 'Configuraci'#243'n de Gmail'
    TabOrder = 2
    object textHost: TEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Host'
    end
    object textPort: TEdit
      Left = 24
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 1
      TextHint = 'Puerto'
    end
  end
  object GroupBox2: TGroupBox
    Left = 563
    Top = 161
    Width = 185
    Height = 105
    Caption = 'Datos de quien  Env'#237'a'
    TabOrder = 3
    object textUsername: TEdit
      Left = 24
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Username o Email'
    end
    object textPassword: TEdit
      Left = 24
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 1
      TextHint = 'Password'
    end
  end
  object GroupBox3: TGroupBox
    Left = 280
    Top = 24
    Width = 241
    Height = 121
    Caption = 'Datos de Paciente que Recibe'
    TabOrder = 4
    object Subject: TEdit
      Left = 32
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Envi'#243' de informe M'#233'dico'
      TextHint = 'Asunto'
    end
    object EmailPaciente: TEdit
      Left = 32
      Top = 72
      Width = 185
      Height = 21
      TabOrder = 1
      TextHint = 'Email que Recibe '
    end
  end
  object Button3: TButton
    Left = 587
    Top = 272
    Width = 153
    Height = 25
    Caption = 'Nueva Configuraci'#243'n'
    ImageIndex = 288
    Images = Form1.ImageList1
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 587
    Top = 320
    Width = 153
    Height = 25
    Caption = 'Configuraci'#243'n Original'
    ImageIndex = 48
    Images = Form1.ImageList1
    TabOrder = 6
    OnClick = Button4Click
  end
  object GroupBox4: TGroupBox
    Left = 280
    Top = 175
    Width = 241
    Height = 178
    Caption = 'Mensaje e informe'
    TabOrder = 7
    object Label1: TLabel
      Left = 40
      Top = 144
      Width = 79
      Height = 13
      Caption = 'Informe Adjunto'
    end
    object Body: TMemo
      Left = 32
      Top = 16
      Width = 185
      Height = 122
      Lines.Strings = (
        'Informe M'#233'dico')
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 118
    Width = 193
    Height = 227
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
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
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object Button5: TButton
    Left = 96
    Top = 390
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    ImageIndex = 270
    Images = Form1.ImageList1
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 320
    Top = 390
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    ImageIndex = 90
    Images = Form1.ImageList1
    TabOrder = 10
    OnClick = Button6Click
  end
  object SMTP: TIdSMTP
    IOHandler = SSL
    Host = 'smtp-relay.gmail.com'
    Password = 'uxntasmvodpummdb'
    Port = 587
    SASLMechanisms = <>
    UseTLS = utUseExplicitTLS
    Username = 'edwinhenriquezh@gmail.com'
    Left = 120
    Top = 120
  end
  object SSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'smtp-relay.gmail.com:587'
    Host = 'smtp-relay.gmail.com'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 120
    Top = 160
  end
  object DATA: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 128
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = DM.FQueryInformes
    Left = 192
    Top = 224
  end
end
