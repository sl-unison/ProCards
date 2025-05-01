unit DatIssHead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask,
  DBLookupEh, ComCtrls, DBGridEh;

type
  TfrmDatIssHead = class(TForm)
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtRemark: TDBEditEh;
    edtDescription: TDBEditEh;
    edtBranch: TDBLookupComboboxEh;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    edtMandPersPins: TDBEditEh;
    edtMandPostPins: TDBEditEh;
    edtMandNoPins: TDBEditEh;
    edtMandDatePins: TDBDateTimeEditEh;
    Panel4: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    edtMandPostCards: TDBEditEh;
    edtMandNoCards: TDBEditEh;
    edtMandDateCards: TDBDateTimeEditEh;
    Label12: TLabel;
    edtActNo: TDBNumberEditEh;
    edtMandPersCards: TDBEditEh;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    RPackID: Integer;
  end;

var
  frmDatIssHead: TfrmDatIssHead;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatIssHead.btnSaveClick(Sender: TObject);
var Cmd, Desc: String;
var Branch: Integer;
begin
  if (RecStatus = RS_INSERT) then
  begin
    if (uf_IsUndef(edtBranch.KeyValue)) then
        raise Exception.Create('Не указан филиал');

    Branch := edtBranch.KeyValue;
    if (not uf_GetBranchDatas(Branch)) then
        raise Exception.Create('Не возможно получить данные по филиалу');

    Desc := VarToStr(edtDescription.Value);
    if (Desc = '') then
        Desc := IntToStr(Branch)+' - Издательский пакет';

    RPackID := uf_GetRecID('S_IssHeads');
    Cmd := SqlInsert('S_IssHeads',
                  ['RRowID','Branch','PackDate','PackTime',
                   'Description','ActNo',
                   'MandPersPins','MandPersCards',
                   'MandPostPins','MandPostCards',
                   'MandNoPins','MandNoCards',
                   'MandDatePins','MandDateCards','Remark'],
                  [IntToStr(RPackID),
                   VarToStr(edtBranch.KeyValue),
                   uf_DateToStr(Date()),
                   uf_DateToStr(Time(),'HH:MM:SS'),
                   QuotedStr(Desc),
                   IntToStr(glRecBranch.ActNo),
                   QuotedStr(glRecBranch.MandPersPins),
                   QuotedStr(glRecBranch.MandPersCards),
                   QuotedStr(glRecBranch.MandPostPins),
                   QuotedStr(glRecBranch.MandPostCards),
                   QuotedStr(glRecBranch.MandNoPins),
                   QuotedStr(glRecBranch.MandNoCards),
                   uf_DateToStr(glRecBranch.MandDatePins),
                   uf_DateToStr(glRecBranch.MandDateCards),
                   QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 80))]);
    try
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      DMain.ADCon.StartTransaction;
      DMain.ADCon.ExecSQL(Cmd);
      DMain.ADCon.Commit;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Добавление нового пакета', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('S_IssHeads',
                  ['Branch','Description','ActNo',
                   'MandPersPins','MandPersCards',
                   'MandPostPins','MandPostCards',
                   'MandNoPins','MandNoCards',
                   'MandDatePins','MandDateCards',
                   'Remark'],
                  [VarToStr(edtBranch.KeyValue),
                   QuotedStr(Copy(VarToStr(edtDescription.Value), 1, 50)),
                   VarToStr(edtActNo.Value),
                   QuotedStr(Copy(VarToStr(edtMandPersPins.Value), 1, 50)),
                   QuotedStr(Copy(VarToStr(edtMandPersCards.Value), 1, 50)),
                   QuotedStr(Copy(VarToStr(edtMandPostPins.Value), 1, 80)),
                   QuotedStr(Copy(VarToStr(edtMandPostCards.Value), 1, 80)),
                   QuotedStr(Copy(VarToStr(edtMandNoPins.Value), 1, 15)),
                   QuotedStr(Copy(VarToStr(edtMandNoCards.Value), 1, 15)),
                   uf_DateToStr(edtMandDatePins.Value),
                   uf_DateToStr(edtMandDateCards.Value),
                   QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 80))],
                  'RRowID = '+IntToStr(RPackID));
    try
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      DMain.ADCon.StartTransaction;
      DMain.ADCon.ExecSQL(Cmd);
      DMain.ADCon.Commit;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Изменение пакета', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatIssHead.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
