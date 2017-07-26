program TokyoTransfer;

uses
  Vcl.Forms,
  M_Main in 'M_Main.pas' {M_MainFRM},
  G_kyriacosTypes in 'G_kyriacosTypes.pas',
  G_KyrSQL in 'G_KyrSQL.pas',
  G_generalProcs in 'G_generalProcs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TM_MainFRM, M_MainFRM);
  Application.Run;
end.
