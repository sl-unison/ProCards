unit DatUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, ComCtrls,
  DB, Vcl.Mask;

type
  TfrmDatUser = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    PageCtrl: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtIsBlocked: TDBCheckBoxEh;
    edtLogin: TDBEditEh;
    edtUserName: TDBEditEh;
    edtRemark: TDBEditEh;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    Login: String;
  end;

var
  frmDatUser: TfrmDatUser;

implementation

uses DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatUser.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SQLInsert('R_Users',
                    ['Login','UserName','IsBlocked',
                     'Remark'],
                    [QuotedStr(Copy(VarToStr(edtLogin.Value), 1, 20)),
                     QuotedStr(Copy(VarToStr(edtUserName.Value), 1, 50)),
                     BoolToStr(edtIsBlocked.Checked),
                     QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 100))]);
    try
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      DMain.ADCon.StartTransaction;
      DMain.ADCon.ExecSQL(Cmd);
      DMain.ADCon.Commit;
      Login := edtLogin.Text;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Новый пользователь. Ввод нового пользователя', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_Users',
                    ['UserName','IsBlocked', 'Remark'],
                    [QuotedStr(Copy(VarToStr(edtUserName.Value), 1, 50)),
                     BoolToStr(edtIsBlocked.Checked),
                     QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 100))],
                    'Login = '+QuotedStr(Login));
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
        ShowMessage(uf_ErrorToLog('Редактирование пользователя', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatUser.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatUser.FormShow(Sender: TObject);
begin
  PageCtrl.ActivePageIndex := 0;
end;

end.
