object frmDatBranch: TfrmDatBranch
  Left = 404
  Top = 551
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1092#1080#1083#1080#1072#1083#1077
  ClientHeight = 227
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 186
    Width = 620
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object btnSave: TBitBtn
      Left = 345
      Top = 7
      Width = 130
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 481
      Top = 7
      Width = 130
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object PageCtrl: TPageControl
    Left = 0
    Top = 0
    Width = 620
    Height = 186
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      BorderWidth = 3
      Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 606
        Height = 151
        Align = alClient
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 63
          Top = 16
          Width = 24
          Height = 14
          Caption = #1050#1086#1076
        end
        object Label2: TLabel
          Left = 25
          Top = 41
          Width = 62
          Height = 14
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        end
        object Label3: TLabel
          Left = 262
          Top = 67
          Width = 154
          Height = 14
          Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1072#1082#1090#1072
        end
        object Label12: TLabel
          Left = 275
          Top = 16
          Width = 119
          Height = 14
          Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        end
        object Label16: TLabel
          Left = 136
          Top = 92
          Width = 109
          Height = 14
          Caption = 'EMail '#1076#1083#1103' '#1055#1048#1053'-'#1086#1074
        end
        object Label17: TLabel
          Left = 153
          Top = 117
          Width = 92
          Height = 14
          Caption = 'EMail '#1076#1083#1103' '#1082#1072#1088#1090
        end
        object edtCode: TDBNumberEditEh
          Left = 96
          Top = 14
          Width = 160
          Height = 22
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          TabOrder = 0
          Visible = True
        end
        object edtName: TDBEditEh
          Left = 96
          Top = 39
          Width = 489
          Height = 22
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 50
          TabOrder = 2
          Visible = True
        end
        object edtNameShort: TDBEditEh
          Left = 403
          Top = 14
          Width = 182
          Height = 22
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 20
          TabOrder = 1
          Visible = True
        end
        object edtPersPinEmail: TDBEditEh
          Left = 256
          Top = 89
          Width = 329
          Height = 22
          EditButtons = <>
          MaxLength = 50
          TabOrder = 4
          Visible = True
        end
        object edtPersCardEmail: TDBEditEh
          Left = 256
          Top = 114
          Width = 329
          Height = 22
          EditButtons = <>
          MaxLength = 50
          TabOrder = 5
          Visible = True
        end
        object edtActNo: TDBNumberEditEh
          Left = 425
          Top = 64
          Width = 160
          Height = 22
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
      end
    end
    object TabSheet2: TTabSheet
      BorderWidth = 3
      Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086' '#1055#1048#1053#1072#1084
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 606
        Height = 151
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
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 606
        Height = 151
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
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          Kind = dtkDateEh
          TabOrder = 3
          Visible = True
        end
      end
    end
    object TabSheet4: TTabSheet
      BorderWidth = 3
      Caption = #1060#1072#1081#1083#1086#1074#1099#1081' '#1086#1073#1084#1077#1085
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 606
        Height = 151
        Align = alClient
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object Label13: TLabel
          Left = 24
          Top = 24
          Width = 95
          Height = 14
          Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1072#1084
        end
        object Label14: TLabel
          Left = 80
          Top = 48
          Width = 39
          Height = 14
          Caption = #1052#1072#1089#1082#1072
        end
        object Label15: TLabel
          Left = 19
          Top = 73
          Width = 100
          Height = 14
          Caption = 'Backup '#1082#1072#1090#1072#1083#1086#1075
        end
        object edtFilesPath: TDBEditEh
          Left = 129
          Top = 21
          Width = 459
          Height = 22
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 80
          TabOrder = 0
          Visible = True
        end
        object edtFilesMask: TDBEditEh
          Left = 129
          Top = 46
          Width = 347
          Height = 22
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 25
          TabOrder = 1
          Visible = True
        end
        object edtFilesBack: TDBEditEh
          Left = 129
          Top = 71
          Width = 458
          Height = 22
          EditButtons = <>
          ImeName = #1056#1091#1089#1089#1082#1072#1103
          MaxLength = 80
          TabOrder = 2
          Visible = True
        end
      end
    end
  end
end
