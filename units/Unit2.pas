unit Unit2;

interface

uses
  System.SysUtils, System.Classes, ShellApi, ShlObj, Windows, Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils;

type
  TDM = class(TDataModule)
    conexion: TFDConnection;
    FQuery: TFDQuery;
    Contador: TFDQuery;
    FDQueryEnfermedades: TFDQuery;
    FDQuerySintomas: TFDQuery;
    FDQueryRel: TFDQuery;
    FDQueryPivot: TFDQuery;
    FDQueryMedicinas: TFDQuery;
    FDQueryLaboratorios: TFDQuery;
    FDQueryEntrevistas: TFDQuery;
    FDQueryComentarios: TFDQuery;
    FDQueryDiagnosticos: TFDQuery;
    FDQueryTratamientos: TFDQuery;
    FDQueryDiccionario: TFDQuery;
    FDQueryArchivos: TFDQuery;
    FQueryInformes: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure addSintoma(sintoma: string);
    procedure editSintoma(id: string; sintoma: string);
    procedure delSintoma(id: string);
    procedure getComentarios(id: string);
    procedure getMedicinas;
    procedure getTratamiento(id: string);
    procedure delTratamiento(id: string);
    procedure delEntrevista(id: string);
    procedure getVocabulario;
    procedure setVocabulario;
    procedure getSeleccionados;
    procedure getGmail;
    procedure delGmail;
    procedure iniGmail;
    procedure setGmail(host, port, username, clave: string);
    function getNumber: string;
    procedure getPaciente(id: string);
    procedure getEntrevista(id: string);
    procedure getSintomasDeEntrevista(id: string);
    procedure getArchivosDeEntrevista(id: string);
    procedure setInforme(entrevista_id, paciente, informe, email: string);
    procedure getInforme(id: string);
    procedure getInformesDePaciente(email: string);
    procedure addComentario(id, tipo: string; comentario: AnsiString);
    function getFolder(Folder: integer): string;
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  DM: TDM;
  ruta, rutaDB, rutaImagenes, rutaTxt,rutaDatos,rutaSystem,rutaDll: string;




implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM.addComentario(id, tipo: string; comentario: AnsiString);
begin
  DM.FDQueryComentarios.close;
  DM.FDQueryComentarios.SQL.Clear;
  DM.FDQueryComentarios.SQL.Add
    ('INSERT INTO comentarios (comentable_id, comentable_tipo,comentario)');
  DM.FDQueryComentarios.SQL.Add
    ('VALUES (:comentable_id, :comentable_tipo,:comentario)');
  DM.FDQueryComentarios.paramByName('comentable_id').AsString := id;
  DM.FDQueryComentarios.paramByName('comentable_tipo').AsString := tipo;
  DM.FDQueryComentarios.paramByName('comentario').asMemo := comentario;
  DM.FDQueryComentarios.execSQL;
end;

procedure TDM.addSintoma(sintoma: string);
begin
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.Clear;
  DM.FDQuerySintomas.SQL.Add('INSERT INTO sintomas (sintoma) VALUES(:sintoma)');
  DM.FDQuerySintomas.paramByName('sintoma').AsString := sintoma;
  DM.FDQuerySintomas.execSQL;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  recurso,recurso1: TResourceStream;
begin
  // https://www.cryer.co.uk/brian/delphi/error_undeclared_identifier.htm

  ruta := getFolder(CSIDL_PERSONAL) + '\clinica';
  rutaDatos := getFolder(CSIDL_PERSONAL) + '\clinica\datos';
  rutaDB := getFolder(CSIDL_PERSONAL) + '\clinica\datos\bd.accdb';
  rutaImagenes := getFolder(CSIDL_PERSONAL) + '\clinica\imagenes';
  rutaTxt := getFolder(CSIDL_PERSONAL) + '\clinica\txt';
  rutaSystem:= getFolder(CSIDL_SYSTEM);
  rutaDll := Pchar(getFolder(CSIDL_PERSONAL) + '\clinica\ClinicaDll.dll');
 if Not DirectoryExists(ruta) then
  begin
    createDir(ruta);
    createDir(rutaImagenes);
    createDir(rutaTxt);
    createDir(rutaDatos);
    recurso := TResourceStream.Create(HInstance, 'BD', RT_RCDATA);

    try
      recurso.Position := 0;
      recurso.SaveToFile(rutaDB);
    finally
      recurso.Free;
    end;
  end;


   recurso1 := TResourceStream.Create(HInstance, 'DLL', RT_RCDATA);
    if (Not FileExists(ruta+'\clinicaDll.dll')) then
    begin
      try
      recurso1.Position := 0;
      recurso1.SaveToFile(ruta+'\clinicaDll.dll');
      recurso1.SaveToFile(rutaSystem+'\clinicaDll.dll');
    finally
      recurso1.Free;
    end;
    end;

  conexion.Connected := false;
  conexion.Params.Database := rutaDB;
  conexion.Connected := true;
