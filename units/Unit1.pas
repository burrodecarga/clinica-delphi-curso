unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, OnlyOne, System.Win.Registry,
  Vcl.DBCtrls, EdwEdit, DateUtils, RxAppUtils, mxProtector, ShellApi, ShlObj,
  Vcl.Styles, Vcl.Themes;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    P1: TMenuItem;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    BalloonHint1: TBalloonHint;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel3: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    OnlyOne1: TOnlyOne;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    SpeedButton7: TSpeedButton;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    Configuracin1: TMenuItem;
    Enfermedades1: TMenuItem;
    Salir1: TMenuItem;
    Medicinas1: TMenuItem;
    Laboratorios1: TMenuItem;
    SpeedButton8: TSpeedButton;
    Inicio1: TMenuItem;
    prueba1: TMenuItem;
    Email1: TMenuItem;
    max: TmxProtector;
    Estilos1: TMenuItem;
    Registrar1: TMenuItem;
    procedure P1Click(Sender: TObject);
    procedure getData;
    procedure setColunms;
    procedure SpeedButton4Click(Sender: TObject);
    procedure Habilitar;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure creaPaciente;
    procedure editPaciente;
    procedure deleteData;
    procedure getTotal;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Enfermedades1Click(Sender: TObject);
    procedure Medicinas1Click(Sender: TObject);
    procedure Laboratorios1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Inicio1Click(Sender: TObject);
    procedure Email1Click(Sender: TObject);
    procedure isAdmin;
    procedure prueba1Click(Sender: TObject);
    procedure maxStartTrial(Sender: TObject; StartsRemained: Integer);
    procedure maxExpiration(Sender: TObject);
    procedure maxDayTrial(Sender: TObject; DaysRemained: Integer);
    procedure maxInvalidSystemTime(Sender: TObject);
    procedure maxGetPassword(Sender: TObject; var Password: string);
    procedure maxValidPassword(Sender: TObject);
    procedure maxWrongPassword(Sender: TObject; WrongPassword: string);
    function getNumeroUnico: String;
    procedure FormCreate(Sender: TObject);
    procedure Estilos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure getDLL;
    procedure Registrar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  isEdit: Boolean = false;
  paciente_id, paciente, genero, edad, email: string;
  isRegistred: Boolean = false;
  isExpired: Boolean = false;
    terminate: Boolean = false;
  NumeroDeSerie: string = '';
  NumeroUnico: string = '';
  DiasRestantes: Integer;
  splash: Boolean;

  // function getNumeroDeSerie: Pchar; stdcall external 'clinicaDll.dll';

implementation

{$R *.dfm}

uses Unit2, Unit6, Unit8, Unit10, Unit11, Unit16, Unit17,
  Unit18, Unit19, Unit20;

procedure TForm1.creaPaciente;
begin
  DM.FQuery.close;
  DM.FQuery.SQL.clear;
  DM.FQuery.SQL.Add
    ('INSERT INTO pacientes (cedula,nombre,telefono,email,genero,direccion,fecha_de_nacimiento)');
  DM.FQuery.SQL.Add
    ('VALUES (:cedula,:nombre,:telefono,:email,:genero,:direccion,:fecha_de_nacimiento)');
  DM.FQuery.ParamByName('cedula').AsString := Edit1.text;
  DM.FQuery.ParamByName('nombre').AsString := Edit2.text;
  DM.FQuery.ParamByName('telefono').AsString := Edit3.text;
  DM.FQuery.ParamByName('email').AsString := Edit4.text;

  if (RadioGroup1.ItemIndex = 0) then
  begin
    DM.FQuery.ParamByName('genero').AsString := 'masculino';
  end
  else
  begin
    DM.FQuery.ParamByName('genero').AsString := 'femenino';
  end;
  DM.FQuery.ParamByName('fecha_de_nacimiento').AsString :=
    DateToStr(DateTimePicker1.Date);
  DM.FQuery.ParamByName('direccion').AsMemo := Memo1.text;
  DM.FQuery.ExecSQL;

end;

procedure TForm1.deleteData;
var
  id: Integer;
begin
  id := DBGrid1.Columns[0].Field.value;
  DM.FQuery.close;
  DM.FQuery.SQL.clear;
  DM.FQuery.SQL.Add('DELETE FROM pacientes WHERE paciente_id = :paciente_id');
  DM.FQuery.ParamByName('paciente_id').AsInteger := id;
  DM.FQuery.ExecSQL;
  getData;

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Habilitar;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  TEdit(Sender).Color := clAqua;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  TEdit(Sender).Color := clWindow;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  Habilitar;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    DateTimePicker1.SetFocus;
  end;

