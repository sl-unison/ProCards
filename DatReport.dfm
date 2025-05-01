object frmDatReport: TfrmDatReport
  Left = 455
  Top = 259
  Caption = #1044#1072#1085#1085#1099#1077' '#1086#1073' '#1086#1090#1095#1077#1090#1077
  ClientHeight = 481
  ClientWidth = 651
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
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 3
    Top = 426
    Width = 645
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      645
      52)
    object btnCancel: TBitBtn
      Left = 511
      Top = 12
      Width = 120
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnSave: TBitBtn
      Left = 387
      Top = 12
      Width = 120
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object Panel2: TPanel
    Left = 3
    Top = 3
    Width = 645
    Height = 423
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 641
    ExplicitHeight = 434
    object Panel3: TPanel
      Left = 2
      Top = 83
      Width = 641
      Height = 338
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 3
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 84
      ExplicitWidth = 635
      ExplicitHeight = 347
      object edtSQLText: TMemo
        Left = 3
        Top = 3
        Width = 635
        Height = 332
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitWidth = 629
        ExplicitHeight = 341
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 641
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 3
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 635
      object Label3: TLabel
        Left = 21
        Top = 59
        Width = 81
        Height = 14
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object Label2: TLabel
        Left = 40
        Top = 35
        Width = 62
        Height = 14
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object Label1: TLabel
        Left = 78
        Top = 11
        Width = 24
        Height = 14
        Caption = #1050#1086#1076
      end
      object edtRemark: TDBEditEh
        Left = 111
        Top = 56
        Width = 507
        Height = 22
        DynProps = <>
        EditButtons = <>
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        TabOrder = 5
        Visible = True
      end
      object edtName: TDBEditEh
        Left = 111
        Top = 32
        Width = 507
        Height = 22
        DynProps = <>
        EditButtons = <>
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        TabOrder = 4
        Visible = True
      end
      object edtIsPeriod: TDBCheckBoxEh
        Left = 255
        Top = 11
        Width = 153
        Height = 17
        Caption = #1048#1084#1077#1077#1090' '#1076#1080#1072#1087#1072#1079#1086#1085' '#1076#1072#1090
        DynProps = <>
        State = cbGrayed
        TabOrder = 1
      end
      object edtIsSystem: TDBCheckBoxEh
        Left = 529
        Top = 11
        Width = 89
        Height = 17
        Caption = #1057#1080#1089#1090#1077#1084#1085#1072#1103
        DynProps = <>
        State = cbGrayed
        TabOrder = 3
      end
      object edtCode: TDBNumberEditEh
        Left = 111
        Top = 8
        Width = 130
        Height = 22
        DynProps = <>
        EditButtons = <>
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        TabOrder = 0
        Visible = True
      end
      object edtIsHide: TDBCheckBoxEh
        Left = 430
        Top = 11
        Width = 68
        Height = 17
        Caption = #1057#1082#1088#1099#1090#1100
        DynProps = <>
        TabOrder = 2
      end
    end
  end
end
