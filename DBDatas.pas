unit DBDatas;

interface

uses
  SysUtils, Classes, DB, Dialogs, Globals,
  Forms, Math, Variants, AbZipper, IdBaseComponent, IOUtils, Types,
  IdTCPConnection, IdSMTP, IdMessage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.ADS,
  FireDAC.Phys.ADSDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDMain = class(TDataModule)
    srSysTables: TDataSource;
    srBranches: TDataSource;
    srCardProds: TDataSource;
    ADCon: TFDConnection;
    tbCardProds: TFDQuery;
    tbBranches: TFDQuery;
    tbBranchesCode: TIntegerField;
    tbBranchesName: TWideStringField;
    tbBranchesNameShort: TWideStringField;
    tbBranchesActNo: TIntegerField;
    tbBranchesMandPersPins: TWideStringField;
    tbBranchesMandPersCards: TWideStringField;
    tbBranchesMandPostPins: TWideStringField;
    tbBranchesMandPostCards: TWideStringField;
    tbBranchesMandNoPins: TWideStringField;
    tbBranchesMandNoCards: TWideStringField;
    tbBranchesMandDatePins: TDateField;
    tbBranchesMandDateCards: TDateField;
    tbBranchesPersPinEmail: TWideStringField;
    tbBranchesPersCardEmail: TWideStringField;
    tbBranchesFilesPath: TWideStringField;
    tbBranchesFilesMask: TWideStringField;
    tbBranchesFilesBack: TWideStringField;
    tbCardProdsCode: TWideStringField;
    tbCardProdsName: TWideStringField;
    tbCardProdsCost: TCurrencyField;
    tbSysTables: TFDQuery;
    tbSysTablesName: TStringField;
    tbSysTablesComment: TMemoField;
    tbCardProdsIsVirtual: TBooleanField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysADSDriverLink1: TFDPhysADSDriverLink;
    procedure LogOut;
    procedure ADConAfterConnect(Sender: TObject);
    procedure ADConBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function uf_LPad(S: String; Len: Integer; Ch: String = ' '): String;
function uf_RPad(S: String; Len: Integer; Ch: String = ' '): String;
function uf_IsNull(V, R: Variant): Variant;
function uf_IsUndef(V: Variant): Boolean;
function uf_AddSlash(S: String): String;
function uf_FileBase( pFName: String ): String;
function uf_StrToList(S: String; R: Char; Out Temp: TStrings): Boolean;
function SqlInsert(TableName : string;
                   ColNames : array of string;
                   Values : array of string): string;
function SqlUpdate(TableName : string;
                   ColNames : array of string;
                   Values : array of string;
                   WhereClause : string) : string;
function uf_VarToStr(AVar: Variant; IsEmptyNull: Boolean = False): String;
function uf_DateToStr(V: Variant; Fmt: String = 'YYYY-MM-DD'; IsQuoted: Boolean = True): String;
function uf_ErrorToLog(ALogNote: String; E: Exception; ACmd: String = ''): String;
function uf_WriteToLog(ALogNote: String; AErr: array of string): String;
function uf_GetRecID(tbName: String): Integer;
function uf_UserAccessTypes(ATblName: String; var ARec: TTableAccesses): Boolean;
function uf_GetCardProductCode(CardNo: String): String;
function uf_GetBranchDatas(Branch: Integer): Boolean;
function uf_MonthInText(Month: Integer) : String;
function uf_GetMaskedCardNo(CardNo: String): String;
function uf_DBBackup(): Boolean;
procedure uf_GetSetups();

var
  DMain: TDMain;

implementation

uses ULogToFile;

{$R *.dfm}

function uf_LPad(S: String; Len: Integer; Ch: String = ' '): String;
begin
  S := Trim(S);
  While (Length( S ) < Len) do
     S := Ch + S;
  Result := S;
end;

function uf_RPad(S: String; Len: Integer; Ch: String = ' '): String;
begin
  S := Trim(S);
  While ( Length( S ) < Len ) do
     S := S + Ch;
  Result := S;
end;

