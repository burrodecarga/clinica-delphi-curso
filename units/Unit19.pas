unit Unit19;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,vcl.Themes,vcl.Styles,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TForm19 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    ListBox2: TListBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TForm19.Button1Click(Sender: TObject);
begin
TStyleManager.SetStyle('windows10');
end;

procedure TForm19.FormCreate(Sender: TObject);
begin
ListBox1.Items.AddStrings(TStyleManager.StyleNames);
end;

procedure TForm19.ListBox1Click(Sender: TObject);
begin
TStyleManager.SetStyle(ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TForm19.SpeedButton3Click(Sender: TObject);
begin
close;
end;

end.
