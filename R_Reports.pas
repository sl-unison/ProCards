unit R_Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, ActnList, Buttons, DBGridEh, StdCtrls,
  DBAxisGridsEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions;

type
  TfrmReports = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acExecute: TAction;
    acClose: TAction;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    acGridBestFit: TAction;
    DBGridEh1: TDBGridEh;
    acUserReport: TAction;
    srReports: TDataSource;
    tbReports: TFDQuery;
    tbReportsCode: TIntegerField;
    tbReportsName: TWideStringField;
    tbReportsIsSystem: TBooleanField;
    tbReportsIsHide: TBooleanField;
    tbReportsIsPeriod: TBooleanField;
    tbReportsRemark: TWideStringField;
    tbReportsSQLText: TWideMemoField;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acExecuteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btvReportsKeyPress(Sender: TObject; var Key: Char);
    procedure acUserReportExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function rp_CardsCountByPackProducts(): Boolean;

var
  frmReports: TfrmReports;

implementation

uses DBDatas, DatReport, RepGrid, Globals, DlgPeriod, DlgReport;

{$R *.dfm}

function rp_CardsCountByPackProducts(): Boolean;
var Qry: TFDQuery;
var SList: TStrings;
var Cmd, S, TmpFName: String;
var i: Integer;
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

    SList := TStringList.Create;
    try
      Qry := TFDQuery.Create(Nil);
      try
        Qry.Connection := DMain.ADCon;
        Cmd := 'Select * from R_CardProducts '+
               'Where Code in (Select CardProduct from V_IssDetails '+
                               'Where PackDate between '+uf_DateToStr(DateBeg)+' and '+
                                                         uf_DateToStr(DateEnd)+')';
        Qry.Open(Cmd);
        if Qry.IsEmpty then
        begin
          ShowMessage('Не найдены карточные продукты за заданный период');
          Exit;
        end;
        TmpFName := '#TMP'+FormatDateTime('YYYYMMDDHHMMSS',Now());
        Cmd := 'Create Table '+TmpFName+'('+
               'Branch Integer, '+
               'BranchName NChar(50),';

        SList.Add('Branch=[Код филиала]');
        SList.Add('BranchName=[Филиал]');
        Qry.First;
        while not Qry.Eof do
        begin
          S := 'F_'+Qry.FieldByName('Code').AsString;
          SList.Add(S+'=['+Qry.FieldByName('Name').AsString+']');

          Cmd := Cmd + S + ' Integer';
          Qry.Next;
          if not Qry.Eof then Cmd := Cmd +',';
        end;
        Cmd := Cmd + ')';
        DMain.ADCon.ExecSQL(Cmd);

        Cmd := 'Select Branch, BranchName from V_IssDetails '+
               'Where (PackDate between '+uf_DateToStr(DateBeg)+' and '+
                                          uf_DateToStr(DateEnd)+') '+
               'Group by Branch, BranchName';
        Qry.Open(Cmd);
        if Qry.IsEmpty then
        begin
          Cmd := 'DROP TABLE '+TmpFName;
          DMain.ADCon.ExecSQL(Cmd);
          ShowMessage('Нет данных по заданным параметрам');
          Exit;
        end;

        Qry.First;
        while not Qry.Eof do
        begin
          Cmd := SqlInsert(TmpFName,
                          ['Branch', 'BranchName'],
                          [uf_VarToStr(Qry['Branch']),
                           QuotedStr(Copy(uf_VarToStr(Qry['BranchName']), 1, 50))]);
          DMain.ADCon.ExecSQL(Cmd);
          Qry.Next;
        end;
        Qry.Close;

        Cmd := 'Select Branch, CardProduct, Count(CardProduct) as CardsCount '+
               'from V_IssDetails '+
               'Where (PackDate between '+uf_DateToStr(DateBeg)+' and '+
                                          uf_DateToStr(DateEnd)+') '+
               'Group by Branch, CardProduct Order by Branch, CardProduct';
        Qry.Open(Cmd);
        while not Qry.Eof do
        begin
          S := 'F_'+Qry.FieldByName('CardProduct').AsString;
          Cmd := SqlUpdate(TmpFName,[S],[uf_VarToStr(Qry['CardsCount'])],
                 'Branch = '+uf_VarToStr(Qry['Branch']));
          DMain.ADCon.ExecSQL(Cmd);
          Qry.Next;
        end;
        Qry.Close;

        Cmd := 'Select * from '+TmpFName;
        Qry.Open(Cmd);
        Cmd := 'Select ';
        for i := 0 to Qry.FieldCount-1 do
        begin
          S := Qry.Fields[i].FieldName + ' as ' + SList.Values[Qry.Fields[i].FieldName];
          Cmd := Cmd + S;
          if (i < Qry.FieldCount-1) then
              Cmd := Cmd + ',';
        end;
        Qry.Close;
      finally
        if Qry.Active then Qry.Close;
        Qry.Free;
      end;
      Cmd := Cmd + 'From '+TmpFName;

      frmRepGrid := TFrmRepGrid.Create(Application);
      try
        frmRepGrid.QryReport.SQL.Text := Cmd;
        frmRepGrid.Caption := 'Реестр документов ';
        frmRepGrid.ShowModal;
      finally
        frmRepGrid.Free;
      end;
    finally
      SList.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage(uf_ErrorToLog('Формирование реестра', E, Cmd));
    end;
  end;
end;

