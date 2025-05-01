object frmDatSetSign: TfrmDatSetSign
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1090#1072#1090#1091#1089#1072' '#1087#1072#1082#1077#1090#1072
  ClientHeight = 143
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 103
    Width = 453
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 162
    object btnSave: TBitBtn
      Left = 84
      Top = 6
      Width = 130
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 244
      Top = 6
      Width = 130
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 103
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = 57
    ExplicitHeight = 105
    object edtIsIssued: TDBCheckBoxEh
      Left = 132
      Top = 15
      Width = 197
      Height = 17
      Caption = #1050#1072#1088#1090#1099' '#1087#1077#1088#1089#1086#1085#1072#1083#1080#1079#1080#1088#1086#1074#1072#1085#1099
      DynProps = <>
      TabOrder = 0
    end
    object edtIsGotPins: TDBCheckBoxEh
      Left = 132
      Top = 42
      Width = 185
      Height = 17
      Caption = #1055#1048#1053'-'#1082#1086#1085#1074#1077#1088#1090#1099' '#1087#1086#1083#1091#1095#1077#1085#1099
      DynProps = <>
      TabOrder = 1
    end
    object edtIsGotCards: TDBCheckBoxEh
      Left = 132
      Top = 70
      Width = 129
      Height = 17
      Caption = #1050#1072#1088#1090#1099' '#1087#1086#1083#1091#1095#1077#1085#1099
      DynProps = <>
      TabOrder = 2
    end
  end
end
