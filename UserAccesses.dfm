object frmUserAccesses: TfrmUserAccesses
  Left = 240
  Top = 189
  BorderWidth = 3
  Caption = #1044#1086#1089#1090#1091#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 500
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 448
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 599
      Height = 444
      Align = alClient
      BorderStyle = bsNone
      DataSource = srAccesses
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      IndicatorOptions = [gioShowRowIndicatorEh]
      OddRowColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'TableDesc'
          Footers = <>
          Width = 314
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IsAccess'
          Footers = <>
          Width = 54
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IsAdd'
          Footers = <>
          Width = 70
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IsEdit'
          Footers = <>
          Width = 73
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IsDelete'
          Footers = <>
          Width = 65
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 448
    Width = 603
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      603
      52)
    object BitBtn1: TBitBtn
      Left = 10
      Top = 13
      Width = 130
      Height = 30
      Action = acAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 140
      Top = 13
      Width = 130
      Height = 30
      Action = acEdit
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 270
      Top = 13
      Width = 130
      Height = 30
      Action = acDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 464
      Top = 13
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
    end
  end
  object srAccesses: TDataSource
    DataSet = tbAccesses
    Left = 136
    Top = 120
  end
  object ActionList1: TActionList
    Left = 216
    Top = 120
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = acEditExecute
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acDeleteExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
  end
  object tbAccesses: TFDQuery
    Connection = DMain.ADCon
    SQL.Strings = (
      'Select * from V_Accesses')
    Left = 60
    Top = 120
  end
end