end;

procedure TForm1.editPaciente;
var
  id: Integer;
begin

  id := DBGrid1.Columns[0].Field.value;
  DM.FQuery.close;
  DM.FQuery.SQL.clear;
  DM.FQuery.SQL.Add('UPDATE pacientes SET cedula = :cedula,');
  DM.FQuery.SQL.Add('nombre = :nombre,');
  DM.FQuery.SQL.Add('telefono = :telefono,');
  DM.FQuery.SQL.Add('email = :email,');
  DM.FQuery.SQL.Add('genero = :genero,');
  DM.FQuery.SQL.Add('fecha_de_nacimiento = :fecha_de_nacimiento,');
  DM.FQuery.SQL.Add('direccion = :direccion');
  DM.FQuery.SQL.Add(' WHERE paciente_id = :paciente_id');

  DM.FQuery.ParamByName('cedula').AsString := Edit1.text;
  DM.FQuery.ParamByName('nombre').AsString := Edit2.text;
  DM.FQuery.ParamByName('telefono').AsString := Edit3.text;
  DM.FQuery.ParamByName('email').AsString := Edit4.text;

  if (RadioGroup1.ItemIndex = 0) then
    DM.FQuery.ParamByName('genero').AsString := 'masculino';
  DM.FQuery.ParamByName('genero').AsString := 'femenino';

  DM.FQuery.ParamByName('fecha_de_nacimiento').AsString :=
    DateToStr(DateTimePicker1.Date);
  DM.FQuery.ParamByName('direccion').AsMemo := Memo1.lines.text;
  DM.FQuery.ParamByName('paciente_id').AsInteger := id;
  DM.FQuery.ExecSQL;
  getData;
end;

procedure TForm1.Email1Click(Sender: TObject);
begin
  showDialog(Tform17);
end;

procedure TForm1.Enfermedades1Click(Sender: TObject);
var
  form11: Tform11;
begin
  showDialog(Tform11);
end;

procedure TForm1.Estilos1Click(Sender: TObject);
begin
  showDialog(Tform19);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  splash := true;
  getDLL;
  NumeroUnico := getNumeroUnico;
  if (NumeroDeSerie = NumeroUnico) then
    isRegistred := true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if splash then
    form20.ShowModal;
  splash := false;
end;

procedure TForm1.getData;
begin
  DM.FQuery.close;
  DM.FQuery.SQL.clear;
  DM.FQuery.SQL.Add('select * from pacientes');
  DM.FQuery.open;
  SpeedButton1.Enabled := DM.FQuery.Active;
  SpeedButton2.Enabled := DM.FQuery.Active;
  SpeedButton3.Enabled := DM.FQuery.Active;
  SpeedButton4.Enabled := DM.FQuery.Active;
  SpeedButton8.Enabled := DM.FQuery.Active;
end;

procedure TForm1.getDLL;
type
  TGetNumeroDeSerie = function: Pchar; stdcall;
var
  dllHandle: THandle;
  getNumeroDESerie: TGetNumeroDeSerie;
  dll:Pchar;
begin
  dll :=Pchar(rutaDll);
  dllHandle := LoadLibrary(dll);
  try
    @getNumeroDESerie := GetProcAddress(dllHandle, 'getNumeroDeSerie');
    if Assigned(getNumeroDESerie) then
    begin
      NumeroDeSerie := getNumeroDESerie;
     // ShowMessage(NumeroDeSerie);
    end
    else
    Begin
      Application.MessageBox('No se pudo cargar DLL', 'Error',
        MB_OK + MB_ICONSTOP + MB_DEFBUTTON2);

    End;
  finally
    FreeLibrary(dllHandle);
  end;
end;

procedure TForm1.getTotal;
var
  cantidad: Integer;
begin
  DM.Contador.close;
  DM.Contador.SQL.clear;
  DM.Contador.SQL.Add('select count(*) as cantidad from pacientes');
  DM.Contador.open;
  cantidad := DM.Contador.Fields[0].AsInteger;
  StatusBar1.Panels[1].text := IntToStr(DM.FQuery.RecordCount) + ' de ' +
    FormatFloat('###,###,###', cantidad) + ' pacientes';
end;

