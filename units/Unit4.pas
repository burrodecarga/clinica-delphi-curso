unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Data.DB,
  Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    Label2: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  grupo:string;

implementation

uses
  Unit1, Unit2, Unit10;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
Beep;
if(ComboBox1.ItemIndex<>-1) then grupo:=ComboBox1.Items[ComboBox1.ItemIndex] else grupo :=Edit1.text;
DM.FDQueryDiccionario.close;
DM.FDQueryDiccionario.SQL.Clear;
DM.FDQueryDiccionario.SQL.Add('INSERT INTO diccionario (grupo,comentario)');
DM.FDQueryDiccionario.SQL.Add('VALUES (:grupo,:comentario)');
DM.FDQueryDiccionario.ParamByName('grupo').AsString:= grupo;
DM.FDQueryDiccionario.ParamByName('comentario').AsMemo :=Memo1.Lines.text;
DM.FDQueryDiccionario.execSQL;
Edit1.clear;
ComboBox1.ItemIndex:=-1;
end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
Beep;
if(CheckBox1.Checked=true) then GroupBox1.Visible:=True else GroupBox1.visible:=False;
end;

procedure TForm4.ComboBox1Select(Sender: TObject);
begin
Button1.Enabled :=  (ComboBox1.ItemIndex<>-1) AND (Memo1.Lines.Count>0);
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if(CheckBox1.Checked=true) then
begin
  ComboBox1.ItemIndex :=-1;
Button1.Enabled := (Length(Edit1.text)>0) AND (Memo1.Lines.Count>0);
SpeedButton1.Enabled:=Memo1.lines.count>0;
end
else
SpeedButton1.Enabled:=Memo1.lines.count>0;


end;

procedure TForm4.FormCreate(Sender: TObject);
begin
DM.getVocabulario;
DM.FDQueryDiccionario.First;
while not DM.FDQueryDiccionario.eof do
begin
  ComboBox1.Items.Add(DM.FDQueryDiccionario.Fields[2].value);
  DM.FDQueryDiccionario.Next;
end;
end;

procedure TForm4.Memo1Change(Sender: TObject);
begin
SpeedButton1.Enabled := Length(Memo1.Lines.text)>0;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
Beep;
DM.addComentario(entrevista_id,'Entrevista-Diagnostico',Memo1.lines.text);
close;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
Beep;
Close;
end;

end.
