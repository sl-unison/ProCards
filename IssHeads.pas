unit IssHeads;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,
  DBLookupEh, DBCtrlsEh, StdCtrls, Mask, ComCtrls, Buttons, ExtCtrls,
  ActnList, cxGridExportLink, ComObj, WordXP, cxGridPopupMenu, IOUtils, Types,
  Menus, System.Generics.Collections,
  cxNavigator, DBGridEh, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData,cxGridCustomPopupMenu, cxClasses,
  cxGridCustomView, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Actions;

type
  TfrmIssHeads = class(TForm)
    Panel5: TPanel;
    ActionList1: TActionList;
    acSearch: TAction;
    acClose: TAction;
    acPackAdd: TAction;
    acPackEdit: TAction;
    acPackDelete: TAction;
    acPackDetails: TAction;
    acImpDatas: TAction;
    acActPin: TAction;
    acActCards: TAction;
    acGridBestFit: TAction;
    acGridExcel: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    acLoadFile: TAction;
    srIssHeads: TDataSource;
    acSetSign: TAction;
    acSearchClear: TAction;
    acSrvActions: TAction;
    acSrvSearch: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    MSExcel1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    acPackDelPeriod: TAction;
    tbIssHeads: TFDQuery;
    tbIssHeadsRRowID: TIntegerField;
    tbIssHeadsBranch: TIntegerField;
    tbIssHeadsBranchName: TWideStringField;
    tbIssHeadsBranchNameShort: TWideStringField;
    tbIssHeadsPackDate: TDateField;
    tbIssHeadsPackTime: TTimeField;
    tbIssHeadsTotCount: TIntegerField;
    tbIssHeadsDescription: TWideStringField;
    tbIssHeadsActNo: TIntegerField;
    tbIssHeadsMandPersPins: TWideStringField;
    tbIssHeadsMandPersCards: TWideStringField;
    tbIssHeadsMandPostPins: TWideStringField;
    tbIssHeadsMandPostCards: TWideStringField;
    tbIssHeadsMandNoPins: TWideStringField;
    tbIssHeadsMandNoCards: TWideStringField;
    tbIssHeadsMandDatePins: TDateField;
    tbIssHeadsMandDateCards: TDateField;
    tbIssHeadsIsIssued: TBooleanField;
    tbIssHeadsIsGotPins: TBooleanField;
    tbIssHeadsIsGotCards: TBooleanField;
    tbIssHeadsRemark: TWideStringField;
    tbIssHeadsPersPinEmail: TWideStringField;
    tbIssHeadsPersCardEmail: TWideStringField;
    tbIssHeadsFilesPath: TWideStringField;
    tbIssHeadsFilesMask: TWideStringField;
    tbIssHeadsFilesBack: TWideStringField;
    Panel1: TPanel;
    cxGridIssHeads: TcxGrid;
    btvIssHeads: TcxGridDBTableView;
    btvIssHeadsRRowID: TcxGridDBColumn;
    btvIssHeadsIsIssued: TcxGridDBColumn;
    btvIssHeadsIsGotPins: TcxGridDBColumn;
    btvIssHeadsIsGotCards: TcxGridDBColumn;
    btvIssHeadsBranch: TcxGridDBColumn;
    btvIssHeadsBranchName: TcxGridDBColumn;
    btvIssHeadsBranchNameShort: TcxGridDBColumn;
    btvIssHeadsPackDate: TcxGridDBColumn;
    btvIssHeadsPackTime: TcxGridDBColumn;
    btvIssHeadsTotCount: TcxGridDBColumn;
    btvIssHeadsDescription: TcxGridDBColumn;
    btvIssHeadsActNo: TcxGridDBColumn;
    btvIssHeadsMandPersPins: TcxGridDBColumn;
    btvIssHeadsMandPersCards: TcxGridDBColumn;
    btvIssHeadsMandPostPins: TcxGridDBColumn;
    btvIssHeadsMandPostCards: TcxGridDBColumn;
    btvIssHeadsMandNoPins: TcxGridDBColumn;
    btvIssHeadsMandNoCards: TcxGridDBColumn;
    btvIssHeadsMandDatePins: TcxGridDBColumn;
    btvIssHeadsMandDateCards: TcxGridDBColumn;
    btvIssHeadsRemark: TcxGridDBColumn;
    btvIssHeadsFilesPath: TcxGridDBColumn;
    btvIssHeadsFilesMask: TcxGridDBColumn;
    btvIssHeadsFilesBack: TcxGridDBColumn;
    btvIssHeadsPersPinEmail: TcxGridDBColumn;
    btvIssHeadsPersCardEmail: TcxGridDBColumn;
    cxGridIssHeadsLevel1: TcxGridLevel;
    ProgressBar1: TProgressBar;
    acBranchCardsCount: TAction;
    acAktCardsAcc: TAction;
    PnlSearch: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Label4: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    edtBegDate: TDBDateTimeEditEh;
    edtEndDate: TDBDateTimeEditEh;
    edtBranch: TDBLookupComboboxEh;
    pnlActions: TCategoryPanelGroup;
    CategoryPanel3: TCategoryPanel;
    BitBtn13: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn5: TBitBtn;
    CategoryPanel2: TCategoryPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    CategoryPanel1: TCategoryPanel;
    BitBtn12: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn17: TBitBtn;
    CategoryPanel4: TCategoryPanel;
    BitBtn14: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn16: TBitBtn;
    procedure acSearchExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acPackAddExecute(Sender: TObject);
    procedure acPackEditExecute(Sender: TObject);
    procedure acPackDeleteExecute(Sender: TObject);
    procedure acPackDetailsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acImpDatasExecute(Sender: TObject);
    procedure acActPinExecute(Sender: TObject);
    procedure acActCardsExecute(Sender: TObject);
    procedure acGridBestFitExecute(Sender: TObject);
    procedure acGridExcelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acLoadFileExecute(Sender: TObject);
    procedure acSetSignExecute(Sender: TObject);
    procedure acSearchClearExecute(Sender: TObject);
    procedure acSrvActionsExecute(Sender: TObject);
    procedure acSrvSearchExecute(Sender: TObject);
    procedure acPackDelPeriodExecute(Sender: TObject);
    procedure acBranchCardsCountExecute(Sender: TObject);
    procedure acAktCardsAccExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FilesPath,
    FilesMask,
    FilesBack: String;
  end;

var
  frmIssHeads: TfrmIssHeads;

implementation

