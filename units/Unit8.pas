unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TForm8 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBEdit3: TDBEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    DBEdit4: TDBEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    DBEdit5: TDBEdit;
    Panel14: TPanel;
    Panel15: TPanel;
    DBEdit6: TDBEdit;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    DBEdit7: TDBEdit;
    Panel20: TPanel;
    Panel21: TPanel;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label5: TLabel;
    DBMemo3: TDBMemo;
    Label6: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getLaboratorios;
    procedure setColumnLaboratorios;
    procedure setDbedit;
    procedure deleteData;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  laboratorio_id :string;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit9;

procedure TForm8.Button1Click(Sender: TObject);
var
form9 :Tform9;
begin
form9 := TForm9.Create(Application);
form9.ShowModal;
getLaboratorios;
setColumnLaboratorios;
setDbedit;

end;

procedure TForm8.Button2Click(Sender: TObject);
var
form9 :Tform9;
begin
isEdit:=true;
laboratorio_id := DBGrid1.Columns[0].Field.Value;
form9 := TForm9.Create(Application);
form9.edit1.text := DBEdit1.text;
form9.edit2.text := DBGrid1.Columns[1].Field.Value;
form9.edit3.text := DBEdit2.text;
form9.edit5.text := DBEdit3.text;
form9.edit4.text := DBEdit4.text;
form9.edit7.text := DBEdit5.text;
form9.edit6.text := DBEdit6.text;
form9.edit9.text := DBEdit7.text;
form9.edit8.text := DBEdit8.text;
form9.memo1.Text := DBMemo3.text;
form9.memo2.Text := DBMemo1.text;
form9.memo3.Text := DBMemo2.text;
form9.ShowModal;
isEdit:=false;
getLaboratorios;

end;

procedure TForm8.Button3Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar?', mtCOnfirmation, [mbYes, mbNo], 0) = mrYes
  then
    deleteData;

end;

procedure TForm8.Button4Click(Sender: TObject);
begin
close;
end;

procedure TForm8.deleteData;
var
  id: integer;
begin
  id := DBGrid1.Columns[0].Field.value;
  DM.FDqueryLaboratorios.close;
  DM.FDqueryLaboratorios.SQL.clear;
  DM.FDqueryLaboratorios.SQL.Add('DELETE FROM laboratorios WHERE laboratorio_id = :laboratorio_id');
  DM.FDqueryLaboratorios.ParamByName('laboratorio_id').AsInteger := id;
  DM.FDqueryLaboratorios.ExecSQL;
  getLaboratorios;

end;

procedure TForm8.FormCreate(Sender: TObject);
begin
getLaboratorios;
setColumnLaboratorios;
setDbedit;
end;

procedure TForm8.getLaboratorios;
begin
  DM.FDqueryLaboratorios.close;
  DM.FDqueryLaboratorios.SQL.clear;
  DM.FDqueryLaboratorios.SQL.Add('select * from laboratorios');
  DM.FDqueryLaboratorios.open;
  Button1.Enabled := DM.FDqueryLaboratorios.active;
  Button2.Enabled := DM.FDqueryLaboratorios.active;
  Button3.Enabled := DM.FDqueryLaboratorios.active;
  Button4.Enabled := DM.FDqueryLaboratorios.active;
end;

procedure TForm8.setColumnLaboratorios;
begin
DBGrid1.Columns[0].FieldName := 'laboratorio_id';
  DBGrid1.Columns[0].width := 60;
  DBGrid1.Columns[0].Alignment := taCenter;
  DBGrid1.Columns[0].Title.caption := 'id';
  DBGrid1.Columns[0].Title.Alignment := taCenter;

  DBGrid1.Columns[1].FieldName := 'prueba';
  //DBGrid1.Columns[1].width := 80;
  DBGrid1.Columns[1].Alignment := taLeftJustify;
  DBGrid1.Columns[1].Title.caption := 'prueba';
  DBGrid1.Columns[1].Title.Alignment := taCenter;

  DBGrid1.Columns[2].FieldName := 'observacion';
  DBGrid1.Columns[3].FieldName := 'resultados_normales';
  DBGrid1.Columns[4].FieldName := 'resultados_anormales';

end;

procedure TForm8.setDbedit;
begin
DBEdit1.DataField:='grupo';
DBEdit2.DataField:='unidades';
DBEdit3.DataField:='min_hombres';
DBEdit4.DataField:='max_hombres';
DBEdit5.DataField:='min_mujeres';
DBEdit6.DataField:='max_mujeres';
DBEdit7.DataField:='min_ninos';
DBEdit8.DataField:='max_ninos';
DBMemo1.text:='resultados_normales';
DBMemo2.DataField:='resultados_anormales';
DBMemo3.DataField:='observacion';
end;

end.
