unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CKeysOnForm;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit8: TEdit;
    Label12: TLabel;
    Edit9: TEdit;
    Label13: TLabel;
    Memo1: TMemo;
    Label14: TLabel;
    Memo2: TMemo;
    Label15: TLabel;
    Memo3: TMemo;
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    KeysOnForm1: TKeysOnForm;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure addLaboratorio;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit8;

procedure TForm9.addLaboratorio;
begin
  if(Not isEdit) then
  begin
  DM.FDQueryLaboratorios.close;
  DM.FDQueryLaboratorios.SQL.Clear;
  DM.FDQueryLaboratorios.SQL.Add('INSERT INTO laboratorios ');
  DM.FDQueryLaboratorios.SQL.Add
    ('(grupo,prueba,unidades,max_hombres,min_hombres,');
  DM.FDQueryLaboratorios.SQL.Add('max_mujeres,min_mujeres,');
  DM.FDQueryLaboratorios.SQL.Add('max_ninos,min_ninos,');
  DM.FDQueryLaboratorios.SQL.Add('observacion,resultados_normales,resultados_anormales)');
  DM.FDQueryLaboratorios.SQL.Add('VALUES (:grupo,:prueba,:unidades,');
  DM.FDQueryLaboratorios.SQL.Add(':max_hombres,:min_hombres,');
  DM.FDQueryLaboratorios.SQL.Add(':max_mujeres,:min_mujeres,');
  DM.FDQueryLaboratorios.SQL.Add(':max_ninos,:min_ninos,');
  DM.FDQueryLaboratorios.SQL.Add(':observacion,');
  DM.FDQueryLaboratorios.SQL.Add(':resultados_normales, :resultados_anormales)');
  DM.FDQueryLaboratorios.ParamByName('grupo').AsString := Edit1.text;
  DM.FDQueryLaboratorios.ParamByName('prueba').AsString := Edit2.text;
  DM.FDQueryLaboratorios.ParamByName('unidades').AsString := Edit3.text;

  DM.FDQueryLaboratorios.ParamByName('max_hombres').AsString := Edit4.text;
  DM.FDQueryLaboratorios.ParamByName('min_hombres').AsString := Edit5.text;

  DM.FDQueryLaboratorios.ParamByName('max_mujeres').AsString := Edit6.text;
  DM.FDQueryLaboratorios.ParamByName('min_mujeres').AsString := Edit7.text;

  DM.FDQueryLaboratorios.ParamByName('max_ninos').AsString := Edit8.text;
  DM.FDQueryLaboratorios.ParamByName('min_ninos').AsString := Edit8.text;

  DM.FDQueryLaboratorios.ParamByName('observacion').AsMemo := Memo3.text;
  DM.FDQueryLaboratorios.ParamByName('resultados_normales').AsMemo := Memo1.text;
  DM.FDQueryLaboratorios.ParamByName('resultados_anormales').AsMemo := Memo2.text;
  DM.FDQueryLaboratorios.ExecSQL;
  end
  else
  begin
  DM.FDQueryLaboratorios.close;
  DM.FDQueryLaboratorios.SQL.Clear;
  DM.FDQueryLaboratorios.SQL.Add('UPDATE laboratorios ');
  DM.FDQueryLaboratorios.SQL.Add('SET grupo = :grupo, prueba = :prueba, unidades = :unidades,');
  DM.FDQueryLaboratorios.SQL.Add('max_hombres = :max_hombres, min_hombres = :min_hombres,');
  DM.FDQueryLaboratorios.SQL.Add('max_mujeres = :max_mujeres, min_mujeres = :min_mujeres,');
  DM.FDQueryLaboratorios.SQL.Add('max_ninos = :max_ninos, min_ninos = :min_ninos,');
  DM.FDQueryLaboratorios.SQL.Add('observacion = :observacion,');
  DM.FDQueryLaboratorios.SQL.Add('resultados_normales = :resultados_normales,');
  DM.FDQueryLaboratorios.SQL.Add('resultados_anormales = :resultados_anormales');
  DM.FDQueryLaboratorios.SQL.Add('WHERE laboratorio_id = :laboratorio_id');

  DM.FDQueryLaboratorios.ParamByName('laboratorio_id').AsString := laboratorio_id;
  DM.FDQueryLaboratorios.ParamByName('grupo').AsString := Edit1.text;
  DM.FDQueryLaboratorios.ParamByName('prueba').AsString := Edit2.text;
  DM.FDQueryLaboratorios.ParamByName('unidades').AsString := Edit3.text;

  DM.FDQueryLaboratorios.ParamByName('max_hombres').AsString := Edit4.text;
  DM.FDQueryLaboratorios.ParamByName('min_hombres').AsString := Edit5.text;

  DM.FDQueryLaboratorios.ParamByName('max_mujeres').AsString := Edit6.text;
  DM.FDQueryLaboratorios.ParamByName('min_mujeres').AsString := Edit7.text;

  DM.FDQueryLaboratorios.ParamByName('max_ninos').AsString := Edit8.text;
  DM.FDQueryLaboratorios.ParamByName('min_ninos').AsString := Edit8.text;

  DM.FDQueryLaboratorios.ParamByName('observacion').AsMemo := Memo3.text;
  DM.FDQueryLaboratorios.ParamByName('resultados_normales').AsMemo := Memo1.text;
  DM.FDQueryLaboratorios.ParamByName('resultados_anormales').AsMemo := Memo2.text;
  DM.FDQueryLaboratorios.ExecSQL;
  end;
  close;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
  addLaboratorio;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  close;
end;

end.