end;

procedure TDM.delEntrevista(id: string);
begin
  DM.FDQueryEntrevistas.close;
  DM.FDQueryEntrevistas.SQL.Clear;
  DM.FDQueryEntrevistas.SQL.Add
    ('DELETE FROM entrevistas WHERE entrevista_id = :id');
  DM.FDQueryEntrevistas.paramByName('id').AsString := id;
  DM.FDQueryEntrevistas.execSQL;

  DM.FDQueryEntrevistas.close;
  DM.FDQueryEntrevistas.SQL.Clear;
  DM.FDQueryEntrevistas.SQL.Add
    ('DELETE FROM entrevista_sintomas WHERE entrevista_id = :id');
  DM.FDQueryEntrevistas.paramByName('id').AsString := id;
  DM.FDQueryEntrevistas.execSQL;

  DM.FDQueryEntrevistas.close;
  DM.FDQueryEntrevistas.SQL.Clear;
  DM.FDQueryEntrevistas.SQL.Add
    ('DELETE FROM entrevista_tratamiento WHERE entrevista_id = :id');
  DM.FDQueryEntrevistas.paramByName('id').AsString := id;
  DM.FDQueryEntrevistas.execSQL;

  DM.FDQueryEntrevistas.close;
  DM.FDQueryEntrevistas.SQL.Clear;
  DM.FDQueryEntrevistas.SQL.Add
    ('DELETE FROM comentarios WHERE comentable_id = :id AND comentable_tipo=:comentable_tipo');
  DM.FDQueryEntrevistas.paramByName('id').AsString := id;
  DM.FDQueryEntrevistas.paramByName('comentable_tipo').AsString :=
    'Entrevista-Diagnostico';
  DM.FDQueryEntrevistas.execSQL;

end;

procedure TDM.delGmail;
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add('DELETE * FROM gmail');
  DM.FQuery.execSQL;
end;

procedure TDM.delSintoma(id: string);
begin
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.Clear;
  DM.FDQuerySintomas.SQL.Add
    ('DELETE FROM sintomas WHERE sintoma_id = :sintoma_id');
  DM.FDQuerySintomas.paramByName('sintoma_id').AsString := id;
  DM.FDQuerySintomas.execSQL;
end;

procedure TDM.delTratamiento(id: string);
begin
  DM.FDQueryTratamientos.close;
  DM.FDQueryTratamientos.SQL.Clear;
  DM.FDQueryTratamientos.SQL.Add
    ('DELETE * FROM entrevista_tratamiento WHERE id=:id');
  DM.FDQueryTratamientos.paramByName('id').AsString := id;
  DM.FDQueryTratamientos.execSQL;
end;

procedure TDM.editSintoma(id: string; sintoma: string);
begin
  DM.FDQuerySintomas.close;
  DM.FDQuerySintomas.SQL.Clear;
  DM.FDQuerySintomas.SQL.Add('UPDATE sintomas SET sintoma =:sintoma ');
  DM.FDQuerySintomas.SQL.Add('WHERE sintoma_id = :sintoma_id ');
  DM.FDQuerySintomas.paramByName('sintoma_id').AsString := id;
  DM.FDQuerySintomas.paramByName('sintoma').AsString := sintoma;
  DM.FDQuerySintomas.execSQL;
end;

procedure TDM.getArchivosDeEntrevista(id: string);
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add
    ('SELECT * FROM archivos WHERE entrevista_id= :entrevista_id');
  DM.FQuery.paramByName('entrevista_id').AsString := id;
  DM.FQuery.open;

end;

procedure TDM.getComentarios(id: string);
begin
  DM.FDQueryComentarios.close;
  DM.FDQueryComentarios.SQL.Clear;
  DM.FDQueryComentarios.SQL.Add('Select * FROM comentarios');
  DM.FDQueryComentarios.SQL.Add('WHERE comentable_id = :comentable_id');
  DM.FDQueryComentarios.paramByName('comentable_id').AsString := id;
  DM.FDQueryComentarios.open;
end;

procedure TDM.getEntrevista(id: string);
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add
    ('SELECT * FROM entrevistas WHERE entrevista_id= :entrevista_id');
  DM.FQuery.paramByName('entrevista_id').AsString := id;
  DM.FQuery.open;
end;

function TDM.getFolder(Folder: integer): string;
var
  sFolder: PItemIdList;
  SpecialPath: array [0 .. MAX_PATH] of Char;
begin
  SHGetSpecialFolderLocation(0, Folder, sFolder);
  SHGetPathFromIDList(sFolder, SpecialPath);
  Result := StrPas(SpecialPath);
end;

procedure TDM.getGmail;
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add('SELECT * FROM gmail');
  DM.FQuery.open;
end;

procedure TDM.getInformesDePaciente(email: string);
begin
  DM.FqueryInformes.close;
  DM.FqueryInformes.SQL.Clear;
  DM.FqueryInformes.SQL.Add('SELECT * FROM informes WHERE email=:email');
  DM.FqueryInformes.paramByName('email').Value := email;
  DM.FqueryInformes.open;
