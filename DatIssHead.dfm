object frmDatIssHead: TfrmDatIssHead
  Left = 201
  Top = 557
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1087#1072#1082#1077#1090#1077
  ClientHeight = 209
  ClientWidth = 616
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
    Top = 168
    Width = 616
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      616
      41)
    object btnSave: TBitBtn
      Left = 341
      Top = 6
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 474
      Top = 6
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
    Width = 616
    Height = 168
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      BorderWidth = 3
      Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 602
        Height = 133
        Align = alClient
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object Label3: TLabel
          Left = 69
          Top = 69
          Width = 81
          Height = 14
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        end
        object Label2: TLabel
          Left = 86
          Top = 44
          Width = 64
          Height = 14
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        end
        object Label1: TLabel
          Left = 101
          Top = 19
          Width = 49
          Height = 14
          Caption = #1060#1080#1083#1080#1072#1083
        end
        object Label12: TLabel
          Left = 75
          Top = 93
          Width = 75
          Height = 14
          Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1072
        end
        object edtRemark: TDBEditEh
          Left = 160
          Top = 67
          Width = 377
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 80
          TabOrder = 0
          Visible = True
        end
        object edtDescription: TDBEditEh
          Left = 160
          Top = 42
          Width = 377
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 50
          TabOrder = 1
          Visible = True
        end
        object edtBranch: TDBLookupComboboxEh
          Left = 160
          Top = 17
          Width = 377
          Height = 22
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          DynProps = <>
          EditButtons = <>
          KeyField = 'Code'
          ListField = 'Name'
          ListSource = DMain.srBranches
          TabOrder = 2
          Visible = True
        end
        object edtActNo: TDBNumberEditEh
          Left = 160
          Top = 92
          Width = 150
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          TabOrder = 3
          Visible = True
        end
      end
    end
    object TabSheet2: TTabSheet
      BorderWidth = 3
      Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086' '#1055#1048#1053#1072#1084
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 602
        Height = 133
        Align = alClient
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object Label4: TLabel
          Left = 49
          Top = 21
          Width = 131
          Height = 14
          Caption = #1060'.'#1048'.'#1054'. '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086
        end
        object Label5: TLabel
          Left = 20
          Top = 46
          Width = 160
          Height = 14
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086
        end
        object Label6: TLabel
          Left = 43
          Top = 71
          Width = 137
          Height = 14
          Caption = #1053#1086#1084#1077#1088' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
        end
        object Label10: TLabel
          Left = 51
          Top = 95
          Width = 128
          Height = 14
          Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
        end
        object edtMandPersPins: TDBEditEh
          Left = 189
          Top = 18
          Width = 400
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 50
          TabOrder = 0
          Visible = True
        end
        object edtMandPostPins: TDBEditEh
          Left = 189
          Top = 43
          Width = 400
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 80
          TabOrder = 1
          Visible = True
        end
        object edtMandNoPins: TDBEditEh
          Left = 189
          Top = 68
          Width = 400
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 15
          TabOrder = 2
          Visible = True
        end
        object edtMandDatePins: TDBDateTimeEditEh
          Left = 189
          Top = 93
          Width = 121
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          Kind = dtkDateEh
          TabOrder = 3
          Visible = True
        end
      end
    end
    object TabSheet3: TTabSheet
      BorderWidth = 3
      Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086' '#1082#1072#1088#1090#1072#1084
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 602
        Height = 133
        Align = alClient
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object Label7: TLabel
          Left = 43
          Top = 71
          Width = 137
          Height = 14
          Caption = #1053#1086#1084#1077#1088' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
        end
        object Label8: TLabel
          Left = 20
          Top = 46
          Width = 160
          Height = 14
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086
        end
        object Label9: TLabel
          Left = 49
          Top = 21
          Width = 131
          Height = 14
          Caption = #1060'.'#1048'.'#1054'. '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086
        end
        object Label11: TLabel
          Left = 51
          Top = 95
          Width = 128
          Height = 14
          Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
        end
        object edtMandPersCards: TDBEditEh
          Left = 189
          Top = 18
          Width = 400
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 50
          TabOrder = 0
          Visible = True
        end
        object edtMandPostCards: TDBEditEh
          Left = 189
          Top = 43
          Width = 400
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 80
          TabOrder = 1
          Visible = True
        end
        object edtMandNoCards: TDBEditEh
          Left = 189
          Top = 68
          Width = 400
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 15
          TabOrder = 2
          Visible = True
        end
        object edtMandDateCards: TDBDateTimeEditEh
          Left = 189
          Top = 93
          Width = 121
          Height = 22
          DynProps = <>
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          Kind = dtkDateEh
          TabOrder = 3
          Visible = True
        end
      end
    end
  end
end
