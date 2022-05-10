unit Unit20;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm20 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Timer1: TTimer;
    Panel2: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TForm20.FormCreate(Sender: TObject);
begin
if ((DiasRestantes<>0) AND (isRegistred=false)) then
begin
  Panel2.Visible :=true;
  panel2.Caption :='Dias restantes: '+IntToStr(DiasRestantes);
end;

if (isRegistred=true) then
begin
  Panel2.Visible :=true;
  panel2.Caption :='Aplicación Registrada';
end;


end;

procedure TForm20.Timer1Timer(Sender: TObject);
begin
ProgressBar1.Visible:=true;
while ProgressBar1.Position<100 do
begin
 ProgressBar1.Position :=ProgressBar1.Position+10;
 Sleep(100);
end;

ProgressBar1.Visible:=false;
Timer1.Enabled:=false;

close;
end;

end.
