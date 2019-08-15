object frmEditSetting: TfrmEditSetting
  Left = 646
  Top = 343
  BorderStyle = bsSingle
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1086#1082#1085#1072
  ClientHeight = 264
  ClientWidth = 370
  Color = clBtnFace
  Constraints.MinHeight = 302
  Constraints.MinWidth = 377
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    370
    264)
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 4
    Top = 4
    Width = 362
    Height = 223
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1062#1074#1077#1090'/'#1064#1088#1080#1092#1090
      object lColor: TLabel
        Left = 206
        Top = 4
        Width = 28
        Height = 13
        Caption = #1062#1074#1077#1090':'
      end
      object lBack: TLabel
        Left = 206
        Top = 44
        Width = 26
        Height = 13
        Caption = #1060#1086#1085':'
      end
      object lStyleFont: TLabel
        Left = 206
        Top = 84
        Width = 75
        Height = 13
        Caption = #1057#1090#1080#1083#1100' '#1096#1088#1080#1092#1090#1072':'
      end
      object Label7: TLabel
        Left = 206
        Top = 150
        Width = 34
        Height = 13
        Caption = #1064#1088#1080#1092#1090
      end
      object tvColors: TTreeView
        Left = 0
        Top = 1
        Width = 201
        Height = 192
        HideSelection = False
        Indent = 19
        TabOrder = 0
        OnChange = tvColorsChange
      end
      object cbStyleFont: TComboBox
        Left = 205
        Top = 100
        Width = 145
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbStyleFontChange
        Items.Strings = (
          #1054#1073#1099#1095#1085#1099#1081
          #1046#1080#1088#1085#1099#1081
          #1050#1091#1088#1089#1080#1074
          #1046#1080#1088#1085#1099#1081' '#1050#1091#1088#1089#1080#1074
          #1055#1086#1076#1095#1077#1088#1082#1080#1074#1072#1085#1080#1077)
      end
      object edFont: TEdit
        Left = 205
        Top = 167
        Width = 130
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object btnFont: TButton
        Left = 335
        Top = 166
        Width = 17
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = btnFontClick
      end
      object cbColor: TComboBox
        Left = 205
        Top = 19
        Width = 145
        Height = 22
        Style = csOwnerDrawVariable
        Enabled = False
        ItemHeight = 16
        TabOrder = 4
        OnChange = cbColorChange
        OnDrawItem = cbColorDrawItem
      end
      object cbBackground: TComboBox
        Left = 205
        Top = 59
        Width = 145
        Height = 22
        Style = csOwnerDrawVariable
        Enabled = False
        ItemHeight = 16
        TabOrder = 5
        OnChange = cbColorChange
        OnDrawItem = cbColorDrawItem
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1089#1090#1072#1083#1100#1085#1086#1077
      ImageIndex = 1
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 31
        Height = 13
        Caption = #1071#1079#1099#1082':'
      end
      object cbLanguage: TComboBox
        Left = 4
        Top = 23
        Width = 125
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'Basic'
        OnChange = cbLanguageChange
        Items.Strings = (
          'Basic'
          'PLPlus')
      end
      object GroupBox1: TGroupBox
        Left = 136
        Top = 3
        Width = 113
        Height = 41
        Caption = ' '#1058#1072#1073#1091#1083#1103#1090#1086#1088#1099' '
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 19
          Width = 42
          Height = 13
          Caption = #1056#1072#1079#1084#1077#1088':'
        end
        object edTabSize: TEdit
          Left = 58
          Top = 16
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '8'
          OnChange = edTabSizeChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 48
        Width = 246
        Height = 81
        Caption = ' '#1059#1089#1090#1072#1085#1086#1074#1082#1080' '
        TabOrder = 2
        object cbColorSyn: TCheckBox
          Left = 8
          Top = 16
          Width = 201
          Height = 17
          Caption = #1062#1074#1077#1090#1086#1074#1086#1077' '#1074#1099#1076#1077#1083#1077#1085#1080#1077' '#1089#1080#1085#1090#1072#1082#1089#1080#1089#1072
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = edTabSizeChange
        end
        object cbHorScroll: TCheckBox
          Left = 8
          Top = 36
          Width = 201
          Height = 17
          Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1072#1103' '#1087#1088#1086#1082#1088#1091#1090#1082#1072
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = edTabSizeChange
        end
        object cbVertScroll: TCheckBox
          Left = 8
          Top = 56
          Width = 201
          Height = 17
          Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1072#1103' '#1087#1088#1086#1082#1088#1091#1090#1082#1072
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = edTabSizeChange
        end
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 131
        Width = 247
        Height = 62
        Caption = ' '#1053#1091#1084#1077#1088#1072#1094#1080#1103' '#1089#1090#1088#1086#1082' '
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 40
          Width = 60
          Height = 13
          Caption = #1053#1072#1095#1080#1085#1072#1090#1100' '#1089':'
        end
        object cbShowNum: TCheckBox
          Left = 8
          Top = 16
          Width = 153
          Height = 17
          Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1085#1091#1084#1077#1088#1072#1094#1080#1102
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = edTabSizeChange
        end
        object edStartSel: TEdit
          Left = 79
          Top = 37
          Width = 50
          Height = 21
          TabOrder = 1
          Text = '1'
          OnClick = edTabSizeChange
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 231
    Width = 370
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      370
      33)
    object btnDefault: TButton
      Left = 4
      Top = 4
      Width = 109
      Height = 25
      Hint = #1055#1086#1083#1091#1095#1080#1090' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1080#1079' '#1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072' '#1089#1083#1086#1074#1072#1088#1103' '#1076#1072#1085#1085#1099#1093
      Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      WordWrap = True
      OnClick = btnDefaultClick
    end
    object btnOk: TButton
      Left = 125
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 1
    end
    object btnCancel: TButton
      Left = 205
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
    object btnApply: TButton
      Left = 285
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Enabled = False
      TabOrder = 3
      OnClick = btnApplyClick
    end
  end
  object fsEditMethod: TFormStorage
    Active = False
    IniFileName = 'Software\FTC\IBS\Viewer'
    Options = []
    UseRegistry = True
    OnSavePlacement = fsEditMethodRestorePlacement
    OnRestorePlacement = fsEditMethodRestorePlacement
    StoredProps.Strings = (
      'fdCustom.Font')
    StoredValues = <
      item
        Name = 'ColorSynBasic'
        Value = True
        OnSave = fsEditMethodStoredValues0Save
        OnRestore = fsEditMethodStoredValues0Restore
      end
      item
        Name = 'ColorSynPLPlus'
        Value = True
        OnSave = fsEditMethodStoredValues0Save
        OnRestore = fsEditMethodStoredValues0Restore
      end
      item
        Name = 'HorScrollBasic'
        Value = True
        OnSave = fsEditMethodStoredValues2Save
        OnRestore = fsEditMethodStoredValues2Restore
      end
      item
        Name = 'HorScrollPLPlus'
        Value = True
        OnSave = fsEditMethodStoredValues2Save
        OnRestore = fsEditMethodStoredValues2Restore
      end
      item
        Name = 'VertScrollBasic'
        Value = True
        OnSave = fsEditMethodStoredValues4Save
        OnRestore = fsEditMethodStoredValues4Restore
      end
      item
        Name = 'VertScrollPLPlus'
        Value = True
        OnSave = fsEditMethodStoredValues4Save
        OnRestore = fsEditMethodStoredValues4Restore
      end
      item
        Name = 'ShowNumBasic'
        Value = True
        OnSave = fsEditMethodStoredValues6Save
        OnRestore = fsEditMethodStoredValues6Restore
      end
      item
        Name = 'ShowNumPLPlus'
        Value = True
        OnSave = fsEditMethodStoredValues6Save
        OnRestore = fsEditMethodStoredValues6Restore
      end
      item
        Name = 'StartNumBasic'
        Value = 1
        OnSave = fsEditMethodStoredValues8Save
        OnRestore = fsEditMethodStoredValues8Restore
      end
      item
        Name = 'StartNumPLPlus'
        Value = 1
        OnSave = fsEditMethodStoredValues8Save
        OnRestore = fsEditMethodStoredValues8Restore
      end
      item
        Name = 'TabSizeBasic'
        Value = 1
        OnSave = fsEditMethodStoredValues10Save
        OnRestore = fsEditMethodStoredValues10Restore
      end
      item
        Name = 'TabSizePLPlus'
        Value = 4
        OnSave = fsEditMethodStoredValues10Save
        OnRestore = fsEditMethodStoredValues10Restore
      end
      item
        Name = 'NumStrColor'
        Value = '65535'
      end
      item
        Name = 'NumStrBackground'
        Value = '8421376'
      end
      item
        Name = 'NumStrStyle'
        Value = '0'
      end
      item
        Name = 'WindowColor'
        Value = '8421376'
      end
      item
        Name = 'BasicCommentColor'
        Value = '65535'
      end
      item
        Name = 'BasicCommentBackground'
        Value = '536870911'
      end
      item
        Name = 'BasicCommentStyle'
        Value = '0'
      end
      item
        Name = 'BasicKeywordsColor'
        Value = '65280'
      end
      item
        Name = 'BasicKeywordsBackground'
        Value = '536870911'
      end
      item
        Name = 'BasicKeywordsStyle'
        Value = '0'
      end
      item
        Name = 'BasicNumberColor'
        Value = '16777215'
      end
      item
        Name = 'BasicNumberBackground'
        Value = '536870911'
      end
      item
        Name = 'BasicNumberStyle'
        Value = '0'
      end
      item
        Name = 'BasicOperatorsColor'
        Value = '16776960'
      end
      item
        Name = 'BasicOperatorsBackground'
        Value = '536870911'
      end
      item
        Name = 'BasicOperatorsStyle'
        Value = '0'
      end
      item
        Name = 'BasicStringsColor'
        Value = '16777215'
      end
      item
        Name = 'BasicStringsBackground'
        Value = '536870911'
      end
      item
        Name = 'BasicStringsStyle'
        Value = '0'
      end
      item
        Name = 'BasicTextColor'
        Value = '16777215'
      end
      item
        Name = 'BasicTextBackground'
        Value = '536870911'
      end
      item
        Name = 'BasicTextStyle'
        Value = '0'
      end
      item
        Name = 'PLPlusCommentColor'
        Value = '65535'
      end
      item
        Name = 'PLPlusCommentBackground'
        Value = '536870911'
      end
      item
        Name = 'PLPlusCommentStyle'
        Value = '0'
      end
      item
        Name = 'PLPlusKeywordsColor'
        Value = '65280'
      end
      item
        Name = 'PLPlusKeywordsBackground'
        Value = '536870911'
      end
      item
        Name = 'PLPlusKeywordsStyle'
        Value = '0'
      end
      item
        Name = 'PLPlusNumberColor'
        Value = '16777215'
      end
      item
        Name = 'PLPlusNumberBackground'
        Value = '536870911'
      end
      item
        Name = 'PLPlusNumberStyle'
        Value = '0'
      end
      item
        Name = 'PLPlusOperatorsColor'
        Value = '16776960'
      end
      item
        Name = 'PLPlusOperatorsBackground'
        Value = '536870911'
      end
      item
        Name = 'PLPlusOperatorsStyle'
        Value = '0'
      end
      item
        Name = 'PLPlusStringsColor'
        Value = '16777215'
      end
      item
        Name = 'PLPlusStringsBackground'
        Value = '536870911'
      end
      item
        Name = 'PLPlusStringsStyle'
        Value = '0'
      end
      item
        Name = 'PLPlusTextColor'
        Value = '16777215'
      end
      item
        Name = 'PLPlusTextBackground'
        Value = '536870911'
      end
      item
        Name = 'PLPlusTextStyle'
        Value = '0'
      end
      item
        Name = 'LeftBreakColor'
        Value = '8421376'
      end>
    Left = 320
    Top = 72
  end
  object cdExt: TColorDialog
    Left = 176
    Top = 136
  end
  object fdCustom: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Options = []
    Left = 176
    Top = 172
  end
end
