unit ImpDatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, ExtCtrls, StdCtrls, Buttons,
  DBGridEh, ComCtrls, SMIWiz,
  DBAxisGridsEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, SMIBase, EhLibVCL, GridsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions;

type
  TfrmImpDatas = class(TForm)
    ActionList1: TActionList;
    acPackImport: TAction;
    acPackDelete: TAction;
    acQuit: TAction;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    acClose: TAction;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    PageCtrlMain: TPageControl;
    TSheetPackets: TTabSheet;
    TSheetLog: TTabSheet;
    TSheetInfo: TTabSheet;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    LogPackets: TMemo;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    Panel6: TPanel;
    LineInfo: TMemo;
    BitBtn8: TBitBtn;
    acPackProcess: TAction;
    ProgBar: TProgressBar;
    acMemoSave: TAction;
    SMImpDlg: TSMIWizardDlg;
    BitBtn2: TBitBtn;
    acPackEmpty: TAction;
    srImpDatas: TDataSource;
    tbImpDatas: TFDQuery;
    tbImpDatasClientID: TIntegerField;
    tbImpDatasClientName: TWideStringField;
    tbImpDatasClientLatName: TWideStringField;
    tbImpDatasClientPasspNo: TWideStringField;
    tbImpDatasCardNo: TWideStringField;
    tbImpDatasCardProduct: TIntegerField;
    tbImpDatasCardDateInput: TWideStringField;
    tbImpDatasCardDateExpire: TWideStringField;
    tbImpDatasCardNameOn: TWideStringField;
    tbImpDatasCardServCode: TWideStringField;
    tbImpDatasAccountNo: TWideStringField;
    tbImpDatasFNameOrig: TWideStringField;
    tbImpDatasRRowID: TFDAutoIncField;
    procedure acCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acPackProcessExecute(Sender: TObject);
    procedure acPackDeleteExecute(Sender: TObject);
    procedure acMemoSaveExecute(Sender: TObject);
    procedure acPackImportExecute(Sender: TObject);
    procedure SMImpDlgBeforeExecute(Sender: TObject);
    procedure SMImpDlgErrorEvent(Sender: TObject; Error: Exception;
      var Abort: Boolean);
    procedure SMImpDlgGetCellParams(Sender: TObject; Field: TField;
      var Value: Variant);
    procedure acPackEmptyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    RPackID: Integer;
  end;

var
  frmImpDatas: TfrmImpDatas;

implementation

uses DBDatas, Globals;

{$R *.dfm}

procedure TfrmImpDatas.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpDatas.FormClose(Sender: TObject; var Action: TCloseAction);
var Cmd: String;
begin
  try
    Cmd := 'Delete from P_ImpDatas';
    DMain.ADCon.ExecSQL(Cmd);
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Обработка пакета импорта. Закрытие окна импорта', E, Cmd));
  end;
end;

procedure TfrmImpDatas.FormShow(Sender: TObject);
begin
  PageCtrlMain.ActivePageIndex := 0;

  if tbImpDatas.Active then tbImpDatas.Close;
  tbImpDatas.Open;
end;

procedure TfrmImpDatas.acPackProcessExecute(Sender: TObject);
var Cmd, CardNo: String;
var P, RecID: Integer;
begin
  if tbImpDatas.IsEmpty then Exit;

  P := 0;
  tbImpDatas.First;
  while not tbImpDatas.Eof do
  begin
    RecID := tbImpDatas.FieldByName('RRowID').AsInteger;
    CardNo := uf_GetMaskedCardNo(tbImpDatas.FieldByName('CardNo').AsString);
    Cmd := SqlInsert('S_IssDetails',
                      ['RPackID','ClientID', 'ClientName', 'ClientLatName',
                       'ClientPasspNo', 'CardNo', 'CardProduct',
                       'CardDateInput', 'CardDateExpire', 'CardNameOn',
                       'CardServCode', 'AccountNo'],
                      [IntToStr(RPackID),
                       IntToStr(tbImpDatas['ClientID']),
                       QuotedStr(VarToStr(tbImpDatas['ClientName'])),
                       QuotedStr(VarToStr(tbImpDatas['ClientLatName'])),
                       QuotedStr(VarToStr(tbImpDatas['ClientPasspNo'])),
                       QuotedStr(CardNo),
                       QuotedStr(VarToStr(tbImpDatas['CardProduct'])),
                       QuotedStr(VarToStr(tbImpDatas['CardDateInput'])),
                       QuotedStr(VarToStr(tbImpDatas['CardDateExpire'])),
                       QuotedStr(VarToStr(tbImpDatas['CardNameOn'])),
                       QuotedStr(VarToStr(tbImpDatas['CardServCode'])),
                       QuotedStr(VarToStr(tbImpDatas['AccountNo']))]);
    try
      DMain.ADCon.ExecSQL(Cmd);
      Cmd := 'Delete from P_ImpDatas Where RRowID = '+IntToStr(RecID);
      DMain.ADCon.ExecSQL(Cmd);
    except
      on E: Exception do
      begin
        LogPackets.Lines.Add(E.Message);
        ShowMessage(uf_ErrorToLog('Обработка пакета импорта', E, Cmd));
      end;
    end;
    tbImpDatas.Next;
  end;
  tbImpDatas.Close;
  tbImpDatas.Open;
end;

procedure TfrmImpDatas.acPackDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if tbImpDatas.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',
                mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbImpDatas.FieldByName('RRowID').AsInteger;
    Cmd := 'Delete from P_ImpDatas Where RRowID = '+IntToStr(R);
    DMain.ADCon.ExecSQL(Cmd);
    tbImpDatas.Prior;
    if (not tbImpDatas.Bof) then
        R := tbImpDatas.FieldByName('RRowID').AsInteger;
    tbImpDatas.Close;
    tbImpDatas.Open;
    tbImpDatas.Locate('RRowID', R, []);
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Таблица импорта данных. Удаление записи', E, Cmd));
  end;
end;

procedure TfrmImpDatas.acMemoSaveExecute(Sender: TObject);
var ODlg: TSaveDialog;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then LineInfo.Lines.SaveToFile(ODlg.FileName);
  finally
    ODlg.Free;
  end;
end;

procedure TfrmImpDatas.acPackImportExecute(Sender: TObject);
begin
  SMImpDlg.Execute;
end;

procedure TfrmImpDatas.SMImpDlgBeforeExecute(Sender: TObject);
begin
  LogPackets.Clear;
end;

procedure TfrmImpDatas.SMImpDlgErrorEvent(Sender: TObject;
  Error: Exception; var Abort: Boolean);
begin
  if LogPackets.Lines.Count < 30000 then
     LogPackets.Lines.Add(Error.Message);
end;

procedure TfrmImpDatas.SMImpDlgGetCellParams(Sender: TObject;
  Field: TField; var Value: Variant);
begin
  if LogPackets.Lines.Count < 30000 then
     LogPackets.Lines.Add(Field.FieldName + ' = ' + VarToStr(Value));
end;

procedure TfrmImpDatas.acPackEmptyExecute(Sender: TObject);
begin
  if MessageDlg('Вы уверены что хотите очистить таблицу импорта?',
                mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

//  tbImpDatas.EmptyTable;
end;

end.
