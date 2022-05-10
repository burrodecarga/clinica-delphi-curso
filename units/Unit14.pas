unit Unit14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.DBCGrids, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons;

type
  TForm14 = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit5: TEdit;
    DBText1: TDBText;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;
  isFilter:Boolean = false;
  notificar:Boolean = true;

implementation

uses
  Unit2, Unit1;
 
{$R *.dfm}

procedure TForm14.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=true then notificar:=True else notificar:=false;

end;

procedure TForm14.DBCheckBox1Click(Sender: TObject);
begin
Beep;
if(notificar =true) then
ShowMessage('debe pulsar el botón Post para hacer efectivo el cambio');
end;

procedure TForm14.Edit5Change(Sender: TObject);
begin
SpeedButton1.Enabled :=Length(Edit5.text)>0;
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
DM.setVocabulario;
DM.getVocabulario;
if(DM.FDQueryDiccionario.RecordCount>0) then
begin
  DBMemo1.DataField:='comentario';
  DBCheckBox1.DataField:='seleccionado';
  DBEdit1.DataField:='grupo';
  DBtext1.DataField:='diccionario_id';
  SpeedButton2.Enabled:=True;
  SpeedButton1.Enabled:=True;
  SpeedButton4.Enabled:=True;
end;
end;

procedure TForm14.SpeedButton1Click(Sender: TObject);
begin
Beep;
DM.FDQueryDiccionario.close;
DM.FDQueryDiccionario.SQL.clear;
DM.FDQueryDiccionario.SQL.Add('SELECt * FROM diccionario WHERE (grupo LIKE :grupo)');
DM.FDQueryDiccionario.ParamByName('grupo').AsString :='%'+Edit5.text+'%';
DM.FDQueryDiccionario.open;
Edit5.clear;
end;

procedure TForm14.SpeedButton2Click(Sender: TObject);
begin
Beep;
isFilter := Not isFilter;
if(isFilter) then
DM.getSeleccionados
else
DM.getVocabulario;
Edit5.clear;
end;

procedure TForm14.SpeedButton3Click(Sender: TObject);
begin
Beep;
DM.setVocabulario;
Close;
end;

procedure TForm14.SpeedButton4Click(Sender: TObject);
begin
Beep;
Close;
end;

end.
