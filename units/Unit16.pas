unit Unit16;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Win.Registry,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Word2000, Vcl.StdCtrls,
  DateUtils, IdMessage, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm16 = class(TForm)
    Button1: TButton;
    SMTP: TIdSMTP;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    DATA: TIdMessage;
    Button2: TButton;
    GroupBox1: TGroupBox;
    textHost: TEdit;
    textPort: TEdit;
    GroupBox2: TGroupBox;
    textUsername: TEdit;
    textPassword: TEdit;
    GroupBox3: TGroupBox;
    Subject: TEdit;
    EmailPaciente: TEdit;
    Button3: TButton;
    Button4: TButton;
    GroupBox4: TGroupBox;
    Body: TMemo;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button5: TButton;
    Bevel3: TBevel;
    Button6: TButton;
    Bevel4: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure crearReporte;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure configGmail;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure setColumns;
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;
  word: TWordApplication;
  documento: WordDocument;
  seccion: Section;
  parrafo: Paragraph;
  rango: WordRange;
  comentario: Comment;
  sFile: string;
  Host, Username, Password: string;
  Port: integer;
  archivo:string;


implementation

uses
  Unit1, Unit2, Unit10;

{$R *.dfm}

procedure TForm16.Button1Click(Sender: TObject);
begin
  try
    sFile := rutaTxt + '\template.docx';
    word := TWordApplication.Create(Self);
    word.Visible := true;
    documento := word.Documents.Open(sFile, EmptyParam, EmptyParam, EmptyParam,
      EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
      EmptyParam, EmptyParam);
    crearReporte;
  finally
    archivo := 'entrevista'+DM.getNumber;
    word.ActiveDocument.SaveAs(archivo,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
   word.Disconnect;
    word.Free;
    DM.setInforme(entrevista_id, paciente, archivo, email);
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  try
    // SMTP.Host := Host;
    // SMTP.Username := Username;
    // SMTP.Password := Password;
    // SMTP.Port := Port;

    DATA.Subject := 'Informe Médico';
    DATA.Recipients.EMailAddresses := 'edwinhenriquezh@gmail.com';
    DATA.Body.Text := 'Prueba de correo';
    SMTP.Connect;
    SMTP.Send(DATA);
    SMTP.Disconnect(true);

  except
    on e: exception do
      ShowMessage(e.Message);
  end;
end;

procedure TForm16.Button3Click(Sender: TObject);
begin
DM.setGmail(textHost.text,textPort.text,textUsername.text,textPassword.text);
DM.getGmail;
configGmail;

end;

procedure TForm16.Button4Click(Sender: TObject);
begin
DM.delGmail;
DM.iniGmail;
DM.getGmail;
configGmail;
end;

procedure TForm16.Button5Click(Sender: TObject);
begin
DM.getInformesDePaciente(email);
setColumns;
end;

procedure TForm16.Button6Click(Sender: TObject);
begin
Close;
end;

procedure TForm16.configGmail;
begin
Host := DM.FQuery.FieldByName('host').AsString;
Port := strtoint(DM.FQuery.FieldByName('port').AsString);
Username:= DM.FQuery.FieldByName('username').AsString;
Password := DM.FQuery.FieldByName('clave').AsString;
textHost.Text :=Host;
textPort.Text := DM.FQuery.FieldByName('port').AsString;
textUsername.Text :=Username;
textPassword.Text :=Password;
end;

procedure TForm16.crearReporte;
var
  sexo, edad: string;
  sintomas: AnsiString;
  nacimiento: TDateTime;
begin
  sintomas := '';
  DM.getPaciente(paciente_id);
  sexo := DM.FQuery.FieldByName('genero').AsString;
  nacimiento := DM.FQuery.FieldByName('fecha_de_nacimiento').AsDateTime;
  edad := IntToStr(DateUtils.YearsBetween(now, nacimiento)) + ' años';
  word.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;
  word.Selection.Font.Size := 16;
  word.Selection.Font.bold := 1;
  word.Selection.TypeText('Informe Médico' + #13 + #13);

  word.Selection.ParagraphFormat.Alignment := wdAlignParagraphJustify;
  word.Selection.Font.Size := 13;
  word.Selection.Font.bold := 0;
  word.Selection.TypeText('Paciente: ' + DM.FQuery.FieldByName('nombre')
    .AsString + #13);
  word.Selection.TypeText('Cédula: ' + DM.FQuery.FieldByName('cedula')
    .AsString + #13);
  word.Selection.TypeText('Dirección: ' + DM.FQuery.FieldByName('direccion')
    .AsString + #13);
  word.Selection.TypeText('Teléfono : ' + DM.FQuery.FieldByName('telefono')
    .AsString + #13);
  word.Selection.TypeText('Email: ' + DM.FQuery.FieldByName('email')
    .AsString + #13);
  DM.getEntrevista('282');
  word.Selection.TypeText('fecha: ' + DM.FQuery.FieldByName('fecha')
    .AsString + #13);
  word.Selection.TypeText('Motivo: ' + DM.FQuery.FieldByName('motivo')
    .AsString + #13);
  DM.getSintomasDeEntrevista(entrevista_id);
  DM.FDQueryPivot.First;
  while not DM.FDQueryPivot.eof do
  begin
    sintomas := DM.FDQueryPivot.FieldByName('sintoma').AsString + '. ';
    DM.FDQueryPivot.Next;
  end;

  word.Selection.Font.Size := 13;
  word.Selection.Font.bold := 0;
  word.Selection.TypeText('Paciente de sexo: ' + sexo + ' y de ' + edad +
    ' que manifiesta sentir: ' + sintomas);
  word.Selection.TypeText(#13 + #13);

  DM.getArchivosDeEntrevista('282');
  if (DM.FQuery.RecordCount > 0) then
    DM.FQuery.First;
  word.Selection.Font.Size := 14;
  word.Selection.Font.bold := 1;
  word.Selection.TypeText(#13);

  word.Selection.TypeText('Imágenes:' + #13);
  word.Selection.Font.Size := 13;
  word.Selection.Font.bold := 0;

  while Not DM.FQuery.eof do
  begin
    word.Selection.InlineShapes.AddPicture(DM.FQuery.FieldByName('ubicacion')
      .AsString, false, true, EmptyParam);
    word.Selection.TypeText(#13);
    word.Selection.TypeText(DM.FQuery.FieldByName('descripcion')
      .AsString + #13);
    word.Selection.TypeText(#13);
    DM.FQuery.Next;
  end;

  word.Selection.Font.Size := 14;
  word.Selection.Font.bold := 1;
  word.Selection.TypeText('Diagnóstico:' + #13);
  word.Selection.Font.Size := 13;
  word.Selection.Font.bold := 0;
  word.Selection.Font.Size := 13;

  DM.getComentarios(entrevista_id);

  while Not DM.FDQueryComentarios.eof do
  begin
    word.Selection.TypeText(DM.FDQueryComentarios.FieldByName('comentario')
      .AsString);
    word.Selection.TypeText(#13);
    DM.FDQueryComentarios.Next;
  end;

  word.Selection.TypeText(#13);
  word.Selection.TypeText(#13);
  word.Selection.Font.Size := 14;
  word.Selection.Font.bold := 1;
  word.Selection.TypeText('Tratamiento:' + #13);
  word.Selection.Font.Size := 13;
  word.Selection.Font.bold := 0;
  word.Selection.Font.Size := 13;

  DM.getTratamiento(entrevista_id);

  while Not DM.FDQueryTratamientos.eof do
  begin
    word.Selection.TypeText(DM.FDQueryTratamientos.FieldByName('medicina')
      .AsString);
    word.Selection.TypeText(#13);

    word.Selection.Font.Size := 12;
    word.Selection.Font.Italic := 1;

    word.Selection.TypeText(DM.FDQueryTratamientos.FieldByName('dosis').AsString
      + ' ' + DM.FDQueryTratamientos.FieldByName('frecuencia').AsString);
    word.Selection.TypeText(#13);
    word.Selection.TypeText(DM.FDQueryTratamientos.FieldByName('observacion')
      .AsString + #13);

    word.Selection.Font.Size := 13;
    word.Selection.Font.bold := 0;
    word.Selection.Font.Size := 13;
    word.Selection.TypeText(#13);
    word.Selection.TypeText(#13);
    DM.FDQueryTratamientos.Next;
  end;

end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  // uxntasmvodpummdb
  DM.getGmail;
  if(DM.FQuery.RecordCount=0) then
  begin
  DM.iniGmail;
  DM.getGmail;
  end;
  configGmail;
  DM.getInformesDePaciente(email);
  setColumns;

end;

procedure TForm16.setColumns;
begin
  DBGrid1.Columns[0].FieldName := 'informe_id';
  DBGrid1.Columns[0].width := 80;
  DBGrid1.Columns[0].Alignment := taCenter;
  DBGrid1.Columns[0].Title.caption := 'id';
  DBGrid1.Columns[0].Title.Alignment := taCenter;

  DBGrid1.Columns[1].FieldName := 'entrevista_id';
  DBGrid1.Columns[1].width := 80;
  DBGrid1.Columns[1].Alignment := taCenter;
  DBGrid1.Columns[1].Title.caption := 'entrevista_id';
  DBGrid1.Columns[1].Title.Alignment := taCenter;


  DBGrid1.Columns[2].FieldName := 'fecha';
  DBGrid1.Columns[2].width := 80;
  DBGrid1.Columns[2].Alignment := taLeftJustify;
  DBGrid1.Columns[2].Title.caption := 'fecha';
  DBGrid1.Columns[2].Title.Alignment := taCenter;

  DBGrid1.Columns[3].FieldName := 'informe';
  DBGrid1.Columns[3].width := 160;
  DBGrid1.Columns[3].Title.caption := 'informe';
  DBGrid1.Columns[3].Title.Alignment := taCenter;

DBGrid1.Columns[4].FieldName := 'paciente';
  DBGrid1.Columns[4].width := 160;
  DBGrid1.Columns[4].Title.caption := 'paciente';
  DBGrid1.Columns[4].Title.Alignment := taCenter;

  DBGrid1.Columns[5].FieldName := 'email';
  DBGrid1.Columns[5].width := 70;
  DBGrid1.Columns[5].Title.caption := 'email';

end;

end.
