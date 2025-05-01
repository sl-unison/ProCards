unit IssDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, StdCtrls, Mask, ComCtrls,
  Buttons, ExtCtrls, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, cxGridExportLink, ComObj,
  cxGridPopupMenu, cxNavigator, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxGridCustomPopupMenu, cxClasses,
  cxGridCustomView, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Actions;

type
  TfrmIssDetails = class(TForm)
    ActionList1: TActionList;
    acLoadFile: TAction;
    acGridBestFit: TAction;
    acExportDatas: TAction;
    acGridExcel: TAction;
    PageCtrlMain: TPageControl;
    TSheetRecords: TTabSheet;
    Panel1: TPanel;
    TSheetLog: TTabSheet;
    Panel3: TPanel;
    LogPackets: TMemo;
    TSheetInfo: TTabSheet;
    Panel4: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Panel7: TPanel;
    LineInfo: TMemo;
    cxGridIssDetails: TcxGrid;
    btvIssDetails: TcxGridDBTableView;
    btvIssDetailsClientID: TcxGridDBColumn;
    btvIssDetailsClientName: TcxGridDBColumn;
    btvIssDetailsClientLatName: TcxGridDBColumn;
    btvIssDetailsClientPasspNo: TcxGridDBColumn;
    btvIssDetailsCardNo: TcxGridDBColumn;
    btvIssDetailsCardProduct: TcxGridDBColumn;
    btvIssDetailsCardDateInput: TcxGridDBColumn;
    btvIssDetailsCardDateExpire: TcxGridDBColumn;
    btvIssDetailsCardNameOn: TcxGridDBColumn;
    btvIssDetailsCardServCode: TcxGridDBColumn;
    btvIssDetailsAccountNo: TcxGridDBColumn;
    btvIssDetailsFNameOrig: TcxGridDBColumn;
    btvIssDetailsFNameDiv: TcxGridDBColumn;
    cxGridIssDetailsLevel1: TcxGridLevel;
    btvIssDetailsRRowID: TcxGridDBColumn;
    acDelete: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    btvIssDetailsCardProductName: TcxGridDBColumn;
    btvIssDetailsCardCost: TcxGridDBColumn;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    acClose: TAction;
    srIssDetails: TDataSource;
    tbIssDetails: TFDQuery;
    tbIssDetailsRRowID: TIntegerField;
    tbIssDetailsRPackID: TIntegerField;
    tbIssDetailsClientID: TIntegerField;
    tbIssDetailsClientName: TWideStringField;
    tbIssDetailsClientLatName: TWideStringField;
    tbIssDetailsClientPasspNo: TWideStringField;
    tbIssDetailsCardNo: TWideStringField;
    tbIssDetailsCardProduct: TWideStringField;
    tbIssDetailsCardProductName: TWideStringField;
    tbIssDetailsCardProductCost: TCurrencyField;
    tbIssDetailsCardCost: TCurrencyField;
    tbIssDetailsCardDateInput: TWideStringField;
    tbIssDetailsCardDateExpire: TWideStringField;
    tbIssDetailsCardNameOn: TWideStringField;
    tbIssDetailsCardServCode: TWideStringField;
    tbIssDetailsAccountNo: TWideStringField;
    tbIssDetailsFNameOrig: TWideStringField;
    tbIssDetailsFNameDiv: TWideStringField;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    BitBtn3: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    CategoryPanel2: TCategoryPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    acSelectAll: TAction;
    acChangeCost: TAction;
    ProgrBar: TProgressBar;
    Label1: TLabel;
    edtCardCost: TDBNumberEditEh;
    procedure acLoadFileExecute(Sender: TObject);
    procedure acGridBestFitExecute(Sender: TObject);
    procedure acGridExcelExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acSelectAllExecute(Sender: TObject);
    procedure acChangeCostExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RPackID: Integer;
    FilesPath,
    FilesMask,
    FilesBack: String;
    PackDate: Variant;
  end;

var
  frmIssDetails: TfrmIssDetails;

implementation