uses
  DBDatas, DatIssHead, Globals, IssDetails, ImpDatas, uu_StrDatas, DlgLoadFiles,
  DatSetSign, DlgPeriod, R_Reports;

{$R *.dfm}

function uf_WordReplace(W: Variant; AFindText, AReplace: String): Boolean;
begin
  Result := False;
  try
    W.Selection.Find.Text := AFindText;
    W.Selection.Find.Replacement.Text:= AReplace;
    Result := W.Selection.Find.Execute(Replace:=wdReplaceAll);
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage(uf_ErrorToLog('Замена слов в шаблоне Word', E));
    end;
  end;
end;

function uf_TableAddRow(ATbl: Variant; var Ai: Integer): Boolean;
var Row: Variant;
begin
  Result := False;
  try
    Ai := Ai + 1;
    Row := ATbl.Rows.Item(Ai);
    ATbl.Rows.Add(Row);
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage(uf_ErrorToLog('Вставка новой строки в таблицу MS Word', E));
    end;
  end;
end;

function uf_TableWrite(ATbl: Variant; Ai: Integer; Ar: Integer; AText: String;
         IsBold: Boolean = False; ASize: Integer = 11): Boolean;
var Row: Variant;
begin
  Result := False;
  try
    ATbl.Cell(Ai,Ar).Range.Font.Bold := IsBold;
    ATbl.Cell(Ai,Ar).Range.Font.Size := ASize;
    ATbl.Cell(Ai,Ar).Range.Text := AText;
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage(uf_ErrorToLog('Запись текста в строку таблицы MS Word', E));
    end;
  end;
end;

procedure TfrmIssHeads.acSearchClearExecute(Sender: TObject);
begin
  edtBegDate.Value := null;
  edtEndDate.Value := null;
  edtBranch.Value  := null;
end;

procedure TfrmIssHeads.acSearchExecute(Sender: TObject);
var S, W, Cmd: String;
begin
  try
    if tbIssHeads.Active then tbIssHeads.Close;
    S := 'Select top '+IntToStr(glSetup.RecGetAmt)+' * from V_IssHeads ';
    W := '';
    if ((edtBegDate.Value) <> null) and ((edtEndDate.Value) <> null) then
       W := W + ' and (PackDate between '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd', edtBegDate.Value))+' and '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd', edtEndDate.Value))+')';
    if (edtBranch.KeyValue <> null) then
       W := W + ' and (Branch = '+VarToStr(edtBranch.KeyValue)+')';

    if W <> '' then W := ' Where ' + Copy(W, 5, Length(W));
    Cmd := S + W + ' Order by RRowID';
    tbIssHeads.SQL.Text := Cmd;
    tbIssHeads.Open;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Журнал операций. Поиск записей', E, Cmd));
  end;
end;

procedure TfrmIssHeads.acSetSignExecute(Sender: TObject);
var R, Count, i: Integer;
var IsIssued: Boolean;
var IsGotPins: Boolean;
var IsGotCards: Boolean;
var IsErr: Boolean;
var Cmd: String;
begin
  if tbIssHeads.IsEmpty then Exit;

  if btvIssHeads.Controller.SelectedRecordCount = 0 then
  begin
    ShowMessage('Выберите записи');
    Exit;
  end;

  frmDatSetSign := TfrmDatSetSign.Create(Owner);
  try
    if (frmDatSetSign.ShowModal <> mrOk) then Exit;
    IsIssued   := frmDatSetSign.IsIssued;
    IsGotPins  := frmDatSetSign.IsGotPins;
    IsGotCards := frmDatSetSign.IsGotCards;
  finally
    frmDatSetSign.Free;
  end;

  Count := btvIssHeads.Controller.SelectedRecordCount - 1;
  for i := 0 to Count do
  begin
    IsErr := False;
    try
      btvIssHeads.Controller.SelectedRows[i].Focused := True;
      R := tbIssHeads.FieldByName('RRowID').AsInteger;
      Cmd := SqlUpdate('S_IssHeads',
                      ['IsIssued','IsGotPins','IsGotCards'],
                      [BoolToStr(IsIssued, True),
                       BoolToStr(IsGotPins, True),
                       BoolToStr(IsGotCards, True)],
                      'RRowID = '+IntToStr(R));
      DMain.ADCon.ExecSQL(Cmd);
    except
      on E: Exception do
      begin
        IsErr := True;
        if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
        ShowMessage(uf_ErrorToLog('Установка статусей изд. пакета. Редактирование статусей изд. пакета', E, Cmd));
      end;
    end;
    if IsErr then
    begin
      if MessageDlg('В процессе операции произошла ошибка. Продолжить?',
                    mtWarning,[mbYes,mbNo],0) = mrYes then
         Break;
    end;
  end;
  tbIssHeads.Close;
  tbIssHeads.Open;
end;

procedure TfrmIssHeads.acSrvActionsExecute(Sender: TObject);
begin
  if pnlActions.Visible then
     pnlActions.Visible := False
  else
     pnlActions.Visible := True;
end;

procedure TfrmIssHeads.acSrvSearchExecute(Sender: TObject);
begin
  if pnlSearch.Visible then
     pnlSearch.Visible := False
  else
     pnlSearch.Visible := True;
end;

procedure TfrmIssHeads.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmIssHeads.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbIssHeads.Close;
  Action := caFree;
end;

procedure TfrmIssHeads.acPackAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatIssHead := TfrmDatIssHead.Create(Owner);
  try
    frmDatIssHead.RecStatus := RS_INSERT;
    if (frmDatIssHead.ShowModal <> mrOk) then Exit;

    R := frmDatIssHead.RPackID;
    if tbIssHeads.Active then tbIssHeads.Close;
    tbIssHeads.Open;
    tbIssHeads.Locate('RRowID', R, []);
  finally
    frmDatIssHead.Free;
  end;   
end;

