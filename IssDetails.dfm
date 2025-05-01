object frmIssDetails: TfrmIssDetails
  Left = 244
  Top = 265
  Caption = #1047#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072
  ClientHeight = 509
  ClientWidth = 871
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
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object PageCtrlMain: TPageControl
    Left = 3
    Top = 3
    Width = 865
    Height = 464
    ActivePage = TSheetRecords
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    object TSheetRecords: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1087#1080#1089#1077#1081
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 697
        Height = 435
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 1
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 693
        ExplicitHeight = 425
        object cxGridIssDetails: TcxGrid
          Left = 3
          Top = 3
          Width = 691
          Height = 416
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          ExplicitWidth = 687
          ExplicitHeight = 406
          object btvIssDetails: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = srIssDetails
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'RRowID'
                Column = btvIssDetailsRRowID
              end>
            DataController.Summary.SummaryGroups = <>
            FilterRow.Visible = True
            FilterRow.ApplyChanges = fracImmediately
            OptionsBehavior.CellHints = True
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.MultiSelect = True
            OptionsView.Footer = True
            OptionsView.FooterMultiSummaries = True
            OptionsView.GroupFooterMultiSummaries = True
            OptionsView.GroupFooters = gfAlwaysVisible
            OptionsView.Indicator = True
            object btvIssDetailsRRowID: TcxGridDBColumn
              DataBinding.FieldName = 'RRowID'
            end
            object btvIssDetailsClientID: TcxGridDBColumn
              DataBinding.FieldName = 'ClientID'
              HeaderAlignmentHorz = taCenter
            end
            object btvIssDetailsClientName: TcxGridDBColumn
              DataBinding.FieldName = 'ClientName'
              HeaderAlignmentHorz = taCenter
              Width = 253
            end
            object btvIssDetailsClientLatName: TcxGridDBColumn
              DataBinding.FieldName = 'ClientLatName'
              HeaderAlignmentHorz = taCenter
              Width = 224
            end
            object btvIssDetailsClientPasspNo: TcxGridDBColumn
              DataBinding.FieldName = 'ClientPasspNo'
              HeaderAlignmentHorz = taCenter
            end
            object btvIssDetailsCardNo: TcxGridDBColumn
              DataBinding.FieldName = 'CardNo'
              HeaderAlignmentHorz = taCenter
            end
            object btvIssDetailsCardProduct: TcxGridDBColumn
              DataBinding.FieldName = 'CardProduct'
              HeaderAlignmentHorz = taCenter
              Width = 106
            end
            object btvIssDetailsCardProductName: TcxGridDBColumn
              DataBinding.FieldName = 'CardProductName'
              HeaderAlignmentHorz = taCenter
              Width = 267
            end
            object btvIssDetailsCardCost: TcxGridDBColumn
              DataBinding.FieldName = 'CardCost'
              HeaderAlignmentHorz = taCenter
              Width = 115
            end
            object btvIssDetailsCardDateInput: TcxGridDBColumn
              DataBinding.FieldName = 'CardDateInput'
              HeaderAlignmentHorz = taCenter
              Width = 116
            end
            object btvIssDetailsCardDateExpire: TcxGridDBColumn
              DataBinding.FieldName = 'CardDateExpire'
              HeaderAlignmentHorz = taCenter
              Width = 118
            end
            object btvIssDetailsCardNameOn: TcxGridDBColumn
              DataBinding.FieldName = 'CardNameOn'
              HeaderAlignmentHorz = taCenter
              Width = 273
            end
            object btvIssDetailsCardServCode: TcxGridDBColumn
              DataBinding.FieldName = 'CardServCode'
              HeaderAlignmentHorz = taCenter
              Width = 109
            end
            object btvIssDetailsAccountNo: TcxGridDBColumn
              DataBinding.FieldName = 'AccountNo'
              HeaderAlignmentHorz = taCenter
            end
            object btvIssDetailsFNameOrig: TcxGridDBColumn
              DataBinding.FieldName = 'FNameOrig'
              HeaderAlignmentHorz = taCenter
            end
            object btvIssDetailsFNameDiv: TcxGridDBColumn
              DataBinding.FieldName = 'FNameDiv'
              HeaderAlignmentHorz = taCenter
            end
          end
          object cxGridIssDetailsLevel1: TcxGridLevel
            GridView = btvIssDetails
          end
        end
        object ProgrBar: TProgressBar
          Left = 3
          Top = 419
          Width = 691
          Height = 13
          Align = alBottom
          TabOrder = 1
          ExplicitTop = 409
          ExplicitWidth = 687
        end
      end
      object CategoryPanelGroup1: TCategoryPanelGroup
        AlignWithMargins = True
        Left = 700
        Top = 3
        Width = 154
        Height = 429
        VertScrollBar.Tracking = True
        Align = alRight
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        TabOrder = 1
        ExplicitLeft = 693
        ExplicitTop = 0
        ExplicitHeight = 425
        object CategoryPanel2: TCategoryPanel
          Top = 167
          Height = 152
          Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1099#1077
          TabOrder = 0
          object Label1: TLabel
            Left = 22
            Top = 42
            Width = 108
            Height = 14
            Caption = #1053#1086#1074#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
          end
          object BitBtn4: TBitBtn
            Left = 10
            Top = 9
            Width = 130
            Height = 30
            Action = acSelectAll
            Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
            TabOrder = 0
          end
          object BitBtn5: TBitBtn
            Left = 10
            Top = 85
            Width = 130
            Height = 30
            Action = acChangeCost
            Caption = #1048#1079#1084'. '#1089#1077#1073#1077#1089#1090'-'#1089#1090#1100
            TabOrder = 1
          end
          object edtCardCost: TDBNumberEditEh
            Left = 10
            Top = 61
            Width = 130
            Height = 22
            DisplayFormat = '### ### ### ### ##0.00'
            DynProps = <>
            EditButtons = <>
            TabOrder = 2
            Visible = True
          end
        end
        object CategoryPanel1: TCategoryPanel
          Top = 0
          Height = 167
          Caption = #1044#1077#1081#1089#1090#1074#1080#1103
          TabOrder = 1
          object BitBtn3: TBitBtn
            Left = 10
            Top = 100
            Width = 130
            Height = 30
            Action = acDelete
            Caption = #1059#1076#1072#1083#1080#1090#1100
            TabOrder = 0
          end
          object BitBtn8: TBitBtn
            Left = 10
            Top = 70
            Width = 130
            Height = 30
            Action = acGridBestFit
            Caption = #1054#1087#1090'. '#1087#1086#1076#1075#1086#1085#1082#1072
            TabOrder = 1
          end
          object BitBtn7: TBitBtn
            Left = 10
            Top = 40
            Width = 130
            Height = 30
            Action = acGridExcel
            Caption = 'Excel'
            TabOrder = 2
          end
          object BitBtn6: TBitBtn
            Left = 10
            Top = 10
            Width = 130
            Height = 30
            Action = acLoadFile
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
            TabOrder = 3
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
        Width = 847
        Height = 425
        Align = alClient
        BevelInner = bvLowered
        BevelWidth = 2
        BorderWidth = 1
        ParentBackground = False
        TabOrder = 0
        object LogPackets: TMemo
          Left = 5
          Top = 5
          Width = 837
          Height = 415
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
        Width = 847
        Height = 425
        Align = alClient
        BevelInner = bvLowered
        BevelWidth = 2
        BorderWidth = 1
        Caption = 'Panel3'
        ParentBackground = False
        TabOrder = 0
        object Panel2: TPanel
          Left = 5
          Top = 5
          Width = 837
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 1
          ParentBackground = False
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 12
            Top = 8
            Width = 130
            Height = 30
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            TabOrder = 0
          end
        end
        object Panel7: TPanel
          Left = 5
          Top = 47
          Width = 837
          Height = 373
          Align = alClient
          BevelInner = bvLowered
          BorderWidth = 2
          ParentBackground = False
          TabOrder = 1
          object LineInfo: TMemo
            Left = 4
            Top = 4
            Width = 829
            Height = 365
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
  object Panel5: TPanel
    Left = 3
    Top = 467
    Width = 865
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 464
    DesignSize = (
      865
      39)
    object BitBtn2: TBitBtn
      Left = 722
      Top = 5
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 208
    Top = 248
    object acLoadFile: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
      OnExecute = acLoadFileExecute
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
      OnExecute = acDeleteExecute
    end
    object acGridBestFit: TAction
      Caption = #1054#1087#1090'. '#1087#1086#1076#1075#1086#1085#1082#1072
      Hint = #1054#1087#1090#1080#1084#1072#1083#1100#1085#1072#1103' '#1087#1086#1076#1075#1086#1085#1082#1072' '#1090#1072#1073#1083#1080#1094#1099
      OnExecute = acGridBestFitExecute
    end
    object acGridExcel: TAction
      Caption = 'Excel'
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' MS Excel'
      OnExecute = acGridExcelExecute
    end
    object acExportDatas: TAction
      Caption = 'acExportDatas'
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnExecute = acSelectAllExecute
    end
    object acChangeCost: TAction
      Caption = #1048#1079#1084'. '#1089#1077#1073#1077#1089#1090'-'#1089#1090#1100
      OnExecute = acChangeCostExecute
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGridIssDetails
    PopupMenus = <>
    Left = 292
    Top = 249
  end
  object srIssDetails: TDataSource
    DataSet = tbIssDetails
    Left = 132
    Top = 248
  end
  object tbIssDetails: TFDQuery
    Connection = DMain.ADCon
    SQL.Strings = (
      'Select * from V_IssDetails')
    Left = 48
    Top = 250
    object tbIssDetailsRRowID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'RRowID'
      Origin = 'RRowID'
    end
    object tbIssDetailsRPackID: TIntegerField
      FieldName = 'RPackID'
      Origin = 'RPackID'
    end
    object tbIssDetailsClientID: TIntegerField
      DisplayLabel = 'ID '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientID'
      Origin = 'ClientID'
    end
    object tbIssDetailsClientName: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'. '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'ClientName'
      Origin = 'ClientName'
      FixedChar = True
      Size = 50
    end
    object tbIssDetailsClientLatName: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'. '#1082#1083#1080#1077#1085#1090#1072' '#1074' '#1083#1072#1090#1080#1085#1080#1094#1077
      FieldName = 'ClientLatName'
      Origin = 'ClientLatName'
      FixedChar = True
      Size = 50
    end
    object tbIssDetailsClientPasspNo: TWideStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'ClientPasspNo'
      Origin = 'ClientPasspNo'
      FixedChar = True
      Size = 15
    end
    object tbIssDetailsCardNo: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
      FieldName = 'CardNo'
      Origin = 'CardNo'
      FixedChar = True
    end
    object tbIssDetailsCardProduct: TWideStringField
      DisplayLabel = #1050#1072#1088#1090'. '#1087#1088#1086#1076'.'
      FieldName = 'CardProduct'
      Origin = 'CardProduct'
      FixedChar = True
    end
    object tbIssDetailsCardProductName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1072#1088#1090'. '#1087#1088#1086#1076#1091#1082#1090#1072
      FieldName = 'CardProductName'
      Origin = 'CardProductName'
      FixedChar = True
      Size = 50
    end
    object tbIssDetailsCardProductCost: TCurrencyField
      FieldName = 'CardProductCost'
      Origin = 'CardProductCost'
    end
    object tbIssDetailsCardCost: TCurrencyField
      DisplayLabel = #1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'CardCost'
      Origin = 'CardCost'
      DisplayFormat = '### ### ### ### ##0.00'
    end
    object tbIssDetailsCardDateInput: TWideStringField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
      FieldName = 'CardDateInput'
      Origin = 'CardDateInput'
      FixedChar = True
      Size = 5
    end
    object tbIssDetailsCardDateExpire: TWideStringField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'CardDateExpire'
      Origin = 'CardDateExpire'
      FixedChar = True
      Size = 5
    end
    object tbIssDetailsCardNameOn: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1085#1072' '#1082#1072#1088#1090#1077
      FieldName = 'CardNameOn'
      Origin = 'CardNameOn'
      FixedChar = True
      Size = 50
    end
    object tbIssDetailsCardServCode: TWideStringField
      DisplayLabel = #1057#1077#1088#1074#1080#1089' '#1082#1086#1076
      FieldName = 'CardServCode'
      Origin = 'CardServCode'
      FixedChar = True
      Size = 3
    end
    object tbIssDetailsAccountNo: TWideStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
      FieldName = 'AccountNo'
      Origin = 'AccountNo'
      FixedChar = True
    end
    object tbIssDetailsFNameOrig: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072
      FieldName = 'FNameOrig'
      Origin = 'FNameOrig'
      FixedChar = True
      Size = 80
    end
    object tbIssDetailsFNameDiv: TWideStringField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072' '#1087#1086#1089#1083#1077' '#1088#1072#1079#1073#1080#1077#1085#1080#1103
      FieldName = 'FNameDiv'
      Origin = 'FNameDiv'
      FixedChar = True
      Size = 80
    end
  end
end
