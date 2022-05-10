unit Unit13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, RxCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm13 = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit5: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DataSource1: TDataSource;
    Panel5: TPanel;
    DBText1: TDBText;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    DataSource2: TDataSource;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    procedure setColumnMedicinas;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Panel8MouseEnter(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;
  tratamiento_id,medicina_id:string;

implementation

uses
  Unit2, Unit3, Unit10;




{$R *.dfm}

procedure TForm13.CheckBox1Click(Sender: TObject);
begin
Beep;
if(CheckBox1.Checked=true) then Panel6.Visible:=True else Panel6.Visible:=False;
DM.getTratamiento(entrevista_id);
end;

procedure TForm13.Edit1Change(Sender: TObject);
begin
SpeedButton4.Enabled := (Length(Edit1.text)>0) AND (Length(Edit2.text)>0);
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
DM.getMedicinas;
setColumnMedicinas;
SpeedButton1.Enabled := DM.FDQueryMedicinas.active;
end;

procedure TForm13.Panel8Click(Sender: TObject);
begin
if(DBGrid2.Columns[0].Field.Value<>null) then
begin
if Application.MessageBox('¿Desea eliminar el medicamento del récipe?',
  'Warning', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
begin
  DM.delTratamiento(DBGrid2.Columns[0].Field.Value);
end;


end;

end;

procedure TForm13.Panel8MouseEnter(Sender: TObject);
begin
Panel6.Color:=clRed;
end;

procedure TForm13.setColumnMedicinas;
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
  DBText1.DataField:='nombre';

  DBGrid2.Columns[0].FieldName := 'id';
  DBGrid2.Columns[0].width := 80;
  DBGrid2.Columns[0].Alignment := taCenter;
  DBGrid2.Columns[0].Title.caption := 'id';
  DBGrid2.Columns[0].Title.Alignment := taCenter;

  DBGrid2.Columns[1].FieldName := 'medicina';
 // DBGrid2.Columns[1].width := 250;
  DBGrid2.Columns[1].Alignment := taLeftJustify;
  DBGrid2.Columns[1].Title.caption := 'medicina';
  DBGrid2.Columns[1].Title.Alignment := taCenter;


end;

procedure TForm13.SpeedButton1Click(Sender: TObject);
begin
  DM.FDQueryMedicinas.close;
  DM.FDQueryMedicinas.SQL.clear;
  DM.FDQueryMedicinas.SQL.Add('select * from tratamientos where nombre like :nombre');
  DM.FDQueryMedicinas.ParamByName('nombre').AsString := '%' + Edit5.text + '%';
  DM.FDQueryMedicinas.open;
  Edit5.clear;
end;

procedure TForm13.SpeedButton4Click(Sender: TObject);
begin
Beep;
tratamiento_id := DBGrid1.Columns[0].Field.Value;
medicina_id := DBGrid1.Columns[0].Field.Value;

DM.FDQueryTratamientos.close;
DM.FDQueryTratamientos.SQL.Clear;
DM.FDQueryTratamientos.SQL.add('INSERT INTO entrevista_tratamiento');
DM.FDQueryTratamientos.SQL.add('(entrevista_id,tratamiento_id,medicina_id,');
DM.FDQueryTratamientos.SQL.add('fecha,medicina,frecuencia,dosis,observacion)');
DM.FDQueryTratamientos.SQL.add('VALUES (:entrevista_id,:tratamiento_id,:medicina_id,');
DM.FDQueryTratamientos.SQL.add(':fecha,:medicina,:frecuencia,:dosis,:observacion)');
DM.FDQueryTratamientos.paramByName('entrevista_id').AsString:=entrevista_id;
DM.FDQueryTratamientos.paramByName('tratamiento_id').AsString:=tratamiento_id;
DM.FDQueryTratamientos.paramByName('medicina_id').AsString:=medicina_id;
DM.FDQueryTratamientos.paramByName('fecha').AsDate:=now;
DM.FDQueryTratamientos.paramByName('medicina').AsString:=DBText1.caption;
DM.FDQueryTratamientos.paramByName('frecuencia').AsString:=Edit1.text;
DM.FDQueryTratamientos.paramByName('dosis').AsString:=Edit2.text;
DM.FDQueryTratamientos.paramByName('observacion').AsMemo:=Memo1.lines.text;
DM.FDQueryTratamientos.execSQL;
Edit1.clear;
Edit2.clear;
Memo1.clear;
DM.getTratamiento(entrevista_id);
end;

procedure TForm13.SpeedButton5Click(Sender: TObject);
begin
Beep;
Close;
end;

end.
