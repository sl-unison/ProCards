unit DatSetSign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrlsEh, Mask;

type
  TfrmDatSetSign = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    edtIsIssued: TDBCheckBoxEh;
    edtIsGotPins: TDBCheckBoxEh;
    edtIsGotCards: TDBCheckBoxEh;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsIssued: Boolean;
    IsGotPins: Boolean;
    IsGotCards: Boolean;
  end;

var
  frmDatSetSign: TfrmDatSetSign;

implementation



{$R *.dfm}

procedure TfrmDatSetSign.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatSetSign.btnSaveClick(Sender: TObject);
begin
  IsIssued   := edtIsIssued.Checked;
  IsGotPins  := edtIsGotPins.Checked;
  IsGotCards := edtIsGotCards.Checked;
  ModalResult := mrOk;
end;

end.
