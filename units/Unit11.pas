unit Unit11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, RxAppUtils;

type
  TForm11 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit5: TEdit;
    DataSource1: TDataSource;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    DBMemo1: TDBMemo;
    Panel4: TPanel;
    Button1: TButton;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure getEnfermedades;
    procedure setColumnEnfermedades;
    procedure deleteData;
    procedure getPivot;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  enfermedad_id, enfermedad: string;
  descripcion: AnsiString;

implementation

uses
  Unit2, Unit12, Unit1, Unit5;

{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin
  enfermedad_id := DBGrid1.Columns[0].Field.value;
  enfermedad := DBGrid1.Columns[1].Field.value;
  ShowDialog(Tform5);
end;

procedure TForm11.DBMemo1Change(Sender: TObject);
begin
  if (DBGrid1.Columns[0].Field.value <> null) then
  begin
    enfermedad_id := DBGrid1.Columns[0].Field.value;
    getPivot;
  end;
end;

procedure TForm11.deleteData;
var
  id: integer;
begin
  id := DBGrid1.Columns[0].Field.value;
  DM.FQuery.close;
  DM.FQuery.SQL.clear;
  DM.FQuery.SQL.Add
    ('DELETE FROM enfermedades WHERE enfermedad_id = :enfermedad_id');
  DM.FQuery.ParamByName('enfermedad_id').AsInteger := id;
  DM.FQuery.ExecSQL;
  getEnfermedades;

end;

procedure TForm11.FormCreate(Sender: TObject);
begin
  getEnfermedades;
  setColumnEnfermedades;
end;

procedure TForm11.getEnfermedades;
begin
  // SELECT enfermedades.enfermedad, enfermedades.descripcion, enfermedades.enfermedad_id, sintomas.sintoma_id, sintomas.sintoma
  // FROM sintomas INNER JOIN (enfermedades INNER JOIN enfermedad_sintomas ON enfermedades.enfermedad_id = enfermedad_sintomas.enfermedad_id) ON sintomas.sintoma_id = enfermedad_sintomas.sintoma_id;
  DM.FDQueryEnfermedades.close;
  DM.FDQueryEnfermedades.SQL.clear;
  DM.FDQueryEnfermedades.SQL.Add('select * from enfermedades');
  DM.FDQueryEnfermedades.open;
  SpeedButton1.Enabled := DM.FDQueryEnfermedades.active;
  SpeedButton2.Enabled := DM.FDQueryEnfermedades.RecordCount <> 0;
  SpeedButton3.Enabled := DM.FDQueryEnfermedades.RecordCount <> 0;
  SpeedButton4.Enabled := DM.FDQueryEnfermedades.active;
end;

procedure TForm11.getPivot;
begin
  DM.FDQueryPivot.close;
  DM.FDQueryPivot.SQL.clear;
  DM.FDQueryPivot.SQL.Add
    ('SELECT enfermedad_sintomas.id, enfermedades.enfermedad_id, sintomas.sintoma_id,');
  DM.FDQueryPivot.SQL.Add
    ('enfermedades.enfermedad, enfermedades.descripcion, sintomas.sintoma as sintoma');
  DM.FDQueryPivot.SQL.Add
    ('FROM sintomas INNER JOIN (enfermedades INNER JOIN enfermedad_sintomas');
  DM.FDQueryPivot.SQL.Add
    ('ON enfermedades.enfermedad_id = enfermedad_sintomas.enfermedad_id)');
  DM.FDQueryPivot.SQL.Add
    ('ON sintomas.sintoma_id = enfermedad_sintomas.sintoma_id');
  DM.FDQueryPivot.SQL.Add
    ('WHERE (enfermedad_sintomas.enfermedad_id = :enfermedad_id)');
  DM.FDQueryPivot.ParamByName('enfermedad_id').AsString := enfermedad_id;
  DM.FDQueryPivot.open;

end;

procedure TForm11.setColumnEnfermedades;
begin
  DBGrid1.Columns[0].FieldName := 'enfermedad_id';
  DBGrid1.Columns[0].width := 80;
  DBGrid1.Columns[0].Alignment := taCenter;
  DBGrid1.Columns[0].Title.caption := 'id';
  DBGrid1.Columns[0].Title.Alignment := taCenter;

  DBGrid1.Columns[1].FieldName := 'enfermedad';
  // DBGrid1.Columns[1].width := 80;
  DBGrid1.Columns[1].Alignment := taLeftJustify;
  DBGrid1.Columns[1].Title.caption := 'enfermedad';
  DBGrid1.Columns[1].Title.Alignment := taCenter;
  DBMemo1.DataField := 'descripcion';

  DBGrid2.Columns[0].FieldName := 'sintoma';
  DBGrid2.Columns[0].Alignment := taLeftJustify;
  DBGrid2.Columns[0].Title.caption := 'sintoma';
  DBGrid2.Columns[0].Title.Alignment := taCenter;

end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
  DM.FDQueryEnfermedades.close;
  DM.FDQueryEnfermedades.SQL.clear;
  DM.FDQueryEnfermedades.SQL.Add
    ('select * from enfermedades where enfermedad like :enfermedad');
  DM.FDQueryEnfermedades.ParamByName('enfermedad').AsString :=
    '%' + Edit5.text + '%';
  DM.FDQueryEnfermedades.open;

end;

procedure TForm11.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar?', mtCOnfirmation, [mbyes, mbNo], 0) = mrYes
  then
    deleteData;
end;

procedure TForm11.SpeedButton3Click(Sender: TObject);
begin
  isEdit := True;
  enfermedad_id := DBGrid1.Columns[0].Field.value;
  enfermedad := DBGrid1.Columns[1].Field.value;
  descripcion := DBMemo1.Lines.text;
  ShowDialog(Tform12);
  isEdit := False;
  getEnfermedades;

end;

procedure TForm11.SpeedButton4Click(Sender: TObject);
begin
  ShowDialog(Tform12);
  getEnfermedades;
end;

procedure TForm11.SpeedButton5Click(Sender: TObject);
begin
  close;
end;

procedure TForm11.SpeedButton7Click(Sender: TObject);
begin
  getEnfermedades;
end;

end.
