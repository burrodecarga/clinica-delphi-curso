unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.WinXPickers, Vcl.Buttons, RxAppUtils, Data.DB, Vcl.DBCtrls,
  Vcl.DBCGrids, Vcl.Mask, Vcl.ExtDlgs;

type
  TForm10 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    DatePicker1: TDatePicker;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox3: TGroupBox;
    SpeedButton1: TSpeedButton;
    GroupBox4: TGroupBox;
    RadioGroup1: TRadioGroup;
    ListBox1: TListBox;
    SpeedButton2: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    DBCtrlGrid2: TDBCtrlGrid;
    SpeedButton3: TSpeedButton;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    DataSource2: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo2: TDBMemo;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure verBotones;
    function crearEntrevista(): string;
    procedure llenarListBox;
    procedure Edit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  entrevista_id: string;
  isEntrevista: Boolean = False;
  sintomasDeEntrevista: array of string;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit2, Unit4, Unit13, Unit14, Unit15, Unit16;

procedure TForm10.Button1Click(Sender: TObject);
begin
  isEntrevista := True;
  verBotones;
  crearEntrevista;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  if Application.MessageBox
    ('¿Desea eliminar toda la información de síntomas, tratamiento y diagnóstico de esta entrevista?',
    'Warning', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
  begin
    DM.delEntrevista(entrevista_id);
    close;
  end;

end;

procedure TForm10.Button3Click(Sender: TObject);
begin
ShowDialog(TForm16);
close;
end;

procedure TForm10.Button4Click(Sender: TObject);
begin
  close;
end;

function TForm10.crearEntrevista: string;
begin
  DM.FDQueryEntrevistas.close;
  DM.FDQueryEntrevistas.SQl.Clear;
  DM.FDQueryEntrevistas.SQl.Add
    ('INSERT INTO entrevistas (paciente_id, fecha, motivo) VALUES(:paciente_id,:fecha,:motivo)');
  DM.FDQueryEntrevistas.ParamByName('paciente_id').AsString := paciente_id;
  DM.FDQueryEntrevistas.ParamByName('fecha').AsDate := DatePicker1.Date;
  DM.FDQueryEntrevistas.ParamByName('motivo').AsString := Edit1.text;
  DM.FDQueryEntrevistas.ExecSQL;

  DM.FDQueryEntrevistas.close;
  DM.FDQueryEntrevistas.SQl.Clear;
  DM.FDQueryEntrevistas.SQl.Add('SELECT MAX(entrevista_id) FROM entrevistas');
  DM.FDQueryEntrevistas.Open;
  entrevista_id := DM.FDQueryEntrevistas.Fields[0].AsString;
end;

procedure TForm10.Edit1Change(Sender: TObject);
begin
  Button1.Enabled := Length(Edit1.text) > 0;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  Label1.Caption := 'paciente : ' + paciente;
  Label2.Caption := 'género :' + genero;
  Label3.Caption := 'edad :' + edad + ' años';
end;

procedure TForm10.llenarListBox;
var
  I: Integer;
begin
  ListBox1.Clear;
  for I := 0 to Length(sintomasDeEntrevista) - 1 do
    ListBox1.Items.Add(sintomasDeEntrevista[I]);
end;

procedure TForm10.RadioGroup1Click(Sender: TObject);
begin
  Beep;
  if RadioGroup1.ItemIndex = 5 then
  begin
    Edit1.Clear;
    RadioGroup1.ItemIndex := -1;
  end
  else
    Edit1.text := RadioGroup1.Items.Strings[RadioGroup1.ItemIndex];

end;

procedure TForm10.SpeedButton1Click(Sender: TObject);
begin
  ShowDialog(TForm3);
  llenarListBox;
  verBotones;
end;

procedure TForm10.SpeedButton2Click(Sender: TObject);
begin
  Beep;
  ShowDialog(Tform4);
  DM.getComentarios(entrevista_id);
  DBMemo1.DataField := 'comentario';
  verBotones;
end;

procedure TForm10.SpeedButton3Click(Sender: TObject);
begin
  Beep;
  ShowDialog(Tform13);
  verBotones;
  if DM.FDQueryTratamientos.RecordCount > 0 then
  begin
    DBEdit1.DataField := 'medicina';
    DBEdit2.DataField := 'frecuencia';
    DBEdit3.DataField := 'dosis';
    DBMemo2.DataField := 'observacion';
  end;
end;

procedure TForm10.SpeedButton4Click(Sender: TObject);
begin
  ShowDialog(Tform14);
  DM.getSeleccionados;
  if (DM.FDQueryDiccionario.RecordCount > 0) then
    DM.FDQueryDiccionario.First;
  while not DM.FDQueryDiccionario.eof do
  begin
    Beep;
    DM.addComentario(entrevista_id, 'Entrevista-Diagnostico',
      DM.FDQueryDiccionario.FieldByName('comentario').Value);
    DM.FDQueryDiccionario.Next;
  end;
  DM.getComentarios(entrevista_id);
  DBMemo1.DataField := 'comentario';
  verBotones;
  DM.setVocabulario;
end;

procedure TForm10.SpeedButton5Click(Sender: TObject);
begin
Beep;
ShowDialog(Tform15);
verBotones;
end;

procedure TForm10.verBotones;
begin
  RadioGroup1.Enabled := False;
  Button1.visible := Not isEntrevista;
  Button3.visible := isEntrevista;
  Button2.visible := isEntrevista;
  Button4.visible := Not isEntrevista;

  SpeedButton1.Enabled := isEntrevista;
  SpeedButton2.Enabled := isEntrevista;
  SpeedButton3.Enabled := isEntrevista;
  SpeedButton4.Enabled := isEntrevista;
  SpeedButton5.Enabled := isEntrevista;
  GroupBox4.Enabled := True;
  Button3.Enabled := (DataSource1.DataSet.RecordCount > 0) AND
    (ListBox1.Items.Count > 0);
end;

end.