procedure TForm1.Habilitar;
begin
  SpeedButton5.Enabled := ((Length(Edit1.text) > 0) and (Length(Edit2.text) > 0)
    and (Length(Edit3.text) > 0) and (Length(Edit4.text) > 0));
end;

procedure TForm1.Inicio1Click(Sender: TObject);
begin
  PageControl1.Visible := false;
end;

procedure TForm1.isAdmin;
var
  reg: TRegistry;
  openResult: Boolean;
begin
  reg := TRegistry.Create(KEY_READ);
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.Access := KEY_WRITE;
  openResult := reg.OpenKey('Software\MyCompanyName\MyApplication\', true);
  if not openResult = true then
  begin
    MessageDlg
      ('Unable to write to registry. Your application does NOT have Administrator level privileges.',
      TMsgDlgType.mtError, mbOKCancel, 0);
  end
  else
  begin
    MessageDlg
      ('Write to registry permitted. Your application has Administrator level privileges.',
      TMsgDlgType.mtInformation, mbOKCancel, 0);
  end;
  reg.CloseKey();
  reg.Free;
end;

procedure TForm1.Laboratorios1Click(Sender: TObject);
var
  form8: Tform8;
begin
  showDialog(Tform8);
end;

procedure TForm1.maxDayTrial(Sender: TObject; DaysRemained: Integer);
begin
  if ((isRegistred=false) AND (DaysRemained <> 0)) then
  begin
    DiasRestantes := DaysRemained;
  end
  else
    DiasRestantes := 0;
end;

procedure TForm1.maxExpiration(Sender: TObject);
begin
  if (isRegistred=false) then
  begin
   terminate :=true;Application.MessageBox('Su período de prueba ha terminado.'
     + #13#10 +
     'Debe comunicarse con edwinhenriquezh@gmail.com' +
     #13#10 + 'Debe registrarse', 'Error', MB_OK +
     MB_ICONINFORMATION + MB_DEFBUTTON2);

     NumeroUnico := getNumeroUnico;
      showDialog(Tform18);
  end;
end;

procedure TForm1.maxGetPassword(Sender: TObject; var Password: string);
begin
  Password := InputBox('Introduzca su clave', 'Clave', '');
end;

procedure TForm1.maxInvalidSystemTime(Sender: TObject);
begin
  Application.MessageBox
    ('La hora de su sistema no es correcta, su licencia ha expirado', 'Error',
    MB_OK + MB_ICONSTOP + MB_DEFBUTTON2);

end;

procedure TForm1.maxStartTrial(Sender: TObject; StartsRemained: Integer);

begin
  if ((isRegistred=false) AND (StartsRemained <> 0)) then
  begin
    DiasRestantes := StartsRemained;
  end
  else
    DiasRestantes := 0;
end;

procedure TForm1.maxValidPassword(Sender: TObject);
begin
  ShowMessage('Password Correcto');
end;

procedure TForm1.maxWrongPassword(Sender: TObject; WrongPassword: string);
begin
  ShowMessage('Password Incorrecto');
  Application.terminate;
end;

procedure TForm1.Medicinas1Click(Sender: TObject);
var
  form6: Tform6;
begin
  showDialog(Tform6);
end;

function TForm1.getNumeroUnico: String;
var
  MaxFileNameLength, VolFlags, SerNum, Largo: DWord;
  Nombre: array [0 .. 100] of Char;

begin
  if GetVolumeInformation(Pchar('c:\'), nil, 0, @SerNum, MaxFileNameLength,
    VolFlags, nil, 0) then
    Result := IntToHex(SerNum, 8)
  else
    Result := '00000000';
  Largo := 100;
  GetUserName(Nombre, Largo);
  Result := Result + UpperCase(Nombre);
end;

procedure TForm1.P1Click(Sender: TObject);
begin
  PageControl1.Visible := true;
  getData;
  setColunms;
end;

procedure TForm1.prueba1Click(Sender: TObject);
begin
  isAdmin;
end;

procedure TForm1.Registrar1Click(Sender: TObject);
begin
ShowDialog(Tform18);
end;

procedure TForm1.Salir1Click(Sender: TObject);
begin
  Application.terminate;
end;

procedure TForm1.setColunms;
begin
  DBGrid1.Columns[0].FieldName := 'paciente_id';
  DBGrid1.Columns[0].width := 80;
  DBGrid1.Columns[0].Alignment := taCenter;
  DBGrid1.Columns[0].Title.Caption := 'id';
  DBGrid1.Columns[0].Title.Alignment := taCenter;

  DBGrid1.Columns[1].FieldName := 'cedula';
  DBGrid1.Columns[1].width := 80;
  DBGrid1.Columns[1].Alignment := taLeftJustify;
  DBGrid1.Columns[1].Title.Caption := 'cedula';
  DBGrid1.Columns[1].Title.Alignment := taCenter;

  DBGrid1.Columns[2].FieldName := 'nombre';
  DBGrid1.Columns[2].width := 160;
  DBGrid1.Columns[2].Title.Caption := 'nombre';
  DBGrid1.Columns[2].Title.Alignment := taCenter;

  DBGrid1.Columns[3].FieldName := 'telefono';
  DBGrid1.Columns[3].width := 160;
  DBGrid1.Columns[3].Title.Caption := 'telefono';
  DBGrid1.Columns[3].Title.Alignment := taCenter;

  DBGrid1.Columns[4].FieldName := 'email';
  DBGrid1.Columns[4].width := 160;
  DBGrid1.Columns[4].Title.Caption := 'correo';
  DBGrid1.Columns[4].Title.Alignment := taCenter;

  DBGrid1.Columns[5].FieldName := 'genero';
  DBGrid1.Columns[5].width := 70;
  DBGrid1.Columns[5].Title.Caption := 'genero';

  DBGrid1.Columns[6].FieldName := 'fecha_de_nacimiento';
  DBGrid1.Columns[6].width := 0;
  DBGrid1.Columns[6].Title.Caption := 'fecha de nacimiento';

  DBGrid1.Columns[7].FieldName := 'direccion';
  DBGrid1.Columns[7].width := 0;
  DBGrid1.Columns[7].Title.Caption := 'direccion';
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  DM.FQuery.close;
  DM.FQuery.SQL.clear;
  if (CheckBox1.Checked = false) then
  begin
    DM.FQuery.SQL.Add('select * from pacientes where nombre like :nombre');
    DM.FQuery.ParamByName('nombre').AsString := '%' + Edit5.text + '%';
  end
  else
  begin
    DM.FQuery.SQL.Add('select * from pacientes where cedula like :cedula');
    DM.FQuery.ParamByName('cedula').AsString := Edit5.text;
  end;
  DM.FQuery.open;
  SpeedButton1.Enabled := DM.FQuery.Active;
  SpeedButton2.Enabled := DM.FQuery.Active;
  SpeedButton3.Enabled := DM.FQuery.Active;
  SpeedButton4.Enabled := DM.FQuery.Active;
  StatusBar1.Panels[1].text := IntToStr(DM.FQuery.RecordCount) + ' pacientes ';
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar?', mtCOnfirmation, [mbOk, mbCancel], 0) = mrYes
  then
    deleteData;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  isEdit := true;
  Panel2.Visible := true;
  Panel3.Caption := 'Editar Paciente' + DBGrid1.Columns[2].Field.value;;

  Edit1.text := DBGrid1.Columns[1].Field.value;
  Edit2.text := DBGrid1.Columns[2].Field.value;
  Edit3.text := DBGrid1.Columns[3].Field.value;
  Edit4.text := DBGrid1.Columns[4].Field.value;
  if (DBGrid1.Columns[5].Field.value = 'femenino') then
    RadioGroup1.ItemIndex := 1
  else
    RadioGroup1.ItemIndex := 0;
  DateTimePicker1.Date := DBGrid1.Columns[6].Field.value;
  Memo1.text := DBGrid1.Columns[7].Field.value;
  Edit1.SetFocus;

end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Panel2.Visible := true;
  Edit1.clear;
  Edit2.clear;
  Edit3.clear;
  Edit4.clear;
  Memo1.clear;
  DateTimePicker1.Date := now;
  Panel3.Caption := 'Agregar Nuevo Paciente';
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  if (isEdit) then
    editPaciente
  else
    creaPaciente;
  isEdit := false;
  Panel2.Visible := false;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  Edit1.clear;
  Edit2.clear;
  Edit3.clear;
  Edit4.clear;
  Memo1.clear;
  Panel2.Visible := false;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  getData;
  setColunms;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
var
  form10: Tform10;
begin
  paciente_id := DBGrid1.Columns[0].Field.value;
  paciente := DBGrid1.Columns[2].Field.value;
  genero := DBGrid1.Columns[5].Field.value;
  edad := IntToStr(DateUtils.YearsBetween(now, DBGrid1.Columns[6].Field.value));
  email := DBGrid1.Columns[4].Field.value;
  showDialog(Tform10);
end;

end.
