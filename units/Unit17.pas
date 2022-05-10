unit Unit17;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage;

type
  TForm17 = class(TForm)
    Button1: TButton;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    txtUsername: TEdit;
    txtPassword: TEdit;
    txtTo: TEdit;
    txtSubject: TEdit;
    memoText: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
var
  email      : TIdMessage;
  idSMTPGMail: TIdSMTP;
  idSSLGMail : TIdSSLIOHandlerSocketOpenSSL;
begin
  idSSLGMail                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  idSSLGMail.SSLOptions.Method := sslvTLSv1;
  idSSLGMail.SSLOptions.Mode   := sslmUnassigned;

  idSMTPGMail                  := TIdSMTP.Create(nil);
  idSMTPGMail.IOHandler        := idSSLGMail;
  idSMTPGMail.UseTLS           := utUseExplicitTLS;

  email                           := TIdMessage.Create(nil);
  email.From.Address              := txtUsername.Text;
  email.Recipients.EMailAddresses := txtTo.Text;
  email.Subject                   := txtSubject.Text;
  email.Body.Text                 := memoText.Text;

  idSMTPGMail.Host     := 'smtp.gmail.com';
  idSMTPGMail.Port     := 587;
  idSMTPGMail.UserName := txtUsername.Text;
  idSMTPGMail.Password := txtPassword.Text;

  idSMTPGMail.Connect;
  idSMTPGMail.Send(email);
  idSMTPGMail.Disconnect;

  email.Free;
  idSSLGMail.Free;
  idSMTPGMail.Free;
  Beep;
end;
end.
