unit DlgLoadFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, ComCtrls, Mask, DBLookupEh;

type
  TfrmDlgLoadFiles = class(TForm)
    Panel1: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtLoadPath: TDBEditEh;
    edtLoadMask: TDBEditEh;
    edtLoadBack: TDBEditEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtFileNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlgLoadFiles: TfrmDlgLoadFiles;

implementation




{$R *.dfm}

procedure TfrmDlgLoadFiles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmDlgLoadFiles.btnSaveClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfrmDlgLoadFiles.btnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmDlgLoadFiles.edtFileNameEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var oDlg: TOpenDialog;
begin
   oDlg := TOpenDialog.Create(Owner);
   Try
      oDlg.Filter := 'Файл издания *.dbf|*.dbf';
      if oDlg.Execute then
         Self.edtLoadPath.Text := ExtractFilePath(oDlg.FileName);
   finally
      oDlg.Free;
   end;
end;

end.
