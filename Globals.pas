unit Globals;

interface
uses System.SysUtils,
     System.Variants;

 Const SEC_PATHES    = 'PATHES';
 Const SEC_SETTINGS  = 'SETTINGS';

 Const SFT_VERSIONNO = 'v2.1.0';
 Const SFT_NAME      = 'ProCards';
 Const SFT_LOGFILE   = 'ProCards.Log';
 Const SFT_VERSION   = 'Version '+SFT_VERSIONNO;
 Const SFT_COPYRIGHT = 'Copyright(C) 2008-2014 Ulugov Khurshed';
 Const SFT_CONTACTS  = 'Contacts: smartits@mail.ru';

 Const DEF_DBF_PATH = 'DBase\';
 Const DEF_DBB_PATH = 'DBBackup\';
 Const DEF_ARC_PATH = 'Archive\';
 Const DEF_REP_PATH = 'Reports\';
 Const DEF_EXC_PATH = 'Exchange\';
 Const DEF_BCK_PATH = 'Backup\';

 Const C_DATADIC = 'ProCards.add';
 Const C_PRGINI  = 'ProCards.ini';
 Const C_LOCAL   = 'ProCardsL.ini';

 Const C_DBFPATH = 'DBF_PATH';
 Const C_DBBPATH = 'DBB_PATH';
 Const C_ARCPATH = 'ARC_PATH';
 Const C_REPPATH = 'REP_PATH';
 Const C_EXCPATH = 'EXC_PATH';
 Const C_BCKPATH = 'BCK_PATH';
 Const C_REMACCESS = 'REMOTE';

 Const SYS_ADMIN = 'adssys';
 Const PRO_ADMIN = 'admin';
 Const USR_ADMIN = 'master';

 Const USR_CHG_PSW = 100;

 Const SYS_ADM = 1;
 Const USR_ADM = 2;

 Const LOG_ERR = 'ERR:';
 Const LOG_INF = 'INF:';

 Const PFX_DBA  = 'DBA';

 Const RS_INSERT = 1;
 Const RS_EDIT   = 2;
 Const RS_VIEW   = 3;

 Const C_TJS = 972;

 Const STP_ORGCODE      = 1;  // Код организации
 Const STP_ORGNAME      = 2;  // Название организации
 Const STP_ORGSHNAME    = 3;  // Короткое название организации
 Const STP_CHPOST       = 4;  // Должность председателя организации
 Const STP_CHSURNAME    = 5;  // Председатель: Фамилия
 Const STP_CHFIRSTNAME  = 6;  // Председатель: Имя
 Const STP_CHPATRONYMIC = 7;  // Председатель: Отчество
 Const STP_CHBOARD      = 8;  // ФИО Председателя коротко
 Const STP_DVPOST       = 9;  // Должность начальника департамента
 Const STP_DVSURNAME    = 10; // Начальник департамента: Фамилия
 Const STP_DVFIRSTNAME  = 11; // Начальник департамента: Имя
 Const STP_DVPATRONYMIC = 12; // Начальник департамента: Отчество
 Const STP_DVBOARD      = 13; // Ф.И.О. Рук. департамента - коротко
 Const STP_CHACCOUNTANT = 14; // Главный бухгалтер
 Const STP_ADDRESS      = 15; // Адрес организации
 Const STP_PHONES       = 16; // Телефоны организации
 Const STP_INN          = 17; // ИНН организации
 Const STP_ISEMAILPINS   = 18; // Email для ПИН-ов
 Const STP_ISEMAILCARDS  = 19; // Email для кард
 Const STP_EMAILHOST     = 20; // Email хост
 Const STP_EMAILPORT     = 21; // Email порт
 Const STP_EMAILUSERNAME = 22; // Email имя пользователя
 Const STP_EMAILPASSWORD = 23; // Email пароль
 Const STP_EMAILFROMADDR = 24; // Email от адреса
 Const STP_EMAILFROMNAME = 25; // Email от имени
 Const STP_EMAILSUBJECT  = 26; // Email тема
 Const STP_EMAILPINBODY  = 27; // Email тело сообщения по ПИН
 Const STP_EMAILCARDBODY = 28; // Email тело сообщения по картам
 Const STP_EMAILRECCOPY  = 29; // Email адреса для копии
 Const STP_OPERDATE      = 30; // Операционный день
 Const STP_ISARCDBASE    = 31; // Архивировать ли бэкап БД?
 Const STP_ISPACKDBASE   = 32; // Упаковать ли БД после закрытия опер. дня?
 Const STP_RECOUTFILEAMT = 33; // Количество выгружаемых строк в выходной файл
 Const STP_RECGETAMOUNT  = 34; // Количество возвращаемых записей при поиске
 Const STP_PANMASKED     = 35; // Маскируются ли номера карт
 Const STP_PANSTARTVIEW  = 36; // Начало видимых номеров карт
 Const STP_PANENDVIEW    = 37; // Конец видимых номеров карт
 Const STP_ISBACKUPFILES = 38; // Бэкапировать ли загружаемые файлы

 Const VT_STRING   = 1; // Информация по клиенту: строковая
 Const VT_INTEGER  = 2; // Информация по клиенту: числовая
 Const VT_NUMERIC  = 3; // Информация по клиенту: числовая
 Const VT_DATE     = 4; // Информация по клиенту: дата и время
 Const VT_TIME     = 5; // Информация по клиенту: дата и время
 Const VT_DATETIME = 6; // Информация по клиенту: дата и время
 Const VT_LOGICAL  = 7; // Информация по клиенту: логическая

 Const TBR_ACCESSES     = 'R_ACCESSES';
 Const TBR_USERS        = 'R_USERS';
 Const TBR_SETUPS       = 'R_SETUPS';
 Const TBR_REPORTS      = 'R_REPORTS';
 Const TBR_BRANCHES     = 'R_BRANCHES';
 Const TBR_CARDPRODUCTS = 'R_CARDPRODUCTS';
 Const TBS_ISSHEADS     = 'S_ISSHEADS';
 Const TBS_ISSDETAILS   = 'S_ISSDETAILS';

 Type 
     TSetup = Record
        UserName   : String;
        IsAdmin    : Boolean;
        IsViewer   : Boolean;
        IsUser     : Boolean;

        IsSysAdmin   : Boolean; // Администратор системы
        IsProAdmin   : Boolean; // Администратор программы
        IsUserAdmin  : Boolean; // Основной пользователь: бухгалтер

        AppPath    : String;
        DbfPath    : String;
        DbaPath    : String;
        ArcPath    : String;
        RepPath    : String;
        ExcPath    : String;
        BckPath    : String;
        RemoteAccess : Boolean;   // Программа: Разрешен ли удаленный доступ

        OrgCode    : Integer;
        OrgName    : String;
        Address    : String;
        Phones     : String;
        ChiefPost  : String;
        ChiefBoard : String;     // ФИО Председателя: коротко
        HeadPost   : String;
        HeadDepart : String;     // ФИО Начальника управления: коротко

        IsEmailPins   : Boolean;
        IsEmailCards  : Boolean;
        EmailHost     : String;
        EmailPort     : Integer;
        EmailUserName : String;
        EmailPassword : String;
        EmailFromAddr : String;
        EmailFromName : String;
        EmailSubject  : String;
        EmailPinBody  : String;
        EmailCardBody : String;
        EmailRecCopy  : String;

        OperDate   : Variant;
        IsArcDb    : Boolean;
        IsPackDb   : Boolean;
        IsPanMasked: Boolean;
        IsBackupFiles : Boolean; // Бэкапировать ли загружаемые файлы
        RecOutFileAmt : Integer;
        RecGetAmt     : Integer;
        PanStartView  : Integer;
        PanEndView    : Integer;
    end;

     TBranchDatas = Record
        ActNo         : Variant;
        MandPersPins  : Variant;
        MandPersCards : Variant;
        MandPostPins  : Variant;
        MandPostCards : Variant;
        MandNoPins    : Variant;
        MandNoCards   : Variant;
        MandDatePins  : Variant;
        MandDateCards : Variant;
        FilesPath     : String;
        FilesMask     : String;
        FilesBack     : String;
        procedure InitDatas;
     end;

     TRecCards = Record
        ClientID        : Variant;
        ClientName      : Variant;
        ClientLatName   : Variant;
        ClientPasspNo   : Variant;
        CardNo          : Variant;
        CardProduct     : Variant;
        CardDateInput   : Variant;
        CardDateExpire  : Variant;
        CardNameOn      : Variant;
        CardServCode    : Variant;
        CardCost        : Variant;
        AccountNo       : Variant;
        Branch          : Variant;
        FNameOrig       : Variant;
        FNameDiv        : Variant;
        SrcLine         : String;
     end;

     TTableAccesses = record
        IsAccess : Boolean;
        IsAdd    : Boolean;
        IsEdit   : Boolean;
        IsDelete : Boolean;
        function AccessForUpsert: Boolean;
        procedure InitDatas(AAccess: Boolean);
     end;


 var glSetup     : TSetup;
 var glRecBranch : TBranchDatas;
 var glRecCard   : TRecCards;
 var glFmt: TFormatSettings;


implementation

function TTableAccesses.AccessForUpsert;
begin
  Result := IsAccess and IsAdd and IsEdit;
end;

procedure TTableAccesses.InitDatas(AAccess: Boolean);
begin
  IsAccess := AAccess;
  IsAdd    := AAccess;
  IsEdit   := AAccess;
  IsDelete := AAccess;
end;

procedure TBranchDatas.InitDatas;
begin
  ActNo         := null;
  MandPersPins  := null;
  MandPersCards := null;
  MandPostPins  := null;
  MandPostCards := null;
  MandNoPins    := null;
  MandNoCards   := null;
  MandDatePins  := null;
  MandDateCards := null;
end;

end.
