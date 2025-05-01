unit R_Branches;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons,
  DBGridEh, ExtCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh;

type
  TfrmBranches = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acClose: TAction;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBranches: TfrmBranches;

implementation

uses
  DBDatas, DatBranch, Globals;

{$R *.dfm}

procedure TfrmBranches.acAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatBranch := TfrmDatBranch.Create(Owner);
  try
    frmDatBranch.RecStatus := RS_INSERT;
    if (frmDatBranch.ShowModal <> mrOk) then Exit;

    R := frmDatBranch.Code;
    DMain.tbBranches.Close;
    DMain.tbBranches.Open;
    DMain.tbBranches.Locate('Code', R, []);
  finally
    frmDatBranch.Free;
  end;
end;

procedure TfrmBranches.acEditExecute(Sender: TObject);
var R: Integer;
begin
  if DMain.tbBranches.IsEmpty then Exit;

  R := DMain.tbBranches.FieldByName('Code').AsInteger;
  frmDatBranch := TfrmDatBranch.Create(Owner);
  try
    frmDatBranch.RecStatus := RS_EDIT;
    frmDatBranch.Code := R;
    frmDatBranch.edtCode.Value          := DMain.tbBranches['Code'];
    frmDatBranch.edtName.Value          := DMain.tbBranches['Name'];
    frmDatBranch.edtNameShort.Value     := DMain.tbBranches['Nameshort'];
    frmDatBranch.edtActNo.Value         := DMain.tbBranches['ActNo'];
    frmDatBranch.edtMandPersPins.Value  := DMain.tbBranches['MandPersPins'];
    frmDatBranch.edtMandPostPins.Value  := DMain.tbBranches['MandPostPins'];
    frmDatBranch.edtMandPersCards.Value := DMain.tbBranches['MandPersCards'];
    frmDatBranch.edtMandPostCards.Value := DMain.tbBranches['MandPostCards'];
    frmDatBranch.edtMandNoPins.Value    := DMain.tbBranches['MandNoPins'];
    frmDatBranch.edtMandNoCards.Value   := DMain.tbBranches['MandNoCards'];
    frmDatBranch.edtMandDatePins.Value  := DMain.tbBranches['MandDatePins'];
    frmDatBranch.edtMandDateCards.Value := DMain.tbBranches['MandDateCards'];
    frmDatBranch.edtPersPinEmail.Value  := DMain.tbBranches['PersPinEmail'];
    frmDatBranch.edtPersCardEmail.Value := DMain.tbBranches['PersCardEmail'];
    frmDatBranch.edtFilesPath.Value     := DMain.tbBranches['FilesPath'];
    frmDatBranch.edtFilesMask.Value     := DMain.tbBranches['FilesMask'];
    frmDatBranch.edtFilesBack.Value     := DMain.tbBranches['FilesBack'];
    if (frmDatBranch.ShowModal <> mrOk) then Exit;

    R := frmDatBranch.Code;
    DMain.tbBranches.Close;
    DMain.tbBranches.Open;
    DMain.tbBranches.Locate('Code', R, []);
  finally
    frmDatBranch.Free;
  end;
end;

procedure TfrmBranches.acDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if DMain.tbBranches.IsEmpty then Exit;
  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',
                mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := DMain.tbBranches.FieldByName('Code').AsInteger;
    if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
    DMain.ADCon.StartTransaction;
    Cmd := 'Delete from R_Branches where Code = '+IntToStr(R);
    DMain.ADCon.ExecSQL(Cmd);
    DMain.ADCon.Commit;
    DMain.tbBranches.Prior;
    if (not DMain.tbBranches.Bof) then
        R := DMain.tbBranches.FieldByName('Code').AsInteger;
    DMain.tbBranches.Close;
    DMain.tbBranches.Open;
    DMain.tbBranches.Locate('Code', R, []);
  except
    on E: Exception do
    begin
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      ShowMessage(uf_ErrorToLog('Справочник филиалов. Удаление записи: '+IntToStr(R), E, Cmd));
    end;
  end;
end;

procedure TfrmBranches.acCloseExecute(Sender: TObject);
begin
  Close;
end;

end.
