object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'Envio de Correo de Prueba'
  ClientHeight = 268
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 56
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object txtUsername: TEdit
    Left = 56
    Top = 64
    Width = 161
    Height = 21
    TabOrder = 1
    Text = 'edwinhenriquezh@gmail.com'
  end
  object txtPassword: TEdit
    Left = 56
    Top = 91
    Width = 169
    Height = 21
    TabOrder = 2
    Text = 'aex76sedw'
  end
  object txtTo: TEdit
    Left = 56
    Top = 118
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'edwinhenriquezh@gmail.com'
  end
  object txtSubject: TEdit
    Left = 56
    Top = 145
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Prueba de Gmail'
  end
  object memoText: TEdit
    Left = 56
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Bien Resuelto'
  end
  object IdMessage1: TIdMessage
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
    Left = 304
    Top = 104
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    Port = 587
    SASLMechanisms = <>
    UseTLS = utUseExplicitTLS
    Left = 312
    Top = 48
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':587'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 312
  end
end