uses
  DBDatas, Globals, DlgLoadFiles;

{$R *.dfm}

procedure TfrmIssDetails.acLoadFileExecute(Sender: TObject);
var FPath, FMask, FBack, FName, SDir: String;
var SearchRec: TSearchRec;
var Cmd, SDBeg, SDEnd, Prod: String;
var i: Integer;
var SList, CList: TStrings;
begin
  if (FilesPath = '') then FilesPath := glSetup.ExcPath;
  if (FilesMask = '') then FilesMask := '*.txt';
  if (FilesBack = '') then FilesBack := glSetup.BckPath;

  frmDlgLoadFiles := TFrmDlgLoadFiles.Create(Owner);
  try
    frmDlgLoadFiles.edtLoadPath.Text := FilesPath;
    frmDlgLoadFiles.edtLoadBack.Text := FilesBack;
    frmDlgLoadFiles.edtLoadMask.Text := FilesMask;
    if (frmDlgLoadFiles.ShowModal <> mrOk) then Exit;

    FPath := uf_AddSlash(Trim(frmDlgLoadFiles.edtLoadPath.Text));
    FMask := Trim(frmDlgLoadFiles.edtLoadMask.Text);
    FBack := uf_AddSlash(Trim(frmDlgLoadFiles.edtLoadBack.Text));
  finally
    frmDlgLoadFiles.Free;
  end;

  if not VarIsNull(PackDate) then
  begin
    SDir := FormatDateTime('YYYY',PackDate)+'\'+
            FormatDateTime('MM',PackDate)+'\'+
            FormatDateTime('YYYYMMDD',PackDate);
    if (not FileExists(FBack + SDir)) then
        begin
          if (ForceDirectories(FBack + SDir)) then
              FBack := FBack + uf_AddSlash(SDir);
        end
    else
        FBack := FBack + uf_AddSlash(SDir);
  end;
  if FindFirst(FPath + FMask, faAnyFile, SearchRec) = 0 then
  begin
    CList := TStringList.Create;
    SList := TStringList.Create;
    try
      repeat
        FName := FPath + SearchRec.Name;
        SList.LoadFromFile(FName);
        i := 0;
        while i < SList.Count do
        begin
          uf_StrToList(Trim(SList.Strings[i]), '|', CList);
          SDBeg := Copy(CList.Strings[3], 1, 2) + '/' + Copy(CList.Strings[3], 3, 2);
          SDEnd := Copy(CList.Strings[4], 1, 2) + '/' + Copy(CList.Strings[4], 3, 2);
          Prod := Copy(CList.Strings[1], 1, 6);
          Cmd := SqlInsert('S_IssDetails',
                          ['RPackID','ClientID',
                           'ClientName','ClientLatName','ClientPasspNo',
                           'CardNo','CardProduct','CardDateInput','CardDateExpire',
                           'CardNameOn','CardServCode','AccountNo','FNameOrig'],
                          [IntToStr(RPackID),
                           CList.Strings[0],
                           QuotedStr(Copy(CList.Strings[9], 1, 50)),  // ClientName
                           QuotedStr(Copy(CList.Strings[6], 1, 50)),  // ClientLatName
                           QuotedStr(Copy(CList.Strings[10], 1, 15)),  // ClientPasspNo
                           QuotedStr(Copy(CList.Strings[1], 1, 20)),   // CardNo
                           QuotedStr(Prod),
                           QuotedStr(Copy(SDBeg, 1, 5)),              // CardDateInput
                           QuotedStr(Copy(SDEnd, 1, 5)),              // CardDateExpire
                           QuotedStr(Copy(CList.Strings[5], 1, 50)),  // CardNameOn
                           QuotedStr(Copy(CList.Strings[7], 1, 3)),
                           QuotedStr(Copy(CList.Strings[12], 1, 20)), // AccountNo
                           QuotedStr(Copy(SearchRec.Name, 1, 25))]);
          DMain.ADCon.ExecSQL(Cmd);
          i := i + 1;
        end;
        Cmd := 'Update S_IssDetails Set CardCost = '+
                              '(Select Cost from R_CardProducts '+
                                'Where Code = S_IssDetails.CardProduct) '+
                            'Where RPackID = '+IntToStr(RPackID);
        DMain.ADCon.ExecSQL(Cmd);
        if (SList.Count > 15) then
        begin

        end;
        CopyFile(PChar(uf_AddSlash(FPath) + SearchRec.Name),
                 PChar(uf_AddSlash(FBack) + SearchRec.Name), False);
        if FileExists(uf_AddSlash(FBack) + SearchRec.Name) then
           DeleteFile(uf_AddSlash(FPath) + SearchRec.Name);
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    finally
      CList.Free;
      SList.Free;
    end;
  end;
  if tbIssDetails.Active then tbIssDetails.Close;
  tbIssDetails.Open;
