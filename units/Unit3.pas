unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel9: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    Panel8: TPanel;
    Button4: TButton;
    Button5: TButton;
    Edit2: TEdit;
    Button6: TButton;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Panel5: TPanel;
    Button2: TButton;
    Panel6: TPanel;
    Button3: TButton;
    Panel7: TPanel;
    Button7: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure getSintomas;
    procedure setColumnSintomas;
    procedure getPivot;
    procedure setColumnEntrevistas;
    procedure getCantidad;
    procedure quitarData;
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  sintoma_id: string;
  cantidad: Integer = 0;

implementation

uses
  Unit2, Unit1, Unit10;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  if (isEdit) then
    DM.editSintoma(sintoma_id, Edit1.text)
  else
    DM.AddSintoma(Edit1.text);
  isEdit := false;
  Edit1.Clear;
  getSintomas;
  setColumnSintomas;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if (DBGrid1.DataSource.DataSet.RecordCount <= 0) then
    exit;
  if MessageDlg('Desea quitar el síntoma de la enfermedad?', mtCOnfirmation,
    [mbyes, mbNo], 0) = mrYes then
    quitarData;
end;

procedure TForm3.Button3Click(Sender: TObject);

begin
  beep;
  cantidad := 0;
  getCantidad;
  if (cantidad <= 0) then
  begin
    sintoma_id := DBGrid2.Columns[0].Field.value;
    DM.FDQueryRel.close;
    DM.FDQueryRel.SQL.Clear;
    DM.FDQueryRel.SQL.Add
      ('INSERT INTO entrevista_sintomas (entrevista_id,sintoma_id)');
    DM.FDQueryRel.SQL.Add('VALUES (:entrevista_id,:sintoma_id)');
    DM.FDQueryRel.ParamByName('entrevista_id').AsString := entrevista_id;
    DM.FDQueryRel.ParamByName('sintoma_id').AsString := sintoma_id;
    DM.FDQueryRel.ExecSQL;
  end
  else
    ShowMessage('Síntoma repetido');
  getPivot;
  setColumnEntrevistas;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  if (DBGrid2.Columns[1].Field.value = null) then
    exit;
  isEdit := true;
  Edit1.text := DBGrid2.Columns[1].Field.value;
  sintoma_id := DBGrid2.Columns[0].Field.value;
  Edit1.SetFocus;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  if (DBGrid2.DataSource.DataSet.RecordCount <= 0) then
    exit;

  if MessageDlg('Desea eliminar?', mtCOnfirmation, [mbyes, mbNo], 0) = mrYes
  then
    DM.delSintoma(IntToStr(DBGrid2.Columns[0].Field.value));
  getSintomas;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.Clear;
  DM.FDQuerySintomas.SQL.Add
    ('select * from sintomas WHERE sintoma LIKE :sintoma');
  DM.FDQuerySintomas.ParamByName('sintoma').AsString := '%' + Edit2.text + '%';
  DM.FDQuerySintomas.open;
  Edit2.Clear;
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
  Button1.Enabled := Length(Edit1.text) > 0;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  getSintomas;
  setColumnSintomas;
  setColumnEntrevistas;
  if (entrevista_id <> '') then
    getPivot;
  Label1.Caption := paciente + '-' + paciente_id + '--' + entrevista_id;
end;

procedure TForm3.getCantidad;
begin
  cantidad := 0;
  sintoma_id := DBGrid2.Columns[0].Field.value;
  DM.Contador.close;
  DM.Contador.SQL.Clear;
  DM.Contador.SQL.Add('select count(*) as cantidad from entrevista_sintomas');
  DM.Contador.SQL.Add
    ('WHERE (entrevista_id = :entrevista_id AND sintoma_id = :sintoma_id)');
  DM.Contador.ParamByName('entrevista_id').AsString := entrevista_id;
  DM.Contador.ParamByName('sintoma_id').AsString := sintoma_id;
  DM.Contador.open;
  cantidad := DM.Contador.Fields[0].AsInteger;

end;

procedure TForm3.getPivot;
var
  I: Integer;
begin
  DM.FDQueryPivot.close;
  DM.FDQueryPivot.SQL.Clear;
  DM.FDQueryPivot.SQL.Add
    ('SELECT entrevista_sintomas.id, entrevistas.entrevista_id, sintomas.sintoma_id,');
  DM.FDQueryPivot.SQL.Add
    ('entrevistas.motivo, entrevistas.fecha, sintomas.sintoma as sintoma');
  DM.FDQueryPivot.SQL.Add
    ('FROM sintomas INNER JOIN (entrevistas INNER JOIN entrevista_sintomas');
  DM.FDQueryPivot.SQL.Add
    ('ON entrevistas.entrevista_id = entrevista_sintomas.entrevista_id)');
  DM.FDQueryPivot.SQL.Add
    ('ON sintomas.sintoma_id = entrevista_sintomas.sintoma_id');
  DM.FDQueryPivot.SQL.Add
    ('WHERE (entrevista_sintomas.entrevista_id = :entrevista_id)');
  DM.FDQueryPivot.ParamByName('entrevista_id').AsString := entrevista_id;
  DM.FDQueryPivot.open;
  SetLength(sintomasDeEntrevista, DM.FDQueryPivot.RowsAffected);
  DM.FDQueryPivot.First;
  for I := 0 to DM.FDQueryPivot.RowsAffected - 1 do
  begin
  sintomasDeEntrevista[i] := DM.FDQueryPivot.FieldByName('sintoma').AsString;
  DM.FDQueryPivot.next;
  end;
end;

procedure TForm3.getSintomas;
begin
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.Clear;
  DM.FDQuerySintomas.SQL.Add('select * from sintomas');
  DM.FDQuerySintomas.open;
end;

procedure TForm3.quitarData;
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add('DELETE FROM entrevista_sintomas WHERE id = :id');
  DM.FQuery.ParamByName('id').AsString := DBGrid1.Columns[0].Field.value;
  DM.FQuery.ExecSQL;
  getPivot;
end;

procedure TForm3.setColumnEntrevistas;
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

procedure TForm3.setColumnSintomas;
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