procedure TfrmIssHeads.acPackEditExecute(Sender: TObject);
var R: Integer;
begin
  if tbIssHeads.IsEmpty then Exit;

  R := tbIssHeads['RRowID'];
  frmDatIssHead := TfrmDatIssHead.Create(Owner);
  try
    frmDatIssHead.RecStatus := RS_EDIT;
    frmDatIssHead.RPackID   := tbIssHeads['RRowID'];
    frmDatIssHead.edtBranch.KeyValue     := tbIssHeads['Branch'];
    frmDatIssHead.edtDescription.Value   := tbIssHeads['Description'];
    frmDatIssHead.edtRemark.Value        := tbIssHeads['Remark'];
    frmDatIssHead.edtActNo.Value         := tbIssHeads['ActNo'];
    frmDatIssHead.edtMandPersPins.Value  := tbIssHeads['MandPersPins'];
    frmDatIssHead.edtMandPersCards.Value := tbIssHeads['MandPersCards'];
    frmDatIssHead.edtMandPostPins.Value  := tbIssHeads['MandPostPins'];
    frmDatIssHead.edtMandPostCards.Value := tbIssHeads['MandPostCards'];
    frmDatIssHead.edtMandNoPins.Value    := tbIssHeads['MandNoPins'];
    frmDatIssHead.edtMandNoCards.Value   := tbIssHeads['MandNoCards'];
    frmDatIssHead.edtMandDatePins.Value  := tbIssHeads['MandDatePins'];
    frmDatIssHead.edtMandDateCards.Value := tbIssHeads['MandDateCards'];
    if (frmDatIssHead.ShowModal <> mrOk) then Exit;

    if tbIssHeads.Active then tbIssHeads.Close;
    tbIssHeads.Open;
    tbIssHeads.Locate('RRowID', R, []);
  finally
    frmDatIssHead.Free;
  end;
end;

