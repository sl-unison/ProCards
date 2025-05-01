unit DatForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB;

type
  TfrmDatForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DSet: TDataSet;
  end;

var
  frmDatForm: TfrmDatForm;

implementation



{$R *.dfm}

procedure TfrmDatForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmDatForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DSet.Modified then
  begin
     if MessageDlg('Данные изменены. Вы действительно хотите отменить изменения?',mtWarning,[mbYes,mbNo],0) = mrNo then
     begin
        CanClose := False;
        Exit;
     end;
  end;
  DSet.Cancel;
  CanClose := True;
end;

procedure TfrmDatForm.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDatForm.btnSaveClick(Sender: TObject);
begin
  if DSet.Modified then
       DSet.Post
  else DSet.Cancel;
  Close;
end;

end.
