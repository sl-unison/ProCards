object frmDatCardProduct: TfrmDatCardProduct
  Left = 200
  Top = 486
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1082#1072#1088#1090#1086#1095#1085#1086#1084' '#1087#1088#1086#1076#1091#1082#1090#1077
  ClientHeight = 139
  ClientWidth = 596
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
    Top = 98
    Width = 596
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 83
    DesignSize = (
      596
      41)
    object btnSave: TBitBtn
      Left = 317
      Top = 7
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 453
      Top = 7
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 98
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 83
    object Label1: TLabel
      Left = 22
      Top = 21
      Width = 57
      Height = 14
      Caption = #1055#1088#1077#1092#1080#1082#1089
    end
    object Label2: TLabel
      Left = 17
      Top = 45
      Width = 62
      Height = 14
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label3: TLabel
      Left = 268
      Top = 21
      Width = 141
      Height = 14
      Caption = #1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1082#1072#1088#1090#1099
    end
    object edtName: TDBEditEh
      Left = 88
      Top = 43
      Width = 489
      Height = 22
      DynProps = <>
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      MaxLength = 50
      TabOrder = 2
      Visible = True
    end
    object edtCost: TDBNumberEditEh
      Left = 416
      Top = 18
      Width = 161
      Height = 22
      DynProps = <>
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 1
      Visible = True
    end
    object edtCode: TDBEditEh
      Left = 88
      Top = 18
      Width = 170
      Height = 22
      DynProps = <>
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      MaxLength = 20
      TabOrder = 0
      Visible = True
    end
    object edtIsVirtual: TDBCheckBoxEh
      Left = 150
      Top = 71
      Width = 108
      Height = 17
      Alignment = taLeftJustify
      Caption = #1042#1080#1088#1090#1091#1072#1083#1100#1085#1099#1081
      DynProps = <>
      TabOrder = 3
    end
  end
end
