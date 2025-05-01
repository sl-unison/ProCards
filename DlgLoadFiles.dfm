object frmDlgLoadFiles: TfrmDlgLoadFiles
  Left = 212
  Top = 586
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080
  ClientHeight = 176
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 138
    Width = 625
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      625
      38)
    object btnSave: TBitBtn
      Left = 354
      Top = 5
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Default = True
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 486
      Top = 5
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 625
    Height = 138
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      BorderWidth = 5
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 607
        Height = 99
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 1
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 18
          Width = 103
          Height = 14
          Caption = #1055#1091#1090#1100' '#1076#1086' '#1092#1072#1081#1083#1086#1074
        end
        object Label2: TLabel
          Left = 88
          Top = 42
          Width = 39
          Height = 14
          Caption = #1052#1072#1089#1082#1072
        end
        object Label3: TLabel
          Left = 27
          Top = 67
          Width = 100
          Height = 14
          Caption = 'Backup '#1082#1072#1090#1072#1083#1086#1075
        end
        object edtLoadPath: TDBEditEh
          Left = 136
          Top = 14
          Width = 450
          Height = 22
          DynProps = <>
          EditButtons = <
            item
              Style = ebsEllipsisEh
            end>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          TabOrder = 0
          Visible = True
        end
        object edtLoadMask: TDBEditEh
          Left = 136
          Top = 39
          Width = 450
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          TabOrder = 1
          Visible = True
        end
        object edtLoadBack: TDBEditEh
          Left = 136
          Top = 64
          Width = 450
          Height = 22
          DynProps = <>
          EditButtons = <
            item
              Style = ebsEllipsisEh
            end>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          TabOrder = 2
          Visible = True
        end
      end
    end
  end
end
