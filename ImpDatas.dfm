object frmImpDatas: TfrmImpDatas
  Left = 248
  Top = 195
  ActiveControl = DBGridEh1
  Caption = #1055#1072#1082#1077#1090#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'. '#1048#1079#1076#1072#1085#1080#1077
  ClientHeight = 472
  ClientWidth = 882
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
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 699
    Top = 3
    Width = 180
    Height = 466
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      180
      466)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 90
      Width = 165
      Height = 30
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
    end
    object BitBtn5: TBitBtn
      Left = 9
      Top = 410
      Width = 165
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 4
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 30
      Width = 165
      Height = 30
      Action = acPackImport
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 8
      Top = 120
      Width = 165
      Height = 30
      Action = acPackDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
    end
    object BitBtn8: TBitBtn
      Left = 8
      Top = 60
      Width = 165
      Height = 30
      Action = acPackProcess
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100'...'
      TabOrder = 1
    end
    object ProgBar: TProgressBar
      Left = 0
      Top = 449
      Width = 180
      Height = 17
      Align = alBottom
      TabOrder = 5
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 150
      Width = 165
      Height = 30
      Action = acPackEmpty
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1105
      TabOrder = 6
    end
  end
  object PageCtrlMain: TPageControl
    Left = 3
    Top = 3
    Width = 696
    Height = 466
    ActivePage = TSheetPackets
    Align = alClient
    TabOrder = 0
    object TSheetPackets: TTabSheet
      BorderWidth = 5
      Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1082#1077#1090#1086#1074
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 678
        Height = 427
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 1
        ParentBackground = False
        TabOrder = 0
        object DBGridEh1: TDBGridEh
          Left = 3
          Top = 3
          Width = 672
          Height = 421
          Align = alClient
          BorderStyle = bsNone
          DataSource = srImpDatas
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterRowCount = 1
          FooterParams.Color = clWindow
          FrozenCols = 1
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          IndicatorOptions = [gioShowRowIndicatorEh]
          OddRowColor = clSkyBlue
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
          SumList.Active = True
          SumList.VirtualRecords = True
          TabOrder = 0
          TitleParams.MultiTitle = True
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'RRowID'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ClientID'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ClientName'
              Footers = <>
              Width = 254
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ClientLatName'
              Footers = <>
              Width = 252
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ClientPasspNo'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CardNo'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CardProduct'
              Footers = <>
              Width = 112
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CardDateInput'
              Footers = <>
              Width = 117
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CardDateExpire'
              Footers = <>
              Width = 131
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CardNameOn'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CardServCode'
              Footers = <>
              Width = 89
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'AccountNo'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'FNameOrig'
              Footers = <>
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object TSheetLog: TTabSheet
      BorderWidth = 5
      Caption = #1046#1091#1088#1085#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 678
        Height = 427
        Align = alClient
        BevelInner = bvLowered
        BevelWidth = 2
        BorderWidth = 1
        ParentBackground = False
        TabOrder = 0
        object LogPackets: TMemo
          Left = 5
          Top = 5
          Width = 668
          Height = 417
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Fixedsys'
          Font.Style = []
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
    object TSheetInfo: TTabSheet
      BorderWidth = 5
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1086#1077
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 678
        Height = 427
        Align = alClient
        BevelInner = bvLowered
        BevelWidth = 2
        BorderWidth = 1
        Caption = 'Panel3'
        ParentBackground = False
        TabOrder = 0
        object Panel5: TPanel
          Left = 5
          Top = 5
          Width = 668
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 1
          ParentBackground = False
          TabOrder = 0
          object BitBtn7: TBitBtn
            Left = 12
            Top = 8
            Width = 130
            Height = 30
            Action = acMemoSave
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            TabOrder = 0
          end
        end
        object Panel6: TPanel
          Left = 5
          Top = 47
          Width = 668
          Height = 375
          Align = alClient
          BevelInner = bvLowered
          BorderWidth = 2
          ParentBackground = False
          TabOrder = 1
          object LineInfo: TMemo
            Left = 4
            Top = 4
            Width = 660
            Height = 367
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Fixedsys'
            Font.Style = []
            ImeName = #1056#1091#1089#1089#1082#1072#1103
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 232
    Top = 173
    object acPackImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      OnExecute = acPackImportExecute
    end
    object acPackDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acPackDeleteExecute
    end
    object acQuit: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acPackProcess: TAction
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100'...'
      OnExecute = acPackProcessExecute
    end
    object acMemoSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = acMemoSaveExecute
    end
    object acPackEmpty: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1105
      OnExecute = acPackEmptyExecute
    end
  end
  object SMImpDlg: TSMIWizardDlg
    AbortOnProblem = True
    AnimatedStatus = True
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
    SQLOptions.SQLTerm = ';'
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    OnErrorEvent = SMImpDlgErrorEvent
    OnGetCellParams = SMImpDlgGetCellParams
    OnBeforeExecute = SMImpDlgBeforeExecute
    Categories.TextFont.Charset = DEFAULT_CHARSET
    Categories.TextFont.Color = clHighlightText
    Categories.TextFont.Height = -11
    Categories.TextFont.Name = 'MS Sans Serif'
    Categories.TextFont.Style = [fsBold]
    Fixed = False
    Formats = [teParadox, teDBase, teText, teHTML, teXLS, teWKS, teQuattro, teXML, teAccess, teWord, teADO, teSPSS, teADT, teDBISAM, teClarion, teClipboard, teWAB, teVCalendar, teODS, teOutlook]
    SourceFileName = 'SMImport.SMI'
    UserAccess.Specification = True
    UserAccess.SpecificationSave = True
    UserAccess.SpecificationLoad = True
    UserAccess.SpecificationDelete = True
    RecordSeparatorCustom = #13#10
    XMLTags.RecordsTag = 'RECORDS'
    XMLTags.RecordTag = 'RECORD'
    XMLTags.RowTag = 'ROW'
    Left = 308
    Top = 173
  end
  object srImpDatas: TDataSource
    DataSet = tbImpDatas
    Left = 159
    Top = 173
  end
  object tbImpDatas: TFDQuery
    Connection = DMain.ADCon
    SQL.Strings = (
      'Select * from P_ImpDatas')
    Left = 68
    Top = 173
    object tbImpDatasRRowID: TFDAutoIncField
      FieldName = 'RRowID'
      Origin = 'RRowID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbImpDatasClientID: TIntegerField
      FieldName = 'ClientID'
      Origin = 'ClientID'
    end
    object tbImpDatasClientName: TWideStringField
      FieldName = 'ClientName'
      Origin = 'ClientName'
      FixedChar = True
      Size = 50
    end
    object tbImpDatasClientLatName: TWideStringField
      FieldName = 'ClientLatName'
      Origin = 'ClientLatName'
      FixedChar = True
      Size = 50
    end
    object tbImpDatasClientPasspNo: TWideStringField
      FieldName = 'ClientPasspNo'
      Origin = 'ClientPasspNo'
      FixedChar = True
      Size = 15
    end
    object tbImpDatasCardNo: TWideStringField
      FieldName = 'CardNo'
      Origin = 'CardNo'
      FixedChar = True
    end
    object tbImpDatasCardProduct: TIntegerField
      FieldName = 'CardProduct'
      Origin = 'CardProduct'
    end
    object tbImpDatasCardDateInput: TWideStringField
      FieldName = 'CardDateInput'
      Origin = 'CardDateInput'
      FixedChar = True
      Size = 5
    end
    object tbImpDatasCardDateExpire: TWideStringField
      FieldName = 'CardDateExpire'
      Origin = 'CardDateExpire'
      FixedChar = True
      Size = 5
    end
    object tbImpDatasCardNameOn: TWideStringField
      FieldName = 'CardNameOn'
      Origin = 'CardNameOn'
      FixedChar = True
      Size = 50
    end
    object tbImpDatasCardServCode: TWideStringField
      FieldName = 'CardServCode'
      Origin = 'CardServCode'
      FixedChar = True
      Size = 3
    end
    object tbImpDatasAccountNo: TWideStringField
      FieldName = 'AccountNo'
      Origin = 'AccountNo'
      FixedChar = True
    end
    object tbImpDatasFNameOrig: TWideStringField
      FieldName = 'FNameOrig'
      Origin = 'FNameOrig'
      FixedChar = True
      Size = 25
    end
  end
end
