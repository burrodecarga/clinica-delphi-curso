unit Unit18;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm18 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TForm18.Button1Click(Sender: TObject);
begin
Application.terminate;
end;

procedure TForm18.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm18.FormCreate(Sender: TObject);
begin
Edit1.Text := numeroUnico;
Button1.Visible :=terminate;
Button2.Visible :=Not terminate;



end;

end.
