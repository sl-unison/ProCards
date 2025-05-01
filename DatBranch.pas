unit DatBranch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DBCtrlsEh, Mask;

type
  TfrmDatBranch = class(TForm)
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    PageCtrl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    edtCode: TDBNumberEditEh;
    edtName: TDBEditEh;
    edtMandPersPins: TDBEditEh;
    edtMandPostPins: TDBEditEh;
    edtMandNoPins: TDBEditEh;
    edtMandPersCards: TDBEditEh;
    edtMandPostCards: TDBEditEh;
    edtMandNoCards: TDBEditEh;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtMandDatePins: TDBDateTimeEditEh;
    edtMandDateCards: TDBDateTimeEditEh;
    Label11: TLabel;
    Label12: TLabel;
    edtNameShort: TDBEditEh;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtFilesPath: TDBEditEh;
    edtFilesMask: TDBEditEh;
    edtFilesBack: TDBEditEh;
    Label16: TLabel;
    Label17: TLabel;
    edtPersPinEmail: TDBEditEh;
    edtPersCardEmail: TDBEditEh;
    edtActNo: TDBNumberEditEh;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    Code: Integer;
  end;

var
  frmDatBranch: TfrmDatBranch;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatBranch.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus <> RS_INSERT) and (RecStatus <> RS_EDIT) then Exit;

  if (Trim(edtCode.Text) = '') then
      raise Exception.Create('Не введен код филиала');

  if (Trim(edtName.Text) = '') then
      raise Exception.Create('Не введено название филиала');

  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SQLInsert('R_Branches',
                    ['Code','Name','NameShort','ActNo',
                     'MandPersPins','MandPersCards',
                     'MandPostPins','MandPostCards',
                     'MandNoPins','MandNoCards',
                     'MandDatePins','MandDateCards',
                     'PersPinEmail','PersCardEmail',
                     'FilesPath','FilesMask','FilesBack'],
                    [VarToStr(edtCode.Value),
                     QuotedStr(Copy(VarToStr(edtName.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtNameshort.Value), 1, 20)),
                     VarToStr(edtActNo.Value),
                     QuotedStr(Copy(VarToStr(edtMandPersPins.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtMandPersCards.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtMandPostPins.Value), 1, 80)),
                     QuotedStr(Copy(VarToStr(edtMandPostCards.Value), 1, 80)),
                     QuotedStr(Copy(VarToStr(edtMandNoPins.Value), 1, 15)),
                     QuotedStr(Copy(VarToStr(edtMandNoCards.Value), 1, 15)),
                     uf_DateToStr(edtMandDatePins.Value),
                     uf_DateToStr(edtMandDateCards.Value),
                     QuotedStr(Copy(VarToStr(edtPersPinEmail.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtPersCardEmail.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtFilesPath.Value), 1, 80)),
                     QuotedStr(Copy(VarToStr(edtFilesMask.Value), 1, 25)),
                     QuotedStr(Copy(VarToStr(edtFilesBack.Value), 1, 80))]);
    try
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      DMain.ADCon.StartTransaction;
      DMain.ADCon.ExecSQL(Cmd);
      DMain.ADCon.Commit;
      Code := edtCode.Value;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Справочник филиалов. Ввод новой записи', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_Branches',
                    ['Code','Name','NameShort','ActNo',
                     'MandPersPins','MandPersCards',
                     'MandPostPins','MandPostCards',
                     'MandNoPins','MandNoCards',
                     'MandDatePins','MandDateCards',
                     'PersPinEmail','PersCardEmail',
                     'FilesPath','FilesMask','FilesBack'],
                    [VarToStr(edtCode.Value),
                     QuotedStr(Copy(VarToStr(edtName.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtNameshort.Value), 1, 20)),
                     VarToStr(edtActNo.Value),
                     QuotedStr(Copy(VarToStr(edtMandPersPins.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtMandPersCards.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtMandPostPins.Value), 1, 80)),
                     QuotedStr(Copy(VarToStr(edtMandPostCards.Value), 1, 80)),
                     QuotedStr(Copy(VarToStr(edtMandNoPins.Value), 1, 15)),
                     QuotedStr(Copy(VarToStr(edtMandNoCards.Value), 1, 15)),
                     uf_DateToStr(edtMandDatePins.Value),
                     uf_DateToStr(edtMandDateCards.Value),
                     QuotedStr(Copy(VarToStr(edtPersPinEmail.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtPersCardEmail.Value), 1, 50)),
                     QuotedStr(Copy(VarToStr(edtFilesPath.Value), 1, 80)),
                     QuotedStr(Copy(VarToStr(edtFilesMask.Value), 1, 25)),
                     QuotedStr(Copy(VarToStr(edtFilesBack.Value), 1, 80))],
                     'Code = '+IntToStr(Code));
    try
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      DMain.ADCon.StartTransaction;
      DMain.ADCon.ExecSQL(Cmd);
      DMain.ADCon.Commit;
      Code := edtCode.Value;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Справочник филиалов. Редактирование записи', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatBranch.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatBranch.FormShow(Sender: TObject);
begin
  PageCtrl.ActivePageIndex := 0;
end;

end.
