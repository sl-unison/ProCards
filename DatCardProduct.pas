unit DatCardProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TfrmDatCardProduct = class(TForm)
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtName: TDBEditEh;
    edtCost: TDBNumberEditEh;
    edtCode: TDBEditEh;
    edtIsVirtual: TDBCheckBoxEh;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    Code: String;
  end;

var
  frmDatCardProduct: TfrmDatCardProduct;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatCardProduct.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus <> RS_INSERT) and (RecStatus <> RS_EDIT) then Exit;

  if (Trim(edtCode.Text) = '') then
      raise Exception.Create('Не введен код продукта');

  if (Trim(edtName.Text) = '') then
      raise Exception.Create('Не введено название продукта');

  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SQLInsert('R_CardProducts',
                    ['Code','Name','Cost','IsVirtual'],
                    [QuotedStr(Copy(uf_VarToStr(edtCode.Value), 1, 20)),
                     QuotedStr(Copy(uf_VarToStr(edtName.Value), 1, 50)),
                     uf_VarToStr(edtCost.Value),
                     BoolToStr(edtIsVirtual.Checked, True)]);
    try
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      DMain.ADCon.StartTransaction;
      DMain.ADCon.ExecSQL(Cmd);
      DMain.ADCon.Commit;
      Code := Copy(VarToStr(edtCode.Value), 1, 20);
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Новый карт. продукт. Ввод нового карт. продукта', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_CardProducts',
                    ['Code','Name','Cost','IsVirtual'],
                    [QuotedStr(Copy(uf_VarToStr(edtCode.Value), 1, 20)),
                     QuotedStr(Copy(uf_VarToStr(edtName.Value), 1, 50)),
                     uf_VarToStr(edtCost.Value),
                     BoolToStr(edtIsVirtual.Checked, True)],
                    'Code = '+QuotedStr(Code));
    try
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      DMain.ADCon.StartTransaction;
      DMain.ADCon.ExecSQL(Cmd);
      DMain.ADCon.Commit;
      Code := Copy(VarToStr(edtCode.Value), 1, 20);
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Новый карт. продукт. Редактирование карт. продукта', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatCardProduct.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
