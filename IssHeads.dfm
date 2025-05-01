object frmIssHeads: TfrmIssHeads
  Left = 258
  Top = 221
  Caption = #1048#1079#1076#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1087#1072#1082#1077#1090#1099
  ClientHeight = 545
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  FormStyle = fsMDIChild
  Padding.Left = 3
  Padding.Top = 3
  Padding.Right = 3
  Padding.Bottom = 3
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel5: TPanel
    Left = 3
    Top = 3
    Width = 587
    Height = 539
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 583
      Height = 535
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object cxGridIssHeads: TcxGrid
        Left = 0
        Top = 113
        Width = 583
        Height = 407
        Align = alClient
        BorderStyle = cxcbsNone
        PopupMenu = PopupMenu1
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object btvIssHeads: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = srIssHeads
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.Indicator = True
          object btvIssHeadsRRowID: TcxGridDBColumn
            DataBinding.FieldName = 'RRowID'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsIsIssued: TcxGridDBColumn
            DataBinding.FieldName = 'IsIssued'
            HeaderAlignmentHorz = taCenter
            Width = 30
          end
          object btvIssHeadsIsGotPins: TcxGridDBColumn
            DataBinding.FieldName = 'IsGotPins'
            HeaderAlignmentHorz = taCenter
            Width = 28
          end
          object btvIssHeadsIsGotCards: TcxGridDBColumn
            DataBinding.FieldName = 'IsGotCards'
            HeaderAlignmentHorz = taCenter
            Width = 28
          end
          object btvIssHeadsBranch: TcxGridDBColumn
            DataBinding.FieldName = 'Branch'
            HeaderAlignmentHorz = taCenter
            Width = 75
          end
          object btvIssHeadsBranchName: TcxGridDBColumn
            DataBinding.FieldName = 'BranchName'
            HeaderAlignmentHorz = taCenter
            Width = 279
          end
          object btvIssHeadsBranchNameShort: TcxGridDBColumn
            DataBinding.FieldName = 'BranchNameShort'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsPackDate: TcxGridDBColumn
            DataBinding.FieldName = 'PackDate'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object btvIssHeadsPackTime: TcxGridDBColumn
            DataBinding.FieldName = 'PackTime'
            HeaderAlignmentHorz = taCenter
            Width = 109
          end
          object btvIssHeadsTotCount: TcxGridDBColumn
            DataBinding.FieldName = 'TotCount'
            HeaderAlignmentHorz = taCenter
            Width = 105
          end
          object btvIssHeadsDescription: TcxGridDBColumn
            DataBinding.FieldName = 'Description'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsActNo: TcxGridDBColumn
            DataBinding.FieldName = 'ActNo'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsMandPersPins: TcxGridDBColumn
            DataBinding.FieldName = 'MandPersPins'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsMandPersCards: TcxGridDBColumn
            DataBinding.FieldName = 'MandPersCards'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsMandPostPins: TcxGridDBColumn
            DataBinding.FieldName = 'MandPostPins'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsMandPostCards: TcxGridDBColumn
            DataBinding.FieldName = 'MandPostCards'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsMandNoPins: TcxGridDBColumn
            DataBinding.FieldName = 'MandNoPins'
            HeaderAlignmentHorz = taCenter
            Width = 183
          end
          object btvIssHeadsMandNoCards: TcxGridDBColumn
            DataBinding.FieldName = 'MandNoCards'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object btvIssHeadsMandDatePins: TcxGridDBColumn
            DataBinding.FieldName = 'MandDatePins'
            HeaderAlignmentHorz = taCenter
            Width = 146
          end
          object btvIssHeadsMandDateCards: TcxGridDBColumn
            DataBinding.FieldName = 'MandDateCards'
            HeaderAlignmentHorz = taCenter
            Width = 163
          end
          object btvIssHeadsRemark: TcxGridDBColumn
            DataBinding.FieldName = 'Remark'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsFilesPath: TcxGridDBColumn
            DataBinding.FieldName = 'FilesPath'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsFilesMask: TcxGridDBColumn
            DataBinding.FieldName = 'FilesMask'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsFilesBack: TcxGridDBColumn
            DataBinding.FieldName = 'FilesBack'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsPersPinEmail: TcxGridDBColumn
            DataBinding.FieldName = 'PersPinEmail'
            HeaderAlignmentHorz = taCenter
          end
          object btvIssHeadsPersCardEmail: TcxGridDBColumn
            DataBinding.FieldName = 'PersCardEmail'
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridIssHeadsLevel1: TcxGridLevel
          GridView = btvIssHeads
        end
      end
      object ProgressBar1: TProgressBar
        Left = 0
        Top = 520
        Width = 583
        Height = 15
        Align = alBottom
        TabOrder = 2
      end
      object PnlSearch: TPageControl
        Left = 0
        Top = 0
        Width = 583
        Height = 113
        ActivePage = TabSheet1
        Align = alTop
        TabOrder = 0
        object TabSheet1: TTabSheet
          BorderWidth = 3
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 569
            Height = 78
            Align = alClient
            BevelInner = bvLowered
            BorderWidth = 2
            ParentBackground = False
            TabOrder = 0
            object Label4: TLabel
              Left = 18
              Top = 16
              Width = 114
              Height = 14
              Caption = #1053#1072#1095'. '#1076#1072#1090#1072' '#1087#1072#1082#1077#1090#1072
            end
            object Label10: TLabel
              Left = 277
              Top = 15
              Width = 148
              Height = 14
              Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072' '#1087#1072#1082#1077#1090#1072
            end
            object Label6: TLabel
              Left = 79
              Top = 40
              Width = 49
              Height = 14
              Caption = #1060#1080#1083#1080#1072#1083
            end
            object edtBegDate: TDBDateTimeEditEh
              Left = 139
              Top = 13
              Width = 121
              Height = 22
              DynProps = <>
              EditButtons = <>
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              Kind = dtkDateEh
              TabOrder = 0
              Visible = True
            end
            object edtEndDate: TDBDateTimeEditEh
              Left = 435
              Top = 13
              Width = 121
              Height = 22
              DynProps = <>
              EditButtons = <>
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              Kind = dtkDateEh
              TabOrder = 1
              Visible = True
            end
            object edtBranch: TDBLookupComboboxEh
              Left = 139
              Top = 38
              Width = 417
              Height = 22
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              DynProps = <>
              DataField = ''
              EditButtons = <>
              KeyField = 'Code'
              ListField = 'Name'
              ListSource = DMain.srBranches
              TabOrder = 2
              Visible = True
            end
          end
        end
      end
    end
  end
  object pnlActions: TCategoryPanelGroup
    AlignWithMargins = True
    Left = 593
    Top = 6
    Width = 203
    Height = 533
    VertScrollBar.Tracking = True
    Align = alRight
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 1
    object CategoryPanel3: TCategoryPanel
      Top = 519
      Height = 192
      Caption = #1055#1088#1086#1095#1077#1077
      TabOrder = 3
      object BitBtn13: TBitBtn
        Left = 9
        Top = 98
        Width = 165
        Height = 30
        Action = acSetSign
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082#1080
        TabOrder = 3
      end
      object BitBtn8: TBitBtn
        Left = 9
        Top = 68
        Width = 165
        Height = 30
        Action = acGridBestFit
        Caption = #1054#1087#1090#1080#1084#1072#1083#1100'. '#1087#1086#1076#1075#1086#1085#1082#1072
        TabOrder = 2
      end
      object BitBtn7: TBitBtn
        Left = 9
        Top = 38
        Width = 165
        Height = 30
        Action = acGridExcel
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' MS Excel'
        TabOrder = 1
      end
      object BitBtn9: TBitBtn
        Left = 9
        Top = 8
        Width = 165
        Height = 30
        Action = acImpDatas
        Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
        TabOrder = 0
      end
      object BitBtn5: TBitBtn
        Left = 9
        Top = 128
        Width = 165
        Height = 30
        Action = acClose
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 4
      end
    end
    object CategoryPanel2: TCategoryPanel
      Top = 358
      Height = 161
      Caption = #1040#1082#1090#1099'/'#1054#1090#1095#1077#1090#1099
      TabOrder = 2
      object BitBtn10: TBitBtn
        Left = 9
        Top = 37
        Width = 165
        Height = 30
        Action = acActPin
        Caption = #1040#1082#1090' '#1087#1086' '#1055#1048#1053#1072#1084
        TabOrder = 1
      end
      object BitBtn11: TBitBtn
        Left = 9
        Top = 7
        Width = 165
        Height = 30
        Action = acActCards
        Caption = #1040#1082#1090' '#1087#1086' '#1082#1072#1088#1090#1072#1084
        TabOrder = 0
      end
      object BitBtn18: TBitBtn
        Left = 9
        Top = 97
        Width = 165
        Height = 30
        Action = acBranchCardsCount
        Caption = #1050#1086#1083'. '#1082#1072#1088#1090' '#1087#1086' '#1092#1080#1083#1080#1072#1083#1072#1084
        TabOrder = 3
      end
      object BitBtn19: TBitBtn
        Left = 9
        Top = 67
        Width = 165
        Height = 30
        Action = acAktCardsAcc
        Caption = #1040#1082#1090' '#1086' '#1089#1087#1080#1089#1072#1085#1080#1080
        TabOrder = 2
      end
    end
    object CategoryPanel1: TCategoryPanel
      Top = 136
      Height = 222
      Caption = #1055#1072#1082#1077#1090#1099
      TabOrder = 1
      object BitBtn12: TBitBtn
        Left = 9
        Top = 7
        Width = 165
        Height = 30
        Action = acLoadFile
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1072
        TabOrder = 0
      end
      object BitBtn6: TBitBtn
        Left = 9
        Top = 37
        Width = 165
        Height = 30
        Action = acPackDetails
        Caption = #1047#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072
        TabOrder = 1
      end
      object BitBtn2: TBitBtn
        Left = 9
        Top = 67
        Width = 165
        Height = 30
        Action = acPackAdd
        Caption = #1044#1086#1073#1072#1074#1080#1090' '#1087#1072#1082#1077#1090
        TabOrder = 2
      end
      object BitBtn3: TBitBtn
        Left = 9
        Top = 97
        Width = 165
        Height = 30
        Action = acPackEdit
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1082#1077#1090
        TabOrder = 3
      end
      object BitBtn4: TBitBtn
        Left = 9
        Top = 127
        Width = 165
        Height = 30
        Action = acPackDelete
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
        TabOrder = 4
      end
      object BitBtn17: TBitBtn
        Left = 9
        Top = 157
        Width = 165
        Height = 30
        Action = acPackDelPeriod
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        TabOrder = 5
      end
    end
    object CategoryPanel4: TCategoryPanel
      Top = 0
      Height = 136
      Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093
      TabOrder = 0
      object BitBtn14: TBitBtn
        Left = 9
        Top = 70
        Width = 165
        Height = 30
        Action = acSearchClear
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
        TabOrder = 2
      end
      object BitBtn1: TBitBtn
        Left = 9
        Top = 40
        Width = 165
        Height = 30
        Action = acSearch
        Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093
        Default = True
        TabOrder = 1
      end
      object BitBtn16: TBitBtn
        Left = 9
        Top = 10
        Width = 165
        Height = 30
        Action = acSrvSearch
        Caption = #1055#1072#1085#1077#1083#1100' '#1087#1086#1080#1089#1082#1072
        TabOrder = 0
      end
    end
  end
  object ActionList1: TActionList
    Left = 168
    Top = 254
    object acSearch: TAction
      Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093
      OnExecute = acSearchExecute
    end
    object acLoadFile: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1072
      OnExecute = acLoadFileExecute
    end
    object acPackAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090' '#1087#1072#1082#1077#1090
      OnExecute = acPackAddExecute
    end
    object acPackEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1082#1077#1090
      OnExecute = acPackEditExecute
    end
    object acPackDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
      OnExecute = acPackDeleteExecute
    end
    object acPackDelPeriod: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      OnExecute = acPackDelPeriodExecute
    end
    object acPackDetails: TAction
      Caption = #1047#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072
      OnExecute = acPackDetailsExecute
    end
    object acImpDatas: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      OnExecute = acImpDatasExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acActPin: TAction
      Caption = #1040#1082#1090' '#1087#1086' '#1055#1048#1053#1072#1084
      OnExecute = acActPinExecute
    end
    object acActCards: TAction
      Caption = #1040#1082#1090' '#1087#1086' '#1082#1072#1088#1090#1072#1084
      OnExecute = acActCardsExecute
    end
    object acAktCardsAcc: TAction
      Caption = #1040#1082#1090' '#1086' '#1089#1087#1080#1089#1072#1085#1080#1080
      OnExecute = acAktCardsAccExecute
    end
    object acGridBestFit: TAction
      Caption = #1054#1087#1090#1080#1084#1072#1083#1100'. '#1087#1086#1076#1075#1086#1085#1082#1072
      OnExecute = acGridBestFitExecute
    end
    object acGridExcel: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' MS Excel'
      OnExecute = acGridExcelExecute
    end
    object acSetSign: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082#1080
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082
      OnExecute = acSetSignExecute
    end
    object acSearchClear: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      OnExecute = acSearchClearExecute
    end
    object acSrvActions: TAction
      Caption = #1055#1072#1085#1077#1083#1100' '#1076#1077#1081#1089#1090#1074#1080#1081
      OnExecute = acSrvActionsExecute
    end
    object acSrvSearch: TAction
      Caption = #1055#1072#1085#1077#1083#1100' '#1087#1086#1080#1089#1082#1072
      OnExecute = acSrvSearchExecute
    end
    object acBranchCardsCount: TAction
      Caption = #1050#1086#1083'. '#1082#1072#1088#1090' '#1087#1086' '#1092#1080#1083#1080#1072#1083#1072#1084
      OnExecute = acBranchCardsCountExecute
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGridIssHeads
    PopupMenus = <>
    Left = 248
    Top = 255
  end
  object srIssHeads: TDataSource
    DataSet = tbIssHeads
    Left = 100
    Top = 255
  end
  object PopupMenu1: TPopupMenu
    Left = 344
    Top = 256
    object N1: TMenuItem
      Action = acLoadFile
    end
    object N2: TMenuItem
      Action = acPackDetails
    end
    object N3: TMenuItem
      Action = acPackAdd
    end
    object N4: TMenuItem
      Action = acPackEdit
    end
    object N5: TMenuItem
      Action = acImpDatas
    end
    object N6: TMenuItem
      Action = acActPin
    end
    object N7: TMenuItem
      Action = acActCards
    end
    object MSExcel1: TMenuItem
      Action = acGridExcel
    end
    object N8: TMenuItem
      Action = acGridBestFit
    end
    object N9: TMenuItem
      Action = acSetSign
    end
    object N10: TMenuItem
      Action = acSrvActions
    end
    object N11: TMenuItem
      Action = acSrvSearch
    end
    object N12: TMenuItem
      Action = acPackDelete
    end
  end
  object tbIssHeads: TFDQuery
    Connection = DMain.ADCon
    SQL.Strings = (
      'Select * from V_IssHeads')
    Left = 25
    Top = 257
    object tbIssHeadsRRowID: TIntegerField
      DisplayLabel = #8470' '#1087#1072#1082#1077#1090#1072
      FieldName = 'RRowID'
      Origin = 'RRowID'
    end
    object tbIssHeadsBranch: TIntegerField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'Branch'
      Origin = 'Branch'
    end
    object tbIssHeadsBranchName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1080#1072#1083#1072
      FieldName = 'BranchName'
      Origin = 'BranchName'
      FixedChar = True
      Size = 50
    end
    object tbIssHeadsBranchNameShort: TWideStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1080#1072#1083#1072
      FieldName = 'BranchNameShort'
      Origin = 'BranchNameShort'
      FixedChar = True
    end
    object tbIssHeadsPackDate: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1072#1082#1077#1090#1072
      FieldName = 'PackDate'
      Origin = 'PackDate'
    end
    object tbIssHeadsPackTime: TTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1072#1082#1077#1090#1072
      FieldName = 'PackTime'
      Origin = 'PackTime'
    end
    object tbIssHeadsTotCount: TIntegerField
      DisplayLabel = #1050#1086#1083'. '#1079#1072#1087#1080#1089#1077#1081
      FieldName = 'TotCount'
      Origin = 'TotCount'
    end
    object tbIssHeadsDescription: TWideStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'Description'
      Origin = 'Description'
      FixedChar = True
      Size = 50
    end
    object tbIssHeadsActNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1072#1082#1090#1072
      FieldName = 'ActNo'
      Origin = 'ActNo'
    end
    object tbIssHeadsMandPersPins: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'. '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086' '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandPersPins'
      Origin = 'MandPersPins'
      FixedChar = True
      Size = 50
    end
    object tbIssHeadsMandPersCards: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'. '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086' '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandPersCards'
      Origin = 'MandPersCards'
      FixedChar = True
      Size = 50
    end
    object tbIssHeadsMandPostPins: TWideStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086' '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandPostPins'
      Origin = 'MandPostPins'
      FixedChar = True
      Size = 80
    end
    object tbIssHeadsMandPostCards: TWideStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086' '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandPostCards'
      Origin = 'MandPostCards'
      FixedChar = True
      Size = 80
    end
    object tbIssHeadsMandNoPins: TWideStringField
      DisplayLabel = #8470' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080' '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandNoPins'
      Origin = 'MandNoPins'
      FixedChar = True
      Size = 15
    end
    object tbIssHeadsMandNoCards: TWideStringField
      DisplayLabel = #8470' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080' '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandNoCards'
      Origin = 'MandNoCards'
      FixedChar = True
      Size = 15
    end
    object tbIssHeadsMandDatePins: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1074'. '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandDatePins'
      Origin = 'MandDatePins'
    end
    object tbIssHeadsMandDateCards: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1074'. '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandDateCards'
      Origin = 'MandDateCards'
    end
    object tbIssHeadsIsIssued: TBooleanField
      DisplayLabel = #1048
      FieldName = 'IsIssued'
      Origin = 'IsIssued'
    end
    object tbIssHeadsIsGotPins: TBooleanField
      DisplayLabel = #1055
      FieldName = 'IsGotPins'
      Origin = 'IsGotPins'
    end
    object tbIssHeadsIsGotCards: TBooleanField
      DisplayLabel = #1050
      FieldName = 'IsGotCards'
      Origin = 'IsGotCards'
    end
    object tbIssHeadsRemark: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'Remark'
      Origin = 'Remark'
      FixedChar = True
      Size = 80
    end
    object tbIssHeadsPersPinEmail: TWideStringField
      DisplayLabel = 'Email '#1087#1086' '#1055#1048#1053'-'#1082#1086#1085#1074#1077#1088#1090#1072#1084
      FieldName = 'PersPinEmail'
      Origin = 'PersPinEmail'
      FixedChar = True
      Size = 50
    end
    object tbIssHeadsPersCardEmail: TWideStringField
      DisplayLabel = 'Email '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'PersCardEmail'
      Origin = 'PersCardEmail'
      FixedChar = True
      Size = 50
    end
    object tbIssHeadsFilesPath: TWideStringField
      DisplayLabel = #1055#1091#1090#1100' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1092#1072#1081#1083#1086#1074
      FieldName = 'FilesPath'
      Origin = 'FilesPath'
      FixedChar = True
      Size = 80
    end
    object tbIssHeadsFilesMask: TWideStringField
      DisplayLabel = #1052#1072#1089#1082#1072' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1092#1072#1081#1083#1086#1074
      FieldName = 'FilesMask'
      Origin = 'FilesMask'
      FixedChar = True
      Size = 25
    end
    object tbIssHeadsFilesBack: TWideStringField
      DisplayLabel = 'Backup '#1082#1072#1090#1072#1083#1086#1075
      FieldName = 'FilesBack'
      Origin = 'FilesBack'
      FixedChar = True
      Size = 80
    end
  end
end