end;




procedure TDM.getInforme(id: string);
begin
  DM.FqueryInformes.close;
  DM.FqueryInformes.SQL.Clear;
  DM.FqueryInformes.SQL.Add('SELECT * FROM informes WHERE informe_id = :informe_id ');
  DM.FqueryInformes.paramByName('informe_id').AsString := id;
  DM.FqueryInformes.open;
end;


procedure TDM.getMedicinas;
begin
  DM.FDQueryMedicinas.close;
  DM.FDQueryMedicinas.SQL.Clear;
  DM.FDQueryMedicinas.SQL.Add('SELECT * FROM tratamientos ORDER BY nombre');
  DM.FDQueryMedicinas.open;
end;

function TDM.getNumber: string;
begin
  Result := FormatDateTime('ddhhnnss', now());
end;

procedure TDM.getPaciente(id: string);
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add('SELECT * FROM pacientes WHERE paciente_id= :paciente_id');
  DM.FQuery.paramByName('paciente_id').AsString := id;
  DM.FQuery.open;
end;

procedure TDM.getSeleccionados;
begin
  DM.FDQueryDiccionario.close;
  DM.FDQueryDiccionario.SQL.Clear;
  DM.FDQueryDiccionario.SQL.Add
    ('SELECT * FROM diccionario    WHERE (seleccionado = :seleccionado) ORDER BY grupo');
  DM.FDQueryDiccionario.paramByName('seleccionado').AsBoolean := true;
  DM.FDQueryDiccionario.open;
end;

procedure TDM.getSintomasDeEntrevista(id: string);
var
  I: integer;
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
  DM.FDQueryPivot.paramByName('entrevista_id').AsString := id;
  DM.FDQueryPivot.open;
end;

procedure TDM.getTratamiento(id: string);
begin
  DM.FDQueryTratamientos.close;
  DM.FDQueryTratamientos.SQL.Clear;
  DM.FDQueryTratamientos.SQL.Add
    ('SELECT * FROM entrevista_tratamiento WHERE entrevista_id=:id');
  DM.FDQueryTratamientos.paramByName('id').AsString := id;
  DM.FDQueryTratamientos.open;
end;

procedure TDM.getVocabulario;
begin
  DM.FDQueryDiccionario.close;
  DM.FDQueryDiccionario.SQL.Clear;
  DM.FDQueryDiccionario.SQL.Add('SELECT * FROM diccionario ORDER By grupo');
  DM.FDQueryDiccionario.open;
end;

procedure TDM.iniGmail;
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add
    ('INSERT INTO gmail (host,port,username,clave) VALUES (:host,:port,:username,:clave)');
  DM.FQuery.paramByName('host').AsString := 'smtp.gmail.com';
  DM.FQuery.paramByName('port').AsString := '587';
  DM.FQuery.paramByName('username').AsString := 'edwinhenriquezh@gmail.com';
  DM.FQuery.paramByName('clave').AsString := 'uxntasmvodpummdb';
  DM.FQuery.execSQL;
end;

procedure TDM.setGmail(host, port, username, clave: string);
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add
    ('UPDATE gmail SET host = :host, port = :port, username = :username, clave = :clave');
  DM.FQuery.paramByName('host').AsString := host;
  DM.FQuery.paramByName('port').AsString := port;
  DM.FQuery.paramByName('username').AsString := username;
  DM.FQuery.paramByName('clave').AsString := clave;
  DM.FQuery.execSQL;

end;

procedure TDM.setInforme(entrevista_id, paciente, informe, email: string);
begin
  DM.FQuery.close;
  DM.FQuery.SQL.Clear;
  DM.FQuery.SQL.Add
    ('INSERT INTO informes (entrevista_id,fecha,paciente,informe,email) VALUES (:entrevista_id, :fecha, :paciente, :informe, :email)');
  DM.FQuery.paramByName('entrevista_id').AsString := entrevista_id;
  DM.FQuery.paramByName('fecha').AsDateTime := now();
  DM.FQuery.paramByName('paciente').AsString := paciente;
  DM.FQuery.paramByName('informe').AsString := informe;
  DM.FQuery.paramByName('email').AsString := email;
  DM.FQuery.execSQL;
end;

procedure TDM.setVocabulario;
begin
  DM.FDQueryDiccionario.close;
  DM.FDQueryDiccionario.SQL.Clear;
  DM.FDQueryDiccionario.SQL.Add
    ('UPDATE diccionario SET seleccionado=:nuevoValor WHERE seleccionado=:ViejoValor');
  DM.FDQueryDiccionario.paramByName('viejoValor').AsBoolean := true;
  DM.FDQueryDiccionario.paramByName('nuevoValor').AsBoolean := false;
  DM.FDQueryDiccionario.execSQL;
end;

end.