function uf_IsNull(V, R: Variant): Variant;
begin
  Result := V;
  if VarIsNull(V) or VarIsEmpty(V) or VarIsClear(V) then
     Result := R;
end;

function uf_IsUndef(V: Variant): Boolean;
begin
  Result := False;
  if VarIsNull(V) or VarIsEmpty(V) or VarIsClear(V) then
     Result := True;
end;

function uf_AddSlash(S: String): String;
begin
  if (Copy(S, Length(S),1) <> '\') then
      S := S + '\';
  Result := S;
end;

function uf_FileBase( pFName: String ): String;
var iPos: Integer;
begin
  iPos := Pos( '\', pFName  );
  While ( iPos > 0 ) do
  begin
    pFName := Copy( pFName, iPos + 1, Length(pFName) );
    iPos := Pos( '\', pFName );
  end;
  iPos := Pos( '.', pFName );
  While ( iPos > 0 ) do
  begin
    pFName := Copy( pFName, 1, iPos - 1 );
    iPos := Pos( '.', pFName );
  end;
  Result := pFName;
end;

function uf_MonthInText(Month: Integer) : String;
var SMonth: String;
begin
  SMonth := IntToStr(Month);
  case Month of
    1:  SMonth := 'января';
    2:  SMonth := 'февраля';
    3:  SMonth := 'марта';
    4:  SMonth := 'апреля';
    5:  SMonth := 'мая';
    6:  SMonth := 'июня';
    7:  SMonth := 'июля';
    8:  SMonth := 'август';
    9:  SMonth := 'сентября';
    10: SMonth := 'октября';
    11: SMonth := 'ноября';
    12: SMonth := 'декабря';
  end;
  Result := SMonth;
end;

function uf_StrToList(S: String; R: Char; Out Temp: TStrings): Boolean;
var j: integer;
begin
  if Temp <> nil then
  begin
    Temp.Clear;
    while S <> '' do
    begin
      j := Pos(r, S);
      if j = 0 then j := Length(S) + 1;
      Temp.Add(Copy(S, 1, j-1));
      Delete(S, 1, j + length(R)-1);
    end;
    Result := True;
  end
  else
  Result := False;
end;

function SqlInsert(TableName : string;
                   ColNames : array of string;
                   Values : array of string): string;
var RetVar, V : string;
   i : integer;
begin
   RetVar := 'Insert into ' + TableName +
              '(' + ColNames[0];
   for i := 1 to High(ColNames) do
       RetVar := RetVar + ',' + ColNames[i];

   RetVar := RetVar + ')';
   V := Values[0];
   if (Trim(V) = QuotedStr('')) or (Trim(V) = '') then V := 'Null';
   RetVar := RetVar + ' Values ('+V;
   for i := 1 to High(Values) do begin
       V := Values[i];
       if (Trim(V) = QuotedStr('')) or (Trim(V) = '') then V := 'Null';
       RetVar := RetVar + ',' + V;
   end;
   RetVar := RetVar + ')';
   if High(Values) < High(ColNames) then
      ShowMessage('SQL Insert - Not enough values.');
   if High(Values) > High(ColNames) then
      ShowMessage('SQL Insert - Too many values.');
   Result := RetVar;
end;

function SqlUpdate(TableName : string;
                   ColNames : array of string;
                   Values : array of string;
                   WhereClause : string) : string;
var RetVar, V: String;
   i : integer;
begin
   RetVar := 'Update ' + TableName + ' Set ';
   for i := 0 to Min(High(Values),High(ColNames)) do
   begin
      V := Values[i];
      if (Trim(V) = QuotedStr('')) or (Trim(V) = '') then V := 'Null';
      RetVar := RetVar + ColNames[i] + '=' + V + ',';
   end;
   Delete(RetVar,Length(RetVar),1);
   RetVar := RetVar + ' Where ' + WhereClause;
   if High(Values) < High(ColNames) then
       ShowMessage('SQL Update - Not enough values.');
   if High(Values) > High(ColNames) then
       ShowMessage('SQL Update - Too many values.');
   Result := RetVar;
end;

function uf_VarToStr(AVar: Variant; IsEmptyNull: Boolean = False): String;
var S: String;
begin
  case VarType(AVar) of
    varString    : S := VarToStr(AVar);
    varInteger,
    varSmallint,
    varShortInt,
    varByte,
    varWord,
    varLongWord,
    varUInt64,
    varInt64     : S := VarToStr(AVar);
    varSingle,
    varDouble    : S := FloatToStr(AVar, glFmt);
    varCurrency  : S := CurrToStr(AVar, glFmt);
  else
    S := VarToStr(AVar);
  end;
  if (IsEmptyNull) and (Trim(S) = '') then S := 'NULL';
  Result := S;
end;

function uf_ErrorToLog(ALogNote: String; E: Exception; ACmd: String = ''): String;
var S, Sec: String;
begin
  Result := '';
  try
    Sec := FormatDateTime('NNSS/ZZZ', Now());
    S := LOG_ERR + ' ' + Sec + '-00 ' + ALogNote + '. ' + E.Message;
    LogToFile.WriteToLogFile(S);
    if (ACmd <> '') then
    begin
      S := LOG_ERR + ' ' + Sec + '-01 SQL: ' + ACmd;
      LogToFile.WriteToLogFile(S);
    end;
    Result := 'ОШИБКА. ' + ALogNote + '. '+E.Message;
  except
    on E: Exception do
       LogToFile.WriteToLogFile(LOG_ERR + 'Запись ошибки в лог: ' + E.Message);
  end;
end;

function uf_WriteToLog(ALogNote: String; AErr: array of string): String;
var i: Integer;
var S, Sec: String;
begin
  Result := '';
  try
    Sec := FormatDateTime('NNSS/ZZZ', Now());
    S := LOG_INF + ' ' + Sec + '-00 ' + ALogNote;
    LogToFile.WriteToLogFile(S);
    for i := Low(AErr) to High(AErr) do
    begin
      if (AErr[i] <> '') then
      begin
        S := LOG_INF + ' ' + Sec + '-' + uf_RPad(IntToStr(i), 2, '0') + ' ' + AErr[i];
        LogToFile.WriteToLogFile(S);
      end;
    end;
    Result := ALogNote;
  except
    on E: Exception do
       LogToFile.WriteToLogFile(LOG_ERR + 'Запись информации в лог: ' + E.Message);
  end;
end;

function uf_GetRecID(tbName: String): Integer;
var Qry: TFDQuery;
var SNo: Integer;
var Cmd: String;
begin
  SNo := 1;
  try
    Qry := TFDQuery.Create(Nil);
    try
      Qry.Connection := DMain.ADCon;
      Cmd := 'Select IsNull(TableRecID, 0) as TableRecID from R_RecID Where Upper(TableName) = '+QuotedStr(UpperCase(tbName));
      Qry.Open(Cmd);
      if Qry.IsEmpty then
      begin
        Cmd := SqlInsert('R_RecID',['TableName','TableRecID'],
                        [QuotedStr(UpperCase(tbName)),IntToStr(SNo)]);
        DMain.ADCon.ExecSQL(Cmd);
      end;
      if not Qry.IsEmpty then
      begin
        SNo := Qry.FieldByName('TableRecID').AsInteger + 1;
        Cmd := SqlUpdate('R_RecID',['TableRecID'],
                        [IntToStr(SNo)],
                        'Upper(TableName) = ' + QuotedStr(UpperCase(tbName)));
        DMain.ADCon.ExecSQL(Cmd);
      end;
      Qry.Close;
    finally
      Qry.Free;
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Получение ID записи таблицы', E, Cmd));
  end;
  Result := SNo;
end;

function uf_DateToStr(V: Variant; Fmt: String = 'YYYY-MM-DD'; IsQuoted: Boolean = True): String;
var R: String;
begin
  if V <> null then
     R := FormatDateTime(Fmt, V)
  else
     R := '';
  if IsQuoted then
     R := QuotedStr(R);
  Result := R;
end;

function uf_GetMaskedCardNo(CardNo: String): String;
begin
  Result := CardNo;
  if not glSetup.IsPanMasked then Exit;
  Result := Copy(CardNo, 1, glSetup.PanStartView)+'XXXXXX'+
            Copy(CardNo, Length(CardNo)-(glSetup.PanEndView-1), Length(CardNo));
end;

function uf_GetCardProductCode(CardNo: String): String;
var Qry: TFDQuery;
var Cmd: String;
begin
  Result := Copy(CardNo, 1, 6);
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMain.ADCon;
    Cmd := 'Select top 1 * from R_CardProducts '+
                    'Where Code = SubString(:CardNo, 1, Length(Code)) '+
                    'Order by Length(Code) Desc';
    Qry.SQL.Text := Cmd;
    Qry.ParamByName('CardNo').Value := CardNo;
    Qry.Open;
    if Qry.IsEmpty then Exit;
    Result := Qry.FieldByName('Code').AsString;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure uf_SendEMails();
var Qry: TFDQuery;
var Smtp: TIdSMTP;
var Msg:TIdMessage;
var S: String;
begin
  if (not glSetup.IsEmailPins) and
     (not glSetup.IsEmailCards) then
     Exit;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMain.ADCon;
    Qry.SQL.Text := 'Select * from V_IssHeads Where (IsIssued = True) and '+
                    '((IsGotPins = False) or (IsGotCards = False))';
    Qry.Open;
    Smtp := TIdSMTP.Create(nil);
    Msg := TIdMessage.Create(nil);
    try
      try
        Smtp.AuthType := satDefault;
        Smtp.Host := glSetup.EmailHost;
        Smtp.Port := glSetup.EmailPort;
        Smtp.Username := glSetup.EmailUserName;
        Smtp.Password := glSetup.EmailPassword;
        Msg.From.Text := glSetup.EmailFromName;
        Msg.CharSet := 'windows-1251';
        Msg.From.Address:= glSetup.EmailFromAddr;
        Msg.From.Name   := glSetup.EmailFromName;
        Msg.Subject     := glSetup.EmailSubject;
        Smtp.Connect;
        while not Qry.Eof do
        begin
          if Qry.FieldByName('PersPinEmail').IsNull then
             uf_WriteToLog('Невозможно отправить почту',['Не указан email по ПИНам']);
          if Qry.FieldByName('PersCardEmail').IsNull then
             uf_WriteToLog('Невозможно отправить почту',['Не указан email по картам']);
          if (glSetup.IsEmailPins) and
             (not Qry.FieldByName('PersPinEmail').IsNull) then
          begin
            S := 'Пакет № '+VarToStr(Qry['RRowID'])+' от '+uf_DateToStr(Qry['PackDate'], 'YYYY-MM-DD', False)+' '+
                 ' Количество: '+VarToStr(Qry['TotCount'])+' '+
                 ' Филиал: '+VarToStr(Qry['Branch'])+' '+VarToStr(Qry['BranchName']);
            Msg.Body.Clear;
            Msg.Body.Add(glSetup.EmailPinBody+' '+S);
            Msg.Recipients.EMailAddresses := VarToStr(Qry['PersPinEmail'])+';'+
                glSetup.EmailRecCopy;
            Msg.IsEncoded := True;
            if Smtp.Connected then
            begin
              Smtp.Send(Msg);
              uf_WriteToLog('Отправка email',['ПИН-конверты: '+Msg.Recipients.EMailAddresses]);
            end;
          end;
          if (glSetup.IsEmailCards) and
             (not Qry.FieldByName('PersCardEmail').IsNull) then
          begin
            Msg.Body.Clear;
            Msg.Body.Add(glSetup.EmailCardBody+' '+S);
            Msg.Recipients.EMailAddresses := VarToStr(Qry['PersCardEmail'])+';'+
                glSetup.EmailRecCopy;
            Msg.IsEncoded := True;
            if Smtp.Connected then
            begin
              Smtp.Send(Msg);
              uf_WriteToLog('Отправка email.',['Кaрты: '+Msg.Recipients.EMailAddresses]);
            end;
          end;
          Qry.Next;
        end;
        Smtp.Disconnect(False);
      except
        on e:Exception do
        begin
          if Smtp.Connected then
          try
            Smtp.Disconnect(False);
          except
          end;
          uf_WriteToLog('Отправка e-mail',
                        [E.Message,
                         'Отправка e-mail. Хост: '+glSetup.EmailHost,
                         'Порт: '+IntToStr(glSetup.EmailPort),
                         'Имя пользователя: '+glSetup.EmailUserName,
                         'Пароль: '+glSetup.EmailPassword,
                         'Из адреса: '+glSetup.EmailFromAddr,
                         'От имени: '+glSetup.EmailFromName]);
        end;
      end;
    finally
      Smtp.Free;
      Msg.Free;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function uf_DBPackTables(): Boolean;
var Qry: TFDQuery;
var Cmd, S: String;
begin
  Result := True;
  try
    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := DMain.ADCon;
      Cmd := 'Select * from System.Tables';
      Qry.Open(Cmd);
      while not Qry.Eof do
      begin
        S := Qry.FieldByName('Name').AsString;
        Cmd := 'EXECUTE PROCEDURE sp_PackTable('+QuotedStr(S)+')';
        try
          DMain.ADCon.ExecSQL(Cmd);
          uf_WriteToLog('Упаковка таблицы',[S]);
        except
          on E: Exception do
             uf_ErrorToLog('Упаковка таблиц БД',E,Cmd);
        end;
        Qry.Next;
      end;
      Qry.Close;
    finally
      Qry.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      uf_ErrorToLog('Упаковка таблиц БД', E, Cmd);
    end;
  end;
end;

function uf_DBArcCopy(FName: String): Boolean;
var Zip: TAbZipper;
begin
  Result := True;
  try
    Zip := TAbZipper.Create(nil);
    try
      Zip.FileName := FName;
      Zip.BaseDirectory := glSetup.DbaPath;
      Zip.Password := PFX_DBA + 'KHURSHEDU';
      Zip.LogFile := glSetup.AppPath + 'UniSzip.log';
      Zip.Logging := True;
      Zip.AddFiles(C_DATADIC, faAnyFile);
      Zip.AddFiles(uf_FileBase(C_DATADIC)+'.am', faAnyFile);
      Zip.AddFiles(uf_FileBase(C_DATADIC)+'.ai', faAnyFile);
      Zip.AddFiles('*.adt', faAnyFile);
      Zip.AddFiles('*.adi', faAnyFile);
      Zip.AddFiles('*.adm', faAnyFile);
      Zip.Save;
    finally
      Zip.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage(uf_ErrorToLog('Создание zip файла БД', E));
    end;
  end;
end;

function uf_DBCreateBackup(): Boolean;
var Cmd: String;
begin
  Result := True;
  try
    Cmd := 'EXECUTE PROCEDURE sp_BackupDatabase(' +QuotedStr(glSetup.DbaPath)+', null)';
    try
      DMain.ADCon.ExecSQL(Cmd);
    finally
      uf_WriteToLog('Создание серверного бэкапа',[]);
    end;
  except
    on E: Exception do
    begin
      Result := False;
      uf_ErrorToLog('Создание серверного бэкапа', E, Cmd);
    end;
  end;
end;

function uf_DBBackup(): Boolean;
var FName, FDestName: String;
var i: Integer;
var FList: TStringDynArray;
begin
  Result := True;
  try
    try
      for i := DMain.ADCon.DataSetCount-1 downto 0 do
          DMain.ADCon.DataSets[i].Disconnect(True);
    except
      on E: Exception do
         uf_ErrorToLog('Копия БД. Отсоединение таблиц БД', E);
    end;

    if (UpperCase(DMain.ADCon.Params.Values['ServerTypes']) = 'REMOTE') then
        uf_DBCreateBackup();

    FList := TDirectory.GetFiles(glSetup.DbfPath, '*.a*');
    for i := 0 to Length(FList) - 1 do
    begin
      try
        FDestName := glSetup.DbaPath + ExtractFileName(FList[i]);
        TFile.Copy(FList[i], FDestName, True);
      except
        on E: Exception do
           uf_ErrorToLog('Копия БД. Копирование файла:'+FList[i], E);
      end;
    end;

    FName := glSetup.DbaPath + PFX_DBA + FormatDateTime('YYYYMMDDHHMMSS',Now()) + '.zip';
    if uf_DBArcCopy(FName) then
       uf_WriteToLog('Создана архивная копия БД: '+FName,[]);

    FList := TDirectory.GetFiles(glSetup.DbaPath, '*.a*');
    for i := 0 to Length(FList) - 1 do
    begin
      try
        TFile.Delete(FList[i]);
      except
        on E: Exception do
           uf_ErrorToLog('Копия БД. Удаление файла:'+FList[i], E);
      end;
    end;
    uf_DBPackTables();
    DMain.ADCon.Connected := False;
    DMain.ADCon.Connected := True;
  except
    on E: Exception do
    begin
      Result := False;
      uf_ErrorToLog('Создание резервной копии БД', E);
    end;
  end;
end;

procedure TDMain.ADConBeforeConnect(Sender: TObject);
begin
  try
    if glSetup.RemoteAccess then
    begin
      DMain.ADCon.Params.Values['ServerTypes'] := 'Remote';
      uf_WriteToLog('Соединение с БД.',['Тип соеднинения: серверная']);
    end else
    begin
      DMain.ADCon.Params.Values['ServerTypes'] := 'Local';
      uf_WriteToLog('Соединение с БД.',['Тип соеднинения: локальная']);
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Установка параметров перед соединением с БД (before connect)', E));
  end;
end;

procedure TDMain.LogOut;
begin
  DMain.ADCon.Connected := False;
end;

function uf_GetBranchDatas(Branch: Integer): Boolean;
var Qry: TFDQuery;
var ActNo: Integer;
var Cmd: String;
begin
  Result := False;
  try
    glRecBranch.MandPersPins  := null;
    glRecBranch.MandPersCards := null;
    glRecBranch.MandPostPins  := null;
    glRecBranch.MandPostCards := null;
    glRecBranch.MandNoPins    := null;
    glRecBranch.MandNoCards   := null;
    glRecBranch.MandDatePins  := null;
    glRecBranch.MandDateCards := null;
    glRecBranch.FilesPath := '';
    glRecBranch.FilesMask := '';
    glRecBranch.FilesBack := '';
    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := DMain.ADCon;
      Cmd := 'Select * from R_Branches Where Code = '+IntToStr(Branch);
      Qry.SQL.Text := Cmd;
      Qry.Open;
      if Qry.IsEmpty then Exit;
      Result := True;
      glRecBranch.MandPersPins  := VarToStr(Qry['MandPersPins']);
      glRecBranch.MandPersCards := VarToStr(Qry['MandPersCards']);
      glRecBranch.MandPostPins  := VarToStr(Qry['MandPostPins']);
      glRecBranch.MandPostCards := VarToStr(Qry['MandPostCards']);
      glRecBranch.MandNoPins    := VarToStr(Qry['MandNoPins']);
      glRecBranch.MandNoCards   := VarToStr(Qry['MandNoCards']);
      glRecBranch.MandDatePins  := Qry['MandDatePins'];
      glRecBranch.MandDateCards := Qry['MandDateCards'];
      glRecBranch.FilesPath     := VarToStr(Qry['FilesPath']);
      glRecBranch.FilesBack     := VarToStr(Qry['FilesBack']);
      if (glRecBranch.FilesPath <> '') then
          uf_AddSlash(glRecBranch.FilesPath);
      if (glRecBranch.FilesBack <> '') then
          uf_AddSlash(glRecBranch.FilesBack);
      if VarIsNull(Qry['ActNo']) then
         ActNo := 1
      else
         ActNo := Qry['ActNo']+1;
      Qry.Close;
      Cmd := 'Update R_Branches Set ActNo = '+IntToStr(ActNo)+' '+
                          'Where Code = '+IntToStr(Branch);
      DMain.ADCon.ExecSQL(Cmd);
      glRecBranch.ActNo := ActNo;
    finally
      Qry.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage(uf_ErrorToLog('Получение данных филиала', E, Cmd));
    end;
  end;
end;

function uf_UserAccessTypes(ATblName: String; var ARec: TTableAccesses): Boolean;
var Qry: TFDQuery;
var Cmd, cUser: String;
begin
  Result := True;
  ARec.InitDatas(False);
  if glSetup.IsAdmin then
  begin
    ARec.InitDatas(True);
    Exit;
  end;
  Qry := TFDQuery.Create(Nil);
  try
    try
      Qry.Connection := DMain.ADCon;
      cUser := LowerCase(DMain.ADCon.Params.Values['User_Name']);
      ATblName := LowerCase(ATblName);
      Cmd := 'Select * from V_Accesses '+
                'Where (Lower(Login) = '+QuotedStr(cUser)+') and '+
                      '(Lower(TableName) = '+QuotedStr(ATblName)+')';
      Qry.Open(Cmd);
      if not Qry.IsEmpty then
      begin
        ARec.IsAccess := Qry.FieldByName('IsAccess').AsBoolean;
        ARec.IsAdd    := Qry.FieldByName('IsAdd').AsBoolean;
        ARec.IsEdit   := Qry.FieldByName('IsEdit').AsBoolean;
        ARec.IsDelete := Qry.FieldByName('IsDelete').AsBoolean;
      end;
      Qry.Close;
    except
      on E: Exception do
      begin
        Result := False;
        ShowMessage(uf_ErrorToLog('Получение прав доступа', E, Cmd));
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure uf_GetSetups();
var Qry: TFDQuery;
var R: Integer;
var Cmd: String;
begin
  try
    Qry := TFDQuery.Create(Nil);
    try
      Qry.Connection := DMain.ADCon;
      Cmd := 'Select * from V_Setups Order by Code';
      Qry.SQL.Text := Cmd;
      Qry.Open;
      while not Qry.Eof do
      begin
        R := Qry.FieldByName('Code').AsInteger;
        case R of
          STP_ORGCODE      : glSetup.OrgCode     := Qry.FieldByName('ValInteger').AsInteger;
          STP_ORGNAME      : glSetup.OrgName     := Qry.FieldByName('ValString').AsString;
          STP_CHPOST       : glSetup.ChiefPost   := Qry.FieldByName('ValString').AsString;
          STP_CHBOARD      : glSetup.ChiefBoard  := Qry.FieldByName('ValString').AsString;
          STP_DVPOST       : glSetup.HeadPost    := Qry.FieldByName('ValString').AsString;
          STP_DVBOARD      : glSetup.HeadDepart  := Qry.FieldByName('ValString').AsString;
          STP_ADDRESS      : glSetup.Address     := Qry.FieldByName('ValString').AsString;
          STP_PHONES       : glSetup.Phones      := Qry.FieldByName('ValString').AsString;
          STP_ISEMAILPINS  : glSetup.IsEmailPins   := Qry.FieldByName('ValLogical').AsBoolean;
          STP_ISEMAILCARDS : glSetup.IsEmailCards  := Qry.FieldByName('ValLogical').AsBoolean;
          STP_EMAILHOST    : glSetup.EmailHost     := Qry.FieldByName('ValString').AsString;
          STP_EMAILPORT    : glSetup.EmailPort     := Qry.FieldByName('ValInteger').AsInteger;
          STP_EMAILUSERNAME: glSetup.EmailUserName := Qry.FieldByName('ValString').AsString;
          STP_EMAILPASSWORD: glSetup.EmailPassword := Qry.FieldByName('ValString').AsString;
          STP_EMAILFROMADDR: glSetup.EmailFromAddr := Qry.FieldByName('ValString').AsString;
          STP_EMAILFROMNAME: glSetup.EmailFromName := Qry.FieldByName('ValString').AsString;
          STP_EMAILSUBJECT : glSetup.EmailSubject  := Qry.FieldByName('ValString').AsString;
          STP_EMAILPINBODY : glSetup.EmailPinBody  := Qry.FieldByName('ValString').AsString;
          STP_EMAILCARDBODY: glSetup.EmailCardBody := Qry.FieldByName('ValString').AsString;
          STP_EMAILRECCOPY : glSetup.EmailRecCopy  := Qry.FieldByName('ValString').AsString;
          STP_OPERDATE     : glSetup.OperDate      := Qry.FieldByName('ValDate').AsVariant;
          STP_ISARCDBASE   : glSetup.IsArcDb       := Qry.FieldByName('ValLogical').AsBoolean;
          STP_ISPACKDBASE  : glSetup.IsPackDb      := Qry.FieldByName('ValLogical').AsBoolean;
          STP_RECOUTFILEAMT: glSetup.RecOutFileAmt := Qry.FieldByName('ValInteger').AsInteger;
          STP_RECGETAMOUNT : glSetup.RecGetAmt     := Qry.FieldByName('ValInteger').AsInteger;
          STP_PANMASKED    : glSetup.IsPanMasked   := Qry.FieldByName('ValLogical').AsBoolean;
          STP_PANSTARTVIEW : glSetup.PanStartView  := Qry.FieldByName('ValInteger').AsInteger;
          STP_PANENDVIEW   : glSetup.PanEndView    := Qry.FieldByName('ValInteger').AsInteger;
          STP_ISBACKUPFILES: glSetup.IsBackupFiles := Qry.FieldByName('ValLogical').AsBoolean;
        end;
        Qry.Next;
      end;
      Qry.Close;
      if (glSetup.RecGetAmt <= 0) then
          glSetup.RecGetAmt := 150;
    finally
      Qry.Free;
    end;
    if (glSetup.RecOutFileAmt <= 0) then glSetup.RecOutFileAmt := 15;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Получение настроек программы', E, Cmd));
  end;
end;

function uf_GetUserDatas(): Boolean;
var Qry: TFDQuery;
var Cmd, cUser: String;
begin
  Result := True;
  try
    cUser := LowerCase(DMain.ADCon.Params.Values['User_Name']);
    Qry := TFDQuery.Create(nil);
    try
        Qry.Connection := DMain.ADCon;
        Cmd := 'Select * from V_Users Where Lower(Login) = '+QuotedStr(cUser);
        Qry.Open(Cmd);
        if Qry.IsEmpty then Result := False;
        if not Qry.IsEmpty then Exit;
    finally
      Qry.Close;
      Qry.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage(uf_ErrorToLog('Получение данных пользователя', E, Cmd));
    end;
  end;
end;

procedure uf_SetOperDate();
var Cmd: String;
begin
  Cmd := 'Update R_Setups Set ValDate = Current_Date() Where Code = '+IntToStr(STP_OPERDATE);
  try
    DMain.ADCon.ExecSQL(Cmd);
  except
    on E: Exception do
      uf_ErrorToLog('Открытие операционного дня', E, Cmd);
  end;
  uf_SendEMails();
end;

procedure TDMain.ADConAfterConnect(Sender: TObject);
begin
  try
    glSetup.UserName := LowerCase(DMain.ADCon.Params.Values['User_Name']);
    if (glSetup.UserName = SYS_ADMIN) then
        glSetup.IsSysAdmin := True;
    if (glSetup.UserName = PRO_ADMIN) then
        glSetup.IsProAdmin := True;
    if (glSetup.UserName = USR_ADMIN) then
        glSetup.IsUserAdmin := True;

    glSetup.IsAdmin := glSetup.IsSysAdmin or glSetup.IsProAdmin or glSetup.IsUserAdmin;

    glSetup.OperDate := Null;
    uf_GetSetups();
    uf_GetUserDatas();

    DMain.tbBranches.Open;
    DMain.tbCardProds.Open;

    if VarIsNull(glSetup.OperDate) or (glSetup.OperDate <> Date()) then
    begin
      uf_SetOperDate();
      uf_GetSetups();
      uf_DBBackup();
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Открытие таблиц программы', E));
  end;
end;

end.