procedure TfrmIssHeads.acPackDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if tbIssHeads.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный пакет?',
                mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbIssHeads.FieldByName('RRowID').AsInteger;
    if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
    DMain.ADCon.StartTransaction;
    Cmd := 'Delete from S_IssDetails Where RPackID = '+IntToStr(R);
    DMain.ADCon.ExecSQL(Cmd);
    Cmd := 'Delete from S_IssHeads Where RRowID = '+IntToStr(R);
    DMain.ADCon.ExecSQL(Cmd);
    DMain.ADCon.Commit;
    tbIssHeads.Prior;
    if not tbIssHeads.Bof then
       R := tbIssHeads.FieldByName('RRowID').AsInteger;
    tbIssHeads.Close;
    tbIssHeads.Open;
    tbIssHeads.Locate('RRowID', R, []);
  except
    on E: Exception do
    begin
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      ShowMessage(uf_ErrorToLog('Издательские пакеты. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmIssHeads.acPackDelPeriodExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
var DateBeg, DateEnd: TDateTime;
begin
  if MessageDlg('Вы уверены что хотите удалить пакеты за период?',mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  frmDlgPeriod := TFrmDlgPeriod.Create(Owner);
  try
    if frmDlgPeriod.ShowModal <> mrOk then Exit;
    DateBeg := frmDlgPeriod.dtSDate.Value;
    DateEnd := frmDlgPeriod.dtEDate.Value;
  finally
    frmDlgPeriod.Free;
  end;

  try
    R := tbIssHeads.FieldByName('RRowID').AsInteger;
    if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
    DMain.ADCon.StartTransaction;
    Cmd := 'Delete from S_IssDetails Where RPackID in (Select RRowID '+
                    'from S_IssHeads Where PackDate between '+
                    QuotedStr(FormatDateTime('yyyy-mm-dd', DateBeg))+' and '+
                    QuotedStr(FormatDateTime('yyyy-mm-dd', DateEnd))+')';
    DMain.ADCon.ExecSQL(Cmd);
    Cmd := 'Delete from S_IssHeads Where (PackDate between '+
                    QuotedStr(FormatDateTime('yyyy-mm-dd', DateBeg))+' and '+
                    QuotedStr(FormatDateTime('yyyy-mm-dd', DateEnd))+')';
    DMain.ADCon.ExecSQL(Cmd);
    DMain.ADCon.Commit;
    tbIssHeads.Prior;
    if not tbIssHeads.Bof then
       R := tbIssHeads.FieldByName('RRowID').AsInteger;
    tbIssHeads.Close;
    tbIssHeads.Open;
    tbIssHeads.Locate('RRowID', R, []);
  except
    on E: Exception do
    begin
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      ShowMessage(uf_ErrorToLog('Издательские пакеты. Удаление за период', E, Cmd));
    end;
  end;
end;

procedure TfrmIssHeads.acPackDetailsExecute(Sender: TObject);
var R: Integer;
var Branch, Desc: String;
begin
  if tbIssHeads.IsEmpty then Exit;

  R := tbIssHeads.FieldByName('RRowID').AsInteger;
  Branch := tbIssHeads.FieldByName('Branch').AsString;
  Desc   := tbIssHeads.FieldByName('Description').AsString;

  frmIssDetails := TfrmIssDetails.Create(Owner);
  try
    frmIssDetails.RPackID := R;
    frmIssDetails.PackDate  := tbIssHeads['PackDate'];
    frmIssDetails.FilesPath := VarToStr(tbIssHeads['FilesPath']);
    frmIssDetails.FilesMask := VarToStr(tbIssHeads['FilesMask']);
    frmIssDetails.FilesBack := VarToStr(tbIssHeads['FilesBack']);
    frmIssDetails.Caption   := frmIssDetails.Caption + '. Филиал: '+Branch+' '+Desc;
    frmIssDetails.ShowModal;
  finally
    frmIssDetails.Free;
  end;
end;

procedure TfrmIssHeads.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmIssHeads.acImpDatasExecute(Sender: TObject);
var R: Integer;
var UA: TTableAccesses;
begin
  if tbIssHeads.IsEmpty then Exit;

  uf_UserAccessTypes(TBS_ISSDETAILS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;

  R := tbIssHeads.FieldByName('RRowID').AsInteger;
  frmImpDatas := TfrmImpDatas.Create(Owner);
  try
    frmImpDatas.RPackID := R;
    frmImpDatas.acPackImport.Enabled := UA.IsAdd;
    frmImpDatas.acPackDelete.Enabled := UA.IsDelete;
    frmImpDatas.ShowModal;
  finally
    frmImpDatas.Free;
  end;
end;

procedure TfrmIssHeads.acLoadFileExecute(Sender: TObject);
var FPath, FMask, BckPath, FName, BName, SDir: String;
var RecList: TList<TRecCards>;
var FList: TStringDynArray;
var BList: TDictionary<String, String>;
var PfxList: TDictionary<String, String>;
var SList, CList: TStrings;
var Cmd, Branch, Key, Pfx, FNameDiv: String;
var RPackID, i, Count, FIdx: Integer;
var IsEnd, IsErr: Boolean;
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
    BckPath := uf_AddSlash(Trim(frmDlgLoadFiles.edtLoadBack.Text));
  finally
    frmDlgLoadFiles.Free;
  end;

  if not TDirectory.Exists(FPath) then
     raise Exception.Create('Не найдена директория: '+FPath);

  FList := TDirectory.GetFiles(FPath, FMask);
  RecList := TList<TRecCards>.Create;
  BList := TDictionary<String, String>.Create;
  PfxList := TDictionary<String, String>.Create;
  CList := TStringList.Create;
  SList := TStringList.Create;
  try
    for FName in FList do
    begin
      IsErr := False;
      try
        BName := BckPath + ExtractFileName(FName);
        SList.LoadFromFile(FName);
        i := 0;
        while i < SList.Count do
        begin
          uf_StrToList(Trim(SList.Strings[i]), '|', CList);
          glRecCard.ClientID       := CList.Strings[0];
          glRecCard.ClientName     := Copy(CList.Strings[9], 1, 50);
          glRecCard.ClientLatName  := Copy(CList.Strings[6], 1, 50);
          glRecCard.ClientPasspNo  := Copy(CList.Strings[10], 1, 15);
          glRecCard.CardNo         := Copy(CList.Strings[1], 1, 20);
          glRecCard.CardDateInput  := Copy(CList.Strings[3], 1, 2) + '/' + Copy(CList.Strings[3], 3, 2);
          glRecCard.CardDateExpire := Copy(CList.Strings[4], 1, 2) + '/' + Copy(CList.Strings[4], 3, 2);
          glRecCard.CardProduct    := uf_GetCardProductCode(CList.Strings[1]);
          glRecCard.CardNameOn     := Copy(CList.Strings[5], 1, 50);
          glRecCard.CardServCode   := Copy(CList.Strings[7], 1, 3);
          glRecCard.Branch         := Trim(Copy(CList.Strings[12], 1, 10));
          glRecCard.FNameOrig      := FName;
          glRecCard.AccountNo      := '';
          glRecCard.SrcLine        := SList.Strings[i];
          glRecCard.CardNo := uf_GetMaskedCardNo(glRecCard.CardNo);
          RecList.Add(glRecCard);
          if not BList.ContainsKey(glRecCard.Branch) then
             BList.Add(glRecCard.Branch, '');
          if not PfxList.ContainsKey(glRecCard.CardProduct) then
             PfxList.Add(glRecCard.CardProduct, '');
          i := i + 1;
        end;
        if glSetup.IsBackupFiles then
        begin
          TFile.Copy(FName, BName, False);
          if TFile.Exists(BName) then
             TFile.Delete(FName);
        end;
      except
        on E: Exception do
        begin
          IsErr := True;
          if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
          ShowMessage(uf_ErrorToLog('Обработка файла. Загрузка файла: '+FName, E, Cmd));
        end;
      end;
      if IsErr then
      begin
        if MessageDlg('В процессе операции произошла ошибка. Продолжить?',
                      mtWarning,[mbYes,mbNo],0) = mrNo then
           Break;
      end;
    end;
    for Key in BList.Keys do
    begin
      IsErr := False;
      try
        Branch := Key;
        FIdx := 1;
        if (not uf_GetBranchDatas(StrToInt(Branch))) then
            uf_WriteToLog('Невозможно получение данных по филиалу',['Филиал: '+Branch]);
        RPackID := uf_GetRecID('S_IssHeads');
        Cmd := SqlInsert('S_IssHeads',
                        ['RRowID','PackDate','PackTime','Branch','Description',
                         'ActNo', 'MandPersPins','MandPersCards',
                         'MandPostPins','MandPostCards',
                         'MandNoPins','MandNoCards',
                         'MandDatePins','MandDateCards'],
                        [IntToStr(RPackID),
                         uf_DateToStr(Date()),
                         uf_DateToStr(Time(),'HH:MM:SS'),
                         Branch,
                         QuotedStr(Branch+' - Издательский пакет'),
                         VarToStr(glRecBranch.ActNo),
                         QuotedStr(Copy(VarToStr(glRecBranch.MandPersPins), 1, 50)),
                         QuotedStr(Copy(VarToStr(glRecBranch.MandPersCards), 1, 50)),
                         QuotedStr(Copy(VarToStr(glRecBranch.MandPostPins), 1, 80)),
                         QuotedStr(Copy(VarToStr(glRecBranch.MandPostCards), 1, 80)),
                         QuotedStr(Copy(VarToStr(glRecBranch.MandNoPins), 1, 15)),
                         QuotedStr(Copy(VarToStr(glRecBranch.MandNoCards), 1, 15)),
                         uf_DateToStr(glRecBranch.MandDatePins),
                         uf_DateToStr(glRecBranch.MandDateCards)]);
        DMain.ADCon.ExecSQL(Cmd);
        Count := 0;
        CList.Clear;
        for Pfx in PfxList.Keys do
        begin
          for i := 0 to RecList.Count - 1 do
          begin
            IsEnd := (i = RecList.Count - 1);
            if (RecList.Items[i].Branch = Branch) and
               (RecList.Items[i].CardProduct = Pfx) then
            begin
              FNameDiv := glRecBranch.FilesPath;
              if (FNameDiv = '') then FNameDiv := glSetup.AppPath;
              FNameDiv := FNameDiv +
                          Branch + '_' + Pfx + '_' +
                          uf_FileBase(RecList.Items[i].FNameOrig) + '_' +
                          IntToStr(FIdx) + '.txt';
              Cmd := SqlInsert('S_IssDetails',
                              ['RPackID','ClientID',
                               'ClientName','ClientLatName','ClientPasspNo',
                               'CardNo','CardProduct','CardDateInput','CardDateExpire',
                               'CardNameOn','CardServCode','AccountNo','FNameOrig',
                               'FNameDiv'],
                              [IntToStr(RPackID),
                               VarToStr(RecList.Items[i].ClientID),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].ClientName), 1, 50)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].ClientLatName), 1, 50)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].ClientPasspNo), 1, 15)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].CardNo), 1, 20)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].CardProduct), 1, 20)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].CardDateInput), 1, 5)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].CardDateExpire), 1, 5)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].CardNameOn), 1, 50)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].CardServCode), 1, 3)),
                               QuotedStr(Copy(VarToStr(RecList.Items[i].AccountNo), 1, 20)),
                               QuotedStr(Copy(ExtractFileName(RecList.Items[i].FNameOrig), 1, 80)),
                               QuotedStr(Copy(ExtractFileName(FNameDiv), 1, 80))]);
              DMain.ADCon.ExecSQL(Cmd);
              CList.Add(RecList.Items[i].SrcLine);
              Count := Count + 1;
            end;
            if ((Count >= glSetup.RecOutFileAmt) or (IsEnd)) and (Count > 0) then
            begin
              CList.SaveToFile(FNameDiv);
              Cmd := 'Update S_IssDetails Set CardCost = '+
                              '(Select Cost from R_CardProducts '+
                                'Where Code = S_IssDetails.CardProduct) '+
                            'Where RPackID = '+IntToStr(RPackID);
              DMain.ADCon.ExecSQL(Cmd);

              SDir := Branch+'\'+
                      FormatDateTime('YYYY',glSetup.OperDate)+'\'+
                      FormatDateTime('MM',glSetup.OperDate)+'\'+
                      FormatDateTime('YYYYMMDD',glSetup.OperDate);
              BName := glRecBranch.FilesBack;
              if (BName = '') then BName := glSetup.AppPath;
              BName := uf_AddSlash(BName) + uf_AddSlash(SDir);
              if (not TFile.Exists(BName)) then
                  ForceDirectories(BName);
              BName := BName + ExtractFileName(FNameDiv);
              TFile.Copy(FName, BName);

              FNameDiv := '';
              CList.Clear;
              FIdx := FIdx + 1;
              Count := 0;
            end;
          end;
        end;
      except
        on E: Exception do
        begin
          IsErr := True;
          if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
          ShowMessage(uf_ErrorToLog('Обработка коллекции. Загрузка файла: '+FName, E, Cmd));
        end;
      end;
      if IsErr then
      begin
        if MessageDlg('В процессе операции произошла ошибка. Продолжить?',
                      mtWarning,[mbYes,mbNo],0) = mrNo then
           Break;
      end;
    end;
  finally
    RecList.Free;
    BList.Free;
    PfxList.Free;
    CList.Free;
    SList.Free;
  end;
  tbIssHeads.Close;
  tbIssHeads.Open;
