unit SQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, DB, Buttons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridPopupMenu, dxPSCore,
  SMEWiz, cxGridExportLink, ComObj,
  DBCtrlsEh, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, ExportDS,
  dxPScxCommon, cxGridCustomPopupMenu, cxClasses, cxGridCustomView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Actions;

type
  TfrmSQL = class(TForm)
    ActionList1: TActionList;
    acExecute: TAction;
    acClose: TAction;
    srSqlQuery: TDataSource;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    SqlMemo: TMemo;
    Splitter1: TSplitter;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    acExport: TAction;
    acExcel: TAction;
    acGridPrint: TAction;
    acBestFit: TAction;
    btvSqlQuery: TcxGridDBTableView;
    cxGridSqlQueryLevel1: TcxGridLevel;
    cxGridSqlQuery: TcxGrid;
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxPrintGrid: TdxComponentPrinter;
    SMExportDlg: TSMEWizardDlg;
    chkIsNewRecord: TDBCheckBoxEh;
    chkIsEditRecord: TDBCheckBoxEh;
    chkIsDelRecord: TDBCheckBoxEh;
    BitBtn7: TBitBtn;
    acLoadScript: TAction;
    dsSqlQuery: TFDQuery;
    procedure acExecuteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure acExcelExecute(Sender: TObject);
    procedure acGridPrintExecute(Sender: TObject);
    procedure acBestFitExecute(Sender: TObject);
    procedure chkIsNewRecordClick(Sender: TObject);
    procedure chkIsEditRecordClick(Sender: TObject);
    procedure chkIsDelRecordClick(Sender: TObject);
    procedure acLoadScriptExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation

uses DBDatas;
{$R *.dfm}

procedure TfrmSQL.acExecuteExecute(Sender: TObject);
var S, Cmd: String;
begin
  try
    Cmd := UpperCase(Trim(SqlMemo.Text));
    S := Copy(Cmd, 1, 6);
    if dsSqlQuery.Active then dsSqlQuery.Close;
    dsSqlQuery.SQL.Clear;
    dsSqlQuery.SQL.Add(SqlMemo.Text);
    if (S <> 'SELECT') then
        dsSqlQuery.ExecSQL;
    if (S = 'SELECT') then
    begin
      dsSqlQuery.Open;
      btvSqlQuery.ClearItems;
      btvSqlQuery.DataController.CreateAllItems();
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('SQL. Выполнение SQL команды', E, Cmd));
  end;
end;

procedure TfrmSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsSqlQuery.Active then dsSqlQuery.Close;

  if (FormStyle = fsMdiChild) then Action := caFree;
end;

procedure TfrmSQL.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSQL.acExportExecute(Sender: TObject);
begin
  SMExportDlg.Execute;
end;

procedure TfrmSQL.acExcelExecute(Sender: TObject);
var ODlg: TSaveDialog;
var obXL: Variant;
var Wb: Variant;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then
    begin
       ExportGridToExcel(ODlg.FileName, cxGridSqlQuery);
       obXL := CreateOleObject('Excel.Application');
       obXL.Visible := True;
       Wb := obXL.WorkBooks.Open(ODlg.FileName);
    end;
  finally
    ODlg.Free;
  end;
end;

procedure TfrmSQL.acGridPrintExecute(Sender: TObject);
begin
  dxPrintGrid.Preview();
end;

procedure TfrmSQL.acLoadScriptExecute(Sender: TObject);
var ODlg: TOpenDialog;
begin
  SqlMemo.Clear;
  ODlg := TOpenDialog.Create(Owner);
  try
    if ODlg.Execute then SqlMemo.Lines.LoadFromFile(ODlg.FileName);
  finally
    ODlg.Free;
  end;
end;

procedure TfrmSQL.acBestFitExecute(Sender: TObject);
begin
  btvSqlQuery.ApplyBestFit();
end;

procedure TfrmSQL.chkIsNewRecordClick(Sender: TObject);
begin
  if chkIsNewRecord.Checked then
  begin
    btvSqlQuery.OptionsData.Inserting := True;
    btvSqlQuery.NewItemRow.Visible := True;
  end
  else
  begin
    btvSqlQuery.OptionsData.Inserting := False;
    btvSqlQuery.NewItemRow.Visible := False;
  end;
end;

procedure TfrmSQL.chkIsEditRecordClick(Sender: TObject);
begin
  if chkIsEditRecord.Checked then
     btvSqlQuery.OptionsData.Editing := True
  else
     btvSqlQuery.OptionsData.Editing := False;
end;

procedure TfrmSQL.chkIsDelRecordClick(Sender: TObject);
begin
  if chkIsDelRecord.Checked then
     btvSqlQuery.OptionsData.Deleting := True
  else
     btvSqlQuery.OptionsData.Deleting := False;
end;

end.
