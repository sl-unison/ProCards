object DMain: TDMain
  OldCreateOrder = False
  Height = 252
  Width = 382
  object srSysTables: TDataSource
    Left = 293
    Top = 55
  end
  object srBranches: TDataSource
    DataSet = tbBranches
    Left = 102
    Top = 52
  end
  object srCardProds: TDataSource
    DataSet = tbCardProds
    Left = 103
    Top = 103
  end
  object ADCon: TFDConnection
    Params.Strings = (
      'DriverID=ADS'
      'ServerTypes = Remote'
      'Database=D:\Construc\DelphiXE2\ProCards\DBase\ProCards.add'
      'User_Name=adssys')
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    ResourceOptions.EscapeExpand = False
    AfterConnect = ADConAfterConnect
    BeforeConnect = ADConBeforeConnect
    Left = 27
    Top = 5
  end
  object tbCardProds: TFDQuery
    Connection = ADCon
    SQL.Strings = (
      'Select * from V_CardProducts Order by Code')
    Left = 21
    Top = 102
    object tbCardProdsCode: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
      Origin = 'Code'
      FixedChar = True
    end
    object tbCardProdsName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Origin = 'Name'
      FixedChar = True
      Size = 50
    end
    object tbCardProdsCost: TCurrencyField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'Cost'
      Origin = 'Cost'
    end
    object tbCardProdsIsVirtual: TBooleanField
      DisplayLabel = #1042#1080#1088#1090'.'
      FieldName = 'IsVirtual'
      Origin = 'IsVirtual'
    end
  end
  object tbBranches: TFDQuery
    Connection = ADCon
    SQL.Strings = (
      'Select * from V_Branches Order by Code')
    Left = 24
    Top = 51
    object tbBranchesCode: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
      Origin = 'Code'
    end
    object tbBranchesName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Origin = 'Name'
      FixedChar = True
      Size = 50
    end
    object tbBranchesNameShort: TWideStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NameShort'
      Origin = 'NameShort'
      FixedChar = True
    end
    object tbBranchesActNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1072#1082#1090#1072
      FieldName = 'ActNo'
      Origin = 'ActNo'
    end
    object tbBranchesMandPersPins: TWideStringField
      DisplayLabel = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandPersPins'
      Origin = 'MandPersPins'
      FixedChar = True
      Size = 50
    end
    object tbBranchesMandPersCards: TWideStringField
      DisplayLabel = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1077' '#1083#1080#1094#1086' '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandPersCards'
      Origin = 'MandPersCards'
      FixedChar = True
      Size = 50
    end
    object tbBranchesMandPostPins: TWideStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086' '#1083#1080#1094#1072' '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandPostPins'
      Origin = 'MandPostPins'
      FixedChar = True
      Size = 80
    end
    object tbBranchesMandPostCards: TWideStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1075#1086' '#1083#1080#1094#1072' '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandPostCards'
      Origin = 'MandPostCards'
      FixedChar = True
      Size = 80
    end
    object tbBranchesMandNoPins: TWideStringField
      DisplayLabel = #8470' '#1076#1086#1074'. '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandNoPins'
      Origin = 'MandNoPins'
      FixedChar = True
      Size = 15
    end
    object tbBranchesMandNoCards: TWideStringField
      DisplayLabel = #8470' '#1076#1086#1074'. '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandNoCards'
      Origin = 'MandNoCards'
      FixedChar = True
      Size = 15
    end
    object tbBranchesMandDatePins: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1074'. '#1087#1086' '#1055#1048#1053#1072#1084
      FieldName = 'MandDatePins'
      Origin = 'MandDatePins'
    end
    object tbBranchesMandDateCards: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1074'. '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'MandDateCards'
      Origin = 'MandDateCards'
    end
    object tbBranchesPersPinEmail: TWideStringField
      DisplayLabel = 'Email '#1087#1086#1083'. '#1055#1048#1053'-'#1082#1086#1085#1074#1077#1088#1090#1086#1074
      FieldName = 'PersPinEmail'
      Origin = 'PersPinEmail'
      FixedChar = True
      Size = 50
    end
    object tbBranchesPersCardEmail: TWideStringField
      DisplayLabel = 'Email '#1087#1086#1083'. '#1087#1086' '#1082#1072#1088#1090#1072#1084
      FieldName = 'PersCardEmail'
      Origin = 'PersCardEmail'
      FixedChar = True
      Size = 50
    end
    object tbBranchesFilesPath: TWideStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1072#1084
      FieldName = 'FilesPath'
      Origin = 'FilesPath'
      FixedChar = True
      Size = 80
    end
    object tbBranchesFilesMask: TWideStringField
      DisplayLabel = #1052#1072#1089#1082#1072' '#1092#1072#1081#1083#1086#1074
      FieldName = 'FilesMask'
      Origin = 'FilesMask'
      FixedChar = True
      Size = 25
    end
    object tbBranchesFilesBack: TWideStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1073#1101#1082#1072#1087#1091
      FieldName = 'FilesBack'
      Origin = 'FilesBack'
      FixedChar = True
      Size = 80
    end
  end
  object tbSysTables: TFDQuery
    Connection = ADCon
    SQL.Strings = (
      'Select * from D_SysTables')
    Left = 205
    Top = 54
    object tbSysTablesName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      FixedChar = True
    end
    object tbSysTablesComment: TMemoField
      FieldName = 'Comment'
      Origin = 'Comment'
      BlobType = ftMemo
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 176
  end
  object FDPhysADSDriverLink1: TFDPhysADSDriverLink
    Left = 168
    Top = 176
  end
end