end;

procedure TfrmIssHeads.acActPinExecute(Sender: TObject);
var Qry: TFDQuery;
var W, Tbl, Row: Variant;
var S, BName, BNameSh: String;
var R, i, n, ActNo, TCount: Integer;
var Year, Month, Day: Word;
var MandPersPins,
    MandPostPins,
    MandNoPins, SActNo, Cmd: String;
var MandDatePins: Variant;
begin
  try
    if tbIssHeads.IsEmpty then Exit;

    MandPersPins  := VarToStr(tbIssHeads['MandPersPins']);
    MandPostPins  := VarToStr(tbIssHeads['MandPostPins']);
    MandNoPins    := VarToStr(tbIssHeads['MandNoPins']);
    MandDatePins  := tbIssHeads['MandDatePins'];
    BName := VarToStr(tbIssHeads['BranchName']);
    BNameSh := VarToStr(tbIssHeads['BranchNameShort']);

    ActNo := tbIssHeads['ActNo'];
    DecodeDate(tbIssHeads['PackDate'], Year, Month, Day);
    SActNo := IntToStr(ActNo)+'/'+Copy(IntToStr(Year), 3, 2)+'-'+BNameSh;

    Year  := 0;
    Month := 0;
    Day   := 0;
    if (VarToStr(MandDatePins) <> '') then
        DecodeDate(MandDatePins, Year, Month, Day);

    R := tbIssHeads['RRowID'];
    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := DMain.ADCon;
      Cmd := 'Select * from V_IssDetails Where RPackID = '+IntToStr(R);
      Qry.Open(Cmd);
      if Qry.IsEmpty then
      begin
        ShowMessage('Нет данных по выбранному пакету');
        Exit;
      end;
      try
        W := CreateOleObject('Word.Application');
        W.Documents.Add(glSetup.RepPath + 'ActPins.rtf');
        W.Visible := True;

        uf_WordReplace(W, '##ActNo##', SActNo);
        uf_WordReplace(W, '##BranchName##', BName);
        uf_WordReplace(W,  '##Person##', MandPersPins);
        uf_WordReplace(W, '##Post##', MandPostPins);
        uf_WordReplace(W, '##MandateNo##', MandNoPins);

        S := IntToStr(Day);
        if (Day <= 0) then S := '';
        uf_WordReplace(W, '##MandDay##', S);

        S := uf_MonthInText(Month);
        if (Month <= 0) then S := '';
        uf_WordReplace(W, '##MandMonth##', S);

        S := IntToStr(Year);
        if (Year <= 0) then S := '';
        uf_WordReplace(W, '##MandYear##', S);

        Tbl := W.ActiveDocument.Tables.Item(5);
        i := 2;
        n := 1;
        TCount := 0;
        Qry.First;
        While (not Qry.Eof) do
        begin
          S := Trim(VarToStr(Qry['CardNo']));
          S := Copy(S, Length(S)-3, 4);
          Tbl.Cell(i,1).Range.Font.Bold := False;
          Tbl.Cell(i,1).Range.Font.Size := 11;
          Tbl.Cell(i,1).Range.Text := IntToStr(n);
          Tbl.Cell(i,2).Range.Font.Bold := False;
          Tbl.Cell(i,2).Range.Font.Size := 11;
          Tbl.Cell(i,2).Range.Text := 'XXXXXXXXXXXX'+S;
          Tbl.Cell(i,3).Range.Font.Bold := False;
          Tbl.Cell(i,3).Range.Font.Size := 11;
          Tbl.Cell(i,3).Range.Text := Qry.FieldByName('ClientName').AsString;
          TCount := TCount + 1;
          Qry.Next;
          i := i + 1;
          n := n + 1;
          Row := Tbl.Rows.Item(i);
          Tbl.Rows.Add(Row);
        end;
        uf_WordReplace(W, '##TotCount##', IntToStr(TCount));
        uf_WordReplace(W, '##txtCount##', AnsiUpperCase(uf_CountToStr(IntToStr(TCount))));
      finally
        W.Visible := True;
      end;
    finally
      Qry.Free;
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Формирование акта по ПИНам', E, Cmd));
  end;
end;

