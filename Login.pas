unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, IniFiles, Globals,
  dxGDIPlusClasses;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    Panel4: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPassword: TEdit;
    edtUser: TEdit;
    Panel6: TPanel;
    txtSoftName: TLabel;
    Panel3: TPanel;
    btnAccept: TBitBtn;
    btnCansel: TBitBtn;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCanselClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses DBDatas;

{$R *.dfm}

procedure TfrmLogin.btnAcceptClick(Sender: TObject);
var isConn: Boolean;
var lvDbase: String;
begin
  try
    isConn := True;
    lvDbase := glSetup.DbfPath + C_DATADIC;
    DMain.ADCon.Params.Clear;
    DMain.ADCon.Params.Values['DriverID']  := 'ADS';
    DMain.ADCon.Params.Values['Database']  := lvDbase;
    DMain.ADCon.Params.Values['User_Name'] := edtUser.Text;
    DMain.ADCon.Params.Values['Password']  := edtPassword.Text;
    DMain.ADCon.Params.Values['ADSAdvanced'] := 'TrimTrailingSpaces = True';
    DMain.ADCon.Connected := True;
  except on E: Exception do
    begin
      isConn := False;
      uf_ErrorToLog('Вход в программу. Путь к БД:'+DMain.ADCon.Params.Values['Database'], E);
      ShowMessage('Ошибка входа в программу: ' + E.Message);
    end;
  end;
  if isConn then ModalResult := mrOk;
end;

procedure TfrmLogin.btnCanselClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
