unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxStatusBar, ActnList,
  cxLocalization, ShellApi, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.XPMan, cxClasses, System.Actions;

type
  TfrmMain = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarManager1Bar1: TdxBar;
    dxBarButton2: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    mnuServ_Users: TdxBarButton;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    MainStatusBar: TdxStatusBar;
    ActionList1: TActionList;
    acQuit: TAction;
    acHelp: TAction;
    dxBarSubItem8: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    dxBarButton12: TdxBarButton;
    mnuServ_Options: TdxBarButton;
    dxBarButton7: TdxBarButton;
    acChangePassword: TAction;
    acRepUniGrid: TAction;
    acSetups: TAction;
    Localizer: TcxLocalizer;
    acUsers: TAction;
    XPManifest1: TXPManifest;
    acIssHeads: TAction;
    dxBarButton11: TdxBarButton;
    acRef_Branches: TAction;
    dxBarButton13: TdxBarButton;
    acRef_CardProducts: TAction;
    acSQL: TAction;
    dxBarButton5: TdxBarButton;
    acArcDbase: TAction;
    dxBarButton14: TdxBarButton;
    procedure acHelpExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acQuitExecute(Sender: TObject);
    procedure acChangePasswordExecute(Sender: TObject);
    procedure acRepUniGridExecute(Sender: TObject);
    procedure acSetupsExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acUsersExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acIssHeadsExecute(Sender: TObject);
    procedure acRef_BranchesExecute(Sender: TObject);
    procedure acRef_CardProductsExecute(Sender: TObject);
    procedure acSQLExecute(Sender: TObject);
    procedure acArcDbaseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DBDatas, Users,
  ChangePassword, Setups, R_Reports, Globals,
  IssHeads, R_Branches, R_CardProducts, SQL;

{$R *.dfm}

procedure TfrmMain.acHelpExecute(Sender: TObject);
var SFile: String;
begin
  SFile := glSetup.AppPath + Application.HelpFile;
  if FileExists( SFile ) then
     ShellExecute(HANDLE,Nil,PChar( SFile ),Nil,Nil, SW_SHOWNORMAL)
  else
     ShowMessage('Файл помощи ' + SFile + ' не найден')
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  try
    MainStatusBar.Panels.Items[0].Text := SFT_VERSION;
    MainStatusBar.Panels.Items[1].Text := SFT_COPYRIGHT;
    MainStatusBar.Panels.Items[2].Text := 'Пользователь: '+glSetup.UserName;
    MainStatusBar.Panels.Items[3].Text := SFT_CONTACTS;
    if not glSetup.IsAdmin then
    begin
      Self.acUsers.Visible := False;
      Self.acSetups.Visible := False;
    end;
    if not glSetup.IsSysAdmin then
    begin
      acSQL.Enabled := False;
      acSQL.Visible := False;
      acSetups.Visible := False;
    end;
    Caption := SFT_NAME + ' ' + SFT_VERSIONNO;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Открытие главной формы программы', E));
  end;
end;

procedure TfrmMain.acQuitExecute(Sender: TObject);
begin
  if ActiveMDIChild <> Nil then
  begin
    ActiveMDIChild.Close;
    Exit;
  end;
  Close;
end;

procedure TfrmMain.acArcDbaseExecute(Sender: TObject);
begin
  uf_DBBackup;
  ShowMessage('Бэкап Базы Данных успешно создан');
end;

procedure TfrmMain.acChangePasswordExecute(Sender: TObject);
begin
  frmChangePassword := TFrmChangePassword.Create(Owner);
  try
    frmChangePassword.ShowModal;
  finally
    frmChangePassword.Free;
  end;
end;

procedure TfrmMain.acRepUniGridExecute(Sender: TObject);
var UA: TTableAccesses;
begin
  uf_UserAccessTypes(TBR_REPORTS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmReports := TFrmReports.Create(Owner);
  try
    frmReports.acAdd.Enabled    := UA.IsAdd;
    frmReports.acEdit.Enabled   := UA.IsEdit;
    frmReports.acDelete.Enabled := UA.IsDelete;
    frmReports.ShowModal;
  finally
    frmReports.Free;
  end;
end;

procedure TfrmMain.acSetupsExecute(Sender: TObject);
var UA: TTableAccesses;
begin
  uf_UserAccessTypes(TBR_SETUPS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmSetups := TFrmSetups.Create(Owner);
  try
    frmSetups.acEdit.Enabled   := UA.IsEdit;
    frmSetups.ShowModal;
  finally
    frmSetups.Free;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ActiveMDIChild <> Nil Then
     ActiveMDIChild.Close;

  DMain.LogOut;
  Action := caFree;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Вы действительно хотите выйти из программы?',mtWarning,[mbYes,mbNo],0) = mrNo then
       CanClose := False
  else CanClose := True;
end;

procedure TfrmMain.acUsersExecute(Sender: TObject);
var UA: TTableAccesses;
begin
  if not glSetup.IsSysAdmin then Exit;

  uf_UserAccessTypes(TBR_USERS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmUsers := TFrmUsers.Create(Owner);
  try
    frmUsers.acAdd.Enabled    := UA.IsAdd;
    frmUsers.acEdit.Enabled   := UA.IsEdit;
    frmUsers.acDelete.Enabled := UA.IsDelete;
    frmUsers.acSelect.Visible := False;
    frmUsers.ShowModal;
  finally
    frmUsers.Free;
  end;
end;

procedure TfrmMain.acIssHeadsExecute(Sender: TObject);
var UA: TTableAccesses;
begin
  uf_UserAccessTypes(TBS_ISSHEADS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmIssHeads := TfrmIssHeads.Create(Owner);
  frmIssHeads.acPackAdd.Enabled    := UA.IsAdd;
  frmIssHeads.acPackEdit.Enabled   := UA.IsEdit;
  frmIssHeads.acPackDelete.Enabled := UA.IsDelete;
  frmIssHeads.Show;
end;

procedure TfrmMain.acRef_BranchesExecute(Sender: TObject);
var UA: TTableAccesses;
begin
  uf_UserAccessTypes(TBR_BRANCHES, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmBranches := TfrmBranches.Create(Owner);
  try
    frmBranches.acAdd.Enabled    := UA.IsAdd;
    frmBranches.acEdit.Enabled   := UA.IsEdit;
    frmBranches.acDelete.Enabled := UA.IsDelete;
    frmBranches.ShowModal;
  finally
    frmBranches.Free;
  end;
end;

procedure TfrmMain.acRef_CardProductsExecute(Sender: TObject);
var UA: TTableAccesses;
begin
  uf_UserAccessTypes(TBR_CARDPRODUCTS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmCardProducts := TfrmCardProducts.Create(Owner);
  try
    frmCardProducts.acAdd.Enabled    := UA.IsAdd;
    frmCardProducts.acEdit.Enabled   := UA.IsEdit;
    frmCardProducts.acDelete.Enabled := UA.IsDelete;
    frmCardProducts.ShowModal;
  finally
    frmCardProducts.Free;
  end;
end;

procedure TfrmMain.acSQLExecute(Sender: TObject);
begin
  frmSQL := TFrmSQL.Create(Owner);
  try
    frmSQL.ShowModal;
  finally
    frmSQL.Free;
  end;
end;

end.

