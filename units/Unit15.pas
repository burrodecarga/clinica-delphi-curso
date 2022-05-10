unit Unit15;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtDlgs,Vcl.Imaging.jpeg,VCl.Imaging.pngimage,
  Vcl.Samples.Gauges, Vcl.ComCtrls,RxAppUtils;

type
  TForm15 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure puedeGuardar;
    procedure Memo1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;
  ubicacion:string;
  origen,destino:string;


implementation

uses
  Unit1, Unit14, Unit2, Unit10;

{$R *.dfm}

procedure TForm15.Edit1Change(Sender: TObject);
begin
SpeedButton5.Enabled := Length(Edit1.text)>0;
puedeGuardar;
end;

procedure TForm15.Memo1Change(Sender: TObject);
begin
puedeGuardar;
end;

procedure TForm15.puedeGuardar;
begin
SpeedButton1.Enabled := ((Length(Edit1.text)>0) AND (Length(Memo1.Lines.text)>0) AND (SpeedButton3.Enabled=False));
end;

procedure TForm15.SpeedButton1Click(Sender: TObject);
begin
Beep;
DM.FDQueryArchivos.close;
DM.FDQueryArchivos.SQL.clear;
DM.FDQueryArchivos.SQL.Add('INSERt INTO archivos (paciente_id,entrevista_id,tipo,ubicacion,descripcion)');
DM.FDQueryArchivos.SQL.Add('VALUES (:paciente_id,:entrevista_id,:tipo,:ubicacion,:descripcion)');
DM.FDQueryArchivos.ParamByName('paciente_id').AsString :=paciente_id;
DM.FDQueryArchivos.ParamByName('entrevista_id').AsString :=entrevista_id;
DM.FDQueryArchivos.ParamByName('tipo').AsString :=Edit1.text;
DM.FDQueryArchivos.ParamByName('ubicacion').AsString :=ubicacion;
DM.FDQueryArchivos.ParamByName('descripcion').asMemo :=Memo1.lines.text;
DM.FDQueryArchivos.execSQL;
ShowMessage('Archivo guardado correctamente');
Image1.Picture :=nil;
Edit1.Clear;
Memo1.clear;
CopyFile(PChar(origen),PChar(destino),false);
puedeGuardar;
end;

procedure TForm15.SpeedButton2Click(Sender: TObject);
begin
Beep;
close;
end;

procedure TForm15.SpeedButton3Click(Sender: TObject);
var
ext:string;
begin
Beep;
if(OpenPictureDialog1.Execute) then
begin
origen := OpenPictureDialog1.FileName;
ext := ExtractFileExt(origen);
destino := rutaImagenes+'\imagen'+DM.getNumber+ext;
Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
SpeedButton3.Enabled:=False;
SpeedButton4.Enabled:=true;
puedeGuardar;
end;
end;

procedure TForm15.SpeedButton4Click(Sender: TObject);
begin
Beep;
if Application.MessageBox('¿Desea eliminar la imagen?', 'Warning', MB_YESNO +
  MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
begin
 Image1.Picture :=nil;
SpeedButton3.Enabled:=True;
SpeedButton4.Enabled:=false;
 puedeGuardar;
end;

end;

procedure TForm15.SpeedButton5Click(Sender: TObject);
var
i:Integer;
begin
i:=1;
  ShowDialog(Tform14);
  DM.getSeleccionados;
  if (DM.FDQueryDiccionario.RecordCount > 0) then
       DM.FDQueryDiccionario.First;
  while not DM.FDQueryDiccionario.eof do
  begin
    Beep;
    Memo1.lines.Append(inttostr(i)+'.- '+DM.FDQueryDiccionario.FieldByName('comentario').Value);
    Memo1.Lines.append('');
    i:=i+1;
    DM.FDQueryDiccionario.Next;
  end;
end;

end.
