object frmCardProducts: TfrmCardProducts
  Left = 285
  Top = 356
  BorderWidth = 3
  Caption = #1050#1072#1088#1090#1086#1095#1085#1099#1077' '#1087#1088#1086#1076#1091#1082#1090#1099
  ClientHeight = 440
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 389
    Width = 591
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 555
    DesignSize = (
      591
      51)
    object BitBtn1: TBitBtn
      Left = 10
      Top = 12
      Width = 130
      Height = 30
      Action = acAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 141
      Top = 12
      Width = 130
      Height = 30
      Action = acEdit
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 272
      Top = 12
      Width = 130
      Height = 30
      Action = acDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 453
      Top = 12
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      ExplicitLeft = 417
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 389
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 555
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 587
      Height = 385
      Align = alClient
      BorderStyle = bsNone
      DataSource = DMain.srCardProds
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Code'
          Footers = <>
          Width = 94
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 284
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cost'
          Footers = <>
          Width = 122
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IsVirtual'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ActionList1: TActionList
    Left = 224
    Top = 112
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
end
