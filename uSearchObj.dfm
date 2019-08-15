object frmSearchObj: TfrmSearchObj
  Left = 520
  Top = 314
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 200
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 7
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = #1048#1089#1082#1072#1090#1100':'
  end
  object cbSearch: TComboBox
    Left = 64
    Top = 4
    Width = 217
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object btnSearch: TButton
    Left = 288
    Top = 4
    Width = 97
    Height = 21
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 288
    Top = 28
    Width = 97
    Height = 21
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 2
    TabOrder = 2
  end
  object pcSearch: TPageControl
    Left = 0
    Top = 56
    Width = 388
    Height = 144
    ActivePage = TabSheet2
    Align = alBottom
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #1069#1083#1077#1084#1077#1085#1090#1099' '#1087#1086#1080#1089#1082#1072
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 145
        Height = 113
        Caption = ' '#1055#1088#1086#1089#1084#1072#1090#1088#1080#1074#1072#1090#1100' '
        TabOrder = 0
        object cbType: TCheckBox
          Left = 8
          Top = 20
          Width = 97
          Height = 17
          Caption = #1058#1080#1087#1099
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cbAttr: TCheckBox
          Left = 8
          Top = 41
          Width = 97
          Height = 17
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
          TabOrder = 1
        end
        object cbMeth: TCheckBox
          Left = 8
          Top = 62
          Width = 97
          Height = 17
          Caption = #1054#1087#1077#1088#1072#1094#1080#1080
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbCrit: TCheckBox
          Left = 8
          Top = 83
          Width = 97
          Height = 17
          Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
          TabOrder = 3
        end
      end
      object GroupBox2: TGroupBox
        Left = 152
        Top = 0
        Width = 225
        Height = 73
        Caption = ' '#1057#1088#1072#1074#1085#1080#1074#1072#1090#1100' '
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 44
          Width = 61
          Height = 13
          Caption = #1057#1086#1074#1087#1072#1076#1077#1085#1080#1103
        end
        object rbName: TRadioButton
          Left = 8
          Top = 20
          Width = 113
          Height = 17
          Caption = #1089' '#1080#1084#1077#1085#1077#1084
          TabOrder = 0
        end
        object rbShort: TRadioButton
          Left = 96
          Top = 20
          Width = 121
          Height = 17
          Caption = #1089' '#1082#1086#1088#1086#1090#1082#1080#1084' '#1080#1084#1077#1085#1077#1084
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object cbLike: TComboBox
          Left = 88
          Top = 41
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 2
          Text = #1057' '#1083#1102#1073#1086#1081' '#1095#1072#1089#1090#1100#1102
          Items.Strings = (
            #1057' '#1085#1072#1095#1072#1083#1086#1084
            #1057' '#1083#1102#1073#1086#1081' '#1095#1072#1089#1090#1100#1102
            #1057' '#1086#1082#1086#1085#1095#1072#1085#1080#1077#1084
            #1057' '#1080#1084#1077#1085#1077#1084' '#1094#1077#1083#1080#1082#1086#1084)
        end
      end
      object GroupBox3: TGroupBox
        Left = 152
        Top = 72
        Width = 225
        Height = 41
        Caption = ' '#1055#1088#1086#1089#1084#1072#1090#1088#1080#1074#1072#1090#1100' '#1090#1077#1082#1089#1090#1099' '
        TabOrder = 2
        object cbTextMeth: TCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = #1054#1087#1077#1088#1072#1094#1080#1081
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1073#1083#1072#1089#1090#1100' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 380
        Height = 116
        Align = alClient
        TabOrder = 0
        object rbAll: TRadioButton
          Left = 8
          Top = 16
          Width = 129
          Height = 17
          Caption = #1057#1083#1086#1074#1072#1088#1100' '#1076#1072#1085#1085#1099#1093
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbCurSub: TRadioButton
          Left = 8
          Top = 58
          Width = 185
          Height = 17
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1090#1080#1087' '#1080' '#1077#1075#1086' '#1076#1086#1095#1077#1088#1085#1080#1077
          TabOrder = 1
        end
        object rbCur: TRadioButton
          Left = 8
          Top = 37
          Width = 145
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1080#1081' '#1090#1080#1087
          TabOrder = 2
        end
      end
    end
  end
  object fsSearch: TFormStorage
    Active = False
    IniFileName = 'Software\FTC\IBS\Viewer'
    UseRegistry = True
    StoredProps.Strings = (
      'cbAttr.Checked'
      'cbCrit.Checked'
      'cbLike.ItemIndex'
      'cbMeth.Checked'
      'cbTextMeth.Checked'
      'cbType.Checked'
      'rbAll.Checked'
      'rbCur.Checked'
      'rbCurSub.Checked'
      'rbName.Checked'
      'rbShort.Checked')
    StoredValues = <>
    Left = 232
    Top = 32
  end
end
