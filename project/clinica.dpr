program clinica;

{$R *.dres}

uses
  Vcl.Forms,
  Unit1 in '..\units\Unit1.pas' {Form1},
  Unit2 in '..\units\Unit2.pas' {DM: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  Unit5 in '..\units\Unit5.pas' {Form5},
  Unit6 in '..\units\Unit6.pas' {Form6},
  Unit7 in '..\units\Unit7.pas' {Form7},
  Unit8 in '..\units\Unit8.pas' {Form8},
  Unit9 in '..\units\Unit9.pas' {Form9},
  Unit10 in '..\units\Unit10.pas' {Form10},
  Unit11 in '..\units\Unit11.pas' {Form11},
  Unit12 in '..\units\Unit12.pas' {Form12},
  Unit3 in '..\units\Unit3.pas' {Form3},
  Unit4 in '..\units\Unit4.pas' {Form4},
  Unit13 in '..\units\Unit13.pas' {Form13},
  Unit14 in '..\units\Unit14.pas' {Form14},
  Unit15 in '..\units\Unit15.pas' {Form15},
  Unit16 in '..\units\Unit16.pas' {Form16},
  Unit17 in '..\units\Unit17.pas' {Form17},
  Unit18 in '..\units\Unit18.pas' {Form18},
  Unit19 in '..\units\Unit19.pas' {Form19},
  Unit20 in '..\units\Unit20.pas' {Form20};

{$R *.res}

begin
  TStyleManager.SystemHooks:= [shMenus,shToolTips];
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.Run;
end.