procedure TfrmIssHeads.acAktCardsAccExecute(Sender: TObject);
var Qry: TFDQuery;
var W, Tbl, Cell: Variant;
var R, i, TblNo, TotCount, FilCount, Branch: Integer;
var Year, Month, Day: Word;
var S, SqlAll, SqlBranch, Cmd: String;
var FilSum, TotSum: Currency;
var DateBeg, DateEnd: TDateTime;
begin
  try
    frmDlgPeriod := TFrmDlgPeriod.Create(Application);
    try
      frmDlgPeriod.dtSDate.Value := Now();
      frmDlgPeriod.dtEDate.Value := Now();
      if frmDlgPeriod.ShowModal <> mrOk then Exit;

      DateBeg := frmDlgPeriod.dtSDate.Value;
      DateEnd := frmDlgPeriod.dtEDate.Value;
    finally
      frmDlgPeriod.Free;
    end;

    try
      W := CreateOleObject('Word.Application');
      W.Documents.Add(glSetup.RepPath + 'ActWOffCardsPINs.rtf');
      W.Visible := True;

      Year  := 0;
      Month := 0;
      Day   := 0;
      DecodeDate(DateBeg, Year, Month, Day);
      S := IntToStr(Day);
      if (Day <= 0) then S := '';
      uf_WordReplace(W, '##StartDay##', S);

      S := uf_MonthInText(Month);
      if (Month <= 0) then S := '';
      uf_WordReplace(W, '##StartMonth##', S);

      S := IntToStr(Year);
      if (Year <= 0) then S := '';
      uf_WordReplace(W, '##StartYear##', S);

      Year  := 0;
      Month := 0;
      Day   := 0;
      DecodeDate(DateEnd, Year, Month, Day);
      S := IntToStr(Day);
      if (Day <= 0) then S := '';
      uf_WordReplace(W, '##EndDay##', S);

      S := uf_MonthInText(Month);
      if (Month <= 0) then S := '';
      uf_WordReplace(W, '##EndMonth##', S);

      S := IntToStr(Year);
      if (Year <= 0) then S := '';
      uf_WordReplace(W, '##EndYear##', S);

      Tbl := W.ActiveDocument.Tables.Item(1);
      Qry := TFDQuery.Create(nil);
      try
        Qry.Connection := DMain.ADCon;
        Cmd := 'Select R_CardProducts.Name,'+
                       'S_IssDetails.CardCost,'+
                   		 'Count(S_IssDetails.RRowID) as CardsCount,'+
                       'Sum(S_IssDetails.CardCost) as CardsCost '+
                  'from S_IssDetails '+
               'Left Outer Join R_CardProducts on S_IssDetails.CardProduct = R_CardProducts.Code '+
               'Left Outer Join S_IssHeads on S_IssDetails.RPackID = S_IssHeads.RRowID '+
                  'Where (PackDate Between '+uf_DateToStr(DateBeg)+' and '+
                                             uf_DateToStr(DateEnd)+') '+
               'Group by R_CardProducts.Name, S_IssDetails.CardCost';
        SqlAll := Cmd;
        Qry.Open(Cmd);
        FilSum := 0;
        i := 2;
        TotSum := 0;
        TotCount := 0;
        Qry.First;
        While (not Qry.Eof) do
        begin
          S := Copy(S, Length(S)-3, 4);
          uf_TableWrite(Tbl, i, 1, uf_VarToStr(Qry['Name']));
          uf_TableWrite(Tbl, i, 2, 'шт.');
          uf_TableWrite(Tbl, i, 3, uf_VarToStr(Qry['CardsCount']));
          uf_TableWrite(Tbl, i, 4, uf_VarToStr(Qry['CardCost']));
          uf_TableWrite(Tbl, i, 5, uf_VarToStr(Qry['CardsCost']));

          TotSum := TotSum + Qry.FieldByName('CardsCost').AsCurrency;
          TotCount := TotCount + Qry.FieldByName('CardsCount').AsInteger;

          Qry.Next;
          uf_TableAddRow(Tbl, i);
        end;
        uf_TableAddRow(Tbl, i);
        uf_TableWrite(Tbl, i, 1, 'ИТОГО', True);
        uf_TableWrite(Tbl, i, 3, IntToStr(TotCount));
        uf_TableWrite(Tbl, i, 5, CurrToStr(TotSum)+' '+uf_SumToStr(CurrToStr(TotSum), C_TJS));
        Qry.Close;

        i := 2;
        Tbl := W.ActiveDocument.Tables.Item(2);

        Cmd := 'Select S_IssHeads.Branch,'+
                      'R_Branches.Name as BranchName,'+
                      'R_CardProducts.Name,'+
                      'S_IssDetails.CardCost,'+
                      'Count(S_IssDetails.RRowID) as CardsCount,'+
                      'Sum(S_IssDetails.CardCost) as CardsCost '+
                 'from S_IssDetails '+
                'Left Outer Join R_CardProducts on S_IssDetails.CardProduct = R_CardProducts.Code '+
                'Left Outer Join S_IssHeads on S_IssDetails.RPackID = S_IssHeads.RRowID '+
                'Left Outer Join R_Branches on S_IssHeads.Branch = R_Branches.Code '+
                'Where (PackDate Between '+uf_DateToStr(DateBeg)+' and '+
                                           uf_DateToStr(DateEnd)+') '+
                'Group by R_CardProducts.Name, S_IssDetails.CardCost, S_IssHeads.Branch, BranchName '+
                'Order by Branch';
        SqlBranch := Cmd;
        Qry.Open(Cmd);
        Branch := Qry.FieldByName('Branch').AsInteger;
        if Qry.IsEmpty then Exit;

        uf_TableWrite(Tbl, i, 5, uf_VarToStr(Qry['BranchName']));
        uf_TableAddRow(Tbl, i);

        FilCount := 0;
        Qry.First;
        while not Qry.Eof do
        begin
          if (Branch <> Qry.FieldByName('Branch').AsInteger) then
          begin
            Branch := Qry.FieldByName('Branch').AsInteger;
            uf_TableWrite(Tbl, i, 1, 'ИТОГО', True);
            uf_TableWrite(Tbl, i, 3, IntToStr(FilCount));
            uf_TableWrite(Tbl, i, 5, CurrToStr(FilSum)+' '+uf_SumToStr(CurrToStr(FilSum), C_TJS));
            uf_TableAddRow(Tbl, i);
            Cell := W.ActiveDocument.Tables.Item(2).Cell(i,6);
            W.ActiveDocument.Tables.Item(2).Cell(i,1).Merge(Cell);
            uf_TableAddRow(Tbl, i);
            Cell := W.ActiveDocument.Tables.Item(2).Cell(i,6);
            W.ActiveDocument.Tables.Item(2).Cell(i,1).Merge(Cell);
            uf_TableWrite(Tbl, i, 1, uf_VarToStr(Qry['BranchName']), True);
            uf_TableAddRow(Tbl, i);
            FilCount := 0;
            FilSum := 0;
          end;
          uf_TableWrite(Tbl, i, 1, uf_VarToStr(Qry['Name']));
          uf_TableWrite(Tbl, i, 2, 'шт.');
          uf_TableWrite(Tbl, i, 3, uf_VarToStr(Qry['CardsCount']));
          uf_TableWrite(Tbl, i, 4, uf_VarToStr(Qry['CardCost']));
          uf_TableWrite(Tbl, i, 5, uf_VarToStr(Qry['CardsCost']));

          FilSum := FilSum + Qry.FieldByName('CardsCost').AsCurrency;
          FilCount := FilCount + Qry.FieldByName('CardsCount').AsInteger;

          Qry.Next;
          uf_TableAddRow(Tbl, i);
        end;
        uf_TableAddRow(Tbl, i);
        uf_TableWrite(Tbl, i, 1, 'ИТОГО', True);
        uf_TableWrite(Tbl, i, 3, IntToStr(FilCount));
        uf_TableWrite(Tbl, i, 5, CurrToStr(FilSum)+' '+uf_SumToStr(CurrToStr(FilSum), C_TJS));
        uf_TableAddRow(Tbl, i);
        Qry.Close;

        // Второй круг
        i := 2;
        Tbl := W.ActiveDocument.Tables.Item(4);
        Cmd := SqlAll;
        Qry.Open(Cmd);
        FilSum := 0;
        TotCount := 0;
        Qry.First;
        While (not Qry.Eof) do
        begin
          S := Copy(S, Length(S)-3, 4);
          uf_TableWrite(Tbl, i, 1, uf_VarToStr(Qry['Name']));
          uf_TableWrite(Tbl, i, 2, 'шт.');
          uf_TableWrite(Tbl, i, 3, uf_VarToStr(Qry['CardsCount']));
          uf_TableWrite(Tbl, i, 4, uf_VarToStr(Qry['CardCost']));
          uf_TableWrite(Tbl, i, 5, uf_VarToStr(Qry['CardsCost']));

          TotSum := TotSum + Qry.FieldByName('CardsCost').AsCurrency;
          TotCount := TotCount + Qry.FieldByName('CardsCount').AsInteger;

          Qry.Next;
          uf_TableAddRow(Tbl, i);
        end;
        uf_TableAddRow(Tbl, i);
        uf_TableWrite(Tbl, i, 1, 'ИТОГО');
        uf_TableWrite(Tbl, i, 3, IntToStr(TotCount));
        uf_TableWrite(Tbl, i, 5, CurrToStr(TotSum)+' '+uf_SumToStr(CurrToStr(TotSum), C_TJS));
        Qry.Close;

        i := 2;
        Tbl := W.ActiveDocument.Tables.Item(5);

        Cmd := SqlBranch;
        Qry.Open(Cmd);
        if Qry.IsEmpty then Exit;

        uf_TableWrite(Tbl, i, 5, uf_VarToStr(Qry['BranchName']));
        uf_TableAddRow(Tbl, i);

        FilCount := 0;
        Qry.First;
        Branch := Qry.FieldByName('Branch').AsInteger;
        while not Qry.Eof do
        begin
          if (Branch <> Qry.FieldByName('Branch').AsInteger) then
          begin
            Branch := Qry.FieldByName('Branch').AsInteger;
            uf_TableWrite(Tbl, i, 1, 'ИТОГО', True);
            uf_TableWrite(Tbl, i, 2, 'шт.');
            uf_TableWrite(Tbl, i, 3, IntToStr(FilCount));
            uf_TableWrite(Tbl, i, 5, CurrToStr(FilSum)+' '+uf_SumToStr(CurrToStr(FilSum), C_TJS));
            uf_TableAddRow(Tbl, i);
            uf_TableAddRow(Tbl, i);
            uf_TableWrite(Tbl, i, 5, uf_VarToStr(Qry['BranchName']));
            uf_TableAddRow(Tbl, i);
            FilCount := 0;
            FilSum := 0;
          end;
          uf_TableWrite(Tbl, i, 1, uf_VarToStr(Qry['Name']));
          uf_TableWrite(Tbl, i, 2, 'шт.');
          uf_TableWrite(Tbl, i, 3, uf_VarToStr(Qry['CardsCount']));
          uf_TableWrite(Tbl, i, 4, uf_VarToStr(Qry['CardCost']));
          uf_TableWrite(Tbl, i, 5, uf_VarToStr(Qry['CardsCost']));

          FilSum := FilSum + Qry.FieldByName('CardsCost').AsCurrency;
          FilCount := FilCount + Qry.FieldByName('CardsCount').AsInteger;

          Qry.Next;
          uf_TableAddRow(Tbl, i);
        end;
        uf_TableAddRow(Tbl, i);
        uf_TableWrite(Tbl, i, 1, 'ИТОГО', True);
        uf_TableWrite(Tbl, i, 3, IntToStr(FilCount));
        uf_TableWrite(Tbl, i, 5, CurrToStr(FilSum)+' '+uf_SumToStr(CurrToStr(FilSum), C_TJS));
        uf_TableAddRow(Tbl, i);
      finally
        Qry.Close;
        Qry.Free;
      end;
    finally
      W.Visible := True;
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Формирование акта о списании по картам и ПИН конвертам', E, Cmd));
  end;
