object frmSQL: TfrmSQL
  Left = 236
  Top = 150
  Caption = 'SQL '#1059#1090#1080#1083#1080#1090#1072
  ClientHeight = 483
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  Padding.Left = 3
  Padding.Top = 3
  Padding.Right = 3
  Padding.Bottom = 3
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Panel3: TPanel
    Left = 687
    Top = 3
    Width = 185
    Height = 477
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 684
    ExplicitTop = 0
    DesignSize = (
      185
      477)
    object BitBtn1: TBitBtn
      Left = 9
      Top = 44
      Width = 165
      Height = 30
      Action = acExecute
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 11
      Top = 445
      Width = 165
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 9
    end
    object BitBtn3: TBitBtn
      Left = 9
      Top = 83
      Width = 165
      Height = 30
      Action = acExport
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 9
      Top = 113
      Width = 165
      Height = 30
      Action = acExcel
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 9
      Top = 143
      Width = 165
      Height = 30
      Action = acGridPrint
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      Left = 9
      Top = 173
      Width = 165
      Height = 30
      Action = acBestFit
      Caption = #1054#1087#1090#1080#1084#1072#1083#1100'. '#1087#1086#1076#1075#1086#1085#1082#1072
      TabOrder = 5
    end
    object chkIsNewRecord: TDBCheckBoxEh
      Left = 17
      Top = 246
      Width = 122
      Height = 17
      Caption = #1042#1089#1090#1072#1074#1082#1072' '#1085#1086#1074#1086#1075#1086
      DynProps = <>
      TabOrder = 6
      OnClick = chkIsNewRecordClick
    end
    object chkIsEditRecord: TDBCheckBoxEh
      Left = 17
      Top = 266
      Width = 137
      Height = 17
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      DynProps = <>
      TabOrder = 7
      OnClick = chkIsEditRecordClick
    end
    object chkIsDelRecord: TDBCheckBoxEh
      Left = 17
      Top = 287
      Width = 97
      Height = 17
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      DynProps = <>
      TabOrder = 8
      OnClick = chkIsDelRecordClick
    end
    object BitBtn7: TBitBtn
      Left = 9
      Top = 14
      Width = 165
      Height = 30
      Action = acLoadScript
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 3
    Top = 3
    Width = 684
    Height = 477
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 201
      Width = 684
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 692
    end
    object Panel2: TPanel
      Left = 0
      Top = 204
      Width = 684
      Height = 273
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 1
      ParentBackground = False
      TabOrder = 1
      object cxGridSqlQuery: TcxGrid
        Left = 3
        Top = 3
        Width = 678
        Height = 267
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object btvSqlQuery: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = srSqlQuery
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsView.Footer = True
          OptionsView.Indicator = True
        end
        object cxGridSqlQueryLevel1: TcxGridLevel
          GridView = btvSqlQuery
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 684
      Height = 201
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 1
      ParentBackground = False
      TabOrder = 0
      object SqlMemo: TMemo
        Left = 1
        Top = 1
        Width = 682
        Height = 199
        Align = alClient
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object ActionList1: TActionList
    Left = 56
    Top = 85
    object acExecute: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ImageIndex = 0
      OnExecute = acExecuteExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acExport: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      OnExecute = acExportExecute
    end
    object acExcel: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      OnExecute = acExcelExecute
    end
    object acGridPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      OnExecute = acGridPrintExecute
    end
    object acBestFit: TAction
      Caption = #1054#1087#1090#1080#1084#1072#1083#1100'. '#1087#1086#1076#1075#1086#1085#1082#1072
      OnExecute = acBestFitExecute
    end
    object acLoadScript: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      OnExecute = acLoadScriptExecute
    end
  end
  object srSqlQuery: TDataSource
    DataSet = dsSqlQuery
    Left = 184
    Top = 86
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGridSqlQuery
    PopupMenus = <>
    Left = 264
    Top = 86
  end
  object dxPrintGrid: TdxComponentPrinter
    CurrentLink = dxPrintGridLink1
    Version = 0
    Left = 343
    Top = 87
    object dxPrintGridLink1: TdxGridReportLink
      Component = cxGridSqlQuery
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
  object SMExportDlg: TSMEWizardDlg
    DataFormats.DateOrder = doDMY
    DataFormats.DateSeparator = '.'
    DataFormats.TimeSeparator = ':'
    DataFormats.FourDigitYear = True
    DataFormats.LeadingZerosInDate = True
    DataFormats.ThousandSeparator = #160
    DataFormats.DecimalSeparator = ','
    DataFormats.CurrencyString = #1088'.'
    DataFormats.BooleanTrue = 'True'
    DataFormats.BooleanFalse = 'False'
    DataFormats.UseRegionalSettings = False
    KeyGenerator = 'SMExport 4.77'
    TitleStatus = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1085#1080#1077'...'
    Statistic.CurrentRowHeight = 0
    Columns = <>
    Bands = <>
    ColumnSource = csDataSet
    Formats = [teParadox, teDBase, teText, teHTML, teXLS, teExcel, teWord, teSYLK, teDIF, teWKS, teQuattro, teSQL, teXML, teAccess, teClipboard, teRTF, teSPSS, tePDF, teLDIF, teADO]
    Categories.TextFont.Charset = DEFAULT_CHARSET
    Categories.TextFont.Color = clHighlightText
    Categories.TextFont.Height = -11
    Categories.TextFont.Name = 'MS Sans Serif'
    Categories.TextFont.Style = [fsBold]
    TextQualifier = #0
    Separator = #9
    RecordSeparator = #13#10
    Fixed = False
    TableType = teText
    FileName = 'D:\Software\Delphi7\Bin\SMExport.TXT'
    CharacterSet = csANSI_WINDOWS
    ExportStyle.Style = esNormal
    ExportStyle.OddColor = clBlack
    ExportStyle.EvenColor = clBlack
    UserAccess.Specification = True
    SQLOptions.AddCreateTable = False
    SQLOptions.CommitTerm = 'COMMIT;'
    SQLOptions.SQLQuote = '"'
    SQLOptions.SQLTerm = ';'
    SQLOptions.SQLTypes.ftString = 'CHAR(%d)'
    SQLOptions.SQLTypes.ftSmallint = 'INTEGER'
    SQLOptions.SQLTypes.ftInteger = 'INTEGER'
    SQLOptions.SQLTypes.ftWord = 'INTEGER'
    SQLOptions.SQLTypes.ftBoolean = 'INTEGER'
    SQLOptions.SQLTypes.ftFloat = 'DECIMAL'
    SQLOptions.SQLTypes.ftCurrency = 'MONEY'
    SQLOptions.SQLTypes.ftBCD = 'DECIMAL'
    SQLOptions.SQLTypes.ftDate = 'DATETIME'
    SQLOptions.SQLTypes.ftTime = 'DATETIME'
    SQLOptions.SQLTypes.ftDateTime = 'DATETIME'
    SQLOptions.SQLTypes.ftAutoInc = 'IDENTITY'
    SQLOptions.SQLTypes.ftBlob = 'BLOB'
    SQLOptions.SQLTypes.ftMemo = 'BLOB'
    SQLOptions.SQLTypes.ftGraphic = 'IMAGE'
    SQLOptions.SQLTypes.ftLargeint = 'INTEGER'
    SQLOptions.SQLNULL = 'NULL'
    FilterName = 'MS Word 97'
    Left = 406
    Top = 87
  end
  object dsSqlQuery: TFDQuery
    Connection = DMain.ADCon
    Left = 121
    Top = 86
  end
end
