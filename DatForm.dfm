object frmDatForm: TfrmDatForm
  Left = 186
  Top = 318
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1060#1086#1088#1084#1072' '#1088#1086#1076#1080#1090#1077#1083#1100' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 131
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 94
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 94
    Width = 558
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnCancel: TBitBtn
      Left = 434
      Top = 5
      Width = 120
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnSave: TBitBtn
      Left = 310
      Top = 5
      Width = 120
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
end
