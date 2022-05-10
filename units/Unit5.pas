unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ToolWin;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    Button1: TButton;
    Panel5: TPanel;
    Button2: TButton;
    Panel6: TPanel;
    Button3: TButton;
    Panel7: TPanel;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Panel8: TPanel;
    Button4: TButton;
    Button5: TButton;
    Edit2: TEdit;
    Button6: TButton;
    DataSource2: TDataSource;
    Panel9: TPanel;
    Label1: TLabel;
    Button7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure getSintomas;
    procedure setColumnSintomas;
    procedure deleteData;
    procedure getPivot;
    procedure getCantidad;
    procedure quitarData;
    procedure setColumnEnfermedadSintoma;
    procedure DBEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  sintoma_id: string;
  cantidad: integer = 0;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit11;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Beep;
  if (Not isEdit) then
  begin
    DM.FDQuerySintomas.close;
    DM.FDQuerySintomas.SQL.clear;
    DM.FDQuerySintomas.SQL.Add
      ('INSERT INTO sintomas (sintoma) VALUES(:sintoma)');
    DM.FDQuerySintomas.ParamByName('sintoma').AsString := Edit1.text;
    DM.FDQuerySintomas.ExecSQL;
  end
  else
  begin
    DM.FDQuerySintomas.close;
    DM.FDQuerySintomas.SQL.clear;
    DM.FDQuerySintomas.SQL.Add('UPDATE sintomas SET sintoma =:sintoma ');
    DM.FDQuerySintomas.SQL.Add('WHERE sintoma_id = :sintoma_id ');
    DM.FDQuerySintomas.ParamByName('sintoma_id').AsString := sintoma_id;
    DM.FDQuerySintomas.ParamByName('sintoma').AsString := Edit1.text;
    DM.FDQuerySintomas.ExecSQL;
    isEdit := false;
  end;

  getSintomas;
  setColumnSintomas;
  Edit1.clear;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  if MessageDlg('Desea quitar el síntoma de la enfermedad?', mtCOnfirmation,
    [mbyes, mbNo], 0) = mrYes then
    quitarData;
  beep;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  beep;
  getCantidad;
  if (cantidad <= 0) then
  begin
    sintoma_id := DBGrid2.Columns[0].Field.value;
    DM.FDQueryRel.close;
    DM.FDQueryRel.SQL.clear;
    DM.FDQueryRel.SQL.Add
      ('INSERT INTO enfermedad_sintomas (enfermedad_id,sintoma_id)');
    DM.FDQueryRel.SQL.Add('VALUES (:enfermedad_id,:sintoma_id)');
    DM.FDQueryRel.ParamByName('enfermedad_id').AsString := enfermedad_id;
    DM.FDQueryRel.ParamByName('sintoma_id').AsString := sintoma_id;
    DM.FDQueryRel.ExecSQL;
  end
  else
    ShowMessage('Síntoma repetido');
  getPivot;
  setColumnEnfermedadSintoma;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  if (DBGrid2.Columns[1].Field.value = null) then
    exit;
  isEdit := true;
  Edit1.text := DBGrid2.Columns[1].Field.value;
  sintoma_id := DBGrid2.Columns[0].Field.value;
  Edit1.SetFocus;
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
if(DBGrid1.DataSource.DataSet.RecordCount<=0) then exit;

  if MessageDlg('Desea eliminar?', mtCOnfirmation, [mbyes, mbNo], 0) = mrYes
  then
    deleteData;
end;

procedure TForm5.Button6Click(Sender: TObject);
begin
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.clear;
  DM.FDQuerySintomas.SQL.Add
    ('select * from sintomas WHERE sintoma LIKE :sintoma');
  DM.FDQuerySintomas.ParamByName('sintoma').AsString := '%' + Edit2.text + '%';
  DM.FDQuerySintomas.open;
  Edit2.clear;
end;

procedure TForm5.Button7Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.DBEdit1Change(Sender: TObject);
begin
  Button1.Enabled := Length(Edit1.text) > 0;
end;

procedure TForm5.deleteData;
var
  id: integer;
begin
  id := DBGrid2.Columns[0].Field.value;
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.clear;
  DM.FDQuerySintomas.SQL.Add
    ('DELETE FROM sintomas WHERE sintoma_id = :sintoma_id');
  DM.FDQuerySintomas.ParamByName('sintoma_id').AsInteger := id;
  DM.FDQuerySintomas.ExecSQL;
  getSintomas;
  setColumnSintomas;
end;

procedure TForm5.Edit1Change(Sender: TObject);
begin
  Button1.Enabled := Length(Edit1.text) > 0;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  getSintomas;
  setColumnSintomas;
  Label1.Caption := enfermedad;
  getPivot;
  setColumnEnfermedadSintoma;
end;

procedure TForm5.getCantidad;
begin
  cantidad := 0;
  sintoma_id := DBGrid2.Columns[0].Field.value;
  DM.Contador.close;
  DM.Contador.SQL.clear;
  DM.Contador.SQL.Add('select count(*) as cantidad from enfermedad_sintomas');
  DM.Contador.SQL.Add
    ('WHERE (enfermedad_id = :enfermedad_id AND sintoma_id = :sintoma_id)');
  DM.Contador.ParamByName('enfermedad_id').AsString := enfermedad_id;
  DM.Contador.ParamByName('sintoma_id').AsString := sintoma_id;
  DM.Contador.open;
  cantidad := DM.Contador.Fields[0].AsInteger;

end;

procedure TForm5.getPivot;
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

procedure TForm5.getSintomas;
begin
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.clear;
  DM.FDQuerySintomas.SQL.Add('select * from sintomas');
  DM.FDQuerySintomas.open;
end;

procedure TForm5.quitarData;
begin
  DM.FQuery.close;
  DM.FQuery.SQL.clear;
  DM.FQuery.SQL.Add('DELETE FROM enfermedad_sintomas WHERE id = :id');
  DM.FQuery.ParamByName('id').AsString := DBGrid1.Columns[0].Field.value;
  DM.FQuery.ExecSQL;
  getPivot;
end;

procedure TForm5.setColumnEnfermedadSintoma;
begin
  DBGrid1.Columns[0].FieldName := 'id';
  DBGrid1.Columns[0].width := 80;
  DBGrid1.Columns[0].Alignment := taCenter;
  DBGrid1.Columns[0].Title.Caption := 'id';
  DBGrid1.Columns[0].Title.Alignment := taCenter;

  DBGrid1.Columns[1].FieldName := 'sintoma';
  // DBGrid1.Columns[1].width := 80;
  DBGrid1.Columns[1].Alignment := taLeftJustify;
  DBGrid1.Columns[1].Title.Caption := 'sintoma';
  DBGrid1.Columns[1].Title.Alignment := taCenter;

end;

procedure TForm5.setColumnSintomas;
begin
  DBGrid2.Columns[0].FieldName := 'sintoma_id';
  DBGrid2.Columns[0].width := 80;
  DBGrid2.Columns[0].Alignment := taCenter;
  DBGrid2.Columns[0].Title.Caption := 'id';
  DBGrid2.Columns[0].Title.Alignment := taCenter;

  DBGrid2.Columns[1].FieldName := 'sintoma';
  // DBGrid1.Columns[1].width := 80;
  DBGrid2.Columns[1].Alignment := taLeftJustify;
  DBGrid2.Columns[1].Title.Caption := 'sintoma';
  DBGrid2.Columns[1].Title.Alignment := taCenter;
end;

end.