procedure TfrmReports.acAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatReport := TFrmDatReport.Create(Owner);
  try
    frmDatReport.RecStatus := RS_INSERT;
    if (frmDatReport.ShowModal <> mrOk) then Exit;

    R := frmDatReport.Code;
    tbReports.Close;
    tbReports.Open;
    tbReports.Locate('Code', R, []);
  finally
    frmDatReport.Free;
  end;
end;

procedure TfrmReports.acEditExecute(Sender: TObject);
var R: Integer;
begin
  if tbReports.IsEmpty then Exit;

  if (tbReports.FieldByName('IsSystem').AsBoolean) and
     (not glSetup.IsSysAdmin) then
  begin
    ShowMessage('Запрещено редактировать системный отчет');
    Exit;
  end;

  R := tbReports.FieldByName('Code').AsInteger;
  frmDatReport := TFrmDatReport.Create(Owner);
  try
    frmDatReport.RecStatus := RS_EDIT;
    frmDatReport.Code := R;
    frmDatReport.edtCode.Value           := tbReports['Code'];
    frmDatReport.edtName.Value           := tbReports['Name'];
    frmDatReport.edtIsSystem.Checked     := tbReports.FieldByName('IsSystem').AsBoolean;
    frmDatReport.edtIsHide.Checked       := tbReports.FieldByName('IsHide').AsBoolean;
    frmDatReport.edtIsPeriod.Checked     := tbReports.FieldByName('IsPeriod').AsBoolean;
    frmDatReport.edtRemark.Value         := tbReports['Remark'];
    frmDatReport.edtSQLText.Text         := VarToStr(tbReports['SQLText']);
    frmDatReport.edtCode.Enabled := False;
    if (frmDatReport.ShowModal <> mrOk) then Exit;

    tbReports.Close;
    tbReports.Open;
    tbReports.Locate('Code', R, []);
  finally
    frmDatReport.Free;
  end;
end;

procedure TfrmReports.acDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if tbReports.IsEmpty then Exit;

  if (tbReports.FieldByName('Code').AsInteger < 100) and
     (not glSetup.IsSysAdmin) then
  begin
    ShowMessage('Запрещено удалить системный отчет');
    Exit;
  end;

  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbReports.FieldByName('Code').AsInteger;
    if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
    DMain.ADCon.StartTransaction;
    Cmd := 'Delete from R_Reports Where Code = '+IntToStr(R);
    DMain.ADCon.ExecSQL(Cmd);
    DMain.ADCon.Commit;
    tbReports.Prior;
    if (not tbReports.Bof) then
        R := tbReports.FieldByName('Code').AsInteger;
    tbReports.Close;
    tbReports.Open;
    tbReports.Locate('Code', R, []);
  except
    on E: Exception do
    begin
      if DMain.ADCon.InTransaction then DMain.ADCon.Rollback;
      ShowMessage(uf_ErrorToLog('Отчеты. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmReports.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmReports.acUserReportExecute(Sender: TObject);
var S: String;
var IsDate: Boolean;
var DateBeg, DateEnd: TDateTime;
begin
  S := Trim(tbReports.FieldByName('SQLText').AsString);

  if S = '' then
  begin
    Application.MessageBox('Строка запроса пуста','Ошибка',MB_OK);
    Exit;
  end;

  IsDate := tbReports.FieldByName('IsPeriod').AsBoolean;
  if IsDate then
  begin
    frmDlgPeriod := TFrmDlgPeriod.Create(Owner);
    try
      if frmDlgPeriod.ShowModal <> mrOk then Exit;
      DateEnd := frmDlgPeriod.dtEDate.Value;
      DateBeg := frmDlgPeriod.dtSDate.Value;
    finally
      frmDlgPeriod.Free;
    end;
  end;

  frmRepGrid := TFrmRepGrid.Create(Owner);
  try
    frmRepGrid.QryReport.SQL.Text := S;
    if frmRepGrid.QryReport.ParamCount = 1 then
    begin
      frmRepGrid.QryReport.Params[0].Value := DateEnd;
    end;
    if frmRepGrid.QryReport.ParamCount > 1 then
    begin
      frmRepGrid.QryReport.Params[0].Value := DateBeg;
      frmRepGrid.QryReport.Params[1].Value := DateEnd;
    end;
    frmRepGrid.Caption := tbReports.FieldByName('Name').AsString;
    frmRepGrid.ShowModal;
  finally
    frmRepGrid.Free;
  end;
end;

procedure TfrmReports.acExecuteExecute(Sender: TObject);
begin
  if tbReports.IsEmpty then Exit;

  acUserReport.Execute;
end;

procedure TfrmReports.FormShow(Sender: TObject);
begin
  if (not glSetup.IsSysAdmin) and
     (not glSetup.IsProAdmin) then
  begin
    acAdd.Visible    := False;
    acEdit.Visible   := False;
    acDelete.Visible := False;

    acAdd.Enabled    := False;
    acEdit.Enabled   := False;
    acDelete.Enabled := False;
  end;
  if tbReports.Active then tbReports.Close;
  if glSetup.IsSysAdmin then
     tbReports.SQL.Text := 'Select * from V_Reports Order by Code'
  else
     tbReports.SQL.Text := 'Select * from V_Reports Where (IsHide = False) or (IsHide is null) Order by Code';
  tbReports.Open;
end;

procedure TfrmReports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbReports.Close;
end;

procedure TfrmReports.btvReportsKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then acExecute.Execute;
end;

end.
