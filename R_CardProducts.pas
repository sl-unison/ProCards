unit R_CardProducts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Buttons, ExtCtrls,
  ActnList, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh;

type
  TfrmCardProducts = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
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
  frmCardProducts: TfrmCardProducts;

implementation

uses
  DBDatas, DatCardProduct, Globals;

{$R *.dfm}

procedure TfrmCardProducts.acAddExecute(Sender: TObject);
var R: String;
begin
  frmDatCardProduct := TfrmDatCardProduct.Create(Owner);
  try
    frmDatCardProduct.RecStatus := RS_INSERT;
    if (frmDatCardProduct.ShowModal <> mrOk) then Exit;

    R := frmDatCardProduct.Code;
    DMain.tbCardProds.Close;
    DMain.tbCardProds.Open;
    DMain.tbCardProds.Locate('Code', R, []);
  finally
    frmDatCardProduct.Free;
  end;
end;

procedure TfrmCardProducts.acEditExecute(Sender: TObject);
var R: String;
begin
  if DMain.tbCardProds.IsEmpty then Exit;

  R := DMain.tbCardProds.FieldByName('Code').AsString;
  frmDatCardProduct := TfrmDatCardProduct.Create(Owner);
  try
    frmDatCardProduct.RecStatus := RS_EDIT;
    frmDatCardProduct.Code := R;
    frmDatCardProduct.edtCode.Value := DMain.tbCardProds['Code'];
    frmDatCardProduct.edtName.Value := DMain.tbCardProds['Name'];
    frmDatCardProduct.edtCost.Value := DMain.tbCardProds['Cost'];
    frmDatCardProduct.edtIsVirtual.Checked := DMain.tbCardProds.FieldByName('IsVirtual').AsBoolean;
    if (frmDatCardProduct.ShowModal <> mrOk) then Exit;

    R := frmDatCardProduct.Code;
    DMain.tbCardProds.Close;
    DMain.tbCardProds.Open;
    DMain.tbCardProds.Locate('Code', R, []);
  finally
    frmDatCardProduct.Free;
  end;
end;

procedure TfrmCardProducts.acDeleteExecute(Sender: TObject);
var R: String;
var Cmd: String;
begin
  if DMain.tbCardProds.IsEmpty then Exit;
  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',
                mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := DMain.tbCardProds.FieldByName('Code').AsString;
    if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
    DMain.ADCon.StartTransaction;
    Cmd := 'Delete from R_CardProducts where Code = '+QuotedStr(R);
    DMain.ADCon.ExecSQL(Cmd);
    DMain.ADCon.Commit;
    DMain.tbCardProds.Prior;
    if (not DMain.tbCardProds.Bof) then
        R := DMain.tbCardProds.FieldByName('Code').AsString;
    DMain.tbCardProds.Close;
    DMain.tbCardProds.Open;
    DMain.tbCardProds.Locate('Code', R, []);
  except
    on E: Exception do
    begin
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      ShowMessage(uf_ErrorToLog('Удаление карт. продукта', E, Cmd));
    end;
  end;
end;

procedure TfrmCardProducts.acCloseExecute(Sender: TObject);
begin
  Close;
end;

end.
