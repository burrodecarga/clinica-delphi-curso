unit Unit12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm12 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses
  Unit1, Unit11, Unit2;

{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
  if (Not isEdit) then
  begin
    DM.FDQueryEnfermedades.Close;
    DM.FDQueryEnfermedades.SQL.Clear;
    DM.FDQueryEnfermedades.SQL.Add
      ('INSERT INTO enfermedades (enfermedad, descripcion)');
    DM.FDQueryEnfermedades.SQL.Add('Values(:enfermedad, :descripcion)');
    DM.FDQueryEnfermedades.ParamByName('enfermedad').AsString := Edit1.text;
    DM.FDQueryEnfermedades.ParamByName('descripcion').AsMemo :=
      Memo1.lines.text;
    DM.FDQueryEnfermedades.ExecSQL;
  end
  else
  begin
    DM.FDQueryEnfermedades.Close;
    DM.FDQueryEnfermedades.SQL.Clear;
    DM.FDQueryEnfermedades.SQL.Add
      ('UPDATE enfermedades SET enfermedad = :enfermedad, descripcion = :descripcion');
    DM.FDQueryEnfermedades.SQL.Add('WHERE enfermedad_id = :enfermedad_id');
    DM.FDQueryEnfermedades.ParamByName('enfermedad_id').AsString := enfermedad_id;
    DM.FDQueryEnfermedades.ParamByName('enfermedad').AsString := Edit1.text;
    DM.FDQueryEnfermedades.ParamByName('descripcion').AsMemo := Memo1.lines.text;
    DM.FDQueryEnfermedades.ExecSQL;
  end;
  Close;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  if (isEdit) then
  begin
    Edit1.text := enfermedad;
    Memo1.text := descripcion;
  end;

end;

end.
