object frmShowAttrCrit: TfrmShowAttrCrit
  Left = 446
  Top = 219
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1082#1086#1083#1086#1085#1082#1080
  ClientHeight = 522
  ClientWidth = 477
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 7
    Width = 89
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 89
    Height = 17
    Caption = #1041#1072#1079#1086#1074#1099#1081' '#1090#1080#1087':'
  end
  object Label3: TLabel
    Left = 256
    Top = 32
    Width = 67
    Height = 13
    Caption = #1058#1080#1087' '#1082#1086#1083#1086#1085#1082#1080':'
  end
  object Label4: TLabel
    Left = 8
    Top = 57
    Width = 81
    Height = 13
    Caption = #1057#1089#1099#1083#1082#1072':'
  end
  object Label5: TLabel
    Left = 256
    Top = 57
    Width = 63
    Height = 13
    Caption = #1058#1080#1087' '#1089#1089#1099#1083#1082#1080':'
  end
  object Label6: TLabel
    Left = 8
    Top = 82
    Width = 77
    Height = 13
    Caption = #1050#1074#1072#1083#1080#1092#1080#1082#1072#1090#1086#1088':'
  end
  object Label7: TLabel
    Left = 256
    Top = 82
    Width = 48
    Height = 13
    Caption = #1057#1080#1085#1086#1085#1080#1084':'
  end
  object Label8: TLabel
    Left = 8
    Top = 107
    Width = 91
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1076#1072#1085#1085#1099#1093':'
  end
  object edName: TEdit
    Left = 104
    Top = 4
    Width = 369
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object cbBaseClass: TComboBox
    Left = 104
    Top = 29
    Width = 145
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      #1044#1072#1090#1099
      #1051#1086#1075#1080#1095#1077#1089#1082#1080#1077
      #1052#1072#1089#1089#1080#1074#1099
      #1057#1086#1089#1090#1086#1103#1085#1080#1077
      #1057#1089#1099#1083#1082#1080
      #1057#1090#1088#1086#1082#1080
      #1058#1077#1082#1089#1090#1086#1074#1099#1077
      #1063#1080#1089#1083#1072
      'OLE '#1086#1073#1098#1077#1082#1090#1099)
  end
  object cbTypeColumn: TComboBox
    Left = 328
    Top = 29
    Width = 145
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      #1054#1073#1099#1095#1085#1072#1103
      #1044#1083#1103' '#1089#1074#1103#1079#1080
      #1053#1077#1074#1080#1076#1080#1084#1072#1103)
  end
  object edRef: TEdit
    Left = 104
    Top = 54
    Width = 145
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object edTypeRef: TEdit
    Left = 328
    Top = 54
    Width = 145
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object edKvalif: TEdit
    Left = 104
    Top = 79
    Width = 145
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object edAlias: TEdit
    Left = 328
    Top = 79
    Width = 145
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object memDataSource: TMemo
    Left = 104
    Top = 104
    Width = 369
    Height = 65
    ReadOnly = True
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 169
    Width = 473
    Height = 56
    Caption = ' '#1044#1086#1089#1090#1091#1087' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object Label9: TLabel
      Left = 8
      Top = 19
      Width = 225
      Height = 33
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1076#1086#1089#1090#1091#1087#1072' '#1076#1072#1085#1085#1099#1093', '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1077#1089#1103' '#1074' '#1082#1086#1083#1086#1085#1082#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object cbRightAttr: TCheckBox
      Left = 256
      Top = 12
      Width = 137
      Height = 17
      Caption = #1044#1086#1089#1090#1091#1087' '#1087#1086' '#1088#1077#1082#1074#1080#1079#1080#1090#1091
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbRightRow: TCheckBox
      Left = 256
      Top = 32
      Width = 169
      Height = 17
      Caption = #1044#1086#1089#1090#1091#1087' '#1087#1086' '#1101#1082#1079#1077#1084#1087#1083#1103#1088#1072#1084
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 224
    Width = 473
    Height = 121
    Caption = ' '#1042#1085#1077#1096#1085#1080#1081' '#1074#1080#1076' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object Label10: TLabel
      Left = 8
      Top = 19
      Width = 78
      Height = 13
      Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 44
      Width = 87
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072' '#1082#1086#1083#1086#1085#1082#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 69
      Width = 50
      Height = 13
      Caption = #1058#1086#1095#1085#1086#1089#1090#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 8
      Top = 94
      Width = 59
      Height = 13
      Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbAlign: TComboBox
      Left = 104
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
        #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
        #1055#1086' '#1094#1077#1085#1090#1088#1091)
    end
    object edWidth: TEdit
      Left = 104
      Top = 41
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edPrec: TEdit
      Left = 104
      Top = 66
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object cbEditSize: TCheckBox
      Left = 256
      Top = 18
      Width = 137
      Height = 17
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1072
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cbColor: TCheckBox
      Left = 256
      Top = 43
      Width = 137
      Height = 17
      Caption = #1056#1072#1089#1082#1088#1072#1089#1082#1072
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbFilter: TCheckBox
      Left = 256
      Top = 68
      Width = 137
      Height = 17
      Caption = #1058#1088#1077#1073#1091#1077#1090#1089#1103' '#1092#1080#1083#1100#1090#1088
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edHint: TEdit
      Left = 104
      Top = 91
      Width = 361
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 344
    Width = 473
    Height = 145
    Caption = ' '#1053#1072#1074#1080#1075#1072#1094#1080#1103' '
    TabOrder = 10
    object Label14: TLabel
      Left = 8
      Top = 19
      Width = 46
      Height = 13
      Caption = #1055#1077#1088#1077#1093#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 8
      Top = 44
      Width = 22
      Height = 13
      Caption = #1058#1080#1087':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 8
      Top = 69
      Width = 82
      Height = 13
      Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 8
      Top = 94
      Width = 47
      Height = 13
      Caption = #1059#1089#1083#1086#1074#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbSegway: TComboBox
      Left = 104
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        #1053#1077#1090
        #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        #1055#1086' '#1086#1073#1088#1072#1090#1085#1086#1081' '#1089#1089#1099#1083#1082#1077
        #1055#1086' '#1091#1089#1083#1086#1074#1080#1102)
    end
    object edSegwayType: TEdit
      Left = 104
      Top = 41
      Width = 361
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edSegwayCrit: TEdit
      Left = 104
      Top = 66
      Width = 361
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object memCondition: TMemo
      Left = 104
      Top = 91
      Width = 361
      Height = 46
      ReadOnly = True
      TabOrder = 3
    end
  end
  object btnClose: TButton
    Left = 398
    Top = 493
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 11
    OnClick = btnCloseClick
  end
end
