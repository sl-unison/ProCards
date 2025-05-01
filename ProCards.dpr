program ProCards;

uses
  Forms,
  SysUtils,
  Controls,
  IniFiles,
  Main in 'Main.pas' {frmMain},
  Login in 'Login.pas' {frmLogin},
  ChangePassword in 'ChangePassword.pas' {frmChangePassword},
  DBDatas in 'DBDatas.pas' {DMain: TDataModule},
  DatForm in 'DatForm.pas' {frmDatForm},
  Globals in 'Globals.pas',
  DlgDateRanges in 'DlgDateRanges.pas' {frmDlgDateRanges},
  IssDetails in 'IssDetails.pas' {frmIssDetails},
  DlgLoadFiles in 'DlgLoadFiles.pas' {frmDlgLoadFiles},
  ImpDatas in 'ImpDatas.pas' {frmImpDatas},
  IssHeads in 'IssHeads.pas' {frmIssHeads},
  DatIssHead in 'DatIssHead.pas' {frmDatIssHead},
  R_Branches in 'R_Branches.pas' {frmBranches},
  DatBranch in 'DatBranch.pas' {frmDatBranch},
  R_CardProducts in 'R_CardProducts.pas' {frmCardProducts},
  DatCardProduct in 'DatCardProduct.pas' {frmDatCardProduct},
  SQL in 'SQL.pas' {frmSQL},
  uu_StrDatas in 'uu_StrDatas.pas',
  Setups in 'Setups.pas' {frmSetups},
  DatSetup in 'DatSetup.pas' {frmDatSetup},
  Users in 'Users.pas' {frmUsers},
  DatUser in 'DatUser.pas' {frmDatUser},
  UserAccesses in 'UserAccesses.pas' {frmUserAccesses},
  DatUserAccess in 'DatUserAccess.pas' {frmDatUserAccess},
  ULogToFile in 'ULogToFile.pas',
  DatReport in 'DatReport.pas' {frmDatReport},
  R_Reports in 'R_Reports.pas' {frmReports},
  DlgReport in 'DlgReport.pas' {frmDlgReport},
  DlgPeriod in 'DlgPeriod.pas' {frmDlgPeriod},
  RepGrid in 'RepGrid.pas' {frmRepGrid},
  DatSetSign in 'DatSetSign.pas' {frmDatSetSign};

{$R *.res}

procedure InitApplication;
var Ini: TIniFile;
var S: String;
begin
  glSetup.AppPath := ExtractFilePath(Application.ExeName);
  Ini := TIniFile.Create( glSetup.AppPath + C_PRGINI );
  try
    glSetup.DbfPath := Ini.ReadString( 'PATHES', C_DBFPATH, '');
    glSetup.DbaPath := Ini.ReadString( 'PATHES', C_DBBPATH, '');
    glSetup.ArcPath := Ini.ReadString( 'PATHES', C_ARCPATH, '');
    glSetup.RepPath := Ini.ReadString( 'PATHES', C_REPPATH, '');
    glSetup.ExcPath := Ini.ReadString( 'PATHES', C_EXCPATH, '');
    glSetup.BckPath := Ini.ReadString( 'PATHES', C_BCKPATH, '');
    if glSetup.DbfPath = '' then
       glSetup.DbfPath := glSetup.AppPath + DEF_DBF_PATH;
    if glSetup.DbaPath = '' then
       glSetup.DbaPath := glSetup.AppPath + DEF_DBB_PATH;
    if glSetup.ArcPath = '' then
       glSetup.ArcPath := glSetup.AppPath + DEF_ARC_PATH;
    if glSetup.RepPath = '' then
       glSetup.RepPath := glSetup.AppPath + DEF_REP_PATH;
    if glSetup.ExcPath = '' then
       glSetup.ExcPath := glSetup.AppPath + DEF_EXC_PATH;
    if glSetup.BckPath = '' then
       glSetup.BckPath := glSetup.AppPath + DEF_BCK_PATH;
    glSetup.DbfPath := uf_AddSlash(glSetup.DbfPath);
    glSetup.DbaPath := uf_AddSlash(glSetup.DbaPath);
    glSetup.ArcPath := uf_AddSlash(glSetup.ArcPath);
    glSetup.RepPath := uf_AddSlash(glSetup.RepPath);
    glSetup.ExcPath := uf_AddSlash(glSetup.ExcPath);
    glSetup.BckPath := uf_AddSlash(glSetup.BckPath);
    glSetup.RemoteAccess := False;
    S := AnsiUpperCase(Trim(Ini.ReadString( 'SETTINGS', C_REMACCESS, 'N')));
    if (S = 'Y') then glSetup.RemoteAccess := True;
  finally
    Ini.Free;
  end;
end;

begin
  Application.Initialize;
  PInteger(@Screen.DefaultKbLayout)^:=-1;
  InitApplication;
  Application.HelpFile := 'ProCards.chm';
  Application.Title := SFT_NAME;

  glFmt := TFormatSettings.Create();
  glFmt.DecimalSeparator := '.';
  glFmt.CurrencyString   := '';
  glFmt.CurrencyDecimals := 2;
  glFmt.ShortDateFormat  := 'DD.MM.YYYY';
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.CurrencyString   := '';
  FormatSettings.CurrencyDecimals := 2;
  Application.UpdateFormatSettings := False;

  LogToFile.LogFileName := glSetup.AppPath + SFT_LOGFILE;
  LogToFile.IncDateTime := True;
  LogToFile.DateTimeFormatStr := 'YYYY-MM-DD HH:MM:SS';
  LogToFile.IncSeparator := True;
  LogToFile.Separator    := ' ';

  Application.CreateForm(TfrmMain, frmMain);
  if FileExists( glSetup.AppPath + C_LOCAL ) then
  begin
     frmMain.Localizer.FileName := glSetup.AppPath + C_LOCAL;
     frmMain.Localizer.Active := True;
     frmMain.Localizer.Locale := 1049;
  end;

  Application.CreateForm(TDMain, DMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin.txtSoftName.Caption := SFT_NAME + ' ' + SFT_VERSIONNO;
  frmLogin.Caption := SFT_NAME;
  if frmLogin.ShowModal <> mrOk then begin
     frmLogin.Free;
     DMain.Free;
     frmMain.Free;
     Application.Terminate;
  end
  else begin
     frmLogin.Free;
     frmMain.Visible := True;
     Application.Run;
  end;
end.
