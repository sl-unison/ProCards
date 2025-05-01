object frmSetups: TfrmSetups
  Left = 285
  Top = 432
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 360
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 320
    Width = 652
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      652
      40)
    object btnEdit: TBitBtn
      Left = 3
      Top = 6
      Width = 130
      Height = 30
      Action = acEdit
      Anchors = [akRight, akBottom]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object btnClose: TBitBtn
      Left = 513
      Top = 6
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 133
      Top = 6
      Width = 130
      Height = 30
      Action = acApply
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 320
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    ParentBackground = False
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 3
      Top = 3
      Width = 646
      Height = 314
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      DataSource = srSetups
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      IndicatorOptions = [gioShowRowIndicatorEh]
      OddRowColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghFrozen3D, dghFooter3D, dghData3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
      ParentFont = False
      ReadOnly = True
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Code'
          Footer.Alignment = taCenter
          Footer.FieldName = 'Code'
          Footer.ValueType = fvtCount
          Footers = <>
          Width = 48
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 336
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ValItem'
          Footers = <>
          Width = 237
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object actlst1: TActionList
    Left = 272
    Top = 112
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = acEditExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = acApplyExecute
    end
  end
  object srSetups: TDataSource
    DataSet = tbSetups
    Left = 203
    Top = 113
  end
  object tbSetups: TFDQuery
    Connection = DMain.ADCon
    SQL.Strings = (
      'Select * from V_Setups Order by Code')
    Left = 117
    Top = 112
    object tbSetupsCode: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
      Origin = 'Code'
    end
    object tbSetupsName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Origin = 'Name'
      FixedChar = True
      Size = 50
    end
    object tbSetupsValItem: TWideStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'ValItem'
      Origin = 'ValItem'
      FixedChar = True
      Size = 120
    end
    object tbSetupsValTypeName: TStringField
      FieldName = 'ValTypeName'
      Origin = 'ValTypeName'
      Size = 12
    end
    object tbSetupsValType: TIntegerField
      FieldName = 'ValType'
      Origin = 'ValType'
    end
    object tbSetupsValString: TWideStringField
      FieldName = 'ValString'
      Origin = 'ValString'
      FixedChar = True
      Size = 120
    end
    object tbSetupsValInteger: TIntegerField
      FieldName = 'ValInteger'
      Origin = 'ValInteger'
    end
    object tbSetupsValNumeric: TBCDField
      FieldName = 'ValNumeric'
      Origin = 'ValNumeric'
      Precision = 18
      Size = 3
    end
    object tbSetupsValDate: TDateField
      FieldName = 'ValDate'
      Origin = 'ValDate'
    end
    object tbSetupsValTime: TTimeField
      FieldName = 'ValTime'
      Origin = 'ValTime'
    end
    object tbSetupsValDateTime: TSQLTimeStampField
      FieldName = 'ValDateTime'
      Origin = 'ValDateTime'
    end
    object tbSetupsValLogical: TBooleanField
      FieldName = 'ValLogical'
      Origin = 'ValLogical'
    end
  end
end
