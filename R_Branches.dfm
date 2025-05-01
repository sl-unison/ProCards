object frmBranches: TfrmBranches
  Left = 329
  Top = 186
  BorderWidth = 3
  Caption = #1060#1080#1083#1080#1072#1083#1099
  ClientHeight = 431
  ClientWidth = 779
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 379
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 351
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 775
      Height = 375
      Align = alClient
      BorderStyle = bsNone
      DataSource = DMain.srBranches
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
      FrozenCols = 1
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      IndicatorOptions = [gioShowRowIndicatorEh]
      OddRowColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
      ParentFont = False
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
          Width = 77
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 290
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NameShort'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ActNo'
          Footers = <>
          Width = 169
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandPersPins'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandPersCards'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandPostPins'
          Footers = <>
          Width = 466
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandPostCards'
          Footers = <>
          Width = 477
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandNoPins'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandNoCards'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandDatePins'
          Footers = <>
          Width = 149
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MandDateCards'
          Footers = <>
          Width = 141
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PersPinEmail'
          Footers = <>
          Width = 311
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PersCardEmail'
          Footers = <>
          Width = 321
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FilesPath'
          Footers = <>
          Width = 368
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FilesMask'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FilesBack'
          Footers = <>
          Width = 354
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 379
    Width = 779
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 351
    DesignSize = (
      779
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
      Left = 141
      Top = 13
      Width = 130
      Height = 30
      Action = acEdit
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 272
      Top = 13
      Width = 130
      Height = 30
      Action = acDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 641
      Top = 13
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
    end
  end
  object ActionList1: TActionList
    Left = 312
    Top = 168
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
