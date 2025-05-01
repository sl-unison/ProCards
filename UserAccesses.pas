unit UserAccesses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, ExtCtrls, StdCtrls,
  Buttons, DB, ActnList, DBAxisGridsEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions;

type
  TfrmUserAccesses = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    srAccesses: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acClose: TAction;
    tbAccesses: TFDQuery;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    UserLogin: String;
  end;

var
  frmUserAccesses: TfrmUserAccesses;

implementation

uses
  DatUserAccess, Globals, DBDatas;

{$R *.dfm}

procedure TfrmUserAccesses.acAddExecute(Sender: TObject);
var S: String;
begin
  frmDatUserAccess := TfrmDatUserAccess.Create(Owner);
  try
    frmDatUserAccess.RecStatus := RS_INSERT;
    frmDatUserAccess.UserLogin := UserLogin;
    if (frmDatUserAccess.ShowModal <> mrOk) then Exit;

    S := VarToStr(frmDatUserAccess.edtTableName.KeyValue);
    tbAccesses.Close;
    tbAccesses.Open;
    tbAccesses.Locate('TableName', S, []);
  finally
    frmDatUserAccess.Free;
  end;
end;

procedure TfrmUserAccesses.acEditExecute(Sender: TObject);
var S: String;
var R: Integer;
begin
  if tbAccesses.IsEmpty then Exit;

  R := tbAccesses.FieldByName('RRowID').AsInteger;
  S := tbAccesses.FieldByName('TableName').AsString;
  frmDatUserAccess := TfrmDatUserAccess.Create(Owner);
  try
    frmDatUserAccess.RecStatus := RS_EDIT;
    frmDatUserAccess.UserLogin := UserLogin;
    frmDatUserAccess.RRowID := R;
    frmDatUserAccess.edtTableName.KeyValue := S;
    frmDatUserAccess.edtTableName.Enabled  := False;
    frmDatUserAccess.edtIsAccess.Checked := tbAccesses.FieldByName('IsAccess').AsBoolean;
    frmDatUserAccess.edtIsAdd.Checked    := tbAccesses.FieldByName('IsAdd').AsBoolean;
    frmDatUserAccess.edtIsEdit.Checked   := tbAccesses.FieldByName('IsEdit').AsBoolean;
    frmDatUserAccess.edtIsDelete.Checked := tbAccesses.FieldByName('IsDelete').AsBoolean;
    if (frmDatUserAccess.ShowModal <> mrOk) then Exit;

    tbAccesses.Close;
    tbAccesses.Open;
    tbAccesses.Locate('TableName', S, []);
  finally
    frmDatUserAccess.Free;
  end;
end;

procedure TfrmUserAccesses.acDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if tbAccesses.IsEmpty then Exit;
  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',
                mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbAccesses.FieldByName('RRowID').AsInteger;
    Cmd := 'Delete from R_Accesses where RRowID = '+IntToStr(R);
    DMain.ADCon.ExecSQL(Cmd);
    tbAccesses.Prior;
    if (not tbAccesses.Bof) then
        R := tbAccesses.FieldByName('RRowID').AsInteger;
    tbAccesses.Close;
    tbAccesses.Open;
    tbAccesses.Locate('RRowID', R, []);
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Доступы. Удаление записи', E, Cmd));
  end;
end;

procedure TfrmUserAccesses.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmUserAccesses.FormShow(Sender: TObject);
var Cmd: String;
begin
  try
    if tbAccesses.Active then tbAccesses.Close;
    Cmd := 'Select * from V_Accesses Where Login = '+
                           QuotedStr(UserLogin)+' Order by TableName';
    tbAccesses.Open(Cmd);
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Доступы. Открытие формы', E, Cmd));
  end;
end;

procedure TfrmUserAccesses.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tbAccesses.Active then tbAccesses.Close;
end;

end.