end;

procedure TfrmIssDetails.acSelectAllExecute(Sender: TObject);
begin
  btvIssDetails.DataController.SelectAll;
end;

procedure TfrmIssDetails.FormShow(Sender: TObject);
var Cmd: String;
begin
  try
    tbIssDetails.Close;
    Cmd := 'Select * from V_IssDetails Where RPackID = '+IntToStr(RPackID);
    tbIssDetails.Open(Cmd);
  except
    on E: Exception do
    begin
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      ShowMessage(uf_ErrorToLog('Записи пакета. Открытие формы', E, Cmd));
    end;
  end;
end;

procedure TfrmIssDetails.acGridBestFitExecute(Sender: TObject);
begin
  btvIssDetails.ApplyBestFit();
end;

procedure TfrmIssDetails.acGridExcelExecute(Sender: TObject);
var ODlg: TSaveDialog;
var obXL: Variant;
var Wb: Variant;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then
    begin
      ExportGridToExcel(ODlg.FileName, cxGridIssDetails );
      obXL := CreateOleObject('Excel.Application');
      obXL.Visible := True;
      Wb := obXL.WorkBooks.Open(ODlg.FileName);
    end;
  finally
    ODlg.Free;
  end;
end;

procedure TfrmIssDetails.acChangeCostExecute(Sender: TObject);
var Cmd: String;
var Count, R, i: Integer;
begin
  if (btvIssDetails.Controller.SelectedRecordCount = 0) then
  begin
    MessageDlg('Пожалуйста, выберите записи', mtInformation,[mbOk],0);
    Exit;
  end;

  if (Trim(edtCardCost.Text) = '') then
      raise Exception.Create('Пожалуйста, введите новую стоимость');

  try
    Count := btvIssDetails.Controller.SelectedRecordCount - 1;

    ProgrBar.Max := Count;
    for i := 0 to Count do
    begin
      btvIssDetails.Controller.SelectedRows[i].Focused := True;
      R := tbIssDetails.FieldByName('RRowID').AsInteger;
      Cmd := SQLUpdate(TBS_ISSDETAILS,
                      ['CardCost'],
                      [uf_VarToStr(edtCardCost.Value)],
                      'RRowID = '+IntToStr(R));
      DMain.ADCon.ExecSQL(Cmd);
      ProgrBar.Position := i;
    end;
    tbIssDetails.Close;
    tbIssDetails.Open;
    tbIssDetails.Locate('RRowID', R, []);
  except
    on E: Exception do
    begin
      ShowMessage(uf_ErrorToLog('Изменение стоимости карт', E, Cmd));
    end;
  end;
end;

procedure TfrmIssDetails.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmIssDetails.acDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if tbIssDetails.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный пакет?',mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  R := tbIssDetails.FieldByName('RRowID').AsInteger;
  try
    Cmd := 'Delete from S_IssDetails Where RRowID = '+IntToStr(R);
    DMain.ADCon.ExecSQL(Cmd);
  except
    on E: Exception do
      ShowMessage(uf_ErrorToLog('Записи пакета. Удаление записи', E, Cmd));
  end;

  if tbIssDetails.Active then tbIssDetails.Close;
  tbIssDetails.Open;
end;

end.