end;

procedure TfrmIssHeads.acBranchCardsCountExecute(Sender: TObject);
begin
  rp_CardsCountByPackProducts;
end;

procedure TfrmIssHeads.acActCardsExecute(Sender: TObject);
var Qry, QryProd: TFDQuery;
var W, Tbl, Row: Variant;
var S, BName, BNameSh, ProdName: String;
var R, i, n, ActNo, TCount: Integer;
var Year, Month, Day: Word;
var MandPersCards,
    MandPostCards,
    MandNoCards, SActNo, Cmd: String;
var MandDateCards: Variant;
var Sum, TSum: Currency;
begin
  try
    if tbIssHeads.IsEmpty then Exit;

    MandPersCards  := VarToStr(tbIssHeads['MandPersCards']);
    MandPostCards  := VarToStr(tbIssHeads['MandPostCards']);
    MandNoCards    := VarToStr(tbIssHeads['MandNoCards']);
    MandDateCards  := tbIssHeads['MandDateCards'];
    BName := VarToStr(tbIssHeads['BranchName']);
    BNameSh := VarToStr(tbIssHeads['BranchNameShort']);
    R := tbIssHeads['RRowID'];

    ActNo := tbIssHeads['ActNo'];
    DecodeDate(tbIssHeads['PackDate'], Year, Month, Day);
    SActNo := IntToStr(ActNo)+'/'+Copy(IntToStr(Year), 3, 2)+'-'+BNameSh;

    Year  := 0;
    Month := 0;
    Day   := 0;
    if (VarToStr(MandDateCards) <> '') then
        DecodeDate(MandDateCards, Year, Month, Day);

    try
      W := CreateOleObject('Word.Application');
      W.Documents.Add(glSetup.RepPath + 'ActCards.rtf');
      W.Visible := True;

      uf_WordReplace(W, '##ActNo##', SActNo);
      uf_WordReplace(W, '##BranchName##', BName );
      uf_WordReplace(W, '##Person##', MandPersCards);
      uf_WordReplace(W, '##Post##', MandPostCards);
      uf_WordReplace(W, '##MandateNo##', MandNoCards);

      S := IntToStr(Day);
      if (Day <= 0) then S := '';
      uf_WordReplace(W, '##MandDay##', S);

      S := uf_MonthInText(Month);
      if (Month <= 0) then S := '';
      uf_WordReplace(W, '##MandMonth##', S);

      S := IntToStr(Year);
      if (Year <= 0) then S := '';
      uf_WordReplace(W, '##MandYear##', S);

      i := 2;
      TSum := 0;
      TCount := 0;
      Tbl := W.ActiveDocument.Tables.Item(5);

      QryProd := TFDQuery.Create(nil);
      try
        QryProd.Connection := DMain.ADCon;
        Cmd := 'Select * from R_CardProducts';
        QryProd.Open(Cmd);
        Qry := TFDQuery.Create(nil);
        try
          Qry.Connection := DMain.ADCon;
          while not QryProd.Eof do
          begin
            n := 1;
            ProdName := uf_VarToStr(QryProd['Name']);
            Cmd := 'Select * from V_IssDetails Where (RPackID = '+IntToStr(R)+') and '+
                   '(CardProduct = '+QuotedStr(uf_VarToStr(QryProd['Code']))+')';
            Qry.Open(Cmd);
            if not Qry.IsEmpty then
            begin
              Tbl.Cell(i,2).Range.Font.Bold := True;
              Tbl.Cell(i,2).Range.Font.Size := 11;
              Tbl.Cell(i,2).Range.Text := ProdName;
              i := i + 1;
              Row := Tbl.Rows.Item(i);
              Tbl.Rows.Add(Row);
            end;
            Sum := 0;
            Qry.First;
            While (not Qry.Eof) do
            begin
              S := Trim(VarToStr(Qry['CardNo']));
              S := Copy(S, Length(S)-3, 4);
              Tbl.Cell(i,1).Range.Font.Bold := False;
              Tbl.Cell(i,1).Range.Font.Size := 11;
              Tbl.Cell(i,1).Range.Text := IntToStr(n);
              Tbl.Cell(i,2).Range.Font.Bold := False;
              Tbl.Cell(i,2).Range.Font.Size := 11;
              Tbl.Cell(i,2).Range.Text := 'XXXXXXXXXXXX'+S;
              Tbl.Cell(i,3).Range.Font.Bold := False;
              Tbl.Cell(i,3).Range.Font.Size := 11;
              Tbl.Cell(i,3).Range.Text := VarToStr(Qry['CardDateExpire']);
              Tbl.Cell(i,4).Range.Font.Bold := False;
              Tbl.Cell(i,4).Range.Font.Size := 11;
              Tbl.Cell(i,4).Range.Text := VarToStr(Qry['CardNameOn']);
              Tbl.Cell(i,5).Range.Font.Bold := False;
              Tbl.Cell(i,5).Range.Font.Size := 11;
              Tbl.Cell(i,5).Range.Text := VarToStr(Qry['CardCost']);
              if (not VarIsNull(Qry['CardCost'])) then
                  Sum := Sum + Qry['CardCost'];
              TCount := TCount + 1;
              Qry.Next;
              i := i + 1;
              Row := Tbl.Rows.Item(i);
              Tbl.Rows.Add(Row);
              n := n + 1;
            end;
            TSum := TSum + Sum;
            if (not Qry.IsEmpty) then
            begin
              Tbl.Cell(i,2).Range.Font.Bold := True;
              Tbl.Cell(i,2).Range.Font.Size := 11;
              Tbl.Cell(i,2).Range.Text := 'Сумма:';
              Tbl.Cell(i,5).Range.Font.Bold := True;
              Tbl.Cell(i,5).Range.Font.Size := 11;
              Tbl.Cell(i,5).Range.Text := CurrToStr(Sum);
              i := i + 1;
              Row := Tbl.Rows.Item(i);
              Tbl.Rows.Add(Row);
            end;
            QryProd.Next;
          end;
        finally
          Qry.Free;
        end;
      finally
        QryProd.Free;
      end;
      uf_WordReplace(W, '##TotCount##', IntToStr(TCount));
      uf_WordReplace(W, '##txtCount##', AnsiUpperCase(uf_CountToStr(IntToStr(TCount))));
      uf_WordReplace(W, '##TotSum##', CurrToStr(TSum));
      uf_WordReplace(W, '##txtSum##', AnsiUpperCase(uf_SumToStr(CurrToStr(TSum), 972)));
    finally
      W.Visible := True;
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Формирование акта по картам', E, Cmd));
  end;
end;

procedure TfrmIssHeads.acGridBestFitExecute(Sender: TObject);
begin
  btvIssHeads.ApplyBestFit();
end;

procedure TfrmIssHeads.acGridExcelExecute(Sender: TObject);
var ODlg: TSaveDialog;
var obXL: Variant;
var Wb: Variant;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then
    begin
      ExportGridToExcel(ODlg.FileName, cxGridIssHeads );
      obXL := CreateOleObject('Excel.Application');
      obXL.Visible := True;
      Wb := obXL.WorkBooks.Open(ODlg.FileName);
    end;
  finally
    ODlg.Free;
  end;
end;

procedure TfrmIssHeads.FormShow(Sender: TObject);
begin
  edtBegDate.Value := Date()-1;
  edtEndDate.Value := Date();
end;

end.
