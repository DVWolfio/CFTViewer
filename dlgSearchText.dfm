object TextSearchDialog: TTextSearchDialog
  Left = 397
  Top = 324
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082'...'
  ClientHeight = 136
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 22
    Height = 13
    Caption = #1063#1090#1086':'
  end
  object cbSearchText: TComboBox
    Left = 96
    Top = 8
    Width = 228
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object gbSearchOptions: TGroupBox
    Left = 8
    Top = 40
    Width = 154
    Height = 89
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 1
    object cbSearchCaseSensitive: TCheckBox
      Left = 8
      Top = 17
      Width = 140
      Height = 17
      Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
      TabOrder = 0
    end
    object cbSearchWholeWords: TCheckBox
      Left = 8
      Top = 39
      Width = 140
      Height = 17
      Caption = #1048#1089#1082#1072#1090#1100' '#1089#1083#1086#1074#1086' '#1094#1077#1083#1080#1082#1086#1084
      TabOrder = 1
    end
    object cbRegularExpression: TCheckBox
      Left = 8
      Top = 60
      Width = 140
      Height = 17
      Caption = #1056#1077#1075#1091#1083#1103#1088#1085#1099#1077' '#1074#1099#1088#1072#1078#1077#1085#1080#1103
      TabOrder = 2
    end
  end
  object rgSearchDirection: TRadioGroup
    Left = 170
    Top = 40
    Width = 154
    Height = 65
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
    ItemIndex = 0
    Items.Strings = (
      #1042#1074#1077#1088#1093
      #1042#1085#1080#1079)
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 170
    Top = 109
    Width = 75
    Height = 23
    Caption = #1053#1072#1081#1090#1080
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 249
    Top = 109
    Width = 75
    Height = 23
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
end
