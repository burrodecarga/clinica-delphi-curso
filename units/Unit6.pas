unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit5: TEdit;
    DataSource1: TDataSource;
    SpeedButton5: TSpeedButton;
    procedure setColumnMedicinas;
    procedure getMedicinas;
    procedure deleteData;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  medicina_id :string;

implementation

{$R *.dfm}

uses Unit2, Unit7, Unit1;

procedure TForm6.deleteData;
var
  id: integer;
begin
  id := DBGrid1.Columns[0].Field.value;
  DM.FDQueryMedicinas.close;
  DM.FDQueryMedicinas.SQL.clear;
  DM.FDQueryMedicinas.SQL.Add('DELETE FROM tratamientos WHERE medicina_id = :medicina_id');
  DM.FDQueryMedicinas.ParamByName('medicina_id').AsInteger := id;
  DM.FDQueryMedicinas.ExecSQL;
  getMedicinas;
  end;

procedure TForm6.FormCreate(Sender: TObject);
begin
setColumnMedicinas;
getMedicinas;
end;

procedure TForm6.getMedicinas;
begin
DM.FDQueryMedicinas.close;
DM.FDQueryMedicinas.SQL.Clear;
DM.FDQueryMedicinas.SQL.Add('SELECT * From tratamientos');
DM.FDQueryMedicinas.Open;
  SpeedButton1.Enabled := DM.FDQueryMedicinas.active;
  SpeedButton2.Enabled := DM.FDQueryMedicinas.RecordCount<>0;
  SpeedButton3.Enabled := DM.FDQueryMedicinas.RecordCount<>0;
  SpeedButton4.Enabled := DM.FDQueryMedicinas.active;

end;

procedure TForm6.setColumnMedicinas;
begin
  DBGrid1.Columns[0].FieldName := 'medicina_id';
  DBGrid1.Columns[0].width := 80;
  DBGrid1.Columns[0].Alignment := taCenter;
  DBGrid1.Columns[0].Title.caption := 'id';
  DBGrid1.Columns[0].Title.Alignment := taCenter;

  DBGrid1.Columns[1].FieldName := 'nombre';
  DBGrid1.Columns[1].width := 250;
  DBGrid1.Columns[1].Alignment := taLeftJustify;
  DBGrid1.Columns[1].Title.caption := 'nombre';
  DBGrid1.Columns[1].Title.Alignment := taCenter;

  DBGrid1.Columns[2].FieldName := 'presentacion';
  DBGrid1.Columns[2].width := 150;
  DBGrid1.Columns[2].Alignment := taLeftJustify;
  DBGrid1.Columns[2].Title.caption := 'presentacion';
  DBGrid1.Columns[2].Title.Alignment := taCenter;

  DBGrid1.Columns[3].FieldName := 'composicion';
  //DBGrid1.Columns[3].width := 80;
  DBGrid1.Columns[3].Alignment := taLeftJustify;
  DBGrid1.Columns[3].Title.caption := 'composicion';
  DBGrid1.Columns[3].Title.Alignment := taCenter;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
  DM.FDQueryMedicinas.close;
  DM.FDQueryMedicinas.SQL.clear;
  DM.FDQueryMedicinas.SQL.Add('select * from tratamientos where nombre like :nombre');
  DM.FDQueryMedicinas.ParamByName('nombre').AsString := '%' + Edit5.text + '%';
  DM.FDQueryMedicinas.open;
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar?', mtCOnfirmation,  [mbYes, mbNo], 0) = mrYes
  then
    deleteData;
end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
var
form7 :Tform7;
itemIndex :integer;
begin
itemIndex:=0;
isEdit:=true;
medicina_id :=   DBGrid1.Columns[0].Field.value;
form7 := TForm7.Create(Application);
Form7.edit1.text:= DBGrid1.Columns[1].Field.value;
Form7.edit2.text:= DBGrid1.Columns[3].Field.value;
itemIndex := Form7.ComboBox1.Items.IndexOf(DBGrid1.Columns[2].Field.value);
Form7.ComboBox1.itemIndex:=itemIndex;
form7.ShowModal;
isEdit:=false;
getMedicinas;
end;

procedure TForm6.SpeedButton4Click(Sender: TObject);
var
form7 :Tform7;
begin
form7 := TForm7.Create(Application);
form7.ShowModal;
getMedicinas;
end;

procedure TForm6.SpeedButton5Click(Sender: TObject);
begin
close;
end;

procedure TForm6.SpeedButton7Click(Sender: TObject);
begin
getMedicinas;
end;

end.
