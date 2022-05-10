unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm7 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit6;

procedure TForm7.Button1Click(Sender: TObject);
begin
if(Not isEdit) then
begin
DM.FDQueryMedicinas.Close;
DM.FDQueryMedicinas.SQL.Clear;
DM.FDQueryMedicinas.SQL.Add('INSERT INTO tratamientos (nombre, composicion,presentacion)');
DM.FDQueryMedicinas.SQL.Add('Values(:nombre, :composicion, :presentacion)');
DM.FDQueryMedicinas.ParamByName('nombre').AsString :=Edit1.text;
DM.FDQueryMedicinas.ParamByName('presentacion').AsString :=ComboBox1.Items[ComboBox1.ItemIndex];
DM.FDQueryMedicinas.ParamByName('composicion').AsString :=Edit2.text;
DM.FDQueryMedicinas.ExecSQL;
end
else
begin
DM.FDQueryMedicinas.Close;
DM.FDQueryMedicinas.SQL.Clear;
DM.FDQueryMedicinas.SQL.Add('UPDATE tratamientos SET nombre = :nombre, composicion = :composicion, presentacion = :presentacion');
DM.FDQueryMedicinas.SQL.Add('WHERE medicina_id = :medicina_id');
DM.FDQueryMedicinas.ParamByName('nombre').AsString :=Edit1.text;
DM.FDQueryMedicinas.ParamByName('presentacion').AsString :=ComboBox1.Items[ComboBox1.ItemIndex];
DM.FDQueryMedicinas.ParamByName('composicion').AsString :=Edit2.text;
DM.FDQueryMedicinas.ParamByName('medicina_id').AsString := medicina_id;
DM.FDQueryMedicinas.ExecSQL;
end;
close;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
Close;
end;

end.
